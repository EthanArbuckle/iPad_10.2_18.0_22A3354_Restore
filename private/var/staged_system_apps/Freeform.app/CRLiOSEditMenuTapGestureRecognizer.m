@implementation CRLiOSEditMenuTapGestureRecognizer

- (void)reset
{
  CRLCanvasRep *touchedRep;
  objc_super v4;

  self->_ignoreTargetAction = 0;
  touchedRep = self->_touchedRep;
  self->_touchedRep = 0;

  self->_touchTypeForTap = 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSEditMenuTapGestureRecognizer;
  -[CRLiOSEditMenuTapGestureRecognizer reset](&v4, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  id v44;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSEditMenuTapGestureRecognizer delegate](self, "delegate"));
  v15 = sub_100221E08(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLUIKitInteractionHost);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "interactiveCanvasController"));
  if (((unint64_t)-[CRLiOSEditMenuTapGestureRecognizer modifierFlags](self, "modifierFlags") & 0x120000) == 0)
  {
    if (-[CRLiOSEditMenuTapGestureRecognizer numberOfTouches](self, "numberOfTouches"))
      goto LABEL_19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouches"));
    if (objc_msgSend(v18, "count") != (id)1)
      goto LABEL_18;
    v19 = objc_msgSend(v17, "currentlyScrolling");

    if ((v19 & 1) != 0)
      goto LABEL_19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v18 = v20;
    if (!v20 || objc_msgSend(v20, "tapCount") != (id)1)
    {
LABEL_18:

LABEL_19:
      if (self->_touchedRep)
        goto LABEL_20;
      goto LABEL_2;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSEditMenuTapGestureRecognizer view](self, "view"));
    objc_msgSend(v18, "locationInView:", v21);
    v23 = v22;
    v25 = v24;

    objc_msgSend(v17, "convertBoundsToUnscaledPoint:", v23, v25);
    v27 = v26;
    v29 = v28;
    v44 = 0;
    v30 = objc_msgSend(v17, "hitKnobAtPoint:inputType:returningRep:", sub_10033831C((_BOOL8)objc_msgSend(v18, "type")), &v44, v26, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = v44;
    v33 = v32;
    if (!v31
      || !objc_msgSend(v32, "wantsEditMenuForTapAtPoint:onKnob:", v31, v27, v29)
      || (v34 = v33) == 0)
    {
      v42 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hitRep:", v27, v29));
      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "repForSelecting"));

      if (!v34)
        goto LABEL_16;
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "info"));
      if (!v36)
        goto LABEL_16;
      v37 = (void *)v36;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layerHost"));
      v41 = v31;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "asUIKitHost"));
      v39 = objc_msgSend(v38, "shouldSelectAndShowEditMenuOnFirstTapForRep:", v34);

      v31 = v41;
      if ((v39 & 1) == 0)
      {
LABEL_16:

        v34 = 0;
        v33 = v42;
        goto LABEL_17;
      }
      v33 = v42;
    }
    objc_storeStrong((id *)&self->_touchedRep, v34);
    self->_ignoreTargetAction = 0;
    self->_touchTypeForTap = (int64_t)objc_msgSend(v18, "type");
    v43.receiver = self;
    v43.super_class = (Class)CRLiOSEditMenuTapGestureRecognizer;
    -[CRLiOSEditMenuTapGestureRecognizer touchesBegan:withEvent:](&v43, "touchesBegan:withEvent:", v6, v7);
LABEL_17:

    goto LABEL_18;
  }
LABEL_2:
  -[CRLiOSEditMenuTapGestureRecognizer setState:](self, "setState:", 5);
LABEL_20:

}

- (CRLCanvasRep)touchedRep
{
  return self->_touchedRep;
}

- (BOOL)ignoreTargetAction
{
  return self->_ignoreTargetAction;
}

- (void)setIgnoreTargetAction:(BOOL)a3
{
  self->_ignoreTargetAction = a3;
}

- (int64_t)touchTypeForTap
{
  return self->_touchTypeForTap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchedRep, 0);
}

@end
