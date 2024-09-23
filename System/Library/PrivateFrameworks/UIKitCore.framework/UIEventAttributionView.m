@implementation UIEventAttributionView

+ (void)_attemptAuthenticationWithEvent:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v2 = (void *)objc_opt_self();
  v3 = v6;
  if (__slotContent)
  {
    objc_msgSend(v6, "_authenticationMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "context") == 1589136771)
      objc_msgSend(v2, "setLastEventMessage:", v5);

    v3 = v6;
  }

}

- (UIEventAttributionView)initWithFrame:(CGRect)a3
{
  UIEventAttributionView *v3;
  UIEventAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIEventAttributionView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIEventAttributionView _commonInit](v3, "_commonInit");
  return v4;
}

- (UIEventAttributionView)initWithCoder:(id)a3
{
  UIEventAttributionView *v3;
  UIEventAttributionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIEventAttributionView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[UIEventAttributionView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[UIEventAttributionView _updateLayerContents](self, "_updateLayerContents");
}

- (void)_updateLayerContents
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__UIEventAttributionView__updateLayerContents__block_invoke;
  v2[3] = &unk_1E16B3F40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __46__UIEventAttributionView__updateLayerContents__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (_slotContent_onceToken != -1)
      dispatch_once(&_slotContent_onceToken, &__block_literal_global_412);
    objc_msgSend((id)__slotContent, "image");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContents:", v2);

    WeakRetained = v4;
  }

}

- (void)setHidden:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIEventAttributionView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (!a3)
    -[UIEventAttributionView _updateLayerContents](self, "_updateLayerContents");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEventAttributionView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIEventAttributionView _updateLayerContents](self, "_updateLayerContents");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIEventAttributionView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[UIEventAttributionView _updateLayerContents](self, "_updateLayerContents");
}

+ (BKSHIDEventAuthenticationMessage)lastEventMessage
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__151;
  v10 = __Block_byref_object_dispose__151;
  v11 = 0;
  _eventMessageQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UIEventAttributionView_lastEventMessage__block_invoke;
  block[3] = &unk_1E16B14C0;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKSHIDEventAuthenticationMessage *)v3;
}

void __42__UIEventAttributionView_lastEventMessage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)__eventMessageQueue_lastEventAttributionAuthenticationMessage);
}

+ (void)setLastEventMessage:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  _eventMessageQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__UIEventAttributionView_setLastEventMessage___block_invoke;
  block[3] = &unk_1E16B1B28;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __46__UIEventAttributionView_setLastEventMessage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v2 = (void *)__eventMessageQueue_lastEventAttributionAuthenticationMessage;
  __eventMessageQueue_lastEventAttributionAuthenticationMessage = v1;

}

@end
