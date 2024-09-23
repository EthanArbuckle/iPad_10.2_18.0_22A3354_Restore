@implementation RUIPageElement

- (NSString)title
{
  void *v2;
  void *v3;

  -[RUIPageElement page](self, "page");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RUIPageElement page](self, "page");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavTitle:", v4);

}

- (BOOL)isLoading
{
  void *v2;
  char v3;

  -[RUIPageElement page](self, "page");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoading");

  return v3;
}

- (void)setLoading:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[RUIPageElement page](self, "page");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoading:", v3);

}

- (RUIPage)page
{
  return (RUIPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
}

- (id)staticValues
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "title");
  objc_msgSend(v2, "setGetter:", RUIJSPage_getProperty);
  objc_msgSend(v2, "setSetter:", RUIJSPage_setProperty);
  objc_msgSend(v2, "setJSPropertyAttributes:", 8);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "loading");
  objc_msgSend(v3, "setGetter:", RUIJSPage_getProperty);
  objc_msgSend(v3, "setSetter:", RUIJSPage_setProperty);
  objc_msgSend(v3, "setJSPropertyAttributes:", 8);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
