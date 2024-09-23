@implementation THDocumentProperties

- (THPresentationType)chapterBrowserPagePresentationType
{
  return self->mChapterBrowserPagePresentationType;
}

- (void)setChapterBrowserPagePresentationType:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mChapterBrowserPagePresentationType = (THPresentationType *)a3;
}

- (THDocumentProperties)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDocumentProperties;
  return -[THDocumentProperties initWithContext:](&v4, "initWithContext:", a3);
}

- (void)dealloc
{
  objc_super v3;

  self->mFlowPresentationType = 0;
  self->mPaginatedPresentationType = 0;

  self->mChapterBrowserPagePresentationType = 0;
  self->mBookLocale = 0;

  self->mIntroMediaUrl = 0;
  self->mSearchIndexEntry = 0;

  self->mSearchRefTextEntry = 0;
  self->mEquationEnvironmentEntry = 0;

  self->mBookVersion = 0;
  self->mOriginalAssetSizes = 0;

  self->mThinnedAssetSizes = 0;
  self->mModificationDate = 0;

  self->_paginatedPresentationType = 0;
  self->_flowPresentationType = 0;
  v3.receiver = self;
  v3.super_class = (Class)THDocumentProperties;
  -[THDocumentProperties dealloc](&v3, "dealloc");
}

- (NSLocale)bookLocale
{
  return self->mBookLocale;
}

- (void)setBookLocale:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mBookLocale = (NSLocale *)a3;
}

- (double)applePubVersion
{
  return self->mApplePubVersion;
}

- (void)setApplePubVersion:(double)a3
{
  -[THDocumentProperties willModify](self, "willModify");
  self->mApplePubVersion = a3;
}

- (THBookVersion)bookVersion
{
  return self->mBookVersion;
}

- (void)setBookVersion:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mBookVersion = (THBookVersion *)a3;
}

- (NSURL)introMediaUrl
{
  return self->mIntroMediaUrl;
}

- (void)setIntroMediaUrl:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mIntroMediaUrl = (NSURL *)a3;
}

- (NSString)searchIndexEntry
{
  return self->mSearchIndexEntry;
}

- (void)setSearchIndexEntry:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mSearchIndexEntry = (NSString *)a3;
}

- (NSString)searchRefTextEntry
{
  return self->mSearchRefTextEntry;
}

- (void)setSearchRefTextEntry:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mSearchRefTextEntry = (NSString *)a3;
}

- (NSString)equationEnvironmentEntry
{
  return self->mEquationEnvironmentEntry;
}

- (void)setEquationEnvironmentEntry:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mEquationEnvironmentEntry = (NSString *)a3;
}

- (BOOL)introMediaIsVideo
{
  return self->mIntroMediaIsVideo;
}

- (void)setIntroMediaIsVideo:(BOOL)a3
{
  -[THDocumentProperties willModify](self, "willModify");
  self->mIntroMediaIsVideo = a3;
}

- (BOOL)wasThinned
{
  return self->mWasThinned;
}

- (void)setWasThinned:(BOOL)a3
{
  -[THDocumentProperties willModify](self, "willModify");
  self->mWasThinned = a3;
}

- (BOOL)isPreview
{
  return self->mIsPreview;
}

- (void)setIsPreview:(BOOL)a3
{
  -[THDocumentProperties willModify](self, "willModify");
  self->mIsPreview = a3;
}

- (NSDictionary)originalAssetSizes
{
  return self->mOriginalAssetSizes;
}

- (void)setOriginalAssetSizes:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mOriginalAssetSizes = (NSDictionary *)a3;
}

- (NSDictionary)thinnedAssetSizes
{
  return self->mThinnedAssetSizes;
}

- (void)setThinnedAssetSizes:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mThinnedAssetSizes = (NSDictionary *)a3;
}

- (NSDate)modificationDate
{
  return self->mModificationDate;
}

- (void)setModificationDate:(id)a3
{
  id v5;

  -[THDocumentProperties willModify](self, "willModify");
  v5 = a3;

  self->mModificationDate = (NSDate *)a3;
}

- (THPresentationType)defaultPresentationType
{
  if (-[THDocumentProperties paginatedPresentationType](self, "paginatedPresentationType"))
    return -[THDocumentProperties paginatedPresentationType](self, "paginatedPresentationType");
  else
    return -[THDocumentProperties flowPresentationType](self, "flowPresentationType");
}

- (THPresentationType)flowPresentationType
{
  return self->_flowPresentationType;
}

- (void)setFlowPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (THPresentationType)paginatedPresentationType
{
  return self->_paginatedPresentationType;
}

- (void)setPaginatedPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
