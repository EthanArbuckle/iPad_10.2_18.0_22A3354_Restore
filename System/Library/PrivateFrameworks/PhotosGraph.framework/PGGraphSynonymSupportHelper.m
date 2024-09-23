@implementation PGGraphSynonymSupportHelper

+ (id)localizedSynonymsForLocalizationKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("Synonyms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, v3, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", v3))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Missing localization for synonyms key %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", CFSTR("NULL")) & 1) == 0)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("|"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x1E0C9AA60];
LABEL_8:

  return v8;
}

+ (id)synonymsByIndexCategoryMaskForGraph:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:](PGGraphSynonymSupportHelper, "localizedSynonymsForLocalizationKey:", CFSTR("PGHighlightTripSearchableText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PGHighlightTripSearchableText"), CFSTR("PGHighlightTripSearchableText"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v8);

  v36 = v5;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, &unk_1E84E4A00);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke;
  v49[3] = &unk_1E84322A8;
  v11 = v9;
  v50 = v11;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", 0, 700, v49);
  v35 = v11;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, &unk_1E84E4A18);
  v47[0] = v10;
  v47[1] = 3221225472;
  v47[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_167;
  v47[3] = &unk_1E8433B60;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = v12;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Season"), 400, v47);
  v34 = v12;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, &unk_1E84E4A30);
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_170;
  v45[3] = &unk_1E84320C0;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = v13;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", 0, 502, v45);
  v33 = v13;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, &unk_1E84E4A48);
  v43[0] = v10;
  v43[1] = 3221225472;
  v43[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_173;
  v43[3] = &unk_1E8436458;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v44 = v14;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", 0, 901, v43);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, &unk_1E84E4A60);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PGUserDefaults relationshipTagMinConfidenceThreshold](PGUserDefaults, "relationshipTagMinConfidenceThreshold");
  v17 = v16;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "loggingConnection");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v17;
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Using PGUserDefaults.relationshipTagMinConfidenceThreshold value %f", buf, 0xCu);
  }

  +[PGGraphPersonRelationshipTagNode personWithTagWithConfidence:](PGGraphPersonRelationshipTagNode, "personWithTagWithConfidence:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonRelationshipTagNodeCollection, "nodesInGraph:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v21, v20, objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transposed");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v23, "targets");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_181;
  v41[3] = &unk_1E8431BE8;
  v27 = v24;
  v42 = v27;
  objc_msgSend(v25, "enumerateNodesUsingBlock:", v41);

  objc_msgSend(v23, "sources");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v26;
  v37[1] = 3221225472;
  v37[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_2;
  v37[3] = &unk_1E8431C38;
  v38 = v23;
  v39 = v27;
  v40 = v15;
  v29 = v15;
  v30 = v27;
  v31 = v23;
  objc_msgSend(v28, "enumerateUUIDsUsingBlock:", v37);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, &unk_1E84E4A78);
  return v4;
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSynonyms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_167(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSynonyms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSynonyms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);
}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSynonyms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);

}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "localizedSynonyms");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v3, "identifier");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v9);

}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(a1[4], "targetsForSourceIdentifier:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_3;
  v10[3] = &unk_1E8431C10;
  v11 = a1[5];
  v12 = v7;
  v8 = v7;
  objc_msgSend(v9, "enumerateIdentifiersAsCollectionsWithBlock:", v10);
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v8, v6);

}

void __67__PGGraphSynonymSupportHelper_synonymsByIndexCategoryMaskForGraph___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);
}

@end
