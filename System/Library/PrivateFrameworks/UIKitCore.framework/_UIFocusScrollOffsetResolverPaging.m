@implementation _UIFocusScrollOffsetResolverPaging

- (unint64_t)scrollOffsetResolverType
{
  return 1;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int CanScrollX;
  int CanScrollY;
  int v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
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
  double v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGPoint result;
  CGRect v50;
  CGRect v51;

  v3 = a3;
  objc_msgSend(v3, "environmentScrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "focusItemFrame");
  v47 = v7;
  v48 = v6;
  v45 = v9;
  v46 = v8;
  CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  v12 = objc_msgSend(v5, "__isKindOfUIScrollView");
  if (v12)
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v5, "_interpageSpacing");
    v16 = v15;
    v44 = v17;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v44 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v5, "visibleSize");
  v19 = v18;
  objc_msgSend(v5, "visibleSize");
  v42 = v20;
  if (v12)
  {
    objc_msgSend(v5, "_pagingOrigin");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v5, "_firstPageOffset");
    v26 = v25;
    v28 = v27;
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D538];
    v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v26 = 0.0;
    v28 = 0.0;
  }
  objc_msgSend(v3, "targetContentOffset", v42);
  v31 = v30;
  if (!CanScrollX)
  {
    v36 = v29;
    if (!CanScrollY)
      goto LABEL_19;
    goto LABEL_16;
  }
  v32 = v16 + v19;
  v50.origin.y = v47;
  v50.origin.x = v48;
  v50.size.height = v45;
  v50.size.width = v46;
  v33 = (CGRectGetMidX(v50) - v22) / v32;
  v34 = vcvtmd_s64_f64(v33);
  v35 = v32 * (double)(uint64_t)floor(v33);
  if (!v34)
    v35 = v26;
  v36 = v22 + v35;
  if (CanScrollY)
  {
LABEL_16:
    v51.origin.y = v47;
    v51.origin.x = v48;
    v51.size.height = v45;
    v51.size.width = v46;
    v37 = (CGRectGetMidY(v51) - v24) / (v44 + v43);
    v38 = vcvtmd_s64_f64(v37);
    v39 = (v44 + v43) * (double)(uint64_t)floor(v37);
    if (!v38)
      v39 = v28;
    v31 = v24 + v39;
  }
LABEL_19:

  v40 = v36;
  v41 = v31;
  result.y = v41;
  result.x = v40;
  return result;
}

@end
