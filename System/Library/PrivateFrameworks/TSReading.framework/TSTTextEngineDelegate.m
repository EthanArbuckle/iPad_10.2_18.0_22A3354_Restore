@implementation TSTTextEngineDelegate

- (TSTTextEngineDelegate)initWithPadding:(UIEdgeInsets)a3 verticalAlignment:(unsigned int)a4
{
  double right;
  double bottom;
  double left;
  double top;
  TSTTextEngineDelegate *v9;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v11.receiver = self;
  v11.super_class = (Class)TSTTextEngineDelegate;
  v9 = -[TSTTextEngineDelegate init](&v11, sel_init);
  if (v9)
  {
    v9->mPadding = -[TSWPPadding initWithTopInset:leftInset:bottomInset:rightInset:]([TSWPPadding alloc], "initWithTopInset:leftInset:bottomInset:rightInset:", top, left, bottom, right);
    v9->mVerticalAlignment = a4;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTextEngineDelegate;
  -[TSTTextEngineDelegate dealloc](&v3, sel_dealloc);
}

- (id)padding
{
  return self->mPadding;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (BOOL)forceWesternLineBreaking
{
  return 1;
}

@end
