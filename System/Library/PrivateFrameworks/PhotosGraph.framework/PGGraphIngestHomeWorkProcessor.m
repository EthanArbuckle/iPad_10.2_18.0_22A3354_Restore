@implementation PGGraphIngestHomeWorkProcessor

- (PGGraphIngestHomeWorkProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestHomeWorkProcessor *v6;
  PGGraphIngestHomeWorkProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestHomeWorkProcessor;
  v6 = -[PGGraphIngestHomeWorkProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "hasUpdatedPersonNodesUnrelatedToMomentChange") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasDeletedPersonNodes");
  }

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  PGGraphPersonNodeCollection *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  os_signpost_id_t spid;
  void *v26;
  id v27;
  id aBlock;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  mach_timebase_info info;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  _BYTE v41[18];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  aBlock = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = _Block_copy(aBlock);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  spid = v8;
  v11 = v8 - 1;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGGraphIngestHomeWorkProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v24 = mach_absolute_time();
  objc_msgSend(v27, "updatedPersonNodesUnrelatedToMomentChange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
    goto LABEL_10;
  v13 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", v12, v6);
  -[PGGraphIngestHomeWorkProcessor _deleteLocationEdgesOfPersonNodes:inGraph:](self, "_deleteLocationEdgesOfPersonNodes:inGraph:", v13, v6);
  -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonNodeCollection contactIdentifiers](v13, "contactIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__PGGraphIngestHomeWorkProcessor_runWithGraphUpdate_progressBlock___block_invoke;
  v29[3] = &unk_1E8434F30;
  v30 = v26;
  v31 = v35;
  v32 = &v36;
  v33 = 0x3F847AE147AE147BLL;
  objc_msgSend(v14, "personsInContactStoreForContactIdentifiers:needsRefetching:progressBlock:", v15, 0, v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *((unsigned __int8 *)v37 + 24);
  if (*((_BYTE *)v37 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v41 = 66;
      *(_WORD *)&v41[4] = 2080;
      *(_QWORD *)&v41[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/Ingest Processing/PGGraphIngestHomeWorkProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    -[PGGraphIngestHomeWorkProcessor inferHomeWorkAddressesOfPersonNodes:andCLSPersonByContactIdentifier:inGraph:](self, "inferHomeWorkAddressesOfPersonNodes:andCLSPersonByContactIdentifier:inGraph:", v13, v16, v6);
    objc_msgSend(v16, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateCacheForPersonInContactStoreWithContactIdentifiers:", v18);

  }
  if (!v17)
  {
LABEL_10:
    -[PGGraphIngestHomeWorkProcessor _deleteEdgelessHomeWorkNodesInGraph:](self, "_deleteEdgelessHomeWorkNodesInGraph:", v6);
    v19 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v22 = v10;
    v23 = v22;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestHomeWorkProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v41 = "PGGraphIngestHomeWorkProcessor";
      *(_WORD *)&v41[8] = 2048;
      *(double *)&v41[10] = (float)((float)((float)((float)(v19 - v24) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);

}

- (void)inferHomeWorkAddressesOfPersonNodes:(id)a3 andCLSPersonByContactIdentifier:(id)a4 inGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PGGraphIngestHomeWorkProcessor *v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke;
  v12[3] = &unk_1E8433768;
  v13 = v8;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "enumerateNodesUsingBlock:", v12);

}

- (void)_deleteEdgelessHomeWorkNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphHomeWorkNode filter](PGGraphHomeWorkNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhereNoInAndOutEdges:", 1);
  objc_msgSend(v4, "nodeIdentifiersMatchingFilter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "[PGGraphIngestHomeWorkProcessor] Deleted %lu homeWork nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v8, "removeNodesForIdentifiers:", v6);
    objc_msgSend(v4, "executeGraphChangeRequest:", v8);

  }
}

- (void)_deleteLocationEdgesOfPersonNodes:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "homeOrWorkNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A00], "any");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesOfType:onNodes:matchingFilter:](PGGraphEdgeCollection, "edgesOfType:onNodes:matchingFilter:", 3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_msgSend(v9, "count");
    objc_msgSend(v7, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218242;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGGraphIngestHomeWorkProcessor] Deleted %lu edges that are connected to HomeWork nodes [%@]", (uint8_t *)&v14, 0x16u);

  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v13, "removeEdges:", v9);
    objc_msgSend(v6, "executeGraphChangeRequest:", v13);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v14, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "hasAddresses"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "locationsByAddressTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke_2;
      v15[3] = &unk_1E842F880;
      v9 = v7;
      v16 = v9;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);

      if (objc_msgSend(v9, "count"))
      {
        +[PGGraphAddressNodeCollection addressNodesWithinDistance:ofLocations:inGraph:](PGGraphAddressNodeCollection, "addressNodesWithinDistance:ofLocations:inGraph:", v9, *(_QWORD *)(a1 + 40), 150.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
        objc_msgSend(v10, "temporarySet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v11, "insertHomeWorkNodeForPerson:personNode:fromAddressNodes:", v6, v14, v12);

      }
    }

  }
  objc_autoreleasePoolPop(v3);

}

uint64_t __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

void __67__PGGraphIngestHomeWorkProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
