@implementation PFXReviewWidget

+ (id)questionTypeFromQuestionType:(int)a3 answersAreText:(BOOL)a4
{
  __CFString **v4;

  if (a3 == 2)
  {
    if (a4)
      v4 = &TSWReviewQuestionDescriptionTypeAssociativeTokenValue;
    else
      v4 = &TSWReviewQuestionDescriptionTypeAssociativeImageValue;
  }
  else
  {
    if (a3 != 1)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", *(_QWORD *)&a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFXReviewWidget questionTypeFromQuestionType:answersAreText:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm"), 463, CFSTR("PFXReviewWidget: bad question type"));
      return 0;
    }
    if (a4)
      v4 = &TSWReviewQuestionDescriptionTypeMultiChoiceValue;
    else
      v4 = &TSWReviewQuestionDescriptionTypeMultiChoiceImageValue;
  }
  return *v4;
}

+ (void)mapAnswer:(id)a3 toChoice:(id)a4 questionType:(int)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  objc_msgSend(a3, "answerWeight");
  objc_msgSend(a4, "setFraction:");
  if (a5 == 2)
  {
    v8 = objc_msgSend(a3, "placementHint");
    if ((_DWORD)v8)
      objc_msgSend(a4, "setPlacardPlacement:", v8);
  }
  objc_msgSend(a4, "setTargetRegion:", objc_msgSend(a3, "targetRegion"));
  v9 = objc_opt_class(PFXReviewWidgetImageAnswer2);
  *(_QWORD *)&v11 = TSUDynamicCast(v9, a3).n128_u64[0];
  if (v10)
  {
    v12 = v10;
    objc_msgSend(a4, "setContent:", objc_msgSend(objc_msgSend(v10, "imageInfo", v11), "imageData"));
    objc_msgSend(a4, "setContentType:", TSWReviewChoiceDescriptionContentTypeImageValue);
    objc_msgSend(a4, "setAccessibilityDescription:", objc_msgSend(v12, "accessibilityDescription"));
    v13 = v12;
LABEL_12:
    objc_msgSend(a4, "setTargetAccesibilityDescription:", objc_msgSend(v13, "targetAccessibilityDescription"));
    return;
  }
  v14 = objc_opt_class(PFXReviewWidgetText2);
  *(_QWORD *)&v16 = TSUDynamicCast(v14, a3).n128_u64[0];
  if (v15)
  {
    v17 = v15;
    if (a5 == 2 && (unint64_t)objc_msgSend(objc_msgSend(v15, "textStorage", v16), "paragraphCount") >= 2)
    {
      v18 = (char *)objc_msgSend(objc_msgSend(v17, "textStorage"), "textRangeForParagraphAtIndex:", 0);
      v20 = v19;
      v21 = (char *)objc_msgSend(objc_msgSend(v17, "textStorage"), "length");
      v22 = &v18[v20];
      if (v21 > v22)
        objc_msgSend(objc_msgSend(v17, "textStorage"), "deleteRange:undoTransaction:", v22, v21 - v22, 0);
    }
    objc_msgSend(a4, "setContent:", objc_msgSend(v17, "textStorage"));
    objc_msgSend(a4, "setContentType:", TSWReviewChoiceDescriptionContentTypeTextValue);
    objc_msgSend(a4, "setAccessibilityDescription:", objc_msgSend(v17, "accessibilityDescription"));
    v13 = v17;
    goto LABEL_12;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v16), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFXReviewWidget mapAnswer:toChoice:questionType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm"), 509, CFSTR("PFXReviewWidget: bad answer type"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidget;
  -[PFXReviewWidget dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  PFXDrawablePlacement *v5;
  unsigned __int8 v6;
  id v7;
  id v8;

  v5 = (PFXDrawablePlacement *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "drawablePlacementClass")), "initWithDrawable:", self);
  self->_placement = v5;
  v6 = -[PFXDrawablePlacement mapStartElementWithState:](v5, "mapStartElementWithState:", a3);
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  if (-[PFXDrawablePlacement mode](self->_placement, "mode") == 2)
  {
    if (objc_msgSend(v7, "hasHints"))
    {
      if ((objc_msgSend(a3, "inTable") & 1) == 0)
      {
        v8 = objc_msgSend(v7, "nextHintLocation");
        if (v8 == objc_msgSend(a3, "totalTextRead"))
        {
          objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
          objc_msgSend(v7, "popHint");
        }
      }
    }
  }
  return v6;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  TSWWidgetStyle *v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  THWStageGeometry *v16;
  THWReviewInfo *v17;
  id v18;
  TSDInfoGeometry *v19;
  id v20;
  id v21;
  THWReviewInfo *v22;
  PFXWidgetPlacement *v23;
  char *v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v31;
  THWReviewQuestion *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  id v38;
  __objc2_class **p_superclass;
  uint64_t v40;
  THWReviewChoice *v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  id v46;
  uint64_t v47;
  void *v48;
  double v49;
  id v50;
  NSString *v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  id v57;
  PFXReviewWidget *v58;
  TSDInfoGeometry *v59;
  void *v60;
  id v61;
  TSDInfo *v62;
  id v63;
  THWReviewInfo *v64;
  id v65;
  PFXWidgetPlacement *v66;
  PFXReviewWidget *v67;
  THWReviewInfo *v68;
  id v69;
  char *v70;
  id v71;
  char *v72;
  void *v73;
  void *v74;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v71 = objc_msgSend(v5, "currentEntryMediaState");
  v69 = objc_msgSend(a3, "tspContext");
  v6 = -[TSWWidgetStyle initWithContext:]([TSWWidgetStyle alloc], "initWithContext:", v69);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), "addStyle:", v6);
  objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageCornerRadius[0]), "doubleValue");
  v8 = v7;
  v9 = PFXTSDInfoGeometry((const char *)objc_msgSend(objc_msgSend(v5, "valueForAttribute:", PFXWidgetConstantDataStageGeometry[0]), "UTF8String"));
  objc_msgSend(v9, "position");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "size");
  v16 = -[THWStageGeometry initWithFrame:cornerRadius:]([THWStageGeometry alloc], "initWithFrame:cornerRadius:", v11, v13, v14, v15, v8);
  v17 = [THWReviewInfo alloc];
  v18 = objc_msgSend(a3, "tspContext");
  v19 = -[PFXDrawablePlacement infoGeometry](self->_placement, "infoGeometry");
  v20 = v18;
  v21 = a3;
  v22 = -[THWReviewInfo initWithContext:geometry:style:stageGeometry:](v17, "initWithContext:geometry:style:stageGeometry:", v20, v19, v6, v16);

  v74 = v5;
  -[THWReviewInfo setProgressKitID:](v22, "setProgressKitID:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", objc_msgSend(v5, "xmlElementId")));
  -[THWReviewInfo setProgressKitSectionID:](v22, "setProgressKitSectionID:", objc_msgSend(a3, "nodeGUID"));

  v67 = self;
  v23 = +[PFXWidgetPlacement widgetPlacementWithDrawablePlacement:readerState:](PFXWidgetPlacement, "widgetPlacementWithDrawablePlacement:readerState:", self->_placement, a3);
  if (-[PFXWidgetPlacement hasChildrenForAdornmentInfo](v23, "hasChildrenForAdornmentInfo"))
    -[THWReviewInfo setAdornmentInfo:](v22, "setAdornmentInfo:", +[PFXDrawablesWidget adornmentInfoWithWidgetPlacement:readerState:](PFXDrawablesWidget, "adornmentInfoWithWidgetPlacement:readerState:", v23, v21));
  v66 = v23;
  v73 = v21;
  v70 = (char *)objc_msgSend(v71, "childResultCount");
  if (v70)
  {
    v24 = 0;
    v68 = v22;
    do
    {
      v25 = objc_msgSend(v71, "childResultAtIndex:", v24);
      v26 = objc_opt_class(PFXReviewWidgetQuestion2);
      *(_QWORD *)&v28 = TSUDynamicCast(v26, v25).n128_u64[0];
      if (v27)
      {
        v29 = v27;
        v72 = v24;
        v30 = objc_msgSend(v27, "type", v28);
        if ((_DWORD)v30 == 2)
          v31 = 2;
        else
          v31 = (_DWORD)v30 == 1;
        v32 = -[THWReviewQuestion initWithContext:type:text:numberOfChoices:titleAccessibilityDescription:imageAccessibilityDescription:]([THWReviewQuestion alloc], "initWithContext:type:text:numberOfChoices:titleAccessibilityDescription:imageAccessibilityDescription:", v69, v31, objc_msgSend(v29, "answersAreText"), objc_msgSend(objc_msgSend(v29, "answers"), "count"), objc_msgSend(v29, "titleAccessibilityDescription"), objc_msgSend(v29, "imageAccessibilityDescription"));
        -[THWReviewQuestion setPrompt:](v32, "setPrompt:", objc_msgSend(objc_msgSend(v29, "title"), "textStorage"));
        -[THWReviewQuestion setAlternatePrompt:](v32, "setAlternatePrompt:", objc_msgSend(v29, "titleAccessibilityDescription"));
        -[THWReviewQuestion setChoiceNumberStyle:](v32, "setChoiceNumberStyle:", objc_msgSend(v29, "numberParagraphStyle"));
        v33 = objc_msgSend(v29, "imageInfo");
        if (v33)
        {
          v34 = v33;
          -[THWReviewQuestion setReferenceContent:](v32, "setReferenceContent:", objc_msgSend(v33, "imageData"));
          -[THWReviewQuestion setReferenceContentType:](v32, "setReferenceContentType:", TSWReviewQuestionDescriptionReferenceContentTypeImageValue);
          -[THWReviewQuestion setReferenceContentAlternate:](v32, "setReferenceContentAlternate:", objc_msgSend(v29, "imageAccessibilityDescription"));
          objc_msgSend(objc_msgSend(v34, "geometry"), "boundsBeforeRotation");
          -[THWReviewQuestion setReferenceContentSize:](v32, "setReferenceContentSize:", v35, v36);
          v37 = objc_msgSend(v29, "contentRefPlacement");
          if ((_DWORD)v37)
            -[THWReviewQuestion setReferenceContentPlacement:](v32, "setReferenceContentPlacement:", v37);
        }
        v38 = objc_msgSend(v29, "answers");
        v21 = v73;
        p_superclass = PFSPairNonRetainedValue.superclass;
        if (objc_msgSend(v38, "count"))
        {
          v40 = 0;
          while (1)
          {
            v41 = objc_alloc_init(THWReviewChoice);
            v42 = objc_msgSend(v38, "objectAtIndex:", v40);
            +[PFXReviewWidget mapAnswer:toChoice:questionType:](PFXReviewWidget, "mapAnswer:toChoice:questionType:", v42, v41, v30);
            v43 = objc_opt_class(p_superclass + 264);
            *(_QWORD *)&v45 = TSUDynamicCast(v43, v42).n128_u64[0];
            if (v44)
              break;
            v47 = objc_opt_class(PFXReviewWidgetText2);
            *(_QWORD *)&v49 = TSUDynamicCast(v47, v42).n128_u64[0];
            if (v48)
            {
              v46 = objc_msgSend(v48, "textStorage", v49);
LABEL_18:
              if (v46)
                objc_msgSend(v21, "setUniqueIdForInfo:withPostfix:fromStackEntry:", v46, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("question-%lu-answer-%lu"), v72 + 1, v40 + 1), v74);
              goto LABEL_21;
            }
            v50 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v49);
            v51 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXReviewWidget mapEndElementWithState:]");
            p_superclass = (__objc2_class **)(PFSPairNonRetainedValue + 8);
            v52 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm");
            v53 = v50;
            v21 = v73;
            objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v51, v52, 655, CFSTR("PFXReviewWidget: bad answer type"));
LABEL_21:
            -[THWReviewQuestion addChoice:](v32, "addChoice:", v41);

            if (++v40 >= (unint64_t)objc_msgSend(v38, "count"))
              goto LABEL_22;
          }
          v46 = objc_msgSend(v44, "imageInfo", v45);
          goto LABEL_18;
        }
LABEL_22:
        v22 = v68;
        -[THWReviewInfo addQuestion:](v68, "addQuestion:", v32);

        v24 = v72;
      }
      else
      {
        v54 = objc_opt_class(TSWPParagraphStyle);
        *(_QWORD *)&v56 = TSUDynamicCast(v54, v25).n128_u64[0];
        if (v55)
          -[THWReviewInfo setQuestionNumberStyle:](v22, "setQuestionNumberStyle:", v55, v56);
      }
      ++v24;
    }
    while (v24 != v70);
  }
  if (+[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", v21))
  {
    v57 = objc_msgSend(v21, "tspContext");
    v58 = self;
    v59 = -[PFXDrawablePlacement infoGeometry](self->_placement, "infoGeometry");
    v60 = v74;
    v61 = objc_msgSend(v74, "titleAttributeValue");
    v62 = -[PFXWidgetPlacement stageDrawable](v66, "stageDrawable");
    v63 = v61;
    v21 = v73;
    v64 = +[PFXWidget drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:](PFXWidget, "drawableWidgetWithContext:infoGeometry:widgetTitle:stageDrawable:widgetInfo:", v57, v59, v63, v62, v22);
    -[THWReviewInfo setAdornmentInfo:](v64, "setAdornmentInfo:", -[THWReviewInfo adornmentInfo](v22, "adornmentInfo"));
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWReviewInfo adornmentInfo](v64, "adornmentInfo"), "updateParentInfo:", v64);
    v65 = objc_msgSend(v73, "setUniqueIdForInfo:fromStackEntry:", v64, v74);
  }
  else
  {
    v60 = v74;
    v65 = objc_msgSend(v21, "setUniqueIdForInfo:fromStackEntry:", v22, v74);
    -[THWWidgetAdornmentInfo updateParentInfo:](-[THWReviewInfo adornmentInfo](v22, "adornmentInfo"), "updateParentInfo:", v22);
    v64 = v22;
    v58 = v67;
  }
  objc_msgSend(objc_msgSend(v60, "currentEntryMediaState"), "setResult:", v64);
  -[THWReviewInfo updateWithUniqueID:contentNodeGUID:](v22, "updateWithUniqueID:contentNodeGUID:", v65, objc_msgSend(v21, "nodeGUID"));

  -[PFXDrawablePlacement mapEndElementWithState:](v58->_placement, "mapEndElementWithState:", v21);
}

- (PFXDrawablePlacement)placement
{
  return self->_placement;
}

@end
