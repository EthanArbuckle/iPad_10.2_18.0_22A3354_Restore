@implementation PBUIHomeVariantStyleState

+ (id)stateWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  PBUIHomeVariantStyleState *v15;

  v8 = a5;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[PBUIHomeVariantStyleState initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:]([PBUIHomeVariantStyleState alloc], "initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:", v14, v13, v8, v12, v11);

  return v15;
}

- (PBUIHomeVariantStyleState)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isHomeScreenDimmed:(BOOL)a5 iconSize:(id)a6 iconStyle:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PBUIHomeVariantStyleState *v16;
  uint64_t v17;
  PUIDiscreteGradientVariatedCustomStyle *tintColorStyle;
  uint64_t v19;
  UIColor *suggestedTintColor;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PBUIHomeVariantStyleState;
  v16 = -[PBUIHomeVariantStyleState init](&v28, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    tintColorStyle = v16->_tintColorStyle;
    v16->_tintColorStyle = (PUIDiscreteGradientVariatedCustomStyle *)v17;

    v19 = objc_msgSend(v13, "copy");
    suggestedTintColor = v16->_suggestedTintColor;
    v16->_suggestedTintColor = (UIColor *)v19;

    v16->_isHomeScreenDimmed = a5;
    v21 = objc_msgSend(v14, "copy");
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = CFSTR("SMALL");
    objc_storeStrong((id *)&v16->_iconSize, v23);

    v24 = objc_msgSend(v15, "copy");
    v25 = (void *)v24;
    if (v24)
      v26 = (__CFString *)v24;
    else
      v26 = CFSTR("auto");
    objc_storeStrong((id *)&v16->_iconStyle, v26);

  }
  return v16;
}

- (PBUIHomeVariantStyleState)init
{

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  PBUIHomeVariantStyleState *v4;
  PBUIHomeVariantStyleState *v5;
  BOOL v6;

  v4 = (PBUIHomeVariantStyleState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PBUIHomeVariantStyleState isEqualToState:](self, "isEqualToState:", v5);

  return v6;
}

- (BOOL)isEqualToState:(id)a3
{
  PBUIHomeVariantStyleState *v4;
  unsigned __int8 *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;

  v4 = (PBUIHomeVariantStyleState *)a3;
  v5 = (unsigned __int8 *)v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_8;
    -[PBUIHomeVariantStyleState tintColorStyle](v4, "tintColorStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();

    if (!v7)
      goto LABEL_8;
    objc_msgSend(v5, "suggestedTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualObjects();

    if (!v9)
      goto LABEL_8;
    objc_msgSend(v5, "iconSize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (!v11)
      goto LABEL_8;
    objc_msgSend(v5, "iconStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSEqualObjects();

    if (v13)
      v14 = v5[8] == self->_isHomeScreenDimmed;
    else
LABEL_8:
      v14 = 0;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIHomeVariantStyleState tintColorStyle](self, "tintColorStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("tintColorStyle"));

  -[PBUIHomeVariantStyleState suggestedTintColor](self, "suggestedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("suggestedTintColor"), 1);

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[PBUIHomeVariantStyleState isHomeScreenDimmed](self, "isHomeScreenDimmed"), CFSTR("isHomeScreenDimmed"));
  -[PBUIHomeVariantStyleState iconSize](self, "iconSize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("iconSize"));

  -[PBUIHomeVariantStyleState iconStyle](self, "iconStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("iconStyle"));

  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)styleStateByUpdatingSuggestedTintColor:(id)a3
{
  id v4;
  PBUIHomeVariantStyleState *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  PBUIHomeVariantStyleState *v10;

  v4 = a3;
  v5 = [PBUIHomeVariantStyleState alloc];
  -[PBUIHomeVariantStyleState tintColorStyle](self, "tintColorStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBUIHomeVariantStyleState isHomeScreenDimmed](self, "isHomeScreenDimmed");
  -[PBUIHomeVariantStyleState iconSize](self, "iconSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIHomeVariantStyleState iconStyle](self, "iconStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PBUIHomeVariantStyleState initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:](v5, "initWithTintColorStyle:suggestedTintColor:isHomeScreenDimmed:iconSize:iconStyle:", v6, v4, v7, v8, v9);

  return v10;
}

- (BOOL)isHomeScreenDimmed
{
  return self->_isHomeScreenDimmed;
}

- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle
{
  return self->_tintColorStyle;
}

- (UIColor)suggestedTintColor
{
  return self->_suggestedTintColor;
}

- (NSString)iconStyle
{
  return self->_iconStyle;
}

- (NSString)iconSize
{
  return self->_iconSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSize, 0);
  objc_storeStrong((id *)&self->_iconStyle, 0);
  objc_storeStrong((id *)&self->_suggestedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColorStyle, 0);
}

@end
