@implementation PXPointAnimator

- (PXPointAnimator)init
{
  return -[PXPointAnimator initWithValue:](self, "initWithValue:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (PXPointAnimator)initWithValue:(CGPoint)a3
{
  return -[PXPointAnimator initWithValue:epsilon:](self, "initWithValue:epsilon:", a3.x, a3.y, 0.001);
}

- (PXPointAnimator)initWithValue:(CGPoint)a3 epsilon:(double)a4
{
  CGFloat y;
  CGFloat x;
  PXPointAnimator *v7;
  PXPointAnimator *v8;
  objc_super v10;
  _QWORD v11[4];
  PXPointAnimator *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)PXPointAnimator;
  v7 = -[PXObservable init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__PXPointAnimator_initWithValue_epsilon___block_invoke;
    v11[3] = &unk_2514D0AF8;
    v12 = v7;
    v13 = x;
    v14 = y;
    v15 = a4;
    v10.receiver = v12;
    v10.super_class = (Class)PXPointAnimator;
    -[PXObservable performChanges:](&v10, sel_performChanges_, v11);

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPointAnimator xAnimator](self, "xAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPointAnimator yAnimator](self, "yAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; x = %@, y = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (double)epsilon
{
  double result;

  -[PXMutableNumberAnimator epsilon](self->_xAnimator, "epsilon");
  return result;
}

- (double)currentTime
{
  double result;

  -[PXMutableNumberAnimator currentTime](self->_xAnimator, "currentTime");
  return result;
}

- (CGPoint)approximateVelocity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[PXMutableNumberAnimator approximateVelocity](self->_xAnimator, "approximateVelocity");
  v4 = v3;
  -[PXMutableNumberAnimator approximateVelocity](self->_yAnimator, "approximateVelocity");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)_update
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  -[PXMutableNumberAnimator value](self->_xAnimator, "value");
  v4 = v3;
  -[PXMutableNumberAnimator value](self->_yAnimator, "value");
  -[PXPointAnimator _setInternalValue:](self, "_setInternalValue:", v4, v5);
  -[PXMutableNumberAnimator presentationValue](self->_xAnimator, "presentationValue");
  v7 = v6;
  -[PXMutableNumberAnimator presentationValue](self->_yAnimator, "presentationValue");
  -[PXPointAnimator setPresentationValue:](self, "setPresentationValue:", v7, v8);
  if ((-[PXMutableNumberAnimator isAnimating](self->_xAnimator, "isAnimating") & 1) != 0)
    v9 = 1;
  else
    v9 = -[PXMutableNumberAnimator isAnimating](self->_yAnimator, "isAnimating");
  -[PXPointAnimator setIsAnimating:](self, "setIsAnimating:", v9);
}

- (void)_setInternalValue:(CGPoint)a3
{
  if (self->_value.x != a3.x || self->_value.y != a3.y)
  {
    self->_value = a3;
    -[PXObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)setPresentationValue:(CGPoint)a3
{
  if (self->_presentationValue.x != a3.x || self->_presentationValue.y != a3.y)
  {
    self->_presentationValue = a3;
    -[PXObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PXObservable signalChange:](self, "signalChange:", 4);
  }
}

- (void)performChangesWithoutAnimation:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PXPointAnimator *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke;
  v5[3] = &unk_2514D0B48;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PXPointAnimator;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[PXObservable performChanges:](&v4, sel_performChanges_, v5);

}

- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5
{
  id v5;
  objc_super v6;
  _QWORD v7[4];
  PXPointAnimator *v8;
  id v9;
  double v10;
  int64_t v11;

  v7[1] = 3221225472;
  v7[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke;
  v7[3] = &unk_2514D0B98;
  v10 = a3;
  v11 = a4;
  v8 = self;
  v9 = a5;
  v6.receiver = v8;
  v6.super_class = (Class)PXPointAnimator;
  v7[0] = MEMORY[0x24BDAC760];
  v5 = v9;
  -[PXObservable performChanges:](&v6, sel_performChanges_, v7);

}

- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(CGPoint)a3 changes:(id)a4
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  PXPointAnimator *v7;
  id v8;
  CGPoint v9;

  v6[1] = 3221225472;
  v6[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke;
  v6[3] = &unk_2514D0B98;
  v9 = a3;
  v7 = self;
  v8 = a4;
  v5.receiver = v7;
  v5.super_class = (Class)PXPointAnimator;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v8;
  -[PXObservable performChanges:](&v5, sel_performChanges_, v6);

}

- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(CGPoint)a5 changes:(id)a6
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  PXPointAnimator *v9;
  id v10;
  double v11;
  double v12;
  CGPoint v13;

  v8[1] = 3221225472;
  v8[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke;
  v8[3] = &unk_2514D0BE8;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v9 = self;
  v10 = a6;
  v7.receiver = v9;
  v7.super_class = (Class)PXPointAnimator;
  v8[0] = MEMORY[0x24BDAC760];
  v6 = v10;
  -[PXObservable performChanges:](&v7, sel_performChanges_, v8);

}

- (void)setLabel:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMutableNumberAnimator setLabel:](self->_xAnimator, "setLabel:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("y_%@"), v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMutableNumberAnimator setLabel:](self->_yAnimator, "setLabel:", v7);

}

- (void)performChanges:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PXPointAnimator *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __34__PXPointAnimator_performChanges___block_invoke;
  v5[3] = &unk_2514D0B48;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PXPointAnimator;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[PXObservable performChanges:](&v4, sel_performChanges_, v5);

}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPointAnimator;
  -[PXObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[PXPointAnimator _update](self, "_update");
}

- (void)setValue:(CGPoint)a3
{
  double y;

  y = a3.y;
  -[PXMutableNumberAnimator setValue:](self->_xAnimator, "setValue:", a3.x);
  -[PXMutableNumberAnimator setValue:](self->_yAnimator, "setValue:", y);
}

- (PXMutableNumberAnimator)xAnimator
{
  return self->_xAnimator;
}

- (PXMutableNumberAnimator)yAnimator
{
  return self->_yAnimator;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPointAnimator;
  -[PXObservable performChanges:](&v5, sel_performChanges_, &__block_literal_global_7057, a4, a5);
}

- (void)handleDisplayLink:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  PXPointAnimator *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __37__PXPointAnimator_handleDisplayLink___block_invoke;
  v5[3] = &unk_2514D0C50;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)PXPointAnimator;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[PXObservable performChanges:](&v4, sel_performChanges_, v5);

}

- (CGPoint)value
{
  double x;
  double y;
  CGPoint result;

  x = self->_value.x;
  y = self->_value.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)presentationValue
{
  double x;
  double y;
  CGPoint result;

  x = self->_presentationValue.x;
  y = self->_presentationValue.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_yAnimator, 0);
  objc_storeStrong((id *)&self->_xAnimator, 0);
}

uint64_t __37__PXPointAnimator_handleDisplayLink___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "handleDisplayLink:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "handleDisplayLink:", *(_QWORD *)(a1 + 40));
}

void __34__PXPointAnimator_performChanges___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 96);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__PXPointAnimator_performChanges___block_invoke_2;
  v4[3] = &unk_2514D0B20;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "performChanges:", v4);

}

void __34__PXPointAnimator_performChanges___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __34__PXPointAnimator_performChanges___block_invoke_3;
  v5[3] = &unk_2514D0B20;
  v5[1] = 3221225472;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performChanges:", v5);

}

uint64_t __34__PXPointAnimator_performChanges___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke(double *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[5];
  id v8;
  double v9;
  double v10;
  __int128 v11;

  v1 = *((_QWORD *)a1 + 4);
  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(v1 + 96);
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_2;
  v7[3] = &unk_2514D0BC0;
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7[1] = 3221225472;
  v7[4] = v1;
  v9 = v4;
  v10 = v5;
  v11 = *((_OWORD *)a1 + 4);
  v8 = v2;
  objc_msgSend(v3, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v7, v4, v5, v6);

}

void __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_2(double *a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(*((_QWORD *)a1 + 4) + 104);
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_3;
  v8[3] = &unk_2514D0B20;
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[9];
  v8[1] = 3221225472;
  v7 = v2;
  *(double *)&v8[4] = a1[4];
  v9 = v7;
  objc_msgSend(v3, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v8, v4, v5, v6);

}

uint64_t __104__PXPointAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke(double *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v1 = *((_QWORD *)a1 + 4);
  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(v1 + 96);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_2;
  v5[3] = &unk_2514D0B70;
  v4 = a1[6];
  v5[1] = 3221225472;
  v5[4] = v1;
  v7 = *((_OWORD *)a1 + 3);
  v6 = v2;
  objc_msgSend(v3, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v5, v4);

}

void __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_2(double *a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(*((_QWORD *)a1 + 4) + 104);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_3;
  v6[3] = &unk_2514D0B20;
  v4 = a1[7];
  v6[1] = 3221225472;
  v5 = v2;
  *(double *)&v6[4] = a1[4];
  v7 = v5;
  objc_msgSend(v3, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v6, v4);

}

uint64_t __88__PXPointAnimator_performChangesUsingDefaultSpringAnimationWithInitialVelocity_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke(double *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  double v8;
  uint64_t v9;

  v1 = *((_QWORD *)a1 + 4);
  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(v1 + 96);
  v4 = a1[6];
  v5 = *((_QWORD *)a1 + 7);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_2;
  v6[3] = &unk_2514D0B70;
  v6[4] = v1;
  v8 = v4;
  v9 = v5;
  v7 = v2;
  objc_msgSend(v3, "performChangesWithDuration:curve:changes:", v5, v6, v4);

}

void __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_2(double *a1)
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)*((_QWORD *)a1 + 5);
  v3 = *(void **)(*((_QWORD *)a1 + 4) + 104);
  v4 = a1[6];
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_3;
  v7[3] = &unk_2514D0B20;
  v5 = *((_QWORD *)a1 + 7);
  v7[1] = 3221225472;
  v6 = v2;
  *(double *)&v7[4] = a1[4];
  v8 = v6;
  objc_msgSend(v3, "performChangesWithDuration:curve:changes:", v5, v7, v4);

}

uint64_t __60__PXPointAnimator_performChangesWithDuration_curve_changes___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 96);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_2;
  v4[3] = &unk_2514D0B20;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "performChangesWithoutAnimation:", v4);

}

void __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_3;
  v5[3] = &unk_2514D0B20;
  v5[1] = 3221225472;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "performChangesWithoutAnimation:", v5);

}

uint64_t __50__PXPointAnimator_performChangesWithoutAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __41__PXPointAnimator_initWithValue_epsilon___block_invoke(uint64_t a1)
{
  PXNumberAnimator *v2;
  uint64_t v3;
  void *v4;
  PXNumberAnimator *v5;
  uint64_t v6;
  void *v7;

  v2 = -[PXNumberAnimator initWithValue:epsilon:]([PXNumberAnimator alloc], "initWithValue:epsilon:", *(double *)(a1 + 40), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  v5 = -[PXNumberAnimator initWithValue:epsilon:]([PXNumberAnimator alloc], "initWithValue:epsilon:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setDisplayLinkTarget:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setDisplayLinkTarget:");
}

@end
