@implementation ICNoteSearchResultsController

- (ICNoteSearchResultsController)init
{
  ICNoteSearchResultsController *v2;
  NSOperationQueue *v3;
  NSOperationQueue *queryOperationQueue;
  ICSelectorDelayer *v5;
  ICSelectorDelayer *searchDonationDelayer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNoteSearchResultsController;
  v2 = -[ICNoteSearchResultsController init](&v8, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)+[ICSearchQueryOperation newOperationQueueWithName:](ICSearchQueryOperation, "newOperationQueueWithName:", CFSTR("com.apple.notes.search-query"));
    queryOperationQueue = v2->_queryOperationQueue;
    v2->_queryOperationQueue = v3;

    v5 = (ICSelectorDelayer *)objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v2, "donateSearchIntent", 1, 1, 1.0);
    searchDonationDelayer = v2->_searchDonationDelayer;
    v2->_searchDonationDelayer = v5;

  }
  return v2;
}

- (void)cancelSearchQuery
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController queryOperationQueue](self, "queryOperationQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController searchDonationDelayer](self, "searchDonationDelayer"));
  objc_msgSend(v4, "cancelPreviousFireRequests");

  -[ICNoteSearchResultsController setDonationSearchString:](self, "setDonationSearchString:", 0);
  -[ICNoteSearchResultsController setPreviousSearchInput:](self, "setPreviousSearchInput:", 0);
  -[ICNoteSearchResultsController setPreviousAccountIdentifier:](self, "setPreviousAccountIdentifier:", 0);
}

- (BOOL)isUpToDateForInput:(id)a3 accountIdentifier:(id)a4
{
  const __CFNull *v6;
  id v7;
  void *v8;
  unsigned int v9;
  const __CFNull *v10;
  const __CFNull *v11;
  unint64_t v12;
  const __CFNull *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;

  v6 = (const __CFNull *)a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController previousSearchInput](self, "previousSearchInput"));
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    v10 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController previousAccountIdentifier](self, "previousAccountIdentifier"));
    if (kCFNull == v6)
      v11 = 0;
    else
      v11 = v6;
    v12 = v11;
    if (kCFNull == v10)
      v13 = 0;
    else
      v13 = v10;
    v14 = v13;
    v15 = (void *)v14;
    if (v12 | v14)
    {
      if (v12)
        v16 = v14 == 0;
      else
        v16 = 1;
      if (v16)
        LOBYTE(v9) = 0;
      else
        LOBYTE(v9) = objc_msgSend((id)v12, "isEqual:", v14);
    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  return v9;
}

- (void)performSearchWithInput:(id)a3 suggestionsResponder:(id)a4 accountIdentifier:(id)a5 modernResultsOnly:(BOOL)a6 updateHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  Block_layout *v25;
  id v26;
  id v27;
  id location;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!-[ICNoteSearchResultsController isUpToDateForInput:accountIdentifier:](self, "isUpToDateForInput:accountIdentifier:", v12, v14))
  {
    -[ICNoteSearchResultsController cancelSearchQuery](self, "cancelSearchQuery");
    v16 = objc_msgSend(v12, "copy");
    -[ICNoteSearchResultsController setPreviousSearchInput:](self, "setPreviousSearchInput:", v16);

    -[ICNoteSearchResultsController setPreviousAccountIdentifier:](self, "setPreviousAccountIdentifier:", v14);
    if ((objc_msgSend(v12, "isEmpty") & 1) == 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchString"));
      v18 = (void *)v17;
      v19 = &stru_1005704B8;
      if (v17)
        v19 = (__CFString *)v17;
      v20 = v19;

      -[ICNoteSearchResultsController donateSearchIntentForSearchString:](self, "donateSearchIntentForSearchString:", v20);
      v21 = objc_msgSend(objc_alloc((Class)ICSearchQueryOperation), "initWithSearchSuggestionsResponder:userInput:performNLSearch:performTopHitSearch:modernResultsOnly:", v13, v12, 1, 1, v8);
      +[ICSearchProfiler logProfilingWithMessage:searchQueryOperation:](ICSearchProfiler, "logProfilingWithMessage:searchQueryOperation:", CFSTR("ICSearchViewController startSearchQueryWithString: start"), v21);
      objc_initWeak(&location, v21);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000582A8;
      v23[3] = &unk_100551248;
      objc_copyWeak(&v27, &location);
      v25 = &stru_1005511D0;
      v24 = v14;
      v26 = v15;
      objc_msgSend(v21, "setFoundItemsHandler:", v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController queryOperationQueue](self, "queryOperationQueue"));
      objc_msgSend(v22, "addOperation:", v21);

      +[ICSearchProfiler logProfilingWithMessage:searchQueryOperation:](ICSearchProfiler, "logProfilingWithMessage:searchQueryOperation:", CFSTR("ICSearchViewController startSearchQueryWithString: end"), v21);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

    }
  }

}

- (void)donateSearchIntentForSearchString:(id)a3
{
  id v4;

  -[ICNoteSearchResultsController setDonationSearchString:](self, "setDonationSearchString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController searchDonationDelayer](self, "searchDonationDelayer"));
  objc_msgSend(v4, "requestFire");

}

- (void)donateSearchIntent
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchResultsController donationSearchString](self, "donationSearchString"));
  if (objc_msgSend(v4, "length"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICIntentsUtilities interactionForSearchString:](ICIntentsUtilities, "interactionForSearchString:", v4));
    +[ICIntentsUtilities donateInteraction:](ICIntentsUtilities, "donateInteraction:", v3);

  }
  -[ICNoteSearchResultsController setDonationSearchString:](self, "setDonationSearchString:", 0);

}

- (ICSelectorDelayer)searchDonationDelayer
{
  return self->_searchDonationDelayer;
}

- (void)setSearchDonationDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_searchDonationDelayer, a3);
}

- (NSOperationQueue)queryOperationQueue
{
  return self->_queryOperationQueue;
}

- (void)setQueryOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryOperationQueue, a3);
}

- (NSString)donationSearchString
{
  return self->_donationSearchString;
}

- (void)setDonationSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_donationSearchString, a3);
}

- (ICSearchUserInput)previousSearchInput
{
  return self->_previousSearchInput;
}

- (void)setPreviousSearchInput:(id)a3
{
  objc_storeStrong((id *)&self->_previousSearchInput, a3);
}

- (NSString)previousAccountIdentifier
{
  return self->_previousAccountIdentifier;
}

- (void)setPreviousAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousAccountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_previousSearchInput, 0);
  objc_storeStrong((id *)&self->_donationSearchString, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);
  objc_storeStrong((id *)&self->_searchDonationDelayer, 0);
}

@end
