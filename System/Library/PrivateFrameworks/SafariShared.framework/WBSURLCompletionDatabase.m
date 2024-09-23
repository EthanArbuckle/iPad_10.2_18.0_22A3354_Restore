@implementation WBSURLCompletionDatabase

- (WBSURLCompletionDatabase)init
{
  WBSURLCompletionDatabase *v2;
  WBSURLCompletionDatabase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WBSURLCompletionDatabase;
  v2 = -[WBSURLCompletionDatabase init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "initializeURLCompletionOnMainThread");
    v3 = v2;
  }

  return v2;
}

+ (void)initializeURLCompletionOnMainThread
{
  if (+[WBSURLCompletionDatabase initializeURLCompletionOnMainThread]::onceToken != -1)
    dispatch_once(&+[WBSURLCompletionDatabase initializeURLCompletionOnMainThread]::onceToken, &__block_literal_global_101);
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(id *)a5 matches:(id *)a6 limit:(unint64_t)a7 forQueryID:(int64_t)a8 withSearchParameters:(id)a9
{
  id v15;
  id v16;
  WBSURLCompletionUserTypedString *v17;
  uint64_t (***v18)(SafariShared::BookmarkAndHistoryCompletionMatch **, SafariShared::BookmarkAndHistoryCompletionMatch **);
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id *v29;
  id v30;
  uint64_t (**v31)(SafariShared::BookmarkAndHistoryCompletionMatch **, SafariShared::BookmarkAndHistoryCompletionMatch **);
  uint64_t v32;
  _BOOL8 v33;
  WBSTopHitCompletionMatch *v34;
  WBSTopHitCompletionMatch *v35;
  uint64_t (*v36)(uint64_t *, uint64_t *);
  id v37;
  uint64_t (**v38)(uint64_t *, uint64_t *);
  uint64_t v39;
  WBSBookmarkAndHistoryCompletionMatch *v40;
  WBSBookmarkAndHistoryCompletionMatch *v41;
  uint64_t (*v42)(uint64_t *, uint64_t *);
  void *v43;
  void *v44;
  void *v45;
  WBSURLCompletionUserTypedString *v46;
  id v47;
  _DWORD **v48;
  uint64_t v49;
  uint64_t (**v50)(uint64_t *, uint64_t *);
  uint64_t v51;
  uint64_t (**v52)(SafariShared::BookmarkAndHistoryCompletionMatch **, SafariShared::BookmarkAndHistoryCompletionMatch **);
  uint64_t v53;
  uint64_t (*v54)(SafariShared::BookmarkAndHistoryCompletionMatch **, SafariShared::BookmarkAndHistoryCompletionMatch **);

  v15 = a3;
  v47 = a4;
  v16 = a9;
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v17 = -[WBSURLCompletionUserTypedString initWithString:]([WBSURLCompletionUserTypedString alloc], "initWithString:", v15);
  v48 = 0;
  v49 = 0;
  if (a5)
    v18 = &v52;
  else
    v18 = 0;
  v46 = v17;
  -[WBSURLCompletionDatabase _getSortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:](self, "_getSortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:", v17, v47, v18, &v50, a7, &v48, a7, v16);
  v19 = HIDWORD(v49);
  if (HIDWORD(v49) + (unint64_t)HIDWORD(v51) < a7)
  {
    if (HIDWORD(v51) < a7)
    {
      WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v50, 0);
      v19 = HIDWORD(v49);
    }
    if (v19 < a7)
      WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v48, 0);
    -[WBSURLCompletionDatabase _getSortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:](self, "_getSortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:", v46, v47, v18, &v50, a7, &v48, a7, v16);
    LODWORD(v19) = HIDWORD(v49);
  }
  if ((_DWORD)v19)
  {
    WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendRange<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>((uint64_t)&v50, v48, &v48[v19]);
    v20 = objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled");
    v21 = 126 - 2 * __clz(HIDWORD(v51));
    v22 = HIDWORD(v51) ? v21 : 0;
    v54 = v20 ? compareCompletionMatchesWithoutBoostingBookmarkScore : compareCompletionMatches;
    std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,false>((uint64_t)v50, (uint64_t *)&v50[HIDWORD(v51)], (uint64_t (**)(uint64_t *, uint64_t *))&v54, v22, 1);
    if (HIDWORD(v51) > a7)
    {
      v23 = (uint64_t *)&v50[a7];
      v24 = 8 * HIDWORD(v51) - 8 * a7;
      do
      {
        v25 = *v23;
        *v23 = 0;
        if (v25)
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v25);
        ++v23;
        v24 -= 8;
      }
      while (v24);
      HIDWORD(v51) = a7;
    }
  }
  v26 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    if (HIDWORD(v51))
    {
      v27 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:].cold.2();
      logMatches((uint64_t)&v50);
    }
    else
    {
      v28 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:].cold.1();
    }
  }
  if (a5)
  {
    v29 = a6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", HIDWORD(v53));
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = v30;
    if (HIDWORD(v53))
    {
      v31 = v52;
      v32 = 8 * HIDWORD(v53);
      do
      {
        v33 = +[WBSURLCompletionDatabase _shouldPreloadTopHit:forTypedString:withSearchParameters:](WBSURLCompletionDatabase, "_shouldPreloadTopHit:forTypedString:withSearchParameters:", *v31, v15, v16);
        v34 = [WBSTopHitCompletionMatch alloc];
        v54 = *v31;
        *v31 = 0;
        v35 = -[WBSTopHitCompletionMatch initWithBookmarkAndHistoryCompletionMatch:userInput:forQueryID:shouldPreload:](v34, "initWithBookmarkAndHistoryCompletionMatch:userInput:forQueryID:shouldPreload:", &v54, v15, a8, v33);
        objc_msgSend(v30, "addObject:", v35);

        v36 = (uint64_t (*)(uint64_t *, uint64_t *))v54;
        v54 = 0;
        if (v36)
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v36);
        ++v31;
        v32 -= 8;
      }
      while (v32);
    }

    a6 = v29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", HIDWORD(v51));
  v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a6 = v37;
  if (HIDWORD(v51))
  {
    v38 = v50;
    v39 = 8 * HIDWORD(v51);
    do
    {
      v40 = [WBSBookmarkAndHistoryCompletionMatch alloc];
      v54 = (uint64_t (*)(SafariShared::BookmarkAndHistoryCompletionMatch **, SafariShared::BookmarkAndHistoryCompletionMatch **))*v38;
      *v38 = 0;
      v41 = -[WBSBookmarkAndHistoryCompletionMatch initWithBookmarkAndHistoryCompletionMatch:userInput:forQueryID:](v40, "initWithBookmarkAndHistoryCompletionMatch:userInput:forQueryID:", &v54, v15, a8);
      objc_msgSend(v37, "addObject:", v41);

      v42 = (uint64_t (*)(uint64_t *, uint64_t *))v54;
      v54 = 0;
      if (v42)
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v42);
      ++v38;
      v39 -= 8;
    }
    while (v39);
  }

  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v48, v43);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v50, v44);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v52, v45);

}

+ (BOOL)doesStringLookLikeURLHost:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "safari_containsInteriorWhitespace") & 1) != 0
    || (v4 = objc_msgSend(v3, "safari_firstLocationOfPeriodOrHomoglyphForPeriod"), v4 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = !objc_msgSend(v6, "length") || (objc_msgSend(v6, "containsString:", CFSTR("/")) & 1) == 0;

  }
  return v5;
}

+ (BOOL)_shouldPreloadTopHit:(void *)a3 forTypedString:(id)a4 withSearchParameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t (**v12)(_QWORD);
  unint64_t v13;
  __CFString *v15;
  WBSURLCompletionUserTypedString *v16;
  WBSURLCompletionUserTypedString *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;

  v7 = a4;
  v8 = a5;
  if (a3)
  {
    SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldPreload");

    if ((v10 & 1) != 0)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __85__WBSURLCompletionDatabase__shouldPreloadTopHit_forTypedString_withSearchParameters___block_invoke;
      v19[3] = &unk_1E4B404B8;
      v22 = a3;
      v11 = v7;
      v20 = v11;
      v21 = v8;
      v12 = (uint64_t (**)(_QWORD))MEMORY[0x1A8599ED0](v19);
      v13 = *((_QWORD *)a3 + 1);
      if (v13 <= 8 && ((1 << v13) & 0x1D8) != 0
        || (SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)a3),
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v16 = -[WBSURLCompletionUserTypedString initWithString:]([WBSURLCompletionUserTypedString alloc], "initWithString:", v11), v18 = SafariShared::computeURLMatchLocation(v15, (NSString *)&v16->super.isa, v17), v16, v15, v13 != v18))
      {
        LOBYTE(a3) = v12[2](v12);
      }
      else
      {
        LOBYTE(a3) = 1;
      }

    }
    else
    {
      LOBYTE(a3) = 0;
    }
  }

  return (char)a3;
}

BOOL __85__WBSURLCompletionDatabase__shouldPreloadTopHit_forTypedString_withSearchParameters___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;

  SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "matchesAutocompleteTrigger:isStrengthened:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "strengthenAutocompleteTriggerExtensionMatching")))v3 = *(float *)(*(_QWORD *)(a1 + 48) + 64) >= 1.0;
  else
    v3 = 0;

  return v3;
}

- (void)clearBookmarkMatchesCachesKeepingEmptyValues:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *v6;
  NSString *fullTextBookmarkMatchesCacheString;
  NSString *prefixBookmarkMatchesCacheString;

  v3 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v3)
      goto LABEL_3;
LABEL_8:
    fullTextBookmarkMatchesCacheString = self->_fullTextBookmarkMatchesCacheString;
    self->_fullTextBookmarkMatchesCacheString = 0;

    WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_fullTextBookmarkMatchesCache, 0);
LABEL_9:
    prefixBookmarkMatchesCacheString = self->_prefixBookmarkMatchesCacheString;
    self->_prefixBookmarkMatchesCacheString = 0;

    goto LABEL_10;
  }
  -[WBSURLCompletionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:].cold.1();
  if (!v3)
    goto LABEL_8;
LABEL_3:
  if (self->_fullTextBookmarkMatchesCache.m_size)
  {
    v6 = self->_fullTextBookmarkMatchesCacheString;
    self->_fullTextBookmarkMatchesCacheString = 0;

  }
  WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_fullTextBookmarkMatchesCache, 0);
  if (self->_prefixBookmarkMatchesCache.m_size)
    goto LABEL_9;
LABEL_10:
  WTF::Vector<objc_object  {objcproto25WBSURLCompletionMatchData}* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&self->_prefixBookmarkMatchesCache, 0);
}

- (void)clearBookmarkMatchesCaches
{
  -[WBSURLCompletionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:](self, "clearBookmarkMatchesCachesKeepingEmptyValues:", 0);
}

- (void)clearHistoryMatchesCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Clearing history matches caches", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)clearMatchesCaches
{
  -[WBSURLCompletionDatabase clearBookmarkMatchesCaches](self, "clearBookmarkMatchesCaches");
  -[WBSURLCompletionDatabase clearHistoryMatchesCache](self, "clearHistoryMatchesCache");
}

+ (BOOL)_matchIsNotURLMatchAndTitleLooksLikeURLForBookmarkAndHistoryCompletionMatch:(const void *)a3
{
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v8;
  BOOL v9;

  v3 = *((_QWORD *)a3 + 1);
  v4 = v3 > 8;
  v5 = (1 << v3) & 0x1C8;
  if (v4 || v5 == 0)
    return 0;
  SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[WBSURLCompletionDatabase doesStringLookLikeURLHost:](WBSURLCompletionDatabase, "doesStringLookLikeURLHost:", v8)&& *((_QWORD *)a3 + 2) == 0;

  return v9;
}

+ (BOOL)_matchMistookErrorTitleForPageTitleForBookmarkAndHistoryCompletionMatch:(const void *)a3
{
  unint64_t v3;
  unsigned int v4;
  void *v5;
  char v6;
  char v7;

  v3 = *((_QWORD *)a3 + 1);
  if (v3 != 4)
  {
    SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "lastVisitWasFailure") & 1) != 0)
    {
      if (v3 <= 0xA)
      {
LABEL_5:
        v4 = (0x1C8u >> v3) & 1;
LABEL_11:

        return v4;
      }
    }
    else
    {
      v6 = objc_msgSend(v5, "visitWasClientError");
      if (v3 < 0xB)
        v7 = v6;
      else
        v7 = 0;
      if ((v7 & 1) != 0)
        goto LABEL_5;
    }
    LOBYTE(v4) = 0;
    goto LABEL_11;
  }
  LOBYTE(v4) = 0;
  return v4;
}

+ (BOOL)_redirectionChainsOfCompletionMatchData:(id)a3 containURLString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;
    do
    {
      v10 = (int)v9 > 0;
      if ((int)v9 <= 0)
        break;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(a1, "_isMatchURLString:equivalentToBaseURLString:", v12, v7);

      --v9;
    }
    while ((v13 & 1) == 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_topHitFromBaseURLMatchForTopHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(BOOL *)a4 :(void *)a5 DefaultRefDerefTraits<SafariShared:(void *)a6 :(id)a7 BookmarkAndHistoryCompletionMatch>>)a3 :(id)a8 RawPtrTraits<SafariShared:(double)a9 :(id)a10 BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:
{
  uint64_t *v10;
  uint64_t *v17;
  id *v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch, WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>, WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _DWORD *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  id *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  id *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  id *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  _DWORD *v61;
  uint64_t v62;
  int v63;
  void *v64;
  _DWORD *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  _DWORD *v70;
  uint64_t v71;
  NSObject *v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  _DWORD *v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  _DWORD *v88;
  void *v89;
  _DWORD *v90;
  uint64_t v91;
  NSObject *v92;
  void *v93;
  int v94;
  int v95;
  id *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  BOOL *v101;
  void *v102;
  _DWORD *v104;
  _DWORD *v105;
  _DWORD *v106;
  _DWORD *v107;
  _DWORD *v108;
  uint8_t buf;
  char v110[31];
  uint64_t v111;

  v17 = v10;
  v111 = *MEMORY[0x1E0C80C00];
  v18 = (id *)a7;
  v19 = a8;
  v20 = a10;
  if (*(_QWORD *)a3.m_ptr && *((_DWORD *)a5 + 3) | *((_DWORD *)a6 + 3))
  {
    v101 = a4;
    objc_msgSend(v18[1], "safari_bestURLForUserTypedString");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v102
      || (objc_msgSend(v102, "safari_userVisibleString"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "localizedCaseInsensitiveContainsString:", v18[1]),
          v21,
          (v22 & 1) == 0))
    {
      *v17 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v102, "path");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "length") && !objc_msgSend(v100, "isEqualToString:", CFSTR("/"))
      || (objc_msgSend(v102, "safari_hasCharactersBeyondPath") & 1) != 0
      || objc_msgSend(v18[1], "hasSuffix:", CFSTR("?")))
    {
      *v17 = 0;
LABEL_11:

LABEL_13:
      goto LABEL_14;
    }
    v24 = (void *)MEMORY[0x1E0C99E98];
    SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safari_URLWithUserTypedString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = v26;
    if (!v26)
    {
      v38 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:].cold.1(v39, &buf, v38);
      }

      *v17 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v26, "path");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(*(_QWORD *)a3.m_ptr + 8) == 9
      && objc_msgSend(v98, "length")
      && (!objc_msgSend(v98, "isEqualToString:", CFSTR("/"))
       || objc_msgSend(v26, "safari_hasCharactersBeyondPath")))
    {
      objc_msgSend(v26, "host");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length"))
      {
        v28 = objc_msgSend(v99, "isFileURL");

        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:relativeToURL:", CFSTR("/"), v99);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "safari_originalDataAsString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = v30;
          if (objc_msgSend(v30, "safari_hasCaseInsensitivePrefix:", CFSTR("feed:"))
            && (objc_msgSend(v18[1], "safari_hasCaseInsensitivePrefix:", CFSTR("feed:")) & 1) == 0)
          {
            objc_msgSend(v30, "stringByReplacingCharactersInRange:withString:", 0, 5, CFSTR("https:"));
            v31 = objc_claimAutoreleasedReturnValue();

            v97 = (void *)v31;
          }
          if (objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled"))
          {
            v32 = (void *)objc_opt_class();
            SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a3.m_ptr);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v32) = objc_msgSend(v32, "_redirectionChainsOfCompletionMatchData:containURLString:", v33, v97);

            if ((_DWORD)v32)
            {
              SafariShared::BookmarkAndHistoryCompletionMatch::title(*(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34;
              if (!v34)
              {
                objc_msgSend(v99, "safari_userVisibleHost");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v36 = *(_DWORD **)a3.m_ptr;
              if (*(_QWORD *)a3.m_ptr)
                ++*v36;
              v108 = v36;
              objc_msgSend(a1, "_synthesizeURLMatchWithURLString:title:topHitFromMatches:historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:", v97, v35, &v108, a5, a6, v18, a9, v20);
              v37 = (uint64_t)v108;
              v108 = 0;
              if (v37)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v37);
              if (!v34)

              if (*v17)
              {
                logCompletionMatchToDebugChannel(CFSTR("Will replace topHitFromMatches with redirection baseURL"), *(SafariShared::BookmarkAndHistoryCompletionMatch **)a3.m_ptr);
LABEL_37:
                *v101 = 1;
                goto LABEL_128;
              }
              *v17 = 0;
            }
          }
          if (*((_DWORD *)a5 + 3))
          {
            v40 = 0;
            v41 = -8;
            while (1)
            {
              v93 = (void *)v41;
              v42 = *(id **)(*(_QWORD *)a5 + 8 * v40);
              if (v42)
                ++*(_DWORD *)v42;
              *v17 = (uint64_t)v42;
              SafariShared::BookmarkAndHistoryCompletionMatch::data(v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "originalURLString");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(a1, "_isMatchURLString:equivalentToBaseURLString:", v44, v97);

              if (v94)
                break;
              v45 = *v17;
              *v17 = 0;
              if (v45)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v45);
              ++v40;
              v41 = (uint64_t)v93 - 8;
              if (v40 >= *((unsigned int *)a5 + 3))
                goto LABEL_54;
            }
            if (v40)
            {
              v73 = *(_QWORD **)a5;
              v74 = (uint64_t *)(*(_QWORD *)a5 + 8 * v40);
              v75 = *v74;
              *v74 = 0;
              if (v75)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v75);
              memmove(v74, v74 + 1, (size_t)v93 + *(_QWORD *)a5 + 8 * *((unsigned int *)a5 + 3) - (_QWORD)v73);
              v76 = *((_DWORD *)a5 + 2);
              v77 = (*((_DWORD *)a5 + 3) - 1);
              *((_DWORD *)a5 + 3) = v77;
              if ((_DWORD)v77 == v76)
              {
                v78 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a5, v77 + 1, (unint64_t)v17);
                LODWORD(v77) = *((_DWORD *)a5 + 3);
                v17 = (uint64_t *)v78;
              }
              v79 = *(_QWORD **)a5;
              memmove((void *)(*(_QWORD *)a5 + 8), *(const void **)a5, 8 * v77);
              v80 = (_DWORD *)*v17;
              if (*v17)
                ++*v80;
              *v79 = v80;
              ++*((_DWORD *)a5 + 3);
            }
            goto LABEL_128;
          }
LABEL_54:
          if (*((_DWORD *)a6 + 3))
          {
            v46 = 0;
            v47 = -8;
            while (1)
            {
              v93 = (void *)v47;
              v48 = *(id **)(*(_QWORD *)a6 + 8 * v46);
              if (v48)
                ++*(_DWORD *)v48;
              *v17 = (uint64_t)v48;
              SafariShared::BookmarkAndHistoryCompletionMatch::data(v48);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "originalURLString");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = objc_msgSend(a1, "_isMatchURLString:equivalentToBaseURLString:", v50, v97);

              if (v95)
                break;
              v51 = *v17;
              *v17 = 0;
              if (v51)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v51);
              ++v46;
              v47 = (uint64_t)v93 - 8;
              if (v46 >= *((unsigned int *)a6 + 3))
                goto LABEL_62;
            }
            if (v46)
            {
              v81 = *(_QWORD **)a6;
              v82 = (uint64_t *)(*(_QWORD *)a6 + 8 * v46);
              v83 = *v82;
              *v82 = 0;
              if (v83)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v83);
              memmove(v82, v82 + 1, (size_t)v93 + *(_QWORD *)a6 + 8 * *((unsigned int *)a6 + 3) - (_QWORD)v81);
              v84 = *((_DWORD *)a6 + 2);
              v85 = (*((_DWORD *)a6 + 3) - 1);
              *((_DWORD *)a6 + 3) = v85;
              if ((_DWORD)v85 == v84)
              {
                v86 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a6, v85 + 1, (unint64_t)v17);
                LODWORD(v85) = *((_DWORD *)a6 + 3);
                v17 = (uint64_t *)v86;
              }
              v87 = *(_QWORD **)a6;
              memmove((void *)(*(_QWORD *)a6 + 8), *(const void **)a6, 8 * v85);
              v88 = (_DWORD *)*v17;
              if (*v17)
                ++*v88;
              *v87 = v88;
              ++*((_DWORD *)a6 + 3);
            }
            goto LABEL_128;
          }
LABEL_62:
          v52 = objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled");
          if (*((_DWORD *)a5 + 3))
            v53 = v52;
          else
            v53 = 0;
          if (v53 == 1)
          {
            v54 = 0;
            do
            {
              v55 = *(id **)(*(_QWORD *)a5 + 8 * v54);
              if (v55)
                ++*(_DWORD *)v55;
              v96 = v55;
              if (*(id **)a3.m_ptr == v55)
              {
                v63 = 12;
              }
              else
              {
                v56 = (void *)objc_opt_class();
                SafariShared::BookmarkAndHistoryCompletionMatch::data(v96);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v56) = objc_msgSend(v56, "_redirectionChainsOfCompletionMatchData:containURLString:", v57, v97);

                if ((_DWORD)v56)
                {
                  v58 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:].cold.4(&buf, v110, v58);
                  SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)v96);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = v59;
                  if (!v59)
                  {
                    objc_msgSend(v99, "safari_userVisibleHost");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v60 = v93;
                  }
                  v61 = *(_DWORD **)a3.m_ptr;
                  if (*(_QWORD *)a3.m_ptr)
                    ++*v61;
                  v107 = v61;
                  objc_msgSend(a1, "_synthesizeURLMatchWithURLString:title:topHitFromMatches:historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:", v97, v60, &v107, a5, a6, v18, a9, v20);
                  v62 = (uint64_t)v107;
                  v107 = 0;
                  if (v62)
                    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v62);
                  if (!v59)

                  v63 = 1;
                }
                else
                {
                  v63 = 0;
                }
              }
              if (v96)
                WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v96);
              if (v63 != 12 && v63)
                goto LABEL_128;
            }
            while (++v54 < (unint64_t)*((unsigned int *)a5 + 3));
          }
          if (objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled"))
          {
            v64 = (void *)objc_opt_class();
            v65 = *(_DWORD **)a3.m_ptr;
            if (*(_QWORD *)a3.m_ptr)
              ++*v65;
            v106 = v65;
            objc_msgSend(v99, "host");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v64, "_topHitFromMatches:isOneOfManyUnremarkableMatchesInLocalHistoryMatches:inDomain:", &v106, a5, v66);

            v68 = (uint64_t)v106;
            v106 = 0;
            if (v68)
            {
              WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v68);
              if ((v67 & 1) == 0)
                goto LABEL_118;
            }
            else if (!v67)
            {
              goto LABEL_118;
            }
            objc_msgSend(v99, "safari_userVisibleHost");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = *(_DWORD **)a3.m_ptr;
            if (*(_QWORD *)a3.m_ptr)
              ++*v70;
            v105 = v70;
            objc_msgSend(a1, "_synthesizeURLMatchWithURLString:title:topHitFromMatches:historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:", v97, v69, &v105, a5, a6, v18, a9, v20);
            v71 = (uint64_t)v105;
            v105 = 0;
            if (v71)
              WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v71);

            if (*v17)
            {
              v72 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:].cold.3();
              goto LABEL_37;
            }
            *v17 = 0;
          }
LABEL_118:
          if ((objc_msgSend(v19, "isLocalPhantomTophitDisabled") & 1) == 0)
          {
            objc_msgSend(v99, "safari_userVisibleHost");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = *(_DWORD **)a3.m_ptr;
            if (*(_QWORD *)a3.m_ptr)
              ++*v90;
            v104 = v90;
            objc_msgSend(a1, "_synthesizeURLMatchWithURLString:title:topHitFromMatches:historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:", v97, v89, &v104, a5, a6, v18, a9, v20);
            v91 = (uint64_t)v104;
            v104 = 0;
            if (v91)
              WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v91);

            if (*v17)
            {
              v92 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
                +[WBSURLCompletionDatabase _topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:].cold.2();
              goto LABEL_128;
            }
            *v17 = 0;
          }
          *v17 = 0;
LABEL_128:

          goto LABEL_43;
        }
      }
      else
      {

      }
    }
    *v17 = 0;
LABEL_43:

LABEL_44:
    goto LABEL_11;
  }
  *v17 = 0;
LABEL_14:

  return v23;
}

+ (BOOL)_isMatchURLString:(id)a3 equivalentToBaseURLString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 == objc_msgSend(v6, "length") - 1)
    v8 = objc_msgSend(v6, "hasPrefix:", v5);
  else
    v8 = objc_msgSend(v6, "isEqualToString:", v5);
  v9 = v8;

  return v9;
}

+ (BOOL)_topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a4 :(id)a5 DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>)a3 :RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch isOneOfManyUnremarkableMatchesInLocalHistoryMatches:inDomain:
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  char v16;
  int v17;

  v7 = a5;
  SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a3.m_ptr);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsBookmark");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    goto LABEL_20;
  }
  if (!*((_DWORD *)a4 + 3))
  {
LABEL_15:
    v17 = 2;
    goto LABEL_19;
  }
  v11 = 0;
  v12 = *(float *)(*(_QWORD *)a3.m_ptr + 48);
  while (1)
  {
    v13 = *(_QWORD *)(*(_QWORD *)a4 + 8 * v11);
    if (!v13)
      break;
    ++*(_DWORD *)v13;
    if (*(_QWORD *)a3.m_ptr != v13)
      goto LABEL_7;
LABEL_10:
    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v13);
LABEL_11:
    if (++v11 >= (unint64_t)*((unsigned int *)a4 + 3))
      goto LABEL_15;
  }
  if (!*(_QWORD *)a3.m_ptr)
    goto LABEL_11;
LABEL_7:
  v14 = v12 - *(float *)(v13 + 48);
  if (v14 < 0.0)
    goto LABEL_10;
  if (v14 > 0.5)
  {
    v17 = 2;
    goto LABEL_18;
  }
  SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsString:", v7);

  if ((v16 & 1) == 0)
    goto LABEL_10;
  v17 = 1;
LABEL_18:
  WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v13);
LABEL_19:
  v10 = v17 != 2;
LABEL_20:

  return v10;
}

+ (RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,)_synthesizeURLMatchWithURLString:(id)a3 title:(id)a4 topHitFromMatches:()RefPtr<SafariShared:()WTF:(WTF:(void *)a6 :(void *)a7 DefaultRefDerefTraits<SafariShared:(id)a8 :(double)a9 BookmarkAndHistoryCompletionMatch>>)a5 :(id)a10 RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch> :BookmarkAndHistoryCompletionMatch historyMatches:bookmarkMatches:typedString:timeNow:completionDataSource:
{
  _QWORD *v10;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t matched;
  id *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _DWORD *v30;
  RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch, WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>, WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> v31;
  SafariShared::BookmarkAndHistoryCompletionMatch *v32;
  uint64_t v33;
  uint64_t v34;

  v17 = v10;
  v18 = a3;
  v19 = a4;
  v20 = a8;
  v21 = a10;
  SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)a5.m_ptr);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fakeBookmarkMatchDataWithURLString:title:shouldPreload:", v18, v19, objc_msgSend(v22, "shouldPreload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23
    && (v33 = 0,
        v34 = 0,
        (matched = SafariShared::BookmarkAndHistoryCompletionMatch::computeMatchLocation(v23, v20, &v34, &v33)) != 0))
  {
    SafariShared::BookmarkAndHistoryCompletionMatch::create((uint64_t)v23, 0, matched, v33, v34, (uint64_t *)&v32, a9);
    v25 = (id *)v32;
    *v17 = v32;
    SafariShared::BookmarkAndHistoryCompletionMatch::data(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "containsBookmark"))
      a7 = a6;
    v27 = *((unsigned int *)a7 + 3);
    if ((_DWORD)v27 == *((_DWORD *)a7 + 2))
    {
      v28 = WTF::Vector<double,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)a7, v27 + 1, (unint64_t)v17);
      LODWORD(v27) = *((_DWORD *)a7 + 3);
      v17 = (_QWORD *)v28;
    }
    v29 = *(_QWORD **)a7;
    memmove((void *)(*(_QWORD *)a7 + 8), *(const void **)a7, 8 * v27);
    v30 = (_DWORD *)*v17;
    if (*v17)
      ++*v30;
    *v29 = v30;
    ++*((_DWORD *)a7 + 3);

  }
  else
  {
    *v17 = 0;
  }

  return v31;
}

- (void)_getSortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:](self, "_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:", a3, a4, a5, a6, a7, a8, a9, a10, v10);
}

- (void)_getSortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:](self, "_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:", a3, a4, a5, a6, a7, a8, a9, a10, v10);
}

- (void)_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:(void *)a3
{
  SafariShared::BookmarkAndHistoryCompletionMatch **v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  SafariShared::BookmarkAndHistoryCompletionMatch **v10;
  SafariShared::BookmarkAndHistoryCompletionMatch *v11;
  SafariShared::BookmarkAndHistoryCompletionMatch **v12;
  unint64_t v13;
  unsigned int v14;
  SafariShared::BookmarkAndHistoryCompletionMatch **v15;
  unint64_t v16;
  uint8_t buf[4];
  _DWORD v18[7];

  *(_QWORD *)&v18[5] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = 0;
  v4 = *(SafariShared::BookmarkAndHistoryCompletionMatch ***)a3;
  v5 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v5)
  {
    v6 = 8 * v5;
    do
    {
      if (objc_msgSend((id)objc_opt_class(), "_matchIsNotURLMatchAndTitleLooksLikeURLForBookmarkAndHistoryCompletionMatch:", *v4))
      {
        v7 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          SafariShared::BookmarkAndHistoryCompletionMatch::title(*v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSURLCompletionDatabase _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:].cold.1(v8, buf, v18, v7);
        }

      }
      else
      {
        v9 = HIDWORD(v16);
        if (HIDWORD(v16) == (_DWORD)v16)
        {
          WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v15, (unint64_t)v4);
        }
        else
        {
          v10 = v15;
          v11 = *v4;
          if (*v4)
            ++*(_DWORD *)v11;
          v10[v9] = v11;
          HIDWORD(v16) = v9 + 1;
        }
      }
      ++v4;
      v6 -= 8;
    }
    while (v6);
    v4 = *(SafariShared::BookmarkAndHistoryCompletionMatch ***)a3;
    v12 = v15;
    LODWORD(v5) = *((_DWORD *)a3 + 3);
    v13 = v16;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  *(_QWORD *)a3 = v12;
  v15 = v4;
  v14 = *((_DWORD *)a3 + 2);
  *((_QWORD *)a3 + 1) = v13;
  v16 = __PAIR64__(v5, v14);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v15, (void *)a2);
}

- (void)_removeMatchesThatMistookErrorTitleForPageTitleFromMatches:(void *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _DWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  unint64_t v14;

  v13 = 0;
  v14 = 0;
  v4 = *(_QWORD **)a3;
  v5 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v5)
  {
    v6 = 8 * v5;
    do
    {
      if ((objc_msgSend((id)objc_opt_class(), "_matchMistookErrorTitleForPageTitleForBookmarkAndHistoryCompletionMatch:", *v4) & 1) == 0)
      {
        v7 = HIDWORD(v14);
        if (HIDWORD(v14) == (_DWORD)v14)
        {
          WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v13, (unint64_t)v4);
        }
        else
        {
          v8 = v13;
          v9 = (_DWORD *)*v4;
          if (*v4)
            ++*v9;
          v8[v7] = v9;
          HIDWORD(v14) = v7 + 1;
        }
      }
      ++v4;
      v6 -= 8;
    }
    while (v6);
    v4 = *(_QWORD **)a3;
    v10 = v13;
    LODWORD(v5) = *((_DWORD *)a3 + 3);
    v11 = v14;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  *(_QWORD *)a3 = v10;
  v13 = v4;
  v12 = *((_DWORD *)a3 + 2);
  *((_QWORD *)a3 + 1) = v11;
  v14 = __PAIR64__(v5, v12);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, (void *)a2);
}

- (void)_getSortedMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 topHits:(void *)a5 historyMatches:(void *)a6 historyLimit:(unint64_t)a7 bookmarkMatches:(void *)a8 bookmarkLimit:(unint64_t)a9 searchParameters:(id)a10 prefixMatchesOnly:(BOOL)a11
{
  double Current;
  NSObject *v16;
  uint64_t v17;
  CFAbsoluteTime v18;
  const char *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _DWORD *v29;
  uint64_t v30;
  int v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t i;
  void *v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  _DWORD *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  _DWORD *v49;
  id v50;
  SafariShared::BookmarkAndHistoryCompletionMatch *v51;
  SafariShared::BookmarkAndHistoryCompletionMatch *v52;
  SafariShared::BookmarkAndHistoryCompletionMatch *v53;
  SafariShared::BookmarkAndHistoryCompletionMatch *v54;
  NSObject *v55;
  int v56;
  int v57;
  SafariShared::BookmarkAndHistoryCompletionMatch *v58;
  void *v59;
  uint64_t v60;
  id WeakRetained;
  void *v62;
  uint64_t v63;
  SafariShared::BookmarkAndHistoryCompletionMatch *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  int v72;
  uint64_t **v73;
  unint64_t v74;
  uint64_t **v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  SafariShared::BookmarkAndHistoryCompletionMatch *v81;
  unint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  NSObject *v94;
  void *v95;
  void *v96;
  CFAbsoluteTime v97;
  int v98;
  int v99;
  uint64_t v100;
  CFAbsoluteTime v101;
  id v103;
  id v105;
  _QWORD *v106;
  SafariShared::BookmarkAndHistoryCompletionMatch *v107;
  uint64_t v108;
  SafariShared::BookmarkAndHistoryCompletionMatch *v109;
  char v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  _BYTE buf[12];
  __int16 v116;
  _BYTE v117[10];
  int v118;
  __int16 v119;
  int v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v106 = a3;
  v105 = a4;
  v103 = a10;
  Current = CFAbsoluteTimeGetCurrent();
  v113 = 0;
  v114 = 0;
  v111 = 0;
  v112 = 0;
  if (a11)
  {
    -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:](self, "_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:", v106, v105, &v113, &v111);
    v16 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    v17 = v106[1];
    v18 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138740739;
    *(_QWORD *)&buf[4] = v17;
    v116 = 2048;
    *(double *)v117 = (v18 - Current) * 1000.0;
    *(_WORD *)&v117[8] = 1024;
    v118 = HIDWORD(v114);
    v119 = 1024;
    v120 = HIDWORD(v112);
    v19 = "Unsorted word prefix match for typed string \"%{sensitive}@\" took %.3f milliseconds, found %d history matches"
          ", %d bookmark matches";
    goto LABEL_128;
  }
  v20 = *((_DWORD *)a6 + 3);
  if (v20)
  {
    v113 = *(uint64_t **)a6;
    LODWORD(v114) = *((_DWORD *)a6 + 2);
    HIDWORD(v114) = v20;
    *(_QWORD *)a6 = 0;
    *((_QWORD *)a6 + 1) = 0;
    if (a5 && *((_DWORD *)a5 + 3))
    {
      v21 = 0;
      v22 = 0;
      do
      {
        SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(_QWORD *)a5 + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsBookmark");

        v25 = *((unsigned int *)a5 + 3);
        if ((v24 & 1) == 0)
        {
          if (v22 >= v25)
          {
            __break(0xC471u);
            JUMPOUT(0x1A3EDB668);
          }
          v26 = *(_QWORD *)a5;
          v27 = HIDWORD(v114);
          if (HIDWORD(v114) == (_DWORD)v114)
          {
            WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v113, v26 + v21);
            v25 = *((unsigned int *)a5 + 3);
          }
          else
          {
            v28 = v113;
            v29 = *(_DWORD **)(v26 + 8 * v22);
            if (v29)
              ++*v29;
            v28[v27] = (uint64_t)v29;
            HIDWORD(v114) = v27 + 1;
          }
        }
        ++v22;
        v21 += 8;
      }
      while (v22 < v25);
    }
    v30 = 0;
  }
  else
  {
    v30 = 1;
  }
  v31 = *((_DWORD *)a8 + 3);
  if (v31)
  {
    v32 = v111;
    v111 = *(uint64_t **)a8;
    *(_QWORD *)a8 = v32;
    v33 = v112;
    LODWORD(v112) = *((_DWORD *)a8 + 2);
    HIDWORD(v112) = v31;
    *((_QWORD *)a8 + 1) = v33;
    if (a5 && *((_DWORD *)a5 + 3))
    {
      v34 = 0;
      for (i = 0; i < v38; ++i)
      {
        SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(_QWORD *)a5 + 8 * i));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "containsBookmark");

        v38 = *((unsigned int *)a5 + 3);
        if (v37)
        {
          if (i >= v38)
          {
            __break(0xC471u);
            goto LABEL_132;
          }
          v39 = *(_QWORD *)a5;
          v40 = HIDWORD(v112);
          if (HIDWORD(v112) == (_DWORD)v112)
          {
            WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&>((uint64_t)&v111, v39 + v34);
            v38 = *((unsigned int *)a5 + 3);
          }
          else
          {
            v41 = v111;
            v42 = *(_DWORD **)(v39 + 8 * i);
            if (v42)
              ++*v42;
            v41[v40] = (uint64_t)v42;
            HIDWORD(v112) = v40 + 1;
          }
        }
        v34 += 8;
      }
    }
  }
  else
  {
    v30 = v30 | 2;
  }
  -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:](self, "_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:", v106, v105, &v113, &v111, v30);
  v16 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v100 = v106[1];
    v101 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 138740739;
    *(_QWORD *)&buf[4] = v100;
    v116 = 2048;
    *(double *)v117 = (v101 - Current) * 1000.0;
    *(_WORD *)&v117[8] = 1024;
    v118 = HIDWORD(v114);
    v119 = 1024;
    v120 = HIDWORD(v112);
    v19 = "Unsorted URL match for typed string \"%{sensitive}@\" took %.3f milliseconds, found %d history matches, %d bookmark matches";
LABEL_128:
    _os_log_debug_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_DEBUG, v19, buf, 0x22u);
  }
LABEL_33:

  -[WBSURLCompletionDatabase _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:](self, "_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:", &v113);
  -[WBSURLCompletionDatabase _removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:](self, "_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:", &v111);
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled"))
    -[WBSURLCompletionDatabase _removeMatchesThatMistookErrorTitleForPageTitleFromMatches:](self, "_removeMatchesThatMistookErrorTitleForPageTitleFromMatches:", &v113);
  if (a7 + 1 < HIDWORD(v114))
    v43 = a7 + 1;
  else
    v43 = HIDWORD(v114);
  *(_QWORD *)buf = compareCompletionMatches;
  if (v43)
    std::__partial_sort_impl[abi:sn180100]<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>(v113, &v113[v43], &v113[HIDWORD(v114)], (unsigned int (**)(uint64_t *, uint64_t *))buf);
  v44 = a9;
  if (a9 + 1 < HIDWORD(v112))
    v45 = a9 + 1;
  else
    v45 = HIDWORD(v112);
  *(_QWORD *)buf = compareCompletionMatches;
  if (v45)
    std::__partial_sort_impl[abi:sn180100]<std::_ClassicAlgPolicy,BOOL (*&)(WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>> const&),WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*,WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>*>(v111, &v111[v45], &v111[HIDWORD(v112)], (unsigned int (**)(uint64_t *, uint64_t *))buf);
  v46 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    if (HIDWORD(v114))
    {
      v47 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:].cold.2();
      logMatches((uint64_t)&v113);
    }
    if (HIDWORD(v112))
    {
      v48 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase _getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:].cold.1();
      logMatches((uint64_t)&v111);
    }
  }
  if (a5)
  {
    v49 = v106;
    v50 = v103;
    if (v49[8])
    {
      firstTopHitCandidate((uint64_t)&v113, v49, v50);
      v52 = v51;
      firstTopHitCandidate((uint64_t)&v111, v49, v50);
      v54 = v53;
      v55 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        logCompletionMatchToDebugChannel(CFSTR("HistoryMatch Candidate"), v52);
        logCompletionMatchToDebugChannel(CFSTR("BookmarkMatch Candidate"), v54);
      }
      if (v52)
      {
        if (v54)
        {
          v56 = objc_msgSend(MEMORY[0x1E0D89BE8], "isReflectUserIntentInSearchEnabled");
          ++*(_DWORD *)v52;
          ++*(_DWORD *)v54;
          if (v56)
            v57 = SafariShared::BookmarkAndHistoryCompletionMatch::compare(v52, v54, 0);
          else
            v57 = SafariShared::BookmarkAndHistoryCompletionMatch::compare(v52, v54, 1);
          if (v57 >= 0)
            v58 = v54;
          else
            v58 = v52;
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v54);
          WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v52);
          v54 = v58;
        }
        else
        {
          v54 = v52;
        }
      }
    }
    else
    {
      v54 = 0;
    }

    *(_QWORD *)buf = v54;
    v110 = 0;
    v59 = (void *)objc_opt_class();
    v60 = *(_QWORD *)buf;
    if (*(_QWORD *)buf)
      ++**(_DWORD **)buf;
    v108 = v60;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v62 = WeakRetained;
    if (v59)
      objc_msgSend(v59, "_topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:", &v108, &v110, &v113, &v111, v49, v50, Current, WeakRetained);
    else
      v109 = 0;

    v63 = v108;
    v108 = 0;
    if (v63)
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v63);
    if (v109)
    {
      v107 = v109;
      logCompletionMatchToDebugChannel(CFSTR("BaseURL TopHit"), v109);
      if (v110)
        *(_QWORD *)buf = 0;
    }
    else
    {
      v107 = 0;
    }
    WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)a5, 0);
    v64 = v107;
    if (v107)
    {
      v65 = *((unsigned int *)a5 + 3);
      if ((_DWORD)v65 == *((_DWORD *)a5 + 2))
      {
        WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SafariShared::BookmarkAndHistoryCompletionMatch*&>((uint64_t)a5, (_DWORD **)&v107);
      }
      else
      {
        v66 = *(_QWORD *)a5;
        ++*(_DWORD *)v107;
        *(_QWORD *)(v66 + 8 * v65) = v64;
        *((_DWORD *)a5 + 3) = v65 + 1;
      }
    }
    v67 = *(_QWORD *)buf;
    if (*(_QWORD *)buf)
    {
      v68 = *((unsigned int *)a5 + 3);
      if ((_DWORD)v68 == *((_DWORD *)a5 + 2))
      {
        WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,SafariShared::BookmarkAndHistoryCompletionMatch*&>((uint64_t)a5, (_DWORD **)buf);
      }
      else
      {
        v69 = *(_QWORD *)a5;
        ++**(_DWORD **)buf;
        *(_QWORD *)(v69 + 8 * v68) = v67;
        *((_DWORD *)a5 + 3) = v68 + 1;
      }
    }
    if (*((_DWORD *)a5 + 3))
    {
      v70 = 0;
      while (1)
      {
        SafariShared::BookmarkAndHistoryCompletionMatch::data(*(id **)(*(_QWORD *)a5 + 8 * v70));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "containsBookmark");
        v73 = v72 ? &v111 : &v113;

        v74 = *((unsigned int *)a5 + 3);
        if (v70 >= v74)
          break;
        if (v72)
          v75 = &v111;
        else
          v75 = &v113;
        v76 = *((unsigned int *)v75 + 3);
        if ((_DWORD)v76)
        {
          v77 = *v73;
          v78 = *(_QWORD *)(*(_QWORD *)a5 + 8 * v70);
          v79 = (uint64_t)(*v73 + 1);
          v80 = *((unsigned int *)v75 + 3);
          while (*v77 != v78)
          {
            ++v77;
            v79 += 8;
            if (!--v80)
              goto LABEL_105;
          }
          *v77 = 0;
          if (v78)
          {
            WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v78);
            v76 = *((unsigned int *)v75 + 3);
          }
          memmove(v77, v77 + 1, (size_t)&(*v73)[v76] - v79);
          --*((_DWORD *)v75 + 3);
          v74 = *((unsigned int *)a5 + 3);
        }
LABEL_105:
        if (++v70 >= v74)
          goto LABEL_106;
      }
      __break(0xC471u);
LABEL_132:
      JUMPOUT(0x1A3EDB660);
    }
LABEL_106:
    v81 = v109;
    v109 = 0;
    if (v81)
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)v81);
  }
  if (HIDWORD(v114) >= a7)
    v82 = a7;
  else
    v82 = HIDWORD(v114);
  if (HIDWORD(v114) > a7)
  {
    v83 = &v113[v82];
    v84 = 8 * HIDWORD(v114) - 8 * v82;
    do
    {
      v85 = *v83;
      *v83 = 0;
      if (v85)
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v85);
      ++v83;
      v84 -= 8;
    }
    while (v84);
  }
  HIDWORD(v114) = v82;
  v86 = v111;
  if (HIDWORD(v112) < a9)
    v44 = HIDWORD(v112);
  if (HIDWORD(v112) > a9)
  {
    v87 = &v111[v44];
    v88 = 8 * HIDWORD(v112) - 8 * v44;
    do
    {
      v89 = *v87;
      *v87 = 0;
      if (v89)
        WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(v89);
      ++v87;
      v88 -= 8;
    }
    while (v88);
    LODWORD(v82) = HIDWORD(v114);
    v86 = v111;
  }
  v90 = *(uint64_t **)a6;
  *(_QWORD *)a6 = v113;
  v113 = v90;
  v91 = *((_QWORD *)a6 + 1);
  *((_DWORD *)a6 + 2) = v114;
  *((_DWORD *)a6 + 3) = v82;
  v114 = v91;
  v92 = *(uint64_t **)a8;
  *(_QWORD *)a8 = v86;
  v111 = v92;
  v93 = *((_QWORD *)a8 + 1);
  *((_DWORD *)a8 + 2) = v112;
  *((_DWORD *)a8 + 3) = v44;
  v112 = v93;
  v94 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    v97 = CFAbsoluteTimeGetCurrent();
    v98 = *((_DWORD *)a6 + 3);
    v99 = *((_DWORD *)a8 + 3);
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = (v97 - Current) * 1000.0;
    v116 = 1024;
    *(_DWORD *)v117 = v98;
    *(_WORD *)&v117[4] = 1024;
    *(_DWORD *)&v117[6] = v99;
    _os_log_debug_impl(&dword_1A3D90000, v94, OS_LOG_TYPE_DEBUG, "Final sorted auto-complete query took %.3f milliseconds, found %d history matches, %d bookmark matches", buf, 0x18u);
  }

  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v111, v95);
  WTF::Vector<WTF::RefPtr<SafariShared::BookmarkAndHistoryCompletionMatch,WTF::RawPtrTraits<SafariShared::BookmarkAndHistoryCompletionMatch>,WTF::DefaultRefDerefTraits<SafariShared::BookmarkAndHistoryCompletionMatch>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v113, v96);

}

- (void)_getUnsortedFullTextMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6 dataTypes:(unsigned int)a7
{
  id *v12;
  id v13;
  NSString *v14;
  NSString *fullTextHistoryMatchesCacheString;
  NSString *v16;
  NSString *v17;
  NSString *fullTextBookmarkMatchesCacheString;
  double Current;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id WeakRetained;
  uint64_t v33;
  id v34;
  void *v35;
  id obj;
  NSString *v37;
  id v38;
  NSString *v39;
  _QWORD v40[4];
  id *v41;
  WBSURLCompletionDatabase *v42;
  void *v43;
  double v44;
  void *v45;
  char v46;
  char v47;
  _QWORD v48[4];
  id v49;
  m_capacity **v50;
  uint64_t v51;
  m_capacity **m_buffer;
  uint64_t v53;

  v12 = (id *)a3;
  v13 = a4;
  if ((a7 & 3) != 0)
  {
    v39 = self->_fullTextHistoryMatchesCacheString;
    m_buffer = 0;
    v53 = 0;
    v38 = v13;
    if ((a7 & 1) != 0)
    {
      m_buffer = self->_fullTextHistoryMatchesCache.m_buffer;
      v53 = *(_QWORD *)&self->_fullTextHistoryMatchesCache.var0;
      self->_fullTextHistoryMatchesCache.m_buffer = 0;
      *(_QWORD *)&self->_fullTextHistoryMatchesCache.var0 = 0;
      v14 = (NSString *)objc_msgSend(v12[1], "copy");
      fullTextHistoryMatchesCacheString = self->_fullTextHistoryMatchesCacheString;
      self->_fullTextHistoryMatchesCacheString = v14;

    }
    v16 = self->_fullTextBookmarkMatchesCacheString;
    v50 = 0;
    v51 = 0;
    v37 = v16;
    if ((a7 & 2) != 0)
    {
      v50 = self->_fullTextBookmarkMatchesCache.m_buffer;
      v51 = *(_QWORD *)&self->_fullTextBookmarkMatchesCache.var0;
      self->_fullTextBookmarkMatchesCache.m_buffer = 0;
      *(_QWORD *)&self->_fullTextBookmarkMatchesCache.var0 = 0;
      v17 = (NSString *)objc_msgSend(v12[1], "copy");
      fullTextBookmarkMatchesCacheString = self->_fullTextBookmarkMatchesCacheString;
      self->_fullTextBookmarkMatchesCacheString = v17;

    }
    Current = CFAbsoluteTimeGetCurrent();
    v20 = objc_msgSend(v12[1], "safari_hasPrefix:", v16);
    obj = a4;
    if (-[NSString isEqualToString:](self->_fullTextHistoryMatchesCacheStringProfileIdentifier, "isEqualToString:", v13))
    {
      v22 = objc_msgSend(v12[1], "safari_hasPrefix:", v39);
    }
    else
    {
      v22 = 0;
    }
    if ((v20 & (a7 >> 1)) == 1)
    {
      v23 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:].cold.4();
      if (HIDWORD(v51))
      {
        v24 = 0;
        do
          recordItemIfFullTextMatch(v50[v24++], v12, (uint64_t)a6, (uint64_t)&self->_fullTextBookmarkMatchesCache, Current);
        while (v24 < HIDWORD(v51));
      }
    }
    if ((a7 & v22) == 1)
    {
      v25 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:].cold.3();
      if (HIDWORD(v53))
      {
        v26 = 0;
        do
          recordItemIfFullTextMatch(m_buffer[v26++], v12, (uint64_t)a5, (uint64_t)&self->_fullTextHistoryMatchesCache, Current);
        while (v26 < HIDWORD(v53));
      }
    }
    v27 = (v20 ^ 1) & (a7 >> 1);
    v28 = a7 & (v22 ^ 1);
    if ((v27 & 1) == 0 && !v28)
      goto LABEL_29;
    if (v27 && (v29 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete(), os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)))
    {
      -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:].cold.2();
      if (v28)
      {
LABEL_26:
        v30 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[WBSURLCompletionDatabase _getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:].cold.1();
      }
    }
    else if (v28)
    {
      goto LABEL_26;
    }
    objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheStringProfileIdentifier, obj);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v33 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke;
    v48[3] = &unk_1E4B404E0;
    v34 = v31;
    v49 = v34;
    objc_msgSend(WeakRetained, "enumerateMatchDataForTypedStringHint:filterResultsUsingProfileIdentifier:options:withBlock:", v12, v38, 2, v48);
    v40[0] = v33;
    v40[1] = 3221225472;
    v40[2] = __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke_2;
    v40[3] = &unk_1E4B40508;
    v46 = v28;
    v42 = self;
    v43 = a5;
    v41 = v12;
    v44 = Current;
    v47 = v27;
    v45 = a6;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v40);

LABEL_29:
    WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v50, v21);

    WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&m_buffer, v35);
    v13 = v38;
  }

}

void __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke(uint64_t a1, void *a2)
{
  addMatchData(*(void **)(a1 + 32), a2);
}

void __147__WBSURLCompletionDatabase__getUnsortedFullTextMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches_dataTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "containsBookmark") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 73))
    {
      v4 = (uint64_t *)(a1 + 64);
      v5 = 8;
LABEL_6:
      recordItemIfFullTextMatch(v6, *(void **)(a1 + 32), *v4, *(_QWORD *)(a1 + 40) + v5, *(double *)(a1 + 56));
    }
  }
  else if (*(_BYTE *)(a1 + 72))
  {
    v4 = (uint64_t *)(a1 + 48);
    v5 = 24;
    goto LABEL_6;
  }

}

- (void)_getUnsortedPrefixMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 historyMatches:(void *)a5 bookmarkMatches:(void *)a6
{
  id *v10;
  NSString *v11;
  NSString *prefixHistoryMatchesCacheString;
  NSString *v13;
  NSString *v14;
  NSString *prefixBookmarkMatchesCacheString;
  double Current;
  int v17;
  int v18;
  char v19;
  NSObject *v20;
  unint64_t v21;
  char v22;
  char v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id WeakRetained;
  uint64_t v31;
  id v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  id v36;
  _QWORD v37[4];
  id *v38;
  WBSURLCompletionDatabase *v39;
  void *v40;
  double v41;
  void *v42;
  char v43;
  char v44;
  _QWORD v45[4];
  id v46;
  Vector<id<WBSURLCompletionMatchData>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> prefixBookmarkMatchesCache;
  Vector<id<WBSURLCompletionMatchData>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> prefixHistoryMatchesCache;

  v10 = (id *)a3;
  v36 = a4;
  v35 = self->_prefixHistoryMatchesCacheString;
  prefixHistoryMatchesCache = self->_prefixHistoryMatchesCache;
  self->_prefixHistoryMatchesCache.m_buffer = 0;
  *(_QWORD *)&self->_prefixHistoryMatchesCache.var0 = 0;
  v11 = (NSString *)objc_msgSend(v10[1], "copy");
  prefixHistoryMatchesCacheString = self->_prefixHistoryMatchesCacheString;
  self->_prefixHistoryMatchesCacheString = v11;

  v13 = self->_prefixBookmarkMatchesCacheString;
  prefixBookmarkMatchesCache = self->_prefixBookmarkMatchesCache;
  self->_prefixBookmarkMatchesCache.m_buffer = 0;
  *(_QWORD *)&self->_prefixBookmarkMatchesCache.var0 = 0;
  v34 = v13;
  v14 = (NSString *)objc_msgSend(v10[1], "copy");
  prefixBookmarkMatchesCacheString = self->_prefixBookmarkMatchesCacheString;
  self->_prefixBookmarkMatchesCacheString = v14;

  Current = CFAbsoluteTimeGetCurrent();
  v17 = objc_msgSend(v10[1], "safari_hasPrefix:", v13);
  if (-[NSString isEqualToString:](self->_prefixHistoryMatchesCacheProfileIdentifier, "isEqualToString:", v36))
  {
    v18 = objc_msgSend(v10[1], "safari_hasPrefix:", v35);
    v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (v18)
        goto LABEL_16;
LABEL_14:
      v22 = 1;
      v23 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    v19 = 0;
    if (!v17)
      goto LABEL_14;
  }
  v20 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:].cold.4();
  if (prefixBookmarkMatchesCache.m_size)
  {
    v21 = 0;
    do
      recordItemIfPrefixMatch((uint64_t)prefixBookmarkMatchesCache.m_buffer[v21++], v10, (uint64_t)a6, (uint64_t)&self->_prefixBookmarkMatchesCache, Current);
    while (v21 < prefixBookmarkMatchesCache.m_size);
    if ((v19 & 1) == 0)
    {
      v22 = v17 ^ 1;
      v23 = 1;
      if ((v17 & 1) != 0)
        goto LABEL_27;
      v19 = 0;
      goto LABEL_23;
    }
  }
  else if ((v19 & 1) == 0)
  {
    v22 = 0;
    v23 = 1;
    goto LABEL_27;
  }
LABEL_16:
  v24 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:].cold.3();
  if (prefixHistoryMatchesCache.m_size)
  {
    v26 = 0;
    do
      recordItemIfPrefixMatch((uint64_t)prefixHistoryMatchesCache.m_buffer[v26++], v10, (uint64_t)a5, (uint64_t)&self->_prefixHistoryMatchesCache, Current);
    while (v26 < prefixHistoryMatchesCache.m_size);
  }
  if ((v17 & 1) == 0)
  {
    v23 = 0;
    v19 = 1;
    v22 = 1;
LABEL_23:
    v27 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:].cold.2();
      if ((v19 & 1) != 0)
        goto LABEL_29;
    }
    else if ((v19 & 1) != 0)
    {
LABEL_29:
      objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheProfileIdentifier, a4);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v31 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke;
      v45[3] = &unk_1E4B404E0;
      v32 = v29;
      v46 = v32;
      objc_msgSend(WeakRetained, "enumerateMatchDataForTypedStringHint:filterResultsUsingProfileIdentifier:options:withBlock:", v10, v36, 1, v45);
      v37[0] = v31;
      v37[1] = 3221225472;
      v37[2] = __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke_2;
      v37[3] = &unk_1E4B40508;
      v43 = v23;
      v39 = self;
      v40 = a5;
      v38 = v10;
      v41 = Current;
      v44 = v22;
      v42 = a6;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);

      goto LABEL_30;
    }
LABEL_27:
    v28 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[WBSURLCompletionDatabase _getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:].cold.1();
    goto LABEL_29;
  }
LABEL_30:
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&prefixBookmarkMatchesCache, v25);

  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&prefixHistoryMatchesCache, v33);
}

void __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke(uint64_t a1, void *a2)
{
  addMatchData(*(void **)(a1 + 32), a2);
}

void __135__WBSURLCompletionDatabase__getUnsortedPrefixMatchesForTypedString_filterResultsUsingProfileIdentifier_historyMatches_bookmarkMatches___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "containsBookmark") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 73))
    {
      v4 = (uint64_t *)(a1 + 64);
      v5 = 40;
LABEL_6:
      recordItemIfPrefixMatch((uint64_t)v6, *(void **)(a1 + 32), *v4, *(_QWORD *)(a1 + 40) + v5, *(double *)(a1 + 56));
    }
  }
  else if (*(_BYTE *)(a1 + 72))
  {
    v4 = (uint64_t *)(a1 + 48);
    v5 = 56;
    goto LABEL_6;
  }

}

- (WBSURLCompletionDataSource)dataSource
{
  return (WBSURLCompletionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheStringProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_prefixHistoryMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_prefixBookmarkMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_fullTextHistoryMatchesCacheString, 0);
  objc_storeStrong((id *)&self->_fullTextBookmarkMatchesCacheString, 0);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_prefixHistoryMatchesCache, v3);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_prefixBookmarkMatchesCache, v4);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fullTextHistoryMatchesCache, v5);
  WTF::Vector<NSString const* {__strong},0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fullTextBookmarkMatchesCache, v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "No matches for \"%{sensitive}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Combined history and bookmark matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clearBookmarkMatchesCachesKeepingEmptyValues:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Clearing bookmark matches caches", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:(os_log_t)log shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 141558275;
  *(_QWORD *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Best match in URL autocomplete list is not a URL: %{sensitive, mask.hash}@", buf, 0x16u);

}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Adding phantom/synthesized baseURL match as TopHit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "TopHitFromMatch is not distinct enough, will replace it with synthesized baseURL match.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_topHitFromBaseURLMatchForTopHitFromMatches:(os_log_t)log shouldReplaceTopHitFromMatches:historyMatches:bookmarkMatches:typedString:searchParameters:timeNow:completionDataSource:.cold.4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Found redirection result of baseURL in History matches.", buf, 2u);
}

- (void)_removeMatchesWithTitlesThatLookLikeURLsRemovedFromMatches:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138739971;
  *a3 = a1;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Excluding title match that looks like a URL: \"%{sensitive}@\":", buf, 0xCu);

}

- (void)_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Bookmark matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getSortedMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:historyMatches:historyLimit:bookmarkMatches:bookmarkLimit:searchParameters:prefixMatchesOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "History matches for \"%{sensitive}@\":", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking full text of all history items");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking full text of all bookmarks");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using full-text cache for history items");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedFullTextMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:dataTypes:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using full-text cache for bookmarks");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking word prefixes of all history items");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is not an extension of cached string \"%{sensitive}@\", so checking word prefixes of all bookmarks");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using prefix cache for history items");
  OUTLINED_FUNCTION_2();
}

- (void)_getUnsortedPrefixMatchesForTypedString:filterResultsUsingProfileIdentifier:historyMatches:bookmarkMatches:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_16(&dword_1A3D90000, v0, v1, "typed string \"%{sensitive}@\" is an extension of cached string \"%{sensitive}@\", so using prefix cache for bookmarks");
  OUTLINED_FUNCTION_2();
}

@end
