@implementation PIAutoLoopAutoCalculator

- (PIAutoLoopAutoCalculator)initWithComposition:(id)a3
{
  PIAutoLoopAutoCalculator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIAutoLoopAutoCalculator;
  result = -[NURenderRequest initWithComposition:](&v4, sel_initWithComposition_, a3);
  result->_flavor = 1;
  return result;
}

- (void)submit:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PIAutoLoopAnalysisRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const void **v20;
  void *specific;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  void (**v32)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    NUAssertLogger_4825();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "completion != nil");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v20 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4825();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v26 = dispatch_get_specific(*v20);
        v27 = (void *)MEMORY[0x1E0CB3978];
        v28 = v26;
        objc_msgSend(v27, "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v26;
        v35 = 2114;
        v36 = v30;
        _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  -[NURenderRequest composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "mediaType") == 3)
  {

  }
  else
  {
    -[NURenderRequest composition](self, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mediaType");

    if (v8 != 2)
    {
      v15 = (void *)MEMORY[0x1E0D520A0];
      v16 = (void *)-[PIAutoLoopAutoCalculator copy](self, "copy");
      objc_msgSend(v15, "invalidError:object:", CFSTR("PIAutoLoopAutoCalculator requires a video"), v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D522A0]), "initWithError:", v10);
      ((void (**)(_QWORD, void *))v5)[2](v5, v17);

      goto LABEL_11;
    }
  }
  -[NURenderRequest composition](self, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("autoLoop"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recipe")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = objc_alloc(MEMORY[0x1E0D522A0]);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("recipe"));
    v13 = (PIAutoLoopAnalysisRequest *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithResult:", v13);
    ((void (**)(_QWORD, void *))v5)[2](v5, v14);

  }
  else
  {
    v13 = -[NURenderRequest initWithRequest:]([PIAutoLoopAnalysisRequest alloc], "initWithRequest:", self);
    -[PIAutoLoopAnalysisRequest setFlavor:](v13, "setFlavor:", -[PIAutoLoopAutoCalculator flavor](self, "flavor"));
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __35__PIAutoLoopAutoCalculator_submit___block_invoke;
    v31[3] = &unk_1E5019A68;
    v32 = v5;
    -[PIAutoLoopAnalysisRequest submit:](v13, "submit:", v31);

  }
LABEL_11:

}

- (int64_t)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int64_t)a3
{
  self->_flavor = a3;
}

void __35__PIAutoLoopAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(a2, "result:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = objc_alloc(MEMORY[0x1E0D522A0]);
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v3, "recipe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithResult:", v7);

  }
  else
  {
    v8 = (void *)objc_msgSend(v5, "initWithError:", v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
