double cropTimeAboveFacesNoMask(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
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

  v21 = combineFaceRects(a1);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (!rectPlusCushionInsideImage(v21, v22, v24, v26, a8))
    return *MEMORY[0x24BDBF070];
  v28 = maxRectInImageWithAnchorAtPosition(a10 / a11 / (a2 / a3), a8, 0.5, a5 + a7, v21 + v25 * 0.5, v23);
  if (!rectIsWithinRect(v21, v23, v25, v27, v28, v29, v30, v31))
    return *MEMORY[0x24BDBF070];
  return v28;
}

double combineFaceRects(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  unint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "rectValue");
    x = v3;
    y = v5;
    width = v7;
    height = v9;

    if ((unint64_t)objc_msgSend(v1, "count") >= 2)
    {
      v11 = 1;
      do
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rectValue");
        v20.origin.x = v13;
        v20.origin.y = v14;
        v20.size.width = v15;
        v20.size.height = v16;
        v18.origin.x = x;
        v18.origin.y = y;
        v18.size.width = width;
        v18.size.height = height;
        v19 = CGRectUnion(v18, v20);
        x = v19.origin.x;
        y = v19.origin.y;
        width = v19.size.width;
        height = v19.size.height;

        ++v11;
      }
      while (objc_msgSend(v1, "count") > v11);
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
  }

  return x;
}

BOOL rectPlusCushionInsideImage(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;

  v5 = expandRect(a1, a2, a3, a4, a5, a5, a5, a5);
  return rectIsWithinRect(v5, v6, v7, v8, 0.0, 0.0, 1.0, 1.0);
}

double maxRectInImageWithAnchorAtPosition(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = (a5 - a2) / a3;
  v7 = 1.0 - a2;
  if (v6 >= (1.0 - a2 - a5) / (1.0 - a3))
    v6 = (1.0 - a2 - a5) / (1.0 - a3);
  v8 = v6 / a1;
  v9 = (a6 - a2) / a4;
  v10 = (v7 - a6) / (1.0 - a4);
  if (v9 < v10)
    v10 = v9;
  if (v10 < v8)
    v6 = v6 * (v10 / v8);
  return a5 - a3 * v6;
}

double cropTimeBelowFacesNoMask(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t i;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v21 = a1;
  v22 = combineFaceRects(v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if (!rectPlusCushionInsideImage(v22, v23, v25, v27, a8))
    goto LABEL_14;
  v43 = a5 * 0.3;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = a10 / a11 / (a2 / a3);
  v30 = v21;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v45;
    v34 = 1.0;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "rectValue");
        if (v36 + v37 * 0.3 < v34)
          v34 = v36 + v37 * 0.3;
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v32);
  }
  else
  {
    v34 = 1.0;
  }

  v38 = maxRectInImageWithAnchorAtPosition(v29, a8, 0.5, v43, v22 + v26 * 0.5, v34);
  if (!rectIsWithinRect(v22, v24, v26, v28, v38, v39, v40, v41))
LABEL_14:
    v38 = *MEMORY[0x24BDBF070];

  return v38;
}

double cropTimeAboveFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, CGFloat a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, double a12, double a13)
{
  id v23;
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
  double v41;
  double x;
  double v43;
  double v44;
  CGSize v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v62;
  double v63;
  double v66;
  double v67;
  double v68;
  double v69[12];
  CGRect v70;

  v23 = a2;
  v24 = combineFaceRects(a1);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (rectPlusCushionInsideImage(v24, v25, v27, v29, a10))
  {
    v63 = a8;
    v31 = a7 + a9;
    v32 = v24;
    v33 = v24 + v28 * 0.5;
    v34 = (v33 + 0.0) / (a10 + 0.5);
    v35 = (1.0 - v33) / (a10 + 0.5);
    if (v34 >= v35)
      v36 = v35;
    else
      v36 = v34;
    v37 = v26;
    if (1.0 / (a10 * 2.0 + 1.0) >= v26 / (v31 + a10))
      v38 = v26 / (v31 + a10);
    else
      v38 = 1.0 / (a10 * 2.0 + 1.0);
    v39 = v36 / (a12 / a13 / (a4 / a5));
    v40 = a4;
    v41 = a10;
    v62 = a6;
    if (v39 <= v38)
      v38 = v39;
    else
      v36 = v36 * (v38 / v39);
    v43 = v37 - v38 * v31;
    v44 = v32 + (v28 - v36) * 0.5;
    v45 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v70.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v70.size = v45;
    v67 = v32;
    v68 = v37;
    v66 = v30;
    if (rectIsWithinRect(v32, v37, v28, v30, v44, v43, v36, v38))
    {
      v55 = -8.0 / v40 + 1.0;
      v49 = ((0.200845666 / (v63 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
      v59 = v49 * 0.15 / 0.8 * 0.333333333;
      v60 = v49 * 0.15 / 0.8;
      v57 = v49 / 0.2 * dbl_243C3CE60[a3 == 2];
      v58 = v49 / 0.2;
      v56 = v41 + 1.0;
      do
      {
        if (v43 <= 1.0 - v38 * v56)
          v50 = v43;
        else
          v50 = 1.0 - v38 * v56;
        v51 = iterativeVerticalFacesMaskSolver(v23, 0, v69, v41, v44, v50, v36, v38, v46, v47, v48, v67, v68, v28, v66, v62, a7, v63, a9,
                -8.0 / a5,
                v60,
                v58,
                v59,
                v57);
        v53 = v52;
        x = v70.origin.x;
        if (!CGRectIsEmpty(v70))
          break;
        v36 = v55 * v51;
        v38 = v55 * v53;
        v43 = v68 - v55 * v53 * (a7 + a9);
        v44 = v67 + (v28 - v55 * v51) * 0.5;
      }
      while (rectIsWithinRect(v67, v68, v28, v66, v44, v43, v36, v38));
    }
    else
    {
      x = v70.origin.x;
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
  }

  return x;
}

CGFloat iterativeVerticalFacesMaskSolver(void *a1, uint64_t a2, double *a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22,double a23,double a24)
{
  id v33;
  double Coverage;
  double v35;

  v33 = a1;
  if (rectPlusCushionInsideImage(a5, a6, a7, a8, a4))
  {
    while (rectIsWithinRect(a12, a13, a14, a15, a5, a6, a7, a8))
    {
      Coverage = findCoverage(a2, v33, a5, a6, a7, a8, a16, a17, a18, a19);
      if (v35 < a22 && Coverage < a21)
      {
        if (v35 >= a24)
        {
          a3[12] = a5;
          a3[13] = a6;
          a3[14] = a7;
          a3[15] = a8;
        }
        break;
      }
      a6 = a6 + a20;
      if (!rectPlusCushionInsideImage(a5, a6, a7, a8, a4))
        break;
    }
  }

  return a7;
}

double cropTimeBelowFacesWithMask(void *a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v22;
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
  double x;
  double v42;
  double v43;
  CGSize v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  double v64;
  double v66;
  double v67[12];
  CGRect v68;

  v22 = a2;
  v23 = combineFaceRects(a1);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  if (rectPlusCushionInsideImage(v23, v24, v26, v28, a9))
  {
    v60 = a7;
    v61 = a8;
    v59 = a5;
    v30 = a4;
    v31 = v23;
    v32 = v27;
    v33 = v23 + v27 * 0.5;
    v34 = (v33 + 0.0) / (a9 + 0.5);
    v35 = (1.0 - v33) / (a9 + 0.5);
    if (v34 >= v35)
      v36 = v35;
    else
      v36 = v34;
    if (1.0 / (a9 * 2.0 + 1.0) >= (v25 + v29) / (a6 - a9))
      v37 = (v25 + v29) / (a6 - a9);
    else
      v37 = 1.0 / (a9 * 2.0 + 1.0);
    v38 = v36 / (a11 / a12 / (a3 / a4));
    v39 = v29;
    v40 = a9;
    if (v38 <= v37)
      v37 = v36 / (a11 / a12 / (a3 / a4));
    else
      v36 = v36 * (v37 / v38);
    v42 = v32;
    v43 = v31 + (v32 - v36) * 0.5;
    v44 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v68.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v68.size = v44;
    v64 = v39;
    v66 = v31;
    if (rectIsWithinRect(v31, v25, v32, v39, v43, v25, v36, v37))
    {
      v55 = 1.0 - 8.0 / a3;
      v48 = ((0.200845666 / (v60 * v61) + -1.0) * 0.2 + 1.0) * 0.185;
      v57 = v48 / 0.2;
      v58 = v48 * 0.15 / 0.8;
      v56 = v48 / 0.2 * 0.333333333;
      do
      {
        v49 = 1.0 - v37 * (v40 + 1.0);
        v50 = v49 - v37;
        if (v25 + v37 >= v49)
          v50 = v25;
        v51 = iterativeVerticalFacesMaskSolver(v22, 1, v67, v40, v43, v50, v36, v37, v45, v46, v47, v66, v25, v42, v64, v59, a6, v60, v61,
                8.0 / v30,
                v58,
                v57,
                v58 * 0.333333333,
                v56);
        v53 = v52;
        x = v68.origin.x;
        if (!CGRectIsEmpty(v68))
          break;
        v36 = v55 * v51;
        v37 = v55 * v53;
        v43 = v66 + (v42 - v36) * 0.5;
      }
      while (rectIsWithinRect(v66, v25, v42, v64, v43, v25, v36, v37));
    }
    else
    {
      x = v68.origin.x;
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
  }

  return x;
}

double cropTimeLeftOfFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, double a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22)
{
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGSize v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double x;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v72;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v31 = a2;
  v32 = combineFaceRects(a1);
  v34 = v33;
  v36 = v35;
  v72 = v37;
  if (rectPlusCushionInsideImage(v32, v33, v35, v37, a20))
  {
    v38 = a6 + a8;
    v64 = a5;
    v67 = a4;
    v39 = a21 / a22 / (a4 / a5);
    v40 = 1.0 / (a20 * 2.0 + 1.0);
    v41 = v36 * 1.0001 / (1.0 - (a6 + a8));
    if (v41 >= v40)
      v41 = 1.0 / (a20 * 2.0 + 1.0);
    v42 = v41 / v39;
    v43 = v39 * v72;
    if (v42 >= v72)
      v44 = v42;
    else
      v44 = v72;
    v69 = a6;
    if (v42 >= v72)
      v45 = v41;
    else
      v45 = v43;
    v46 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v74.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v74.size = v46;
    v75.origin = v74.origin;
    v75.size = v46;
    v70 = v38;
    v47 = v32 - v45 * v38;
    v76.origin = v74.origin;
    v76.size = v46;
    if (rectIsWithinRect(v32, v34, v36, v72, v47, v34, v45, v44) && v45 <= v40 && v44 <= v40)
    {
      v68 = -4.0 / v67;
      v51 = -8.0 / v64;
      v65 = 8.0 / v64 + 1.0;
      v66 = v51;
      v52 = ((0.200845666 / (a8 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
      v63 = v52 / 0.2;
      v61 = a20 + 1.0;
      v62 = v52 * 0.15 / 0.8;
      do
      {
        if (v47 <= 1.0 - v45 * v61)
          v53 = v47;
        else
          v53 = 1.0 - v45 * v61;
        if (v34 <= 1.0 - v44 * v61)
          v54 = v34;
        else
          v54 = 1.0 - v44 * v61;
        v55 = iterativeBidirectionalFacesMaskSolver(v31, 2, a3, 2, &v74.origin.x, a20, v53, v54, v45, v44, v48, v49, v50, v32, v34, v36, v72, v69, a7,
                a8,
                a9,
                a12,
                a13,
                a14,
                a15,
                a16,
                a17,
                a18,
                a19,
                v68,
                v66,
                v62,
                v63);
        v45 = v65 * v55;
        v44 = v65 * v56;
        v47 = v32 - v65 * v55 * v70;
      }
      while (rectIsWithinRect(v32, v34, v36, v72, v47, v34, v65 * v55, v65 * v56) && v45 <= v40 && v44 <= v40);
    }
    x = v74.origin.x;
    if (CGRectIsEmpty(v74))
    {
      x = v75.origin.x;
      if (CGRectIsEmpty(v75))
      {
        x = v76.origin.x;
        CGRectIsEmpty(v76);
      }
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
  }

  return x;
}

double positionCandidateRectForSizeLeft(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result;

  result = a4 - a2 * a8;
  if (a1 == 2)
    return result + -(a6 - a2 * (1.0 - a8)) * -0.5;
  return result;
}

double iterativeBidirectionalFacesMaskSolver(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, CGFloat a19, double a20,CGFloat a21,CGFloat a22,CGFloat a23,CGFloat a24,CGFloat a25,CGFloat a26,CGFloat a27,CGFloat a28,CGFloat a29,double a30,double a31,double a32,double a33)
{
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double Coverage;
  double v50;
  double v51;
  double *v52;
  double *v53;
  double *v54;
  double *v55;
  double *v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _BOOL4 v64;
  double v65;
  BOOL v66;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v42 = a1;
  if (rectPlusCushionInsideImage(a7, a8, a9, a10, a6))
  {
    v79 = -a16;
    v78 = -a9;
    v76 = 1.79769313e308;
    v72 = 1.79769313e308;
    v73 = 1.79769313e308;
    v70 = 1.79769313e308;
    v77 = 1.79769313e308;
    v71 = 1.79769313e308;
    v68 = a6;
    while (1)
    {
      if (!rectIsWithinRect(a14, a15, a16, a17, a7, a8, a9, a10))
        goto LABEL_50;
      if (rectPlusCushionInsideImage(a7, a8, a9, a10, a6))
        break;
LABEL_49:
      a8 = a8 + a31;
      if (!rectPlusCushionInsideImage(a7, a8, a9, a10, a6))
        goto LABEL_50;
    }
    v43 = (a8 - a15 + -a17 * 0.5) / a10;
    v74 = vabdd_f64(-0.5, v43);
    v75 = vabdd_f64(-0.333333333, v43);
    v44 = a7;
    v69 = a7;
    while (1)
    {
      if (!rectIsWithinRect(a14, a15, a16, a17, v44, a8, a9, a10))
        goto LABEL_49;
      v80.origin.x = v44;
      v80.origin.y = a8;
      v80.size.width = a9;
      v80.size.height = a10;
      if (CGRectIsNull(v80))
      {
        v45 = 1.79769313e308;
      }
      else
      {
        if (a2 == 2)
        {
          v46 = (v44 - a14 + v79 * 0.5) / v78;
          v47 = (a18 + a20 + 1.0) * 0.5;
          goto LABEL_13;
        }
        v45 = 0.0;
        if (a2 == 1)
        {
          v46 = (v44 - a14 + v79 * 0.5) / v78;
          v47 = a18 * 0.5;
LABEL_13:
          v45 = vabdd_f64(v46, v47);
        }
      }
      v81.origin.x = v44;
      v81.origin.y = a8;
      v81.size.width = a9;
      v81.size.height = a10;
      if (CGRectIsNull(v81))
        goto LABEL_15;
      if (a3 == 2)
      {
        v48 = v74;
      }
      else
      {
        v48 = 0.0;
        if (a3 == 1)
          v48 = v75;
      }
      if (v45 >= 0.02)
        goto LABEL_15;
      if (v48 >= 0.15)
        goto LABEL_15;
      Coverage = findCoverage(a4, v42, v44, a8, a9, a10, a18, a19, a20, a21);
      if (v50 < a33 * 0.333333333 || v50 >= a33 || Coverage >= a32)
        goto LABEL_15;
      v82.origin.x = v44;
      v82.origin.y = a8;
      v82.size.width = a9;
      v82.size.height = a10;
      v84.origin.x = a22;
      v84.origin.y = a23;
      v84.size.width = a24;
      v84.size.height = a25;
      v51 = v45 * 0.98;
      if (CGRectContainsRect(v82, v84))
      {
        if (v48 * 0.99 < v77 && v51 <= v76)
        {
          v53 = a5 + 5;
          v52 = a5 + 4;
          v54 = a5;
          v56 = a5 + 2;
          v55 = a5 + 1;
          v57 = a5 + 3;
          v58 = v71;
          v59 = v72;
          v60 = v70;
          v61 = v73;
          v62 = v45;
          v63 = v48;
          goto LABEL_40;
        }
        if (v45 * 0.99 >= v76)
          goto LABEL_48;
        v53 = a5 + 5;
        v52 = a5 + 4;
        v54 = a5;
        v56 = a5 + 2;
        v55 = a5 + 1;
        v66 = v48 * 0.98 > v77;
        v57 = a5 + 3;
        v58 = v71;
        v59 = v72;
        v60 = v70;
        v61 = v73;
        v62 = v45;
        v63 = v48;
      }
      else
      {
        v83.origin.x = v44;
        v83.origin.y = a8;
        v83.size.width = a9;
        v83.size.height = a10;
        v85.origin.x = a26;
        v85.origin.y = a27;
        v85.size.width = a28;
        v85.size.height = a29;
        v64 = CGRectContainsRect(v83, v85);
        v65 = v48 * 0.99;
        if (v64)
        {
          if (v65 < v73 && v51 <= v70)
          {
            v53 = a5 + 11;
            v52 = a5 + 10;
            v55 = a5 + 7;
            v54 = a5 + 6;
            v57 = a5 + 9;
            v56 = a5 + 8;
            v58 = v71;
            v59 = v72;
            v60 = v45;
            v61 = v48;
            goto LABEL_39;
          }
          if (v45 * 0.99 >= v70)
            goto LABEL_48;
          v53 = a5 + 11;
          v52 = a5 + 10;
          v55 = a5 + 7;
          v54 = a5 + 6;
          v66 = v48 * 0.98 > v73;
          v57 = a5 + 9;
          v56 = a5 + 8;
          v58 = v71;
          v59 = v72;
          v60 = v45;
          v61 = v48;
        }
        else
        {
          if (v65 < v72 && v51 <= v71)
          {
            v53 = a5 + 17;
            v52 = a5 + 16;
            v55 = a5 + 13;
            v54 = a5 + 12;
            v57 = a5 + 15;
            v56 = a5 + 14;
            v58 = v45;
            v59 = v48;
            v60 = v70;
            v61 = v73;
LABEL_39:
            v62 = v76;
            v63 = v77;
LABEL_40:
            a7 = v69;
            a6 = v68;
LABEL_47:
            *v52 = v45;
            *v53 = v48;
            *v54 = v44;
            v71 = v58;
            v72 = v59;
            *v55 = a8;
            v70 = v60;
            *v56 = a9;
            v73 = v61;
            v76 = v62;
            v77 = v63;
            *v57 = a10;
            goto LABEL_15;
          }
          if (v45 * 0.99 >= v71)
          {
LABEL_48:
            a7 = v69;
            a6 = v68;
            goto LABEL_15;
          }
          v53 = a5 + 17;
          v52 = a5 + 16;
          v55 = a5 + 13;
          v54 = a5 + 12;
          v61 = v73;
          v66 = v48 * 0.98 > v72;
          v57 = a5 + 15;
          v56 = a5 + 14;
          v58 = v45;
          v59 = v48;
          v60 = v70;
        }
        v62 = v76;
        v63 = v77;
      }
      a7 = v69;
      a6 = v68;
      if (!v66)
        goto LABEL_47;
LABEL_15:
      v44 = v44 + a30;
      if (!rectPlusCushionInsideImage(v44, a8, a9, a10, a6))
        goto LABEL_49;
    }
  }
LABEL_50:

  return a9;
}

double cropTimeRightOfFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, double a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, double a14, CGFloat a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22)
{
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGSize v44;
  double v45;
  double v46;
  double v47;
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
  _BOOL4 IsWithinRect;
  double x;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v31 = a2;
  v32 = combineFaceRects(a1);
  v34 = v33;
  v36 = v35;
  v76 = v37;
  if (rectPlusCushionInsideImage(v32, v33, v37, v35, a20))
  {
    v68 = a5;
    v71 = a4;
    v38 = a21 / a22 / (a4 / a5);
    v39 = 1.0 / (a20 * 2.0 + 1.0);
    v40 = v76 * 1.0001 / (1.0 - a6);
    if (v40 >= v39)
      v40 = 1.0 / (a20 * 2.0 + 1.0);
    v41 = v40 / v38;
    v42 = v38 * v36;
    if (v41 >= v36)
      v43 = v40;
    else
      v43 = v42;
    v44 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v77.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v77.size = v44;
    v78.origin = v77.origin;
    v78.size = v44;
    if (v41 >= v36)
      v45 = v41;
    else
      v45 = v36;
    v79.origin = v77.origin;
    v79.size = v44;
    if (rectIsWithinRect(v32, v34, v76, v36, v32, v34, v43, v45))
    {
      v47 = 1.0 / (a20 * 2.0 + 1.0);
      if (v43 <= v39)
      {
        v48 = v45;
        if (v45 <= v39)
        {
          v49 = v32;
          v72 = -4.0 / v71;
          v50 = -8.0 / v68;
          v69 = 8.0 / v68 + 1.0;
          v70 = v50;
          v51 = ((0.200845666 / (a8 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
          v67 = v51 / 0.2;
          v65 = a20 + 1.0;
          v66 = v51 * 0.15 / 0.8;
          v73 = a6;
          do
          {
            v52 = 1.0 - v43 * v65;
            if (v49 + v43 >= v52)
              v53 = v49;
            else
              v53 = v52 - v43;
            if (v34 <= 1.0 - v48 * v65)
              v54 = v34;
            else
              v54 = 1.0 - v48 * v65;
            v64 = a6;
            v55 = v47;
            v56 = iterativeBidirectionalFacesMaskSolver(v31, 1, a3, 3, &v77.origin.x, a20, v53, v54, v43, v48, a14, v65, v46, v49, v34, v76, v36, v64, a7,
                    a8,
                    a9,
                    a12,
                    a13,
                    a14,
                    a15,
                    a16,
                    a17,
                    a18,
                    a19,
                    v72,
                    v70,
                    v66,
                    v67);
            v43 = v69 * v56;
            v58 = v69 * v57;
            IsWithinRect = rectIsWithinRect(v49, v34, v76, v36, v49, v34, v69 * v56, v69 * v57);
            v48 = v58;
            v47 = v55;
            a6 = v73;
          }
          while (IsWithinRect && v43 <= v47 && v58 <= v47);
        }
      }
    }
    x = v77.origin.x;
    if (CGRectIsEmpty(v77))
    {
      x = v78.origin.x;
      if (CGRectIsEmpty(v78))
      {
        x = v79.origin.x;
        CGRectIsEmpty(v79);
      }
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF070];
  }

  return x;
}

BOOL cropTimeLeftFacesNoMask(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,double a25,double a26,double a27)
{
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL8 result;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _BOOL4 IsWithinRect;
  double v51;
  uint64_t v52;
  char v53;
  char v54;
  double *v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  char *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat rect1;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v100;
  double v101;
  _QWORD v102[9];
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;

  v28 = a25;
  v102[8] = *MEMORY[0x24BDAC8D0];
  v29 = combineFaceRects(a1);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  result = rectPlusCushionInsideImage(v29, v30, v32, v34, a25);
  if (result)
  {
    v93 = a4;
    v37 = a26 / a27 / (a3 / a4);
    v38 = a5 + a7;
    v39 = 1.0 - (a5 + a7);
    v40 = v33 * 1.0001 / v39;
    v100 = 1.0 / (a25 * 2.0 + 1.0);
    if (v40 >= v100)
      v40 = 1.0 / (a25 * 2.0 + 1.0);
    v41 = v40 / v37;
    v97 = a26 / a27 / (a3 / a4);
    v42 = v37 * v35;
    if (v41 < v35)
    {
      v41 = v35;
      v40 = v42;
    }
    v87 = v39;
    v88 = v40;
    v89 = v41;
    v91 = v38;
    v43 = positionCandidateRectForSizeLeft(2, v40, v41, v29, v31, v33, v35, v38);
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v92 = v33;
    v90 = v43;
    IsWithinRect = rectIsWithinRect(v29, v31, v33, v35, v43, v44, v46, v48);
    v51 = v31;
    v101 = v29;
    v98 = v35;
    if (IsWithinRect && rectIsWithinRect(v90, v45, v47, v49, a25, a25, v100, v100))
    {
      rect1 = v49;
      v85 = v47;
      v86 = v45;
      v52 = 0;
      v102[0] = a17;
      v102[1] = a18;
      v102[2] = a19;
      v102[3] = a20;
      v102[4] = a21;
      v102[5] = a22;
      v94 = 8.0 / v93 + 1.0;
      v102[6] = a23;
      v102[7] = a24;
      v53 = 1;
      while (1)
      {
        v54 = v53;
        v55 = (double *)&v102[4 * v52];
        v56 = *v55;
        v57 = v55[1];
        v59 = v55[2];
        v58 = v55[3];
        v103.origin.x = *v55;
        v103.origin.y = v57;
        v103.size.width = v59;
        v103.size.height = v58;
        if (!CGRectIsNull(v103))
        {
          v104.origin.x = v90;
          v104.size.width = v85;
          v104.origin.y = v86;
          v104.size.height = rect1;
          v107.origin.x = v56;
          v107.origin.y = v57;
          v107.size.width = v59;
          v107.size.height = v58;
          result = CGRectContainsRect(v104, v107);
          if (result)
            return result;
          v60 = v88;
          v61 = v89;
          v62 = v88 < v59 || v89 < v58;
          v63 = v101;
          if (v62)
          {
            v60 = v88;
            v61 = v89;
            if (v88 < v59)
              v60 = v59;
            if (v89 < v58)
              v61 = v58;
            if (v60 / v61 >= v97)
              v61 = v60 / v97;
            else
              v60 = v97 * v61;
          }
          v64 = v92;
          v65 = positionCandidateRectForSizeLeft(2, v60, v61, v101, v31, v92, v98, v91);
          v67 = v66;
          v69 = v68;
          v71 = v70;
          v105.origin.x = a25;
          v105.origin.y = a25;
          v105.size.width = 1.0 / (a25 * 2.0 + 1.0);
          v105.size.height = v105.size.width;
          v108.origin.x = v65;
          v108.origin.y = v67;
          v108.size.width = v69;
          v108.size.height = v71;
          if (CGRectContainsRect(v105, v108))
            break;
        }
LABEL_27:
        v53 = 0;
        v52 = 1;
        if ((v54 & 1) == 0)
        {
          v29 = v101;
          v51 = v31;
          v35 = v98;
          v28 = a25;
          goto LABEL_29;
        }
      }
      while (1)
      {
        if (rectIsWithinRect(v63, v31, v64, v98, v65, v67, v69, v71))
        {
          result = rectIsWithinRect(v65, v67, v69, v71, a25, a25, v100, v100);
          if (result)
            break;
        }
        v64 = v92;
        v63 = v101;
        v65 = positionCandidateRectForSizeLeft(2, v94 * v69, v94 * v71, v101, v31, v92, v98, v91);
        v67 = v72;
        v69 = v73;
        v71 = v74;
        v106.origin.x = a25;
        v106.origin.y = a25;
        v106.size.width = 1.0 / (a25 * 2.0 + 1.0);
        v106.size.height = v106.size.width;
        v109.origin.x = v65;
        v109.origin.y = v67;
        v109.size.width = v69;
        v109.size.height = v71;
        if (!CGRectContainsRect(v106, v109))
          goto LABEL_27;
      }
    }
    else
    {
LABEL_29:
      v75 = 0;
      v95 = v51 + v35 * 0.5;
      v96 = v29 + v92 * 0.5;
      do
      {
        if (a2 == 1)
          v76 = (char *)&cropTimeRightFacesNoMask_thirdsChoices;
        else
          v76 = (char *)&cropTimeRightFacesNoMask_centerChoices;
        v77 = maxRectInImageWithAnchorAtPosition(v97, v28, v91 + v87 * 0.5, *(double *)&v76[v75], v96, v95);
        v79 = v78;
        v81 = v80;
        v83 = v82;
        result = rectIsWithinRect(v101, v51, v92, v98, v77, v78, v80, v82);
        if (result)
        {
          result = rectIsWithinRect(v77, v79, v81, v83, v28, v28, v100, v100);
          if (result)
            break;
        }
        v75 += 8;
      }
      while (v75 != 56);
    }
  }
  return result;
}

BOOL cropTimeRightFacesNoMask(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,double a25,double a26,double a27)
{
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL8 result;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  char v43;
  char v44;
  double *v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  double v59;
  char *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double rect1;
  double v78;
  double v79;
  double v80;
  _QWORD v81[9];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v81[8] = *MEMORY[0x24BDAC8D0];
  v26 = combineFaceRects(a1);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  result = rectPlusCushionInsideImage(v26, v27, v29, v31, a25);
  if (!result)
    return result;
  v74 = a4;
  v34 = a26 / a27 / (a3 / a4);
  v70 = a5;
  v35 = v30 * 1.0001 / (1.0 - a5);
  rect1 = 1.0 / (a25 * 2.0 + 1.0);
  if (v35 >= rect1)
    v35 = 1.0 / (a25 * 2.0 + 1.0);
  v36 = v35 / v34;
  v73 = a26 / a27 / (a3 / a4);
  v37 = v34 * v32;
  if (v36 >= v32)
    v38 = v36;
  else
    v38 = v32;
  if (v36 >= v32)
    v37 = v35;
  if (a2 == 2)
  {
    v40 = -0.5;
  }
  else
  {
    v39 = v28;
    if (a2 != 1)
      goto LABEL_14;
    v40 = -0.333333333;
  }
  v39 = v28 + v38 * v40 + v32 * 0.5;
LABEL_14:
  v41 = v26 + -(v30 - v37 * v70) * -0.5;
  v69 = v37;
  v78 = v30;
  v79 = v26;
  v80 = v32;
  if (!rectIsWithinRect(v26, v28, v30, v32, v41, v39, v37, v38)
    || !rectIsWithinRect(v41, v39, v69, v38, a25, a25, rect1, rect1))
  {
    goto LABEL_49;
  }
  v68 = v39;
  v72 = v28;
  v42 = 0;
  v71 = -v30;
  v81[0] = a17;
  v81[1] = a18;
  v81[2] = a19;
  v81[3] = a20;
  v75 = 8.0 / v74 + 1.0;
  v81[4] = a21;
  v81[5] = a22;
  v81[6] = a23;
  v81[7] = a24;
  v43 = 1;
  do
  {
    v44 = v43;
    v45 = (double *)&v81[4 * v42];
    v46 = *v45;
    v47 = v45[1];
    v49 = v45[2];
    v48 = v45[3];
    v82.origin.x = *v45;
    v82.origin.y = v47;
    v82.size.width = v49;
    v82.size.height = v48;
    if (CGRectIsNull(v82))
      goto LABEL_47;
    v83.origin.x = v41;
    v83.origin.y = v68;
    v83.size.width = v69;
    v83.size.height = v38;
    v86.origin.x = v46;
    v86.origin.y = v47;
    v86.size.width = v49;
    v86.size.height = v48;
    result = CGRectContainsRect(v83, v86);
    if (result)
      return result;
    v50 = v69 < v49 || v38 < v48;
    v51 = v38;
    v52 = v69;
    if (v50)
    {
      if (v69 >= v49)
        v52 = v69;
      else
        v52 = v49;
      if (v38 >= v48)
        v51 = v38;
      else
        v51 = v48;
      if (v52 / v51 >= v73)
        v51 = v52 / v73;
      else
        v52 = v73 * v51;
    }
    if (a2 == 2)
    {
      v54 = -0.5;
    }
    else
    {
      v53 = v72;
      if (a2 != 1)
        goto LABEL_38;
      v54 = -0.333333333;
    }
    v53 = v72 + v51 * v54 + v80 * 0.5;
LABEL_38:
    v55 = v79;
    v56 = v79 + (v71 + v52 * v70) * -0.5;
    v84.origin.x = a25;
    v84.origin.y = a25;
    v84.size.width = 1.0 / (a25 * 2.0 + 1.0);
    v84.size.height = v84.size.width;
    v87.origin.x = v56;
    v87.origin.y = v53;
    v87.size.width = v52;
    v87.size.height = v51;
    if (CGRectContainsRect(v84, v87))
    {
      while (1)
      {
        if (rectIsWithinRect(v55, v72, v78, v80, v56, v53, v52, v51))
        {
          result = rectIsWithinRect(v56, v53, v52, v51, a25, a25, rect1, rect1);
          if (result)
            return result;
        }
        v51 = v75 * v51;
        if (a2 == 2)
          break;
        v53 = v72;
        if (a2 == 1)
        {
          v57 = -0.333333333;
LABEL_45:
          v53 = v72 + v51 * v57 + v80 * 0.5;
        }
        v85.size.width = 1.0 / (a25 * 2.0 + 1.0);
        v52 = v75 * v52;
        v55 = v79;
        v56 = v79 + (v71 + v52 * v70) * -0.5;
        v85.origin.x = a25;
        v85.origin.y = a25;
        v85.size.height = v85.size.width;
        v88.origin.x = v56;
        v88.origin.y = v53;
        v88.size.width = v52;
        v88.size.height = v51;
        if (!CGRectContainsRect(v85, v88))
          goto LABEL_47;
      }
      v57 = -0.5;
      goto LABEL_45;
    }
LABEL_47:
    v43 = 0;
    v42 = 1;
  }
  while ((v44 & 1) != 0);
  v30 = v78;
  v26 = v79;
  v28 = v72;
  v32 = v80;
LABEL_49:
  v58 = 0;
  v76 = v26 + v30 * 0.5;
  v59 = v28 + v32 * 0.5;
  do
  {
    if (a2 == 1)
      v60 = (char *)&cropTimeRightFacesNoMask_thirdsChoices;
    else
      v60 = (char *)&cropTimeRightFacesNoMask_centerChoices;
    v61 = maxRectInImageWithAnchorAtPosition(v73, a25, v70 * 0.5, *(double *)&v60[v58], v76, v59);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    result = rectIsWithinRect(v79, v28, v78, v80, v61, v62, v64, v66);
    if (result)
    {
      result = rectIsWithinRect(v61, v63, v65, v67, a25, a25, rect1, rect1);
      if (result)
        break;
    }
    v58 += 8;
  }
  while (v58 != 56);
  return result;
}

double findCoverage(uint64_t a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  id v19;
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

  v19 = a2;
  v20 = renormalizeRect(a7, a8, a9, a10, a3, a4, a5, a6);
  v24 = v20;
  v25 = v21;
  switch(a1)
  {
    case 0:
      v26 = v23 * 0.83;
      v21 = v21 + v23 * 0.83;
      goto LABEL_5;
    case 1:
      v26 = v23 * 0.83;
      v25 = v21 + v23 * 0.17;
LABEL_5:
      v27 = v22;
      goto LABEL_9;
    case 2:
      v27 = v22 * 0.83;
      v20 = v20 + v22 * 0.83;
      goto LABEL_8;
    case 3:
      v27 = v22 * 0.83;
      v24 = v20 + v22 * 0.17;
      goto LABEL_8;
    default:
      v27 = v22;
LABEL_8:
      v26 = v23;
LABEL_9:
      objc_msgSend(v19, "coverageOfTimeLabel:", v20, v21);
      objc_msgSend(v19, "coverageOfTimeLabel:", v24, v25, v27, v26);
      v29 = v28;

      return v29;
  }
}

PFLCCurationScore *PFLCCurationScoreForAsset(void *a1, uint64_t a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  double x;
  double y;
  double width;
  double height;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t j;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  NSObject *v75;
  void *v76;
  CGFloat v77;
  PFLCLayout *v78;
  PFLCCurationPositionScore *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  PFLCCurationPositionScore *v86;
  void *v87;
  double v88;
  double v89;
  PFLCCurationScore *v90;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  uint64_t v98;
  double v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v111;
  void *v112;
  void *v113;
  double v114;
  id obj;
  double obja;
  void *v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  CGAffineTransform buf[2];
  CGAffineTransform v125;
  uint64_t v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;

  v126 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  v3 = objc_alloc_init(MEMORY[0x24BDE3570]);
  objc_msgSend(v3, "setIncludedDetectionTypes:", &unk_251459F20);
  v112 = v3;
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesInAsset:options:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v120, buf, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v121;
    obj = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v121 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_msgSend(v10, "size");
        v12 = v11;
        v13 = objc_msgSend(v2, "pixelWidth");
        v14 = objc_msgSend(v2, "pixelHeight");
        if (v13 <= v14)
          v15 = v14;
        else
          v15 = v13;
        v16 = v12 * (double)v15;
        objc_msgSend(v10, "centerX");
        v18 = fmax(v16 * -0.5 + v17 * (double)(unint64_t)objc_msgSend(v2, "pixelWidth"), 0.0);
        objc_msgSend(v10, "centerY");
        v20 = fmax(v16 * -0.5 + v19 * (double)(unint64_t)objc_msgSend(v2, "pixelHeight"), 0.0);
        v21 = objc_msgSend(v2, "pixelWidth");
        if (v16 >= (double)v21 - v18)
          v22 = (double)v21 - v18;
        else
          v22 = v16;
        v23 = objc_msgSend(v2, "pixelHeight");
        if (v16 >= (double)v23 - v20)
          v16 = (double)v23 - v20;
        CGAffineTransformMakeScale(&v119, (float)(1.0 / (float)(unint64_t)objc_msgSend(v2, "pixelWidth")), (float)(1.0 / (float)(unint64_t)objc_msgSend(v2, "pixelHeight")));
        v127.origin.x = v18;
        v127.origin.y = v20;
        v127.size.width = v22;
        v127.size.height = v16;
        v128 = CGRectApplyAffineTransform(v127, &v119);
        v125.b = 0.0;
        v125.c = 0.0;
        *(_OWORD *)&v125.d = xmmword_243C3CEF0;
        v125.a = 1.0;
        v125.ty = 1.0;
        v129 = CGRectApplyAffineTransform(v128, &v125);
        x = v129.origin.x;
        y = v129.origin.y;
        width = v129.size.width;
        height = v129.size.height;
        pflc_layout_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          _rectAsString(x, y, width, height);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v10, "detectionType");
          LODWORD(v125.a) = 136315650;
          *(_QWORD *)((char *)&v125.a + 4) = "NSArray<NSValue *> * _Nullable faceRectsForAsset(PHAsset *__strong)";
          WORD2(v125.b) = 2112;
          *(_QWORD *)((char *)&v125.b + 6) = v29;
          HIWORD(v125.c) = 2048;
          *(_QWORD *)&v125.d = v30;
          _os_log_impl(&dword_243C35000, v28, OS_LOG_TYPE_DEFAULT, "%s: face at %@, detectionType == %ld", (uint8_t *)&v125, 0x20u);

        }
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", x, y, width, height);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "addObject:", v31);

      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, buf, 16);
    }
    while (v7);
  }

  v32 = v117;
  if (!objc_msgSend(v117, "count"))
  {
    pflc_layout_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "localIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v125.a) = 136315394;
      *(_QWORD *)((char *)&v125.a + 4) = "NSArray<NSValue *> * _Nullable faceRectsForAsset(PHAsset *__strong)";
      WORD2(v125.b) = 2112;
      *(_QWORD *)((char *)&v125.b + 6) = v34;
      _os_log_impl(&dword_243C35000, v33, OS_LOG_TYPE_DEFAULT, "%s: No PHFace data in asset %@", (uint8_t *)&v125, 0x16u);

    }
  }

  v35 = (double)(unint64_t)objc_msgSend(v2, "pixelWidth");
  v36 = (double)(unint64_t)objc_msgSend(v2, "pixelHeight");
  objc_msgSend(v2, "preferredCropRect");
  v107 = v38;
  v108 = v37;
  v105 = v40;
  v106 = v39;
  objc_msgSend(v2, "acceptableCropRect");
  v103 = v42;
  v104 = v41;
  v101 = v44;
  v102 = v43;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  if (v117)
    v45 = a2 == 0;
  else
    v45 = 0;
  if (v45)
    v46 = 1;
  else
    v46 = a2;
  v47 = *MEMORY[0x24BE723B0] * 0.5;
  v99 = *(double *)(MEMORY[0x24BE723C0] + 8);
  v100 = *MEMORY[0x24BE723C0];
  v48 = *MEMORY[0x24BE723C0] / v99;
  v49 = v35 * v47 + 0.0;
  v50 = v36 * v47 + 0.0;
  v51 = v47 * -2.0 + 1.0;
  v52 = v51 * v35;
  v53 = v51 * v36;
  v54 = v48 * v53;
  if (v48 * v53 >= v52)
    v54 = v52;
  v97 = v54;
  v55 = v49 + fmax((v52 - v54) * 0.5, 0.0);
  v56 = v52 / v48;
  if (v56 >= v53)
    v56 = v53;
  v95 = v56;
  v96 = v55;
  v109 = v36;
  v111 = v35;
  v93 = 1.0 / v35;
  v94 = v50 + fmax((v53 - v56) * 0.5, 0.0);
  v92 = 1.0 / v36;
  v114 = -1.0;
  for (j = 1; j != 9; ++j)
  {
    PFCRectForTimePosition();
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;
    PFLCCalculateLayout(0, 1, v46, v32, 0, j, v111, v109, v108, v107, v106, v105, v66, v67, v68, v69, v104, v103, v102,
      v101,
      v100,
      v99,
      v58,
      v60,
      v62,
      v64);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "visibleRect");
    obja = v65;
    if (CGRectIsEmpty(v130))
    {
      CGAffineTransformMakeScale(&v118, v93, v92);
      v131.origin.x = v96;
      v131.size.width = v97;
      v131.origin.y = v94;
      v131.size.height = v95;
      v132 = CGRectApplyAffineTransform(v131, &v118);
      v71 = v132.origin.x;
      v72 = v132.origin.y;
      v73 = v132.size.width;
      v74 = v132.size.height;
      pflc_layout_log();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        _rectAsString(v71, v72, v73, v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0].a) = 138412290;
        *(_QWORD *)((char *)&buf[0].a + 4) = v76;
        _os_log_impl(&dword_243C35000, v75, OS_LOG_TYPE_DEFAULT, "PFLCCurationScoreForAsset: Backup crop: %@", (uint8_t *)buf, 0xCu);

      }
      v77 = v59;

      v78 = -[PFLCLayout initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:]([PFLCLayout alloc], "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", 0, 0.0, 0.0, 0.0, v71, v72, v73, v74);
      v70 = v78;
    }
    else
    {
      v77 = v59;
    }
    v79 = [PFLCCurationPositionScore alloc];
    objc_msgSend(v70, "cropScore");
    v81 = v80;
    objc_msgSend(v70, "visibleRect");
    buf[0].b = 0.0;
    buf[0].c = 0.0;
    *(_OWORD *)&buf[0].d = xmmword_243C3CEF0;
    buf[0].a = 1.0;
    buf[0].ty = 1.0;
    v134 = CGRectApplyAffineTransform(v133, buf);
    v82 = v134.origin.x;
    v83 = v134.origin.y;
    v84 = v134.size.width;
    v85 = v134.size.height;
    buf[0].b = 0.0;
    buf[0].c = 0.0;
    *(_OWORD *)&buf[0].d = xmmword_243C3CEF0;
    buf[0].a = 1.0;
    buf[0].ty = 1.0;
    v134.origin.x = v77;
    v134.origin.y = v61;
    v134.size.width = v63;
    v134.size.height = obja;
    v135 = CGRectApplyAffineTransform(v134, buf);
    v86 = -[PFLCCurationPositionScore initWithCropScore:cropRect:timeLabelRect:classification:](v79, "initWithCropScore:cropRect:timeLabelRect:classification:", v46, v81, v82, v83, v84, v85, *(_QWORD *)&v135.origin.x, *(_QWORD *)&v135.origin.y, *(_QWORD *)&v135.size.width, *(_QWORD *)&v135.size.height);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", j);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setObject:forKeyedSubscript:", v86, v87);

    objc_msgSend(v70, "cropScore");
    if (v88 > v114)
    {
      objc_msgSend(v70, "cropScore");
      v114 = v89;
      v98 = j;
    }

    v32 = v117;
  }
  v90 = -[PFLCCurationScore initWithPositionScores:preferredPosition:]([PFLCCurationScore alloc], "initWithPositionScores:preferredPosition:", v113, v98);

  return v90;
}

PFLCLayout *PFLCCalculateLayout(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, double a7, double a8, double a9, double a10, CGFloat a11, CGFloat a12, uint64_t a13, uint64_t a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,double a22,double a23,double a24,double a25,double a26)
{
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  PFLCCoverageValidator *v38;
  double v39;
  double v40;
  PFLCCoverageValidator *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
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
  double v59;
  NSObject *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  BOOL v67;
  double v68;
  double v69;
  BOOL v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  NSObject *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  id v98;
  uint64_t v99;
  double v100;
  double v101;
  unint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t i;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  int j;
  CGFloat v117;
  CGFloat v118;
  CGFloat v119;
  NSObject *v120;
  double v121;
  PFLCLayout *v122;
  double v124;
  double v125;
  double v126;
  double v130;
  double v131;
  double v132;
  double v134;
  double v135;
  double rect1;
  CGFloat rect1a;
  double v138;
  double v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  uint64_t v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  double v149;
  uint64_t v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  v150 = *MEMORY[0x24BDAC8D0];
  v31 = a4;
  v32 = a5;
  v34 = *MEMORY[0x24BDBF090];
  v33 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v36 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v35 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v124 = a11;
  v125 = a12;
  v126 = a21 * 0.8;
  v134 = 0.0;
  rect1 = v35;
  if (!a1)
  {
    v48 = 0;
    v49 = 0.0;
    v130 = 0.0;
    v50 = *MEMORY[0x24BDBF090];
    v138 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v139 = *MEMORY[0x24BDBF090];
    v51 = v138;
    v52 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v53 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v54 = a7;
LABEL_29:
    pflc_layout_log();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v145 = a3;
      _os_log_impl(&dword_243C35000, v71, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): trying with no mask", buf, 0xCu);
    }

    v80 = v138;
    switch(a3)
    {
      case 0:
      case 5:
        v53 = rect1;
        v36 = v52;
        v80 = v51;
        v139 = v50;
        break;
      case 1:
        v81 = layoutPeopleNoMatte(v31, a6, v54, a8, a9, a10, v124, v125, v78, v79, v72, v73, v74, v75, v76, v77, a17, a18, a19,
                a20,
                a21,
                a22,
                a23,
                a24,
                a25,
                a26);
        goto LABEL_37;
      case 2:
        v81 = layoutPetsNoMatte(v31, v54, a8, a9, a10, v124, v125, (uint64_t)v32, a6, v78, v79, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23, a24,
                a25,
                a26);
        goto LABEL_37;
      case 3:
        v81 = layoutNatureNoMatte(a6, v54, a8, a9, a10, v124, v125, v78, v79, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25, a26);
        goto LABEL_37;
      case 4:
        v81 = layoutCityScapeNoMatte(a6, v54, a8, a9, a10, v124, v125, v78, v79, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25, a26);
LABEL_37:
        v139 = v81;
        v36 = v82;
        v53 = v83;
        break;
      default:
        break;
    }
    v132 = v49;
    v84 = v53;
    v85 = v54;
    v86 = v139;
    v87 = v36;
    v88 = v80;
    v89 = v87;
    v90 = v84;
    if (CGRectIsEmpty(*(CGRect *)(&v80 - 1)) || !rectIsWithinRect(v139, v88, v87, v84, 0.0, 0.0, 1.0, 1.0))
    {
      pflc_layout_log();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v145 = a3;
        _os_log_impl(&dword_243C35000, v120, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): no rect found", buf, 0xCu);
      }

      v138 = v51;
      v139 = v50;
      v36 = v52;
      v53 = rect1;
      v49 = v132;
    }
    else
    {
      rect1a = v84;
      v138 = v88;
      pflc_layout_log();
      v91 = objc_claimAutoreleasedReturnValue();
      v36 = v87;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        _rectAsString(v139, v138, v87, v84);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v145 = a3;
        v146 = 2112;
        v147 = v92;
        _os_log_impl(&dword_243C35000, v91, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): found rect %@", buf, 0x16u);

      }
      if (v87 > 0.0)
        v93 = v87;
      else
        v93 = 0.0;
      v94 = v84;
      if (v84 <= 0.0)
        v94 = 0.0;
      v95 = (v94 + v93) * 0.1 * 0.5;
      v49 = 0.9;
      v96 = 0.9 - v95;
      v67 = v95 <= 0.1;
      v97 = 0.8;
      if (v67)
        v97 = v96;
      v131 = v97;
      v98 = v31;
      v99 = objc_msgSend(v98, "count");
      v100 = 0.0;
      v101 = a21 * 0.8;
      if (v99)
      {
        v102 = v99;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v103 = v98;
        v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
        if (v104)
        {
          v105 = v104;
          v106 = *(_QWORD *)v141;
          v135 = 0.0;
          do
          {
            for (i = 0; i != v105; ++i)
            {
              if (*(_QWORD *)v141 != v106)
                objc_enumerationMutation(v103);
              objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * i), "rectValue");
              v109 = v108;
              v111 = v110;
              v113 = v112;
              v115 = v114;
              v151.origin.y = v138;
              v151.origin.x = v139;
              v151.size.width = v87;
              v151.size.height = rect1a;
              v153.origin.x = v109;
              v153.origin.y = v111;
              v153.size.width = v113;
              v153.size.height = v115;
              if (!CGRectContainsRect(v151, v153))
              {
                for (j = 1; j != 5; ++j)
                {
                  v154.origin.x = expandRect(v109, v111, v113, v115, (double)j * 0.25 * -0.05, (double)j * 0.25 * -0.2, (double)j * 0.25 * -0.1, (double)j * 0.25 * -0.2);
                  v154.origin.y = v117;
                  v154.size.width = v118;
                  v154.size.height = v119;
                  v152.origin.y = v138;
                  v152.origin.x = v139;
                  v152.size.width = v87;
                  v152.size.height = rect1a;
                  if (CGRectContainsRect(v152, v154))
                    break;
                }
                v135 = v135 + (double)j * 0.25;
              }
            }
            v105 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v140, buf, 16);
          }
          while (v105);
        }
        else
        {
          v135 = 0.0;
        }

        v85 = a7;
        v100 = v135 / (double)v102;
        v101 = a21 * 0.8;
        v49 = 0.9;
      }

      v121 = 1.0 - v85 * v87 / v101;
      if (v85 * v87 >= v101)
        v121 = 0.0;
      v134 = v131 + v100 * -0.3 + v121 * -0.3;
      v53 = rect1a;
    }
    goto LABEL_72;
  }
  pflc_layout_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v145 = a3;
    _os_log_impl(&dword_243C35000, v37, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): trying with a mask", buf, 0xCu);
  }

  v38 = -[PFLCCoverageValidator initWithMaskImage:orientation:]([PFLCCoverageValidator alloc], "initWithMaskImage:orientation:", a1, a2);
  v41 = v38;
  v42 = v35;
  v43 = v36;
  v44 = v33;
  v45 = v34;
  switch(a3)
  {
    case 1:
      v46 = layoutPeopleMatte(v38, v31, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23, a24,
              a25,
              a26);
      goto LABEL_10;
    case 2:
      v46 = layoutPetsMatte(v38, v31, a7, a8, a9, a10, a11, a12, (uint64_t)v32, a6, v39, v40, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23,
              a24,
              a25,
              a26);
      goto LABEL_10;
    case 3:
      v46 = layoutNatureMatte(v38, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25,
              a26);
      goto LABEL_10;
    case 4:
      v46 = layoutCityScapeMatte(v38, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25,
              a26);
LABEL_10:
      v45 = v46;
      v42 = v47;
      break;
    default:
      break;
  }
  v50 = v34;
  v51 = v33;
  v52 = v36;
  v55 = v45;
  v56 = v43;
  v57 = v44;
  v58 = v42;
  if (CGRectIsEmpty(*(CGRect *)(&v44 - 1)) || !rectIsWithinRect(v45, v57, v56, v42, 0.0, 0.0, 1.0, 1.0))
  {

    v48 = 0;
    v49 = 0.0;
    v130 = 0.0;
    v138 = v51;
    v139 = v34;
    v36 = v52;
    v53 = rect1;
    v54 = a7;
    goto LABEL_29;
  }
  v138 = v57;
  v139 = v45;
  -[PFLCCoverageValidator coverageOfTimeLabel:](v41, "coverageOfTimeLabel:", renormalizeRect(a23, a24, a25, a26, v45, v57, v56, v42));
  v130 = v59;
  pflc_layout_log();
  v60 = objc_claimAutoreleasedReturnValue();
  v36 = v56;
  v53 = v42;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    _rectAsString(v139, v138, v56, v42);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v145 = a3;
    v146 = 2112;
    v147 = v61;
    v148 = 2048;
    v149 = v130;
    _os_log_impl(&dword_243C35000, v60, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): found rect %@, coverage %.3f", buf, 0x20u);

  }
  v62 = 0.0;
  if (v56 > 0.0)
    v63 = v56;
  else
    v63 = 0.0;
  if (v42 > 0.0)
    v64 = v42;
  else
    v64 = 0.0;
  v65 = (v64 + v63) * 0.1 * 0.5;
  v49 = 1.0;
  v66 = 1.0 - v65;
  v67 = v65 <= 0.1;
  v68 = 0.9;
  if (v67)
    v68 = v66;
  if (a7 * v56 < v126)
    v62 = 1.0 - a7 * v56 / v126;
  v69 = v68 + v62 * -0.3;

  v48 = 1;
  v134 = v69;
  v70 = v69 == 0.0;
  v54 = a7;
  if (v70)
    goto LABEL_29;
LABEL_72:
  v122 = -[PFLCLayout initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:]([PFLCLayout alloc], "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", v48, v134, v49, v130, v139, v138, v36, v53);

  return v122;
}

double layoutCityScapeMatte(void *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, CGFloat a17, CGFloat a18, double a19, double a20)
{
  return layoutNatureMatte(a1, a2, a3, a4, a5, a6, a7, a8, a19, a20, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

double layoutCityScapeNoMatte(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19)
{
  return layoutNatureNoMatte(a1, a2, a3, a4, a5, a6, a7, a18, a19, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

double layoutNatureMatte(void *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, CGFloat a17, CGFloat a18, double a19, CGFloat a20)
{
  id v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  CGFloat v43;
  _QWORD v46[4];
  double v47[4];
  _QWORD v48[4];
  void *v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v29 = a1;
  v30 = *MEMORY[0x24BDBF090];
  v43 = a6;
  v31 = *MEMORY[0x24BE723B0] * 0.5;
  switch(a2)
  {
    case 1:
    case 3:
    case 7:
      *(double *)v48 = a11;
      *(double *)&v48[1] = a12 + a14 * 0.5;
      *(double *)&v48[2] = a13;
      *(double *)&v48[3] = a14 * 0.5;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v48, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = cropTimeAboveFacesWithMask(v33, v29, 3, a3, a4, a17, a18, a19, a20, v31, v34, a15, a16);
      goto LABEL_5;
    case 5:
      v47[0] = a11 + a13 * 0.333333333;
      v47[1] = a12;
      v47[2] = a13 * 0.666666667;
      v47[3] = a14;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v47, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = cropTimeLeftOfFacesWithMask(v33, v29, 2, a3, a4, a17, a18, a19, a20, v37, v38, a5, v43, a7, a8, *MEMORY[0x24BDBF070], *(CGFloat *)(MEMORY[0x24BDBF070] + 8), *(CGFloat *)(MEMORY[0x24BDBF070] + 16), *(CGFloat *)(MEMORY[0x24BDBF070] + 24),
              v31,
              a15,
              a16);
      goto LABEL_5;
    case 6:
      *(double *)v46 = a11;
      *(double *)&v46[1] = a12;
      *(double *)&v46[2] = a13 * 0.666666667;
      *(double *)&v46[3] = a14;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v46, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = cropTimeRightOfFacesWithMask(v33, v29, 2, a3, a4, a17, a18, a19, a20, v40, v41, a5, v43, a7, a8, *MEMORY[0x24BDBF070], *(CGFloat *)(MEMORY[0x24BDBF070] + 8), *(CGFloat *)(MEMORY[0x24BDBF070] + 16), *(CGFloat *)(MEMORY[0x24BDBF070] + 24),
              v31,
              a15,
              a16);
LABEL_5:
      v30 = v35;

      break;
    default:
      break;
  }

  return v30;
}

double layoutNatureNoMatte(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19)
{
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  _QWORD v58[4];
  double v59[4];
  _QWORD v60[4];
  _QWORD v61[4];
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v29 = *MEMORY[0x24BE723B0] * 0.5;
  switch(a1)
  {
    case 1:
    case 3:
    case 7:
      *(double *)v61 = a10;
      *(double *)&v61[1] = a11;
      *(double *)&v61[2] = a12;
      *(double *)&v61[3] = a13;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v61, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = cropTimeAboveFacesNoMask(v31, a2, a3, a16, a17, a18, a19, v29, v32, a14, a15);
      goto LABEL_7;
    case 2:
    case 4:
    case 8:
      *(double *)v60 = a10;
      *(double *)&v60[1] = a11;
      *(double *)&v60[2] = a12;
      *(double *)&v60[3] = a13;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v60, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = cropTimeBelowFacesNoMask(v31, a2, a3, a16, a17, a18, a19, v29, v35, a14, a15);
      goto LABEL_7;
    case 5:
      v59[0] = a10 + a12 * 0.333333333;
      v59[1] = a11;
      v59[2] = a12 * 0.666666667;
      v59[3] = a13;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v59, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      cropTimeLeftFacesNoMask(v31, 2, a2, a3, a16, a17, a18, a19, v44, v45, v38, v39, v40, v41, v42, v43, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        *MEMORY[0x24BDBF070],
        *(_QWORD *)(MEMORY[0x24BDBF070] + 8),
        *(_QWORD *)(MEMORY[0x24BDBF070] + 16),
        *(_QWORD *)(MEMORY[0x24BDBF070] + 24),
        v29,
        a14,
        a15);
      goto LABEL_7;
    case 6:
      *(double *)v58 = a10;
      *(double *)&v58[1] = a11;
      *(double *)&v58[2] = a12 * 0.666666667;
      *(double *)&v58[3] = a13;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v58, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      cropTimeRightFacesNoMask(v31, 2, a2, a3, a16, a17, a18, a19, v53, v54, v47, v48, v49, v50, v51, v52, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        *MEMORY[0x24BDBF070],
        *(_QWORD *)(MEMORY[0x24BDBF070] + 8),
        *(_QWORD *)(MEMORY[0x24BDBF070] + 16),
        *(_QWORD *)(MEMORY[0x24BDBF070] + 24),
        v29,
        a14,
        a15);
LABEL_7:
      v36 = v33;

      break;
    default:
      v36 = *MEMORY[0x24BDBF090];
      break;
  }
  return v36;
}

double layoutPeopleMatte(void *a1, void *a2, uint64_t a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, double a16, double a17, CGFloat a18, CGFloat a19, double a20,CGFloat a21)
{
  id v30;
  id v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v42;

  v30 = a1;
  v31 = a2;
  v32 = *MEMORY[0x24BDBF090];
  if (objc_msgSend(v31, "count"))
  {
    v42 = a7;
    v33 = *MEMORY[0x24BE723B0] * 0.5;
    switch(a3)
    {
      case 1:
      case 3:
      case 7:
        expandRects(v31, 0.0, 0.01, 0.02, 0.01);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = cropTimeAboveFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v33, v35, a16, a17);
        goto LABEL_6;
      case 5:
        expandRects(v31, 0.01, 0.01, 0.05, 0.01);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = cropTimeLeftOfFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v37, v38, a6, v42, a8, a9, a12, a13, a14, a15,
                v33,
                a16,
                a17);
        goto LABEL_6;
      case 6:
        expandRects(v31, 0.01, 0.01, 0.05, 0.01);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = cropTimeRightOfFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v39, v40, a6, v42, a8, a9, a12, a13, a14, a15,
                v33,
                a16,
                a17);
LABEL_6:
        v32 = v36;

        break;
      default:
        break;
    }
  }

  return v32;
}

double layoutPeopleNoMatte(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,double a22,double a23,double a24,double a25,double a26)
{
  id v29;
  double x;
  double v31;
  double v32;
  void *v33;
  double v34;
  int v35;
  void *v36;
  double v37;
  double v39;
  int v40;
  void *v41;
  double v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  uint64_t v91;
  double v92;
  double v93;
  double v95;
  double v96;
  double v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  v29 = a1;
  x = *MEMORY[0x24BDBF090];
  if (objc_msgSend(v29, "count"))
  {
    v91 = *(_QWORD *)&a6;
    v31 = a4;
    x = a25;
    v98 = a3;
    v32 = *MEMORY[0x24BE723B0] * 0.5;
    switch(a2)
    {
      case 1:
      case 3:
      case 7:
        expandRects(v29, 0.0, 0.01, 0.02, 0.01);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v99.origin.x = cropTimeAboveFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v34, a21, a22);
        x = v99.origin.x;
        if (CGRectIsNull(v99))
        {
          v35 = 1;
          do
          {
            v36 = v33;
            expandRects(v29, (double)v35 * 0.25 * -0.05, (double)v35 * 0.25 * -0.2, (double)v35 * 0.25 * -0.1, (double)v35 * 0.25 * -0.2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v100.origin.x = cropTimeAboveFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v37, a21, a22);
            x = v100.origin.x;
          }
          while (CGRectIsNull(v100) && v35++ < 4);
        }
        goto LABEL_34;
      case 2:
      case 4:
      case 8:
        expandRects(v29, 0.01, 0.01, 0.0, 0.01);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v101.origin.x = cropTimeBelowFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v39, a21, a22);
        x = v101.origin.x;
        if (CGRectIsNull(v101))
        {
          v40 = 1;
          do
          {
            v41 = v33;
            expandRects(v29, (double)v40 * 0.25 * -0.05, (double)v40 * 0.25 * -0.2, (double)v40 * 0.25 * -0.1, (double)v40 * 0.25 * -0.2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v102.origin.x = cropTimeBelowFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v42, a21, a22);
            x = v102.origin.x;
          }
          while (CGRectIsNull(v102) && v40++ < 4);
        }
        goto LABEL_34;
      case 5:
        expandRects(v29, 0.01, 0.01, 0.05, 0.01);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v32;
        cropTimeLeftFacesNoMask(v33, 1, a3, v31, a23, a24, a25, a26, v73, v74, v67, v68, v69, v70, v71, v72, *(uint64_t *)&a5, v91, *(uint64_t *)&a7,
          *(uint64_t *)&a8,
          a17,
          a18,
          a19,
          a20,
          v32,
          a21,
          a22);
        x = v105.origin.x;
        if (CGRectIsNull(v105))
        {
          v75 = *MEMORY[0x24BDBF070];
          v76 = *(_QWORD *)(MEMORY[0x24BDBF070] + 8);
          v96 = v31;
          v77 = *(_QWORD *)(MEMORY[0x24BDBF070] + 16);
          v78 = *(_QWORD *)(MEMORY[0x24BDBF070] + 24);
          v79 = 1;
          do
          {
            v80 = v33;
            expandRects(v29, (double)v79 * 0.25 * -0.05, (double)v79 * 0.25 * -0.2, (double)v79 * 0.25 * -0.1, (double)v79 * 0.25 * -0.2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            cropTimeLeftFacesNoMask(v33, 1, v98, v96, a23, a24, a25, a26, v87, v88, v81, v82, v83, v84, v85, v86, v75, v76, v77,
              v78,
              v75,
              v76,
              v77,
              v78,
              v93,
              a21,
              a22);
            x = v106.origin.x;
          }
          while (CGRectIsNull(v106) && v79++ < 4);
        }
        goto LABEL_34;
      case 6:
        expandRects(v29, 0.01, 0.01, 0.05, 0.01);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v32;
        cropTimeRightFacesNoMask(v33, 1, a3, v31, a23, a24, a25, a26, v50, v51, v44, v45, v46, v47, v48, v49, *(uint64_t *)&a5, v91, *(uint64_t *)&a7,
          *(uint64_t *)&a8,
          a17,
          a18,
          a19,
          a20,
          v32,
          a21,
          a22);
        x = v103.origin.x;
        if (CGRectIsNull(v103))
        {
          v52 = *MEMORY[0x24BDBF070];
          v53 = *(_QWORD *)(MEMORY[0x24BDBF070] + 8);
          v95 = v31;
          v54 = *(_QWORD *)(MEMORY[0x24BDBF070] + 16);
          v55 = *(_QWORD *)(MEMORY[0x24BDBF070] + 24);
          v56 = 1;
          do
          {
            v57 = v33;
            expandRects(v29, (double)v56 * 0.25 * -0.05, (double)v56 * 0.25 * -0.2, (double)v56 * 0.25 * -0.1, (double)v56 * 0.25 * -0.2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            cropTimeRightFacesNoMask(v33, 1, v98, v95, a23, a24, a25, a26, v64, v65, v58, v59, v60, v61, v62, v63, v52, v53, v54,
              v55,
              v52,
              v53,
              v54,
              v55,
              v92,
              a21,
              a22);
            x = v104.origin.x;
          }
          while (CGRectIsNull(v104) && v56++ < 4);
        }
LABEL_34:

        break;
      default:
        break;
    }
  }

  return x;
}

double layoutPetsMatte(void *a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, uint64_t a9, uint64_t a10, double a11, double a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, double a17, double a18, CGFloat a19, CGFloat a20,double a21,CGFloat a22)
{
  id v26;
  id v27;
  double v28;
  id v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD v48[4];
  _QWORD v49[2];
  CGRect v50;

  v49[1] = *MEMORY[0x24BDAC8D0];
  v26 = a1;
  v27 = a2;
  v28 = *MEMORY[0x24BDBF090];
  v29 = v27;
  if (objc_msgSend(v29, "count"))
  {
    v30 = -0.2;
    v31 = v29;
  }
  else
  {
    v50.origin.x = a13;
    v50.origin.y = a14;
    v50.size.width = a15;
    v50.size.height = a16;
    if (CGRectIsEmpty(v50))
    {
      v31 = v29;
      goto LABEL_12;
    }
    *(CGFloat *)v48 = a13;
    *(CGFloat *)&v48[1] = a14;
    *(CGFloat *)&v48[2] = a15;
    *(CGFloat *)&v48[3] = a16;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v48, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0.0;
  }
  v28 = *MEMORY[0x24BE723B0] * 0.5;
  switch(a10)
  {
    case 1:
    case 3:
    case 7:
      expandRects(v31, v30, 0.01, 0.02, 0.01);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = cropTimeAboveFacesWithMask(v33, v26, 2, a3, a4, a19, a20, a21, a22, v28, v34, a17, a18);
      goto LABEL_11;
    case 2:
    case 4:
    case 8:
      expandRects(v31, v30, 0.01, 0.0, 0.01);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = cropTimeBelowFacesWithMask(v33, v26, a3, a4, a19, a20, a21, a22, v28, v36, a17, a18);
      goto LABEL_11;
    case 5:
      expandRects(v31, v30, 0.01, 0.02, 0.01);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = cropTimeLeftOfFacesWithMask(v33, v26, 1, a3, a4, a19, a20, a21, a22, v37, v38, a5, a6, a7, a8, a13, a14, a15, a16,
              v28,
              a17,
              a18);
      goto LABEL_11;
    case 6:
      expandRects(v31, v30, 0.01, 0.02, 0.01);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = cropTimeRightOfFacesWithMask(v33, v26, 1, a3, a4, a19, a20, a21, a22, v39, v40, a5, a6, a7, a8, a13, a14, a15, a16,
              v28,
              a17,
              a18);
LABEL_11:
      v28 = v35;

      break;
    default:
      break;
  }
LABEL_12:

  return v28;
}

double layoutPetsNoMatte(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, double a16, double a17, double a18, double a19, double a20,double a21)
{
  id v25;
  double x;
  id v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  int v34;
  void *v35;
  double v36;
  double v38;
  int v39;
  void *v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  uint64_t v90;
  double v95;
  _QWORD v98[4];
  _QWORD v99[2];
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v99[1] = *MEMORY[0x24BDAC8D0];
  v25 = a1;
  x = *MEMORY[0x24BDBF090];
  v27 = v25;
  if (objc_msgSend(v27, "count"))
  {
    v90 = *(_QWORD *)&a12;
    v28 = -0.2;
    v29 = v27;
  }
  else
  {
    v100.origin.x = a12;
    v100.origin.y = a13;
    v100.size.width = a14;
    v100.size.height = a15;
    if (CGRectIsEmpty(v100))
    {
      v29 = v27;
      goto LABEL_39;
    }
    v90 = *(_QWORD *)&a12;
    *(CGFloat *)v98 = a12;
    *(CGFloat *)&v98[1] = a13;
    *(CGFloat *)&v98[2] = a14;
    *(CGFloat *)&v98[3] = a15;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v98, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0.0;
  }
  x = a20;
  v31 = *MEMORY[0x24BE723B0] * 0.5;
  v95 = v28;
  switch(a9)
  {
    case 1:
    case 3:
    case 7:
      expandRects(v29, v28, 0.01, 0.02, 0.01);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v101.origin.x = cropTimeAboveFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v33, a16, a17);
      x = v101.origin.x;
      if (CGRectIsNull(v101))
      {
        v34 = 1;
        do
        {
          v35 = v32;
          expandRects(v27, v95 + (double)v34 * 0.25 * -0.05, (double)v34 * 0.25 * -0.2, (double)v34 * 0.25 * -0.1, (double)v34 * 0.25 * -0.2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v102.origin.x = cropTimeAboveFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v36, a16, a17);
          x = v102.origin.x;
        }
        while (CGRectIsNull(v102) && v34++ < 4);
      }
      goto LABEL_38;
    case 2:
    case 4:
    case 8:
      expandRects(v29, v28, 0.01, 0.0, 0.01);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v103.origin.x = cropTimeBelowFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v38, a16, a17);
      x = v103.origin.x;
      if (CGRectIsNull(v103))
      {
        v39 = 1;
        do
        {
          v40 = v32;
          expandRects(v27, v95 + (double)v39 * 0.25 * -0.05, (double)v39 * 0.25 * -0.2, (double)v39 * 0.25 * -0.1, (double)v39 * 0.25 * -0.2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v104.origin.x = cropTimeBelowFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v41, a16, a17);
          x = v104.origin.x;
        }
        while (CGRectIsNull(v104) && v39++ < 4);
      }
      goto LABEL_38;
    case 5:
      expandRects(v29, v28, 0.01, 0.02, 0.01);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      cropTimeLeftFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v49, v50, v43, v44, v45, v46, v47, v48, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        v90,
        *(uint64_t *)&a13,
        *(uint64_t *)&a14,
        *(uint64_t *)&a15,
        v31,
        a16,
        a17);
      x = v105.origin.x;
      if (CGRectIsNull(v105))
      {
        v51 = *MEMORY[0x24BDBF070];
        v52 = *(_QWORD *)(MEMORY[0x24BDBF070] + 8);
        v53 = *(_QWORD *)(MEMORY[0x24BDBF070] + 16);
        v54 = *(_QWORD *)(MEMORY[0x24BDBF070] + 24);
        v55 = 1;
        do
        {
          v56 = v32;
          expandRects(v27, v95 + (double)v55 * 0.25 * -0.05, (double)v55 * 0.25 * -0.2, (double)v55 * 0.25 * -0.1, (double)v55 * 0.25 * -0.2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          cropTimeLeftFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v63, v64, v57, v58, v59, v60, v61, v62, v51, v52, v53,
            v54,
            v51,
            v52,
            v53,
            v54,
            v31,
            a16,
            a17);
          x = v106.origin.x;
        }
        while (CGRectIsNull(v106) && v55++ < 4);
      }
      goto LABEL_38;
    case 6:
      expandRects(v29, v28, 0.01, 0.02, 0.01);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      cropTimeRightFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v72, v73, v66, v67, v68, v69, v70, v71, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        v90,
        *(uint64_t *)&a13,
        *(uint64_t *)&a14,
        *(uint64_t *)&a15,
        v31,
        a16,
        a17);
      x = v107.origin.x;
      if (CGRectIsNull(v107))
      {
        v74 = *MEMORY[0x24BDBF070];
        v75 = *(_QWORD *)(MEMORY[0x24BDBF070] + 8);
        v76 = *(_QWORD *)(MEMORY[0x24BDBF070] + 16);
        v77 = *(_QWORD *)(MEMORY[0x24BDBF070] + 24);
        v78 = 1;
        do
        {
          v79 = v32;
          expandRects(v27, v95 + (double)v78 * 0.25 * -0.05, (double)v78 * 0.25 * -0.2, (double)v78 * 0.25 * -0.1, (double)v78 * 0.25 * -0.2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          cropTimeRightFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v86, v87, v80, v81, v82, v83, v84, v85, v74, v75, v76,
            v77,
            v74,
            v75,
            v76,
            v77,
            v31,
            a16,
            a17);
          x = v108.origin.x;
        }
        while (CGRectIsNull(v108) && v78++ < 4);
      }
LABEL_38:

      break;
    default:
      break;
  }
LABEL_39:

  return x;
}

id pflc_layout_log()
{
  if (pflc_layout_log_onceToken != -1)
    dispatch_once(&pflc_layout_log_onceToken, &__block_literal_global_3);
  return (id)pflc_layout_log___logger;
}

void __pflc_layout_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photosfacelayoutcore", "layout");
  v1 = (void *)pflc_layout_log___logger;
  pflc_layout_log___logger = (uint64_t)v0;

}

uint64_t makePresentationTransform@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;

  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  switch((int)result)
  {
    case 1:
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 40) = 0;
      return result;
    case 2:
      v6 = (double)a2;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_9;
    case 3:
      v7 = (double)a2;
      v8 = (double)a3;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_11;
    case 4:
      v9 = (double)a3;
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_13;
    case 5:
      __asm { FMOV            V0.2D, #1.0; jumptable 0000000243C3C48C case 5 }
      *(_OWORD *)(a4 + 8) = _Q0;
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 40) = 0;
      *(_QWORD *)(a4 + 24) = 0;
      return result;
    case 6:
      v6 = (double)a3;
      *(_OWORD *)(a4 + 8) = xmmword_243C3CFD0;
LABEL_9:
      *(double *)(a4 + 32) = v6;
      return result;
    case 7:
      v7 = (double)a3;
      v8 = (double)a2;
      __asm { FMOV            V2.2D, #-1.0 }
      *(_OWORD *)(a4 + 8) = _Q2;
LABEL_11:
      *(double *)(a4 + 32) = v7;
      *(double *)(a4 + 40) = v8;
      break;
    case 8:
      v9 = (double)a2;
      *(_OWORD *)(a4 + 8) = xmmword_243C3CFC0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 32) = 0;
LABEL_13:
      *(double *)(a4 + 40) = v9;
      break;
    default:
      v4 = MEMORY[0x24BDBD8B8];
      v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)a4 = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)(a4 + 16) = v5;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

double makePresentationSize(float64x2_t *a1, double a2, double a3)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2));
  return result;
}

CGFloat uprightCTM@<D0>(CGImage *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat Height;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGFloat result;
  CGAffineTransform v16;
  CGAffineTransform t2;
  CGAffineTransform t1;

  Height = (double)CGImageGetHeight(a1);
  v6 = MEMORY[0x24BDBD8B8];
  v7 = *MEMORY[0x24BDBD8B8];
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a3 + 16) = v8;
  v9 = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(a3 + 32) = v9;
  *(_OWORD *)&t1.a = v7;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tx = v9;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_243C3CEF0;
  t2.ty = Height;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v11 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tx = a2[2];
  CGAffineTransformConcat(&t1, &t2, &v16);
  v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v12;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v13;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
  v16.b = 0.0;
  v16.c = 0.0;
  v16.a = 1.0;
  *(_OWORD *)&v16.d = xmmword_243C3CEF0;
  v16.ty = Height;
  CGAffineTransformConcat(&t1, &t2, &v16);
  v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v14;
  result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

BOOL rectIsWithinRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8;

  v8 = a1 < a5 + -0.00000011920929 || a2 < a6 + -0.00000011920929;
  return !v8 && a1 + a3 + -0.00000011920929 <= a5 + a7 && a2 + a4 + -0.00000011920929 <= a6 + a8;
}

double expandRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 - a3 * a8;
}

id expandRects(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v15 = a3 + a5 + 1.0;
    v16 = a2 + a4 + 1.0;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "rectValue");
        v24[0] = v20 - v18 * a5;
        v24[1] = v21 - v19 * a2;
        v24[2] = v15 * v18;
        v24[3] = v16 * v19;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v24, "{CGRect={CGPoint=dd}{CGSize=dd}}");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v22);

        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  return v10;
}

double renormalizeRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;

  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, a7, a8);
  v14 = v15;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  return a5 + COERCE_DOUBLE(CGRectApplyAffineTransform(v16, &v14));
}

id _rectAsString(double a1, double a2, double a3, double a4)
{
  const __CFString *v5;

  if (a4 <= 1.0 && a3 <= 1.0)
    v5 = CFSTR("{ %.5f, %.5f, %.5f, %.5f }");
  else
    v5 = CFSTR("{ %.1f, %.1f, %.1f, %.1f }");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t PFCRectForTimePosition()
{
  return MEMORY[0x24BE723B8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

