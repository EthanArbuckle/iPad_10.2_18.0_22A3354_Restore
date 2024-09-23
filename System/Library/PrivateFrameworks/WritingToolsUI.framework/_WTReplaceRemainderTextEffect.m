@implementation _WTReplaceRemainderTextEffect

- (void)updateEffectWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  dispatch_time_t v32;
  _QWORD block[5];

  v4 = a3;
  -[_WTTextEffect rootLayer](self, "rootLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v6, "layerWithContents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect setRootLayer:](self, "setRootLayer:", v7);

    -[_WTTextEffect effectView](self, "effectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v10);

    -[_WTTextEffect rootLayer](self, "rootLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "position");
    v13 = v12;
    v15 = v14;

    -[_WTReplaceRemainderTextEffect offset](self, "offset");
    v17 = v15 - v16;
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "position");
    v20 = v19;
    v22 = v21;

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTimingFunction:", v24);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPlatformCGPoint:", v13, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFromValue:", v25);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPlatformCGPoint:", v20, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setToValue:", v26);

    -[_WTTextEffect sweepDuration](self, "sweepDuration");
    v28 = v27;
    -[_WTReplaceRemainderTextEffect offset](self, "offset");
    objc_msgSend(v23, "setDuration:", v28 * dbl_24A7EDB60[v29 > 0.0]);
    objc_msgSend(v23, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v23, "setRemovedOnCompletion:", 0);
    -[_WTTextEffect rootLayer](self, "rootLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAnimation:forKey:", v23, 0);

    -[_WTTextEffect sweepDuration](self, "sweepDuration");
    v32 = dispatch_time(0, (uint64_t)(v31 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50___WTReplaceRemainderTextEffect_updateEffectWith___block_invoke;
    block[3] = &unk_251C07238;
    block[4] = self;
    dispatch_after(v32, MEMORY[0x24BDAC9B8], block);

  }
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end
