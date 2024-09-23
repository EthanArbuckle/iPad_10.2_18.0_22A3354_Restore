@implementation UIImage

- (CGRect)bk_frameForImageFittedInFrame:(CGRect)a3
{
  UIImage *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  v3 = self;
  -[UIImage size](v3, "size");
  v6 = CGRectMakeWithSize(v4, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImage alignmentRectInsets](v3, "alignmentRectInsets");
  sub_10001D044(v6, v8, v10, v12, v13, v14);
  v16 = BCNormalizedInsetsForRects(v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  CGRectFitRectInRectAbsoluteNoRounding(v23);
  v28 = BCRectByApplyingNormalizedInsets(v24, v25, v26, v27, v16, v18, v20, v22);
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

@end
