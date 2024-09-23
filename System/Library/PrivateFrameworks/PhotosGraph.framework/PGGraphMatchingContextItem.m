@implementation PGGraphMatchingContextItem

- (PGGraphMatchingContextItem)initWithRelatedType:(unint64_t)a3 score:(double)a4 criteria:(unint64_t)a5 referenceNode:(id)a6 matchedNode:(id)a7 contextNodes:(id)a8
{
  id v15;
  id v16;
  id v17;
  PGGraphMatchingContextItem *v18;
  PGGraphMatchingContextItem *v19;
  objc_super v21;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)PGGraphMatchingContextItem;
  v18 = -[PGGraphMatchingContextItem init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_score = a4;
    v18->_relatedType = a3;
    v18->_criteria = a5;
    objc_storeStrong((id *)&v18->_referenceNode, a6);
    objc_storeStrong((id *)&v19->_matchedNode, a7);
    objc_storeStrong((id *)&v19->_contextNodes, a8);
  }

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> option: %lu, score %f, criteria %lu"), objc_opt_class(), self, self->_relatedType, *(_QWORD *)&self->_score, self->_criteria);
}

- (NSDate)localStartDate
{
  NSDate *localStartDate;

  localStartDate = self->_localStartDate;
  if (!localStartDate)
  {
    -[PGGraphMatchingContextItem _findLocalStartAndEndDate](self, "_findLocalStartAndEndDate");
    localStartDate = self->_localStartDate;
  }
  return localStartDate;
}

- (NSDate)localEndDate
{
  NSDate *localEndDate;

  localEndDate = self->_localEndDate;
  if (!localEndDate)
  {
    -[PGGraphMatchingContextItem _findLocalStartAndEndDate](self, "_findLocalStartAndEndDate");
    localEndDate = self->_localEndDate;
  }
  return localEndDate;
}

- (void)_findLocalStartAndEndDate
{
  PGGraphNode *matchedNode;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__45225;
  v15 = __Block_byref_object_dispose__45226;
  v16 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__45225;
  v9 = __Block_byref_object_dispose__45226;
  v10 = 0;
  matchedNode = self->_matchedNode;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__PGGraphMatchingContextItem__findLocalStartAndEndDate__block_invoke;
  v4[3] = &unk_1E8432960;
  v4[4] = &v11;
  v4[5] = &v5;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](matchedNode, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DATE"), 400, v4);
  objc_storeStrong((id *)&self->_localStartDate, (id)v12[5]);
  objc_storeStrong((id *)&self->_localEndDate, (id)v6[5]);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

- (id)_matchedAddressNode
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_criteria - 12 <= 8)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_contextNodes;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v8, "label", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Address")) & 1) != 0)
          {
            v11 = v8;

            goto LABEL_15;
          }

        }
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }

    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[PGGraphNode collection](self->_matchedNode, "collection");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  -[NSSet addressNodes](v3, "addressNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyNode");
  v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v11;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("option: %lu, score %f, criteria %lu"), self->_relatedType, *(_QWORD *)&self->_score, self->_criteria);
}

- (BOOL)isEqualToContextItem:(id)a3
{
  id v4;
  double score;
  double v6;
  unint64_t criteria;
  unint64_t relatedType;
  PGGraphNode *matchedNode;
  void *v10;
  NSSet *contextNodes;
  void *v12;
  BOOL v13;

  v4 = a3;
  score = self->_score;
  objc_msgSend(v4, "score");
  if (score == v6
    && (criteria = self->_criteria, criteria == objc_msgSend(v4, "criteria"))
    && (relatedType = self->_relatedType, relatedType == objc_msgSend(v4, "relatedType")))
  {
    matchedNode = self->_matchedNode;
    objc_msgSend(v4, "matchedNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PGGraphNode isEqualToNode:](matchedNode, "isEqualToNode:", v10))
    {
      contextNodes = self->_contextNodes;
      objc_msgSend(v4, "contextNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NSSet isEqualToSet:](contextNodes, "isEqualToSet:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[PGGraphMatchingContextItem isEqualToContextItem:](self, "isEqualToContextItem:");
}

- (unint64_t)hash
{
  return -[MANode hash](self->_matchedNode, "hash");
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (unint64_t)relatedType
{
  return self->_relatedType;
}

- (unint64_t)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(unint64_t)a3
{
  self->_criteria = a3;
}

- (PGGraphNode)referenceNode
{
  return self->_referenceNode;
}

- (PGGraphNode)matchedNode
{
  return self->_matchedNode;
}

- (NSSet)contextNodes
{
  return self->_contextNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_contextNodes, 0);
  objc_storeStrong((id *)&self->_matchedNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

void __55__PGGraphMatchingContextItem__findLocalStartAndEndDate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  objc_msgSend(a2, "localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = v3;
  if (*(_QWORD *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1)
      goto LABEL_5;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v6 + 40))
  {
LABEL_8:
    objc_storeStrong((id *)(v6 + 40), obj);
    goto LABEL_9;
  }
  if (objc_msgSend(obj, "compare:") == 1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    goto LABEL_8;
  }
LABEL_9:

}

+ (unint64_t)criteriaForLocationLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (criteriaForLocationLabel__onceToken != -1)
    dispatch_once(&criteriaForLocationLabel__onceToken, &__block_literal_global_45235);
  objc_msgSend((id)criteriaForLocationLabel__s_LabelCriteriaDictionary, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Could not find criteria for label %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

void __55__PGGraphMatchingContextItem_criteriaForLocationLabel___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Area");
  v2[1] = CFSTR("Address");
  v3[0] = &unk_1E84E4448;
  v3[1] = &unk_1E84E4460;
  v2[2] = CFSTR("Number");
  v2[3] = CFSTR("Street");
  v3[2] = &unk_1E84E4478;
  v3[3] = &unk_1E84E4490;
  v2[4] = CFSTR("District");
  v2[5] = CFSTR("City");
  v3[4] = &unk_1E84E44A8;
  v3[5] = &unk_1E84E44C0;
  v2[6] = CFSTR("County");
  v2[7] = CFSTR("State");
  v3[6] = &unk_1E84E44D8;
  v3[7] = &unk_1E84E44F0;
  v2[8] = CFSTR("Country");
  v3[8] = &unk_1E84E4508;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)criteriaForLocationLabel__s_LabelCriteriaDictionary;
  criteriaForLocationLabel__s_LabelCriteriaDictionary = v0;

}

@end
