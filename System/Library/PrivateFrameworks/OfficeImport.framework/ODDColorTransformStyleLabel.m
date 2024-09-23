@implementation ODDColorTransformStyleLabel

- (void)setFillColors:(id)a3
{
  objc_storeStrong((id *)&self->mFillColors, a3);
}

- (void)setLineColors:(id)a3
{
  objc_storeStrong((id *)&self->mLineColors, a3);
}

- (void)setEffectColors:(id)a3
{
  objc_storeStrong((id *)&self->mEffectColors, a3);
}

- (void)setTextLineColors:(id)a3
{
  objc_storeStrong((id *)&self->mTextLineColors, a3);
}

- (void)setTextFillColors:(id)a3
{
  objc_storeStrong((id *)&self->mTextFillColors, a3);
}

- (void)setTextEffectColors:(id)a3
{
  objc_storeStrong((id *)&self->mTextEffectColors, a3);
}

- (void)applyToShapeStyle:(id)a3 index:(unsigned int)a4 count:(unsigned int)a5 state:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v10 = a6;
  -[ODDColorTransformStyleLabel fillColors](self, "fillColors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a5;
  objc_msgSend(v11, "colorAtIndex:count:state:", a4, a5, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v24, "fillReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColor:", v13);

  }
  -[ODDColorTransformStyleLabel lineColors](self, "lineColors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorAtIndex:count:state:", a4, v12, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v24, "lineReference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColor:", v16);

  }
  -[ODDColorTransformStyleLabel effectColors](self, "effectColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorAtIndex:count:state:", a4, v12, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v24, "effectReference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColor:", v19);

  }
  -[ODDColorTransformStyleLabel textFillColors](self, "textFillColors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorAtIndex:count:state:", a4, v12, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v24, "fontReference");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setColor:", v22);

  }
}

- (id)fillColors
{
  return self->mFillColors;
}

- (id)lineColors
{
  return self->mLineColors;
}

- (id)effectColors
{
  return self->mEffectColors;
}

- (id)textFillColors
{
  return self->mTextFillColors;
}

- (id)textLineColors
{
  return self->mTextLineColors;
}

- (id)textEffectColors
{
  return self->mTextEffectColors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextEffectColors, 0);
  objc_storeStrong((id *)&self->mTextFillColors, 0);
  objc_storeStrong((id *)&self->mTextLineColors, 0);
  objc_storeStrong((id *)&self->mEffectColors, 0);
  objc_storeStrong((id *)&self->mLineColors, 0);
  objc_storeStrong((id *)&self->mFillColors, 0);
}

@end
