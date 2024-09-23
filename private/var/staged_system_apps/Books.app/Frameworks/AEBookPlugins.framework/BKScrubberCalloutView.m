@implementation BKScrubberCalloutView

- (void)updateLayoutWithParentView:(id)a3 bottomMargin:(double)a4 calloutWidth:(double)a5 followThumb:(BOOL)a6 isScroll:(BOOL)a7 isVerticalScroll:(BOOL)a8 layoutDirection:(int64_t)a9 scrubber:(id)a10
{
  _BOOL4 v12;
  _BOOL4 v14;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  char *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double MinY;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  int v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  double MaxX;
  double v76;
  double v77;
  double v78;
  CGFloat rect;
  double v80;
  double v82;
  id v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v12 = a8;
  v14 = a6;
  v83 = a3;
  v17 = a10;
  objc_msgSend(v83, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v27 = (char *)objc_msgSend(v26, "userInterfaceLayoutDirection");

  -[BKScrubberCalloutView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v30 = v29;
  if (a5 <= 0.0)
    v31 = v28;
  else
    v31 = a5;
  v32 = v25;
  v84.origin.x = v19;
  v84.origin.y = v21;
  v84.size.width = v23;
  v84.size.height = v25;
  v33 = v31 * 0.5;
  v34 = CGRectGetMidX(v84) - v31 * 0.5;
  v85.origin.x = v19;
  v85.origin.y = v21;
  v85.size.width = v23;
  v85.size.height = v32;
  MinY = CGRectGetMinY(v85);
  if (v14)
  {
    v78 = v34;
    rect = v32;
    v77 = MinY;
    v80 = v31;
    v82 = v30;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thumb"));
    objc_msgSend(v38, "frame");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "thumb"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "superview"));
    objc_msgSend(v83, "convertRect:fromView:", v48, v40, v42, v44, v46);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;

    v57 = v50;
    v58 = v52;
    v59 = v54;
    v60 = v56;
    if (v12)
    {
      v30 = v82;
      v61 = CGRectGetMidY(*(CGRect *)&v57) + v82 * -0.5;
      v86.origin.x = v19;
      v86.origin.y = v21;
      v86.size.width = v23;
      v86.size.height = rect;
      v62 = CGRectGetHeight(v86) + -5.0 - v82;
      if (v62 >= v61)
        v62 = v61;
      v63 = fmax(v62, 5.0);
      v31 = v80;
      v34 = v78;
      if (!a7)
        goto LABEL_24;
    }
    else
    {
      v69 = CGRectGetMidX(*(CGRect *)&v57) - v33;
      v87.origin.x = v19;
      v87.origin.y = v21;
      v87.size.width = v23;
      v87.size.height = rect;
      v31 = v80;
      v30 = v82;
      v70 = CGRectGetWidth(v87) + -5.0 - v80;
      if (v70 >= v69)
        v70 = v69;
      v34 = fmax(v70, 5.0);
      v63 = v77;
      if (!a7)
        goto LABEL_24;
    }
    objc_msgSend(v17, "frame");
    if (v27 == (_BYTE *)&dword_0 + 1)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v71);
      v76 = 12.0;
    }
    else
    {
      MaxX = CGRectGetMinX(*(CGRect *)&v71) - v31;
      v76 = -12.0;
    }
    v34 = MaxX + v76;
  }
  else
  {
    if (!a7)
    {
LABEL_24:
      objc_msgSend(v17, "frame");
      v63 = CGRectGetMinY(v88) - v30;
      goto LABEL_27;
    }
    v64 = isPhone(v35, v36);
    v65 = 45.0;
    if (a9 != 1)
      v65 = 24.0;
    v66 = 34.0;
    if (a9 == 1)
      v66 = 58.0;
    if (v64)
      v67 = v65;
    else
      v67 = v66;
    objc_msgSend(v83, "frame");
    v63 = v68 - a4 - v30 + -1.0 - v67;
  }
LABEL_27:
  v89.origin.x = v34;
  v89.origin.y = v63;
  v89.size.width = v31;
  v89.size.height = v30;
  v90 = CGRectIntegral(v89);
  -[BKScrubberCalloutView setFrame:](self, "setFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);

}

@end
