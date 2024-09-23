@implementation TSDCanvasEditor

- (UIView)inputView
{
  UIView *result;
  id v4;

  result = self->mInputView;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    result = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    self->mInputView = result;
  }
  return result;
}

- (BOOL)wantsKeyboard
{
  return 1;
}

- (void)insertText:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("\t")))
    -[TSDCanvasEditor insertTab:](self, "insertTab:", 0);
}

- (UIView)inputAccessoryView
{
  return 0;
}

- (int64_t)returnKeyType
{
  return 0;
}

- (id)textColorAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)textFontAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6
{
  return 0;
}

- (BOOL)isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  return 0;
}

- (_NSRange)markedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)editRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)textLength
{
  return 0;
}

- (id)textInRange:(_NSRange)a3
{
  return 0;
}

- (CGRect)firstRectForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(_NSRange)a3
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = 0;
  v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)selectionWithRange:(_NSRange)a3
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 1;
}

+ (id)canvasSelectionWithInfos:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "canvasSelectionWithInfos:andContainer:", a3, 0);
}

- (id)canvasSelectionWithInfos:(id)a3
{
  return -[TSDCanvasEditor canvasSelectionWithInfos:andContainer:](self, "canvasSelectionWithInfos:andContainer:", a3, 0);
}

+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "canvasEditorHelperClass"), "canvasSelectionWithInfos:andContainer:", a3, a4);
}

- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  return -[TSDCanvasEditorHelper canvasSelectionWithInfos:andContainer:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "canvasSelectionWithInfos:andContainer:", a3, a4);
}

- (void)setSelectionToInfo:(id)a3
{
  if (a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:");
  -[TSDCanvasEditor setSelection:](self, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](self, "canvasSelectionWithInfos:", a3));
}

- (void)setSelectionToInfos:(id)a3
{
  -[TSDCanvasEditor setSelection:](self, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](self, "canvasSelectionWithInfos:", a3));
}

- (BOOL)isRepSelectable:(id)a3
{
  return -[TSDCanvasEditorHelper isRepSelectable:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "isRepSelectable:", a3);
}

- (id)keyCommands
{
  if (keyCommands_onceToken != -1)
    dispatch_once(&keyCommands_onceToken, &__block_literal_global_30);
  return (id)keyCommands_s_keyCommands;
}

id __30__TSDCanvasEditor_keyCommands__block_invoke()
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x24BDAC8D0];
  v1[0] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("k"), 1179648, sel_addOrShowComment_);
  v1[1] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("k"), 1572864, sel_nextAnnotation_);
  v1[2] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("k"), 1703936, sel_previousAnnotation_);
  v1[3] = objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", CFSTR("d"), 0x100000, sel_duplicate_);
  keyCommands_s_keyCommands = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 4);
  return (id)keyCommands_s_keyCommands;
}

- (BOOL)canDeleteComment
{
  return -[TSDCanvasEditorHelper canDeleteComment](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "canDeleteComment");
}

+ (Class)canvasEditorHelperClass
{
  return (Class)objc_opt_class();
}

- (TSDCanvasEditor)initWithInteractiveCanvasController:(id)a3
{
  TSDCanvasEditor *v4;
  TSDCanvasEditor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDCanvasEditor;
  v4 = -[TSDCanvasEditor init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mInteractiveCanvasController = (TSDInteractiveCanvasController *)a3;
    v4->mCanvasEditorHelper = (TSDCanvasEditorHelper *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "canvasEditorHelperClass")), "initWithCanvasEditor:", v4);
  }
  return v5;
}

- (void)teardown
{
  -[TSDCanvasEditorHelper teardown](self->mCanvasEditorHelper, "teardown");
  self->mInteractiveCanvasController = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasEditor;
  -[TSDCanvasEditor dealloc](&v3, sel_dealloc);
}

- (TSDCanvasEditorHelper)canvasEditorHelper
{
  return self->mCanvasEditorHelper;
}

- (id)documentRoot
{
  return -[TSDInteractiveCanvasController documentRoot](self->mInteractiveCanvasController, "documentRoot");
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mInteractiveCanvasController;
}

- (BOOL)isSelectedInfo:(id)a3
{
  return -[NSSet containsObject:](-[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](self, "canvasSelection"), "infos"), "containsObject:", a3);
}

- (TSPObject)modelForSelection
{
  return -[TSPObjectContext documentObject](-[TSDInteractiveCanvasController objectContext](self->mInteractiveCanvasController, "objectContext"), "documentObject");
}

- (void)canvasInfosDidChange
{
  NSSet *v3;
  NSSet *v4;

  v3 = -[TSDCanvasSelection infos](self->mSelection, "infos");
  if (-[NSSet count](v3, "count"))
  {
    v4 = -[TSDCanvasEditor p_filterNonDisplayedInfos:](self, "p_filterNonDisplayedInfos:", v3);
    if (v4 != v3)
      -[TSDCanvasEditor setSelection:](self, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](self, "canvasSelectionWithInfos:", v4));
  }
}

- (void)repWasCreated:(id)a3
{
  if (objc_msgSend(a3, "isSelectedIgnoringLocking"))
    objc_msgSend(a3, "becameSelected");
}

- (id)p_filterNonDisplayedInfos:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", -[TSDInteractiveCanvasController infosToDisplay](self->mInteractiveCanvasController, "infosToDisplay"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v7)
  {

LABEL_14:
    return a3;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(a3);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      if (objc_msgSend(v6, "containsObject:", TSDTopmostInfoFromInfo(v12)))
        objc_msgSend(v5, "addObject:", v12);
      else
        v9 = 1;
    }
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v8);

  if ((v9 & 1) == 0)
    goto LABEL_14;
  return v5;
}

- (Class)editorClassForSelection
{
  return -[TSDCanvasEditorHelper editorClassForSelection:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "editorClassForSelection:", self->mSelection);
}

- (id)editorToPopToOnEndEditing
{
  return -[TSDCanvasEditorHelper editorToPopToOnEndEditingForSelection:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "editorToPopToOnEndEditingForSelection:", self->mSelection);
}

- (BOOL)shouldUseAlternateSelectionHighlight
{
  return 0;
}

- (unint64_t)countOfDrawables
{
  return objc_msgSend(-[TSDCanvasEditor drawables](self, "drawables"), "count");
}

- (id)drawables
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditor drawables]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 470, CFSTR("subclass responsibility"));
  return 0;
}

- (BOOL)shouldPushNewEditorForNewSelection
{
  TSDCanvasSelection *mSelection;

  mSelection = self->mSelection;
  if (mSelection)
    LOBYTE(mSelection) = -[TSDCanvasSelection infoCount](mSelection, "infoCount") != 0;
  return (char)mSelection;
}

- (TSKSelection)selection
{
  return &self->mSelection->super;
}

- (TSDTextSelection)textInputSelection
{
  objc_opt_class();
  return (TSDTextSelection *)TSUClassAndProtocolCast();
}

- (void)setSelection:(id)a3
{
  -[TSDCanvasEditor setSelection:withFlags:](self, "setSelection:withFlags:", a3, 0);
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  TSDInteractiveCanvasController *v6;
  TSDCanvasSelection *v7;
  TSDCanvasSelection *v8;
  TSDCanvasSelection *mSelection;

  v6 = -[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController");
  objc_opt_class();
  v7 = (TSDCanvasSelection *)TSUDynamicCast();
  v8 = v7;
  if (v7 != self->mSelection && !-[TSDCanvasSelection isEqual:](v7, "isEqual:"))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v6, "layerHost"), "asiOSCVC"), "setContextMenuMightBeDisplayed:", 0);
    mSelection = self->mSelection;
    self->mSelection = v8;
    -[TSDCanvasEditorHelper notifyRepsForSelectionChangeFrom:to:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "notifyRepsForSelectionChangeFrom:to:", -[TSDCanvasSelection infos](mSelection, "infos"), -[TSDCanvasSelection infos](self->mSelection, "infos"));

    -[TSDEditorController editorDidChangeSelection:withSelectionFlags:](-[TSDInteractiveCanvasController editorController](v6, "editorController"), "editorDidChangeSelection:withSelectionFlags:", self, a4);
    -[TSDCanvasEditorHelper pushNewEditorForSelection:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "pushNewEditorForSelection:", self->mSelection);
  }
}

- (void)setSelectionToRep:(id)a3
{
  -[TSDCanvasEditor setSelection:](self, "setSelection:", -[TSDCanvasEditorHelper canvasSelectionFromRep:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "canvasSelectionFromRep:", a3));
}

- (id)pasteboardController
{
  return (id)objc_msgSend(-[TSDCanvasEditor documentRoot](self, "documentRoot"), "pasteboardController");
}

- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor
{
  return 1;
}

- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3
{
  double y;
  double x;
  TSDInteractiveCanvasController *v5;
  id v6;

  y = a3.y;
  x = a3.x;
  v5 = -[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  v6 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, &__block_literal_global_77);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isEditing") & 1) == 0)
    -[TSDInteractiveCanvasController beginEditingRep:](v5, "beginEditingRep:", v6);
}

BOOL __61__TSDCanvasEditor_beginAutomaticTextEditingIfNeededForPoint___block_invoke(uint64_t a1, void *a2)
{
  return (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(a2, "containsText") & 1) != 0;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "canvasEditorHelperClass"), "physicalKeyboardIsSender:", a3);
}

- (BOOL)canCopyStyle
{
  return 0;
}

- (BOOL)canvasEditorCanDeleteWithSender:(id)a3
{
  TSDCanvasSelection *v3;

  v3 = -[TSDCanvasEditor canvasSelection](self, "canvasSelection", a3);
  if (v3)
    LOBYTE(v3) = -[TSDCanvasSelection unlockedInfoCount](v3, "unlockedInfoCount") != 0;
  return (char)v3;
}

- (BOOL)canvasEditorCanCopyWithSender:(id)a3
{
  TSDCanvasSelection *v3;

  v3 = -[TSDCanvasEditor canvasSelection](self, "canvasSelection", a3);
  if (v3)
    LOBYTE(v3) = -[TSDCanvasSelection unlockedInfoCount](v3, "unlockedInfoCount") != 0;
  return (char)v3;
}

- (BOOL)canvasEditorCanCutWithSender:(id)a3
{
  _BOOL4 v5;

  v5 = -[TSDCanvasEditor canvasEditorCanDeleteWithSender:](self, "canvasEditorCanDeleteWithSender:");
  if (v5)
    LOBYTE(v5) = -[TSDCanvasEditor canvasEditorCanCopyWithSender:](self, "canvasEditorCanCopyWithSender:", a3);
  return v5;
}

- (BOOL)canSelectAllWithSender:(id)a3
{
  int v5;

  if (!-[TSDCanvasSelection infoCount](-[TSDCanvasEditor canvasSelection](self, "canvasSelection"), "infoCount")
    || (v5 = objc_msgSend((id)objc_opt_class(), "physicalKeyboardIsSender:", a3)) != 0)
  {
    LOBYTE(v5) = -[TSDCanvasEditor countOfDrawables](self, "countOfDrawables") != 0;
  }
  return v5;
}

- (BOOL)canGroupWithSender:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDCanvasSelection infosOfClass:](self->mSelection, "infosOfClass:", objc_opt_class());
  v5 = -[TSDCanvasSelection infoCount](self->mSelection, "infoCount");
  if (v5 == objc_msgSend(v4, "count")
    && (v14 = 0u,
        v15 = 0u,
        v12 = 0u,
        v13 = 0u,
        (v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16)) != 0))
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v4);
        if (-[TSDCanvasEditor canGroupDrawable:](self, "canGroupDrawable:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)))
        {
          if (v8)
          {
            v8 = 2;
            return v8 > 1;
          }
          v8 = 1;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8 > 1;
}

- (BOOL)canUngroupWithSender:(id)a3
{
  return -[TSDCanvasEditorHelper canUngroupWithSelection:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3), "canUngroupWithSelection:", self->mSelection);
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  int result;
  uint64_t v7;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x24BDAC8D0];
  v8[0] = sel_deleteBackward_;
  v8[1] = sel_deleteForward_;
  v8[2] = sel_deleteToBeginningOfLine_;
  v8[3] = sel_deleteToEndOfLine_;
  v8[4] = sel_deleteWordBackward_;
  v8[5] = sel_deleteWordForward_;
  v8[6] = sel_insertTab_;
  v8[7] = sel_insertBacktab_;
  v8[8] = sel_scrollToBeginningOfDocument_;
  v8[9] = sel_scrollToEndOfDocument_;
  result = -[TSDCanvasEditorHelper canPerformEditorAction:withSender:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "canPerformEditorAction:withSender:", a3, a4);
  if (!result)
  {
    v7 = 0;
    while (!sel_isEqual(a3, (SEL)v8[v7]))
    {
      if (++v7 == 10)
      {
        result = 0;
        goto LABEL_8;
      }
    }
    result = 1;
LABEL_8:
    if (sel_select_ == a3)
    {
      return -1;
    }
    else if (sel_addOrShowComment_ == a3)
    {
      if (-[TSDCanvasEditor canAddOrShowComment](self, "canAddOrShowComment"))
        return 1;
      else
        return -1;
    }
  }
  return result;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (NSSet)infosForSelectAllInRoot
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", -[TSDCanvasEditor drawables](self, "drawables"));
}

- (void)selectAll:(id)a3
{
  TSDContainerRep *v4;
  NSSet *v5;

  v4 = -[TSDInteractiveCanvasController topLevelContainerRepForEditing](-[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3), "topLevelContainerRepForEditing");
  if (v4)
    v5 = (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", -[TSDContainerInfo childInfos](-[TSDContainerRep containerInfo](v4, "containerInfo"), "childInfos"));
  else
    v5 = -[TSDCanvasEditor infosForSelectAllInRoot](self, "infosForSelectAllInRoot");
  -[TSDCanvasEditor setSelectionToInfos:](self, "setSelectionToInfos:", v5);
  objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mInteractiveCanvasController, "layerHost"), "asiOSCVC"), "showEditMenuForSelection:", self->mSelection);
}

- (BOOL)canGroupDrawable:(id)a3
{
  return objc_msgSend(a3, "isLocked") ^ 1;
}

- (void)connectWithConnectionLine:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditor connectWithConnectionLine:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 1029, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDCanvasEditor connectWithConnectionLine:]"), 0));
}

- (id)p_nextInfoInTabSequence:(int)a3
{
  id result;
  TSDCanvasSelection *v6;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  result = -[TSDCanvasEditor countOfDrawables](self, "countOfDrawables");
  if (result)
  {
    v6 = -[TSDCanvasEditor canvasSelection](self, "canvasSelection");
    v7 = -[TSDCanvasSelection infoCount](v6, "infoCount");
    v8 = (id)objc_msgSend(-[TSDCanvasEditor p_spatiallySortedDrawables](self, "p_spatiallySortedDrawables"), "mutableCopy");
    v9 = v8;
    if (!a3 && !v7)
      return (id)objc_msgSend(v8, "firstObject");
    if (a3 == 1 && !v7)
      return (id)objc_msgSend(v8, "lastObject");
    v10 = -[TSDCanvasEditor countOfDrawables](self, "countOfDrawables");
    if (v10 - 1 >= 2)
    {
      v11 = v10 - 2;
      do
      {
        v12 = (void *)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v11 + 1), "geometry");
        v13 = (void *)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v11), "geometry");
        objc_msgSend(v13, "size");
        v15 = v14;
        objc_msgSend(v12, "position");
        v17 = v16;
        objc_msgSend(v13, "position");
        if (v17 < v18)
        {
          v19 = v15 * 0.33;
          objc_msgSend(v13, "position");
          v21 = v20;
          objc_msgSend(v12, "position");
          if (v21 >= v22 - v19)
          {
            objc_msgSend(v13, "position");
            v24 = v23;
            objc_msgSend(v12, "position");
            if (v24 < v19 + v25)
              objc_msgSend(v9, "exchangeObjectAtIndex:withObjectAtIndex:", v11 + 1, v11);
          }
        }
      }
      while (v11-- > 1);
    }
    if (v7 == 1)
    {
      v27 = objc_msgSend(v9, "indexOfObject:", -[NSSet anyObject](-[TSDCanvasSelection infos](v6, "infos"), "anyObject"));
    }
    else
    {
      v28 = (void *)-[NSArray mutableCopy](-[NSSet allObjects](-[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](self, "canvasSelection"), "infos"), "allObjects"), "mutableCopy");
      objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_434);
      if (a3 == 1)
        v29 = objc_msgSend(v28, "firstObject");
      else
        v29 = objc_msgSend(v28, "lastObject");
      v27 = objc_msgSend(v9, "indexOfObject:", v29);

    }
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditor p_nextInfoInTabSequence:]");
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditor.m"), 1140, CFSTR("couldn't find selected info in all drawables!"));
    }
    else if (a3 == 1 && !v27)
    {
      v32 = -[TSDCanvasEditor countOfDrawables](self, "countOfDrawables") - 1;
LABEL_31:
      objc_opt_class();
      objc_msgSend(v9, "objectAtIndex:", v32);
      return (id)TSUDynamicCast();
    }
    v33 = -[TSDCanvasEditor countOfDrawables](self, "countOfDrawables");
    if (a3 == 1)
      v34 = v27 - 1;
    else
      v34 = v27 + 1;
    v32 = v34 % v33;
    goto LABEL_31;
  }
  return result;
}

+ (id)spatialInfoComparator
{
  return &__block_literal_global_434;
}

- (id)p_spatiallySortedDrawables
{
  return (id)objc_msgSend(-[TSDCanvasEditor drawables](self, "drawables"), "sortedArrayUsingComparator:", &__block_literal_global_434);
}

- (void)insertTab:(id)a3
{
  -[TSDCanvasEditor setSelectionToInfo:](self, "setSelectionToInfo:", -[TSDCanvasEditor p_nextInfoInTabSequence:](self, "p_nextInfoInTabSequence:", 0));
}

- (void)insertBacktab:(id)a3
{
  -[TSDCanvasEditor setSelectionToInfo:](self, "setSelectionToInfo:", -[TSDCanvasEditor p_nextInfoInTabSequence:](self, "p_nextInfoInTabSequence:", 1));
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  TSDInteractiveCanvasController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3);
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v3, "layerHost"), "canvasLayer"), "contentInset");
  v5 = v4;
  -[TSDInteractiveCanvasController contentOffset](v3, "contentOffset");
  v7 = v6;
  -[TSDInteractiveCanvasController viewScale](v3, "viewScale");
  -[TSDInteractiveCanvasController setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v7, v5 / v8);
}

- (void)scrollToEndOfDocument:(id)a3
{
  TSDInteractiveCanvasController *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGRect v14;

  v3 = -[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3);
  -[TSDCanvasView bounds](-[TSDInteractiveCanvasController canvasView](v3, "canvasView"), "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TSDInteractiveCanvasController contentOffset](v3, "contentOffset");
  v13 = v12;
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  -[TSDInteractiveCanvasController setContentOffset:animated:](v3, "setContentOffset:animated:", 0, v13, CGRectGetMaxY(v14));
}

- (void)p_notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  -[TSDCanvasEditorHelper notifyRepsForSelectionChangeFrom:to:](-[TSDCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"), "notifyRepsForSelectionChangeFrom:to:", a3, a4);
}

@end
