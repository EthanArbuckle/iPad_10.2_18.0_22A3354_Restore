@implementation PKSharingMessageExtensionOpenGraphMessage

- (PKSharingMessageExtensionOpenGraphMessage)init
{
  return -[PKSharingMessageExtensionOpenGraphMessage initWithURL:](self, "initWithURL:", 0);
}

- (PKSharingMessageExtensionOpenGraphMessage)initWithURL:(id)a3
{
  id v5;
  PKSharingMessageExtensionOpenGraphMessage *v6;
  PKSharingMessageExtensionOpenGraphMessage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  uint64_t v17;
  NSString *title;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  uint64_t v23;
  NSString *subtitle;
  __CFString *v25;
  __CFString *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UIImage *thumbnail;
  __CFString *v33;
  __CFString *v34;
  int v35;
  uint64_t v36;
  void *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKSharingMessageExtensionOpenGraphMessage;
  v6 = -[PKSharingMessageExtensionOpenGraphMessage init](&v45, sel_init);
  v7 = v6;
  if (v6)
  {
    v39 = v5;
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v7->_url, 0);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = v8;
    objc_msgSend(v8, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (!v10)
      goto LABEL_24;
    v11 = v10;
    v40 = *(_QWORD *)v42;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
        objc_msgSend(v13, "name");
        v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 == CFSTR("title"))
          goto LABEL_10;
        if (!v14)
          goto LABEL_18;
        v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("title"));

        if (v16)
        {
LABEL_10:
          objc_msgSend(v13, "value");
          v17 = objc_claimAutoreleasedReturnValue();
          title = v7->_title;
          v7->_title = (NSString *)v17;

          goto LABEL_18;
        }
        v19 = v9;
        v20 = v15;
        if (v20 == CFSTR("subtitle")
          || (v21 = v20,
              v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("subtitle")),
              v21,
              v22))
        {
          objc_msgSend(v13, "value");
          v23 = objc_claimAutoreleasedReturnValue();
          subtitle = v7->_subtitle;
          v7->_subtitle = (NSString *)v23;

LABEL_17:
          v9 = v19;
          goto LABEL_18;
        }
        v25 = v21;
        if (v25 == CFSTR("image")
          || (v26 = v25,
              v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("image")),
              v26,
              v27))
        {
          v28 = objc_alloc(MEMORY[0x1E0C99D50]);
          objc_msgSend(v13, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v28, "initWithBase64EncodedString:options:", v29, 0);

          v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v30);
          thumbnail = v7->_thumbnail;
          v7->_thumbnail = (UIImage *)v31;

          goto LABEL_17;
        }
        v33 = v26;
        v9 = v19;
        if (v33 == CFSTR("fetched")
          || (v34 = v33,
              v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR("fetched")),
              v34,
              v35))
        {
          v7->_hasFetchedOpenGraphPreview = 1;
        }
LABEL_18:

        ++v12;
      }
      while (v11 != v12);
      v36 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      v11 = v36;
      if (!v36)
      {
LABEL_24:

        v5 = v39;
        break;
      }
    }
  }

  return v7;
}

- (id)urlRepresentation
{
  NSURL *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_isPending)
  {
    v3 = self->_url;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", self->_url, 0);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (self->_title)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("title"), self->_title);
      objc_msgSend(v5, "addObject:", v6);

    }
    if (self->_subtitle)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("subtitle"), self->_subtitle);
      objc_msgSend(v5, "addObject:", v7);

    }
    UIImagePNGRepresentation(self->_thumbnail);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB39D8]);
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("image"), v10);
      objc_msgSend(v5, "addObject:", v11);

    }
    if (self->_hasFetchedOpenGraphPreview)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("fetched"), CFSTR("Yes"));
      objc_msgSend(v5, "addObject:", v12);

    }
    objc_msgSend(v4, "setQueryItems:", v5);
    objc_msgSend(v4, "URL");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("url: '%@'; "), self->_url);
  objc_msgSend(v6, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v6, "appendFormat:", CFSTR("subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (BOOL)hasFetchedOpenGraphPreview
{
  return self->_hasFetchedOpenGraphPreview;
}

- (void)setHasFetchedOpenGraphPreview:(BOOL)a3
{
  self->_hasFetchedOpenGraphPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
