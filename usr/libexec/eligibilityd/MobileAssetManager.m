@implementation MobileAssetManager

- (CountryAsset)lotXAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152F0;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)greymatterAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152DC;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)xcodeLLMAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152C8;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (BillingRegionAndLocationAsset)podcastsTranscriptsAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152B4;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BillingRegionAndLocationAsset *)v4;
}

- (CountryAsset)searchMarketplacesAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000152A0;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)swiftAssistAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001528C;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)hydrogenAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015278;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)heliumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015264;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)lithiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015250;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)berylliumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001523C;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAndGracePeriodAsset)boronAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015228;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)carbonAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015214;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)nitrogenAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015200;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)oxygenAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000151EC;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)fluorineAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000151D8;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)neonAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000151C4;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)sodiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000151B0;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)magnesiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001519C;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)aluminumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015188;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)siliconAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015174;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (PolicyAndGracePeriodAsset)phosphorusAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015160;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (PolicyAndGracePeriodAsset)sulfurAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001514C;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (CountryAsset)chlorineAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015138;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)argonAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015124;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)potassiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015110;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)scandiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150FC;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)titaniumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150E8;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAndGracePeriodAsset)vanadiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150D4;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAndGracePeriodAsset *)v4;
}

- (CountryAsset)chromiumAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150C0;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)manganeseAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000150AC;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)ironAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015098;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (CountryAsset)cobaltAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015084;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CountryAsset *)v4;
}

- (EligibilityAsset)copperAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015070;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EligibilityAsset *)v4;
}

- (PolicyAndGracePeriodAsset)kryptonAsset
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001505C;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PolicyAndGracePeriodAsset *)v4;
}

- (NSNumber)assetVersion
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100015030;
  v11 = sub_100015040;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015048;
  v6[3] = &unk_100030F98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)_initDomainsWithConfigPlist:(id)a3
{
  id v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  void *v7;
  uint64_t v8;
  id v9;
  _UNKNOWN **v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _UNKNOWN **v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  char *v27;
  _UNKNOWN **v28;
  MobileAssetManager *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  NSObject *queue;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  _QWORD block[5];
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  char *v141;
  uint8_t buf[4];
  const char *v143;
  __int16 v144;
  const char *v145;

  v4 = a3;
  v5 = &off_100037008;
  v6 = &off_100037008;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100037008, "objectForKeyedSubscript:", CFSTR("Version")));
  v8 = objc_opt_class(NSNumber);
  v9 = v7;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = (_UNKNOWN **)v9;
  else
    v10 = 0;

  if (!v10)
  {
    v11 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v143 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: Fallback Mobile Asset is malformed: Missing version key", buf, 0xCu);
    }

    v10 = &off_100033D10;
  }
  -[MobileAssetManager setFallbackVersion:](self, "setFallbackVersion:", v10);
  if (v4
    && ((v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"))),
         v14 = objc_opt_class(NSNumber),
         v15 = v13,
         (objc_opt_isKindOfClass(v15, v14) & 1) == 0)
      ? (v16 = 0)
      : (v16 = v15),
        v15,
        v15,
        v16))
  {
    v61 = v16;
    if (objc_msgSend(v10, "compare:", v16) == (id)-1)
    {
      v17 = (_UNKNOWN **)v4;

      goto LABEL_17;
    }
  }
  else
  {
    v61 = 0;
  }
  v17 = &off_100037008;
LABEL_17:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GlobalConfiguration sharedInstance](GlobalConfiguration, "sharedInstance"));
  v19 = objc_msgSend(v18, "hasInternalContent");

  v63 = v10;
  v64 = v4;
  if (v19)
  {
    v141 = 0;
    if (asprintf(&v141, "%s%s", "/", "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist") == -1)
    {
      v20 = sub_10000C5FC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v143 = "copy_eligibility_domain_mobile_asset_override_path";
        v144 = 2080;
        v145 = "/private/var/db/eligibilityd/mobileAssetParametersOverride.plist";
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
      }
    }
    v21 = v141;
    if (v141)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v141));
      free(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v22, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v23, 0));
      if (v24)
      {
        v25 = sub_10000C5FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
          *(_DWORD *)buf = 136315394;
          v143 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
          v144 = 2112;
          v145 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s: Found Mobile Asset override plist at path %@; Using that instead instead of real values",
            buf,
            0x16u);

        }
        v28 = v24;

        v17 = v28;
      }

    }
    else
    {
      v30 = sub_10000C5FC();
      v22 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v143 = "-[MobileAssetManager _initDomainsWithConfigPlist:]";
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to copy mobile asset override path; Ignoring it",
          buf,
          0xCu);
      }
    }
    v29 = self;

  }
  else
  {
    v29 = self;
  }
  v103 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Lot X"), v17);
  v104 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Greymatter"), v17);
  v101 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Xcode LLM"), v17);
  v102 = -[BillingRegionAndLocationAsset initForMobileAssetRootKey:withDictionary:]([BillingRegionAndLocationAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Podcasts Transcripts"), v17);
  v100 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("SearchMarketplaces"), v17);
  v99 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Swift Assist"), v17);
  v98 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Hydrogen"), v17);
  v97 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Helium"), v17);
  v95 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Lithium"), v17);
  v93 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Beryllium"), v17);
  v91 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Boron"), v17);
  v89 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Carbon"), v17);
  v87 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Nitrogen"), v17);
  v85 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Oxygen"), v17);
  v83 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Fluorine"), v17);
  v81 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Neon"), v17);
  v79 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Sodium"), v17);
  v77 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Magnesium"), v17);
  v75 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Aluminum"), v17);
  v73 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Silicon"), v17);
  v71 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([PolicyAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Phosphorus"), v17);
  v69 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([PolicyAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Sulfur"), v17);
  v67 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Chlorine"), v17);
  v65 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Argon"), v17);
  v31 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Potassium"), v17);
  v44 = v17;
  v32 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Scandium"), v17);
  v48 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Titanium"), v17);
  v33 = -[CountryAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([CountryAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Vanadium"), v17);
  v51 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Chromium"), v17);
  v53 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Manganese"), v17);
  v55 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Iron"), v17);
  v34 = -[CountryAsset initForMobileAssetRootKey:withDictionary:]([CountryAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Cobalt"), v17);
  v58 = -[EligibilityAsset initForMobileAssetRootKey:withDictionary:]([EligibilityAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Copper"), v17);
  v35 = -[PolicyAndGracePeriodAsset initForMobileAssetRootKey:withDictionary:]([PolicyAndGracePeriodAsset alloc], "initForMobileAssetRootKey:withDictionary:", CFSTR("Krypton"), v17);
  queue = objc_claimAutoreleasedReturnValue(-[MobileAssetManager internalQueue](v29, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100014E78;
  block[3] = &unk_100030C78;
  block[1] = 3221225472;
  block[4] = v29;
  v106 = v103;
  v107 = v104;
  v108 = v101;
  v109 = v102;
  v110 = v100;
  v111 = v99;
  v112 = v98;
  v113 = v97;
  v114 = v95;
  v115 = v93;
  v116 = v91;
  v117 = v89;
  v118 = v87;
  v119 = v85;
  v120 = v83;
  v121 = v81;
  v122 = v79;
  v123 = v77;
  v124 = v75;
  v125 = v73;
  v126 = v71;
  v127 = v69;
  v128 = v67;
  v129 = v65;
  v130 = v31;
  v131 = v32;
  v132 = v48;
  v133 = v33;
  v134 = v51;
  v135 = v53;
  v136 = v55;
  v137 = v34;
  v138 = v58;
  v139 = v35;
  v140 = v61;
  v62 = v61;
  v60 = v35;
  v59 = v58;
  v57 = v34;
  v56 = v55;
  v54 = v53;
  v52 = v51;
  v50 = v33;
  v49 = v48;
  v47 = v32;
  v46 = v31;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;
  v90 = v89;
  v92 = v91;
  v94 = v93;
  v96 = v95;
  v36 = v97;
  v37 = v98;
  v38 = v99;
  v39 = v100;
  v40 = v102;
  v41 = v101;
  v42 = v104;
  v43 = v103;
  dispatch_sync(queue, block);

}

- (MobileAssetManager)init
{
  MobileAssetManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *mobileAssetQueue;
  NSObject *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *internalQueue;
  NSObject *v12;
  _QWORD v14[4];
  MobileAssetManager *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MobileAssetManager;
  v2 = -[MobileAssetManager init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.mobileAsset", v4);

    mobileAssetQueue = v2->_mobileAssetQueue;
    v2->_mobileAssetQueue = (OS_dispatch_queue *)v5;
    v7 = v5;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.eligibility.MobileAssetManager.internal", v9);

    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v10;
    v12 = v10;

    -[MobileAssetManager _initDomainsWithConfigPlist:](v2, "_initDomainsWithConfigPlist:", 0);
    -[MobileAssetManager registerForMobileAssetUpdateNotification](v2, "registerForMobileAssetUpdateNotification");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100014B94;
    v14[3] = &unk_100030E80;
    v15 = v2;
    sub_1000159C8(v7, v14);

  }
  return v2;
}

- (void)registerForMobileAssetUpdateNotification
{
  id v3;
  const char *v4;
  NSObject *v5;
  id v6;
  _QWORD handler[4];
  id v8;
  MobileAssetManager *v9;
  int out_token;

  out_token = -1;
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[MAAutoAssetNotifications notifyRegistrationName:forAssetType:](MAAutoAssetNotifications, "notifyRegistrationName:forAssetType:", CFSTR("ASSET_VERSION_DOWNLOADED"), CFSTR("com.apple.MobileAsset.OSEligibility"))));
  v4 = (const char *)objc_msgSend(v3, "UTF8String");
  v5 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000149AC;
  handler[3] = &unk_100030D28;
  v8 = v3;
  v9 = self;
  v6 = v3;
  notify_register_dispatch(v4, &out_token, v5, handler);

}

- (void)_onMobileAssetQueue_markInterestInMobileAssetWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(objc_alloc((Class)MAAutoAssetSelector), "initForAssetType:withAssetSpecifier:", CFSTR("com.apple.MobileAsset.OSEligibility"), CFSTR("Parameters"));
  v7 = objc_alloc((Class)MAAutoAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  v15 = 0;
  v9 = objc_msgSend(v7, "initForClientName:selectingAsset:completingFromQueue:error:", CFSTR("eligibilityd:interestInContent"), v6, v8, &v15);
  v10 = v15;

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100014830;
    v13[3] = &unk_100030D50;
    v14 = v4;
    objc_msgSend(v9, "interestInContent:completion:", CFSTR("EligibilityConfig"), v13);

  }
  else
  {
    v11 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]";
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Unable to create auto-asset instance: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }

}

- (void)asyncRefetchMobileAsset
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001475C;
  v4[3] = &unk_100030E80;
  v4[4] = self;
  sub_1000159C8(v3, v4);

}

- (void)_onMobileAssetQueue_fetchMobileAssetContentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(objc_alloc((Class)MAAutoAssetSelector), "initForAssetType:withAssetSpecifier:", CFSTR("com.apple.MobileAsset.OSEligibility"), CFSTR("Parameters"));
  v7 = objc_alloc((Class)MAAutoAsset);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager mobileAssetQueue](self, "mobileAssetQueue"));
  v16 = 0;
  v9 = objc_msgSend(v7, "initForClientName:selectingAsset:completingFromQueue:error:", CFSTR("eligibilityd:lockContent"), v6, v8, &v16);
  v10 = v16;

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100014134;
    v13[3] = &unk_100030D98;
    v15 = v4;
    v13[4] = self;
    v14 = v9;
    objc_msgSend(v14, "lockContent:withTimeout:completion:", CFSTR("lockEligibilityConfigOptions"), -1, v13);

  }
  else
  {
    v11 = sub_10000C5FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]";
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Unable to create auto-asset instance: %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v4 + 2))(v4, v10);
  }

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager fallbackVersion](self, "fallbackVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MobileAssetManager assetVersion](self, "assetVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MobileAssetManager fallbackVersion: %@ assetVersion: %@>"), v3, v4));

  return v5;
}

- (void)setLotXAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setGreymatterAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setXcodeLLMAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPodcastsTranscriptsAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSearchMarketplacesAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSwiftAssistAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHydrogenAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHeliumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLithiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setBerylliumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setBoronAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setCarbonAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setNitrogenAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setOxygenAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setFluorineAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setNeonAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setSodiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setMagnesiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setAluminumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setSiliconAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setPhosphorusAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setSulfurAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setChlorineAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setArgonAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setPotassiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setScandiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setTitaniumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setVanadiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setChromiumAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setManganeseAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setIronAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setCobaltAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setCopperAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setKryptonAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)mobileAssetQueue
{
  return self->_mobileAssetQueue;
}

- (NSNumber)fallbackVersion
{
  return self->_fallbackVersion;
}

- (void)setFallbackVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackVersion, 0);
  objc_storeStrong((id *)&self->_mobileAssetQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_kryptonAsset, 0);
  objc_storeStrong((id *)&self->_copperAsset, 0);
  objc_storeStrong((id *)&self->_cobaltAsset, 0);
  objc_storeStrong((id *)&self->_ironAsset, 0);
  objc_storeStrong((id *)&self->_manganeseAsset, 0);
  objc_storeStrong((id *)&self->_chromiumAsset, 0);
  objc_storeStrong((id *)&self->_vanadiumAsset, 0);
  objc_storeStrong((id *)&self->_titaniumAsset, 0);
  objc_storeStrong((id *)&self->_scandiumAsset, 0);
  objc_storeStrong((id *)&self->_potassiumAsset, 0);
  objc_storeStrong((id *)&self->_argonAsset, 0);
  objc_storeStrong((id *)&self->_chlorineAsset, 0);
  objc_storeStrong((id *)&self->_sulfurAsset, 0);
  objc_storeStrong((id *)&self->_phosphorusAsset, 0);
  objc_storeStrong((id *)&self->_siliconAsset, 0);
  objc_storeStrong((id *)&self->_aluminumAsset, 0);
  objc_storeStrong((id *)&self->_magnesiumAsset, 0);
  objc_storeStrong((id *)&self->_sodiumAsset, 0);
  objc_storeStrong((id *)&self->_neonAsset, 0);
  objc_storeStrong((id *)&self->_fluorineAsset, 0);
  objc_storeStrong((id *)&self->_oxygenAsset, 0);
  objc_storeStrong((id *)&self->_nitrogenAsset, 0);
  objc_storeStrong((id *)&self->_carbonAsset, 0);
  objc_storeStrong((id *)&self->_boronAsset, 0);
  objc_storeStrong((id *)&self->_berylliumAsset, 0);
  objc_storeStrong((id *)&self->_lithiumAsset, 0);
  objc_storeStrong((id *)&self->_heliumAsset, 0);
  objc_storeStrong((id *)&self->_hydrogenAsset, 0);
  objc_storeStrong((id *)&self->_swiftAssistAsset, 0);
  objc_storeStrong((id *)&self->_searchMarketplacesAsset, 0);
  objc_storeStrong((id *)&self->_podcastsTranscriptsAsset, 0);
  objc_storeStrong((id *)&self->_xcodeLLMAsset, 0);
  objc_storeStrong((id *)&self->_greymatterAsset, 0);
  objc_storeStrong((id *)&self->_lotXAsset, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015378;
  block[3] = &unk_100030E08;
  block[4] = a1;
  if (qword_10003F420 != -1)
    dispatch_once(&qword_10003F420, block);
  return (id)qword_10003F418;
}

@end
