@implementation PXSharedAlbumsActivityEntryContributor

- (PXSharedAlbumsActivityEntryContributor)initWithDisplayName:(id)a3 email:(id)a4
{
  id v6;
  id v7;
  PXSharedAlbumsActivityEntryContributor *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  NSString *email;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSharedAlbumsActivityEntryContributor;
  v8 = -[PXSharedAlbumsActivityEntryContributor init](&v16, sel_init);
  if (v8)
  {
    v9 = (const __CFString *)objc_msgSend(v6, "copy");
    v10 = (__CFString *)v9;
    v11 = v9 ? (__CFString *)v9 : &stru_1E5149688;
    objc_storeStrong((id *)&v8->_displayName, v11);

    v12 = objc_msgSend(v7, "copy");
    email = v8->_email;
    v8->_email = (NSString *)v12;

    if (!-[NSString length](v8->_displayName, "length"))
    {
      PLSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Display name is empty for activity entry contributor. Email: %@", buf, 0xCu);
      }

    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedAlbumsActivityEntryContributor;
  if (!-[PXSharedAlbumsActivityEntryContributor isEqual:](&v13, sel_isEqual_, v4))
  {
    v6 = v4;
    if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      v5 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v7 = v6;

    if (!v7)
    {
      v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[PXSharedAlbumsActivityEntryContributor displayName](self, "displayName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v8)
    {

    }
    else
    {
      v9 = objc_msgSend(v6, "isEqualToString:", v8);

      if (!v9)
      {
        v5 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[PXSharedAlbumsActivityEntryContributor email](self, "email");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "email");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
      v5 = 1;
    else
      v5 = objc_msgSend(v10, "isEqualToString:", v11);

    goto LABEL_16;
  }
  v5 = 1;
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_displayName, "hash");
  return -[NSString hash](self->_email, "hash") ^ v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)email
{
  return self->_email;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
