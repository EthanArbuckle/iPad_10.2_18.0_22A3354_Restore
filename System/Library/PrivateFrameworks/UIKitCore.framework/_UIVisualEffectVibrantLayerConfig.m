@implementation _UIVisualEffectVibrantLayerConfig

+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5
{
  return (id)objc_msgSend(a1, "layerWithVibrantColor:tintColor:filterType:filterAttributes:", a3, a4, a5, MEMORY[0x1E0C9AA70]);
}

+ (id)layerWithVibrantColor:(id)a3 tintColor:(id)a4 filterType:(id)a5 filterAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(a1, "layerWithFillColor:opacity:filterType:", 0, a5, 1.0);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13[4];
  v13[4] = v10;
  v15 = v10;

  v16 = (void *)v13[5];
  v13[5] = v11;
  v17 = v11;

  v18 = objc_msgSend(v12, "copy");
  v19 = (void *)v13[6];
  v13[6] = v18;

  return v13;
}

- (void)configureLayerView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  _UIVisualEffectVibrantLayerConfig *v17;
  id v18;
  uint64_t *v19;
  _QWORD aBlock[4];
  id v21;
  _UIVisualEffectVibrantLayerConfig *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  -[_UIVisualEffectLayerConfig filterType](self, "filterType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectLayerConfig filterType](self, "filterType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__14;
    v29 = __Block_byref_object_dispose__14;
    filterOfTypeOnLayer(v6, v7);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke;
    aBlock[3] = &unk_1E16B51E8;
    v9 = v4;
    v21 = v9;
    v22 = self;
    v10 = v6;
    v23 = v10;
    v11 = v7;
    v24 = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    v13 = v12;
    if (v26[5])
    {
      v12[2](v12);
    }
    else
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __56___UIVisualEffectVibrantLayerConfig_configureLayerView___block_invoke_3;
      v14[3] = &unk_1E16B5238;
      v15 = v9;
      v19 = &v25;
      v16 = v11;
      v17 = self;
      v18 = v10;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
      v13[2](v13);

    }
    _Block_object_dispose(&v25, 8);

  }
}

- (void)deconfigureLayerView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  id v17;

  objc_msgSend(a3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectLayerConfig filterType](self, "filterType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  filterOfTypeOnLayer(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), v5, CFSTR("inputColor0"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", v8, v9);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filters.%@.%@"), v5, CFSTR("inputColor1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", v8, v10);

    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    v16 = v4;
    v17 = v5;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __58___UIVisualEffectVibrantLayerConfig_deconfigureLayerView___block_invoke_3;
    v13[3] = &unk_1E16B1BA0;
    v12 = _Block_copy(aBlock);
    v14 = v12;
    if (!+[UIView _addCompletion:](UIView, "_addCompletion:", v13))
      v12[2](v12);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectVibrantLayerConfig;
  -[_UIVisualEffectLayerConfig description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" vibrantColor=%@ tintColor=%@ filterAttributes=%@"), self->_vibrantColor, self->_tintColor, self->_filterAttributes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIColor)vibrantColor
{
  return self->_vibrantColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSDictionary)filterAttributes
{
  return self->_filterAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterAttributes, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_vibrantColor, 0);
}

@end
