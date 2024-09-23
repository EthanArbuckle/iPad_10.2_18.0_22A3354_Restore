@implementation WFSiriLinkRequest

- (WFSiriLinkRequest)initWithAction:(id)a3 bundleIdentifier:(id)a4 nameOverride:(id)a5 showWhenRun:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  WFSiriLinkRequest *v14;
  WFSiriLinkRequest *v15;
  WFSiriLinkRequest *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFSiriLinkRequest;
  v14 = -[WFSiriActionRequest init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_action, a3);
    objc_storeStrong((id *)&v15->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v15->_nameOverride, a5);
    v15->_showWhenRun = a6;
    v16 = v15;
  }

  return v15;
}

- (WFSiriLinkRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriLinkRequest *v5;
  uint64_t v6;
  LNAction *action;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *nameOverride;
  WFSiriLinkRequest *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFSiriLinkRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (LNAction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameOverride"));
    v10 = objc_claimAutoreleasedReturnValue();
    nameOverride = v5->_nameOverride;
    v5->_nameOverride = (NSString *)v10;

    v5->_showWhenRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showWhenRun"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSiriLinkRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFSiriLinkRequest action](self, "action", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[WFSiriLinkRequest bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  -[WFSiriLinkRequest nameOverride](self, "nameOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("nameOverride"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFSiriLinkRequest showWhenRun](self, "showWhenRun"), CFSTR("showWhenRun"));
}

- (LNAction)action
{
  return self->_action;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)nameOverride
{
  return self->_nameOverride;
}

- (BOOL)showWhenRun
{
  return self->_showWhenRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOverride, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
