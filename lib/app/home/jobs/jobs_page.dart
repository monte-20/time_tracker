import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_first/app/home/job_entries/job_entries_page.dart';
import 'package:flutter_app_first/app/home/jobs/edit_job_page.dart';
import 'package:flutter_app_first/app/home/jobs/empty_content.dart';
import 'package:flutter_app_first/app/home/jobs/job_list_tile.dart';
import 'package:flutter_app_first/app/home/jobs/list_items_builder.dart';
import 'package:flutter_app_first/common_widgets/show_alert_dialog.dart';
import 'package:flutter_app_first/common_widgets/show_exception_alert_dialog.dart';
import 'package:flutter_app_first/services/auth.dart';
import 'package:flutter_app_first/services/database.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';

class JobsPage extends StatelessWidget {

  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(context,
          title: 'Operation Failed', exception: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Jobs',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add,color: Colors.white,),
              onPressed: () => EditJobPage.show(
                    context,
                    database: Provider.of<Database>(context, listen: false),
                  )),

        ],
      ),
      body: _buildContent(context),
      backgroundColor: Colors.blue[100],

    );
  }

  Widget _buildContent(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Job>(
          snapshot: snapshot,
          itemBuilder: (context, job) => Dismissible(
            key: Key('job-${job.id}'),
            background: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              color: Colors.red,
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => _delete(context, job),
            child: JobListTile(
              job: job,
              onTap: () => JobEntriesPage.show(context, job),
            ),
          ),
        );
      },
    );
  }
}
