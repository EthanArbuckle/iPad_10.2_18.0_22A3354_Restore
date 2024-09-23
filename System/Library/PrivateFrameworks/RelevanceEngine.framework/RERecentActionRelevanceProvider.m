@implementation RERecentActionRelevanceProvider

- (RERecentActionRelevanceProvider)init
{
  return -[RERecentActionRelevanceProvider initWithBundleIdentifier:actionIdentifier:](self, "initWithBundleIdentifier:actionIdentifier:", &stru_24CF92178, 0);
}

- (RERecentActionRelevanceProvider)initWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4
{
  id v6;
  RERecentActionRelevanceProvider *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RERecentActionRelevanceProvider;
  v7 = -[RERelevanceProvider init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_actionIdentifier = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RERecentActionRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 5) = self->_actionIdentifier;
  objc_storeStrong((id *)v4 + 4, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RERecentActionRelevanceProvider *v4;
  RERecentActionRelevanceProvider *v5;
  NSString *bundleIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;
  objc_super v13;

  v4 = (RERecentActionRelevanceProvider *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)RERecentActionRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v13, sel_isEqual_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        bundleIdentifier = self->_bundleIdentifier;
        v7 = v5->_bundleIdentifier;
        if (bundleIdentifier == v7)
        {

        }
        else
        {
          v8 = v7;
          v9 = bundleIdentifier;
          v10 = -[NSString isEqual:](v9, "isEqual:", v8);

          if (!v10)
          {
            v11 = 0;
LABEL_11:

            goto LABEL_12;
          }
        }
        v11 = self->_actionIdentifier == v5->_actionIdentifier;
        goto LABEL_11;
      }
    }
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (unint64_t)_hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RERecentActionRelevanceProvider;
  v3 = -[RERelevanceProvider _hash](&v5, sel__hash);
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ v3 ^ self->_actionIdentifier;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)RERecentActionRelevanceProvider;
  -[RERecentActionRelevanceProvider description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ bundleIdentifier=%@, actionIdentifier=%llu"), v4, self->_bundleIdentifier, self->_actionIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (RERecentAction)recentAction
{
  return +[RERecentAction actionWithBundleIdentifier:actionIdentifier:](RERecentAction, "actionWithBundleIdentifier:actionIdentifier:", self->_bundleIdentifier, self->_actionIdentifier);
}

@end
