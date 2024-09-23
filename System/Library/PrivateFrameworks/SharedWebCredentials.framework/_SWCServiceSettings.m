@implementation _SWCServiceSettings

+ (NSNotificationCenter)notificationCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___SWCServiceSettings_notificationCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED1B6178 != -1)
    dispatch_once(&qword_1ED1B6178, block);
  return (NSNotificationCenter *)(id)_MergedGlobals_0;
}

+ (id)serviceSettingsWithServiceSpecifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceSettings.mm"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier.serviceType != nil"));

  }
  _SWCGetServerConnection();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke;
  v17[3] = &unk_1E547CFB0;
  v17[4] = &v18;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke_2;
  v16[3] = &unk_1E547CFD8;
  v16[4] = &v24;
  v16[5] = &v18;
  objc_msgSend(v11, "getServiceSettingsWithServiceSpecifier:completionHandler:", v7, v16);
  v12 = (void *)v25[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v19[5]);
    v12 = (void *)v25[5];
  }
  v13 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceSettings.mm"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceSettings.mm"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clazz != Nil"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_8;
LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceSettings.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueClazz != Nil"));

  }
  -[_SWCServiceSettings objectForKey:ofClass:](self, "objectForKey:ofClass:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    if (_NSIsNSArray())
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *((_BYTE *)v23 + 24) = 0;
              goto LABEL_17;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_17:

    }
    else if (_NSIsNSDictionary())
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __58___SWCServiceSettings_objectForKey_ofClass_valuesOfClass___block_invoke;
      v17[3] = &unk_1E547D000;
      v17[4] = &v22;
      v17[5] = a5;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
    }
    if (!*((_BYTE *)v23 + 24))
    {

      v10 = 0;
    }
    _Block_object_dispose(&v22, 8);
  }

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  CFPropertyListRef DeepCopy;
  void *v12;
  void *v13;
  unint64_t propertyList;

  propertyList = (unint64_t)a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceSettings.mm"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dict, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (propertyList | v8)
  {
    if ((objc_msgSend((id)v8, "isEqual:") & 1) == 0)
    {
      v10 = propertyList;
      if (propertyList)
      {
        if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", propertyList, 200) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceSettings.mm"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSPropertyListSerialization propertyList:newValue isValidForFormat:NSPropertyListBinaryFormat_v1_0]"));

        }
        DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFPropertyListRef)propertyList, 0);

        v10 = (unint64_t)DeepCopy;
      }
      propertyList = v10;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:");
      *((_BYTE *)self + 16) |= 1u;
    }
  }
  else
  {
    propertyList = 0;
  }

}

- (BOOL)commitReturningError:(id *)a3
{
  int v3;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[7];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    _SWCGetServerConnection();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44___SWCServiceSettings_commitReturningError___block_invoke;
    v12[3] = &unk_1E547CFB0;
    v12[4] = &v13;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __44___SWCServiceSettings_commitReturningError___block_invoke_2;
    v11[3] = &unk_1E547D028;
    v11[4] = self;
    v11[5] = &v19;
    v11[6] = &v13;
    objc_msgSend(v8, "commitServiceSettings:completionHandler:", self, v11);
    if (*((_BYTE *)v20 + 24))
      *((_BYTE *)self + 16) &= ~1u;

    v3 = *((unsigned __int8 *)v20 + 24);
    if (a3 && !*((_BYTE *)v20 + 24))
    {
      *a3 = objc_retainAutorelease((id)v14[5]);
      v3 = *((unsigned __int8 *)v20 + 24);
    }
  }
  else
  {
    v3 = 1;
    v22 = 1;
  }
  v9 = v3 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (BOOL)hasChanges
{
  return *((_BYTE *)self + 16) & 1;
}

- (id)_initWithServiceSpecifier:(id)a3 dictionary:(id)a4 generation:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SWCServiceSettings *v12;
  _SWCServiceSettings *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *dict;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_SWCServiceSettings;
  v12 = -[_SWCServiceSettings init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceSpecifier, a3);
    if (v10)
      v14 = v10;
    else
      v14 = (void *)MEMORY[0x1E0C9AA70];
    v15 = objc_msgSend(v14, "mutableCopy");
    dict = v13->_dict;
    v13->_dict = (NSMutableDictionary *)v15;

    objc_storeStrong((id *)&v13->_generation, a5);
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dict, "copy");
}

+ (void)serviceSettingsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceSpecifierData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && _NSIsNSData())
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "swc_unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v6)
    {
      objc_msgSend(a1, "notificationCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.swc.serviceSettingsDidChangeNotification"), v6);

    }
    else
    {
      if (qword_1ED1B6198 != -1)
        dispatch_once(&qword_1ED1B6198, &__block_literal_global_125);
      v9 = qword_1ED1B6190;
      if (os_log_type_enabled((os_log_t)qword_1ED1B6190, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_1A855A000, v9, OS_LOG_TYPE_ERROR, "Failed to decode service specifier for posting change notification: %@", buf, 0xCu);
      }
    }

  }
}

+ (void)postChangeNotificationForServiceSpecifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    if (v4)
    {
      v16 = CFSTR("serviceSpecifierData");
      v17[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B6188 != -1)
        dispatch_once(&qword_1ED1B6188, &__block_literal_global_0);
      v7 = qword_1ED1B6180;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke_2;
      block[3] = &unk_1E547D050;
      v11 = v6;
      v12 = 3;
      v8 = v6;
      dispatch_async(v7, block);

    }
    else
    {
      if (qword_1ED1B6198 != -1)
        dispatch_once(&qword_1ED1B6198, &__block_literal_global_125);
      v9 = qword_1ED1B6190;
      if (os_log_type_enabled((os_log_t)qword_1ED1B6190, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_error_impl(&dword_1A855A000, v9, OS_LOG_TYPE_ERROR, "Failed to encode service specifier for posting change notification: %@", buf, 0xCu);
      }
    }

  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_SWCServiceSettings serviceSpecifier](self, "serviceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, %llu values }"), v4, -[NSMutableDictionary count](self->_dict, "count"));

  return v5;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_SWCServiceSettings description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_SWCServiceSettings serviceSpecifier](self, "serviceSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, %llu values }"), v5, -[NSMutableDictionary count](self->_dict, "count"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceSpecifier, CFSTR("serviceSpecifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dict, CFSTR("dictionaryRepresentation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_generation, CFSTR("generation"));

}

- (_SWCServiceSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _SWCServiceSettings *v26;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[6];
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "serviceType"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35[0] = CFSTR("Line");
    v35[1] = CFSTR("Function");
    v36[0] = &unk_1E5480DE0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCServiceSettings initWithCoder:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, v10);
    objc_msgSend(v4, "failWithError:", v11);

    self = 0;
  }
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v34[4] = objc_opt_class();
  v34[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  objc_msgSend(v4, "swc_decodeObjectOfClasses:forKey:", v14, CFSTR("dictionaryRepresentation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v32[0] = CFSTR("Line");
    v32[1] = CFSTR("Function");
    v33[0] = &unk_1E5480DF8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCServiceSettings initWithCoder:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, v18);
    objc_msgSend(v4, "failWithError:", v19);
    goto LABEL_9;
  }
  if (!_NSIsNSDictionary()
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v15, 200) & 1) == 0)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30[0] = CFSTR("Line");
    v30[1] = CFSTR("Function");
    v31[0] = &unk_1E5480E10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCServiceSettings initWithCoder:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v18);
    objc_msgSend(v4, "failWithError:", v19);
LABEL_9:

    self = 0;
  }
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCServiceSettings initWithCoder:]", CFSTR("Line"), CFSTR("Function"), &unk_1E5480E28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, v24);
    objc_msgSend(v4, "failWithError:", v25);

    self = 0;
  }
  v26 = -[_SWCServiceSettings _initWithServiceSpecifier:dictionary:generation:](self, "_initWithServiceSpecifier:dictionary:generation:", v6, v15, v21);

  return v26;
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  return (_SWCServiceSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (_SWCGeneration)generation
{
  return (_SWCGeneration *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_serviceSpecifier, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

+ (BOOL)removeObjectsForKeys:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceSettings.mm"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceType != nil"));

  }
  _SWCGetServerConnection();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke;
  v19[3] = &unk_1E547CFB0;
  v19[4] = &v20;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke_2;
  v18[3] = &unk_1E547D078;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend(v13, "removeSettingsForKeys:serviceType:completionHandler:", v9, v10, v18);
  v14 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v14 = *((unsigned __int8 *)v27 + 24);
  }
  v15 = v14 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

+ (BOOL)removeObjectsForKeys:(id)a3 serviceSpecifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v10 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceSettings.mm"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("specifier != nil"));

  }
  _SWCGetServerConnection();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke;
  v19[3] = &unk_1E547CFB0;
  v19[4] = &v20;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke_2;
  v18[3] = &unk_1E547D078;
  v18[4] = &v26;
  v18[5] = &v20;
  objc_msgSend(v13, "removeSettingsForKeys:serviceSpecifier:completionHandler:", v9, v10, v18);
  v14 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = objc_retainAutorelease((id)v21[5]);
    v14 = *((unsigned __int8 *)v27 + 24);
  }
  v15 = v14 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

@end
