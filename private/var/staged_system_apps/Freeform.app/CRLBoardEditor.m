@implementation CRLBoardEditor

- (CRLBoardEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLBoardEditor *v5;
  CRLBoardEditor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardEditor;
  v5 = -[CRLBoardEditor init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);

  return v6;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardEditor interactiveCanvasController](self, "interactiveCanvasController", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  return v6;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  return a4;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;

  v5 = a3;
  v7 = objc_opt_class(_TtC8Freeform17CRLBoardSelection, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  return isKindOfClass & 1;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (CRLEditorController)editorController
{
  return self->_editorController;
}

- (void)setEditorController:(id)a3
{
  objc_storeStrong((id *)&self->_editorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorController, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
