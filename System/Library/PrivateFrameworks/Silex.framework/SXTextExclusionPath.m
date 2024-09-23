@implementation SXTextExclusionPath

- (id)initWithTextRange:(uint64_t)a3 position:(double)a4 rect:(double)a5 withInsets:(double)a6
{
  objc_super v26;

  if (result)
  {
    v26.receiver = result;
    v26.super_class = (Class)SXTextExclusionPath;
    result = objc_msgSendSuper2(&v26, sel_init);
    if (result)
    {
      *((_DWORD *)result + 3) = 2;
      *((_QWORD *)result + 16) = a2;
      *((_QWORD *)result + 17) = a3;
      *((double *)result + 12) = a4 - a13;
      *((double *)result + 13) = a5 - a12;
      *((double *)result + 18) = a12;
      *((double *)result + 19) = a13;
      *((double *)result + 20) = a14;
      *((double *)result + 21) = a15;
      *((double *)result + 22) = a6;
      *((double *)result + 23) = a7;
      *((double *)result + 24) = a8 + a13 + a15;
      *((double *)result + 25) = a9 + a12 + a14;
    }
  }
  return result;
}

- (uint64_t)setActualPosition:(double)a3
{
  if (result)
  {
    *(double *)(result + 80) = a2;
    *(double *)(result + 88) = a3;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *componentIdentifier;
  NSString *v6;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  void *v11;
  void *v12;
  CGRect v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self)
    componentIdentifier = self->_componentIdentifier;
  else
    componentIdentifier = 0;
  v6 = componentIdentifier;
  -[SXTextExclusionPath path]((double *)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  NSStringFromCGRect(v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    x = self->_actualPosition.x;
    y = self->_actualPosition.y;
  }
  else
  {
    y = 0.0;
    x = 0.0;
  }
  NSStringFromCGPoint(*(CGPoint *)&x);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p>: %@, %@, position: %@"), v4, self, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)path
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRect:", a1[22], a1[23], a1[24], a1[25]);
    a1 = (double *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (double)actualPosition
{
  if (a1)
    return *(double *)(a1 + 80);
  else
    return 0.0;
}

- (_QWORD)wrappable
{
  _QWORD *v1;
  SXTextExclusionPathWrapper *v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    if (!a1[9])
    {
      v2 = -[SXTextExclusionPathWrapper initWithTextExclusionPath:]([SXTextExclusionPathWrapper alloc], "initWithTextExclusionPath:", a1);
      v3 = (void *)v1[9];
      v1[9] = v2;

    }
    a1 = (id)v1[9];
  }
  return a1;
}

- (void)callStartBlock
{
  SEL v2;

  if (a1)
  {
    if (a1[6])
    {
      (*(void (**)(void))(a1[6] + 16))();
      objc_setProperty_nonatomic_copy(a1, v2, 0, 48);
    }
  }
}

- (void)adjustYPositionWithCurrentPosition:(double)a3
{
  double v5;

  if (a1 && *(_QWORD *)(a1 + 56))
  {
    v5 = (*(double (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (v5 < a3)
      v5 = a3;
    *(double *)(a1 + 104) = v5;
  }
}

- (void)callCompletionBlock
{
  SEL v3;

  if (a1)
  {
    objc_setProperty_nonatomic_copy(a1, a2, 0, 56);
    if (a1[8])
    {
      (*(void (**)(void))(a1[8] + 16))();
      objc_setProperty_nonatomic_copy(a1, v3, 0, 64);
    }
  }
}

- (void)setMinYBlock:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
}

- (void)setCompletionBlock:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
}

- (double)exclusionRect
{
  if (a1)
    return *(double *)(a1 + 176);
  else
    return 0.0;
}

- (uint64_t)type
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

- (double)position
{
  if (a1)
    return *(double *)(a1 + 96);
  else
    return 0.0;
}

- (uint64_t)range
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

- (uint64_t)setRange:(uint64_t)a3
{
  if (result)
  {
    *(_QWORD *)(result + 128) = a2;
    *(_QWORD *)(result + 136) = a3;
  }
  return result;
}

- (double)verticalAlignmentFactor
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (uint64_t)setVerticalAlignmentFactor:(uint64_t)result
{
  if (result)
    *(double *)(result + 32) = a2;
  return result;
}

- (uint64_t)lineVerticalAlignment
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

- (uint64_t)setLineVerticalAlignment:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 16) = a2;
  return result;
}

- (double)insets
{
  if (a1)
    return *(double *)(a1 + 144);
  else
    return 0.0;
}

- (uint64_t)setFullBleed:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (void)setComponentIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (double)setExclusionRect:(double)a3
{
  if (result)
  {
    result[22] = a2;
    result[23] = a3;
    result[24] = a4;
    result[25] = a5;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapper, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_minYBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
