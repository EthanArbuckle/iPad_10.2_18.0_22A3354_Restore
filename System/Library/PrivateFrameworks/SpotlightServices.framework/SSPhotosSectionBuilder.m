@implementation SSPhotosSectionBuilder

+ (id)supportedBundleIds
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.searchd.syndicatedPhotos");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)maxVisibleColumnsInPhotosSection
{
  if (maxVisibleColumnsInPhotosSection_onceToken != -1)
    dispatch_once(&maxVisibleColumnsInPhotosSection_onceToken, &__block_literal_global);
  return maxVisibleColumnsInPhotosSection_numPhotoColumns;
}

uint64_t __58__SSPhotosSectionBuilder_maxVisibleColumnsInPhotosSection__block_invoke()
{
  void *v0;
  int v1;
  uint64_t result;
  uint64_t v3;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  result = isMacOS();
  v3 = 5;
  if ((_DWORD)result)
    v3 = 8;
  if (v1 == 3)
    v3 = 7;
  maxVisibleColumnsInPhotosSection_numPhotoColumns = v3;
  return result;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return (id)objc_msgSend(a4, "buildHorizontallyScrollingCardSection", a3);
}

- (id)buildBridgedResult
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSPhotosSectionBuilder;
  -[SSSectionBuilder buildBridgedResult](&v4, sel_buildBridgedResult);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setType:", 3);
  return v2;
}

- (id)buildCollectionStyle
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  -[SSSectionBuilder section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSPhotosSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI"))
  {
    v4 = (void *)objc_opt_new();
    if (isMacOS() && (SSSnippetModernizationEnabled() & 1) == 0)
    {
      objc_msgSend(v4, "setNumberOfRows:", 1);
    }
    else
    {
      objc_msgSend(v3, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      if (v6 < 2 * objc_msgSend((id)objc_opt_class(), "maxVisibleColumnsInPhotosSection"))
        v7 = 1;
      else
        v7 = 2;
      objc_msgSend(v4, "setNumberOfRows:", v7);

    }
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }
  objc_msgSend(v4, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v3, "maxInitiallyVisibleResults"));

  return v4;
}

- (id)buildCardSections
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SSPhotosSectionBuilder;
  -[SSSectionBuilder buildCardSections](&v28, sel_buildCardSections);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "thumbnail");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v9, "thumbnail");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "photoIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "length");

            if (v14)
            {
              objc_msgSend(v12, "photoIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setCardSectionId:", v15);

              objc_msgSend(v12, "photoIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "appendString:", v16);

              objc_msgSend(v23, "appendString:", CFSTR(" "));
            }

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v5);
  }

  logForCSLogCategoryPhotosQU();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v21 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v30 = v21;
    _os_signpost_emit_with_name_impl(&dword_1B86C5000, v20, OS_SIGNPOST_EVENT, v18, "ResultPhotos", "%{name=photoIdentifiers}s", buf, 0xCu);
  }

  return v3;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  objc_super v4;

  if ((SSSnippetModernizationEnabled() & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SSPhotosSectionBuilder;
  return -[SSSectionBuilder useHorizontallyScrollingCardSectionUI](&v4, sel_useHorizontallyScrollingCardSectionUI);
}

- (int64_t)maxCardSections
{
  objc_super v4;
  objc_super v5;

  if (SSSnippetModernizationEnabled())
    return -[SSSectionBuilder maxCardSections](&v5, sel_maxCardSections, v4.receiver, v4.super_class, self, SSPhotosSectionBuilder);
  if (!isMacOS())
    return -[SSSectionBuilder maxCardSections](&v4, sel_maxCardSections, self, SSPhotosSectionBuilder, v5.receiver, v5.super_class);
  if (-[SSPhotosSectionBuilder useHorizontallyScrollingCardSectionUI](self, "useHorizontallyScrollingCardSectionUI"))
    return -1;
  return 6;
}

@end
