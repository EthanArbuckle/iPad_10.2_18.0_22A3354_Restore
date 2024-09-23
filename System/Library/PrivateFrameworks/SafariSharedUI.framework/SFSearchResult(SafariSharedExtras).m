@implementation SFSearchResult(SafariSharedExtras)

+ (id)safari_sfSearchResultWithUniqueIdentifier
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setIdentifier:", v2);

  return v0;
}

- (uint64_t)parsecDomainIdentifier
{
  return 0;
}

- (id)uuidString
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, sel_uuidString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, sel_uuidString, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)engagementDestination
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  _BOOL4 v8;

  objc_msgSend(a1, "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

    return 1;
  }
  objc_msgSend(a1, "mapsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  objc_msgSend(a1, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return 2 * v8;
}

- (id)safari_firstInlineCardSectionOfClass:()SafariSharedExtras
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "inlineCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_firstCardSectionOfClass:ofCard:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_firstCardSectionOfClass:()SafariSharedExtras ofCard:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = 0;
  objc_msgSend(v5, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SFSearchResult_SafariSharedExtras___firstCardSectionOfClass_ofCard___block_invoke;
  v9[3] = &unk_1E5445CB8;
  v9[4] = &v10;
  v9[5] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

@end
