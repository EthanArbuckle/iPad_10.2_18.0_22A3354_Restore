@implementation ICNoteContainer

- (void)undoablySetOrder:(unint64_t)a3 ofChild:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainer subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "prepareWithInvocationTarget:", self));
  v12 = v11;
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "undoablyRemoveFromOrder:", v6);
  else
    objc_msgSend(v11, "undoablySetOrder:ofChild:", v9, v6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Set Folder Order"), &stru_1000DAF38, 0));
  objc_msgSend(v13, "setActionName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  LODWORD(v14) = objc_msgSend(v7, "containsObject:", v16);

  v17 = objc_msgSend(v7, "count");
  if (!(_DWORD)v14)
  {
    if ((unint64_t)v17 < a3)
    {
      v19 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
        v27 = 138412802;
        v28 = v7;
        v29 = 2112;
        v30 = v25;
        v31 = 2048;
        v32 = a3;
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Illegal subfolder insert — setting as last subfolder {orderedIdentifiers: %@, folder: %@, index: %lu}", (uint8_t *)&v27, 0x20u);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      objc_msgSend(v7, "insertObject:atIndex:", v20, objc_msgSend(v7, "count"));
      goto LABEL_15;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v7, "insertObject:atIndex:", v18, a3);
LABEL_17:

    goto LABEL_18;
  }
  if ((unint64_t)v17 > a3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v7, "moveObject:toIndex:", v18, a3);
    goto LABEL_17;
  }
  v21 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_loggingDescription"));
    v27 = 138412802;
    v28 = v7;
    v29 = 2112;
    v30 = v26;
    v31 = 2048;
    v32 = a3;
    _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "Illegal subfolder move — setting as last subfolder {orderedIdentifiers: %@, folder: %@, index: %lu}", (uint8_t *)&v27, 0x20u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v7, "moveObject:toIndex:", v20, (char *)objc_msgSend(v7, "count") - 1);
LABEL_15:

LABEL_18:
  -[ICNoteContainer setSubFolderOrderMergeableDataDirty:](self, "setSubFolderOrderMergeableDataDirty:", 1);
  -[ICNoteContainer saveSubFolderMergeableDataIfNeeded](self, "saveSubFolderMergeableDataIfNeeded");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "setParentModificationDate:", v23);

  objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Set folder order"));
  -[ICNoteContainer updateSubFolderMergeableDataChangeCount](self, "updateSubFolderMergeableDataChangeCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "postNotificationName:object:", CFSTR("ICNoteContainerOrderDidChangeNotification"), v6);

}

- (void)undoablyRemoveFromOrder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainer subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prepareWithInvocationTarget:", self));
    objc_msgSend(v8, "undoablySetOrder:ofChild:", v6, v15);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUndoManager shared](NSUndoManager, "shared"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Remove Folder Order"), &stru_1000DAF38, 0));
  objc_msgSend(v9, "setActionName:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  objc_msgSend(v4, "removeObject:", v12);

  -[ICNoteContainer setSubFolderOrderMergeableDataDirty:](self, "setSubFolderOrderMergeableDataDirty:", 1);
  -[ICNoteContainer saveSubFolderMergeableDataIfNeeded](self, "saveSubFolderMergeableDataIfNeeded");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "setParentModificationDate:", v13);

  objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Removed from folder order"));
  -[ICNoteContainer updateSubFolderMergeableDataChangeCount](self, "updateSubFolderMergeableDataChangeCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICNoteContainerOrderDidChangeNotification"), v15);

}

- (void)undoablyMoveSubFolder:(id)a3 toIndex:(unint64_t)a4
{
  void *v4;
  void *v5;
  id v8;
  void *v9;
  uint64_t v10;
  ICNoteContainer *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));
  if (!v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
    v10 = objc_claimAutoreleasedReturnValue(-[ICNoteContainer noteContainerAccount](self, "noteContainerAccount"));
    if (v4 == (void *)v10)
    {

      goto LABEL_10;
    }
    v5 = (void *)v10;
  }
  v11 = (ICNoteContainer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));

  if (v9)
  {

  }
  else
  {

  }
  if (v11 != self)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(subFolder.parent == ((void *)0) && subFolder.account == self.noteContainerAccount) || subFolder.parent == self", "-[ICNoteContainer(UndoSupport) undoablyMoveSubFolder:toIndex:]", 1, 0, CFSTR("Trying to move subfolder in the wrong parent"));
LABEL_10:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainer visibleSubFolders](self, "visibleSubFolders"));
  v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v12, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "identifier"));
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v16);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainer subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

  if ((objc_msgSend(v13, "isEqual:", v22) & 1) == 0)
  {
    v32 = a4;
    v34 = v8;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10000BE78;
    v40[3] = &unk_1000D5DB0;
    v41 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectsPassingTest:", v40));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteContainer subFolderIdentifiersOrderedSet](self, "subFolderIdentifiersOrderedSet", v32, v34));
          objc_msgSend(v29, "removeObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v25);
    }
    if (objc_msgSend(v14, "count", v32, v34))
    {
      v30 = 0;
      do
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v30));
        -[ICNoteContainer undoablySetOrder:ofChild:](self, "undoablySetOrder:ofChild:", v30, v31);

        ++v30;
      }
      while (v30 < (unint64_t)objc_msgSend(v14, "count"));
    }

    a4 = v33;
    v8 = v35;
  }
  -[ICNoteContainer undoablySetOrder:ofChild:](self, "undoablySetOrder:ofChild:", a4, v8);

}

@end
