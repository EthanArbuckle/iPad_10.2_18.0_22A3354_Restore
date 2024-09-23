@implementation SKJSUIAnimatorDOMFeature

- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKJSUIAnimatorDOMFeature *v16;
  SKJSUIAnimatorDOMFeature *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKJSUIAnimatorDOMFeature initWithAppContext:DOMFeature:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKJSUIAnimatorDOMFeature;
  v16 = -[IKJSObject initWithAppContext:](&v19, sel_initWithAppContext_, v6);
  v17 = v16;
  if (v16)
    objc_storeWeak((id *)&v16->_feature, v7);

  return v17;
}

- (void)animate:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke;
  block[3] = &unk_1E73A02E8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v3 = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(v4, "animatorFeature:performAnimationWithName:options:", v3, a1[5], a1[6]);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feature);
}

- (void)initWithAppContext:(uint64_t)a3 DOMFeature:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
