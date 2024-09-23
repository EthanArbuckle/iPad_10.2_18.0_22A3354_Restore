@implementation VUIMLFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25 != -1)
    dispatch_once(&sharedInstance_onceToken_25, &__block_literal_global_113);
  return (id)sharedInstance_factory;
}

void __30__VUIMLFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_factory;
  sharedInstance_factory = v0;

}

- (VUIMLFactory)init
{
  VUIMLFactory *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMLFactory;
  v2 = -[VUIMLFactory init](&v4, sel_init);
  if (v2)
    +[VUIMLFactory _registerElements](VUIMLFactory, "_registerElements");
  return v2;
}

+ (void)_registerElements
{
  objc_msgSend(MEMORY[0x1E0DB1850], "registerIKClass:forElementName:elementType:dependent:", objc_opt_class(), CFSTR("confirmationCardTemplate"), 4039, 0);
  objc_msgSend(MEMORY[0x1E0DB1850], "registerIKClass:forElementName:elementType:dependent:", objc_opt_class(), CFSTR("upsellOfferTemplate"), 4031, 0);
  objc_msgSend(MEMORY[0x1E0DB1850], "registerIKClass:forElementName:elementType:dependent:", objc_opt_class(), *MEMORY[0x1E0DB18F0], 36, 0);
  objc_msgSend(MEMORY[0x1E0DB1850], "registerIKClass:forElementName:elementType:dependent:", objc_opt_class(), CFSTR("timeline"), 4021, 0);
  objc_msgSend(MEMORY[0x1E0DB1850], "registerIKClass:forElementName:elementType:dependent:", objc_opt_class(), CFSTR("event"), 4022, 0);
}

- (id)viewForElement:(id)a3 existingView:(id)a4
{
  objc_msgSend(a3, "tv_elementType");
  return 0;
}

- (id)viewControllerForElement:(id)a3 existingViewController:(id)a4
{
  objc_msgSend(a3, "tv_elementType");
  return 0;
}

- (Class)collectionViewCellClassForElement:(id)a3
{
  return 0;
}

- (id)imageProxyForElement:(id)a3 withLayout:(id)a4
{
  return 0;
}

- (id)URLForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMLFactory _URLForResource:inBundle:](self, "_URLForResource:inBundle:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMLFactory _URLForResource:inBundle:](self, "_URLForResource:inBundle:", v4, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageForResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v3, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_URLForResource:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("png"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("jpeg"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
