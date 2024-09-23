@implementation SLCollaborationFooterViewModel

- (SLCollaborationFooterViewModel)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  SLCollaborationFooterViewModel *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SLCollaborationFooterViewModel;
  v5 = a4;
  v6 = a3;
  v7 = -[SLCollaborationFooterViewModel init](&v13, sel_init);
  v7->_type = 0;
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  title = v7->_title;
  v7->_title = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  subtitle = v7->_subtitle;
  v7->_subtitle = (NSString *)v10;

  return v7;
}

- (SLCollaborationFooterViewModel)initWithFileURL:(id)a3
{
  NSURL *v4;
  SLCollaborationFooterViewModel *v5;
  NSURL *fileURL;
  objc_super v8;

  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  v5 = -[SLCollaborationFooterViewModel init](&v8, sel_init);
  v5->_type = 1;
  fileURL = v5->_fileURL;
  v5->_fileURL = v4;

  return v5;
}

- (SLCollaborationFooterViewModel)initWithContainerSetupInfo:(id)a3
{
  CKContainerSetupInfo *v4;
  SLCollaborationFooterViewModel *v5;
  CKContainerSetupInfo *containerSetupInfo;
  objc_super v8;

  v4 = (CKContainerSetupInfo *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  v5 = -[SLCollaborationFooterViewModel init](&v8, sel_init);
  v5->_type = 2;
  containerSetupInfo = v5->_containerSetupInfo;
  v5->_containerSetupInfo = v4;

  return v5;
}

- (SLCollaborationFooterViewModel)initWithMetadata:(id)a3
{
  _SWCollaborationMetadata *v4;
  SLCollaborationFooterViewModel *v5;
  _SWCollaborationMetadata *metadata;
  objc_super v8;

  v4 = (_SWCollaborationMetadata *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SLCollaborationFooterViewModel;
  v5 = -[SLCollaborationFooterViewModel init](&v8, sel_init);
  v5->_type = 3;
  metadata = v5->_metadata;
  v5->_metadata = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationFooterViewModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SLCollaborationFooterViewModel *v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  NSString *optionsSummary;
  void *v27;

  v4 = a3;
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  v7 = objc_opt_class();
  NSStringFromSelector(sel_title);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_subtitle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_fileURL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_containerSetupInfo);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  NSStringFromSelector(sel_metadata);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v6)
  {
    case 0:
      v22 = -[SLCollaborationFooterViewModel initWithTitle:subtitle:](self, "initWithTitle:subtitle:", v9, v12);
      goto LABEL_6;
    case 1:
      v22 = -[SLCollaborationFooterViewModel initWithFileURL:](self, "initWithFileURL:", v15);
      goto LABEL_6;
    case 2:
      v22 = -[SLCollaborationFooterViewModel initWithContainerSetupInfo:](self, "initWithContainerSetupInfo:", v18);
      goto LABEL_6;
    case 3:
      v22 = -[SLCollaborationFooterViewModel initWithMetadata:](self, "initWithMetadata:", v21);
LABEL_6:
      self = v22;
      break;
    default:
      break;
  }
  if (self)
  {
    v23 = objc_opt_class();
    NSStringFromSelector(sel_optionsSummary);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, v24);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    optionsSummary = self->_optionsSummary;
    self->_optionsSummary = v25;

    NSStringFromSelector(sel_isShareLink);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isShareLink = objc_msgSend(v4, "decodeBoolForKey:", v27);

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
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
  void *v18;
  _BOOL8 v19;
  id v20;

  v4 = a3;
  v5 = -[SLCollaborationFooterViewModel type](self, "type");
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[SLCollaborationFooterViewModel title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLCollaborationFooterViewModel subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_subtitle);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[SLCollaborationFooterViewModel fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[SLCollaborationFooterViewModel containerSetupInfo](self, "containerSetupInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerSetupInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[SLCollaborationFooterViewModel metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[SLCollaborationFooterViewModel optionsSummary](self, "optionsSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_optionsSummary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  v19 = -[SLCollaborationFooterViewModel isShareLink](self, "isShareLink");
  NSStringFromSelector(sel_isShareLink);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

}

- (id)copyWithZone:(_NSZone *)a3
{
  SLCollaborationFooterViewModel *v4;
  void *v5;
  void *v6;
  SLCollaborationFooterViewModel *v7;
  SLCollaborationFooterViewModel *v8;
  uint64_t v9;
  SLCollaborationFooterViewModel *v10;
  SLCollaborationFooterViewModel *v11;
  void *v12;

  switch(-[SLCollaborationFooterViewModel type](self, "type", a3))
  {
    case 0:
      v4 = [SLCollaborationFooterViewModel alloc];
      -[SLCollaborationFooterViewModel title](self, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLCollaborationFooterViewModel subtitle](self, "subtitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SLCollaborationFooterViewModel initWithTitle:subtitle:](v4, "initWithTitle:subtitle:", v5, v6);

      goto LABEL_8;
    case 1:
      v8 = [SLCollaborationFooterViewModel alloc];
      -[SLCollaborationFooterViewModel fileURL](self, "fileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SLCollaborationFooterViewModel initWithFileURL:](v8, "initWithFileURL:", v5);
      goto LABEL_7;
    case 2:
      v10 = [SLCollaborationFooterViewModel alloc];
      -[SLCollaborationFooterViewModel containerSetupInfo](self, "containerSetupInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SLCollaborationFooterViewModel initWithContainerSetupInfo:](v10, "initWithContainerSetupInfo:", v5);
      goto LABEL_7;
    case 3:
      v11 = [SLCollaborationFooterViewModel alloc];
      -[SLCollaborationFooterViewModel metadata](self, "metadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SLCollaborationFooterViewModel initWithMetadata:](v11, "initWithMetadata:", v5);
LABEL_7:
      v7 = (SLCollaborationFooterViewModel *)v9;
LABEL_8:

      break;
    default:
      v7 = 0;
      break;
  }
  -[SLCollaborationFooterViewModel optionsSummary](self, "optionsSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationFooterViewModel setOptionsSummary:](v7, "setOptionsSummary:", v12);

  -[SLCollaborationFooterViewModel setIsShareLink:](v7, "setIsShareLink:", -[SLCollaborationFooterViewModel isShareLink](self, "isShareLink"));
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SLCollaborationFooterViewModel *v6;
  SLCollaborationFooterViewModel *v7;
  uint64_t v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  int v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v6 = (SLCollaborationFooterViewModel *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[SLCollaborationFooterViewModel type](v7, "type");
      if (v8 == -[SLCollaborationFooterViewModel type](self, "type"))
      {
        switch(-[SLCollaborationFooterViewModel type](self, "type"))
        {
          case 0:
            -[SLCollaborationFooterViewModel title](self, "title");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9
              || (-[SLCollaborationFooterViewModel title](v7, "title"),
                  (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[SLCollaborationFooterViewModel title](self, "title");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              -[SLCollaborationFooterViewModel title](v7, "title");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v3, "isEqualToString:", v4))
              {
                v20 = 0;
                goto LABEL_32;
              }
              v25 = v3;
              v10 = 1;
            }
            else
            {
              v26 = 0;
              v10 = 0;
            }
            -[SLCollaborationFooterViewModel subtitle](self, "subtitle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21
              || (-[SLCollaborationFooterViewModel subtitle](v7, "subtitle"),
                  (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[SLCollaborationFooterViewModel subtitle](self, "subtitle");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              -[SLCollaborationFooterViewModel subtitle](v7, "subtitle");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v3, "isEqualToString:", v22);

              if (v21)
                goto LABEL_30;
            }
            else
            {
              v24 = 0;
              v20 = 1;
            }

LABEL_30:
            if (!v10)
              goto LABEL_33;
            v3 = v25;
LABEL_32:

LABEL_33:
            if (v9)
            {

              if (!v20)
                goto LABEL_37;
            }
            else
            {

              if ((v20 & 1) == 0)
                goto LABEL_37;
            }
LABEL_15:
            -[SLCollaborationFooterViewModel optionsSummary](self, "optionsSummary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15
              || (-[SLCollaborationFooterViewModel optionsSummary](v7, "optionsSummary"),
                  (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[SLCollaborationFooterViewModel optionsSummary](self, "optionsSummary");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SLCollaborationFooterViewModel optionsSummary](v7, "optionsSummary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqual:", v17);

              if (v15)
              {

                if (!v18)
                  goto LABEL_37;
              }
              else
              {

                if ((v18 & 1) == 0)
                  goto LABEL_37;
              }
            }
            v19 = -[SLCollaborationFooterViewModel isShareLink](self, "isShareLink");
            v11 = v19 ^ -[SLCollaborationFooterViewModel isShareLink](v7, "isShareLink") ^ 1;
            break;
          case 1:
            -[SLCollaborationFooterViewModel fileURL](self, "fileURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLCollaborationFooterViewModel fileURL](v7, "fileURL");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 2:
            -[SLCollaborationFooterViewModel containerSetupInfo](self, "containerSetupInfo");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLCollaborationFooterViewModel containerSetupInfo](v7, "containerSetupInfo");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 3:
            -[SLCollaborationFooterViewModel metadata](self, "metadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLCollaborationFooterViewModel metadata](v7, "metadata");
            v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v3 = (void *)v13;
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if ((v14 & 1) != 0)
              goto LABEL_15;
            goto LABEL_37;
          default:
            goto LABEL_37;
        }
      }
      else
      {
LABEL_37:
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (NSString)optionsSummary
{
  return self->_optionsSummary;
}

- (void)setOptionsSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isShareLink
{
  return self->_isShareLink;
}

- (void)setIsShareLink:(BOOL)a3
{
  self->_isShareLink = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (_SWCollaborationMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_optionsSummary, 0);
}

@end
