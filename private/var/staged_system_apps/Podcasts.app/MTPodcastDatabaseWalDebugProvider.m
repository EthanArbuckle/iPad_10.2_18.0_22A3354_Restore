@implementation MTPodcastDatabaseWalDebugProvider

- (id)debugDataFileName
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastDatabaseWalDebugProvider;
  v2 = -[MTPodcastDatabaseDebugProvider debugDataFileName](&v6, "debugDataFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal")));

  return v4;
}

@end
