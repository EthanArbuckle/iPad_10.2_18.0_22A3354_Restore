@implementation PGPeopleTitleUtility

+ (id)beautifiedLocationStringWithPersonNode:(id)a3 peopleAddressEdge:(id)a4 titleComponent:(id)a5 insertLineBreak:(BOOL)a6 allowFamilyHome:(BOOL)a7 serviceManager:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v36;
  void *v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[2];
  uint8_t buf[4];
  int v52;
  uint64_t v53;

  v9 = a7;
  v39 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v41 = a8;
  objc_msgSend(v14, "targetNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v13, "isMeNode");
  objc_msgSend(a1, "_placeDisplayNameForPeopleAddressNodeLabel:titleComponent:containsMe:", v17, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!(_DWORD)v18)
  {
    objc_msgSend(v14, "sourceNode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "graph");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    objc_msgSend(v40, "anyNode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __143__PGPeopleTitleUtility_beautifiedLocationStringWithPersonNode_peopleAddressEdge_titleComponent_insertLineBreak_allowFamilyHome_serviceManager___block_invoke;
    v42[3] = &unk_1E8434768;
    v38 = v22;
    v43 = v38;
    v25 = v17;
    v44 = v25;
    v45 = &v46;
    objc_msgSend(v24, "enumerateHomeOrWorkAddressNodesUsingBlock:", v42);

    if (*((_BYTE *)v47 + 24))
    {
      if (objc_msgSend(v25, "isEqualToString:", CFSTR("Home")))
        v26 = 1;
      else
        v26 = 2;
      objc_msgSend(v15, "setType:", v26);
      v21 = v20;
      goto LABEL_21;
    }
    if ((v9 & objc_msgSend(v25, "isEqualToString:", CFSTR("Home"))) == 1
      && objc_msgSend(v13, "isMemberOfMyFamily"))
    {
      objc_msgSend(v15, "setType:", 4);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PGPeoplePlaceTitleFormatFamilyHome"), CFSTR("PGPeoplePlaceTitleFormatFamilyHome"), CFSTR("Localizable"));
      v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
      _Block_object_dispose(&v46, 8);

      goto LABEL_22;
    }
    objc_msgSend(a1, "nameFromPersonNode:serviceManager:", v13, v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "length"))
    {
      if (objc_msgSend(v15, "type") == 3)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PGPeoplePlaceTitleFormatHomeWithPersonName %@"), CFSTR("PGPeoplePlaceTitleFormatHomeWithPersonName %@"), CFSTR("Localizable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringWithFormat:", v30, v28);
        v31 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setPersonName:", v28);
        if (v39)
        {
          v50[0] = v28;
          v50[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v31, v32);
          v21 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v31 = v31;
          v21 = v31;
        }
        goto LABEL_20;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "loggingConnection");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v36 = objc_msgSend(v15, "type");
        *(_DWORD *)buf = 67109120;
        v52 = v36;
        _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "Expected titleComponent.type to be PGLocationTitleComponentTypeOthersHome at this point, but it is type %d. Returning nil.", buf, 8u);
      }
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      v31 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "Could not find any person name for people", buf, 2u);
      }
    }
    v21 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v21 = v19;
LABEL_22:

  return v21;
}

+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 insertLineBreaks:(BOOL)a5 serviceManager:(id)a6
{
  return (id)objc_msgSend(a1, "nameStringForPersonNodes:includeMe:allowUnnamed:allowedGroupsFormat:insertLineBreaks:serviceManager:", a3, a4, 1, 7, a5, a6);
}

+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 allowUnnamed:(BOOL)a5 allowedGroupsFormat:(unint64_t)a6 insertLineBreaks:(BOOL)a7 serviceManager:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  char v35;
  int v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  int v64;
  BOOL v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _QWORD v74[3];

  v11 = a5;
  v74[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  if (objc_msgSend(v14, "count"))
  {
    v65 = a7;
    v66 = v11;
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v14, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "graph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "anyNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v16, "removeObject:", v20);
      if (!objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "addObject:", v20);
        a4 = 0;
      }
    }
    v21 = objc_msgSend(v16, "count");
    if (a6 != 1 && v21 >= 2)
    {
      objc_msgSend(a1, "peopleGroupNameForPersonNodes:allowedGroupsFormat:", v16, a6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        goto LABEL_52;
    }
    v68 = v20;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingDescriptors:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v28)
    {
      v29 = v28;
      v61 = a4;
      v58 = v16;
      v63 = v14;
      v30 = 0;
      v31 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v70 != v31)
            objc_enumerationMutation(v27);
          objc_msgSend(a1, "nameFromPersonNode:serviceManager:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i), v15);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            if (objc_msgSend(v33, "length"))
              objc_msgSend(v26, "addObject:", v34);
            else
              ++v30;
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v29);

      v14 = v63;
      if (v66)
      {
        a4 = v61;
        if (v30 == 1)
        {
          if (objc_msgSend(v26, "count"))
            v35 = 1;
          else
            v35 = v61;
          if ((v35 & 1) == 0)
          {
            objc_msgSend(v63, "anyObject");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "ageCategory");

            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v52;
            if (v51 == 1)
              v54 = CFSTR("PGPeopleTitleFormatGenericUnnamedChild");
            else
              v54 = CFSTR("PGPeopleTitleFormatGenericUnnamedPerson");
            objc_msgSend(v52, "localizedStringForKey:value:table:", v54, v54, CFSTR("Localizable"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v58;
            goto LABEL_50;
          }
          v30 = 1;
        }
      }
      else
      {
        a4 = v61;
      }
      v36 = a6 & 1;
      v16 = v58;
      if ((a6 & 1) != 0 && v30)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_50:
        v20 = v68;
        goto LABEL_51;
      }
    }
    else
    {

      v36 = a6 & 1;
    }
    v64 = v36;
    v20 = v68;
    v38 = !a4;
    if (!v68)
      v38 = 1;
    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatMePerson"), CFSTR("PGPeopleTitleFormatMePerson"), CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v40);

    }
    if (objc_msgSend(v26, "count") == 2)
    {
      objc_msgSend(v26, "firstObject");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastObject");
      v41 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@"), CFSTR("PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@"), CFSTR("Localizable"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v41;
      objc_msgSend(v59, "localizedStringWithFormat:", v43, v67, v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((unint64_t)objc_msgSend(v26, "count") < 3)
      {
        objc_msgSend(v26, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

LABEL_52:
        goto LABEL_53;
      }
      objc_msgSend(v26, "subarrayWithRange:", 0, objc_msgSend(v26, "count") - 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatMultiplePeopleWithConcatenatedPersonNames %@ lastPersonName %@"), CFSTR("PGPeopleTitleFormatMultiplePeopleWithConcatenatedPersonNames %@ lastPersonName %@"), CFSTR("Localizable"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatMultiplePeoplePersonNameConcatenator"), CFSTR("PGPeopleTitleFormatMultiplePeoplePersonNameConcatenator"), CFSTR("Localizable"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsJoinedByString:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringWithFormat:", v44, v46, v62);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v68;
    }
    if (v65)
    {
      +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v22, v26);
      v47 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v47;
    }

    if (v64 && (unint64_t)objc_msgSend(v22, "length") >= 0x17)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("Localizable"));
      v49 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v49;
    }
    goto LABEL_51;
  }
  v22 = 0;
LABEL_53:

  return v22;
}

+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4 fallbackToGeneric:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v5 = a5;
  objc_msgSend(a1, "peopleGroupNameForPersonNodes:allowedGroupsFormat:", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  PGGraphPersonNodeCollection *v8;
  void *v10;
  void *v11;
  void *v12;
  NSObject *p_super;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v33;
  void *v34;
  void *v35;
  PGGraphPersonNodeCollection *v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  id v45;
  uint8_t *v46;
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v37 = v4;
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "graph");
    v7 = objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      p_super = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, p_super, OS_LOG_TYPE_ERROR, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] Nil graph", buf, 2u);
      }
      v10 = 0;
      goto LABEL_51;
    }
    if ((v37 & 0xF) != 0 && objc_msgSend(v5, "count"))
    {
      v8 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", v5, v7);
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v35, "count"))
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "loggingConnection");
        v15 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] No me node found in graph, not using group name", buf, 2u);
        }
        v10 = 0;
        goto LABEL_49;
      }
      -[MAElementCollection collectionBySubtracting:](v8, "collectionBySubtracting:", v35);
      v36 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();

      if (-[MAElementCollection count](v36, "count") < 2 && (v37 & 1) == 0)
      {
        v10 = 0;
LABEL_50:

        p_super = &v36->super.super.super.super;
LABEL_51:

        goto LABEL_52;
      }
      +[PGGraphRelationshipEdge familyRelationshipLabels](PGGraphRelationshipEdge, "familyRelationshipLabels");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v48 = buf;
      v49 = 0x2020000000;
      v50 = 0;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __74__PGPeopleTitleUtility_peopleGroupNameForPersonNodes_allowedGroupsFormat___block_invoke;
      v42[3] = &unk_1E8434790;
      v43 = v35;
      v18 = v16;
      v44 = v18;
      v46 = buf;
      v19 = v17;
      v45 = v19;
      -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](v36, "enumerateIdentifiersAsCollectionsWithBlock:", v42);
      v33 = v18;
      v34 = v19;
      if (!*((_QWORD *)v48 + 3))
      {
        v10 = 0;
LABEL_48:

        _Block_object_dispose(buf, 8);
        v8 = v36;
        v15 = v33;
LABEL_49:

        v36 = v8;
        goto LABEL_50;
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v19;
      v21 = 0;
      v22 = 0;
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v39 != v24)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v27 = objc_msgSend(v20, "countForObject:", v26, v33, v34);
            if (v27 > v22)
            {
              v28 = v26;

              v21 = v28;
              v22 = v27;
            }
          }
          v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v23);
      }

      v29 = *((_QWORD *)v48 + 3);
      if (v29 != v22 && (v29 < 4 || ceilf((float)v29 * 0.75) > (float)v22))
        goto LABEL_43;
      if ((v37 & 2) != 0 && objc_msgSend(v21, "isEqualToString:", CFSTR("FAMILY")))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PGSocialGroupFormatTitleFamily"), CFSTR("PGSocialGroupFormatTitleFamily"), CFSTR("Localizable"));
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((v37 & 4) != 0 && objc_msgSend(v21, "isEqualToString:", CFSTR("PARTNER")))
        {
LABEL_45:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("PGPeopleTitleFormatGenericSocialGroup"), CFSTR("Localizable"));
          v31 = objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        }
        if ((v37 & 8) == 0 || !objc_msgSend(v21, "isEqualToString:", CFSTR("FRIEND")))
        {
LABEL_43:
          if ((v37 & 1) == 0)
          {
            v10 = 0;
LABEL_47:

            goto LABEL_48;
          }
          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PGSocialGroupFormatTitleFriends"), CFSTR("PGSocialGroupFormatTitleFriends"), CFSTR("Localizable"));
        v31 = objc_claimAutoreleasedReturnValue();
      }
LABEL_46:
      v10 = (void *)v31;

      goto LABEL_47;
    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] personNodes.count == 0", buf, 2u);
    }
  }
  v10 = 0;
LABEL_52:

  return v10;
}

+ (id)nameFromPersonNode:(id)a3 serviceManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__62958;
  v19 = __Block_byref_object_dispose__62959;
  v20 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__PGPeopleTitleUtility_nameFromPersonNode_serviceManager___block_invoke;
    v14[3] = &unk_1E84347B8;
    v14[4] = &v15;
    objc_msgSend(v6, "enumeratePersonsForIdentifiers:usingBlock:", v8, v14);

  }
  v9 = (void *)v16[5];
  if (!v9)
  {
    objc_msgSend(v5, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v16[5];
    v16[5] = v10;

    v9 = (void *)v16[5];
  }
  v12 = v9;
  _Block_object_dispose(&v15, 8);

  return v12;
}

+ (id)_placeDisplayNameForPeopleAddressNodeLabel:(id)a3 titleComponent:(id)a4 containsMe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Home")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGPeoplePlaceFormatHome"), CFSTR("PGPeoplePlaceFormatHome"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v11 = 1;
    else
      v11 = 3;
    v12 = v8;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Work")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PGPeoplePlaceFormatWork"), CFSTR("PGPeoplePlaceFormatWork"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v12 = v8;
      v11 = 2;
LABEL_9:
      objc_msgSend(v12, "setType:", v11);
    }
  }
  else
  {
    objc_msgSend(v7, "capitalizedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Could not find place name for edge with label %@. Falling back to edge label", (uint8_t *)&v17, 0xCu);
    }

  }
  return v10;
}

void __58__PGPeopleTitleUtility_nameFromPersonNode_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "nickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v12, "nickname");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v5;

    v9 = v12;
    goto LABEL_8;
  }
  objc_msgSend(v12, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "localizedShortName");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v12, "fullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = v12;
  if (v8)
  {
    objc_msgSend(v12, "fullName");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

}

void __74__PGPeopleTitleUtility_peopleGroupNameForPersonNodes_allowedGroupsFormat___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  +[PGGraphRelationshipEdge confirmedRelationshipFilter](PGGraphRelationshipEdge, "confirmedRelationshipFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesFromNodes:toNodes:matchingFilter:](PGGraphRelationshipEdgeCollection, "edgesFromNodes:toNodes:matchingFilter:", v5, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "labels", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(const __CFString **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v14))
          v15 = CFSTR("FAMILY");
        else
          v15 = v14;
        objc_msgSend(v8, "addObject:", v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v8, "count");
  v16 = *(void **)(a1 + 48);
  objc_msgSend(v8, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

}

void __143__PGPeopleTitleUtility_beautifiedLocationStringWithPersonNode_peopleAddressEdge_titleComponent_insertLineBreak_allowFamilyHome_serviceManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isSameNodeAsNode:", a2))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

    if ((_DWORD)v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

@end
