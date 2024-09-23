@implementation UISceneAsynchronousRenderingOptions

- (NSArray)renderTimes
{
  return self->_renderTimes;
}

- (double)renderPeriod
{
  return self->_renderPeriod;
}

- (float)renderMaxAPL
{
  return self->_renderMaxAPL;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (UISceneAsynchronousRenderingOptions)init
{
  UISceneAsynchronousRenderingOptions *v2;
  UISceneAsynchronousRenderingOptions *v3;
  NSArray *renderTimes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISceneAsynchronousRenderingOptions;
  v2 = -[UISceneAsynchronousRenderingOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    renderTimes = v2->_renderTimes;
    v2->_renderTimes = 0;

    v3->_renderPeriod = 0.0;
    v3->_renderMaxAPL = INFINITY;
    v3->_opaque = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderTimes, 0);
}

- (UISceneAsynchronousRenderingOptions)initWithOptions:(id)a3
{
  id v4;
  UISceneAsynchronousRenderingOptions *v5;
  void *v6;
  uint64_t v7;
  NSArray *renderTimes;
  double v9;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UISceneAsynchronousRenderingOptions;
  v5 = -[UISceneAsynchronousRenderingOptions init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "renderTimes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    renderTimes = v5->_renderTimes;
    v5->_renderTimes = (NSArray *)v7;

    objc_msgSend(v4, "renderPeriod");
    v5->_renderPeriod = v9;
    objc_msgSend(v4, "renderMaxAPL");
    v5->_renderMaxAPL = v10;
    v5->_opaque = objc_msgSend(v4, "opaque");
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[UISceneAsynchronousRenderingOptions initWithOptions:]([UIMutableSceneAsynchronousRenderingOptions alloc], "initWithOptions:", self);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderTimes](self, "renderTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UISceneAsynchronousRenderingOptions renderPeriod](self, "renderPeriod");
  v6 = (id)objc_msgSend(v3, "appendDouble:");
  -[UISceneAsynchronousRenderingOptions renderMaxAPL](self, "renderMaxAPL");
  v7 = (id)objc_msgSend(v3, "appendFloat:");
  v8 = (id)objc_msgSend(v3, "appendBool:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  UISceneAsynchronousRenderingOptions *v4;
  UISceneAsynchronousRenderingOptions *v5;
  UISceneAsynchronousRenderingOptions *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  UISceneAsynchronousRenderingOptions *v11;
  id v12;
  float v13;
  int v14;
  int v15;
  id *v16;
  double v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  UISceneAsynchronousRenderingOptions *v22;
  id v23;
  _BOOL8 v24;
  UISceneAsynchronousRenderingOptions *v25;
  id v26;
  _QWORD v28[4];
  UISceneAsynchronousRenderingOptions *v29;
  _QWORD v30[4];
  UISceneAsynchronousRenderingOptions *v31;
  _QWORD v32[4];
  UISceneAsynchronousRenderingOptions *v33;
  _QWORD v34[4];
  UISceneAsynchronousRenderingOptions *v35;
  _QWORD v36[4];
  UISceneAsynchronousRenderingOptions *v37;

  v4 = (UISceneAsynchronousRenderingOptions *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v19 = 1;
  }
  else
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v6, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISceneAsynchronousRenderingOptions renderPeriod](self, "renderPeriod");
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke;
    v36[3] = &unk_1E16B4CF0;
    v11 = v6;
    v37 = v11;
    v12 = (id)objc_msgSend(v7, "appendDouble:counterpart:", v36, v9);
    -[UISceneAsynchronousRenderingOptions renderMaxAPL](self, "renderMaxAPL");
    if (fabsf(v13) == INFINITY)
    {
      v34[0] = v10;
      v34[1] = 3221225472;
      v34[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_2;
      v34[3] = &unk_1E16B2268;
      v16 = (id *)&v35;
      v35 = v11;
      v20 = (id)objc_msgSend(v7, "appendBool:counterpart:", 1, v34);
    }
    else
    {
      -[UISceneAsynchronousRenderingOptions renderMaxAPL](self, "renderMaxAPL");
      v15 = v14;
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_3;
      v32[3] = &unk_1E16B4D18;
      v16 = (id *)&v33;
      v33 = v11;
      LODWORD(v17) = v15;
      v18 = (id)objc_msgSend(v7, "appendFloat:counterpart:", v32, v17);
    }

    -[UISceneAsynchronousRenderingOptions renderTimes](self, "renderTimes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_4;
    v30[3] = &unk_1E16B4D40;
    v22 = v11;
    v31 = v22;
    v23 = (id)objc_msgSend(v7, "appendObject:counterpart:", v21, v30);

    v24 = -[UISceneAsynchronousRenderingOptions opaque](self, "opaque");
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_5;
    v28[3] = &unk_1E16B2268;
    v29 = v22;
    v25 = v22;
    v26 = (id)objc_msgSend(v7, "appendBool:counterpart:", v24, v28);
    v19 = objc_msgSend(v7, "isEqual");

  }
  return v19;
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderPeriod");
}

BOOL __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_2(uint64_t a1)
{
  float v1;

  objc_msgSend(*(id *)(a1 + 32), "renderMaxAPL");
  return fabsf(v1) == INFINITY;
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderMaxAPL");
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renderTimes");
}

uint64_t __47__UISceneAsynchronousRenderingOptions_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "opaque");
}

- (NSString)debugDescription
{
  return (NSString *)-[UISceneAsynchronousRenderingOptions descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  float v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderPeriod](self, "renderPeriod");
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("renderPeriod"), 3);
  -[UISceneAsynchronousRenderingOptions renderMaxAPL](self, "renderMaxAPL");
  v6 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("renderMaxAPL"), 3, v5);
  -[UISceneAsynchronousRenderingOptions renderTimes](self, "renderTimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[UISceneAsynchronousRenderingOptions renderTimes](self, "renderTimes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v9, "count"), CFSTR("renderTimes.count"));

  }
  v11 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque"), CFSTR("opaque"), 1);
  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneAsynchronousRenderingOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  float v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  UISceneAsynchronousRenderingOptions *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISceneAsynchronousRenderingOptions renderPeriod](self, "renderPeriod");
  v6 = (id)objc_msgSend(v5, "appendDouble:withName:decimalPrecision:", CFSTR("renderPeriod"), 3);
  -[UISceneAsynchronousRenderingOptions renderMaxAPL](self, "renderMaxAPL");
  v8 = (id)objc_msgSend(v5, "appendFloat:withName:decimalPrecision:", CFSTR("renderMaxAPL"), 3, v7);
  -[UISceneAsynchronousRenderingOptions renderTimes](self, "renderTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __77__UISceneAsynchronousRenderingOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
    v15 = &unk_1E16B1B50;
    v16 = v5;
    v17 = self;
    objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, &v12);

  }
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[UISceneAsynchronousRenderingOptions opaque](self, "opaque", v12, v13, v14, v15), CFSTR("opaque"));

  return v5;
}

void __77__UISceneAsynchronousRenderingOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "renderTimes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v4, CFSTR("renderTimes"), v3, 0);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneAsynchronousRenderingOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
