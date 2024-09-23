@implementation WBSURLCompletionHistorySnapshot

- (WBSURLCompletionHistorySnapshot)init
{

  return 0;
}

- (WBSURLCompletionHistorySnapshot)initWithItems:()unique_ptr<std:(std::default_delete<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>>>)a3 :vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>
{
  id v4;
  WBSURLCompletionHistorySnapshot *v5;
  void **v6;
  WBSURLCompletionDatabase *v7;
  WBSURLCompletionDatabase *completionDatabase;
  dispatch_queue_t v9;
  OS_dispatch_queue *completionDatabaseQueue;
  WBSURLCompletionHistorySnapshot *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSURLCompletionHistorySnapshot;
  v4 = -[WBSURLCompletionHistorySnapshot init](&v13, sel_init);
  v5 = (WBSURLCompletionHistorySnapshot *)v4;
  if (v4)
  {
    v6 = *(void ***)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem,WTF::RawPtrTraits<SafariShared::HistoryURLCompletionItem>,WTF::DefaultRefDerefTraits<SafariShared::HistoryURLCompletionItem>>>>::reset[abi:sn180100]((void ***)v4 + 3, v6);
    v7 = objc_alloc_init(WBSURLCompletionDatabase);
    completionDatabase = v5->_completionDatabase;
    v5->_completionDatabase = v7;

    -[WBSURLCompletionDatabase setDataSource:](v5->_completionDatabase, "setDataSource:", v5);
    v9 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSnapshot", 0);
    completionDatabaseQueue = v5->_completionDatabaseQueue;
    v5->_completionDatabaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5;
  }

  return v5;
}

- (id)_matchSnapshotForCompletionMatch:(id)a3
{
  id v3;
  WBSURLCompletionMatchSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t matched;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WBSURLCompletionMatchSnapshot *v13;
  void *v14;

  v3 = a3;
  if (objc_msgSend(v3, "matchLocation") == 4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "originalURLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    matched = _SSURLCompletionMatchLocationForWBSURLCompletionMatchLocation(objc_msgSend(v3, "matchLocation"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v9, "lastVisitedTimeInterval");
      objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = objc_msgSend(v9, "visitCount");
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    v13 = [WBSURLCompletionMatchSnapshot alloc];
    objc_msgSend(v3, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSURLCompletionMatchSnapshot initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:](v13, "initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:", v7, v14, matched, objc_msgSend(v3, "isTopHit"), 0, 0, v12, v11);

  }
  return v4;
}

- (void)getBestMatchesForTypedString:(id)a3 limit:(unint64_t)a4 forQueryID:(int64_t)a5 withSearchParameters:(id)a6 filterResultsUsingProfileIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *completionDatabaseQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  int64_t v29;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  completionDatabaseQueue = self->_completionDatabaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E4B40530;
  block[4] = self;
  v24 = v14;
  v28 = a4;
  v29 = a5;
  v25 = v16;
  v26 = v15;
  v27 = v17;
  v19 = v17;
  v20 = v15;
  v21 = v16;
  v22 = v14;
  dispatch_async(completionDatabaseQueue, block);

}

void __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 16);
  v11 = 0;
  v12 = 0;
  objc_msgSend(v3, "getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:", v2, a1[6], &v12, &v11, a1[9], a1[10], a1[7]);
  v4 = v12;
  v5 = v11;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E4B3C8B8;
  v10[4] = a1[4];
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_3;
  v9[3] = &unk_1E4B3C8B8;
  v9[4] = a1[4];
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[8] + 16))();

}

id __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_matchSnapshotForCompletionMatch:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_matchSnapshotForCompletionMatch:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  SafariShared::HistoryURLCompletionItem *v5;
  WBSHistoryURLCompletionMatchData *v6;
  SafariShared::HistoryURLCompletionItem *v8;

  SafariShared::HistoryURLCompletionItem::create((SafariShared::HistoryURLCompletionItem *)a3, (NSString *)a4, (NSString *)1, &v8);
  v5 = v8;
  v6 = -[WBSHistoryURLCompletionMatchData initWithCompletionItem:]([WBSHistoryURLCompletionMatchData alloc], "initWithCompletionItem:", v8);
  if (v5)
    WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref((uint64_t)v5);
  return v6;
}

- (void).cxx_destruct
{
  std::unique_ptr<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem,WTF::RawPtrTraits<SafariShared::HistoryURLCompletionItem>,WTF::DefaultRefDerefTraits<SafariShared::HistoryURLCompletionItem>>>>::reset[abi:sn180100]((void ***)&self->_items, 0);
  objc_storeStrong((id *)&self->_completionDatabase, 0);
  objc_storeStrong((id *)&self->_completionDatabaseQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
