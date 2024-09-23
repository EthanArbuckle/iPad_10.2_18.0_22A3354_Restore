@implementation UNCNContactResolverResult

void __68___UNCNContactResolverResult_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("cnContactIdentifier"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactFullname");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "un_logDigest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("cnContactFullname"));

  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSuggestedContact"), CFSTR("isSuggestedContact"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_stringForMatchType:", objc_msgSend(*(id *)(a1 + 40), "matchType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:withName:", v11, CFSTR("matchType"));

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isMatchTypeSuggested"), CFSTR("matchTypeSuggested"));
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifierOfMatchLabel");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "appendBool:withName:", v15 != 0, CFSTR("identifierOfMatchLabelExists"));

}

@end
