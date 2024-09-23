@implementation PUICustomFontConfiguration

- (PUICustomFontConfiguration)initWithFontPostScriptName:(id)a3 extensionBundleRelativeFilePath:(id)a4
{
  id v6;
  id v7;
  PUICustomFontConfiguration *v8;
  uint64_t v9;
  NSString *fontPostScriptName;
  uint64_t v11;
  NSString *extensionBundleRelativeFilePath;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUICustomFontConfiguration;
  v8 = -[PUIFontConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    fontPostScriptName = v8->_fontPostScriptName;
    v8->_fontPostScriptName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    extensionBundleRelativeFilePath = v8->_extensionBundleRelativeFilePath;
    v8->_extensionBundleRelativeFilePath = (NSString *)v11;

  }
  return v8;
}

- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PUICustomFontConfiguration *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "pui_postScriptName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pui_referencePathRelativeToBundle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    self = -[PUICustomFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v8, v9);
    v10 = self;
  }

  return v10;
}

- (PUICustomFontConfiguration)initWithFont:(id)a3 extensionBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PUICustomFontConfiguration *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "pui_postScriptName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pui_referencePathRelativeToDirectoryAtURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    self = -[PUICustomFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v8, v9);
    v10 = self;
  }

  return v10;
}

- (id)PUIFontWithExtensionBundleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUIFont *v8;

  v4 = a3;
  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[PUIFont initWithCustomFont:]([PUIFont alloc], "initWithCustomFont:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)fontWithExtensionBundleURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "pui_UIFontWithPostScriptName:inBundleAtURL:relativePath:", v5, v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PUICustomFontConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PUICustomFontConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PUICustomFontConfiguration *)a3;
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
      -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUICustomFontConfiguration fontPostScriptName](v7, "fontPostScriptName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10)
      {
        -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUICustomFontConfiguration extensionBundleRelativeFilePath](v7, "extensionBundleRelativeFilePath");
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

  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
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
  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v4, CFSTR("fontPostScriptName"));

  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
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
  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontPostScriptName"));

  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleRelativeFilePath"));

}

- (PUICustomFontConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  PUICustomFontConfiguration *v10;

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
    self = -[PUICustomFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v6, v8);
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
  -[PUICustomFontConfiguration fontPostScriptName](self, "fontPostScriptName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontPostScriptName"));

  -[PUICustomFontConfiguration extensionBundleRelativeFilePath](self, "extensionBundleRelativeFilePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleRelativeFilePath"));

}

- (PUICustomFontConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  PUICustomFontConfiguration *v10;

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
    self = -[PUICustomFontConfiguration initWithFontPostScriptName:extensionBundleRelativeFilePath:](self, "initWithFontPostScriptName:extensionBundleRelativeFilePath:", v6, v8);
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
