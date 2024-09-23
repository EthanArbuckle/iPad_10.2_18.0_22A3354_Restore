@implementation WFiTunesObjectContentItem

- (WFiTunesObject)object
{
  return (WFiTunesObject *)-[WFiTunesObjectContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)possibleArtworkURLs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[WFiTunesObjectContentItem object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
        -[WFiTunesObjectContentItem object](self, "object", (_QWORD)v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "artworkURLs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          WFPossibleArtworkURLsForArtworkURL(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v19);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v9;
}

- (void)getArtworkDataWithURLs:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[7];
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v5 = a3;
  v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__32311;
  v18[4] = __Block_byref_object_dispose__32312;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__32311;
  v16[4] = __Block_byref_object_dispose__32312;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__32311;
  v14[4] = __Block_byref_object_dispose__32312;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke;
  v13[3] = &unk_1E7AF1428;
  v13[4] = v18;
  v13[5] = v16;
  v13[6] = v14;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_3;
  v8[3] = &unk_1E7AF17D8;
  v7 = v6;
  v9 = v7;
  v10 = v18;
  v11 = v14;
  v12 = v16;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v13, v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

- (void)getArtworkForSize:(CGSize)a3 completionHandler:(id)a4
{
  double width;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  width = a3.width;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[WFiTunesObjectContentItem object](self, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artworkURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
      v16 = (double)objc_msgSend(v15, "integerValue");
      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "screenScale");
      v19 = width * v18;

      if (v19 <= v16)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v20 = v15;

    if (v20)
    {
      objc_msgSend(v8, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = v21;
        WFPossibleArtworkURLsForArtworkURL(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __65__WFiTunesObjectContentItem_getArtworkForSize_completionHandler___block_invoke;
        v24[3] = &unk_1E7AF1450;
        v25 = v6;
        -[WFiTunesObjectContentItem getArtworkDataWithURLs:completionHandler:](self, "getArtworkDataWithURLs:completionHandler:", v23, v24);

        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_9:

    v20 = 0;
  }
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_14:

}

- (void)getPreferredArtworkURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFiTunesObjectContentItem possibleArtworkURLs](self, "possibleArtworkURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WFiTunesObjectContentItem_getPreferredArtworkURL___block_invoke;
  v7[3] = &unk_1E7AF1450;
  v8 = v4;
  v6 = v4;
  -[WFiTunesObjectContentItem getArtworkDataWithURLs:completionHandler:](self, "getArtworkDataWithURLs:completionHandler:", v5, v7);

}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x1E0CEC520]))
  {
    -[WFiTunesObjectContentItem object](self, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artworkURLs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__32311;
      v20[4] = __Block_byref_object_dispose__32312;
      v21 = 0;
      -[WFiTunesObjectContentItem possibleArtworkURLs](self, "possibleArtworkURLs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke;
      v19[3] = &unk_1E7AF14A0;
      v19[4] = self;
      v19[5] = v20;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_3;
      v16[3] = &unk_1E7AF14C8;
      v17 = v8;
      v18 = v20;
      objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v16);

      _Block_object_dispose(v20, 8);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFiTunesObjectContentItem;
    -[WFiTunesObjectContentItem generateFileRepresentation:options:forType:](&v15, sel_generateFileRepresentation_options_forType_, v8, v9, v10);
  }

}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    -[WFiTunesObjectContentItem object](self, "object");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "viewURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0D14018];
      -[WFiTunesObjectContentItem name](self, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "object:named:", v25, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(CFSTR("MPMediaItem"), "isEqualToString:", v9);

  if (!v10)
  {
    if ((Class)objc_opt_class() != a3)
    {
      v46.receiver = self;
      v46.super_class = (Class)WFiTunesObjectContentItem;
      -[WFiTunesObjectContentItem generateObjectRepresentationForClass:options:error:](&v46, sel_generateObjectRepresentationForClass_options_error_, a3, v8, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    -[WFiTunesObjectContentItem object](self, "object");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v25, "artistName"), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = (void *)v28;
      v30 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("%1$@ by %2$@"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v31, v32, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v25, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = objc_msgSend(v33, "length");
    objc_msgSend(v25, "viewURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
    {
      if (v35)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("%1$@ (%2$@)"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "viewURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "absoluteString");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringWithFormat:", v38, v33, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
        if (objc_msgSend(v41, "length"))
        {
          v43 = (void *)MEMORY[0x1E0D14018];
          -[WFiTunesObjectContentItem name](self, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "object:named:", v41, v44);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = 0;
        }

        goto LABEL_30;
      }
      v42 = v33;
    }
    else
    {
      objc_msgSend(v35, "absoluteString");
      v42 = (id)objc_claimAutoreleasedReturnValue();
    }
    v41 = v42;
    goto LABEL_26;
  }
  v52 = 0;
  v53 = &v52;
  v54 = 0x2050000000;
  v11 = (void *)getMPMediaPropertyPredicateClass_softClass_32276;
  v55 = getMPMediaPropertyPredicateClass_softClass_32276;
  if (!getMPMediaPropertyPredicateClass_softClass_32276)
  {
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __getMPMediaPropertyPredicateClass_block_invoke_32277;
    v50 = &unk_1E7AF9520;
    v51 = &v52;
    __getMPMediaPropertyPredicateClass_block_invoke_32277((uint64_t)&v47);
    v11 = (void *)v53[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v52, 8);
  -[WFiTunesObjectContentItem object](self, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithValue:forProperty:", v14, CFSTR("storeItemAdamID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0;
  v53 = &v52;
  v54 = 0x2050000000;
  v16 = (void *)getMPMediaQueryClass_softClass_32279;
  v55 = getMPMediaQueryClass_softClass_32279;
  if (!getMPMediaQueryClass_softClass_32279)
  {
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __getMPMediaQueryClass_block_invoke_32280;
    v50 = &unk_1E7AF9520;
    v51 = &v52;
    __getMPMediaQueryClass_block_invoke_32280((uint64_t)&v47);
    v16 = (void *)v53[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v52, 8);
  v18 = [v17 alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithFilterPredicates:", v19);

  objc_msgSend(v20, "items");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D14018], "object:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

LABEL_31:
  return v23;
}

- (id)preferredFileType
{
  return (id)objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC590]);
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned __int8 isKindOfClass;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  if (v6)
  {
    -[WFiTunesObjectContentItem object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "artworkURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_msgSend(v8, "count") != 0;

  }
  else
  {
    v10 = v4;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v12) = objc_msgSend(v13, "isEqualToString:", CFSTR("MPMediaItem"));
    if (!(_DWORD)v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)WFiTunesObjectContentItem;
      isKindOfClass = -[WFiTunesObjectContentItem canGenerateRepresentationForType:](&v15, sel_canGenerateRepresentationForType_, v10);
      goto LABEL_12;
    }
    -[WFiTunesObjectContentItem object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

LABEL_12:
  return isKindOfClass & 1;
}

void __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a2;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v16[3] = &unk_1E7AF1478;
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v19 = v9;
  v20 = v11;
  v17 = v8;
  v18 = v12;
  v21 = a5;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v10, "downloadTaskWithURL:completionHandler:", v13, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

uint64_t __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

void __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  v7 = a3;
  v8 = a4;
  if (v23
    && (objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 200, 100),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "containsIndex:", objc_msgSend(v7, "statusCode")),
        v9,
        (v10 & 1) != 0))
  {
    v11 = (void *)MEMORY[0x1E0DC7B30];
    objc_msgSend(v7, "MIMEType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeFromMIMEType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "typeDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)MEMORY[0x1E0DC7B30];
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "typeFromFilename:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    v18 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileWithURL:options:ofType:proposedFilename:", v23, 3, v13, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    **(_BYTE **)(a1 + 64) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __52__WFiTunesObjectContentItem_getPreferredArtworkURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__WFiTunesObjectContentItem_getArtworkForSize_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  void *v7;
  id v8;
  void (*v9)(uint64_t, _QWORD);
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0DC7B70];
    v8 = a5;
    objc_msgSend(v7, "imageWithData:scale:allowAnimated:", a3, 0, 1.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD))(v5 + 16);
    v10 = a5;
    v9(v5, 0);
  }

}

void __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a2;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_2;
  v17 = &unk_1E7AF1400;
  v18 = v8;
  v19 = v9;
  v20 = *(_OWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = a5;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v11, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume", v14, v15, v16, v17);

}

uint64_t __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
}

void __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;

  v12 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 200, 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsIndex:", objc_msgSend(v8, "statusCode"));

  if ((v11 & 1) != 0)
  {
    **(_BYTE **)(a1 + 72) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)urlItem_outputClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E40];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)urlItem_sharingItemClassesByBundleIdentifier
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.AppStore");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("com.apple.MobileStore");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("com.apple.iBooks");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("com.apple.podcasts");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("com.apple.Music");
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)parseiTunesURL:(id)a3 itemIdentifier:(id *)a4 countryCode:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  objc_msgSend(v7, "dc_queryDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("i"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "integerValue"))
  {
    v10 = v9;
  }
  else
  {
    objc_msgSend(v7, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("id")))
    {
      objc_msgSend(v11, "substringFromIndex:", 2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v11;
    }
    v10 = v12;

  }
  v13 = objc_msgSend(v10, "integerValue");
  if (v13)
  {
    objc_msgSend(v7, "pathComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "count") < 2)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "pathComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v16, "length") != 2)
    {

      v16 = 0;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    if (a5)
      *a5 = objc_retainAutorelease(v16);

  }
  return v13 != 0;
}

+ (BOOL)urlItem_canCoerceFromURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("appsto.re")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("itun.es")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "hasSuffix:", CFSTR("itunes.apple.com")) & 1) != 0
         || (objc_msgSend(v5, "hasSuffix:", CFSTR("music.apple.com")) & 1) != 0
         || (objc_msgSend(v5, "hasSuffix:", CFSTR("books.apple.com")) & 1) != 0
         || (objc_msgSend(v5, "hasSuffix:", CFSTR("podcasts.apple.com")) & 1) != 0
         || objc_msgSend(v5, "hasSuffix:", CFSTR("apps.apple.com")))
  {
    v6 = objc_msgSend(a1, "parseiTunesURL:itemIdentifier:countryCode:", v4, 0, 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)urlItem_generateObjectRepresentations:(id)a3 fromURL:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  Class v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("itunes.apple.com"));

  if (v11)
  {
    objc_msgSend(a1, "urlItem_generateObjectRepresentations:fromiTunesURL:forClass:", v8, v9, a5);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromURL_forClass___block_invoke;
    v12[3] = &unk_1E7AF1300;
    v14 = a1;
    v13 = v8;
    v15 = a5;
    +[WFURLExpander expandURL:completionHandler:](WFURLExpander, "expandURL:completionHandler:", v9, v12);

    v9 = v13;
  }

}

+ (void)urlItem_generateObjectRepresentations:(id)a3 fromiTunesURL:(id)a4 forClass:(Class)a5
{
  id v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  Class v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = 0;
  v23 = 0;
  v9 = objc_msgSend(a1, "parseiTunesURL:itemIdentifier:countryCode:", a4, &v23, &v22);
  v10 = v23;
  v11 = v22;
  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_opt_new();
    v24 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromiTunesURL_forClass___block_invoke;
    v19[3] = &unk_1E7AF1328;
    v21 = a5;
    v20 = v8;
    objc_msgSend(v12, "lookupMediaWithIdentifiers:countryCode:completion:", v13, v11, v19);

    v14 = v20;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB32E8];
    v25 = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Invalid iTunes URL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -1000, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v18);

  }
}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Store ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("object.identifier"), v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v6 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Store URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("object.viewURL"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v9 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "block:name:class:", &__block_literal_global_32364, v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v12 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork URL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "block:name:class:", &__block_literal_global_167, v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_8;
  v7 = v4;
  if (v7)
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v10, "isEqualToString:", CFSTR("MPMediaItem"));
  if ((v9 & 1) != 0)
  {
LABEL_8:
    v11 = 1;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___WFiTunesObjectContentItem;
    v11 = objc_msgSendSuper2(&v13, sel_supportedTypeMustBeDeterminedByInstance_, v7);
  }

  return v11;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC520]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D14138];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("iTunes product"), CFSTR("iTunes product"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("iTunes products"), CFSTR("iTunes products"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d iTunes products"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

void __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_1E7AF13D8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredArtworkURL:", v7);

}

uint64_t __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_1E7AF1390;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

uint64_t __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromiTunesURL_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "objectsMatchingClass:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D14018], "object:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v5);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }

}

uint64_t __84__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromURL_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "urlItem_generateObjectRepresentations:fromiTunesURL:forClass:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 48));
}

@end
