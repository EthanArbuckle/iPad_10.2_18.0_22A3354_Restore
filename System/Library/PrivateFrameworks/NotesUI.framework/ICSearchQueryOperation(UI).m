@implementation ICSearchQueryOperation(UI)

- (uint64_t)initWithSearchSuggestionsResponder:()UI searchString:performNLSearch:performTopHitSearch:tokens:
{
  return objc_msgSend(a1, "initWithSearchSuggestionsResponder:searchString:performNLSearch:performTopHitSearch:tokens:modernResultsOnly:", a3, a4, a5, a6, a7, 0);
}

- (void)initWithSearchSuggestionsResponder:()UI userInput:performNLSearch:performTopHitSearch:modernResultsOnly:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tokens");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(a1, "initWithSearchSuggestionsResponder:searchString:performNLSearch:performTopHitSearch:tokens:modernResultsOnly:", v13, v14, a5, a6, v15, a7);

  if (v16)
  {
    objc_msgSend(v12, "keyboardLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setKeyboardLanguage:", v17);

  }
  return v16;
}

@end
