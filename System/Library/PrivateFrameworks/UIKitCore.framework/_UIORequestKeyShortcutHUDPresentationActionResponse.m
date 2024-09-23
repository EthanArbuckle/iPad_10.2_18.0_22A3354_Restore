@implementation _UIORequestKeyShortcutHUDPresentationActionResponse

+ (id)_responseWithHUDPresentationResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D017D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forSetting:", v7, 0);
  objc_msgSend(a1, "responseWithInfo:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_UIKeyShortcutHUDPresentationResponse)response
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSActionResponse info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIKeyShortcutHUDPresentationResponse *)v7;
}

@end
