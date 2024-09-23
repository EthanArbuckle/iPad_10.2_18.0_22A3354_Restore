@implementation PXFeedConfiguration

- (PXFeedConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 22, CFSTR("%s is not available as initializer"), "-[PXFeedConfiguration init]");

  abort();
}

- (PXFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 specManagerPromise:(id)a4 itemLayoutFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXFeedConfiguration *v11;
  uint64_t v12;
  id dataSourceManagerPromise;
  uint64_t v14;
  id specManagerPromise;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXFeedConfiguration;
  v11 = -[PXFeedConfiguration init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    dataSourceManagerPromise = v11->_dataSourceManagerPromise;
    v11->_dataSourceManagerPromise = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    specManagerPromise = v11->_specManagerPromise;
    v11->_specManagerPromise = (id)v14;

    objc_storeStrong((id *)&v11->_itemLayoutFactory, a5);
  }

  return v11;
}

- (id)dataSourceManager
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[PXFeedConfiguration dataSourceManagerPromise](self, "dataSourceManagerPromise");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, PXFeedConfiguration *))v3)[2](v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PXFeedConfiguration_dataSourceManager__block_invoke;
  v7[3] = &unk_1E51382E8;
  v5 = v4;
  v8 = v5;
  -[PXFeedConfiguration setDataSourceManagerPromise:](self, "setDataSourceManagerPromise:", v7);

  return v5;
}

- (id)specManagerWithExtendedTraitCollection:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PXFeedConfiguration specManagerPromise](self, "specManagerPromise");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, PXFeedConfiguration *, id))v5)[2](v5, self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PXFeedConfiguration_specManagerWithExtendedTraitCollection___block_invoke;
  v9[3] = &unk_1E512CB50;
  v7 = v6;
  v10 = v7;
  -[PXFeedConfiguration setSpecManagerPromise:](self, "setSpecManagerPromise:", v9);

  return v7;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;

  v5 = (PXGadgetSpec *)a3;
  if (self->_gadgetSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    -[PXFeedHorizontalGadgetViewLayoutSpecManager setGadgetSpec:](self->_gadgetViewLayoutSpecManager, "setGadgetSpec:", self->_gadgetSpec);
    v5 = v6;
  }

}

- (id)horizontalGadgetViewSpecManagerWithExtendedTraitCollection:(id)a3
{
  id v5;
  void *v6;
  PXFeedHorizontalGadgetViewLayoutSpecManager *gadgetViewLayoutSpecManager;
  PXGadgetSpecManager *v8;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v9;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v10;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v11;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v12;
  PXFeedHorizontalGadgetViewLayoutSpecManager *v13;
  void *v15;

  v5 = a3;
  -[PXFeedConfiguration gadgetSpec](self, "gadgetSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  gadgetViewLayoutSpecManager = self->_gadgetViewLayoutSpecManager;
  if (v6)
  {
    if (gadgetViewLayoutSpecManager)
    {
      -[PXFeedHorizontalGadgetViewLayoutSpecManager setGadgetSpec:](gadgetViewLayoutSpecManager, "setGadgetSpec:", v6);
    }
    else
    {
      v11 = -[PXFeedHorizontalGadgetViewLayoutSpecManager initWithGadgetSpec:style:]([PXFeedHorizontalGadgetViewLayoutSpecManager alloc], "initWithGadgetSpec:style:", v6, -[PXFeedConfiguration horizontalGadgetStyle](self, "horizontalGadgetStyle"));
      v12 = self->_gadgetViewLayoutSpecManager;
      self->_gadgetViewLayoutSpecManager = v11;

    }
  }
  else if (!gadgetViewLayoutSpecManager)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 65, CFSTR("either a gadgetSpec needs to be specified on %@, or an extended trait collection must be provide"), self);

    }
    v8 = -[PXGadgetSpecManager initWithGadgetSpecClass:scrollAxis:traitCollection:]([PXGadgetSpecManager alloc], "initWithGadgetSpecClass:scrollAxis:traitCollection:", objc_opt_class(), 2, v5);
    v9 = -[PXFeedHorizontalGadgetViewLayoutSpecManager initWithGadgetSpecManager:style:]([PXFeedHorizontalGadgetViewLayoutSpecManager alloc], "initWithGadgetSpecManager:style:", v8, -[PXFeedConfiguration horizontalGadgetStyle](self, "horizontalGadgetStyle"));
    v10 = self->_gadgetViewLayoutSpecManager;
    self->_gadgetViewLayoutSpecManager = v9;

  }
  v13 = self->_gadgetViewLayoutSpecManager;

  return v13;
}

- (id)createSeeAllViewController
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 80, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration createSeeAllViewController]", v6);

  abort();
}

- (int64_t)horizontalGadgetStyle
{
  return 1;
}

- (unint64_t)gadgetType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 88, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration gadgetType]", v6);

  abort();
}

- (NSString)gadgetLocalizedTitle
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 92, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration gadgetLocalizedTitle]", v6);

  abort();
}

- (BOOL)wantsMultilineGadgetTitle
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 96, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration wantsMultilineGadgetTitle]", v6);

  abort();
}

- (unint64_t)gadgetAccessoryButtonType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration gadgetAccessoryButtonType]", v6);

  abort();
}

- (BOOL)hidesBackButton
{
  return 0;
}

- (BOOL)wantsEmbeddedScrollView
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 108, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration wantsEmbeddedScrollView]", v6);

  abort();
}

- (BOOL)allowsPopOnEmptyBehavior
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 112, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration allowsPopOnEmptyBehavior]", v6);

  abort();
}

- (int64_t)selectionContext
{
  return 10;
}

- (NSString)gadgetAccessoryButtonLocalizedTitle
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedConfiguration.m"), 123, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXFeedConfiguration gadgetAccessoryButtonLocalizedTitle]", v6);

  abort();
}

- (NSString)viewControllerTitle
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (id)objectReferenceForDestination:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PXFeedConfiguration dataSourceManagerPromise](self, "dataSourceManagerPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedConfiguration specManagerPromise](self, "specManagerPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedConfiguration itemLayoutFactory](self, "itemLayoutFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDataSourceManagerPromise:specManagerPromise:itemLayoutFactory:", v5, v6, v7);

  -[PXFeedConfiguration chromeControllerPromise](self, "chromeControllerPromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChromeControllerPromise:", v9);

  -[PXFeedConfiguration placeholderFactory](self, "placeholderFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholderFactory:", v10);

  -[PXFeedConfiguration actionPerformer](self, "actionPerformer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionPerformer:", v11);

  -[PXFeedConfiguration mediaProvider](self, "mediaProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaProvider:", v12);

  objc_msgSend(v8, "setShouldEmbedContentLayout:", -[PXFeedConfiguration shouldEmbedContentLayout](self, "shouldEmbedContentLayout"));
  -[PXFeedConfiguration visibleRectChangeObserver](self, "visibleRectChangeObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVisibleRectChangeObserver:", v13);

  return v8;
}

- (id)dataSourceManagerPromise
{
  return self->_dataSourceManagerPromise;
}

- (void)setDataSourceManagerPromise:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)specManagerPromise
{
  return self->_specManagerPromise;
}

- (void)setSpecManagerPromise:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)chromeControllerPromise
{
  return self->_chromeControllerPromise;
}

- (void)setChromeControllerPromise:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (void)setItemLayoutFactory:(id)a3
{
  objc_storeStrong((id *)&self->_itemLayoutFactory, a3);
}

- (PXFeedPlaceholderFactory)placeholderFactory
{
  return self->_placeholderFactory;
}

- (void)setPlaceholderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFactory, a3);
}

- (PXFeedActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (void)setActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_actionPerformer, a3);
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (BOOL)shouldEmbedContentLayout
{
  return self->_shouldEmbedContentLayout;
}

- (void)setShouldEmbedContentLayout:(BOOL)a3
{
  self->_shouldEmbedContentLayout = a3;
}

- (id)visibleRectChangeObserver
{
  return self->_visibleRectChangeObserver;
}

- (void)setVisibleRectChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_storeStrong(&self->_visibleRectChangeObserver, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_placeholderFactory, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_storeStrong(&self->_chromeControllerPromise, 0);
  objc_storeStrong(&self->_specManagerPromise, 0);
  objc_storeStrong(&self->_dataSourceManagerPromise, 0);
  objc_storeStrong((id *)&self->_gadgetViewLayoutSpecManager, 0);
}

id __62__PXFeedConfiguration_specManagerWithExtendedTraitCollection___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __40__PXFeedConfiguration_dataSourceManager__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
