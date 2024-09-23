@implementation _UIFocusScrollOffsetResolverDifferential

- (unint64_t)scrollOffsetResolverType
{
  return 2;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  double v17;
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
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat Width;
  BOOL v40;
  double v41;
  double v42;
  CGFloat Height;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  int CanScrollX;
  int CanScrollY;
  void *v54;
  void (**v55)(_QWORD, _QWORD);
  double v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _QWORD aBlock[23];
  uint64_t v73;
  double *v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  CGPoint result;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

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
  v12 = v11;
  v14 = v13;
  objc_msgSend(v3, "focusMovement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "heading");

  objc_msgSend(v3, "targetContentOffset");
  v66 = v17;
  v67 = v18;
  objc_msgSend(v3, "originatingBounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v65 = v25;
  v26 = 80.0;
  if ((v16 & 1) != 0)
    v27 = 80.0;
  else
    v27 = 10.0;
  if ((v16 & 4) != 0)
    v28 = 80.0;
  else
    v28 = 10.0;
  if ((v16 & 2) != 0)
    v29 = 80.0;
  else
    v29 = 10.0;
  if ((v16 & 8) == 0)
    v26 = 10.0;
  v62 = v10;
  v63 = v8;
  v70 = v10 - v27;
  v71 = v8 - v28;
  v60 = v14;
  v61 = v12;
  v68 = v14 - (-v29 - v27);
  v69 = v12 - (-v26 - v28);
  v30 = objc_msgSend(v5, "__isKindOfUIScrollView");
  v31 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  v34 = 0.0;
  if (v30)
    objc_msgSend(v5, "_effectiveContentInset", 0.0, 0.0, 0.0, 0.0);
  v35 = v20 + v32;
  v36 = v22 + v31;
  v37 = v24 - (v32 + v34);
  v38 = v65 - (v31 + v33);
  v80.origin.x = v20 + v32;
  v80.origin.y = v36;
  v80.size.width = v37;
  v80.size.height = v38;
  Width = CGRectGetWidth(v80);
  v40 = Width <= 160.0;
  if (Width <= 160.0)
    v41 = v24;
  else
    v41 = v37;
  v64 = v41;
  if (v40)
    v42 = v20;
  else
    v42 = v35;
  v81.origin.x = v35;
  v81.origin.y = v36;
  v81.size.width = v37;
  v81.size.height = v38;
  Height = CGRectGetHeight(v81);
  v44 = Height <= 160.0;
  if (Height <= 160.0)
    v45 = v65;
  else
    v45 = v38;
  v46 = v42;
  if (v44)
    v47 = v22;
  else
    v47 = v36;
  v48 = v45;
  v82.origin.x = v46;
  v82.origin.y = v47;
  v82.size.width = v64;
  v82.size.height = v48;
  v84.origin.x = v71;
  v84.origin.y = v70;
  v84.size.width = v69;
  v84.size.height = v68;
  if (CGRectContainsRect(v82, v84))
    goto LABEL_28;
  v83.origin.x = v71;
  v83.origin.y = v70;
  v83.size.width = v69;
  v83.size.height = v68;
  v85.origin.x = v46;
  v85.origin.y = v47;
  v85.size.width = v64;
  v85.size.height = v48;
  if (CGRectContainsRect(v83, v85))
  {
LABEL_28:
    v49 = _UIAXAdjustContentOffsetForDifferentialScrollingIfNecessary(v5, v6, v66, v67);
    v51 = v50;
  }
  else
  {
    CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
    CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
    v73 = 0;
    v74 = (double *)&v73;
    v75 = 0x3010000000;
    v76 = &unk_18685B0AF;
    v77 = v66;
    v78 = v67;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74___UIFocusScrollOffsetResolverDifferential_contentOffsetForScrollRequest___block_invoke;
    aBlock[3] = &unk_1E16E3B40;
    *(double *)&aBlock[5] = v46;
    *(double *)&aBlock[6] = v47;
    *(CGFloat *)&aBlock[7] = v64;
    *(CGFloat *)&aBlock[8] = v48;
    *(double *)&aBlock[9] = v71;
    *(double *)&aBlock[10] = v70;
    *(double *)&aBlock[11] = v69;
    *(double *)&aBlock[12] = v68;
    *(double *)&aBlock[13] = v63 + -80.0;
    *(double *)&aBlock[14] = v62 + -80.0;
    *(double *)&aBlock[15] = v61 + 160.0;
    *(double *)&aBlock[16] = v60 + 160.0;
    *(double *)&aBlock[17] = v63;
    *(double *)&aBlock[18] = v62;
    *(double *)&aBlock[19] = v61;
    *(double *)&aBlock[20] = v60;
    *(double *)&aBlock[21] = v66 - v46;
    *(double *)&aBlock[22] = v67 - v47;
    aBlock[4] = &v73;
    v54 = _Block_copy(aBlock);
    v55 = (void (**)(_QWORD, _QWORD))v54;
    if (CanScrollX)
      (*((void (**)(void *, uint64_t))v54 + 2))(v54, 1);
    if (CanScrollY)
      v55[2](v55, 2);
    v49 = _UIAXAdjustContentOffsetForDifferentialScrollingIfNecessary(v5, v6, v74[4], v74[5]);
    v51 = v56;
    v57 = v74;
    v74[4] = v49;
    v57[5] = v56;

    _Block_object_dispose(&v73, 8);
  }

  v58 = v49;
  v59 = v51;
  result.y = v59;
  result.x = v58;
  return result;
}

@end
