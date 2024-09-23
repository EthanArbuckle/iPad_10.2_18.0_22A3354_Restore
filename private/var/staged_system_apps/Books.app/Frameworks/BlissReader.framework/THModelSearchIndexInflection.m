@implementation THModelSearchIndexInflection

- (THModelSearchIndexInflection)initWithInflection:(id)a3
{
  THModelSearchIndexInflection *v4;
  NSString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THModelSearchIndexInflection;
  v4 = -[THModelSearchIndexInflection init](&v7, "init");
  if (v4)
  {
    v5 = (NSString *)objc_msgSend(a3, "copy");
    v4->mOccurrenceCount = 0;
    v4->mOccurrences = 0;
    v4->mInflection = v5;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  unint64_t v4;
  $41A25B052F3098E4BF49521C564DEBD4 *v5;
  objc_super v6;

  if (self->mOccurrenceCount)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = &self->mOccurrences[v3];

      ++v4;
      ++v3;
    }
    while (v4 < self->mOccurrenceCount);
  }
  free(self->mOccurrences);
  v6.receiver = self;
  v6.super_class = (Class)THModelSearchIndexInflection;
  -[THModelSearchIndexInflection dealloc](&v6, "dealloc");
}

- (unint64_t)hash
{
  return -[NSString hash](self->mInflection, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  _BOOL4 v6;
  id mOccurrenceCount;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else if (a3 && (v5 = objc_opt_class(self, a2), (objc_opt_isKindOfClass(a3, v5) & 1) != 0))
  {
    v6 = -[NSString isEqualToString:](self->mInflection, "isEqualToString:", objc_msgSend(a3, "inflection"));
    if (v6)
    {
      mOccurrenceCount = (id)self->mOccurrenceCount;
      LOBYTE(v6) = mOccurrenceCount == objc_msgSend(a3, "occurrenceCount");
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)description
{
  unint64_t v3;
  NSMutableArray *v4;
  $41A25B052F3098E4BF49521C564DEBD4 *v5;
  id *p_var3;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = -[THModelSearchIndexInflection occurrenceCount](self, "occurrenceCount");
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3);
  v5 = -[THModelSearchIndexInflection occurrences](self, "occurrences");
  if (v3)
  {
    p_var3 = &v5->var3;
    v7 = v3;
    do
    {
      v8 = *((unsigned __int16 *)p_var3 - 4);
      v9 = *((unsigned __int16 *)p_var3 - 3);
      v10 = *((unsigned int *)p_var3 - 1);
      v12 = *p_var3;
      v11 = p_var3[1];
      p_var3 += 3;
      -[NSMutableArray addObject:](v4, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{rid=%@,rk=%d,idx=%d,pgi=%lu,dp=%@}"), v11, v8, v9, v10, v12));
      --v7;
    }
    while (v7);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%ld]%@"), -[THModelSearchIndexInflection inflection](self, "inflection"), v3, -[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(",")));
}

- (void)addOccurrence:(id)a3 rank:(unint64_t)a4 paragraphIndex:(unint64_t)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7
{
  unsigned int v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  $41A25B052F3098E4BF49521C564DEBD4 *mOccurrences;
  unint64_t mOccurrenceCount;
  $41A25B052F3098E4BF49521C564DEBD4 *v15;
  $41A25B052F3098E4BF49521C564DEBD4 *v16;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  mOccurrenceCount = self->mOccurrenceCount;
  mOccurrences = self->mOccurrences;
  self->mOccurrenceCount = ++mOccurrenceCount;
  v15 = ($41A25B052F3098E4BF49521C564DEBD4 *)malloc_type_realloc(mOccurrences, 24 * mOccurrenceCount, 0x1080040D2F62047uLL);
  self->mOccurrences = v15;
  if (!v15)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelSearchIndexInflection addOccurrence:rank:paragraphIndex:pageNumber:displayPageNumber:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndexInflection.m"), 88, CFSTR("Couldn't allocate space for occurrences!"));
    v15 = self->mOccurrences;
  }
  v16 = &v15[self->mOccurrenceCount];
  v16[-1].var0 = v10;
  v16[-1].var1 = v9;
  v16[-1].var4 = objc_msgSend(a3, "copy");
  v16[-1].var2 = v8;
  v16[-1].var3 = objc_msgSend(a7, "copy");
}

- (int)minimumOccurrenceRank
{
  return -1;
}

- (NSString)inflection
{
  return self->mInflection;
}

- (unint64_t)occurrenceCount
{
  return self->mOccurrenceCount;
}

- ($41A25B052F3098E4BF49521C564DEBD4)occurrences
{
  return self->mOccurrences;
}

@end
