@implementation CARCarPlayServiceMessageAvailability

- (CARCarPlayServiceMessageAvailability)initWithWirelessAvailable:(BOOL)a3 wiredAvailable:(id)a4 usbIdentifier:(id)a5 themeAssetsAvailable:(id)a6
{
  id v11;
  id v12;
  id v13;
  CARCarPlayServiceMessageAvailability *v14;
  CARCarPlayServiceMessageAvailability *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CARCarPlayServiceMessageAvailability;
  v14 = -[CARCarPlayServiceMessageAvailability init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_wirelessAvailable = a3;
    objc_storeStrong((id *)&v14->_wiredAvailable, a4);
    objc_storeStrong((id *)&v15->_usbIdentifier, a5);
    objc_storeStrong((id *)&v15->_themeAssetsAvailable, a6);
  }

  return v15;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CARCarPlayServiceMessageAvailability;
  v3 = -[CARCarPlayServiceMessageAvailability description](&v15, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[CARCarPlayServiceMessageAvailability wirelessAvailable](self, "wirelessAvailable"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability wiredAvailable](self, "wiredAvailable"));
  v7 = CFSTR("unset");
  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability wiredAvailable](self, "wiredAvailable"));
    if (objc_msgSend(v14, "BOOLValue"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability usbIdentifier](self, "usbIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability themeAssetsAvailable](self, "themeAssetsAvailable"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability themeAssetsAvailable](self, "themeAssetsAvailable"));
    if (objc_msgSend(v10, "BOOLValue"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {wirelessAvailable: %@, wiredAvailable: %@, usbIdentifier: %@, themeAssetsAvailable: %@}"), v4, v5, v7, v8, v11));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {wirelessAvailable: %@, wiredAvailable: %@, usbIdentifier: %@, themeAssetsAvailable: %@}"), v4, v5, v7, v8, CFSTR("unset")));
  }

  if (v6)
  return (NSString *)v12;
}

+ (unint64_t)identifier
{
  return 2;
}

- (CARCarPlayServiceMessageAvailability)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  CARCarPlayServiceMessageAvailability *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v39;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(NSDictionary);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("wireless")));
    v7 = v6;
    if (v6 && (objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (!v8)
    {
      v18 = sub_100056C84(2uLL);
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10006BD94();
      v13 = 0;
      goto LABEL_57;
    }
    v9 = objc_opt_class(NSNumber);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("available")));
    v11 = v10;
    if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (!v12)
    {
      v23 = sub_100056C84(2uLL);
      v17 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10006BE00();
      v13 = 0;
      goto LABEL_56;
    }
    v14 = objc_opt_class(NSDictionary);
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("wired")));
    v16 = v15;
    if (v15 && (objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    if (v17)
    {
      v19 = objc_opt_class(NSNumber);
      v20 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v17, "objectForKey:", CFSTR("available")));
      v21 = v20;
      if (v20 && (objc_opt_isKindOfClass(v20, v19) & 1) != 0)
        v22 = v21;
      else
        v22 = 0;

      if (!v22)
      {
        v37 = sub_100056C84(2uLL);
        v22 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_10006BE00();
        v13 = 0;
        goto LABEL_55;
      }
      v24 = objc_opt_class(NSString);
      v25 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v17, "objectForKey:", CFSTR("usbIdentifier")));
      v26 = v25;
      if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) != 0)
        v27 = v26;
      else
        v27 = 0;

      if (!v27)
      {
        v39 = sub_100056C84(2uLL);
        v27 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_10006BE6C();
        v13 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      v22 = 0;
      v27 = 0;
    }
    v28 = objc_opt_class(NSDictionary);
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("asset")));
    v30 = v29;
    if (v29 && (objc_opt_isKindOfClass(v29, v28) & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    if (v31)
    {
      v32 = objc_opt_class(NSNumber);
      v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("available")));
      v34 = v33;
      if (v33 && (objc_opt_isKindOfClass(v33, v32) & 1) != 0)
        v35 = v34;
      else
        v35 = 0;

      if (!v35)
      {
        v36 = sub_100056C84(2uLL);
        v35 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          sub_10006BE00();
        v13 = 0;
        goto LABEL_53;
      }
    }
    else
    {
      v35 = 0;
    }
    self = -[CARCarPlayServiceMessageAvailability initWithWirelessAvailable:wiredAvailable:usbIdentifier:themeAssetsAvailable:](self, "initWithWirelessAvailable:wiredAvailable:usbIdentifier:themeAssetsAvailable:", -[NSObject BOOLValue](v12, "BOOLValue"), v22, v27, v35);
    v13 = self;
LABEL_53:

LABEL_54:
LABEL_55:

LABEL_56:
LABEL_57:

    goto LABEL_58;
  }
  v13 = 0;
LABEL_58:

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = CFSTR("available");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CARCarPlayServiceMessageAvailability wirelessAvailable](self, "wirelessAvailable")));
  v15 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wireless"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability wiredAvailable](self, "wiredAvailable"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability wiredAvailable](self, "wiredAvailable"));
    objc_msgSend(v7, "cr_setSafeObject:forKey:", v8, CFSTR("available"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability usbIdentifier](self, "usbIdentifier"));
    objc_msgSend(v7, "cr_setSafeObject:forKey:", v9, CFSTR("usbIdentifier"));

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("wired"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability themeAssetsAvailable](self, "themeAssetsAvailable"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageAvailability themeAssetsAvailable](self, "themeAssetsAvailable"));
    objc_msgSend(v11, "cr_setSafeObject:forKey:", v12, CFSTR("available"));

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("asset"));
  }
  return v3;
}

- (BOOL)wirelessAvailable
{
  return self->_wirelessAvailable;
}

- (NSNumber)wiredAvailable
{
  return self->_wiredAvailable;
}

- (NSString)usbIdentifier
{
  return self->_usbIdentifier;
}

- (NSNumber)themeAssetsAvailable
{
  return self->_themeAssetsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeAssetsAvailable, 0);
  objc_storeStrong((id *)&self->_usbIdentifier, 0);
  objc_storeStrong((id *)&self->_wiredAvailable, 0);
}

@end
