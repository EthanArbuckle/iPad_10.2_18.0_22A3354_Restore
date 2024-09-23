@implementation OAITOrientedBounds

+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4
{
  float v4;

  if (a3 != 0.0)
    return a4 / a3;
  v4 = 1.0;
  if (a4 != 0.0)
    return a4 / a3;
  return v4;
}

+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3 logicalBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  OADOrientedBounds *v21;
  OADOrientedBounds *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  OADOrientedBounds *v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  if (CGRectGetWidth(v30) == 0.0)
  {
    v31.origin.x = v10;
    v31.origin.y = v12;
    v31.size.width = v14;
    v31.size.height = v16;
    if (CGRectGetWidth(v31) > 0.0)
      v14 = 0.0;
  }
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectGetHeight(v32) == 0.0)
  {
    v33.origin.x = v10;
    v33.origin.y = v12;
    v33.size.width = v14;
    v33.size.height = v16;
    if (CGRectGetHeight(v33) > 0.0)
      v16 = 0.0;
  }
  objc_msgSend(v8, "bounds");
  v35.origin.x = v17;
  v35.origin.y = v18;
  v35.size.width = v19;
  v35.size.height = v20;
  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  if (CGRectEqualToRect(v34, v35))
  {
    v21 = (OADOrientedBounds *)v8;
  }
  else
  {
    v22 = [OADOrientedBounds alloc];
    objc_msgSend(v8, "rotation");
    v24 = v23;
    v25 = objc_msgSend(v8, "flipX");
    v26 = objc_msgSend(v8, "flipY");
    LODWORD(v27) = v24;
    v21 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v22, "initWithBounds:rotation:flipX:flipY:", v25, v26, v10, v12, v14, v16, v27);
  }
  v28 = v21;

  return v28;
}

+ (id)absoluteOrientedBoundsOfDrawable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  OADOrientedBounds *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(a1, "relativeOrientedBoundsOfDrawable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "logicalBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(a1, "absoluteOrientedBoundsOfDrawable:", v7);
    v16 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 1.0;
    v9 = 0.0;
    v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, 0.0, 1.0, 1.0);
    v11 = 0.0;
    v15 = 1.0;
  }
  objc_msgSend(a1, "absoluteOrientedBoundsWithRelativeOrientedBounds:parentOrientedBounds:parentLogicalBounds:", v5, v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3
{
  id v3;
  double x;
  double y;
  double width;
  double height;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OADOrientedBounds *v17;
  OADOrientedBounds *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  OADOrientedBounds *v24;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (CGRectGetWidth(v26) == 0.0)
    width = 0.1;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v8 = CGRectGetHeight(v27);
  objc_msgSend(v3, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (v8 == 0.0)
    height = 0.1;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (CGRectEqualToRect(v28, *(CGRect *)&v10))
  {
    v17 = (OADOrientedBounds *)v3;
  }
  else
  {
    v18 = [OADOrientedBounds alloc];
    objc_msgSend(v3, "rotation");
    v20 = v19;
    v21 = objc_msgSend(v3, "flipX");
    v22 = objc_msgSend(v3, "flipY");
    LODWORD(v23) = v20;
    v17 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v18, "initWithBounds:rotation:flipX:flipY:", v21, v22, x, y, width, height, v23);
  }
  v24 = v17;

  return v24;
}

+ (CGAffineTransform)transformFromBounds:(SEL)a3 toOrientedBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  CGFloat v12;
  CGFloat v13;
  float v14;
  double v15;
  int v16;
  CGFloat v17;
  CGFloat v18;
  float v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  float v39;
  __int128 v40;
  __int128 v41;
  int v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGAffineTransform *result;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v12 = CGRectGetWidth(v60);
  objc_msgSend(v11, "bounds");
  v13 = CGRectGetWidth(v61);
  v14 = v12;
  *(float *)&v15 = v13;
  *(float *)&v13 = v14;
  objc_msgSend(a2, "scaleFactorFromLength:toLength:", v13, v15);
  LODWORD(v12) = v16;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v17 = CGRectGetHeight(v62);
  objc_msgSend(v11, "bounds");
  v18 = CGRectGetHeight(v63);
  v19 = v17;
  *(float *)&v20 = v18;
  *(float *)&v18 = v19;
  objc_msgSend(a2, "scaleFactorFromLength:toLength:", v18, v20);
  LODWORD(v17) = v21;
  v22 = TSUCenterOfRect(x, y, width, height);
  v24 = v23;
  objc_msgSend(v11, "bounds");
  v29 = TSUCenterOfRect(v25, v26, v27, v28);
  v31 = v30;
  v32 = MEMORY[0x24BDBD8B8];
  v33 = *MEMORY[0x24BDBD8B8];
  v34 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v34;
  v35 = *(_OWORD *)(v32 + 32);
  *(_OWORD *)&retstr->tx = v35;
  *(_OWORD *)&t1.a = v33;
  *(_OWORD *)&t1.c = v34;
  *(_OWORD *)&t1.tx = v35;
  CGAffineTransformMakeTranslation(&t2, -v22, -v24);
  CGAffineTransformConcat(retstr, &t1, &t2);
  v36 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v56.c = v36;
  *(_OWORD *)&v56.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformMakeScale(&v55, *(float *)&v12, *(float *)&v17);
  CGAffineTransformConcat(&v57, &v56, &v55);
  v37 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v37;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  v38 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v54.c = v38;
  *(_OWORD *)&v54.tx = *(_OWORD *)&retstr->tx;
  objc_msgSend(v11, "rotation");
  CGAffineTransformMakeRotation(&v53, v39 * 3.14159265 / 180.0);
  CGAffineTransformConcat(&v57, &v54, &v53);
  v40 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v40;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  v41 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v52.c = v41;
  *(_OWORD *)&v52.tx = *(_OWORD *)&retstr->tx;
  LODWORD(a2) = objc_msgSend(v11, "flipX");
  v42 = objc_msgSend(v11, "flipY");
  v43 = 1.0;
  if ((_DWORD)a2)
    v44 = -1.0;
  else
    v44 = 1.0;
  if (v42)
    v43 = -1.0;
  CGAffineTransformMakeScale(&v51, v44, v43);
  CGAffineTransformConcat(&v57, &v52, &v51);
  v45 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v45;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;
  v46 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v50.c = v46;
  *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformMakeTranslation(&v49, v29, v31);
  CGAffineTransformConcat(&v57, &v50, &v49);
  v47 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v47;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v57.tx;

  return result;
}

+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  float v23;
  double v24;
  float v25;
  float v26;
  double v27;
  CGFloat v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  float v48;
  float v49;
  float v50;
  float v51;
  OADOrientedBounds *v52;
  double v53;
  int v54;
  OADOrientedBounds *v55;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  objc_msgSend(a1, "adjustedOrientedBoundsWithOrientedBounds:logicalBounds:", v12, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "transformFromBounds:toOrientedBounds:", v13, x, y, width, height);
  objc_msgSend(v11, "bounds");
  v18 = TSUCenterOfRect(v14, v15, v16, v17);
  v20 = v19;
  objc_msgSend(v11, "bounds");
  v57 = CGRectGetWidth(v58);
  objc_msgSend(v11, "bounds");
  CGRectGetHeight(v59);
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v21 = CGRectGetWidth(v60);
  objc_msgSend(v13, "bounds");
  v22 = CGRectGetWidth(v61);
  v23 = v21;
  *(float *)&v24 = v22;
  *(float *)&v22 = v23;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v22, v24);
  v26 = v25;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v27 = CGRectGetHeight(v62);
  objc_msgSend(v13, "bounds");
  v28 = CGRectGetHeight(v63);
  v29 = v27;
  *(float *)&v30 = v28;
  *(float *)&v28 = v29;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v28, v30);
  v32 = v31;
  objc_msgSend(v11, "rotation");
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    v34 = v32;
  }
  else
  {
    v34 = v26;
  }
  v33 = v57;
  v35 = TSURectWithCenterAndSize(v20 * 0.0 + 0.0 * v18 + 0.0, v20 * 0.0 + 0.0 * v18 + 0.0, (float)(v34 * v33));
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = objc_msgSend(v13, "flipX");
  v43 = objc_msgSend(v11, "flipX");
  v44 = objc_msgSend(v13, "flipY");
  v45 = objc_msgSend(v11, "flipY");
  v46 = objc_msgSend(v11, "flipX");
  v47 = objc_msgSend(v11, "flipY");
  objc_msgSend(v11, "rotation");
  v49 = v48;
  objc_msgSend(v13, "rotation");
  v51 = v50;
  v52 = [OADOrientedBounds alloc];
  if (v47)
    v54 = -1;
  else
    v54 = 1;
  if (v46)
    v54 = -v54;
  *(float *)&v53 = v49 + (float)((float)v54 * v51);
  v55 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v52, "initWithBounds:rotation:flipX:flipY:", v42 ^ v43, v44 ^ v45, v35, v37, v39, v41, v53);

  return v55;
}

+ (id)relativeOrientedBoundsWithAbsoluteOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  float v46;
  double v47;
  float v48;
  float v49;
  double v50;
  CGFloat v51;
  float v52;
  double v53;
  float v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  void *v60;
  float v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  float v67;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double ty;
  double b;
  double a;
  double v75;
  double v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  memset(&v79, 0, sizeof(v79));
  +[OAITOrientedBounds transformFromBounds:toOrientedBounds:](OAITOrientedBounds, "transformFromBounds:toOrientedBounds:", v12, x, y, width, height);
  objc_msgSend(v11, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = TSUCenterOfRect(v13, v15, v17, v19);
  v75 = v22;
  v76 = v21;
  v77 = v79;
  CGAffineTransformInvert(&v78, &v77);
  b = v78.b;
  a = v78.a;
  rect_8 = v78.c;
  rect_16 = v78.tx;
  rect_24 = v78.d;
  ty = v78.ty;
  v23 = objc_msgSend(v12, "flipX");
  v24 = objc_msgSend(v11, "flipX");
  v25 = objc_msgSend(v12, "flipY");
  v26 = objc_msgSend(v11, "flipY");
  v63 = v20;
  v64 = v18;
  v65 = v16;
  v66 = v14;
  objc_msgSend(v11, "rotation");
  v67 = v27;
  objc_msgSend(v12, "rotation");
  v62 = v28;
  v29 = v23 ^ v24;
  v30 = v25 ^ v26;
  if ((_DWORD)v30)
    v31 = -1;
  else
    v31 = 1;
  if ((_DWORD)v29)
    v32 = -v31;
  else
    v32 = v31;
  objc_msgSend(v12, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  rect = x;
  v80.origin.x = x;
  v41 = y;
  v80.origin.y = y;
  v42 = width;
  v80.size.width = width;
  v43 = height;
  v80.size.height = height;
  v44 = CGRectGetWidth(v80);
  v81.origin.x = v34;
  v81.origin.y = v36;
  v81.size.width = v38;
  v81.size.height = v40;
  v45 = CGRectGetWidth(v81);
  v46 = v44;
  *(float *)&v47 = v45;
  *(float *)&v45 = v46;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v45, v47);
  v49 = v48;
  v82.origin.x = rect;
  v82.origin.y = v41;
  v82.size.width = v42;
  v82.size.height = v43;
  v50 = CGRectGetHeight(v82);
  v83.origin.x = v34;
  v83.origin.y = v36;
  v83.size.width = v38;
  v83.size.height = v40;
  v51 = CGRectGetHeight(v83);
  v52 = v50;
  *(float *)&v53 = v51;
  *(float *)&v51 = v52;
  objc_msgSend(a1, "scaleFactorFromLength:toLength:", v51, v53);
  v55 = v54;
  *(float *)&v56 = v67 - (float)((float)v32 * v62);
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:", v56))
  {
    v57 = v55;
  }
  else
  {
    v57 = v49;
  }
  v84.origin.x = v66;
  v84.origin.y = v65;
  v84.size.width = v64;
  v84.size.height = v63;
  v58 = CGRectGetWidth(v84);
  v85.origin.x = v66;
  v85.origin.y = v65;
  v85.size.width = v64;
  v85.size.height = v63;
  CGRectGetHeight(v85);
  v59 = v58;
  +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", v29, v30, TSURectWithCenterAndSize(rect_16 + v75 * rect_8 + a * v76, ty + v75 * rect_24 + b * v76, (float)(v59 / v57)));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

+ (id)relativeOrientedBoundsOfDrawable:(id)a3
{
  id v3;
  void *v4;
  OADOrientedBounds *v5;
  void *v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  CGRect v13;

  v3 = a3;
  objc_msgSend(v3, "drawableProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasOrientedBounds"))
  {
    objc_msgSend(v4, "orientedBounds");
    v5 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "clientData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (objc_msgSend(v6, "hasBounds"))
  {
    objc_msgSend(v6, "bounds");
    x = v13.origin.x;
    y = v13.origin.y;
    width = v13.size.width;
    height = v13.size.height;
    if (!CGRectEqualToRect(v13, *MEMORY[0x24BDBF090]))
    {
      if (!v5)
      {
        v5 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", x, y, width, height);
        objc_msgSend(v4, "setOrientedBounds:", v5);
      }
      -[OADOrientedBounds setBounds:](v5, "setBounds:", x, y, width, height);
    }
  }

  return v5;
}

+ (CGRect)axisParallelBoundsOfOrientedBounds:(id)a3
{
  id v3;
  float v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  char v18;
  char v19;
  double Width;
  int v21;
  CGFloat Height;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  float v27;
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
  float v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  v3 = a3;
  memset(&v43, 0, sizeof(v43));
  objc_msgSend(v3, "rotation");
  CGAffineTransformMakeRotation(&v43, v4 * 3.14159265 / 180.0);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = 0;
  v14 = -INFINITY;
  v15 = INFINITY;
  v42 = INFINITY;
  v16 = -INFINITY;
  do
  {
    v17 = 0;
    v41 = (double)*((int *)&unk_22A4BE760 + v13);
    v18 = 1;
    do
    {
      v19 = v18;
      v44.origin.x = v6;
      v44.origin.y = v8;
      v44.size.width = v10;
      v44.size.height = v12;
      Width = CGRectGetWidth(v44);
      v21 = *((_DWORD *)&unk_22A4BE760 + v17);
      v45.origin.x = v6;
      v45.origin.y = v8;
      v45.size.width = v10;
      v45.size.height = v12;
      Height = CGRectGetHeight(v45);
      v18 = 0;
      v23 = Width * v41 * 0.5;
      v24 = Height * (double)v21 * 0.5;
      v25 = v43.tx + v24 * v43.c + v43.a * v23;
      v26 = v43.ty + v24 * v43.d + v43.b * v23;
      v27 = v42;
      if (v25 <= v42)
        v27 = v25;
      v42 = v27;
      if (v26 <= v15)
        v15 = v26;
      if (v25 > v14)
        v14 = v25;
      if (v26 > v16)
        v16 = v26;
      v17 = 1;
    }
    while ((v19 & 1) != 0);
    ++v13;
  }
  while (v13 != 2);
  v28 = TSUCenterOfRect(v6, v8, v10, v12);
  v30 = TSURectWithCenterAndSize(v28, v29, (float)(v14 - v42));
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v37 = v30;
  v38 = v32;
  v39 = v34;
  v40 = v36;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

@end
