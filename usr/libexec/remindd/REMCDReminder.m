@implementation REMCDReminder

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDReminder"));
}

- (void)setList:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("list")));
  -[REMCDReminder setPreviousList:](self, "setPreviousList:", v4);

  if ((objc_opt_respondsToSelector(self, "willChangeList:toList:") & 1) != 0)
    -[REMCDReminder willChangeList:toList:](self, "willChangeList:toList:", self->previousList, v5);
  -[REMCDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("list"));
  -[REMCDReminder setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("list"));
  -[REMCDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("list"));

}

- (BOOL)validateForInsert:(id *)a3
{
  unsigned int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMCDReminder;
  v5 = -[REMCDObject validateForInsert:](&v12, "validateForInsert:");
  if (!v5 || -[REMCDReminder _validateForReminderTreeConsistency:](self, "_validateForReminderTreeConsistency:", a3))
  {
    v6 = 1;
    return v5 & v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));

  if (!v7)
  {
    v9 = 0;
LABEL_9:

    v6 = 0;
    return v5 & v6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "validationPolicy"));

  if (!v9 || !objc_msgSend(v9, "saveShouldContinueIfCustomValidationFailed"))
    goto LABEL_9;
  v10 = 1;
  objc_msgSend(v9, "setCustomValidationFailed:", 1);

  return v10;
}

- (BOOL)validateForUpdate:(id *)a3
{
  unsigned __int8 v5;
  unsigned int v6;
  void *v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMCDReminder;
  v5 = -[REMCDObject validateForUpdate:](&v12, "validateForUpdate:");
  v6 = -[REMCDReminder _validateMoveAcrossLists:](self, "_validateMoveAcrossLists:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext"));

  if (!v7
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject storeControllerManagedObjectContext](self, "storeControllerManagedObjectContext")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "validationPolicy")),
        v8,
        !v7))
  {
    v9 = 1;
    goto LABEL_7;
  }
  v9 = 0;
  if (objc_msgSend(v7, "shouldValidateMoveAcrossSharedList"))
  {
LABEL_7:
    if (!v6 || !-[REMCDReminder _validateMoveAcrossSharedLists:](self, "_validateMoveAcrossSharedLists:", a3))
      goto LABEL_13;
    goto LABEL_9;
  }
  v10 = 0;
  if (!v6)
  {
LABEL_11:
    if ((v9 & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
LABEL_9:
  if (-[REMCDReminder _validateForReminderTreeConsistency:](self, "_validateForReminderTreeConsistency:", a3))
  {
    v10 = -[REMCDReminder _validateAssignmentsForInvalidSharees:](self, "_validateAssignmentsForInvalidSharees:", a3);
    goto LABEL_11;
  }
LABEL_13:
  v10 = 0;
  if ((v9 & 1) != 0)
  {
LABEL_17:
    v5 &= v10;
    goto LABEL_18;
  }
LABEL_14:
  if ((v10 & 1) != 0 || !objc_msgSend(v7, "saveShouldContinueIfCustomValidationFailed"))
    goto LABEL_17;
  objc_msgSend(v7, "setCustomValidationFailed:", 1);
LABEL_18:

  return v5;
}

- (BOOL)_validateMoveAcrossLists:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = objc_alloc((Class)REMAccountCapabilities);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
  v7 = objc_msgSend(v5, "initWithAccountType:", (int)objc_msgSend(v6, "type"));

  if ((objc_msgSend(v7, "supportsMoveAcrossLists") & 1) != 0)
    goto LABEL_10;
  v8 = objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
  if (!v10)
  {

    goto LABEL_10;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v16 = objc_msgSend(v13, "isEqual:", v15);

  if ((v16 & 1) != 0)
  {
LABEL_10:
    LOBYTE(a3) = 1;
    goto LABEL_11;
  }
  v17 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10067DE90(self, v17);

  if (a3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remObjectID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "remObjectID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "remObjectID"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorMoveReminderFromList:toList:inAccount:](REMError, "validationErrorMoveReminderFromList:toList:inAccount:", v19, v21, v23));

    LOBYTE(a3) = 0;
  }
LABEL_11:

  return (char)a3;
}

- (BOOL)_validateMoveAcrossSharedLists:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id *v28;

  v5 = objc_alloc((Class)REMAccountCapabilities);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
  v7 = objc_msgSend(v5, "initWithAccountType:", (int)objc_msgSend(v6, "type"));

  if ((objc_msgSend(v7, "supportsMoveAcrossSharedLists") & 1) != 0)
    goto LABEL_7;
  v8 = objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  if (!v8)
    goto LABEL_7;
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
  if (!v10)
    goto LABEL_6;
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  if ((objc_msgSend(v13, "isEqual:", v15) & 1) != 0)
  {

LABEL_6:
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  v28 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  if ((objc_msgSend(v18, "isShared") & 1) != 0)
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    v27 = objc_msgSend(v19, "isShared");

    if ((v27 & 1) == 0)
      goto LABEL_7;
  }
  v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_10067DF78(self, v20);

  if (v28)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "remObjectID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "remObjectID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "remObjectID"));
    *v28 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorMoveReminderFromList:toList:inAccount:](REMError, "validationErrorMoveReminderFromList:toList:inAccount:", v22, v24, v26));

  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)_validateForReminderTreeConsistency:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id *v42;
  BOOL v43;
  BOOL v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v5 = objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
  if (!v5)
    goto LABEL_10;
  v6 = (void *)v5;
  v7 = objc_claimAutoreleasedReturnValue(-[REMCDReminder children](self, "children"));
  if (!v7)
  {

    goto LABEL_10;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder children](self, "children"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_10:
    v15 = 1;
    goto LABEL_11;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_10067E2A8(self, v11);

  if (a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remObjectID"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorNestedSubtask:parentReminderID:](REMError, "validationErrorNestedSubtask:parentReminderID:", v12, v14));

  }
  v15 = 0;
LABEL_11:
  v16 = objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
    if ((objc_msgSend(v18, "markedForDeletion") & 1) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
    if ((objc_msgSend(v19, "ckNeedsInitialFetchFromCloud") & 1) != 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    v43 = v15;
    v20 = a3;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "list"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));

    a3 = v20;
    v15 = v43;

    if (v23 != v25)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10067E168(self);

      if (!a3)
      {
        v15 = 0;
        goto LABEL_21;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remObjectID"));
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorSubtaskAndParentNotOnSameList:parentReminderID:](REMError, "validationErrorSubtaskAndParentNotOnSameList:parentReminderID:", v17, v19));
      goto LABEL_19;
    }
  }
LABEL_21:
  if ((-[REMCDReminder ckNeedsInitialFetchFromCloud](self, "ckNeedsInitialFetchFromCloud") & 1) == 0
    && (-[REMCDReminder markedForDeletion](self, "markedForDeletion") & 1) == 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder children](self, "children"));

    if (v27)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder children](self, "children"));
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v29)
      {
        v30 = v29;
        v44 = v15;
        v42 = a3;
        v31 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "list", v42));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));

            if (v35 != v37)
            {
              v38 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                sub_10067E060(v33, self);

              if (v42)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "remObjectID"));
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
                *v42 = (id)objc_claimAutoreleasedReturnValue(+[REMError validationErrorSubtaskAndParentNotOnSameList:parentReminderID:](REMError, "validationErrorSubtaskAndParentNotOnSameList:parentReminderID:", v39, v40));

              }
              v15 = 0;
              goto LABEL_38;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v30)
            continue;
          break;
        }
        v15 = v44;
      }
LABEL_38:

    }
  }
  return v15;
}

- (BOOL)_validateAssignmentsForInvalidSharees:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  REMCDReminder *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  REMCDReminder *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  unsigned __int8 v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  REMCDReminder *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  REMCDReminder *v74;
  void *v75;
  id v76;
  unsigned __int8 v78;
  void *v79;
  char v80;
  void *v81;
  unsigned int v82;
  NSObject *obj;
  REMCDReminder *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  _BYTE v103[128];

  v4 = objc_alloc((Class)REMAccountCapabilities);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
  v6 = objc_msgSend(v4, "initWithAccountType:", (int)objc_msgSend(v5, "type"));

  LODWORD(v4) = objc_msgSend(v6, "supportsAssignments");
  v79 = v6;
  v7 = objc_msgSend(v6, "supportsMoveAcrossSharedLists");
  if (!(_DWORD)v4)
    goto LABEL_51;
  v78 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      v12 = self;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      v15 = objc_msgSend(v11, "isEqual:", v14) ^ 1;

      self = v12;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder assignments](self, "assignments"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectEnumerator"));

  obj = v17;
  v88 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
  if (!v88)
  {
LABEL_50:

    goto LABEL_51;
  }
  v80 = 0;
  v87 = *(_QWORD *)v90;
  v84 = self;
  v82 = v15;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v90 != v87)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v18);
      if (!v15)
      {
        v36 = 0;
LABEL_28:
        v53 = 0;
        goto LABEL_29;
      }
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v18), "assignee"));
      if (v20)
      {
        v21 = (void *)v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assignee"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "list"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));

        if (v24 == v26)
        {
          v36 = 0;
        }
        else
        {
          v27 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder identifier](v84, "identifier"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](v84, "previousList"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "identifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](v84, "list"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
            v33 = v19;
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](v84, "account"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
            *(_DWORD *)buf = 138544386;
            v94 = v28;
            v95 = 2114;
            v96 = v29;
            v97 = 2114;
            v98 = v30;
            v99 = 2114;
            v100 = v32;
            v101 = 2114;
            v102 = v35;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Validation Update: Moving reminder to another list nullifies assignee in its assignments {assignment.identifier: %{public}@, reminder.identifier: %{public}@, fromList.identifier: %{public}@, toList.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x34u);

            v19 = v33;
          }

          v36 = 1;
          v80 = 1;
        }
        self = v84;
        v15 = v82;
      }
      else
      {
        v36 = 0;
      }
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originator"));
      if (!v37)
        goto LABEL_28;
      v38 = (void *)v37;
      v86 = v19;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originator"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "list"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
      v42 = self;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifier"));

      if (v41 == v44)
      {
        v53 = 0;
        v19 = v86;
        self = v42;
      }
      else
      {
        v45 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
        self = v42;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "identifier"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder identifier](v42, "identifier"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder previousList](self, "previousList"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "identifier"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](v84, "list"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "identifier"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](v84, "account"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
          *(_DWORD *)buf = 138544386;
          v94 = v46;
          v95 = 2114;
          v96 = v47;
          v97 = 2114;
          v98 = v48;
          v99 = 2114;
          v100 = v50;
          v101 = 2114;
          v102 = v52;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Validation Update: Moving reminder to another list nullifies origiantor in its assignments {assignment.identifier: %{public}@, reminder.identifier: %{public}@, fromList.identifier: %{public}@, toList.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x34u);

          self = v84;
          v15 = v82;

        }
        v80 = 1;
        v53 = 1;
        v19 = v86;
      }
LABEL_29:
      v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assignee"));
      if (v54)
      {
        v55 = (void *)v54;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assignee"));
        v57 = +[REMCDAssignment isShareeActivelyParticipatingWithSharee:](REMCDAssignment, "isShareeActivelyParticipatingWithSharee:", v56);

        if ((v57 & 1) == 0)
        {
          v58 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder identifier](self, "identifier"));
            v61 = v19;
            v62 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
            v63 = self;
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "identifier"));
            *(_DWORD *)buf = 138543874;
            v94 = v59;
            v95 = 2114;
            v96 = v60;
            v97 = 2114;
            v98 = v64;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Validation Update: Assignee in disallowed status and hence will be nullified {assignment.identifier: %{public}@, reminder.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x20u);

            self = v63;
            v19 = v61;

          }
          v36 = 1;
        }
      }
      v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originator"));
      if (v65)
      {
        v66 = (void *)v65;
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originator"));
        v68 = +[REMCDAssignment isShareeActivelyParticipatingWithSharee:](REMCDAssignment, "isShareeActivelyParticipatingWithSharee:", v67);

        if ((v68 & 1) == 0)
        {
          v69 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder identifier](self, "identifier"));
            v72 = v19;
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder account](self, "account"));
            v74 = self;
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "identifier"));
            *(_DWORD *)buf = 138543874;
            v94 = v70;
            v95 = 2114;
            v96 = v71;
            v97 = 2114;
            v98 = v75;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Validation Update: Originator in disallowed status and hence will be nullified {assignment.identifier: %{public}@, reminder.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x20u);

            self = v74;
            v19 = v72;

          }
          v53 = 1;
        }
      }
      if (v36)
        objc_msgSend(v19, "setAssignee:", 0);
      if (v53)
        objc_msgSend(v19, "setOriginator:", 0);
      v18 = (char *)v18 + 1;
    }
    while (v88 != v18);
    v76 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    v88 = v76;
  }
  while (v76);

  if (!(v78 & 1 | ((v80 & 1) == 0)))
  {
    obj = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      sub_10067E38C(self, obj);
    goto LABEL_50;
  }
LABEL_51:

  return 1;
}

- (REMDisplayDate)displayDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder displayDateDate](self, "displayDateDate"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder displayDateTimeZone](self, "displayDateTimeZone"));
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v4));
    else
      v5 = 0;
    v6 = objc_msgSend(objc_alloc((Class)REMDisplayDate), "initWithDate:allDay:timeZone:", v3, -[REMCDReminder displayDateIsAllDay](self, "displayDateIsAllDay"), v5);

  }
  else
  {
    v6 = 0;
  }

  return (REMDisplayDate *)v6;
}

- (void)setDisplayDate:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder displayDate](self, "displayDate"));
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
    -[REMCDReminder setDisplayDateDate:](self, "setDisplayDateDate:", v6);

    -[REMCDReminder setDisplayDateIsAllDay:](self, "setDisplayDateIsAllDay:", objc_msgSend(v10, "isAllDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    -[REMCDReminder setDisplayDateTimeZone:](self, "setDisplayDateTimeZone:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone"));
    -[REMCDReminder setDisplayDateUpdatedForSecondsFromGMT:](self, "setDisplayDateUpdatedForSecondsFromGMT:", objc_msgSend(v9, "secondsFromGMT"));

  }
}

- (REMDisplayDateUtils)displayDateUtils
{
  REMDisplayDateUtils *displayDateUtils;
  REMDisplayDateUtils *v4;
  REMDisplayDateUtils *v5;

  displayDateUtils = self->_displayDateUtils;
  if (!displayDateUtils)
  {
    v4 = (REMDisplayDateUtils *)objc_alloc_init((Class)REMDisplayDateUtils);
    v5 = self->_displayDateUtils;
    self->_displayDateUtils = v4;

    displayDateUtils = self->_displayDateUtils;
  }
  return displayDateUtils;
}

- (void)willSave
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMCDReminder;
  -[REMCDObject willSave](&v9, "willSave");
  if (-[REMCDReminder willSave_handledExtraneousAlarmsMarking](self, "willSave_handledExtraneousAlarmsMarking"))
  {
    v3 = 0;
  }
  else
  {
    -[REMCDReminder setWillSave_handledExtraneousAlarmsMarking:](self, "setWillSave_handledExtraneousAlarmsMarking:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder changedValues](self, "changedValues"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

    if (objc_msgSend(v5, "containsObject:", CFSTR("alarmStorage"))
      && (objc_opt_respondsToSelector(self, "markExtraneousAlarmsForDeletion") & 1) != 0
      && -[REMCDReminder markExtraneousAlarmsForDeletion](self, "markExtraneousAlarmsForDeletion"))
    {
      if (-[REMCDReminder willSave_handledUpdateDisplayDate](self, "willSave_handledUpdateDisplayDate"))
      {
        v8 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          sub_10067E4B0(self, v8);

      }
      v3 = 1;
    }
    else
    {
      v3 = 0;
    }

  }
  if (!-[REMCDReminder willSave_handledUpdateDisplayDate](self, "willSave_handledUpdateDisplayDate"))
  {
    -[REMCDReminder setWillSave_handledUpdateDisplayDate:](self, "setWillSave_handledUpdateDisplayDate:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder changedValues](self, "changedValues"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));

    if ((v3 & 1) != 0
      || (objc_msgSend(v7, "containsObject:", CFSTR("alarmStorage")) & 1) != 0
      || objc_msgSend(v7, "containsObject:", CFSTR("dueDate")))
    {
      -[REMCDReminder updateDisplayDate](self, "updateDisplayDate");
    }

  }
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDReminder;
  -[REMCDObject didSave](&v3, "didSave");
  -[REMCDReminder setWillSave_handledUpdateDisplayDate:](self, "setWillSave_handledUpdateDisplayDate:", 0);
  -[REMCDReminder setWillSave_handledExtraneousAlarmsMarking:](self, "setWillSave_handledExtraneousAlarmsMarking:", 0);
}

- (void)updateDisplayDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[REMCDReminder displayDateUtils](self, "displayDateUtils"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder dueDateComponents](self, "dueDateComponents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder alarms](self, "alarms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayDateWithDueDateComponents:alarms:", v3, v4));
  -[REMCDReminder setDisplayDate:](self, "setDisplayDate:", v5);

}

- (void)updateDisplayDateWithAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[REMCDReminder displayDateUtils](self, "displayDateUtils"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder dueDateComponents](self, "dueDateComponents"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updateDisplayDateWithDueDateComponents:alarm:alarmsProviding:", v5, v6, self));
  -[REMCDReminder setDisplayDate:](self, "setDisplayDate:", v7);

}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMReminder cdEntityName](REMReminder, "cdEntityName");
}

- (void)incrementSpotlightIndexCount
{
  char *v3;

  if (-[REMCDReminder spotlightIndexCount](self, "spotlightIndexCount") == (id)0x7FFFFFFFFFFFFFFFLL)
    v3 = 0;
  else
    v3 = (char *)-[REMCDReminder spotlightIndexCount](self, "spotlightIndexCount") + 1;
  -[REMCDReminder setSpotlightIndexCount:](self, "setSpotlightIndexCount:", v3);
}

+ (id)propertiesThatShouldTriggerReindexing
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100804C18);
}

- (REMCDList)previousList
{
  return self->previousList;
}

- (void)setPreviousList:(id)a3
{
  objc_storeStrong((id *)&self->previousList, a3);
}

- (BOOL)willSave_handledExtraneousAlarmsMarking
{
  return self->willSave_handledExtraneousAlarmsMarking;
}

- (void)setWillSave_handledExtraneousAlarmsMarking:(BOOL)a3
{
  self->willSave_handledExtraneousAlarmsMarking = a3;
}

- (BOOL)willSave_handledUpdateDisplayDate
{
  return self->willSave_handledUpdateDisplayDate;
}

- (void)setWillSave_handledUpdateDisplayDate:(BOOL)a3
{
  self->willSave_handledUpdateDisplayDate = a3;
}

- (BOOL)willSave_hasProcessedDueDateDeltaAlertsDataChanges
{
  return self->willSave_hasProcessedDueDateDeltaAlertsDataChanges;
}

- (void)setWillSave_hasProcessedDueDateDeltaAlertsDataChanges:(BOOL)a3
{
  self->willSave_hasProcessedDueDateDeltaAlertsDataChanges = a3;
}

- (RDDueDateDeltaAlerts)cachedDeserializedDueDateDeltaAlerts
{
  return self->cachedDeserializedDueDateDeltaAlerts;
}

- (void)setCachedDeserializedDueDateDeltaAlerts:(id)a3
{
  objc_storeStrong((id *)&self->cachedDeserializedDueDateDeltaAlerts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedDeserializedDueDateDeltaAlerts, 0);
  objc_storeStrong((id *)&self->previousList, 0);
  objc_storeStrong((id *)&self->_displayDateUtils, 0);
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObject remObjectID](self, "remObjectID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
    v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = objc_msgSend(v6, "integerValue") == (id)1;
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_100804620, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));

      if (v9)
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
      else
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
      v11 = v10;
      v8 = objc_msgSend(v10, "isConnectedToAccountObject:", v4);

      if (v8)
        v12 = &off_100804638;
      else
        v12 = &off_100804650;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v5);
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("parentReminder"), CFSTR("list"), 0);
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder parentReminder](self, "parentReminder"));
    v5 = objc_msgSend(v4, "effectiveMinimumSupportedVersion");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder list](self, "list"));
      v5 = objc_msgSend(v6, "effectiveMinimumSupportedVersion");

    }
    else
    {
      v5 = (id)kREMSupportedVersionUnset;
    }
  }

  return (int64_t)v5;
}

+ (id)timeZoneFromName:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:"));
  else
    return 0;
}

+ (id)dueDateComponentsWithDueDate:(id)a3 isAllDay:(BOOL)a4 timeZoneName:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    v9 = a5;
    v11 = objc_msgSend((id)objc_opt_class(a1, v10), "timeZoneFromName:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
      v13 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateComponentsWithDate:timeZone:isAllDay:](NSDateComponents, "rem_dateComponentsWithDate:timeZone:isAllDay:", v8, v12, v6));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:](NSDateComponents, "rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:", v8, v6));
    v14 = (void *)v13;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDateComponents)dueDateComponents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder dueDate](self, "dueDate"));
  v5 = -[REMCDReminder allDay](self, "allDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder timeZone](self, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dueDateComponentsWithDueDate:isAllDay:timeZoneName:", v4, v5, v6));

  return (NSDateComponents *)v7;
}

- (void)setDueDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    -[REMCDReminder setAllDay:](self, "setAllDay:", objc_msgSend(v4, "rem_isAllDayDateComponents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZone"));
    if (-[REMCDReminder allDay](self, "allDay"))
    {

      v5 = 0;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    -[REMCDReminder setTimeZone:](self, "setTimeZone:", v6);

    if (v5)
      v7 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateWithDateComponents:timeZone:](NSDateComponents, "rem_dateWithDateComponents:timeZone:", v9, v5));
    else
      v7 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateWithDateComponentsUsingArchivingTimeZone:](NSDateComponents, "rem_dateWithDateComponentsUsingArchivingTimeZone:", v9));
    v8 = (void *)v7;
    -[REMCDReminder setDueDate:](self, "setDueDate:", v7);

  }
  else
  {
    -[REMCDReminder setDueDate:](self, "setDueDate:", 0);
  }

}

- (NSDateComponents)startDateComponents
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder startDate](self, "startDate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder startDate](self, "startDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:](NSDateComponents, "rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:", v4, 0));

  }
  else
  {
    v5 = 0;
  }
  return (NSDateComponents *)v5;
}

- (void)setStartDateComponents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
    if (v5)
      v6 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateWithDateComponents:timeZone:](NSDateComponents, "rem_dateWithDateComponents:timeZone:", v8, v5));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[NSDateComponents rem_dateWithDateComponentsUsingArchivingTimeZone:](NSDateComponents, "rem_dateWithDateComponentsUsingArchivingTimeZone:", v8));
    v7 = (void *)v6;
    -[REMCDReminder setStartDate:](self, "setStartDate:", v6);

  }
  else
  {
    -[REMCDReminder setStartDate:](self, "setStartDate:", 0);
  }

}

- (NSArray)alarms
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder alarmStorage](self, "alarmStorage"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder alarmStorage](self, "alarmStorage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder alarmStorage](self, "alarmStorage", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "isDeleted") & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelObject"));
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (unint64_t)displayOrder
{
  id v3;
  void *v4;
  double v5;

  v3 = -[REMCDReminder icsDisplayOrder](self, "icsDisplayOrder");
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder creationDate](self, "creationDate"));
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v3 = (id)v5;

  }
  return (unint64_t)v3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  void *v5;

  if (a3
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDReminder creationDate](self, "creationDate")),
        v5,
        v5))
  {
    -[REMCDReminder setIcsDisplayOrder:](self, "setIcsDisplayOrder:", a3);
  }
}

- (void)debug_lowLevelRemoveFromParent
{
  -[REMCDReminder setParentReminder:](self, "setParentReminder:", 0);
  -[REMCDReminder setList:](self, "setList:", 0);
}

- (BOOL)markExtraneousAlarmsForDeletion
{
  REMCDReminder *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = REMCDReminder.markExtraneousAlarmsForDeletion()();

  return v3;
}

- (void)willChangeList:(id)a3 toList:(id)a4
{
  id v7;
  id v8;
  REMCDReminder *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  REMCDReminder.willChange(_:to:)((REMCDList_optional *)a3, (REMCDList_optional *)a4);

}

- (BOOL)validateForInsert_Swift:(id *)a3
{
  REMCDReminder *v3;

  v3 = self;
  sub_10029E6A0();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)willSave_Swift
{
  REMCDReminder *v2;

  v2 = self;
  REMCDReminder.willSave_Swift()();

}

- (void)didSave_Swift
{
  -[REMCDReminder setWillSave_hasProcessedDueDateDeltaAlertsDataChanges:](self, "setWillSave_hasProcessedDueDateDeltaAlertsDataChanges:", 0);
}

- (void)willChangeValueForKey_Swfit:(id)a3
{
  -[REMCDReminder setCachedDeserializedDueDateDeltaAlerts:](self, "setCachedDeserializedDueDateDeltaAlerts:", 0);
}

- (void)prepareForDeletion_Swift
{
  REMCDReminder *v2;

  v2 = self;
  _sSo13REMCDReminderC7reminddE24prepareForDeletion_SwiftyyF_0();

}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (id)recordTypes
{
  return Array._bridgeToObjectiveC()().super.isa;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  swift_getObjCClassMetadata(a1);
  v11 = a3;
  v12 = a5;
  v13 = (void *)static REMCDReminder.existingCloudObject(for:accountID:managedObjectContext:)(v11, v8, v10, v12);

  swift_bridgeObjectRelease();
  return v13;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = static REMCDReminder.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

  return v11;
}

- (id)recordZoneName
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("Reminders"));
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (id)recordType
{
  return String._bridgeToObjectiveC()();
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  REMCDReminder *v10;
  Swift::String v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDReminder.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (CKRecord)ckServerRecord
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMCDReminder;
  return -[REMCDObject ckServerRecord](&v3, "ckServerRecord");
}

- (void)setCkServerRecord:(id)a3
{
  id v4;
  REMCDReminder *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REMCDReminder;
  v4 = a3;
  v5 = self;
  -[REMCDObject setCkServerRecord:](&v6, "setCkServerRecord:", v4);
  sub_1002F4F74();

}

- (id)newlyCreatedRecord
{
  REMCDReminder *v2;
  void *v3;

  v2 = self;
  v3 = (void *)REMCDReminder.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  REMCDReminder *v2;
  id v3;

  v2 = self;
  v3 = -[REMCDReminder list](v2, "list");

  return v3;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v5;
  REMCDReminder *v6;
  REMCDObject_optional *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = self;
  REMCDReminder.existingLocalObjectToMerge(with:)(v7, (NSPredicate_optional *)a3);
  v9 = v8;

  return v9;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  REMCDObject *v4;
  REMCDReminder *v5;

  v4 = (REMCDObject *)a3;
  v5 = self;
  LOBYTE(self) = REMCDReminder.merge(withLocalObject:)(v4);

  return self & 1;
}

- (id)objectsToBeDeletedBeforeThisObject
{
  REMCDReminder *v2;
  Class isa;

  v2 = self;
  REMCDReminder.objectsToBeDeletedBeforeThisObject()();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)fixBrokenReferences
{
  REMCDReminder *v2;

  v2 = self;
  REMCDReminder.fixBrokenReferences()();

}

- (void)processDueDateDeltaAlertsDataChanges
{
  REMCDReminder *v2;

  v2 = self;
  REMCDReminder.processDueDateDeltaAlertsDataChanges()();

}

@end
