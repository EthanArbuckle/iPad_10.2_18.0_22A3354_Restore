@implementation NFAppletExtraInfo

+ (id)infoWithDictionary:(id)a3 applet:(id)a4
{
  id v7;
  id v8;
  NFAppletExtraInfo *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NFAppletExtraInfo *v19;
  void *specific;
  uint64_t Logger;
  void (*v22)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *Name;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_new(NFAppletExtraInfo);
  objc_storeStrong((id *)&v9->_applet, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appletAid")));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("associatedSSD")));
    if (v13)
    {
      v14 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v13));
        if (v15)
          objc_storeStrong((id *)&v9->_ssdAID, v15);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("obgk")));

    if (v16)
    {
      v17 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v16));
        if (v18)
          objc_storeStrong((id *)&v9->_obgk, v18);

      }
    }
    v19 = v9;

  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v26 = 45;
      if (isMetaClass)
        v26 = 43;
      v22(3, "%c[%{public}s %{public}s]:%i AID does not match", v26, ClassName, Name, 668);
    }
    v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v28 = NFSharedLogGetLogger(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = object_getClass(a1);
      if (class_isMetaClass(v30))
        v31 = 43;
      else
        v31 = 45;
      *(_DWORD *)buf = 67109890;
      v35 = v31;
      v36 = 2082;
      v37 = object_getClassName(a1);
      v38 = 2082;
      v39 = sel_getName(a2);
      v40 = 1024;
      v41 = 668;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i AID does not match", buf, 0x22u);
    }

    v19 = 0;
  }

  return v19;
}

- (id)debugDescription
{
  NSMutableString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet debugDescription](self->_applet, "debugDescription"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_ssdAID, "NF_asHexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_obgk, "NF_asHexString"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(", { ssdID=%@, OBGK=%@ }"), v5, v6);

  return v3;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSData)ssdAID
{
  return self->_ssdAID;
}

- (NSData)obgk
{
  return self->_obgk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obgk, 0);
  objc_storeStrong((id *)&self->_ssdAID, 0);
  objc_storeStrong((id *)&self->_applet, 0);
}

@end
