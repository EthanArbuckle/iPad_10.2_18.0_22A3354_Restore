@implementation ICDeleteMigratedHTMLAccountsLaunchTask

- (void)runLaunchTask
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  +[ICMigrationUtilities deleteMigratedHTMLAccountsInContext:](ICMigrationUtilities, "deleteMigratedHTMLAccountsInContext:", v2);

}

@end
