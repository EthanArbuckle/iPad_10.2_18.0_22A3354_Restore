@implementation WFSpringBoardWebClipMetadata

- (WFSpringBoardWebClipMetadata)initWithShortcutIdentifier:(id)a3 applicationIdentifier:(id)a4 appIsInstalled:(BOOL)a5
{
  id v8;
  id v9;
  WFSpringBoardWebClipMetadata *v10;
  uint64_t v11;
  NSString *shortcutIdentifier;
  uint64_t v13;
  NSString *applicationIdentifier;
  WFSpringBoardWebClipMetadata *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFSpringBoardWebClipMetadata;
  v10 = -[WFSpringBoardWebClipMetadata init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    shortcutIdentifier = v10->_shortcutIdentifier;
    v10->_shortcutIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v13;

    v10->_appIsInstalled = a5;
    v15 = v10;
  }

  return v10;
}

- (WFSpringBoardWebClipMetadata)initWithCoder:(id)a3
{
  id v4;
  WFSpringBoardWebClipMetadata *v5;
  uint64_t v6;
  NSString *shortcutIdentifier;
  uint64_t v8;
  NSString *applicationIdentifier;
  WFSpringBoardWebClipMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSpringBoardWebClipMetadata;
  v5 = -[WFSpringBoardWebClipMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    shortcutIdentifier = v5->_shortcutIdentifier;
    v5->_shortcutIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v8;

    v5->_appIsInstalled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appIsInstalled"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFSpringBoardWebClipMetadata shortcutIdentifier](self, "shortcutIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("shortcutIdentifier"));

  -[WFSpringBoardWebClipMetadata applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("applicationIdentifier"));

  objc_msgSend(v6, "encodeBool:forKey:", -[WFSpringBoardWebClipMetadata appIsInstalled](self, "appIsInstalled"), CFSTR("appIsInstalled"));
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)appIsInstalled
{
  return self->_appIsInstalled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
