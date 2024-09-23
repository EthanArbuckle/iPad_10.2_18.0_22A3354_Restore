@implementation __NSLMMarkedTextUnderlineRenderer

- (void)processMarkedTextUnderlineStartX:(int)a3 endX:(double)a4 yPosition:(double)a5 underlineColor:(double)a6 selected:
{
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 24))
  {
    v12 = *(double *)(a1 + 40);
    v11 = *(double *)(a1 + 48);
    v14 = *(double *)(a1 + 56);
    v13 = *(double *)(a1 + 64);
    if (v11 > v12)
      v15 = a3;
    else
      v15 = 0;
    if (v13 <= v14)
      v15 = 1;
    if (v15)
      v16 = *(double *)(a1 + 40);
    else
      v16 = *(double *)(a1 + 56);
    if (v15)
      v17 = *(double *)(a1 + 48);
    else
      v17 = *(double *)(a1 + 64);
    if (!objc_msgSend(*(id *)(a1 + 16), "isEqual:", a2)
      || *(double *)(a1 + 32) != a6
      || vabdd_f64(a4, v17) > 0.001 && vabdd_f64(a5, v16) > 0.001)
    {
      -[__NSLMMarkedTextUnderlineRenderer renderUnderline](a1);
      goto LABEL_17;
    }
    if (!a3)
    {
      if (v13 <= v14)
      {
        *(double *)(a1 + 56) = a4;
LABEL_44:
        *(double *)(a1 + 64) = a5;
        goto LABEL_17;
      }
LABEL_41:
      if (*(double *)(a1 + 56) > a4)
        *(double *)(a1 + 56) = a4;
      if (*(double *)(a1 + 64) >= a5)
        goto LABEL_17;
      goto LABEL_44;
    }
    if (v11 <= v12)
    {
      *(double *)(a1 + 40) = a4;
    }
    else
    {
      if (*(double *)(a1 + 40) > a4)
        *(double *)(a1 + 40) = a4;
      if (*(double *)(a1 + 48) >= a5)
      {
LABEL_40:
        if (v13 <= v14)
          goto LABEL_17;
        goto LABEL_41;
      }
    }
    *(double *)(a1 + 48) = a5;
    goto LABEL_40;
  }
LABEL_17:
  if (a5 > a4 && *(_BYTE *)(a1 + 24) == 0)
  {
    *(_QWORD *)(a1 + 16) = a2;
    *(double *)(a1 + 32) = a6;
    v19 = 56;
    if (a3)
      v19 = 40;
    v20 = 64;
    if (a3)
      v20 = 48;
    *(double *)(a1 + v19) = a4;
    *(double *)(a1 + v20) = a5;
    *(_BYTE *)(a1 + 24) = 1;
  }
}

- (double)renderUnderline
{
  double v2;
  double result;

  if (a1 && *(_BYTE *)(a1 + 24))
  {
    v2 = 0.35;
    if (*(double *)(a1 + 40) == *(double *)(a1 + 48))
      v2 = 1.0;
    objc_msgSend((id)a1, "_renderUnderlineStartX:endX:yPosition:alphaValue:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 32), v2);
    objc_msgSend((id)a1, "_renderUnderlineStartX:endX:yPosition:alphaValue:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 32), 1.0);
    *(_BYTE *)(a1 + 24) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_QWORD *)(a1 + 64) = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSLMMarkedTextUnderlineRenderer;
  -[__NSLMMarkedTextUnderlineRenderer dealloc](&v3, sel_dealloc);
}

- (void)_renderUnderlineStartX:(double)a3 endX:(double)a4 yPosition:(double)a5 alphaValue:(double)a6
{
  double v8;
  double v9;

  if (a4 > a3)
  {
    v8 = a4;
    v9 = a3;
    CGContextSaveGState(self->_cgContextRef);
    -[UIColor set](self->_underlineColor, "set");
    if (v8 - v9 > 1.0)
      v9 = v9 + 1.0;
    if (v8 - v9 > 1.0)
      v8 = v8 + -1.0;
    CGContextSetLineWidth(self->_cgContextRef, 2.0);
    CGContextSetLineCap(self->_cgContextRef, kCGLineCapRound);
    CGContextSetAlpha(self->_cgContextRef, a6);
    CGContextMoveToPoint(self->_cgContextRef, v9, a5);
    CGContextAddLineToPoint(self->_cgContextRef, v8, a5);
    CGContextStrokePath(self->_cgContextRef);
    CGContextRestoreGState(self->_cgContextRef);
  }
}

@end
