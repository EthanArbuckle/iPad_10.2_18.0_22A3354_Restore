@implementation PKAccountInvitationAccessLevelContentConfiguration

- (PKAccountInvitationAccessLevelContentConfiguration)initWithAccessLevelOption:(id)a3
{
  id v4;
  PKAccountInvitationAccessLevelContentConfiguration *v5;
  uint64_t v6;
  UIImage *image;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *secondarySubtitle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountInvitationAccessLevelContentConfiguration;
  v5 = -[PKAccountInvitationAccessLevelContentConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "image");
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    objc_msgSend(v4, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "subtitle");
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "secondarySubtitle");
    v12 = objc_claimAutoreleasedReturnValue();
    secondarySubtitle = v5->_secondarySubtitle;
    v5->_secondarySubtitle = (NSString *)v12;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountInvitationAccessLevelContentConfiguration *v4;
  PKAccountInvitationAccessLevelContentConfiguration *v5;
  BOOL v6;

  v4 = (PKAccountInvitationAccessLevelContentConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountInvitationAccessLevelContentConfiguration isEqualToAccountInvitationAccessLevelContentConfiguration:](self, "isEqualToAccountInvitationAccessLevelContentConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToAccountInvitationAccessLevelContentConfiguration:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  NSString *secondarySubtitle;
  void *v13;
  NSString *v14;

  v4 = a3;
  if (v4 && PKEqualObjects())
  {
    v5 = (void *)v4[2];
    v6 = self->_title;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      LOBYTE(v9) = 0;
      if (!v6 || !v7)
        goto LABEL_21;
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (!v9)
        goto LABEL_22;
    }
    v10 = (void *)v4[3];
    v6 = self->_subtitle;
    v11 = v10;
    if (v6 == v11)
    {

LABEL_16:
      secondarySubtitle = self->_secondarySubtitle;
      v13 = (void *)v4[4];
      v6 = secondarySubtitle;
      v14 = v13;
      if (v6 == v14)
      {
        LOBYTE(v9) = 1;
        v8 = v6;
      }
      else
      {
        v8 = v14;
        LOBYTE(v9) = 0;
        if (v6 && v14)
          LOBYTE(v9) = -[NSString isEqualToString:](v6, "isEqualToString:", v14);
      }
      goto LABEL_21;
    }
    v8 = v11;
    LOBYTE(v9) = 0;
    if (v6 && v11)
    {
      v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

      if (!v9)
        goto LABEL_22;
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  LOBYTE(v9) = 0;
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_image);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_secondarySubtitle);
  v4 = PKCombinedHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v5 + 8), self->_image);
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_secondarySubtitle, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (id)makeContentView
{
  return -[PKAccountInvitationAccessLevelContentView initWithConfiguration:]([PKAccountInvitationAccessLevelContentView alloc], "initWithConfiguration:", self);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
