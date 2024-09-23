@implementation SearchUIStoreButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  return 0;
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  void *v8;
  SearchUIButtonItem *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  -[SearchUIButtonItemGenerator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "deviceIsAuthenticated"))
    v9 = -[SearchUIButtonItem initWithSFButtonItem:]([SearchUIButtonItem alloc], "initWithSFButtonItem:", v6);
  else
    v9 = 0;

  v10 = (void *)objc_opt_new();
  -[SearchUIButtonItem setCommand:](v9, "setCommand:", v10);

  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11, 1);

  }
  else
  {
    v7[2](v7, 0, 1);
  }

}

@end
