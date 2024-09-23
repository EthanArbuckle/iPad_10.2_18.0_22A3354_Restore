@implementation RERecentAction

+ (RERecentAction)actionWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v6 = (_QWORD *)objc_opt_new();
    v7 = objc_msgSend(v5, "copy");

    v8 = (void *)v6[1];
    v6[1] = v7;

    v6[2] = a4;
  }
  else
  {
    v6 = 0;
  }
  return (RERecentAction *)v6;
}

- (unint64_t)hash
{
  return self->_actionIdentifier ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RERecentAction *v4;
  RERecentAction *v5;
  NSString *bundleIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;

  v4 = (RERecentAction *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
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
LABEL_10:

          goto LABEL_11;
        }
      }
      v11 = self->_actionIdentifier == v5->_actionIdentifier;
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[RERecentAction actionWithBundleIdentifier:actionIdentifier:](RERecentAction, "actionWithBundleIdentifier:actionIdentifier:", self->_bundleIdentifier, self->_actionIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(unint64_t)a3
{
  self->_actionIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
