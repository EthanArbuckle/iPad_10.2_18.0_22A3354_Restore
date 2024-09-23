@implementation SearchUIResolvedMediaDestination

+ (id)applicationNameForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    v6 = CFSTR("APPLE_MUSIC");
  }
  else
  {
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToString:", v7);

    if (!v8)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
      objc_msgSend(v10, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v6 = CFSTR("APPLE_PODCASTS");
  }
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SearchUIResolvedMediaDestination *v4;
  SearchUIResolvedMediaDestination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SearchUIResolvedMediaDestination *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIResolvedMediaDestination appBundleIdentifier](v5, "appBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SearchUIResolvedMediaDestination mediaMetadata](self, "mediaMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIResolvedMediaDestination mediaMetadata](v5, "mediaMetadata");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SearchUIResolvedMediaDestination mediaMetadata](self, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *title;

  if (!self->_title)
  {
    -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)objc_opt_class();
      -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applicationNameForBundleIdentifier:", v5);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v6;

    }
  }
  return self->_title;
}

- (SFCommand)command
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFCommand *command;

  if (!self->_command)
  {
    -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[SearchUIResolvedMediaDestination mediaMetadata](self, "mediaMetadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (void *)objc_opt_new();
        -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setClientSelectedBundleIdentifier:", v7);

        -[SearchUIResolvedMediaDestination mediaMetadata](self, "mediaMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setMediaMetadata:", v8);

        command = self->_command;
        self->_command = (SFCommand *)v6;

      }
    }
  }
  return self->_command;
}

- (SearchUIImage)image
{
  void *v3;
  void *v4;
  SearchUIImage *v5;
  SearchUIImage *image;

  if (!self->_image)
  {
    -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v4, 2);
      v5 = (SearchUIImage *)objc_claimAutoreleasedReturnValue();
      image = self->_image;
      self->_image = v5;

    }
  }
  return self->_image;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppBundleIdentifier:", v5);

  -[SearchUIResolvedMediaDestination mediaMetadata](self, "mediaMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaMetadata:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SearchUIResolvedMediaDestination;
  -[SearchUIResolvedMediaDestination description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIResolvedMediaDestination appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
