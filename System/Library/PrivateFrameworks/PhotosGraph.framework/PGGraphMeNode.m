@implementation PGGraphMeNode

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Me");
  return CFSTR("Me");
}

- (void)enumerateSocialGroupNodesWithRelationship:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a4;
  if (a3 == 4 || a3 == 1)
  {
    -[PGGraphMeNode _relationshipLabelForRelationship:](self, "_relationshipLabelForRelationship:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMeNode _enumerateSocialGroupNodesForRelationshipLabel:usingBlock:](self, "_enumerateSocialGroupNodesForRelationshipLabel:usingBlock:", v7, v6);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Requesting a non supported relationship for social groups", v10, 2u);
    }

  }
}

- (void)_enumerateSocialGroupNodesForRelationshipLabel:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  if (v6)
  {
    v8[1] = 3221225472;
    v8[2] = __75__PGGraphMeNode__enumerateSocialGroupNodesForRelationshipLabel_usingBlock___block_invoke;
    v8[3] = &unk_1E842C9E0;
    v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v9 = v6;
    -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", a3, 302, v8);

    v6 = v7;
  }

}

- (BOOL)_status:(unint64_t)a3 fitsQuery:(unint64_t)a4
{
  unint64_t v4;
  char v5;

  v4 = (a4 >> 1) & 1;
  v5 = a4 & 1;
  if (a3)
    v5 = 0;
  if (a3 != 1)
    LOBYTE(v4) = v5;
  if (a3 == 2)
    return (a4 & 4) != 0;
  else
    return v4;
}

- (void)_enumerateRelationshipWithLabel:(id)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v8 = a5;
  if (v8)
  {
    v10[1] = 3221225472;
    v10[2] = __74__PGGraphMeNode__enumerateRelationshipWithLabel_matchingQuery_usingBlock___block_invoke;
    v10[3] = &unk_1E842CA08;
    v10[4] = self;
    v12 = a4;
    v9 = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v11 = v8;
    -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", a3, 300, v10);

    v8 = v9;
  }

}

- (id)_relationshipLabelForRelationship:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (_relationshipLabelForRelationship__onceToken != -1)
    dispatch_once(&_relationshipLabelForRelationship__onceToken, &__block_literal_global_30227);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_relationshipLabelForRelationship__labelByRelationship, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumeratePersonNodesWithRelationship:(unint64_t)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[PGGraphMeNode _relationshipLabelForRelationship:](self, "_relationshipLabelForRelationship:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PGGraphMeNode _enumerateRelationshipWithLabel:matchingQuery:usingBlock:](self, "_enumerateRelationshipWithLabel:matchingQuery:usingBlock:", v8, a4, v9);

}

- (id)storytellingRelationshipLabelsToPersonNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGGraphPersonNode collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphStorytellingRelationshipEdgeCollection, "edgesFromNodes:toNodes:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "labels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)relationshipEdgesToPersonNode:(id)a3 matchingQuery:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonNode collection](self, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphRelationshipEdgeCollection, "edgesFromNodes:toNodes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[PGGraphMeNode _status:fitsQuery:](self, "_status:fitsQuery:", objc_msgSend(v17, "status", (_QWORD)v19), a4))
        {
          objc_msgSend(v7, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v7;
}

- (id)inferredPersonNode
{
  PGGraphMeNodeCollection *v2;
  void *v3;
  void *v4;

  v2 = -[MANodeCollection initWithNode:]([PGGraphMeNodeCollection alloc], "initWithNode:", self);
  -[PGGraphMeNodeCollection inferredPersonNodes](v2, "inferredPersonNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__PGGraphMeNode__relationshipLabelForRelationship___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E84E3D70;
  v2[1] = &unk_1E84E3D88;
  v3[0] = CFSTR("PARTNER");
  v3[1] = CFSTR("FAMILY");
  v2[2] = &unk_1E84E3DA0;
  v2[3] = &unk_1E84E3DB8;
  v3[2] = CFSTR("PARENT");
  v3[3] = CFSTR("MOTHER");
  v2[4] = &unk_1E84E3DD0;
  v2[5] = &unk_1E84E3DE8;
  v3[4] = CFSTR("FATHER");
  v3[5] = CFSTR("CHILD");
  v2[6] = &unk_1E84E3E00;
  v2[7] = &unk_1E84E3E18;
  v3[6] = CFSTR("SON");
  v3[7] = CFSTR("DAUGHTER");
  v2[8] = &unk_1E84E3E30;
  v2[9] = &unk_1E84E3E48;
  v3[8] = CFSTR("FRIEND");
  v3[9] = CFSTR("COWORKER");
  v2[10] = &unk_1E84E3E60;
  v2[11] = &unk_1E84E3E78;
  v3[10] = CFSTR("BROTHER");
  v3[11] = CFSTR("SISTER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_relationshipLabelForRelationship__labelByRelationship;
  _relationshipLabelForRelationship__labelByRelationship = v0;

}

void __74__PGGraphMeNode__enumerateRelationshipWithLabel_matchingQuery_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_status:fitsQuery:", objc_msgSend(v6, "status"), *(_QWORD *)(a1 + 48)))(*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__PGGraphMeNode__enumerateSocialGroupNodesForRelationshipLabel_usingBlock___block_invoke(uint64_t a1)
{
  char v2;

  v2 = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Me"), 300);
}

+ (id)inferredPersonOfMe
{
  void *v2;
  void *v3;

  +[PGGraphInferredPersonEdge filter](PGGraphInferredPersonEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
