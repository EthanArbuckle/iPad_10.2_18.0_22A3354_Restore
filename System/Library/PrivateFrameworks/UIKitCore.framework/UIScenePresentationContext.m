@implementation UIScenePresentationContext

- (unint64_t)renderingMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = -[UIScenePresentationContext renderingMode](self->_defaultPresentationContext, "renderingMode");
  v6 = v5;

  return v6;
}

- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext asynchronousRenderingOptions](self->_defaultPresentationContext, "asynchronousRenderingOptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (UISceneAsynchronousRenderingOptions *)v6;
}

- (NSString)_minificationFilterName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext _minificationFilterName](self->_defaultPresentationContext, "_minificationFilterName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (NSDictionary)layerPresentationOverrides
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext layerPresentationOverrides](self->_defaultPresentationContext, "layerPresentationOverrides");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v6;
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderingMode");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  _BOOL8 v47;
  id v48;
  id v49;
  _BOOL8 v50;
  id v51;
  id v52;
  _BOOL8 v53;
  id v54;
  id v55;
  _BOOL8 v56;
  id v57;
  id v58;
  _BOOL8 v59;
  id v60;
  id v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t);
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIScenePresentationContext renderingMode](self, "renderingMode");
  v7 = MEMORY[0x1E0C809B0];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __38__UIScenePresentationContext_isEqual___block_invoke;
  v100[3] = &unk_1E16C7D38;
  v8 = v4;
  v101 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v100);
  v10 = -[UIScenePresentationContext isClippingDisabled](self, "isClippingDisabled");
  v98[0] = v7;
  v98[1] = 3221225472;
  v98[2] = __38__UIScenePresentationContext_isEqual___block_invoke_2;
  v98[3] = &unk_1E16B2268;
  v11 = v8;
  v99 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, v98);
  v13 = -[UIScenePresentationContext _isVisibilityPropagationEnabled](self, "_isVisibilityPropagationEnabled");
  v96[0] = v7;
  v96[1] = 3221225472;
  v96[2] = __38__UIScenePresentationContext_isEqual___block_invoke_3;
  v96[3] = &unk_1E16B2268;
  v14 = v11;
  v97 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v96);
  v16 = -[UIScenePresentationContext appearanceStyle](self, "appearanceStyle");
  v94[0] = v7;
  v94[1] = 3221225472;
  v94[2] = __38__UIScenePresentationContext_isEqual___block_invoke_4;
  v94[3] = &unk_1E16C7D38;
  v17 = v14;
  v95 = v17;
  v18 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v16, v94);
  -[UIScenePresentationContext backgroundColorWhileHosting](self, "backgroundColorWhileHosting");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v7;
  v92[1] = 3221225472;
  v92[2] = __38__UIScenePresentationContext_isEqual___block_invoke_5;
  v92[3] = &unk_1E16B4D40;
  v20 = v17;
  v93 = v20;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", v19, v92);

  -[UIScenePresentationContext backgroundColorWhileNotHosting](self, "backgroundColorWhileNotHosting");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v7;
  v90[1] = 3221225472;
  v90[2] = __38__UIScenePresentationContext_isEqual___block_invoke_6;
  v90[3] = &unk_1E16B4D40;
  v23 = v20;
  v91 = v23;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", v22, v90);

  -[UIScenePresentationContext _minificationFilterName](self, "_minificationFilterName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v7;
  v88[1] = 3221225472;
  v88[2] = __38__UIScenePresentationContext_isEqual___block_invoke_7;
  v88[3] = &unk_1E16B4D40;
  v26 = v23;
  v89 = v26;
  v27 = (id)objc_msgSend(v5, "appendObject:counterpart:", v25, v88);

  v28 = -[UIScenePresentationContext presentedLayerTypes](self, "presentedLayerTypes");
  v86[0] = v7;
  v86[1] = 3221225472;
  v86[2] = __38__UIScenePresentationContext_isEqual___block_invoke_8;
  v86[3] = &unk_1E16C7D38;
  v29 = v26;
  v87 = v29;
  v30 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v28, v86);
  -[UIScenePresentationContext hostTransformer](self, "hostTransformer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "transforms");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v7;
  v84[1] = 3221225472;
  v84[2] = __38__UIScenePresentationContext_isEqual___block_invoke_9;
  v84[3] = &unk_1E16B4D40;
  v33 = v29;
  v85 = v33;
  v34 = (id)objc_msgSend(v5, "appendObject:counterpart:", v32, v84);

  -[UIScenePresentationContext layerPresentationOverrides](self, "layerPresentationOverrides");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v7;
  v82[1] = 3221225472;
  v82[2] = __38__UIScenePresentationContext_isEqual___block_invoke_10;
  v82[3] = &unk_1E16B4D40;
  v36 = v33;
  v83 = v36;
  v37 = (id)objc_msgSend(v5, "appendObject:counterpart:", v35, v82);

  -[UIScenePresentationContext _exclusiveLayerTargetsToInclude](self, "_exclusiveLayerTargetsToInclude");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v7;
  v80[1] = 3221225472;
  v80[2] = __38__UIScenePresentationContext_isEqual___block_invoke_11;
  v80[3] = &unk_1E16B4D40;
  v39 = v36;
  v81 = v39;
  v40 = (id)objc_msgSend(v5, "appendObject:counterpart:", v38, v80);

  -[UIScenePresentationContext _layerTargetsToExclude](self, "_layerTargetsToExclude");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v7;
  v78[1] = 3221225472;
  v78[2] = __38__UIScenePresentationContext_isEqual___block_invoke_12;
  v78[3] = &unk_1E16B4D40;
  v42 = v39;
  v79 = v42;
  v43 = (id)objc_msgSend(v5, "appendObject:counterpart:", v41, v78);

  -[UIScenePresentationContext asynchronousRenderingOptions](self, "asynchronousRenderingOptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v7;
  v76[1] = 3221225472;
  v76[2] = __38__UIScenePresentationContext_isEqual___block_invoke_13;
  v76[3] = &unk_1E16B4D40;
  v45 = v42;
  v77 = v45;
  v46 = (id)objc_msgSend(v5, "appendObject:counterpart:", v44, v76);

  v47 = -[UIScenePresentationContext inheritsSecurity](self, "inheritsSecurity");
  v74[0] = v7;
  v74[1] = 3221225472;
  v74[2] = __38__UIScenePresentationContext_isEqual___block_invoke_14;
  v74[3] = &unk_1E16B2268;
  v48 = v45;
  v75 = v48;
  v49 = (id)objc_msgSend(v5, "appendBool:counterpart:", v47, v74);
  v50 = -[UIScenePresentationContext resizesHostedContext](self, "resizesHostedContext");
  v72[0] = v7;
  v72[1] = 3221225472;
  v72[2] = __38__UIScenePresentationContext_isEqual___block_invoke_15;
  v72[3] = &unk_1E16B2268;
  v51 = v48;
  v73 = v51;
  v52 = (id)objc_msgSend(v5, "appendBool:counterpart:", v50, v72);
  v53 = -[UIScenePresentationContext shouldPassthroughHitTestEventsIfTransparent](self, "shouldPassthroughHitTestEventsIfTransparent");
  v70[0] = v7;
  v70[1] = 3221225472;
  v70[2] = __38__UIScenePresentationContext_isEqual___block_invoke_16;
  v70[3] = &unk_1E16B2268;
  v54 = v51;
  v71 = v54;
  v55 = (id)objc_msgSend(v5, "appendBool:counterpart:", v53, v70);
  v56 = -[UIScenePresentationContext stopsHitTestTransformAccumulation](self, "stopsHitTestTransformAccumulation");
  v68[0] = v7;
  v68[1] = 3221225472;
  v68[2] = __38__UIScenePresentationContext_isEqual___block_invoke_17;
  v68[3] = &unk_1E16B2268;
  v57 = v54;
  v69 = v57;
  v58 = (id)objc_msgSend(v5, "appendBool:counterpart:", v56, v68);
  v59 = -[UIScenePresentationContext stopsSecureSuperlayersValidation](self, "stopsSecureSuperlayersValidation");
  v63 = v7;
  v64 = 3221225472;
  v65 = __38__UIScenePresentationContext_isEqual___block_invoke_18;
  v66 = &unk_1E16B2268;
  v67 = v57;
  v60 = v57;
  v61 = (id)objc_msgSend(v5, "appendBool:counterpart:", v59, &v63);
  LOBYTE(v57) = objc_msgSend(v5, "isEqual", v63, v64, v65, v66);

  return (char)v57;
}

- (NSSet)_layerTargetsToExclude
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext _layerTargetsToExclude](self->_defaultPresentationContext, "_layerTargetsToExclude");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (NSSet)_exclusiveLayerTargetsToInclude
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext _exclusiveLayerTargetsToInclude](self->_defaultPresentationContext, "_exclusiveLayerTargetsToInclude");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (BOOL)_isVisibilityPropagationEnabled
{
  if (-[BSMutableSettings flagForSetting:](self->_settings, "flagForSetting:", 12) == 0x7FFFFFFFFFFFFFFFLL)
    return -[UIScenePresentationContext _isVisibilityPropagationEnabled](self->_defaultPresentationContext, "_isVisibilityPropagationEnabled");
  else
    return BSSettingFlagIsYes();
}

- (UITransformer)hostTransformer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext hostTransformer](self->_defaultPresentationContext, "hostTransformer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (UITransformer *)v6;
}

- (UIColor)backgroundColorWhileNotHosting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext backgroundColorWhileNotHosting](self->_defaultPresentationContext, "backgroundColorWhileNotHosting");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v6;
}

- (UIColor)backgroundColorWhileHosting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    -[UIScenePresentationContext backgroundColorWhileHosting](self->_defaultPresentationContext, "backgroundColorWhileHosting");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v6;
}

- (BOOL)isClippingDisabled
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext isClippingDisabled](self->_defaultPresentationContext, "isClippingDisabled");
  v6 = v5;

  return v6;
}

- (BOOL)shouldPassthroughHitTestEventsIfTransparent
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext shouldPassthroughHitTestEventsIfTransparent](self->_defaultPresentationContext, "shouldPassthroughHitTestEventsIfTransparent");
  v6 = v5;

  return v6;
}

- (unint64_t)appearanceStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = -[UIScenePresentationContext appearanceStyle](self->_defaultPresentationContext, "appearanceStyle");
  v6 = v5;

  return v6;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext stopsHitTestTransformAccumulation](self->_defaultPresentationContext, "stopsHitTestTransformAccumulation");
  v6 = v5;

  return v6;
}

- (BOOL)inheritsSecurity
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext inheritsSecurity](self->_defaultPresentationContext, "inheritsSecurity");
  v6 = v5;

  return v6;
}

- (BOOL)resizesHostedContext
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext resizesHostedContext](self->_defaultPresentationContext, "resizesHostedContext");
  v6 = v5;

  return v6;
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isVisibilityPropagationEnabled");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isClippingDisabled");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appearanceStyle");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundColorWhileHosting");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentedLayerTypes");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_minificationFilterName");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundColorWhileNotHosting");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopsHitTestTransformAccumulation");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldPassthroughHitTestEventsIfTransparent");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resizesHostedContext");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inheritsSecurity");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "asynchronousRenderingOptions");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layerTargetsToExclude");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exclusiveLayerTargetsToInclude");
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layerPresentationOverrides");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_defaultPresentationContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

id __38__UIScenePresentationContext_isEqual___block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "hostTransformer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transforms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_initWithPresentationContext:(id)a3
{
  id *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = (id *)a3;
  v5 = (void *)objc_msgSend(v4[1], "mutableCopy");
  v6 = -[UIScenePresentationContext _initWithSettings:defaultPresentationContext:](self, "_initWithSettings:defaultPresentationContext:", v5, v4[2]);

  if (v6)
  {
    v7 = objc_msgSend(v4[3], "mutableCopy");
    v8 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v7;

    objc_msgSend(v4[1], "objectForSetting:", 9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "mutableCopy");

        v10 = (void *)v11;
      }
      objc_msgSend(*((id *)v6 + 1), "setObject:forSetting:", v10, 9);

    }
  }

  return v6;
}

- (id)_initWithSettings:(id)a3 defaultPresentationContext:(id)a4
{
  id v6;
  id v7;
  UIScenePresentationContext *v8;
  BSMutableSettings *v9;
  BSMutableSettings *settings;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIScenePresentationContext;
  v8 = -[UIScenePresentationContext init](&v12, sel_init);
  if (v8)
  {
    if (v6)
      v9 = (BSMutableSettings *)v6;
    else
      v9 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E0D017D0]);
    settings = v8->_settings;
    v8->_settings = v9;

    objc_storeStrong((id *)&v8->_defaultPresentationContext, a4);
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UIScenePresentationContext _initWithPresentationContext:]([UIMutableScenePresentationContext alloc], "_initWithPresentationContext:", self);
}

- (unint64_t)presentedLayerTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v5 = -[UIScenePresentationContext presentedLayerTypes](self->_defaultPresentationContext, "presentedLayerTypes");
  v6 = v5;

  return v6;
}

- (id)_initWithDefaultPresentationContext:(id)a3
{
  return -[UIScenePresentationContext _initWithSettings:defaultPresentationContext:](self, "_initWithSettings:defaultPresentationContext:", 0, a3);
}

- (id)_initWithDefaultValues
{
  if (qword_1ECD7DDA8 != -1)
    dispatch_once(&qword_1ECD7DDA8, &__block_literal_global_240);
  return -[UIScenePresentationContext _initWithDefaultPresentationContext:](self, "_initWithDefaultPresentationContext:", _MergedGlobals_1059);
}

- (UIScenePresentationContext)init
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScenePresentationContext.m"), 84, CFSTR("[UIScenePresentationContext init] is unavailable for use."));

  v6.receiver = self;
  v6.super_class = (Class)UIScenePresentationContext;
  return -[UIScenePresentationContext init](&v6, sel_init);
}

uint64_t __52__UIScenePresentationContext__initWithDefaultValues__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[UIScenePresentationContext _initWithSettings:defaultPresentationContext:]([UIMutableScenePresentationContext alloc], "_initWithSettings:defaultPresentationContext:", 0, 0);
  v1 = (void *)_MergedGlobals_1059;
  _MergedGlobals_1059 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1059, "setClippingDisabled:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setAppearanceStyle:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setBackgroundColorWhileNotHosting:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setPresentedLayerTypes:", 26);
  objc_msgSend((id)_MergedGlobals_1059, "setRenderingMode:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setInheritsSecurity:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setResizesHostedContext:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setShouldPassthroughHitTestEventsIfTransparent:", 0);
  objc_msgSend((id)_MergedGlobals_1059, "setStopsHitTestTransformAccumulation:", UISelfTaskHasEntitlement(CFSTR("com.apple.QuartzCore.system-layers")));
  objc_msgSend((id)_MergedGlobals_1059, "setStopsSecureSuperlayersValidation:", UISelfTaskHasEntitlement(CFSTR("com.apple.QuartzCore.secure-mode")));
  objc_msgSend((id)_MergedGlobals_1059, "_setMinificationFilterName:", 0);
  return objc_msgSend((id)_MergedGlobals_1059, "_setVisibilityPropagationEnabled:", 0);
}

- (BOOL)stopsSecureSuperlayersValidation
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = -[UIScenePresentationContext stopsSecureSuperlayersValidation](self->_defaultPresentationContext, "stopsSecureSuperlayersValidation");
  v6 = v5;

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;

  v3 = -[UIScenePresentationContext renderingMode](self, "renderingMode");
  v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
  v56 = v4;
  if (-[UIScenePresentationContext isClippingDisabled](self, "isClippingDisabled"))
    v5 = 0xBF58476D1CE4E5B9;
  else
    v5 = 0;
  v55 = 0x94D049BB133111EBLL * (v5 ^ (v5 >> 27));
  v6 = -[UIScenePresentationContext appearanceStyle](self, "appearanceStyle");
  v54 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  v7 = v4 ^ v55 ^ v54;
  -[UIScenePresentationContext backgroundColorWhileHosting](self, "backgroundColorWhileHosting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v9 ^ (v9 >> 30))) >> 27));
  v52 = v10;

  -[UIScenePresentationContext backgroundColorWhileNotHosting](self, "backgroundColorWhileNotHosting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v53 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v12 ^ (v12 >> 30))) >> 27));
  v13 = v7 ^ v10 ^ v53;

  -[UIScenePresentationContext _exclusiveLayerTargetsToInclude](self, "_exclusiveLayerTargetsToInclude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v15 ^ (v15 >> 30))) >> 27));
  v50 = v16;

  -[UIScenePresentationContext _layerTargetsToExclude](self, "_layerTargetsToExclude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  v51 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v18 ^ (v18 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v18 ^ (v18 >> 30))) >> 27));

  -[UIScenePresentationContext _minificationFilterName](self, "_minificationFilterName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  v49 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v20 ^ (v20 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v20 ^ (v20 >> 30))) >> 27));
  v21 = v13 ^ v16 ^ v51 ^ v49;

  v22 = -[UIScenePresentationContext presentedLayerTypes](self, "presentedLayerTypes");
  v23 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v22 ^ (v22 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v22 ^ (v22 >> 30))) >> 27));
  v47 = v23;
  -[UIScenePresentationContext hostTransformer](self, "hostTransformer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "transforms");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hash");
  v48 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v26 ^ (v26 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v26 ^ (v26 >> 30))) >> 27));

  -[UIScenePresentationContext layerPresentationOverrides](self, "layerPresentationOverrides");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash");
  v46 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v28 ^ (v28 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v28 ^ (v28 >> 30))) >> 27));
  v29 = v21 ^ v23 ^ v48 ^ v46;

  if (-[UIScenePresentationContext _isVisibilityPropagationEnabled](self, "_isVisibilityPropagationEnabled"))
    v30 = 0xBF58476D1CE4E5B9;
  else
    v30 = 0;
  v31 = 0x94D049BB133111EBLL * (v30 ^ (v30 >> 27));
  -[UIScenePresentationContext asynchronousRenderingOptions](self, "asynchronousRenderingOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hash");
  v34 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v33 ^ (v33 >> 30))) >> 27));

  if (-[UIScenePresentationContext inheritsSecurity](self, "inheritsSecurity"))
    v35 = 0xBF58476D1CE4E5B9;
  else
    v35 = 0;
  v36 = 0x94D049BB133111EBLL * (v35 ^ (v35 >> 27));
  if (-[UIScenePresentationContext resizesHostedContext](self, "resizesHostedContext"))
    v37 = 0xBF58476D1CE4E5B9;
  else
    v37 = 0;
  v38 = 0x94D049BB133111EBLL * (v37 ^ (v37 >> 27));
  if (-[UIScenePresentationContext shouldPassthroughHitTestEventsIfTransparent](self, "shouldPassthroughHitTestEventsIfTransparent"))
  {
    v39 = 0xBF58476D1CE4E5B9;
  }
  else
  {
    v39 = 0;
  }
  v40 = 0x94D049BB133111EBLL * (v39 ^ (v39 >> 27));
  v41 = v29 ^ v31 ^ v34 ^ v36 ^ v38 ^ v40;
  if (-[UIScenePresentationContext stopsHitTestTransformAccumulation](self, "stopsHitTestTransformAccumulation"))
    v42 = 0xBF58476D1CE4E5B9;
  else
    v42 = 0;
  v43 = 0x94D049BB133111EBLL * (v42 ^ (v42 >> 27));
  if (-[UIScenePresentationContext stopsSecureSuperlayersValidation](self, "stopsSecureSuperlayersValidation"))
    v44 = 0xBF58476D1CE4E5B9;
  else
    v44 = 0;
  return v55 ^ ((v41 ^ v43 ^ (0x94D049BB133111EBLL * (v44 ^ (v44 >> 27)))) >> 31) ^ v56 ^ v54 ^ v52 ^ v53 ^ v50 ^ v51 ^ v49 ^ v47 ^ v48 ^ v31 ^ v46 ^ v36 ^ v34 ^ v38 ^ v40 ^ v43 ^ (0x94D049BB133111EBLL * (v44 ^ (v44 >> 27)));
}

uint64_t __38__UIScenePresentationContext_isEqual___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopsSecureSuperlayersValidation");
}

- (NSString)description
{
  return (NSString *)-[UIScenePresentationContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIScenePresentationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIScenePresentationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[UIScenePresentationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;

  objc_msgSend(*(id *)(a1 + 32), "presentedLayerTypes");
  v2 = *(void **)(a1 + 40);
  NSStringFromFBSceneLayerTypeMask();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("hostedLayerTypes"));

  if (objc_msgSend(*(id *)(a1 + 32), "_isVisibilityPropagationEnabled"))
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "_isVisibilityPropagationEnabled"), CFSTR("visibilityPropagationEnabled"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "isClippingDisabled"), CFSTR("isClippingDisabled"));
  v7 = *(void **)(a1 + 40);
  NSStringFromUISceneAppearanceStyle(objc_msgSend(*(id *)(a1 + 32), "appearanceStyle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("appearanceStyle"));

  v10 = *(void **)(a1 + 40);
  NSStringFromUISceneRenderingMode(objc_msgSend(*(id *)(a1 + 32), "renderingMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("renderMode"));

  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "backgroundColorWhileHosting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "appendObject:withName:skipIfNil:", v14, CFSTR("BGColorWhileHosting"), 1);

  v16 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "backgroundColorWhileNotHosting");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "appendObject:withName:skipIfNil:", v17, CFSTR("BGColorWhileNotHosting"), 1);

  v19 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "hostTransformer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "appendObject:withName:skipIfNil:", v20, CFSTR("hostTransformer"), 1);

  v22 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "asynchronousRenderingOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v22, "appendObject:withName:skipIfNil:", v23, CFSTR("asynchronousRenderingOptions"), 1);

  v25 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "inheritsSecurity"), CFSTR("inheritsSecurity"), 1);
  v26 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "resizesHostedContext"), CFSTR("resizesHostedContext"), 1);
  v27 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "shouldPassthroughHitTestEventsIfTransparent"), CFSTR("shouldPassthroughHitTestEventsIfTransparent"), 1);
  v28 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "stopsHitTestTransformAccumulation"), CFSTR("stopsHitTestTransformAccumulation"), 1);
  v29 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "stopsSecureSuperlayersValidation"), CFSTR("stopsSecureSuperlayersValidation"), 1);
  objc_msgSend(*(id *)(a1 + 32), "layerPresentationOverrides");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    v32 = *(void **)(a1 + 40);
    objc_msgSend(v32, "activeMultilinePrefix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v41[3] = &unk_1E16B1B50;
    v34 = *(void **)(a1 + 40);
    v41[4] = *(_QWORD *)(a1 + 32);
    v42 = v34;
    objc_msgSend(v32, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("layerPresentationContexts"), v33, v41);

  }
  v35 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_exclusiveLayerTargetsToInclude");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendArraySection:withName:skipIfEmpty:", v37, CFSTR("exclusiveLayerTargetsToInclude"), 1);

  v38 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_layerTargetsToExclude");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "appendArraySection:withName:skipIfEmpty:", v39, CFSTR("layerTargetsToExclude"), 1);

}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "layerPresentationOverrides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v3[3] = &unk_1E16C7BA0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __68__UIScenePresentationContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v8, v6);

}

- (UIScenePresentationContext)_defaultPresentationContext
{
  return self->_defaultPresentationContext;
}

@end
