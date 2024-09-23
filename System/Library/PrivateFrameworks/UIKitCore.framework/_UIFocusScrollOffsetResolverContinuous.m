@implementation _UIFocusScrollOffsetResolverContinuous

- (unint64_t)scrollOffsetResolverType
{
  return 0;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  int CanScrollX;
  int CanScrollY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double Height;
  double v42;
  CGFloat v43;
  double v44;
  double x;
  double y;
  double width;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  double MinX;
  double MaxX;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double MinY;
  double MaxY;
  double MidY;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGPoint result;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v3 = a3;
  objc_msgSend(v3, "environmentScrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "focusItemInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusItemFrame");
  v8 = v7;
  v10 = v9;
  rect_24 = v11;
  rect_16 = v12;
  objc_msgSend(v3, "focusMovement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heading");

  objc_msgSend(v3, "originatingContentOffset");
  v115 = v14;
  v116 = v15;
  CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  objc_msgSend(v3, "targetContentOffset");
  v128 = v18;
  v20 = v19;
  objc_msgSend(v3, "originatingBounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if ((_IsKindOfUIView((uint64_t)v5) & 1) != 0
    || (v29 = objc_opt_respondsToSelector(), v30 = 0.0, v123 = 0.0, v31 = 0.0, v32 = 0.0, (v29 & 1) != 0))
  {
    objc_msgSend(v5, "safeAreaInsets");
    v31 = v33;
    v123 = v34;
  }
  v117 = v32;
  v120 = v30;
  v35 = dyld_program_sdk_at_least();
  v36 = 90.0;
  if (v35)
    v36 = 80.0;
  v124 = v36;
  v127 = v20;
  v122 = v31;
  if (objc_msgSend(v5, "__isKindOfUIScrollView"))
  {
    objc_msgSend(v5, "_effectiveContentInset");
    v22 = v22 + v37;
    v24 = v24 + v38;
    v26 = v26 - (v37 + v39);
    v28 = v28 - (v38 + v40);
  }
  v134.origin.x = v22;
  v134.origin.y = v24;
  v134.size.width = v26;
  v134.size.height = v28;
  Height = CGRectGetHeight(v134);
  rect = v8;
  v135.origin.x = v8;
  v135.origin.y = v10;
  v135.size.width = rect_24;
  v135.size.height = rect_16;
  v119 = CGRectGetHeight(v135);
  if (!CanScrollX
    || (v136.origin.x = v22,
        v136.origin.y = v24,
        v136.size.width = v26,
        v136.size.height = v28,
        v42 = v124,
        CGRectGetWidth(v136) < v42 + v42))
  {
    v42 = 0.0;
  }
  rect_8 = v10;
  if (!CanScrollY
    || (v137.origin.x = v22,
        v137.origin.y = v24,
        v137.size.width = v26,
        v137.size.height = v28,
        v43 = CGRectGetHeight(v137),
        v44 = Height * 0.25,
        v43 < Height * 0.25 + Height * 0.25))
  {
    v44 = 0.0;
  }
  v118 = Height * 0.25;
  v138.origin.x = v22;
  v138.origin.y = v24;
  v138.size.width = v26;
  v138.size.height = v28;
  v139 = CGRectInset(v138, v42, v44);
  x = v139.origin.x;
  y = v139.origin.y;
  width = v139.size.width;
  v48 = v139.size.height;
  v49 = _UIFocusItemScrollableContainerScrollableAreaInsets(v5);
  v53 = width - v50 - v52;
  if (v53 >= 0.0)
    v54 = 0.0;
  else
    v54 = v53 * 0.5;
  v55 = v48 - v49 - v51;
  if (v55 >= 0.0)
    v56 = 0.0;
  else
    v56 = v55 * 0.5;
  v57 = x + v50;
  v58 = y + v49;
  objc_msgSend(v6, "item");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v3, "environmentScrollableContainer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "item");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFocusItemScrollableContainerScrollBoundaryMetricsForItem(v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = objc_msgSend(v61, "isMinX");
    v63 = objc_msgSend(v61, "isMaxX");
    LODWORD(v59) = objc_msgSend(v61, "isMinY");
    v64 = objc_msgSend(v61, "isMaxY");

  }
  else
  {
    v64 = 0;
    v63 = 0;
    v62 = 0;
  }
  v65 = fmax(v53, 0.0);
  v66 = fmax(v55, 0.0);
  v125 = v58 + v56;
  v126 = v57 + v54;
  v67 = _UIFocusItemScrollableContainerMinimumContentOffset(v5);
  v69 = v68;
  v70 = _UIFocusItemScrollableContainerMaximumContentOffset(v5);
  v121 = v71;
  v72 = rect_8;
  v73 = v128;
  if (CanScrollX)
  {
    v74 = v70;
    v140.origin.x = v126;
    v140.origin.y = v125;
    v140.size.width = v65;
    v140.size.height = v66;
    MinX = CGRectGetMinX(v140);
    v141.origin.x = v126;
    v141.origin.y = v125;
    v141.size.width = v65;
    v141.size.height = v66;
    MaxX = CGRectGetMaxX(v141);
    v142.origin.y = rect_8;
    v142.origin.x = rect;
    v142.size.width = rect_24;
    v142.size.height = rect_16;
    v77 = CGRectGetMinX(v142);
    v143.origin.x = rect;
    v143.origin.y = rect_8;
    v143.size.width = rect_24;
    v143.size.height = rect_16;
    v78 = CGRectGetMaxX(v143);
    v79 = v78 - v77;
    v80 = MaxX - MinX;
    v81 = v128 + v78 - MaxX;
    if (v78 <= MaxX)
      v81 = v128;
    if (v77 < MinX)
      v81 = v128 - (MinX - v77);
    v82 = MinX + MaxX;
    v72 = rect_8;
    v83 = v128 - (v82 * 0.5 - (v77 + v78) * 0.5);
    if (v79 < v80)
      v83 = v81;
    if ((v63 & v62) != 0)
      v84 = v83;
    else
      v84 = v67;
    if (v63)
      v83 = v74;
    if (v62)
      v83 = v84;
    if (v83 < v67)
      v83 = v67;
    v73 = v83 <= v74 ? v83 : v74;
    v144.origin.x = rect;
    v144.origin.y = rect_8;
    v144.size.width = rect_24;
    v144.size.height = rect_16;
    v85 = CGRectGetMinX(v144);
    v145.origin.x = rect;
    v145.origin.y = rect_8;
    v145.size.width = rect_24;
    v145.size.height = rect_16;
    v86 = CGRectGetMaxX(v145);
    if (v85 < v73 || (objc_msgSend(v5, "visibleSize"), v86 > v73 + v87))
    {
      objc_msgSend(v5, "visibleSize");
      v89 = v88;
      v146.origin.x = rect;
      v146.origin.y = rect_8;
      v146.size.width = rect_24;
      v146.size.height = rect_16;
      v90 = v89 - CGRectGetWidth(v146);
      if (v90 <= v123 + v117 + v124)
      {
        if (v90 >= 0.0)
        {
          v73 = v85 + v90 * 0.5 - v117;
          goto LABEL_52;
        }
        v91 = v85 - v117;
        objc_msgSend(v5, "visibleSize");
        v93 = v86 - v94;
      }
      else
      {
        v91 = v85 - v124 - v117;
        objc_msgSend(v5, "visibleSize");
        v93 = v124 + v86 - v92;
      }
      v95 = v123 + v93;
      if (vabdd_f64(v91, v115) >= vabdd_f64(v95, v115))
        v73 = v95;
      else
        v73 = v91;
    }
  }
LABEL_52:
  if (!CanScrollY)
  {
    v101 = v127;
    if (!v6)
      goto LABEL_82;
    goto LABEL_81;
  }
  v147.origin.x = v126;
  v147.origin.y = v125;
  v147.size.width = v65;
  v147.size.height = v66;
  MinY = CGRectGetMinY(v147);
  v148.origin.x = v126;
  v148.origin.y = v125;
  v148.size.width = v65;
  v148.size.height = v66;
  MaxY = CGRectGetMaxY(v148);
  v149.origin.x = rect;
  v149.origin.y = v72;
  v149.size.width = rect_24;
  v149.size.height = rect_16;
  MidY = CGRectGetMidY(v149);
  if (MidY >= MinY)
  {
    v99 = v127;
    v100 = v122;
    if (MidY > MaxY)
      v99 = v127 + MidY - MaxY;
  }
  else
  {
    v99 = v127 - (MinY - MidY);
    v100 = v122;
  }
  if ((v64 & v59) != 0)
    v102 = v99;
  else
    v102 = v69;
  if (v64)
    v99 = v121;
  if (!(_DWORD)v59)
    v102 = v99;
  if (v102 < v69)
    v102 = v69;
  if (v102 <= v121)
    v101 = v102;
  else
    v101 = v121;
  v150.origin.x = rect;
  v150.origin.y = v72;
  v150.size.width = rect_24;
  v150.size.height = rect_16;
  v103 = CGRectGetMinY(v150);
  v151.origin.x = rect;
  v151.origin.y = v72;
  v151.size.width = rect_24;
  v151.size.height = rect_16;
  v104 = CGRectGetMaxY(v151);
  if (v103 < v101 || (objc_msgSend(v5, "visibleSize"), v104 > v101 + v105 - v100))
  {
    v106 = fmax(v118 - v119, 0.0);
    objc_msgSend(v5, "visibleSize");
    v108 = v107;
    v152.origin.x = rect;
    v152.origin.y = v72;
    v152.size.width = rect_24;
    v152.size.height = rect_16;
    v109 = v108 - CGRectGetHeight(v152);
    if (v109 <= v100 + v120 + v106)
    {
      if (v109 >= 0.0)
      {
        v101 = v103 + v109 * 0.5 - v120;
        if (!v6)
          goto LABEL_82;
        goto LABEL_81;
      }
      v110 = v103 - v120;
    }
    else
    {
      v110 = v103 - v106 - v120;
      v104 = v106 + v104;
    }
    objc_msgSend(v5, "visibleSize");
    if (vabdd_f64(v110, v116) >= vabdd_f64(v100 + v104 - v111, v116))
      v101 = v100 + v104 - v111;
    else
      v101 = v110;
  }
  if (v6)
  {
LABEL_81:
    v73 = _UIFocusItemScrollableContainerAdjustedContentOffsetToShowFocusItem(v5, v6, v73, v101);
    v101 = v112;
  }
LABEL_82:

  v113 = v73;
  v114 = v101;
  result.y = v114;
  result.x = v113;
  return result;
}

@end
