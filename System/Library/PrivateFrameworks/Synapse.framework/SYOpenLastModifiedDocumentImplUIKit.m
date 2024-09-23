@implementation SYOpenLastModifiedDocumentImplUIKit

- (void)revealDocumentAtURL:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = (void (**)(id, uint64_t, id))a4;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScheme:", CFSTR("shareddocuments"));
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "openSensitiveURL:withOptions:error:", v7, 0, &v11);
  v10 = v11;

  if (v5)
    v5[2](v5, v9, v10);

}

@end
