@implementation SLPerson

- (SLPerson)initWithPortraitPerson:(id)a3 error:(id *)a4
{
  id v6;
  SLPerson *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *handle;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  SLPerson *v17;
  NSObject *v18;
  NSString *displayName;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLPerson;
  v7 = -[SLPerson init](&v21, sel_init);
  if (!v7)
    goto LABEL_16;
  if (v6)
  {
    objc_msgSend(v6, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v6, "handle");
      v10 = objc_claimAutoreleasedReturnValue();
      handle = v7->_handle;
      v7->_handle = (NSString *)v10;

      objc_msgSend(v6, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(v6, "displayName");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        displayName = v7->_displayName;
        v7->_displayName = v14;

LABEL_16:
        v17 = v7;
        goto LABEL_20;
      }
      if (-[NSString length](v7->_handle, "length"))
      {
        SLFrameworkLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[SLPerson initWithPortraitPerson:error:].cold.1();

        v14 = v7->_handle;
        goto LABEL_15;
      }
      if (a4)
      {
        v15 = (void *)objc_opt_class();
        v16 = 3;
        goto LABEL_10;
      }
LABEL_19:
      v17 = 0;
      goto LABEL_20;
    }
    if (!a4)
      goto LABEL_19;
    v15 = (void *)objc_opt_class();
    v16 = 2;
  }
  else
  {
    if (!a4)
      goto LABEL_19;
    v15 = (void *)objc_opt_class();
    v16 = 1;
  }
LABEL_10:
  objc_msgSend(v15, "errorForPersonDomain:andCode:", CFSTR("com.apple.SocialLayer.SLPerson"), v16);
  v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v17;
}

- (SLPerson)initWithCSPerson:(id)a3 error:(id *)a4
{
  id v6;
  SLPerson *v7;
  void *v8;
  void *v9;
  id *p_handle;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSString *v15;
  NSString *displayName;
  SLPerson *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLPerson;
  v7 = -[SLPerson init](&v19, sel_init);
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v6, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForPersonDomain:andCode:", CFSTR("com.apple.SocialLayer.SLPerson"), 2);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  p_handle = (id *)&v7->_handle;
  objc_storeStrong((id *)&v7->_handle, v9);
  objc_msgSend(v6, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = v11;
  if (!v12)
  {
    if (objc_msgSend(*p_handle, "length"))
    {
      SLFrameworkLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SLPerson initWithPortraitPerson:error:].cold.1();

      v13 = *p_handle;
      goto LABEL_8;
    }
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForPersonDomain:andCode:", CFSTR("com.apple.SocialLayer.SLPerson"), 3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
LABEL_8:
  v15 = (NSString *)v13;
  displayName = v7->_displayName;
  v7->_displayName = v15;

LABEL_9:
  v17 = v7;
LABEL_16:

  return v17;
}

- (SLPerson)initWithHandle:(id)a3 displayName:(id)a4
{
  __CFString *v6;
  id v7;
  SLPerson *v8;
  SLPerson *v9;
  __CFString *v10;
  objc_super v12;

  v6 = (__CFString *)a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLPerson;
  v8 = -[SLPerson init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = v6;
    else
      v10 = &stru_1E3797070;
    objc_storeStrong((id *)&v8->_handle, v10);
    objc_storeStrong((id *)&v9->_displayName, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPerson handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPerson displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPerson shortDisplayName](self, "shortDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPerson contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: handle: %@  displayName: %@  shortDisplayName: %@ contact: %@]"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)displayName
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = self->_displayName;
  if (!-[NSString length](v3, "length"))
  {
    -[SLPerson shortDisplayName](self, "shortDisplayName");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v4;
  }
  if (!-[NSString length](v3, "length"))
  {
    -[SLPerson handle](self, "handle");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (SLPerson)initWithDictionary:(id)a3
{
  id v4;
  SLPerson *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *shortDisplayName;
  uint64_t v12;
  CNContact *contact;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLPerson;
  v5 = -[SLPerson init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("h"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("dn"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("sdn"));
    v10 = objc_claimAutoreleasedReturnValue();
    shortDisplayName = v5->_shortDisplayName;
    v5->_shortDisplayName = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("c"));
    v12 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v12;

  }
  return v5;
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
  id v12;
  NSObject *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLPerson handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLPerson dictionaryRepresentation].cold.1();
    goto LABEL_14;
  }
  -[SLPerson handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("h"));

  -[SLPerson displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLPerson dictionaryRepresentation].cold.2();
    goto LABEL_14;
  }
  -[SLPerson displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dn"));

  -[SLPerson shortDisplayName](self, "shortDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLPerson dictionaryRepresentation].cold.3();
    goto LABEL_14;
  }
  -[SLPerson shortDisplayName](self, "shortDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sdn"));

  -[SLPerson contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLPerson dictionaryRepresentation].cold.4();
LABEL_14:

    v12 = 0;
    goto LABEL_15;
  }
  -[SLPerson contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("c"));

  v12 = v3;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLPerson)initWithCoder:(id)a3
{
  id v4;
  SLPerson *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSString *shortDisplayName;
  uint64_t v12;
  CNContact *contact;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLPerson;
  v5 = -[SLPerson init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("h"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dn"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sdn"));
    v10 = objc_claimAutoreleasedReturnValue();
    shortDisplayName = v5->_shortDisplayName;
    v5->_shortDisplayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
    v12 = objc_claimAutoreleasedReturnValue();
    contact = v5->_contact;
    v5->_contact = (CNContact *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;
  void *v6;
  id v7;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("h"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("dn"));
  -[SLPerson shortDisplayName](self, "shortDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("sdn"));

  -[SLPerson contact](self, "contact");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("c"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SLPerson *v4;
  void *v5;
  SLPerson *v6;

  v4 = [SLPerson alloc];
  -[SLPerson dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLPerson initWithDictionary:](v4, "initWithDictionary:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[SLPerson handle](self, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v7, "handle"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLPerson handle](self, "handle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqualToString:", v9);

      if (v8)
      {

        if (!v10)
          goto LABEL_35;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_35;
      }
    }
    -[SLPerson contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || (objc_msgSend(v7, "contact"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLPerson contact](self, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)0x1E0C97000;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0
        || (objc_msgSend(v7, "contact"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        -[SLPerson contact](self, "contact");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contact");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v3);

        if ((isKindOfClass & 1) != 0)
        {

          if (!v12)
          {

            if ((v17 & 1) == 0)
              goto LABEL_35;
            goto LABEL_26;
          }
        }
        else
        {

          if (!v12)
        }

        if ((v17 & 1) == 0)
          goto LABEL_35;
LABEL_26:
        -[SLPerson displayName](self, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(v7, "displayName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
LABEL_30:
            -[SLPerson shortDisplayName](self, "shortDisplayName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22
              || (objc_msgSend(v7, "shortDisplayName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[SLPerson shortDisplayName](self, "shortDisplayName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "shortDisplayName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v23, "isEqualToString:", v24);

              if (v22)
              {
LABEL_38:

                goto LABEL_39;
              }
            }
            else
            {
              v11 = 1;
            }

            goto LABEL_38;
          }
        }
        -[SLPerson displayName](self, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if (v18)
        {

          if (v21)
            goto LABEL_30;
        }
        else
        {

          if ((v21 & 1) != 0)
            goto LABEL_30;
        }
LABEL_35:
        v11 = 0;
LABEL_39:

        goto LABEL_40;
      }

      v15 = v26;
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v15 = 0;
    }
    v12 = v15;
    goto LABEL_25;
  }
  v11 = 0;
LABEL_40:

  return v11;
}

+ (id)errorForPersonDomain:(id)a3 andCode:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a4)
  {
    case 3:
      v16[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLPerson Init failed."), &stru_1E3797070, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v16[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PPSocialPerson contains an invalid or nil Display Name."), &stru_1E3797070, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v17;
      v12 = v16;
      break;
    case 2:
      v18[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLPerson Init failed."), &stru_1E3797070, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      v18[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PPSocialPerson contains an invalid or nil handle."), &stru_1E3797070, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v19;
      v12 = v18;
      break;
    case 1:
      v20[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SLPerson Init failed."), &stru_1E3797070, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      v20[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Invalid or nil PPSocialPerson."), &stru_1E3797070, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v21;
      v12 = v20;
      break;
    default:
      v13 = 0;
      goto LABEL_9;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v5, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)shortDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *shortDisplayName;

  if (!self->_shortDisplayName)
  {
    -[SLPerson contact](self, "contact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0C97218];
      -[SLPerson contact](self, "contact");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringFromContact:style:", v5, 1000);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      shortDisplayName = self->_shortDisplayName;
      self->_shortDisplayName = v6;

    }
  }
  return self->_shortDisplayName;
}

- (CNContact)contact
{
  CNContact *contact;
  void *v4;
  void *v5;
  CNContact *v6;
  BOOL v7;
  void *v8;
  void *v9;
  CNContact *v10;
  CNContact *v11;

  contact = self->_contact;
  if (!contact)
  {
    -[SLPerson handle](self, "handle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLPerson fetchCNContactWithHandle:](self, "fetchCNContactWithHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      v9 = (void *)objc_opt_class();
      -[SLPerson handle](self, "handle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createMutableContactWithHandle:", v8);
      v10 = (CNContact *)objc_claimAutoreleasedReturnValue();
      v11 = self->_contact;
      self->_contact = v10;

      v7 = 1;
    }

    self->_hasMutableContact = v7;
    contact = self->_contact;
  }
  return contact;
}

- (NSData)thumbnailImageData
{
  NSData *thumbnailImageData;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSData *v8;
  NSData *v9;

  thumbnailImageData = self->_thumbnailImageData;
  if (!thumbnailImageData)
  {
    -[SLPerson contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0C972D0], "croppedImageDataAvailableForContact:", v4))
    {
      v5 = objc_alloc(MEMORY[0x1E0C972D0]);
      -[SLPerson contactStore](self, "contactStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithContactStore:", v6);

      objc_msgSend(v7, "croppedImageDataForContact:", v4);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      v9 = self->_thumbnailImageData;
      self->_thumbnailImageData = v8;

    }
    thumbnailImageData = self->_thumbnailImageData;
  }
  return thumbnailImageData;
}

- (id)fetchCNContactWithHandle:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CNContactStore *v11;
  CNContactStore *contactStore;
  NSObject *v13;
  CNContactStore *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    SLGeneralTelemetryLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    SLGeneralTelemetryLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLPersonFetchCNContact", ", buf, 2u);
    }

    +[SLPerson predicateForHandle:](SLPerson, "predicateForHandle:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLPerson keysForCNContact](SLPerson, "keysForCNContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_contactStore)
    {
      v11 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
      contactStore = self->_contactStore;
      self->_contactStore = v11;

    }
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_impl(&dword_199EFF000, v13, OS_LOG_TYPE_DEFAULT, "Fetching CNContact for handle %@.", buf, 0xCu);
    }

    v14 = self->_contactStore;
    v23 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](v14, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v10, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v23;
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    SLFrameworkLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SLPerson fetchCNContactWithHandle:].cold.2(v16, v19);
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_199EFF000, v19, OS_LOG_TYPE_DEFAULT, "Fetched CNContact %@.", buf, 0xCu);
    }

    if (!v17)
    {
      objc_msgSend((id)objc_opt_class(), "createMutableContactWithHandle:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    SLGeneralTelemetryLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199EFF000, v21, OS_SIGNPOST_INTERVAL_END, v6, "SLPersonFetchCNContact", ", buf, 2u);
    }

  }
  else
  {
    SLFrameworkLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SLPerson fetchCNContactWithHandle:].cold.1();
    v17 = 0;
  }

  return v17;
}

+ (id)createMutableContactWithHandle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    SLFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SLPerson fetchCNContactWithHandle:].cold.1();
    goto LABEL_11;
  }
  v4 = v3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("urn:biz:")))
    {

      goto LABEL_9;
    }
    v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("biz:"));

    if (v7)
    {
LABEL_9:
      SLFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        +[SLPerson createMutableContactWithHandle:].cold.2();
LABEL_11:
      v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {

  }
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "Creating a CNContact for handle %@.", buf, 0xCu);
  }

  if (SLHandleIsEmail(v4))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEmailAddresses:", v12);
LABEL_19:

    goto LABEL_21;
  }
  if (SLHandleIsPhoneNumber(v4))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C97360]);
    v13 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "labeledValueWithLabel:value:", 0, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPhoneNumbers:", v12);
    goto LABEL_19;
  }
  v8 = 0;
LABEL_21:
  SLFrameworkLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_DEFAULT, "Created contact: %@.", buf, 0xCu);
  }
LABEL_12:

  return v8;
}

+ (id)fetchMeContact
{
  if (fetchMeContact_oncePredicate != -1)
    dispatch_once(&fetchMeContact_oncePredicate, &__block_literal_global_7);
  return (id)fetchMeContact_meContact;
}

void __26__SLPerson_fetchMeContact__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  +[SLPerson keysForCNContact](SLPerson, "keysForCNContact");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v0);
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForMeContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPredicate:", v2);

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v10 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SLFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __26__SLPerson_fetchMeContact__block_invoke_cold_1();

  }
  objc_msgSend(v6, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)fetchMeContact_meContact;
  fetchMeContact_meContact = v8;

}

+ (id)predicateForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_9;
  if (!SLHandleIsPhoneNumber(v3))
  {
    if (SLHandleIsEmail(v3))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    SLFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SLPerson predicateForHandle:].cold.1();

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForContactsMatchingPhoneNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v6;
}

+ (id)keysForCNContact
{
  if (keysForCNContact_onceToken != -1)
    dispatch_once(&keysForCNContact_onceToken, &__block_literal_global_44);
  return (id)keysForCNContact_keys;
}

void __28__SLPerson_keysForCNContact__block_invoke()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v0 = SLIsRunningInDaemon();
  v1 = *MEMORY[0x1E0C966A8];
  if (v0)
  {
    v9[0] = *MEMORY[0x1E0C966E8];
    v9[1] = v1;
    v2 = *MEMORY[0x1E0C96890];
    v9[2] = *MEMORY[0x1E0C967C0];
    v9[3] = v2;
    v9[4] = *MEMORY[0x1E0C96700];
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[5] = v3;
    v4 = v9;
  }
  else
  {
    v8[0] = *MEMORY[0x1E0C966E8];
    v8[1] = v1;
    v5 = *MEMORY[0x1E0C96890];
    v8[2] = *MEMORY[0x1E0C967C0];
    v8[3] = v5;
    v8[4] = *MEMORY[0x1E0C96700];
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[5] = v3;
    v4 = v8;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)keysForCNContact_keys;
  keysForCNContact_keys = v6;

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  -[SLPerson handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLPerson displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SLPerson shortDisplayName](self, "shortDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  if (!-[SLPerson hasMutableContact](self, "hasMutableContact"))
  {
    -[SLPerson contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 ^= objc_msgSend(v9, "hash");

  }
  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setShortDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (BOOL)hasMutableContact
{
  return self->_hasMutableContact;
}

- (void)setHasMutableContact:(BOOL)a3
{
  self->_hasMutableContact = a3;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_shortDisplayName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithPortraitPerson:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLP falling back to handle as displayName.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dictionaryRepresentation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLP contact was nil. Failing dictionary serialization.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchCNContactWithHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Failed to create contact for handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)fetchCNContactWithHandle:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch a CNContact. Error: %@", v4, 0xCu);

}

+ (void)createMutableContactWithHandle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Refusing to create contact for business handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __26__SLPerson_fetchMeContact__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Could not fetch MeCard from CNContactStore:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)predicateForHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Failed to determine handle type for handle %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
