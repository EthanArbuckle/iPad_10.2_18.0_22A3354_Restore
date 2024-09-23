@implementation WFAppIcon

- (WFAppIcon)initWithBundleIdentifier:(id)a3
{
  id v5;
  WFAppIcon *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  WFAppIcon *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFAppIcon;
  v6 = -[WFIcon _init](&v12, sel__init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_bundleIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFAppIcon bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (WFAppIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFAppIcon *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFAppIcon initWithBundleIdentifier:](self, "initWithBundleIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)associatedLogo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  -[WFAppIcon bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v10[0] = CFSTR("com.apple.freeform");
  v10[1] = CFSTR("com.apple.Music");
  v11[0] = CFSTR("FreeformLogo");
  v11[1] = CFSTR("MusicLogo");
  v10[2] = CFSTR("com.apple.musicrecognition");
  v10[3] = CFSTR("com.apple.podcasts");
  v11[2] = CFSTR("ShazamLogo");
  v11[3] = CFSTR("PodcastsLogo");
  v10[4] = CFSTR("com.apple.Translate");
  v11[4] = CFSTR("TranslateLogo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppIcon bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFImage imageNamed:inBundle:](WFImage, "imageNamed:inBundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
