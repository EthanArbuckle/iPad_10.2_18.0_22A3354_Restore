@implementation UISceneLayerPresentationContext

- (UISceneLayerPresentationContext)init
{
  UISceneLayerPresentationContext *v2;
  UISceneLayerPresentationContext *v3;
  UITransformer *transformer;
  NSString *minificationFilterName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISceneLayerPresentationContext;
  v2 = -[UISceneLayerPresentationContext init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hidden = 0;
    transformer = v2->_transformer;
    v2->_transformer = 0;
    v2->_alpha = 1.0;

    v3->_clippingDisabled = 0;
    minificationFilterName = v3->_minificationFilterName;
    v3->_renderingMode = 0;
    v3->_minificationFilterName = 0;

  }
  return v3;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (NSString)_minificationFilterName
{
  return self->_minificationFilterName;
}

- (UITransformer)transformer
{
  return self->_transformer;
}

- (BOOL)isClippingDisabled
{
  return self->_clippingDisabled;
}

- (double)alpha
{
  return self->_alpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minificationFilterName, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

- (id)_initWithSceneLayerPresentationContext:(id)a3
{
  id v4;
  UISceneLayerPresentationContext *v5;
  UISceneLayerPresentationContext *v6;
  uint64_t v7;
  NSString *minificationFilterName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISceneLayerPresentationContext;
  v5 = -[UISceneLayerPresentationContext init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_alpha = *((double *)v4 + 2);
    v5->_hidden = *((_BYTE *)v4 + 24);
    objc_storeStrong((id *)&v5->_transformer, *((id *)v4 + 1));
    v6->_clippingDisabled = *((_BYTE *)v4 + 25);
    v6->_renderingMode = *((_QWORD *)v4 + 4);
    v7 = objc_msgSend(*((id *)v4 + 5), "copy");
    minificationFilterName = v6->_minificationFilterName;
    v6->_minificationFilterName = (NSString *)v7;

  }
  return v6;
}

- (BOOL)_isEqualToDefaultContext
{
  if (qword_1ECD7DD68 != -1)
    dispatch_once(&qword_1ECD7DD68, &__block_literal_global_237);
  return objc_msgSend((id)_MergedGlobals_1056, "isEqual:", self);
}

void __59__UISceneLayerPresentationContext__isEqualToDefaultContext__block_invoke()
{
  UISceneLayerPresentationContext *v0;
  void *v1;

  v0 = objc_alloc_init(UISceneLayerPresentationContext);
  v1 = (void *)_MergedGlobals_1056;
  _MergedGlobals_1056 = (uint64_t)v0;

}

- (NSString)description
{
  return (NSString *)-[UISceneLayerPresentationContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneLayerPresentationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_alpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("alpha"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_transformer, CFSTR("transformer"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hidden, CFSTR("hidden"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_clippingDisabled, CFSTR("clippingDisabled"));
  NSStringFromUISceneRenderingMode(-[UISceneLayerPresentationContext renderingMode](self, "renderingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("renderMode"));

  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_minificationFilterName, CFSTR("minificationFilterName"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneLayerPresentationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  unint64_t alpha;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  alpha = (unint64_t)self->_alpha;
  v4 = self->_hidden + (unint64_t)self->_clippingDisabled;
  v5 = v4 + -[UITransformer hash](self->_transformer, "hash") + alpha;
  v6 = -[UISceneLayerPresentationContext renderingMode](self, "renderingMode");
  v7 = v5 - v6 + 8 * v6;
  -[UISceneLayerPresentationContext _minificationFilterName](self, "_minificationFilterName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  UITransformer *transformer;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 hidden;
  id v11;
  id v12;
  _BOOL8 clippingDisabled;
  id v14;
  id v15;
  double alpha;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  transformer = self->_transformer;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke;
  v39[3] = &unk_1E16B4D40;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", transformer, v39);
  hidden = self->_hidden;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_2;
  v37[3] = &unk_1E16B2268;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", hidden, v37);
  clippingDisabled = self->_clippingDisabled;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_3;
  v35[3] = &unk_1E16B2268;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", clippingDisabled, v35);
  alpha = self->_alpha;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_4;
  v33[3] = &unk_1E16B4CF0;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v33, alpha);
  v19 = -[UISceneLayerPresentationContext renderingMode](self, "renderingMode");
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __43__UISceneLayerPresentationContext_isEqual___block_invoke_5;
  v31[3] = &unk_1E16C7D38;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v19, v31);
  -[UISceneLayerPresentationContext _minificationFilterName](self, "_minificationFilterName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  v27 = 3221225472;
  v28 = __43__UISceneLayerPresentationContext_isEqual___block_invoke_6;
  v29 = &unk_1E16B4D40;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", v22, &v26);

  LOBYTE(v22) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);
  return (char)v22;
}

id __43__UISceneLayerPresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
}

double __43__UISceneLayerPresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderingMode");
}

uint64_t __43__UISceneLayerPresentationContext_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_minificationFilterName");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UISceneLayerPresentationContext _initWithSceneLayerPresentationContext:]([UIMutableSceneLayerPresentationContext alloc], "_initWithSceneLayerPresentationContext:", self);
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setClippingDisabled:(BOOL)a3
{
  self->_clippingDisabled = a3;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (void)_setMinificationFilterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
