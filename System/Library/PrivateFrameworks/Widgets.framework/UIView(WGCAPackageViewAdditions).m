@implementation UIView(WGCAPackageViewAdditions)

- (void)_wg_innerWalkSubviewTreeWithBlock:()WGCAPackageViewAdditions stop:
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;
  char v13;

  v6 = a3;
  v7 = v6;
  if (!*a4)
  {
    v13 = 1;
    v8 = (*((uint64_t (**)(id, void *, char *))v6 + 2))(v6, a1, &v13);
    *a4 = v8;
    if ((v8 & 1) == 0)
    {
      if (v13)
      {
        objc_msgSend(a1, "subviews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __75__UIView_WGCAPackageViewAdditions___wg_innerWalkSubviewTreeWithBlock_stop___block_invoke;
        v10[3] = &unk_24D7323C8;
        v11 = v7;
        v12 = a4;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

      }
    }
  }

}

- (uint64_t)wg_walkSubviewTreeWithBlock:()WGCAPackageViewAdditions
{
  char v4;

  v4 = 0;
  return objc_msgSend(a1, "_wg_innerWalkSubviewTreeWithBlock:stop:", a3, &v4);
}

- (BOOL)wg_imageContentsDrawWithinBounds
{
  void *v2;
  void *v3;
  CGImage *v4;
  CFTypeID v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL8 v18;
  CGRect v20;
  CGRect v21;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(a1, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contents");
    v4 = (CGImage *)objc_claimAutoreleasedReturnValue();

    if (v4 && (v5 = CFGetTypeID(v4), v5 == CGImageGetTypeID()))
    {
      objc_msgSend(a1, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      CGImageGetWidth(v4);
      _WGMainScreenScale();
      CGImageGetHeight(v4);
      _WGMainScreenScale();
      BSRectWithSize();
      v21.origin.x = v14;
      v21.origin.y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.x = v7;
      v20.origin.y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      v18 = CGRectContainsRect(v20, v21);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)wg_supportsBottomCornerRadiusGivenRootView:()WGCAPackageViewAdditions withCornerRadius:supportedCorners:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double MaxY;
  double MinX;
  _BOOL4 v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  uint64_t v56;
  double MaxX;
  double v58;
  double v59;
  double v60;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat rect;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v6 = a3;
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    goto LABEL_2;
  objc_msgSend(v6, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  _WGMainScreenScale();
  BSFloatRoundForScale();
  UIRectInset();
  v68 = v20;
  v69 = v19;
  v67 = v21;
  v65 = v22;
  v74.origin.x = v12;
  v74.origin.y = v14;
  v74.size.width = v16;
  v74.size.height = v18;
  CGRectGetMaxY(v74);
  v70 = v12;
  UIRectInset();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(a1, "superview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frame");
  objc_msgSend(v31, "convertRect:toView:", v6);
  v72 = v33;
  v73 = v32;
  v35 = v34;
  v71 = v36;

  if ((objc_msgSend(a1, "clipsToBounds") & 1) != 0 || (objc_msgSend(a1, "wg_imageContentsDrawWithinBounds") & 1) != 0)
  {
    v75.origin.x = v24;
    v75.origin.y = v26;
    v75.size.width = v28;
    v75.size.height = v30;
    v38 = v72;
    v37 = v73;
    v89.origin.x = v73;
    v89.origin.y = v35;
    v89.size.width = v72;
    v39 = v71;
    v89.size.height = v71;
    if (!CGRectIntersectsRect(v75, v89))
      goto LABEL_28;
  }
  else
  {
    v38 = v72;
    v37 = v73;
    v39 = v71;
  }
  v76.origin.y = v14;
  v76.origin.x = v70;
  rect = v14;
  v76.size.width = v16;
  v76.size.height = v18;
  MaxY = CGRectGetMaxY(v76);
  v77.origin.x = v37;
  v77.origin.y = v35;
  v77.size.width = v38;
  v77.size.height = v39;
  if (vabdd_f64(MaxY, CGRectGetMaxY(v77)) > 2.22044605e-16)
    goto LABEL_2;
  v78.origin.x = v70;
  v78.origin.y = v14;
  v78.size.width = v16;
  v78.size.height = v18;
  MinX = CGRectGetMinX(v78);
  v79.origin.x = v37;
  v79.origin.y = v35;
  v79.size.width = v38;
  v79.size.height = v39;
  v63 = v18;
  v64 = v16;
  if (vabdd_f64(MinX, CGRectGetMinX(v79)) <= 2.22044605e-16)
  {
    v85.origin.x = v70;
    v85.origin.y = v14;
    v85.size.width = v16;
    v85.size.height = v18;
    MaxX = CGRectGetMaxX(v85);
    v86.origin.x = v37;
    v86.origin.y = v35;
    v86.size.width = v38;
    v86.size.height = v39;
    v58 = vabdd_f64(MaxX, CGRectGetMaxX(v86));
    v42 = a4 != 0;
    v44 = v68;
    v43 = v69;
    v46 = v67;
    v45 = rect;
    if (a4 && v58 <= 2.22044605e-16)
    {
      v56 = 12;
      goto LABEL_27;
    }
    if (v58 <= 2.22044605e-16)
      goto LABEL_28;
  }
  else
  {
    v42 = a4 != 0;
    v44 = v68;
    v43 = v69;
    v45 = rect;
    v46 = v67;
  }
  v47 = v70;
  v49 = v63;
  v48 = v64;
  v50 = CGRectGetMinX(*(CGRect *)(&v45 - 1));
  v80.origin.x = v73;
  v80.origin.y = v35;
  v80.size.width = v72;
  v80.size.height = v71;
  if (vabdd_f64(v50, CGRectGetMinX(v80)) <= 2.22044605e-16)
  {
    v87.origin.x = v73;
    v87.origin.y = v35;
    v87.size.width = v72;
    v87.size.height = v71;
    v59 = CGRectGetMaxX(v87);
    v88.origin.x = v43;
    v51 = v44;
    v88.origin.y = v44;
    v88.size.width = v46;
    v88.size.height = v65;
    v60 = CGRectGetMaxX(v88);
    if (v59 <= v60 && v42)
    {
      v56 = 4;
      goto LABEL_27;
    }
    if (v59 <= v60)
      goto LABEL_28;
  }
  else
  {
    v51 = v44;
  }
  v81.origin.x = v43;
  v81.origin.y = v51;
  v81.size.width = v46;
  v81.size.height = v65;
  v52 = CGRectGetMinX(v81);
  v82.origin.x = v73;
  v82.origin.y = v35;
  v82.size.width = v72;
  v82.size.height = v71;
  if (v52 > CGRectGetMinX(v82))
  {
LABEL_2:
    v10 = 0;
    goto LABEL_29;
  }
  v83.origin.x = v70;
  v83.origin.y = rect;
  v83.size.height = v63;
  v83.size.width = v64;
  v53 = CGRectGetMaxX(v83);
  v84.origin.x = v73;
  v84.origin.y = v35;
  v84.size.width = v72;
  v84.size.height = v71;
  v54 = vabdd_f64(v53, CGRectGetMaxX(v84));
  v10 = v54 <= 2.22044605e-16;
  if (v54 <= 2.22044605e-16 && v42)
  {
    v56 = 8;
LABEL_27:
    *a4 = v56;
LABEL_28:
    v10 = 1;
  }
LABEL_29:

  return v10;
}

@end
