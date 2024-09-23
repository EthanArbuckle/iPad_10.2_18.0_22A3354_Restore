@implementation CRLFindReplaceAllHelper

- (CRLFindReplaceAllHelper)initWithEditingCoordinator:(id)a3 findString:(id)a4 replaceString:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CRLFindReplaceAllHelper *v13;
  NSString *v14;
  NSString *findString;
  NSString *v16;
  NSString *replaceString;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRLFindReplaceAllHelper;
  v13 = -[CRLFindReplaceAllHelper init](&v19, "init");
  if (v13)
  {
    v14 = (NSString *)objc_msgSend(v11, "copy");
    findString = v13->_findString;
    v13->_findString = v14;

    v16 = (NSString *)objc_msgSend(v12, "copy");
    replaceString = v13->_replaceString;
    v13->_replaceString = v16;

    v13->_options = a6;
    objc_storeWeak((id *)&v13->_editingCoordinator, v10);
  }

  return v13;
}

- (void)replaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4
{
  -[CRLFindReplaceAllHelper enqueueReplaceAllWithSelectionBehavior:modelEnumerator:](self, "enqueueReplaceAllWithSelectionBehavior:modelEnumerator:", a3, a4);
}

- (void)enqueueReplaceAllWithSelectionBehavior:(id)a3 modelEnumerator:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _TtC8Freeform15CRLCommandGroup *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v19 = v6;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "commandForReplaceAllWithProvider:") & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandForReplaceAllWithProvider:", self));
          if (v14)
          {
            if (!v10)
              v10 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
            -[CRLCommandGroup addCommand:](v10, "addCommand:", v14);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
    v6 = v19;
    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Replace All"), 0, CFSTR("UndoStrings")));
      -[CRLCommandGroup setActionString:](v10, "setActionString:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFindReplaceAllHelper editingCoordinator](self, "editingCoordinator"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "commandController"));
      objc_msgSend(v18, "enqueueCommand:withSelectionBehavior:", v10, v19);

    }
  }

}

- (void)appendReplacementCount:(unint64_t)a3
{
  self->_countOfItemsReplaced += a3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_loadWeakRetained((id *)&self->_editingCoordinator);
}

- (NSString)findString
{
  return self->_findString;
}

- (NSString)replaceString
{
  return self->_replaceString;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)countOfItemsReplaced
{
  return self->_countOfItemsReplaced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceString, 0);
  objc_storeStrong((id *)&self->_findString, 0);
  objc_destroyWeak((id *)&self->_editingCoordinator);
}

@end
