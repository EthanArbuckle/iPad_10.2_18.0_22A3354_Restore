@implementation SBLockScreenPluginApplicationAction

+ (id)actionWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v4);

  objc_msgSend(v5, "setAuthenticationPolicy:", 0);
  return v5;
}

+ (id)actionWithBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleID:", v4);

  objc_msgSend(v5, "setAuthenticationPolicy:", 0);
  return v5;
}

- (BOOL)isApplicationAction
{
  return 1;
}

- (id)description
{
  return -[SBLockScreenPluginApplicationAction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenPluginApplicationAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginAction label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("label"), 1);

  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_bundleID, CFSTR("bundleID"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_url, CFSTR("URL"), 1);
  v8 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_transitionStyle, CFSTR("transitionStyle"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenPluginApplicationAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(unint64_t)a3
{
  self->_transitionStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
