@implementation VSOnscreenCodeViewModel

- (void)configureWithRequest:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[VSOnscreenCodeViewModel generateQRCode](self, "generateQRCode");
  v5.receiver = self;
  v5.super_class = (Class)VSOnscreenCodeViewModel;
  -[VSViewModel configureWithRequest:](&v5, sel_configureWithRequest_, v4);

}

- (id)websiteURLWithQueryParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self webPageURL] parameter must not be nil."));
  -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
  if (!v6)
  {

    return 0;
  }
  v7 = v6;
  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  v32 = v5;
  if (v8)
  {
    objc_msgSend(v7, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [[urlComponents queryItems] mutableCopy] parameter must not be nil."));
    objc_msgSend(v7, "queryItems", v7, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "mutableCopy");

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v19, "name", v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("code"));

        objc_msgSend(v19, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSOnscreenCodeViewModel onscreenCode](self, "onscreenCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if ((v21 & 1) != 0 || (v24 & 1) != 0)
        {
          v27 = v14;
          v29 = v31;
          goto LABEL_23;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v16)
        continue;
      break;
    }
  }

  v25 = objc_alloc(MEMORY[0x24BDD1838]);
  -[VSOnscreenCodeViewModel onscreenCode](self, "onscreenCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("code"), v26);

  objc_msgSend(v14, "addObject:", v27);
  v28 = (void *)objc_msgSend(v14, "copy");
  v29 = v31;
  objc_msgSend(v31, "setQueryItems:", v28);

LABEL_23:
  objc_msgSend(v29, "URL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)formattedWebsiteURL
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;

  -[VSOnscreenCodeViewModel webPageLabel](self, "webPageLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v5 = &stru_24FE1B848;
      return v5;
    }
    -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self webPageURL] parameter must not be nil."));
    -[VSOnscreenCodeViewModel webPageURL](self, "webPageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v8, 0);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      objc_msgSend(v11, "host");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(&stru_24FE1B848, "stringByAppendingString:", v12);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = &stru_24FE1B848;
      }
      objc_msgSend(v11, "port");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
      {
        -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(":%@"), v15);
        v17 = objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v17;
      }
      objc_msgSend(v11, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_28;
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "resourceSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      if (!v13)
      {
        v5 = &stru_24FE1B848;
LABEL_30:

        return v5;
      }
      v12 = v13;
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("//")))
      {
        objc_msgSend(v12, "substringFromIndex:", 2);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (__CFString *)v12;
      }
      v5 = v14;
      -[__CFString componentsSeparatedByString:](v14, "componentsSeparatedByString:", CFSTR("?"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "count") < 2)
      {
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v16, "firstObject");
      v20 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v20;
      if (v20)
        v21 = (void *)v20;
      else
        v21 = v5;
      v19 = v21;
    }
    v22 = v19;

    v5 = v22;
LABEL_28:

    goto LABEL_29;
  }
  -[VSOnscreenCodeViewModel webPageLabel](self, "webPageLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [self webPageLabel] parameter must not be nil."));
  -[VSOnscreenCodeViewModel webPageLabel](self, "webPageLabel");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (NSItemProvider)logoProvider
{
  return self->_logoProvider;
}

- (void)setLogoProvider:(id)a3
{
  objc_storeStrong((id *)&self->_logoProvider, a3);
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
  objc_storeStrong((id *)&self->_logo, a3);
}

- (CGSize)preferredLogoSize
{
  double width;
  double height;
  CGSize result;

  width = self->preferredLogoSize.width;
  height = self->preferredLogoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredLogoSize:(CGSize)a3
{
  self->preferredLogoSize = a3;
}

- (BOOL)logoFinishedLoading
{
  return self->logoFinishedLoading;
}

- (void)setLogoFinishedLoading:(BOOL)a3
{
  self->logoFinishedLoading = a3;
}

- (NSString)logoAccessibilityLabel
{
  return self->_logoAccessibilityLabel;
}

- (void)setLogoAccessibilityLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (VSOnscreenCodeViewModelDelegate)delegate
{
  return (VSOnscreenCodeViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImage)qrCode
{
  return self->_qrCode;
}

- (void)setQrCode:(id)a3
{
  objc_storeStrong((id *)&self->_qrCode, a3);
}

- (NSString)onscreenCode
{
  return self->_onscreenCode;
}

- (void)setOnscreenCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)webPageLabel
{
  return self->_webPageLabel;
}

- (void)setWebPageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_webPageLabel, a3);
}

- (NSURL)webPageURL
{
  return self->_webPageURL;
}

- (void)setWebPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)showButtonLockup
{
  return self->_showButtonLockup;
}

- (void)setShowButtonLockup:(BOOL)a3
{
  self->_showButtonLockup = a3;
}

- (NSString)buttonLockupTitle
{
  return self->_buttonLockupTitle;
}

- (void)setButtonLockupTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonLockupTitle, 0);
  objc_storeStrong((id *)&self->_webPageURL, 0);
  objc_storeStrong((id *)&self->_webPageLabel, 0);
  objc_storeStrong((id *)&self->_onscreenCode, 0);
  objc_storeStrong((id *)&self->_qrCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logoAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoProvider, 0);
}

@end
