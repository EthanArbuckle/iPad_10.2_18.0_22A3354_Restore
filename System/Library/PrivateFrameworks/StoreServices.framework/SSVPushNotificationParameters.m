@implementation SSVPushNotificationParameters

- (SSVPushNotificationParameters)init
{
  SSVPushNotificationParameters *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *parameterDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVPushNotificationParameters;
  v2 = -[SSVPushNotificationParameters init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    parameterDictionary = v2->_parameterDictionary;
    v2->_parameterDictionary = v3;

  }
  return v2;
}

- (NSArray)mediaKinds
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_parameterDictionary, "objectForKey:", CFSTR("parameters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("media-kinds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)notificationType
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_parameterDictionary, "objectForKey:", CFSTR("notification-type"));
}

- (NSDictionary)putParameters
{
  return (NSDictionary *)-[NSMutableDictionary objectForKey:](self->_parameterDictionary, "objectForKey:", CFSTR("put-parameters"));
}

- (void)setMediaKinds:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_parameterDictionary, "objectForKey:", CFSTR("parameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = v4;
  if (v7)
  {
    if (!v4)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKey:](self->_parameterDictionary, "setObject:forKey:", v6, CFSTR("parameters"));
      v5 = v7;
    }
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("media-kinds"));
  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("media-kinds"));
  }

}

- (void)setNotificationType:(id)a3
{
  -[SSVPushNotificationParameters setValue:forParameter:](self, "setValue:forParameter:", a3, CFSTR("notification-type"));
}

- (void)setPutParameters:(id)a3
{
  -[SSVPushNotificationParameters setValue:forParameter:](self, "setValue:forParameter:", a3, CFSTR("put-parameters"));
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  NSMutableDictionary *parameterDictionary;

  parameterDictionary = self->_parameterDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](parameterDictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](parameterDictionary, "removeObjectForKey:", a4);
}

- (id)valueForParameter:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_parameterDictionary, "objectForKey:", a3);
}

- (id)_copyParametersDictionary
{
  return (id)-[NSMutableDictionary mutableCopy](self->_parameterDictionary, "mutableCopy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAccountIdentifier:", self->_accountIdentifier);
  objc_msgSend(v5, "setEnvironmentName:", self->_environmentName);
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_parameterDictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  objc_msgSend(v5, "setRequestType:", self->_requestType);
  return v5;
}

- (SSVPushNotificationParameters)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVPushNotificationParameters *v6;
  CFArrayRef v8;
  NSNumber *accountIdentifier;
  CFArrayRef v10;
  NSString *environmentName;
  CFArrayRef v12;
  uint64_t v13;
  NSMutableDictionary *parameterDictionary;
  objc_super v15;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v15.receiver = self;
    v15.super_class = (Class)SSVPushNotificationParameters;
    v6 = -[SSVPushNotificationParameters init](&v15, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v8;

      objc_opt_class();
      v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
      environmentName = v6->_environmentName;
      v6->_environmentName = (NSString *)v10;

      v6->_requestType = xpc_dictionary_get_int64(v5, "3");
      objc_opt_class();
      v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      v13 = -[__CFArray copy](v12, "copy");
      parameterDictionary = v6->_parameterDictionary;
      v6->_parameterDictionary = (NSMutableDictionary *)v13;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_environmentName);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_parameterDictionary);
  xpc_dictionary_set_int64(v3, "3", self->_requestType);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
