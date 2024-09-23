@implementation ICPluginUtilities

+ (void)setupNoteContext
{
  objc_msgSend(a1, "setupNoteContextWithOptions:", 66116);
}

+ (void)setupNoteContextWithOptions:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  +[ICNoteContext startSharedContextWithOptions:](ICNoteContext, "startSharedContextWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F2C0;
  v6[3] = &unk_100020AC0;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v6);

}

@end
