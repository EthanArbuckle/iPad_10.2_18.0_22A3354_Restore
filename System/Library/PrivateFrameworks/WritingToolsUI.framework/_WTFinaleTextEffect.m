@implementation _WTFinaleTextEffect

- (void)updateEffectWith:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];

  v4 = a3;
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect setRootLayer:](self, "setRootLayer:", v7);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect setMaskLayer:](self, "setMaskLayer:", v8);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect setTextContentLayer:](self, "setTextContentLayer:", v9);

    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect setGradientLayer:](self, "setGradientLayer:", v10);

    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect setGradientHostLayer:](self, "setGradientHostLayer:", v11);

    +[_WTLightEffectPalette finaleSweep](_WTLightEffectPalette, "finaleSweep");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColors:", v13);

    -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStartPoint:", 0.0, 0.0);

    -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEndPoint:", 0.0, 1.0);

    -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 0.5;
    objc_msgSend(v17, "setOpacity:", v18);

    -[_WTFinaleTextEffect maskLayer](self, "maskLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect gradientHostLayer](self, "gradientHostLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMask:", v19);

    -[_WTFinaleTextEffect gradientHostLayer](self, "gradientHostLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v22);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect gradientHostLayer](self, "gradientHostLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", v24);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTFinaleTextEffect textContentLayer](self, "textContentLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v26);

    -[_WTTextEffect effectView](self, "effectView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v29);

    v35[0] = v6;
    v35[1] = 3221225472;
    v35[2] = __40___WTFinaleTextEffect_updateEffectWith___block_invoke;
    v35[3] = &unk_251C07540;
    v35[4] = self;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 1, v35, 2.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect setTimer:](self, "setTimer:", v30);

  }
  -[_WTTextEffect effectView](self, "effectView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __40___WTFinaleTextEffect_updateEffectWith___block_invoke_2;
  v33[3] = &unk_251C074F0;
  v33[4] = self;
  v34 = v4;
  v32 = v4;
  objc_msgSend(v31, "platformPerformWithoutAnimation:", v33);

  -[_WTFinaleTextEffect _sweep](self, "_sweep");
}

- (void)_sweep
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[9];

  -[_WTTextEffect rootLayer](self, "rootLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v9 * -2.0;
  v11 = v9 * 4.0;
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[_WTTextEffect effectView](self, "effectView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __29___WTFinaleTextEffect__sweep__block_invoke;
  v22[3] = &unk_251C07568;
  v22[4] = self;
  v22[5] = v5;
  *(double *)&v22[6] = v10;
  v22[7] = v7;
  *(double *)&v22[8] = v11;
  objc_msgSend(v19, "platformPerformWithoutAnimation:", v22);

  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 2.0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationTimingFunction:", v20);

  -[_WTFinaleTextEffect gradientLayer](self, "gradientLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v14, 0.0, v16, v18 * 4.0);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CALayer)textContentLayer
{
  return (CALayer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTextContentLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CAShapeLayer)maskLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMaskLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CALayer)gradientHostLayer
{
  return (CALayer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setGradientHostLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CAGradientLayer)gradientLayer
{
  return (CAGradientLayer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setGradientLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientHostLayer, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_textContentLayer, 0);
}

@end
