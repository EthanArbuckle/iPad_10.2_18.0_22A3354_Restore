@implementation NFTrustSignRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustSignRequest)initWithCoder:(id)a3
{
  id v4;
  NFTrustSignRequest *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFTrustSignRequest;
  v5 = -[NFTrustObject initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("challenge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustSignRequest setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("challenge"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("data"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustSignRequest setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("data"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustSignRequest challenge](self, "challenge"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("challenge"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustSignRequest data](self, "data"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("data"));

}

+ (id)signRequestWithChallenge:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  objc_class *v27;
  _BOOL4 v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  objc_class *v33;
  int v34;
  const char *Name;
  const char *v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge", v17, ClassName, Name, 344);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v21 = object_getClass(a1);
    if (class_isMetaClass(v21))
      v22 = 43;
    else
      v22 = 45;
    *(_DWORD *)buf = 67109890;
    v39 = v22;
    v40 = 2082;
    v41 = object_getClassName(a1);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 344;
    v23 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge";
    goto LABEL_25;
  }
  if (objc_msgSend(v7, "length") != (id)8)
  {
    v24 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFLogGetLogger(v24);
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = object_getClass(a1);
      v28 = class_isMetaClass(v27);
      v29 = object_getClassName(a1);
      v37 = sel_getName(a2);
      v30 = 45;
      if (v28)
        v30 = 43;
      v26(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08", v30, v29, v37, 349);
    }
    v31 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v32 = NFSharedLogGetLogger(v31);
    v20 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v33 = object_getClass(a1);
    if (class_isMetaClass(v33))
      v34 = 43;
    else
      v34 = 45;
    *(_DWORD *)buf = 67109890;
    v39 = v34;
    v40 = 2082;
    v41 = object_getClassName(a1);
    v42 = 2082;
    v43 = sel_getName(a2);
    v44 = 1024;
    v45 = 349;
    v23 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x22u);
LABEL_26:

    v10 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  v9 = objc_alloc((Class)a1);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setChallenge:", v7);
    objc_msgSend(v10, "setData:", v8);
  }
LABEL_27:

  return v10;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
