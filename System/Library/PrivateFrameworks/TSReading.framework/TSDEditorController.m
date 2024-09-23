@implementation TSDEditorController

- (TSDEditorController)init
{
  TSDEditorController *result;
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDEditorController;
  result = -[TSDEditorController init](&v5, sel_init);
  if (result)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController init]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 84, CFSTR("Use the designated initializer."));
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Use the designated initializer."), "-[TSDEditorController init]"), 0));
  }
  return result;
}

- (TSDEditorController)initWithDocumentRoot:(id)a3
{
  TSDEditorController *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDEditorController;
  v4 = -[TSDEditorController init](&v8, sel_init);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController initWithDocumentRoot:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 94, CFSTR("invalid nil value for '%s'"), "docRoot");
    }
    v4->mDocumentRoot = (TSKDocumentRoot *)a3;
    v4->mEditorStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->mResignedTextInputEditors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4->mInspectorPropertyValueMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v4;
}

- (void)teardown
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        -[TSDEditorController popEditor:](self, "popEditor:", v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "teardown");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->mEditorStack = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDEditorController;
  -[TSDEditorController dealloc](&v3, sel_dealloc);
}

- (id)currentEditors
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->mEditorStack);
}

- (id)textInputEditor
{
  return self->mTextInputEditor;
}

- (void)setTextInputEditor:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController setTextInputEditor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 170, CFSTR("invalid nil value for '%s'"), "newTextInputEditor");
  }
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController setTextInputEditor:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 171, CFSTR("can't set an editor to be the text input editor if it isn't on the stack"));
  }
  if (a3)
    -[TSDEditorController p_setTextInputEditor:](self, "p_setTextInputEditor:", a3);
  -[TSDEditorController notifyResignedTextInputEditors](self, "notifyResignedTextInputEditors");
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4
{
  return -[TSDEditorController editorForEditAction:withSender:response:](self, "editorForEditAction:withSender:response:", a3, a4, 0);
}

- (id)editorForEditAction:(SEL)a3 withSender:(id)a4 response:(int *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char **v12;
  uint64_t v13;
  char **v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    v12 = &selRef_anyObject;
LABEL_3:
    v13 = 0;
    v14 = v12;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        LODWORD(v8) = objc_msgSend(v15, "canPerformEditorAction:withSender:", a3, a4);
        if ((_DWORD)v8 == 1)
          v10 = v15;
        if ((_DWORD)v8)
          break;
      }
      if (v9 == ++v13)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v9 = v8;
        v12 = v14;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  if (a5)
    *a5 = v8;
  return v10;
}

- (BOOL)anyEditorProhibitsAction:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "shouldProhibitAction:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)pushEditor:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController pushEditor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 260, CFSTR("invalid nil value for '%s'"), "newEditor");
  }
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController pushEditor:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 261, CFSTR("shouldn't push the same editor twice"));
  }
  v9 = -[NSMutableArray arrayByAddingObject:](self->mEditorStack, "arrayByAddingObject:", a3);
  if (a3)
  {
    v10 = v9;
    if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", v10);
      -[NSMutableArray addObject:](self->mEditorStack, "addObject:", a3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a3, "didBecomeCurrentEditor");
      -[TSDEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");
      if (!-[TSDEditorController textInputEditor](self, "textInputEditor"))
        -[TSDEditorController p_setTextInputEditor:](self, "p_setTextInputEditor:", a3);
    }
  }
  -[TSDEditorController notifyResignedTextInputEditors](self, "notifyResignedTextInputEditors");
}

- (void)popEditor:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popEditor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 293, CFSTR("invalid nil value for '%s'"), "poppedEditor");
  }
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popEditor:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 294, CFSTR("shouldn't pop an editor that isn't on the stack"));
  }
  if (a3)
  {
    v9 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", -[NSMutableArray subarrayWithRange:](self->mEditorStack, "subarrayWithRange:", 0, v9));
      v11 = -[TSDEditorController textInputEditor](self, "textInputEditor");
      if (v11
        && -[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", v11) >= v10)
      {
        if (v10)
          v12 = -[NSMutableArray objectAtIndex:](self->mEditorStack, "objectAtIndex:", v10 - 1);
        else
          v12 = 0;
        -[TSDEditorController p_setTextInputEditor:](self, "p_setTextInputEditor:", v12);
      }
      v13 = -[NSMutableArray count](self->mEditorStack, "count") + 1;
      do
      {
        if (!--v13)
          break;
        v14 = (id)-[NSMutableArray lastObject](self->mEditorStack, "lastObject");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "willResignCurrentEditor");
        -[NSMutableArray removeLastObject](self->mEditorStack, "removeLastObject");
      }
      while (v14 != a3);
      -[TSDEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");
    }
  }
  -[TSDEditorController notifyResignedTextInputEditors](self, "notifyResignedTextInputEditors");
}

- (void)popEditor:(id)a3 andPushTextInputEditor:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popEditor:andPushTextInputEditor:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 354, CFSTR("invalid nil value for '%s'"), "oldEditor");
  }
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popEditor:andPushTextInputEditor:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 355, CFSTR("shouldn't pop an editor that isn't on the stack"));
  }
  if (a3)
  {
    v11 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = v11;
      -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", objc_msgSend((id)-[NSMutableArray subarrayWithRange:](self->mEditorStack, "subarrayWithRange:", 0, v11), "arrayByAddingObject:", a4));
      -[NSMutableArray insertObject:atIndex:](self->mEditorStack, "insertObject:atIndex:", a4, v12);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a4, "didBecomeCurrentEditor");
      -[TSDEditorController p_setTextInputEditor:](self, "p_setTextInputEditor:", a4);
      v13 = -[NSMutableArray count](self->mEditorStack, "count") + 1;
      do
      {
        if (!--v13)
          break;
        v14 = (id)-[NSMutableArray lastObject](self->mEditorStack, "lastObject");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "willResignCurrentEditor");
        -[NSMutableArray removeLastObject](self->mEditorStack, "removeLastObject");
      }
      while (v14 != a3);
      -[TSDEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");
    }
  }
  -[TSDEditorController notifyResignedTextInputEditors](self, "notifyResignedTextInputEditors");
}

- (void)beginTransaction
{
  ++self->mTransactionLevel;
}

- (void)endTransaction
{
  unint64_t mTransactionLevel;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  mTransactionLevel = self->mTransactionLevel;
  if (mTransactionLevel
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController endTransaction]"),
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 407, CFSTR("unbalanced endTransaction")), (mTransactionLevel = self->mTransactionLevel) != 0))
  {
    v6 = mTransactionLevel - 1;
    self->mTransactionLevel = v6;
    if (!v6)
    {
      if (self->mNotifiedWillChangeTextInputEditor || self->mDidChangeTextInputEditor)
      {
        -[TSDEditorController p_willChangeTextInputEditor](self, "p_willChangeTextInputEditor");
        -[TSDEditorController p_didChangeTextInputEditor](self, "p_didChangeTextInputEditor");
        self->mNotifiedWillChangeTextInputEditor = 0;
        self->mDidChangeTextInputEditor = 0;
      }
      if (self->mNotifiedWillChangeCurrentEditors || self->mDidChangeCurrentEditors)
      {
        -[TSDEditorController p_willChangeCurrentEditors](self, "p_willChangeCurrentEditors");
        -[TSDEditorController p_didChangeCurrentEditors](self, "p_didChangeCurrentEditors");
        self->mNotifiedWillChangeCurrentEditors = 0;
        self->mDidChangeCurrentEditors = 0;
      }
    }
  }
}

- (void)notifyResignedTextInputEditors
{
  unint64_t v3;
  void *v4;

  if (!self->mIsReentrantResigningTextInputEditors)
  {
    self->mIsReentrantResigningTextInputEditors = 1;
    if (-[NSMutableArray count](self->mResignedTextInputEditors, "count"))
    {
      v3 = 0;
      do
      {
        v4 = (void *)-[NSMutableArray objectAtIndex:](self->mResignedTextInputEditors, "objectAtIndex:", v3);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "didResignTextInputEditor");
        ++v3;
      }
      while (v3 < -[NSMutableArray count](self->mResignedTextInputEditors, "count"));
    }
    -[NSMutableArray removeAllObjects](self->mResignedTextInputEditors, "removeAllObjects");
    self->mIsReentrantResigningTextInputEditors = 0;
  }
}

- (void)enumerateEditorsOnStackUsingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v4);
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), &v13);
      if (v13)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
        if (v6)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (id)currentEditorsOfClass:(Class)a3
{
  id v4;
  NSMutableArray *mEditorStack;
  uint64_t v6;
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
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mEditorStack = self->mEditorStack;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEditorStack, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mEditorStack);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEditorStack, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3
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
  if (!a3)
    return (id)-[NSMutableArray lastObject](self->mEditorStack, "lastObject");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_4;
      return 0;
    }
  }
}

- (id)mostSpecificCurrentEditorOfClass:(Class)a3 conformingToProtocol:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)-[NSMutableArray reverseObjectEnumerator](self->mEditorStack, "reverseObjectEnumerator", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if ((!a3 || (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v11, "conformsToProtocol:", a4) & 1) != 0)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)currentEditorsConformingToProtocol:(id)a3
{
  id v5;
  NSMutableArray *mEditorStack;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mEditorStack = self->mEditorStack;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEditorStack, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(mEditorStack);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", a3))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mEditorStack, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (id)mostSpecificEditorConformingToProtocol:(id)a3
{
  return -[TSDEditorController mostSpecificCurrentEditorOfClass:conformingToProtocol:](self, "mostSpecificCurrentEditorOfClass:conformingToProtocol:", 0, a3);
}

- (void)popToEditor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popToEditor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 521, CFSTR("invalid nil value for '%s'"), "editor");
  }
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mEditorStack, "indexOfObjectIdenticalTo:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController popToEditor:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 524, CFSTR("can't popToEditor:, that editor isn't in the stack"));
  }
  else
  {
    v10 = v7 + 1;
    if (v7 + 1 < (unint64_t)-[NSMutableArray count](self->mEditorStack, "count"))
      -[TSDEditorController popEditor:](self, "popEditor:", -[NSMutableArray objectAtIndex:](self->mEditorStack, "objectAtIndex:", v10));
  }
}

- (void)setObject:(id)a3 forInspectorPropertyKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mInspectorPropertyValueMap, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForInspectorPropertyKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->mInspectorPropertyValueMap, "removeObjectForKey:", a3);
}

- (id)objectForInspectorPropertyKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->mInspectorPropertyValueMap, "objectForKey:", a3);
}

- (BOOL)isChangingCurrentEditorsWhenCommittingInspectorChanges
{
  return self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount != 0;
}

- (void)willChangeCurrentEditorsWhenCommittingInspectorChanges
{
  ++self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount;
}

- (void)didChangeCurrentEditorsWhenCommittingInspectorChanges
{
  unint64_t mChangingCurrentEditorsWhenCommittingInspectorChangesCount;
  void *v4;
  uint64_t v5;

  mChangingCurrentEditorsWhenCommittingInspectorChangesCount = self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount;
  if (mChangingCurrentEditorsWhenCommittingInspectorChangesCount
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController didChangeCurrentEditorsWhenCommittingInspectorChanges]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 563, CFSTR("Call to didChangeCurrentEditorsWhenCommittingInspectorChanges without a matching willChangeCurrentEditorsWhenCommittingInspectorChanges")), (mChangingCurrentEditorsWhenCommittingInspectorChangesCount = self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount) != 0))
  {
    self->mChangingCurrentEditorsWhenCommittingInspectorChangesCount = mChangingCurrentEditorsWhenCommittingInspectorChangesCount
                                                                     - 1;
  }
}

- (void)editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController editorDidChangeSelection:withSelectionFlags:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 574, CFSTR("invalid nil value for '%s'"), "editor");
  }
  v9 = objc_alloc(MEMORY[0x24BDBCE70]);
  v10 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", a3, CFSTR("TSDEditorControllerEditorKey"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4), CFSTR("TSDEditorControllerSelectionFlagsKey"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerSelectionDidChange"), self, v10);

}

- (void)editorSelectionWasForciblyChanged:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController editorSelectionWasForciblyChanged:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 589, CFSTR("invalid nil value for '%s'"), "editor");
  }
  v7 = objc_alloc(MEMORY[0x24BDBCE70]);
  v8 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, CFSTR("TSDEditorControllerEditorKey"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0), CFSTR("TSDEditorControllerSelectionFlagsKey"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerSelectionWasForciblyChanged"), self, v8);

}

- (void)editorDidChangeSelectionAndWantsKeyboard:(id)a3 withSelectionFlags:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDEditorController editorDidChangeSelectionAndWantsKeyboard:withSelectionFlags:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDEditorController.m"), 604, CFSTR("invalid nil value for '%s'"), "editor");
  }
  v9 = objc_alloc(MEMORY[0x24BDBCE70]);
  v10 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", a3, CFSTR("TSDEditorControllerEditorKey"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4), CFSTR("TSDEditorControllerSelectionFlagsKey"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerSelectionDidChangeAndWantsKeyboard"), self, v10);

}

- (void)p_setTextInputEditor:(id)a3
{
  if (self->mTextInputEditor != a3)
  {
    -[TSDEditorController p_willChangeTextInputEditor](self, "p_willChangeTextInputEditor");
    if (self->mTextInputEditor)
      -[NSMutableArray addObject:](self->mResignedTextInputEditors, "addObject:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDEditor willResignTextInputEditor](self->mTextInputEditor, "willResignTextInputEditor");
    self->mTextInputEditor = (TSDEditor *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDEditor didBecomeTextInputEditor](self->mTextInputEditor, "didBecomeTextInputEditor");
    -[TSDEditorController p_didChangeTextInputEditor](self, "p_didChangeTextInputEditor");
  }
}

- (void)p_willChangeTextInputEditor
{
  if (!self->mNotifiedWillChangeTextInputEditor)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDEditorControllerWillChangeTextInputEditor"), self);
    self->mNotifiedWillChangeTextInputEditor = 1;
  }
}

- (void)p_didChangeTextInputEditor
{
  char v3;
  uint64_t v4;

  if (self->mTransactionLevel)
  {
    v3 = 1;
    v4 = 40;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDEditorControllerDidChangeTextInputEditor"), self);
    v3 = 0;
    v4 = 42;
  }
  *((_BYTE *)&self->super.isa + v4) = v3;
}

- (void)p_willChangeCurrentEditorsWithNewEditors:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!self->mNotifiedWillChangeCurrentEditors)
  {
    if (a3 && !self->mTransactionLevel)
    {
      v5 = CFSTR("TSDEditorControllerNewEditorsKey");
      v6[0] = a3;
      v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDEditorControllerWillChangeCurrentEditors"), self, v4);
    self->mNotifiedWillChangeCurrentEditors = 1;
  }
}

- (void)p_willChangeCurrentEditors
{
  -[TSDEditorController p_willChangeCurrentEditorsWithNewEditors:](self, "p_willChangeCurrentEditorsWithNewEditors:", 0);
}

- (void)p_didChangeCurrentEditors
{
  char v3;
  uint64_t v4;

  if (self->mTransactionLevel)
  {
    v3 = 1;
    v4 = 41;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDEditorControllerDidChangeCurrentEditors"), self);
    v3 = 0;
    v4 = 43;
  }
  *((_BYTE *)&self->super.isa + v4) = v3;
}

@end
