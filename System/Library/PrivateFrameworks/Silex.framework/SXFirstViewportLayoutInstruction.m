@implementation SXFirstViewportLayoutInstruction

- (BOOL)isFulfilledForBlueprint:(id)a3
{
  if (self->_fullfilled)
    return 1;
  else
    return objc_msgSend(a3, "isComplete");
}

- (void)didLayoutComponentBlueprint:(id)a3 blueprint:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;

  v6 = a4;
  objc_msgSend(a3, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "layoutOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "columnLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constrainedViewportSize");
  v18 = v17;
  v20 = v19;

  if (!self->_fullfilled && v12 > v18 * 0.5)
  {
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    if (CGRectGetMaxY(v21) > v20 * 1.5)
      self->_fullfilled = 1;
  }
}

- (BOOL)fullfilled
{
  return self->_fullfilled;
}

- (void)setFullfilled:(BOOL)a3
{
  self->_fullfilled = a3;
}

@end
