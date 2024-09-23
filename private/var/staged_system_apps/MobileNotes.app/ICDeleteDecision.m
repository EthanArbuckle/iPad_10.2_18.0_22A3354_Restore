@implementation ICDeleteDecision

- (ICDeleteDecision)initWithSourceObjects:(id)a3
{
  return -[ICDeleteDecision initWithSourceObjects:allowsRecentlyDeletedFolderAlert:](self, "initWithSourceObjects:allowsRecentlyDeletedFolderAlert:", a3, 1);
}

- (ICDeleteDecision)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4
{
  id v6;
  ICDeleteDecision *v7;
  ICDeleteDecision *v8;
  uint64_t v9;
  NSArray *modernNotes;
  uint64_t v11;
  NSArray *modernFolders;
  void *v13;
  NSArray *v14;
  NSArray *modernSourceObjects;
  uint64_t v16;
  NSArray *htmlNotes;
  uint64_t v18;
  NSArray *htmlFolders;
  void *v20;
  NSArray *v21;
  NSArray *htmlSourceObjects;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICDeleteDecision;
  v7 = -[ICDeleteDecision init](&v24, "init");
  v8 = v7;
  if (v7)
  {
    v7->_allowsRecentlyDeletedFolderAlert = a4;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", &stru_100552B18));
    modernNotes = v8->_modernNotes;
    v8->_modernNotes = (NSArray *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", &stru_100552B38));
    modernFolders = v8->_modernFolders;
    v8->_modernFolders = (NSArray *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v13, "addObjectsFromArray:", v8->_modernNotes);
    objc_msgSend(v13, "addObjectsFromArray:", v8->_modernFolders);
    v14 = (NSArray *)objc_msgSend(v13, "copy");
    modernSourceObjects = v8->_modernSourceObjects;
    v8->_modernSourceObjects = v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", &stru_100552B58));
    htmlNotes = v8->_htmlNotes;
    v8->_htmlNotes = (NSArray *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", &stru_100552B78));
    htmlFolders = v8->_htmlFolders;
    v8->_htmlFolders = (NSArray *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v20, "addObjectsFromArray:", v8->_htmlNotes);
    objc_msgSend(v20, "addObjectsFromArray:", v8->_htmlFolders);
    v21 = (NSArray *)objc_msgSend(v20, "copy");
    htmlSourceObjects = v8->_htmlSourceObjects;
    v8->_htmlSourceObjects = v21;

    if (-[NSArray count](v8->_modernSourceObjects, "count"))
    {
      -[ICDeleteDecision makeDecisionForDeletingModernSourceObjects](v8, "makeDecisionForDeletingModernSourceObjects");
      if (!-[NSArray count](v8->_htmlSourceObjects, "count"))
        goto LABEL_7;
    }
    else if (!-[NSArray count](v8->_htmlSourceObjects, "count"))
    {
      -[ICDeleteDecision setDecisionWithType:guiltyObjects:](v8, "setDecisionWithType:guiltyObjects:", 2, &__NSArray0__struct);
      goto LABEL_7;
    }
    -[ICDeleteDecision makeDecisionForDeletingHTMLSourceObjects](v8, "makeDecisionForDeletingHTMLSourceObjects");
LABEL_7:

  }
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICDeleteDecision;
  v3 = -[ICDeleteDecision description](&v13, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[ICDeleteDecision type](self, "type");
  v6 = CFSTR("ICDeleteDecisionTypeAllow");
  if (v5 == 1)
    v6 = CFSTR("ICDeleteDecisionTypeAllowWithAdditionalStep");
  if (v5 == 2)
    v6 = CFSTR("ICDeleteDecisionTypePrevent");
  v7 = v6;
  v8 = sub_1000930B0(-[ICDeleteDecision additionalStep](self, "additionalStep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision guiltyObjects](self, "guiltyObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: type = %@, additionalStep = %@, guiltyObjects = %@"), v4, v7, v9, v10));

  return v11;
}

- (BOOL)shouldDelete
{
  return (id)-[ICDeleteDecision type](self, "type") != (id)2;
}

- (BOOL)needsToDeleteShares
{
  unint64_t v2;

  v2 = -[ICDeleteDecision additionalStep](self, "additionalStep");
  return (v2 > 0xD) | (0x1Eu >> v2) & 1;
}

+ (id)decisionObjectsForFolder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_msgSend(v4, "isSharedViaICloud");
  objc_msgSend(v5, "addObject:", v4);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleNotes"));
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleNoteContainerChildrenUnsorted"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "decisionObjectsForFolder:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12)));
          objc_msgSend(v5, "addObjectsFromArray:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  v14 = objc_msgSend(v5, "copy");

  return v14;
}

+ (BOOL)didShowMoveToRecentlyDeletedFolderAlert
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("didShowMoveToRecentyDeletedFolderAlert"));

  return v3;
}

+ (void)setDidShowMoveToRecentlyDeletedFolderAlert:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("didShowMoveToRecentyDeletedFolderAlert"));

}

+ (BOOL)isHTMLNote:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(NoteObject, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

+ (BOOL)isHTMLFolder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(NoteStoreObject, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (void)makeDecisionForDeletingModernSourceObjects
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  ICDeleteDecision *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  ICDeleteDecision *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;

  if (-[ICDeleteDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    v3 = objc_alloc((Class)NSMutableSet);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision modernSourceObjects](self, "modernSourceObjects"));
    v5 = objc_msgSend(v3, "initWithArray:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision modernSourceObjects](self, "modernSourceObjects"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100093B84;
    v61[3] = &unk_100552BA0;
    v43 = v5;
    v62 = v43;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v61);

    if (objc_msgSend(v43, "count"))
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100093BF4;
      v59[3] = &unk_100552BC8;
      v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v7 = v60;
      objc_msgSend(v43, "enumerateObjectsUsingBlock:", v59);
      objc_msgSend(v43, "minusSet:", v7);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100093C58;
      v57[3] = &unk_100552BC8;
      v58 = v43;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v57);

    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision modernSourceObjects](self, "modernSourceObjects"));
      -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 2, v7);
    }

    v34 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v41 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v39 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v37 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v8 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v9 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v10 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v12 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100093CE0;
    v44[3] = &unk_100552BF0;
    v44[4] = self;
    v35 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v43, "count"));
    v45 = v35;
    v36 = v14;
    v46 = v36;
    v15 = v41;
    v47 = v15;
    v42 = v39;
    v48 = v42;
    v40 = v37;
    v49 = v40;
    v38 = v8;
    v50 = v38;
    v16 = v13;
    v51 = v16;
    v17 = v11;
    v52 = v17;
    v18 = v12;
    v53 = v18;
    v19 = v10;
    v54 = v19;
    v20 = v9;
    v55 = v20;
    v21 = v34;
    v56 = v21;
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", v44);
    if (objc_msgSend(v21, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
LABEL_8:
      -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 2, v22, v34);
LABEL_12:

LABEL_13:
      v25 = v15;
LABEL_14:
      v26 = v40;
LABEL_15:
      v27 = v38;
LABEL_16:

      return;
    }
    if (objc_msgSend(v19, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));
      v23 = self;
      v24 = 12;
      goto LABEL_11;
    }
    v25 = v15;
    if (objc_msgSend(v16, "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
      -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 2, v28);
    }
    else
    {
      if (objc_msgSend(v15, "count"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
        v29 = self;
        v30 = 1;
      }
      else if (objc_msgSend(v42, "count"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
        v29 = self;
        v30 = 2;
      }
      else
      {
        v26 = v40;
        if (objc_msgSend(v40, "count"))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allObjects"));
          -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](self, "setDecisionWithType:additionalStep:guiltyObjects:", 1, 3, v31);

          goto LABEL_15;
        }
        if (objc_msgSend(v38, "count"))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "allObjects"));
          -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](self, "setDecisionWithType:additionalStep:guiltyObjects:", 1, 4, v32);

          v26 = v40;
          v27 = v38;
          goto LABEL_16;
        }
        if (objc_msgSend(v17, "count"))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
          v29 = self;
          v30 = 5;
        }
        else
        {
          if (!objc_msgSend(v18, "count"))
          {
            if (objc_msgSend(v20, "count"))
            {
              v33 = objc_msgSend(v20, "ic_containsObjectPassingTest:", &stru_100552C30);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
              if (v33)
                goto LABEL_8;
              v23 = self;
              v24 = 7;
            }
            else if (objc_msgSend(v35, "count"))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allObjects"));
              v23 = self;
              v24 = 10;
            }
            else
            {
              if (!objc_msgSend(v36, "count"))
              {
                if (+[ICDeleteDecision didShowMoveToRecentlyDeletedFolderAlert](ICDeleteDecision, "didShowMoveToRecentlyDeletedFolderAlert")|| !-[ICDeleteDecision allowsRecentlyDeletedFolderAlert](self, "allowsRecentlyDeletedFolderAlert"))
                {
                  -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 0, &__NSArray0__struct, v34);
                }
                else
                {
                  -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](self, "setDecisionWithType:additionalStep:guiltyObjects:", 1, 11, &__NSArray0__struct);
                }
                goto LABEL_13;
              }
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allObjects"));
              v23 = self;
              v24 = 13;
            }
LABEL_11:
            -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](v23, "setDecisionWithType:additionalStep:guiltyObjects:", 1, v24, v22, v34);
            goto LABEL_12;
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
          v29 = self;
          v30 = 6;
        }
      }
      -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](v29, "setDecisionWithType:additionalStep:guiltyObjects:", 1, v30, v28, v34);
    }

    goto LABEL_14;
  }
}

- (void)makeDecisionForDeletingHTMLSourceObjects
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (-[ICDeleteDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    v3 = objc_alloc((Class)NSMutableSet);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision htmlSourceObjects](self, "htmlSourceObjects"));
    v5 = objc_msgSend(v3, "initWithArray:", v4);

    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDeleteDecision htmlSourceObjects](self, "htmlSourceObjects"));
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_1000940E4;
    v14 = &unk_100552C58;
    v16 = &v17;
    v7 = v5;
    v15 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v11);

    if (objc_msgSend(v7, "count", v11, v12, v13, v14))
    {
      if (!*((_BYTE *)v18 + 24))
      {
LABEL_10:

        _Block_object_dispose(&v17, 8);
        return;
      }
      v8 = objc_msgSend(v7, "count");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
      if ((unint64_t)v8 > 1)
        v10 = 8;
      else
        v10 = 9;
      -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](self, "setDecisionWithType:additionalStep:guiltyObjects:", 1, v10, v9);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
      -[ICDeleteDecision setDecisionWithType:guiltyObjects:](self, "setDecisionWithType:guiltyObjects:", 2, v9);
    }

    goto LABEL_10;
  }
}

- (void)setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5
{
  id v9;
  id v10;

  v9 = a5;
  if (self->_type < a3)
  {
    self->_type = a3;
    self->_additionalStep = a4;
    v10 = v9;
    objc_storeStrong((id *)&self->_guiltyObjects, a5);
    v9 = v10;
  }

}

- (void)setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4
{
  -[ICDeleteDecision setDecisionWithType:additionalStep:guiltyObjects:](self, "setDecisionWithType:additionalStep:guiltyObjects:", a3, 0, a4);
}

- (BOOL)shouldContinueDecisionMaking
{
  return (id)-[ICDeleteDecision type](self, "type") != (id)2;
}

- (NSArray)modernFolders
{
  return self->_modernFolders;
}

- (NSArray)modernNotes
{
  return self->_modernNotes;
}

- (NSArray)modernSourceObjects
{
  return self->_modernSourceObjects;
}

- (NSArray)htmlNotes
{
  return self->_htmlNotes;
}

- (NSArray)htmlFolders
{
  return self->_htmlFolders;
}

- (NSArray)htmlSourceObjects
{
  return self->_htmlSourceObjects;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (NSArray)guiltyObjects
{
  return self->_guiltyObjects;
}

- (BOOL)containsUnsharedObjects
{
  return self->_containsUnsharedObjects;
}

- (void)setContainsUnsharedObjects:(BOOL)a3
{
  self->_containsUnsharedObjects = a3;
}

- (BOOL)allowsRecentlyDeletedFolderAlert
{
  return self->_allowsRecentlyDeletedFolderAlert;
}

- (void)setAllowsRecentlyDeletedFolderAlert:(BOOL)a3
{
  self->_allowsRecentlyDeletedFolderAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guiltyObjects, 0);
  objc_storeStrong((id *)&self->_htmlSourceObjects, 0);
  objc_storeStrong((id *)&self->_htmlFolders, 0);
  objc_storeStrong((id *)&self->_htmlNotes, 0);
  objc_storeStrong((id *)&self->_modernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernNotes, 0);
  objc_storeStrong((id *)&self->_modernFolders, 0);
}

@end
