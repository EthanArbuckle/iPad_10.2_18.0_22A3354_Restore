@implementation TSDRep(SXAccessibility)

- (double)SXAXConvertNaturalRectToScreenSpace:()SXAccessibility
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  UIView *v29;
  CGRect v31;

  if ((objc_msgSend(a1, "hasBeenRemoved") & 1) != 0)
    return *MEMORY[0x24BDBF090];
  objc_msgSend(a1, "convertNaturalRectToUnscaledCanvas:", a2, a3, a4, a5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "interactiveCanvasController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertUnscaledToBoundsRect:", v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(a1, "interactiveCanvasController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "canvasView");
  v29 = (UIView *)objc_claimAutoreleasedReturnValue();
  v31.origin.x = v21;
  v31.origin.y = v23;
  v31.size.width = v25;
  v31.size.height = v27;
  *(_QWORD *)&v10 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v31, v29);

  return v10;
}

- (uint64_t)SXAXConvertScreenRectToNaturalSpace:()SXAccessibility
{
  uint64_t result;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  result = objc_msgSend(a1, "hasBeenRemoved");
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "interactiveCanvasController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertBoundsToUnscaledRect:", a2, a3, a4, a5);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    return objc_msgSend(a1, "convertNaturalRectFromUnscaledCanvas:", v13, v15, v17, v19);
  }
  return result;
}

- (uint64_t)SXAXConvertNaturalPointToScreenSpace:()SXAccessibility
{
  return objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:", a3, a4, 0.0, 0.0);
}

- (uint64_t)SXAXConvertScreenPointToNaturalSpace:()SXAccessibility
{
  return objc_msgSend(a1, "SXAXConvertScreenRectToNaturalSpace:", a3, a4, 0.0, 0.0);
}

- (uint64_t)isAccessibilityElement
{
  return 0;
}

- (uint64_t)accessibilityFrame
{
  objc_msgSend(a1, "naturalBounds");
  return objc_msgSend(a1, "SXAXConvertNaturalRectToScreenSpace:");
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "interactiveCanvasController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityWindow
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "interactiveCanvasController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "canvasView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
