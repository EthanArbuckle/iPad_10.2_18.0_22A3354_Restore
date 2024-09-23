@implementation PGSharingSuggestionSourceSocialGroup

- (id)name
{
  return CFSTR("Social Group");
}

- (id)details
{
  return CFSTR("Return suggestions for persons missing from a present social group");
}

- (double)weight
{
  return 0.6;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  PGGraphMomentNodeCollection *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PGSharingSuggestionSourceSocialGroup *v21;

  v5 = a3;
  objc_msgSend(v5, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(v5, "momentNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MAElementCollection initWithArray:graph:](v7, "initWithArray:graph:", v8, v6);
  -[PGGraphMomentNodeCollection socialGroupNodes](v9, "socialGroupNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memberNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonSocialGroupNodesForMemberNodes:withThreshold:", v11, 0.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v12, "memberNodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionBySubtracting:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__PGSharingSuggestionSourceSocialGroup_suggestedResultsForInput_withOptions___block_invoke;
  v19[3] = &unk_1E8432A00;
  v16 = v13;
  v20 = v16;
  v21 = self;
  objc_msgSend(v15, "enumerateNodesUsingBlock:", v19);
  v17 = v16;

  return v17;
}

void __77__PGSharingSuggestionSourceSocialGroup_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!objc_msgSend(v5, "memberType"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "suggestionResultWithPerson:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
