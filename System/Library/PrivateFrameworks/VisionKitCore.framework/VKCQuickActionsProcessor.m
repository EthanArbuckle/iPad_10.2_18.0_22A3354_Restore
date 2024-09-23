@implementation VKCQuickActionsProcessor

+ (void)quickActionsFromElements:(id)a3 unfilteredElements:(id)a4 analysis:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  VKCDataDetectorCatalystRevealHighlighter *v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  NSObject *queue;
  id v38;
  void *v39;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v11 = a4;
  v12 = a5;
  queue = a6;
  v13 = a7;
  v35 = v11;
  objc_msgSend(v11, "vk_objectsPassingTest:", &__block_literal_global_22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0CB3748]);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2;
  v50[3] = &unk_1E9464528;
  v16 = v15;
  v51 = v16;
  objc_msgSend(v38, "vk_compactMap:", v50);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getDDContextMenuActionClass(), "filterResultsForQuickActions:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3;
  v48[3] = &unk_1E9464550;
  v34 = v16;
  v49 = v34;
  objc_msgSend(v39, "vk_compactMap:", v48);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "vk_map:", &__block_literal_global_53);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vk_compactMap:", &__block_literal_global_57);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(VKCDataDetectorCatalystRevealHighlighter);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v21 = (id *)getkDataDetectorsAllResultsKeySymbolLoc_ptr;
  v55 = getkDataDetectorsAllResultsKeySymbolLoc_ptr;
  if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr)
  {
    v22 = (void *)DataDetectorsUILibrary_1();
    v21 = (id *)dlsym(v22, "kDataDetectorsAllResultsKey");
    v53[3] = (uint64_t)v21;
    getkDataDetectorsAllResultsKeySymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v52, 8);
  if (!v21)
    goto LABEL_8;
  v23 = *v21;
  v56 = v23;
  v58[0] = v19;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v24 = (id *)getkDDHighlighterKeySymbolLoc_ptr;
  v55 = getkDDHighlighterKeySymbolLoc_ptr;
  if (!getkDDHighlighterKeySymbolLoc_ptr)
  {
    v25 = (void *)DataDetectorsUILibrary_1();
    v24 = (id *)dlsym(v25, "kDDHighlighterKey");
    v53[3] = (uint64_t)v24;
    getkDDHighlighterKeySymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v52, 8);
  if (!v24)
  {
LABEL_8:
    getkDDRVInteractionDidFinishNotification_cold_1();
    __break(1u);
  }
  v57 = *v24;
  v58[1] = v20;
  v26 = (void *)MEMORY[0x1E0C99D80];
  v27 = v57;
  objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v58, &v56, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_6;
  block[3] = &unk_1E9462268;
  v42 = v12;
  v43 = v18;
  v44 = v28;
  v45 = v14;
  v46 = v13;
  v47 = a1;
  v29 = v13;
  v30 = v14;
  v31 = v28;
  v32 = v18;
  v33 = v12;
  dispatch_async(queue, block);

}

uint64_t __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTextDataDetector");
}

id __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "scannerResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  objc_msgSend(v3, "scannerResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VKCTextDataDetectorElement *__105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  VKCTextDataDetectorElement *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (VKCTextDataDetectorElement *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = -[VKCTextDataDetectorElement initWithScannerResult:]([VKCTextDataDetectorElement alloc], "initWithScannerResult:", v3);

  return v4;
}

VKCQuickActionMenuTuple *__105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  VKCQuickActionMenuTuple *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(VKCQuickActionMenuTuple);
  +[VKCActionInfoButton buttonWithImage:text:](VKCActionInfoButton, "buttonWithImage:text:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCQuickActionMenuTuple setButton:](v3, "setButton:", v4);

  -[VKCQuickActionMenuTuple setElement:](v3, "setElement:", v2);
  return v3;
}

id __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coreResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "analysisRequestID");
    *(_DWORD *)buf = 67109120;
    v20 = v4;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_INFO, "Beginning Quick Action processing, id: %d", buf, 8u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_63;
  v17[3] = &unk_1E94645D8;
  v6 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2_65;
  v10[3] = &unk_1E9462268;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v11 = v7;
  v16 = v8;
  v12 = *(id *)(a1 + 56);
  v13 = v2;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 64);
  v9 = v2;
  vk_dispatchMainAfterDelay(v10, 0.0);

}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_63(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id DDContextMenuActionClass;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "element");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupedElementData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_dictionaryByAddingEntriesFromNonNilDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  DDContextMenuActionClass = getDDContextMenuActionClass();
  objc_msgSend(v3, "element");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scannerResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "coreResult");
  objc_msgSend(v3, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(DDContextMenuActionClass, "buttonActionsForURL:result:contact:icsString:context:view:identifier:suggestedActions:defaultAction:", 0, v10, 0, 0, v6, v11, 0, 0, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;

  objc_msgSend(v3, "setMenu:", v12);
  objc_msgSend(v3, "setDefaultAction:", v13);

}

void __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_2_65(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3_66;
  v14 = &unk_1E9464600;
  v16 = *(_QWORD *)(a1 + 72);
  v2 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v2, "vk_compactMap:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "dedupeQuickActions:", v3, v11, v12, v13, v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "sortQuickActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v8 = v7;

  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 56), "analysisRequestID");
    *(_DWORD *)buf = 134218240;
    v18 = v8;
    v19 = 1024;
    v20 = v10;
    _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_INFO, "Quick Action processing completed in %f, id: %d", buf, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __105__VKCQuickActionsProcessor_quickActionsFromElements_unfilteredElements_analysis_queue_completionHandler___block_invoke_3_66(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "configureQuickActionForTuple:unfilteredTextElements:", a2, *(_QWORD *)(a1 + 32));
}

+ (int64_t)sortOrderForElement:(id)a3
{
  __int16 v3;

  v3 = objc_msgSend(a3, "dataDetectorTypes");
  if ((v3 & 0x40) != 0)
    return 1;
  if ((v3 & 0x200) != 0)
    return 2;
  if ((v3 & 0x80) != 0)
    return 3;
  if ((v3 & 0x100) != 0)
    return 4;
  if ((v3 & 1) != 0)
    return 5;
  if ((v3 & 2) != 0)
    return 6;
  if ((v3 & 0x10) != 0)
    return 7;
  if ((v3 & 8) != 0)
    return 8;
  if ((v3 & 4) != 0)
    return 9;
  if ((v3 & 0x400) != 0)
    return 10;
  if ((v3 & 0x800) != 0)
    return 11;
  if ((v3 & 0x20) != 0)
    return 13;
  return 127;
}

+ (id)dedupeQuickActions:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __47__VKCQuickActionsProcessor_dedupeQuickActions___block_invoke;
  v15 = &unk_1E9463CA0;
  v16 = v5;
  v17 = v6;
  v7 = v6;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v12);

  objc_msgSend(v8, "allValues", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __47__VKCQuickActionsProcessor_dedupeQuickActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }

}

+ (id)sortQuickActions:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__VKCQuickActionsProcessor_sortQuickActions___block_invoke;
  v4[3] = &__block_descriptor_40_e53_q24__0__VKCActionInfoButton_8__VKCActionInfoButton_16l;
  v4[4] = a1;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__VKCQuickActionsProcessor_sortQuickActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  objc_msgSend(a2, "representedElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "representedElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 32), "sortOrderForElement:", v6);
  v9 = objc_msgSend(*(id *)(a1 + 32), "sortOrderForElement:", v7);
  if (v8 < v9)
    v10 = -1;
  else
    v10 = v8 > v9;
  if (!v10)
  {
    objc_msgSend(v6, "quad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topLeft");
    v13 = v12;
    v15 = v14;

    objc_msgSend(v7, "quad");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topLeft");
    v18 = v17;
    v20 = v19;

    v21 = v15 > v20;
    if (v15 < v20)
      v21 = -1;
    v22 = v13 > v18;
    if (v13 < v18)
      v22 = -1;
    if (v21)
      v10 = v21;
    else
      v10 = v22;
  }

  return v10;
}

+ (id)configureQuickActionForTuple:(id)a3 unfilteredTextElements:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v19 = a4;
  objc_msgSend(v5, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "element");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v10 = (void *)getDDUIActionClass_softClass;
  v24 = getDDUIActionClass_softClass;
  if (!getDDUIActionClass_softClass)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __getDDUIActionClass_block_invoke;
    v20[3] = &unk_1E9462330;
    v20[4] = &v21;
    __getDDUIActionClass_block_invoke((uint64_t)v20);
    v10 = (void *)v22[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v21, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "dd_action");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isPlaceholderAction") & 1) != 0
      || objc_msgSend(v9, "isUnitConversionDataDetector"))
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("arrow.triangle.swap"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 1;
      v15 = v13;
    }
    else
    {
      objc_msgSend(v12, "compactIcon");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "icon");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    objc_msgSend(v12, "quickActionTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v16);
    objc_msgSend(v6, "setImage:", v13);
    objc_msgSend(v6, "setMenuImage:", v15);
    objc_msgSend(v6, "setDefaultAction:", v7);
    objc_msgSend(v6, "setMenu:", v8);
    objc_msgSend(v6, "setRepresentedElement:", v9);
    objc_msgSend(v6, "setAllUnfilteredElements:", v19);
    objc_msgSend(v6, "setShowsMenuAsPrimaryAction:", v14);
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("QuickAction"));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v6, sel_performDefaultElementAction, 64);
  }
  else
  {
LABEL_8:
    v16 = 0;
    v13 = 0;
    v15 = 0;
    v12 = v6;
    v6 = 0;
  }

  v17 = v6;
  return v17;
}

@end
