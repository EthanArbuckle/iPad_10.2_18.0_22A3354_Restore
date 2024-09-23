@implementation WFContextualActionIcon

- (WFContextualActionIcon)initWithSystemName:(id)a3
{
  id v5;
  WFContextualActionIcon *v6;
  uint64_t v7;
  NSString *systemName;
  WFContextualActionIcon *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemName"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFContextualActionIcon;
  v6 = -[WFContextualActionIcon init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    systemName = v6->_systemName;
    v6->_systemName = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFContextualActionIcon)initWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5
{
  id v10;
  WFContextualActionIcon *v11;
  WFContextualActionIcon *v12;
  WFContextualActionIcon *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageData"));

  }
  v16.receiver = self;
  v16.super_class = (Class)WFContextualActionIcon;
  v11 = -[WFContextualActionIcon init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageData, a3);
    v12->_imageScale = a4;
    v12->_displayStyle = a5;
    v13 = v12;
  }

  return v12;
}

- (WFContextualActionIcon)initWithImageURL:(id)a3 displayStyle:(unint64_t)a4
{
  id v8;
  WFContextualActionIcon *v9;
  WFContextualActionIcon *v10;
  WFContextualActionIcon *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageURL"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFContextualActionIcon;
  v9 = -[WFContextualActionIcon init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageURL, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (WFContextualActionIcon)initWithImageName:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *imageName;
  WFContextualActionIcon *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageName"));

  }
  objc_msgSend((id)objc_opt_class(), "imageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)WFContextualActionIcon,
        (self = -[WFContextualActionIcon init](&v12, sel_init)) != 0))
  {
    v7 = (NSString *)objc_msgSend(v5, "copy");
    imageName = self->_imageName;
    self->_imageName = v7;

    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WFContextualActionIcon)initWithLNPropertyIdentifier:(id)a3 displayStyle:(unint64_t)a4
{
  id v8;
  WFContextualActionIcon *v9;
  WFContextualActionIcon *v10;
  WFContextualActionIcon *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lnPropertyIdentifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFContextualActionIcon;
  v9 = -[WFContextualActionIcon init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lnPropertyIdentifier, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (WFContextualActionIcon)initWithApplicationBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *applicationBundleIdentifier;
  WFContextualActionIcon *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionIcon.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationBundleIdentifier"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)WFContextualActionIcon,
        (self = -[WFContextualActionIcon init](&v12, sel_init)) != 0))
  {
    v7 = (NSString *)objc_msgSend(v5, "copy");
    applicationBundleIdentifier = self->_applicationBundleIdentifier;
    self->_applicationBundleIdentifier = v7;

    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;

  v3 = (void *)objc_opt_new();
  -[WFContextualActionIcon systemName](self, "systemName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContextualActionIcon systemName](self, "systemName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  }
  -[WFContextualActionIcon imageData](self, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFContextualActionIcon imageData](self, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[WFContextualActionIcon imageScale](self, "imageScale");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v11);

  -[WFContextualActionIcon applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFContextualActionIcon applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFContextualActionIcon displayStyle](self, "displayStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v16);

  v18 = objc_msgSend(v3, "finalize");
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualActionIcon *v4;
  WFContextualActionIcon *v5;
  WFContextualActionIcon *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v4 = (WFContextualActionIcon *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_31:

      goto LABEL_32;
    }
    -[WFContextualActionIcon systemName](v6, "systemName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionIcon systemName](self, "systemName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_29;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    -[WFContextualActionIcon imageData](v6, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionIcon imageData](self, "imageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_28;
      LODWORD(v12) = objc_msgSend(v14, "isEqual:", v18);

      if (!(_DWORD)v12)
        goto LABEL_29;
    }
    -[WFContextualActionIcon imageScale](v6, "imageScale");
    v22 = v21;
    -[WFContextualActionIcon imageScale](self, "imageScale");
    if (v22 != v23)
    {
      LOBYTE(v12) = 0;
LABEL_29:

      goto LABEL_30;
    }
    -[WFContextualActionIcon applicationBundleIdentifier](v6, "applicationBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionIcon applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v26 = v25;
    v19 = v26;
    if (v20 == v26)
    {

    }
    else
    {
      if (!v20 || !v26)
      {

        LOBYTE(v12) = 0;
        goto LABEL_28;
      }
      LODWORD(v12) = objc_msgSend(v20, "isEqualToString:", v26);

      if (!(_DWORD)v12)
        goto LABEL_28;
    }
    v12 = -[WFContextualActionIcon displayStyle](v6, "displayStyle");
    LOBYTE(v12) = v12 == -[WFContextualActionIcon displayStyle](self, "displayStyle");
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(v12) = 1;
LABEL_32:

  return v12;
}

- (NSData)imageData
{
  void *v3;
  void *v4;
  NSData *v5;

  -[WFContextualActionIcon renderedImage](self, "renderedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFContextualActionIcon renderedImage](self, "renderedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PNGRepresentation");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_imageData;
  }

  return v5;
}

- (double)imageScale
{
  void *v3;
  void *v4;
  double v5;
  double imageScale;

  -[WFContextualActionIcon renderedImage](self, "renderedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFContextualActionIcon renderedImage](self, "renderedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    imageScale = v5;

  }
  else
  {
    imageScale = self->_imageScale;
  }

  return imageScale;
}

- (void)loadLNPropertyImageWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD, id);
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id))a3;
  -[WFContextualActionIcon lnPropertyIdentifier](self, "lnPropertyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[WFContextualActionIcon lnPropertyIdentifier](self, "lnPropertyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44140]), "initWithOptions:", 2);
      v25[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v9, "propertiesForIdentifiers:error:", v10, &v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;

      if (v12)
      {
        v4[2](v4, 0, v12);
      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v21 = v13;
          objc_msgSend(v13, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displayRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "image");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "inImage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = -[WFContextualActionIcon displayStyle](self, "displayStyle");
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __60__WFContextualActionIcon_loadLNPropertyImageWithCompletion___block_invoke;
            v22[3] = &unk_1E5FC82E0;
            v23 = v4;
            +[WFContextualActionIcon iconWithINImage:displayStyle:completion:](WFContextualActionIcon, "iconWithINImage:displayStyle:completion:", v18, v19, v22);
            v20 = v23;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFContextualActionIconErrorDomain"), 2, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, 0, v20);
          }

          v14 = v21;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFContextualActionIconErrorDomain"), 1, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, v18);
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFContextualActionIconErrorDomain"), 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFContextualActionIconErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }

}

- (id)renderedImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFContextualActionIcon imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1B5DFC064]();
    v5 = (void *)objc_opt_class();
    -[WFContextualActionIcon imageName](self, "imageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *systemName;
  id v5;

  systemName = self->_systemName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", systemName, CFSTR("systemName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("imageScale"), self->_imageScale);
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageName, CFSTR("imageName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("displayStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lnPropertyIdentifier, CFSTR("lnPropertyIdentifier"));

}

- (WFContextualActionIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFContextualActionIcon *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[WFContextualActionIcon initWithSystemName:](self, "initWithSystemName:", v5);
    v6 = self;
  }
  else
  {
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[WFContextualActionIcon initWithImageURL:displayStyle:](self, "initWithImageURL:displayStyle:", v8, v7);
      v6 = self;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("imageScale"));
      if (v9)
      {
        self = -[WFContextualActionIcon initWithImageData:scale:displayStyle:](self, "initWithImageData:scale:displayStyle:", v9, v7);
        v6 = self;
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          self = -[WFContextualActionIcon initWithImageName:](self, "initWithImageName:", v10);
          v6 = self;
        }
        else
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            self = -[WFContextualActionIcon initWithApplicationBundleIdentifier:](self, "initWithApplicationBundleIdentifier:", v11);
            v6 = self;
          }
          else
          {
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lnPropertyIdentifier"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              self = -[WFContextualActionIcon initWithLNPropertyIdentifier:displayStyle:](self, "initWithLNPropertyIdentifier:displayStyle:", v12, v7);
              v6 = self;
            }
            else
            {
              v6 = 0;
            }

          }
        }

      }
    }

  }
  return v6;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

uint64_t __60__WFContextualActionIcon_loadLNPropertyImageWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (WFContextualActionIcon)iconWithSystemName:(id)a3
{
  id v3;
  WFContextualActionIcon *v4;

  v3 = a3;
  v4 = -[WFContextualActionIcon initWithSystemName:]([WFContextualActionIcon alloc], "initWithSystemName:", v3);

  return v4;
}

+ (WFContextualActionIcon)iconWithImageData:(id)a3 scale:(double)a4 displayStyle:(unint64_t)a5
{
  id v7;
  WFContextualActionIcon *v8;

  v7 = a3;
  v8 = -[WFContextualActionIcon initWithImageData:scale:displayStyle:]([WFContextualActionIcon alloc], "initWithImageData:scale:displayStyle:", v7, a5, a4);

  return v8;
}

+ (WFContextualActionIcon)iconWithImageURL:(id)a3 displayStyle:(unint64_t)a4
{
  id v5;
  WFContextualActionIcon *v6;

  v5 = a3;
  v6 = -[WFContextualActionIcon initWithImageURL:displayStyle:]([WFContextualActionIcon alloc], "initWithImageURL:displayStyle:", v5, a4);

  return v6;
}

+ (WFContextualActionIcon)iconWithImageName:(id)a3
{
  id v3;
  WFContextualActionIcon *v4;

  v3 = a3;
  v4 = -[WFContextualActionIcon initWithImageName:]([WFContextualActionIcon alloc], "initWithImageName:", v3);

  return v4;
}

+ (WFContextualActionIcon)iconWithApplicationBundleIdentifier:(id)a3
{
  id v3;
  WFContextualActionIcon *v4;

  v3 = a3;
  v4 = -[WFContextualActionIcon initWithApplicationBundleIdentifier:]([WFContextualActionIcon alloc], "initWithApplicationBundleIdentifier:", v3);

  return v4;
}

+ (WFContextualActionIcon)iconWithINImage:(id)a3 displayStyle:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  WFContextualActionIcon *result;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "_isSystem")
    && (objc_msgSend(v7, "_name"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    objc_msgSend(v7, "_name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "_imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "_imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContextualActionIcon iconWithImageData:scale:displayStyle:](WFContextualActionIcon, "iconWithImageData:scale:displayStyle:", v10, a4, 0.0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "_uri");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
LABEL_10:
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __66__WFContextualActionIcon_iconWithINImage_displayStyle_completion___block_invoke;
        v16[3] = &unk_1E5FC82B8;
        v17 = v8;
        objc_msgSend(v7, "retrieveImageDataWithCompletion:", v16);
        v14 = v17;
        goto LABEL_11;
      }
      objc_msgSend(v7, "_uri");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFContextualActionIcon iconWithImageURL:displayStyle:](WFContextualActionIcon, "iconWithImageURL:displayStyle:", v10, a4);
      v11 = objc_claimAutoreleasedReturnValue();
    }
  }
  v14 = (void *)v11;

  if (!v14)
    goto LABEL_10;
  (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v14, 0);
LABEL_11:

  return result;
}

+ (id)imageNamed:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB34D0];
    v4 = a3;
    objc_msgSend(v3, "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFImage imageNamed:inBundle:scale:](WFImage, "imageNamed:inBundle:scale:", v4, v5, 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __66__WFContextualActionIcon_iconWithINImage_displayStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "_imageData");
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v3;
    if (v3)
    {
      +[WFContextualActionIcon iconWithImageData:scale:displayStyle:](WFContextualActionIcon, "iconWithImageData:scale:displayStyle:", v3, 0, 0.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4, 0);
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFContextualActionIconErrorDomain"), 3, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (WFIcon)wfIcon
{
  void *v3;
  WFAppIcon *v4;
  void *v5;
  WFImageIcon *v6;
  void *v7;
  WFSymbolIcon *v8;
  void *v9;
  void *v10;
  void *v11;
  WFImage *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  -[WFContextualActionIcon applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [WFAppIcon alloc];
    -[WFContextualActionIcon applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFAppIcon initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);
  }
  else
  {
    -[WFContextualActionIcon systemName](self, "systemName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [WFSymbolIcon alloc];
      -[WFContextualActionIcon systemName](self, "systemName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFColor colorWithSystemColor:](WFColor, "colorWithSystemColor:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFIconColorBackground clearBackground](WFIconColorBackground, "clearBackground");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WFSymbolIcon initWithSymbolName:symbolColor:background:](v8, "initWithSymbolName:symbolColor:background:", v5, v9, v10);

    }
    else
    {
      -[WFContextualActionIcon imageURL](self, "imageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = [WFImage alloc];
      if (v11)
      {
        -[WFContextualActionIcon imageURL](self, "imageURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[WFImage initWithContentsOfURL:](v12, "initWithContentsOfURL:", v13);
      }
      else
      {
        -[WFContextualActionIcon imageData](self, "imageData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContextualActionIcon imageScale](self, "imageScale");
        v14 = -[WFImage initWithData:scale:allowAnimated:](v12, "initWithData:scale:allowAnimated:", v13, 0);
      }
      v5 = (void *)v14;

      if (v5)
      {
        objc_msgSend(v5, "imageWithDisplayStyle:", -[WFContextualActionIcon displayStyle](self, "displayStyle") == 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[WFImageIcon initWithImage:]([WFImageIcon alloc], "initWithImage:", v15);

      }
      else
      {
        v6 = 0;
      }
    }
  }

  return (WFIcon *)v6;
}

@end
