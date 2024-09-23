@implementation REMCDObjectEffectiveVersionValidationNode

- (id)childrenNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  REMCDObjectEffectiveVersionValidationNode *v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[REMCDObjectEffectiveVersionValidationNode backingCDObject](self, "backingCDObject"));
  if (!v2)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[REMLogStore write](REMLogStore, "write"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      sub_10068222C(v18, v19, v20);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "entity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[REMCDObject relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:](REMCDObject, "relationshipsEligibleForEffectiveMinimumSupportedVersionPropagationWithEntity:", v4));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "name"));
        v8 = v2;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectIDsForRelationshipNamed:", v7));

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
              v16 = objc_alloc_init(REMCDObjectEffectiveVersionValidationNode);
              -[REMCDObjectEffectiveVersionValidationNode setManagedObjectID:](v16, "setManagedObjectID:", v15);
              -[REMCDObjectEffectiveVersionValidationNode setBackingCDObject:](v16, "setBackingCDObject:", 0);
              objc_msgSend(v3, "addObject:", v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v12);
        }

        v2 = v8;
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  return v3;
}

- (void)markAsExpanded
{
  -[REMCDObjectEffectiveVersionValidationNode setExpanded:](self, "setExpanded:", 1);
}

- (BOOL)expanded
{
  return self->expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->expanded = a3;
}

- (NSManagedObjectID)managedObjectID
{
  return self->_managedObjectID;
}

- (void)setManagedObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectID, a3);
}

- (REMCDObject)backingCDObject
{
  return self->_backingCDObject;
}

- (void)setBackingCDObject:(id)a3
{
  objc_storeStrong((id *)&self->_backingCDObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCDObject, 0);
  objc_storeStrong((id *)&self->_managedObjectID, 0);
}

@end
