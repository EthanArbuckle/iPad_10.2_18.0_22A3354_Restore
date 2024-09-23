@implementation SBHFakeApplicationPlaceholder

- (void)setProgress:(double)a3
{
  id v4;

  self->_progress = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  -[SBHFakeApplicationPlaceholder applicationBundleIdentifier](self, "applicationBundleIdentifier", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage(v10, 0, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4 traitCollection:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  SBIconImageInfo *v14;
  void *v15;
  void *v16;

  v9 = (int)a5;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  v14 = a4;
  LOBYTE(v9) = SBHIconServicesOptionsForImageOptions(v9);
  -[SBHFakeApplicationPlaceholder applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithTraitCollection(v15, (uint64_t)v14, v9, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 2;
}

- (int64_t)progressStateForIcon:(id)a3
{
  return 2;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)applicationDisplayName
{
  return self->_applicationDisplayName;
}

- (void)setApplicationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
