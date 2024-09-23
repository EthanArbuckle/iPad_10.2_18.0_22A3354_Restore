@implementation VUITVApplicationControllerContext

- (id)copyWithZone:(_NSZone *)a3
{
  VUITVApplicationControllerContext *v4;
  void *v5;
  void *v6;

  v4 = -[VUITVApplicationControllerContext init](+[VUITVApplicationControllerContext allocWithZone:](VUITVApplicationControllerContext, "allocWithZone:", a3), "init");
  -[VUITVApplicationControllerContext javaScriptApplicationURL](self, "javaScriptApplicationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITVApplicationControllerContext setJavaScriptApplicationURL:](v4, "setJavaScriptApplicationURL:", v5);

  -[VUITVApplicationControllerContext launchOptions](self, "launchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITVApplicationControllerContext setLaunchOptions:](v4, "setLaunchOptions:", v6);

  return v4;
}

- (void)setLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setJavaScriptApplicationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VUITVApplicationControllerContext)init
{
  VUITVApplicationControllerContext *v2;
  uint64_t v3;
  NSDictionary *launchOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUITVApplicationControllerContext;
  v2 = -[VUITVApplicationControllerContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    launchOptions = v2->_launchOptions;
    v2->_launchOptions = (NSDictionary *)v3;

  }
  return v2;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (NSURL)javaScriptApplicationURL
{
  return self->_javaScriptApplicationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_javaScriptApplicationURL, 0);
}

@end
