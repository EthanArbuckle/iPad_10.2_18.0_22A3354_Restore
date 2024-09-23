@implementation PFLJetsamInfoFetcher

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[_PFLSharedJetsamInfo sharedJetsamInfo](_PFLSharedJetsamInfo, "sharedJetsamInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregister:", self);

  v4.receiver = self;
  v4.super_class = (Class)PFLJetsamInfoFetcher;
  -[PFLJetsamInfoFetcher dealloc](&v4, sel_dealloc);
}

- (BOOL)getInfo:(jetsam_info *)a3
{
  void *v5;

  +[_PFLSharedJetsamInfo sharedJetsamInfo](_PFLSharedJetsamInfo, "sharedJetsamInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "getInfoFor:into:", self, a3);

  return (char)a3;
}

- (BOOL)resetInterval
{
  void *v3;

  +[_PFLSharedJetsamInfo sharedJetsamInfo](_PFLSharedJetsamInfo, "sharedJetsamInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "resetIntervalFor:", self);

  return (char)self;
}

@end
