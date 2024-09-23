@implementation ICVirtualSmartFolderItemIdentifier

- (BOOL)isHiddenInContext:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[ICVirtualSmartFolderItemIdentifier visibility](self, "visibility");
  if (v5 == 2)
  {
    v6 = 1;
  }
  else if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[ICVirtualSmartFolderItemIdentifier isEmptyInContext:](self, "isEmptyInContext:", v4);
  }

  return v6;
}

- (int64_t)visibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier visibilityUserDefaultsKey](self, "visibilityUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "BOOLValue"))
      v7 = 2;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)visibilityUserDefaultsKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICVirtualSmartFolderItemIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:hidden"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEmptyInContext:(id)a3
{
  return -[ICVirtualSmartFolderItemIdentifier visibleItemCountInContext:](self, "visibleItemCountInContext:", a3) == 0;
}

- (unint64_t)visibleItemCountInContext:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[ICVirtualSmartFolderItemIdentifier visibleNoteCountInContext:](self, "visibleNoteCountInContext:", v4);
  v6 = -[ICVirtualSmartFolderItemIdentifier visibleInvitationCountInContext:](self, "visibleInvitationCountInContext:", v4);

  return v6 + v5;
}

- (unint64_t)visibleNoteCountInContext:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ICVirtualSmartFolderItemIdentifier_visibleNoteCountInContext___block_invoke;
  v8[3] = &unk_1E5C1E190;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)visibleInvitationCountInContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"));

  if (v6)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__ICVirtualSmartFolderItemIdentifier_visibleInvitationCountInContext___block_invoke;
    v9[3] = &unk_1E5C1DC18;
    v9[4] = self;
    v10 = v4;
    v11 = &v12;
    objc_msgSend(v10, "performBlockAndWait:", v9);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICVirtualSmartFolderItemIdentifier accountObjectID](self, "accountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICVirtualSmartFolderItemIdentifier accountObjectID](self, "accountObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URIRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = self->_hash;
  if (!result)
  {
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    -[ICVirtualSmartFolderItemIdentifier parentIdentifier](self, "parentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");
    -[ICVirtualSmartFolderItemIdentifier accountObjectID](self, "accountObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hash");
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

void __58__ICVirtualSmartFolderItemIdentifier_predicateForContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(*(id *)(a1 + 32), "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v9 = (void *)MEMORY[0x1E0D63BB8];
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForNotesInAccountWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForFetchedFromCloudObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v12;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForUnmarkedForDeletionObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(*(id *)(a1 + 32), "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForFetchedFromCloudObjects", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0D63BB8], "predicateForUnmarkedForDeletionObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;
  }

}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (ICQuery)query
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  id v15;

  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D63C28], "queryForSharedNotes:allowsRecentlyDeleted:", 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D63C28], "queryForSystemPaperNotesAllowsRecentlyDeleted:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICVirtualSmartFolderItemIdentifier type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"));

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D63C28], "queryForMathNotesAllowsRecentlyDeleted:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ICVirtualSmartFolderItemIdentifier type](self, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"));

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0D63C28], "queryForCallNotesAllowsRecentlyDeleted:", 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[ICVirtualSmartFolderItemIdentifier type](self, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"));

          if (!v13)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid virtual smart folder type"), 0);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v15);
          }
          objc_msgSend(MEMORY[0x1E0D63C28], "queryForRecentlyDeletedMathNotes");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }
  return (ICQuery *)v5;
}

- (NSString)type
{
  return self->_type;
}

- (ICItemIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

void __70__ICVirtualSmartFolderItemIdentifier_visibleInvitationCountInContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accountObjectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  v6 = (void *)MEMORY[0x1E0D63B58];
  +[ICInvitationsCoreDataIndexer defaultReceivedSince](ICInvitationsCoreDataIndexer, "defaultReceivedSince");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForPendingInvitationsInAccount:receivedSince:", v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63B58], "invitationsMatchingPredicate:context:", v8, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "count");

}

- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4 accountObjectID:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICVirtualSmartFolderItemIdentifier *v12;
  void *v13;
  char v14;
  id v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICVirtualSmartFolderItemIdentifier;
  v12 = -[ICVirtualSmartFolderItemIdentifier init](&v17, sel_init);
  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "allTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v9);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid virtual smart folder type"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v12->_parentIdentifier, a4);
    objc_storeStrong((id *)&v12->_accountObjectID, a5);
  }

  return v12;
}

+ (NSArray)allTypes
{
  if (allTypes_onceToken != -1)
    dispatch_once(&allTypes_onceToken, &__block_literal_global_6);
  return (NSArray *)(id)allTypes_allTypes;
}

- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4
{
  return -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](self, "initWithType:parentIdentifier:accountObjectID:", a3, a4, 0);
}

void __64__ICVirtualSmartFolderItemIdentifier_visibleNoteCountInContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0D63BB8];
  objc_msgSend(*(id *)(a1 + 32), "predicateForContext:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "countOfNotesMatchingPredicate:context:", v3, *(_QWORD *)(a1 + 40));

}

- (id)predicateForContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ICVirtualSmartFolderItemIdentifier_predicateForContext___block_invoke;
  v8[3] = &unk_1E5C1DC18;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __46__ICVirtualSmartFolderItemIdentifier_allTypes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper");
  v2[1] = CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes");
  v2[2] = CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes");
  v2[3] = CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes");
  v2[4] = CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allTypes_allTypes;
  allTypes_allTypes = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  char v17;
  int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToString:", v7))
    {
      v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
    -[ICVirtualSmartFolderItemIdentifier parentIdentifier](self, "parentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v8)
      v11 = 0;
    else
      v11 = v8;
    v12 = v11;
    if (v10 == v9)
      v13 = 0;
    else
      v13 = v9;
    v14 = v13;
    if (v12 | v14)
    {
      v15 = (void *)v14;
      if (v12)
        v16 = v14 == 0;
      else
        v16 = 1;
      if (v16)
      {
        v17 = 0;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      v18 = objc_msgSend((id)v12, "isEqual:", v14);

      if (!v18)
      {
        v17 = 0;
        goto LABEL_32;
      }
    }
    -[ICVirtualSmartFolderItemIdentifier accountObjectID](self, "accountObjectID");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountObjectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v12)
      v19 = 0;
    else
      v19 = (void *)v12;
    v20 = v19;
    if (v10 == v15)
      v21 = 0;
    else
      v21 = v15;
    v22 = v21;
    v23 = (void *)v22;
    if (v20 | v22)
    {
      v17 = 0;
      if (v20 && v22)
        v17 = objc_msgSend((id)v20, "isEqual:", v22);
    }
    else
    {
      v17 = 1;
    }

    goto LABEL_31;
  }
  v17 = 0;
LABEL_34:

  return v17;
}

- (ICVirtualSmartFolderItemIdentifier)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICVirtualSmartFolderItemIdentifier *v19;
  ICVirtualSmartFolderItemIdentifier *v20;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E5C2F8C0;
  }
  if ((unint64_t)objc_msgSend(v13, "count") < 2)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v9, "persistentStoreCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ic_managedObjectIDForURIString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "allTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "containsObject:", v14))
  {
    self = -[ICVirtualSmartFolderItemIdentifier initWithType:parentIdentifier:accountObjectID:](self, "initWithType:parentIdentifier:accountObjectID:", v14, v8, v17);
    v19 = self;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  return v20;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier parentIdentifier](self, "parentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier accountObjectID](self, "accountObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, type: %@, parentIdentifier: %@, accountID: %@, title: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)title
{
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v16;

  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("Shared");
  }
  else
  {
    -[ICVirtualSmartFolderItemIdentifier type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"));

    if (v8)
    {
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Quick Notes");
    }
    else
    {
      -[ICVirtualSmartFolderItemIdentifier type](self, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"));

      if (v10)
      {
        v5 = (void *)MEMORY[0x1E0D64218];
        v6 = CFSTR("Math Notes");
      }
      else
      {
        -[ICVirtualSmartFolderItemIdentifier type](self, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"));

        if (v12)
        {
          v5 = (void *)MEMORY[0x1E0D64218];
          v6 = CFSTR("Call Recordings");
        }
        else
        {
          -[ICVirtualSmartFolderItemIdentifier type](self, "type");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"));

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid virtual smart folder type"), 0);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v16);
          }
          v5 = (void *)MEMORY[0x1E0D64218];
          v6 = CFSTR("Recently Deleted");
        }
      }
    }
  }
  objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)systemImageName
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;

  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"));

  if ((v4 & 1) != 0)
    return (NSString *)CFSTR("person.crop.circle");
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"));

  if ((v7 & 1) != 0)
    return (NSString *)CFSTR("quicknote");
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"));

  if ((v9 & 1) != 0)
    return (NSString *)CFSTR("apple.math.notes");
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"));

  if ((v11 & 1) != 0)
    return (NSString *)CFSTR("phone.badge.waveform.fill");
  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"));

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid virtual smart folder type"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  return (NSString *)CFSTR("trash");
}

- (BOOL)isTrashFolder
{
  void *v2;
  char v3;

  -[ICVirtualSmartFolderItemIdentifier type](self, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"));

  return v3;
}

- (void)setVisibility:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICVirtualSmartFolderItemIdentifier visibilityUserDefaultsKey](self, "visibilityUserDefaultsKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 1;
LABEL_7:
    objc_msgSend(v5, "setBool:forKey:", v6, v4);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICVirtualSmartFolderItemIdentifier visibilityUserDefaultsKey](self, "visibilityUserDefaultsKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 0;
    goto LABEL_7;
  }
  if (a3)
    return;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier visibilityUserDefaultsKey](self, "visibilityUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);
LABEL_8:

}

- (NSString)noteSortTypeUserDefaultsKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICVirtualSmartFolderItemIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:noteSortType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (ICFolderCustomNoteSortType)noteSortType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier noteSortTypeUserDefaultsKey](self, "noteSortTypeUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  v6 = (void *)MEMORY[0x1E0D64200];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "folderNoteSortTypeFromValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICFolderCustomNoteSortType *)v8;
}

- (void)setNoteSortType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICVirtualSmartFolderItemIdentifier noteSortTypeUserDefaultsKey](self, "noteSortTypeUserDefaultsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v6, v7);

}

- (NSString)dateHeadersTypeUserDefaultsKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[ICVirtualSmartFolderItemIdentifier identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:dateHeadersType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int)dateHeadersType
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier dateHeadersTypeUserDefaultsKey](self, "dateHeadersTypeUserDefaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "integerForKey:", v4);

  return v5;
}

- (void)setDateHeadersType:(int)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICVirtualSmartFolderItemIdentifier dateHeadersTypeUserDefaultsKey](self, "dateHeadersTypeUserDefaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", a3, v5);

}

- (BOOL)supportsDateHeaders
{
  void *v2;
  BOOL v3;

  -[ICVirtualSmartFolderItemIdentifier noteSortType](self, "noteSortType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resolvedCustomSortTypeOrder") != 3;

  return v3;
}

- (BOOL)isShowingDateHeaders
{
  _BOOL4 v3;
  int v4;

  v3 = -[ICVirtualSmartFolderItemIdentifier supportsDateHeaders](self, "supportsDateHeaders");
  if (v3)
  {
    v4 = -[ICVirtualSmartFolderItemIdentifier dateHeadersType](self, "dateHeadersType");
    if (v4 == 2)
    {
      LOBYTE(v3) = 1;
    }
    else if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = objc_msgSend(MEMORY[0x1E0D641D8], "defaultDateHeadersType") == 2;
    }
  }
  return v3;
}

- (NSString)defaultTitle
{
  return self->_defaultTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
