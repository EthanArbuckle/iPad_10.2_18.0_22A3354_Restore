@implementation PXViewLayoutHelper

- (PXViewLayoutHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXViewLayoutHelper.m"), 132, CFSTR("%s is not available as initializer"), "-[PXViewLayoutHelper init]");

  abort();
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXViewLayoutHelper;
  return -[PXViewLayoutHelper init](&v3, sel_init);
}

- (void)layoutView:(id)a3 withAttributes:(id *)a4
{
  id v6;
  PXViewLayoutHelper *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double var0;
  double MinX;
  double v14;
  _BOOL4 v15;
  int v16;
  double var2;
  double MaxX;
  double v19;
  _BOOL4 v20;
  int v21;
  double var3;
  double MinY;
  double v24;
  _BOOL4 v25;
  int v26;
  double var5;
  double MaxY;
  double v29;
  _BOOL4 v30;
  int v31;
  double var8;
  double v33;
  double v34;
  _BOOL4 v35;
  uint64_t v36;
  double var9;
  double v38;
  double v39;
  BOOL v40;
  double var10;
  double v42;
  double v43;
  _BOOL4 v44;
  int v45;
  double var11;
  double v47;
  double v48;
  _BOOL4 v49;
  double v50;
  _BOOL4 v51;
  double var12;
  double v53;
  double v54;
  _BOOL4 v55;
  double var13;
  double v57;
  double v58;
  _BOOL4 v59;
  double v60;
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
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  int v77;
  double var1;
  double MidY;
  double v80;
  BOOL v81;
  double v82;
  int v83;
  NSObject *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *v88;
  double v89;
  unsigned __int8 v90;
  NSObject *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  double v95;
  double v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  _BOOL4 v104;
  double v105;
  double v106;
  double v107;
  double v108;
  BOOL v109;
  double v110;
  double v111;
  double v112;
  _BYTE buf[32];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
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

  v119 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
    goto LABEL_170;
  v7 = self;
  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", v6);
  x = v120.origin.x;
  y = v120.origin.y;
  width = v120.size.width;
  height = v120.size.height;
  var0 = a4->var0;
  MinX = CGRectGetMinX(v120);
  v14 = fabs(var0);
  v15 = v14 < INFINITY;
  if (v14 > INFINITY)
    v15 = 1;
  if (v14 < INFINITY)
    MinX = var0;
  if (v14 > INFINITY)
    MinX = var0;
  v111 = MinX;
  v16 = var0 == -INFINITY || v15;
  var2 = a4->var2;
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = width;
  v121.size.height = height;
  MaxX = CGRectGetMaxX(v121);
  v19 = fabs(var2);
  v20 = v19 < INFINITY;
  if (v19 > INFINITY)
    v20 = 1;
  if (v19 < INFINITY)
    MaxX = var2;
  if (v19 > INFINITY)
    MaxX = var2;
  v106 = MaxX;
  v21 = var2 == -INFINITY || v20;
  var3 = a4->var3;
  v122.origin.x = x;
  v122.origin.y = y;
  v122.size.width = width;
  v122.size.height = height;
  MinY = CGRectGetMinY(v122);
  v24 = fabs(var3);
  v25 = v24 < INFINITY;
  if (v24 > INFINITY)
    v25 = 1;
  if (v24 < INFINITY)
    MinY = var3;
  if (v24 > INFINITY)
    MinY = var3;
  v110 = MinY;
  v26 = var3 == -INFINITY || v25;
  var5 = a4->var5;
  v123.origin.x = x;
  v123.origin.y = y;
  v123.size.width = width;
  v123.size.height = height;
  MaxY = CGRectGetMaxY(v123);
  v29 = fabs(var5);
  v30 = v29 < INFINITY;
  if (v29 > INFINITY)
    v30 = 1;
  if (v29 < INFINITY)
    MaxY = var5;
  if (v29 > INFINITY)
    MaxY = var5;
  v107 = MaxY;
  v31 = var5 == -INFINITY || v30;
  var8 = a4->var8;
  v124.origin.x = x;
  v124.origin.y = y;
  v124.size.width = width;
  v124.size.height = height;
  v33 = CGRectGetWidth(v124);
  v34 = fabs(var8);
  v35 = v34 < INFINITY;
  if (v34 > INFINITY)
    v35 = 1;
  if (v34 < INFINITY)
    v33 = var8;
  if (v34 > INFINITY)
    v33 = var8;
  v112 = v33;
  v36 = var8 == -INFINITY || v35;
  var9 = a4->var9;
  v125.origin.x = x;
  v125.origin.y = y;
  v125.size.width = width;
  v125.size.height = height;
  v38 = CGRectGetHeight(v125);
  v39 = fabs(var9);
  v40 = v39 < INFINITY;
  if (v39 > INFINITY)
    v40 = 1;
  if (v39 < INFINITY)
    v38 = var9;
  if (v39 > INFINITY)
    v38 = var9;
  v108 = v38;
  if (var9 == -INFINITY)
    v40 = 1;
  v109 = v40;
  var10 = a4->var10;
  v126.origin.x = x;
  v126.origin.y = y;
  v126.size.width = width;
  v126.size.height = height;
  v42 = CGRectGetMinX(v126);
  v43 = fabs(var10);
  v44 = v43 < INFINITY;
  if (v43 > INFINITY)
    v44 = 1;
  if (v43 < INFINITY)
    v42 = var10;
  if (v43 > INFINITY)
    v42 = var10;
  v102 = v42;
  v45 = var10 == -INFINITY || v44;
  var11 = a4->var11;
  v127.origin.x = x;
  v127.origin.y = y;
  v127.size.width = width;
  v127.size.height = height;
  v47 = CGRectGetMaxY(v127);
  v48 = fabs(var11);
  v49 = v48 == INFINITY;
  if (v48 == INFINITY)
    v50 = v47;
  else
    v50 = var11;
  v105 = v50;
  v51 = var11 != -INFINITY && v49;
  var12 = a4->var12;
  v128.origin.x = x;
  v128.origin.y = y;
  v128.size.width = width;
  v128.size.height = height;
  v53 = CGRectGetMinY(v128);
  v54 = fabs(var12);
  v55 = v54 < INFINITY;
  if (v54 > INFINITY)
    v55 = 1;
  if (v54 < INFINITY)
    v53 = var12;
  if (v54 > INFINITY)
    v53 = var12;
  v103 = v53;
  if (var12 == -INFINITY)
    v55 = 1;
  v104 = v55;
  var13 = a4->var13;
  v129.origin.x = x;
  v129.origin.y = y;
  v129.size.width = width;
  v129.size.height = height;
  v57 = CGRectGetMaxY(v129);
  v58 = fabs(var13);
  v59 = v58 == INFINITY;
  if (v58 == INFINITY)
    v60 = v57;
  else
    v60 = var13;
  v101 = v60;
  if (var13 == -INFINITY)
    v59 = 0;
  v61 = a4->var8;
  v62 = a4->var9;
  if (v61 != INFINITY && v62 != INFINITY)
    goto LABEL_111;
  v63 = v112;
  if ((v36 & 1) == 0)
  {
    v64 = -1.79769313e307;
    if (v45)
      v64 = v102;
    if (v16)
      v64 = v111;
    v65 = 1.79769313e307;
    if (!v51)
      v65 = v105;
    if (v21)
      v65 = v106;
    v63 = v65 - v64;
  }
  v66 = v108;
  if (!v109)
  {
    v67 = -1.79769313e307;
    if (v104)
      v67 = v103;
    if (v26)
      v67 = v110;
    v68 = 1.79769313e307;
    if (!v59)
      v68 = v105;
    if (v31)
      v68 = v107;
    v66 = v68 - v67;
  }
  objc_msgSend(v6, "sizeThatFits:", v63, v66, *(_QWORD *)&v101);
  v71 = fmin(v70, v63);
  if (v61 == INFINITY)
    v36 = 1;
  v72 = v112;
  if (v61 == INFINITY)
    v72 = v71;
  v112 = v72;
  if (v62 == INFINITY)
    v73 = fmin(v69, v66);
  else
LABEL_111:
    v73 = v108;
  if ((v16 & v21 & 1) != 0)
  {
    v75 = v110;
    v74 = v111;
    v76 = v106;
    goto LABEL_162;
  }
  v77 = v21 ^ 1;
  var1 = a4->var1;
  v130.origin.x = x;
  v130.origin.y = y;
  v130.size.width = width;
  v130.size.height = height;
  MidY = CGRectGetMidY(v130);
  v80 = fabs(var1);
  v81 = v80 == INFINITY;
  if (v80 == INFINITY)
    v82 = MidY;
  else
    v82 = var1;
  if (var1 == -INFINITY)
    v81 = 0;
  if ((v16 & v77) == 1)
  {
    v74 = v111;
    if (v36)
      v83 = 1;
    else
      v83 = v51;
    if (v111 + v112 < v105)
      v83 = 1;
    if (v83)
      v76 = v111 + v112;
    else
      v76 = v105;
    v75 = v110;
    if (v81)
      goto LABEL_162;
    PXAssertGetLog();
    v84 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      goto LABEL_161;
    goto LABEL_130;
  }
  v74 = v111;
  if (((v16 | v77) & 1) == 0)
  {
    v76 = v106;
    if (v36)
      v90 = 0;
    else
      v90 = v45;
    if ((v90 & (v106 - v112 < v102)) != 0)
      v74 = v102;
    else
      v74 = v106 - v112;
    v75 = v110;
    if (v81)
      goto LABEL_162;
    PXAssertGetLog();
    v84 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      goto LABEL_161;
LABEL_130:
    v85 = *(_OWORD *)&a4->var10;
    v116 = *(_OWORD *)&a4->var8;
    v117 = v85;
    v118 = *(_OWORD *)&a4->var12;
    v86 = *(_OWORD *)&a4->var2;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_OWORD *)&buf[16] = v86;
    v87 = *(_OWORD *)&a4->var6;
    v114 = *(_OWORD *)&a4->var4;
    v115 = v87;
    PXViewLayoutAttributesDescription((double *)buf);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "horizontalCenter";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v88;
    goto LABEL_160;
  }
  v75 = v110;
  v76 = v106;
  if (v81)
  {
    v89 = v102;
    if (v111 >= v102)
      v89 = v111;
    if (v45)
    {
      v76 = v89 + v112;
      v74 = v89;
    }
    if (!v51)
    {
      if (v76 >= v105)
        v76 = v105;
      v74 = v76 - v112;
      if (v45 && v74 < v102)
        v74 = v102;
    }
    goto LABEL_162;
  }
  v74 = v82 + v112 * -0.5;
  if (v45)
  {
    PXAssertGetLog();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      v97 = *(_OWORD *)&a4->var10;
      v116 = *(_OWORD *)&a4->var8;
      v117 = v97;
      v118 = *(_OWORD *)&a4->var12;
      v98 = *(_OWORD *)&a4->var2;
      *(_OWORD *)buf = *(_OWORD *)&a4->var0;
      *(_OWORD *)&buf[16] = v98;
      v99 = *(_OWORD *)&a4->var6;
      v114 = *(_OWORD *)&a4->var4;
      v115 = v99;
      PXViewLayoutAttributesDescription((double *)buf);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "minimumLeading";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v100;
      _os_log_error_impl(&dword_1A6789000, v91, OS_LOG_TYPE_ERROR, "ignoring layout attribute %s from %@", buf, 0x16u);

    }
  }
  v76 = v112 + v74;
  if (v51)
    goto LABEL_162;
  PXAssertGetLog();
  v84 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    goto LABEL_161;
  v92 = *(_OWORD *)&a4->var10;
  v116 = *(_OWORD *)&a4->var8;
  v117 = v92;
  v118 = *(_OWORD *)&a4->var12;
  v93 = *(_OWORD *)&a4->var2;
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_OWORD *)&buf[16] = v93;
  v94 = *(_OWORD *)&a4->var6;
  v114 = *(_OWORD *)&a4->var4;
  v115 = v94;
  PXViewLayoutAttributesDescription((double *)buf);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)&buf[4] = "maximumTrailing";
  *(_WORD *)&buf[12] = 2112;
  *(_QWORD *)&buf[14] = v88;
LABEL_160:
  _os_log_error_impl(&dword_1A6789000, v84, OS_LOG_TYPE_ERROR, "ignoring layout attribute %s from %@", buf, 0x16u);

LABEL_161:
LABEL_162:
  v95 = v76 - v74;
  if ((v26 & 1) == 0 && a4->var6 != -INFINITY)
  {
    *(_QWORD *)buf = 0;
    -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](v7, "_getFirstBaseline:lastBaseline:forView:withSize:", buf, 0, v6, v76 - v74, v73);
    v75 = a4->var6 - *(double *)buf;
  }
  if ((v31 & 1) == 0 && a4->var7 != -INFINITY)
  {
    *(_QWORD *)buf = 0;
    -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](v7, "_getFirstBaseline:lastBaseline:forView:withSize:", 0, buf, v6, v76 - v74, v73);
    v96 = a4->var7 - *(double *)buf;
    v131.origin.x = v74;
    v131.origin.y = y;
    v131.size.width = v95;
    v131.size.height = v73;
    v107 = v96 + CGRectGetHeight(v131);
  }
  -[PXViewLayoutHelper _setOrientedFrame:forView:](v7, "_setOrientedFrame:forView:", v6, v74, v75, v95, v107 - v75, *(_QWORD *)&v101);
LABEL_170:

}

- (double)leadingOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMinX(v4);
}

- (double)horizontalCenterOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMidX(v4);
}

- (double)trailingOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMaxX(v4);
}

- (double)topOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMinY(v4);
}

- (double)verticalCenterOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMidY(v4);
}

- (double)bottomOfView:(id)a3
{
  CGRect v4;

  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", a3);
  return CGRectGetMaxY(v4);
}

- (double)firstBaselineOfView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;

  v4 = a3;
  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", v4);
  v6 = v5;
  v10 = 0.0;
  -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](self, "_getFirstBaseline:lastBaseline:forView:withSize:", &v10, 0, v4, v7, v8);

  return v6 + v10;
}

- (double)lastBaselineOfView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;

  v4 = a3;
  -[PXViewLayoutHelper _orientedFrameOfView:](self, "_orientedFrameOfView:", v4);
  v6 = v5;
  v10 = 0.0;
  -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](self, "_getFirstBaseline:lastBaseline:forView:withSize:", 0, &v10, v4, v7, v8);

  return v6 + v10;
}

- (void)_setUpWithView:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  UICoordinateSpace *coordinateSpace;
  id v10;
  int64_t v11;
  double MidX;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v26;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  self->_containerBounds.origin.x = v5;
  self->_containerBounds.origin.y = v6;
  self->_containerBounds.size.width = v7;
  self->_containerBounds.size.height = v8;
  coordinateSpace = self->_coordinateSpace;
  self->_coordinateSpace = (UICoordinateSpace *)v4;
  v10 = v4;

  v11 = +[PXViewLayoutHelper userInterfaceLayoutDirection](PXViewLayoutHelper, "userInterfaceLayoutDirection");
  if (v11 == 1)
  {
    MidX = CGRectGetMidX(self->_containerBounds);
    CGAffineTransformMakeTranslation(&v26, -MidX, 0.0);
    v13 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v13;
    *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v26.tx;
    CGAffineTransformMakeScale(&t2, -1.0, 1.0);
    v14 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v26, &t1, &t2);
    v15 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v15;
    *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v26.tx;
    CGAffineTransformMakeTranslation(&v23, MidX, 0.0);
    v16 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v26, &t1, &v23);
    v17 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v17;
    v18 = *(_OWORD *)&v26.tx;
  }
  else
  {
    v19 = MEMORY[0x1E0C9BAA8];
    v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&self->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&self->_transform.c = v20;
    v18 = *(_OWORD *)(v19 + 32);
  }
  *(_OWORD *)&self->_transform.tx = v18;
  v21 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformInvert(&v26, &t1);
  v22 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_reverseTransform.a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_reverseTransform.c = v22;
  *(_OWORD *)&self->_reverseTransform.tx = *(_OWORD *)&v26.tx;
}

- (void)_tearDown
{
  UICoordinateSpace *coordinateSpace;

  coordinateSpace = self->_coordinateSpace;
  self->_coordinateSpace = 0;

}

- (CGRect)_orientedFrameOfView:(id)a3
{
  id v4;
  UICoordinateSpace *v5;
  UICoordinateSpace *coordinateSpace;
  uint64_t v7;
  __int128 v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  UICoordinateSpace *v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue();
  coordinateSpace = self->_coordinateSpace;

  if (v5 == coordinateSpace)
  {
    objc_msgSend(v4, "frame");
  }
  else
  {
    v20 = self->_coordinateSpace;
    objc_msgSend(v4, "bounds");
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](v20, "convertRect:fromCoordinateSpace:", v4);
  }
  v11 = *(_OWORD *)&self->_reverseTransform.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&self->_reverseTransform.a;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tx = *(_OWORD *)&self->_reverseTransform.tx;
  v22 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v21);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_setOrientedFrame:(CGRect)a3 forView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  __int128 v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UICoordinateSpace *v18;
  UICoordinateSpace *coordinateSpace;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  CGAffineTransform v25;
  uint64_t v26;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v25.c = v10;
  *(_OWORD *)&v25.tx = *(_OWORD *)&self->_transform.tx;
  v11 = x;
  *(CGFloat *)&v10 = y;
  v12 = width;
  v13 = height;
  v27 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v10 - 8), &v25);
  v14 = v27.origin.x;
  v15 = v27.origin.y;
  v16 = v27.size.width;
  v17 = v27.size.height;
  objc_msgSend(v9, "superview");
  v18 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue();
  coordinateSpace = self->_coordinateSpace;
  if (v18 != coordinateSpace)
  {
    if (v18)
    {
      -[UICoordinateSpace convertRect:toCoordinateSpace:](coordinateSpace, "convertRect:toCoordinateSpace:", v18, v14, v15, v16, v17);
      v14 = v20;
      v15 = v21;
      v16 = v22;
      v17 = v23;
    }
    else
    {
      PXAssertGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v25.a) = 138412290;
        *(_QWORD *)((char *)&v25.a + 4) = v9;
        _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "laying out a view without any superview: %@", (uint8_t *)&v25, 0xCu);
      }

    }
  }
  objc_msgSend(v9, "setFrame:", v14, v15, v16, v17);

}

- (void)_getFirstBaseline:(double *)a3 lastBaseline:(double *)a4 forView:(id)a5 withSize:(CGSize)a6
{
  double height;
  double width;
  id v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  double MinY;
  double v27;
  double v28;
  double MaxY;
  double v30;
  double v31;
  CGFloat rect;
  uint8_t buf[4];
  id v34;
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a6.height;
  width = a6.width;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v12 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_opt_class();
  rect = width;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PXAssertGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_error_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "cannot get baseline for %@ (unsupported class)", buf, 0xCu);
    }

    v13 = 0;
LABEL_11:
    v20 = height;
    v19 = v11;
    v18 = v12;
    if (!a3)
      goto LABEL_13;
    goto LABEL_12;
  }
  v14 = v10;
  objc_msgSend(v14, "attributedTitleForState:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v13)
  {
    objc_msgSend(v16, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v12;
  v19 = v11;
  v20 = height;
  objc_msgSend(v14, "contentRectForBounds:", v12, v11, width, height);
  objc_msgSend(v14, "titleRectForContentRect:");
  v12 = v21;
  v11 = v22;
  width = v23;
  height = v24;

  if (a3)
  {
LABEL_12:
    v36.origin.x = v12;
    v36.origin.y = v11;
    v36.size.width = width;
    v36.size.height = height;
    MinY = CGRectGetMinY(v36);
    objc_msgSend(v13, "ascender");
    v28 = MinY + v27;
    v37.origin.x = v18;
    v37.origin.y = v19;
    v37.size.width = rect;
    v37.size.height = v20;
    *a3 = v28 - CGRectGetMinY(v37);
  }
LABEL_13:
  if (a4)
  {
    v38.origin.x = v12;
    v38.origin.y = v11;
    v38.size.width = width;
    v38.size.height = height;
    MaxY = CGRectGetMaxY(v38);
    objc_msgSend(v13, "descender");
    v31 = v20 + MaxY + v30;
    v39.origin.x = v18;
    v39.origin.y = v19;
    v39.size.width = rect;
    v39.size.height = v20;
    *a4 = v31 - CGRectGetMaxY(v39);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _userInterfaceLayoutDirection = objc_msgSend(v2, "userInterfaceLayoutDirection");

  }
}

+ (int64_t)userInterfaceLayoutDirection
{
  return _userInterfaceLayoutDirection;
}

+ (void)setUserInterfaceLayoutDirection:(int64_t)a3
{
  _userInterfaceLayoutDirection = a3;
}

+ (void)performLayoutWithinView:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *))a4;
  if (performLayoutWithinView_usingBlock__reentryCount)
  {
    v6 = -[PXViewLayoutHelper _init]([PXViewLayoutHelper alloc], "_init");
  }
  else
  {
    if (performLayoutWithinView_usingBlock__onceToken != -1)
      dispatch_once(&performLayoutWithinView_usingBlock__onceToken, &__block_literal_global_32);
    v6 = (id)performLayoutWithinView_usingBlock__defaultHelper;
  }
  v7 = v6;
  ++performLayoutWithinView_usingBlock__reentryCount;
  objc_msgSend(v6, "_setUpWithView:", v8);
  v5[2](v5, v7);
  objc_msgSend(v7, "_tearDown");
  --performLayoutWithinView_usingBlock__reentryCount;

}

void __57__PXViewLayoutHelper_performLayoutWithinView_usingBlock___block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PXViewLayoutHelper _init]([PXViewLayoutHelper alloc], "_init");
  v1 = (void *)performLayoutWithinView_usingBlock__defaultHelper;
  performLayoutWithinView_usingBlock__defaultHelper = (uint64_t)v0;

}

@end
