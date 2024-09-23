@implementation PLSearchEntity

- (id)_insertRelationEdgeForPerson:(id)a3 relationType:(signed __int16)a4 confidence:(double)a5
{
  int v6;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchEntity.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1)
  {
    v12 = 1102;
  }
  else if (v6 == 2)
  {
    v12 = 1103;
  }
  else
  {
    v12 = 1101;
  }
  +[PLSearchEntity _labelWithCode:inContext:](PLSearchEntity, "_labelWithCode:inContext:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge insertGraphEdgeInContext:withPrimaryLabel:](PLGraphEdge, "insertGraphEdgeInContext:withPrimaryLabel:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceNode:", v15);

  objc_msgSend(v14, "setTargetPerson:", v9);
  objc_msgSend(v14, "edgeValueWithName:createIfMissing:", CFSTR("RelationType"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIntValue:", v6);
  objc_msgSend(v14, "addEdgeValue:", v16);
  objc_msgSend(v14, "edgeValueWithName:createIfMissing:", CFSTR("RelationTypeConfidence"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFloatValue:", a5);
  objc_msgSend(v14, "addEdgeValue:", v17);
  if (v6 == 1)
    objc_msgSend(v9, "setMeConfidence:", a5);
  -[PLSearchEntity _updateChangeFlagForRelations](self, "_updateChangeFlagForRelations");

  return v14;
}

- (BOOL)_matchesLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  char v15;
  id v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  -[PLSearchEntity label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    -[PLSearchEntity identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_8;
  }
  if (-[PLSearchEntity type](self, "type") == a4)
  {
    -[PLSearchEntity label](self, "label");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 == v8)
    {

    }
    else
    {
      v14 = objc_msgSend(v12, "isEqualToString:", v8);

      if (!v14)
      {
        v15 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    -[PLSearchEntity identifier](self, "identifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 == v9)
      v15 = 1;
    else
      v15 = objc_msgSend(v16, "isEqualToString:", v9);

    goto LABEL_14;
  }
LABEL_8:
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)_predicateForSearchEntityEdgeToMoment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[PLSearchEntity _predicateForSearchEntityEdgesToMoment:](PLSearchEntity, "_predicateForSearchEntityEdgesToMoment:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_insertMomentEdgeForMoment:(id)a3 confidence:(double)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchEntity.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moment"));

  }
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _labelWithCode:inContext:](PLSearchEntity, "_labelWithCode:inContext:", 1100, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge insertGraphEdgeInContext:withPrimaryLabel:](PLGraphEdge, "insertGraphEdgeInContext:withPrimaryLabel:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceNode:", v18);

  objc_msgSend(v17, "setTargetMoment:", v11);
  +[PLSearchEntity _setConfidence:onEdge:](PLSearchEntity, "_setConfidence:onEdge:", v17, a4);
  +[PLSearchEntity _setDateIntervalStart:end:onEdge:](PLSearchEntity, "_setDateIntervalStart:end:onEdge:", v12, v13, v17);
  -[PLSearchEntity _updateChangeFlagForMoments](self, "_updateChangeFlagForMoments");

  return v17;
}

- (NSString)label
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("searchEntityLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("searchEntityLabel"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStringValue:", v4);
  -[PLSearchEntity _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (NSString)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("searchEntityIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("searchEntityIdentifier"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStringValue:", v4);
  -[PLSearchEntity _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (unint64_t)type
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("searchEntityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "intValue");
  return v4;
}

- (void)setType:(unint64_t)a3
{
  void *v5;
  id v6;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("searchEntityType"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntValue:", a3);
  -[PLSearchEntity _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");

}

- (double)rankingScore
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("rankingScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setRankingScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 0.0)
  {
    objc_msgSend(v5, "nodeValueWithName:", CFSTR("rankingScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeNodeValue:", v7);

      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteObject:", v7);

    }
  }
  else
  {
    objc_msgSend(v5, "nodeValueWithName:createIfMissing:", CFSTR("rankingScore"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "floatValue");
    if (v11 != a3)
      objc_msgSend(v7, "setFloatValue:", a3);
  }

  -[PLSearchEntity _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");
}

- (NSArray)synonyms
{
  void *v3;
  void *v4;
  void *v5;

  -[PLSearchEntity synonymsString](self, "synonymsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLSearchEntity synonymsString](self, "synonymsString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchEntity synonymsFromSynonymsString:](PLSearchEntity, "synonymsFromSynonymsString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)setSynonyms:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    +[PLSearchEntity synonymsStringFromSynonyms:](PLSearchEntity, "synonymsStringFromSynonyms:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[PLSearchEntity synonymsString](self, "synonymsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
    -[PLSearchEntity setSynonymsString:](self, "setSynonymsString:", v4);

}

- (NSString)synonymsString
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nodeValueWithName:", CFSTR("synonymsString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setSynonymsString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "nodeValueWithName:createIfMissing:", CFSTR("synonymsString"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setStringValue:", v9);
  }
  else
  {
    objc_msgSend(v4, "nodeValueWithName:", CFSTR("synonymsString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeNodeValue:", v5);

      -[PLGraphNodeContainer sourceNode](self, "sourceNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "managedObjectContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteObject:", v5);

    }
  }

  -[PLSearchEntity _updateChangeFlagForProperties](self, "_updateChangeFlagForProperties");
}

- (id)_fetchSearchEntityEdgeToMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  PLSearchEntity *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLSearchEntity _predicateForSearchEntityEdgeToMoment:](self, "_predicateForSearchEntityEdgeToMoment:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(v4, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v7, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (!v10)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moment (%@) (%@)", buf, 0x20u);
    }

  }
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)confidenceForMoment:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PLSearchEntity _fetchSearchEntityEdgeToMoment:](self, "_fetchSearchEntityEdgeToMoment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "edgeValueWithName:", CFSTR("Confidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (id)dateIntervalForMoment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PLSearchEntity _fetchSearchEntityEdgeToMoment:](self, "_fetchSearchEntityEdgeToMoment:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "edgeValueWithName:", CFSTR("DateIntervalStart"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "edgeValueWithName:", CFSTR("DateIntervalEnd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (v6 && v8)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchAllMomentsWithError:(id *)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v25;
  uint8_t buf[4];
  PLSearchEntity *v27;
  __int16 v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIncludesPendingChanges:", 0);
  v10 = (void *)MEMORY[0x1E0CB3528];
  v11 = (void *)MEMORY[0x1E0CB3880];
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("targetMoment"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v17);

  v30 = CFSTR("targetMoment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v18);

  v25 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v9, &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v25;
  if (v19)
  {
    objc_msgSend(v19, "_pl_map:", &__block_literal_global_83372);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moments (%@)", buf, 0x16u);
    }

    v21 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v20);
  }

  return v21;
}

- (id)encodedIdentifierString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLSearchEntity type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  -[PLSearchEntity label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("label"));

  -[PLSearchEntity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);

  return v8;
}

- (void)_updateChangeFlagForProperties
{
  id v2;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChangeFlag0:", objc_msgSend(v2, "changeFlag0") + 1);

}

- (void)_updateChangeFlagForMoments
{
  id v2;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChangeFlag1:", objc_msgSend(v2, "changeFlag1") + 1);

}

- (void)_updateChangeFlagForRelations
{
  id v2;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChangeFlag2:", objc_msgSend(v2, "changeFlag2") + 1);

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchEntity label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLSearchEntity type](self, "type");
  -[PLSearchEntity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchEntity rankingScore](self, "rankingScore");
  v8 = v7;
  -[PLSearchEntity synonymsString](self, "synonymsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nlabel: %@\ntype: %llu\nidentifier: %@\nrankingScore: %g\nsynonyms: %@"), v4, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)descriptionForMoment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLSearchEntity label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLSearchEntity type](self, "type");
  -[PLSearchEntity confidenceForMoment:](self, "confidenceForMoment:", v5);
  v9 = v8;

  -[PLSearchEntity identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchEntity rankingScore](self, "rankingScore");
  v12 = v11;
  -[PLSearchEntity synonymsString](self, "synonymsString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\nlabel: %@\ntype: %lld\nconfidence: %g\nidentifier: %@\nrankingScore: %g\nsynonyms: %@"), v6, v7, v9, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[PLSearchEntity label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PLSearchEntity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  v7 = v6 + -[PLSearchEntity type](self, "type");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PLSearchEntity *v4;
  void *v5;
  PLSearchEntity *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;

  v4 = (PLSearchEntity *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    v5 = (void *)objc_opt_class();
    if (objc_msgSend(v5, "isEqual:", objc_opt_class()))
    {
      v6 = v4;
      -[PLSearchEntity label](self, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchEntity label](v6, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v9)
        goto LABEL_12;
      -[PLSearchEntity identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchEntity identifier](v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (!v12)
        goto LABEL_12;
      v13 = -[PLSearchEntity type](self, "type");
      if (v13 != -[PLSearchEntity type](v6, "type"))
        goto LABEL_12;
      -[PLSearchEntity rankingScore](self, "rankingScore");
      v15 = v14;
      -[PLSearchEntity rankingScore](v6, "rankingScore");
      if (vabdd_f64(v15, v16) > 0.00000011920929)
        goto LABEL_12;
      -[PLSearchEntity synonymsString](self, "synonymsString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchEntity synonymsString](v6, "synonymsString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 != 0;

      if ((v17 == 0) != v19)
      {
        -[PLSearchEntity synonymsString](self, "synonymsString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[PLSearchEntity synonymsString](self, "synonymsString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchEntity synonymsString](v6, "synonymsString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

        }
        else
        {
          v23 = 1;
        }
      }
      else
      {
LABEL_12:
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

uint64_t __43__PLSearchEntity_fetchAllMomentsWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "targetMoment");
}

+ (void)_removeAllEdgesWithPredicate:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v7);
  v29 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  if (!v12)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = a1;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch relation edges for node %@ (%@)", buf, 0x16u);
    }

  }
  v24 = v13;
  objc_msgSend(a1, "_labelWithCode:inContext:", 1102, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v21, "hasLabel:", v15))
        {
          objc_msgSend(v21, "targetPerson");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setMeConfidence:", 0.0);

        }
        objc_msgSend(v8, "deleteObject:", v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

}

+ (void)_collectLabels:(id *)a3 identifiers:(id *)a4 types:(id *)a5 fromDictionaries:(id)a6
{
  id v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  id *v25;
  id *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v26 = a3;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outIdentifiers"));

    if (a5)
      goto LABEL_4;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outLabels"));

  if (!a4)
    goto LABEL_19;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outTypes"));

LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  *v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = a4;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = a5;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("label"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(*v26, "addObject:", v18);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("identifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(*v25, "addObject:", v19);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("type"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(*v12, "addObject:", v20);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

}

+ (void)_nodeValuesByNode:(id)a3 into:(id)a4
{
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "node");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v12, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "intValue"));
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v4;
        }
        objc_msgSend(v12, "valueName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

        if (!v16)
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

+ (id)_groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:(id)a3 byNodeOIDFromValuesByNodeOID:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  int v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  v29 = v5;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v32)
  {
    v7 = CFSTR("label");
    v8 = CFSTR("searchEntityLabel");
    v30 = *(_QWORD *)v45;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obj);
        v33 = v9;
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v11 = v31;
        v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (!v38)
          goto LABEL_27;
        v37 = *(_QWORD *)v41;
        v34 = v11;
        while (2)
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(v11);
            v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v7);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v8);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (v15 == v16)
            {

            }
            else
            {
              v17 = objc_msgSend(v15, "isEqualToString:", v16);

              if (!v17)
                goto LABEL_18;
            }
            v35 = v13;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v39 = v14;
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("searchEntityIdentifier"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (v18 == v19)
            {

            }
            else
            {
              v20 = objc_msgSend(v18, "isEqualToString:", v19);

              if (!v20)
              {

                v14 = v39;
LABEL_18:

                goto LABEL_22;
              }
            }
            v21 = v8;
            v22 = v7;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("searchEntityType"));
            v24 = objc_claimAutoreleasedReturnValue();
            if (v23 == (void *)v24)
            {

              v7 = v22;
              v8 = v21;
              v11 = v34;
              v14 = v39;
LABEL_26:
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v10, v35);
              objc_msgSend(v29, "removeObject:", v10);

              goto LABEL_27;
            }
            v25 = (void *)v24;
            v36 = objc_msgSend(v23, "isEqual:", v24);

            v7 = v22;
            v8 = v21;
            v11 = v34;
            v14 = v39;
            if ((v36 & 1) != 0)
              goto LABEL_26;
LABEL_22:

          }
          v38 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v38)
            continue;
          break;
        }
LABEL_27:

        v9 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v32);
  }

  return v28;
}

+ (id)_fetchGraphNodesForOIDs:(id)a3 inContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  v16 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v9, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch graph nodes for context %@ (ERROR: %@)", buf, 0x16u);
    }

  }
  return v11;
}

+ (void)_findMatchingNodes:(id *)a3 andSearchEntityDictionariesByOID:(id *)a4 inSearchEntityDictionaries:(id)a5 inContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a6;
  v25 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outMatchingNodes"));

  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outMatchingSearchEntityDictionariesByOID"));

  }
  v27 = 0;
  v28 = 0;
  v26 = 0;
  +[PLSearchEntity _collectLabels:identifiers:types:fromDictionaries:](PLSearchEntity, "_collectLabels:identifiers:types:fromDictionaries:", &v28, &v27, &v26, v11);
  v24 = v28;
  v13 = v27;
  v14 = v26;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNodeValue fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:](PLGraphNodeValue, "fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:", CFSTR("searchEntityLabel"), v24, CFSTR("stringValue"), v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _nodeValuesByNode:into:](PLSearchEntity, "_nodeValuesByNode:into:", v16, v15);
  +[PLGraphNodeValue fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:](PLGraphNodeValue, "fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:", CFSTR("searchEntityIdentifier"), v13, CFSTR("stringValue"), v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _nodeValuesByNode:into:](PLSearchEntity, "_nodeValuesByNode:into:", v17, v15);
  +[PLGraphNodeValue fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:](PLGraphNodeValue, "fetchGraphNodeValuesWithName:andValues:forValueType:inContext:prefetchNode:", CFSTR("searchEntityType"), v14, CFSTR("intValue"), v12, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _nodeValuesByNode:into:](PLSearchEntity, "_nodeValuesByNode:into:", v18, v15);
  +[PLSearchEntity _groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:byNodeOIDFromValuesByNodeOID:](PLSearchEntity, "_groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:byNodeOIDFromValuesByNodeOID:", v11, v15);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v19;
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _fetchGraphNodesForOIDs:inContext:](PLSearchEntity, "_fetchGraphNodesForOIDs:inContext:", v20, v12);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  *v25 = v21;
}

+ (id)_predicateForSearchEntityEdgesToMoment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("targetMoment"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)_removeAllSearchEntityEdgesFromMoment:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[PLSearchEntity _predicateForSearchEntityEdgesToMoment:](PLSearchEntity, "_predicateForSearchEntityEdgesToMoment:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _removeAllEdgesWithPredicate:inContext:](PLSearchEntity, "_removeAllEdgesWithPredicate:inContext:", v5, v4);
}

+ (void)_disconnectNodes:(id)a3 fromMoment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  double v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  const __CFString *v81;
  _QWORD v82[5];

  v82[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v52 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sourceNode"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v17);

  v81 = CFSTR("sourceNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v18);

  v71 = 0;
  v58 = v7;
  v51 = v12;
  objc_msgSend(v7, "executeFetchRequest:error:", v12, &v71);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v71;
  v21 = v20;
  if (v19)
  {
    v48 = v20;
    v50 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v49 = v19;
    v23 = v19;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v68 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v28, "sourceNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, v30);
          }
          objc_msgSend(v31, "addObject:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v25);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v32 = v22;
    v55 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v55)
    {
      v53 = *(_QWORD *)v64;
      v54 = v32;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v64 != v53)
            objc_enumerationMutation(v32);
          v57 = v33;
          -[NSObject objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v33));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v60 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                objc_msgSend(v39, "targetMoment");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v41, "isEqual:", v42);

                if (v43)
                {
                  objc_msgSend(v58, "deleteObject:", v39);
                  if (objc_msgSend(v34, "count") == 1)
                  {
                    objc_msgSend(v39, "sourceNode");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v44);

                    objc_msgSend(v45, "rankingScore");
                    if (v46 == 0.0)
                    {
                      objc_msgSend(v39, "sourceNode");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "deleteObject:", v47);

                    }
                  }
                }
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            }
            while (v36);
          }

          v33 = v57 + 1;
          v32 = v54;
        }
        while (v57 + 1 != v55);
        v55 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v55);
    }

    v19 = v49;
    v5 = v50;
    v21 = v48;
  }
  else
  {
    PLBackendGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v76 = a1;
      v77 = 2112;
      v78 = v6;
      v79 = 2112;
      v80 = v21;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moment (%@) (%@)", buf, 0x20u);
    }
  }

}

+ (id)_fetchSearchEntityNodesForMoment:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
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
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = CFSTR("sourceNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v9);

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("targetMoment"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  v26 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) = %@"), CFSTR("primaryLabel"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v14);

  v28 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v8, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  if (v15)
  {
    objc_msgSend(v15, "valueForKey:", CFSTR("sourceNode"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphNode entityName](PLGraphNode, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fetchRequestWithEntityName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = CFSTR("values");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRelationshipKeyPathsForPrefetching:", v21);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPredicate:", v22);

    v27 = v16;
    objc_msgSend(v4, "executeFetchRequest:error:", v20, &v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;

    v16 = v24;
    v8 = v20;
  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v3;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch edges to moment %@ (%@)", buf, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)_fetchEdgesForNodes:(id)a3 toMoment:(id)a4
{
  id v5;
  id v6;
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
  id v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("targetMoment"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sourceNode"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v17);

  objc_msgSend(v5, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(v18, "executeFetchRequest:error:", v11, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;

  if (!v19)
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find nodes delete or un-rank (%@)", buf, 0xCu);
    }

  }
  return v19;
}

+ (void)_setConfidence:(double)a3 onEdge:(id)a4
{
  double v5;
  id v6;

  objc_msgSend(a4, "edgeValueWithName:createIfMissing:", CFSTR("Confidence"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  if (v5 != a3)
    objc_msgSend(v6, "setFloatValue:", a3);

}

+ (void)_setDateIntervalStart:(id)a3 end:(id)a4 onEdge:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "edgeValueWithName:createIfMissing:", CFSTR("DateIntervalStart"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "edgeValueWithName:createIfMissing:", CFSTR("DateIntervalEnd"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToDate:", v15);

  if ((v12 & 1) == 0)
    objc_msgSend(v9, "setDateValue:", v15);
  objc_msgSend(v10, "dateValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToDate:", v7);

  if ((v14 & 1) == 0)
    objc_msgSend(v10, "setDateValue:", v7);

}

+ (void)_cleanUpStaleSearchRankingsNotIn:(id)a3 inLibrary:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
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
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  id v67;
  _BYTE v68[128];
  _BYTE v69[128];
  const __CFString *v70;
  uint8_t buf[4];
  id v72;
  _QWORD v73[6];

  v73[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v56 = a4;
  objc_msgSend(v56, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  v55 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT self IN %@"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K.%K = %@"), CFSTR("values"), CFSTR("valueName"), CFSTR("rankingScore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v16);

  objc_msgSend(v10, "setResultType:", 1);
  objc_msgSend(v10, "setFetchBatchSize:", 100);
  v67 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v67);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v67;
  if (!v17)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find nodes delete or un-rank (%@)", buf, 0xCu);
    }

  }
  if (objc_msgSend(v17, "count"))
  {
    v20 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphEdge entityName](PLGraphEdge, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchRequestWithEntityName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("sourceNode"), v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPredicate:", v23);

    v70 = CFSTR("sourceNode");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRelationshipKeyPathsForPrefetching:", v24);

    objc_msgSend(v22, "setFetchBatchSize:", 100);
    v66 = v18;
    objc_msgSend(v6, "executeFetchRequest:error:", v22, &v66);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v66;

    if (v25)
    {
      v50 = v26;
      v51 = v22;
      v53 = v5;
      v54 = v17;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v27 = objc_claimAutoreleasedReturnValue();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v52 = v25;
      v28 = v25;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v63;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v63 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v32);
            v34 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v33, "sourceNode");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v35);
            objc_msgSend(v36, "setRankingScore:", 0.0);
            objc_msgSend(v35, "objectID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v27, "addObject:", v37);

            objc_autoreleasePoolPop(v34);
            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        }
        while (v30);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v54);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "minusSet:", v27);
      v39 = (void *)MEMORY[0x1E0C97B48];
      +[PLGraphNode entityName](PLGraphNode, "entityName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "fetchRequestWithEntityName:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPredicate:", v42);

      objc_msgSend(v41, "setFetchBatchSize:", 100);
      v61 = v50;
      objc_msgSend(v6, "executeFetchRequest:error:", v41, &v61);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v61;

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v45 = v43;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v58;
        do
        {
          v49 = 0;
          do
          {
            if (*(_QWORD *)v58 != v48)
              objc_enumerationMutation(v45);
            objc_msgSend(v6, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v49++));
          }
          while (v47 != v49);
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        }
        while (v47);
      }

      v26 = v44;
      v22 = v41;
      v5 = v53;
      v17 = v54;
      v25 = v52;
    }
    else
    {
      PLBackendGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v26;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find edges to nodes un-rank (%@)", buf, 0xCu);
      }
    }

    v18 = v26;
    v10 = v22;
  }

}

+ (id)_personRelationLabelIDsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1101, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1102, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1103, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_removeAllPersonRelationEdgesFromNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "_personRelationLabelIDsInContext:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("primaryLabel"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLSearchEntity _removeAllEdgesWithPredicate:inContext:](PLSearchEntity, "_removeAllEdgesWithPredicate:inContext:", v12, v5);
}

+ (void)_removeMeRelationFromPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  id v20;
  uint8_t buf[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setMeConfidence:", 0.0);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1102, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v23[0] = CFSTR("sourceNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  objc_msgSend(v9, "setFetchLimit:", 1);
  v20 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v9, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject sourceNode](v14, "sourceNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "edgesOut");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "count") != 1)
      {
        objc_msgSend(v5, "deleteObject:", v14);
        goto LABEL_12;
      }
      v18 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v15);
      -[NSObject rankingScore](v18, "rankingScore");
      if (v19 == 0.0)
        objc_msgSend(v5, "deleteObject:", v15);
    }
    else
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Fetch for graph edge failed: %@", buf, 0xCu);
      }
    }

LABEL_12:
    goto LABEL_13;
  }
  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Fetch for graph edage failed: %@", buf, 0xCu);
  }
LABEL_13:

}

+ (id)_fetchMeOrSelfEdgeForPerson:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1102, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelIDWithCode:inContext:", 1103, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  v12 = (void *)MEMORY[0x1E0CB3880];
  v32[0] = v6;
  v32[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("primaryLabel"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) = %@"), CFSTR("targetPerson"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v17);

  v31 = CFSTR("sourceNode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v18);

  v24 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v10, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v24;
  if (v19)
  {
    objc_msgSend(v19, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v4;
      v27 = 2112;
      v28 = v5;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to fetch me/self graph edge for person %@ in context %@ (%@)", buf, 0x20u);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)_fetchMeOrSelfSearchEntityForPerson:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[PLSearchEntity _fetchMeOrSelfEdgeForPerson:](PLSearchEntity, "_fetchMeOrSelfEdgeForPerson:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)_fetchEdgesForPersonRelationsOnPerson:(id)a3
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _fetchMeOrSelfEdgeForPerson:](PLSearchEntity, "_fetchMeOrSelfEdgeForPerson:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphEdge entityName](PLGraphEdge, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3528];
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v5, "sourceNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v13 = (void *)MEMORY[0x1E0CB3880];
    +[PLSearchEntity _personRelationLabelIDsInContext:](PLSearchEntity, "_personRelationLabelIDsInContext:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("primaryLabel"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v17);

    v28[0] = CFSTR("targetPerson");
    v28[1] = CFSTR("values");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v18);

    v23 = 0;
    objc_msgSend(v4, "executeFetchRequest:error:", v8, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    if (!v19)
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v3;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Fetch for person relation edges failed for person %@, (%@)", buf, 0x16u);
      }

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("label"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (!v11)
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v23) = 0;
      v19 = "Attempting to set an unknown type";
      v20 = v18;
      v21 = 2;
LABEL_8:
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v23, v21);
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  if (!(v8 | v9))
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v23 = 134218240;
      v24 = 0;
      v25 = 2048;
      v26 = 0;
      v19 = "Attempting to set nil label (%p) or identifier (%p)";
      v20 = v18;
      v21 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v12 = (void *)objc_msgSend(a1, "newNodeContainerWithManagedObjectContext:", v6);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v14);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setType:", objc_msgSend(v15, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rankingScore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v12, "setRankingScore:");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("synonyms"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSynonyms:", v17);

LABEL_10:
  return v12;
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  +[PLSearchEntity _labelWithCode:inContext:](PLSearchEntity, "_labelWithCode:inContext:", 1100, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode insertGraphNodeInContext:withPrimaryLabel:](PLGraphNode, "insertGraphNodeInContext:withPrimaryLabel:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  v7 = (void *)objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "initWithNode:", v6);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUuid:", v9);

  return v7;
}

+ (void)willSaveWithNode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "isDeleted") & 1) == 0)
  {
    v4 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v15);
    if (objc_msgSend(v4, "type"))
    {
      objc_msgSend(v4, "label");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {

LABEL_7:
        if (objc_msgSend(v15, "isInserted"))
        {
          objc_msgSend(v4, "rankingScore");
          if (v7 == 0.0)
            v8 = 1026;
          else
            v8 = 1538;
          objc_msgSend(v4, "encodedIdentifierString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v9, v8, v3);
        }
        else
        {
          objc_msgSend(v15, "nodeValueWithName:", CFSTR("rankingScore"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isInsertedDeletedOrChanged"))
            v11 = 512;
          else
            v11 = 0;
          objc_msgSend(v15, "nodeValueWithName:", CFSTR("synonymsString"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isInsertedDeletedOrChanged"))
            v11 |= 0x400uLL;
          if (v11)
          {
            objc_msgSend(v4, "encodedIdentifierString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v13, v11, v3);

          }
        }

        goto LABEL_21;
      }
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_7;
    }
LABEL_21:

  }
}

+ (void)prepareForDeletionWithNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
    goto LABEL_24;
  v7 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v3);
  if (objc_msgSend(v7, "type"))
  {
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

LABEL_9:
      objc_msgSend(v7, "encodedIdentifierString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v10, 512, v6);

      goto LABEL_10;
    }
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_9;
  }
LABEL_10:
  v28 = 0;
  objc_msgSend(v7, "fetchAllMomentsWithError:", &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;
  if (!v12)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v7;
      v32 = 2112;
      v33 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Fetch failed for all moment associated with search entity %@ (%@)", buf, 0x16u);
    }

  }
  v23 = v13;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v20, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v20, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v21, 2048, v6);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

LABEL_24:
}

+ (void)willInsertOutgoingEdge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  objc_msgSendSuper2(&v14, sel_willInsertOutgoingEdge_, v4);
  objc_opt_class();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v4, "targetMoment");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v4, "isInserted");

      if (v10)
      {
        objc_msgSend(v4, "targetMoment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v12, 2048, v7);

      }
    }
  }

}

+ (void)prepareForDeletingOutgoingEdge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  objc_msgSendSuper2(&v12, sel_prepareForDeletingOutgoingEdge_, v4);
  objc_opt_class();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v4, "targetMoment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "targetMoment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:](PLBackgroundJobWorkItem, "insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:flags:managedObjectContext:", v10, 2048, v7);

    }
  }

}

+ (id)_labelIDWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "pl_graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectIDForLabelWithCode:inContext:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D74498];
      v14 = *MEMORY[0x1E0CB2938];
      v15 = CFSTR("No search search entities found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 41004, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v17 = 1100;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Failed to find label for code \"%u\" (Error: %@)", buf, 0x12u);

    }
  }
  return v7;
}

+ (id)_labelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "pl_graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelWithCode:inContext:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D74498];
      v14 = *MEMORY[0x1E0CB2938];
      v15 = CFSTR("No search search entities found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 41004, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v17 = 1100;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Failed to find label for code \"%u\" (Error: %@)", buf, 0x12u);

    }
  }
  return v7;
}

+ (id)synonymsStringFromSynonyms:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|"));
}

+ (id)synonymsFromSynonymsString:(id)a3
{
  return (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
}

+ (void)setAssetSearchEntitiesFromDictionaries:(id)a3 onMoment:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint32_t numer;
  uint32_t denom;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t spid;
  uint64_t v68;
  id v69;
  NSObject *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id obj;
  uint64_t v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  double v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v83 = a4;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  v71 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLSearchEntityDonationToMoment", ", buf, 2u);
  }
  spid = v8;
  v70 = v10;

  v68 = mach_absolute_time();
  v69 = a1;
  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "_fetchSearchEntityNodesForMoment:", v83);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = objc_claimAutoreleasedReturnValue();

  v73 = v6;
  v96 = 0;
  v97 = 0;
  v80 = (void *)objc_msgSend(v6, "mutableCopy");
  v72 = (void *)v14;
  +[PLSearchEntity _findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:](PLSearchEntity, "_findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:", &v97, &v96);
  v15 = v97;
  v75 = v96;
  +[PLSearchEntity _fetchEdgesForNodes:toMoment:](PLSearchEntity, "_fetchEdgesForNodes:toMoment:", v15, v83);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v93 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        objc_msgSend(v22, "sourceNode", spid);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v24);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v19);
  }
  v74 = v17;

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v77 = v15;
  v26 = v75;
  v25 = v76;
  v81 = (id)objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
  if (v81)
  {
    v79 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v81; j = (char *)j + 1)
      {
        if (*(_QWORD *)v89 != v79)
          objc_enumerationMutation(v77);
        v28 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v28, "objectID", spid);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "containsObject:", v28))
        {
          objc_msgSend(v74, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Confidence"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          v34 = v33;

          +[PLSearchEntity _setConfidence:onEdge:](PLSearchEntity, "_setConfidence:onEdge:", v30, v34);
          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DateIntervalStart"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("DateIntervalEnd"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLSearchEntity _setDateIntervalStart:end:onEdge:](PLSearchEntity, "_setDateIntervalStart:end:onEdge:", v36, v38, v30);
          v39 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v28);
        }
        else
        {
          v39 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v28);
          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Confidence"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          v41 = v40;
          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("DateIntervalStart"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v29);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("DateIntervalEnd"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v39, "_insertMomentEdgeForMoment:confidence:startDate:endDate:", v83, v42, v44, v41);

          v26 = v75;
          v25 = v76;
        }

        objc_msgSend(v26, "objectForKeyedSubscript:", v29);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("synonyms"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSynonyms:", v47);

        objc_msgSend(v25, "removeObject:", v28);
        objc_msgSend(v26, "objectForKeyedSubscript:", v29);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "removeObject:", v48);

      }
      v81 = (id)objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    }
    while (v81);
  }

  objc_msgSend(v69, "_disconnectNodes:fromMoment:", v25, v83);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = v80;
  v49 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v85 != v51)
          objc_enumerationMutation(v82);
        v53 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
        objc_msgSend(v83, "managedObjectContext", spid);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = +[PLSearchEntity _newNodeContainerWithManagedObjectContext:dictionary:](PLSearchEntity, "_newNodeContainerWithManagedObjectContext:dictionary:", v54, v53);

        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("Confidence"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "doubleValue");
        v58 = v57;
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("DateIntervalStart"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("DateIntervalEnd"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (id)objc_msgSend(v55, "_insertMomentEdgeForMoment:confidence:startDate:endDate:", v83, v59, v60, v58);

      }
      v50 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    }
    while (v50);
  }

  v62 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v65 = v70;
  v66 = v65;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v66, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchEntityDonationToMoment", ", buf, 2u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v100 = "PLSearchEntityDonationToMoment";
    v101 = 2048;
    v102 = (float)((float)((float)((float)(v62 - v68) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

+ (void)enumerateAssetSearchEntitiesForMoment:(id)a3 withBlock:(id)a4
{
  id v7;
  void (**v8)(id, void *, _BYTE *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _BYTE *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 845, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  +[PLSearchEntity _fetchSearchEntityNodesForMoment:](PLSearchEntity, "_fetchSearchEntityNodesForMoment:", v7);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v9);
      v14 = (void *)objc_msgSend(a1, "newNodeContainerWithNode:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
      v17 = 0;
      v8[2](v8, v14, &v17);
      v15 = v17;

      if (v15)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }

}

+ (BOOL)enumerateAssetSearchEntitiesForLibrary:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id *v18;

  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 858, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke;
  v15[3] = &unk_1E3674C40;
  v16 = v9;
  v17 = v10;
  v18 = a4;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v12, "performBlockAndWait:", v15);

  return 1;
}

+ (id)_fetchSearchEntityWithLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5 inContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a6;
  objc_msgSend(v12, "numberWithUnsignedInteger:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithObject:forKey:", v14, CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("label"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  +[PLSearchEntity _findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:](PLSearchEntity, "_findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:", &v25, &v24, v16, v13);

  v17 = v25;
  v18 = v24;
  if ((unint64_t)objc_msgSend(v17, "count") >= 2)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138413058;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      v30 = 2048;
      v31 = a4;
      v32 = 2048;
      v33 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Expected to get 1 or less matches for [label: %@, identifier: %{public}@, type: %lu], got %tu", buf, 0x2Au);
    }

  }
  objc_msgSend(v17, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v22 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v21);
  else
    v22 = 0;

  return v22;
}

+ (id)fetchSearchEntityWithEncodedIdentifierString:(id)a3 inLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v31;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("label"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = (v9 | v10) == 0;
  else
    v13 = 1;
  if (v13)
  {
    v29 = v7;
    v14 = v6;
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = CFSTR("N");
      if (v12)
        v17 = CFSTR("N");
      else
        v17 = CFSTR("Y");
      if (!(v9 | v10))
        v16 = CFSTR("Y");
      *(_DWORD *)buf = 138543618;
      v36 = v17;
      v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Invalid encoded identifier string for fetching search entity, missing type: %{public}@, missing label/identifier: %{public}@", buf, 0x16u);
    }

    v18 = (void *)MEMORY[0x1E0D732B8];
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D74498];
    v33 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid encoded identifier string for fetching search entity, type: %@, label: %@, identifier: %@"), v12, v9, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 46514, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "failureWithError:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = objc_msgSend(v11, "integerValue");
    objc_msgSend(v6, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fetchSearchEntityWithLabel:type:identifier:inContext:", v9, v24, v10, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0D732B8];
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", MEMORY[0x1E0C9AA60]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v29 = v7;
    v14 = v6;
    v32 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "successWithResult:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v6 = v14;
  v7 = v29;
LABEL_17:

  return v23;
}

+ (id)decodeIdentifierString:(id)a3 intoLabel:(id *)a4 type:(unint64_t *)a5 outIdentifier:(id *)a6
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    if (a4)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("label"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v12, "integerValue");

    }
    if (a6)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "successWithResult:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)predicateForSearchEntitySourceNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K = %d"), CFSTR("primaryLabel"), CFSTR("code"), 1100);
}

+ (void)setSearchRankingsFromDictionaries:(id)a3 inLibrary:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  objc_msgSend(v34, "managedObjectContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v35 = v5;
  v45 = 0;
  v46 = 0;
  v31 = (void *)objc_msgSend(v5, "mutableCopy");
  v33 = (void *)v6;
  +[PLSearchEntity _findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:](PLSearchEntity, "_findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:", &v46, &v45);
  v7 = v46;
  v8 = v45;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v14, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", v14);
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("rankingScore"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v16, "setRankingScore:");

        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("synonyms"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v16, "setSynonyms:", v20);
        objc_msgSend(v9, "addObject:", v15);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v11);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = v31;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v34, "managedObjectContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = +[PLSearchEntity _newNodeContainerWithManagedObjectContext:dictionary:](PLSearchEntity, "_newNodeContainerWithManagedObjectContext:dictionary:", v27, v26);

        if (v28)
        {
          objc_msgSend(v28, "sourceNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v30);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v23);
  }

  objc_msgSend(a1, "_cleanUpStaleSearchRankingsNotIn:inLibrary:", v9, v34);
}

+ (void)setPersonRelationsFromDictionaries:(id)a3 onPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  __int16 v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _QWORD v68[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  NSObject *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  v61 = v7;
  objc_msgSend(a1, "_fetchMeOrSelfSearchEntityForPerson:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v56 = v9;
    v58 = v8;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v59 = v6;
    v35 = v6;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v70;
LABEL_18:
      v39 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v39);
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("PLSearchEntityPersonRelationTypeKey"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "unsignedIntegerValue");

        if ((unsigned __int16)(v42 - 3) >= 0xFFFEu)
          break;
        if (v37 == ++v39)
        {
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          if (v37)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("label"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("type"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "integerValue");
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("identifier"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v45;
      v8 = v58;
      +[PLSearchEntity _fetchSearchEntityWithLabel:type:identifier:inContext:](PLSearchEntity, "_fetchSearchEntityWithLabel:type:identifier:inContext:", v43, v47, v46, v58);
      v48 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v48;
      if (!v48)
        v11 = (void *)objc_msgSend(a1, "_newNodeContainerWithManagedObjectContext:dictionary:", v58, v40);
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("RelationTypeConfidence"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v50 = (id)objc_msgSend(v11, "_insertRelationEdgeForPerson:relationType:confidence:", v61, v42);

      v9 = v56;
      objc_msgSend(v56, "removeObject:", v40);

      v6 = v59;
      if (v11)
        goto LABEL_3;
    }
    else
    {
LABEL_24:

      v8 = v58;
      v6 = v59;
    }
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v61, "personUUID");
      v51 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = v51;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "ERROR: Failed to find or create a person search entity to add relations to for person(%@.", buf, 0xCu);

    }
    v11 = 0;
    goto LABEL_34;
  }
  v11 = v10;
  objc_msgSend(v10, "sourceNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _removeAllPersonRelationEdgesFromNode:](PLSearchEntity, "_removeAllPersonRelationEdgesFromNode:", v12);

LABEL_3:
  if (objc_msgSend(v9, "count"))
  {
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke;
    v68[3] = &__block_descriptor_40_e22__16__0__NSDictionary_8l;
    v68[4] = a1;
    objc_msgSend(v6, "_pl_map:", v68);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C97B48];
    +[PLPerson entityName](PLPerson, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("personUUID"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    v67 = 0;
    objc_msgSend(v8, "executeFetchRequest:error:", v16, &v67);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v67;
    v20 = v19;
    if (v18)
    {
      v52 = v19;
      v53 = v18;
      v54 = v16;
      v55 = v13;
      v57 = v8;
      objc_msgSend(v18, "_pl_indexBy:", &__block_literal_global_152_83499);
      v60 = objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v9;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            v25 = v11;
            if (*(_QWORD *)v64 != v23)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PLSearchEntityPersonRelationTypeKey"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "unsignedIntegerValue");

            if ((unsigned __int16)(v28 - 1) > 1u)
            {
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("identifier"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v60, "objectForKeyedSubscript:", v30);
              v29 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v29 = v61;
            }
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("RelationTypeConfidence"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            v32 = v28;
            v11 = v25;
            v33 = (id)objc_msgSend(v25, "_insertRelationEdgeForPerson:relationType:confidence:", v29, v32);

          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        }
        while (v22);
      }

      v8 = v57;
      v13 = v55;
      v18 = v53;
      v16 = v54;
      v20 = v52;
      v34 = v60;
    }
    else
    {
      PLBackendGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v13;
        v76 = 2112;
        v77 = v20;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to load PLPersons for personUUIDs: %@ (%@)", buf, 0x16u);
      }
    }

LABEL_34:
  }

}

+ (void)removePersonRelationsMatchingDictionaries:(id)a3 onPerson:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int16 v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  __int16 v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _QWORD v85[3];
  _QWORD v86[3];
  uint8_t buf[4];
  NSObject *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSObject managedObjectContext](v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 1
    || (objc_msgSend(v6, "firstObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLSearchEntityPersonRelationTypeKey")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "integerValue"),
        v10,
        v9,
        v11 != 1))
  {
    +[PLSearchEntity _fetchMeOrSelfSearchEntityForPerson:](PLSearchEntity, "_fetchMeOrSelfSearchEntityForPerson:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      PLBackendGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v7;
        _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "Couldn't find ME/SELF search entity fore person %@", buf, 0xCu);
      }
      goto LABEL_37;
    }
    v71 = a1;
    objc_msgSend(v6, "_pl_map:", &__block_literal_global_153_83485);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C97B48];
    +[PLPerson entityName](PLPerson, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("personUUID"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    v82 = 0;
    v63 = v16;
    objc_msgSend(v8, "executeFetchRequest:error:", v16, &v82);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v82;
    if (!v18)
    {
      PLBackendGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v55 = v64;
        v88 = v64;
        v89 = 2112;
        v90 = v19;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Couldn't fetch persons for uuids %@ (%@)", buf, 0x16u);
        v36 = v19;
      }
      else
      {
        v36 = v19;
        v55 = v64;
      }
      goto LABEL_36;
    }
    v61 = v7;
    v62 = v6;
    v20 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphEdge entityName](PLGraphEdge, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fetchRequestWithEntityName:", v21);
    v69 = v19;
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0CB3528];
    v24 = (void *)MEMORY[0x1E0CB3880];
    v60 = v12;
    objc_msgSend(v12, "sourceNode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("sourceNode"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v26;
    v59 = v18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("targetPerson"), v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v27;
    v28 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v71, "_personRelationLabelIDsInContext:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("primaryLabel"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v30;
    v65 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "andPredicateWithSubpredicates:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v22, "setPredicate:", v32);

    v33 = v22;
    v85[0] = CFSTR("targetPerson");
    v85[1] = CFSTR("sourceNode");
    v85[2] = CFSTR("values");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRelationshipKeyPathsForPrefetching:](v22, "setRelationshipKeyPathsForPrefetching:", v34);

    v81 = v69;
    objc_msgSend(v8, "executeFetchRequest:error:", v22, &v81);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v81;

    v68 = (void *)v35;
    if (v35)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v6 = v62;
      v37 = v62;
      v70 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      if (v70)
      {
        v57 = v36;
        v58 = v33;
        v66 = *(_QWORD *)v78;
        v67 = v37;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v78 != v66)
              objc_enumerationMutation(v37);
            v72 = v38;
            v39 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v38);
            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("PLSearchEntityPersonRelationTypeKey"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "integerValue");

            objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("identifier"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v43 = v68;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v74;
              while (2)
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(_QWORD *)v74 != v46)
                    objc_enumerationMutation(v43);
                  v48 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                  objc_msgSend(v48, "edgeValueWithName:", CFSTR("RelationType"));
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "intValue");

                  objc_msgSend(v48, "targetPerson");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v51;
                  if (v50 == v41)
                  {
                    objc_msgSend(v51, "personUUID");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v54 = objc_msgSend(v53, "isEqualToString:", v42);

                    if (v54)
                    {
                      objc_msgSend(v65, "deleteObject:", v48);

                      goto LABEL_23;
                    }
                  }

                }
                v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
                if (v45)
                  continue;
                break;
              }
            }
LABEL_23:

            v38 = v72 + 1;
            v37 = v67;
          }
          while (v72 + 1 != v70);
          v70 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
        }
        while (v70);
        v7 = v61;
        v6 = v62;
        v55 = v64;
        v8 = v65;
        v18 = v59;
        v12 = v60;
        v36 = v57;
        v33 = v58;
        goto LABEL_34;
      }
    }
    else
    {
      PLBackendGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v6 = v62;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "sourceNode");
        v56 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = v56;
        v89 = 2112;
        v90 = v36;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Couldn't fetch edges for node %@ (%@)", buf, 0x16u);

        v7 = v61;
LABEL_33:
        v55 = v64;
        v18 = v59;
LABEL_34:

LABEL_36:
LABEL_37:

        goto LABEL_38;
      }
    }
    v7 = v61;
    goto LABEL_33;
  }
  objc_msgSend(a1, "_removeMeRelationFromPerson:", v7);
LABEL_38:

}

+ (void)enumerateAssetSearchEntityPersonRelationsForPerson:(id)a3 withBlock:(id)a4
{
  id v7;
  void (**v8)(id, void *, _BYTE *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PLSearchEntityRelationToPerson *v15;
  void *v16;
  void *v17;
  __int16 v18;
  void *v19;
  PLSearchEntityRelationToPerson *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned __int8 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _BYTE *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSearchEntity.m"), 1096, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v22 = v7;
  objc_msgSend(a1, "_fetchEdgesForPersonRelationsOnPerson:", v7);
  v27 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      v15 = [PLSearchEntityRelationToPerson alloc];
      objc_msgSend(v14, "targetPerson");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "edgeValueWithName:", CFSTR("RelationType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");
      objc_msgSend(v14, "edgeValueWithName:", CFSTR("RelationTypeConfidence"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v20 = -[PLSearchEntityRelationToPerson initWithPerson:relationType:relationTypeConfidence:](v15, "initWithPerson:relationType:relationTypeConfidence:", v16, v18);

      v8[2](v8, v20, &v27);
      LODWORD(v19) = v27;

      if ((_DWORD)v19)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }

}

+ (id)personRelationDictionaryForRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 relatedPersonUUID:(id)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a6;
  objc_msgSend(v10, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3760218, CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("PLSearchEntityPersonRelationTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("RelationTypeConfidence"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("identifier"));
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("label"));

  return v12;
}

uint64_t __69__PLSearchEntity_removePersonRelationsMatchingDictionaries_onPerson___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
}

uint64_t __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
}

uint64_t __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke_150(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personUUID");
}

void __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke(uint64_t a1)
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
  id v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchEntity _labelIDWithCode:inContext:](PLSearchEntity, "_labelIDWithCode:inContext:", 1100, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C97B48];
    +[PLGraphNode entityName](PLGraphNode, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("primaryLabel"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

    v20[0] = CFSTR("values");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v8);

    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke_2;
    v14[3] = &unk_1E3673670;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v2, "enumerateObjectsFromFetchRequest:usingDefaultBatchSizeWithBlock:", v6, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (*(_QWORD *)(a1 + 48) && v9)
    {
      v11 = objc_retainAutorelease(v9);
      **(_QWORD **)(a1 + 48) = v11;
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Enumeration of asset search entities failed for library %@ (ERROR: %@)", buf, 0x16u);
      }

    }
  }

}

void __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
