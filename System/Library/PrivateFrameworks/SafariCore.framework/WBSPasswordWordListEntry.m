@implementation WBSPasswordWordListEntry

- (WBSPasswordWordListEntry)initWithWord:(id)a3 isSensitive:(BOOL)a4 wordListIdentifier:(id)a5 guessesRequired:(unint64_t)a6
{
  id v10;
  id v11;
  WBSPasswordWordListEntry *v12;
  uint64_t v13;
  NSString *word;
  uint64_t v15;
  NSString *wordListIdentifier;
  WBSPasswordWordListEntry *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSPasswordWordListEntry;
  v12 = -[WBSPasswordWordListEntry init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    word = v12->_word;
    v12->_word = (NSString *)v13;

    v12->_sensitive = a4;
    v15 = objc_msgSend(v11, "copy");
    wordListIdentifier = v12->_wordListIdentifier;
    v12->_wordListIdentifier = (NSString *)v15;

    v12->_guessesRequired = a6;
    v17 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_sensitive)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; word = \"%@\"; sensitive = %@; wordListIdentifier = \"%@\"; guessesRequired = %lu>"),
    v5,
    self,
    self->_word,
    v7,
    self->_wordListIdentifier,
    self->_guessesRequired);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)word
{
  return self->_word;
}

- (BOOL)isSensitive
{
  return self->_sensitive;
}

- (NSString)wordListIdentifier
{
  return self->_wordListIdentifier;
}

- (unint64_t)guessesRequired
{
  return self->_guessesRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordListIdentifier, 0);
  objc_storeStrong((id *)&self->_word, 0);
}

@end
