@implementation ICReindexEverythingIfNecessaryTask

- (void)runLaunchTask
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[ICSearchIndexer sharedIndexer](ICSearchIndexer, "sharedIndexer"));
  objc_msgSend(v2, "reindexIfNecessary");

}

@end
