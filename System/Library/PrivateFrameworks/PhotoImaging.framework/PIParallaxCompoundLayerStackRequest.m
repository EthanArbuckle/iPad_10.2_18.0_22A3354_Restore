@implementation PIParallaxCompoundLayerStackRequest

- (PIParallaxCompoundLayerStackRequest)initWithSegmentationItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PIParallaxCompoundLayerStackRequest *v8;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_6837();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "segmentationItem != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_6837();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  objc_msgSend(v5, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxCompoundLayerStackRequest;
  v8 = -[NURenderRequest initWithComposition:](&v23, sel_initWithComposition_, v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_segmentationItem, a3);
    v8->_layerStackOptions = 1;
  }

  return v8;
}

- (PIParallaxCompoundLayerStackRequest)initWithComposition:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PIParallaxCompoundLayerStackRequest;
  v4 = -[NURenderRequest copyWithZone:](&v12, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[23];
    v4[23] = v5;

    -[PIParallaxCompoundLayerStackRequest layout](self, "layout");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[25];
    v4[25] = v7;

    -[PIParallaxCompoundLayerStackRequest style](self, "style");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[24];
    v4[24] = v9;

    v4[26] = -[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions");
    *((_BYTE *)v4 + 177) = -[PIParallaxCompoundLayerStackRequest updateInactiveFrame](self, "updateInactiveFrame");
    *((_BYTE *)v4 + 178) = -[PIParallaxCompoundLayerStackRequest updateClockZPosition](self, "updateClockZPosition");
    *((_BYTE *)v4 + 179) = -[PIParallaxCompoundLayerStackRequest updateClockAreaLuminance](self, "updateClockAreaLuminance");
    *((_BYTE *)v4 + 176) = -[PIParallaxCompoundLayerStackRequest isSettlingEffectEnabled](self, "isSettlingEffectEnabled");
  }
  return v4;
}

- (id)newRenderJob
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
  }
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (void)submit:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)-[PIParallaxCompoundLayerStackRequest copy](self, "copy");
  objc_msgSend(v5, "_submit:", v4);

}

- (void)_submit:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *requests;
  NSMutableArray *v7;
  NSMutableArray *results;
  NSError *error;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  requests = self->_requests;
  self->_requests = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  results = self->_results;
  self->_results = v7;

  error = self->_error;
  self->_error = 0;

  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__6860;
  v27[4] = __Block_byref_object_dispose__6861;
  v11 = MEMORY[0x1E0C809B0];
  v28 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke;
  v24[3] = &unk_1E5016828;
  v26 = v27;
  v12 = v10;
  v25 = v12;
  -[PIParallaxCompoundLayerStackRequest _generateLayerStackForOrientation:completion:](self, "_generateLayerStackForOrientation:completion:", 1, v24);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__6860;
  v22[4] = __Block_byref_object_dispose__6861;
  v23 = 0;
  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    dispatch_group_enter(v12);
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_2;
    v19[3] = &unk_1E5016828;
    v21 = v22;
    v20 = v12;
    -[PIParallaxCompoundLayerStackRequest _generateLayerStackForOrientation:completion:](self, "_generateLayerStackForOrientation:completion:", 2, v19);

  }
  -[NURenderRequest responseQueue](self, "responseQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_3;
  v15[3] = &unk_1E5016850;
  v17 = v22;
  v18 = v27;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_group_notify(v12, v13, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v27, 8);

}

- (void)_submitLayerStackRequestsWithLayout:(id)a3 orientation:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__6860;
  v20[4] = __Block_byref_object_dispose__6861;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke;
  v19[3] = &unk_1E5016878;
  v19[4] = v20;
  v11 = (void *)MEMORY[0x1A85C0174](v19);
  if (a4 == 2)
  {
    if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 0x20) != 0)
      -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 1, v8, v11);
    if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 0x80) != 0)
    {
      v12 = 5;
      goto LABEL_13;
    }
  }
  else if (a4 == 1)
  {
    if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 1) != 0)
      -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 0, v8, v11);
    if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 8) != 0)
      -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 4, v8, v11);
    if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 0x40) != 0)
    {
      v12 = 7;
LABEL_13:
      -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", v12, v8, v11);
    }
  }
  if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 2) != 0)
    -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 2, v8, v11);
  if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 4) != 0)
    -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 3, v8, v11);
  if ((-[PIParallaxCompoundLayerStackRequest layerStackOptions](self, "layerStackOptions") & 0x10) != 0)
    -[PIParallaxCompoundLayerStackRequest _submitLayerStackRequestForMode:layout:completion:](self, "_submitLayerStackRequestForMode:layout:completion:", 6, v8, v11);
  v13 = (void *)MEMORY[0x1E0D52290];
  -[NURenderRequest responseQueue](self, "responseQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke_2;
  v16[3] = &unk_1E50168A0;
  v15 = v9;
  v17 = v15;
  v18 = v20;
  objc_msgSend(v13, "commitAndNotifyOnQueue:withBlock:", v14, v16);

  _Block_object_dispose(v20, 8);
}

- (id)effectiveLayout
{
  void *v3;
  void *v4;
  void *v5;

  -[PIParallaxCompoundLayerStackRequest layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!-[PIParallaxCompoundLayerStackRequest isSettlingEffectEnabled](self, "isSettlingEffectEnabled")
      || (-[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "settlingEffectLayout"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          !v3))
    {
      -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originalLayout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (void)_generateLayerStackForOrientation:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke;
  v8[3] = &unk_1E5016940;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PIParallaxCompoundLayerStackRequest _chooseLayoutForOrientation:completion:](self, "_chooseLayoutForOrientation:completion:", a3, v8);

}

- (void)_chooseLayoutForOrientation:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PIPosterLayoutRequest *v17;
  PIPosterLayoutRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  PIParallaxCompoundLayerStackRequest *v37;
  SEL v38;
  id v39;
  id v40;
  _QWORD v41[5];
  void (**v42)(id, void *);
  int64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  if (a3 == 1)
  {
    -[PIParallaxCompoundLayerStackRequest effectiveLayout](self, "effectiveLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "portraitLayout");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    -[PIParallaxCompoundLayerStackRequest effectiveLayout](self, "effectiveLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "landscapeLayout");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (PIPosterLayoutRequest *)v16;

    if (v17)
    {
      v6[2](v6, v17);
LABEL_14:

      return;
    }
LABEL_13:
    v18 = [PIPosterLayoutRequest alloc];
    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "composition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PIPosterLayoutRequest initWithComposition:](v18, "initWithComposition:", v20);

    objc_msgSend(MEMORY[0x1E0D75340], "deviceConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPosterLayoutRequest setLayoutConfiguration:](v17, "setLayoutConfiguration:", v21);

    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "regions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPosterLayoutRequest setLayoutRegions:](v17, "setLayoutRegions:", v23);

    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "segmentationMatte");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPosterLayoutRequest setSegmentationMatte:](v17, "setSegmentationMatte:", v25);

    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "segmentationConfidenceMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPosterLayoutRequest setSegmentationConfidenceMap:](v17, "setSegmentationConfidenceMap:", v27);

    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPosterLayoutRequest setSegmentationClassification:](v17, "setSegmentationClassification:", objc_msgSend(v28, "classification"));

    -[NURenderRequest responseQueue](self, "responseQueue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setResponseQueue:](v17, "setResponseQueue:", v29);

    -[NURenderRequest renderContext](self, "renderContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setRenderContext:](v17, "setRenderContext:", v30);

    -[NURenderRequest priority](self, "priority");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPriority:](v17, "setPriority:", v31);

    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __78__PIParallaxCompoundLayerStackRequest__chooseLayoutForOrientation_completion___block_invoke;
    v41[3] = &unk_1E5016968;
    v43 = a3;
    v41[4] = self;
    v42 = v6;
    -[PIPosterLayoutRequest submit:](v17, "submit:", v41);

    goto LABEL_14;
  }
  if (a3)
    goto LABEL_13;
  NUAssertLogger_6837();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown orientation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v8;
    _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v9 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_6837();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v12)
    {
      v32 = dispatch_get_specific(*v9);
      v33 = (void *)MEMORY[0x1E0CB3978];
      v34 = v32;
      objc_msgSend(v33, "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v32;
      v46 = 2114;
      v47 = v36;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v14;
    _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v37 = (PIParallaxCompoundLayerStackRequest *)_NUAssertFailHandler();
  -[PIParallaxCompoundLayerStackRequest _submitInactiveLayoutRequestWithOrientedLayout:completion:](v37, v38, v39, v40);
}

- (void)_submitInactiveLayoutRequestWithOrientedLayout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PIPosterInactiveFrameLayoutRequest *v8;
  void *v9;
  PIPosterInactiveFrameLayoutRequest *v10;
  void *v11;
  void *v12;
  PIPosterInactiveFrameLayoutRequest *v13;
  _QWORD v14[5];
  PIPosterInactiveFrameLayoutRequest *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[PIParallaxCompoundLayerStackRequest updateInactiveFrame](self, "updateInactiveFrame"))
  {
    v8 = [PIPosterInactiveFrameLayoutRequest alloc];
    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PIPosterInactiveFrameLayoutRequest initWithSegmentationItem:](v8, "initWithSegmentationItem:", v9);

    -[PIPosterInactiveFrameLayoutRequest setLayout:](v10, "setLayout:", v6);
    -[NURenderRequest priority](self, "priority");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPriority:](v10, "setPriority:", v11);

    -[NURenderRequest responseQueue](self, "responseQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setResponseQueue:](v10, "setResponseQueue:", v12);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __97__PIParallaxCompoundLayerStackRequest__submitInactiveLayoutRequestWithOrientedLayout_completion___block_invoke;
    v14[3] = &unk_1E5019368;
    v14[4] = self;
    v15 = v10;
    v16 = v7;
    v13 = v10;
    -[PIPosterInactiveFrameLayoutRequest submit:](v13, "submit:", v14);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v13);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

- (void)_submitClockOverlapRequestWithLayout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PIParallaxClockLayoutRequest *v8;
  void *v9;
  PIParallaxClockLayoutRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (-[PIParallaxCompoundLayerStackRequest updateClockZPosition](self, "updateClockZPosition"))
  {
    v8 = [PIParallaxClockLayoutRequest alloc];
    -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PIParallaxClockLayoutRequest initWithSegmentationItem:](v8, "initWithSegmentationItem:", v9);

    -[PIParallaxClockLayoutRequest setLayout:](v10, "setLayout:", v6);
    -[NURenderRequest priority](self, "priority");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPriority:](v10, "setPriority:", v11);

    -[NURenderRequest responseQueue](self, "responseQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setResponseQueue:](v10, "setResponseQueue:", v12);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__PIParallaxCompoundLayerStackRequest__submitClockOverlapRequestWithLayout_completion___block_invoke;
    v14[3] = &unk_1E5019368;
    v14[4] = self;
    v16 = v7;
    v15 = v6;
    -[PIParallaxClockLayoutRequest submit:](v10, "submit:", v14);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v10);

  }
  else
  {
    objc_msgSend(v6, "clockLayerOrder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, uint64_t))v7 + 2))(v7, v13, objc_msgSend(v6, "clockIntersection"));

  }
}

- (void)_submitClockMaterialRequestWithLayerStack:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  PIParallaxClockMaterialRequest *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  PIParallaxCompoundLayerStackRequest *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = -[PIParallaxCompoundLayerStackRequest updateClockAreaLuminance](self, "updateClockAreaLuminance");
  if (v6 && v8 && !self->_error)
  {
    v9 = -[PIParallaxClockMaterialRequest initWithLayerStack:]([PIParallaxClockMaterialRequest alloc], "initWithLayerStack:", v6);
    -[NURenderRequest priority](self, "priority");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setPriority:](v9, "setPriority:", v10);

    -[NURenderRequest responseQueue](self, "responseQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NURenderRequest setResponseQueue:](v9, "setResponseQueue:", v11);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__PIParallaxCompoundLayerStackRequest__submitClockMaterialRequestWithLayerStack_completion___block_invoke;
    v12[3] = &unk_1E5019368;
    v13 = v6;
    v14 = self;
    v15 = v7;
    -[PIParallaxClockMaterialRequest submit:](v9, "submit:", v12);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v9);

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

- (void)_submitLayerStackRequestForMode:(int64_t)a3 layout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PIParallaxLayerStackRequest *v10;
  void *v11;
  PIParallaxLayerStackRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  PIParallaxCompoundLayerStackRequest *v21;
  id v22;

  v8 = a5;
  v9 = a4;
  v10 = [PIParallaxLayerStackRequest alloc];
  -[PIParallaxCompoundLayerStackRequest segmentationItem](self, "segmentationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PIParallaxLayerStackRequest initWithSegmentationItem:](v10, "initWithSegmentationItem:", v11);

  -[NURenderRequest priority](self, "priority");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPriority:](v12, "setPriority:", v13);

  -[NURenderRequest responseQueue](self, "responseQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setResponseQueue:](v12, "setResponseQueue:", v14);

  -[PIParallaxCompoundLayerStackRequest style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxLayerStackRequest setStyle:](v12, "setStyle:", v15);

  -[PIParallaxLayerStackRequest setLayout:](v12, "setLayout:", v9);
  -[PIParallaxLayerStackRequest setLayerStackMode:](v12, "setLayerStackMode:", a3);
  -[PIParallaxLayerStackRequest setSettlingEffectEnabled:](v12, "setSettlingEffectEnabled:", -[PIParallaxCompoundLayerStackRequest isSettlingEffectEnabled](self, "isSettlingEffectEnabled"));
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __89__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestForMode_layout_completion___block_invoke;
  v20 = &unk_1E5019E90;
  v21 = self;
  v22 = v8;
  v16 = v8;
  -[PIParallaxLayerStackRequest submit:](v12, "submit:", &v17);
  -[NSMutableArray addObject:](self->_requests, "addObject:", v12, v17, v18, v19, v20, v21);

}

- (void)_recordResult:(id)a3
{
  -[NSMutableArray addObject:](self->_results, "addObject:", a3);
}

- (void)_recordError:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_error)
  {
    objc_storeStrong((id *)&self->_error, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_requests;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "renderContext", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cancelAllRequests");

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (id)_responseWithCompoundLayerStack:(id)a3
{
  id v4;
  void *v5;
  _PIParallaxCompoundLayerStackResult *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (self->_error)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", self->_error);
  }
  else
  {
    v6 = objc_alloc_init(_PIParallaxCompoundLayerStackResult);
    -[_PIParallaxCompoundLayerStackResult setCompoundLayerStack:](v6, "setCompoundLayerStack:", v4);
    if (-[NSMutableArray count](self->_results, "count"))
    {
      PFMap();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D52250], "aggregateStatistics:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NURenderResult setStatistics:](v6, "setStatistics:", v8);

    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithResult:", v6);

  }
  return v5;
}

- (void)cancel
{
  id v2;

  -[NURenderRequest renderContext](self, "renderContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllRequests");

}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (PFPosterLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (unint64_t)layerStackOptions
{
  return self->_layerStackOptions;
}

- (void)setLayerStackOptions:(unint64_t)a3
{
  self->_layerStackOptions = a3;
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  self->_settlingEffectEnabled = a3;
}

- (BOOL)updateInactiveFrame
{
  return self->_updateInactiveFrame;
}

- (void)setUpdateInactiveFrame:(BOOL)a3
{
  self->_updateInactiveFrame = a3;
}

- (BOOL)updateClockZPosition
{
  return self->_updateClockZPosition;
}

- (void)setUpdateClockZPosition:(BOOL)a3
{
  self->_updateClockZPosition = a3;
}

- (BOOL)updateClockAreaLuminance
{
  return self->_updateClockAreaLuminance;
}

- (void)setUpdateClockAreaLuminance:(BOOL)a3
{
  self->_updateClockAreaLuminance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

uint64_t __71__PIParallaxCompoundLayerStackRequest__responseWithCompoundLayerStack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "statistics");
}

void __89__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestForMode_layout_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_recordResult:", v3);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "layerStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Failed to render layer stack, error: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_recordError:", v4);
  }

}

void __92__PIParallaxCompoundLayerStackRequest__submitClockMaterialRequestWithLayerStack_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "clockAreaLuminance");
    objc_msgSend(v5, "layerStackByUpdatingClockAreaLuminance:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_recordResult:", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Failed to compute clock material: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_recordError:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __87__PIParallaxCompoundLayerStackRequest__submitClockOverlapRequestWithLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_recordResult:", v3);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "clockLayerOrder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, objc_msgSend(v3, "clockIntersection"));
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Failed to compute clock overlap: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_recordError:", v4);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "clockLayerOrder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v6, objc_msgSend(*(id *)(a1 + 40), "clockIntersection"));
  }

}

void __97__PIParallaxCompoundLayerStackRequest__submitInactiveLayoutRequestWithOrientedLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_recordResult:", v3);
    objc_msgSend(*(id *)(a1 + 40), "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inactiveRect");
    objc_msgSend(v5, "layoutByUpdatingInactiveFrame:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
    v7 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Failed to update layout: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_recordError:", v4);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
  }

}

void __78__PIParallaxCompoundLayerStackRequest__chooseLayoutForOrientation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
  v5 = (os_log_t *)MEMORY[0x1E0D52398];
  v6 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v3;
    _os_log_impl(&dword_1A6382000, v6, OS_LOG_TYPE_DEFAULT, "Poster original layout response: %{public}@", buf, 0xCu);
  }
  v29 = 0;
  objc_msgSend(v3, "result:", &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  if (!v7)
  {
    if (*v4 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_123);
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Failed to request layout for item: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_recordError:", v8);
    goto LABEL_22;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 == 1)
  {
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "portraitLayout");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v22 = (void *)v21;
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v21);

    goto LABEL_22;
  }
  if (v9 == 2)
  {
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "landscapeLayout");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (v9)
  {
LABEL_22:

    return;
  }
  NUAssertLogger_6837();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown orientation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v11;
    _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

  }
  v12 = (const void **)MEMORY[0x1E0D51D48];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_6837();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v15)
    {
      v23 = dispatch_get_specific(*v12);
      v24 = (void *)MEMORY[0x1E0CB3978];
      v25 = v23;
      objc_msgSend(v24, "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2114;
      v33 = v27;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
  }
  else if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v17;
    _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

  }
  v28 = _NUAssertFailHandler();
  __NUAssertLogger_block_invoke_6855(v28);
}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_2;
  v4[3] = &unk_1E5016940;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_submitInactiveLayoutRequestWithOrientedLayout:completion:", a2, v4);

}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_3;
  v7[3] = &unk_1E5016918;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  objc_msgSend(v5, "_submitClockOverlapRequestWithLayout:completion:", v6, v7);

}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "layoutByUpdatingClockLayerOrder:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutByUpdatingClockIntersection:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_4;
  v8[3] = &unk_1E50168F0;
  v7 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = v7;
  objc_msgSend(v9, "_submitLayerStackRequestsWithLayout:orientation:completion:", v6, 1, v8);

}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_5;
  v4[3] = &unk_1E50168C8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_submitClockMaterialRequestWithLayerStack:completion:", a2, v4);

}

uint64_t __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  v11 = v3;
  if (v5)
  {
    objc_msgSend(v3, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    objc_msgSend(v5, "layerStackByUpdatingLayers:imageSize:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v10;
  }

}

uint64_t __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "settlingEffectLayer");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v16[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "size");
      objc_msgSend(v4, "layerStackByUpdatingLayers:imageSize:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_responseWithCompoundLayerStack:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75348]), "initWithPortraitLayerStack:landscapeLayerStack:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
    objc_msgSend(v13, "_responseWithCompoundLayerStack:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  }
}

@end
