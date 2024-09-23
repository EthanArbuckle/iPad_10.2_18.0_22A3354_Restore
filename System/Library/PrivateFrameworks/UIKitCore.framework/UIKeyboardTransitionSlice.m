@implementation UIKeyboardTransitionSlice

- (UIKeyboardTransitionSlice)init
{
  char *v2;
  UIKeyboardTransitionSlice *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  UIKBCacheToken *endToken;
  UIKeyboardTransitionSlice *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardTransitionSlice;
  v2 = -[UIKeyboardTransitionSlice init](&v10, sel_init);
  v3 = (UIKeyboardTransitionSlice *)v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v2 + 24) = v5;
    *(_OWORD *)(v2 + 40) = v4;
    *(_OWORD *)(v2 + 56) = v5;
    v6 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

    endToken = v3->_endToken;
    v3->_endToken = 0;

    v3->_normalization = 0;
    v3->_delayCrossfade = 0;
    v8 = v3;
  }

  return v3;
}

+ (UIKeyboardTransitionSlice)sliceWithStart:(CGRect)a3 end:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "setStartRect:", v11, v10, v9, v8);
  objc_msgSend(v12, "setEndRect:", x, y, width, height);
  return (UIKeyboardTransitionSlice *)v12;
}

- (void)addStartRect:(CGRect)a3 end:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  self->_startRect = CGRectUnion(self->_startRect, a3);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  self->_endRect = CGRectUnion(self->_endRect, v9);
}

- (BOOL)hasGeometry
{
  return !CGRectIsNull(self->_startRect);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromCGRect(self->_startRect);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_endRect);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)startRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_startRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setStartRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_startRect, &v3, 32, 1, 0);
}

- (CGRect)endRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_endRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setEndRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_endRect, &v3, 32, 1, 0);
}

- (UIKBCacheToken)startToken
{
  return (UIKBCacheToken *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStartToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UIKBCacheToken)endToken
{
  return (UIKBCacheToken *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEndToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int)normalization
{
  return self->_normalization;
}

- (void)setNormalization:(int)a3
{
  self->_normalization = a3;
}

- (BOOL)delayCrossfade
{
  return self->_delayCrossfade;
}

- (void)setDelayCrossfade:(BOOL)a3
{
  self->_delayCrossfade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endToken, 0);
  objc_storeStrong((id *)&self->_startToken, 0);
}

@end
