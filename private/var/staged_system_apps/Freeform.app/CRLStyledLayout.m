@implementation CRLStyledLayout

- (void)setSuppressesShadowsAndReflections:(BOOL)a3
{
  void *v4;
  id v5;

  if (BYTE2(self->mDynamicOpacity) != a3)
  {
    BYTE2(self->mDynamicOpacity) = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
    objc_msgSend(v4, "canvasInvalidatedForLayout:", self);

  }
}

- (double)scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:(CGAffineTransform *)a3 withStartingPathSource:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unsigned int v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v50;
  float v51;
  float v52;
  float v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  unsigned int v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSString *v89;
  void *v90;
  NSString *v91;
  void *v92;
  NSString *v94;
  NSString *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double MaxY;
  double v103;
  double MinY;
  CGFloat v105;
  void *v106;
  double log;
  NSObject *loga;
  _BYTE v109[54];
  CGSize v110;
  CGSize v111;
  CGSize v112;
  CGSize v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  v6 = a4;
  *(_QWORD *)&v8 = objc_opt_class(CRLCanvasLayout, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent", v8));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    objc_msgSend(v13, "maximumFrameSizeForChild:", self);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = 1.79769313e308;
    v17 = 1.79769313e308;
  }
  if (v15 >= 1.79769313e308)
  {
    v18 = 1.0;
    if (v17 >= 1.79769313e308)
      goto LABEL_78;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout stroke](self, "stroke"));
  v20 = objc_msgSend(v6, "copy");
  objc_msgSend(v20, "naturalSize");
  v97 = v22;
  v98 = v21;
  objc_msgSend(v20, "naturalSize");
  v24 = v23;
  v26 = v25;
  v27 = 0;
  v100 = v15;
  v99 = v17;
  while (1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bezierPath"));
    v29 = *(_OWORD *)&a3->c;
    *(_OWORD *)v109 = *(_OWORD *)&a3->a;
    *(_OWORD *)&v109[16] = v29;
    *(_OWORD *)&v109[32] = *(_OWORD *)&a3->tx;
    if (!CGAffineTransformIsIdentity((CGAffineTransform *)v109))
    {
      v30 = *(_OWORD *)&a3->c;
      *(_OWORD *)v109 = *(_OWORD *)&a3->a;
      *(_OWORD *)&v109[16] = v30;
      *(_OWORD *)&v109[32] = *(_OWORD *)&a3->tx;
      objc_msgSend(v28, "transformUsingAffineTransform:", v109);
    }
    objc_msgSend(v28, "boundsIncludingCRLStroke:", v19);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v39 = sub_1000603B8(v35, v37, v15);
    if (!v27 && v39 <= 0.0 && v40 <= 0.0)
      break;
    if (!v27)
    {
      objc_msgSend(v28, "bounds", v39);
      x = v114.origin.x;
      y = v114.origin.y;
      width = v114.size.width;
      height = v114.size.height;
      v105 = v114.size.height;
      MinY = CGRectGetMinY(v114);
      v115.origin.x = v32;
      v115.origin.y = v34;
      v115.size.width = v36;
      v115.size.height = v38;
      v103 = CGRectGetMinY(v115);
      v116.origin.x = x;
      v116.origin.y = y;
      v116.size.width = width;
      v116.size.height = height;
      MinX = CGRectGetMinX(v116);
      v117.origin.x = v32;
      v117.origin.y = v34;
      v117.size.width = v36;
      v117.size.height = v38;
      log = MinX - CGRectGetMinX(v117);
      v118.origin.x = v32;
      v118.origin.y = v34;
      v118.size.width = v36;
      v118.size.height = v38;
      MaxY = CGRectGetMaxY(v118);
      v119.origin.x = x;
      v119.origin.y = y;
      v119.size.width = width;
      v119.size.height = v105;
      v101 = CGRectGetMaxY(v119);
      v120.origin.x = v32;
      v120.origin.y = v34;
      v120.size.width = v36;
      v120.size.height = v38;
      MaxX = CGRectGetMaxX(v120);
      v121.origin.x = x;
      v121.origin.y = y;
      v121.size.width = width;
      v15 = v100;
      v121.size.height = v105;
      v64 = MaxX - CGRectGetMaxX(v121);
      v17 = v99;
      sub_1000603B8(v100, v99, 0.01);
      sub_10005FDDC();
      v66 = v65;
      v68 = v67 - (log + v64);
      -[CRLCanvasLayout minimumSize](self, "minimumSize");
      if (v68 < v69
        || (v70 = v66 - (MinY - v103 + MaxY - v101), -[CRLCanvasLayout minimumSize](self, "minimumSize"), v70 < v71))
      {
        -[CRLCanvasLayout minimumSize](self, "minimumSize");
        objc_msgSend(v20, "scaleToNaturalSize:");
        objc_msgSend(v20, "naturalSize");
        v24 = v80;
        v26 = v81;
        break;
      }
      v72 = objc_msgSend(v28, "isLineSegment");
      objc_msgSend(v20, "naturalSize");
      if (v72)
      {
LABEL_52:
        v57 = sub_100062F08(v73, v74, v68, v70);
      }
      else
      {
        if (v73 == 0.0 || (objc_msgSend(v20, "naturalSize"), v75 == 0.0))
        {
          objc_msgSend(v20, "naturalSize");
          goto LABEL_52;
        }
        objc_msgSend(v20, "naturalSize");
        v57 = sub_100062E78(0, v78, v79, v68, v70);
      }
LABEL_53:
      objc_msgSend(v20, "scaleToNaturalSize:", v57);
      objc_msgSend(v20, "naturalSize");
      v24 = v76;
      v26 = v77;
      goto LABEL_54;
    }
    v41 = v39 > 0.0 || v39 <= -1.0;
    if (!v41 && v40 <= 0.0 || v39 <= 0.0 && v40 <= 0.0 && v40 > -1.0)
      break;
    if (v27 <= 3)
    {
      v44 = v40 <= 0.0 && v39 <= 0.0 || v15 <= 0.5 || v17 <= 0.5;
      v45 = v15;
      v46 = v17;
      if (!v44)
        v45 = sub_1000603B8(v15, v17, 0.5);
      v47 = v45 / v36;
      v48 = v46 / v38;
      if (v48 >= 1.0 || v47 <= 1.0)
        v50 = v47;
      else
        v50 = v48;
      if (v47 < 1.0 && v48 > 1.0)
        v50 = v47;
      else
        v47 = v48;
      v51 = v50;
      v52 = v47;
      v53 = fminf(v51, v52);
      if (v53 == 0.0)
        v54 = 0.001;
      else
        v54 = v53;
      objc_msgSend(v20, "naturalSize");
      v57 = sub_1000603DC(v55, v56, v54);
      goto LABEL_53;
    }
LABEL_54:

    if (++v27 == 5)
      goto LABEL_59;
  }

LABEL_59:
  v18 = 1.0;
  if (v98 != v24 || v97 != v26)
  {
    v82 = v24 / v98;
    v83 = v26 / v97;
    v18 = v26 / v97;
    if (v24 / v98 != 0.0)
    {
      v18 = v24 / v98;
      if (v83 != 0.0)
      {
        if (v82 >= v83)
          v18 = v26 / v97;
        else
          v18 = v24 / v98;
      }
    }
    if (v18 >= 0.0 && v18 <= 0.0)
    {
      v84 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v82);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DCA0);
      v85 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        loga = v85;
        v112.width = v98;
        v112.height = v97;
        v94 = NSStringFromCGSize(v112);
        v106 = (void *)objc_claimAutoreleasedReturnValue(v94);
        v113.width = v24;
        v113.height = v26;
        v95 = NSStringFromCGSize(v113);
        v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
        *(_DWORD *)v109 = 67110402;
        *(_DWORD *)&v109[4] = v84;
        *(_WORD *)&v109[8] = 2082;
        *(_QWORD *)&v109[10] = "-[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:]";
        *(_WORD *)&v109[18] = 2082;
        *(_QWORD *)&v109[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledLayout.m";
        *(_WORD *)&v109[28] = 1024;
        *(_DWORD *)&v109[30] = 187;
        *(_WORD *)&v109[34] = 2112;
        *(_QWORD *)&v109[36] = v106;
        *(_WORD *)&v109[44] = 2112;
        *(_QWORD *)&v109[46] = v96;
        _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unclamping due to sad math. original natural size %@ proposed natural size %@", v109, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DCC0);
      v86 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v86, v84);
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledLayout scaleToApplyToPathSourceNaturalSizeApplyingLayoutTransform:withStartingPathSource:]"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledLayout.m"));
      v110.width = v98;
      v110.height = v97;
      v89 = NSStringFromCGSize(v110);
      v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
      v111.width = v24;
      v111.height = v26;
      v91 = NSStringFromCGSize(v111);
      v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v87, v88, 187, 0, "Unclamping due to sad math. original natural size %@ proposed natural size %@", v90, v92);

      v18 = 1.0;
    }
  }

LABEL_78:
  return v18;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[CRLCanvasAbstractLayout alignmentFrame](self, "alignmentFrame");
  v8 = sub_100063150(v4, v5, v6, v7, a3);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));

  -[CRLCanvasAbstractLayout alignmentFrame](self, "alignmentFrame");
  x = v4;
  y = v6;
  width = v8;
  height = v10;
  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self, "parent"));
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "transformInRoot");
    else
      memset(&v18, 0, sizeof(v18));
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v20 = CGRectApplyAffineTransform(v19, &v18);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;

  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  CGAffineTransform v5;
  CGRect v6;

  -[CRLCanvasAbstractLayout alignmentFrame](self, "alignmentFrame");
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v5.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)&a3->tx;
  return CGRectApplyAffineTransform(v6, &v5);
}

- (CGRect)frameForCullingWithBaseFrame:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  double height;
  double width;
  double y;
  double x;
  __int128 v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _OWORD v30[3];
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)CRLStyledLayout;
  v9 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v9;
  v30[2] = *(_OWORD *)&a4->tx;
  -[CRLCanvasLayout frameForCullingWithBaseFrame:additionalTransform:](&v31, "frameForCullingWithBaseFrame:additionalTransform:", v30, a3.origin.x, y);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectIsEmpty(v32))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvas"));
    if (objc_msgSend(v19, "suppressesShadowsAndReflections"))
    {

    }
    else
    {
      v20 = -[CRLStyledLayout suppressesShadowsAndReflections](self, "suppressesShadowsAndReflections");

      if ((v20 & 1) != 0)
        goto LABEL_6;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledLayout styledInfo](self, "styledInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "shadow"));

      if (v18 && objc_msgSend(v18, "isEnabled"))
      {
        objc_msgSend(v18, "shadowBoundsForRect:", x, y, width, height);
        v36.origin.x = v26;
        v36.origin.y = v27;
        v36.size.width = v28;
        v36.size.height = v29;
        v33.origin.x = v11;
        v33.origin.y = v13;
        v33.size.width = v15;
        v33.size.height = v17;
        v34 = CGRectUnion(v33, v36);
        v11 = v34.origin.x;
        v13 = v34.origin.y;
        v15 = v34.size.width;
        v17 = v34.size.height;
      }
    }

  }
LABEL_6:
  v21 = v11;
  v22 = v13;
  v23 = v15;
  v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)dynamicOpacityChangeDidBegin
{
  BYTE2(self->super._dynamicInfoGeometry) = 1;
}

- (void)dynamicOpacityUpdateToValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  *(double *)(&self->mIsUpdatingOpacity + 2) = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvas"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repForLayout:", self));
  objc_msgSend(v6, "processChangedProperty:", 17);

}

- (void)dynamicOpacityChangeDidEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  BYTE2(self->super._dynamicInfoGeometry) = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", self));
  objc_msgSend(v5, "processChangedProperty:", 17);

}

- (double)opacity
{
  if (BYTE2(self->super._dynamicInfoGeometry))
    return *(double *)(&self->mIsUpdatingOpacity + 2);
  else
    return 1.0;
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)supportsFlipping
{
  return 1;
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)suppressesShadowsAndReflections
{
  return BYTE2(self->mDynamicOpacity);
}

@end
