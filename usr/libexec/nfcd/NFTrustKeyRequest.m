@implementation NFTrustKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKeyRequest)initWithCoder:(id)a3
{
  id v4;
  NFTrustKeyRequest *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFTrustKeyRequest;
  v5 = -[NFTrustObject initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v6 = +[NFNSCheckedDecoder coder:decodeArrayOfArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfArrayOfClass:forKey:", v4, objc_opt_class(NFTrustLocalValidation), CFSTR("localValidations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("localValidations"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterLimit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("counterLimit"));

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("subjectIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("subjectIdentifier"));

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("discretionaryData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NFTrustKeyRequest setValue:forKey:](v5, "setValue:forKey:", v13, CFSTR("discretionaryData"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKeyRequest localValidations](self, "localValidations"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localValidations"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKeyRequest counterLimit](self, "counterLimit"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("counterLimit"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKeyRequest subjectIdentifier](self, "subjectIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subjectIdentifier"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustKeyRequest discretionaryData](self, "discretionaryData"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("discretionaryData"));

}

+ (id)keyRequestWithSubjectIdentifier:(id)a3 discretionaryData:(id)a4 localValidations:(id)a5 counterLimit:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  NFTrustKeyRequest *v20;
  NFTrustKeyRequest *v21;
  void *specific;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  int v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, ...);
  objc_class *v37;
  _BOOL4 v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  objc_class *v44;
  int v45;
  const char *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  void (*v50)(uint64_t, const char *, ...);
  objc_class *v51;
  _BOOL4 v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  objc_class *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, ...);
  objc_class *v62;
  _BOOL4 v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  objc_class *v68;
  int v69;
  const char *v70;
  const char *v71;
  const char *Name;
  const char *v74;
  const char *v75;
  const char *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  int v89;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier", v28, ClassName, Name, 272);
    }
    v29 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v30 = NFSharedLogGetLogger(v29);
    v15 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v31 = object_getClass(a1);
    if (class_isMetaClass(v31))
      v32 = 43;
    else
      v32 = 45;
    *(_DWORD *)buf = 67109890;
    v83 = v32;
    v84 = 2082;
    v85 = object_getClassName(a1);
    v86 = 2082;
    v87 = sel_getName(a2);
    v88 = 1024;
    v89 = 272;
    v33 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier";
    goto LABEL_54;
  }
  if (v13)
  {
    if (!objc_msgSend(v13, "count"))
    {
      v48 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v49 = NFLogGetLogger(v48);
      if (v49)
      {
        v50 = (void (*)(uint64_t, const char *, ...))v49;
        v51 = object_getClass(a1);
        v52 = class_isMetaClass(v51);
        v53 = object_getClassName(a1);
        v75 = sel_getName(a2);
        v54 = 45;
        if (v52)
          v54 = 43;
        v50(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation", v54, v53, v75, 279);
      }
      v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v56 = NFSharedLogGetLogger(v55);
      v15 = objc_claimAutoreleasedReturnValue(v56);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      v57 = object_getClass(a1);
      if (class_isMetaClass(v57))
        v58 = 43;
      else
        v58 = 45;
      *(_DWORD *)buf = 67109890;
      v83 = v58;
      v84 = 2082;
      v85 = object_getClassName(a1);
      v86 = 2082;
      v87 = sel_getName(a2);
      v88 = 1024;
      v89 = 279;
      v33 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation";
      goto LABEL_54;
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v78;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v78 != v18)
            objc_enumerationMutation(v15);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i), "count"))
          {
            v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v35 = NFLogGetLogger(v34);
            if (v35)
            {
              v36 = (void (*)(uint64_t, const char *, ...))v35;
              v37 = object_getClass(a1);
              v38 = class_isMetaClass(v37);
              v39 = object_getClassName(a1);
              v74 = sel_getName(a2);
              v40 = 45;
              if (v38)
                v40 = 43;
              v36(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", v40, v39, v74, 285, (_QWORD)v77);
            }
            v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v42 = NFSharedLogGetLogger(v41);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v44 = object_getClass(a1);
              if (class_isMetaClass(v44))
                v45 = 43;
              else
                v45 = 45;
              v46 = object_getClassName(a1);
              v47 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v83 = v45;
              v84 = 2082;
              v85 = v46;
              v86 = 2082;
              v87 = v47;
              v88 = 1024;
              v89 = 285;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", buf, 0x22u);
            }

            goto LABEL_55;
          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
        if (v17)
          continue;
        break;
      }
    }

  }
  if (v14 && !objc_msgSend(v14, "unsignedIntegerValue"))
  {
    v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v60 = NFLogGetLogger(v59);
    if (v60)
    {
      v61 = (void (*)(uint64_t, const char *, ...))v60;
      v62 = object_getClass(a1);
      v63 = class_isMetaClass(v62);
      v64 = object_getClassName(a1);
      v76 = sel_getName(a2);
      v65 = 45;
      if (v63)
        v65 = 43;
      v61(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0", v65, v64, v76, 294, (_QWORD)v77);
    }
    v66 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v67 = NFSharedLogGetLogger(v66);
    v15 = objc_claimAutoreleasedReturnValue(v67);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v68 = object_getClass(a1);
    if (class_isMetaClass(v68))
      v69 = 43;
    else
      v69 = 45;
    v70 = object_getClassName(a1);
    v71 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v83 = v69;
    v84 = 2082;
    v85 = v70;
    v86 = 2082;
    v87 = v71;
    v88 = 1024;
    v89 = 294;
    v33 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0";
LABEL_54:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v33, buf, 0x22u);
LABEL_55:

    v21 = 0;
    goto LABEL_56;
  }
  v20 = [NFTrustKeyRequest alloc];
  v21 = v20;
  if (v20)
  {
    -[NFTrustKeyRequest setDiscretionaryData:](v20, "setDiscretionaryData:", v12);
    -[NFTrustKeyRequest setSubjectIdentifier:](v21, "setSubjectIdentifier:", v11);
    -[NFTrustKeyRequest setLocalValidations:](v21, "setLocalValidations:", v13);
    -[NFTrustKeyRequest setCounterLimit:](v21, "setCounterLimit:", v14);
  }
LABEL_56:

  return v21;
}

- (NSData)subjectIdentifier
{
  return self->_subjectIdentifier;
}

- (void)setSubjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subjectIdentifier, a3);
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (void)setDiscretionaryData:(id)a3
{
  objc_storeStrong((id *)&self->_discretionaryData, a3);
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
  objc_storeStrong((id *)&self->_localValidations, a3);
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
  objc_storeStrong((id *)&self->_counterLimit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);
  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
}

@end
