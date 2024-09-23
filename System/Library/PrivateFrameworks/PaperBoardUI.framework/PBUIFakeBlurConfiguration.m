@implementation PBUIFakeBlurConfiguration

- (_QWORD)initWithVariant:(uint64_t)a3 style:(void *)a4 traitCollection:
{
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v7 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PBUIFakeBlurConfiguration;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      v8[1] = a2;
      v8[2] = a3;
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)a1[3];
      a1[3] = v9;

    }
  }

  return a1;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_variant);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_requestedStyle);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t variant;
  uint64_t v8;
  id v9;
  id v10;
  int64_t requestedStyle;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  variant = self->_variant;
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke;
  v21[3] = &unk_1E6B95928;
  v9 = v6;
  v22 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", variant, v21);
  requestedStyle = self->_requestedStyle;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_2;
  v19[3] = &unk_1E6B95928;
  v12 = v9;
  v20 = v12;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", requestedStyle, v19);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_3;
  v17[3] = &unk_1E6B95950;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  v15 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v17, 0);
  LOBYTE(requestedStyle) = objc_msgSend(v5, "isEqual");

  return requestedStyle;
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsTraitsInCollection:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) & 1) != 0)return 1;
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsTraitsInCollection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (NSString)description
{
  return (NSString *)-[PBUIFakeBlurConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIFakeBlurConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperVariant(self->_variant);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("variant"));

  PBUIWallpaperStyleDescription(self->_requestedStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("requestedStyle"));

  _UIUserInterfaceStyleDescription(-[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("traitCollection.userInterfaceStyle"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIFakeBlurConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
