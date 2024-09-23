@implementation SSSoftwareLibraryItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareLibraryItem;
  -[SSSoftwareLibraryItem dealloc](&v3, sel_dealloc);
}

- (id)ETagForAssetType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_etags, "objectForKey:", a3);
}

- (BOOL)setETag:(id)a3 forAssetType:(id)a4 error:(id *)a5
{
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  __CFString *v23;
  id v24;
  SSXPCConnection *v25;
  NSObject *v26;
  NSMutableDictionary *etags;
  id v28;
  uint64_t *v29;
  int v30;
  BOOL v31;
  uint64_t v33;
  _QWORD v34[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v9)
      v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v12 = v11;
    else
      v12 = v11 & 2;
    if (v12)
    {
      LODWORD(v39) = 136446210;
      *(_QWORD *)((char *)&v39 + 4) = "-[SSSoftwareLibraryItem setETag:forAssetType:error:]";
      LODWORD(v33) = 12;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v39, v33);
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = &v39;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__46;
  v42 = __Block_byref_object_dispose__46;
  v43 = 0;
  v22 = SSXPCCreateMessageDictionary(90);
  v23 = (__CFString *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = a3;
  if (!a3)
    v24 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  -[__CFString setObject:forKey:](v23, "setObject:forKey:", v24, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@$$%@$$%@"), CFSTR("com.apple.iTunesStore.downloadInfo"), CFSTR("etags"), a4));
  SSXPCDictionarySetCFObject(v22, "1", (__CFString *)-[NSMutableDictionary objectForKey:](self->_propertyValues, "objectForKey:", CFSTR("bundle-id")));
  SSXPCDictionarySetCFObject(v22, "2", v23);

  v25 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v26 = dispatch_semaphore_create(0);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __52__SSSoftwareLibraryItem_setETag_forAssetType_error___block_invoke;
  v34[3] = &unk_1E47BE2C8;
  v34[6] = &v35;
  v34[4] = v26;
  v34[5] = &v39;
  -[SSXPCConnection sendMessage:withReply:](v25, "sendMessage:withReply:", v22, v34);
  dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v26);

  xpc_release(v22);
  if (*((_BYTE *)v36 + 24))
  {
    etags = self->_etags;
    if (a3)
    {
      if (!etags)
      {
        etags = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_etags = etags;
      }
      -[NSMutableDictionary setObject:forKey:](etags, "setObject:forKey:", a3, a4);
    }
    else
    {
      -[NSMutableDictionary removeObjectForKey:](etags, "removeObjectForKey:", a4);
    }
  }
  v28 = *(id *)(*((_QWORD *)&v39 + 1) + 40);
  v29 = v36;
  v30 = *((unsigned __int8 *)v36 + 24);
  if (a5 && !*((_BYTE *)v36 + 24))
  {
    *a5 = *(id *)(*((_QWORD *)&v39 + 1) + 40);
    v30 = *((unsigned __int8 *)v29 + 24);
  }
  v31 = v30 != 0;
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v35, 8);
  return v31;
}

intptr_t __52__SSSoftwareLibraryItem_setETag_forAssetType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v6;

  if (a2 == (void *)MEMORY[0x1E0C81260] || a2 == (void *)MEMORY[0x1E0C81258])
  {
    v4 = 121;
  }
  else
  {
    if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "1");
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      goto LABEL_11;
    }
    v4 = 111;
  }
  v6 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
LABEL_11:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_propertyValues, "objectForKey:", a3);
}

- (id)_initWithITunesMetadata:(id)a3
{
  SSSoftwareLibraryItem *v4;
  id *p_isa;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SSSoftwareLibraryItem;
  v4 = -[SSSoftwareLibraryItem init](&v14, sel_init);
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {

    p_isa[4] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("etags"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        p_isa[2] = (id)objc_msgSend(v7, "mutableCopy");
      }
      v8 = objc_msgSend(v6, "objectForKey:", CFSTR("referrerApp"));
      if (v8)
        objc_msgSend(p_isa[4], "setObject:forKey:", v8, CFSTR("referrerApp"));
      v9 = objc_msgSend(v6, "objectForKey:", CFSTR("referrerURL"));
      if (v9)
        objc_msgSend(p_isa[4], "setObject:forKey:", v9, CFSTR("referrerURL"));
    }
    for (i = 0; i != 6; ++i)
    {
      v11 = off_1E47BE2E8[i];
      v12 = objc_msgSend(a3, "objectForKey:", v11);
      if (v12)
        objc_msgSend(p_isa[4], "setObject:forKey:", v12, v11);
    }
  }
  return p_isa;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *propertyValues;

  propertyValues = self->_propertyValues;
  if (a3)
  {
    if (!propertyValues)
    {
      propertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_propertyValues = propertyValues;
    }
    -[NSMutableDictionary setObject:forKey:](propertyValues, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](propertyValues, "removeObjectForKey:", a4);
  }
}

- (SSSoftwareLibraryItem)initWithXPCEncoding:(id)a3
{
  SSSoftwareLibraryItem *v5;
  CFArrayRef v7;
  CFArrayRef v8;
  objc_super v9;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSSoftwareLibraryItem;
    v5 = -[SSSoftwareLibraryItem init](&v9, sel_init);
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      v5->_etags = (NSMutableDictionary *)-[__CFArray mutableCopy](v7, "mutableCopy");

      v5->_beta = xpc_dictionary_get_BOOL(a3, "4");
      v5->_launchProhibited = xpc_dictionary_get_BOOL(a3, "5");
      v5->_placeholder = xpc_dictionary_get_BOOL(a3, "3");
      v5->_profileValidated = xpc_dictionary_get_BOOL(a3, "1");
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      v5->_propertyValues = (NSMutableDictionary *)-[__CFArray mutableCopy](v8, "mutableCopy");

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "4", self->_beta);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_etags);
  xpc_dictionary_set_BOOL(v3, "5", self->_launchProhibited);
  xpc_dictionary_set_BOOL(v3, "3", self->_placeholder);
  xpc_dictionary_set_BOOL(v3, "1", self->_profileValidated);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_propertyValues);
  return v3;
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

@end
