@implementation UISCompatibilityContext

- (UISCompatibilityContext)initWithSupportedDisplaySizes:(id)a3
{
  id v4;
  UISCompatibilityContext *v5;
  uint64_t v6;
  NSArray *supportedDisplaySizes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISCompatibilityContext;
  v5 = -[UISCompatibilityContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    supportedDisplaySizes = v5->_supportedDisplaySizes;
    v5->_supportedDisplaySizes = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  UISCompatibilityContext *v4;
  UISCompatibilityContext *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UISCompatibilityContext *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UISCompatibilityContext supportedDisplaySizes](self, "supportedDisplaySizes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISCompatibilityContext supportedDisplaySizes](v5, "supportedDisplaySizes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  return ~-[NSArray hash](self->_supportedDisplaySizes, "hash");
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_supportedDisplaySizes, CFSTR("SupportedDisplaySizes"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UISCompatibilityContext *v4;
  void *v5;
  UISCompatibilityContext *v6;

  v4 = [UISCompatibilityContext alloc];
  -[UISCompatibilityContext supportedDisplaySizes](self, "supportedDisplaySizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UISCompatibilityContext initWithSupportedDisplaySizes:](v4, "initWithSupportedDisplaySizes:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  UISMutableCompatibilityContext *v4;
  void *v5;
  UISMutableCompatibilityContext *v6;

  v4 = [UISMutableCompatibilityContext alloc];
  -[UISCompatibilityContext supportedDisplaySizes](self, "supportedDisplaySizes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UISCompatibilityContext initWithSupportedDisplaySizes:](v4, "initWithSupportedDisplaySizes:", v5);

  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISCompatibilityContext supportedDisplaySizes](self, "supportedDisplaySizes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, CFSTR("DisplaySizes"));

}

- (UISCompatibilityContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISCompatibilityContext *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t i;
  double v15;
  double v16;
  void *v18;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UISCompatibilityContext;
  v5 = -[UISCompatibilityContext init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("DisplaySizes"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    v9 = v7;
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "bs_CGSizeValue");
          if (v16 == v12 && v15 == v13)
          {

            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v20 = 0;
              _os_log_error_impl(&dword_190875000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error decoding supported display sizes.", v20, 2u);
            }
            v9 = 0;
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v10)
          continue;
        break;
      }
      v9 = v7;
    }
LABEL_17:

    if (v9)
      v18 = v9;
    else
      v18 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_supportedDisplaySizes, v18);

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSArray)supportedDisplaySizes
{
  return self->_supportedDisplaySizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDisplaySizes, 0);
}

@end
