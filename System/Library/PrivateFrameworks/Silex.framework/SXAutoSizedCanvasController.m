@implementation SXAutoSizedCanvasController

- (SXAutoSizedCanvasController)initWithDocumentRoot:(id)a3 actionHandler:(id)a4 dragItemProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXAutoSizedCanvasController *v12;
  SXAutoSizedCanvasController *v13;
  uint64_t v14;
  SXTextTangierInteractiveCanvasController *v15;
  SXTextTangierCanvasViewController *v16;
  SXTextTangierInteractiveCanvasController *icc;
  SXTextTangierInteractiveCanvasController *v18;
  SXTextTangierCanvasViewController *cvc;
  SXTextTangierCanvasViewController *v20;
  id v22;
  id v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SXAutoSizedCanvasController;
  v12 = -[SXAutoSizedCanvasController init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentRoot, a3);
    objc_storeStrong((id *)&v13->_actionHandler, a4);
    objc_storeStrong((id *)&v13->_dragItemProvider, a5);
    v22 = 0;
    v23 = 0;
    v14 = objc_opt_class();
    +[SXTextTangierInteractiveCanvasController createCanvasWithDelegate:outICC:outLayerHost:iccClass:layerHostClass:](SXTextTangierInteractiveCanvasController, "createCanvasWithDelegate:outICC:outLayerHost:iccClass:layerHostClass:", v13, &v23, &v22, v14, objc_opt_class());
    v15 = (SXTextTangierInteractiveCanvasController *)v23;
    v16 = (SXTextTangierCanvasViewController *)v22;
    icc = v13->_icc;
    v13->_icc = v15;
    v18 = v15;

    cvc = v13->_cvc;
    v13->_cvc = v16;
    v20 = v16;

    -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](v13->_icc, "setAllowLayoutAndRenderOnThread:", 1);
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](v13->_icc, "setCreateRepsForOffscreenLayouts:", 1);

  }
  return v13;
}

- (void)teardown
{
  -[SXTextTangierInteractiveCanvasController teardown](self->_icc, "teardown");
  -[TSWPiOSCanvasViewController teardown](self->_cvc, "teardown");
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSDCanvasView)canvasView
{
  return -[TSDiOSCanvasViewController canvasView](self->_cvc, "canvasView");
}

- (CGSize)sizeThatFits
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGSize result;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[SXAutoSizedCanvasController icc](self, "icc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[TSDInteractiveCanvasController layoutController](self->_icc, "layoutController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rootLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "addLayoutsToArray:", v9);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v14);
        NSClassFromString(CFSTR("TSWPLayout"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "frame");
          v36.origin.x = v16;
          v36.origin.y = v17;
          v36.size.width = v18;
          v36.size.height = v19;
          v34.origin.x = x;
          v34.origin.y = y;
          v34.size.width = width;
          v34.size.height = height;
          v35 = CGRectUnion(v34, v36);
          x = v35.origin.x;
          y = v35.origin.y;
          width = v35.size.width;
          height = v35.size.height;
          objc_msgSend(v15, "columns");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "range");
          objc_msgSend(v21, "columnRectForRange:", v22 - 1, 1);
          self->_lineHeight = v23;

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  self->_frame.origin.x = x;
  self->_frame.origin.y = y;
  self->_frame.size.width = width;
  self->_frame.size.height = height;

  v24 = width;
  v25 = height;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)invalidateLayoutsAndFrames
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController layoutController](self->_icc, "layoutController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "addLayoutsToArray:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        NSClassFromString(CFSTR("TSDLayout"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "invalidateFrame", (_QWORD)v11);
          objc_msgSend(v10, "invalidateChildren");
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)interactiveCanvasController:(id)a3 interactedWithHyperlink:(id)a4 info:(id)a5 range:(_NSRange)a6 touchPoint:(CGPoint)a7 touchAndHold:(BOOL)a8
{
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v8 = a8;
  length = a6.length;
  location = a6.location;
  v39 = a3;
  v14 = a4;
  v15 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v14;
    -[SXAutoSizedCanvasController icc](self, "icc");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repForInfo:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "glyphRectForRange:includingLabel:", location, length, 0);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v39, "canvasView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertRect:toView:", 0, v20, v22, v24, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    -[SXAutoSizedCanvasController actionHandler](self, "actionHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "action");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "canvasView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleAction:sourceView:sourceRect:invocationType:", v37, v38, v8, v29, v31, v33, v35);

  }
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)editorAllowsEditMenu
{
  return 0;
}

- (BOOL)allowCopy
{
  return 1;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  return 1;
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginInteraction:(id)a4 atPoint:(CGPoint)a5
{
  return 0;
}

- (id)interactiveCanvasController:(id)a3 dragItemForSmartField:(id)a4 interaction:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[SXAutoSizedCanvasController dragItemProvider](self, "dragItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dragItemForSmartField:interaction:session:", v13, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v10, "endUISession");

  return v15;
}

- (SXAutoSizedCanvasControllerDelegate)delegate
{
  return (SXAutoSizedCanvasControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXTextTangierInteractiveCanvasController)icc
{
  return self->_icc;
}

- (SXTextTangierCanvasViewController)cvc
{
  return self->_cvc;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (SXComponentActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (SXTangierDragItemProvider)dragItemProvider
{
  return self->_dragItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemProvider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_cvc, 0);
  objc_storeStrong((id *)&self->_icc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentRoot, 0);
}

@end
