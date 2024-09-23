@implementation TSDCanvasEditorHelper

- (TSDCanvasEditorHelper)initWithCanvasEditor:(id)a3
{
  TSDCanvasEditorHelper *v4;
  TSDCanvasEditorHelper *v5;
  TSKChangeNotifier *mChangeNotifier;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDCanvasEditorHelper;
  v4 = -[TSDCanvasEditorHelper init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mCanvasEditor = (TSDCanvasEditor *)a3;
    mChangeNotifier = (TSKChangeNotifier *)(id)objc_msgSend(-[TSDCanvasEditorHelper documentRoot](v4, "documentRoot"), "changeNotifier");
    v5->mChangeNotifier = mChangeNotifier;
    if (!mChangeNotifier)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditorHelper initWithCanvasEditor:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 189, CFSTR("invalid nil value for '%s'"), "mChangeNotifier");
      mChangeNotifier = v5->mChangeNotifier;
    }
    -[TSKChangeNotifier addObserver:forChangeSourceOfClass:](mChangeNotifier, "addObserver:forChangeSourceOfClass:", v5, objc_opt_class());
    v5->mTornDown = 0;
  }
  return v5;
}

- (id)canvasEditor
{
  return self->mCanvasEditor;
}

- (id)documentRoot
{
  return (id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "documentRoot");
}

- (id)interactiveCanvasController
{
  return (id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "interactiveCanvasController");
}

- (void)teardown
{
  -[TSKChangeNotifier removeObserver:forChangeSourceOfClass:](self->mChangeNotifier, "removeObserver:forChangeSourceOfClass:", self, objc_opt_class());

  self->mChangeNotifier = 0;
  self->mTornDown = 1;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (!self->mTornDown)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditorHelper dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 248, CFSTR("Need to call teardown on the editor helper"));
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasEditorHelper;
  -[TSDCanvasEditorHelper dealloc](&v5, sel_dealloc);
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "kind") == 5)
        {
          -[TSDCanvasEditorHelper pushNewEditorForSelection:](self, "pushNewEditorForSelection:", objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"));
          return;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }
}

- (BOOL)isRepSelectable:(id)a3
{
  return 1;
}

+ (Class)selectionClass
{
  return (Class)objc_opt_class();
}

- (void)notifyRepsForSelectionChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController");
  if (a3 && objc_msgSend(a3, "count"))
  {
    v31 = a3;
    v7 = (void *)objc_msgSend(a3, "mutableCopy");
    v8 = v7;
    if (a4)
      objc_msgSend(v7, "minusSet:", a4);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v12);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v14 = (void *)objc_msgSend(v6, "repsForInfo:", v13);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v41;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v41 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v18++), "becameNotSelected");
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            }
            while (v16);
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v10);
    }

    a3 = v31;
  }
  if (a4 && objc_msgSend(a4, "count"))
  {
    v19 = (void *)objc_msgSend(a4, "mutableCopy");
    v20 = v19;
    if (a3)
      objc_msgSend(v19, "minusSet:", a3);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v24);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v26 = (void *)objc_msgSend(v6, "repsForInfo:", v25);
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v33;
            do
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v33 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v30++), "becameSelected");
              }
              while (v28 != v30);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
            }
            while (v28);
          }
          ++v24;
        }
        while (v24 != v22);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      }
      while (v22);
    }

  }
}

- (Class)p_editorClassForSelection:(id)a3 shouldIgnoreLockedState:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend((id)objc_msgSend(a3, "infos"), "count"))
    return 0;
  objc_msgSend((id)objc_msgSend(a3, "infos"), "anyObject");
  objc_opt_class();
  v5 = (void *)TSUClassAndProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v6 = (void *)objc_msgSend(v5, "editorClass", &unk_254F6CDB0);
  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = (id)objc_msgSend(a3, "infos");
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)TSUProtocolCast();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = (void *)objc_msgSend(v12, "editorClass");
        else
          v13 = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 |= objc_msgSend(v13, "shouldSuppressMultiselection");
        if (!v13 || (v9 & 1) != 0 && v13 != v6)
          return 0;
        if ((objc_msgSend(v13, "isSubclassOfClass:", v6) & 1) == 0 && v13 != v6)
        {
          v6 = (void *)objc_msgSend(v6, "superclass");
          if ((objc_msgSend(v13, "isSubclassOfClass:", v6) & 1) == 0)
          {
            do
              v6 = (void *)objc_msgSend(v6, "superclass");
            while (!objc_msgSend(v13, "isSubclassOfClass:", v6));
          }
          if ((void *)objc_opt_class() != v6 && !objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
            return 0;
        }
        if (++v11 == v8)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_6;
          return (Class)v6;
        }
      }
    }
  }
  return (Class)v6;
}

- (Class)editorClassForSelectionIgnoringLockedState:(id)a3
{
  return -[TSDCanvasEditorHelper p_editorClassForSelection:shouldIgnoreLockedState:](self, "p_editorClassForSelection:shouldIgnoreLockedState:", a3, 1);
}

- (Class)editorClassForSelection:(id)a3
{
  return -[TSDCanvasEditorHelper p_editorClassForSelection:shouldIgnoreLockedState:](self, "p_editorClassForSelection:shouldIgnoreLockedState:", a3, 0);
}

- (id)editorToPopToOnEndEditingForSelection:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;

  v5 = -[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor");
  v6 = (void *)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "interactiveCanvasController");
  v7 = -[TSDCanvasEditorHelper editorClassForSelection:](self, "editorClassForSelection:", a3);
  if (v7)
    return (id)objc_msgSend((id)objc_msgSend(v6, "editorController"), "mostSpecificCurrentEditorOfClass:", v7);
  else
    return v5;
}

- (id)newEditorForEditorClass:(Class)a3
{
  return 0;
}

- (void)pushNewEditorForSelection:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v5 = -[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor");
  v6 = (void *)objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"), "editorController");
  objc_msgSend(v6, "beginTransaction");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__TSDCanvasEditorHelper_pushNewEditorForSelection___block_invoke;
  v11[3] = &unk_24D82CE00;
  v11[4] = a3;
  v11[5] = &v12;
  objc_msgSend(v6, "enumerateEditorsOnStackUsingBlock:", v11);
  objc_msgSend(v6, "popToEditor:", v5);
  if (objc_msgSend(v5, "shouldPushNewEditorForNewSelection"))
  {
    v7 = -[TSDCanvasEditorHelper editorClassForSelection:](self, "editorClassForSelection:", a3);
    if (v7)
    {
      v8 = -[TSDCanvasEditorHelper newEditorForEditorClass:](self, "newEditorForEditorClass:", v7);
      if (v8)
      {
LABEL_4:
        objc_msgSend(v6, "pushEditor:", v8);

        goto LABEL_9;
      }
      if (-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()))
      {
        v8 = (id)objc_msgSend([v7 alloc], "initWithInteractiveCanvasController:", -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
        objc_msgSend(v8, "setInfos:", -[TSDCanvasEditorHelper infosFromCanvasSelection:](self, "infosFromCanvasSelection:", objc_msgSend(v5, "canvasSelection")));
        if (v8)
          goto LABEL_4;
      }
      else
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditorHelper pushNewEditorForSelection:]");
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 486, CFSTR("Unknown editor class"));
      }
    }
  }
LABEL_9:
  if (v13[5])
    objc_msgSend(v6, "pushEditor:");
  objc_msgSend(v6, "endTransaction");
  _Block_object_dispose(&v12, 8);
}

uint64_t __51__TSDCanvasEditorHelper_pushNewEditorForSelection___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "wantsToBePushedBackOntoStackForSelection:", *(_QWORD *)(a1 + 32));
    if ((_DWORD)result)
    {
      result = a2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
      *a3 = 1;
    }
  }
  return result;
}

- (id)canvasSelectionFromRep:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!a3 || (objc_msgSend(a3, "isSelectable") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasEditorHelper canvasSelectionFromRep:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasEditorHelper.m"), 509, CFSTR("can't select a nil rep, or a rep that isn't selectable"));
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_msgSend(a3, "info"), 0);
  v8 = -[TSDCanvasEditorHelper canvasSelectionWithInfos:](self, "canvasSelectionWithInfos:", v7);

  return v8;
}

+ (id)canvasSelectionWithInfos:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "canvasSelectionWithInfos:andContainer:", a3, 0);
}

- (id)canvasSelectionWithInfos:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "canvasSelectionWithInfos:andContainer:", a3, 0);
}

+ (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;

  v7 = objc_msgSend(a3, "count");
  v8 = objc_alloc((Class)objc_msgSend(a1, "selectionClass"));
  if (v7)
    v9 = a3;
  else
    v9 = 0;
  return (id)objc_msgSend(v8, "initWithInfos:andContainer:", v9, a4);
}

- (id)canvasSelectionWithInfos:(id)a3 andContainer:(id)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "canvasSelectionWithInfos:andContainer:", a3, a4);
}

- (id)infosFromCanvasSelection:(id)a3
{
  return (id)objc_msgSend(a3, "infos");
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  char v3;

  if (a3)
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v3 = 1;
  }
  return v3 & 1;
}

- (int)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4
{
  char v7;
  char v8;
  int result;

  v7 = objc_msgSend((id)objc_opt_class(), "physicalKeyboardIsSender:", a4);
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanDeleteWithSender:", a4))return -1;
  if (sel_delete_ == a3)
    v8 = v7;
  else
    v8 = 0;
  result = 1;
  if ((v8 & 1) == 0)
  {
    if (sel_deleteObject_ == a3)
      return 1;
    else
      return -1;
  }
  return result;
}

- (int)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4
{
  char v7;
  char v8;
  int result;

  v7 = objc_msgSend((id)objc_opt_class(), "physicalKeyboardIsSender:", a4);
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanCopyWithSender:", a4))return -1;
  if (sel_copy_ == a3)
    v8 = v7;
  else
    v8 = 0;
  result = 1;
  if ((v8 & 1) == 0)
  {
    if (sel_copyObject_ == a3)
      return 1;
    else
      return -1;
  }
  return result;
}

- (int)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanCopyStyleWithSender:", a4))return 1;
  else
    return -1;
}

- (int)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4
{
  int v7;
  int v8;

  v7 = objc_msgSend((id)objc_opt_class(), "physicalKeyboardIsSender:", a4);
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanCutWithSender:", a4))return -1;
  if (sel_cut_ == a3)
    v8 = v7;
  else
    v8 = 0;
  if (sel_cutObject_ == a3)
    v8 = 1;
  if (v8)
    return 1;
  else
    return -1;
}

- (int)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4
{
  int v7;

  v7 = objc_msgSend((id)objc_opt_class(), "physicalKeyboardIsSender:", a4);
  if ((objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasEditorCanDuplicateWithSender:", a4) & v7 & (sel_duplicate_ == a3)) != 0)return 1;
  else
    return -1;
}

- (int)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanSelectAllWithSender:", a4))return 1;
  else
    return -1;
}

- (int)canvasEditorCanPerformGroupAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanGroupWithSender:", a4))return -1;
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "infosOfClass:", objc_opt_class());
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "containingGroup");
      if (v10)
      {
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", objc_msgSend(v10, "childInfos")), "isEqualToSet:", v5) & 1) != 0)return -1;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        result = 1;
        if (v7)
          goto LABEL_4;
        return result;
      }
    }
  }
  return 1;
}

- (int)canvasEditorCanPerformUngroupAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasEditorCanUngroupWithSender:", a4))return 1;
  else
    return -1;
}

- (int)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4
{
  if (+[TSDConnectionLineRep infosToConnectFromSelection:withInteractiveCanvasController:](TSDConnectionLineRep, "infosToConnectFromSelection:withInteractiveCanvasController:", objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3, a4), "canvasEditor"), "canvasSelection"), -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController")))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (int)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4
{
  if (objc_msgSend(-[TSDCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute", a3, a4), "count"))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (int)canvasEditorCanPerformDistributeAction:(SEL)a3 withSender:(id)a4
{
  if ((unint64_t)objc_msgSend(-[TSDCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute", a3, a4), "count") > 2)return 1;
  else
    return -1;
}

- (BOOL)canPerformMaskWithSender:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if (objc_msgSend(v3, "count") == 1
    && (v4 = (void *)objc_msgSend(v3, "anyObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "isLocked") & 1) == 0
    && (objc_msgSend(v4, "isInlineWithText") & 1) == 0)
  {
    return objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", objc_msgSend(v4, "imageData"), 1), "isError") ^ 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformUnmaskWithSender:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if (objc_msgSend(v3, "count") == 1
    && (v4 = (void *)objc_msgSend(v3, "anyObject"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v4, "isLocked") & 1) == 0)
  {
    return objc_msgSend(v4, "maskCanBeReset");
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformMaskWithShapeWithSender:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "infos");
  if (objc_msgSend(v5, "count") == 2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v15 = 0;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          objc_msgSend(v4, "repForInfo:", v11);
          v12 = (void *)TSUDynamicCast();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v11, "isLocked"))
          {
            v8 = 1;
          }
          else if (v12 && (objc_msgSend(v11, "isLocked") & 1) == 0)
          {
            v15 = objc_msgSend(v12, "canBeUsedForImageMask");
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v15 = 0;
    }
    v13 = v8 & v15;
  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3), "canvasSelection"), "infos");
  if (objc_msgSend(v3, "count") == 1)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "isLocked"))
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v4) = 0;
        if (v5)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor", a3, a4), "canvasSelection"), "infos", 0, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          v11 = v10;
          if ((sel_lock_ == a3) != objc_msgSend(v10, "isLocked")
            && (objc_msgSend(v11, "isLockable") & 1) != 0)
          {
            return 1;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  return -1;
}

- (BOOL)canUngroupWithSelection:(id)a3
{
  return objc_msgSend(a3, "containsUnlockedKindOfClass:", objc_opt_class());
}

- (BOOL)p_selectionContainsInlineObjects:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_msgSend(a3, "infos", 0, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        v8 = (void *)TSUDynamicCast();
        if (v8 && (objc_msgSend(v8, "isInlineWithText") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v5 = v4;
      if (v4)
        continue;
      break;
    }
  }
  return v4;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 v12;

  if (sel_cut_ == a3 || sel_cutObject_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCutAction:withSender:](self, "canvasEditorCanPerformCutAction:withSender:", a3, a4);
  if (sel_copy_ == a3 || sel_copyObject_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCopyAction:withSender:](self, "canvasEditorCanPerformCopyAction:withSender:", a3, a4);
  if (sel_copyStyle_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformCopyStyleAction:withSender:](self, "canvasEditorCanPerformCopyStyleAction:withSender:", a3, a4);
  if (sel_deleteObject_ == a3 || sel_delete_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformDeleteAction:withSender:](self, "canvasEditorCanPerformDeleteAction:withSender:", a3, a4);
  if (sel_isEqual(a3, sel_duplicate_))
    return -[TSDCanvasEditorHelper canvasEditorCanPerformDuplicateAction:withSender:](self, "canvasEditorCanPerformDuplicateAction:withSender:", a3, a4);
  if (sel_selectAll_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformSelectAllAction:withSender:](self, "canvasEditorCanPerformSelectAllAction:withSender:", a3, a4);
  if (sel_group_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformGroupAction:withSender:](self, "canvasEditorCanPerformGroupAction:withSender:", a3, a4);
  if (sel_ungroup_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformUngroupAction:withSender:](self, "canvasEditorCanPerformUngroupAction:withSender:", a3, a4);
  if (sel_connectWithConnectionLine_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformConnectWithConnectionLineAction:withSender:](self, "canvasEditorCanPerformConnectWithConnectionLineAction:withSender:", a3, a4);
  if (sel_alignDrawablesByLeftEdge_ == a3
    || sel_alignDrawablesByRightEdge_ == a3
    || sel_alignDrawablesByTopEdge_ == a3
    || sel_alignDrawablesByBottomEdge_ == a3
    || sel_alignDrawablesByHorizontalCenter_ == a3
    || sel_alignDrawablesByVerticalCenter_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformAlignAction:withSender:](self, "canvasEditorCanPerformAlignAction:withSender:", a3, a4);
  }
  if (sel_distributeDrawablesHorizontally_ == a3
    || sel_distributeDrawablesVertically_ == a3
    || sel_distributeDrawablesEvenly_ == a3)
  {
    return -[TSDCanvasEditorHelper canvasEditorCanPerformDistributeAction:withSender:](self, "canvasEditorCanPerformDistributeAction:withSender:", a3, a4);
  }
  if (sel_reduceDocumentFileSize_ == a3)
    return 1;
  if (sel_reduceFileSizeForSelectedImages_ == a3)
  {
    v12 = -[TSDCanvasEditorHelper p_canReduceFileSizeForSelectedImages](self, "p_canReduceFileSizeForSelectedImages");
    goto LABEL_61;
  }
  if (sel_unmask_ == a3)
  {
    v12 = -[TSDCanvasEditorHelper canPerformMaskWithSender:](self, "canPerformMaskWithSender:", a4);
    goto LABEL_61;
  }
  if (sel_mask_ == a3)
  {
    v12 = -[TSDCanvasEditorHelper canPerformUnmaskWithSender:](self, "canPerformUnmaskWithSender:", a4);
    goto LABEL_61;
  }
  if (sel_maskWithShape_ == a3)
  {
    v12 = -[TSDCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", a4);
    goto LABEL_61;
  }
  if (sel_maskWithSelection_ == a3)
  {
    if (!-[TSDCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", a4)
      && !-[TSDCanvasEditorHelper canPerformMaskWithSender:](self, "canPerformMaskWithSender:", a4))
    {
      return -1;
    }
    return 1;
  }
  if (sel_maskWithShapeType_ == a3)
  {
    v12 = -[TSDCanvasEditorHelper canPerformMaskWithShapeTypeWithSender:](self, "canPerformMaskWithShapeTypeWithSender:", a4);
LABEL_61:
    if (v12)
      return 1;
    else
      return -1;
  }
  if (sel_lock_ == a3 || sel_unlock_ == a3)
    return -[TSDCanvasEditorHelper canvasEditorCanPerformLockAction:withSender:](self, "canvasEditorCanPerformLockAction:withSender:", a3, a4);
  if (sel_deleteComment_ == a3)
    return -[TSDCanvasEditorHelper canDeleteComment](self, "canDeleteComment");
  return 0;
}

- (void)p_copy:(id)a3
{
  objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "copy:", a3);
}

- (BOOL)canGroupDrawables:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      v9 = objc_msgSend(v4, "canGroupDrawable:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
      if (!v9)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)p_canReduceFileSizeForSelectedImages
{
  return objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "containsKindOfClass:", objc_opt_class());
}

- (id)layoutsForAlignAndDistribute
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper canvasEditor](self, "canvasEditor"), "canvasSelection"), "unlockedInfos");
  return (id)objc_msgSend((id)objc_msgSend(-[TSDCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutsForInfos:", objc_msgSend(v3, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_54)));
}

uint64_t __53__TSDCanvasEditorHelper_layoutsForAlignAndDistribute__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_opt_class();
  v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "connectedTo") || objc_msgSend(v4, "connectedFrom"))
      return 0;
  }
  if ((objc_msgSend(a2, "isAnchoredToText") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a2, "isInlineWithText") ^ 1;
}

- (BOOL)canDeleteComment
{
  return 0;
}

@end
