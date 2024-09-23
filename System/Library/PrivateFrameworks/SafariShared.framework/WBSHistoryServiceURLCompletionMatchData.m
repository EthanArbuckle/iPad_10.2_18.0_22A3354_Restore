@implementation WBSHistoryServiceURLCompletionMatchData

- (WBSHistoryServiceURLCompletionMatchData)init
{

  return 0;
}

- (WBSHistoryServiceURLCompletionMatchData)initWithLastVisitWasFailure:(BOOL)a3 visitWasFromThisDevice:(BOOL)a4 visitWasClientError:(BOOL)a5
{
  WBSHistoryServiceURLCompletionMatchData *v8;
  _QWORD *p_var0;
  _HistoryStreamedMatchData *value;
  WBSHistoryServiceURLCompletionMatchData *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryServiceURLCompletionMatchData;
  v8 = -[WBSHistoryServiceURLCompletionMatchData init](&v13, sel_init);
  if (v8)
  {
    p_var0 = operator new(0x38uLL);
    p_var0[6] = 0;
    *((_OWORD *)p_var0 + 1) = 0u;
    *((_OWORD *)p_var0 + 2) = 0u;
    *(_OWORD *)p_var0 = 0u;
    value = v8->_streamData.__ptr_.__value_;
    v8->_streamData.__ptr_.__value_ = (_HistoryStreamedMatchData *)p_var0;
    if (value)
    {
      MEMORY[0x1A85998AC](value, 0x10C0C40CCADEA1DLL);
      p_var0 = &v8->_streamData.__ptr_.__value_->var0;
    }
    *p_var0 = 0x3800000006;
    *((_BYTE *)p_var0 + 48) = a3;
    *((_BYTE *)p_var0 + 49) = a4;
    *((_BYTE *)p_var0 + 50) = a5;
    v11 = v8;
  }

  return v8;
}

- (WBSHistoryServiceURLCompletionMatchData)initWithStreamData:(void *)a3 entries:(id)a4
{
  id v6;
  WBSHistoryServiceURLCompletionMatchData *v7;
  uint64_t v8;
  NSArray *entries;
  _HistoryStreamedMatchData *v10;
  _HistoryStreamedMatchData *value;
  WBSHistoryServiceURLCompletionMatchData *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceURLCompletionMatchData;
  v7 = -[WBSHistoryServiceURLCompletionMatchData init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    entries = v7->_entries;
    v7->_entries = (NSArray *)v8;

    v10 = *(_HistoryStreamedMatchData **)a3;
    *(_QWORD *)a3 = 0;
    value = v7->_streamData.__ptr_.__value_;
    v7->_streamData.__ptr_.__value_ = v10;
    if (value)
      MEMORY[0x1A85998AC](value, 0x10C0C40CCADEA1DLL);
    v12 = v7;
  }

  return v7;
}

- (_HistoryStreamedMatchData)streamData
{
  return self->_streamData.__ptr_.__value_;
}

- (BOOL)containsBookmark
{
  return 0;
}

- (BOOL)lastVisitWasFailure
{
  return self->_streamData.__ptr_.__value_->var6 != 0;
}

- (double)lastVisitedTimeInterval
{
  return self->_streamData.__ptr_.__value_->var1;
}

- (void)setLastVisitedTimeInterval:(double)a3
{
  self->_streamData.__ptr_.__value_->var1 = a3;
}

- (int64_t)visitCount
{
  return self->_streamData.__ptr_.__value_->var4;
}

- (int64_t)visitCountScore
{
  return self->_streamData.__ptr_.__value_->var5;
}

- (BOOL)visitWasClientError
{
  return self->_streamData.__ptr_.__value_->var8 != 0;
}

- (BOOL)shouldPreload
{
  return self->_streamData.__ptr_.__value_->var7 != 0;
}

- (void)setVisitCount:(int64_t)a3
{
  self->_streamData.__ptr_.__value_->var4 = a3;
}

- (void)setVisitCountScore:(int64_t)a3
{
  self->_streamData.__ptr_.__value_->var5 = a3;
}

- (void)setAutocompleteTriggers:(const void *)a3 length:(unint64_t)a4
{
  size_t v4;
  _HistoryStreamedMatchData *v7;
  _HistoryStreamedMatchData *v8;
  _HistoryStreamedMatchData *value;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _HistoryStreamedMatchData *v13;

  v4 = a4;
  v7 = (_HistoryStreamedMatchData *)operator new(a4 + 56);
  v8 = v7;
  value = self->_streamData.__ptr_.__value_;
  v11 = *(_OWORD *)&value->var2;
  v10 = *(_OWORD *)&value->var4;
  v12 = *(_OWORD *)&value->var0.var0;
  *(_QWORD *)&v7->var6 = *(_QWORD *)&value->var6;
  *(_OWORD *)&v7->var2 = v11;
  *(_OWORD *)&v7->var4 = v10;
  *(_OWORD *)&v7->var0.var0 = v12;
  if (a3)
  {
    v13 = v7 + 1;
    memcpy(&v7[1], a3, v4);
  }
  else
  {
    v13 = 0;
    v4 = 0;
  }
  v8->var2 = v13;
  v8->var3 = v4;
  self->_streamData.__ptr_.__value_ = v8;
  JUMPOUT(0x1A85998ACLL);
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, char *);
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void (**)(id, void *, _QWORD, char *))a3;
  -[NSArray firstObject](self->_entries, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7, 0, &v8);

  }
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (-[NSArray count](self->_entries, "count", a3))
  {
    -[NSArray firstObject](self->_entries, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  id v4;
  NSArray *entries;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSHistoryServiceURLCompletionMatchData_enumerateUserVisibleURLsUsingBlock___block_invoke;
  v7[3] = &unk_1E4B3C4C0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v7);

}

void __78__WBSHistoryServiceURLCompletionMatchData_enumerateUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "url");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_userVisibleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);

}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  id v4;
  NSArray *entries;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__WBSHistoryServiceURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
  v7[3] = &unk_1E4B3C4E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v7);

}

void __91__WBSHistoryServiceURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_userVisibleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, void *, uint64_t, uint64_t))(v7 + 16))(v7, v9, 0, v11, a3, a4);

}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[NSArray count](self->_entries, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_userVisibleURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSString)originalURLString
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_entries, "count"))
  {
    -[NSArray firstObject](self->_entries, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *autocompleteTriggersAsStringArray;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a4;
  v6 = a3;
  if (self->_streamData.__ptr_.__value_->var2)
  {
    if (!self->_autocompleteTriggersAsStringArray)
    {
      v7 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "propertyListWithData:options:format:error:", v8, 0, 0, 0);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      autocompleteTriggersAsStringArray = self->_autocompleteTriggersAsStringArray;
      self->_autocompleteTriggersAsStringArray = v9;

    }
    -[WBSHistoryServiceURLCompletionMatchData pageTitleAtIndex:](self, "pageTitleAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceURLCompletionMatchData originalURLString](self, "originalURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:](WBSURLCompletionMatchDataHelpers, "typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:", v6, v11, v12, self->_autocompleteTriggersAsStringArray, v4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  float v6;
  void *v7;
  float v8;

  v6 = 0.0;
  if (-[NSArray count](self->_entries, "count", a4) > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topSitesScore");
    v6 = v8;

  }
  return v6;
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  void *v4;
  float v5;
  float v6;

  if (!-[NSArray count](self->_entries, "count", a3))
    return 0.0;
  -[NSArray firstObject](self->_entries, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topSitesScore");
  v6 = v5;

  return v6;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  void *v3;
  int64_t v4;

  if (!-[NSArray count](self->_entries, "count"))
    return -1;
  -[NSArray firstObject](self->_entries, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visitCountScore");

  return v4;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  void *v5;
  int64_t v6;

  if (-[NSArray count](self->_entries, "count") <= a3)
    return -1;
  -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visitCountScore");

  return v6;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  _HistoryStreamedMatchData *value;

  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_autocompleteTriggersAsStringArray, 0);
  value = self->_streamData.__ptr_.__value_;
  self->_streamData.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x1A85998ACLL);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
