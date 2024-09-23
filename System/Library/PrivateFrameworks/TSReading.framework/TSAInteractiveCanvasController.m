@implementation TSAInteractiveCanvasController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAInteractiveCanvasController;
  -[TSWPInteractiveCanvasController dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSAInteractiveCanvasController;
  -[TSWPInteractiveCanvasController teardown](&v2, sel_teardown);
}

- (void)loadDocument
{
  TSKDocumentRoot *v3;

  v3 = -[TSDInteractiveCanvasController documentRoot](self, "documentRoot");
  -[TSKChangeNotifier addObserver:forChangeSource:](-[TSKDocumentRoot changeNotifier](v3, "changeNotifier"), "addObserver:forChangeSource:", self, v3);
}

- (void)unloadDocument
{
  TSKDocumentRoot *v3;

  v3 = -[TSDInteractiveCanvasController documentRoot](self, "documentRoot");
  -[TSKChangeNotifier removeObserver:forChangeSource:](-[TSKDocumentRoot changeNotifier](v3, "changeNotifier"), "removeObserver:forChangeSource:", self, v3);
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 1;
}

- (void)handleHyperlinkGesture:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "openURL:", objc_msgSend((id)objc_msgSend(a3, "hitField"), "url"));
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)TSAInteractiveCanvasController;
  -[TSDInteractiveCanvasController asyncProcessChanges:forChangeSource:](&v15, sel_asyncProcessChanges_forChangeSource_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "kind");
          if (v10 == 100)
          {
            -[TSDInteractiveCanvasController recreateAllLayoutsAndReps](self, "recreateAllLayoutsAndReps");
          }
          else if (v10 == 3)
          {
            -[TSDInteractiveCanvasController setShouldAutoscrollToSelectionAfterLayout:](self, "setShouldAutoscrollToSelectionAfterLayout:", 1);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
  }
}

- (void)selectAll:(id)a3
{
  -[TSDInteractiveCanvasController makeEditorPerformAction:withSender:](self, "makeEditorPerformAction:withSender:", a2, a3);
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  void *v6;

  objc_opt_class();
  -[TSDInteractiveCanvasController layerHost](self, "layerHost");
  v6 = (void *)TSUDynamicCast();
  objc_msgSend((id)objc_msgSend(v6, "hyperlinkGestureRecognizer"), "setEnabled:", objc_msgSend(v6, "wantsHyperlinkGestureRecognizer"));
}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3, a4, a5), "asiOSCVC"), "knobDragGestureRecognizer"), "setEnabled:", 1);
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  id v4;
  TSDDrawableInfo *v5;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSAInteractiveCanvasController;
  v4 = -[TSDInteractiveCanvasController additionalVisibleInfosForCanvas:](&v8, sel_additionalVisibleInfosForCanvas_, a3);
  if (!self->super.super.mCreateRepsForOffscreenLayouts)
  {
    v5 = -[TSAInteractiveCanvasController infoBeingDragInserted](self, "infoBeingDragInserted");
    if (v5)
    {
      if (v4)
        return (id)objc_msgSend(v4, "setByAddingObject:", v5);
      else
        return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
    }
  }
  return v4;
}

- (BOOL)hasEmptyWPSelection
{
  int v3;
  void *v4;

  if (-[NSSet count](-[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection"), "infos"), "count"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
    v4 = (void *)objc_msgSend((id)TSUDynamicCast(), "selection");
    if (!v4 || (v3 = objc_msgSend(v4, "isEmpty")) != 0)
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)requiresSimilarInfos
{
  return 1;
}

- (BOOL)hasInspectableSelection
{
  id v2;
  char v3;
  void *v4;

  v2 = -[TSDEditorController mostSpecificCurrentEditorOfClass:](-[TSDInteractiveCanvasController editorController](self, "editorController"), "mostSpecificCurrentEditorOfClass:", 0);
  v3 = objc_opt_respondsToSelector();
  v4 = 0;
  if ((v3 & 1) != 0)
    v4 = (void *)objc_msgSend(v2, "topLevelInspectorViewControllers");
  return objc_msgSend(v4, "count") != 0;
}

- (id)p_activeTextRep
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_opt_class();
  -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
  v3 = (void *)TSUDynamicCast();
  v4 = (void *)objc_msgSend(v3, "storage");
  v5 = objc_msgSend(v3, "selection");
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 0;
  v7 = v5;
  objc_msgSend(v4, "parentInfo");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 0;
  v8 = -[TSDInteractiveCanvasController layoutForModel:withSelection:](self, "layoutForModel:withSelection:", v4, v7);
  if (!v8)
    return 0;
  v9 = v8;
  objc_opt_class();
  -[TSDInteractiveCanvasController repForLayout:](self, "repForLayout:", v9);
  return (id)TSUDynamicCast();
}

- (BOOL)wantsCanvasReferenceController
{
  return 0;
}

- (TSDDrawableInfo)infoBeingDragInserted
{
  return self->mInfoBeingDragInserted;
}

- (void)setInfoBeingDragInserted:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 680);
}

- (BOOL)supportsAnnotations
{
  return self->_supportsAnnotations;
}

- (TSAAnnotationController)annotationController
{
  return self->_annotationController;
}

@end
