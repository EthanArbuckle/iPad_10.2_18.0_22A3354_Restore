@implementation CRLiOSRepRotateGestureRecognizer

- (CRLiOSRepRotateGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSRepRotateGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  v5 = -[CRLiOSRepRotateGestureRecognizer initWithTarget:action:](&v10, "initWithTarget:action:", 0, 0);
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B340);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2FD8C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B360);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateGestureRecognizer initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 56, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->mICC, v4);
    v5->mAdditionalRotateInRadians = 0.0;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLiOSRepRotateGestureRecognizer p_cancelDelayedRecognition](self, "p_cancelDelayedRecognition");
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer dealloc](&v3, "dealloc");
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  -[CRLiOSRepRotateGestureRecognizer state](self, "state");
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer setState:](&v5, "setState:", a3);
}

- (void)reset
{
  UITouch *mTouch1;
  UITouch *mTouch2;
  CRLCanvasRep *mRep;
  CGPoint v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer reset](&v7, "reset");
  -[CRLiOSRepRotateGestureRecognizer p_cancelDelayedRecognition](self, "p_cancelDelayedRecognition");
  mTouch1 = self->mTouch1;
  self->mTouch1 = 0;

  mTouch2 = self->mTouch2;
  self->mTouch2 = 0;

  mRep = self->mRep;
  self->mRep = 0;

  v6 = CGPointZero;
  self->mOriginalUnscaledPoint1 = CGPointZero;
  self->mOriginalUnscaledPoint2 = v6;
  self->mMovingTouchIndex = 0;
  self->mLastAngle = 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int *v13;
  void *i;
  void *v15;
  UITouch **v16;
  uint64_t v17;
  int *v18;
  id *v19;
  UITouch **p_mTouch2;
  UITouch *mTouch2;
  _QWORD *v22;
  UITouch *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CRLCanvasRep *v28;
  CRLCanvasRep *v29;
  id v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  UITouch *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  CRLCanvasRep *mRep;
  CGFloat v45;
  CGFloat v46;
  CRLiOSRepRotateGestureRecognizer *v47;
  double v48;
  id v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CRLCanvasRep *v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  UITouch *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  objc_super v78;
  _BYTE v79[128];

  v6 = a3;
  v78.receiver = self;
  v78.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  v73 = a4;
  -[CRLiOSRepRotateGestureRecognizer touchesBegan:withEvent:](&v78, "touchesBegan:withEvent:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asUIKitHost"));

  if (-[CRLiOSRepRotateGestureRecognizer state](self, "state")
    || !objc_msgSend(WeakRetained, "currentlyScrolling"))
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v70 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    if (!v10)
      goto LABEL_37;
    v11 = v10;
    v12 = *(_QWORD *)v75;
    v13 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
    v72 = v9;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v75 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
        if (!-[CRLiOSRepRotateGestureRecognizer state](self, "state", v70))
        {
          if ((unint64_t)-[CRLiOSRepRotateGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 3)
          {
            -[CRLiOSRepRotateGestureRecognizer p_cancelDelayedRecognition](self, "p_cancelDelayedRecognition");
            -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5);
            continue;
          }
          v18 = v13;
          v19 = (id *)((char *)&self->super.super.isa + v13[260]);
          if (*v19)
          {
            p_mTouch2 = &self->mTouch2;
            if (self->mTouch2)
            {
              -[CRLiOSRepRotateGestureRecognizer p_cancelDelayedRecognition](self, "p_cancelDelayedRecognition");
              goto LABEL_31;
            }
            objc_storeStrong((id *)&self->mTouch2, v15);
            if (-[CRLiOSRepRotateGestureRecognizer p_touchIsInRep:](self, "p_touchIsInRep:", *p_mTouch2))
            {
              v34 = *p_mTouch2;
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
              -[UITouch locationInView:](v34, "locationInView:", v35);
              v37 = v36;
              v39 = v38;

              objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v37, v39);
              self->mOriginalUnscaledPoint2.x = v40;
              self->mOriginalUnscaledPoint2.y = v41;
              self->mLastProcessedTouchUnscaledPoint2 = self->mOriginalUnscaledPoint1;
              objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mOriginalUnscaledPoint1.x, self->mOriginalUnscaledPoint1.y);
              self->mOriginalBoundsDistance = sub_10006108C(v42, v43, v37, v39);
              mRep = self->mRep;
              -[CRLCanvasRep centerForRotation](mRep, "centerForRotation");
              -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](mRep, "convertNaturalPointToUnscaledCanvas:");
              self->mUnscaledRotationCenter.x = v45;
              self->mUnscaledRotationCenter.y = v46;
              v47 = self;
              v48 = 0.4;
              goto LABEL_33;
            }
            v49 = *v19;
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
            objc_msgSend(v49, "locationInView:", v50);
            v52 = v51;
            v54 = v53;

            v55 = self->mRep;
            -[CRLCanvasRep centerForRotation](v55, "centerForRotation");
            -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](v55, "convertNaturalPointToUnscaledCanvas:");
            self->mUnscaledRotationCenter.x = v56;
            self->mUnscaledRotationCenter.y = v57;
            objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:");
            if (sub_10006010C(v52, v54, v58, v59) <= 2500.0)
            {
              self->mPinningTouchIsPresent = 1;
              v60 = *p_mTouch2;
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
              -[UITouch locationInView:](v60, "locationInView:", v61);
              v63 = v62;
              v65 = v64;

              objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v63, v65);
              self->mOriginalUnscaledPoint2.x = v66;
              self->mOriginalUnscaledPoint2.y = v67;
              self->mLastProcessedTouchUnscaledPoint2 = self->mOriginalUnscaledPoint2;
              objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mOriginalUnscaledPoint1.x, self->mOriginalUnscaledPoint1.y);
              self->mOriginalBoundsDistance = sub_10006108C(v68, v69, v63, v65);
              v47 = self;
              v48 = 0.2;
LABEL_33:
              -[CRLiOSRepRotateGestureRecognizer p_recognizeAfterDelay:](v47, "p_recognizeAfterDelay:", v48);
            }
            else
            {
LABEL_31:
              -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5);
            }
          }
          else
          {
            self->mAdditionalRotateInRadians = 0.0;
            objc_storeStrong(v19, v15);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "hitRepWithTouch:", *v19));
            v28 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForRotating"));
            v29 = self->mRep;
            self->mRep = v28;

            if (!self->mRep)
              goto LABEL_31;
            v30 = *v19;
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
            objc_msgSend(v30, "locationInView:", v31);
            objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
            self->mOriginalUnscaledPoint1.x = v32;
            self->mOriginalUnscaledPoint1.y = v33;

            self->mLastProcessedTouchUnscaledPoint1 = self->mOriginalUnscaledPoint1;
          }
          v13 = v18;
          v9 = v72;
          continue;
        }
        if (-[CRLiOSRepRotateGestureRecognizer state](self, "state") != (id)2)
        {
          -[CRLiOSRepRotateGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v15, v73);
          continue;
        }
        v16 = (UITouch **)((char *)self + v13[260]);
        if (*v16 && ((id)-[UITouch phase](*v16, "phase") == (id)3 || (id)-[UITouch phase](*v16, "phase") == (id)4))
        {
          objc_storeStrong((id *)v16, v15);
          v17 = 32;
LABEL_25:
          v22 = (Class *)((char *)&self->super.super.isa + v17);
          v23 = *v16;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
          -[UITouch locationInView:](v23, "locationInView:", v24);
          objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
          *v22 = v25;
          v22[1] = v26;

          continue;
        }
        v16 = &self->mTouch2;
        mTouch2 = self->mTouch2;
        if (mTouch2
          && ((id)-[UITouch phase](mTouch2, "phase") == (id)3 || (id)-[UITouch phase](*v16, "phase") == (id)4))
        {
          objc_storeStrong((id *)&self->mTouch2, v15);
          v17 = 48;
          goto LABEL_25;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      if (!v11)
      {
LABEL_37:

        v6 = v70;
        goto LABEL_38;
      }
    }
  }
  -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5);
LABEL_38:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  UITouch *mTouch1;
  int *v8;
  id *p_mTouch2;
  unint64_t mMovingTouchIndex;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  int *v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  int *v29;
  int *v30;
  id v31;
  double *v32;
  double v33;
  double v34;
  double *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
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
  unint64_t v59;
  double v60;
  double v61;
  int *v62;
  double v63;
  double v64;
  UITouch *v65;
  void *v66;
  CGFloat v67;
  CGFloat v68;
  UITouch **v69;
  UITouch *mTouch2;
  void *v71;
  CGFloat v72;
  CGFloat v73;
  uint64_t v74;
  uint64_t v75;
  UITouch **v76;
  UITouch *v77;
  UITouch **v78;
  UITouch *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  BOOL v88;
  int *v89;
  int *v90;
  double *v91;
  int *v92;
  int *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  long double v116;
  double v117;
  double v118;
  long double v119;
  double v120;
  double v121;
  double v122;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  id v136;
  double v137;
  double v138;
  UITouch *obj;
  id obja;
  id WeakRetained;
  UITouch **p_mTouch1;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  objc_super v147;
  _BYTE v148[128];

  v6 = a3;
  v147.receiver = self;
  v147.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer touchesMoved:withEvent:](&v147, "touchesMoved:withEvent:", v6, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  p_mTouch1 = &self->mTouch1;
  mTouch1 = self->mTouch1;
  v8 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
  if (mTouch1)
  {
    p_mTouch2 = (id *)&self->mTouch2;
    if (self->mTouch2)
    {
      mMovingTouchIndex = self->mMovingTouchIndex;
      if (mMovingTouchIndex == 1)
      {
        v29 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
        v30 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
      }
      else
      {
        if (!mMovingTouchIndex)
        {
          v145 = 0u;
          v146 = 0u;
          v143 = 0u;
          v144 = 0u;
          obj = (UITouch *)v6;
          v11 = -[UITouch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v148, 16);
          if (!v11)
            goto LABEL_36;
          v12 = v11;
          v136 = v6;
          v13 = *(_QWORD *)v144;
          while (1)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v144 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)i);
              if (v15 == *p_mTouch1)
              {
                v16 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
                v17 = 1;
              }
              else
              {
                if (v15 != *p_mTouch2)
                  continue;
                v16 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
                v17 = 2;
              }
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
              objc_msgSend(v15, "locationInView:", v18);
              v20 = v19;
              v22 = v21;

              objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", *(double *)((char *)&self->super.super.isa + *v16), *(double *)((char *)&self->mICC + *v16));
              v24 = v23;
              v26 = v25;
              v27 = -[CRLiOSRepRotateGestureRecognizer state](self, "state");
              v28 = sub_10006108C(v20, v22, v24, v26);
              if (v27 || v28 < 14.0)
              {
                if (v28 >= 3.0)
                  self->mMovingTouchIndex = v17;
              }
              else
              {
                -[CRLiOSRepRotateGestureRecognizer p_cancelDelayedRecognition](self, "p_cancelDelayedRecognition");
                -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5);
              }
            }
            v12 = -[UITouch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v143, v148, 16);
            if (!v12)
            {
              v6 = v136;
              v8 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
              goto LABEL_36;
            }
          }
        }
        v29 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
        mTouch1 = self->mTouch2;
        p_mTouch2 = (id *)&self->mTouch1;
        v30 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
      }
      obj = mTouch1;
      v31 = *p_mTouch2;
      v32 = (double *)((char *)self + *v29);
      v33 = *v32;
      v34 = v32[1];
      v35 = (double *)((char *)self + *v30);
      v137 = *v35;
      v133 = v33;
      v134 = v35[1];
      if (objc_msgSend(v31, "phase") != (id)3)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
        -[UITouch locationInView:](obj, "locationInView:", v36);
        v38 = v37;
        v40 = v39;

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
        objc_msgSend(v31, "locationInView:", v41);
        v43 = v42;
        v45 = v44;

        objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y);
        v47 = v46;
        v49 = v48;
        if (sub_10006010C(v43, v45, v46, v48) >= 2500.0)
        {
          v129 = v40;
          v131 = v38;
          if (sub_10006010C(v38, v40, v47, v49) >= 2500.0)
            self->mPinningTouchIsPresent = 0;
          objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", v133, v34);
          v51 = v50;
          v53 = v52;
          objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", v137, v134);
          v55 = v54;
          v57 = v56;
          v58 = sub_10006010C(v131, v129, v51, v53);
          if (sub_10006010C(v43, v45, v55, v57) - v58 > 3.0)
          {
            v59 = 1;
            if (self->mMovingTouchIndex == 1)
              v59 = 2;
            self->mMovingTouchIndex = v59;
            objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v43, v45);
            -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:");
            v61 = v60;
            if (self->mMovingTouchIndex == 1)
              v62 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
            else
              v62 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
            -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v62), *(double *)((char *)&self->mICC + *v62));
            sub_100062084(v63 - v61);
            self->mAdditionalRotateInRadians = self->mLastAngle - v64;
          }
        }
      }

LABEL_36:
    }
    v65 = *p_mTouch1;
    if (*p_mTouch1)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
      -[UITouch locationInView:](v65, "locationInView:", v66);
      objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
      self->mLastProcessedTouchUnscaledPoint1.x = v67;
      self->mLastProcessedTouchUnscaledPoint1.y = v68;

    }
  }
  v69 = &self->mTouch2;
  mTouch2 = self->mTouch2;
  if (mTouch2)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
    -[UITouch locationInView:](mTouch2, "locationInView:", v71);
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
    self->mLastProcessedTouchUnscaledPoint2.x = v72;
    self->mLastProcessedTouchUnscaledPoint2.y = v73;

  }
  v74 = v8[265];
  v75 = *(uint64_t *)((char *)&self->super.super.isa + v74);
  if (v75)
  {
    v76 = &self->mTouch1;
    if (v75 != 1)
      v76 = &self->mTouch2;
    v77 = *v76;
    v78 = &self->mTouch1;
    if (*(Class *)((char *)&self->super.super.isa + v74) != (Class)2)
      v78 = &self->mTouch2;
    v79 = *v78;
    if (v77)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
      -[UITouch locationInView:](v77, "locationInView:", v80);
      v82 = v81;
      v84 = v83;

      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y);
      if (!v79 && sub_10006010C(v82, v84, v85, v86) > 2500.0)
        self->mPinningTouchIsPresent = 0;
    }

  }
  if (*p_mTouch1 && *v69)
  {
    if (!*(Class *)((char *)&self->super.super.isa + v74))
      goto LABEL_87;
    if (!-[CRLiOSRepRotateGestureRecognizer state](self, "state"))
    {
      v87 = *(uint64_t *)((char *)&self->super.super.isa + v74);
      v88 = v87 == 1;
      v89 = v87 == 1
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2;
      v135 = *(double *)((char *)&self->super.super.isa + *v89);
      v90 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint2
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mLastProcessedTouchUnscaledPoint1;
      v91 = (double *)((char *)self + *v90);
      v128 = *v91;
      v130 = v91[1];
      v92 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
      v127 = *(double *)((char *)&self->super.super.isa + *v92);
      v93 = v88
          ? &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2
          : &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mLastProcessedTouchUnscaledPoint1.x, self->mLastProcessedTouchUnscaledPoint1.y, *(Class *)((char *)&self->super.super.isa + *v93), *(CRLInteractiveCanvasController **)((char *)&self->mICC + *v93));
      v95 = v94;
      v97 = v96;
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mLastProcessedTouchUnscaledPoint2.x, self->mLastProcessedTouchUnscaledPoint2.y);
      v138 = v99;
      obja = v98;
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", sub_1000603B8(self->mLastProcessedTouchUnscaledPoint1.x, self->mLastProcessedTouchUnscaledPoint1.y, self->mOriginalUnscaledPoint1.x));
      v101 = v100;
      v103 = v102;
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", sub_1000603B8(self->mLastProcessedTouchUnscaledPoint2.x, self->mLastProcessedTouchUnscaledPoint2.y, self->mOriginalUnscaledPoint2.x));
      v105 = v104;
      v107 = v106;
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y);
      v109 = v108;
      v111 = v110;
      v132 = v97;
      v112 = sub_10006010C(v95, v97, v108, v110);
      if (sub_100061080(v101, v103) > 1.0 || v112 < 2500.0)
      {
        v113 = sub_100061080(v105, v107);
        v114 = sub_10006010C(*(double *)&obja, v138, v109, v111);
        if (v113 > 1.0 || v114 < 2500.0)
        {
          v115 = sub_1000603B8(v125, v126, v127);
          v117 = sub_1000618B4(v115, v116);
          v118 = sub_1000603B8(v128, v130, v135);
          v120 = sub_1000618B4(v118, v119);
          v121 = fabs(fmod(v120 - v117, 6.28318531)) * 57.2957795;
          v122 = vabdd_f64(sub_10006108C(v95, v132, *(double *)&obja, v138), self->mOriginalBoundsDistance);
          if (v121 > 2.5 && v122 < 14.0)
          {
            -[CRLiOSRepRotateGestureRecognizer p_beginTracking](self, "p_beginTracking", v122);
            goto LABEL_87;
          }
          if (v121 <= 2.5 && v122 >= 14.0)
            -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 5, v122);
        }
      }
    }
  }
  if (*(Class *)((char *)&self->super.super.isa + v74)
    && (*p_mTouch1 && (objc_msgSend(v6, "containsObject:") & 1) != 0
     || *v69 && objc_msgSend(v6, "containsObject:"))
    && (char *)-[CRLiOSRepRotateGestureRecognizer state](self, "state") - 1 <= (char *)1)
  {
    -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 2);
    -[CRLiOSRepRotateGestureRecognizer p_updateTracker](self, "p_updateTracker");
  }
LABEL_87:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  UITouch *v13;
  UITouch *mTouch1;
  unint64_t mMovingTouchIndex;
  UITouch *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int *v26;
  double v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer touchesEnded:withEvent:](&v34, "touchesEnded:withEvent:", v6, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v9)
    goto LABEL_30;
  v10 = v9;
  v11 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      v13 = *(UITouch **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
      mTouch1 = self->mTouch1;
      if (v13 == mTouch1 && self->mMovingTouchIndex == 1)
      {
        mTouch1 = self->mTouch2;
      }
      else
      {
        mMovingTouchIndex = self->mMovingTouchIndex;
        if (v13 != self->mTouch2 || mMovingTouchIndex != 2)
        {
          if (!mMovingTouchIndex)
            goto LABEL_26;
          continue;
        }
      }
      v17 = mTouch1;
      if ((id)-[UITouch phase](v17, "phase", (_QWORD)v30) == (id)3 || (id)-[UITouch phase](v17, "phase") == (id)4)
      {

LABEL_26:
        if ((char *)-[CRLiOSRepRotateGestureRecognizer state](self, "state", (_QWORD)v30) - 1 >= (char *)2)
          v29 = 5;
        else
          v29 = 3;
        -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", v29);
        goto LABEL_30;
      }
      v18 = 1;
      if (self->mMovingTouchIndex == 1)
        v18 = 2;
      self->mMovingTouchIndex = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
      -[UITouch locationInView:](v17, "locationInView:", v19);
      objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
      v21 = v20;
      v23 = v22;

      -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", v21, v23);
      v25 = v24;
      v26 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
      if (self->mMovingTouchIndex == 1)
        v26 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
      -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v26), *(double *)((char *)&self->mICC + *v26));
      sub_100062084(v27 - v25);
      self->mAdditionalRotateInRadians = self->mLastAngle - v28;

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
      continue;
    break;
  }
LABEL_30:

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  UITouch *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRepRotateGestureRecognizer;
  -[CRLiOSRepRotateGestureRecognizer touchesCancelled:withEvent:](&v18, "touchesCancelled:withEvent:", v6, a4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(UITouch **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        if (v12 == self->mTouch1 || v12 == self->mTouch2)
        {
          if ((char *)-[CRLiOSRepRotateGestureRecognizer state](self, "state", (_QWORD)v14) - 1 < (char *)2)
            v13 = 4;
          else
            v13 = 5;
          -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", v13);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)cancelBecauseOfRotation
{
  if (self->mTracker)
    -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 4);
}

- (double)rotation
{
  unint64_t mMovingTouchIndex;
  int *v4;
  double mLastAngle;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int *v21;
  _QWORD *v22;
  int *v23;
  double v24;
  double v25;

  mMovingTouchIndex = self->mMovingTouchIndex;
  if (!mMovingTouchIndex)
    return 0.0;
  if (mMovingTouchIndex == 1)
    v4 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  else
    v4 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  v6 = *(id *)((char *)&self->super.super.isa + *v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v10, v12);
  v14 = v13;
  v16 = v15;
  -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:");
  v18 = v17;
  if (self->mPinningTouchIsPresent
    && (objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y), sub_10006010C(v10, v12, v19, v20) < 2500.0))
  {
    if (self->mMovingTouchIndex == 1)
      v21 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
    else
      v21 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
    v22 = (Class *)((char *)&self->super.super.isa + *v21);
    *v22 = v14;
    v22[1] = v16;
    mLastAngle = self->mLastAngle;
  }
  else
  {
    if (self->mMovingTouchIndex == 1)
      v23 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint1;
    else
      v23 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mOriginalUnscaledPoint2;
    -[CRLiOSRepRotateGestureRecognizer p_angleForUnscaledTouchPoint:](self, "p_angleForUnscaledTouchPoint:", *(double *)((char *)&self->super.super.isa + *v23), *(double *)((char *)&self->mICC + *v23));
    sub_100062084(v24 - v18 + self->mAdditionalRotateInRadians);
    mLastAngle = v25;
    self->mLastAngle = v25;
  }

  return mLastAngle;
}

- (BOOL)touchesAreInRep
{
  unint64_t mMovingTouchIndex;
  int *v3;

  mMovingTouchIndex = self->mMovingTouchIndex;
  if (!mMovingTouchIndex)
    return 0;
  if (mMovingTouchIndex == 1)
    v3 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  else
    v3 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  return -[CRLiOSRepRotateGestureRecognizer p_touchIsInRep:](self, "p_touchIsInRep:", *(Class *)((char *)&self->super.super.isa + *v3));
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSRepRotateGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  id WeakRetained;
  void *v4;
  CRLCanvasRepRotateTracking *mTracker;

  if (self->mTracker)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
    -[CRLiOSRepRotateGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v4, "handleGestureRecognizer:");

    mTracker = self->mTracker;
    self->mTracker = 0;

  }
}

- (BOOL)p_touchIsInRep:(id)a3
{
  CRLiOSRepRotateGestureRecognizer *v3;
  CRLInteractiveCanvasController **p_mICC;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v3 = self;
  p_mICC = &self->mICC;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_mICC);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:", v9, v11);
  v13 = v12;
  v15 = v14;

  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](v3->mRep, "convertNaturalPointFromUnscaledCanvas:", v13, v15);
  LOBYTE(v3) = -[CRLCanvasRep containsPoint:withPrecision:](v3->mRep, "containsPoint:withPrecision:", 0);

  return (char)v3;
}

- (double)p_angleForUnscaledTouchPoint:(CGPoint)a3
{
  double v3;
  long double v4;

  v3 = sub_1000603B8(a3.x, a3.y, self->mUnscaledRotationCenter.x);
  return -sub_100061F34(v3, v4);
}

- (void)p_beginTracking
{
  id WeakRetained;
  void *v4;
  void *v5;
  CRLCanvasRepRotateTracking *v6;
  CRLCanvasRepRotateTracking *mTracker;
  CRLCanvasRepRotateTracking *v8;
  CGFloat v9;
  CGFloat v10;
  CRLCanvasRepRotateTracker *v11;
  CRLCanvasRepRotateTracking *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  if (!self->mTracker)
  {
    if (objc_msgSend(v4, "isInPossibleDynamicOperation"))
      objc_msgSend(v4, "endOperation");
    v6 = (CRLCanvasRepRotateTracking *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "customRotateTrackerForCurrentSelection"));
    mTracker = self->mTracker;
    self->mTracker = v6;

    v8 = self->mTracker;
    if (v8)
    {
      -[CRLCanvasRepRotateTracking unscaledCenterForRotation](v8, "unscaledCenterForRotation");
      self->mUnscaledRotationCenter.x = v9;
      self->mUnscaledRotationCenter.y = v10;
    }
    else
    {
      v11 = -[CRLCanvasRepRotateTracker initWithRep:]([CRLCanvasRepRotateTracker alloc], "initWithRep:", self->mRep);
      v12 = self->mTracker;
      self->mTracker = (CRLCanvasRepRotateTracking *)v11;

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepRotateTracking repsBeingRotated](self->mTracker, "repsBeingRotated"));
    -[CRLiOSRepRotateGestureRecognizer addTarget:action:](self, "addTarget:action:", v4, "handleGestureRecognizer:");
    objc_msgSend(v5, "registerTrackerManipulator:", self);
    if ((objc_msgSend(v5, "takeControlWithTrackerManipulator:", self) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B380);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2FE38();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B3A0);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateGestureRecognizer p_beginTracking]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 542, 0, "rotate GR did not successfully take control");

    }
    if ((objc_msgSend(v4, "isInOperation") & 1) == 0)
      objc_msgSend(v4, "beginOperation");
    objc_msgSend(v4, "startTransformingReps:", v13);
    self->mLastAngle = 0.0;
    if (objc_msgSend(v13, "count") == (id)1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "info"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectionPathWithInfo:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
      objc_msgSend(v21, "setSelectionPath:", v20);

    }
  }
  -[CRLiOSRepRotateGestureRecognizer setState:](self, "setState:", 1);
  self->mRecognitionIsBeingDelayed = 0;

}

- (void)p_recognizeAfterDelay:(double)a3
{
  if (!self->mRecognitionIsBeingDelayed)
  {
    self->mRecognitionIsBeingDelayed = 1;
    -[CRLiOSRepRotateGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_beginTracking", 0, a3);
  }
}

- (void)p_cancelDelayedRecognition
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_beginTracking", 0);
  self->mRecognitionIsBeingDelayed = 0;
}

- (void)p_updateTracker
{
  double mLastAngle;
  double v4;
  int *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  mLastAngle = self->mLastAngle;
  -[CRLiOSRepRotateGestureRecognizer rotation](self, "rotation");
  -[CRLCanvasRepRotateTracking addRotateDelta:](self->mTracker, "addRotateDelta:", v4 - mLastAngle);
  if (self->mMovingTouchIndex == 1)
    v5 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch1;
  else
    v5 = &OBJC_IVAR___CRLiOSRepRotateGestureRecognizer_mTouch2;
  v17 = *(id *)((char *)&self->super.super.isa + *v5);
  v6 = objc_loadWeakRetained((id *)&self->mICC);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
  objc_msgSend(v17, "locationInView:", v7);
  objc_msgSend(v6, "convertBoundsToUnscaledPoint:");
  v9 = v8;
  v11 = v10;

  v12 = sub_10006108C(v9, v11, self->mUnscaledRotationCenter.x, self->mUnscaledRotationCenter.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self->mRep, "interactiveCanvasController"));
  objc_msgSend(v13, "viewScale");
  v15 = v12 * v14;

  v16 = 2.0;
  if (v15 < 200.0)
    v16 = 4.0;
  -[CRLCanvasRepRotateTracking setSnapThreshold:](self->mTracker, "setSnapThreshold:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTracker, 0);
  objc_storeStrong((id *)&self->mRep, 0);
  objc_storeStrong((id *)&self->mTouch2, 0);
  objc_storeStrong((id *)&self->mTouch1, 0);
  objc_destroyWeak((id *)&self->mICC);
}

@end
