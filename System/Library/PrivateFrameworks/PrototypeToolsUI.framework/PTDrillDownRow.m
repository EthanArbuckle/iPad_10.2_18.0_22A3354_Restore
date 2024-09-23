@implementation PTDrillDownRow

id __37__PTDrillDownRow_UI__defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "childKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childSettingsForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend([v9 alloc], "initWithSettings:presentingRow:", v8, v6);

  return v10;
}

@end
