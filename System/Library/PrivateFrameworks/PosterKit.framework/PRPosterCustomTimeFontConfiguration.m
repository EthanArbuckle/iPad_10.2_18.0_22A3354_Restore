@implementation PRPosterCustomTimeFontConfiguration

- (PRPosterCustomTimeFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRPosterCustomTimeFontConfiguration *v10;
  uint64_t v11;
  NSString *fontPostScriptName;
  uint64_t v13;
  NSString *extensionBundleRelativeFilePath;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fontPostScriptName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleRelativeFilePath"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PRPosterCustomTimeFontConfiguration;
  v10 = -[PRPosterTimeFontConfiguration init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    fontPostScriptName = v10->_fontPostScriptName;
    v10->_fontPostScriptName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    extensionBundleRelativeFilePath = v10->_extensionBundleRelativeFilePath;
    v10->_extensionBundleRelativeFilePath = (NSString *)v13;

  }
  return v10;
}

- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PRPosterCustomTimeFontConfiguration *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("font"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundle"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v7, "pr_postScriptName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pr_referencePathRelativeToBundle:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    self = -[PRPosterCustomTimeFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v10, v11);
    v13 = self;
  }

  return v13;
}

- (PRPosterCustomTimeFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PRPosterCustomTimeFontConfiguration *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("font"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleURL"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v7, "pr_postScriptName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pr_referencePathRelativeToDirectoryAtURL:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0;
  if (v10 && v11)
  {
    self = -[PRPosterCustomTimeFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v10, v11);
    v13 = self;
  }

  return v13;
}

- (PRPosterCustomTimeFontConfiguration)timeFontConfigurationWithExtensionBundleURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PRTimeFontConfiguration *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTimeFontConfiguration.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleURL != nil"));

  }
  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v6, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = -[PRTimeFontConfiguration initWithCustomFont:]([PRTimeFontConfiguration alloc], "initWithCustomFont:", v8);
  else
    v9 = 0;

  return (PRPosterCustomTimeFontConfiguration *)v9;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterCustomTimeFontConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterCustomTimeFontConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PRPosterCustomTimeFontConfiguration *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterCustomTimeFontConfiguration fontPostScriptName](v7, "fontPostScriptName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](v7, "extensionBundleRelativeFilePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = BSEqualObjects();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v4, CFSTR("fontPostScriptName"));

  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "appendObject:withName:", v5, CFSTR("extensionBundleRelativeFilePath"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontPostScriptName"));

  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleRelativeFilePath"));

}

- (PRPosterCustomTimeFontConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  PRPosterCustomTimeFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fontPostScriptName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("extensionBundleRelativeFilePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = -[PRPosterCustomTimeFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v6, v8);
    v10 = self;
  }

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterCustomTimeFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontPostScriptName"));

  -[PRPosterCustomTimeFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleRelativeFilePath"));

}

- (PRPosterCustomTimeFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  PRPosterCustomTimeFontConfiguration *v10;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fontPostScriptName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("extensionBundleRelativeFilePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = -[PRPosterCustomTimeFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v6, v8);
    v10 = self;
  }

  return v10;
}

- (NSString)fontPostScriptName
{
  return self->_fontPostScriptName;
}

- (NSString)extensionBundleRelativeFilePath
{
  return self->_extensionBundleRelativeFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleRelativeFilePath, 0);
  objc_storeStrong((id *)&self->_fontPostScriptName, 0);
}

@end
