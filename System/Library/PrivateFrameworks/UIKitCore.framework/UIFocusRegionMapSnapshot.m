@implementation UIFocusRegionMapSnapshot

uint64_t __72___UIFocusRegionMapSnapshot__sortedEligibleFocusContainerGuidesInArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "axisAlignedDistanceFromFocusedRect");
  v7 = v6;
  objc_msgSend(v5, "axisAlignedDistanceFromFocusedRect");
  if (vabdd_f64(v7, v8) <= 2.22044605e-16)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "axisAlignedDistanceFromFocusedRect");
    v10 = v9;
    objc_msgSend(v5, "axisAlignedDistanceFromFocusedRect");
    if (v10 >= v11)
      v12 = 1;
    else
      v12 = -1;
  }

  return v12;
}

@end
