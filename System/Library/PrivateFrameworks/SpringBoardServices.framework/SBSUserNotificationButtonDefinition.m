@implementation SBSUserNotificationButtonDefinition

- (SBSUserNotificationButtonDefinition)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationButtonDefinition.m"), 29, CFSTR("[SBSUserNotificationButtonDefinition init] is unavailable for use."));

  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  id v5;
  NSString *v6;
  NSString *title;
  void *v8;
  SBSUserNotificationButtonDefinition *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationButtonDefinition.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationButtonDefinition;
  self = -[SBSUserNotificationButtonDefinition init](&v12, sel_init);
  if (self)
  {
    objc_msgSend(v5, "bs_safeStringForKey:", CFSTR("_SBSButtonTitle"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v6;

    if (self->_title)
    {
      objc_msgSend(v5, "bs_safeNumberForKey:", CFSTR("_SBSButtonPresentationStyle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_presentationStyle = objc_msgSend(v8, "intValue");

      self->_isPreferredButton = objc_msgSend(v5, "bs_BOOLForKey:", CFSTR("_SBSButtonPreferred"));
      goto LABEL_7;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
LABEL_7:
  self = self;
  v9 = self;
LABEL_9:

  return v9;
}

- (SBSUserNotificationButtonDefinition)initWithTitle:(id)a3
{
  id v5;
  SBSUserNotificationButtonDefinition *v6;
  uint64_t v7;
  NSString *title;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationButtonDefinition.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSUserNotificationButtonDefinition;
  v6 = -[SBSUserNotificationButtonDefinition init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    title = v6->_title;
    v6->_title = (NSString *)v7;

  }
  return v6;
}

+ (id)_buttonDefinitionsFromSerializedDefinitions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SBSUserNotificationButtonDefinition *v11;
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
        v11 = [SBSUserNotificationButtonDefinition alloc];
        v12 = -[SBSUserNotificationButtonDefinition _initWithDictionary:](v11, "_initWithDictionary:", v10, (_QWORD)v14);
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
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("_SBSButtonTitle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_presentationStyle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_SBSButtonPresentationStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPreferredButton);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_SBSButtonPreferred"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (unint64_t)hash
{
  _BOOL4 isPreferredButton;

  isPreferredButton = self->_isPreferredButton;
  return -[NSString hash](self->_title, "hash") + 11 * isPreferredButton + self->_presentationStyle;
}

- (BOOL)isEqual:(id)a3
{
  SBSUserNotificationButtonDefinition *v4;
  SBSUserNotificationButtonDefinition *v5;
  NSString *title;
  void *v7;
  char v8;

  v4 = (SBSUserNotificationButtonDefinition *)a3;
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
      if (BSEqualBools() && self->_presentationStyle == v5->_presentationStyle)
      {
        title = self->_title;
        -[SBSUserNotificationButtonDefinition title](v5, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NSString isEqualToString:](title, "isEqualToString:", v7);

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
  _DWORD *v5;

  objc_storeStrong((id *)a3 + 1, self->_title);
  v5 = a3;
  v5[4] = self->_presentationStyle;
  *((_BYTE *)v5 + 20) = self->_isPreferredButton;

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBSMutableUserNotificationButtonDefinition *v4;

  v4 = -[SBSUserNotificationButtonDefinition initWithTitle:]([SBSMutableUserNotificationButtonDefinition alloc], "initWithTitle:", self->_title);
  -[SBSUserNotificationButtonDefinition _copyPropertiesToDefinition:](self, "_copyPropertiesToDefinition:", v4);
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (int)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
