@implementation CRLWPReplaceTextCommandSelectionBehavior

- (id)commandSelectionBehaviorByCoalescingWithCommandSelectionBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void **p_cache;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _TtC8Freeform25CRLSelectionPathValidator *v27;
  void *v28;
  void *v29;
  void *v30;
  CRLSelectionModelTranslator *v31;
  _TtC8Freeform25CRLSelectionPathValidator *v32;
  void *v33;
  _TtC8Freeform25CRLSelectionPathValidator *v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _TtC8Freeform27CRLPersistableSelectionPath *v56;
  _TtC8Freeform27CRLPersistableSelectionPath *v57;
  CRLWPReplaceTextCommandSelectionBehavior *v58;
  int v59;
  _TtC8Freeform27CRLPersistableSelectionPath *v60;
  void *v61;
  CRLWPReplaceTextCommandSelectionBehavior *v62;
  void *v64;
  _TtC8Freeform25CRLSelectionPathValidator *v65;
  void *v66;
  id v67;
  _TtC8Freeform27CRLPersistableSelectionPath *v68;
  _TtC8Freeform27CRLPersistableSelectionPath *v69;

  v4 = a3;
  v6 = (void *)objc_opt_class(v4, v5);
  p_cache = &OBJC_METACLASS___CRLDescription.cache;
  if ((objc_msgSend(v6, "isEqual:", objc_opt_class(CRLWPReplaceTextCommandSelectionBehavior, v8)) & 1) != 0)
  {
    v10 = (objc_class *)objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior commitSelectionPath](self, "commitSelectionPath"));
    v13 = objc_msgSend(v11, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = sub_1002223BC(v10, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v18 = (objc_class *)objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commitSelectionPath"));
    v21 = objc_msgSend(v19, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = sub_1002223BC(v18, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItems"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "boardItems"));
    LODWORD(v22) = objc_msgSend(v25, "isEqual:", v26);

    if ((_DWORD)v22)
    {
      v27 = [_TtC8Freeform25CRLSelectionPathValidator alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItems"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "anyObject"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "parentBoard"));
      v31 = objc_opt_new(CRLSelectionModelTranslator);
      v32 = -[CRLSelectionPathValidator initWithBoard:translator:](v27, "initWithBoard:translator:", v30, v31);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior persistableForwardSelectionPath](self, "persistableForwardSelectionPath"));
      v34 = v32;
      v65 = v32;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPathValidator selectionPathFromPersistableSelectionPath:](v32, "selectionPathFromPersistableSelectionPath:", v33));

      v37 = (objc_class *)objc_opt_class(CRLWPSelection, v36);
      v66 = v35;
      v39 = objc_msgSend(v35, "mostSpecificSelectionOfClass:", objc_opt_class(CRLWPSelection, v38));
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      v41 = sub_1002223BC(v37, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

      v67 = v4;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionFromWPSelection:](CRLWPSelection, "selectionFromWPSelection:", v42));
      objc_msgSend(v43, "setTailCursorAffinity:", 2);
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v42, v43));
      v68 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v64);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior persistableReverseSelectionPath](self, "persistableReverseSelectionPath"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPathValidator selectionPathFromPersistableSelectionPath:](v34, "selectionPathFromPersistableSelectionPath:", v44));

      v47 = (objc_class *)objc_opt_class(CRLWPSelection, v46);
      v49 = objc_msgSend(v45, "mostSpecificSelectionOfClass:", objc_opt_class(CRLWPSelection, v48));
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v51 = sub_1002223BC(v47, v50);
      v52 = v16;
      v53 = (void *)objc_claimAutoreleasedReturnValue(v51);

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionFromWPSelection:](CRLWPSelection, "selectionFromWPSelection:", v53));
      objc_msgSend(v54, "setTailCursorAffinity:", 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v53, v54));
      v56 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v55);

      p_cache = (void **)(&OBJC_METACLASS___CRLDescription + 16);
      v16 = v52;

      v57 = v68;
      v4 = v67;

    }
    else
    {
      v56 = 0;
      v57 = 0;
    }

    v58 = (CRLWPReplaceTextCommandSelectionBehavior *)objc_alloc((Class)(p_cache + 393));
    if (v57)
    {
      v59 = 0;
      v69 = v57;
      goto LABEL_9;
    }
  }
  else
  {
    v58 = [CRLWPReplaceTextCommandSelectionBehavior alloc];
    v56 = 0;
  }
  v57 = (_TtC8Freeform27CRLPersistableSelectionPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistableForwardSelectionPath"));
  v69 = 0;
  v59 = 1;
LABEL_9:
  v60 = v56;
  if (!v56)
    v60 = (_TtC8Freeform27CRLPersistableSelectionPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistableReverseSelectionPath"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCommandSelectionBehavior commitSelectionPath](self, "commitSelectionPath"));
  v62 = -[CRLCommandSelectionBehavior initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:](v58, "initWithPersistableForwardSelectionPath:persistableReverseSelectionPath:commitSelectionPath:selectionFlags:commitSelectionFlags:forwardSelectionFlags:reverseSelectionFlags:", v57, v60, v61, -[CRLCommandSelectionBehavior selectionFlags](self, "selectionFlags"), 0, objc_msgSend(v4, "additionalForwardSelectionFlags"), -[CRLCommandSelectionBehavior additionalReverseSelectionFlags](self, "additionalReverseSelectionFlags"));

  if (!v56)
  {

    if (!v59)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v59)
LABEL_13:

LABEL_14:
  return v62;
}

@end
