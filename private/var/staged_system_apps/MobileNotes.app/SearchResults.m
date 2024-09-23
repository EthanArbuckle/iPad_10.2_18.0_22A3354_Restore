@implementation SearchResults

- (SearchResults)init
{
  SearchResults *v2;
  uint64_t v3;
  NSMutableArray *topHitResults;
  uint64_t v5;
  NSMutableArray *suggestions;
  uint64_t v7;
  NSMutableArray *noteResults;
  uint64_t v9;
  NSMutableArray *attachmentResults;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchResults;
  v2 = -[SearchResults init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    topHitResults = v2->_topHitResults;
    v2->_topHitResults = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    suggestions = v2->_suggestions;
    v2->_suggestions = (NSMutableArray *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    noteResults = v2->_noteResults;
    v2->_noteResults = (NSMutableArray *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    attachmentResults = v2->_attachmentResults;
    v2->_attachmentResults = (NSMutableArray *)v9;

  }
  return v2;
}

- (void)addResult:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v6 = objc_msgSend(v5, "ic_isNoteType");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
    v8 = objc_msgSend(v7, "isTopHit");

    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResults topHitResults](self, "topHitResults"));
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResults noteResults](self, "noteResults"));
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "object"));
  v11 = objc_opt_class(ICAttachment);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResults attachmentResults](self, "attachmentResults"));
LABEL_7:
    v13 = v9;
    objc_msgSend(v9, "addObject:", v14);

  }
}

- (NSMutableArray)topHitResults
{
  return self->_topHitResults;
}

- (void)setTopHitResults:(id)a3
{
  objc_storeStrong((id *)&self->_topHitResults, a3);
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (NSMutableArray)noteResults
{
  return self->_noteResults;
}

- (void)setNoteResults:(id)a3
{
  objc_storeStrong((id *)&self->_noteResults, a3);
}

- (NSMutableArray)attachmentResults
{
  return self->_attachmentResults;
}

- (void)setAttachmentResults:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentResults, 0);
  objc_storeStrong((id *)&self->_noteResults, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_topHitResults, 0);
}

@end
