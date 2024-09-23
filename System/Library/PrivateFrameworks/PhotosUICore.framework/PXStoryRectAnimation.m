@implementation PXStoryRectAnimation

- (PXStoryRectAnimation)initWithDuration:(id *)a3 curveInfo:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4.var0, *(_QWORD *)&a4.var1.var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRectAnimation.m"), 23, CFSTR("%s is not available as initializer"), "-[PXStoryRectAnimation initWithDuration:curveInfo:]");

  abort();
}

- (PXStoryRectAnimation)initWithIdentifier:(id)a3 duration:(id *)a4 curveInfo:(id)a5
{
  id v7;
  void *v8;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRectAnimation.m"), 27, CFSTR("%s is not available as initializer"), "-[PXStoryRectAnimation initWithIdentifier:duration:curveInfo:]");

  abort();
}

- (PXStoryRectAnimation)initWithIdentifier:(id)a3 sourceRect:(id *)a4 targetRect:(id *)a5 outerBounds:(CGRect)a6 referenceSize:(CGSize)a7 duration:(id *)a8 curveInfo:(id)a9
{
  double height;
  double width;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  char *v17;
  char *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  objc_super v36;

  height = a7.height;
  width = a7.width;
  v13 = a6.size.height;
  v14 = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)PXStoryRectAnimation;
  *(_OWORD *)&v35.a = *(_OWORD *)&a8->var0;
  *(_QWORD *)&v35.c = a8->var3;
  v17 = -[PXStoryValueAnimation initWithIdentifier:duration:curveInfo:](&v36, sel_initWithIdentifier_duration_curveInfo_, a3, &v35, a9.var0, *(_QWORD *)&a9.var1.var0);
  v18 = v17;
  if (v17)
  {
    v19 = (__int128 *)(v17 + 440);
    v21 = *(_OWORD *)&a4->var0.c;
    v20 = *(_OWORD *)&a4->var0.tx;
    *(_OWORD *)(v17 + 440) = *(_OWORD *)&a4->var0.a;
    *(_OWORD *)(v17 + 456) = v21;
    *(_OWORD *)(v17 + 472) = v20;
    v22 = *(_OWORD *)&a5->var0.a;
    v23 = *(_OWORD *)&a5->var0.tx;
    *(_OWORD *)(v17 + 504) = *(_OWORD *)&a5->var0.c;
    *(_OWORD *)(v17 + 520) = v23;
    *(_OWORD *)(v17 + 488) = v22;
    *((double *)v17 + 49) = width;
    *((double *)v17 + 50) = height;
    memset(&v35, 0, sizeof(v35));
    if (PXSizeIsValid() && width > 0.0 && height > 0.0)
    {
      CGAffineTransformMakeScale(&v35, width, height);
    }
    else
    {
      v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v35.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v35.c = v24;
      *(_OWORD *)&v35.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v33 = v35;
    CGAffineTransformInvert(&v34, &v33);
    v25 = *(_OWORD *)&v34.a;
    v26 = *(_OWORD *)&v34.tx;
    *(_OWORD *)(v18 + 360) = *(_OWORD *)&v34.c;
    *(_OWORD *)(v18 + 376) = v26;
    *(_OWORD *)(v18 + 344) = v25;
    v27 = *v19;
    v28 = *(_OWORD *)(v18 + 472);
    *(_OWORD *)&v34.c = *(_OWORD *)(v18 + 456);
    *(_OWORD *)&v34.tx = v28;
    v33 = v35;
    *(_OWORD *)&v34.a = v27;
    PXStoryRectApplyAffineTransform();
    PXStoryRectDecompose();
    v29 = *(_OWORD *)(v18 + 488);
    v30 = *(_OWORD *)(v18 + 520);
    *(_OWORD *)&v34.c = *(_OWORD *)(v18 + 504);
    *(_OWORD *)&v34.tx = v30;
    v33 = v35;
    *(_OWORD *)&v34.a = v29;
    PXStoryRectApplyAffineTransform();
    PXStoryRectDecompose();
    *((CGFloat *)v18 + 51) = x;
    *((CGFloat *)v18 + 52) = y;
    *((CGFloat *)v18 + 53) = v14;
    *((CGFloat *)v18 + 54) = v13;
    *(_OWORD *)(v18 + 568) = *((_OWORD *)off_1E50B88F0 + 2);
    v31 = *((_OWORD *)off_1E50B88F0 + 1);
    *(_OWORD *)(v18 + 536) = *(_OWORD *)off_1E50B88F0;
    *(_OWORD *)(v18 + 552) = v31;
  }
  return (PXStoryRectAnimation *)v18;
}

- (void)updateCurrentValueWithProgress:(double)a3
{
  __int128 v4;
  _OWORD v6[15];

  PXRectByLinearlyInterpolatingRects();
  PXFloatByLinearlyInterpolatingFloats();
  PXStoryRectFromCGRectCenterRotation();
  v4 = *(_OWORD *)&self->_normalizingTransform.c;
  v6[3] = *(_OWORD *)&self->_normalizingTransform.a;
  v6[4] = v4;
  v6[5] = *(_OWORD *)&self->_normalizingTransform.tx;
  PXStoryRectApplyAffineTransform();
  -[PXStoryRectAnimation outerBounds](self, "outerBounds", *(_QWORD *)&a3);
  PXStoryRectFitIntoRect();
  v6[0] = v6[12];
  v6[1] = v6[13];
  v6[2] = v6[14];
  -[PXStoryRectAnimation setCurrentRect:](self, "setCurrentRect:", v6);
}

- (void)setCurrentRect:(id *)a3
{
  $994A55DD1B0CBEB82FDB96EE3E4BCE6C *p_currentRect;
  __int128 v6;
  __int128 v7;
  $994A55DD1B0CBEB82FDB96EE3E4BCE6C currentRect;
  $810C7C628FE0F9AC50A6216490AB88B8 v9;

  p_currentRect = &self->_currentRect;
  v9 = *a3;
  currentRect = self->_currentRect;
  if ((PXStoryRectEqualToRect() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->var0.a;
    v7 = *(_OWORD *)&a3->var0.tx;
    *(_OWORD *)&p_currentRect->t.c = *(_OWORD *)&a3->var0.c;
    *(_OWORD *)&p_currentRect->t.tx = v7;
    *(_OWORD *)&p_currentRect->t.a = v6;
    -[PXStoryRectAnimation signalChange:](self, "signalChange:", 4, *(_OWORD *)&currentRect.t.a, *(_OWORD *)&currentRect.t.c, *(_OWORD *)&currentRect.t.tx, *(_OWORD *)&v9.var0.a, *(_OWORD *)&v9.var0.c, *(_OWORD *)&v9.var0.tx);
  }
}

- ($810C7C628FE0F9AC50A6216490AB88B8)sourceRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[9].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[9].var0.ty;
  return self;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)targetRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[10].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[10].var0.ty;
  return self;
}

- (CGRect)outerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outerBounds.origin.x;
  y = self->_outerBounds.origin.y;
  width = self->_outerBounds.size.width;
  height = self->_outerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)currentRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].var0.d;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[11].var0.b;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[11].var0.ty;
  return self;
}

@end
