@implementation TUMetadataDestinationID

+ (id)metadataDestinationIDsForCHRecentCalls:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  TUHandle *v15;
  void *v16;
  void *v17;
  TUHandle *v18;
  TUMetadataDestinationID *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v39;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v31 = v4;
        v32 = v5;
        objc_msgSend(v5, "remoteParticipantHandles");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v35;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v35 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
              objc_msgSend(v11, "normalizedValue");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "length");

              if (v13)
              {
                v14 = +[TUHandle handleTypeForCHHandle:](TUHandle, "handleTypeForCHHandle:", v11);
                v15 = [TUHandle alloc];
                objc_msgSend(v11, "value");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "normalizedValue");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[TUHandle initWithType:value:normalizedValue:](v15, "initWithType:value:normalizedValue:", v14, v16, v17);

                goto LABEL_13;
              }
              objc_msgSend(v11, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "length");

              if (!v21)
                goto LABEL_22;
              v22 = objc_msgSend(v11, "type");
              switch(v22)
              {
                case 1:
                  objc_msgSend(v11, "value");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v16);
                  v23 = objc_claimAutoreleasedReturnValue();
                  break;
                case 2:
                  objc_msgSend(v11, "value");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "isoCountryCode");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v16, v24);
                  v18 = (TUHandle *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_13;
                case 3:
                  objc_msgSend(v11, "value");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v16);
                  v23 = objc_claimAutoreleasedReturnValue();
                  break;
                default:
                  goto LABEL_22;
              }
              v18 = (TUHandle *)v23;
LABEL_13:

              if (v18)
              {
                v19 = -[TUMetadataDestinationID initWithHandle:]([TUMetadataDestinationID alloc], "initWithHandle:", v18);
                if (v19)
                  objc_msgSend(v33, "addObject:", v19);

              }
LABEL_22:
              ++v10;
            }
            while (v8 != v10);
            v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            v8 = v25;
          }
          while (v25);
        }

        v4 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v30);
  }

  objc_msgSend(v33, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (TUMetadataDestinationID)initWithHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  TUMetadataDestinationID *v10;
  TUMetadataDestinationID *v11;
  TUMetadataDestinationID *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "normalizedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    goto LABEL_3;
  v14 = objc_msgSend(v4, "type");
  switch(v14)
  {
    case 1:
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isoCountryCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v15, v17);
      v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
      if (v9)
        goto LABEL_4;
      break;
    case 3:
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v9 = (id)v16;
      goto LABEL_16;
  }
LABEL_3:
  v9 = v4;
LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)TUMetadataDestinationID;
  v10 = -[TUMetadataDestinationID init](&v18, sel_init);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_handle, v9);
  self = v11;

  v12 = self;
LABEL_8:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  TUMetadataDestinationID *v4;
  BOOL v5;

  v4 = (TUMetadataDestinationID *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUMetadataDestinationID isEqualToMetadataDestinationID:](self, "isEqualToMetadataDestinationID:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TUMetadataDestinationID handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqualToMetadataDestinationID:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUMetadataDestinationID handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEquivalentToHandle:", v5);

  return v6;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (id)metadataDestinationIDsForCHRecentCall:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUMetadataDestinationID *v4;
  void *v5;
  TUMetadataDestinationID *v6;

  v4 = +[TUMetadataDestinationID allocWithZone:](TUMetadataDestinationID, "allocWithZone:", a3);
  -[TUMetadataDestinationID handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUMetadataDestinationID initWithHandle:](v4, "initWithHandle:", v5);

  return v6;
}

+ (id)metadataDestinationIDForCall:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  TUMetadataDestinationID *v11;

  v3 = a3;
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v11 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(v5, "isoCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v3, "isoCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "isoCountryCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v6, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
      goto LABEL_6;
    }
  }
LABEL_7:
  v11 = -[TUMetadataDestinationID initWithHandle:]([TUMetadataDestinationID alloc], "initWithHandle:", v5);
LABEL_9:

  return v11;
}

- (TUMetadataDestinationID)initWithDestinationID:(id)a3 isoCountryCode:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  TUMetadataDestinationID *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v6, "destinationIdIsEmailAddress"))
    {
      +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v6, "destinationIdIsPhoneNumber") && objc_msgSend(v7, "length"))
    {
      +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;
    if (v8)
    {
      self = -[TUMetadataDestinationID initWithHandle:](self, "initWithHandle:", v8);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)isoCountryCode
{
  void *v2;
  void *v3;

  -[TUMetadataDestinationID handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isoCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  TUHandle *handle;
  id v4;
  id v5;

  handle = self->_handle;
  v4 = a3;
  NSStringFromSelector(sel_handle);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", handle, v5);

}

- (TUMetadataDestinationID)initWithCoder:(id)a3
{
  id v4;
  TUMetadataDestinationID *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TUHandle *handle;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUMetadataDestinationID;
  v5 = -[TUMetadataDestinationID init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_handle);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromSelector(sel_handle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUMetadataDestinationID handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
