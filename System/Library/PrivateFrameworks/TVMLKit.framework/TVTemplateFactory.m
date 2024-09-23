@implementation TVTemplateFactory

_TVLoadingViewController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVLoadingViewController *v6;
  _TVLoadingViewController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVLoadingViewController *)v5;
  else
    v6 = objc_alloc_init(_TVLoadingViewController);
  v7 = v6;
  -[_TVLoadingViewController updateWithLoadingTemplate:](v6, "updateWithLoadingTemplate:", v4);

  return v7;
}

_TVStackTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVStackTemplateController *v6;
  _TVStackTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVStackTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVStackTemplateController);
  v7 = v6;
  -[_TVStackCommonTemplateController updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

_TVSearchTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVSearchTemplateController *v6;
  _TVSearchTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVSearchTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVSearchTemplateController);
  v7 = v6;
  -[_TVSearchTemplateController updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

_TVDivTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVDivTemplateController *v6;
  _TVDivTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVDivTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVDivTemplateController);
  v7 = v6;
  -[_TVDivTemplateController updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

_TVProductTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVProductTemplateController *v6;
  _TVProductTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVProductTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVProductTemplateController);
  v7 = v6;
  -[_TVProductTemplateController updateWithProductTemplate:](v6, "updateWithProductTemplate:", v4);

  return v7;
}

_TVListTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVListTemplateController *v6;
  _TVListTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVListTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVListTemplateController);
  v7 = v6;
  -[_TVListTemplateController updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

_TVModalPageTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVModalPageTemplateController *v6;
  _TVModalPageTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVModalPageTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVModalPageTemplateController);
  v7 = v6;
  -[_TVModalPageTemplateController updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

_TVSplitTemplateController *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVSplitTemplateController *v6;
  _TVSplitTemplateController *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVSplitTemplateController *)v5;
  else
    v6 = objc_alloc_init(_TVSplitTemplateController);
  v7 = v6;
  -[_TVSplitTemplateController updateWithSplitTemplate:](v6, "updateWithSplitTemplate:", v4);

  return v7;
}

@end
