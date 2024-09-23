@implementation PXSettingsSearchResult

- (PXSettingsSearchResult)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsIndex.m"), 223, CFSTR("%s is not available as initializer"), "-[PXSettingsSearchResult init]");

  abort();
}

- (id)_initWithEntry:(id)a3
{
  id v5;
  PXSettingsSearchResult *v6;
  PXSettingsSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSettingsSearchResult;
  v6 = -[PXSettingsSearchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entry, a3);

  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PXSettingsSearchResult entry](self, "entry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[PXSettingsSearchResult entry](self, "entry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PXSettingsSearchResult entry](self, "entry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PXSettingsSearchResult_revealInSettingsController_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E513FE10;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "revealInSettingsController:withCompletionHandler:", v7, v10);

}

- (_PXSettingsIndexEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

uint64_t __75__PXSettingsSearchResult_revealInSettingsController_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
