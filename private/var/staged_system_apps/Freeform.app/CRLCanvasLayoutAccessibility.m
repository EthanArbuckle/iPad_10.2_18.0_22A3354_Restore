@implementation CRLCanvasLayoutAccessibility

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasLayoutAccessibility;
  -[CRLCanvasLayoutAccessibility dragBy:](&v11, "dragBy:");
  +[CRLCanvasRepAccessibility crlaxCurrentRepDragOffset](CRLCanvasRepAccessibility, "crlaxCurrentRepDragOffset");
  v9 = vabdd_f64(v6, x) <= 2.0;
  v8 = vabdd_f64(v7, y);
  v9 = v9 && v8 <= 2.0;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility _dragAnnouncementStringForDiff:](self, "_dragAnnouncementStringForDiff:", x, y));
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v10);
    UIAccessibilityPostNotification(CRLAccessibilityElementMovedNotification, 0);
    +[CRLCanvasRepAccessibility crlaxSetCurrentRepDragOffset:](CRLCanvasRepAccessibility, "crlaxSetCurrentRepDragOffset:", x, y);

  }
}

- (int64_t)crlaxDragAnnouncementType
{
  return 1;
}

- (id)_dragAnnouncementStringForDiff:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  if ((id)-[CRLCanvasLayoutAccessibility crlaxDragAnnouncementType](self, "crlaxDragAnnouncementType") == (id)1)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility _longDragAnnouncementStringForDiff:](self, "_longDragAnnouncementStringForDiff:", x, y));
  else
    v6 = 0;
  return v6;
}

- (id)_longDragAnnouncementStringForDiff:(CGPoint)a3
{
  double y;
  double v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;

  y = a3.y;
  v4 = fabs(a3.x);
  if (a3.x == 0.0)
  {
    v8 = 0;
  }
  else
  {
    if (a3.x > 0.0)
      v5 = CFSTR("moving.object.right");
    else
      v5 = CFSTR("moving.object.left");
    v6 = CRLAccessibilityStringsDictKey(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, *(_QWORD *)&v4));

  }
  if (y == 0.0)
  {
    v11 = 0;
    v9 = fabs(y);
  }
  else
  {
    v9 = fabs(y);
    if (y > 0.0)
      v10 = CFSTR("moving.object.down");
    else
      v10 = CFSTR("moving.object.up");
    v12 = CRLAccessibilityStringsDictKey(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, *(_QWORD *)&v9));

  }
  if (v4 <= v9)
    v14 = v11;
  else
    v14 = v8;
  if (v4 <= v9)
    v15 = v8;
  else
    v15 = v11;
  v16 = v11;
  v17 = v8;
  v24 = __CRLAccessibilityStringForVariables(1, v14, v18, v19, v20, v21, v22, v23, (uint64_t)v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  return v25;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasLayout");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLCanvasLayoutAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLCanvasLayoutGeometryAccessibility)crlaxInspectorGeometry
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inspectorGeometry"));

  objc_opt_class(CRLCanvasLayoutGeometryAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLCanvasLayoutGeometryAccessibility *)v8;
}

- (CRLWPStorageAccessibility)crlaxStorage
{
  return 0;
}

- (BOOL)crlaxIsSelectable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isSelectable");

  return v3;
}

- (BOOL)crlaxIsDraggable
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isDraggable");

  return v3;
}

- (CRLCanvasRepAccessibility)crlaxRepForLayout
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility _crlaxCanvas](self, "_crlaxCanvas"));
  *(_QWORD *)&v5 = objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxInteractiveCanvasController", v5));
  v9 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxRepForLayout:", self));
  return (CRLCanvasRepAccessibility *)v11;
}

- (NSString)crlaxDescriptionForConnections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxRepForLayout](self, "crlaxRepForLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxDescriptionForConnections"));

  if (!objc_msgSend(v4, "length"))
  {
    v17 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));

    objc_opt_class(CRLBoardItemAccessibility, v7);
    v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v17);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v17)
      abort();
    v11 = (void *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTypeDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Off-screen %@"), 0, 0));

    v15 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v12));
    v4 = (void *)v15;
  }
  return (NSString *)v4;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasLayoutAccessibility;
  -[CRLCanvasLayoutAccessibility invalidate](&v15, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxStorage](self, "crlaxStorage"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility _crlaxCanvas](self, "_crlaxCanvas"));
    *(_QWORD *)&v6 = objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v5).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxInteractiveCanvasController", v6));
    v10 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v9, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10043787C;
      v12[3] = &unk_10122D3D8;
      v13 = v3;
      v14 = v11;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
        abort();

    }
  }

}

- (id)crlaxCommandForAccessibilityIncrementDecrement:(BOOL)a3 forKnobTag:(unint64_t)a4 inSmartPathSource:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  objc_class *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  objc_class *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  objc_class *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  unint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v88;
  double v89;
  double v90;
  double v91;
  char *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;

  v6 = a3;
  v8 = a5;
  v102 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "info"));

  objc_opt_class(_TtC8Freeform12CRLShapeItem, v11);
  v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v102);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (v102)
    goto LABEL_88;
  v15 = (void *)v14;

  v101 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));

  objc_opt_class(_TtC8Freeform12CRLImageItem, v18);
  v20 = __CRLAccessibilityCastAsClass(v19, (uint64_t)v17, 1, &v101);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (v101)
    goto LABEL_88;
  v22 = (void *)v21;

  if ((objc_opt_respondsToSelector(self, "maskLayout") & 1) == 0)
  {
    v24 = 0;
    goto LABEL_11;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "maskLayout"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "maskInfo"));
  v100 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pathSource"));
  objc_opt_class(CRLPathSource, v27);
  v29 = __CRLAccessibilityCastAsClassAndProtocol(v28, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v26, 1, &v100);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (v100)
    goto LABEL_88;
  v31 = (void *)v30;

  if (!v22 || !v25)
  {

    if (!v15)
      goto LABEL_21;
    goto LABEL_12;
  }
  v32 = objc_msgSend(v31, "crlaxIsAdjustableForKnobTag:", a4);

  if (!v32)
  {
LABEL_11:
    if (!v15)
      goto LABEL_21;
LABEL_12:
    v33 = 0;
LABEL_13:
    if (objc_msgSend(v8, "crlaxIsAdjustableForKnobTag:", a4))
    {
      objc_opt_class(CRLCalloutPathSource, v34);
      if ((objc_opt_isKindOfClass(v8, v35) & 1) != 0)
      {
        v99 = 0;
        v37 = v8;
        objc_opt_class(CRLCalloutPathSource, v38);
        v40 = __CRLAccessibilityCastAsClass(v39, (uint64_t)v37, 1, &v99);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (!v99)
        {
          v42 = (void *)v41;

          if (a4 == 14)
          {
            if (v6)
            {
              objc_msgSend(v42, "maxTailSize");
              v71 = v70;
              objc_msgSend(v42, "tailSize");
              v73 = v72 + 1.0;
              if (v71 < v73)
                v73 = v71;
            }
            else
            {
              objc_msgSend(v42, "minTailSize");
              v83 = v82;
              objc_msgSend(v42, "tailSize");
              v73 = v84 + -1.0;
              if (v83 >= v73)
                v73 = v83;
            }
            if (v33)
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingCalloutTailSize:withPathSource:imageItem:maskLayout:", v37, v22, v24, v73));
            else
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCalloutTailSize:withPathSource:shapeItem:", v37, v15, v73));
            goto LABEL_70;
          }
          if (a4 == 13)
          {
            if (v6)
            {
              objc_msgSend(v42, "maxCornerRadius");
              v44 = v43;
              objc_msgSend(v42, "cornerRadius");
              v46 = v45 + 1.0;
            }
            else
            {
              objc_msgSend(v42, "minCornerRadius");
              v44 = v74;
              objc_msgSend(v42, "cornerRadius");
              v76 = floor(v75 + -1.0);
              if (v44 < v76)
                v44 = v76;
              objc_msgSend(v42, "maxCornerRadius");
              v46 = floor(v77 + -1.0);
            }
            if (v44 < v46)
              v46 = v44;
            if (v33)
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingCalloutCornerRadius:withPathSource:imageItem:maskLayout:", v37, v22, v24, v46));
            else
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCalloutCornerRadius:withPathSource:shapeItem:", v37, v15, v46));
LABEL_70:
            v69 = (void *)v78;
            goto LABEL_71;
          }
LABEL_40:
          v69 = 0;
LABEL_71:

          goto LABEL_72;
        }
        goto LABEL_88;
      }
      objc_opt_class(CRLScalarPathSource, v36);
      if ((objc_opt_isKindOfClass(v8, v48) & 1) != 0)
      {
        v98 = 0;
        v50 = v8;
        objc_opt_class(CRLScalarPathSource, v51);
        v53 = __CRLAccessibilityCastAsClass(v52, (uint64_t)v50, 1, &v98);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (!v98)
        {
          v42 = (void *)v54;

          v55 = objc_msgSend(v42, "type");
          if (v55 == (id)1)
          {
            if (v6)
            {
              v79 = +[CRLScalarPathSource crlaxMaximumAllowedPolygonPointsDuringAdjustment](CRLScalarPathSource, "crlaxMaximumAllowedPolygonPointsDuringAdjustment");
              objc_msgSend(v42, "scalar");
              v81 = v80 + 1.0;
              if (v81 > (double)v79)
                v81 = (double)v79;
            }
            else
            {
              objc_msgSend(v42, "scalar");
              v81 = fmax(v86 + -1.0, 3.0);
            }
            if (v33)
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingNumberOfSides:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingNumberOfSides:withPathSource:imageItem:maskLayout:", v50, v22, v24, v81));
            else
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingNumberOfSides:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingNumberOfSides:withPathSource:shapeItem:", v50, v15, v81));
            goto LABEL_70;
          }
          if (!v55)
          {
            if (v6)
            {
              objc_msgSend(v42, "maxCornerRadius");
              v57 = v56;
              objc_msgSend(v42, "scalar");
              v59 = v58 + 1.0;
              if (v57 < v59)
                v59 = v57;
            }
            else
            {
              objc_msgSend(v42, "scalar");
              v59 = fmax(v85 + -1.0, 0.0);
            }
            if (v33)
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCornerRadius:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingCornerRadius:withPathSource:imageItem:maskLayout:", v50, v22, v24, v59));
            else
              v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingCornerRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingCornerRadius:withPathSource:shapeItem:", v50, v15, v59));
            goto LABEL_70;
          }
          goto LABEL_40;
        }
LABEL_88:
        abort();
      }
      objc_opt_class(CRLPointPathSource, v49);
      if ((objc_opt_isKindOfClass(v8, v60) & 1) != 0)
      {
        v97 = 0;
        v61 = v8;
        objc_opt_class(CRLPointPathSource, v62);
        v64 = __CRLAccessibilityCastAsClass(v63, (uint64_t)v61, 1, &v97);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (!v97)
        {
          v42 = (void *)v65;

          if (objc_msgSend(v42, "type") == (id)100)
          {
            if (a4 == 13)
            {
              if (v6)
              {
                objc_msgSend(v42, "maxStarRadius");
                v89 = v88;
                objc_msgSend(v42, "starRadius");
                v91 = v90 + 0.05;
                if (v89 < v91)
                  v91 = v89;
              }
              else
              {
                objc_msgSend(v42, "minStarRadius");
                v95 = v94;
                objc_msgSend(v42, "starRadius");
                v91 = v96 + -0.05;
                if (v95 >= v91)
                  v91 = v95;
              }
              if (v33)
                v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarRadius:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingStarRadius:withPathSource:imageItem:maskLayout:", v61, v22, v24, v91));
              else
                v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarRadius:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingStarRadius:withPathSource:shapeItem:", v61, v15, v91));
              goto LABEL_70;
            }
            if (a4 == 12)
            {
              if (v6)
              {
                v66 = (char *)objc_msgSend(v42, "maxStarPoints");
                v67 = (char *)objc_msgSend(v42, "starPoints");
                if (v66 >= v67 + 1)
                  v68 = v67 + 1;
                else
                  v68 = v66;
              }
              else
              {
                v92 = (char *)objc_msgSend(v42, "minStarPoints");
                v68 = (char *)objc_msgSend(v42, "starPoints") - 1;
                if (v92 > v68)
                  v68 = v92;
              }
              v93 = (double)(unint64_t)v68;
              if (v33)
                v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarPoints:withPathSource:imageItem:maskLayout:](CRLPathSourceCommandHelper, "commandForSettingStarPoints:withPathSource:imageItem:maskLayout:", v61, v22, v24, v93));
              else
                v78 = objc_claimAutoreleasedReturnValue(+[CRLPathSourceCommandHelper commandForSettingStarPoints:withPathSource:shapeItem:](CRLPathSourceCommandHelper, "commandForSettingStarPoints:withPathSource:shapeItem:", v61, v15, v93));
              goto LABEL_70;
            }
          }
          goto LABEL_40;
        }
        goto LABEL_88;
      }
    }
    v69 = 0;
LABEL_72:
    v47 = v69;
    goto LABEL_73;
  }
  if (v24)
  {
    v33 = 1;
    goto LABEL_13;
  }
LABEL_21:
  v47 = 0;
LABEL_73:

  return v47;
}

- (id)_crlaxCanvas
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v11;

  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));

  objc_opt_class(CRLCanvasAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v11);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v11)
    abort();
  v9 = (void *)v8;

  return v9;
}

@end
