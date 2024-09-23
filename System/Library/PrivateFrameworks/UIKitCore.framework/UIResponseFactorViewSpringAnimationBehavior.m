@implementation UIResponseFactorViewSpringAnimationBehavior

- (UIResponseFactorViewSpringAnimationBehavior)initWithWrapedBehavior:(id)a3 responseFactor:(double)a4
{
  id v7;
  UIResponseFactorViewSpringAnimationBehavior *v8;
  UIResponseFactorViewSpringAnimationBehavior *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIResponseFactorViewSpringAnimationBehavior;
  v8 = -[UIResponseFactorViewSpringAnimationBehavior init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wrappedBehavior, a3);
    v9->_responseFactor = a4;
  }

  return v9;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  void *v10;
  $6E732EA7D3E0C9EC9CEEF7385E7E4683 *result;
  double v12;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  -[UIResponseFactorViewSpringAnimationBehavior wrappedBehavior](self, "wrappedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "parametersForTransitionFromState:toState:", v6, v5);
  }
  else
  {
    *(_OWORD *)&retstr->var7 = 0u;
    *(_OWORD *)&retstr->var9 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)-[UIResponseFactorViewSpringAnimationBehavior responseFactor](self, "responseFactor");
  retstr->var1 = v12 * retstr->var1;
  return result;
}

- (UIViewSpringAnimationBehaviorDescribing)wrappedBehavior
{
  return self->_wrappedBehavior;
}

- (void)setWrappedBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedBehavior, a3);
}

- (double)responseFactor
{
  return self->_responseFactor;
}

- (void)setResponseFactor:(double)a3
{
  self->_responseFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedBehavior, 0);
}

@end
