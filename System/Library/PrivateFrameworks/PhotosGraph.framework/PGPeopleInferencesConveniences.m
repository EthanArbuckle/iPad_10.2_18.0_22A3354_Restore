@implementation PGPeopleInferencesConveniences

+ (BOOL)isValidContact:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isMe") & 1) != 0 || (objc_msgSend(v3, "isOrganization") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "CNIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

+ (BOOL)signalInRunOptions:(unint64_t)a3 signal:(unint64_t)a4
{
  return (a4 & ~a3) == 0;
}

+ (id)personLocalIdentifierByContactIdentifierFromPersonNodes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PGPeopleInferencesConveniences_personLocalIdentifierByContactIdentifierFromPersonNodes___block_invoke;
  v8[3] = &unk_1E8434020;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v8);

  return v6;
}

+ (id)countedPersonNodesFromMomentNodes:(id)a3 amongPersonNodes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "elementIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v6, v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transposed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  objc_msgSend(v12, "adjacency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__PGPeopleInferencesConveniences_countedPersonNodesFromMomentNodes_amongPersonNodes___block_invoke;
  v21[3] = &unk_1E8427870;
  v22 = v7;
  v23 = v8;
  v15 = v13;
  v24 = v15;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v14, "enumerateTargetsBySourceWith:", v21);

  v18 = v24;
  v19 = v15;

  return v19;
}

+ (id)momentNodesByAddressNodeFromMomentNodes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D429D8];
  v4 = a3;
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjacencyWithSources:relation:targetsClass:", v4, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "transposed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)momentNodesAtWorkInMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meNodeCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "collectionByIntersecting:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)momentNodesAtHomeInMomentNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "homeNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collectionByIntersecting:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:(id)a3 personNodes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "socialGroupNodesSortedByImportance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = &stru_1E8436F28;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "collection", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "personNodes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count") == 1 && (objc_msgSend(v5, "intersectsCollection:", v14) & 1) != 0)
          {
            objc_msgSend(v14, "localIdentifiers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "anyObject");
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v11 = &stru_1E8436F28;
    }
LABEL_15:

  }
  else
  {
    v11 = &stru_1E8436F28;
  }

  return v11;
}

+ (BOOL)anyPersonNodes:(id)a3 belongToBestSocialGroupsInGraph:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "socialGroupNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "socialGroupNodes:intersectWithBestSocialGroupsInGraph:", v7, v6);

  return (char)a1;
}

+ (BOOL)socialGroupNodes:(id)a3 intersectWithBestSocialGroupsInGraph:(id)a4
{
  id v5;
  id v6;
  PGGraphSocialGroupNodeCollection *v7;
  void *v8;
  PGGraphSocialGroupNodeCollection *v9;

  v5 = a4;
  v6 = a3;
  v7 = [PGGraphSocialGroupNodeCollection alloc];
  objc_msgSend(v5, "bestSocialGroupNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithArray:graph:](v7, "initWithArray:graph:", v8, v5);

  LOBYTE(v5) = -[MAElementCollection intersectsCollection:](v9, "intersectsCollection:", v6);
  return (char)v5;
}

void __85__PGPeopleInferencesConveniences_countedPersonNodesFromMomentNodes_amongPersonNodes___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a1[4], "containsIdentifier:", a2))
  {
    objc_msgSend(a1[5], "nodeForIdentifier:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend(v5, "count"))
      {
        v7 = 0;
        do
        {
          objc_msgSend(a1[6], "addObject:", v6);
          ++v7;
        }
        while (v7 < objc_msgSend(v5, "count"));
      }
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loggingConnection");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 134217984;
        v11 = a2;
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Could not fetch person node with identifier %lu", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

void __90__PGPeopleInferencesConveniences_personLocalIdentifierByContactIdentifierFromPersonNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "contactIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);

}

@end
