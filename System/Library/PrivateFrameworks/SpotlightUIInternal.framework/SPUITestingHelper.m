@implementation SPUITestingHelper

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFinishedTableUpdate:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "finishLaunchTestIfNeeded");
}

- (void)setFinishedTableUpdate:(BOOL)a3
{
  self->_finishedTableUpdate = a3;
}

- (SPUITestingHelper)initWithSearchViewController:(id)a3
{
  id v3;
  SPUITestingHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUITestingHelper;
  v3 = a3;
  v4 = -[SPUITestingHelper init](&v6, sel_init);
  -[SPUITestingHelper setSearchViewController:](v4, "setSearchViewController:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setSearchViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)canPerformTest:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[19];

  v9[18] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("ScrollResultsFPS");
  v9[1] = CFSTR("ScrollCardsFPS");
  v9[2] = CFSTR("QuerySearchButtonToResultsLatency");
  v9[3] = CFSTR("QuerySearchButtonToResultsLatencyNoParsec");
  v9[4] = CFSTR("QueryToSuggestionsMixedQueries");
  v9[5] = CFSTR("QueryToSuggestionsMixedQueriesNoParsec");
  v9[6] = CFSTR("QueryToTopHitsLatency");
  v9[7] = CFSTR("QueryToLocalSuggestionLatency");
  v3 = (void *)MEMORY[0x24BDBCF20];
  v9[8] = CFSTR("QueryToParsecSuggestionLatency");
  v9[9] = CFSTR("ParsecdLaunchTime");
  v9[10] = CFSTR("SpotlightExtendedLaunch");
  v9[11] = CFSTR("MemoryTestMapsCards");
  v9[12] = CFSTR("MemoryTestContactsCards");
  v9[13] = CFSTR("MemoryTestMapsCardsAtDesk");
  v9[14] = CFSTR("MapsCardsPushAndScrollTests");
  v9[15] = CFSTR("CardPushTest");
  v9[16] = CFSTR("MapsPushTest");
  v9[17] = CFSTR("EntityScrollTest");
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v7, "containsObject:", v5);
  return (char)v3;
}

- (void)performTest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  SPUITestingHelper *v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const __CFString *v29;
  SPUITestingHelper *v30;
  id v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("SpotlightExtendedLaunch")))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BEBE580];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke;
    v43[3] = &unk_24F9D6430;
    v43[4] = self;
    v15 = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v12, 0, v13, v43);

    -[SPUITestingHelper searchViewController](self, "searchViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "proactiveResultsTestingObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v14;
    v42[1] = 3221225472;
    v42[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_2;
    v42[3] = &unk_24F9D5CC8;
    v42[4] = self;
    objc_msgSend(v17, "setViewDidUpdateHandler:", v42);

  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ScrollResultsFPS")))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SearchText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITestingHelper scrollMainResultsForTest:forQuery:queryKind:completion:](self, "scrollMainResultsForTest:forQuery:queryKind:completion:", v8, v18, +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind"), v10);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ScrollCardsFPS")))
  {
    -[SPUITestingHelper performCardScrollTest:queryKind:completion:](self, "performCardScrollTest:queryKind:completion:", v8, +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind"), v10);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QuerySearchButtonToResultsLatency")))
  {
    v19 = +[SPUISearchHeader committedSearchQueryKind](SPUISearchHeader, "committedSearchQueryKind");
    v20 = self;
    v21 = v8;
    v22 = v9;
    v23 = 22;
LABEL_17:
    -[SPUITestingHelper searchManyStringsForTestName:options:event:queryKind:completion:](v20, "searchManyStringsForTestName:options:event:queryKind:completion:", v21, v22, v23, v19, v10);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QuerySearchButtonToResultsLatencyNoParsec")))
  {
    SPSetInternetDomainsEnabled();
    v24 = +[SPUISearchHeader committedSearchQueryKind](SPUISearchHeader, "committedSearchQueryKind");
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_3;
    v40[3] = &unk_24F9D5E10;
    v41 = v10;
    -[SPUITestingHelper searchManyStringsForTestName:options:event:queryKind:completion:](self, "searchManyStringsForTestName:options:event:queryKind:completion:", v8, v9, 22, v24, v40);
    v25 = v41;
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryToSuggestionsMixedQueries")))
    goto LABEL_16;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryToSuggestionsMixedQueriesNoParsec")))
  {
    SPSetInternetDomainsEnabled();
    v26 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_4;
    v38[3] = &unk_24F9D5E10;
    v39 = v10;
    -[SPUITestingHelper searchManyStringsForTestName:options:event:queryKind:completion:](self, "searchManyStringsForTestName:options:event:queryKind:completion:", v8, v9, 1, v26, v38);
    v25 = v39;
    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryToTopHitsLatency")))
  {
LABEL_16:
    v19 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v20 = self;
    v21 = v8;
    v22 = v9;
    v23 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryToLocalSuggestionLatency")))
  {
    SPSetInternetDomainsEnabled();
    v27 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_5;
    v36[3] = &unk_24F9D5E10;
    v37 = v10;
    -[SPUITestingHelper searchManyStringsForTestName:options:event:queryKind:completion:](self, "searchManyStringsForTestName:options:event:queryKind:completion:", v8, v9, 1, v27, v36);
    v25 = v37;
    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryToParsecSuggestionLatency")))
  {
LABEL_25:
    v19 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v20 = self;
    v21 = v8;
    v22 = v9;
    v23 = 8;
    goto LABEL_17;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("ParsecdLaunchTime")))
  {
    PS_PSKillProcessNamed();
    goto LABEL_25;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MemoryTestMapsCards")))
  {
    v28 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v35 = v10;
    v29 = CFSTR("MAPS");
    v30 = self;
    v31 = v8;
    v32 = v9;
    v33 = 1;
LABEL_30:
    -[SPUITestingHelper performPushPopCardsOnTest:options:needsCard:sectionHeader:atDesk:queryKind:completion:](v30, "performPushPopCardsOnTest:options:needsCard:sectionHeader:atDesk:queryKind:completion:", v31, v32, v33, v29, 0, v28, v35);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MemoryTestContactsCards")))
  {
    v28 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
    v35 = v10;
    v29 = CFSTR("CONTACTS");
    v30 = self;
    v31 = v8;
    v32 = v9;
    v33 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MemoryTestMapsCardsAtDesk")))
  {
    -[SPUITestingHelper performPushPopCardsOnTest:options:needsCard:sectionHeader:atDesk:queryKind:completion:](self, "performPushPopCardsOnTest:options:needsCard:sectionHeader:atDesk:queryKind:completion:", v8, v9, 1, CFSTR("MAPS"), 1, +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind"), v10);
    goto LABEL_21;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("MapsCardsPushAndScrollTests")))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("queryString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITestingHelper testMapsCardsPushAndScrollForTestName:string:queryKind:completion:](self, "testMapsCardsPushAndScrollForTestName:string:queryKind:completion:", v8, v18, +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind"), v10);
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("CardPushTest")))
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("queryString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("SPORTS");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("MapsPushTest")))
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("EntityScrollTest")))
          goto LABEL_21;
        objc_msgSend(v9, "objectForKey:", CFSTR("queryString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUITestingHelper scrollEntityForTest:forQuery:completion:](self, "scrollEntityForTest:forQuery:completion:", v8, v18, v10);
        goto LABEL_5;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("queryString"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("MAPS");
    }
    -[SPUITestingHelper runPushTest:sectionHeader:searchString:completion:](self, "runPushTest:sectionHeader:searchString:completion:", v8, v34, v18, v10);
  }
LABEL_5:

LABEL_21:
}

- (void)finishLaunchTestIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SPUITestingHelper finishedKeyboardLaunch](self, "finishedKeyboardLaunch"))
  {
    if (-[SPUITestingHelper finishedTableUpdate](self, "finishedTableUpdate"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);

      -[SPUITestingHelper searchViewController](self, "searchViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "proactiveResultsTestingObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setViewDidUpdateHandler:", 0);

      objc_msgSend((id)*MEMORY[0x24BEBDF78], "_performBlockAfterCATransactionCommits:", &__block_literal_global_4);
    }
  }
}

- (BOOL)finishedKeyboardLaunch
{
  return self->_finishedKeyboardLaunch;
}

- (BOOL)finishedTableUpdate
{
  return self->_finishedTableUpdate;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFinishedKeyboardLaunch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "finishLaunchTestIfNeeded");
}

- (void)setFinishedKeyboardLaunch:(BOOL)a3
{
  self->_finishedKeyboardLaunch = a3;
}

void __45__SPUITestingHelper_finishLaunchTestIfNeeded__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)*MEMORY[0x24BEBDF78];
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "_launchTestName");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "finishedTest:", v1);

}

- (UIApplication)activeApp
{
  return (UIApplication *)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  SPSetInternetDomainsEnabled();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  SPSetInternetDomainsEnabled();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  SPSetInternetDomainsEnabled();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)runPushTest:(id)a3 sectionHeader:(id)a4 searchString:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = +[SPUISearchHeader asYouTypeSearchQueryKind](SPUISearchHeader, "asYouTypeSearchQueryKind");
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke;
  v21[3] = &unk_24F9D6078;
  v21[4] = self;
  v22 = v10;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke_2;
  v18[3] = &unk_24F9D6458;
  v18[4] = self;
  v19 = v22;
  v20 = v11;
  v16 = v11;
  v17 = v22;
  -[SPUITestingHelper searchForSectionHeader:testName:forSearchString:queryKind:startPushHandler:finishHandler:](self, "searchForSectionHeader:testName:forSearchString:queryKind:startPushHandler:finishHandler:", v13, v17, v12, v14, v21, v18);

}

void __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedTest:", *(_QWORD *)(a1 + 40));

}

uint64_t __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedTest:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)testMapsCardsPushAndScrollForTestName:(id)a3 string:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
  -[SPUITestingHelper scrollForSectionHeader:forSearchString:testName:queryKind:completion:](self, "scrollForSectionHeader:forSearchString:testName:queryKind:completion:", CFSTR("MAPS"), a4, a3, a5, a6);
}

- (void)performPushPopCardsOnTest:(id)a3 options:(id)a4 needsCard:(BOOL)a5 sectionHeader:(id)a6 atDesk:(BOOL)a7 queryKind:(unint64_t)a8 completion:(id)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  BOOL v27;

  v12 = a5;
  v15 = a3;
  v16 = a9;
  v17 = a6;
  objc_msgSend(a4, "objectForKey:", CFSTR("queryStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  -[SPUITestingHelper activeApp](self, "activeApp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startedTest:", v15);

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __107__SPUITestingHelper_performPushPopCardsOnTest_options_needsCard_sectionHeader_atDesk_queryKind_completion___block_invoke;
  v24[3] = &unk_24F9D6480;
  v27 = a7;
  v24[4] = self;
  v25 = v15;
  v26 = v16;
  v22 = v16;
  v23 = v15;
  -[SPUITestingHelper searchStrings:andOpenResultsUnderSection:testName:needsCard:queryKind:completion:](self, "searchStrings:andOpenResultsUnderSection:testName:needsCard:queryKind:completion:", v20, v17, v23, v12, a8, v24);

}

uint64_t __107__SPUITestingHelper_performPushPopCardsOnTest_options_needsCard_sectionHeader_atDesk_queryKind_completion___block_invoke(uint64_t a1)
{
  pid_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  rusage_info_t buffer[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56))
  {
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)buffer = 0u;
    v12 = 0u;
    v2 = getpid();
    proc_pid_rusage(v2, 4, buffer);
    if (*((_QWORD *)&v15 + 1) >= 0x2FAF081uLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "activeApp");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Spotlight memory is above inactive jetsam limit current footprint : %llu, inactive limit: %f"), *((_QWORD *)&v15 + 1), 0x4187D78400000000, buffer[0], buffer[1], v12, v13, v14, (_QWORD)v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "failedTest:withFailure:", v4, v5);

    }
    if ((unint64_t)v26 >= 0x11E1A301)
    {
      objc_msgSend(*(id *)(a1 + 32), "activeApp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Spotlight memory went above active jetsam limit : %llu max allowed: %f"), (_QWORD)v26, 0x41B1E1A300000000);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "failedTest:withFailure:", v7, v8);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishedTest:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performCardScrollTest:(id)a3 queryKind:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  -[SPUITestingHelper activeApp](self, "activeApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startedTest:", v8);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__SPUITestingHelper_performCardScrollTest_queryKind_completion___block_invoke;
  v13[3] = &unk_24F9D6458;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[SPUITestingHelper scrollForSectionHeader:forSearchString:testName:queryKind:completion:](self, "scrollForSectionHeader:forSearchString:testName:queryKind:completion:", CFSTR("Sports"), CFSTR("sf giants roster"), v12, a4, v13);

}

uint64_t __64__SPUITestingHelper_performCardScrollTest_queryKind_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedTest:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)searchStrings:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  dispatch_time_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  BOOL v27;
  _QWORD block[4];
  id v29;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "lastObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeLastObject");
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke_2;
    v21[3] = &unk_24F9D64C8;
    v21[4] = self;
    v22 = v14;
    v23 = v15;
    v27 = v10;
    v25 = v17;
    v26 = a7;
    v24 = v16;
    v19 = v17;
    -[SPUITestingHelper searchString:andOpenResultsUnderSection:testName:needsCard:queryKind:completion:](self, "searchString:andOpenResultsUnderSection:testName:needsCard:queryKind:completion:", v18, v23, v24, v10, a7, v21);

  }
  else
  {
    v20 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke;
    block[3] = &unk_24F9D5E10;
    v29 = v17;
    v18 = v17;
    dispatch_after(v20, MEMORY[0x24BDAC9B8], block);
    v19 = v29;
  }

}

uint64_t __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "searchStrings:andOpenResultsUnderSection:testName:needsCard:queryKind:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

- (void)searchString:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SPUITestingHelper *v21;
  id v22;
  BOOL v23;

  v13 = a4;
  v14 = a8;
  v15 = a3;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performTestSearchWithQuery:event:queryKind:", v15, 22, a7);

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __101__SPUITestingHelper_searchString_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke;
  v19[3] = &unk_24F9D6480;
  v23 = a6;
  v20 = v13;
  v21 = self;
  v22 = v14;
  v17 = v14;
  v18 = v13;
  -[SPUITestingHelper searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:](self, "searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:", v19);

}

void __101__SPUITestingHelper_searchString_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "searchViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResultsTestingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUITestingHelper indexPathsOfRowsForSectionTitle:needsCard:forTestingViewController:](SPUITestingHelper, "indexPathsOfRowsForSectionTitle:needsCard:forTestingViewController:", v3, v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "tapIndexsPathsAndPopViewControllersAfter2Seconds:completion:", v7, *(_QWORD *)(a1 + 48));
}

- (void)tapIndexsPathsAndPopViewControllersAfter2Seconds:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");
    -[SPUITestingHelper searchViewController](self, "searchViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchResultsTestingObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tapAtIndexPath:", v8);

    v11 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__SPUITestingHelper_tapIndexsPathsAndPopViewControllersAfter2Seconds_completion___block_invoke;
    block[3] = &unk_24F9D6458;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v7[2](v7);
  }

}

uint64_t __81__SPUITestingHelper_tapIndexsPathsAndPopViewControllersAfter2Seconds_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x22E32561C]();
  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 0);

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", *MEMORY[0x24BEBDFA8], 0);

  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "tapIndexsPathsAndPopViewControllersAfter2Seconds:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)resultViewController:(id)a3 finishedGettingAllResults:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a3;
  v6 = a4;
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke;
  v8[3] = &unk_24F9D6518;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v5, "setDidFinishGettingAllResultsHandler:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDidFinishGettingAllResultsHandler:", 0);

  if (a2)
  {
    v6 = objc_loadWeakRetained(v4);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_2;
    v7[3] = &unk_24F9D64F0;
    objc_copyWeak(&v9, v4);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "setViewDidUpdateHandler:", v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setViewDidUpdateHandler:", 0);

  v3 = (void *)*MEMORY[0x24BEBDF78];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_3;
  v4[3] = &unk_24F9D5E10;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

uint64_t __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchResultsTestingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITestingHelper resultViewController:finishedGettingAllResults:](self, "resultViewController:finishedGettingAllResults:", v5, v4);

}

- (void)searchForSectionHeader:(id)a3 testName:(id)a4 forSearchString:(id)a5 queryKind:(unint64_t)a6 startPushHandler:(id)a7 finishHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  SPUITestingHelper *v26;
  id v27;
  id v28;
  id v29;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a5;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "performTestSearchWithQuery:event:queryKind:", v18, 22, a6);

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke;
  v24[3] = &unk_24F9D65B8;
  v25 = v14;
  v26 = self;
  v28 = v16;
  v29 = v17;
  v27 = v15;
  v20 = v15;
  v21 = v17;
  v22 = v16;
  v23 = v14;
  -[SPUITestingHelper searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:](self, "searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:", v24);

}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD);
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  id v26;
  id v27;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "searchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResultsTestingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUITestingHelper indexPathsOfRowsForSectionTitle:needsCard:forTestingViewController:](SPUITestingHelper, "indexPathsOfRowsForSectionTitle:needsCard:forTestingViewController:", v2, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "searchViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchResultsTestingObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tapAtIndexPath:", v6);

    objc_msgSend(*(id *)(a1 + 40), "searchViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchResultsTestingObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "testingTableViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_2;
    aBlock[3] = &unk_24F9D6568;
    v16 = *(id *)(a1 + 56);
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v26 = v16;
    v27 = *(id *)(a1 + 64);
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_6;
    v20[3] = &unk_24F9D6590;
    v20[4] = &v21;
    objc_msgSend(v14, "iterateIndexPaths:", v20);
    if (v22[3])
    {
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_7;
      v18[3] = &unk_24F9D5E10;
      v19 = v17;
      objc_msgSend(v14, "setViewDidUpdateHandler:", v18);

    }
    else
    {
      v17[2](v17);
    }
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    objc_msgSend(v7, "activeApp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "failedTest:withFailure:", *(_QWORD *)(a1 + 48), CFSTR("Couldnt find suitable section in results"));
  }

}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_3;
  v4[3] = &unk_24F9D6540;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_4;
  v3[3] = &unk_24F9D5E10;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "installCACommitCompletionBlock:", v3);

}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_5;
  block[3] = &unk_24F9D5E10;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], block);

}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_6(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scrollForSectionHeader:(id)a3 forSearchString:(id)a4 testName:(id)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v12 = a5;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke;
  v16[3] = &unk_24F9D6458;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[SPUITestingHelper searchForSectionHeader:testName:forSearchString:queryKind:startPushHandler:finishHandler:](self, "searchForSectionHeader:testName:forSearchString:queryKind:startPushHandler:finishHandler:", a3, v15, a4, a6, 0, v16);

}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResultsTestingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "testingTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dispatch_time(0, 100000000);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_2;
    v10[3] = &unk_24F9D6608;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v6;
    v13 = *(id *)(a1 + 48);
    v9 = v6;
    dispatch_after(v7, MEMORY[0x24BDAC9B8], v10);

  }
}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedTest:", *(_QWORD *)(a1 + 40));

  objc_initWeak(&location, *(id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedSubTest:forTest:", CFSTR("FirstScroll"), *(_QWORD *)(a1 + 40));

  v4 = objc_loadWeakRetained(&location);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_3;
  v12[3] = &unk_24F9D6078;
  v6 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_4;
  v8[3] = &unk_24F9D65E0;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_copyWeak(&v11, &location);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v4, "performScrollTestWithHandlerForFirstScrollCompletion:completion:", v12, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("FirstScroll"), *(_QWORD *)(a1 + 40));

}

uint64_t __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishedTest:", *(_QWORD *)(a1 + 40));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", 0);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)indexPathsOfRowsForSectionTitle:(id)a3 needsCard:(BOOL)a4 forTestingViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = (id)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__SPUITestingHelper_indexPathsOfRowsForSectionTitle_needsCard_forTestingViewController___block_invoke;
  v12[3] = &unk_24F9D6630;
  v9 = v7;
  v15 = a4;
  v13 = v9;
  v14 = &v16;
  objc_msgSend(v8, "iterateIndexPaths:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __88__SPUITestingHelper_indexPathsOfRowsForSectionTitle_needsCard_forTestingViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;

  v16 = a4;
  v8 = a5;
  objc_msgSend(a2, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
LABEL_6:
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
      goto LABEL_7;
    }
    objc_msgSend(v16, "nextCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

      goto LABEL_6;
    }
    objc_msgSend(v16, "command");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
  }
LABEL_7:

}

- (void)scrollEntityForTest:(id)a3 forQuery:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performTestSearchWithQuery:event:queryKind:", v9, 1, 2);

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke;
  v15[3] = &unk_24F9D6658;
  v19 = v20;
  v15[4] = self;
  v12 = v8;
  v16 = v12;
  v13 = v10;
  v18 = v13;
  v14 = v9;
  v17 = v14;
  -[SPUITestingHelper searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:](self, "searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:", v15);

  _Block_object_dispose(v20, 8);
}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    objc_msgSend(*(id *)(a1 + 32), "searchViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "searchResultsTestingObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_2;
    v15[3] = &unk_24F9D6590;
    v15[4] = &v16;
    objc_msgSend(v3, "iterateIndexPaths:", v15);

    if (v17[5])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "searchViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchResultsTestingObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tapAtIndexPath:", v17[5]);

      v7 = dispatch_time(0, 100000000);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_3;
      block[3] = &unk_24F9D6458;
      v8 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v13 = v8;
      v14 = *(id *)(a1 + 56);
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "activeApp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No entity results for %@"), *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failedTest:withFailure:", v10, v11);

    }
    _Block_object_dispose(&v16, 8);

  }
}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v8;
  char isKindOfClass;
  id v10;

  v10 = a5;
  objc_msgSend(a4, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a5);

}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_4;
  v7[3] = &unk_24F9D6608;
  v5 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v8, "resultViewController:finishedGettingAllResults:", v6, v7);

}

uint64_t __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performScrollOnResultsView:testName:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)scrollMainResultsForTest:(id)a3 forQuery:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v10 = a3;
  v11 = a6;
  v12 = a4;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performTestSearchWithQuery:event:queryKind:", v12, 22, a5);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__SPUITestingHelper_scrollMainResultsForTest_forQuery_queryKind_completion___block_invoke;
  v16[3] = &unk_24F9D6458;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v14 = v11;
  v15 = v10;
  -[SPUITestingHelper searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:](self, "searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:", v16);

}

uint64_t __76__SPUITestingHelper_scrollMainResultsForTest_forQuery_queryKind_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performScrollOnSearchViewWithTestName:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)performScrollOnResultsView:(id)a3 testName:(id)a4 completion:(id)a5
{
  objc_msgSend(a3, "performRecapScrollTestWithTestName:completion:", a4, a5);
}

- (void)performScrollOnSearchViewWithTestName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchResultsTestingObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITestingHelper performScrollOnResultsView:testName:completion:](self, "performScrollOnResultsView:testName:completion:", v8, v7, v6);

}

- (void)searchManyStringsForTestName:(id)a3 options:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v12 = a7;
  v13 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("queryStrings"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITestingHelper activeApp](self, "activeApp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startedTest:", v13);

  v16 = (void *)objc_msgSend(v14, "mutableCopy");
  -[SPUITestingHelper searchForString:testName:event:queryKind:completion:](self, "searchForString:testName:event:queryKind:completion:", v16, v13, a5, a6, v12);

}

- (void)searchForString:(id)a3 testName:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SPUIPPTTypingHelper *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  unint64_t v37;
  SPUIPPTTypingHelper *v38;
  void *v39;
  unint64_t v40;
  id v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  unint64_t v50;
  unint64_t v51;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a7;
  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchResultsTestingObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDidFinishGettingAllResultsHandler:", 0);

  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchResultsTestingObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setViewWillUpdateHandler:", 0);

  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "searchResultsTestingObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setViewDidUpdateHandler:", 0);

  if (objc_msgSend(v12, "count"))
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Query To Draw Latency:%@"), v22);
    v42 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Query To First Result:%@"), v25);
    v40 = a5;
    v26 = v14;
    v27 = a6;
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Query Latency:%@"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = [SPUIPPTTypingHelper alloc];
    objc_msgSend(v12, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITestingHelper searchViewController](self, "searchViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke;
    v43[3] = &unk_24F9D66F8;
    v43[4] = self;
    v44 = v31;
    v45 = v42;
    v46 = v28;
    v50 = v40;
    v51 = v27;
    v47 = v12;
    v48 = v23;
    v49 = v26;
    v41 = v23;
    v35 = v28;
    v36 = v31;
    v37 = v27;
    v14 = (void (**)(_QWORD))v26;
    v38 = -[SPUIPPTTypingHelper initWithString:viewController:queryKind:completion:](v32, "initWithString:viewController:queryKind:completion:", v33, v34, v37, v43);
    -[SPUITestingHelper setTypingHelper:](self, "setTypingHelper:", v38);

    v13 = v42;
  }
  else
  {
    -[SPUITestingHelper activeApp](self, "activeApp");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "finishedTest:", v13);

    if (v14)
      v14[2](v14);
  }

}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  __int128 v40;
  _QWORD aBlock[5];
  id v42;
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[3];
  char v51;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performTestSearchWithQuery:event:queryKind:", v5, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  aBlock[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_2;
  aBlock[3] = &unk_24F9D6680;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v45 = v50;
  aBlock[4] = v6;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  v42 = v7;
  v43 = *(id *)(a1 + 48);
  v44 = *(id *)(a1 + 72);
  v9 = _Block_copy(aBlock);
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_3;
  v31[3] = &unk_24F9D66A8;
  v10 = *(_QWORD *)(a1 + 32);
  v37 = v48;
  v31[4] = v10;
  v32 = *(id *)(a1 + 56);
  v33 = *(id *)(a1 + 48);
  v34 = *(id *)(a1 + 72);
  v38 = v50;
  v39 = v46;
  v35 = *(id *)(a1 + 64);
  v40 = *(_OWORD *)(a1 + 88);
  v36 = *(id *)(a1 + 80);
  v11 = _Block_copy(v31);
  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchResultsTestingObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_4;
  v27[3] = &unk_24F9D66D0;
  v14 = *(_QWORD *)(a1 + 32);
  v30 = v50;
  v27[4] = v14;
  v15 = v9;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  objc_msgSend(v13, "setDidFinishGettingAllResultsHandler:", v27);

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchResultsTestingObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_5;
  v25[3] = &unk_24F9D5E10;
  v19 = v15;
  v26 = v19;
  objc_msgSend(v18, "setViewWillUpdateHandler:", v25);

  objc_msgSend(*(id *)(a1 + 32), "searchViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchResultsTestingObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_6;
  v23[3] = &unk_24F9D6540;
  v23[4] = *(_QWORD *)(a1 + 32);
  v22 = v16;
  v24 = v22;
  objc_msgSend(v21, "setViewDidUpdateHandler:", v23);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "activeApp");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishedSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "activeApp");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishedSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishedSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 64), "removeLastObject");
      objc_msgSend(*(id *)(a1 + 32), "searchForString:testName:event:queryKind:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 72));
    }
  }
}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_4(uint64_t result, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = 1;
  if ((a2 & 1) == 0)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "searchViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchResultsTestingObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setViewWillUpdateHandler:", 0);

    objc_msgSend(*(id *)(v2 + 32), "searchViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchResultsTestingObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewDidUpdateHandler:", 0);

    (*(void (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 48) + 16))();
  }
  return result;
}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_7;
  v3[3] = &unk_24F9D5E10;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "installCACommitCompletionBlock:", v3);

}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDefaultsForSearchVCWithqueryType:(unint64_t)a3
{
  void *v5;
  id v6;

  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performTestSearchWithQuery:event:queryKind:", &stru_24F9D6A70, 1, a3);

  -[SPUITestingHelper searchViewController](self, "searchViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternetOverrideToDisable:", 0);

}

- (SPUIPPTTypingHelper)typingHelper
{
  return (SPUIPPTTypingHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTypingHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingHelper, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end
