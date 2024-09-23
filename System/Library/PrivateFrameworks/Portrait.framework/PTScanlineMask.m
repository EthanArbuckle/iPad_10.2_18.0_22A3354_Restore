@implementation PTScanlineMask

+ (id)scanlineMaskWithFocusBlurMap:(id)a3 region:(id)a4
{
  id v5;
  id v6;
  PTScanlineMask_FocusBlurMap *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PTScanlineMask_FocusBlurMap initWithFocusBlurMap:region:]([PTScanlineMask_FocusBlurMap alloc], "initWithFocusBlurMap:region:", v6, v5);

  return v7;
}

- (id)scanlineIter
{
  return 0;
}

- (CGRect)placement
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_placement, 32, 1, 0);
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

- (void)setPlacement:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_placement, &v3, 32, 1, 0);
}

@end
