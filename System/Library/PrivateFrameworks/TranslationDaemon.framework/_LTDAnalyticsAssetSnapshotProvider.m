@implementation _LTDAnalyticsAssetSnapshotProvider

- (void)collectAssetSnapshotWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v3 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__2;
  v25[4] = __Block_byref_object_dispose__2;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__2;
  v23[4] = __Block_byref_object_dispose__2;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v22 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke;
  v17[3] = &unk_251A114D8;
  v19 = v23;
  v20 = v25;
  v6 = v4;
  v18 = v6;
  +[_LTDAssetService catalogAssetsWithCompletion:](_LTDAssetService, "catalogAssetsWithCompletion:", v17);
  dispatch_group_enter(v6);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_3;
  v14[3] = &unk_251A11500;
  v16 = v21;
  v7 = v6;
  v15 = v7;
  +[_LTDAssetService installedAssetsWithCompletion:](_LTDAssetService, "installedAssetsWithCompletion:", v14);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __73___LTDAnalyticsAssetSnapshotProvider_collectAssetSnapshotWithCompletion___block_invoke_4;
  block[3] = &unk_251A11528;
  v12 = v23;
  v13 = v21;
  v10 = v3;
  v11 = v25;
  v8 = v3;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
}

@end
