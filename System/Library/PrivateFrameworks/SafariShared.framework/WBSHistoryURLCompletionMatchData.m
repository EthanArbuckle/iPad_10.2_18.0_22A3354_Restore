@implementation WBSHistoryURLCompletionMatchData

- (WBSHistoryURLCompletionMatchData)init
{

  return 0;
}

- (WBSHistoryURLCompletionMatchData)initWithCompletionItem:(void *)a3
{
  WBSHistoryURLCompletionMatchData *v4;
  WBSHistoryURLCompletionMatchData *v5;
  unsigned int v6;
  uint64_t m_ptr;
  WBSHistoryURLCompletionMatchData *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryURLCompletionMatchData;
  v4 = -[WBSHistoryURLCompletionMatchData init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      do
        v6 = __ldaxr((unsigned int *)a3);
      while (__stlxr(v6 + 1, (unsigned int *)a3));
    }
    m_ptr = (uint64_t)v4->_item.m_ptr;
    v5->_item.m_ptr = (HistoryURLCompletionItem *)a3;
    if (m_ptr)
      WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref(m_ptr);
    v8 = v5;
  }

  return v5;
}

- (BOOL)shouldPreload
{
  return *((_BYTE *)self->_item.m_ptr + 161);
}

- (NSString)originalURLString
{
  return (NSString *)*((id *)self->_item.m_ptr + 8);
}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  HistoryURLCompletionItem *m_ptr;
  uint64_t v4;
  char *v5;
  void *v6;

  m_ptr = self->_item.m_ptr;
  if (a3)
  {
    v5 = (char *)m_ptr + 32;
    v4 = *((_QWORD *)m_ptr + 4);
    if (a3 - 1 >= (*((_QWORD *)v5 + 1) - v4) >> 3)
    {
      v6 = 0;
      return v6;
    }
    m_ptr = *(HistoryURLCompletionItem **)(v4 + 8 * (a3 - 1));
  }
  objc_msgSend(*((id *)m_ptr + 8), "safari_userVisibleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)userVisibleURLStringForPageTitleAtIndex:(unint64_t)a3
{
  objc_msgSend(*((id *)self->_item.m_ptr + 8), "safari_userVisibleURL", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pageTitleForUserVisibleURLStringAtIndex:(unint64_t)a3
{
  return *((id *)self->_item.m_ptr + 9);
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  return *((id *)self->_item.m_ptr + 9);
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _QWORD, char *);
  void *v5;
  HistoryURLCompletionItem *m_ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  char v14;

  v4 = (void (**)(id, void *, _QWORD, char *))a3;
  v14 = 0;
  objc_msgSend(*((id *)self->_item.m_ptr + 8), "safari_userVisibleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0, &v14);

  if (!v14)
  {
    m_ptr = self->_item.m_ptr;
    v7 = *((_QWORD *)m_ptr + 4);
    v8 = *((_QWORD *)m_ptr + 5);
    if (v7 != v8)
    {
      v9 = v7 + 8;
      v10 = 1;
      do
      {
        v11 = *(id *)(*(_QWORD *)(v9 - 8) + 64);
        objc_msgSend(v11, "safari_userVisibleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v12, v10, &v14);

        if (v14)
          break;
        ++v10;
        v13 = v9 == v8;
        v9 += 8;
      }
      while (!v13);
    }
  }

}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, _QWORD, _QWORD, char *))a3 + 2))(a3, *((_QWORD *)self->_item.m_ptr + 9), 0, &v3);
}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__WBSHistoryURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
  v6[3] = &unk_1E4B3C890;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSHistoryURLCompletionMatchData enumerateUserVisibleURLsUsingBlock:](self, "enumerateUserVisibleURLsUsingBlock:", v6);

}

uint64_t __84__WBSHistoryURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72), 0, a2, a3, a4);
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  _BOOL8 v4;
  HistoryURLCompletionItem *m_ptr;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = a4;
  m_ptr = self->_item.m_ptr;
  v7 = (void *)*((_QWORD *)m_ptr + 9);
  v8 = *((_QWORD *)m_ptr + 18);
  v9 = *((id *)m_ptr + 8);
  v10 = v7;
  LOBYTE(v4) = +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:](WBSURLCompletionMatchDataHelpers, "typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:", a3, v10, v9, v8, v4);

  return v4;
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  return WBSTopSitesScore();
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  return WBSTopSitesScore();
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  return *((_QWORD *)self->_item.m_ptr + 19);
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  return *((_QWORD *)self->_item.m_ptr + 19);
}

- (BOOL)containsBookmark
{
  return *((_BYTE *)self->_item.m_ptr + 162);
}

- (double)lastVisitedTimeInterval
{
  return *((double *)self->_item.m_ptr + 10);
}

- (BOOL)lastVisitWasFailure
{
  return *((_BYTE *)self->_item.m_ptr + 160) == 0;
}

- (int64_t)visitCount
{
  return *((int *)self->_item.m_ptr + 22);
}

- (int64_t)visitCountScore
{
  return *((_QWORD *)self->_item.m_ptr + 19);
}

- (BOOL)visitWasClientError
{
  return *((_BYTE *)self->_item.m_ptr + 163);
}

- (void).cxx_destruct
{
  HistoryURLCompletionItem *m_ptr;

  m_ptr = self->_item.m_ptr;
  self->_item.m_ptr = 0;
  if (m_ptr)
    WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref((uint64_t)m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
