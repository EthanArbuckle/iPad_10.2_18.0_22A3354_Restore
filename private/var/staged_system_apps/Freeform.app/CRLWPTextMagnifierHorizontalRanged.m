@implementation CRLWPTextMagnifierHorizontalRanged

- (CRLWPTextMagnifierHorizontalRanged)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierHorizontalRanged;
  return -[CRLWPTextMagnifierRanged initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 145.0, 59.0);
}

- (void)zoomUpAnimation
{
  CGFloat MaxY;
  _QWORD v4[5];
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  memset(&v8, 0, sizeof(v8));
  -[CRLWPTextMagnifierHorizontalRanged bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  v8 = v7;
  v5 = v7;
  -[CRLWPTextMagnifierHorizontalRanged setTransform:](self, "setTransform:", &v5);
  -[CRLWPTextMagnifierHorizontalRanged setAlpha:](self, "setAlpha:", 0.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F4D0;
  v4[3] = &unk_101231C50;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.1);
}

- (void)zoomDownAnimation
{
  double v3;
  CGFloat v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[CRLWPTextMagnifierRanged animationPoint](self, "animationPoint");
  self->super._magnificationPoint.x = v4;
  self->super._magnificationPoint.y = v3 + 8.0;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009F5D4;
  v6[3] = &unk_101231C50;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009F688;
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
  double v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierHorizontalRanged superview](self, "superview"));
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

  -[CRLWPTextMagnifierHorizontalRanged bounds](self, "bounds");
  v17 = v16 * 0.5;
  self->super._inPlace = v15 + v16 * 0.5 + -41.0 < 45.0;
  -[CRLWPTextMagnifierHorizontalRanged currentOffset](self, "currentOffset");
  v19 = v15 - v18;
  if (v19 >= v17)
    v20 = v19;
  else
    v20 = v17;
  -[CRLWPTextMagnifierHorizontalRanged setCenter:](self, "setCenter:", round(v13) + 0.5, round(v20) + 0.5);
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
  v14.super_class = (Class)CRLWPTextMagnifierHorizontalRanged;
  -[CRLWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](&v14, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v12, v6, v10, v9, x, y);
  if (y >= 0.0)
    v13 = y;
  else
    v13 = 0.0;
  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", round(x), round(v13));
  -[CRLWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6)
    -[CRLWPTextMagnifierHorizontalRanged zoomUpAnimation](self, "zoomUpAnimation");

}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    -[CRLWPTextMagnifierHorizontalRanged zoomDownAnimation](self, "zoomDownAnimation");
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
  return CFSTR("kb-magnifier-ranged-lo");
}

- (id)overlayImageName
{
  return CFSTR("kb-magnifier-ranged-hi");
}

- (id)maskImageName
{
  return CFSTR("kb-magnifier-ranged-mask");
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
  unsigned __int8 v13;

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

    if (v12)
      v13 = objc_msgSend(v12, "shouldHideCanvasLayerInMagnifier");
    else
      v13 = 1;

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  CGImage *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *i;
  double *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target", a3));
  if (v6)
  {
    v7 = -[CRLWPTextMagnifierRanged isMagnifierStopping](self, "isMagnifierStopping");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));

      v11 = objc_opt_class(CRLiOSCanvasViewController, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v13 = sub_100221D0C(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));

      -[CRLWPTextMagnifierHorizontalRanged frame](self, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierHorizontalRanged superview](self, "superview"));
      objc_msgSend(v75, "convertRect:fromView:", v24, v17, v19 + 3.0, v21, v23 + -3.0 + -18.0);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      CGContextSaveGState(a4);
      -[CRLWPTextMagnifierHorizontalRanged frame](self, "frame");
      v34 = v33;
      -[CRLWPTextMagnifierHorizontalRanged frame](self, "frame");
      v36 = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierHorizontalRanged maskImageName](self, "maskImageName"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v37));

      v74 = objc_retainAutorelease(v38);
      v39 = (CGImage *)objc_msgSend(v74, "CGImage");
      v81.origin.x = 0.0;
      v81.origin.y = 0.0;
      v81.size.width = v34;
      v81.size.height = v36;
      CGContextClipToMask(a4, v81, v39);
      if (v9)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backgroundColorForMagnifier"));
        v41 = v40;
        if (v40)
        {
          CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v40, "CGColor"));
          v82.origin.x = 0.0;
          v82.origin.y = 0.0;
          v82.size.width = v34;
          v82.size.height = v36;
          CGContextFillRect(a4, v82);
        }

      }
      CGContextScaleCTM(a4, 1.2, 1.2);
      -[CRLWPTextMagnifierHorizontalRanged currentOffset](self, "currentOffset");
      v43 = v42;
      v45 = objc_opt_class(CRLWPRep, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPTextMagnifierRanged target](self, "target"));
      v47 = sub_100221D0C(v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
      v49 = -v28 - v43;

      if (v48)
      {
        v51 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "textInputEditor"));
        v54 = sub_100221D0C(v51, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

        v71 = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "selection"));
        v72 = v14;
        v73 = v9;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "currentKnobTracker"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "knob"));
        v59 = objc_msgSend(v58, "tag");

        if (objc_msgSend(v56, "isVisual"))
        {
          if (v59 == (id)11)
            v60 = objc_msgSend(v56, "headCharIndex");
          else
            v60 = objc_msgSend(v56, "tailCharIndex");
        }
        else if (v59 == (id)11)
        {
          v60 = objc_msgSend(v56, "start");
        }
        else
        {
          v60 = objc_msgSend(v56, "end");
        }
        v61 = v60;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "columns"));
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        if (v63)
        {
          v64 = *(_QWORD *)v77;
          while (2)
          {
            for (i = 0; i != v63; i = (char *)i + 1)
            {
              if (*(_QWORD *)v77 != v64)
                objc_enumerationMutation(v62);
              v66 = (double *)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i), "lineFragmentForCharIndex:knobTag:selectionType:", v61, v59, objc_msgSend(v56, "type"));
              if (v66)
              {

                v14 = v72;
                v9 = v73;
                objc_msgSend(v48, "convertNaturalPointToUnscaledCanvas:", 0.0, v66[4]);
                objc_msgSend(v73, "convertUnscaledToBoundsPoint:");
                v68 = v67;
                v83.origin.x = v26;
                v83.origin.y = v28;
                v83.size.width = v30;
                v83.size.height = v32;
                v49 = CGRectGetHeight(v83) - v68 + -7.0;
                goto LABEL_25;
              }
            }
            v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
            if (v63)
              continue;
            break;
          }
        }

        v14 = v72;
        v9 = v73;
LABEL_25:

      }
      CGContextTranslateCTM(a4, -v26, v49);
      CGContextTranslateCTM(a4, v30 * -0.100000001, v32 * -0.100000001);
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "canvasLayer"));
      objc_msgSend(v70, "renderInContext:", a4);

      CGContextRestoreGState(a4);
    }
  }
}

@end
