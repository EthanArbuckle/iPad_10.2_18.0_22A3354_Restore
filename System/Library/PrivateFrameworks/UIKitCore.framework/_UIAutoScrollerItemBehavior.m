@implementation _UIAutoScrollerItemBehavior

- ($9F891FA3B7BC1BE651A10F4EEBEFFC62)offsetForAutoScroller:(SEL)a3 timeDelta:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  unsigned int (**v42)(_QWORD, double, double, double, double, double, double, double, double);
  unsigned int (**v43)(_QWORD, double, double, double, double, double, double, double, double);
  unsigned int (**v44)(_QWORD, double, double, double, __n128, double, double, double, double);
  uint64_t (**v45)(_QWORD, double, double, double, double, double, double, double, double);
  double MaxY;
  double v47;
  __n128 v48;
  double v49;
  CGFloat Height;
  double v51;
  CGFloat MinY;
  CGFloat x;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  unint64_t v59;
  double MaxX;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat y;
  CGFloat Width;
  double v69;
  int v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double MinX;
  double v76;
  CGFloat v77;
  unint64_t v78;
  int v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
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
  $9F891FA3B7BC1BE651A10F4EEBEFFC62 *result;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  CGRect rect;
  uint64_t (*v109)(uint64_t, double, double, double, double, CGFloat, CGFloat, CGFloat, CGFloat);
  void *v110;
  uint64_t v111;
  _QWORD v112[5];
  _QWORD v113[5];
  _QWORD aBlock[5];
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  retstr->var0.x = 0.0;
  retstr->var0.y = 0.0;
  retstr->var1 = 0;
  v6 = a4;
  objc_msgSend(v6, "point");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "touchInsets");
  rect.origin.x = v8 + v11;
  v13 = v10 + v12;
  v15 = 0.0 - (v11 + v14);
  v17 = 0.0 - (v12 + v16);
  objc_msgSend(v6, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v6, "allowedDirections");

  objc_msgSend(v18, "adjustedContentInset");
  v21 = fmax(v20, 0.0);
  v23 = fmax(v22, 0.0);
  v25 = fmax(v24, 0.0);
  v27 = fmax(v26, 0.0);
  objc_msgSend(v18, "bounds");
  v29 = v23 + v28;
  v31 = v21 + v30;
  v101 = v23;
  v102 = v21;
  v99 = v27;
  v100 = v25;
  v33 = v32 - (v23 + v27);
  v34 = v21 + v25;
  v35 = v15;
  v36 = v29;
  v38 = v37 - v34;
  objc_msgSend(v18, "contentSize");
  v105 = v39;
  v106 = v40;
  v41 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke;
  aBlock[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  aBlock[4] = v19;
  v42 = (unsigned int (**)(_QWORD, double, double, double, double, double, double, double, double))_Block_copy(aBlock);
  *(CGFloat *)v113 = v41;
  v113[1] = 3221225472;
  v113[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_2;
  v113[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v113[4] = v19;
  v43 = (unsigned int (**)(_QWORD, double, double, double, double, double, double, double, double))_Block_copy(v113);
  *(CGFloat *)v112 = v41;
  v112[1] = 3221225472;
  v112[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_3;
  v112[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v112[4] = v19;
  v44 = (unsigned int (**)(_QWORD, double, double, double, __n128, double, double, double, double))_Block_copy(v112);
  rect.size.width = v41;
  *(_QWORD *)&rect.size.height = 3221225472;
  v109 = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_4;
  v110 = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v111 = v19;
  v45 = (uint64_t (**)(_QWORD, double, double, double, double, double, double, double, double))_Block_copy(&rect.size);
  rect.origin.y = v17;
  v104 = v35;
  if (v42[2](v42, rect.origin.x, v13, v35, v17, v36, v31, v33, v38))
  {
    v115.origin.x = v36;
    v115.origin.y = v31;
    v115.size.width = v33;
    v115.size.height = v38;
    if (CGRectGetMaxY(v115) < v106)
    {
      retstr->var1 |= 0x10uLL;
      v116.origin.x = rect.origin.x;
      v116.origin.y = v13;
      v116.size.width = v35;
      v116.size.height = v17;
      MaxY = CGRectGetMaxY(v116);
      v117.origin.x = v36;
      v117.origin.y = v31;
      v117.size.width = v33;
      v117.size.height = v38;
      v47 = MaxY - CGRectGetMaxY(v117);
      if (v47 <= 40.0)
        v49 = v47;
      else
        v49 = 40.0;
      if (v49 > 0.0)
      {
        v118.origin.x = rect.origin.x;
        v118.origin.y = v13;
        v35 = v104;
        v118.size.width = v104;
        v118.size.height = rect.origin.y;
        Height = CGRectGetHeight(v118);
        v51 = floor(v49 / (Height * 0.5) * (v49 / (Height * 0.5) * 1080.0) + 120.0);
LABEL_16:
        v48.n128_u64[0] = *(_QWORD *)&rect.origin.y;
        goto LABEL_17;
      }
      *(double *)&v59 = 120.0;
      goto LABEL_15;
    }
  }
  if (v43[2](v43, rect.origin.x, v13, v35, v17, v36, v31, v33, v38))
  {
    v119.origin.x = v36;
    v119.origin.y = v31;
    v119.size.width = v33;
    v119.size.height = v38;
    MinY = CGRectGetMinY(v119);
    v48.n128_f64[0] = v17;
    v51 = 0.0;
    if (MinY > 0.0)
    {
      retstr->var1 |= 8uLL;
      x = rect.origin.x;
      v54 = v13;
      v55 = v35;
      v56 = CGRectGetMinY(*(CGRect *)((char *)&v48 - 24));
      v120.origin.x = v36;
      v120.origin.y = v31;
      v120.size.width = v33;
      v120.size.height = v38;
      v57 = fmax(v56 - CGRectGetMinY(v120), -40.0);
      if (v57 < 0.0)
      {
        v121.origin.x = rect.origin.x;
        v121.origin.y = v13;
        v35 = v104;
        v121.size.width = v104;
        v121.size.height = rect.origin.y;
        v58 = CGRectGetHeight(v121);
        v51 = -floor(v57 / (v58 * 0.5) * (v57 / (v58 * 0.5) * 1080.0) + 120.0);
        goto LABEL_16;
      }
      *(double *)&v59 = -120.0;
LABEL_15:
      v51 = *(double *)&v59;
      v35 = v104;
      goto LABEL_16;
    }
  }
  else
  {
    v48.n128_f64[0] = v17;
    v51 = 0.0;
  }
LABEL_17:
  if (v44[2](v44, rect.origin.x, v13, v35, v48, v36, v31, v33, v38))
  {
    v122.origin.x = v36;
    v122.origin.y = v31;
    v122.size.width = v33;
    v122.size.height = v38;
    if (CGRectGetMaxX(v122) < v105)
    {
      v98 = v51;
      retstr->var1 |= 4uLL;
      v123.origin.x = rect.origin.x;
      v123.origin.y = v13;
      v123.size.width = v35;
      v123.size.height = rect.origin.y;
      MaxX = CGRectGetMaxX(v123);
      v124.origin.x = v36;
      v124.origin.y = v31;
      v124.size.width = v33;
      v124.size.height = v38;
      v61 = MaxX - CGRectGetMaxX(v124);
      v62 = v13;
      if (v61 <= 40.0)
        v63 = v61;
      else
        v63 = 40.0;
      if (v63 > 0.0)
      {
        v64 = v31;
        v65 = rect.origin.x;
        v66 = v104;
        y = rect.origin.y;
        Width = CGRectGetWidth(*(CGRect *)(&v62 - 1));
        v69 = floor(v63 / (Width * 0.5) * (v63 / (Width * 0.5) * 1080.0) + 120.0);
LABEL_28:
        v51 = v98;
        goto LABEL_30;
      }
      *(double *)&v78 = 120.0;
      goto LABEL_36;
    }
  }
  v70 = v45[2](v45, rect.origin.x, v13, v35, rect.origin.y, v36, v31, v33, v38);
  v71 = v31;
  v69 = 0.0;
  if (v70)
  {
    v72 = v36;
    v64 = v31;
    v73 = v33;
    v74 = v38;
    if (CGRectGetMinX(*(CGRect *)(&v71 - 1)) <= 0.0)
      goto LABEL_30;
    v97 = v13;
    v98 = v51;
    retstr->var1 |= 2uLL;
    v125.origin.x = rect.origin.x;
    v125.origin.y = v13;
    v125.size.width = v104;
    v125.size.height = rect.origin.y;
    MinX = CGRectGetMinX(v125);
    v126.origin.x = v36;
    v126.origin.y = v31;
    v126.size.width = v33;
    v126.size.height = v38;
    v76 = fmax(MinX - CGRectGetMinX(v126), -40.0);
    if (v76 < 0.0)
    {
      v127.origin.x = rect.origin.x;
      v127.origin.y = v13;
      v127.size.width = v104;
      v127.size.height = rect.origin.y;
      v77 = CGRectGetWidth(v127);
      v69 = -floor(v76 / (v77 * 0.5) * (v76 / (v77 * 0.5) * 1080.0) + 120.0);
      goto LABEL_28;
    }
    *(double *)&v78 = -120.0;
LABEL_36:
    v69 = *(double *)&v78;
    v51 = v98;
    goto LABEL_37;
  }
  v64 = v31;
LABEL_30:
  if (v51 == 0.0)
  {
    v31 = v64;
    if (v69 == 0.0)
    {
      retstr->var1 = 1;
      goto LABEL_63;
    }
  }
  else
  {
    v31 = v64;
  }
LABEL_37:
  v79 = objc_msgSend(v18, "isPagingEnabled", *(_QWORD *)&v97);
  objc_msgSend(v18, "contentOffset");
  v82 = v81;
  v83 = v80;
  if (v79)
  {
    rect.origin.y = v80;
    objc_msgSend(v18, "contentSize");
    v107 = v84;
    rect.origin.x = v85;
    v128.origin.x = v36;
    v128.origin.y = v31;
    v128.size.width = v33;
    v128.size.height = v38;
    v86 = CGRectGetWidth(v128);
    v129.origin.x = v36;
    v129.origin.y = v31;
    v129.size.width = v33;
    v129.size.height = v38;
    v87 = CGRectGetHeight(v129);
    if (v69 <= 0.0)
    {
      v88 = 0.0;
      if (v69 < 0.0)
      {
        if (v82 - v86 >= 0.0)
          v88 = -v86;
        else
          v88 = -v82;
      }
    }
    else
    {
      v88 = v86;
      if (v82 + v86 + v86 > v107)
        v88 = v107 - v86 - v82;
    }
    if (v51 <= 0.0)
    {
      v95 = 0.0;
      v94 = rect.origin.y;
      if (v51 < 0.0)
      {
        if (rect.origin.y - v87 >= v102)
          v95 = -v87;
        else
          v95 = -rect.origin.y - v102;
      }
    }
    else
    {
      v94 = rect.origin.y;
      v95 = v87;
      if (rect.origin.y + v87 + v87 > rect.origin.x)
        v95 = rect.origin.x - v87 - rect.origin.y;
    }
    retstr->var0.x = v82 + v88;
    retstr->var0.y = v94 + v95;
  }
  else
  {
    v130.origin.x = v36;
    v130.origin.y = v31;
    v130.size.width = v33;
    v130.size.height = v38;
    if (v106 > CGRectGetHeight(v130))
    {
      v89 = v51 * a5 + v83;
      v83 = -v102;
      v131.origin.x = v36;
      v131.origin.y = v31;
      v131.size.width = v33;
      v131.size.height = v38;
      v90 = v102 + v100 + v106 - CGRectGetHeight(v131);
      if (v89 <= v90)
        v90 = v89;
      if (v89 >= v83)
        v83 = v90;
    }
    v132.origin.x = v36;
    v132.origin.y = v31;
    v132.size.width = v33;
    v132.size.height = v38;
    if (v105 > CGRectGetWidth(v132))
    {
      v91 = v69 * a5 + v82;
      v82 = -v101;
      v133.origin.x = v36;
      v133.origin.y = v31;
      v133.size.width = v33;
      v133.size.height = v38;
      v92 = CGRectGetWidth(v133);
      if (v91 >= -v101)
      {
        v93 = v99 + v101 + v105 - v92;
        v82 = v91;
        if (v91 > v93)
          v82 = v93;
      }
    }
    retstr->var0.x = v82;
    retstr->var0.y = v83;
  }
LABEL_63:

  return result;
}

@end
