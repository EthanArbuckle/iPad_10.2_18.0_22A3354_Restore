@implementation AccessoryRegisterAction

- (AccessoryRegisterAction)initWithAccount:(id)a3 accessory:(id)a4 cause:(id)a5 force:(BOOL)a6 serverInteractionController:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  AccessoryRegisterAction *v16;
  AccessoryRegisterAction *v17;
  objc_super v19;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)AccessoryRegisterAction;
  v16 = -[AccessoryRegisterAction init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[AccessoryRegisterAction setAccount:](v16, "setAccount:", v12);
    -[AccessoryRegisterAction setAccessory:](v17, "setAccessory:", v13);
    -[AccessoryRegisterAction setCause:](v17, "setCause:", v14);
    -[AccessoryRegisterAction setForce:](v17, "setForce:", v8);
    -[AccessoryRegisterAction setServerInteractionController:](v17, "setServerInteractionController:", v15);
  }

  return v17;
}

+ (id)sharedAccessoryRegisterDigestSerialQueue
{
  if (qword_1003064A8 != -1)
    dispatch_once(&qword_1003064A8, &stru_1002C1D90);
  return (id)qword_1003064B0;
}

- (id)actionType
{
  return CFSTR("AccessoryRegisterAction");
}

- (void)runWithCompletion:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AccessoryRegisterAction setCompletion:](self, "setCompletion:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction cause](self, "cause"));
  v5 = -[AccessoryRegisterAction _registerDeviceWithCause:](self, "_registerDeviceWithCause:", v4);

  v6 = v7;
  if (v7 && (v5 & 1) == 0)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (void)terminate
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction completion](self, "completion"));
  -[AccessoryRegisterAction setCompletion:](self, "setCompletion:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction accessory](self, "accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryIdentifier"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)_registerDeviceWithCause:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  FMDActingRequestDecorator *v12;
  id v13;
  FMDActingRequestDecorator *v14;
  FMDRequestRegister *v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[5];
  id v50;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction accessory](self, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction account](self, "account"));
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_10001DC30;
  v49[4] = sub_10001DC40;
  v50 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10001DC30;
  v43 = sub_10001DC40;
  v44 = 0;
  v7 = objc_claimAutoreleasedReturnValue(+[AccessoryRegisterAction sharedAccessoryRegisterDigestSerialQueue](AccessoryRegisterAction, "sharedAccessoryRegisterDigestSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DC48;
  block[3] = &unk_1002C1DB8;
  v36 = v49;
  block[4] = self;
  v8 = v6;
  v33 = v8;
  v9 = v5;
  v34 = v9;
  v37 = &v39;
  v10 = v4;
  v35 = v10;
  v38 = &v45;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v46 + 24))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryRegisterAction serverInteractionController](self, "serverInteractionController"));
    v12 = [FMDActingRequestDecorator alloc];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001E018;
    v29[3] = &unk_1002C1D48;
    v30 = v8;
    v31 = v10;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001E078;
    v28[3] = &unk_1002C1DE0;
    v28[4] = v49;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001E088;
    v26[3] = &unk_1002C1D20;
    v13 = v30;
    v27 = v13;
    v14 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v12, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", v29, v28, 0, v26);
    v15 = -[FMDRequest initWithAccount:]([FMDRequestRegister alloc], "initWithAccount:", v13);
    -[FMDRequest setDecorator:](v15, "setDecorator:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[AccessoryRegisterAction contextKeyForAccessory:](AccessoryRegisterAction, "contextKeyForAccessory:", v9));
    -[FMDRequestRegister setDigestKey:](v15, "setDigestKey:", v16);

    -[FMDRequestRegister setDigestData:](v15, "setDigestData:", v40[5]);
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001E0E4;
    v20[3] = &unk_1002C1E08;
    objc_copyWeak(&v24, &location);
    v21 = v9;
    v22 = v13;
    v17 = v11;
    v23 = v17;
    -[FMDRequest setCompletionHandler:](v15, "setCompletionHandler:", v20);
    -[AccessoryRegisterAction setRequest:](self, "setRequest:", v15);
    v18 = objc_msgSend(v17, "enqueueRequest:", v15);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  return v18;
}

+ (id)contextKeyForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessoryIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("AccessoryRegisterAction"), v3));

  return v4;
}

+ (void)cleanupContextForAccessory:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[AccessoryRegisterAction sharedAccessoryRegisterDigestSerialQueue](AccessoryRegisterAction, "sharedAccessoryRegisterDigestSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E8A4;
  block[3] = &unk_1002C1328;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (id)digestWithDeviceInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  unsigned __int8 md[20];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "fm_flattenedArrayWithParentIndices:", &off_1002D8ED0));
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v14));
    v6 = v14;
    if (v6)
    {
      v7 = sub_1000031B8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100226728(self, (uint64_t)v6, v8);

    }
  }
  else
  {
    v5 = 0;
  }
  v9 = objc_retainAutorelease(v5);
  CC_SHA1(objc_msgSend(v9, "bytes"), (CC_LONG)objc_msgSend(v9, "length"), md);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20));
  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1002266B4((uint64_t)v10, v12);

  return v10;
}

+ (id)accessoryRegisterDigestForKey:(id)a3
{
  return objc_msgSend((id)qword_1003064A0, "objectForKeyedSubscript:", a3);
}

+ (void)saveAccessoryRegisterDigest:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  v6 = (void *)qword_1003064A0;
  if (!qword_1003064A0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)qword_1003064A0;
    qword_1003064A0 = v7;

    v6 = (void *)qword_1003064A0;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v5);

}

- (BOOL)includeDeviceState
{
  return self->_includeDeviceState;
}

- (void)setIncludeDeviceState:(BOOL)a3
{
  self->_includeDeviceState = a3;
}

- (FMDRequestRegister)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
  objc_storeStrong((id *)&self->_cause, a3);
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  return (FMDServerInteractionController *)objc_loadWeakRetained((id *)&self->_serverInteractionController);
}

- (void)setServerInteractionController:(id)a3
{
  objc_storeWeak((id *)&self->_serverInteractionController, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_cause, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
