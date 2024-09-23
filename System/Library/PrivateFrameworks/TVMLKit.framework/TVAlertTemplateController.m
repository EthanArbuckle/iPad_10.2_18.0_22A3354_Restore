@implementation TVAlertTemplateController

_TVAlertTemplateController_iOS *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVAlertTemplateController_iOS *v6;
  _TVAlertTemplateController_iOS *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVAlertTemplateController_iOS *)v5;
  else
    v6 = objc_alloc_init(_TVAlertTemplateController_iOS);
  v7 = v6;
  -[_TVAlertTemplateController_iOS updateWithTemplateElement:](v6, "updateWithTemplateElement:", v4);

  return v7;
}

_TVAlertTemplateController_iOS *__50___TVTemplateFactory__registerTemplateControllers__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _TVAlertTemplateController_iOS *v6;
  _TVAlertTemplateController_iOS *v7;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (_TVAlertTemplateController_iOS *)v5;
  else
    v6 = objc_alloc_init(_TVAlertTemplateController_iOS);
  v7 = v6;
  -[_TVAlertTemplateController_iOS updateWithViewElement:](v6, "updateWithViewElement:", v4);

  return v7;
}

void __57___TVAlertTemplateController_iOS__presentAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, WeakRetained, 0);

}

@end
