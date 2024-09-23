@implementation _TVControllerFactory

- (_TVControllerFactory)init
{
  _TVControllerFactory *v2;
  _TVControllerFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVControllerFactory;
  v2 = -[_TVControllerFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_TVControllerFactory _registerControllerCreators](v2, "_registerControllerCreators");
  return v3;
}

- (void)_registerControllerCreators
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke;
  v14[3] = &unk_24EB85748;
  v14[4] = self;
  objc_msgSend(v3, "_registerViewControllerCreator:withType:", v14, 53);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_2;
  v13[3] = &unk_24EB85748;
  v13[4] = self;
  objc_msgSend(v5, "_registerViewControllerCreator:withType:", v13, 14);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_3;
  v12[3] = &unk_24EB85748;
  v12[4] = self;
  objc_msgSend(v6, "_registerViewControllerCreator:withType:", v12, 22);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_4;
  v11[3] = &unk_24EB85748;
  v11[4] = self;
  objc_msgSend(v7, "_registerViewControllerCreator:withType:", v11, 45);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_5;
  v10[3] = &unk_24EB85770;
  v10[4] = self;
  objc_msgSend(v8, "_registerViewControllerCreatorEx:withType:", v10, 9);

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_registerViewControllerCreator:withType:", &__block_literal_global_9, 52);

}

- (id)_carouselControllerForElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TVCarouselViewController *v10;
  _TVCarouselViewController *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (_TVCarouselViewController *)v8;
  else
    v10 = objc_alloc_init(_TVCarouselViewController);
  v11 = v10;
  +[TVCarouselLayout layoutWithLayout:element:](TVCarouselLayout, "layoutWithLayout:element:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVCarouselViewController updateWithViewElement:layout:](v11, "updateWithViewElement:layout:", v9, v12);

  -[_TVCarouselViewController view](v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tv_setLayout:", v12);

  return v11;
}

- (id)_shelfControllerForElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _TVShelfViewController *v10;
  _TVShelfViewController *v11;
  _TVShelfViewController *v12;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("centered"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (_TVShelfViewController *)v5;
  else
    v10 = objc_alloc_init(_TVShelfViewController);
  v11 = v10;
  +[_TVLockupFactory cellMetricsForCollectionElement:](_TVLockupFactory, "cellMetricsForCollectionElement:", v6);
  -[_TVShelfViewController updateWithViewElement:cellMetrics:](v11, "updateWithViewElement:cellMetrics:", v6, &v14);

  -[_TVShelfViewController setCentered:](v11, "setCentered:", v9);
  v12 = v11;

  return v12;
}

- (id)_gridControllerForElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  _TVGridViewController *v7;
  _TVGridViewController *v8;
  uint64_t v10;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (_TVGridViewController *)v5;
  else
    v7 = objc_alloc_init(_TVGridViewController);
  v8 = v7;
  +[_TVLockupFactory cellMetricsForCollectionElement:](_TVLockupFactory, "cellMetricsForCollectionElement:", v6);
  -[_TVGridViewController updateWithViewElement:cellMetrics:](v8, "updateWithViewElement:cellMetrics:", v6, &v10);

  return v8;
}

- (id)_listControllerForElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  _TVListViewController *v7;
  _TVListViewController *v8;
  _OWORD v10[9];

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (_TVListViewController *)v6;
  else
    v7 = objc_alloc_init(_TVListViewController);
  v8 = v7;
  memset(v10, 0, sizeof(v10));
  -[_TVListViewController updateWithViewElement:cellMetrics:](v7, "updateWithViewElement:cellMetrics:", v5, v10);

  return v8;
}

- (id)_textFieldControllerForElement:(id)a3 existingController:(id)a4
{
  id v5;
  id v6;
  _TVTextFieldViewController *v7;
  _TVTextFieldViewController *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (_TVTextFieldViewController *)v6;
  else
    v7 = objc_alloc_init(_TVTextFieldViewController);
  v8 = v7;
  -[_TVTextFieldViewController updateWithViewElement:](v7, "updateWithViewElement:", v5);

  return v8;
}

@end
