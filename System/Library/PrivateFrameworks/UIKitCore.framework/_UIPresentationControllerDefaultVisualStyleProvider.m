@implementation _UIPresentationControllerDefaultVisualStyleProvider

- (id)_init
{
  _UIPresentationControllerDefaultVisualStyleProvider *v2;
  uint64_t v3;
  NSMutableDictionary *providerByIdiom;
  _UIPresentationControllerNullVisualStyleProvider *v5;
  _UIPresentationControllerNullVisualStyleProvider *fallbackProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIPresentationControllerDefaultVisualStyleProvider;
  v2 = -[_UIPresentationControllerDefaultVisualStyleProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    providerByIdiom = v2->_providerByIdiom;
    v2->_providerByIdiom = (NSMutableDictionary *)v3;

    v5 = objc_alloc_init(_UIPresentationControllerNullVisualStyleProvider);
    fallbackProvider = v2->_fallbackProvider;
    v2->_fallbackProvider = v5;

  }
  return v2;
}

- (int64_t)defaultConcreteTransitionStyleForViewController:(id)a3
{
  id v4;
  void *v5;
  _UIPresentationControllerNullVisualStyleProvider *v6;
  char v7;
  _UIPresentationControllerNullVisualStyleProvider *fallbackProvider;
  int64_t v9;

  v4 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (_UIPresentationControllerNullVisualStyleProvider *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_respondsToSelector();
  fallbackProvider = v6;
  if ((v7 & 1) == 0)
    fallbackProvider = self->_fallbackProvider;
  v9 = -[_UIPresentationControllerNullVisualStyleProvider defaultConcreteTransitionStyleForViewController:](fallbackProvider, "defaultConcreteTransitionStyleForViewController:", v4);

  return v9;
}

- (_UISheetPresentationMetrics)defaultSheetMetrics
{
  void *v3;
  _UIPresentationControllerNullVisualStyleProvider *v4;
  char v5;
  _UIPresentationControllerNullVisualStyleProvider *fallbackProvider;
  void *v7;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (_UIPresentationControllerNullVisualStyleProvider *)objc_claimAutoreleasedReturnValue();

  v5 = objc_opt_respondsToSelector();
  fallbackProvider = v4;
  if ((v5 & 1) == 0)
    fallbackProvider = self->_fallbackProvider;
  -[_UIPresentationControllerNullVisualStyleProvider defaultSheetMetrics](fallbackProvider, "defaultSheetMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UISheetPresentationMetrics *)v7;
}

- (int64_t)defaultConcretePresentationStyleForViewController:(id)a3
{
  id v4;
  _UIPresentationControllerNullVisualStyleProvider *v5;
  char v6;
  _UIPresentationControllerNullVisualStyleProvider *fallbackProvider;
  int64_t v8;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForViewController:](self, "_providerForViewController:", v4);
  v5 = (_UIPresentationControllerNullVisualStyleProvider *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  fallbackProvider = v5;
  if ((v6 & 1) == 0)
    fallbackProvider = self->_fallbackProvider;
  v8 = -[_UIPresentationControllerNullVisualStyleProvider defaultConcretePresentationStyleForViewController:](fallbackProvider, "defaultConcretePresentationStyleForViewController:", v4);

  return v8;
}

+ (id)sharedInstance
{
  if (qword_1ECD7F1C0 != -1)
    dispatch_once(&qword_1ECD7F1C0, &__block_literal_global_106);
  return (id)qword_1ECD7F1C8;
}

- (id)_providerForViewController:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_providerForIdiom:(int64_t)a3
{
  NSMutableDictionary *providerByIdiom;
  void *v5;
  void *fallbackProvider;
  void *v7;
  id v8;

  providerByIdiom = self->_providerByIdiom;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](providerByIdiom, "objectForKeyedSubscript:", v5);
  fallbackProvider = (void *)objc_claimAutoreleasedReturnValue();
  v7 = fallbackProvider;
  if (!fallbackProvider)
    fallbackProvider = self->_fallbackProvider;
  v8 = fallbackProvider;

  return v8;
}

- (id)styleForRootPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForRootPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_providerForPresentationController:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultStyleForPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultStyleForPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)styleForSheetPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForSheetPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)styleForPopoverPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForPopoverPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPresentationControllerDefaultVisualStyleProvider presentationControllerForPresentedViewController:inIdiom:](self, "presentationControllerForPresentedViewController:inIdiom:", v4, objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 inIdiom:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _UIPresentationControllerNullVisualStyleProvider *fallbackProvider;

  v6 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "presentationControllerForPresentedViewController:inIdiom:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "presentationControllerForPresentedViewController:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    if (v8)
      goto LABEL_10;
  }
  v10 = objc_opt_respondsToSelector();
  fallbackProvider = self->_fallbackProvider;
  if ((v10 & 1) != 0)
    -[_UIPresentationControllerNullVisualStyleProvider presentationControllerForPresentedViewController:inIdiom:](fallbackProvider, "presentationControllerForPresentedViewController:inIdiom:", v6, a4);
  else
    -[_UIPresentationControllerNullVisualStyleProvider presentationControllerForPresentedViewController:](fallbackProvider, "presentationControllerForPresentedViewController:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

- (void)registerVisualStyleProvider:(id)a3 forIdiom:(int64_t)a4
{
  NSMutableDictionary *providerByIdiom;
  void *v6;
  id v7;
  id v8;

  providerByIdiom = self->_providerByIdiom;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](providerByIdiom, "setObject:forKeyedSubscript:", v7, v8);

}

- (id)styleForAlertPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForAlertPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)styleForSearchPresentationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForPresentationController:](self, "_providerForPresentationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleForSearchPresentationController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)presentationControllerClassForModalPresentationStyle:(int64_t)a3 inIdiom:(int64_t)a4
{
  void *v7;
  objc_class *v8;
  objc_class *v9;

  -[_UIPresentationControllerDefaultVisualStyleProvider _providerForIdiom:](self, "_providerForIdiom:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v8 = (objc_class *)objc_msgSend(v7, "presentationControllerClassForModalPresentationStyle:inIdiom:", a3, a4)) == 0)
  {
    v8 = -[_UIPresentationControllerNullVisualStyleProvider presentationControllerClassForModalPresentationStyle:inIdiom:](self->_fallbackProvider, "presentationControllerClassForModalPresentationStyle:inIdiom:", a3, a4);
  }
  v9 = v8;

  return v9;
}

- (NSMutableDictionary)providerByIdiom
{
  return self->_providerByIdiom;
}

- (void)setProviderByIdiom:(id)a3
{
  objc_storeStrong((id *)&self->_providerByIdiom, a3);
}

- (_UIPresentationControllerNullVisualStyleProvider)fallbackProvider
{
  return self->_fallbackProvider;
}

- (void)setFallbackProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackProvider, 0);
  objc_storeStrong((id *)&self->_providerByIdiom, 0);
}

@end
