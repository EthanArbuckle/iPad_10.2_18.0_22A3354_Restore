@implementation THModelGlossaryEntry

- (THModelGlossary)glossary
{
  return self->mGlossary;
}

- (void)setGlossary:(id)a3
{
  -[THModelGlossaryEntry willModify](self, "willModify");
  self->mGlossary = (THModelGlossary *)a3;
}

- (NSString)term
{
  return self->mTerm;
}

- (void)setTerm:(id)a3
{
  id v5;

  -[THModelGlossaryEntry willModify](self, "willModify");
  v5 = a3;

  self->mTerm = (NSString *)a3;
}

- (NSString)applePubRelativePath
{
  return self->mApplePubRelativePath;
}

- (void)setApplePubRelativePath:(id)a3
{
  id v5;

  -[THModelGlossaryEntry willModify](self, "willModify");
  v5 = a3;

  self->mApplePubRelativePath = (NSString *)a3;
}

- (BOOL)loadedFromApplePub
{
  return self->mLoadedFromApplePub;
}

- (void)setLoadedFromApplePub:(BOOL)a3
{
  -[THModelGlossaryEntry willModify](self, "willModify");
  self->mLoadedFromApplePub = a3;
}

- (THModelGlossaryEntry)initWithContext:(id)a3 parent:(id)a4 applePubRelativePath:(id)a5 andTerm:(id)a6
{
  THModelGlossaryEntry *v9;
  THModelGlossaryEntry *v10;
  THModelGlossaryEntryFlushable *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THModelGlossaryEntry;
  v9 = -[THModelGlossaryEntry initWithContext:](&v13, "initWithContext:", a3);
  v10 = v9;
  if (v9)
  {
    v9->mGlossary = (THModelGlossary *)a4;
    v11 = -[THModelGlossaryEntryFlushable initWithParent:]([THModelGlossaryEntryFlushable alloc], "initWithParent:", v9);
    v10->mFlushable = v11;
    -[THModelGlossaryEntryFlushable ownerRetain](v11, "ownerRetain");
    v10->mApplePubRelativePath = (NSString *)objc_msgSend(a5, "copy");
    v10->mTerm = (NSString *)objc_msgSend(a6, "copy");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  self->mGlossary = 0;

  self->mTerm = 0;
  self->mApplePubRelativePath = 0;

  self->mNormalizedPrefixSearchStrings = 0;
  -[THModelGlossaryEntryFlushable ownerRelease](self->mFlushable, "ownerRelease");
  self->mFlushable = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntry;
  -[THModelGlossaryEntry dealloc](&v3, "dealloc");
}

- (void)p_didLoadInfo:(id)a3 onComplete:(id)a4
{
  (*((void (**)(id, THModelGlossaryEntry *, id))a4 + 2))(a4, self, a3);
}

- (void)p_loadInfoOnComplete:(id)a3
{
  THGlossaryEntryInfo *v5;
  _QWORD v6[7];

  v5 = -[THGlossaryEntryInfo initWithEntry:body:]([THGlossaryEntryInfo alloc], "initWithEntry:body:", self, self->mFlushable);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A4D08;
  v6[3] = &unk_427350;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  -[NSOperationQueue addOperation:](+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), "addOperation:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v6));
}

- (void)loadInfoOnComplete:(id)a3
{
  void *v4;
  _QWORD v5[6];

  v4 = _Block_copy(a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A4DB0;
  v5[3] = &unk_426E78;
  v5[4] = self;
  v5[5] = v4;
  -[NSOperationQueue addOperation:](-[THModelGlossary loadingQueue](self->mGlossary, "loadingQueue"), "addOperation:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v5));

}

- (void)synchronouslyLoadInfoOnComplete:(id)a3
{
  -[THModelGlossaryEntry p_didLoadInfo:onComplete:](self, "p_didLoadInfo:onComplete:", -[THGlossaryEntryInfo initWithEntry:body:]([THGlossaryEntryInfo alloc], "initWithEntry:body:", self, self->mFlushable), a3);
}

- (id)normalizedPrefixSearchStrings
{
  id result;

  result = self->mNormalizedPrefixSearchStrings;
  if (!result)
  {
    result = -[NSString normalizedStringsForPrefixSearch](-[THModelGlossaryEntry term](self, "term"), "normalizedStringsForPrefixSearch");
    self->mNormalizedPrefixSearchStrings = (NSArray *)result;
  }
  return result;
}

- (NSString)normalizedTerm
{
  return (NSString *)objc_msgSend(-[THModelGlossaryEntry normalizedPrefixSearchStrings](self, "normalizedPrefixSearchStrings"), "objectAtIndex:", 0);
}

- (BOOL)containsPrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = -[THModelGlossaryEntry normalizedPrefixSearchStrings](self, "normalizedPrefixSearchStrings");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "hasPrefix:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return (char)v5;
}

- (id)summaryText
{
  THGlossaryEntryInfo *v2;
  THWPStorage *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = -[THGlossaryEntryInfo initWithEntry:body:]([THGlossaryEntryInfo alloc], "initWithEntry:body:", self, self->mFlushable);
  v3 = -[THGlossaryEntryInfo bodyStorage](v2, "bodyStorage");
  if (-[THWPStorage paragraphCount](v3, "paragraphCount"))
  {
    v4 = -[THWPStorage textRangeForParagraphAtIndex:](v3, "textRangeForParagraphAtIndex:", 0);
    v6 = -[THWPStorage substringWithRange:](v3, "substringWithRange:", v4, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5
{
  return a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntry;
  return objc_msgSend(-[THModelGlossaryEntry description](&v3, "description"), "stringByAppendingFormat:", CFSTR(" %@"), -[THModelGlossaryEntry term](self, "term"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  NSString *mApplePubRelativePath;
  id v8;
  NSString *v9;
  NSString *mTerm;

  v5 = objc_opt_class(THModelGlossaryEntry, a2);
  v6 = (void *)TSUDynamicCast(v5, a3);
  if (v6)
  {
    mApplePubRelativePath = self->mApplePubRelativePath;
    if (mApplePubRelativePath)
    {
      v8 = objc_msgSend(v6, "applePubRelativePath");
      v9 = mApplePubRelativePath;
    }
    else
    {
      mTerm = self->mTerm;
      v8 = objc_msgSend(v6, "term");
      v9 = mTerm;
    }
    LOBYTE(v6) = -[NSString isEqual:](v9, "isEqual:", v8);
  }
  return (char)v6;
}

- (unint64_t)hash
{
  NSString *mApplePubRelativePath;

  if (self->mApplePubRelativePath)
    mApplePubRelativePath = self->mApplePubRelativePath;
  else
    mApplePubRelativePath = self->mTerm;
  return -[NSString hash](mApplePubRelativePath, "hash");
}

@end
