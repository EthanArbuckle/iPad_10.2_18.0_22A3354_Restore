@implementation SBTraitsOrientationDefaultTreeNodesSpecifier

- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "acquiredParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v14, "role");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v14, v15);

        objc_msgSend(v14, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v14, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v11);
  }
  v45 = v8;
  v43 = v7;

  -[SBTraitsOrientationDefaultTreeNodesSpecifier _activeOrientationOrderedNodesWithContext:](self, "_activeOrientationOrderedNodesWithContext:", v6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "acquiredParticipants");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v42 = v6;
  objc_msgSend(v6, "acquiredParticipants");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v46)
  {
    v23 = *(_QWORD *)v48;
    v24 = 0x1E0DC0000uLL;
    v44 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v26, "orientationResolutionPolicyInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "resolutionPolicy");
        if (v28 != 2)
        {
          if (v28 == 3)
          {
            objc_msgSend(v27, "associatedParticipantUniqueIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v27, "associatedParticipantUniqueIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v45;
LABEL_25:
              objc_msgSend(v31, "objectForKey:", v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_27;
            }
            objc_msgSend(v27, "associatedParticipantRole");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v27, "associatedParticipantRole");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v43;
              goto LABEL_25;
            }
          }
LABEL_26:
          v35 = 0;
          goto LABEL_27;
        }
        v32 = objc_msgSend(v18, "indexOfObject:", v26) + 1;
        if (v32 >= objc_msgSend(v18, "count"))
          goto LABEL_26;
        v33 = v22;
        v34 = v21;
        while (1)
        {
          objc_msgSend(v18, "objectAtIndex:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "orientationPreferences");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "canDetermineActiveOrientation");

          if ((v37 & 1) != 0)
            break;

          if (++v32 >= objc_msgSend(v18, "count"))
          {
            v35 = 0;
            break;
          }
        }
        v21 = v34;
        v22 = v33;
        v23 = v44;
        v24 = 0x1E0DC0000;
LABEL_27:
        v39 = (void *)objc_msgSend(objc_alloc(*(Class *)(v24 + 2272)), "initWithParticipant:parentParticipant:", v26, v35);
        objc_msgSend(v21, "addObject:", v39);

      }
      v46 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v46);
  }

  return v21;
}

- (id)_activeOrientationOrderedNodesWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "acquiredParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "acquiredParticipants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_21;
  }
  v25 = v3;
  v8 = 0;
  v9 = 0;
  v27 = 0;
  v10 = *(_QWORD *)v30;
  obj = v6;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v12, "role");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SBTraitsParticipantRoleCoverSheet"));

      if (v14)
      {
        v15 = v12;

        v9 = v15;
      }
      objc_msgSend(v12, "role");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SBTraitsParticipantRoleCoverSheetCamera"));

      if (v17)
      {
        v18 = v8;
        v8 = v12;
      }
      else
      {
        objc_msgSend(v12, "role");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("SBTraitsParticipantRoleSecureApp"));

        if (v20)
        {
          v18 = v27;
          v27 = v12;
        }
        else
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E0]), "initWithParticipant:parentParticipant:", v12, 0);
          objc_msgSend(v12, "currentZOrderLevel");
          objc_msgSend(v18, "setOrder:");
          objc_msgSend(v26, "addObject:", v18);
        }
      }

    }
    v7 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v7);

  if (!v9)
  {
    v3 = v25;
    v7 = v27;
    goto LABEL_23;
  }
  v3 = v25;
  v7 = v27;
  if (v8)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E0]), "initWithParticipant:parentParticipant:", v8, v9);
    objc_msgSend(v26, "addObject:", v21);

  }
  if (v27)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E0]), "initWithParticipant:parentParticipant:", v27, v9);
    objc_msgSend(v26, "addObject:", v6);
LABEL_21:

  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0DC08D8], "treeWithNodesSpecifications:traversalType:debugName:", v26, 0, CFSTR("Active Orientation Order"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "participantsTopologicalSort");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
