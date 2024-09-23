@implementation PGSearchMetadataComputer

- (PGSearchMetadataComputer)initWithGraph:(id)a3
{
  id v5;
  PGSearchMetadataComputer *v6;
  PGSearchMetadataComputer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSearchMetadataComputer;
  v6 = -[PGSearchMetadataComputer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (id)searchMetadataWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSearchMetadataComputer _mePersonUUID](self, "_mePersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D72D70]);

  -[PGSearchMetadataComputer _suggestableLocalizedSceneNames](self, "_suggestableLocalizedSceneNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D72D78]);

  -[PGSearchMetadataComputer _blockedMeaningsByMeaning](self, "_blockedMeaningsByMeaning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D72D68]);

  return v4;
}

- (id)_mePersonUUID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PGGraph meNode](self->_graph, "meNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v2, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuidFromLocalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)_suggestableLocalizedSceneNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphSceneNode suggestableSceneNames](PGGraphSceneNode, "suggestableSceneNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSceneNodeCollection sceneNodesForSceneNames:inGraph:](PGGraphSceneNodeCollection, "sceneNodesForSceneNames:inGraph:", v3, self->_graph);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSceneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_blockedMeaningsByMeaning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PGGraph *graph;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Concert"), CFSTR("Festival"), CFSTR("SportEvent"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAGraph anyNodeForLabel:domain:properties:](self->_graph, "anyNodeForLabel:domain:properties:", CFSTR("Performance"), 700, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  graph = self->_graph;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke;
  v14[3] = &unk_1E842BA10;
  v15 = v6;
  v16 = v4;
  v8 = v3;
  v17 = v8;
  v9 = v4;
  v10 = v6;
  -[MAGraph enumerateNodesInDomain:usingBlock:](graph, "enumerateNodesInDomain:usingBlock:", 700, v14);
  v11 = v17;
  v12 = v8;

  return v12;
}

- (PGGraph)graph
{
  return (PGGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

void __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke_2;
    v18[3] = &unk_1E842BA10;
    v6 = v5;
    v19 = v6;
    v20 = a1[4];
    v21 = a1[5];
    objc_msgSend(v3, "traverseParentMeaningHierarchyUsingBlock:", v18);
    if (a1[4])
    {
      v7 = a1[5];
      objc_msgSend(v3, "label");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

      if ((_DWORD)v7)
        objc_msgSend(v6, "addObject:", a1[4]);
    }
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v6, v4);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v3, "localizedSynonyms", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        }
        while (v11);
      }

    }
  }

}

void __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 48);
    objc_msgSend(v6, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

    if ((_DWORD)v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }

}

@end
