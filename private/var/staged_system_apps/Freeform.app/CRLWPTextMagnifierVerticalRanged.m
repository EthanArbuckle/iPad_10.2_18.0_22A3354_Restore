@implementation CRLWPTextMagnifierVerticalRanged

- (CRLWPTextMagnifierVerticalRanged)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierVerticalRanged;
  return -[CRLWPTextMagnifierRanged initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 65.0, 150.0);
}

- (void)zoomLeftAnimation
{
  CGFloat MaxX;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  -[CRLWPTextMagnifierVerticalRanged bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v5 = v7;
  -[CRLWPTextMagnifierVerticalRanged setTransform:](self, "setTransform:", &v5);
  -[CRLWPTextMagnifierVerticalRanged setAlpha:](self, "setAlpha:", 0.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007DA60;
  v4[3] = &unk_101231C50;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.1);
}

- (void)zoomRightAnimation
{
  double v3;
  CGFloat v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[CRLWPTextMagnifierRanged animationPoint](self, "animationPoint");
  self->super._magnificationPoint.x = v3 + -8.0;
  self->super._magnificationPoint.y = v4;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007DB64;
  v6[3] = &unk_101231C50;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007DC18;
  v5[3] = &unk_101231C78;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.2);
}

- (double)currentOffset
{
  double result;
  double v3;

  result = 19.0;
  if (!self->super._inPlace)
  {
    -[CRLWPTextMagnifierRanged offset](self, "offset", 19.0);
    return v3 + 41.0 + 7.0;
  }
  return result;
}

- (void)updateFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierVerticalRanged superview](self, "superview"));
  -[CRLWPTextMagnifierRanged magnificationPoint](self, "magnificationPoint");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
  objc_msgSend(v3, "convertPoint:fromView:", v11, v5, v7);
  v13 = v12;
  v15 = v14;

  -[CRLWPTextMagnifierVerticalRanged bounds](self, "bounds");
  v17 = v16 * 0.5;
  self->super._inPlace = v13 + v16 * 0.5 + -41.0 < 45.0;
  -[CRLWPTextMagnifierVerticalRanged currentOffset](self, "currentOffset");
  v19 = v13 - v18;
  if (v19 < v17)
    v19 = v17;
  -[CRLWPTextMagnifierVerticalRanged setCenter:](self, "setCenter:", round(v19) + -0.5, round(v15) + 0.5);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  double v13;
  objc_super v14;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLWPTextMagnifierVerticalRanged;
  -[CRLWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](&v14, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v12, v6, v10, v9, x, y);
  v13 = 0.0;
  if (x >= 0.0)
    v13 = x;
  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", round(v13), round(y));
  -[CRLWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
    -[CRLWPTextMagnifierVerticalRanged zoomLeftAnimation](self, "zoomLeftAnimation");

}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[CRLWPTextMagnifierVerticalRanged zoomRightAnimation](self, "zoomRightAnimation");
  }
  else
  {
    -[CRLWPTextMagnifierRanged remove](self, "remove");
    -[CRLWPTextMagnifierRanged setTarget:](self, "setTarget:", 0);
  }
  self->super._magnificationPoint = (CGPoint)xmmword_100EEC428;
  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", CGPointZero.x, CGPointZero.y);
}

- (id)underlayImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-lo");
}

- (id)overlayImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-hi");
}

- (id)maskImageName
{
  return CFSTR("kb-magnifier-vertical-ranged-mask");
}

- (BOOL)shouldHideCanvasLayer
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  v5 = objc_opt_class(CRLInteractiveCanvasController, v4);
  v6 = sub_100221D0C(v5, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v9 = objc_opt_class(CRLiOSCanvasViewController, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
    v11 = sub_100221D0C(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  return 1;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  void *v32;
  CGImage *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *i;
  void *v59;
  double *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  CGRect v88;
  CGRect v89;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target", a3));
  if (v6)
  {
    v7 = -[CRLWPTextMagnifierRanged isMagnifierStopping](self, "isMagnifierStopping");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));

      v74 = v11;
      -[CRLWPTextMagnifierVerticalRanged frame](self, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierVerticalRanged superview](self, "superview"));
      objc_msgSend(v11, "convertRect:fromView:", v20, v13 + -3.0, v15, v17 + -3.0 + -18.0, v19);
      v75 = v22;
      v76 = v21;
      v24 = v23;
      v26 = v25;

      CGContextSaveGState(a4);
      -[CRLWPTextMagnifierVerticalRanged frame](self, "frame");
      v28 = v27;
      -[CRLWPTextMagnifierVerticalRanged frame](self, "frame");
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierVerticalRanged maskImageName](self, "maskImageName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v31));

      v73 = objc_retainAutorelease(v32);
      v33 = (CGImage *)objc_msgSend(v73, "CGImage");
      v88.origin.x = 0.0;
      v88.origin.y = -5.0;
      v88.size.width = v28;
      v88.size.height = v30;
      CGContextClipToMask(a4, v88, v33);
      CGContextScaleCTM(a4, 1.2, 1.2);
      -[CRLWPTextMagnifierVerticalRanged currentOffset](self, "currentOffset");
      v35 = v34;
      v37 = objc_opt_class(CRLWPRep, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
      v39 = sub_100221D0C(v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v41 = v24 + v35;

      if (v40)
      {
        v43 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "textInputEditor"));
        v46 = sub_100221D0C(v43, v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

        v71 = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "selection"));
        v72 = v9;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "currentKnobTracker"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "knob"));
        v51 = objc_msgSend(v50, "tag");

        if (v51 == (id)11)
          v52 = objc_msgSend(v48, "start");
        else
          v52 = objc_msgSend(v48, "end");
        v54 = v52;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "columns"));
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v84;
          v70 = v40;
          while (2)
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(_QWORD *)v84 != v57)
                objc_enumerationMutation(v55);
              v59 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
              v60 = (double *)objc_msgSend(v59, "lineFragmentForCharIndex:knobTag:selectionType:", v54, v51, objc_msgSend(v48, "type"));
              if (v60)
              {
                if (v59)
                {
                  v9 = v72;
                  v53 = v74;
                  v40 = v70;
                  objc_msgSend(v59, "transformFromWP");
                  v61 = v77;
                  v62 = v78;
                  v63 = v79;
                  v64 = v80;
                  v66 = v81;
                  v65 = v82;
                }
                else
                {
                  v65 = 0.0;
                  v66 = 0.0;
                  v64 = 0.0;
                  v63 = 0.0;
                  v62 = 0.0;
                  v61 = 0.0;
                  v9 = v72;
                  v53 = v74;
                  v40 = v70;
                }

                objc_msgSend(v40, "convertNaturalPointToUnscaledCanvas:", v66 + v63 * v60[4] + v61 * 0.0, v65 + v64 * v60[4] + v62 * 0.0);
                objc_msgSend(v9, "convertUnscaledToBoundsPoint:");
                v68 = v67;
                v89.origin.x = v24;
                v89.origin.y = v26;
                v89.size.height = v75;
                v89.size.width = v76;
                v41 = CGRectGetWidth(v89) - v68 + -5.0;
                goto LABEL_21;
              }
            }
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
            v40 = v70;
            if (v56)
              continue;
            break;
          }
        }

        v9 = v72;
        v53 = v74;
LABEL_21:

      }
      else
      {
        v53 = v74;
      }
      CGContextTranslateCTM(a4, v41, -v26);
      CGContextTranslateCTM(a4, v75 * -0.100000001, v76 * -0.100000001);
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "canvasLayer"));
      objc_msgSend(v69, "renderInContext:", a4);

      CGContextRestoreGState(a4);
    }
  }
}

@end
