@implementation ICApplicationTestingHelper

+ (id)sharedHelper
{
  if (qword_1005DDF48 != -1)
    dispatch_once(&qword_1005DDF48, &stru_1005541F8);
  return (id)qword_1005DDF40;
}

- (void)didFinishPostLaunchTasks
{
  id v3;

  self->_launchPostTasksCompleted = 1;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NotesLaunchPostTasksCompleted"), self);

}

- (void)waitForPostLaunchTasksThenPerformBlock:(id)a3
{
  id v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (-[ICApplicationTestingHelper launchPostTasksCompleted](self, "launchPostTasksCompleted"))
  {
    v5 = dispatch_time(0, 3000000000);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000C92A0;
    v9[3] = &unk_100554220;
    v9[4] = self;
    v10 = v4;
    v8 = objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("NotesLaunchPostTasksCompleted"), 0, v7, v9);

  }
}

- (ICAccount)testAccount
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v3));

  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((testAccount) != nil)", "-[ICApplicationTestingHelper testAccount]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "testAccount");
  return (ICAccount *)v4;
}

- (id)_testAccountProxy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICApplicationTestingHelper testAccount](self, "testAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountProxy"));
  if (!v3)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((allNotesContainer) != nil)", "-[ICApplicationTestingHelper _testAccountProxy]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "allNotesContainer");

  return v2;
}

- (ICNoteContainer)testNotesListContainer
{
  return (ICNoteContainer *)-[ICApplicationTestingHelper _testAccountProxy](self, "_testAccountProxy");
}

- (ICNoteContainer)testEnglishNotesListContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICApplicationTestingHelper testAccount](self, "testAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultFolder"));

  return (ICNoteContainer *)v3;
}

- (ICNoteContainer)testNotesGridContainer
{
  return -[ICApplicationTestingHelper testEnglishNotesListContainer](self, "testEnglishNotesListContainer");
}

- (NSString)testNoteIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("PptTestNote")));

  return (NSString *)v3;
}

- (BOOL)launchPostTasksCompleted
{
  return self->_launchPostTasksCompleted;
}

@end
