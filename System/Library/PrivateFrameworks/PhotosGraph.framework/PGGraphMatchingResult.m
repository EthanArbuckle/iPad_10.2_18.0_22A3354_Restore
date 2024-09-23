@implementation PGGraphMatchingResult

- (PGGraphMatchingResult)initWithEvent:(id)a3
{
  id v5;
  PGGraphMatchingResult *v6;
  PGGraphMatchingResult *v7;
  uint64_t v8;
  NSMutableDictionary *context;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMatchingResult;
  v6 = -[PGGraphMatchingResult init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    context = v7->_context;
    v7->_context = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)keywordsForRelatedType:(unint64_t)a3
{
  NSDictionary *keywords;
  void *v4;
  void *v5;

  keywords = self->_keywords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](keywords, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addKeywords:(id)a3 forRelatedType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PGGraphMatchingResult keywords](self, "keywords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMatchingResult keywords](self, "keywords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v8, "addObjectsFromArray:", v11);

}

- (void)clearKeywordsForRelatedType:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PGGraphMatchingResult keywords](self, "keywords");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (id)contextItemForRelatedType:(unint64_t)a3
{
  NSMutableDictionary *context;
  void *v4;
  void *v5;

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setContextItem:(id)a3 forRelatedType:(unint64_t)a4
{
  NSMutableDictionary *context;
  void *v6;
  id v7;
  id v8;

  context = self->_context;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", v7, v8);

}

- (id)localStartDate
{
  void *v2;
  void *v3;

  -[PGGraphMatchingResult _highestScoredContextItemWithPreferredRelatedType:](self, "_highestScoredContextItemWithPreferredRelatedType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localEndDate
{
  void *v2;
  void *v3;

  -[PGGraphMatchingResult _highestScoredContextItemWithPreferredRelatedType:](self, "_highestScoredContextItemWithPreferredRelatedType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong((id *)(v5 + 8), self->_event);
  *(double *)(v5 + 24) = self->_score;
  v6 = -[NSDictionary copyWithZone:](self->_keywords, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_context, "mutableCopyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  return (id)v5;
}

- (id)_contextItemsSortedByScoreAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_context, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_highestScoredContextItemWithPreferredRelatedType:(unint64_t)a3
{
  NSMutableDictionary *context;
  void *v5;
  void *v6;
  void *v7;

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PGGraphMatchingResult _contextItemsSortedByScoreAscending:](self, "_contextItemsSortedByScoreAscending:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSDictionary)keywords
{
  NSDictionary *keywords;
  NSDictionary *v4;
  NSDictionary *v5;

  keywords = self->_keywords;
  if (!keywords)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_keywords;
    self->_keywords = v4;

    keywords = self->_keywords;
  }
  return keywords;
}

- (id)sortedCriteria
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[PGGraphMatchingResult _contextItemsSortedByScoreAscending:](self, "_contextItemsSortedByScoreAscending:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraphMatchingResult_sortedCriteria__block_invoke;
  v6[3] = &unk_1E8436570;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

- (void)enumerateContextItems:(id)a3
{
  id v4;
  NSMutableDictionary *context;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PGGraphMatchingResult_enumerateContextItems___block_invoke;
  v7[3] = &unk_1E8436598;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](context, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)isEqualToResult:(id)a3
{
  id v4;
  double score;
  double v6;
  PGGraphRelatableEvent *event;
  void *v8;
  char v9;

  v4 = a3;
  score = self->_score;
  objc_msgSend(v4, "score");
  if (score == v6)
  {
    event = self->_event;
    objc_msgSend(v4, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PGGraphRelatableEvent isEqualToNode:](event, "isEqualToNode:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[PGGraphMatchingResult isEqualToResult:](self, "isEqualToResult:");
}

- (unint64_t)hash
{
  return -[PGGraphRelatableEvent hash](self->_event, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PGGraphMatchingResult event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMatchingResult score](self, "score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> - event:%@ - score:%0.2f"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double score;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_context, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t%@"), v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphRelatableEvent name](self->_event, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  score = self->_score;
  objc_msgSend((id)objc_opt_class(), "matchingDescriptionWithEventNode:", self->_event);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("event: %@\nscore: %0.2f\ncontexts: %@\nmatchingDescription: %@"), v13, *(_QWORD *)&score, v3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (PGGraphRelatableEvent)event
{
  return self->_event;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

void __47__PGGraphMatchingResult_enumerateContextItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(a2, "unsignedIntegerValue");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __39__PGGraphMatchingResult_sortedCriteria__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "criteria"));
}

+ (id)matchingDescriptionWithEventNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t i;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  _QWORD v45[4];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "label");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(v3, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("[%@:%@]"), v7, v8);

  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("[%@]"), v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke;
  v52[3] = &unk_1E84365C0;
  v11 = v3;
  v53 = v11;
  v12 = v9;
  v54 = v12;
  v13 = v4;
  v55 = v13;
  objc_msgSend(v11, "enumerateInEdgesUsingBlock:", v52);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v13, "appendString:", CFSTR(" (<- "));
    v43 = v13;
    v39 = v11;
    objc_msgSend(v11, "graph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v15;
    objc_msgSend(v15, "anyNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v40 = v12;
    obj = v12;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v49;
      v20 = CFSTR("unknown");
      v41 = v16;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v49 != v19)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v23 = CFSTR("me");
          if ((objc_msgSend(v22, "isEqualToNode:", v16) & 1) == 0)
          {
            objc_msgSend(v22, "collection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphRelationshipEdgeCollection, "edgesFromNodes:toNodes:", v42, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "anyEdge");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "label");
            v27 = v18;
            v28 = v20;
            v29 = v19;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lowercaseString");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v19 = v29;
            v20 = v28;
            v18 = v27;

            v13 = v43;
            v16 = v41;

          }
          objc_msgSend(v22, "name");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v31;
          if (v23)
            v33 = v23;
          else
            v33 = (__CFString *)v20;
          objc_msgSend(v13, "appendFormat:", CFSTR("%@:%@ | "), v31, v33);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v18);
    }

    objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length") - 3, 3, CFSTR(")"));
    v11 = v39;
    v12 = v40;
    v10 = MEMORY[0x1E0C809B0];
  }
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_2;
  v45[3] = &unk_1E8436610;
  v46 = v11;
  v34 = v13;
  v47 = v34;
  v35 = v11;
  objc_msgSend(v35, "enumerateOutEdgesUsingBlock:", v45);
  v36 = v47;
  v37 = v34;

  return v37;
}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "oppositeNode:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "domain") == 300)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {
    objc_msgSend(v8, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 48);
    objc_msgSend(v8, "label");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v3)
    {
      objc_msgSend(v8, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" (<-%@:%@)"), v6, v7);

    }
    else
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" (<-%@)"), v5);
    }

  }
}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v3 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__66793;
  v21 = __Block_byref_object_dispose__66794;
  objc_msgSend(v3, "oppositeNode:", *(_QWORD *)(a1 + 32));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "domain") == 200)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend((id)v18[5], "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18[5], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" (->%@:%@"), v5, v6);

    v7 = MEMORY[0x1E0C809B0];
    while (objc_msgSend((id)v18[5], "outEdgesCount"))
    {
      v8 = (void *)v18[5];
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_194;
      v14[3] = &unk_1E84365E8;
      v16 = &v17;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v8, "enumerateOutEdgesUsingBlock:", v14);

    }
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(")"));
  }
  else
  {
    if (objc_msgSend(v3, "domain") == 600)
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend((id)v18[5], "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR(" (->Scene:%@)"), v10);
    }
    else
    {
      objc_msgSend((id)v18[5], "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1 + 40);
      objc_msgSend((id)v18[5], "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend((id)v18[5], "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR(" (->%@:%@)"), v10, v13);

      }
      else
      {
        objc_msgSend(v12, "appendFormat:", CFSTR(" (->%@)"), v10);
      }
    }

  }
  _Block_object_dispose(&v17, 8);

}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_194(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "domain") == 200)
  {
    objc_msgSend(v10, "oppositeNode:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("/%@"), v9);

    *a3 = 1;
  }

}

@end
