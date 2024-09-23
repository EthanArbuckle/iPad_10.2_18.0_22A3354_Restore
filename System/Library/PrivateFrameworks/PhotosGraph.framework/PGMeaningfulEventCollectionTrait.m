@implementation PGMeaningfulEventCollectionTrait

- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3
{
  return -[PGMeaningfulEventCollectionTrait initWithNodes:negativeNodes:](self, "initWithNodes:negativeNodes:", a3, 0);
}

- (PGMeaningfulEventCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  id v7;
  id v8;
  PGMeaningfulEventCollectionTrait *v9;
  PGMeaningfulEventCollectionTrait *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMeaningfulEventCollectionTrait;
  v9 = -[PGMeaningfulEventTrait init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_negativeNodes, a4);
  }

  return v10;
}

- (BOOL)isActive
{
  return -[MAElementCollection count](self->_nodes, "count")
      || -[MAElementCollection count](self->_negativeNodes, "count") != 0;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, PGGraphNodeCollection *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;
  _QWORD aBlock[4];
  id v17;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke;
  aBlock[3] = &unk_1E84328C0;
  v17 = v4;
  v5 = v4;
  v6 = (void (**)(void *, PGGraphNodeCollection *))_Block_copy(aBlock);
  v6[2](v6, self->_nodes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, self->_negativeNodes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningfulEventCollectionTrait;
  -[PGMeaningfulEventTrait debugDescriptionWithMomentNode:](&v15, sel_debugDescriptionWithMomentNode_, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "count");
  v12 = CFSTR(" ");
  if (!v11)
    v12 = &stru_1E8436F28;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@%@%@"), v10, v7, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PGGraphNodeCollection)nodes
{
  return self->_nodes;
}

- (PGGraphNodeCollection)negativeNodes
{
  return self->_negativeNodes;
}

- (id)additionalMatchingBlock
{
  return self->_additionalMatchingBlock;
}

- (void)setAdditionalMatchingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalMatchingBlock, 0);
  objc_storeStrong((id *)&self->_negativeNodes, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

id __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a2;
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke_2;
  v10[3] = &unk_1E8432898;
  v11 = *(id *)(a1 + 32);
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v10);

  v7 = v12;
  v8 = v6;

  return v8;
}

void __67__PGMeaningfulEventCollectionTrait_debugDescriptionWithMomentNode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(*(id *)(a1 + 32), "anyEdgeTowardNode:", v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "domain") == 501 || objc_msgSend(v23, "domain") == 502)
  {
    v4 = *(void **)(a1 + 40);
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v23, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "confidence");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%.2f)"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  else
  {
    objc_msgSend(v23, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Address"));

    if (v10)
    {
      objc_msgSend(v23, "coordinate");
      v12 = v11;
      v14 = v13;
      v15 = *(void **)(a1 + 40);
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "relevance");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("{%.8f, %.8f} (%.2f)"), v12, v14, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v6);
    }
    else
    {
      objc_msgSend(v23, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 40);
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = objc_msgSend(v6, "length");
      v21 = v6;
      if (!v20)
      {
        objc_msgSend(v23, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v22);

      if (!v20)
    }
  }

}

@end
