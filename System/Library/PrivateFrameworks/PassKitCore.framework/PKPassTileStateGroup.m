@implementation PKPassTileStateGroup

+ (id)_createDefaultDashboardGroupStateWithMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = +[PKPassTileState _createWithType:](PKPassTileState, "_createWithType:", 3);
  objc_msgSend(v3, "stateTypeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setEnabled:", 1);
  v5 = (void *)objc_msgSend(v4, "createResolvedStateWithBundle:privateBundle:", 0, 0);

  return v5;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSString *v6;
  NSString *header;
  NSString *v8;
  NSString *footer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileStateGroup;
  v5 = -[PKPassTileState _setUpWithDictionary:](&v11, sel__setUpWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("header"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    header = self->_header;
    self->_header = v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("footer"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    footer = self->_footer;
    self->_footer = v8;

  }
  return v5;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPassTileStateGroup;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileState createResolvedStateWithBundle:privateBundle:](&v14, sel_createResolvedStateWithBundle_privateBundle_, v7, v6);
  PKLocalizedPassStringForPassBundle(self->_header, v7, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8[8];
  v8[8] = v9;

  PKLocalizedPassStringForPassBundle(self->_footer, v7, v6);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v8[9];
  v8[9] = v11;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateGroup)initWithCoder:(id)a3
{
  id v4;
  PKPassTileStateGroup *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *footer;
  uint64_t v10;
  NSString *headerActionTitle;
  uint64_t v12;
  NSString *footerActionTitle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTileStateGroup;
  v5 = -[PKPassTileState initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("header"));
    v6 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footer"));
    v8 = objc_claimAutoreleasedReturnValue();
    footer = v5->_footer;
    v5->_footer = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    headerActionTitle = v5->_headerActionTitle;
    v5->_headerActionTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerActionTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    footerActionTitle = v5->_footerActionTitle;
    v5->_footerActionTitle = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateGroup;
  v4 = a3;
  -[PKPassTileState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_header, CFSTR("header"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_footer, CFSTR("footer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_headerActionTitle, CFSTR("actionTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_footerActionTitle, CFSTR("footerActionTitle"));

}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4;
  id *v5;
  NSString *header;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  _BOOL4 v11;
  char v12;
  NSString *footer;
  NSString *v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateGroup;
  if (-[PKPassTileState isEqualToUnresolvedState:](&v17, sel_isEqualToUnresolvedState_, v4))
  {
    v5 = (id *)v4;
    header = self->_header;
    v7 = (NSString *)v5[8];
    v8 = header;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        goto LABEL_17;
      v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v11)
      {
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    footer = self->_footer;
    v7 = (NSString *)v5[9];
    v14 = footer;
    if (v7 == v14)
    {
      v12 = 1;
      v9 = v7;
      goto LABEL_19;
    }
    v9 = v14;
    if (v7)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);
LABEL_19:

      goto LABEL_20;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_19;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)headerActionTitle
{
  return self->_headerActionTitle;
}

- (void)setHeaderActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)footerActionTitle
{
  return self->_footerActionTitle;
}

- (void)setFooterActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerActionTitle, 0);
  objc_storeStrong((id *)&self->_headerActionTitle, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
