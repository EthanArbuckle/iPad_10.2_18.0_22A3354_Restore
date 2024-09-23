@implementation SBHWidgetDisplayConfiguration

- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4
{
  return -[SBHWidgetDisplayConfiguration initWithRenderScheme:colorScheme:tintParameters:](self, "initWithRenderScheme:colorScheme:tintParameters:", a3, a4, 0);
}

- (SBHWidgetDisplayConfiguration)initWithRenderScheme:(id)a3 colorScheme:(unint64_t)a4 tintParameters:(id)a5
{
  id v8;
  id v9;
  SBHWidgetDisplayConfiguration *v10;
  uint64_t v11;
  CHSWidgetRenderScheme *renderScheme;
  uint64_t v13;
  CHSWidgetTintParameters *tintParameters;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHWidgetDisplayConfiguration;
  v10 = -[SBHWidgetDisplayConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    renderScheme = v10->_renderScheme;
    v10->_renderScheme = (CHSWidgetRenderScheme *)v11;

    v10->_colorScheme = a4;
    v13 = objc_msgSend(v9, "copy");
    tintParameters = v10->_tintParameters;
    v10->_tintParameters = (CHSWidgetTintParameters *)v13;

  }
  return v10;
}

- (SBHWidgetDisplayConfiguration)init
{
  id v3;
  SBHWidgetDisplayConfiguration *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D10250]);
  v4 = -[SBHWidgetDisplayConfiguration initWithRenderScheme:colorScheme:tintParameters:](self, "initWithRenderScheme:colorScheme:tintParameters:", v3, 0, 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBHWidgetDisplayConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBHWidgetDisplayConfiguration *v7;
  char v8;

  v4 = (SBHWidgetDisplayConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (BSEqualObjects() && self->_colorScheme == v7->_colorScheme)
        v8 = BSEqualObjects();
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  -[SBHWidgetDisplayConfiguration renderScheme](self, "renderScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SBHWidgetDisplayConfiguration colorScheme](self, "colorScheme") ^ v4;
  -[SBHWidgetDisplayConfiguration tintParameters](self, "tintParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  -[SBHWidgetDisplayConfiguration appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBHWidgetDisplayConfiguration *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBHWidgetDisplayConfiguration_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

void __62__SBHWidgetDisplayConfiguration_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "renderScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("renderScheme"));

  v5 = *(void **)(a1 + 32);
  MEMORY[0x1D17DEDD0](objc_msgSend(*(id *)(a1 + 40), "colorScheme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:skipIfEmpty:", v6, CFSTR("colorScheme"), 0);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "tintParameters");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "appendObject:withName:", v9, CFSTR("tintParameters"));

}

- (CHSWidgetRenderScheme)renderScheme
{
  return self->_renderScheme;
}

- (unint64_t)colorScheme
{
  return self->_colorScheme;
}

- (CHSWidgetTintParameters)tintParameters
{
  return self->_tintParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_renderScheme, 0);
}

@end
