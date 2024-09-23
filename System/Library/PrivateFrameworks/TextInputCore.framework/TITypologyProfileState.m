@implementation TITypologyProfileState

- (id)hashForString:(id)a3
{
  __CFString *v4;
  const __CFData *v5;
  const char *CStringPtr;
  const char *v7;
  CC_LONG v8;
  __CFString *Mutable;
  CFIndex Length;
  CFIndex v11;
  CFIndex v12;
  CFIndex Bytes;
  BOOL v14;
  const UInt8 *BytePtr;
  CC_LONG v16;
  uint64_t i;
  CFIndex usedBufLen;
  CC_SHA256_CTX c;
  UInt8 buffer[512];
  uint64_t v22;
  CFRange v23;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[TITypologyProfileState salt](self, "salt");
  v5 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
    if (CStringPtr)
    {
      v7 = CStringPtr;
      v8 = strlen(CStringPtr);
      CC_SHA256_Update(&c, v7, v8);
    }
    else
    {
      Length = CFStringGetLength(v4);
      if (Length >= 1)
      {
        v11 = Length;
        v12 = 0;
        do
        {
          usedBufLen = 0;
          v23.location = v12;
          v23.length = v11;
          Bytes = CFStringGetBytes(v4, v23, 0x8000100u, 0, 0, buffer, 512, &usedBufLen);
          CC_SHA256_Update(&c, buffer, usedBufLen);
          v12 += Bytes;
          v14 = v11 <= Bytes;
          v11 -= Bytes;
        }
        while (!v14);
      }
    }
    BytePtr = CFDataGetBytePtr(v5);
    v16 = CFDataGetLength(v5);
    CC_SHA256_Update(&c, BytePtr, v16);
    CC_SHA256_Final(buffer, &c);
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 64);
    for (i = 0; i != 32; ++i)
      CFStringAppendFormat(Mutable, 0, CFSTR("%x"), buffer[i]);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (NSData)salt
{
  NSData *salt;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  NSData *v11;
  UInt8 __buf[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  salt = self->_salt;
  if (!salt)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6900], CFSTR("typologyProfileStateSalt"));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.TextInput"));
    v11 = 0;
    SecItemCopyMatching(Mutable, (CFTypeRef *)&v11);
    if (v11)
    {
      v6 = self->_salt;
      self->_salt = v11;

    }
    if (!self->_salt)
    {
      arc4random_buf(__buf, 0x20uLL);
      v7 = (NSData *)CFDataCreate(v4, __buf, 32);
      v8 = self->_salt;
      self->_salt = v7;

      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], self->_salt);
      if (SecItemAdd(Mutable, 0))
      {
        v9 = self->_salt;
        self->_salt = 0;

      }
    }
    CFRelease(Mutable);
    salt = self->_salt;
  }
  return salt;
}

- (id)_hashTokenForProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_areValidFieldValues(v8, v9, v10))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v12);

    objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v13);

    objc_msgSend(v11, "stringFromDate:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("profileInstalled:%@, userNotification:%@, userResponse:%@"), v14, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyProfileState hashForString:](self, "hashForString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_authenticateHashToken:(id)a3 forProfileInstallationDate:(id)a4 userNotificationDate:(id)a5 userResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  if (!v14)
  {
    v16 = 0;
LABEL_9:
    v17 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = 0;
    v16 = v14;
    goto LABEL_11;
  }
  v15 = objc_msgSend(v14, "length");

  if (!v15 || !_areValidFieldValues(v11, v12, v13))
  {
    v17 = 0;
    goto LABEL_13;
  }
  -[TITypologyProfileState _hashTokenForProfileInstallationDate:userNotificationDate:userResponse:](self, "_hashTokenForProfileInstallationDate:userNotificationDate:userResponse:", v11, v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length") || (objc_msgSend(v16, "isEqualToString:", v14) & 1) == 0)
    goto LABEL_9;
  v17 = 1;
LABEL_11:

LABEL_13:
  return v17;
}

- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  TITypologyProfileState *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TITypologyProfileState initWithProfileInstallationDate:userNotificationDate:userResponse:](self, "initWithProfileInstallationDate:userNotificationDate:userResponse:", v5, v6, CFSTR("None"));

  return v7;
}

- (TITypologyProfileState)initWithProfileInstallationDate:(id)a3 userNotificationDate:(id)a4 userResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  TITypologyProfileState *v11;
  uint64_t v12;
  NSDate *profileInstallationDate;
  uint64_t v14;
  NSDate *userNotificationDate;
  uint64_t v16;
  NSString *userResponse;
  TITypologyProfileState *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_areValidFieldValues(v8, v9, v10))
  {
    v20.receiver = self;
    v20.super_class = (Class)TITypologyProfileState;
    v11 = -[TITypologyProfileState init](&v20, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v8, "copy");
      profileInstallationDate = v11->_profileInstallationDate;
      v11->_profileInstallationDate = (NSDate *)v12;

      v14 = objc_msgSend(v9, "copy");
      userNotificationDate = v11->_userNotificationDate;
      v11->_userNotificationDate = (NSDate *)v14;

      v16 = objc_msgSend(v10, "copy");
      userResponse = v11->_userResponse;
      v11->_userResponse = (NSString *)v16;

    }
    self = v11;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (TITypologyProfileState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TITypologyProfileState *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstallDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserNotificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserResponse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HashToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TITypologyProfileState _authenticateHashToken:forProfileInstallationDate:userNotificationDate:userResponse:](self, "_authenticateHashToken:forProfileInstallationDate:userNotificationDate:userResponse:", v8, v5, v6, v7))
  {
    self = -[TITypologyProfileState initWithProfileInstallationDate:userNotificationDate:userResponse:](self, "initWithProfileInstallationDate:userNotificationDate:userResponse:", v5, v6, v7);
    v9 = self;
  }
  else
  {
    TITypologyProfileStateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "Unable to instantiate decoded typology profile state: authentication failed.", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *userNotificationDate;
  NSDate *profileInstallationDate;
  NSString *v7;
  NSDate *v8;
  id v9;
  void *v10;
  NSDate *v11;

  profileInstallationDate = self->_profileInstallationDate;
  userNotificationDate = self->_userNotificationDate;
  v7 = self->_userResponse;
  v8 = userNotificationDate;
  v11 = profileInstallationDate;
  v9 = a3;
  -[TITypologyProfileState _hashTokenForProfileInstallationDate:userNotificationDate:userResponse:](self, "_hashTokenForProfileInstallationDate:userNotificationDate:userResponse:", v11, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v11, CFSTR("InstallDate"));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("UserNotificationDate"));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("UserResponse"));

  objc_msgSend(v9, "encodeObject:forKey:", v10, CFSTR("HashToken"));
}

- (BOOL)_persistStateToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[TITypologyProfileState encodeWithCoder:](self, "encodeWithCoder:", v5);
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v12 = 0;
    v8 = objc_msgSend(v6, "writeToURL:options:error:", v4, 1073741825, &v12);
    v9 = v12;
    if ((v8 & 1) == 0)
    {
      TITypologyProfileStateLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "Unable to persist state: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)persistState
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "defaultPersistentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TITypologyProfileState _persistStateToURL:](self, "_persistStateToURL:", v3);

  return (char)self;
}

- (NSDate)profileInstallationDate
{
  return self->_profileInstallationDate;
}

- (void)setProfileInstallationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)userNotificationDate
{
  return self->_userNotificationDate;
}

- (void)setUserNotificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)userResponse
{
  return self->_userResponse;
}

- (void)setUserResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
  objc_storeStrong((id *)&self->_userNotificationDate, 0);
  objc_storeStrong((id *)&self->_profileInstallationDate, 0);
}

+ (id)defaultPersistentURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", TI_KB_USER_DIRECTORY());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("typologyProfileState.dat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_typologyProfileStateFromURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v11 = objc_msgSend(v6, "code");

        if (v11 == 260)
        {
          TITypologyProfileStateLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_INFO, "No persisted state found.", buf, 2u);
          }
LABEL_15:
          v9 = 0;
          v8 = v6;
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    TITypologyProfileStateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_ERROR, "Unable to read persisted state: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  v14 = v5;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v14);
  v8 = v14;

  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCoder:", v7);
  }
  else
  {
    TITypologyProfileStateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_ERROR, "Failed to initialize keyed unarchiver with persisted data: %@", buf, 0xCu);
    }

    v7 = 0;
    v9 = 0;
  }
LABEL_16:

  return v9;
}

+ (id)typologyProfileStateFromPersistedState
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "defaultPersistentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_typologyProfileStateFromURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_removePersistedStateAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v12);

  v7 = v12;
  if ((v6 & 1) == 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v9 = objc_msgSend(v7, "code");

        if (v9 == 4)
        {
          TITypologyProfileStateLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_INFO, "No persisted state to remove", buf, 2u);
          }
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    TITypologyProfileStateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "Failed to remove persisted state: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

+ (BOOL)removePersistedState
{
  NSObject *v3;
  void *v4;
  char v5;
  uint8_t v7[16];

  TITypologyProfileStateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEFAULT, "Removing persisted state", v7, 2u);
  }

  objc_msgSend(a1, "defaultPersistentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "_removePersistedStateAtURL:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
