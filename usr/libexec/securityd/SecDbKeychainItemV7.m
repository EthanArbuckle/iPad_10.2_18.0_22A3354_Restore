@implementation SecDbKeychainItemV7

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tamperCheck, 0);
  objc_storeStrong((id *)&self->_metadataAttributes, 0);
  objc_storeStrong((id *)&self->_secretAttributes, 0);
  objc_storeStrong((id *)&self->_encryptedMetadata, 0);
  objc_storeStrong((id *)&self->_encryptedSecretData, 0);
}

- (id)secretAttributesWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  NSDictionary *secretAttributes;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const __CFData *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NSDictionary *v30;
  NSDictionary *v31;
  const void *v32;
  NSObject *v33;
  NSDictionary *v34;
  const void *v35;
  void *v36;
  void *v38;
  id v39;
  _BYTE buf[12];
  __int16 v41;
  void *v42;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  secretAttributes = self->_secretAttributes;
  if (secretAttributes)
    goto LABEL_15;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData wrappedKey](self->_encryptedSecretData, "wrappedKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:](self, "unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:", v15, a4, v12, v13, 0, v8, a7));

  if (!v16)
  {
LABEL_14:

    secretAttributes = self->_secretAttributes;
LABEL_15:
    v34 = secretAttributes;
    goto LABEL_16;
  }
  v17 = objc_msgSend((id)objc_opt_class(self), "decryptionOperation");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData ciphertext](self->_encryptedSecretData, "ciphertext"));
  v39 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "decrypt:withKey:error:", v19, v16, &v39));
  v21 = v39;

  if (v20)
  {
    v38 = v21;
    v22 = objc_retainAutorelease(v20);
    v23 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subdataWithRange:", 0, (char *)objc_msgSend(v22, "length")- *((char *)objc_msgSend(v22, "length") + (_QWORD)objc_msgSend(v22, "bytes") - 1)));
    v24 = sub_100016534(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v25, "mutableCopy");

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("TamperCheck")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData tamperCheck](self->_encryptedSecretData, "tamperCheck"));
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if (v29)
    {
      objc_msgSend(v26, "removeObjectForKey:", CFSTR("TamperCheck"));
      v30 = (NSDictionary *)v26;
      v31 = self->_secretAttributes;
      self->_secretAttributes = v30;
    }
    else
    {
      v35 = sub_10000EF14("SecError");
      v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_DEFAULT))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v27;
        v41 = 2112;
        v42 = v36;
        _os_log_impl((void *)&_mh_execute_header, &v31->super, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: tamper check failed for secret data decryption, expected %@ found %@", buf, 0x16u);

      }
    }

    goto LABEL_14;
  }
  v32 = sub_10000EF14("SecError");
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error decrypting item secret data contents: %@", buf, 0xCu);
  }

  if (a7)
  {
    *(_QWORD *)buf = v21;
    sub_100019F20(-26275, (__CFString **)buf, CFSTR("error decrypting item secret data contents"));
    *a7 = *(id *)buf;
  }

  v34 = 0;
LABEL_16:

  return v34;
}

- (id)metadataAttributesWithError:(id *)a3
{
  NSDictionary *metadataAttributes;
  NSDictionary **p_metadataAttributes;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  const __CFData *v20;
  id v21;
  const __CFData *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  const void *v29;
  NSObject *v30;
  unsigned int v31;
  int keybag;
  int v33;
  const void *v34;
  NSObject *v35;
  const void *v36;
  NSObject *v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  _BYTE buf[14];
  _BYTE v45[10];

  p_metadataAttributes = &self->_metadataAttributes;
  metadataAttributes = self->_metadataAttributes;
  if (!metadataAttributes)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 metadataClassKeyWithKeybag:allowWrites:error:](self, "metadataClassKeyWithKeybag:allowWrites:error:", self->_keybag, 0, a3));
    if (v7)
    {
      v8 = objc_msgSend((id)objc_opt_class(self), "decryptionOperation");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata wrappedKey](self->_encryptedMetadata, "wrappedKey"));
      v43 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "decrypt:withKey:error:", v10, v7, &v43));
      v12 = v43;

      if (!v11)
      {
        v29 = sub_10000EF14("SecError");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = -[SecDbKeychainItemV7 keyclass](self, "keyclass");
          keybag = self->_keybag;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v31;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = keybag;
          *(_WORD *)v45 = 2112;
          *(_QWORD *)&v45[2] = v12;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error unwrapping item metadata key (class %d, bag %d): %@", buf, 0x18u);
        }

        if (a3)
        {
          *(_QWORD *)buf = v12;
          sub_100019F20(-26275, (__CFString **)buf, CFSTR("failed to unwrap item metadata key"));
          *a3 = *(id *)buf;
        }

        goto LABEL_26;
      }
      v13 = objc_alloc((Class)_SFAESKey);
      v14 = objc_msgSend((id)objc_opt_class(self), "keySpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v13, "initWithData:specifier:error:", v11, v15, a3);

      if (v16)
      {
        v41 = v11;
        v17 = objc_msgSend((id)objc_opt_class(self), "decryptionOperation");
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata ciphertext](self->_encryptedMetadata, "ciphertext"));
        v42 = v12;
        v20 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "decrypt:withKey:error:", v19, v16, &v42));
        v21 = v42;

        if (v20)
        {
          v40 = v21;
          v22 = v20;
          v23 = sub_100016534(v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = objc_msgSend(v24, "mutableCopy");

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TamperCheck")));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
          v28 = objc_msgSend(v26, "isEqualToString:", v27);

          if (v28)
          {
            objc_msgSend(v25, "removeObjectForKey:", CFSTR("TamperCheck"));
            objc_storeStrong((id *)p_metadataAttributes, v25);
          }
          else
          {
            v36 = sub_10000EF14("SecError");
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](self->_encryptedMetadata, "tamperCheck"));
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v26;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)v45 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: tamper check failed for metadata decryption, expected %@ found %@", buf, 0x16u);

            }
            if (a3)
            {
              *(_QWORD *)buf = 0;
              sub_100019F20(-26275, (__CFString **)buf, CFSTR("tamper check failed for metadata decryption"));
              *a3 = *(id *)buf;
            }
          }

          v33 = 0;
          v21 = v40;
          v20 = v22;
        }
        else
        {
          v34 = sub_10000EF14("SecError");
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v21;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error decrypting metadata content: %@", buf, 0xCu);
          }

          if (a3)
          {
            *(_QWORD *)buf = v21;
            sub_100019F20(-26275, (__CFString **)buf, CFSTR("failed to decrypt item metadata contents"));
            *a3 = *(id *)buf;
          }
          v33 = 1;
        }

        v11 = v41;
      }
      else
      {
        v33 = 1;
        v21 = v12;
      }

      if (v33)
      {
LABEL_26:

        return 0;
      }
    }

    metadataAttributes = *p_metadataAttributes;
  }
  return metadataAttributes;
}

+ (id)decryptionOperation
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113DD8;
  block[3] = &unk_1002ED1A0;
  block[4] = a1;
  if (qword_100341138 != -1)
    dispatch_once(&qword_100341138, block);
  return (id)qword_100341130;
}

- (id)metadataClassKeyWithKeybag:(int)a3 allowWrites:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v7;
  void *v9;
  uint64_t keyclass;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SecDbKeychainMetadataKeyStore sharedStore](SecDbKeychainMetadataKeyStore, "sharedStore"));
  keyclass = self->_keyclass;
  v11 = objc_msgSend((id)objc_opt_class(self), "keySpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyForKeyclass:keybag:keySpecifier:allowWrites:error:", keyclass, v7, v12, v6, a5));

  return v13;
}

+ (id)keySpecifier
{
  if (qword_100341118 != -1)
    dispatch_once(&qword_100341118, &stru_1002DE570);
  return (id)qword_100341110;
}

- (SecDbKeychainItemV7)initWithData:(id)a3 decryptionKeybag:(int)a4 error:(id *)a5
{
  id v8;
  SecDbKeychainItemV7 *v9;
  SecDbKeychainSerializedItemV7 *v10;
  const void *v11;
  NSObject *v12;
  id v13;
  SecDbKeychainSecretData *v14;
  void *v15;
  SecDbKeychainSecretData *v16;
  SecDbKeychainSecretData *encryptedSecretData;
  SecDbKeychainMetadata *v18;
  void *v19;
  SecDbKeychainMetadata *v20;
  SecDbKeychainMetadata *encryptedMetadata;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  objc_super v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;

  v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SecDbKeychainItemV7;
  v9 = -[SecDbKeychainItemV7 init](&v27, "init");
  if (v9)
  {
    v10 = -[SecDbKeychainSerializedItemV7 initWithData:]([SecDbKeychainSerializedItemV7 alloc], "initWithData:", v8);
    if (!v10)
      goto LABEL_8;
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x959A)
    {
      v11 = sub_10000EF14("SecWarning");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v8, "length");
        *(_DWORD *)buf = 134217984;
        v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: serialized item exceeds reasonable size (%lu bytes)", buf, 0xCu);
      }

    }
    v9->_keybag = a4;
    v14 = [SecDbKeychainSecretData alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 encryptedSecretData](v10, "encryptedSecretData"));
    v16 = -[SecDbKeychainSecretData initWithData:](v14, "initWithData:", v15);
    encryptedSecretData = v9->_encryptedSecretData;
    v9->_encryptedSecretData = v16;

    v18 = [SecDbKeychainMetadata alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 encryptedMetadata](v10, "encryptedMetadata"));
    v20 = -[SecDbKeychainMetadata initWithData:](v18, "initWithData:", v19);
    encryptedMetadata = v9->_encryptedMetadata;
    v9->_encryptedMetadata = v20;

    v9->_keyclass = -[SecDbKeychainSerializedItemV7 keyclass](v10, "keyclass");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData tamperCheck](v9->_encryptedSecretData, "tamperCheck"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainMetadata tamperCheck](v9->_encryptedMetadata, "tamperCheck"));
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v24 & 1) == 0)
    {
LABEL_8:

      v9 = 0;
    }

  }
  if (a5 && !v9)
  {
    v28 = NSLocalizedDescriptionKey;
    v29 = CFSTR("failed to deserialize keychain item blob");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainOSStatus, -26275, v25));

  }
  return v9;
}

- (id)unwrapFromAKS:(id)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 callerAccessGroups:(id)a6 delete:(BOOL)a7 keyDiversify:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v9;
  id *v15;
  id v16;
  id v17;
  __CFString *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  const void *v23;
  NSObject *v24;
  BOOL v25;
  id v26;
  void *v27;
  uint64_t v28;
  int keybag;
  id v30;
  id v31;
  void *v32;
  int v33;
  id v34;
  const UInt8 *v35;
  const __CFDictionary *v36;
  const void *Value;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  UInt8 *v43;
  id v44;
  id v45;
  UInt8 *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void **v52;
  void **v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  __CFString **v61;
  CFBooleanRef v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  const void *v71;
  __CFString *v72;
  __CFString *v73;
  const void *v74;
  __CFString *v75;
  __CFString *v76;
  __CFString **v77;
  __CFString *v78;
  __CFString *v79;
  __SecAccessControl *v81;
  uint64_t v82;
  __CFString **v83;
  BOOL v84;
  SecDbKeychainItemV7 *v85;
  id v86;
  id v87;
  id v88;
  CFBooleanRef v89;
  size_t v90;
  void *v91;
  void **v92;
  uint64_t v93;
  void *v94;
  CFDictionaryRef theDict;
  uint64_t v96;
  __CFString *v97;
  _BYTE buf[12];

  v9 = a8;
  v15 = a9;
  v16 = a3;
  v17 = a5;
  v18 = (__CFString *)a6;
  v88 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "wrappedKey"));
  if (v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metadataAttributes, "objectForKeyedSubscript:", kSecAttrMultiUser));
    if (sub_100018CF8((const __CFData *)v19))
    {
      v87 = v16;
      v84 = a7;
      v20 = objc_retainAutorelease(v19);
      v21 = objc_msgSend(v20, "bytes");
      v22 = objc_msgSend(v20, "length");
      v23 = sub_10000EF14("KeyDiversify");
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "unwrapFromAKS: Key diversification feature persona(musr) %@ is data separated", buf, 0xCu);
      }

      v15 = a9;
      v25 = v84;
      v26 = v21;
      v16 = v87;
    }
    else
    {
      v25 = a7;
      v22 = 0;
      v26 = 0;
    }

  }
  else
  {
    v25 = a7;
    v22 = 0;
    v26 = 0;
  }
  if (objc_msgSend(v16, "type"))
  {
    if (objc_msgSend(v16, "type") != 1)
    {
      v34 = 0;
LABEL_69:
      v48 = v88;
      goto LABEL_70;
    }
    v82 = (uint64_t)v22;
    v83 = (__CFString **)v15;
    v27 = v16;
    v28 = (uint64_t)v26;
    *(_QWORD *)buf = 0;
    keybag = self->_keybag;
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refKeyBlob")));
    v31 = objc_msgSend(v30, "bytes");
    v86 = v17;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "refKeyBlob"));
    v33 = sub_100024528(keybag, v31, (size_t)objc_msgSend(v32, "length"), (uint64_t *)buf);

    v17 = v86;
    v34 = 0;
    if (!v33)
    {
      v96 = 0;
      v97 = 0;
      v35 = (const UInt8 *)sub_100025304(*(uint64_t *)buf, &v96);
      if (v35)
      {
        theDict = 0;
        sub_100020974(0, &theDict, (CFTypeRef *)&v97, v35, (uint64_t)&v35[v96]);
        v36 = theDict;
        if (!theDict)
          sub_100019F20(-26275, &v97, CFSTR("SecDbKeychainItemV7: failed to decode acl dict"));
        Value = CFDictionaryGetValue(v36, CFSTR("acl"));
        v81 = a4;
        SecAccessControlSetConstraints(a4, Value);
        if (v18)
        {
          v41 = sub_1000212A4(v18, (CFTypeRef *)&v97, v38, v39, v40);
          v42 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", v41));
          v43 = (UInt8 *)objc_msgSend(v42, "mutableBytes");
          v44 = objc_retainAutorelease(v42);
          v45 = objc_msgSend(v44, "mutableBytes");
          v46 = v43;
          v17 = v86;
          sub_100020FA0(v18, (CFTypeRef *)&v97, 0, v46, (unint64_t)v45 + v41);
        }
        else
        {
          v41 = 0;
          v44 = 0;
        }
        v93 = 0;
        v94 = 0;
        v52 = (void **)sub_100023D74(0, 0);
        v92 = v52;
        if (!v52)
        {
          sub_100024478((uint64_t *)buf);
          v34 = 0;
LABEL_67:

          goto LABEL_68;
        }
        v53 = v52;
        v85 = self;
        if (v28)
        {
          sub_100023F74(v52, 15, v28, v82);
          v53 = v92;
        }
        sub_100023F74(v53, 1, (uint64_t)objc_msgSend(objc_retainAutorelease(v44), "bytes"), v41);
        v54 = objc_retainAutorelease(v17);
        sub_100023F74(v92, 3, (uint64_t)objc_msgSend(v54, "bytes"), (int)objc_msgSend(v54, "length"));
        sub_10002406C(v92, &v94, (size_t *)&v93);
        v90 = 0;
        v91 = 0;
        v55 = *(_QWORD *)buf;
        v57 = v93;
        v56 = v94;
        v58 = objc_retainAutorelease(v88);
        v59 = sub_1000245EC(v55, (uint64_t)v56, v57, objc_msgSend(v58, "bytes"), (size_t)objc_msgSend(v58, "length"), &v91, &v90);
        if ((_DWORD)v59)
        {
          v60 = v59;
          v61 = v83;
          if (v54 || (_DWORD)v59 != -536363000)
          {
            v74 = (const void *)SecAccessControlCopyData(v81);
            sub_1001468B0(v60, CFSTR("od"), 0, 0, (uint64_t)v74, (const __CFData *)v54, &v97);
            v17 = v86;
            if (v74)
              CFRelease(v74);
            sub_100024478((uint64_t *)buf);
            free(v94);
            v94 = 0;
            sub_100024070(&v92);
            v75 = v97;
            if (v83)
              goto LABEL_50;
            goto LABEL_45;
          }
          sub_100146644((CFErrorRef *)&v97, 0);
LABEL_49:
          sub_100024478((uint64_t *)buf);
          free(v94);
          v94 = 0;
          sub_100024070(&v92);
          v75 = v97;
          v17 = v86;
          if (v61)
          {
LABEL_50:
            v76 = v75;
            v77 = v61;
            v34 = 0;
            *v77 = v76;
            v97 = 0;
LABEL_66:
            v36 = theDict;
            goto LABEL_67;
          }
LABEL_45:
          if (v75)
          {
            v97 = 0;
            CFRelease(v75);
          }
          v34 = 0;
          goto LABEL_66;
        }
        v61 = v83;
        if (!v91)
        {
          sub_100019F20(-26275, &v97, CFSTR("SecDbKeychainItemV7: failed to decrypt item, Item can't be decrypted due to failed decode der, so drop the item."));
          goto LABEL_49;
        }
        v89 = 0;
        sub_100020974(0, &v89, (CFTypeRef *)&v97, (const UInt8 *)v91, (uint64_t)v91 + v90);
        v62 = v89;
        v63 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v62, v63) & 1) != 0)
        {
          v64 = v44;
          v65 = objc_alloc((Class)_SFAESKey);
          v66 = objc_msgSend((id)objc_opt_class(v85), "keySpecifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
          v68 = objc_msgSend(v65, "initWithData:specifier:error:", v62, v67, v83);

          if (v62)
            CFRelease(v62);
          if (!v25 || (v69 = sub_10002487C(*(uint64_t *)buf, (uint64_t)v94, v93), !(_DWORD)v69))
          {
            v79 = v97;
            v17 = v86;
            if (v83)
            {
              *v83 = v97;
              v97 = 0;
            }
            else if (v97)
            {
              v97 = 0;
              CFRelease(v79);
            }
            sub_100024478((uint64_t *)buf);
            free(v94);
            v94 = 0;
            free(v91);
            v91 = 0;
            sub_100024070(&v92);
            v68 = v68;
            v34 = v68;
            goto LABEL_65;
          }
          v70 = v69;
          v71 = (const void *)SecAccessControlCopyData(v81);
          sub_1001468B0(v70, CFSTR("odel"), 0, 0, (uint64_t)v71, (const __CFData *)v54, &v97);
          v17 = v86;
          if (v71)
            CFRelease(v71);
          sub_100024478((uint64_t *)buf);
          free(v94);
          v94 = 0;
          free(v91);
          v91 = 0;
          sub_100024070(&v92);
          v72 = v97;
          if (v83)
          {
            v73 = v97;
LABEL_55:
            v34 = 0;
            *v83 = v73;
            v97 = 0;
LABEL_65:

            v44 = v64;
            goto LABEL_66;
          }
          if (v97)
          {
            v97 = 0;
            CFRelease(v72);
          }
        }
        else
        {
          sub_100019F20(-26275, &v97, CFSTR("SecDbKeychainItemV7: failed to decrypt item, Item can't be decrypted due to failed decode der, so drop the item."));
          v17 = v86;
          if (v62)
            CFRelease(v62);
          sub_100024478((uint64_t *)buf);
          free(v94);
          v94 = 0;
          free(v91);
          v91 = 0;
          sub_100024070(&v92);
          v78 = v97;
          v64 = v44;
          if (v83)
          {
            v73 = v97;
            v68 = 0;
            goto LABEL_55;
          }
          if (v97)
          {
            v97 = 0;
            CFRelease(v78);
          }
          v68 = 0;
        }
        v34 = 0;
        goto LABEL_65;
      }
      sub_100024478((uint64_t *)buf);
      v34 = 0;
    }
LABEL_68:
    v16 = v27;
    goto LABEL_69;
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 32));
  v48 = v88;
  if (+[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:", self->_keybag, self->_keyclass, v88, &self->_keyclass, v47, v26, v22, v15))
  {
    v49 = objc_alloc((Class)_SFAESKey);
    v50 = objc_msgSend((id)objc_opt_class(self), "keySpecifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v34 = objc_msgSend(v49, "initWithData:specifier:error:", v47, v51, v15);

  }
  else
  {
    v34 = 0;
  }

LABEL_70:
  return v34;
}

- (SecDbKeychainItemV7)initWithSecretAttributes:(id)a3 metadataAttributes:(id)a4 tamperCheck:(id)a5 keyclass:(int)a6
{
  id v11;
  id v12;
  id v13;
  SecDbKeychainItemV7 *v14;
  NSDictionary *v15;
  NSDictionary *secretAttributes;
  NSDictionary *v17;
  NSDictionary *metadataAttributes;
  NSString *v19;
  NSString *tamperCheck;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SecDbKeychainItemV7.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tamperCheck"));

  }
  v23.receiver = self;
  v23.super_class = (Class)SecDbKeychainItemV7;
  v14 = -[SecDbKeychainItemV7 init](&v23, "init");
  if (v14)
  {
    if (v11)
      v15 = (NSDictionary *)objc_msgSend(v11, "copy");
    else
      v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    secretAttributes = v14->_secretAttributes;
    v14->_secretAttributes = v15;

    if (v12)
      v17 = (NSDictionary *)objc_msgSend(v12, "copy");
    else
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    metadataAttributes = v14->_metadataAttributes;
    v14->_metadataAttributes = v17;

    v19 = (NSString *)objc_msgSend(v13, "copy");
    tamperCheck = v14->_tamperCheck;
    v14->_tamperCheck = v19;

    v14->_keyclass = a6;
  }

  return v14;
}

- (BOOL)encryptMetadataWithKeybag:(int)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFData *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SecDbKeychainMetadata *v25;
  SecDbKeychainMetadata *encryptedMetadata;
  BOOL v27;
  int v29;
  id v30;
  __int16 v31;
  void *v32;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc((Class)_SFAESKey);
  v8 = objc_msgSend((id)objc_opt_class(self), "keySpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initRandomKeyWithSpecifier:error:", v9, a4);

  if (v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(self), "encryptionOperation");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (__CFString *)-[NSDictionary mutableCopy](self->_metadataAttributes, "mutableCopy");
    -[__CFString setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", self->_tamperCheck, CFSTR("TamperCheck"));
    v17 = sub_10001A474(v13, 0, v14, v15, v16);
    if ((unint64_t)-[__CFData length](v17, "length") >= 0x801)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metadataAttributes, "objectForKeyedSubscript:", kSecAttrAccessGroup));
      v19 = sub_10000EF14("SecWarning");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v29 = 134218242;
        v30 = -[__CFData length](v17, "length");
        v31 = 2112;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: item's metadata exceeds reasonable size (%lu bytes) (%@)", (uint8_t *)&v29, 0x16u);
      }

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encrypt:withKey:error:", v17, v10, a4));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 metadataClassKeyWithKeybag:allowWrites:error:](self, "metadataClassKeyWithKeybag:allowWrites:error:", v5, 1, a4));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyData"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "encrypt:withKey:error:", v23, v22, a4));

      v25 = -[SecDbKeychainMetadata initWithCiphertext:wrappedKey:tamperCheck:error:]([SecDbKeychainMetadata alloc], "initWithCiphertext:wrappedKey:tamperCheck:error:", v21, v24, self->_tamperCheck, a4);
      encryptedMetadata = self->_encryptedMetadata;
      self->_encryptedMetadata = v25;

    }
    v27 = self->_encryptedMetadata != 0;

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)encryptionOperation
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113E3C;
  block[3] = &unk_1002ED1A0;
  block[4] = a1;
  if (qword_100341128 != -1)
    dispatch_once(&qword_100341128, block);
  return (id)qword_100341120;
}

- (id)encryptedBlobWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  unsigned int v11;
  id v12;
  unsigned int v13;
  SecDbKeychainSerializedItemV7 *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v20 = 0;
  v11 = -[SecDbKeychainItemV7 encryptMetadataWithKeybag:error:](self, "encryptMetadataWithKeybag:error:", v8, &v20);
  v12 = v20;
  if (v11
    && self->_encryptedMetadata
    && !v12
    && (v19 = 0,
        v13 = -[SecDbKeychainItemV7 encryptSecretDataWithKeybag:accessControl:acmContext:error:](self, "encryptSecretDataWithKeybag:accessControl:acmContext:error:", v8, a4, v10, &v19), v12 = v19, v13)&& self->_encryptedSecretData&& !v12)
  {
    v14 = objc_alloc_init(SecDbKeychainSerializedItemV7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 encryptedMetadataBlob](self, "encryptedMetadataBlob"));
    -[SecDbKeychainSerializedItemV7 setEncryptedMetadata:](v14, "setEncryptedMetadata:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 encryptedSecretDataBlob](self, "encryptedSecretDataBlob"));
    -[SecDbKeychainSerializedItemV7 setEncryptedSecretData:](v14, "setEncryptedSecretData:", v16);

    -[SecDbKeychainSerializedItemV7 setKeyclass:](v14, "setKeyclass:", self->_keyclass);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedItemV7 data](v14, "data"));

    v12 = 0;
  }
  else if (a6)
  {
    v12 = objc_retainAutorelease(v12);
    v17 = 0;
    *a6 = v12;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)encryptedSecretDataBlob
{
  return -[SecDbKeychainSecretData serializedRepresentation](self->_encryptedSecretData, "serializedRepresentation");
}

- (id)encryptedMetadataBlob
{
  return -[SecDbKeychainMetadata serializedRepresentation](self->_encryptedMetadata, "serializedRepresentation");
}

- (BOOL)encryptSecretDataWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFData *v21;
  id v22;
  void *v23;
  const void *v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SecDbKeychainSecretData *v30;
  SecDbKeychainSecretData *encryptedSecretData;
  BOOL v32;
  __SecAccessControl *v34;
  _BYTE buf[22];

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = objc_alloc((Class)_SFAESKey);
  v12 = objc_msgSend((id)objc_opt_class(self), "keySpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v11, "initRandomKeyWithSpecifier:error:", v13, a6);

  if (v14)
  {
    v15 = objc_msgSend((id)objc_opt_class(self), "encryptionOperation");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (__CFString *)-[NSDictionary mutableCopy](self->_secretAttributes, "mutableCopy");
    -[__CFString setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", self->_tamperCheck, CFSTR("TamperCheck"));
    v21 = sub_10001A474(v17, 0, v18, v19, v20);
    v22 = -[__CFData mutableCopy](v21, "mutableCopy");

    if ((unint64_t)objc_msgSend(v22, "length") > 0x8000)
    {
      v34 = a4;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metadataAttributes, "objectForKeyedSubscript:", kSecAttrAccessGroup));
      v24 = sub_10000EF14("SecWarning");
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = objc_msgSend(v22, "length");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: item's secret data exceeds reasonable size (%lu bytes) (%@)", buf, 0x16u);
      }

      a4 = v34;
    }
    v26 = (unint64_t)objc_msgSend(v22, "length");
    v27 = (20 * (v26 / 0x14) - v26 + 20);
    *(_QWORD *)buf = 0x101010101010101 * v27;
    *(_QWORD *)&buf[8] = 0x101010101010101 * v27;
    *(_DWORD *)&buf[16] = 16843009 * v27;
    objc_msgSend(v22, "appendBytes:length:", buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "encrypt:withKey:error:", v22, v14, a6));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainItemV7 wrapToAKS:withKeybag:accessControl:acmContext:error:](self, "wrapToAKS:withKeybag:accessControl:acmContext:error:", v14, v8, a4, v10, a6));
    v30 = -[SecDbKeychainSecretData initWithCiphertext:wrappedKey:tamperCheck:error:]([SecDbKeychainSecretData alloc], "initWithCiphertext:wrappedKey:tamperCheck:error:", v28, v29, self->_tamperCheck, a6);
    encryptedSecretData = self->_encryptedSecretData;
    self->_encryptedSecretData = v30;

    v32 = self->_encryptedSecretData != 0;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)wrapToAKS:(id)a3 withKeybag:(int)a4 accessControl:(__SecAccessControl *)a5 acmContext:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;
  uint64_t Constraints;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const void *v20;
  NSObject *v21;
  NSDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFData *v26;
  void **v27;
  void **v28;
  __CFData *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  id v34;
  id v35;
  id v36;
  const void *v37;
  NSObject *v38;
  const void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v58;
  uint64_t v59;
  size_t v60;
  void **v61;
  uint64_t v62;
  uint8_t buf[8];
  id v64;
  const __CFString *v65;
  void *v66;
  _BYTE v67[12];

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "keyData"));
  Constraints = SecAccessControlGetConstraints(a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(Constraints);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metadataAttributes, "objectForKeyedSubscript:", kSecAttrMultiUser));
  if (sub_100018CF8((const __CFData *)v14))
  {
    v15 = v11;
    v16 = v10;
    v17 = objc_retainAutorelease(v14);
    v18 = objc_msgSend(v17, "bytes");
    v19 = objc_msgSend(v17, "length");
    v20 = sub_10000EF14("KeyDiversify");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v67 = 138412290;
      *(_QWORD *)&v67[4] = v17;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "wrapToAKS: Key diversification feature persona(musr) %@ is data separated", v67, 0xCu);
    }

    v10 = v16;
    v11 = v15;
    if (v13)
    {
LABEL_5:
      *(_QWORD *)v67 = 0;
      v64 = 0;
      v65 = CFSTR("acl");
      v66 = v13;
      v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v26 = sub_10001A474((const __CFString *)v22, (CFTypeRef *)&v64, v23, v24, v25);
      if (v10 && (SecAccessControlIsBound(a5) & 1) != 0)
      {
        v55 = v10;
        v62 = 0;
        *(_QWORD *)buf = 0;
        v27 = (void **)sub_100023D74(0, 0);
        v61 = v27;
        if (!v27)
        {
          v36 = 0;
LABEL_42:
          v10 = v55;
          goto LABEL_43;
        }
        v28 = v27;
        if (v18)
          sub_100023F74(v27, 15, (uint64_t)v18, (uint64_t)v19);
        v29 = objc_retainAutorelease(v26);
        sub_100023F74(v28, 2, (uint64_t)-[__CFData bytes](v29, "bytes"), (uint64_t)-[__CFData length](v29, "length"));
        v30 = objc_retainAutorelease(v55);
        sub_100023F74(v28, 3, (uint64_t)objc_msgSend(v30, "bytes"), (int)objc_msgSend(v30, "length"));
        sub_10002406C(v28, buf, (size_t *)&v62);
        v31 = sub_1000240CC(a4, self->_keyclass, 0, *(uint64_t *)buf, v62, (void ***)v67);
        if ((_DWORD)v31)
        {
          v32 = v31;
          v33 = (const void *)SecAccessControlCopyData(a5);
          sub_1001468B0(v32, CFSTR("oe"), a4, self->_keyclass, (uint64_t)v33, (const __CFData *)v30, (__CFString **)&v64);
          if (v33)
            CFRelease(v33);
          free(*(void **)buf);
          *(_QWORD *)buf = 0;
        }
        else
        {
          v59 = 0;
          v60 = 0;
          v41 = v62;
          v53 = *(_QWORD *)buf;
          v54 = *(_QWORD *)v67;
          v42 = objc_retainAutorelease(v11);
          v43 = sub_1000242F8(v54, v53, v41, (uint64_t)objc_msgSend(v42, "bytes"), (uint64_t)objc_msgSend(v42, "length"), &v59, &v60);
          if (!(_DWORD)v43)
          {
            free(*(void **)buf);
            *(_QWORD *)buf = 0;
            v46 = v64;
            if (a7)
            {
              *a7 = v64;
              v64 = 0;
            }
            else if (v64)
            {
              v64 = 0;
              CFRelease(v46);
            }
            v47 = objc_alloc((Class)NSData);
            v48 = objc_msgSend(v47, "initWithBytesNoCopy:length:", v59, v60);
            v58 = 0;
            v49 = sub_1000252F8(*(uint64_t **)v67, &v58);
            v50 = objc_alloc((Class)NSData);
            v51 = objc_msgSend(v50, "initWithBytes:length:", v49, v58);
            sub_100024070(&v61);
            sub_100024478((uint64_t *)v67);
            v36 = -[SecDbKeychainAKSWrappedKey initRefKeyWrappedKeyWithData:refKeyBlob:]([SecDbKeychainAKSWrappedKey alloc], "initRefKeyWrappedKeyWithData:refKeyBlob:", v48, v51);

            goto LABEL_42;
          }
          v44 = v43;
          v45 = (const void *)SecAccessControlCopyData(a5);
          sub_1001468B0(v44, CFSTR("oe"), a4, self->_keyclass, (uint64_t)v45, (const __CFData *)v30, (__CFString **)&v64);
          if (v45)
            CFRelease(v45);
          free(*(void **)buf);
          *(_QWORD *)buf = 0;
          sub_100024478((uint64_t *)v67);
        }
        sub_100024070(&v61);
        v40 = v64;
        if (a7)
        {
          v36 = 0;
          *a7 = v64;
          v64 = 0;
          goto LABEL_42;
        }
        v10 = v55;
        if (!v64)
        {
LABEL_27:
          v36 = 0;
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {
        v37 = sub_10000EF14("SecError");
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: access control error", buf, 2u);
        }

        if (a7)
        {
          v39 = (const void *)SecAccessControlCopyData(a5);
          SecAccessControlIsBound(a5);
          sub_100146644((CFErrorRef *)&v64, (uint64_t)v39);
          if (v39)
            CFRelease(v39);
          v36 = 0;
          *a7 = v64;
          v64 = 0;
          goto LABEL_43;
        }
        v40 = v64;
        if (!v64)
          goto LABEL_27;
      }
      v64 = 0;
      CFRelease(v40);
      goto LABEL_27;
    }
  }
  else
  {
    v19 = 0;
    v18 = 0;
    if (v13)
      goto LABEL_5;
  }
  v34 = v10;
  v35 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 40);
  if (+[SecAKSObjCWrappers aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:", a4, self->_keyclass, v11, &self->_keyclass, v35, v18, v19, a7))
  {
    v36 = -[SecDbKeychainAKSWrappedKey initRegularWrappedKeyWithData:]([SecDbKeychainAKSWrappedKey alloc], "initRegularWrappedKeyWithData:", v35);
  }
  else
  {
    v36 = 0;
  }

  v10 = v34;
LABEL_44:

  return v36;
}

- (BOOL)deleteWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  const void *v18;
  NSObject *v19;
  uint8_t buf[8];
  id v22;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  if ((const CFBooleanRef)SecAccessControlGetConstraint(a4, CFSTR("odel")) == kCFBooleanTrue)
  {
    v17 = 0;
    v15 = 1;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSecretData wrappedKey](self->_encryptedSecretData, "wrappedKey"));
    v22 = 0;
    v15 = 1;
    v16 = -[SecDbKeychainItemV7 unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:](self, "unwrapFromAKS:accessControl:acmContext:callerAccessGroups:delete:keyDiversify:error:", v14, a4, v12, v13, 1, v8, &v22);
    v17 = v22;

    if (v17)
    {
      v18 = sub_10000EF14("SecError");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: failed to delete item secret key from aks", buf, 2u);
      }

      if (a7)
      {
        v17 = objc_retainAutorelease(v17);
        v15 = 0;
        *a7 = v17;
      }
      else
      {
        v15 = 0;
      }
    }
  }

  return v15;
}

- (int)keyclass
{
  return self->_keyclass;
}

@end
