@implementation PLPropertyIndexMapping

- (PLPropertyIndexMapping)init
{
  void *v3;
  PLPropertyIndexMapping *v4;

  +[PLPersistentContainer managedObjectModel](PLPersistentContainer, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLPropertyIndexMapping initWithManagedObjectModel:](self, "initWithManagedObjectModel:", v3);

  return v4;
}

- (PLPropertyIndexMapping)initWithManagedObjectModel:(id)a3
{
  id v4;
  PLPropertyIndexMapping *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  PLPropertyIndexMapping *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  NSDictionary *indexesByAttributeNamesByEntityNames;
  NSDictionary *attributeNamesByIndexByEntityNames;
  NSDictionary *v23;
  NSDictionary *transientAttributeNamesByEntityNames;
  NSDictionary *v25;
  NSDictionary *indexesByRelationshipNamesByEntityNames;
  NSDictionary *v27;
  NSDictionary *relationshipNamesByIndexByEntityNames;
  NSDictionary *v29;
  NSDictionary *toManyRelationshipNamesByEntityNames;
  NSDictionary *v31;
  PLPropertyIndexMapping *v32;
  NSDictionary *v34;
  id v35;
  _QWORD v36[4];
  NSDictionary *v37;
  PLPropertyIndexMapping *v38;
  NSDictionary *v39;
  NSDictionary *v40;
  NSDictionary *v41;
  NSDictionary *v42;
  NSDictionary *v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PLPropertyIndexMapping;
  v5 = -[PLPropertyIndexMapping init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "entitiesByName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v35 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53__PLPropertyIndexMapping_initWithManagedObjectModel___block_invoke;
    v36[3] = &unk_1E366A468;
    v14 = v8;
    v37 = v14;
    v15 = v5;
    v38 = v15;
    v16 = v9;
    v39 = v16;
    v17 = v10;
    v40 = v17;
    v18 = v11;
    v41 = v18;
    v19 = v12;
    v42 = v19;
    v20 = v13;
    v43 = v20;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v36);
    indexesByAttributeNamesByEntityNames = v15->_indexesByAttributeNamesByEntityNames;
    v15->_indexesByAttributeNamesByEntityNames = v14;
    v34 = v14;

    attributeNamesByIndexByEntityNames = v15->_attributeNamesByIndexByEntityNames;
    v15->_attributeNamesByIndexByEntityNames = v16;
    v23 = v16;

    transientAttributeNamesByEntityNames = v15->_transientAttributeNamesByEntityNames;
    v15->_transientAttributeNamesByEntityNames = v17;
    v25 = v17;

    indexesByRelationshipNamesByEntityNames = v15->_indexesByRelationshipNamesByEntityNames;
    v15->_indexesByRelationshipNamesByEntityNames = v18;
    v27 = v18;

    relationshipNamesByIndexByEntityNames = v15->_relationshipNamesByIndexByEntityNames;
    v15->_relationshipNamesByIndexByEntityNames = v19;
    v29 = v19;

    toManyRelationshipNamesByEntityNames = v15->_toManyRelationshipNamesByEntityNames;
    v15->_toManyRelationshipNamesByEntityNames = v20;
    v31 = v20;

    v32 = v15;
    v4 = v35;

  }
  return v5;
}

- (id)_processEntityByName:(id)a3 obj:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(v5, "superentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  v9 = v7;
  if (v6)
  {
    v10 = v7;
    do
    {
      v9 = v6;

      objc_msgSend(v9, "superentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v9;
    }
    while (v6);
  }
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPropertyIndexMapping _processSubEntityByName:entity:withEntityData:](self, "_processSubEntityByName:entity:withEntityData:", v11, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("resultDictionary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_processSubEntityByName:(id)a3 entity:(id)a4 withEntityData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id obj;
  uint64_t v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  uint64_t *v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v68 = a4;
  v8 = a5;
  v50 = v8;
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("indexByAttr"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("attrByIndex"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("indexByRelation"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("relationByIndex"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("indexByAttrByEntity"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("attrByIndexByEntity"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("transientAttrByEntity"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("indexByRelationByEntity"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("relationByIndexByEntity"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("toManyRelationsByEntity"));

    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("resultDictionary"));
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("indexByAttr"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("attrByIndex"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("indexByRelation"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("relationByIndex"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("resultDictionary"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("indexByAttrByEntity"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("attrByIndexByEntity"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("transientAttrByEntity"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("indexByRelationByEntity"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("relationByIndexByEntity"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectForKey:", CFSTR("toManyRelationsByEntity"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "attributesByName");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v69, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v69, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke;
  v94[3] = &unk_1E3673C50;
  v60 = v22;
  v95 = v60;
  v62 = v21;
  v96 = v62;
  objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v94);
  objc_msgSend(v62, "sortedArrayUsingSelector:", sel_compare_);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v65;
  if ((unint64_t)objc_msgSend(v65, "count") >= 0x41)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v65;
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPropertyIndexMapping.m"), 203, CFSTR("%@ (%lu) has too many attributes to treat as a single bitfield"), v70, objc_msgSend(v65, "count"));

  }
  if (objc_msgSend(v24, "count"))
  {
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v93 = objc_msgSend(v64, "count");
    v86[0] = v23;
    v86[1] = 3221225472;
    v86[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_2;
    v86[3] = &unk_1E366C950;
    v25 = v64;
    v87 = v25;
    v89 = &v90;
    v26 = v56;
    v88 = v26;
    objc_msgSend(v65, "enumerateObjectsUsingBlock:", v86);
    objc_msgSend(v55, "setObject:forKey:", v25, v70);
    objc_msgSend(v54, "setObject:forKey:", v26, v70);

    _Block_object_dispose(&v90, 8);
  }
  v27 = (void *)objc_msgSend(v60, "copy");
  objc_msgSend(v61, "setObject:forKey:", v27, v70);

  objc_msgSend(v68, "relationshipsByName");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v66, "count"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83[0] = v23;
  v83[1] = 3221225472;
  v83[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_3;
  v83[3] = &unk_1E3674260;
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v84 = v57;
  v58 = v28;
  v85 = v58;
  objc_msgSend(v66, "enumerateKeysAndObjectsUsingBlock:", v83);
  v29 = (void *)objc_msgSend(v58, "copy");
  objc_msgSend(v59, "setObject:forKey:", v29, v70);

  objc_msgSend(v57, "sortedArrayUsingSelector:", sel_compare_);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v67, "count") >= 0x41)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPropertyIndexMapping.m"), 241, CFSTR("%@ (%lu) has too many relationships to treat as a single bitfield"), v70, objc_msgSend(v67, "count"));

  }
  if (objc_msgSend(v67, "count"))
  {
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v93 = objc_msgSend(v63, "count");
    v79[0] = v23;
    v79[1] = 3221225472;
    v79[2] = __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_4;
    v79[3] = &unk_1E366C950;
    v30 = v63;
    v80 = v30;
    v82 = &v90;
    v31 = v53;
    v81 = v31;
    objc_msgSend(v67, "enumerateObjectsUsingBlock:", v79);
    objc_msgSend(v52, "setObject:forKey:", v30, v70);
    objc_msgSend(v51, "setObject:forKey:", v31, v70);

    _Block_object_dispose(&v90, 8);
  }
  objc_msgSend(v68, "subentities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
  if (v32)
  {
    v73 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v76 != v73)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("indexByAttr"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "mutableCopy");
        objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("indexByAttr"));

        objc_msgSend(v9, "objectForKey:", CFSTR("attrByIndex"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v38, "mutableCopy");
        objc_msgSend(v35, "setObject:forKey:", v39, CFSTR("attrByIndex"));

        objc_msgSend(v9, "objectForKey:", CFSTR("indexByRelation"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "mutableCopy");
        objc_msgSend(v35, "setObject:forKey:", v41, CFSTR("indexByRelation"));

        objc_msgSend(v9, "objectForKey:", CFSTR("relationByIndex"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v42, "mutableCopy");
        objc_msgSend(v35, "setObject:forKey:", v43, CFSTR("relationByIndex"));

        objc_msgSend(v9, "objectForKey:", CFSTR("resultDictionary"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKey:", v44, CFSTR("resultDictionary"));

        objc_msgSend(v34, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[PLPropertyIndexMapping _processSubEntityByName:entity:withEntityData:](self, "_processSubEntityByName:entity:withEntityData:", v45, v34, v35);

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    }
    while (v32);
  }

  return v9;
}

- ($61A80719B04F7407D3E47539F1B23CAA)_indexValueForPropertyNames:(id)a3 entityName:(id)a4 indexesByPropertyNamesByEntityNames:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  $61A80719B04F7407D3E47539F1B23CAA v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12.var0 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "unsignedIntegerValue");
          v18 = v17;
          PLPropertyIndexSetValidateIndex(v17);
          v12.var0 |= 1 << v18;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  else
  {
    v12.var0 = 0;
  }

  return v12;
}

- (id)_propertyNamesForIndexValues:(id)a3 entity:(id)a4 propertyNamesByIndexByEntityNames:(id)a5
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a5, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3.var0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        PLPropertyIndexSetValidateIndex(v8);
        if (((a3.var0 >> v8) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v7, "addObject:", v10);

        }
        ++v8;
      }
      while (v8 < objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForAttributeNames:(id)a3 entity:(id)a4
{
  return ($61A80719B04F7407D3E47539F1B23CAA)-[PLPropertyIndexMapping _indexValueForPropertyNames:entityName:indexesByPropertyNamesByEntityNames:](self, "_indexValueForPropertyNames:entityName:indexesByPropertyNamesByEntityNames:", a3, a4, self->_indexesByAttributeNamesByEntityNames);
}

- (id)attributeNamesForIndexValues:(id)a3 entity:(id)a4
{
  return -[PLPropertyIndexMapping _propertyNamesForIndexValues:entity:propertyNamesByIndexByEntityNames:](self, "_propertyNamesForIndexValues:entity:propertyNamesByIndexByEntityNames:", a3.var0, a4, self->_attributeNamesByIndexByEntityNames);
}

- ($61A80719B04F7407D3E47539F1B23CAA)indexValueForRelationshipNames:(id)a3 entity:(id)a4
{
  return ($61A80719B04F7407D3E47539F1B23CAA)-[PLPropertyIndexMapping _indexValueForPropertyNames:entityName:indexesByPropertyNamesByEntityNames:](self, "_indexValueForPropertyNames:entityName:indexesByPropertyNamesByEntityNames:", a3, a4, self->_indexesByRelationshipNamesByEntityNames);
}

- (id)relationshipNamesForIndexValues:(id)a3 entity:(id)a4
{
  return -[PLPropertyIndexMapping _propertyNamesForIndexValues:entity:propertyNamesByIndexByEntityNames:](self, "_propertyNamesForIndexValues:entity:propertyNamesByIndexByEntityNames:", a3.var0, a4, self->_relationshipNamesByIndexByEntityNames);
}

- (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4
{
  NSDictionary *toManyRelationshipNamesByEntityNames;
  id v6;
  void *v7;

  toManyRelationshipNamesByEntityNames = self->_toManyRelationshipNamesByEntityNames;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](toManyRelationshipNamesByEntityNames, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(toManyRelationshipNamesByEntityNames) = objc_msgSend(v7, "intersectsSet:", v6);

  return (char)toManyRelationshipNamesByEntityNames;
}

- (BOOL)includesTransientAttributes:(id)a3 entity:(id)a4
{
  NSDictionary *transientAttributeNamesByEntityNames;
  id v6;
  void *v7;
  void *v8;

  transientAttributeNamesByEntityNames = self->_transientAttributeNamesByEntityNames;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](transientAttributeNamesByEntityNames, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "intersectsSet:", v8);
  return (char)v6;
}

- (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "allObjects");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_pl_map:", &__block_literal_global_42_43824);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPropertyIndexMapping recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:](self, "recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:", v13, v12, v11, v10);

}

- (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v10, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    v17 = objc_msgSend(v15, "unsignedLongLongValue");
  else
    v17 = 0;

  objc_msgSend(v12, "objectForKeyedSubscript:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "unsignedLongLongValue");
  else
    v20 = 0;

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__PLPropertyIndexMapping_recordChangedKeys_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke;
  v25[3] = &unk_1E366A4D8;
  v26 = v11;
  v27 = v10;
  v28 = v12;
  v21 = v12;
  v22 = v10;
  v23 = v11;
  -[PLPropertyIndexMapping updatedIndexesForChangedKeys:entityName:withAttributes:relationships:updateBlock:](self, "updatedIndexesForChangedKeys:entityName:withAttributes:relationships:updateBlock:", v13, v24, v17, v20, v25);

}

- (void)updatedIndexesForChangedKeys:(id)a3 entityName:(id)a4 withAttributes:(id)a5 relationships:(id)a6 updateBlock:(id)a7
{
  id v12;
  void (**v13)(id, unint64_t, unint64_t);
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = (void (**)(id, unint64_t, unint64_t))a7;
  v14 = -[PLPropertyIndexMapping indexValueForAttributeNames:entity:](self, "indexValueForAttributeNames:entity:", v19, v12) | a5.var0;
  v15 = -[PLPropertyIndexMapping indexValueForRelationshipNames:entity:](self, "indexValueForRelationshipNames:entity:", v19, v12) | a6.var0;
  if (v14 | v15
    || (-[NSDictionary objectForKeyedSubscript:](self->_transientAttributeNamesByEntityNames, "objectForKeyedSubscript:", v12), v16 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19), v17 = (void *)objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "intersectsSet:", v17), v17, v16, v18))
  {
    v13[2](v13, v14, v15);
  }

}

- (BOOL)dumpToDirectory:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "successWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_indexesByAttributeNamesByEntityNames, v6, CFSTR("indexesByAttributeNamesByEntityNames"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_attributeNamesByIndexByEntityNames, v6, CFSTR("attributeNamesByIndexByEntityNames"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_transientAttributeNamesByEntityNames, v6, CFSTR("transientAttributeNamesByEntityNames"));
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_indexesByRelationshipNamesByEntityNames, v6, CFSTR("indexesByRelationshipNamesByEntityNames"));
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_relationshipNamesByIndexByEntityNames, v6, CFSTR("relationshipNamesByIndexByEntityNames"));
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  if (objc_msgSend(v9, "isSuccess"))
  {
    -[PLPropertyIndexMapping _dumpDictionary:toDir:withName:](self, "_dumpDictionary:toDir:withName:", self->_toManyRelationshipNamesByEntityNames, v6, CFSTR("toManyRelationshipNamesByEntityNames"));
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  objc_msgSend(v9, "resultWithError:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 != 0;

  return v17;
}

- (id)_dumpDictionary:(id)a3 toDir:(id)a4 withName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "URLByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", CFSTR("txt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pl_prettyDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v12 = objc_msgSend(v11, "writeToURL:atomically:encoding:error:", v10, 0, 4, &v19);
  v13 = v19;
  if ((v12 & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "successWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to dump text for %@: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toManyRelationshipNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_transientAttributeNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_relationshipNamesByIndexByEntityNames, 0);
  objc_storeStrong((id *)&self->_indexesByRelationshipNamesByEntityNames, 0);
  objc_storeStrong((id *)&self->_attributeNamesByIndexByEntityNames, 0);
  objc_storeStrong((id *)&self->_indexesByAttributeNamesByEntityNames, 0);
}

void __93__PLPropertyIndexMapping_recordChangedKeys_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

}

uint64_t __99__PLPropertyIndexMapping_recordChangedProperties_forObjectID_inAttributesByOID_relationshipsByOID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isTransient"))
  {
    v6 = (id *)(a1 + 32);
LABEL_5:
    objc_msgSend(*v6, "addObject:", v10);
    goto LABEL_6;
  }
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.photos.photoKit.ignoreForUpdates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) == 0)
  {
    v6 = (id *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v9);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("com.apple.photos.photoKit.ignoreForUpdates"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  if (objc_msgSend(v5, "isToMany"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __72__PLPropertyIndexMapping__processSubEntityByName_entity_withEntityData___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v9);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

void __53__PLPropertyIndexMapping_initWithManagedObjectModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_processEntityByName:obj:", v21, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v7, "objectForKey:", CFSTR("indexByAttrByEntity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addEntriesFromDictionary:", v10);

      v11 = *(void **)(a1 + 48);
      objc_msgSend(v8, "objectForKey:", CFSTR("attrByIndexByEntity"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addEntriesFromDictionary:", v12);

      v13 = *(void **)(a1 + 56);
      objc_msgSend(v8, "objectForKey:", CFSTR("transientAttrByEntity"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v14);

      v15 = *(void **)(a1 + 64);
      objc_msgSend(v8, "objectForKey:", CFSTR("indexByRelationByEntity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v16);

      v17 = *(void **)(a1 + 72);
      objc_msgSend(v8, "objectForKey:", CFSTR("relationByIndexByEntity"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v18);

      v19 = *(void **)(a1 + 80);
      objc_msgSend(v8, "objectForKey:", CFSTR("toManyRelationsByEntity"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addEntriesFromDictionary:", v20);

    }
  }

}

+ (PLPropertyIndexMapping)defaultMapping
{
  pl_dispatch_once();
  return (PLPropertyIndexMapping *)(id)defaultMapping_pl_once_object_17;
}

+ (unint64_t)indexValueForAttributeNames:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;

  v5 = a4;
  v6 = a3;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexValueForAttributeNames:entity:", v6, v5);

  return v8;
}

+ (id)attributeNamesForIndexValues:(unint64_t)a3 entity:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeNamesForIndexValues:entity:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (unint64_t)indexValueForRelationshipNames:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;

  v5 = a4;
  v6 = a3;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexValueForRelationshipNames:entity:", v6, v5);

  return v8;
}

+ (id)relationshipNamesForIndexValues:(unint64_t)a3 entity:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relationshipNamesForIndexValues:entity:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)includesToManyRelationship:(id)a3 entity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "includesToManyRelationship:entity:", v6, v5);

  return v8;
}

+ (void)recordChangedKeys:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordChangedKeys:forObjectID:inAttributesByOID:relationshipsByOID:", v12, v11, v10, v9);

}

+ (void)recordChangedProperties:(id)a3 forObjectID:(id)a4 inAttributesByOID:(id)a5 relationshipsByOID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[PLPropertyIndexMapping defaultMapping](PLPropertyIndexMapping, "defaultMapping");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordChangedProperties:forObjectID:inAttributesByOID:relationshipsByOID:", v12, v11, v10, v9);

}

void __40__PLPropertyIndexMapping_defaultMapping__block_invoke()
{
  PLPropertyIndexMapping *v0;
  void *v1;

  v0 = objc_alloc_init(PLPropertyIndexMapping);
  v1 = (void *)defaultMapping_pl_once_object_17;
  defaultMapping_pl_once_object_17 = (uint64_t)v0;

}

@end
