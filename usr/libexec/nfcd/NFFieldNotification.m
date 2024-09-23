@implementation NFFieldNotification

- (unsigned)typeFSystemCode
{
  return self->_typeFSystemCode;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (void)setCachedBeforeRFReset:(BOOL)a3
{
  self->_cachedBeforeRFReset = a3;
}

- (unsigned)rfTechnology
{
  return self->_rfTechnology;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (NFFieldNotification)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7
{
  id v13;
  NFFieldNotification *v14;
  NFFieldNotification *v15;
  NFFieldNotification *v16;
  objc_super v18;

  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NFFieldNotification;
  v14 = -[NFFieldNotification init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    v14->_notificationType = a3;
    v14->_rfTechnology = a4;
    v14->_typeFSystemCode = a5;
    objc_storeStrong((id *)&v14->_creationDate, a6);
    v15->_cachedBeforeRFReset = a7;
    v16 = v15;
  }

  return v15;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)cachedBeforeRFReset
{
  return self->_cachedBeforeRFReset;
}

- (id)_creationDateString
{
  NSDateFormatter *v3;
  void *v4;

  v3 = objc_opt_new(NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", self->_creationDate));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t rfTechnology;
  id v5;

  rfTechnology = self->_rfTechnology;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", rfTechnology, CFSTR("rfTechnology"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_typeFSystemCode, CFSTR("typeFSystemCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationType, CFSTR("notificationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cachedBeforeRFReset, CFSTR("cachedBeforeRFReset"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));

}

- (NFFieldNotification)initWithCoder:(id)a3
{
  id v4;
  NFFieldNotification *v5;
  id v6;
  uint64_t v7;
  NSDate *creationDate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFFieldNotification;
  v5 = -[NFFieldNotification init](&v10, "init");
  if (v5)
  {
    v5->_rfTechnology = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rfTechnology"));
    v5->_typeFSystemCode = (unsigned __int16)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeFSystemCode"));
    v5->_notificationType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationType"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("creationDate"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v7;

    v5->_cachedBeforeRFReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cachedBeforeRFReset"));
    v5->_category = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  }

  return v5;
}

+ (NFFieldNotification)notificationWithDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _BYTE *v8;
  _QWORD *v9;
  int v10;
  __objc2_class *v11;
  void *v12;
  NFFieldNotificationECP1_0 *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  void *specific;
  uint64_t Logger;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  int v37;
  NFFieldNotificationECP1_0 *v38;
  const char *v40;
  const char *Name;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ECPData")));
    if ((unint64_t)objc_msgSend(v6, "length") < 3)
    {
LABEL_31:
      v11 = NFFieldNotification;
      goto LABEL_32;
    }
    v7 = objc_retainAutorelease(v6);
    v8 = objc_msgSend(v7, "bytes");
    if (*v8 == 106)
    {
      v9 = v8;
      v10 = v8[1];
      if (v10 == 2)
      {
        if (objc_msgSend(v7, "length") == (id)8 && *v9 == 0x820202C3026ALL)
        {
          v38 = -[NFFieldNotificationECP1_0 initWithDictionaryForDavenport:]([NFFieldNotificationECP1_0 alloc], "initWithDictionaryForDavenport:", v5);
          goto LABEL_33;
        }
        v11 = NFFieldNotificationECP2_0;
LABEL_32:
        v38 = (NFFieldNotificationECP1_0 *)objc_msgSend([v11 alloc], "initWithDictionary:", v5);
LABEL_33:
        v13 = v38;

        goto LABEL_34;
      }
      if (v10 == 1)
      {
        v11 = NFFieldNotificationECP1_0;
        goto LABEL_32;
      }
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = NFLogGetLogger(specific);
      if (Logger)
      {
        v29 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v33 = 45;
        if (isMetaClass)
          v33 = 43;
        v29(4, "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP",
          v33,
          ClassName,
          Name,
          85);
      }
      v34 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v35 = NFSharedLogGetLogger(v34);
      v23 = objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v36 = object_getClass(a1);
      if (class_isMetaClass(v36))
        v37 = 43;
      else
        v37 = 45;
      *(_DWORD *)buf = 67109890;
      v43 = v37;
      v44 = 2082;
      v45 = object_getClassName(a1);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 85;
      v26 = "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP";
    }
    else
    {
      v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFLogGetLogger(v14);
      if (v15)
      {
        v16 = (void (*)(uint64_t, const char *, ...))v15;
        v17 = object_getClass(a1);
        v18 = class_isMetaClass(v17);
        v19 = object_getClassName(a1);
        v40 = sel_getName(a2);
        v20 = 45;
        if (v18)
          v20 = 43;
        v16(4, "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP", v20, v19, v40, 88);
      }
      v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v22 = NFSharedLogGetLogger(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      *(_DWORD *)buf = 67109890;
      v43 = v25;
      v44 = 2082;
      v45 = object_getClassName(a1);
      v46 = 2082;
      v47 = sel_getName(a2);
      v48 = 1024;
      v49 = 88;
      v26 = "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP";
    }
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v26, buf, 0x22u);
LABEL_30:

    goto LABEL_31;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFFieldNotification.m"), 63, CFSTR("Empty dictionary"));

  v13 = 0;
LABEL_34:

  return (NFFieldNotification *)v13;
}

+ (id)fieldNotificationFromXPCObject:(id)a3
{
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *v28;
  _BOOL4 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  objc_class *v42;
  _BOOL4 v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  int v48;
  const char *ClassName;
  const char *v51;
  const char *Name;
  const char *v53;
  const char *v54;
  id v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  id v65;

  v5 = a3;
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_data)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v11, ClassName, Name, 98, v5);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v15 = object_getClass(a1);
    if (class_isMetaClass(v15))
      v16 = 43;
    else
      v16 = 45;
    *(_DWORD *)buf = 67110146;
    v57 = v16;
    v58 = 2082;
    v59 = object_getClassName(a1);
    v60 = 2082;
    v61 = sel_getName(a2);
    v62 = 1024;
    v63 = 98;
    v64 = 2112;
    v65 = v5;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", buf, 0x2Cu);
LABEL_12:
    v17 = 0;
    goto LABEL_36;
  }
  v18 = _CFXPCCreateCFObjectFromXPCObject(v5);
  if (!v18)
  {
    v39 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v40 = NFLogGetLogger(v39);
    if (v40)
    {
      v41 = (void (*)(uint64_t, const char *, ...))v40;
      v42 = object_getClass(a1);
      v43 = class_isMetaClass(v42);
      v51 = object_getClassName(a1);
      v54 = sel_getName(a2);
      v44 = 45;
      if (v43)
        v44 = 43;
      v41(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v44, v51, v54, 104, v5);
    }
    v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v46 = NFSharedLogGetLogger(v45);
    v14 = objc_claimAutoreleasedReturnValue(v46);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v47 = object_getClass(a1);
    if (class_isMetaClass(v47))
      v48 = 43;
    else
      v48 = 45;
    *(_DWORD *)buf = 67110146;
    v57 = v48;
    v58 = 2082;
    v59 = object_getClassName(a1);
    v60 = 2082;
    v61 = sel_getName(a2);
    v62 = 1024;
    v63 = 104;
    v64 = 2112;
    v65 = v5;
    goto LABEL_11;
  }
  v14 = v18;
  v19 = objc_opt_class(NFFieldNotification);
  v20 = objc_opt_class(NFFieldNotificationECP1_0);
  v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, objc_opt_class(NFFieldNotificationECP2_0), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v55 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedArrayOfObjectsOfClasses:fromData:error:", v22, v14, &v55));
  v24 = v55;
  if (v24)
  {
    v25 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFLogGetLogger(v25);
    if (v26)
    {
      v27 = (void (*)(uint64_t, const char *, ...))v26;
      v28 = object_getClass(a1);
      v29 = class_isMetaClass(v28);
      v30 = object_getClassName(a1);
      v53 = sel_getName(a2);
      v31 = 45;
      if (v29)
        v31 = 43;
      v27(3, "%c[%{public}s %{public}s]:%i Fail to decode: %@", v31, v30, v53, 119, v24);
    }
    v32 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v33 = NFSharedLogGetLogger(v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(a1);
      if (class_isMetaClass(v35))
        v36 = 43;
      else
        v36 = 45;
      v37 = object_getClassName(a1);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v57 = v36;
      v58 = 2082;
      v59 = v37;
      v60 = 2082;
      v61 = v38;
      v62 = 1024;
      v63 = 119;
      v64 = 2112;
      v65 = v24;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to decode: %@", buf, 0x2Cu);
    }

    v17 = 0;
  }
  else
  {
    v17 = v23;
  }

LABEL_36:
  return v17;
}

- (NFFieldNotification)initWithDictionary:(id)a3
{
  id v4;
  NFFieldNotification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *creationDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFFieldNotification;
  v5 = -[NFFieldNotification init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("FieldTechnology")));
    v5->_rfTechnology = objc_msgSend(v6, "integerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("SystemCode")));
    v5->_typeFSystemCode = (unsigned __int16)objc_msgSend(v7, "integerValue");

    v5->_notificationType = 1;
    v8 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

  }
  return v5;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (id)description
{
  NSMutableString *v3;
  NSMutableString *v4;
  unsigned int rfTechnology;
  id v6;
  const char *ClassName;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = objc_opt_new(NSMutableString);
  v4 = v3;
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 1) != 0)
  {
    -[NSMutableString appendString:](v3, "appendString:", CFSTR("A,"));
    rfTechnology = self->_rfTechnology;
    if ((rfTechnology & 2) == 0)
    {
LABEL_3:
      if ((rfTechnology & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((rfTechnology & 2) == 0)
  {
    goto LABEL_3;
  }
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("B,"));
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 4) == 0)
  {
LABEL_4:
    if ((rfTechnology & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("F,"));
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 0x10) == 0)
  {
LABEL_5:
    if ((rfTechnology & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  -[NSMutableString appendString:](v4, "appendString:", CFSTR("V,"));
  if ((self->_rfTechnology & 8) != 0)
LABEL_6:
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("ECP,"));
LABEL_7:
  if (!-[NSMutableString length](v4, "length"))
    -[NSMutableString appendString:](v4, "appendString:", CFSTR("None"));
  v6 = objc_alloc((Class)NSString);
  ClassName = object_getClassName(self);
  v8 = bswap32(self->_typeFSystemCode) >> 16;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification _creationDateString](self, "_creationDateString"));
  v10 = objc_msgSend(v6, "initWithFormat:", CFSTR("<%s: tech=%@ sc=0x%X date=%@ cached=%d>"), ClassName, v4, v8, v9, self->_cachedBeforeRFReset);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NFFieldNotification *v4;
  uint64_t v5;
  NFFieldNotification *v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  BOOL v10;

  v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class(NFFieldNotification);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[NFFieldNotification rfTechnology](v6, "rfTechnology");
      if (v7 == -[NFFieldNotification rfTechnology](self, "rfTechnology")
        && (v8 = -[NFFieldNotification typeFSystemCode](v6, "typeFSystemCode"),
            v8 == -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode")))
      {
        v9 = -[NFFieldNotification notificationType](v6, "notificationType");
        v10 = v9 == (id)-[NFFieldNotification notificationType](self, "notificationType");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isEqualWithoutRFTech:(id)a3
{
  NFFieldNotification *v4;
  uint64_t v5;
  id v6;
  BOOL v7;

  v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class(NFFieldNotification);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = -[NFFieldNotification notificationType](v4, "notificationType");
      v7 = v6 == (id)-[NFFieldNotification notificationType](self, "notificationType");
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualTerminalInfo:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  BOOL v9;

  v4 = a3;
  v5 = -[NFFieldNotification notificationType](self, "notificationType");
  if (v5 != objc_msgSend(v4, "notificationType"))
    goto LABEL_8;
  if ((id)-[NFFieldNotification notificationType](self, "notificationType") != (id)2)
  {
    if ((id)-[NFFieldNotification notificationType](self, "notificationType") == (id)3)
    {
      v8 = -[NFFieldNotification terminalType](self, "terminalType");
      if (v8 == objc_msgSend(v4, "terminalType"))
      {
        v6 = -[NFFieldNotification terminalSubType](self, "terminalSubType");
        v7 = objc_msgSend(v4, "terminalSubType");
        goto LABEL_7;
      }
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v6 = -[NFFieldNotification terminalType](self, "terminalType");
  v7 = objc_msgSend(v4, "terminalType");
LABEL_7:
  v9 = v6 == v7;
LABEL_9:

  return v9;
}

- (id)asXPCObject
{
  void *v4;
  id v5;
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  id v19;
  const char *ClassName;
  const char *Name;
  id v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;

  v23 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v23));
  v5 = v23;
  if (v5)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Failed to encode: %@", v11, ClassName, Name, 233, v5);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 2082;
      v29 = v18;
      v30 = 1024;
      v31 = 233;
      v32 = 2112;
      v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to encode: %@", buf, 0x2Cu);
    }

    v19 = 0;
  }
  else
  {
    v19 = v4;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NFFieldNotification initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:]([NFFieldNotification alloc], "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:", self->_notificationType, self->_rfTechnology, self->_typeFSystemCode, self->_creationDate, self->_cachedBeforeRFReset);
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (BOOL)isCHTerminal
{
  NFFieldNotification *v3;
  BOOL v4;

  if ((id)-[NFFieldNotification notificationType](self, "notificationType") != (id)3)
    return 0;
  v3 = self;
  v4 = -[NFFieldNotification terminalType](v3, "terminalType") == (id)5
    && -[NFFieldNotification terminalSubType](v3, "terminalSubType") == 0;

  return v4;
}

- (BOOL)isCHInitiatorDetected
{
  return (id)-[NFFieldNotification chFieldType](self, "chFieldType") == (id)2;
}

- (BOOL)isCHReceiverDetected
{
  return (id)-[NFFieldNotification chFieldType](self, "chFieldType") == (id)3;
}

- (BOOL)isCHAutoNegotiationField
{
  NFFieldNotification *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v3 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v3, "userInfo"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v3, "userInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHCfgBytes")));

      v4 = (void *)((unint64_t)objc_msgSend(v6, "unsignedShortValue") & 1);
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (unint64_t)chFieldType
{
  NFFieldNotification *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *specific;
  uint64_t Logger;
  void (*v32)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  int v40;
  void *v42;
  void *v43;
  const char *Name;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;

  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v4 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v4, "userInfo"));

    if (!v5)
    {
      v25 = 4;
LABEL_33:

      return v25;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CHCfgBytes")));

    if (objc_msgSend(v7, "unsignedShortValue"))
    {
      if ((objc_msgSend(v7, "unsignedShortValue") & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v4, "userInfo"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", CFSTR("CHRemoteRandom")));

        if (!v27)
        {
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          Logger = NFLogGetLogger(specific);
          if (Logger)
          {
            v32 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v4);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v4);
            Name = sel_getName(a2);
            v36 = 45;
            if (isMetaClass)
              v36 = 43;
            v32(4, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              v36,
              ClassName,
              Name,
              1015);
          }
          v37 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v38 = NFSharedLogGetLogger(v37);
          v19 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v39 = object_getClass(v4);
            if (class_isMetaClass(v39))
              v40 = 43;
            else
              v40 = 45;
            *(_DWORD *)buf = 67109890;
            v46 = v40;
            v47 = 2082;
            v48 = object_getClassName(v4);
            v49 = 2082;
            v50 = sel_getName(a2);
            v51 = 1024;
            v52 = 1015;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              buf,
              0x22u);
          }
          goto LABEL_31;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v4, "userInfo"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("CHInitiatorDetected")));

        if (v29)
        {
          v25 = 2;
          goto LABEL_32;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v4, "userInfo"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("CHReceiverDetected")));

        if (v43)
        {
          v25 = 3;
          goto LABEL_32;
        }
      }
      if ((objc_msgSend(v7, "unsignedShortValue") & 2) == 0)
      {
        v8 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v9 = NFLogGetLogger(v8);
        if (v9)
        {
          v10 = (void (*)(uint64_t, const char *, ...))v9;
          v11 = object_getClass(v4);
          v12 = class_isMetaClass(v11);
          v13 = object_getClassName(v4);
          v14 = sel_getName(a2);
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification debugDescription](v4, "debugDescription"));
          v16 = 45;
          if (v12)
            v16 = 43;
          v10(4, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@", v16, v13, v14, 1032, v15);

        }
        v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v18 = NFSharedLogGetLogger(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = object_getClass(v4);
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v22 = object_getClassName(v4);
          v23 = sel_getName(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification debugDescription](v4, "debugDescription"));
          *(_DWORD *)buf = 67110146;
          v46 = v21;
          v47 = 2082;
          v48 = v22;
          v49 = 2082;
          v50 = v23;
          v51 = 1024;
          v52 = 1032;
          v53 = 2114;
          v54 = v24;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@",
            buf,
            0x2Cu);

        }
LABEL_31:

        v25 = 1;
        goto LABEL_32;
      }
      v25 = 5;
    }
    else
    {
      v25 = 4;
    }
LABEL_32:

    goto LABEL_33;
  }
  return 1;
}

- (id)chRandomData
{
  NFFieldNotification *v3;
  void *v4;
  void *v5;

  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v3 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v3, "userInfo"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFFieldNotification userInfo](v3, "userInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHRemoteRandom")));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
