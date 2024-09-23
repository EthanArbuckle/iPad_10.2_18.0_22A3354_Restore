@implementation SBSUserNotificationTextFieldDefinition

- (SBSUserNotificationTextFieldDefinition)init
{
  SBSUserNotificationTextFieldDefinition *v2;
  SBSUserNotificationTextFieldDefinition *v3;
  NSString *title;
  NSString *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSUserNotificationTextFieldDefinition;
  v2 = -[SBSUserNotificationTextFieldDefinition init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    value = v3->_value;
    v3->_value = 0;

    *(_WORD *)&v3->_isSecure = 0;
    v3->_maxLength = -1;
    v3->_keyboardType = 0;
    v3->_autocorrectionType = 0;
    v3->_autocapitalizationType = 2;
  }
  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v5;
  SBSUserNotificationTextFieldDefinition *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *value;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSUserNotificationTextFieldDefinition *v19;
  void *v21;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationTextFieldDefinition.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[SBSUserNotificationTextFieldDefinition init](self, "init");
    if (v6)
    {
      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("_SBSTFTitle"));
      v7 = objc_claimAutoreleasedReturnValue();
      title = v6->_title;
      v6->_title = (NSString *)v7;

      objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("_SBSTFValue"));
      v9 = objc_claimAutoreleasedReturnValue();
      value = v6->_value;
      v6->_value = (NSString *)v9;

      v6->_isSecure = objc_msgSend(v5, "bs_BOOLForKey:", CFSTR("_SBSTFIsSecure"));
      objc_msgSend(v5, "objectForKey:", CFSTR("_SBSTFMaxLength"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v6->_hasSetMaxLength = 1;
        objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("_SBSTFMaxLength"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_maxLength = objc_msgSend(v12, "unsignedIntValue");

      }
      objc_msgSend(v5, "objectForKey:", CFSTR("_SBSTFKeyboardType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("_SBSTFKeyboardType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_keyboardType = (int)objc_msgSend(v14, "intValue");

      }
      objc_msgSend(v5, "objectForKey:", CFSTR("_SBSTFAutocorrectionType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("_SBSTFAutocorrectionType"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_autocorrectionType = (int)objc_msgSend(v16, "intValue");

      }
      objc_msgSend(v5, "objectForKey:", CFSTR("_SBSTFAutocapitalizationType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("_SBSTFAutocapitalizationType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_autocapitalizationType = (int)objc_msgSend(v18, "intValue");

      }
    }
    self = v6;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)_definitionsFromSerializedDefinitions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SBSUserNotificationTextFieldDefinition *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [SBSUserNotificationTextFieldDefinition alloc];
        v12 = -[SBSUserNotificationTextFieldDefinition _initWithDictionary:](v11, "_initWithDictionary:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)build
{
  id v3;
  NSString *value;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("_SBSTFTitle"));
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", value, CFSTR("_SBSTFValue"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSecure);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_SBSTFIsSecure"));

  if (self->_hasSetMaxLength)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxLength);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_SBSTFMaxLength"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_keyboardType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_SBSTFKeyboardType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_autocapitalizationType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("_SBSTFAutocapitalizationType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_autocorrectionType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_SBSTFAutocorrectionType"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (unint64_t)hash
{
  _BOOL4 isSecure;
  NSUInteger v4;

  isSecure = self->_isSecure;
  v4 = -[NSString hash](self->_title, "hash") + 13 * isSecure;
  return v4
       + -[NSString hash](self->_value, "hash")
       + self->_maxLength
       + self->_keyboardType
       + 17 * self->_autocapitalizationType
       + 19 * self->_autocorrectionType;
}

- (BOOL)isEqual:(id)a3
{
  SBSUserNotificationTextFieldDefinition *v4;
  SBSUserNotificationTextFieldDefinition *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SBSUserNotificationTextFieldDefinition *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualBools()
        && self->_maxLength == v5->_maxLength
        && self->_keyboardType == v5->_keyboardType
        && self->_autocapitalizationType == v5->_autocapitalizationType
        && self->_autocorrectionType == v5->_autocorrectionType)
      {
        -[SBSUserNotificationTextFieldDefinition title](v5, "title");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[SBSUserNotificationTextFieldDefinition value](v5, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = BSEqualObjects();

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)_copyPropertiesToDefinition:(id)a3
{
  id *v5;

  objc_storeStrong((id *)a3 + 1, self->_title);
  v5 = (id *)a3;
  objc_storeStrong(v5 + 2, self->_value);
  *((_BYTE *)v5 + 24) = self->_isSecure;
  *((_BYTE *)v5 + 25) = self->_hasSetMaxLength;
  v5[4] = (id)self->_maxLength;
  v5[5] = (id)self->_keyboardType;
  v5[6] = (id)self->_autocorrectionType;
  v5[7] = (id)self->_autocapitalizationType;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBSMutableUserNotificationTextFieldDefinition *v4;

  v4 = objc_alloc_init(SBSMutableUserNotificationTextFieldDefinition);
  -[SBSUserNotificationTextFieldDefinition _copyPropertiesToDefinition:](self, "_copyPropertiesToDefinition:", v4);
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (BOOL)_hasSetMaxLength
{
  return self->_hasSetMaxLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
