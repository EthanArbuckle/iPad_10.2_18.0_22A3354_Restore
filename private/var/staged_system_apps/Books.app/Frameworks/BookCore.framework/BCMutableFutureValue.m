@implementation BCMutableFutureValue

- (void)set:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  BCMutableFutureValue *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_144D08;
  v24 = sub_144D18;
  v25 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[BCFutureValue sync](self, "sync"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_146AC4;
  v15 = &unk_28D368;
  v16 = self;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v19 = &v20;
  dispatch_sync(v8, &v12);

  v11 = v21[5];
  if (v11)
    -[BCFutureValue _notifyBlocks:withValue:error:](self, "_notifyBlocks:withValue:error:", v11, v9, v10, v12, v13, v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

@end
