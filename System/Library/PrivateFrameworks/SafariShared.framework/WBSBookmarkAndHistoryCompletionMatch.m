@implementation WBSBookmarkAndHistoryCompletionMatch

- (WBSBookmarkAndHistoryCompletionMatch)initWithBookmarkAndHistoryCompletionMatch:(void *)a3 userInput:(id)a4 forQueryID:(int64_t)a5
{
  uint64_t v6;
  WBSBookmarkAndHistoryCompletionMatch *v7;
  WBSBookmarkAndHistoryCompletionMatch *v8;
  BookmarkAndHistoryCompletionMatch *v9;
  uint64_t m_ptr;
  WBSBookmarkAndHistoryCompletionMatch *v11;
  objc_super v13;

  v6 = *(_QWORD *)(*(_QWORD *)a3 + 8);
  v13.receiver = self;
  v13.super_class = (Class)WBSBookmarkAndHistoryCompletionMatch;
  v7 = -[WBSURLCompletionMatch initWithMatchLocation:userInput:forQueryID:](&v13, sel_initWithMatchLocation_userInput_forQueryID_, v6, a4, a5);
  v8 = v7;
  if (v7)
  {
    v9 = *(BookmarkAndHistoryCompletionMatch **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = (uint64_t)v7->_match.m_ptr;
    v8->_match.m_ptr = v9;
    if (m_ptr)
      WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref(m_ptr);
    v11 = v8;
  }

  return v8;
}

- (WBSURLCompletionMatchData)data
{
  return (WBSURLCompletionMatchData *)SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
}

- (BOOL)matchesAutocompleteTrigger
{
  void *v3;
  void *v4;
  char v5;

  -[WBSBookmarkAndHistoryCompletionMatch data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSURLCompletionMatch userInput](self, "userInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "matchesAutocompleteTrigger:isStrengthened:", v4, 0);

  return v5;
}

- (id)originalURLString
{
  return (id)SafariShared::BookmarkAndHistoryCompletionMatch::originalURLString((id *)self->_match.m_ptr);
}

- (id)title
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::title((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (id)userVisibleURLString
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::userVisibleURLString((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (BOOL)containsBookmark
{
  void *v2;
  char v3;

  SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsBookmark");

  return v3;
}

- (id)uuidString
{
  return SafariShared::BookmarkAndHistoryCompletionMatch::uuidString((SafariShared::BookmarkAndHistoryCompletionMatch *)self->_match.m_ptr);
}

- (BOOL)onlyContainsCloudTab
{
  void *v2;
  char v3;

  SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "onlyContainsCloudTab");
  else
    v3 = 0;

  return v3;
}

- (id)cloudTabDeviceName
{
  void *v2;
  void *v3;

  SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "cloudTabDeviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (double)lastVisitTimeInterval
{
  void *v2;
  double v3;
  double v4;

  SafariShared::BookmarkAndHistoryCompletionMatch::data((id *)self->_match.m_ptr);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastVisitedTimeInterval");
  v4 = v3;

  return v4;
}

- (id)parsecDomainIdentifier
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[WBSBookmarkAndHistoryCompletionMatch data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsBookmark");
  v4 = WBSParsecDomainSafariBookmark;
  if (!v3)
    v4 = WBSParsecDomainSafariHistory;
  v5 = *v4;

  return v5;
}

- (float)weight
{
  return *((float *)self->_match.m_ptr + 12);
}

- (int64_t)visitCountScore
{
  return *((_QWORD *)self->_match.m_ptr + 7);
}

- (float)topSitesScore
{
  return *((float *)self->_match.m_ptr + 16);
}

- (void).cxx_destruct
{
  BookmarkAndHistoryCompletionMatch *m_ptr;

  m_ptr = self->_match.m_ptr;
  self->_match.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<SafariShared::BookmarkAndHistoryCompletionMatch>::deref((uint64_t)m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
