@implementation UIFocusRegionMap

uint64_t __83___UIFocusRegionMap_linearlyOrderedFocusRegionMapEntriesForFocusMovement_fromView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;

  v5 = a3;
  objc_msgSend(a2, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  return _UIFocusRectCompare(*(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33), v7, v9, v11, v13, v15, v17, v19, v21);
}

@end
