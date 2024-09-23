@implementation MZUPPBagContext

+ (double)defaultPollingInterval
{
  return 1800.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext bag](self, "bag"));
  objc_msgSend(v4, "setBag:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext baseURLForGETAll](self, "baseURLForGETAll"));
  objc_msgSend(v4, "setBaseURLForGETAll:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPBagContext baseURLForPUTAll](self, "baseURLForPUTAll"));
  objc_msgSend(v4, "setBaseURLForPUTAll:", v7);

  return v4;
}

- (double)pollingInterval
{
  double result;

  result = self->_pollingInterval;
  if (fabs(result) <= 2.22044605e-16)
    return 1800.0;
  return result;
}

- (NSString)domain
{
  return (NSString *)CFSTR("com.apple.upp");
}

+ (void)loadBagContextFromIMURLBag:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  dispatch_group_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  NSObject *v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  MZUPPBagContext *v38;
  NSErrorUserInfoKey v39;
  void *v40;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = sub_1000466AC;
      v37[4] = sub_1000469CC;
      v38 = objc_alloc_init(MZUPPBagContext);
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = sub_1000466AC;
      v35[4] = sub_1000469CC;
      v36 = 0;
      v7 = dispatch_group_create();
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10008AB34;
      v30[3] = &unk_1004A85E0;
      v8 = dispatch_queue_create(0, 0);
      v31 = v8;
      v33 = v37;
      v34 = v35;
      v9 = v7;
      v32 = v9;
      v10 = objc_retainBlock(v30);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10008AC88;
      v25[3] = &unk_1004A8658;
      v11 = v9;
      v26 = v11;
      v27 = v5;
      v12 = v8;
      v28 = v12;
      v13 = v10;
      v29 = v13;
      v14 = objc_retainBlock(v25);
      ((void (*)(_QWORD *, _QWORD, Block_layout *, _QWORD, _QWORD))v14[2])(v14, kMTBaseURLForGETAll, &stru_1004A8698, kMTSyncGetAllUPP, kMTSyncGetAll);
      ((void (*)(_QWORD *, _QWORD, Block_layout *, _QWORD, _QWORD))v14[2])(v14, kMTBaseURLForPUTAll, &stru_1004A8698, kMTSyncPutAllUPP, kMTSyncPutAll);
      ((void (*)(_QWORD *, _QWORD, Block_layout *, _QWORD, _QWORD))v14[2])(v14, kMTUPPDisabledBagContext, &stru_1004A86B8, kMTUPPDisabled, 0);
      ((void (*)(_QWORD *, _QWORD, Block_layout *, _QWORD, _QWORD))v14[2])(v14, kMTPollingIntervalBagContext, &stru_1004A86D8, kMTUPPPollingInterval, 0);
      v15 = dispatch_queue_create(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008AEB0;
      block[3] = &unk_1004A8700;
      v21 = v11;
      v23 = v35;
      v24 = v37;
      v22 = v6;
      v16 = v11;
      dispatch_async(v15, block);

      _Block_object_dispose(v35, 8);
      _Block_object_dispose(v37, 8);

    }
    else
    {
      v39 = NSLocalizedDescriptionKey;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not load bag context due to invalid bag.")));
      v40 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 100, v18));

      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v19);
    }
  }

}

- (IMURLBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSURL)baseURLForGETAll
{
  return self->_baseURLForGETAll;
}

- (void)setBaseURLForGETAll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)baseURLForPUTAll
{
  return self->_baseURLForPUTAll;
}

- (void)setBaseURLForPUTAll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)UPPDisabled
{
  return self->_UPPDisabled;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURLForPUTAll, 0);
  objc_storeStrong((id *)&self->_baseURLForGETAll, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
