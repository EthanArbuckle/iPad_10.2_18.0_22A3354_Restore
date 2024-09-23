@implementation STUIStatusBarStyleRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t resolvedStyle;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarStyleRequest;
  if (-[STUIStatusBarStyleRequest isEqual:](&v8, sel_isEqual_, v4))
  {
    resolvedStyle = self->_resolvedStyle;
    v6 = resolvedStyle == objc_msgSend(v4, "resolvedStyle");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)resolvedStyle
{
  return self->_resolvedStyle;
}

- (STUIStatusBarStyleRequest)initWithResolvedStyle:(int64_t)a3 foregroundColor:(id)a4
{
  id v6;
  uint64_t v7;
  STUIStatusBarStyleRequest *v8;
  objc_super v10;

  v6 = a4;
  v7 = _UIStatusBarStyleFromResolvedStyle();
  v10.receiver = self;
  v10.super_class = (Class)STUIStatusBarStyleRequest;
  v8 = -[STUIStatusBarStyleRequest initWithStyle:legibilityStyle:foregroundColor:](&v10, sel_initWithStyle_legibilityStyle_foregroundColor_, v7, 0, v6);

  if (v8)
    v8->_resolvedStyle = a3;
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStyleRequest;
  v3 = -[STUIStatusBarStyleRequest hash](&v5, sel_hash);
  return 1000 * self->_resolvedStyle - v3 + 32 * v3;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarStyleRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarStyleRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STUIStatusBarStyleRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarStyleRequest _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarStyleRequest _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STUIStatusBarStyleRequest *v14;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarStyleRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__STUIStatusBarStyleRequest__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E8D62C88;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

id __77__STUIStatusBarStyleRequest__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  +[STUIStatusBar stringForStatusBarStyle:](STUIStatusBar, "stringForStatusBarStyle:", objc_msgSend(*(id *)(a1 + 40), "resolvedStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("resolvedStyle"), 1);

  objc_msgSend(*(id *)(a1 + 40), "style");
  v4 = _UIStatusBarResolvedStyleFromStyle();
  if (v4 != objc_msgSend(*(id *)(a1 + 40), "resolvedStyle"))
  {
    v5 = *(void **)(a1 + 32);
    _STUIStringFromStatusBarLegacyStyle(objc_msgSend(*(id *)(a1 + 40), "style"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:withName:", v6, CFSTR("style"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "legibilityStyle"))
  {
    v7 = *(void **)(a1 + 32);
    _STUIStringFromUILegibilityStyle(objc_msgSend(*(id *)(a1 + 40), "legibilityStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:withName:", v8, CFSTR("legibilityStyle"));

  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v10, CFSTR("foregroundColor"), 1);

  objc_msgSend(*(id *)(a1 + 40), "foregroundAlpha");
  if (v12 != 1.0)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "foregroundAlpha");
    v14 = (id)objc_msgSend(v13, "appendDouble:withName:decimalPrecision:", CFSTR("foregroundAlpha"), 1);
  }
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isDoubleHeight"), CFSTR("isDoubleHeight"), 1);
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isTranslucent"), CFSTR("isTranslucent"), 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isLegacy"), CFSTR("isLegacy"), 1);
}

@end
