@implementation UIDeferredMenuElement

+ (id)_elementCachingItems:(BOOL)a3 provider:(id)a4
{
  id v5;
  UIDeferredMenuElement *v6;
  void *v7;
  UIDeferredMenuElement *v8;

  v5 = a4;
  v6 = [UIDeferredMenuElement alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("CONTEXT_MENU_LOADING"), CFSTR("Loading…"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIMenuElement initWithTitle:image:imageName:](v6, "initWithTitle:image:imageName:", v7, 0, 0);

  v8->_cachesItems = a3;
  -[UIDeferredMenuElement setAttributes:](v8, "setAttributes:", 1);
  -[UIDeferredMenuElement setElementProvider:](v8, "setElementProvider:", v5);

  return v8;
}

- (void)setElementProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

+ (UIDeferredMenuElement)elementWithProvider:(void *)elementProvider
{
  return (UIDeferredMenuElement *)objc_msgSend(a1, "_elementCachingItems:provider:", 1, elementProvider);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fulfilledElements, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_metadata, 0);
  objc_storeStrong(&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
}

+ (UIDeferredMenuElement)elementWithUncachedProvider:(void *)elementProvider
{
  return (UIDeferredMenuElement *)objc_msgSend(a1, "_elementCachingItems:provider:", 0, elementProvider);
}

- (void)_fulfillIfNecessary
{
  void *v3;
  _BOOL4 isSignalingFulfillment;
  NSArray *fulfilledElements;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[5];

  -[UIDeferredMenuElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    isSignalingFulfillment = self->_isSignalingFulfillment;

    if (!isSignalingFulfillment)
    {
      if (!self->_cachesItems)
      {
        self->_fulfilled = 0;
        fulfilledElements = self->_fulfilledElements;
        self->_fulfilledElements = 0;

      }
      if (!-[UIDeferredMenuElement fulfilled](self, "fulfilled"))
      {
        self->_fulfilled = 1;
        -[UIDeferredMenuElement elementProvider](self, "elementProvider");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (self->_cachesItems)
          -[UIDeferredMenuElement setElementProvider:](self, "setElementProvider:", 0);
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __44__UIDeferredMenuElement__fulfillIfNecessary__block_invoke;
        v7[3] = &unk_1E16B1548;
        v7[4] = self;
        ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v7);

      }
    }
  }
}

void __44__UIDeferredMenuElement__fulfillIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deferredMenuElementWasFulfilled:", *(_QWORD *)(a1 + 32));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (BOOL)_isLoadingPlaceholder
{
  return 1;
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a6)
    (*((void (**)(id, UIDeferredMenuElement *))a6 + 2))(a6, self);
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    (*((void (**)(id, UIDeferredMenuElement *))a4 + 2))(a4, self);
}

- (id)_leafAlternates
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_leafKeyInput
{
  return 0;
}

- (int64_t)_leafKeyModifierFlags
{
  return 0;
}

- (BOOL)_isDefaultCommand
{
  return 0;
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return 0;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  return 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return 0;
}

- (BOOL)keepsMenuPresented
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIDeferredMenuElement;
  -[UIMenuElement encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDeferredMenuElement cachesItems](self, "cachesItems"), CFSTR("cachesItems"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDeferredMenuElement fulfilled](self, "fulfilled"), CFSTR("fulfilled"));
  -[UIDeferredMenuElement fulfilledElements](self, "fulfilledElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIDeferredMenuElement fulfilledElements](self, "fulfilledElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fulfilledElements"));

  }
}

- (UIDeferredMenuElement)initWithCoder:(id)a3
{
  id v4;
  UIDeferredMenuElement *v5;
  UIDeferredMenuElement *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *fulfilledElements;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDeferredMenuElement;
  v5 = -[UIMenuElement initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIDeferredMenuElement setAttributes:](v5, "setAttributes:", 1);
    v6->_cachesItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cachesItems"));
    v6->_fulfilled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fulfilled"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("fulfilledElements"));
    v10 = objc_claimAutoreleasedReturnValue();
    fulfilledElements = v6->_fulfilledElements;
    v6->_fulfilledElements = (NSArray *)v10;

  }
  return v6;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDeferredMenuElement;
  -[UIDeferredMenuElement description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_requiresAuthenticatedInput;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)cachesItems
{
  return self->_cachesItems;
}

- (id)sender
{
  return self->_sender;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)elementProvider
{
  return self->_elementProvider;
}

- (id)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong(&self->_metadata, a3);
}

- (UIDeferredMenuElementDelegate)delegate
{
  return (UIDeferredMenuElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)fulfilledElements
{
  return self->_fulfilledElements;
}

- (BOOL)fulfilled
{
  return self->_fulfilled;
}

@end
