@implementation THModelGlossary

- (NSURL)applePubURL
{
  return self->mApplePubURL;
}

- (void)setApplePubURL:(id)a3
{
  id v5;

  -[THModelGlossary willModify](self, "willModify");
  v5 = a3;

  self->mApplePubURL = (NSURL *)a3;
}

- (THModelGlossary)initWithContext:(id)a3 documentRoot:(id)a4
{
  THModelGlossary *v5;
  THModelGlossary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THModelGlossary;
  v5 = -[THModelGlossary initWithContext:](&v8, "initWithContext:", a3);
  v6 = v5;
  if (v5)
  {
    v5->mDocumentRoot = (THDocumentRoot *)a4;
    v5->mEntries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mEntriesByApplePubPath = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mEntriesByNormalizedTerm = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mLinksByContentNodeId = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->mLoadingQueue, "cancelAllOperations");
  -[NSOperationQueue waitUntilAllOperationsAreFinished](self->mLoadingQueue, "waitUntilAllOperationsAreFinished");

  self->mEntries = 0;
  self->mEntriesByApplePubPath = 0;

  self->mEntriesByNormalizedTerm = 0;
  self->mApplePubURL = 0;

  self->mLoadingQueue = 0;
  self->mLinksByContentNodeId = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossary;
  -[THModelGlossary dealloc](&v3, "dealloc");
}

- (NSOperationQueue)loadingQueue
{
  NSOperationQueue *result;
  NSOperationQueue *v4;

  result = self->mLoadingQueue;
  if (!result)
  {
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    self->mLoadingQueue = v4;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4, "setMaxConcurrentOperationCount:", 1);
    return self->mLoadingQueue;
  }
  return result;
}

- (int64_t)entryCount
{
  return (int64_t)-[NSMutableArray count](self->mEntries, "count");
}

- (id)entryAtIndex:(int64_t)a3
{
  if (a3 < 0 || (unint64_t)-[NSMutableArray count](self->mEntries, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", a3);
}

- (id)entryForPath:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mEntriesByApplePubPath, "objectForKey:", a3);
}

- (id)addEntryForPath:(id)a3 andTerm:(id)a4
{
  THModelGlossaryEntry *v6;

  v6 = -[THModelGlossaryEntry initWithContext:parent:applePubRelativePath:andTerm:]([THModelGlossaryEntry alloc], "initWithContext:parent:applePubRelativePath:andTerm:", -[THModelGlossary context](self, "context"), self, a3, a4);
  if (!objc_msgSend(-[THModelGlossaryEntry normalizedPrefixSearchStrings](v6, "normalizedPrefixSearchStrings"), "count"))return 0;
  -[THModelGlossary willModify](self, "willModify");
  -[NSMutableArray addObject:](self->mEntries, "addObject:", v6);
  -[NSMutableDictionary setObject:forKey:](self->mEntriesByApplePubPath, "setObject:forKey:", v6, a3);
  -[NSMutableDictionary setObject:forKey:](self->mEntriesByNormalizedTerm, "setObject:forKey:", v6, -[THModelGlossaryEntry normalizedTerm](v6, "normalizedTerm"));
  return v6;
}

- (id)entryForTerm:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mEntriesByNormalizedTerm, "objectForKey:", objc_msgSend(a3, "normalizedStringForSearch"));
}

- (id)pathsForEntriesInContentNode:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mLinksByContentNodeId, "objectForKey:", objc_msgSend(a3, "nodeGUID"));
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setGlossaryTermPaths:(id)a3 forContentNode:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mLinksByContentNodeId, "setObject:forKey:", a3, objc_msgSend(a4, "nodeGUID"));
}

- (void)setApplePubURLWithState:(id)a3
{
  NSURL *v4;
  NSURL *mApplePubURL;
  NSURL *v6;

  v4 = (NSURL *)objc_msgSend(a3, "applePubZipURL");
  mApplePubURL = self->mApplePubURL;
  if (mApplePubURL != v4)
  {
    v6 = v4;

    self->mApplePubURL = v6;
  }
}

@end
