@implementation CRLAccessibilityReaderModeCopyOperator

+ (BOOL)performCopyOperationWithSelectionPath:(id)a3 interactiveCanvasController:(id)a4 sender:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "editorController"));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
    objc_msgSend(v10, "setSelectionPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editorForEditAction:withSender:", "copy:", v8));
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  v13 = objc_msgSend(v12, "canPerformEditorAction:withSender:", "copy:", v8);
  if (v13)
    ((void (*)(void *, const char *, id))objc_msgSend(v12, "methodForSelector:", "copy:"))(v12, "copy:", v8);
  if (v11)
    objc_msgSend(v10, "setSelectionPath:", v11);

  return v13 != 0;
}

@end
