@implementation _UIFocusScrollOffsetResolverCentered

- (unint64_t)scrollOffsetResolverType
{
  return 3;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int CanScrollX;
  int CanScrollY;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "environmentScrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "environmentScrollableContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "owningEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "focusItemInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusMovement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "heading");

  objc_msgSend(v3, "focusItemFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  objc_msgSend(v3, "targetContentOffset");
  v22 = v21;
  v24 = v23;

  if (CanScrollX)
  {
    if ((objc_msgSend(v5, "visibleSize"),
          v26 = v12 + v16 * 0.5 - v25 * 0.5,
          _UIFocusHeadingIsEffectivelyLeft(v10, v7))
      && v26 < v22
      || _UIFocusHeadingIsEffectivelyRight(v10, v7) && v26 > v22)
    {
      v22 = v26;
    }
  }
  if (CanScrollY)
  {
    if (((objc_msgSend(v5, "visibleSize"), v27 = v14 + v18 * 0.5, v29 = v27 + v28 * -0.5, (v10 & 1) != 0)
       || (v10 & 0x20) != 0)
      && v29 < v24
      || ((v10 & 2) != 0 || (v10 & 0x10) != 0) && v29 > v24)
    {
      v24 = v27 + v28 * -0.5;
    }
  }
  if (v8)
  {
    v22 = _UIFocusItemScrollableContainerAdjustedContentOffsetToShowFocusItem(v5, v8, v22, v24);
    v24 = v30;
  }

  v31 = v22;
  v32 = v24;
  result.y = v32;
  result.x = v31;
  return result;
}

@end
