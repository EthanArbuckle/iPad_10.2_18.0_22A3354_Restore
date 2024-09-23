@implementation NSLayoutManager(WFSizing)

- (double)wf_calculateIntrinsicHeightForWidth:()WFSizing textContainer:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double height;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v6 = a4;
  v7 = objc_msgSend(v6, "widthTracksTextView");
  v8 = objc_msgSend(v6, "heightTracksTextView");
  objc_msgSend(v6, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "setWidthTracksTextView:", 0);
  objc_msgSend(v6, "setHeightTracksTextView:", 0);
  objc_msgSend(v6, "setSize:", a2, 1.79769313e308);
  objc_msgSend(a1, "ensureLayoutForTextContainer:", v6);
  objc_msgSend(a1, "usedRectForTextContainer:", v6);
  v14 = v13;
  v15 = objc_msgSend(a1, "glyphRangeForTextContainer:", v6);
  objc_msgSend(a1, "boundingRectForGlyphRange:inTextContainer:", v15, v16, v6);
  v21.size.height = v18 - v17;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v21.size.width = v14;
  v24.size.width = a2;
  v24.size.height = 1.79769313e308;
  v22 = CGRectIntersection(v21, v24);
  v23 = CGRectIntegral(v22);
  height = v23.size.height;
  objc_msgSend(v6, "setWidthTracksTextView:", v7, v23.origin.x, v23.origin.y, v23.size.width);
  objc_msgSend(v6, "setHeightTracksTextView:", v8);
  objc_msgSend(v6, "setSize:", v10, v12);

  return height;
}

- (id)wf_controlView
{
  return objc_getAssociatedObject(a1, sel_wf_controlView);
}

- (void)wf_setControlView:()WFSizing
{
  objc_setAssociatedObject(a1, sel_wf_controlView, a3, 0);
}

@end
