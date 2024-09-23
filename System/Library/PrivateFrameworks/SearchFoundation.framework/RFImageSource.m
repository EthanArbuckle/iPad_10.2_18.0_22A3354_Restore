@implementation RFImageSource

- (RFImageSource)initWithProtobuf:(id)a3
{
  id v4;
  RFImageSource *v5;
  void *v6;
  RFUrlImage *v7;
  void *v8;
  RFUrlImage *v9;
  void *v10;
  RFSymbolImage *v11;
  void *v12;
  RFSymbolImage *v13;
  void *v14;
  RFAppIconImage *v15;
  void *v16;
  RFAppIconImage *v17;
  void *v18;
  RFAvatarImage *v19;
  void *v20;
  RFAvatarImage *v21;
  void *v22;
  RFMonogramImage *v23;
  void *v24;
  RFMonogramImage *v25;
  void *v26;
  RFBadgedImage *v27;
  void *v28;
  RFBadgedImage *v29;
  void *v30;
  RFDefaultBrowserAppIconImage *v31;
  void *v32;
  RFDefaultBrowserAppIconImage *v33;
  RFImageSource *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)RFImageSource;
  v5 = -[RFImageSource init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFUrlImage alloc];
      objc_msgSend(v4, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFUrlImage initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFImageSource setUrl:](v5, "setUrl:", v9);

    }
    objc_msgSend(v4, "symbol");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFSymbolImage alloc];
      objc_msgSend(v4, "symbol");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFSymbolImage initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFImageSource setSymbol:](v5, "setSymbol:", v13);

    }
    objc_msgSend(v4, "app_icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = [RFAppIconImage alloc];
      objc_msgSend(v4, "app_icon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RFAppIconImage initWithProtobuf:](v15, "initWithProtobuf:", v16);
      -[RFImageSource setApp_icon:](v5, "setApp_icon:", v17);

    }
    objc_msgSend(v4, "avatar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [RFAvatarImage alloc];
      objc_msgSend(v4, "avatar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[RFAvatarImage initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[RFImageSource setAvatar:](v5, "setAvatar:", v21);

    }
    objc_msgSend(v4, "monogram");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [RFMonogramImage alloc];
      objc_msgSend(v4, "monogram");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[RFMonogramImage initWithProtobuf:](v23, "initWithProtobuf:", v24);
      -[RFImageSource setMonogram:](v5, "setMonogram:", v25);

    }
    objc_msgSend(v4, "badged_image");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [RFBadgedImage alloc];
      objc_msgSend(v4, "badged_image");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[RFBadgedImage initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[RFImageSource setBadged_image:](v5, "setBadged_image:", v29);

    }
    objc_msgSend(v4, "default_browser_app_icon");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [RFDefaultBrowserAppIconImage alloc];
      objc_msgSend(v4, "default_browser_app_icon");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[RFDefaultBrowserAppIconImage initWithProtobuf:](v31, "initWithProtobuf:", v32);
      -[RFImageSource setDefault_browser_app_icon:](v5, "setDefault_browser_app_icon:", v33);

    }
    if (objc_msgSend(v4, "do_not_show_loading_placeholder"))
      -[RFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", objc_msgSend(v4, "do_not_show_loading_placeholder"));
    v34 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUrl:(id)a3
{
  RFSymbolImage *symbol;
  RFAppIconImage *app_icon;
  RFAvatarImage *avatar;
  RFMonogramImage *monogram;
  RFBadgedImage *badged_image;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_url, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasUrl
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSymbol:(id)a3
{
  RFUrlImage *url;
  RFAppIconImage *app_icon;
  RFAvatarImage *avatar;
  RFMonogramImage *monogram;
  RFBadgedImage *badged_image;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_symbol, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasSymbol
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setApp_icon:(id)a3
{
  RFUrlImage *url;
  RFSymbolImage *symbol;
  RFAvatarImage *avatar;
  RFMonogramImage *monogram;
  RFBadgedImage *badged_image;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_app_icon, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasApp_icon
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAvatar:(id)a3
{
  RFUrlImage *url;
  RFSymbolImage *symbol;
  RFAppIconImage *app_icon;
  RFMonogramImage *monogram;
  RFBadgedImage *badged_image;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 8u;
  objc_storeStrong((id *)&self->_avatar, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasAvatar
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMonogram:(id)a3
{
  RFUrlImage *url;
  RFSymbolImage *symbol;
  RFAppIconImage *app_icon;
  RFAvatarImage *avatar;
  RFBadgedImage *badged_image;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 0x10u;
  objc_storeStrong((id *)&self->_monogram, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasMonogram
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBadged_image:(id)a3
{
  RFUrlImage *url;
  RFSymbolImage *symbol;
  RFAppIconImage *app_icon;
  RFAvatarImage *avatar;
  RFMonogramImage *monogram;
  RFDefaultBrowserAppIconImage *default_browser_app_icon;
  id v11;

  *(_BYTE *)&self->_has |= 0x20u;
  objc_storeStrong((id *)&self->_badged_image, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x40u;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

}

- (BOOL)hasBadged_image
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDefault_browser_app_icon:(id)a3
{
  RFUrlImage *url;
  RFSymbolImage *symbol;
  RFAppIconImage *app_icon;
  RFAvatarImage *avatar;
  RFMonogramImage *monogram;
  RFBadgedImage *badged_image;
  id v11;

  *(_BYTE *)&self->_has |= 0x40u;
  objc_storeStrong((id *)&self->_default_browser_app_icon, a3);
  v11 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  url = self->_url;
  self->_url = 0;

  *(_BYTE *)&self->_has &= ~2u;
  symbol = self->_symbol;
  self->_symbol = 0;

  *(_BYTE *)&self->_has &= ~4u;
  app_icon = self->_app_icon;
  self->_app_icon = 0;

  *(_BYTE *)&self->_has &= ~8u;
  avatar = self->_avatar;
  self->_avatar = 0;

  *(_BYTE *)&self->_has &= ~0x10u;
  monogram = self->_monogram;
  self->_monogram = 0;

  *(_BYTE *)&self->_has &= ~0x20u;
  badged_image = self->_badged_image;
  self->_badged_image = 0;

}

- (BOOL)hasDefault_browser_app_icon
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDo_not_show_loading_placeholder:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_do_not_show_loading_placeholder = a3;
}

- (BOOL)hasDo_not_show_loading_placeholder
{
  return *(_BYTE *)&self->_has >> 7;
}

- (RFImageSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFImageSource *v6;
  RFImageSource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFImageSource initWithData:]([_SFPBRFImageSource alloc], "initWithData:", v5);
  v7 = -[RFImageSource initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFImageSource *v6;

  v4 = a3;
  v6 = -[_SFPBRFImageSource initWithFacade:]([_SFPBRFImageSource alloc], "initWithFacade:", self);
  -[_SFPBRFImageSource data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFImageSource *v2;
  void *v3;

  v2 = -[_SFPBRFImageSource initWithFacade:]([_SFPBRFImageSource alloc], "initWithFacade:", self);
  -[_SFPBRFImageSource dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFImageSource *v2;
  void *v3;

  v2 = -[_SFPBRFImageSource initWithFacade:]([_SFPBRFImageSource alloc], "initWithFacade:", self);
  -[_SFPBRFImageSource jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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
  void *v18;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFImageSource hasUrl](self, "hasUrl"))
  {
    -[RFImageSource url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setUrl:", v6);

  }
  if (-[RFImageSource hasSymbol](self, "hasSymbol"))
  {
    -[RFImageSource symbol](self, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setSymbol:", v8);

  }
  if (-[RFImageSource hasApp_icon](self, "hasApp_icon"))
  {
    -[RFImageSource app_icon](self, "app_icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setApp_icon:", v10);

  }
  if (-[RFImageSource hasAvatar](self, "hasAvatar"))
  {
    -[RFImageSource avatar](self, "avatar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v4, "setAvatar:", v12);

  }
  if (-[RFImageSource hasMonogram](self, "hasMonogram"))
  {
    -[RFImageSource monogram](self, "monogram");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v4, "setMonogram:", v14);

  }
  if (-[RFImageSource hasBadged_image](self, "hasBadged_image"))
  {
    -[RFImageSource badged_image](self, "badged_image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v4, "setBadged_image:", v16);

  }
  if (-[RFImageSource hasDefault_browser_app_icon](self, "hasDefault_browser_app_icon"))
  {
    -[RFImageSource default_browser_app_icon](self, "default_browser_app_icon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v4, "setDefault_browser_app_icon:", v18);

  }
  objc_msgSend(v4, "setDo_not_show_loading_placeholder:", -[RFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RFImageSource *v4;
  RFImageSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v4 = (RFImageSource *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[RFImageSource isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[RFImageSource url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource url](v5, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_26:

        goto LABEL_27;
      }
      -[RFImageSource url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[RFImageSource url](self, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource url](v5, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          LOBYTE(v11) = 0;
LABEL_24:

          goto LABEL_25;
        }
        v65 = v10;
        v66 = v9;
      }
      -[RFImageSource symbol](self, "symbol");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource symbol](v5, "symbol");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_22;
      -[RFImageSource symbol](self, "symbol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[RFImageSource symbol](self, "symbol");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource symbol](v5, "symbol");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v15;
        if (!objc_msgSend(v15, "isEqual:", v62))
          goto LABEL_20;
      }
      v64 = v14;
      -[RFImageSource app_icon](self, "app_icon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource app_icon](v5, "app_icon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          LOBYTE(v11) = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v59 = v16;
      v60 = v17;
      -[RFImageSource app_icon](self, "app_icon");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        -[RFImageSource app_icon](self, "app_icon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource app_icon](v5, "app_icon");
        v57 = v18;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqual:", v58))
        {
LABEL_49:

LABEL_50:
          if (!v14)
            goto LABEL_21;
          goto LABEL_20;
        }
      }
      -[RFImageSource avatar](self, "avatar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource avatar](v5, "avatar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_48;
      }
      v55 = v20;
      v56 = v21;
      -[RFImageSource avatar](self, "avatar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[RFImageSource avatar](self, "avatar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource avatar](v5, "avatar");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqual:"))
          goto LABEL_46;
      }
      v52 = v20;
      v54 = v22;
      -[RFImageSource monogram](self, "monogram");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource monogram](v5, "monogram");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_45;
      }
      v49 = v23;
      v50 = v24;
      -[RFImageSource monogram](self, "monogram");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        -[RFImageSource monogram](self, "monogram");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource monogram](v5, "monogram");
        v47 = v25;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v25, "isEqual:", v48))
          goto LABEL_43;
      }
      -[RFImageSource badged_image](self, "badged_image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource badged_image](v5, "badged_image");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v26 == 0) == (v27 != 0))
      {

        if (!v51)
        {
LABEL_44:

LABEL_45:
          v20 = v52;
          if (!v22)
          {
LABEL_47:

LABEL_48:
            v14 = v64;
            if (!v61)
              goto LABEL_50;
            goto LABEL_49;
          }
LABEL_46:

          goto LABEL_47;
        }
LABEL_43:

        goto LABEL_44;
      }
      v45 = v26;
      v46 = v27;
      -[RFImageSource badged_image](self, "badged_image");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        -[RFImageSource badged_image](self, "badged_image");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFImageSource badged_image](v5, "badged_image");
        v42 = v29;
        v44 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v29, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v35 = (void *)v44;
LABEL_64:

LABEL_65:
          if (v51)
          {

          }
          if (v54)
          {

          }
          if (v61)
          {

          }
          if (v64)
          {

          }
          if (!v8)
            goto LABEL_25;
LABEL_23:
          v10 = v65;
          v9 = v66;
          goto LABEL_24;
        }
        v43 = v28;
      }
      else
      {
        v43 = 0;
      }
      -[RFImageSource default_browser_app_icon](self, "default_browser_app_icon");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFImageSource default_browser_app_icon](v5, "default_browser_app_icon");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v30 == 0) == (v31 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_63;
      }
      v40 = v30;
      v41 = v31;
      -[RFImageSource default_browser_app_icon](self, "default_browser_app_icon");
      v39 = objc_claimAutoreleasedReturnValue();
      if (!v39
        || (-[RFImageSource default_browser_app_icon](self, "default_browser_app_icon"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            -[RFImageSource default_browser_app_icon](v5, "default_browser_app_icon"),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            v38 = v32,
            objc_msgSend(v32, "isEqual:")))
      {
        v36 = -[RFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder");
        v11 = v36 ^ -[RFImageSource do_not_show_loading_placeholder](v5, "do_not_show_loading_placeholder") ^ 1;
        v34 = (void *)v39;
        if (!v39)
        {
LABEL_62:

LABEL_63:
          v28 = v43;
          v35 = (void *)v44;
          if (!v43)
            goto LABEL_65;
          goto LABEL_64;
        }
        v33 = v48;
      }
      else
      {
        LOBYTE(v11) = 0;
        v33 = v48;
        v34 = (void *)v39;
      }
      v48 = v33;

      goto LABEL_62;
    }
    LOBYTE(v11) = 0;
  }
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  -[RFImageSource url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFImageSource symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RFImageSource app_icon](self, "app_icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RFImageSource avatar](self, "avatar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RFImageSource monogram](self, "monogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RFImageSource badged_image](self, "badged_image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RFImageSource default_browser_app_icon](self, "default_browser_app_icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = v16 ^ -[RFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder");

  return v17;
}

- (RFUrlImage)url
{
  return self->_url;
}

- (RFSymbolImage)symbol
{
  return self->_symbol;
}

- (RFAppIconImage)app_icon
{
  return self->_app_icon;
}

- (RFAvatarImage)avatar
{
  return self->_avatar;
}

- (RFMonogramImage)monogram
{
  return self->_monogram;
}

- (RFBadgedImage)badged_image
{
  return self->_badged_image;
}

- (RFDefaultBrowserAppIconImage)default_browser_app_icon
{
  return self->_default_browser_app_icon;
}

- (BOOL)do_not_show_loading_placeholder
{
  return self->_do_not_show_loading_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_default_browser_app_icon, 0);
  objc_storeStrong((id *)&self->_badged_image, 0);
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_app_icon, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
