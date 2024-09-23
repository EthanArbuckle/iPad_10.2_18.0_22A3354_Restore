@implementation TILinguisticAssetDownloadClientMock

- (TILinguisticAssetDownloadClientMock)init
{
  return -[TILinguisticAssetDownloadClientMock initWithResult:error:](self, "initWithResult:error:", -2, 0);
}

- (TILinguisticAssetDownloadClientMock)initWithResult:(int64_t)a3 error:(id)a4
{
  id v7;
  TILinguisticAssetDownloadClientMock *v8;
  TILinguisticAssetDownloadClientMock *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TILinguisticAssetDownloadClientMock;
  v8 = -[TILinguisticAssetDownloadClientMock init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (void)requestLinguisticAssetsForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  id v8;

  v6 = a4;
  v7 = -[TILinguisticAssetDownloadClientMock result](self, "result");
  -[TILinguisticAssetDownloadClientMock error](self, "error");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, int64_t, id))a4 + 2))(v6, v7, v8);

}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (int64_t)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
