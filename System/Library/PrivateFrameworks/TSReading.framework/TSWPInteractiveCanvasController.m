@implementation TSWPInteractiveCanvasController

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)TSWPInteractiveCanvasController;
  -[TSDInteractiveCanvasController dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  objc_super v3;

  self->_isTearingDown = 1;
  v3.receiver = self;
  v3.super_class = (Class)TSWPInteractiveCanvasController;
  -[TSDInteractiveCanvasController teardown](&v3, sel_teardown);
  self->_isTearingDown = 0;
}

- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4
{
  CGRect *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TSWPSelection *v17;
  TSWPSelection *v18;
  id v19;
  id v20;
  double x;
  double y;
  double width;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v6 = (CGRect *)MEMORY[0x24BDBF070];
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  objc_opt_class();
  v11 = (void *)TSUDynamicCast();
  if (objc_msgSend(v11, "isRange"))
  {
    objc_opt_class();
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
    v12 = (void *)TSUDynamicCast();
    if ((objc_msgSend(v12, "selectionLastModifiedWithKnob") & 1) != 0
      || objc_msgSend(v12, "selectionLastModifiedWithKeyboard"))
    {
      v13 = objc_msgSend(v12, "currentSelectionFlags");
      v14 = objc_msgSend(v11, "range");
      if (v13 < 0)
        v16 = v15 + v14 - 1;
      else
        v16 = v14;
      v17 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v16, 1);
      if (a3)
      {
        v18 = v17;
        v19 = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", a3, v17);
        if (v19)
        {
          v20 = -[TSDInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", v19);
          objc_msgSend(v20, "rectForSelection:", v18);
          x = v29.origin.x;
          y = v29.origin.y;
          width = v29.size.width;
          height = v29.size.height;
          if (!CGRectEqualToRect(v29, *v6))
          {
            objc_msgSend(v20, "rectInRoot:", x, y, width, height);
            v31 = CGRectInset(v30, 0.0, -20.0);
            v7 = v31.origin.x;
            v8 = v31.origin.y;
            v9 = v31.size.width;
            v10 = v31.size.height;
          }
        }
      }
    }
  }
  v25 = v7;
  v26 = v8;
  v27 = v9;
  v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)withLayoutForModel:(id)a3 withSelection:(id)a4 performBlock:(id)a5
{
  (*((void (**)(id, id))a5 + 2))(a5, -[TSDInteractiveCanvasController layoutForModel:withSelection:](self, "layoutForModel:withSelection:", a3, a4));
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 0;
}

- (BOOL)shouldRespondToTextHyperlinks
{
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerAllowsHyperlinkInteraction](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerAllowsHyperlinkInteraction");
  else
    return 1;
}

- (id)p_beginEditingPossibleContainedRep:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPInteractiveCanvasController p_beginEditingPossibleContainedRep:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 205, CFSTR("invalid nil value for '%s'"), "ioContainedRep");
  }
  objc_opt_class();
  objc_msgSend(*a3, "parentRep");
  v7 = (void *)TSUDynamicCast();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "willBeginEditingContainedRep");
    v9 = (id)objc_msgSend(v8, "containedRep");
    *a3 = v9;
  }
  else
  {
    v9 = *a3;
  }
  return -[TSDInteractiveCanvasController beginEditingRep:](self, "beginEditingRep:", v9);
}

- (id)beginEditingRepForInfo:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  TSWPSelection *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint64_t v14;

  -[TSDCanvas layoutIfNeeded](-[TSDInteractiveCanvasController canvas](self, "canvas"), "layoutIfNeeded");
  objc_opt_class();
  -[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", a3);
  v5 = (void *)TSUDynamicCast();
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(-[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", objc_msgSend(a3, "parentInfo")), "repForSelecting");
      if (v10)
      {
        v11 = v10;
        if ((objc_msgSend(v10, "isSelectedIgnoringLocking") & 1) == 0)
          -[TSDCanvasEditor setSelectionToRep:](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "setSelectionToRep:", v11);
      }
    }
    goto LABEL_12;
  }
  v14 = objc_msgSend(v5, "containedRep");
  if (!v14
    || ((v6 = -[TSWPInteractiveCanvasController p_beginEditingPossibleContainedRep:](self, "p_beginEditingPossibleContainedRep:", &v14), objc_opt_class(), v7 = (void *)TSUDynamicCast(), v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", 0, objc_msgSend((id)objc_msgSend(v7, "storage"), "length")), !objc_msgSend(v7, "pIsSelectionPlaceHolderTextWithSelection:", v8))? (v9 = 16640): (v9 = 0x4000), -[TSDInteractiveCanvasController setSelection:onModel:withFlags:](self, "setSelection:onModel:withFlags:", v8, objc_msgSend(v7, "storage"), v9),
        v8,
        !v6))
  {
LABEL_12:
    v13.receiver = self;
    v13.super_class = (Class)TSWPInteractiveCanvasController;
    return -[TSDInteractiveCanvasController beginEditingRepForInfo:](&v13, sel_beginEditingRepForInfo_, a3);
  }
  return v6;
}

- (void)resumeEditing
{
  TSDTextInputResponder *mTextInputResponder;

  mTextInputResponder = self->super.mTextInputResponder;
  if (mTextInputResponder)
    -[TSDTextInputResponder resumeEditing](mTextInputResponder, "resumeEditing");
  if (!-[TSWPInteractiveCanvasController isEditingText](self, "isEditingText")
    && (objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "isFirstResponder") & 1) == 0)
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "becomeFirstResponder");
  }
}

- (CGImage)textImageFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double MidX;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = *MEMORY[0x24BDAC8D0];
  MidX = CGRectGetMidX(a3);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](self, "hitRepsAtPoint:withSlop:", MidX, CGRectGetMidY(v24), *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_opt_class();
        v14 = (void *)TSUDynamicCast();
        if (v14)
        {
          v16 = v14;
          objc_msgSend(v14, "convertNaturalRectFromUnscaledCanvas:", x, y, width, height);
          return (CGImage *)objc_msgSend((id)objc_msgSend(v16, "textImageForRect:"), "CGImage");
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSWPInteractiveCanvasController;
  return -[TSDInteractiveCanvasController textImageFromRect:](&v17, sel_textImageFromRect_, x, y, width, height);
}

- (BOOL)isEditingText
{
  void *v3;
  int v4;

  objc_opt_class();
  -[TSDTextInput selection](-[TSDTextInputResponder editor](self->super.mTextInputResponder, "editor"), "selection");
  v3 = (void *)TSUDynamicCast();
  v4 = -[TSDTextInputResponder isFirstResponder](self->super.mTextInputResponder, "isFirstResponder");
  if (v4)
    LOBYTE(v4) = objc_msgSend(v3, "isValid");
  return v4;
}

- (BOOL)canHandleGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  objc_msgSend(a3, "unscaledLocationForICC:", self);
  v6 = v5;
  v8 = v7;
  v9 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  objc_opt_class();
  v10 = TSUDynamicCast();
  if (v10
    && ((v11 = (void *)v10,
         objc_opt_class(),
         -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor"), v12 = objc_msgSend((id)TSUDynamicCast(), "storage"), v12 != objc_msgSend(v11, "storage"))&& (objc_msgSend(v11, "shouldBeginEditingWithGesture:", a3) & 1) != 0|| (__CFString *)objc_msgSend(a3, "gestureKind") == CFSTR("TSWPTapAndTouch")&& (objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:", v6, v8), objc_msgSend(v11, "footnoteReferenceAttachmentAtPoint:"))))
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (!-[TSWPInteractiveCanvasController handleHyperlinksWithTextGRs](self, "handleHyperlinksWithTextGRs")
      || !-[TSWPInteractiveCanvasController shouldRespondToTextHyperlinks](self, "shouldRespondToTextHyperlinks"))
    {
      goto LABEL_11;
    }
    v13 = (void *)TSUProtocolCast();
    v14 = v13;
    if (!v13)
      goto LABEL_14;
    objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
    v16 = v15;
    v18 = v17;
    objc_opt_class();
    objc_msgSend(v14, "smartFieldAtPoint:", v16, v18);
    if (TSUDynamicCast()
      && (-[TSDInteractiveCanvasController delegate](self, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
    {
      LOBYTE(v14) = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:allowsHyperlinkWithGesture:forRep:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:allowsHyperlinkWithGesture:forRep:", self, a3, v9);
    }
    else
    {
LABEL_11:
      LOBYTE(v14) = 0;
    }
  }
LABEL_14:
  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v19 = (void *)TSUDynamicCast();
  if (!v19)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPInteractiveCanvasController canHandleGesture:]");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 462, CFSTR("invalid nil value for '%s'"), "cvc");
    if ((v14 & 1) == 0)
      goto LABEL_19;
LABEL_18:
    LOBYTE(v22) = 1;
    return (char)v22;
  }
  if ((v14 & 1) != 0)
    goto LABEL_18;
LABEL_19:
  if ((objc_msgSend((id)objc_msgSend(v19, "hyperlinkGestureRecognizer"), "isEnabled") & 1) != 0)
  {
LABEL_20:
    LOBYTE(v22) = 0;
    return (char)v22;
  }
  LODWORD(v22) = -[TSWPInteractiveCanvasController handleHyperlinksWithTextGRs](self, "handleHyperlinksWithTextGRs");
  if ((_DWORD)v22)
  {
    LODWORD(v22) = -[TSWPInteractiveCanvasController shouldRespondToTextHyperlinks](self, "shouldRespondToTextHyperlinks");
    if ((_DWORD)v22)
    {
      v22 = (void *)TSUProtocolCast();
      if (v22)
      {
        v23 = v22;
        objc_msgSend(v22, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
        v25 = v24;
        v27 = v26;
        objc_opt_class();
        objc_msgSend(v23, "smartFieldAtPoint:", v25, v27);
        v22 = (void *)TSUDynamicCast();
        if (v22)
        {
          if ((__CFString *)objc_msgSend(a3, "gestureKind") != CFSTR("TSWPImmediateSingleTap"))
          {
            if ((__CFString *)objc_msgSend(a3, "gestureKind") != CFSTR("TSWPLongPress"))
              goto LABEL_20;
            LODWORD(v22) = -[TSDInteractiveCanvasController inReadMode](self, "inReadMode");
            if (!(_DWORD)v22)
              return (char)v22;
          }
          goto LABEL_18;
        }
      }
    }
  }
  return (char)v22;
}

- (BOOL)handleGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  TSDInteractiveCanvasControllerDelegate *v27;
  id v28;
  uint64_t v29;
  int v30;
  id v32;

  objc_msgSend(a3, "unscaledLocationForICC:", self);
  v6 = v5;
  v8 = v7;
  v9 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  objc_opt_class();
  v10 = (void *)TSUDynamicCast();
  v32 = v10;
  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v11 = (void *)TSUDynamicCast();
  if (!v11)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPInteractiveCanvasController handleGesture:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 495, CFSTR("invalid nil value for '%s'"), "cvc");
  }
  objc_msgSend(v11, "cancelDelayedTapAction");
  if (!-[TSWPInteractiveCanvasController handleHyperlinksWithTextGRs](self, "handleHyperlinksWithTextGRs"))
    goto LABEL_11;
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:allowsHyperlinkWithGesture:forRep:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:allowsHyperlinkWithGesture:forRep:", self, a3, v9))
  {
    goto LABEL_11;
  }
  v14 = (void *)TSUProtocolCast();
  if (!v14)
    goto LABEL_11;
  v15 = v14;
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
  v17 = v16;
  v19 = v18;
  objc_opt_class();
  objc_msgSend(v15, "smartFieldAtPoint:", v17, v19);
  v20 = TSUDynamicCast();
  if (!v20
    || (v21 = v20, objc_msgSend(a3, "gestureState") != 3)
    || (v22 = objc_msgSend(v11, "actionForHyperlink:inRep:gesture:", v21, v15, a3)) == 0)
  {
LABEL_11:
    if (!v10)
      goto LABEL_28;
    objc_opt_class();
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
    v24 = (void *)TSUDynamicCast();
    if (!v24 || (v25 = objc_msgSend(v24, "storage"), v25 == objc_msgSend(v10, "storage")))
    {
      objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
      v23 = objc_msgSend(v10, "footnoteReferenceAttachmentAtPoint:");
      if (!v23)
      {
LABEL_18:
        if ((v23 & 1) != 0)
          return v23;
        objc_opt_class();
        -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
        v28 = (id)TSUDynamicCast();
        v29 = objc_msgSend(v28, "storage");
        if (v29 != objc_msgSend(v10, "storage")
          && objc_msgSend(v10, "shouldBeginEditingWithGesture:", a3))
        {
          v30 = objc_msgSend((id)objc_msgSend(v28, "selection"), "isValid");
          v28 = -[TSWPInteractiveCanvasController p_beginEditingPossibleContainedRep:](self, "p_beginEditingPossibleContainedRep:", &v32);
          if (!objc_msgSend(v32, "canEditWithEditor:", v28))
            v28 = 0;
          objc_msgSend(a3, "setTargetRep:", v32);
          if (v30 && (__CFString *)objc_msgSend(a3, "gestureKind") == CFSTR("TSWPImmediateSingleTap"))
            objc_msgSend(v28, "setIsBecomingActive:", 1);
        }
        if (v28)
        {
          LOBYTE(v23) = -[TSDGestureDispatcher handleGesture:withTarget:](-[TSDInteractiveCanvasController gestureDispatcher](self, "gestureDispatcher"), "handleGesture:withTarget:", a3, v28);
          return v23;
        }
LABEL_28:
        LOBYTE(v23) = 0;
        return v23;
      }
      v26 = v23;
      v27 = -[TSDInteractiveCanvasController delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LOBYTE(v23) = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:tappedOnFootnoteAttachment:](v27, "interactiveCanvasController:tappedOnFootnoteAttachment:", self, v26);
        goto LABEL_18;
      }
    }
    LOBYTE(v23) = 0;
    goto LABEL_18;
  }
  objc_msgSend(v11, "startDelayedTapAction:", v22);
  LOBYTE(v23) = 1;
  return v23;
}

- (void)gestureSequenceWillBegin
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v3 = (void *)TSUDynamicCast();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPInteractiveCanvasController gestureSequenceWillBegin]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 627, CFSTR("invalid nil value for '%s'"), "cvc");
  }
  objc_msgSend(v3, "gestureSequenceWillBegin");
}

- (void)gestureSequenceDidEnd
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v3 = (void *)TSUDynamicCast();
  if (!v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPInteractiveCanvasController gestureSequenceDidEnd]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPInteractiveCanvasController.mm"), 635, CFSTR("invalid nil value for '%s'"), "cvc");
  }
  objc_msgSend(v3, "gestureSequenceDidEnd");
}

- (void)didBeginEditingText
{
  void *v3;

  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v3 = (void *)TSUDynamicCast();
  if (objc_msgSend(v3, "onlyAllowTextSwipesWhenEditing"))
    objc_msgSend(v3, "addSwipeGestureRecognizers");
}

- (void)willEndEditingText
{
  void *v3;

  objc_opt_class();
  -[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  v3 = (void *)TSUDynamicCast();
  if (objc_msgSend(v3, "onlyAllowTextSwipesWhenEditing"))
    objc_msgSend(v3, "removeSwipeGestureRecognizers");
}

- (BOOL)suppressDoubleTapForSelection
{
  return 0;
}

- (BOOL)textRepsShouldTileAggressively
{
  return 0;
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  if (v8 && (v9 = v8, (id)objc_msgSend(v8, "storage") == a4))
  {
    objc_msgSend(a5, "addObject:", v9);
  }
  else
  {
    v10 = (void *)TSUProtocolCast();
    if (v10)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = (void *)objc_msgSend(v10, "childReps", 0);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            -[TSWPInteractiveCanvasController p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), a4, a5);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }
    }
  }
}

- (id)_repsForStorage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", -[TSWPInteractiveCanvasController p_repsForStorage:](self, "p_repsForStorage:", a3));
}

- (id)p_repsForStorage:(id)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = -[TSDInteractiveCanvasController infosToDisplay](self, "infosToDisplay");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[TSWPInteractiveCanvasController p_recursivelyAddRep:forStorage:toSet:](self, "p_recursivelyAddRep:forStorage:toSet:", -[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++)), a3, v5);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSWPInteractiveCanvasController _repsForStorage:](self, "_repsForStorage:", a4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  v11 = INFINITY;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v13, "frameInUnscaledCanvas");
      v14 = v29.origin.x;
      v15 = v29.origin.y;
      width = v29.size.width;
      height = v29.size.height;
      v28.x = x;
      v28.y = y;
      if (CGRectContainsPoint(v29, v28))
        return v13;
      v30.origin.x = v14;
      v30.origin.y = v15;
      v30.size.width = width;
      v30.size.height = height;
      MidX = CGRectGetMidX(v30);
      v31.origin.x = v14;
      v31.origin.y = v15;
      v31.size.width = width;
      v31.size.height = height;
      MidY = CGRectGetMidY(v31);
      v20 = TSDDistance(x, y, MidX, MidY);
      if (v20 < v11)
      {
        v11 = v20;
        v9 = v13;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
      continue;
    break;
  }
  return v9;
}

- (id)closestRepToPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDInteractiveCanvasController topLevelRepsForHitTesting](self, "topLevelRepsForHitTesting");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v23;
  v10 = INFINITY;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v5);
      objc_opt_class();
      v12 = (void *)TSUDynamicCast();
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "frameInUnscaledCanvas");
        v14 = v29.origin.x;
        v15 = v29.origin.y;
        width = v29.size.width;
        height = v29.size.height;
        v28.x = x;
        v28.y = y;
        if (CGRectContainsPoint(v29, v28))
          return v13;
        v30.origin.x = v14;
        v30.origin.y = v15;
        v30.size.width = width;
        v30.size.height = height;
        MidX = CGRectGetMidX(v30);
        v31.origin.x = v14;
        v31.origin.y = v15;
        v31.size.width = width;
        v31.size.height = height;
        MidY = CGRectGetMidY(v31);
        v20 = TSDDistance(x, y, MidX, MidY);
        if (v20 < v10)
        {
          v10 = v20;
          v8 = v13;
        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v13 = v8;
  }
  while (v7);
  return v13;
}

- (BOOL)zoomColumnAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)hyperlinkPopoverIsShown
{
  return 0;
}

- (BOOL)cellCommentsAllowedForTableInfo:(id)a3
{
  return 1;
}

- (BOOL)showsComments
{
  return 0;
}

- (id)infosToHideForCanvas:(id)a3
{
  return 0;
}

- (BOOL)isTearingDown
{
  return self->_isTearingDown;
}

@end
