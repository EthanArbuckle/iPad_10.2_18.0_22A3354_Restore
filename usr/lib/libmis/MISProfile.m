@implementation MISProfile

- (MISProfile)init
{
  MISProfile *v2;
  MISProfile *v3;
  NSData *signature;
  NSData *derEntitlementsStorage;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  MISProfile *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MISProfile;
  v2 = -[MISProfile init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fixedup = 0;
    signature = v2->signature;
    v2->signature = 0;

    derEntitlementsStorage = v3->derEntitlementsStorage;
    v3->ceCtx = 0;
    v3->derEntitlementsStorage = 0;

    objc_msgSend_setPayload_(v3, v6, 0, v7);
    objc_msgSend_setEntitlements_(v3, v8, 0, v9);
    objc_msgSend_setCerts_(v3, v10, 0, v11);
    v12 = v3;
  }

  return v3;
}

- (NSString)uuid
{
  return (NSString *)MISProfileGetValue(self, (uint64_t)CFSTR("UUID"));
}

- (CEQueryContext)derEntitlements
{
  return self->ceCtx;
}

- (void)dealloc
{
  objc_super v3;

  if (self->ceCtx)
    CEReleaseManagedContext();
  v3.receiver = self;
  v3.super_class = (Class)MISProfile;
  -[MISProfile dealloc](&v3, sel_dealloc);
}

- (int)fixUp
{
  int v2;
  NSDictionary *v4;
  NSDictionary *entitlements;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  CFDataRef v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  NSArray *v28;
  NSArray *certs;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  uint8_t *v33;
  NSData *derEntitlementsStorage;
  NSDictionary *v36;
  uint8_t v37[16];
  NSData *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!self->_fixedup)
  {
    if ((self->flavor | 2) == 2)
    {
      MISProfileGetValue(self, (uint64_t)CFSTR("Entitlements"));
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      entitlements = self->entitlements;
      self->entitlements = v4;

      MISProfileGetValue(self, (uint64_t)CFSTR("DeveloperCertificates"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99DE8];
      v11 = objc_msgSend_count(v6, v8, v9, v10);
      objc_msgSend_arrayWithCapacity_(v7, v12, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v15 = v6;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v15);
            v21 = sub_1DF329590(*(const __CFData **)(*((_QWORD *)&v39 + 1) + 8 * i));
            objc_msgSend_addObject_(v14, v22, (uint64_t)v21, v23);

          }
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v24, (uint64_t)&v39, (uint64_t)v43, 16);
        }
        while (v18);
      }

      objc_storeStrong((id *)&self->certs, v14);
      v38 = 0;
      v25 = CESerializeCFDictionary();
      v26 = (_QWORD *)MEMORY[0x1E0DDFFA0];
      if (v25 != *MEMORY[0x1E0DDFFA0])
      {
        sub_1DF30EE34();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
LABEL_29:
          _os_log_error_impl(&dword_1DF30C000, v27, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v37, 2u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      derEntitlementsStorage = self->derEntitlementsStorage;
      self->derEntitlementsStorage = v38;

      if (CEManagedContextFromCFData() != *v26)
      {
        sub_1DF30EE34();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v37 = 0;
          goto LABEL_29;
        }
LABEL_19:
        v2 = -402620413;

LABEL_23:
        return v2;
      }

LABEL_27:
      v2 = 0;
      self->_fixedup = 1;
      return v2;
    }
    MISProfileGetValue(self, (uint64_t)CFSTR("DeveloperCertificates"));
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    certs = self->certs;
    self->certs = v28;

    MISProfileGetValue(self, (uint64_t)CFSTR("Entitlements"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v30 = CEManagedContextFromCFData();
    v31 = (_QWORD *)MEMORY[0x1E0DDFFA0];
    if (v30 == *MEMORY[0x1E0DDFFA0])
    {
      v38 = 0;
      if (CEQueryContextToCFDictionary() == *v31)
      {
        v36 = self->entitlements;
        self->entitlements = (NSDictionary *)v38;

        goto LABEL_27;
      }
      sub_1DF30EE34();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v37 = 0;
        v33 = v37;
        goto LABEL_31;
      }
    }
    else
    {
      sub_1DF30EE34();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v38) = 0;
        v33 = (uint8_t *)&v38;
LABEL_31:
        _os_log_error_impl(&dword_1DF30C000, v32, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v33, 2u);
      }
    }
    v2 = -402620413;

    goto LABEL_23;
  }
  return 0;
}

- (NSMutableDictionary)payload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int)flavor
{
  return self->flavor;
}

- (void)setFlavor:(int)a3
{
  self->flavor = a3;
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSArray)certs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCerts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->certs, 0);
  objc_storeStrong((id *)&self->entitlements, 0);
  objc_storeStrong((id *)&self->payload, 0);
  objc_storeStrong((id *)&self->derEntitlementsStorage, 0);
  objc_storeStrong((id *)&self->signature, 0);
}

@end
