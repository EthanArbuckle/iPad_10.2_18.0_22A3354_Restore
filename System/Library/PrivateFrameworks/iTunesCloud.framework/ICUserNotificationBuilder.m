@implementation ICUserNotificationBuilder

- (ICUserNotificationBuilder)init
{
  ICUserNotificationBuilder *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *userNotificationDictionary;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICUserNotificationBuilder;
  v2 = -[ICUserNotificationBuilder init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userNotificationDictionary = v2->_userNotificationDictionary;
    v2->_userNotificationDictionary = v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0);
    -[NSMutableDictionary setObject:forKey:](v2->_userNotificationDictionary, "setObject:forKey:", v5, *MEMORY[0x1E0DABB78]);

  }
  return v2;
}

- (ICUserNotificationBuilder)initWithStoreDialog:(id)a3
{
  id v4;
  ICUserNotificationBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  ICUserNotificationBuilder *v11;

  v4 = a3;
  v5 = -[ICUserNotificationBuilder init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      -[ICUserNotificationBuilder setTitle:](v5, "setTitle:", v6);
    objc_msgSend(v4, "explanation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      -[ICUserNotificationBuilder setMessage:](v5, "setMessage:", v7);
    objc_msgSend(v4, "buttons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__ICUserNotificationBuilder_initWithStoreDialog___block_invoke;
    v10[3] = &unk_1E438B210;
    v11 = v5;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
  return v5;
}

- (BOOL)allowInCar
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0DABAF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)alternateButtonTitle
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B830]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4391778;
  v4 = v2;

  return v4;
}

- (__CFUserNotification)createCFUserNotification
{
  unint64_t alertLevel;
  BOOL v3;
  CFOptionFlags v4;
  CFOptionFlags v5;

  alertLevel = self->_alertLevel;
  v3 = alertLevel > 3;
  v4 = 3 - alertLevel;
  if (v3)
    v5 = 3;
  else
    v5 = v4;
  return CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_timeoutInterval, v5, 0, (CFDictionaryRef)self->_userNotificationDictionary);
}

- (NSString)defaultButtonTitle
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B838]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4391778;
  v4 = v2;

  return v4;
}

- (BOOL)displaysActionButtonOnLockScreen
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0DABBA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)displaysAsTopMost
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B820]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)forcesModalAppearance
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0DABBC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)message
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B810]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4391778;
  v4 = v2;

  return v4;
}

- (NSString)otherButtonTitle
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B868]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4391778;
  v4 = v2;

  return v4;
}

- (void)setAllowInCar:(BOOL)a3
{
  -[ICUserNotificationBuilder _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, *MEMORY[0x1E0DABAF0]);
}

- (void)setAlternateButtonTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_userNotificationDictionary, "setObject:forKey:", v4, *MEMORY[0x1E0C9B830]);

}

- (void)setDefaultButtonTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_userNotificationDictionary, "setObject:forKey:", v4, *MEMORY[0x1E0C9B838]);

}

- (void)setDisplaysActionButtonOnLockScreen:(BOOL)a3
{
  -[ICUserNotificationBuilder _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, *MEMORY[0x1E0DABBA8]);
}

- (void)setDisplaysAsTopMost:(BOOL)a3
{
  -[ICUserNotificationBuilder _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, *MEMORY[0x1E0C9B820]);
}

- (void)setForcesModalAppearance:(BOOL)a3
{
  -[ICUserNotificationBuilder _setBoolValue:forKey:](self, "_setBoolValue:forKey:", a3, *MEMORY[0x1E0DABBC8]);
}

- (void)setMessage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_userNotificationDictionary, "setObject:forKey:", v4, *MEMORY[0x1E0C9B810]);

}

- (void)setOtherButtonTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_userNotificationDictionary, "setObject:forKey:", v4, *MEMORY[0x1E0C9B868]);

}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_userNotificationDictionary, "setObject:forKey:", v4, *MEMORY[0x1E0C9B800]);

}

- (NSString)title
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_userNotificationDictionary, "objectForKey:", *MEMORY[0x1E0C9B800]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E4391778;
  v4 = v2;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 16) = self->_alertLevel;
    *(double *)(v5 + 24) = self->_timeoutInterval;
    v7 = -[NSMutableDictionary mutableCopyWithZone:](self->_userNotificationDictionary, "mutableCopyWithZone:", a3);
    v8 = (void *)v6[1];
    v6[1] = v7;

  }
  return v6;
}

- (void)_setBoolValue:(BOOL)a3 forKey:(__CFString *)a4
{
  NSMutableDictionary *userNotificationDictionary;
  _QWORD *v5;

  userNotificationDictionary = self->_userNotificationDictionary;
  v5 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v5 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[NSMutableDictionary setObject:forKey:](userNotificationDictionary, "setObject:forKey:", *v5, a4);
}

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationDictionary, 0);
}

void __49__ICUserNotificationBuilder_initWithStoreDialog___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v5, "type");
    switch(v4)
    {
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "setDefaultButtonTitle:", v3);
        break;
      case 3:
        objc_msgSend(*(id *)(a1 + 32), "setOtherButtonTitle:", v3);
        break;
      case 2:
        objc_msgSend(*(id *)(a1 + 32), "setAlternateButtonTitle:", v3);
        break;
    }
  }

}

@end
