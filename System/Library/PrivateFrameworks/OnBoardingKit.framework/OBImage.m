@implementation OBImage

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return (id)objc_msgSend(a1, "_imageNamed:inBundle:convertToMatchInterfaceStyle:", a3, a4, 1);
}

+ (id)imageNamed:(id)a3
{
  return (id)objc_msgSend(a1, "_imageNamed:inBundle:convertToMatchInterfaceStyle:", a3, 0, 1);
}

+ (id)_imageNamed:(id)a3 inBundle:(id)a4 convertToMatchInterfaceStyle:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  OBImage *v12;
  id v13;
  OBImage *v14;
  NSObject *v15;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    +[OBImage _imageNameForUIInterfaceStyle:originalName:](OBImage, "_imageNameForUIInterfaceStyle:originalName:", objc_msgSend(a1, "rootInterfaceStyle"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = [OBImage alloc];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___OBImage;
  objc_msgSendSuper2(&v18, sel_imageNamed_inBundle_, v11, v9);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = -[OBImage initWithCGImage:](v12, "initWithCGImage:", objc_msgSend(v13, "CGImage"));

  -[OBImage setName:](v14, "setName:", v8);
  -[OBImage setBundle:](v14, "setBundle:", v9);
  -[OBImage setStyle:](v14, "setStyle:", objc_msgSend(a1, "rootInterfaceStyle"));
  if (!v14)
  {
    _OBLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = v8;
      v21 = 2112;
      v22 = v17;
      v23 = 1024;
      v24 = v5;
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_199FE5000, v15, OS_LOG_TYPE_ERROR, "OBImage unable to create image \ninputs: [name: %@ \nbundle: %@\ncomputeCoronaName: %i\ncomputedName:%@\n]", buf, 0x26u);

    }
  }

  return v14;
}

- (id)imageForUserInterfaceStyle:(int64_t)a3
{
  OBImage *v5;
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

  if (-[OBImage style](self, "style") == a3)
  {
    v5 = self;
  }
  else
  {
    v6 = (void *)objc_opt_class();
    -[OBImage name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_imageNameForUIInterfaceStyle:originalName:", a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBImage bundle](self, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBImage _imageNamed:inBundle:convertToMatchInterfaceStyle:](OBImage, "_imageNamed:inBundle:convertToMatchInterfaceStyle:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setStyle:", a3);
    -[OBImage name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v11);

    -[OBImage tintColor](self, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v12);

    -[OBImage bundle](self, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBundle:", v13);

    objc_msgSend(v10, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v10, "tintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_obFlatImageWithColor:", v15);
      v5 = (OBImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = v10;
    }

  }
  return v5;
}

+ (id)_imageNameForUIInterfaceStyle:(int64_t)a3 originalName:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (a3 == 2)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_Corona."));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (int64_t)rootInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  return v4;
}

- (id)_obFlatImageWithColor:(id)a3
{
  id v4;
  OBImage *v5;
  id v6;
  OBImage *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = [OBImage alloc];
  v11.receiver = self;
  v11.super_class = (Class)OBImage;
  -[OBImage _flatImageWithColor:](&v11, sel__flatImageWithColor_, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = -[OBImage initWithCGImage:](v5, "initWithCGImage:", objc_msgSend(v6, "CGImage"));

  -[OBImage setStyle:](v7, "setStyle:", -[OBImage style](self, "style"));
  -[OBImage name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBImage setName:](v7, "setName:", v8);

  -[OBImage bundle](self, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBImage setBundle:](v7, "setBundle:", v9);

  -[OBImage setTintColor:](v7, "setTintColor:", v4);
  return v7;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
