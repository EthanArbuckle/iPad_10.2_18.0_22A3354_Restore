@implementation SSRemoteNotification

- (SSRemoteNotification)initWithNotificationUserInfo:(id)a3
{
  SSRemoteNotification *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SSRemoteNotification;
  v4 = -[SSRemoteNotification init](&v15, sel_init);
  if (v4)
  {
    v4->_userInfo = (NSDictionary *)objc_msgSend(a3, "copy");
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("10"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("application/gzip")))
      {
        v6 = objc_msgSend(a3, "objectForKey:", CFSTR("aps"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
          v8 = (void *)v7;
          if (v7)
          {
            v9 = (void *)softLinkISCopyDecompressedGZipDataForData(v7);
            v14 = 0;
            if (v9)
            {
              v10 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v14);
              if (v14)
              {
LABEL_13:

                return v4;
              }
              v11 = v10;
            }
            else
            {
              v11 = 0;
            }
          }
          else
          {
            v11 = 0;
            v9 = 0;
            v14 = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (NSDictionary *)-[NSDictionary mutableCopy](v4->_userInfo, "mutableCopy");
            -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, CFSTR("aps"));
            v4->_userInfo = v12;
          }
          goto LABEL_13;
        }
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRemoteNotification;
  -[SSRemoteNotification dealloc](&v3, sel_dealloc);
}

- (int64_t)actionType
{
  id v3;

  v3 = -[SSRemoteNotification valueForKey:](self, "valueForKey:", CFSTR("1"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (int)objc_msgSend(v3, "intValue");
  else
    return -[SSRemoteNotification valueForKey:](self, "valueForKey:", CFSTR("3")) != 0;
}

- (NSString)alertBodyString
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("alert"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_6:
        v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("text"));
        goto LABEL_8;
      }
      v3 = (void *)objc_msgSend(v3, "objectForKey:", CFSTR("body"));
    }
    if (v3)
      goto LABEL_8;
    goto LABEL_6;
  }
  v3 = 0;
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v3;
  else
    return 0;
}

- (NSString)alertCancelString
{
  NSString *v2;

  v2 = -[SSRemoteNotification _valueForAlertKey:](self, "_valueForAlertKey:", CFSTR("cancel"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)alertOKString
{
  NSString *v2;

  v2 = -[SSRemoteNotification _valueForAlertKey:](self, "_valueForAlertKey:", CFSTR("ok"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)alertTitleString
{
  NSString *v3;

  v3 = -[SSRemoteNotification _valueForAlertKey:](self, "_valueForAlertKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v3 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (BOOL)explicitContent
{
  id v2;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("isExplicit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSString)artworkUrl
{
  NSString *v2;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("artworkUrl"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)badgeValue
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v2, "objectForKey:", CFSTR("badge"));
  else
    return 0;
}

- (NSArray)buttons
{
  NSArray *v2;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("buttons"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)category
{
  NSString *v2;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("category"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSDate)expirationDate
{
  id v2;
  void *v3;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("schedule"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("notAfter")), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v3, "integerValue"));
  }
  else
  {
    return 0;
  }
}

- (NSDictionary)metrics
{
  NSDictionary *v2;

  v2 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("metrics"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSString)soundFileName
{
  id v2;
  NSString *v3;

  v2 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (NSString *)objc_msgSend(v2, "objectForKey:", CFSTR("sound"));
  else
    v3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (NSString)tapUrl
{
  NSString *v3;

  v3 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("3"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v3 = -[SSRemoteNotification _valueForAPSKey:](self, "_valueForAPSKey:", CFSTR("tapUrl"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (int64_t)version
{
  id v2;
  void *v3;

  v2 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("version")), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return objc_msgSend(v3, "integerValue");
  }
  else
  {
    return 0;
  }
}

- (id)valueForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", a3);
}

- (NSDictionary)notificationUserInfo
{
  return self->_userInfo;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_userInfo);
  return v3;
}

- (SSRemoteNotification)initWithXPCEncoding:(id)a3
{
  SSRemoteNotification *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRemoteNotification;
    v5 = -[SSRemoteNotification init](&v7, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_userInfo = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)_valueForAlertKey:(id)a3
{
  id v4;
  void *v5;

  v4 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("alert")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    return (id)objc_msgSend(v5, "objectForKey:", a3);
  }
  else
  {
    return 0;
  }
}

- (id)_valueForAPSKey:(id)a3
{
  id v4;

  v4 = -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("aps"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v4, "objectForKey:", a3);
  else
    return 0;
}

@end
