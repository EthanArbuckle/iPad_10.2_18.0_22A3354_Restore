@implementation PRLexiconCursor

- (PRLexiconCursor)initWithLexicon:(id)a3
{
  PRLexiconCursor *v3;
  PRLexicon *v5;
  objc_super v7;

  v3 = self;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRLexiconCursor;
    v3 = -[PRLexiconCursor init](&v7, sel_init);
    if (v3)
    {
      v5 = (PRLexicon *)a3;
      v3->_lexicon = v5;
      -[PRLexicon lexicon](v5, "lexicon");
      v3->_cursor = (_LXCursor *)LXLexiconCreateRootCursor();
    }
  }
  return v3;
}

- (void)dealloc
{
  _LXCursor *cursor;
  objc_super v4;

  cursor = self->_cursor;
  if (cursor)
    CFRelease(cursor);
  v4.receiver = self;
  v4.super_class = (Class)PRLexiconCursor;
  -[PRLexiconCursor dealloc](&v4, sel_dealloc);
}

- (void)_advance:(id)a3
{
  _LXCursor *v4;

  if (self->_cursor)
  {
    v4 = (_LXCursor *)LXCursorCreateByAdvancing();
    CFRelease(self->_cursor);
    self->_cursor = v4;
  }
}

- (void)advanceWithString:(id)a3
{
  if (objc_msgSend(a3, "length"))
    -[PRLexiconCursor _advance:](self, "_advance:", a3);
}

- (BOOL)isValid
{
  return self->_cursor != 0;
}

- (BOOL)hasEntries
{
  _LXCursor *cursor;

  cursor = self->_cursor;
  if (cursor)
    LOBYTE(cursor) = LXCursorHasEntries() != 0;
  return (char)cursor;
}

- (BOOL)hasChildren
{
  _LXCursor *cursor;

  cursor = self->_cursor;
  if (cursor)
    LOBYTE(cursor) = LXCursorHasChildren() != 0;
  return (char)cursor;
}

- (double)prefixProbability
{
  double result;

  if (!self->_cursor)
    return -30.0;
  LXCursorPrefixProbability();
  return result;
}

- (double)terminationProbability
{
  double result;

  if (!self->_cursor)
    return -30.0;
  LXCursorTerminationProbability();
  return result;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  _QWORD v3[3];
  char v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  v4 = 0;
  if (self->_cursor)
    LXCursorEnumerateEntries();
  _Block_object_dispose(v3, 8);
}

void __46__PRLexiconCursor_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = LXEntryCopyString();
  if (v2)
  {
    v3 = (const void *)v2;
    LXEntryGetTokenID();
    LXEntryGetMetaFlags();
    LXEntryGetProbability();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease(v3);
  }
}

- (void)_enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4
{
  _QWORD v4[4];

  if (self->_cursor)
  {
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v4[3] = 0;
    LXCursorEnumerateEntriesRecursively();
    _Block_object_dispose(v4, 8);
  }
}

uint64_t __52__PRLexiconCursor__enumerateCompletions_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;

  LXEntryGetTokenID();
  result = LXEntryGetProbability();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7 >= a1[6])
  {
    *(_QWORD *)(v6 + 24) = v7 + 1;
  }
  else
  {
    result = (*(uint64_t (**)(void))(a1[4] + 16))();
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[6])
    *a3 = 1;
  return result;
}

- (void)enumerateCompletions:(unint64_t)a3 usingBlock:(id)a4
{
  _QWORD v4[5];

  if (self->_cursor)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__PRLexiconCursor_enumerateCompletions_usingBlock___block_invoke;
    v4[3] = &unk_1EA8CD4B0;
    v4[4] = a4;
    -[PRLexiconCursor _enumerateCompletions:usingBlock:](self, "_enumerateCompletions:usingBlock:", a3, v4);
  }
}

uint64_t __51__PRLexiconCursor_enumerateCompletions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  char v5;

  v5 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v5)
    *a3 = 1;
  return result;
}

- (void)enumerateCompletionEntries:(unint64_t)a3 usingBlock:(id)a4
{
  _QWORD v4[4];

  if (self->_cursor)
  {
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v4[3] = 0;
    LXCursorEnumerateEntriesRecursively();
    _Block_object_dispose(v4, 8);
  }
}

void __57__PRLexiconCursor_enumerateCompletionEntries_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  unint64_t v8;

  v5 = LXEntryCopyString();
  if (v5)
  {
    v6 = (const void *)v5;
    LXEntryGetTokenID();
    LXEntryGetProbability();
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 >= a1[6])
    {
      *(_QWORD *)(v7 + 24) = v8 + 1;
    }
    else
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[6])
      *a3 = 1;
    CFRelease(v6);
  }
}

@end
