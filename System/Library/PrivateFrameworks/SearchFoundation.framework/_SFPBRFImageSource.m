@implementation _SFPBRFImageSource

- (_SFPBRFImageSource)initWithFacade:(id)a3
{
  id v4;
  _SFPBRFImageSource *v5;
  void *v6;
  _SFPBRFUrlImage *v7;
  void *v8;
  _SFPBRFUrlImage *v9;
  void *v10;
  _SFPBRFSymbolImage *v11;
  void *v12;
  _SFPBRFSymbolImage *v13;
  void *v14;
  _SFPBRFAppIconImage *v15;
  void *v16;
  _SFPBRFAppIconImage *v17;
  void *v18;
  _SFPBRFAvatarImage *v19;
  void *v20;
  _SFPBRFAvatarImage *v21;
  void *v22;
  _SFPBRFMonogramImage *v23;
  void *v24;
  _SFPBRFMonogramImage *v25;
  void *v26;
  _SFPBRFBadgedImage *v27;
  void *v28;
  _SFPBRFBadgedImage *v29;
  void *v30;
  _SFPBRFDefaultBrowserAppIconImage *v31;
  void *v32;
  _SFPBRFDefaultBrowserAppIconImage *v33;
  _SFPBRFImageSource *v34;

  v4 = a3;
  v5 = -[_SFPBRFImageSource init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasUrl"))
    {
      objc_msgSend(v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = [_SFPBRFUrlImage alloc];
        objc_msgSend(v4, "url");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_SFPBRFUrlImage initWithFacade:](v7, "initWithFacade:", v8);
        -[_SFPBRFImageSource setUrl:](v5, "setUrl:", v9);

      }
    }
    if (objc_msgSend(v4, "hasSymbol"))
    {
      objc_msgSend(v4, "symbol");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [_SFPBRFSymbolImage alloc];
        objc_msgSend(v4, "symbol");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_SFPBRFSymbolImage initWithFacade:](v11, "initWithFacade:", v12);
        -[_SFPBRFImageSource setSymbol:](v5, "setSymbol:", v13);

      }
    }
    if (objc_msgSend(v4, "hasApp_icon"))
    {
      objc_msgSend(v4, "app_icon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = [_SFPBRFAppIconImage alloc];
        objc_msgSend(v4, "app_icon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[_SFPBRFAppIconImage initWithFacade:](v15, "initWithFacade:", v16);
        -[_SFPBRFImageSource setApp_icon:](v5, "setApp_icon:", v17);

      }
    }
    if (objc_msgSend(v4, "hasAvatar"))
    {
      objc_msgSend(v4, "avatar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = [_SFPBRFAvatarImage alloc];
        objc_msgSend(v4, "avatar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[_SFPBRFAvatarImage initWithFacade:](v19, "initWithFacade:", v20);
        -[_SFPBRFImageSource setAvatar:](v5, "setAvatar:", v21);

      }
    }
    if (objc_msgSend(v4, "hasMonogram"))
    {
      objc_msgSend(v4, "monogram");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = [_SFPBRFMonogramImage alloc];
        objc_msgSend(v4, "monogram");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[_SFPBRFMonogramImage initWithFacade:](v23, "initWithFacade:", v24);
        -[_SFPBRFImageSource setMonogram:](v5, "setMonogram:", v25);

      }
    }
    if (objc_msgSend(v4, "hasBadged_image"))
    {
      objc_msgSend(v4, "badged_image");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = [_SFPBRFBadgedImage alloc];
        objc_msgSend(v4, "badged_image");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[_SFPBRFBadgedImage initWithFacade:](v27, "initWithFacade:", v28);
        -[_SFPBRFImageSource setBadged_image:](v5, "setBadged_image:", v29);

      }
    }
    if (objc_msgSend(v4, "hasDefault_browser_app_icon"))
    {
      objc_msgSend(v4, "default_browser_app_icon");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = [_SFPBRFDefaultBrowserAppIconImage alloc];
        objc_msgSend(v4, "default_browser_app_icon");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[_SFPBRFDefaultBrowserAppIconImage initWithFacade:](v31, "initWithFacade:", v32);
        -[_SFPBRFImageSource setDefault_browser_app_icon:](v5, "setDefault_browser_app_icon:", v33);

      }
    }
    if (objc_msgSend(v4, "hasDo_not_show_loading_placeholder"))
      -[_SFPBRFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", objc_msgSend(v4, "do_not_show_loading_placeholder"));
    v34 = v5;
  }

  return v5;
}

- (void)setUrl:(id)a3
{
  _SFPBRFUrlImage *v4;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFBadgedImage *badged_image;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  _SFPBRFUrlImage *url;

  v4 = (_SFPBRFUrlImage *)a3;
  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = v4 != 0;
  url = self->_url;
  self->_url = v4;

}

- (_SFPBRFUrlImage)url
{
  if (self->_whichValue == 1)
    return self->_url;
  else
    return (_SFPBRFUrlImage *)0;
}

- (void)setSymbol:(id)a3
{
  _SFPBRFSymbolImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFBadgedImage *badged_image;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  _SFPBRFSymbolImage *symbol;

  v4 = (_SFPBRFSymbolImage *)a3;
  url = self->_url;
  self->_url = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = 2 * (v4 != 0);
  symbol = self->_symbol;
  self->_symbol = v4;

}

- (_SFPBRFSymbolImage)symbol
{
  if (self->_whichValue == 2)
    return self->_symbol;
  else
    return (_SFPBRFSymbolImage *)0;
}

- (void)setApp_icon:(id)a3
{
  _SFPBRFAppIconImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFBadgedImage *badged_image;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  unint64_t v11;
  _SFPBRFAppIconImage *app_icon;

  v4 = (_SFPBRFAppIconImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  v11 = 3;
  if (!v4)
    v11 = 0;
  self->_whichValue = v11;
  app_icon = self->_app_icon;
  self->_app_icon = v4;

}

- (_SFPBRFAppIconImage)app_icon
{
  if (self->_whichValue == 3)
    return self->_app_icon;
  else
    return (_SFPBRFAppIconImage *)0;
}

- (void)setAvatar:(id)a3
{
  _SFPBRFAvatarImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFBadgedImage *badged_image;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  _SFPBRFAvatarImage *avatar;

  v4 = (_SFPBRFAvatarImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  self->_whichValue = 4 * (v4 != 0);
  avatar = self->_avatar;
  self->_avatar = v4;

}

- (_SFPBRFAvatarImage)avatar
{
  if (self->_whichValue == 4)
    return self->_avatar;
  else
    return (_SFPBRFAvatarImage *)0;
}

- (void)setMonogram:(id)a3
{
  _SFPBRFMonogramImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFBadgedImage *badged_image;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  unint64_t v11;
  _SFPBRFMonogramImage *monogram;

  v4 = (_SFPBRFMonogramImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  v11 = 5;
  if (!v4)
    v11 = 0;
  self->_whichValue = v11;
  monogram = self->_monogram;
  self->_monogram = v4;

}

- (_SFPBRFMonogramImage)monogram
{
  if (self->_whichValue == 5)
    return self->_monogram;
  else
    return (_SFPBRFMonogramImage *)0;
}

- (void)setBadged_image:(id)a3
{
  _SFPBRFBadgedImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;
  unint64_t v11;
  _SFPBRFBadgedImage *badged_image;

  v4 = (_SFPBRFBadgedImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = 0;

  v11 = 6;
  if (!v4)
    v11 = 0;
  self->_whichValue = v11;
  badged_image = self->_badged_image;
  self->_badged_image = v4;

}

- (_SFPBRFBadgedImage)badged_image
{
  if (self->_whichValue == 6)
    return self->_badged_image;
  else
    return (_SFPBRFBadgedImage *)0;
}

- (void)setDefault_browser_app_icon:(id)a3
{
  _SFPBRFDefaultBrowserAppIconImage *v4;
  _SFPBRFUrlImage *url;
  _SFPBRFSymbolImage *symbol;
  _SFPBRFAppIconImage *app_icon;
  _SFPBRFAvatarImage *avatar;
  _SFPBRFMonogramImage *monogram;
  _SFPBRFBadgedImage *badged_image;
  unint64_t v11;
  _SFPBRFDefaultBrowserAppIconImage *default_browser_app_icon;

  v4 = (_SFPBRFDefaultBrowserAppIconImage *)a3;
  url = self->_url;
  self->_url = 0;

  symbol = self->_symbol;
  self->_symbol = 0;

  app_icon = self->_app_icon;
  self->_app_icon = 0;

  avatar = self->_avatar;
  self->_avatar = 0;

  monogram = self->_monogram;
  self->_monogram = 0;

  badged_image = self->_badged_image;
  self->_badged_image = 0;

  v11 = 7;
  if (!v4)
    v11 = 0;
  self->_whichValue = v11;
  default_browser_app_icon = self->_default_browser_app_icon;
  self->_default_browser_app_icon = v4;

}

- (_SFPBRFDefaultBrowserAppIconImage)default_browser_app_icon
{
  if (self->_whichValue == 7)
    return self->_default_browser_app_icon;
  else
    return (_SFPBRFDefaultBrowserAppIconImage *)0;
}

- (void)setDo_not_show_loading_placeholder:(BOOL)a3
{
  self->_do_not_show_loading_placeholder = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFImageSourceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_SFPBRFImageSource url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource app_icon](self, "app_icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource avatar](self, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource monogram](self, "monogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource badged_image](self, "badged_image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBRFImageSource default_browser_app_icon](self, "default_browser_app_icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBRFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  BOOL v42;
  int do_not_show_loading_placeholder;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_SFPBRFImageSource url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource url](self, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBRFImageSource url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource symbol](self, "symbol");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBRFImageSource symbol](self, "symbol");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbol");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource app_icon](self, "app_icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "app_icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource app_icon](self, "app_icon");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBRFImageSource app_icon](self, "app_icon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "app_icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource avatar](self, "avatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource avatar](self, "avatar");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBRFImageSource avatar](self, "avatar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avatar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource monogram](self, "monogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource monogram](self, "monogram");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBRFImageSource monogram](self, "monogram");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "monogram");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource badged_image](self, "badged_image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "badged_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_SFPBRFImageSource badged_image](self, "badged_image");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBRFImageSource badged_image](self, "badged_image");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "badged_image");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_37;
  }
  else
  {

  }
  -[_SFPBRFImageSource default_browser_app_icon](self, "default_browser_app_icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "default_browser_app_icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBRFImageSource default_browser_app_icon](self, "default_browser_app_icon");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {

LABEL_40:
      do_not_show_loading_placeholder = self->_do_not_show_loading_placeholder;
      v42 = do_not_show_loading_placeholder == objc_msgSend(v4, "do_not_show_loading_placeholder");
      goto LABEL_38;
    }
    v38 = (void *)v37;
    -[_SFPBRFImageSource default_browser_app_icon](self, "default_browser_app_icon");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "default_browser_app_icon");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (v41)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v42 = 0;
LABEL_38:

  return v42;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[_SFPBRFUrlImage hash](self->_url, "hash");
  v4 = -[_SFPBRFSymbolImage hash](self->_symbol, "hash");
  v5 = -[_SFPBRFAppIconImage hash](self->_app_icon, "hash");
  v6 = -[_SFPBRFAvatarImage hash](self->_avatar, "hash");
  v7 = -[_SFPBRFMonogramImage hash](self->_monogram, "hash");
  v8 = -[_SFPBRFBadgedImage hash](self->_badged_image, "hash");
  v9 = -[_SFPBRFDefaultBrowserAppIconImage hash](self->_default_browser_app_icon, "hash");
  v10 = 2654435761;
  if (!self->_do_not_show_loading_placeholder)
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_app_icon)
  {
    -[_SFPBRFImageSource app_icon](self, "app_icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appIcon"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appIcon"));

    }
  }
  if (self->_avatar)
  {
    -[_SFPBRFImageSource avatar](self, "avatar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("avatar"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("avatar"));

    }
  }
  if (self->_badged_image)
  {
    -[_SFPBRFImageSource badged_image](self, "badged_image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("badgedImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("badgedImage"));

    }
  }
  if (self->_default_browser_app_icon)
  {
    -[_SFPBRFImageSource default_browser_app_icon](self, "default_browser_app_icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("defaultBrowserAppIcon"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("defaultBrowserAppIcon"));

    }
  }
  if (self->_do_not_show_loading_placeholder)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBRFImageSource do_not_show_loading_placeholder](self, "do_not_show_loading_placeholder"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("doNotShowLoadingPlaceholder"));

  }
  if (self->_monogram)
  {
    -[_SFPBRFImageSource monogram](self, "monogram");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("monogram"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("monogram"));

    }
  }
  if (self->_symbol)
  {
    -[_SFPBRFImageSource symbol](self, "symbol");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("symbol"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("symbol"));

    }
  }
  if (self->_url)
  {
    -[_SFPBRFImageSource url](self, "url");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("url"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("url"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBRFImageSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBRFImageSource)initWithJSON:(id)a3
{
  void *v4;
  _SFPBRFImageSource *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBRFImageSource initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBRFImageSource)initWithDictionary:(id)a3
{
  id v4;
  _SFPBRFImageSource *v5;
  void *v6;
  _SFPBRFUrlImage *v7;
  void *v8;
  _SFPBRFSymbolImage *v9;
  void *v10;
  _SFPBRFAppIconImage *v11;
  void *v12;
  _SFPBRFAvatarImage *v13;
  void *v14;
  _SFPBRFMonogramImage *v15;
  void *v16;
  _SFPBRFBadgedImage *v17;
  void *v18;
  _SFPBRFDefaultBrowserAppIconImage *v19;
  void *v20;
  _SFPBRFImageSource *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBRFImageSource;
  v5 = -[_SFPBRFImageSource init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBRFUrlImage initWithDictionary:]([_SFPBRFUrlImage alloc], "initWithDictionary:", v6);
      -[_SFPBRFImageSource setUrl:](v5, "setUrl:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbol"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBRFSymbolImage initWithDictionary:]([_SFPBRFSymbolImage alloc], "initWithDictionary:", v8);
      -[_SFPBRFImageSource setSymbol:](v5, "setSymbol:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appIcon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBRFAppIconImage initWithDictionary:]([_SFPBRFAppIconImage alloc], "initWithDictionary:", v10);
      -[_SFPBRFImageSource setApp_icon:](v5, "setApp_icon:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avatar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[_SFPBRFAvatarImage initWithDictionary:]([_SFPBRFAvatarImage alloc], "initWithDictionary:", v12);
      -[_SFPBRFImageSource setAvatar:](v5, "setAvatar:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("monogram"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[_SFPBRFMonogramImage initWithDictionary:]([_SFPBRFMonogramImage alloc], "initWithDictionary:", v14);
      -[_SFPBRFImageSource setMonogram:](v5, "setMonogram:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("badgedImage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[_SFPBRFBadgedImage initWithDictionary:]([_SFPBRFBadgedImage alloc], "initWithDictionary:", v16);
      -[_SFPBRFImageSource setBadged_image:](v5, "setBadged_image:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultBrowserAppIcon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[_SFPBRFDefaultBrowserAppIconImage initWithDictionary:]([_SFPBRFDefaultBrowserAppIconImage alloc], "initWithDictionary:", v18);
      -[_SFPBRFImageSource setDefault_browser_app_icon:](v5, "setDefault_browser_app_icon:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("doNotShowLoadingPlaceholder"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBRFImageSource setDo_not_show_loading_placeholder:](v5, "setDo_not_show_loading_placeholder:", objc_msgSend(v20, "BOOLValue"));
    v21 = v5;

  }
  return v5;
}

- (BOOL)do_not_show_loading_placeholder
{
  return self->_do_not_show_loading_placeholder;
}

- (unint64_t)whichValue
{
  return self->_whichValue;
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
