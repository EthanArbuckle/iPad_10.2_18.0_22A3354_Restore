@implementation SearchUICopyButtonItemGenerator

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SearchUICopyButtonItem *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[SearchUICopyButtonItem initWithSFButtonItem:]([SearchUICopyButtonItem alloc], "initWithSFButtonItem:", v7);

  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, uint64_t))a4 + 2))(v6, v9, 1);

}

@end
