@implementation DMDAssetInstallOperation

- (void)main
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000246E8;
  v2[3] = &unk_1000BA528;
  v2[4] = self;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v2);
}

- (void)installOperationDidFinish:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100024B70;
  v8[3] = &unk_1000BA550;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error"));
  v10 = v5;
  v6 = v5;
  v7 = v9;
  -[DMDPayloadActionOperation performBackgroundContextBlock:](self, "performBackgroundContextBlock:", v8);

}

- (DMDRemoteAssetResolver)assetResolver
{
  return (DMDRemoteAssetResolver *)objc_loadWeakRetained((id *)&self->_assetResolver);
}

- (void)setAssetResolver:(id)a3
{
  objc_storeWeak((id *)&self->_assetResolver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetResolver);
}

@end
