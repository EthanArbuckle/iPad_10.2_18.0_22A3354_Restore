@implementation PGGraphHighlightGroupNode

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("HighlightGroup");
  return CFSTR("HighlightGroup");
}

- (PGGraphHighlightGroupNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphHighlightGroupNodeCollection alloc], "initWithNode:", self);
}

- (BOOL)isTrip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PGGraphHighlightGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LongTrip")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("ShortTrip")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("OngoingTrip"));
  }

  return v6;
}

- (BOOL)isLongTrip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("LongTrip"));

  return (char)v3;
}

- (BOOL)isShortTrip
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("ShortTrip"));

  return (char)v3;
}

- (BOOL)isAggregation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphHighlightGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("Aggregation"));

  return (char)v3;
}

- (void)enumerateHighlightEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("GROUP_CONTAINS"), 102, a3);
}

- (void)enumerateHighlightNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("GROUP_CONTAINS"), 102, a3);
}

- (NSArray)highlightNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphHighlightGroupNode_highlightNodes__block_invoke;
  v6[3] = &unk_1E842F948;
  v4 = v3;
  v7 = v4;
  -[PGGraphHighlightGroupNode enumerateHighlightNodesUsingBlock:](self, "enumerateHighlightNodesUsingBlock:", v6);

  return (NSArray *)v4;
}

- (NSArray)sortedHighlightNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[PGGraphHighlightGroupNode highlightNodes](self, "highlightNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E842D9A0;
  v7 = v4;
  v5 = v4;
  -[PGGraphHighlightGroupNode enumerateHighlightNodesUsingBlock:](self, "enumerateHighlightNodesUsingBlock:", v6);

}

- (unint64_t)featureType
{
  return 16;
}

void __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke_2;
  v5[3] = &unk_1E84275E0;
  v6 = *(id *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "enumerateMomentEdgesAndNodesUsingBlock:", v5);

}

uint64_t __68__PGGraphHighlightGroupNode_enumerateMomentEdgesAndNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  **(_BYTE **)(a1 + 40) = *a4;
  return result;
}

uint64_t __43__PGGraphHighlightGroupNode_highlightNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("HighlightGroup"), 102);
}

+ (id)pathFromMoment
{
  return CFSTR("(:Moment)<-[:CONTAINS]-(:Highlight)<-[:GROUP_CONTAINS]-");
}

+ (id)pathToMoment
{
  return CFSTR("-[:GROUP_CONTAINS]->(:Highlight)-[:CONTAINS]->(:Moment)");
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathFromMoment", v3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 102)
  {
    return &stru_1E8436F28;
  }
  else
  {
    return 0;
  }
}

+ (id)pathToTargetNodeDomain:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 100)
  {
    objc_msgSend((id)objc_opt_class(), "pathToMoment", v3, v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 102)
  {
    return &stru_1E8436F28;
  }
  else
  {
    return 0;
  }
}

+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v4 = a3;
  v5 = (__CFString *)a4;
  if (v4 == 100)
  {
    v6 = CFSTR("(%@:Moment)<-[:CONTAINS]-(:Highlight)<-[:GROUP_CONTAINS]-(:HighlightGroup)");
  }
  else
  {
    if (v4 != 102)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v6 = CFSTR("(%@:HighlightGroup)");
  }
  v7 = &stru_1E8436F28;
  if (v5)
    v7 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v4 = a3;
  v5 = (__CFString *)a4;
  if (v4 == 100)
  {
    v6 = CFSTR("(:HighlightGroup)-[:GROUP_CONTAINS]->(:Highlight)-[:CONTAINS]->(%@:Moment)");
  }
  else
  {
    if (v4 != 102)
    {
      v8 = 0;
      goto LABEL_9;
    }
    v6 = CFSTR("(%@:HighlightGroup)");
  }
  v7 = &stru_1E8436F28;
  if (v5)
    v7 = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

+ (id)filterWithUUIDs:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = CFSTR("id");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("HighlightGroup"), 102, v6);
  return v7;
}

+ (MARelation)highlightOfHighlightGroup
{
  void *v2;
  void *v3;

  +[PGGraphGroupContainsEdge filter](PGGraphGroupContainsEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)typeOfHighlightGroup
{
  void *v2;
  void *v3;

  +[PGGraphHasTypeEdge filter](PGGraphHasTypeEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)momentInHighlight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphHighlightGroupNode highlightOfHighlightGroup](PGGraphHighlightGroupNode, "highlightOfHighlightGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PGGraphHighlightNode momentInDayHighlight](PGGraphHighlightNode, "momentInDayHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
