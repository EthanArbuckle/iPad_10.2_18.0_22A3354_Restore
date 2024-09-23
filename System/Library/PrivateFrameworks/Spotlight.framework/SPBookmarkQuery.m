@implementation SPBookmarkQuery

+ (unsigned)searchDomain
{
  return 4;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

- (BOOL)isURLQuery
{
  return 1;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void (**v43)(_QWORD, _QWORD);
  NSObject *v44;
  os_log_type_t v45;
  id v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD, _QWORD);
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery queryContext](self, "queryContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getTrimmedSearchString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    v6 = SSEnableSpotlightTopHitPersonalizedRanking();
    objc_msgSend(v3, "disabledBundles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BEB04B8];
    if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x24BEB04B8]) & 1) != 0)
    {

    }
    else
    {
      v9 = looksLikeURL();

      if ((v9 & 1) != 0)
      {
        if ((objc_msgSend(v5, "containsString:", CFSTR("://")) & 1) != 0)
        {
          v10 = v5;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@"), v5);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v10;
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15
          && (objc_msgSend(v15, "scheme"), (v17 = objc_claimAutoreleasedReturnValue()) != 0)
          && (v18 = (void *)v17,
              objc_msgSend(v16, "host"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v19))
        {
          v20 = (void *)objc_opt_new();
          v21 = (void (**)(_QWORD, _QWORD))objc_opt_new();
          v22 = (void *)objc_opt_new();
          objc_msgSend(v22, "setIconType:", 1);
          v48 = v22;
          objc_msgSend(v21, "setThumbnail:", v22);
          objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTitle:", v23);

          objc_msgSend(MEMORY[0x24BE84F38], "punchoutWithURL:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
          v49 = v13;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setPunchoutOptions:", v25);

          objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v26;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setDescriptions:", v27);

          v28 = (void *)objc_opt_new();
          objc_msgSend(v20, "setInlineCard:", v28);

          v52 = v21;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "inlineCard");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setCardSections:", v29);

          objc_msgSend(v20, "setContentURL:", v49);
          objc_msgSend(v20, "setApplicationBundleIdentifier:", v8);
          objc_msgSend(v20, "setSectionBundleIdentifier:", v8);
          objc_msgSend(v20, "setResultBundleId:", *MEMORY[0x24BEB04F8]);
          objc_msgSend(v20, "setType:", 2);
          objc_msgSend(v20, "setQueryId:", objc_msgSend(v3, "queryIdent"));
          objc_msgSend(CFSTR("userTypedURL-"), "stringByAppendingString:", v5);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setIdentifier:", v31);

          objc_msgSend(v20, "setProtectionClass:", *MEMORY[0x24BDD0CF8]);
          if ((v6 & 1) == 0)
          {
            objc_msgSend(v20, "setIsSafariTopHit:", 1);
            objc_msgSend(v20, "setTopHit:", SSSetTopHitWithReasonString());
          }
          objc_msgSend(v20, "setForceNoTopHit:", 0);
          objc_msgSend(v16, "host");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setCompletion:", v32);

          v33 = SSCompactRankingAttrsAlloc();
          SSCompactRankingAttrsUpdateValue();
          SSCompactRankingAttrsUpdateValue();
          SSCompactRankingAttrsUpdateValue();
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0228]), "initWithAttrs:", v33);
          objc_msgSend(v20, "setRankingItem:", v34);

          if (v6)
          {
            objc_msgSend(v20, "rankingItem");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setBundleIDType:", objc_msgSend(v35, "bundleIDType") | 0x80);

          }
          v36 = (void *)objc_opt_new();
          objc_msgSend(v36, "setMaxInitiallyVisibleResults:", 1);
          objc_msgSend(v36, "setBundleIdentifier:", v8);
          SSAppNameForBundleId();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setTitle:", v37);

          v51 = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setResults:", v38);

          if (v6)
            objc_msgSend(v36, "setDomain:", 1);
          v39 = objc_alloc(MEMORY[0x24BEB0260]);
          v40 = -[SPKQuery queryGroupId](self, "queryGroupId");
          v50 = v36;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v39, "initWithQueryID:sections:", v40, v41);

          objc_msgSend(v42, "setTopHitIsIn:", 1);
          -[SPKQuery responseHandler](self, "responseHandler");
          v43 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v43)[2](v43, v42);

          v13 = v49;
        }
        else
        {
          SPLogForSPLogCategoryDefault();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = *MEMORY[0x24BE84B00] ^ 1;
          if (os_log_type_enabled(v44, v45))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v13;
            _os_log_impl(&dword_2279CC000, v44, v45, "Failed to create URL from query %@", buf, 0xCu);
          }

          v46 = objc_alloc(MEMORY[0x24BEB0260]);
          v47 = -[SPKQuery queryGroupId](self, "queryGroupId");
          v20 = (void *)objc_msgSend(v46, "initWithQueryID:sections:", v47, MEMORY[0x24BDBD1A8]);
          -[SPKQuery responseHandler](self, "responseHandler");
          v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v21)[2](v21, v20);
        }

        goto LABEL_23;
      }
    }
    v11 = objc_alloc(MEMORY[0x24BEB0260]);
    v12 = -[SPKQuery queryGroupId](self, "queryGroupId");
    v13 = (void *)objc_msgSend(v11, "initWithQueryID:sections:", v12, MEMORY[0x24BDBD1A8]);
    -[SPKQuery responseHandler](self, "responseHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v13);

LABEL_23:
  }
}

@end
