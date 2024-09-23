@implementation TUAnimationAffineTransformFunction

- (TUAnimationAffineTransformFunction)initWithTimingFunction:(id)a3 startTransform:(CGAffineTransform *)a4 endTransform:(CGAffineTransform *)a5 speed:(double)a6
{
  id v10;
  char *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;

  v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUAnimationAffineTransformFunction;
  v11 = -[TUAnimationAffineTransformFunction init](&v19, sel_init);
  if (v11)
  {
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    v14 = *(_OWORD *)&a4->a;
    v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)(v11 + 104) = *(_OWORD *)&a4->tx;
    *(_OWORD *)(v11 + 88) = v15;
    *(_OWORD *)(v11 + 72) = v14;
    v16 = *(_OWORD *)&a5->a;
    v17 = *(_OWORD *)&a5->c;
    *(_OWORD *)(v11 + 152) = *(_OWORD *)&a5->tx;
    *(_OWORD *)(v11 + 136) = v17;
    *(_OWORD *)(v11 + 120) = v16;
    *((double *)v11 + 2) = a6;
    objc_msgSend(v11, "_reloadFunctions");
  }

  return (TUAnimationAffineTransformFunction *)v11;
}

- (CGAffineTransform)solveForTime:(SEL)a3
{
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGAffineTransform *result;
  id v24;

  -[TUAnimationAffineTransformFunction aFunction](self, "aFunction");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "solveForTime:", a4);
  v8 = v7;
  -[TUAnimationAffineTransformFunction bFunction](self, "bFunction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "solveForTime:", a4);
  v11 = v10;
  -[TUAnimationAffineTransformFunction cFunction](self, "cFunction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "solveForTime:", a4);
  v14 = v13;
  -[TUAnimationAffineTransformFunction dFunction](self, "dFunction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "solveForTime:", a4);
  v17 = v16;
  -[TUAnimationAffineTransformFunction txFunction](self, "txFunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "solveForTime:", a4);
  v20 = v19;
  -[TUAnimationAffineTransformFunction tyFunction](self, "tyFunction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "solveForTime:", a4);
  retstr->a = v8;
  retstr->b = v11;
  retstr->c = v14;
  retstr->d = v17;
  retstr->tx = v20;
  retstr->ty = v22;

  return result;
}

- (void)setStartValue:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_startValue.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_startValue.c = v4;
  *(_OWORD *)&self->_startValue.a = v3;
  -[TUAnimationAffineTransformFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)setEndValue:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endValue.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endValue.c = v4;
  *(_OWORD *)&self->_endValue.a = v3;
  -[TUAnimationAffineTransformFunction _reloadFunctions](self, "_reloadFunctions");
}

- (void)_reloadFunctions
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__TUAnimationAffineTransformFunction__reloadFunctions__block_invoke;
  aBlock[3] = &unk_1E6309518;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setAFunction:](self, "setAFunction:", v4);

  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setBFunction:](self, "setBFunction:", v5);

  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setCFunction:](self, "setCFunction:", v6);

  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setDFunction:](self, "setDFunction:", v7);

  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setTxFunction:](self, "setTxFunction:", v8);

  -[TUAnimationAffineTransformFunction startValue](self, "startValue");
  -[TUAnimationAffineTransformFunction endValue](self, "endValue");
  v3[2](v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAnimationAffineTransformFunction setTyFunction:](self, "setTyFunction:", v9);

}

TUAnimationFloatFunction *__54__TUAnimationAffineTransformFunction__reloadFunctions__block_invoke(uint64_t a1, double a2, double a3)
{
  TUAnimationFloatFunction *v6;
  void *v7;
  double v8;
  TUAnimationFloatFunction *v9;

  v6 = [TUAnimationFloatFunction alloc];
  objc_msgSend(*(id *)(a1 + 32), "timingFunction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "speed");
  v9 = -[TUAnimationFloatFunction initWithTimingFunction:startValue:endValue:speed:](v6, "initWithTimingFunction:startValue:endValue:speed:", v7, a2, a3, v8);

  return v9;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (CGAffineTransform)startValue
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (CGAffineTransform)endValue
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (TUAnimationFloatFunction)aFunction
{
  return self->_aFunction;
}

- (void)setAFunction:(id)a3
{
  objc_storeStrong((id *)&self->_aFunction, a3);
}

- (TUAnimationFloatFunction)bFunction
{
  return self->_bFunction;
}

- (void)setBFunction:(id)a3
{
  objc_storeStrong((id *)&self->_bFunction, a3);
}

- (TUAnimationFloatFunction)cFunction
{
  return self->_cFunction;
}

- (void)setCFunction:(id)a3
{
  objc_storeStrong((id *)&self->_cFunction, a3);
}

- (TUAnimationFloatFunction)dFunction
{
  return self->_dFunction;
}

- (void)setDFunction:(id)a3
{
  objc_storeStrong((id *)&self->_dFunction, a3);
}

- (TUAnimationFloatFunction)txFunction
{
  return self->_txFunction;
}

- (void)setTxFunction:(id)a3
{
  objc_storeStrong((id *)&self->_txFunction, a3);
}

- (TUAnimationFloatFunction)tyFunction
{
  return self->_tyFunction;
}

- (void)setTyFunction:(id)a3
{
  objc_storeStrong((id *)&self->_tyFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tyFunction, 0);
  objc_storeStrong((id *)&self->_txFunction, 0);
  objc_storeStrong((id *)&self->_dFunction, 0);
  objc_storeStrong((id *)&self->_cFunction, 0);
  objc_storeStrong((id *)&self->_bFunction, 0);
  objc_storeStrong((id *)&self->_aFunction, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
