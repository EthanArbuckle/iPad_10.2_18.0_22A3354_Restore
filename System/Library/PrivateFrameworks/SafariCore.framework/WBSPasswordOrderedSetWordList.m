@implementation WBSPasswordOrderedSetWordList

- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWords:(id)a5
{
  id v8;
  WBSPasswordOrderedSetWordList *v9;
  uint64_t v10;
  NSOrderedSet *words;
  WBSPasswordOrderedSetWordList *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WBSPasswordOrderedSetWordList;
  v9 = -[WBSPasswordWordList initWithIdentifier:](&v14, sel_initWithIdentifier_, a3);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    words = v9->_words;
    v9->_words = (NSOrderedSet *)v10;

    v9->_sensitive = a4;
    v12 = v9;
  }

  return v9;
}

- (WBSPasswordOrderedSetWordList)initWithIdentifier:(id)a3 isSensitive:(BOOL)a4 orderedWordsArray:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  WBSPasswordOrderedSetWordList *v11;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99E40];
  v9 = a3;
  objc_msgSend(v8, "orderedSetWithArray:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSPasswordOrderedSetWordList initWithIdentifier:isSensitive:orderedWords:](self, "initWithIdentifier:isSensitive:orderedWords:", v9, v6, v10);

  return v11;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *);
  NSUInteger v7;
  NSUInteger v8;
  WBSPasswordWordListEntry *v9;
  _BOOL8 sensitive;
  void *v11;
  WBSPasswordWordListEntry *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = -[NSOrderedSet indexOfObject:](self->_words, "indexOfObject:", v13);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7 + 1;
    v9 = [WBSPasswordWordListEntry alloc];
    sensitive = self->_sensitive;
    -[WBSPasswordWordList identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WBSPasswordWordListEntry initWithWord:isSensitive:wordListIdentifier:guessesRequired:](v9, "initWithWord:isSensitive:wordListIdentifier:guessesRequired:", v13, sensitive, v11, v8);

    v6[2](v6, v12);
  }

}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
}

@end
