@implementation WBSPasswordSetWordList

- (WBSPasswordSetWordList)initWithIdentifier:(id)a3 words:(id)a4
{
  id v6;
  WBSPasswordSetWordList *v7;
  uint64_t v8;
  NSSet *words;
  WBSPasswordSetWordList *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordSetWordList;
  v7 = -[WBSPasswordWordList initWithIdentifier:](&v12, sel_initWithIdentifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    words = v7->_words;
    v7->_words = (NSSet *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, void *);
  NSUInteger v7;
  uint64_t v8;
  WBSPasswordWordListEntry *v9;
  void *v10;
  WBSPasswordWordListEntry *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, void *))a4;
  if (-[NSSet containsObject:](self->_words, "containsObject:", v12))
  {
    v7 = -[NSSet count](self->_words, "count");
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7 >> 1;
    v9 = [WBSPasswordWordListEntry alloc];
    -[WBSPasswordWordList identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSPasswordWordListEntry initWithWord:isSensitive:wordListIdentifier:guessesRequired:](v9, "initWithWord:isSensitive:wordListIdentifier:guessesRequired:", v12, 0, v10, v8);

    v6[2](v6, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
}

@end
