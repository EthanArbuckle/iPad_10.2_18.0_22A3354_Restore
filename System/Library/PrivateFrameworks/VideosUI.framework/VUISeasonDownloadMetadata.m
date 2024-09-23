@implementation VUISeasonDownloadMetadata

- (VUISeasonDownloadMetadata)initWithId:(id)a3 index:(int64_t)a4 title:(id)a5 showCanonicalId:(id)a6 showTitle:(id)a7 episodeStartIndex:(int64_t)a8 episodeCount:(int64_t)a9 supportsDownload:(BOOL)a10 appContext:(id)a11 contextDataRef:(id)a12
{
  id v17;
  id v18;
  id v19;
  VUISeasonDownloadMetadata *v20;
  VUISeasonDownloadMetadata *v21;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v27 = a7;
  v26 = a11;
  v25 = a12;
  v28.receiver = self;
  v28.super_class = (Class)VUISeasonDownloadMetadata;
  v20 = -[VUISeasonDownloadMetadata init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_title, a5);
    v21->_index = a4;
    objc_storeStrong((id *)&v21->_showCanonicalId, a6);
    objc_storeStrong((id *)&v21->_showTitle, a7);
    v21->_episodeStartIndex = a8;
    v21->_episodeCount = a9;
    v21->_supportsDownload = a10;
    objc_storeStrong((id *)&v21->_appContext, a11);
    objc_storeStrong((id *)&v21->_contextDataRef, a12);
  }

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_showTitle, a3);
}

- (NSString)showCanonicalId
{
  return self->_showCanonicalId;
}

- (void)setShowCanonicalId:(id)a3
{
  objc_storeStrong((id *)&self->_showCanonicalId, a3);
}

- (int64_t)episodeStartIndex
{
  return self->_episodeStartIndex;
}

- (void)setEpisodeStartIndex:(int64_t)a3
{
  self->_episodeStartIndex = a3;
}

- (int64_t)episodeCount
{
  return self->_episodeCount;
}

- (void)setEpisodeCount:(int64_t)a3
{
  self->_episodeCount = a3;
}

- (BOOL)supportsDownload
{
  return self->_supportsDownload;
}

- (void)setSupportsDownload:(BOOL)a3
{
  self->_supportsDownload = a3;
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_appContext, a3);
}

- (NSDictionary)contextDataRef
{
  return self->_contextDataRef;
}

- (void)setContextDataRef:(id)a3
{
  objc_storeStrong((id *)&self->_contextDataRef, a3);
}

- (int64_t)nextToken
{
  return self->_nextToken;
}

- (void)setNextToken:(int64_t)a3
{
  self->_nextToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDataRef, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_showCanonicalId, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
