@implementation BKLibraryDataSourceIdentifierAndStateObserver

- (BKLibraryDataSourceIdentifierAndStateObserver)initWithAssetID:(id)a3 notify:(id)a4
{
  id v7;
  id v8;
  BKLibraryDataSourceIdentifierAndStateObserver *v9;
  BKLibraryDataSourceIdentifierAndStateObserver *v10;
  id v11;
  id notifyBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourceIdentifierAndStateObserver;
  v9 = -[BKLibraryDataSourceIdentifierAndStateObserver init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetID, a3);
    v11 = objc_retainBlock(v8);
    notifyBlock = v10->_notifyBlock;
    v10->_notifyBlock = v11;

  }
  return v10;
}

- (void)notify
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceIdentifierAndStateObserver notifyBlock](self, "notifyBlock"));
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, BKLibraryDataSourceIdentifierAndStateObserver *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (NSString)assetID
{
  return self->_assetID;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
