@implementation STUIStatusBarSignalViewCacheKey

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 16);
}

id __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_9(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 136);
}

uint64_t __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_6(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 80);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 72);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 64);
}

double __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_7(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 96);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  Class classType;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  double radius;
  id v16;
  id v17;
  double lineWidth;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _BOOL8 alternate;
  id v26;
  id v27;
  double scale;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  classType = self->_classType;
  v8 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke;
  v48[3] = &unk_1E8D62BC0;
  v9 = v6;
  v49 = v9;
  v10 = (id)objc_msgSend(v5, "appendClass:counterpart:", classType, v48);
  v46[0] = v8;
  v46[1] = 3221225472;
  v46[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_2;
  v46[3] = &unk_1E8D62BE8;
  v11 = v9;
  v47 = v11;
  v12 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v46, self->_size.width, self->_size.height);
  v44[0] = v8;
  v44[1] = 3221225472;
  v44[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_3;
  v44[3] = &unk_1E8D62C10;
  v13 = v11;
  v45 = v13;
  v14 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v44, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  radius = self->_radius;
  v42[0] = v8;
  v42[1] = 3221225472;
  v42[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_4;
  v42[3] = &unk_1E8D62C38;
  v16 = v13;
  v43 = v16;
  v17 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v42, radius);
  lineWidth = self->_lineWidth;
  v40[0] = v8;
  v40[1] = 3221225472;
  v40[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_5;
  v40[3] = &unk_1E8D62C38;
  v19 = v16;
  v41 = v19;
  v20 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v40, lineWidth);
  v38[0] = v8;
  v38[1] = 3221225472;
  v38[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_6;
  v38[3] = &unk_1E8D62BE8;
  v21 = v19;
  v39 = v21;
  v22 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v38, self->_secondarySize.width, self->_secondarySize.height);
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_7;
  v36[3] = &unk_1E8D62C10;
  v23 = v21;
  v37 = v23;
  v24 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v36, self->_secondaryRect.origin.x, self->_secondaryRect.origin.y, self->_secondaryRect.size.width, self->_secondaryRect.size.height);
  alternate = self->_alternate;
  v34[0] = v8;
  v34[1] = 3221225472;
  v34[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_8;
  v34[3] = &unk_1E8D62C60;
  v26 = v23;
  v35 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", alternate, v34);
  scale = self->_scale;
  v32[0] = v8;
  v32[1] = 3221225472;
  v32[2] = __43__STUIStatusBarSignalViewCacheKey_isEqual___block_invoke_9;
  v32[3] = &unk_1E8D62C38;
  v33 = v26;
  v29 = v26;
  v30 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v32, scale);
  LOBYTE(v26) = objc_msgSend(v5, "isEqual");

  return (char)v26;
}

- (STUIStatusBarSignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9
{
  return -[STUIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](self, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a3, a8, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a7, *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a9);
}

- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11
{
  double *result;
  objc_super v34;

  v34.receiver = a1;
  v34.super_class = (Class)STUIStatusBarSignalViewCacheKey;
  result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((_QWORD *)result + 10) = a17;
    *((_QWORD *)result + 11) = a18;
    *((_QWORD *)result + 12) = a19;
    *((_QWORD *)result + 13) = a20;
    *((_QWORD *)result + 14) = a21;
    *((_QWORD *)result + 15) = a22;
    *((_BYTE *)result + 128) = a12;
    *((_QWORD *)result + 17) = a23;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendClass:", self->_classType);
  v5 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_radius);
  v8 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lineWidth);
  v9 = (id)objc_msgSend(v3, "appendCGSize:", self->_secondarySize.width, self->_secondarySize.height);
  v10 = (id)objc_msgSend(v3, "appendCGRect:", self->_secondaryRect.origin.x, self->_secondaryRect.origin.y, self->_secondaryRect.size.width, self->_secondaryRect.size.height);
  v11 = (id)objc_msgSend(v3, "appendBool:", self->_alternate);
  v12 = (id)objc_msgSend(v3, "appendCGFloat:", self->_scale);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

- (id)description
{
  return -[STUIStatusBarSignalViewCacheKey descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarSignalViewCacheKey succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STUIStatusBarSignalViewCacheKey descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarSignalViewCacheKey _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarSignalViewCacheKey _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  STUIStatusBarSignalViewCacheKey *v13;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarSignalViewCacheKey succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__STUIStatusBarSignalViewCacheKey__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E8D62C88;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v11);

  v9 = v8;
  return v9;
}

id __83__STUIStatusBarSignalViewCacheKey__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  id v10;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("class"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("size"), *(double *)(*(_QWORD *)(a1 + 40) + 16), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("rect"), *(double *)(*(_QWORD *)(a1 + 40) + 32), *(double *)(*(_QWORD *)(a1 + 40) + 40), *(double *)(*(_QWORD *)(a1 + 40) + 48), *(double *)(*(_QWORD *)(a1 + 40) + 56));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("radius"), 10, *(double *)(*(_QWORD *)(a1 + 40) + 64));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("lineWidth"), 10, *(double *)(*(_QWORD *)(a1 + 40) + 72));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("secondarySize"), *(double *)(*(_QWORD *)(a1 + 40) + 80), *(double *)(*(_QWORD *)(a1 + 40) + 88));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("secondaryRect"), *(double *)(*(_QWORD *)(a1 + 40) + 96), *(double *)(*(_QWORD *)(a1 + 40) + 104), *(double *)(*(_QWORD *)(a1 + 40) + 112), *(double *)(*(_QWORD *)(a1 + 40) + 120));
  v9 = 0.0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 128))
    v9 = 1.0;
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("alternate"), 10, v9);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("scale"), 10, *(double *)(*(_QWORD *)(a1 + 40) + 136));
}

@end
