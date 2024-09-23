@implementation SKMediaKitFSInfo

- (SKMediaKitFSInfo)initWithFSInfo:(id)a3
{
  id v5;
  SKMediaKitFSInfo *v6;
  SKMediaKitFSInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKMediaKitFSInfo;
  v6 = -[SKMediaKitFSInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fsInfo, a3);

  return v7;
}

- (NSString)volumeName
{
  void *v2;
  void *v3;

  -[SKMediaKitFSInfo fsInfo](self, "fsInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Volume name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fsType
{
  void *v2;
  void *v3;

  -[SKMediaKitFSInfo fsInfo](self, "fsInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Filesystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)fsInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsInfo, 0);
}

@end
