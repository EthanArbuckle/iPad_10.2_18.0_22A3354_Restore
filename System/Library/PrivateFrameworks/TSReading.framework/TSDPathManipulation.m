@implementation TSDPathManipulation

- (TSDPathManipulation)initWithProperties:(id)a3 bundle:(id)a4 dataManager:(void *)a5 precedingManipulation:(id)a6
{
  TSDPathManipulation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDPathManipulation;
  v7 = -[TSDPathManipulation init](&v9, sel_init, a3, a4, a5);
  if (v7)
    v7->mPrecedingManipulation = (TSDPathManipulation *)a6;
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDPathManipulation;
  -[TSDPathManipulation dealloc](&v3, sel_dealloc);
}

- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4
{
  TSDPathManipulation *mPrecedingManipulation;

  mPrecedingManipulation = self->mPrecedingManipulation;
  if (mPrecedingManipulation)
    return -[TSDPathManipulation manipulatePath:withLineWidth:](mPrecedingManipulation, "manipulatePath:withLineWidth:", a3, a4);
  else
    return a3;
}

- (BOOL)canDecomposeRectIntoParts
{
  TSDPathManipulation *mPrecedingManipulation;
  int v3;

  mPrecedingManipulation = self->mPrecedingManipulation;
  if (!mPrecedingManipulation
    || (v3 = -[TSDPathManipulation canDecomposeRectIntoParts](mPrecedingManipulation, "canDecomposeRectIntoParts")) != 0)
  {
    LOBYTE(v3) = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

@end
