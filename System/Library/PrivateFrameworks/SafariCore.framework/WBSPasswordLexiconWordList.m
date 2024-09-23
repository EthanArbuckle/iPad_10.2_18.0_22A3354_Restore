@implementation WBSPasswordLexiconWordList

- (WBSPasswordLexiconWordList)initWithIdentifier:(id)a3 lexicon:(_LXLexicon *)a4
{
  WBSPasswordLexiconWordList *v5;
  WBSPasswordLexiconWordList *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSPasswordLexiconWordList;
  v5 = -[WBSPasswordWordList initWithIdentifier:](&v8, sel_initWithIdentifier_, a3);
  if (v5)
  {
    v5->_lexicon = (_LXLexicon *)CFRetain(a4);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_lexicon);
  v3.receiver = self;
  v3.super_class = (Class)WBSPasswordLexiconWordList;
  -[WBSPasswordLexiconWordList dealloc](&v3, sel_dealloc);
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WBSPasswordWordList identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = v6;
  v9 = v10;
  LXLexiconEnumerateEntriesForString();

}

void __66__WBSPasswordLexiconWordList_enumerateEntriesForString_withBlock___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  WBSPasswordWordListEntry *v4;
  id v5;

  v5 = (id)LXEntryCopyString();
  LXEntryGetProbability();
  v3 = 1.0 / __exp10(v2);
  if (v3 < 1.0)
    v3 = 1.0;
  v4 = -[WBSPasswordWordListEntry initWithWord:isSensitive:wordListIdentifier:guessesRequired:]([WBSPasswordWordListEntry alloc], "initWithWord:isSensitive:wordListIdentifier:guessesRequired:", v5, (LXEntryGetMetaFlags() & 0x3800000) != 0, *(_QWORD *)(a1 + 32), (unint64_t)v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)lexiconWordListWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = *MEMORY[0x1E0D437B8];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = LXLexiconCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:lexicon:", v6, v8);
    CFRelease(v9);
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[WBSPasswordLexiconWordList lexiconWordListWithIdentifier:localeIdentifier:].cold.1(v11, 0);

    v10 = 0;
  }

  return v10;
}

+ (void)lexiconWordListWithIdentifier:(void *)a1 localeIdentifier:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B2621000, v3, OS_LOG_TYPE_ERROR, "Failed to create lexicon word list: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
