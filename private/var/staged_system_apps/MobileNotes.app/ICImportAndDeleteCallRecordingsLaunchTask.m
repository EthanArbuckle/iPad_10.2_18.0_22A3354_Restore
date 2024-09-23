@implementation ICImportAndDeleteCallRecordingsLaunchTask

- (void)runLaunchTask
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010D294;
  v6[3] = &unk_10054FE80;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlock:", v6);

}

- (NSURL)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_directory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
