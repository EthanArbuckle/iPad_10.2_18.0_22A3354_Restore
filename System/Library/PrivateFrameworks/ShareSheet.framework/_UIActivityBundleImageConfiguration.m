@implementation _UIActivityBundleImageConfiguration

- (_UIActivityBundleImageConfiguration)initWithImageName:(id)a3 bundlePath:(id)a4 activityCategory:(int64_t)a5
{
  id v8;
  id v9;
  _UIActivityBundleImageConfiguration *v10;
  uint64_t v11;
  NSString *imageName;
  uint64_t v13;
  NSString *bundlePath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityBundleImageConfiguration;
  v10 = -[_UIActivityBundleImageConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    imageName = v10->_imageName;
    v10->_imageName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    bundlePath = v10->_bundlePath;
    v10->_bundlePath = (NSString *)v13;

    v10->_activityCategory = a5;
  }

  return v10;
}

- (UIImage)fetchedImage
{
  UIImage **p_fetchedImage;
  UIImage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  p_fetchedImage = &self->_fetchedImage;
  v4 = self->_fetchedImage;
  if (!v4)
  {
    -[_UIActivityBundleImageConfiguration imageName](self, "imageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityBundleImageConfiguration bundlePath](self, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v5, v7);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0DC3E88];
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v11 = (void *)MEMORY[0x1E0DC3E88];
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v12, "userInterfaceIdiom"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "traitCollectionWithTraitsFromCollections:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v17, v15);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    objc_storeStrong((id *)p_fetchedImage, v4);

  }
  return v4;
}

- (_UIActivityBundleImageConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIActivityBundleImageConfiguration *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *imageName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *bundlePath;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIActivityBundleImageConfiguration;
  v5 = -[_UIActivityBundleImageConfiguration init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_imageName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_bundlePath);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v12;

    NSStringFromSelector(sel_activityCategory);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activityCategory = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;

  v4 = a3;
  -[_UIActivityBundleImageConfiguration imageName](self, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_imageName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_UIActivityBundleImageConfiguration bundlePath](self, "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundlePath);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[_UIActivityBundleImageConfiguration activityCategory](self, "activityCategory");
  NSStringFromSelector(sel_activityCategory);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_fetchedImage, 0);
}

@end
