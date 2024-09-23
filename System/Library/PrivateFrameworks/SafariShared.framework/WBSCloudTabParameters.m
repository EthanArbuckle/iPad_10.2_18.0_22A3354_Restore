@implementation WBSCloudTabParameters

- (WBSCloudTabParameters)initWithURL:(id)a3
{
  id v5;
  WBSCloudTabParameters *v6;
  WBSCloudTabParameters *v7;
  WBSCloudTabParameters *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudTabParameters;
  v6 = -[WBSCloudTabParameters init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (NSDictionary)readerScrollPosition
{
  return self->_readerScrollPosition;
}

- (void)setReaderScrollPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (void)setShowingReader:(BOOL)a3
{
  self->_showingReader = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_readerScrollPosition, 0);
}

@end
