@implementation WFControlFlowAttributionTracker

- (WFControlFlowAttributionTracker)init
{
  id v3;
  WFControlFlowAttributionTracker *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[WFControlFlowAttributionTracker initWithAttributionSetsInScope:](self, "initWithAttributionSetsInScope:", v3);

  return v4;
}

- (WFControlFlowAttributionTracker)initWithAttributionSetsInScope:(id)a3
{
  id v5;
  WFControlFlowAttributionTracker *v6;
  WFControlFlowAttributionTracker *v7;
  WFControlFlowAttributionTracker *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFControlFlowAttributionTracker;
  v6 = -[WFControlFlowAttributionTracker init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionSetsInScope, a3);
    v8 = v7;
  }

  return v7;
}

- (void)enteredScopeOfControlFlowAction:(id)a3 withInput:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "derivedDisclosureLevel");

  if (v8 == 1)
  {
    -[WFControlFlowAttributionTracker attributionSetsInScope](self, "attributionSetsInScope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupingIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
}

- (void)leftScopeOfControlFlowAction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFControlFlowAttributionTracker attributionSetsInScope](self, "attributionSetsInScope");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (id)contentCollectionByTaintingContentCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFControlFlowAttributionTracker attributionSetsInScope](self, "attributionSetsInScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
    objc_msgSend(v4, "attributionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0D13EA0], "attributionSetByMergingAttributionSets:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionByMergingAttributionSet:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (id)attributionSetForCurrentScope
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D13EA0];
  -[WFControlFlowAttributionTracker attributionSetsInScope](self, "attributionSetsInScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionSetByMergingAttributionSets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFControlFlowAttributionTracker)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFControlFlowAttributionTracker *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("attributionSetsInScope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFControlFlowAttributionTracker initWithAttributionSetsInScope:](self, "initWithAttributionSetsInScope:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFControlFlowAttributionTracker attributionSetsInScope](self, "attributionSetsInScope");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributionSetsInScope"));

}

- (NSMutableDictionary)attributionSetsInScope
{
  return self->_attributionSetsInScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSetsInScope, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
