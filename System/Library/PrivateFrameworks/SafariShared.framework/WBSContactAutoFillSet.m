@implementation WBSContactAutoFillSet

- (WBSContactAutoFillSet)initWithControlIDToValueMap:(id)a3 label:(id)a4 fillDisplayProperties:(id)a5 skipDisplayProperties:(id)a6 propertiesToFillOrSkip:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSContactAutoFillSet *v17;
  uint64_t v18;
  NSDictionary *controlIDToValueMap;
  uint64_t v20;
  NSString *label;
  uint64_t v22;
  NSArray *fillDisplayProperties;
  uint64_t v24;
  NSArray *skipDisplayProperties;
  uint64_t v26;
  NSSet *propertiesToFillOrSkip;
  WBSContactAutoFillSet *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSContactAutoFillSet;
  v17 = -[WBSContactAutoFillSet init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    controlIDToValueMap = v17->_controlIDToValueMap;
    v17->_controlIDToValueMap = (NSDictionary *)v18;

    v20 = objc_msgSend(v13, "copy");
    label = v17->_label;
    v17->_label = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    fillDisplayProperties = v17->_fillDisplayProperties;
    v17->_fillDisplayProperties = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    skipDisplayProperties = v17->_skipDisplayProperties;
    v17->_skipDisplayProperties = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    propertiesToFillOrSkip = v17->_propertiesToFillOrSkip;
    v17->_propertiesToFillOrSkip = (NSSet *)v26;

    v28 = v17;
  }

  return v17;
}

+ (id)displayStringsForSkipMatches:(id)a3 matchesForForm:(id)a4 formDataController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v15), "property");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22), "property", (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", v23))
        {
          addressBookStringToBeDisplayed(0, v23, 0, v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  return v17;
}

+ (id)displayStringsForFillMatches:(id)a3 skipMatches:(id)a4 matchesForForm:(id)a5 label:(id)a6 formDataController:(id)a7
{
  id v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v40 = a4;
  v11 = a5;
  v46 = a6;
  v45 = a7;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v11;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v44)
  {
    v42 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v15 = v43;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v66, 16, v40);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v57;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v57 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
              if (objc_msgSend(v20, "isEqual:", v14))
              {
                objc_msgSend(v20, "property");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v21);
                if (+[WBSFormDataController isNameProperty:](WBSFormDataController, "isNameProperty:", v21))
                {

                  goto LABEL_18;
                }
                objc_msgSend(v20, "label");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                addressBookStringToBeDisplayed(v46, v21, v22, v45);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObject:", v23);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    }
    while (v44);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v24 = v40;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * k), "property", v40);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v26);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = obj;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v49;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * m);
        objc_msgSend(v35, "property", v40);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", v36) & 1) == 0
          && !+[WBSFormDataController isNameProperty:](WBSFormDataController, "isNameProperty:", v36))
        {
          objc_msgSend(v35, "label");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          addressBookStringToBeDisplayed(v46, v36, v37, v45);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v38);

          objc_msgSend(v12, "addObject:", v36);
        }

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    }
    while (v32);
  }

  return v47;
}

- (NSDictionary)controlIDToValueMap
{
  return self->_controlIDToValueMap;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)fillDisplayProperties
{
  return self->_fillDisplayProperties;
}

- (NSArray)skipDisplayProperties
{
  return self->_skipDisplayProperties;
}

- (NSSet)propertiesToFillOrSkip
{
  return self->_propertiesToFillOrSkip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToFillOrSkip, 0);
  objc_storeStrong((id *)&self->_skipDisplayProperties, 0);
  objc_storeStrong((id *)&self->_fillDisplayProperties, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_controlIDToValueMap, 0);
}

@end
