@implementation MTPodcastDatabaseDebugProvider

- (id)debugData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedDocumentsDirectory](MTConstants, "sharedDocumentsDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDatabaseDebugProvider debugDataFileName](self, "debugDataFileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v5));
  return v6;
}

- (id)debugDataFileName
{
  return kLibraryDatabaseFilename;
}

@end
