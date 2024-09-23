@implementation SecDbKeychainMetadataKeyStore

- (id)keyForKeyclass:(int)a3 keybag:(int)a4 keySpecifier:(id)a5 allowWrites:(BOOL)a6 error:(id *)a7
{
  id v13;
  _BYTE *v14;
  _BYTE *v15;
  int v16;
  NSObject *v17;
  const void *v18;
  NSObject *v19;
  id v20;
  NSObject *queue;
  uint8_t *v22;
  void *v23;
  const void *v24;
  void *v25;
  objc_class *v27;
  NSString *v28;
  void *v29;
  NSString *v30;
  void *v31;
  void *v32;
  _QWORD block[5];
  id v34;
  uint8_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  int v39;
  int v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v13 = a5;
  if (a7)
  {
    off_100340C48();
    v15 = v14;
    if (*v14)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v27 = (objc_class *)objc_opt_class(self);
      v28 = NSStringFromClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = NSStringFromSelector(a2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SecDbKeychainMetadataKeyStore.m"), 335, CFSTR("re-entering -[%@ %@] - that shouldn't happen!"), v29, v31);

    }
    *v15 = 1;
    if (a3 < 32)
    {
      v16 = a3;
    }
    else
    {
      v16 = a3 & 0x1F;
      v17 = sub_10000EF14("SanitizeKeyclass");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = a3;
        LOWORD(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 2) = a3 & 0x1F;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "sanitizing request for keyclass %d to keyclass %d", buf, 0xEu);
      }
    }
    *(_QWORD *)buf = 0;
    v57 = buf;
    v58 = 0x3032000000;
    v59 = sub_1001BBCB4;
    v60 = sub_1001BBCC4;
    v61 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = sub_1001BBCB4;
    v54 = sub_1001BBCC4;
    v55 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000180EC;
    block[3] = &unk_1002EADF8;
    v35 = buf;
    v36 = &v42;
    block[4] = self;
    v37 = &v46;
    v39 = v16;
    v40 = a4;
    v41 = a6;
    v34 = v13;
    v38 = &v50;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v43 + 24))
    {
      v22 = v57;
      if (*((_QWORD *)v57 + 5))
        goto LABEL_20;
    }
    v23 = (void *)v51[5];
    if (v23)
    {
      *a7 = objc_retainAutorelease(v23);
      v24 = (const void *)v47[3];
      if (!v24)
      {
LABEL_19:
        v25 = (void *)*((_QWORD *)v57 + 5);
        *((_QWORD *)v57 + 5) = 0;

        v22 = v57;
LABEL_20:
        *v15 = 0;
        v20 = *((id *)v22 + 5);

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }
      v47[3] = 0;
      CFRelease(v24);
    }
    else
    {
      *a7 = (id)v47[3];
      v47[3] = 0;
    }
    if (!*a7)
      sub_10003429C(CFSTR("Execution has encountered an unexpected state"), 0x53C0000Eu);
    goto LABEL_19;
  }
  v18 = sub_10000EF14("SecError");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "keyForKeyclass called without error param, this is a bug", buf, 2u);
  }

  v20 = 0;
LABEL_21:

  return v20;
}

+ (id)sharedStore
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1001BBCB4;
  v10 = sub_1001BBCC4;
  v11 = 0;
  if (qword_1003414F8 != -1)
    dispatch_once(&qword_1003414F8, &stru_1002EAE18);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100022F64;
  v5[3] = &unk_1002EAD08;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_1003414D8, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)cachingEnabled
{
  return 1;
}

- (id)_init
{
  SecDbKeychainMetadataKeyStore *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *keysDict;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SecDbKeychainMetadataKeyStore;
  v2 = -[SecDbKeychainMetadataKeyStore init](&v14, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    keysDict = v2->_keysDict;
    v2->_keysDict = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("SecDbKeychainMetadataKeyStore", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_keybagNotificationToken = -1;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001BC5CC;
    v11[3] = &unk_1002EAD30;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_keybagNotificationToken, v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  int keybagNotificationToken;
  objc_super v4;

  keybagNotificationToken = self->_keybagNotificationToken;
  if (keybagNotificationToken != -1)
  {
    notify_cancel(keybagNotificationToken);
    self->_keybagNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SecDbKeychainMetadataKeyStore;
  -[SecDbKeychainMetadataKeyStore dealloc](&v4, "dealloc");
}

- (void)dropClassAKeys
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC5C4;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueDropClassAKeys
{
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = sub_10000EF14("SecDbKeychainMetadataKeyStore");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dropping class A metadata keys", v5, 2u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keysDict, "setObject:forKeyedSubscript:", 0, &off_10030AFE8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keysDict, "setObject:forKeyedSubscript:", 0, &off_10030B000);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keysDict, "setObject:forKeyedSubscript:", 0, &off_10030B018);
}

- (void)dropAllKeys
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC5BC;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueDropAllKeys
{
  const void *v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = sub_10000EF14("SecDbKeychainMetadataKeyStore");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dropping all metadata keys", v5, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_keysDict, "removeAllObjects");
}

- (id)validateWrappedKey:(id)a3 forKeyClass:(int)a4 actualKeyClass:(int *)a5 keybag:(int)a6 keySpecifier:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v13;
  id v14;
  unsigned int v15;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  const void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  const void *v28;
  NSObject *v29;
  unsigned int v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  _QWORD v38[2];

  v10 = *(_QWORD *)&a6;
  v13 = a3;
  v14 = a7;
  v15 = *a5;
  if (*a5 == a4 || v15 == 0)
    v17 = a4;
  else
    v17 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
  v36 = 0;
  v19 = +[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:", v10, v17, v13, 0, v18, 0, 0, &v36);
  v20 = v36;
  v21 = v20;
  if (v19)
  {
    v35 = v20;
    v22 = objc_msgSend(objc_alloc((Class)_SFAESKey), "initWithData:specifier:error:", v18, v14, &v35);
    v23 = v35;

    if (!v22)
    {
      v24 = sub_10000EF14("SecError");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v38[0]) = v17;
        WORD2(v38[0]) = 2112;
        *(_QWORD *)((char *)v38 + 6) = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: AKS decrypted metadata blob for class %d but could not turn it into a key: %@", buf, 0x12u);
      }

      goto LABEL_15;
    }
  }
  else
  {
    if ((int)v17 > 30 || *a5)
    {
      v23 = v20;
      goto LABEL_15;
    }
    *a5 = v17 | 0x20;
    v34 = v20;
    v31 = +[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:", v10, 0, &v34);
    v23 = v34;

    if (!v31
      || (v33 = v23,
          v22 = objc_msgSend(objc_alloc((Class)_SFAESKey), "initWithData:specifier:error:", v18, v14, &v33), v32 = v33, v23, v23 = v32, !v22))
    {
LABEL_15:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "domain"));
      if (objc_msgSend(v26, "isEqualToString:", kCFErrorDomainOSStatus))
      {
        v27 = objc_msgSend(v23, "code");

        if (v27 == (id)-25308)
        {
          if (a8)
          {
LABEL_18:
            v23 = objc_retainAutorelease(v23);
            v22 = 0;
            *a8 = v23;
            goto LABEL_24;
          }
LABEL_23:
          v22 = 0;
          goto LABEL_24;
        }
      }
      else
      {

      }
      v28 = sub_10000EF14("SecError");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38[0] = v23;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: Unable to create key from retrieved data: %@", buf, 0xCu);
      }

      if (a8)
        goto LABEL_18;
      goto LABEL_23;
    }
  }
LABEL_24:

  return v22;
}

- (id)newKeyForKeyclass:(int)a3 withKeybag:(int)a4 keySpecifier:(id)a5 database:(__OpaqueSecDbConnection *)a6 error:(id *)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v18;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v18 = 0;
  v13 = objc_msgSend(objc_alloc((Class)_SFAESKey), "initRandomKeyWithSpecifier:error:", v12, &v18);
  v14 = v18;
  v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadataKeyStore writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:](self, "writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:", v13, v10, v9, v12, a6, a7));
  }
  else
  {
    v16 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v14);
  }

  return v16;
}

- (id)writeKey:(id)a3 ForKeyclass:(int)a4 withKeybag:(int)a5 keySpecifier:(id)a6 database:(__OpaqueSecDbConnection *)a7 error:(id *)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  char v20;
  char v21;
  id v22;
  const void *v23;
  NSObject *v24;
  const void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  __int128 *p_buf;
  uint64_t *v33;
  __OpaqueSecDbConnection *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  CFTypeRef v40;
  id v41;
  int v42;
  uint8_t v43[4];
  int v44;
  __int16 v45;
  uint64_t v46;
  __int128 buf;
  uint64_t v48;
  char v49;

  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v14 = a3;
  v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 40));
  v42 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "keyData"));
  v41 = 0;
  v18 = +[SecAKSObjCWrappers aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:", v11, v12, v17, &v42, v16, 0, 0, &v41);
  v19 = v41;

  if ((v18 & 1) != 0)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v48 = 0x2020000000;
    v49 = 1;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001BC490;
    v30[3] = &unk_1002EAD58;
    p_buf = &buf;
    v33 = &v37;
    v35 = v12;
    v36 = v42;
    v31 = v16;
    v34 = a7;
    v20 = sub_10001E3C4((uint64_t)a7, (uint64_t)CFSTR("INSERT OR REPLACE INTO metadatakeys (keyclass, actualKeyclass, data) VALUES (?,?,?)"), &v40, (uint64_t)v30);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v21 = v20;
    else
      v21 = 0;
    *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = v21;
    if ((v21 & 1) != 0)
    {
      v22 = v14;
    }
    else
    {
      v25 = sub_10000EF14("SecError");
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v38[3];
        *(_DWORD *)v43 = 67109378;
        v44 = v12;
        v45 = 2112;
        v46 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to write new metadata key for %d: %@", v43, 0x12u);
      }

      v28 = (void *)v38[3];
      if (a8)
      {
        v22 = 0;
        *a8 = v28;
        v38[3] = 0;
      }
      else
      {
        if (v28)
        {
          v38[3] = 0;
          CFRelease(v28);
        }
        v22 = 0;
      }
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v23 = sub_10000EF14("SecError");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SecDbMetadataKeyStore: Unable to encrypt new metadata key to keybag: %@", (uint8_t *)&buf, 0xCu);
    }

    v22 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v19);
  }

  return v22;
}

- (BOOL)readKeyDataForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 actualKeyclass:(int *)a5 wrappedKey:(id *)a6 error:(id *)a7
{
  int v12;
  int v13;
  BOOL v14;
  void *v15;
  _QWORD v17[10];
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  CFTypeRef v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1001BBCB4;
  v35 = sub_1001BBCC4;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001BC320;
  v17[3] = &unk_1002EADA8;
  v18 = a3;
  v17[4] = &v27;
  v17[5] = &v19;
  v17[8] = a4;
  v17[9] = a5;
  v17[6] = &v31;
  v17[7] = &v23;
  v12 = sub_10001E3C4((uint64_t)a4, (uint64_t)CFSTR("SELECT data, actualKeyclass FROM metadatakeys WHERE keyclass = ?"), &v22, (uint64_t)v17);
  if (*((_BYTE *)v28 + 24))
    v13 = v12;
  else
    v13 = 0;
  *((_BYTE *)v28 + 24) = v13;
  if (v13 == 1 && *((_BYTE *)v24 + 24))
  {
    *a6 = objc_retainAutorelease((id)v32[5]);
    v14 = 1;
  }
  else
  {
    v15 = (void *)v20[3];
    if (a7)
    {
      *a7 = v15;
      v20[3] = 0;
    }
    else if (v15)
    {
      v20[3] = 0;
      CFRelease(v15);
    }
    v14 = 0;
    *a5 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (id)fetchKeyForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 keybag:(int)a5 specifier:(id)a6 allowWrites:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v12;
  id v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  const void *v22;
  NSObject *v23;
  const void *v24;
  id v26;
  id v27;
  int v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  NSObject *v32;

  v9 = a7;
  v10 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a3;
  v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28 = 0;
  v27 = 0;
  v15 = -[SecDbKeychainMetadataKeyStore readKeyDataForClass:fromDb:actualKeyclass:wrappedKey:error:](self, "readKeyDataForClass:fromDb:actualKeyclass:wrappedKey:error:", v12, a4, &v28, &v27, a8);
  v16 = v27;
  v17 = v16;
  v18 = 0;
  if (v15)
  {
    if (!objc_msgSend(v16, "length"))
    {
      v24 = sub_10000EF14("SecDbMetadataKeyStore");
      v21 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No metadata key found on disk despite existing row. That's odd.", buf, 2u);
      }
      v18 = 0;
      goto LABEL_13;
    }
    v19 = v28;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadataKeyStore validateWrappedKey:forKeyClass:actualKeyClass:keybag:keySpecifier:error:](self, "validateWrappedKey:forKeyClass:actualKeyClass:keybag:keySpecifier:error:", v17, v12, &v28, v10, v14, a8));
    if (v18 && v9 && v19 != v28)
    {
      v26 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadataKeyStore writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:](self, "writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:", v18, v12, v10, v14, a4, &v26));
      v21 = v26;

      if (!v20)
      {
        v22 = sub_10000EF14("SecWarning");
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          v30 = v12;
          v31 = 2112;
          v32 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SecDbMetadataKeyStore: Unable to rewrite metadata key for %d to new format: %@", buf, 0x12u);
        }

        v21 = 0;
      }
LABEL_13:

    }
  }

  return v18;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)keysDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeysDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)keybagNotificationToken
{
  return self->_keybagNotificationToken;
}

- (void)setKeybagNotificationToken:(int)a3
{
  self->_keybagNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysDict, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)resetSharedStore
{
  if (qword_1003414F8 != -1)
    dispatch_once(&qword_1003414F8, &stru_1002EAE18);
  dispatch_sync((dispatch_queue_t)qword_1003414D8, &stru_1002EACE0);
}

@end
