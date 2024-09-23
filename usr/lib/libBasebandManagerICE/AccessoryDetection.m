@implementation AccessoryDetection

- (AccessoryDetection)initWithCallback:(AccessoryDetectionCallback)a3
{
  id detached;
  id attached;
  AccessoryDetection *v5;
  uint64_t v6;
  ACCConnectionInfo *fConnectionInfoProvider;
  NSMutableDictionary *v8;
  NSMutableDictionary *fAccessoryEndpointList;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *fConnectionInfoFilter;
  id v16;
  capabilities::abs *v17;
  capabilities::abs *v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  AccessoryDetection *v29;
  objc_super v31;

  detached = a3.detached;
  attached = a3.attached;
  v31.receiver = self;
  v31.super_class = (Class)AccessoryDetection;
  v5 = -[AccessoryDetection init](&v31, sel_init);
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0D153A0], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    fConnectionInfoProvider = v5->_fConnectionInfoProvider;
    v5->_fConnectionInfoProvider = (ACCConnectionInfo *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fAccessoryEndpointList = v5->_fAccessoryEndpointList;
    v5->_fAccessoryEndpointList = v8;

    v10 = _Block_copy(attached);
    v11 = v5->_fCallback.attached;
    v5->_fCallback.attached = v10;

    v12 = _Block_copy(detached);
    v13 = v5->_fCallback.detached;
    v5->_fCallback.detached = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fConnectionInfoFilter = v5->_fConnectionInfoFilter;
    v5->_fConnectionInfoFilter = v14;

    v16 = (id)*MEMORY[0x1E0D15380];
    v17 = (capabilities::abs *)(id)*MEMORY[0x1E0D15388];
    v18 = (capabilities::abs *)capabilities::abs::supportsMagSafe(v17);
    v19 = (int)v18;
    v20 = capabilities::abs::supportsSmartConnectorAccessory(v18);
    if (v19)
      v21 = 8224;
    else
      v21 = 32;
    if (v19)
      v22 = 578;
    else
      v22 = 66;
    if (v20)
      v23 = v22 | 8;
    else
      v23 = v22;
    if (v20)
      v24 = v21 | 0x80;
    else
      v24 = v21;
    v25 = v5->_fConnectionInfoFilter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, v16);

    v27 = v5->_fConnectionInfoFilter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, v17);

    v29 = v5;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)start
{
  ACCConnectionInfo *fConnectionInfoProvider;
  NSMutableDictionary *fConnectionInfoFilter;
  NSMutableDictionary *v5;
  ACCConnectionInfo *v6;
  AccessoryDetection *v7;

  fConnectionInfoProvider = self->_fConnectionInfoProvider;
  fConnectionInfoFilter = self->_fConnectionInfoFilter;
  if (fConnectionInfoFilter && -[NSMutableDictionary count](fConnectionInfoFilter, "count"))
  {
    v5 = self->_fConnectionInfoFilter;
    v6 = fConnectionInfoProvider;
    v7 = self;
  }
  else
  {
    v5 = 0;
    v6 = fConnectionInfoProvider;
    v7 = self;
  }
  -[ACCConnectionInfo registerDelegate:withFilter:](v6, "registerDelegate:withFilter:", v7, v5);
}

- (void)stop
{
  -[ACCConnectionInfo registerDelegate:](self->_fConnectionInfoProvider, "registerDelegate:", 0);
  -[NSMutableDictionary removeAllObjects](self->_fAccessoryEndpointList, "removeAllObjects");
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void (**attached)(id, CFTypeRef *, CFTypeRef *, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef cf;
  CFTypeRef v21;
  CFTypeRef v22;
  id v23;
  id v24;
  id v25;

  v9 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = v13;
  v23 = 0;
  if (v11 && v12 && v13)
  {
    v15 = v11;
    v25 = v15;
    v16 = v14;
    v24 = v16;
    v17 = -[ACCConnectionInfo accessoryConnectionType:](self->_fConnectionInfoProvider, "accessoryConnectionType:", v16);
    if ((v9 | 2) == 7)
    {
      -[ACCConnectionInfo accessoryInfoForEndpointSync:connection:](self->_fConnectionInfoProvider, "accessoryInfoForEndpointSync:connection:", v15, v16);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_15:
        CFRelease(v16);
        CFRelease(v15);
        goto LABEL_16;
      }
    }
    else
    {
      v18 = v12;
    }
    v22 = v15;
    v23 = v18;
    attached = (void (**)(id, CFTypeRef *, CFTypeRef *, _QWORD, uint64_t, CFTypeRef *))self->_fCallback.attached;
    CFRetain(v15);
    v21 = v16;
    CFRetain(v16);
    cf = v18;
    CFRetain(v18);
    attached[2](attached, &v22, &v21, v9, v17, &cf);
    if (cf)
      CFRelease(cf);
    if (v21)
      CFRelease(v21);
    if (v22)
      CFRelease(v22);
    CFRelease(v18);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void (**detached)(id, CFTypeRef *);
  CFTypeRef cf[2];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  cf[0] = v8;
  cf[1] = v8;
  detached = (void (**)(id, CFTypeRef *))self->_fCallback.detached;
  if (v8)
    CFRetain(v8);
  detached[2](detached, cf);
  if (cf[0])
    CFRelease(cf[0]);
  if (v9)
    CFRelease(v9);

}

- (ACCConnectionInfo)fConnectionInfoProvider
{
  return (ACCConnectionInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFConnectionInfoProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (AccessoryDetectionCallback)fCallback
{
  void *v2;
  void *v3;
  _QWORD v4[2];
  AccessoryDetectionCallback result;

  objc_copyCppObjectAtomic(v4, &self->_fCallback, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  v2 = (void *)v4[0];
  v3 = (void *)v4[1];
  result.detached = v3;
  result.attached = v2;
  return result;
}

- (void)setFCallback:(AccessoryDetectionCallback)a3
{
  AccessoryDetectionCallback v3;

  v3 = a3;
  objc_copyCppObjectAtomic(&self->_fCallback, &v3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);

}

- (NSMutableDictionary)fAccessoryEndpointList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFAccessoryEndpointList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)fConnectionInfoFilter
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFConnectionInfoFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_fConnectionInfoFilter, 0);
  objc_storeStrong((id *)&self->_fAccessoryEndpointList, 0);
  objc_storeStrong((id *)&self->_fConnectionInfoProvider, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
