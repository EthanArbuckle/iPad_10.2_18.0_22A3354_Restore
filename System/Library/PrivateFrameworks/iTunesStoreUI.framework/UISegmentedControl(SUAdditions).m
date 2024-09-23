@implementation UISegmentedControl(SUAdditions)

- (uint64_t)sizeToFitWithMinimumSegmentWidth:()SUAdditions maximumTotalWidth:
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;

  objc_msgSend(a1, "sizeToFit");
  objc_msgSend(a1, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (a2 > 0.00000011920929)
  {
    v14 = objc_msgSend(a1, "numberOfSegments");
    if (v11 < (double)v14 * a2)
      v11 = (double)v14 * a2;
  }
  if (v11 >= a3)
    v15 = a3;
  else
    v15 = v11;
  if (a3 <= 0.00000011920929)
    v16 = v11;
  else
    v16 = v15;
  return objc_msgSend(a1, "setFrame:", v7, v9, v16, v13);
}

@end
