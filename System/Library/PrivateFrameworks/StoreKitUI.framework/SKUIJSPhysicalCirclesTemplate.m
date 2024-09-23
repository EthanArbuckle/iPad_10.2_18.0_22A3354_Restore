@implementation SKUIJSPhysicalCirclesTemplate

- (SKUIJSPhysicalCirclesTemplate)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6;
  SKUIJSPhysicalCirclesTemplate *v7;
  id v8;
  objc_super v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, a4);
  v10.receiver = self;
  v10.super_class = (Class)SKUIJSPhysicalCirclesTemplate;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, v6);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_feature, v8);

  }
  objc_destroyWeak(&location);

  return v7;
}

- (void)afterDOMUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0CBE0F8];
  v5 = a3;
  objc_msgSend(v4, "managedValueWithValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "virtualMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addManagedReference:withOwner:", v6, self);
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke;
  v12[3] = &unk_1E73A4A48;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "evaluateDelegateBlockSync:", v12);

}

void __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_2;
  v8[3] = &unk_1E73A1350;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  objc_msgSend(WeakRetained, "_addDOMUpdateBlock:", v8);

}

void __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_3;
  v5[3] = &unk_1E73A1B00;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "evaluate:completionBlock:", v5, 0);

}

uint64_t __48__SKUIJSPhysicalCirclesTemplate_afterDOMUpdate___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "callWithArguments:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)performFinishAnimation:(id)a3
{
  -[SKUIJSPhysicalCirclesTemplate _performAnimationWithType:callback:](self, "_performAnimationWithType:callback:", 0, a3);
}

- (void)performResetAnimation:(id)a3
{
  -[SKUIJSPhysicalCirclesTemplate _performAnimationWithType:callback:](self, "_performAnimationWithType:callback:", 1, a3);
}

- (void)_performAnimationWithType:(int64_t)a3 callback:(id)a4
{
  id v6;
  void *v7;
  SKUIPhysicalCirclesAnimationRequest *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  SKUIPhysicalCirclesAnimationRequest *v15;
  _QWORD v16[5];
  SKUIPhysicalCirclesAnimationRequest *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  SKUIJSPhysicalCirclesTemplate *v22;

  v6 = a4;
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(SKUIPhysicalCirclesAnimationRequest);
  -[SKUIPhysicalCirclesAnimationRequest setAnimationType:](v8, "setAnimationType:", a3);
  v9 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "virtualMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addManagedReference:withOwner:", v10, self);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke;
    v18[3] = &unk_1E73A1350;
    v19 = v7;
    v20 = v10;
    v21 = v12;
    v22 = self;
    v13 = v12;
    v14 = v10;
    -[SKUIPhysicalCirclesAnimationRequest _setCompletionBlock:](v8, "_setCompletionBlock:", v18);

  }
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_3;
  v16[3] = &unk_1E73A2AC8;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v7, "evaluateDelegateBlockSync:", v16);

}

void __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_2;
  v5[3] = &unk_1E73A1B00;
  v2 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "evaluate:completionBlock:", v5, 0);

}

void *__68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_2(uint64_t a1)
{
  void *result;
  void *v3;
  id v4;

  result = *(void **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "callWithArguments:", 0);

    return (void *)objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return result;
}

void __68__SKUIJSPhysicalCirclesTemplate__performAnimationWithType_callback___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "_requestAnimation:", *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feature);
}

@end
