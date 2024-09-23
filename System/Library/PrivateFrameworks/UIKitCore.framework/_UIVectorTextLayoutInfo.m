@implementation _UIVectorTextLayoutInfo

- (void)setFrame:(__CTFrame *)a3
{
  __CTFrame *frame;

  frame = self->_frame;
  if (frame)
    CFRelease(frame);
  self->_frame = a3;
  if (a3)
    CFRetain(a3);
}

- (double)scale
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double result;

  -[_UIVectorTextLayoutInfo parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  result = 1.0;
  if (v5 >= 1.0)
    return v5;
  return result;
}

- (void)dealloc
{
  __CTFrame *frame;
  objc_super v4;

  frame = self->_frame;
  if (frame)
  {
    CFRelease(frame);
    self->_frame = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIVectorTextLayoutInfo;
  -[_UIVectorTextLayoutInfo dealloc](&v4, sel_dealloc);
}

- (_UIVectorTextLayoutParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (CGAffineTransform)coordinateAdjustment
{
  __int128 v3;

  v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setCoordinateAdjustment:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_coordinateAdjustment.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_coordinateAdjustment.c = v4;
  *(_OWORD *)&self->_coordinateAdjustment.a = v3;
}

- (__CTFrame)frame
{
  return self->_frame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
