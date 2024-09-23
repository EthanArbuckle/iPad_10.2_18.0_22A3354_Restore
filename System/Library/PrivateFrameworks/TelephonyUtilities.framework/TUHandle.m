@implementation TUHandle

+ (id)normalizedPhoneNumberHandleForValue:(id)a3 isoCountryCode:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  TUHandle *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = v6;
    if (!objc_msgSend(v7, "length"))
    {
      v8 = PNCopyBestGuessCountryCodeForNumber();

      v7 = (id)v8;
    }
    if (objc_msgSend(v7, "length"))
    {
      TUPhoneNumberNormalizedPhoneNumberString((uint64_t)v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = -[TUHandle initWithType:value:normalizedValue:]([TUHandle alloc], "initWithType:value:normalizedValue:", 2, v5, v9);
    -[TUHandle setHasSetISOCountryCode:](v10, "setHasSetISOCountryCode:", 1);
    -[TUHandle setIsoCountryCode:](v10, "setIsoCountryCode:", v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 normalizedValue:(id)a5
{
  id v8;
  TUHandle *v9;
  uint64_t v10;
  NSString *normalizedValue;

  v8 = a5;
  v9 = -[TUHandle initWithType:value:](self, "initWithType:value:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    normalizedValue = v9->_normalizedValue;
    v9->_normalizedValue = (NSString *)v10;

  }
  return v9;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4
{
  id v6;
  TUHandle *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUHandle;
  v7 = -[TUHandle init](&v11, sel_init);
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUHandle initWithType:value:]", CFSTR("value"));
    v7->_hasSetISOCountryCode = a3 != 2;
    v7->_type = a3;
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

  }
  return v7;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setHasSetISOCountryCode:(BOOL)a3
{
  self->_hasSetISOCountryCode = a3;
}

- (NSString)value
{
  return self->_value;
}

+ (id)normalizedHandleWithDestinationID:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "destinationIdIsTokenURI"))
    goto LABEL_6;
  if (!objc_msgSend(v3, "destinationIdIsEmailAddress"))
  {
    if (objc_msgSend(v3, "destinationIdIsPhoneNumber"))
    {
      +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v3, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v5 = (void *)v4;

  return v5;
}

+ (int64_t)handleTypeForCHHandle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "type");
    if ((unint64_t)(v5 - 1) >= 3)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)isoCountryCode
{
  void *v3;
  NSString *v4;
  NSString *isoCountryCode;

  if (!self->_hasSetISOCountryCode)
  {
    self->_hasSetISOCountryCode = 1;
    -[TUHandle normalizedValue](self, "normalizedValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      v4 = (NSString *)PNCopyBestGuessCountryCodeForNumber();
      isoCountryCode = self->_isoCountryCode;
      self->_isoCountryCode = v4;

    }
  }
  return self->_isoCountryCode;
}

- (BOOL)isEquivalentToHandle:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[TUHandle type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[TUHandle normalizedValue](self, "normalizedValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "normalizedValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {
        -[TUHandle normalizedValue](self, "normalizedValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "normalizedValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

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
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)normalizedValue
{
  return self->_normalizedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValue, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_siriDisplayName, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *isoCountryCode;
  id v5;
  void *v6;
  int64_t type;
  void *v8;
  NSString *value;
  void *v10;
  NSString *normalizedValue;
  void *v12;
  NSString *siriDisplayName;
  id v14;

  isoCountryCode = self->_isoCountryCode;
  v5 = a3;
  NSStringFromSelector(sel_isoCountryCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", isoCountryCode, v6);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v8);

  value = self->_value;
  NSStringFromSelector(sel_value);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", value, v10);

  normalizedValue = self->_normalizedValue;
  NSStringFromSelector(sel_normalizedValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", normalizedValue, v12);

  siriDisplayName = self->_siriDisplayName;
  NSStringFromSelector(sel_siriDisplayName);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", siriDisplayName, v14);

}

- (TUHandle)initWithCoder:(id)a3
{
  id v4;
  TUHandle *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *isoCountryCode;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSString *value;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSString *normalizedValue;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSString *siriDisplayName;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TUHandle;
  v5 = -[TUHandle init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_isoCountryCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v8;

    NSStringFromSelector(sel_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    v11 = objc_opt_class();
    NSStringFromSelector(sel_value);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v13;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_normalizedValue);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    normalizedValue = v5->_normalizedValue;
    v5->_normalizedValue = (NSString *)v17;

    v19 = objc_opt_class();
    NSStringFromSelector(sel_siriDisplayName);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    siriDisplayName = v5->_siriDisplayName;
    v5->_siriDisplayName = (NSString *)v21;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)normalizedGenericHandleForValue:(id)a3
{
  id v3;
  void *v4;
  TUHandle *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "normalizedTokenURI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TUHandle initWithType:value:normalizedValue:]([TUHandle alloc], "initWithType:value:normalizedValue:", 1, v3, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)handleForCHRecentCall:(id)a3
{
  return (id)objc_msgSend(a1, "handleForCHRecentCall:validHandlesOnly:", a3, 0);
}

+ (id)handleForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "handlesForCHRecentCall:validHandlesOnly:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)handlesForCHRecentCall:(id)a3
{
  return (id)objc_msgSend(a1, "handlesForCHRecentCall:validHandlesOnly:", a3, 0);
}

+ (id)handlesForCHRecentCall:(id)a3 validHandlesOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "validRemoteParticipantHandles");
  else
    objc_msgSend(v5, "remoteParticipantHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "value", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          v16 = objc_msgSend(v14, "type");
          if (v16 == 1)
          {
            +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          if (v16 != 2)
          {
            if (v16 != 3)
              goto LABEL_19;
            +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
            v19 = (void *)v17;
            if (!v17)
              goto LABEL_19;
LABEL_18:
            objc_msgSend(v6, "addObject:", v19);

            goto LABEL_19;
          }
          objc_msgSend(v5, "isoCountryCode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v15, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            goto LABEL_18;
        }
LABEL_19:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v6;
}

+ (TUHandle)handleWithDestinationID:(id)a3
{
  id v3;
  TUHandle *v4;

  v3 = a3;
  v4 = -[TUHandle initWithDestinationID:]([TUHandle alloc], "initWithDestinationID:", v3);

  return v4;
}

+ (TUHandle)handleWithDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  TUHandle *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  NSStringFromSelector(sel_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    NSStringFromSelector(sel_type);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v9 = objc_msgSend(v8, "integerValue"), (unint64_t)(v9 - 1) <= 2))
      v10 = -[TUHandle initWithType:value:]([TUHandle alloc], "initWithType:value:", v9, v6);
    else
      v10 = 0;
    NSStringFromSelector(sel_siriDisplayName);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUHandle setSiriDisplayName:](v10, "setSiriDisplayName:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (TUHandle)initWithDestinationID:(id)a3
{
  id v4;
  uint64_t v5;
  TUHandle *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "destinationIdIsTokenURI") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "destinationIdIsEmailAddress") & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "destinationIdIsPhoneNumber"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  v6 = -[TUHandle initWithType:value:](self, "initWithType:value:", v5, v4);

  return v6;
}

- (TUHandle)initWithHandle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUHandle *v8;
  void *v9;
  uint64_t v10;
  NSString *siriDisplayName;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TUHandle initWithType:value:normalizedValue:](self, "initWithType:value:normalizedValue:", v5, v6, v7);

  if (v8)
  {
    objc_msgSend(v4, "siriDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    siriDisplayName = v8->_siriDisplayName;
    v8->_siriDisplayName = (NSString *)v10;

  }
  return v8;
}

- (TUHandle)initWithType:(int64_t)a3 value:(id)a4 siriDisplayName:(id)a5
{
  id v8;
  TUHandle *v9;
  uint64_t v10;
  NSString *siriDisplayName;

  v8 = a5;
  v9 = -[TUHandle initWithType:value:](self, "initWithType:value:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    siriDisplayName = v9->_siriDisplayName;
    v9->_siriDisplayName = (NSString *)v10;

  }
  return v9;
}

- (TUHandle)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUHandle.m"), 153, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUHandle init]");

  return 0;
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return off_1E38A3CD0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)personHandle
{
  int64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = -[TUHandle type](self, "type");
  if (v3 == 3)
    v4 = 1;
  else
    v4 = 2 * (v3 == 2);
  v5 = objc_alloc((Class)CUTWeakLinkClass());
  -[TUHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithValue:type:", v6, v4);

  return v7;
}

+ (TUHandle)handleWithPersonHandle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TUHandle *v9;
  void *v10;
  TUHandle *v11;
  void *v13;
  char v14;
  void *v15;
  int v16;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_msgSend(v3, "type");
    if (v6)
    {
      v7 = 1;
      if (v6 == 1)
        v7 = 3;
      if (v6 == 2)
        v8 = 2;
      else
        v8 = v7;
    }
    else
    {
      objc_msgSend(v3, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_appearsToBePhoneNumber");

      if ((v14 & 1) != 0)
      {
        v8 = 2;
      }
      else
      {
        objc_msgSend(v3, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_appearsToBeEmail");

        if (v16)
          v8 = 3;
        else
          v8 = 1;
      }
    }
    v9 = [TUHandle alloc];
    objc_msgSend(v3, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TUHandle initWithType:value:](v9, "initWithType:value:", v8, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (TUHandle)handleWithPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "personHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUHandle handleWithPersonHandle:](TUHandle, "handleWithPersonHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "setSiriDisplayName:", v7);

  }
  return (TUHandle *)v5;
}

- (BOOL)shouldHideContact
{
  _BOOL8 v3;

  v3 = _MKBGetDeviceLockState() == 1 || _MKBGetDeviceLockState() == 2;
  return -[TUHandle shouldHideContactWithLockState:](self, "shouldHideContactWithLockState:", v3);
}

- (BOOL)shouldHideContactWithLockState:(BOOL)a3
{
  BOOL v3;
  void *v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  id v10;

  if (self->_siriDisplayName)
    v3 = !a3;
  else
    v3 = 1;
  if (v3)
    return 0;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2080, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", self->_siriDisplayName, 0, 0, -[NSString length](self->_siriDisplayName, "length"));

  v8 = v7 != 0;
  return v8;
}

- (BOOL)isValidForISOCountryCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  char valid;

  v4 = a3;
  -[TUHandle value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    goto LABEL_6;
  v7 = -[TUHandle type](self, "type");
  if (v7 == 1 || v7 == 3)
  {
    valid = 1;
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    -[TUHandle value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    valid = PNIsValidPhoneNumberForCountry();

  }
  else
  {
LABEL_6:
    valid = 0;
  }
LABEL_8:

  return valid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithHandle:", self);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForType:", -[TUHandle type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUHandle value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TULoggableStringForHandle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_normalizedValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUHandle normalizedValue](self, "normalizedValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TULoggableStringForHandle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v9, v11);

  if (-[TUHandle type](self, "type") == 2)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", "));
    NSStringFromSelector(sel_isoCountryCode);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUHandle isoCountryCode](self, "isoCountryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v12, v13);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_siriDisplayName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUHandle siriDisplayName](self, "siriDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v14, v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[TUHandle isoCountryCode](self, "isoCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[TUHandle type](self, "type") ^ v4;
  -[TUHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[TUHandle normalizedValue](self, "normalizedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TUHandle *v4;
  BOOL v5;

  v4 = (TUHandle *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUHandle isEqualToHandle:](self, "isEqualToHandle:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHandle:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[TUHandle type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[TUHandle isoCountryCode](self, "isoCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isoCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      -[TUHandle value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUStringsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        -[TUHandle normalizedValue](self, "normalizedValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "normalizedValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = TUStringsAreEqualOrNil((unint64_t)v10, (uint64_t)v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)canonicalHandleForISOCountryCode:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  TUHandle *v13;

  v4 = a3;
  v5 = -[TUHandle type](self, "type");
  if (v5 == 3)
  {
LABEL_4:
    -[TUHandle value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      v6 = 0;
      goto LABEL_13;
    }
    goto LABEL_4;
  }
  -[TUHandle value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TUPhoneNumber phoneNumberWithDigits:countryCode:](TUPhoneNumber, "phoneNumberWithDigits:countryCode:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "unformattedInternationalRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v9, "digits");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v12;

  }
  else
  {
    -[TUHandle value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  v13 = -[TUHandle initWithType:value:]([TUHandle alloc], "initWithType:value:", -[TUHandle type](self, "type"), v6);

  return v13;
}

- (BOOL)isCanonicallyEqualToHandle:(id)a3 isoCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a4;
  v7 = a3;
  -[TUHandle canonicalHandleForISOCountryCode:](self, "canonicalHandleForISOCountryCode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canonicalHandleForISOCountryCode:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
    v10 = objc_msgSend(v8, "isEqualToHandle:", v9);

  return v10;
}

- (id)messagingData
{
  void *v2;
  void *v3;

  +[CSDMessagingHandle handleWithTUHandle:](CSDMessagingHandle, "handleWithTUHandle:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)handleFromMessagingData:(id)a3
{
  id v3;
  CSDMessagingHandle *v4;
  void *v5;

  v3 = a3;
  v4 = -[CSDMessagingHandle initWithData:]([CSDMessagingHandle alloc], "initWithData:", v3);

  -[CSDMessagingHandle tuHandle](v4, "tuHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)normalizedEmailAddressHandleForValue:(id)a3
{
  id v3;
  TUHandle *v4;
  void *v5;
  TUHandle *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = [TUHandle alloc];
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TUHandle initWithType:value:normalizedValue:](v4, "initWithType:value:normalizedValue:", 3, v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TUHandle type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);

  -[TUHandle value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  -[TUHandle siriDisplayName](self, "siriDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_siriDisplayName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasSetISOCountryCode
{
  return self->_hasSetISOCountryCode;
}

@end
