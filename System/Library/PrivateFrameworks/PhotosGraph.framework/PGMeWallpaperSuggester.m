@implementation PGMeWallpaperSuggester

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 901);
}

+ (BOOL)enableSettlingEffect
{
  return 0;
}

- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__35235;
  v15 = __Block_byref_object_dispose__35236;
  v16 = 0;
  objc_msgSend(v5, "workingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PGMeWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke;
  v10[3] = &unk_1E84355C8;
  v10[4] = &v11;
  objc_msgSend(v6, "performSynchronousConcurrentGraphReadUsingBlock:", v10);

  if (v12[5])
  {
    v17 = v12[5];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA70];
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __92__PGMeWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "meNodeWithFallbackInferredMeNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "length"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
}

@end
