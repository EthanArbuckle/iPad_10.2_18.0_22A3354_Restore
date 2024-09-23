@implementation STUNamePropertyProvider

- (void)dealloc
{
  objc_super v3;

  -[STUNamePropertyProvider endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUNamePropertyProvider;
  -[STUNamePropertyProvider dealloc](&v3, "dealloc");
}

- (id)key
{
  return CRKDeviceNameKey;
}

- (void)beginUpdating
{
  __CFBundle *MainBundle;
  const __CFString *Identifier;
  __SCDynamicStore *v5;
  NSObject *ComputerName;
  __SCDynamicStore *mDynamicStoreRef;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  SCDynamicStoreContext context;
  NSObject *v34;

  if (!self->mDynamicStoreRef)
  {
    memset(&context.retain, 0, 24);
    context.version = (uint64_t)kCFCoreFoundationVersionNumber;
    context.info = self;
    MainBundle = CFBundleGetMainBundle();
    Identifier = CFBundleGetIdentifier(MainBundle);
    v5 = SCDynamicStoreCreate(kCFAllocatorDefault, Identifier, (SCDynamicStoreCallBack)sub_10005D2C0, &context);
    self->mDynamicStoreRef = v5;
    if (!v5)
    {
      v8 = sub_10005D2C8();
      ComputerName = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(ComputerName, OS_LOG_TYPE_ERROR))
        sub_10007D1BC(ComputerName, v9, v10, v11, v12, v13, v14, v15);
      goto LABEL_13;
    }
    ComputerName = SCDynamicStoreKeyCreateComputerName(0);
    mDynamicStoreRef = self->mDynamicStoreRef;
    v34 = ComputerName;
    if (SCDynamicStoreSetNotificationKeys(mDynamicStoreRef, (CFArrayRef)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1), 0))
    {
      if (SCDynamicStoreSetDispatchQueue(self->mDynamicStoreRef, (dispatch_queue_t)&_dispatch_main_q))
      {
        -[STUNamePropertyProvider deviceNameDidChange](self, "deviceNameDidChange");
LABEL_13:

        return;
      }
      v25 = sub_10005D2C8();
      v17 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10007D21C(v17, v26, v27, v28, v29, v30, v31, v32);
    }
    else
    {
      v16 = sub_10005D2C8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10007D1EC(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    goto LABEL_13;
  }
}

- (void)endUpdating
{
  __SCDynamicStore *mDynamicStoreRef;

  mDynamicStoreRef = self->mDynamicStoreRef;
  if (mDynamicStoreRef)
  {
    SCDynamicStoreSetDispatchQueue(mDynamicStoreRef, 0);
    CFRelease(self->mDynamicStoreRef);
    self->mDynamicStoreRef = 0;
  }
}

- (void)deviceNameDidChange
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  __CFString *v7;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (__CFString *)SCDynamicStoreCopyComputerName(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
    if (v4 | (unint64_t)v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
      v6 = objc_msgSend(v5, "isEqual:", v7);

      if ((v6 & 1) == 0)
        -[STUDevicePropertyProvider setValue:](self, "setValue:", v7);
    }

  }
  else
  {
    -[STUNamePropertyProvider performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

@end
