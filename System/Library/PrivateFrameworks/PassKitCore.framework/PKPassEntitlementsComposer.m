@implementation PKPassEntitlementsComposer

- (PKPassEntitlementsComposer)init
{

  return 0;
}

- (PKPassEntitlementsComposer)initWithMyEntitlements:(id)a3
{
  id v4;
  void *v5;
  PKPassEntitlementsComposer *v6;

  v4 = a3;
  objc_msgSend(v4, "pk_arrayByApplyingBlock:", &__block_literal_global_244);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPassEntitlementsComposer initWithSharedEntitlements:availableEntitlements:editable:](self, "initWithSharedEntitlements:availableEntitlements:editable:", v5, v4, 0);

  return v6;
}

PKPassSharedEntitlement *__53__PKPassEntitlementsComposer_initWithMyEntitlements___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  PKPassSharedEntitlement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "entitlement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKPassSharedEntitlement initWithEntitlement:]([PKPassSharedEntitlement alloc], "initWithEntitlement:", v2);
  objc_msgSend(v2, "timeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharedEntitlement setTimeConfiguration:](v3, "setTimeConfiguration:", v4);

  objc_msgSend(v2, "activeShareability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharedEntitlement setRecipientShareability:](v3, "setRecipientShareability:", objc_msgSend(v5, "unsignedIntegerValue"));

  objc_msgSend(v2, "activeVisibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharedEntitlement setRecipientVisibility:](v3, "setRecipientVisibility:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v2, "activeManageability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharedEntitlement setRecipientManageability:](v3, "setRecipientManageability:", objc_msgSend(v7, "unsignedIntegerValue"));

  objc_msgSend(v2, "activeCapabilityRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassSharedEntitlement setRecipientCapabilityRole:](v3, "setRecipientCapabilityRole:", v8);

  return v3;
}

- (PKPassEntitlementsComposer)initWithSharedEntitlements:(id)a3 availableEntitlements:(id)a4 editable:(BOOL)a5
{
  id v9;
  PKPassEntitlementsComposer *v10;
  PKPassEntitlementsComposer *v11;
  uint64_t v12;
  NSArray *predefinedCapabilitySets;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  int v44;
  unsigned int v45;
  int v46;
  NSMutableArray *v47;
  NSMutableArray *allEntryNodes;
  PKPassEntitlementsComposerEntryNode *v49;
  PKPassEntitlementsComposerEntryNode *globalGroup;
  uint64_t v51;
  NSMapTable *entitlementNodeForEntitlementEntry;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  uint64_t v58;
  id *v59;
  void *v60;
  void *v61;
  PKPassSharedEntitlement *v62;
  void *v63;
  PKPassEntitlementsComposerEntitlementEntryNode *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  PKPassEntitlementsComposerEntryNode *v69;
  void *v70;
  uint64_t v71;
  NSArray *entitlementEntries;
  uint64_t v73;
  NSDictionary *entitlementEntriesForEntitlementIdentifier;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  uint64_t v81;
  id v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSArray *obj;
  int v89;
  int v90;
  id v91;
  uint64_t v92;
  void *v93;
  objc_super v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v83 = a4;
  v94.receiver = self;
  v94.super_class = (Class)PKPassEntitlementsComposer;
  v10 = -[PKPassEntitlementsComposer init](&v94, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_88;
  v82 = v9;
  objc_storeStrong((id *)&v10->_originalSharedEntitlements, a3);
  objc_storeStrong((id *)&v11->_availableEntitlements, a4);
  v11->_editable = a5;
  +[PKPassEntitlementCapabilitySet predefinedSets](PKPassEntitlementCapabilitySet, "predefinedSets");
  v12 = objc_claimAutoreleasedReturnValue();
  predefinedCapabilitySets = v11->_predefinedCapabilitySets;
  v11->_predefinedCapabilitySets = (NSArray *)v12;

  -[NSArray pk_indexDictionaryByApplyingBlock:](v11->_originalSharedEntitlements, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_248);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v14 = v11->_originalSharedEntitlements;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v108;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v108 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "timeConfiguration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v17)
        {
          if (v18 && v21)
          {
            if ((objc_msgSend(v18, "isEqual:", v21) & 1) == 0)
              goto LABEL_17;
          }
          else if (v18 != v21)
          {
LABEL_17:

            v89 = 1;
            goto LABEL_19;
          }
        }
        else
        {
          v23 = v21;

          v18 = v23;
        }

        v17 = 1;
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v107, v114, 16);
      v17 = 1;
      if (v16)
        continue;
      break;
    }
    v89 = 0;
  }
  else
  {
    v89 = 0;
    v18 = 0;
  }
LABEL_19:

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v24 = v11->_originalSharedEntitlements;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
  v84 = v18;
  if (!v25)
  {
    v90 = 1;
    v86 = -1;
    v87 = -1;
    v81 = -1;
    v85 = -1;
    goto LABEL_55;
  }
  v26 = v25;
  v27 = *(_QWORD *)v104;
  v86 = -1;
  v87 = -1;
  v28 = -1;
  v29 = -1;
LABEL_21:
  v30 = 0;
  while (1)
  {
    if (*(_QWORD *)v104 != v27)
      objc_enumerationMutation(v24);
    v31 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v30);
    v32 = objc_msgSend(v31, "recipientShareability");
    if (v29 == -1)
      v33 = v32;
    else
      v33 = v29;
    v85 = v33;
    v34 = v29 == v32 || v29 == -1;
    v35 = objc_msgSend(v31, "recipientVisibility");
    v36 = v86;
    v37 = v86 == -1;
    if (v86 == -1)
      v38 = v35;
    else
      v38 = v86;
    v86 = v38;
    v39 = v36 == v35 || v37;
    v40 = objc_msgSend(v31, "recipientManageability");
    v41 = v87;
    v42 = v87 == -1;
    if (v87 == -1)
      v43 = v40;
    else
      v43 = v87;
    v87 = v43;
    if (v41 == v40)
      v42 = 1;
    v44 = v42 & v39 & v34;
    v45 = objc_msgSend(v31, "intraAccountSharingEnabled");
    if (v28 == -1)
      break;
    if (v28 == v45)
      v46 = v44;
    else
      v46 = 0;
    v18 = v84;
    if (v46 != 1)
    {
      v90 = 0;
LABEL_52:
      v81 = v28;
      goto LABEL_55;
    }
LABEL_49:
    v29 = v85;
    if (v26 == ++v30)
    {
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
      if (v26)
        goto LABEL_21;
      v90 = 1;
      goto LABEL_52;
    }
  }
  v18 = v84;
  if ((v44 & 1) != 0)
  {
    v28 = v45;
    goto LABEL_49;
  }
  v81 = v45;
  v90 = 0;
LABEL_55:

  v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  allEntryNodes = v11->_allEntryNodes;
  v11->_allEntryNodes = v47;

  v49 = -[PKPassEntitlementsComposerEntryNode initWithIdentifier:parentEntitlementComposer:]([PKPassEntitlementsComposerEntryNode alloc], "initWithIdentifier:parentEntitlementComposer:", CFSTR("Global"), v11);
  globalGroup = v11->_globalGroup;
  v11->_globalGroup = v49;

  -[PKPassEntitlementsComposerEntryNode setTimeConfiguration:](v11->_globalGroup, "setTimeConfiguration:", v18);
  -[NSMutableArray addObject:](v11->_allEntryNodes, "addObject:", v11->_globalGroup);
  v51 = objc_msgSend(MEMORY[0x1E0CB3748], "pk_createStrongPointerPersonalityToStrongObjects");
  entitlementNodeForEntitlementEntry = v11->_entitlementNodeForEntitlementEntry;
  v11->_entitlementNodeForEntitlementEntry = (NSMapTable *)v51;

  v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v11->_availableEntitlements;
  v53 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  if (v53)
  {
    v54 = v53;
    v92 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v100 != v92)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
        objc_msgSend(v56, "entitlementIdentifier", v81);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "objectForKeyedSubscript:", v57);
        v58 = objc_claimAutoreleasedReturnValue();
        if (v58 || v11->_editable)
        {
          v59 = -[PKPassEntitlementsComposerEntry initWithDisplayableEntitlement:parentEntitlementComposer:]((id *)[PKPassEntitlementsComposerEntry alloc], v56, v11);
          v60 = (void *)v58;
          if (!v58)
          {
            objc_msgSend(v56, "entitlement");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v61)
            {
              v62 = -[PKPassSharedEntitlement initWithEntitlement:]([PKPassSharedEntitlement alloc], "initWithEntitlement:", v61);
            }
            else
            {
              objc_msgSend(v56, "sharedEntitlement");
              v62 = (PKPassSharedEntitlement *)objc_claimAutoreleasedReturnValue();
            }
            v60 = v62;

          }
          v63 = (void *)objc_msgSend(v60, "copy");
          objc_msgSend(v59, "setSharedEntitlement:", v63);

          objc_msgSend(v91, "addObject:", v59);
          v64 = -[PKPassEntitlementsComposerEntitlementEntryNode initWithDisplayableEntitlement:sharedEntitlement:parentEntitlementComposer:]([PKPassEntitlementsComposerEntitlementEntryNode alloc], "initWithDisplayableEntitlement:sharedEntitlement:parentEntitlementComposer:", v56, v60, v11);
          -[PKPassEntitlementsComposerEntryNode setParent:](v64, "setParent:", v11->_globalGroup);
          -[PKPassEntitlementsComposerEntryNode setEnabled:](v64, "setEnabled:", v58 != 0);
          if (v89)
          {
            objc_msgSend(v60, "timeConfiguration");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = (void *)objc_msgSend(v65, "copy");
            -[PKPassEntitlementsComposerEntryNode setTimeConfiguration:](v64, "setTimeConfiguration:", v66);

          }
          if ((v90 & 1) == 0)
          {
            if (v58)
            {
              -[PKPassEntitlementsComposerEntryNode setShareability:](v64, "setShareability:", objc_msgSend(v60, "recipientShareability"));
              -[PKPassEntitlementsComposerEntryNode setVisibility:](v64, "setVisibility:", objc_msgSend(v60, "recipientVisibility"));
              -[PKPassEntitlementsComposerEntryNode setManageability:](v64, "setManageability:", objc_msgSend(v60, "recipientManageability"));
              -[PKPassEntitlementsComposerEntryNode setIntraAccountSharingEnabled:](v64, "setIntraAccountSharingEnabled:", objc_msgSend(v60, "intraAccountSharingEnabled"));
            }
            else
            {
              -[PKPassEntitlementsComposerEntryNode resetCapabilities](v64, "resetCapabilities");
            }
          }
          -[PKPassEntitlementsComposerEntryNode children](v11->_globalGroup, "children");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v64);

          -[NSMapTable setObject:forKey:](v11->_entitlementNodeForEntitlementEntry, "setObject:forKey:", v64, v59);
        }

      }
      v54 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    }
    while (v54);
  }

  v9 = v82;
  if (v90)
  {
    v68 = -[NSArray count](v11->_originalSharedEntitlements, "count");
    v69 = v11->_globalGroup;
    if (v68)
    {
      -[PKPassEntitlementsComposerEntryNode setShareability:](v69, "setShareability:", v85);
      -[PKPassEntitlementsComposerEntryNode setVisibility:](v11->_globalGroup, "setVisibility:", v86);
      -[PKPassEntitlementsComposerEntryNode setManageability:](v11->_globalGroup, "setManageability:", v87);
      -[PKPassEntitlementsComposerEntryNode setIntraAccountSharingEnabled:](v11->_globalGroup, "setIntraAccountSharingEnabled:", v81 == 1);
    }
    else
    {
      -[PKPassEntitlementsComposerEntryNode resetCapabilities](v69, "resetCapabilities");
    }
  }
  v70 = (void *)objc_msgSend(v91, "copy", v81);
  objc_msgSend(v70, "sortedArrayUsingComparator:", &__block_literal_global_255);
  v71 = objc_claimAutoreleasedReturnValue();
  entitlementEntries = v11->_entitlementEntries;
  v11->_entitlementEntries = (NSArray *)v71;

  objc_msgSend(v91, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_257);
  v73 = objc_claimAutoreleasedReturnValue();
  entitlementEntriesForEntitlementIdentifier = v11->_entitlementEntriesForEntitlementIdentifier;
  v11->_entitlementEntriesForEntitlementIdentifier = (NSDictionary *)v73;

  v11->_maxSelectionCount = objc_msgSend(v91, "count");
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v75 = v11->_allEntryNodes;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v96;
    do
    {
      for (k = 0; k != v77; ++k)
      {
        if (*(_QWORD *)v96 != v78)
          objc_enumerationMutation(v75);
        objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * k), "setEditable:", v11->_editable);
      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
    }
    while (v77);
  }

LABEL_88:
  return v11;
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entitlementIdentifier");
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayableEntitlement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayableEntitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __55__PKPassEntitlementsComposer__createEntitlementEntries__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)setPossiblePredefinedSharedEntitlementSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  PKPassEntitlementsComposerPredefinedEntryNode *v11;
  PKPassEntitlementsComposerPredefinedEntryNode *v12;
  NSDictionary *entitlementEntriesForEntitlementIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  NSDictionary *v28;
  void *v29;
  void *v30;
  PKPassEntitlementsComposerEntry *v31;
  void *v32;
  id *v33;
  void *v34;
  PKPassEntitlementsComposerPredefinedSelectionEntry *v35;
  id v36;
  id v37;
  PKPassEntitlementsComposer *v38;
  PKPassEntitlementsComposer *v39;
  PKPassEntitlementsComposer *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  PKPassEntitlementsComposerEntitlementEntryNode *v48;
  void *v49;
  PKPassEntitlementsComposerEntitlementEntryNode *v50;
  void *v51;
  uint64_t v52;
  NSArray *v53;
  NSArray *predefinedEntitlementEntries;
  NSArray *v55;
  NSMapTable *predefinedSelectionNodeForPredefinedEntry;
  id v57;
  id obj;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  PKPassEntitlementsComposer *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  PKPassEntitlementsComposer *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "pk_createStrongPointerPersonalityToStrongObjects");
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v4;
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    if (v63)
    {
      v62 = *(_QWORD *)v82;
      v72 = self;
      v59 = v5;
      v60 = v4;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v82 != v62)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v6);
          v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          objc_msgSend(v7, "sharedEntitlements");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
          if (v68)
          {
            v61 = v7;
            v66 = v8;
            v64 = v6;
            v70 = *(id *)v78;
            v9 = 0x1E0CB3000uLL;
LABEL_9:
            v10 = 0;
            while (1)
            {
              if (*(id *)v78 != v70)
                objc_enumerationMutation(v66);
              v11 = (PKPassEntitlementsComposerPredefinedEntryNode *)*(id *)(*((_QWORD *)&v77 + 1) + 8 * v10);
              v12 = v11;
              if (!self)
                break;
              entitlementEntriesForEntitlementIdentifier = self->_entitlementEntriesForEntitlementIdentifier;
              -[PKPassEntitlementsComposerPredefinedEntryNode entitlementIdentifier](v11, "entitlementIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](entitlementEntriesForEntitlementIdentifier, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "displayableEntitlement");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "entitlement");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                v41 = 0;
                v5 = v59;
                v8 = v66;
                goto LABEL_39;
              }
              objc_msgSend(v17, "shareability");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientShareability](v12, "recipientShareability"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v18, "containsObject:", v19))
              {
                objc_msgSend(v17, "visibility");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientVisibility](v12, "recipientVisibility"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "containsObject:", v21))
                {
                  objc_msgSend(v17, "manageability");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode recipientManageability](v12, "recipientManageability"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v65, "containsObject:", v22);

                }
                else
                {
                  v23 = 0;
                }

                self = v72;
              }
              else
              {
                v23 = 0;
              }

              objc_msgSend(v17, "timeConfiguration");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPassEntitlementsComposerEntryNode timeConfiguration](v12, "timeConfiguration");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = 1;
              if (v25 && v24)
              {
                objc_msgSend(v24, "intersect:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v27 != 0;

              }
              if ((v23 & v26) != 1)
              {
                v5 = v59;
                v4 = v60;
                v6 = v64;
                v8 = v66;
                goto LABEL_42;
              }
              v28 = self->_entitlementEntriesForEntitlementIdentifier;
              -[PKPassEntitlementsComposerPredefinedEntryNode entitlementIdentifier](v12, "entitlementIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = 0x1E0CB3000;
              if (!v30)
                goto LABEL_27;
              v31 = [PKPassEntitlementsComposerEntry alloc];
              objc_msgSend(v30, "displayableEntitlement");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[PKPassEntitlementsComposerEntry initWithDisplayableEntitlement:parentEntitlementComposer:]((id *)&v31->super.isa, v32, self);

              v34 = (void *)-[PKPassEntitlementsComposerPredefinedEntryNode copy](v12, "copy");
              objc_msgSend(v33, "setSharedEntitlement:", v34);

              objc_msgSend(v69, "addObject:", v33);
              if (v68 == ++v10)
              {
                v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
                if (v68)
                  goto LABEL_9;
LABEL_27:

                v35 = [PKPassEntitlementsComposerPredefinedSelectionEntry alloc];
                v36 = v61;
                v37 = v69;
                v38 = self;
                if (v35)
                {
                  v85.receiver = v35;
                  v85.super_class = (Class)PKPassEntitlementsComposerPredefinedSelectionEntry;
                  v39 = -[PKPassEntitlementsComposer init](&v85, sel_init);
                  v40 = v39;
                  if (v39)
                  {
                    objc_storeStrong((id *)&v39->_availableEntitlements, v61);
                    objc_storeStrong((id *)&v40->_entitlementEntriesForEntitlementIdentifier, v69);
                    objc_storeWeak((id *)&v40->_originalSharedEntitlements, v38);
                  }
                }
                else
                {
                  v40 = 0;
                }

                v67 = v40;
                objc_msgSend(v57, "addObject:", v40);
                v12 = -[PKPassEntitlementsComposerPredefinedEntryNode initWithPredefinedSelection:parentEntitlementComposer:]([PKPassEntitlementsComposerPredefinedEntryNode alloc], "initWithPredefinedSelection:parentEntitlementComposer:", v36, v38);
                -[PKPassEntitlementsComposerEntryNode setEditable:](v12, "setEditable:", self->_editable);
                -[PKPassEntitlementsComposerEntryNode children](v12, "children");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = 0u;
                v74 = 0u;
                v75 = 0u;
                v76 = 0u;
                v71 = v37;
                v42 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
                if (v42)
                {
                  v43 = v42;
                  v44 = *(_QWORD *)v74;
                  do
                  {
                    for (i = 0; i != v43; ++i)
                    {
                      if (*(_QWORD *)v74 != v44)
                        objc_enumerationMutation(v71);
                      v46 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                      objc_msgSend(v46, "sharedEntitlement");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = [PKPassEntitlementsComposerEntitlementEntryNode alloc];
                      objc_msgSend(v46, "displayableEntitlement");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = -[PKPassEntitlementsComposerEntitlementEntryNode initWithDisplayableEntitlement:sharedEntitlement:parentEntitlementComposer:](v48, "initWithDisplayableEntitlement:sharedEntitlement:parentEntitlementComposer:", v49, v47, v38);

                      -[PKPassEntitlementsComposerEntryNode setShareability:](v50, "setShareability:", objc_msgSend(v47, "recipientShareability"));
                      -[PKPassEntitlementsComposerEntryNode setVisibility:](v50, "setVisibility:", objc_msgSend(v47, "recipientVisibility"));
                      -[PKPassEntitlementsComposerEntryNode setManageability:](v50, "setManageability:", objc_msgSend(v47, "recipientManageability"));
                      -[PKPassEntitlementsComposerEntryNode setIntraAccountSharingEnabled:](v50, "setIntraAccountSharingEnabled:", objc_msgSend(v47, "intraAccountSharingEnabled"));
                      objc_msgSend(v47, "timeConfiguration");
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PKPassEntitlementsComposerEntryNode setTimeConfiguration:](v50, "setTimeConfiguration:", v51);

                      -[PKPassEntitlementsComposerEntryNode setParent:](v50, "setParent:", v12);
                      self = v72;
                      -[PKPassEntitlementsComposerEntryNode setEditable:](v50, "setEditable:", v72->_editable);
                      objc_msgSend(v41, "addObject:", v50);
                      -[NSMutableArray addObject:](v72->_allEntryNodes, "addObject:", v12);

                    }
                    v43 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
                  }
                  while (v43);
                }

                v5 = v59;
                v8 = v67;
                objc_msgSend(v59, "setObject:forKey:", v12, v67);
                -[NSMutableArray addObject:](self->_allEntryNodes, "addObject:", v12);
LABEL_39:

                v4 = v60;
                v6 = v64;
LABEL_40:

                goto LABEL_42;
              }
            }
            v5 = v59;
            v4 = v60;
            v6 = v64;
            v8 = v66;
            goto LABEL_40;
          }
LABEL_42:

          ++v6;
        }
        while (v6 != v63);
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
        v63 = v52;
      }
      while (v52);
    }

    if (objc_msgSend(v57, "count") && objc_msgSend(v5, "count"))
    {
      v53 = (NSArray *)objc_msgSend(v57, "copy");
      predefinedEntitlementEntries = self->_predefinedEntitlementEntries;
      self->_predefinedEntitlementEntries = v53;

      objc_storeStrong((id *)&self->_predefinedSelectionNodeForPredefinedEntry, v5);
    }

  }
  else
  {
    v55 = self->_predefinedEntitlementEntries;
    self->_predefinedEntitlementEntries = 0;

    predefinedSelectionNodeForPredefinedEntry = self->_predefinedSelectionNodeForPredefinedEntry;
    self->_predefinedSelectionNodeForPredefinedEntry = 0;

  }
}

- (id)addPredefinedSharedEntitlementSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *predefinedEntitlementEntries;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_predefinedEntitlementEntries)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    predefinedEntitlementEntries = self->_predefinedEntitlementEntries;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __70__PKPassEntitlementsComposer_addPredefinedSharedEntitlementSelection___block_invoke;
    v23[3] = &unk_1E2ADBD68;
    v24 = v6;
    v8 = v6;
    -[NSArray pk_arrayBySafelyApplyingBlock:](predefinedEntitlementEntries, "pk_arrayBySafelyApplyingBlock:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassEntitlementsComposer setPossiblePredefinedSharedEntitlementSelection:](self, "setPossiblePredefinedSharedEntitlementSelection:", v10);

  }
  else
  {
    v26[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassEntitlementsComposer setPossiblePredefinedSharedEntitlementSelection:](self, "setPossiblePredefinedSharedEntitlementSelection:", v11);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_predefinedEntitlementEntries;
  v13 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "predefinedSelection", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 == v5)
        {
          v13 = v16;
          goto LABEL_14;
        }
      }
      v13 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_14:

  return v13;
}

id __70__PKPassEntitlementsComposer_addPredefinedSharedEntitlementSelection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  char v10;
  id v11;

  objc_msgSend(a2, "predefinedSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 != v7)
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

    }
    else
    {
      v10 = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    v11 = v3;
    goto LABEL_12;
  }

LABEL_10:
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)setMaxSelectionCount:(unint64_t)a3
{
  self->_maxSelectionCount = a3;
}

- (BOOL)preferDetailedCapabilityDisplay
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = self->_originalSharedEntitlements;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "recipientShareability");
        if (v10 > v6)
          v6 = v10;
        if (v6 > 1 || objc_msgSend(v9, "recipientVisibility") == 2)
        {
LABEL_29:
          v20 = 1;
          goto LABEL_30;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v5)
        continue;
      break;
    }

    if (!v6)
      return 0;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = self->_availableEntitlements;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "entitlement", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "entitlementTemplate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v16;
          if (v17 == CFSTR("carKeyEntitlementTemplateV2"))
          {

            goto LABEL_29;
          }
          v18 = v17;
          if (CFSTR("carKeyEntitlementTemplateV2") && v17)
          {
            v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("carKeyEntitlementTemplateV2"));

            if ((v19 & 1) != 0)
              goto LABEL_29;
          }
          else
          {

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
          continue;
        break;
      }
    }
  }
  v20 = 0;
LABEL_30:

  return v20;
}

- (BOOL)canAllowResharing
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_allEntryNodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "editable", (_QWORD)v8))
        {
          if (objc_msgSend(v6, "possibleShareability"))
            goto LABEL_13;
        }
        else if (objc_msgSend(v6, "shareability"))
        {
LABEL_13:
          LOBYTE(v3) = 1;
          goto LABEL_14;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_14:

  return v3;
}

- (NSArray)entitlementEntries
{
  return self->_entitlementEntries;
}

- (NSArray)composeSharedEntitlements
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_allEntryNodes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "parent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v15[0] = v8;
          v15[1] = 3221225472;
          v15[2] = __55__PKPassEntitlementsComposer_composeSharedEntitlements__block_invoke;
          v15[3] = &unk_1E2ADBD90;
          v12 = v3;
          v16 = v12;
          objc_msgSend(v10, "enumerateEntitlementEntries:", v15);
          if (objc_msgSend(v12, "count"))
          {
            v13 = (void *)objc_msgSend(v12, "copy");

            goto LABEL_13;
          }

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_13:

  return (NSArray *)v13;
}

void __55__PKPassEntitlementsComposer_composeSharedEntitlements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "enabled"))
  {
    objc_msgSend(v6, "sharedEntitlement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    objc_msgSend(v4, "setRecipientShareability:", objc_msgSend(v6, "shareability"));
    objc_msgSend(v4, "setRecipientVisibility:", objc_msgSend(v6, "visibility"));
    objc_msgSend(v4, "setRecipientManageability:", objc_msgSend(v6, "manageability"));
    objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(v6, "intraAccountSharingEnabled"));
    objc_msgSend(v6, "timeConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeConfiguration:", v5);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

- (id)globalView
{
  return self->_globalGroup;
}

- (id)viewFor:(id)a3
{
  if (!a3)
    return 0;
  -[NSMapTable objectForKey:](self->_entitlementNodeForEntitlementEntry, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)viewForPredefined:(id)a3
{
  return -[NSMapTable objectForKey:](self->_predefinedSelectionNodeForPredefinedEntry, "objectForKey:", a3);
}

- (id)viewForEnabledEntitlements
{
  PKPassEntitlementsComposerEntryNode *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPassEntitlementsComposerEntryNode initWithIdentifier:parentEntitlementComposer:]([PKPassEntitlementsComposerEntryNode alloc], "initWithIdentifier:parentEntitlementComposer:", CFSTR("enabledEntitlements"), self);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable objectEnumerator](self->_entitlementNodeForEntitlementEntry, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "enabled"))
        {
          v10 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v10, "setParent:", v3);
          -[PKPassEntitlementsComposerEntryNode children](v3, "children");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v10);

          -[NSMutableArray addObject:](self->_allEntryNodes, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[NSMutableArray addObject:](self->_allEntryNodes, "addObject:", v3);
  return v3;
}

- (id)_allPossibleCapabilitySetsForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *predefinedCapabilitySets;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "allPossibleShareability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPossibleVisibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPossibleManageability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  predefinedCapabilitySets = self->_predefinedCapabilitySets;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PKPassEntitlementsComposer__allPossibleCapabilitySetsForView___block_invoke;
  v16[3] = &unk_1E2ADBDB8;
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  -[NSArray pk_objectsPassingTest:](predefinedCapabilitySets, "pk_objectsPassingTest:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v12;

  return v14;
}

uint64_t __64__PKPassEntitlementsComposer__allPossibleCapabilitySetsForView___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "shareability"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    v6 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "visibility"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v7))
    {
      v8 = (void *)a1[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "manageability"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)maxSelectionCount
{
  return self->_maxSelectionCount;
}

- (void)_rootEntryNodeDidSetEnabled:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_allEntryNodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 != v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "parent", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            objc_msgSend(v10, "setEnabled:notifyIfRoot:", 0, 0);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (NSArray)predefinedEntitlementEntries
{
  return self->_predefinedEntitlementEntries;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEntryNodes, 0);
  objc_storeStrong((id *)&self->_predefinedSelectionNodeForPredefinedEntry, 0);
  objc_storeStrong((id *)&self->_entitlementNodeForEntitlementEntry, 0);
  objc_storeStrong((id *)&self->_globalGroup, 0);
  objc_storeStrong((id *)&self->_predefinedCapabilitySets, 0);
  objc_storeStrong((id *)&self->_predefinedEntitlementEntries, 0);
  objc_storeStrong((id *)&self->_entitlementEntries, 0);
  objc_storeStrong((id *)&self->_entitlementEntriesForEntitlementIdentifier, 0);
  objc_storeStrong((id *)&self->_availableEntitlements, 0);
  objc_storeStrong((id *)&self->_originalSharedEntitlements, 0);
}

@end
