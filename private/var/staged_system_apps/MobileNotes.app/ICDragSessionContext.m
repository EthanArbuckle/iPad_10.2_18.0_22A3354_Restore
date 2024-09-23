@implementation ICDragSessionContext

- (ICDragSessionContext)initWithModernManagedObjectContext:(id)a3 legacyManagedObjectContext:(id)a4
{
  id v7;
  id v8;
  ICDragSessionContext *v9;
  ICDragSessionContext *v10;
  NSArray *currentSourceObjectIDs;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICDragSessionContext;
  v9 = -[ICDragSessionContext init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modernManagedObjectContext, a3);
    objc_storeStrong((id *)&v10->_legacyManagedObjectContext, a4);
    currentSourceObjectIDs = v10->_currentSourceObjectIDs;
    v10->_currentSourceObjectIDs = (NSArray *)&__NSArray0__struct;

  }
  return v10;
}

- (id)addItemIdentifierIfAppropriate:(id)a3 isEditingCollectionView:(BOOL)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSArray *v27;
  NSArray *currentSourceObjectIDs;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  id v43;

  v6 = a3;
  v7 = objc_opt_class(ICSearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
    v10 = objc_opt_class(ICNote);
    isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    v6 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectID"));

    }
  }
  v13 = objc_opt_class(NSManagedObjectID);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) == 0)
    goto LABEL_38;
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(ICNote)))
  {
    if ((id)-[ICDragSessionContext dragSessionType](self, "dragSessionType") == (id)1
      || !-[ICDragSessionContext dragSessionType](self, "dragSessionType"))
    {
      -[ICDragSessionContext setDragSessionType:](self, "setDragSessionType:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext modernManagedObjectContext](self, "modernManagedObjectContext"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectWithID:", v6));

      v16 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", v15));
      v18 = v15;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
      if (objc_msgSend(v18, "canBeSharedViaICloud"))
        v20 = v18;
      else
        v20 = 0;

      if (v6)
        goto LABEL_23;
      goto LABEL_44;
    }
LABEL_38:
    v37 = 0;
    v17 = 0;
    v19 = 0;
    v18 = 0;
    v20 = 0;
LABEL_39:
    v36 = 0;
    goto LABEL_40;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(NoteObject)))
  {
    if ((id)-[ICDragSessionContext dragSessionType](self, "dragSessionType") != (id)1
      && -[ICDragSessionContext dragSessionType](self, "dragSessionType"))
    {
      goto LABEL_38;
    }
    -[ICDragSessionContext setDragSessionType:](self, "setDragSessionType:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectWithID:", v6));

    v22 = v6;
    v23 = objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", v18));
LABEL_15:
    v17 = (void *)v23;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
    v20 = 0;
    if (!v6)
      goto LABEL_44;
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(ICNoteContainer)))
  {
    if (-[ICDragSessionContext dragSessionType](self, "dragSessionType"))
      goto LABEL_38;
    -[ICDragSessionContext setDragSessionType:](self, "setDragSessionType:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext modernManagedObjectContext](self, "modernManagedObjectContext"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectWithID:", v6));

    v26 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForFolder:](ICAppURLUtilities, "appURLForFolder:", v25));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "titleForTableViewCell"));
    if (objc_msgSend(v25, "canBeSharedViaICloud"))
      v20 = v25;
    else
      v20 = 0;

  }
  else
  {
    if (!objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(NoteCollectionObject)))
    {
      if (!objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class(ICInvitation))
        || -[ICDragSessionContext dragSessionType](self, "dragSessionType"))
      {
        goto LABEL_38;
      }
      -[ICDragSessionContext setDragSessionType:](self, "setDragSessionType:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext modernManagedObjectContext](self, "modernManagedObjectContext"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectWithID:", v6));

      v43 = v6;
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "shareURL"));
      goto LABEL_15;
    }
    if (-[ICDragSessionContext dragSessionType](self, "dragSessionType"))
      goto LABEL_38;
    -[ICDragSessionContext setDragSessionType:](self, "setDragSessionType:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectWithID:", v6));

    v40 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLFolder:](ICAppURLUtilities, "appURLForHTMLFolder:", v39));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "titleForTableViewCell"));

    v20 = 0;
  }
  v18 = 0;
  if (!v6)
  {
LABEL_44:
    v37 = 0;
    goto LABEL_39;
  }
LABEL_23:
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_currentSourceObjectIDs, "arrayByAddingObject:", v6));
  currentSourceObjectIDs = self->_currentSourceObjectIDs;
  self->_currentSourceObjectIDs = v27;

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URIRepresentation"));
  v30 = objc_alloc((Class)NSItemProvider);
  if (v18)
    v31 = objc_msgSend(v30, "initWithObject:", v18);
  else
    v31 = objc_msgSend(v30, "initWithItem:typeIdentifier:", v29, CFSTR("com.apple.mobilenotes.managed.object.id.url"));
  v32 = v31;
  objc_msgSend(v31, "setSuggestedName:", v19);
  if (!a4)
  {
    v33 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.notes.open.object"));
    objc_msgSend(v33, "setTitle:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
    objc_msgSend(v33, "setTargetContentIdentifier:", v34);

    objc_msgSend(v33, "setUserInfo:", &off_10057C738);
    objc_msgSend(v32, "registerObject:visibility:", v33, 0);

  }
  if (v32
    && objc_msgSend(v20, "canBeSharedViaICloud")
    && objc_msgSend(v20, "canCurrentUserShare"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
    objc_msgSend(v35, "registerShareForObject:itemProvider:generateThumbnails:", v20, v32, 1);

  }
  v36 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v32);
  objc_msgSend(v36, "setLocalObject:", v6);

  v37 = v6;
LABEL_40:

  return v36;
}

- (void)updateDropTargetCellsForPinNoteDrop:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext currentDropTargetCells](self, "currentDropTargetCells", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(ICNoteResultsListCollectionViewCell);
        v11 = ICDynamicCast(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v12, "setPinDropTarget:", v3);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)debugDescription
{
  uint64_t v3;
  char *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self);
  v4 = (char *)-[ICDragSessionContext dragSessionType](self, "dragSessionType") - 1;
  if ((unint64_t)v4 > 2)
    v5 = CFSTR("ICDragSessionContextTypeUndefined");
  else
    v5 = *(&off_100551268 + (_QWORD)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext currentSourceObjectIDs](self, "currentSourceObjectIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDragSessionContext currentDropTargetItemIDs](self, "currentDropTargetItemIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> dragSessionType: %@, currentSourceObjectIDs: %@, currentDropTargetItemIDs: %@"), v3, self, v5, v6, v7));

  return v8;
}

- (int64_t)dragSessionType
{
  return self->_dragSessionType;
}

- (void)setDragSessionType:(int64_t)a3
{
  self->_dragSessionType = a3;
}

- (NSArray)currentDropTargetCells
{
  return self->_currentDropTargetCells;
}

- (void)setCurrentDropTargetCells:(id)a3
{
  objc_storeStrong((id *)&self->_currentDropTargetCells, a3);
}

- (NSArray)currentDropTargetItemIDs
{
  return self->_currentDropTargetItemIDs;
}

- (void)setCurrentDropTargetItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_currentDropTargetItemIDs, a3);
}

- (NSArray)currentSourceObjectIDs
{
  return self->_currentSourceObjectIDs;
}

- (NSManagedObjectID)autoCollapsedFolderObjectID
{
  return self->_autoCollapsedFolderObjectID;
}

- (void)setAutoCollapsedFolderObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_autoCollapsedFolderObjectID, a3);
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_autoCollapsedFolderObjectID, 0);
  objc_storeStrong((id *)&self->_currentSourceObjectIDs, 0);
  objc_storeStrong((id *)&self->_currentDropTargetItemIDs, 0);
  objc_storeStrong((id *)&self->_currentDropTargetCells, 0);
}

@end
