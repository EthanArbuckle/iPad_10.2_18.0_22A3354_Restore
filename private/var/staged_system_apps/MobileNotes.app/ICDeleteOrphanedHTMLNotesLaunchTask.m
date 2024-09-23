@implementation ICDeleteOrphanedHTMLNotesLaunchTask

- (id)taskIdentifier
{
  return CFSTR("DidDeleteOrphanedHTMLNotesLaunchTaskV2");
}

- (void)runOneTimeLaunchTask
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = objc_msgSend(objc_alloc((Class)NoteContext), "initWithPrivateQueue");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100055F84;
  v5[3] = &unk_10054FE80;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v2 = v7;
  v3 = v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

@end
