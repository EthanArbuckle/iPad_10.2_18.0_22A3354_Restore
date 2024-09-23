@implementation PRLexicon

- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  id v10;
  uint64_t v11;
  PRLexicon *v12;
  uint64_t v13;
  const void *v14;
  PRLexicon *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  uint64_t v21;

  v5 = a5;
  v21 = 0;
  v9 = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (v5)
    v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", *MEMORY[0x1E0D437B0], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D437A8], v9, *MEMORY[0x1E0D437B8], a4, *MEMORY[0x1E0D43798], 0);
  else
    v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", *MEMORY[0x1E0D437A8], v9, *MEMORY[0x1E0D437B8], a4, *MEMORY[0x1E0D43798], 0, v18, v19);
  v12 = (PRLexicon *)v11;
  v13 = LXLexiconCreate();
  if (v13)
  {
    v14 = (const void *)v13;
    v20.receiver = self;
    v20.super_class = (Class)PRLexicon;
    v15 = -[PRLexicon init](&v20, sel_init);
    if (v15)
    {
      v15->_localization = (NSString *)objc_msgSend(a3, "copy");
      v15->_unigramsPath = (NSString *)objc_msgSend(a4, "copy");
      v15->_lexicon = v14;
    }
    else
    {
      CFRelease(v14);
    }
    self = v12;
  }
  else
  {
    if (a4)
      NSLog((NSString *)CFSTR("Lexicon creation for %@:%@ failed: %@"), a3, a4, v21);
    else
      NSLog((NSString *)CFSTR("Lexicon creation for %@ failed: %@"), a3, v21, v17);

    v15 = 0;
  }

  return v15;
}

- (PRLexicon)initWithLocalization:(id)a3 unigramsPath:(id)a4
{
  return -[PRLexicon initWithLocalization:unigramsPath:cachedOnly:](self, "initWithLocalization:unigramsPath:cachedOnly:", a3, a4, 0);
}

- (PRLexicon)initWithLexicon:(const void *)a3
{
  PRLexicon *v4;
  PRLexicon *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PRLexicon;
    v4 = -[PRLexicon init](&v7, sel_init);
    v5 = v4;
    if (v4)
    {
      v4->_localization = (NSString *)CFSTR("External");
      v4->_lexicon = CFRetain(a3);
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (PRLexicon)initWithName:(id)a3 words:(id)a4
{
  id v7;
  PRLexicon *v8;
  uint64_t Mutable;
  const void *v10;
  PRLexicon *v11;
  PRLexicon *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  CFTypeRef cf;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = (PRLexicon *)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, *MEMORY[0x1E0D437C8], 0);
  if (!a3 || !a4)
    goto LABEL_14;
  Mutable = LXLexiconCreateMutable();
  if (!Mutable)
  {
    NSLog((NSString *)CFSTR("Lexicon creation for %@ failed: %@"), a3, cf);
LABEL_14:

    v12 = 0;
    goto LABEL_17;
  }
  v10 = (const void *)Mutable;
  v22.receiver = self;
  v22.super_class = (Class)PRLexicon;
  v11 = -[PRLexicon init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_localization = (NSString *)CFSTR("External");
    v11->_name = (NSString *)objc_msgSend(a3, "copy");
    v12->_lexicon = v10;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(a4);
          LXLexiconAdd();
        }
        v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v14);
    }
  }
  else
  {
    CFRelease(v10);
  }
  self = v8;
LABEL_17:

  return v12;
}

+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4 cachedOnly:(BOOL)a5
{
  return (PRLexicon *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLocalization:unigramsPath:cachedOnly:", a3, a4, a5);
}

+ (PRLexicon)lexiconWithLocalization:(id)a3 unigramsPath:(id)a4
{
  return (PRLexicon *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLocalization:unigramsPath:", a3, a4);
}

+ (PRLexicon)lexiconWithLexicon:(const void *)a3
{
  return (PRLexicon *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLexicon:", a3);
}

+ (PRLexicon)lexiconWithName:(id)a3 words:(id)a4
{
  return (PRLexicon *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:words:", a3, a4);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRLexicon;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@(%@"), -[PRLexicon description](&v6, sel_description), self->_localization);
  v4 = v3;
  if (self->_unigramsPath)
    objc_msgSend(v3, "appendFormat:", CFSTR(":%@"), self->_unigramsPath);
  if (self->_name)
    objc_msgSend(v4, "appendFormat:", CFSTR(":%@"), self->_name);
  objc_msgSend(v4, "appendFormat:", CFSTR(")(%p"), self->_lexicon);
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

- (void)dealloc
{
  const void *lexicon;
  objc_super v4;

  lexicon = self->_lexicon;
  if (lexicon)
    CFRelease(lexicon);
  v4.receiver = self;
  v4.super_class = (Class)PRLexicon;
  -[PRLexicon dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (_LXLexicon)lexicon
{
  return (_LXLexicon *)self->_lexicon;
}

- (id)createCursor
{
  return -[PRLexiconCursor initWithLexicon:]([PRLexiconCursor alloc], "initWithLexicon:", self);
}

- (void)enumerateEntriesForString:(id)a3 usingBlock:(id)a4
{
  id v6;

  v6 = -[PRLexicon createCursor](self, "createCursor");
  objc_msgSend(v6, "advanceWithString:", a3);
  objc_msgSend(v6, "enumerateEntriesUsingBlock:", a4);

}

- (unsigned)tokenIDForString:(id)a3
{
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__PRLexicon_tokenIDForString___block_invoke;
  v5[3] = &unk_1EA8CD3C8;
  v5[4] = a3;
  v5[5] = &v6;
  -[PRLexicon enumerateEntriesForString:usingBlock:](self, "enumerateEntriesForString:usingBlock:", a3, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__PRLexicon_tokenIDForString___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if ((_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a5 = 1;
  }
  return result;
}

- (id)stringForTokenID:(unsigned int)a3
{
  uint64_t v3;
  const void *v4;
  void *v5;

  v3 = LXLexiconCopyEntryForTokenID();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (void *)LXEntryCopyString();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)getProbabilityForString:(id)a3 probability:(double *)a4
{
  int v5;
  BOOL v6;
  _QWORD v8[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0xC03E000000000000;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PRLexicon_getProbabilityForString_probability___block_invoke;
  v8[3] = &unk_1EA8CD4D8;
  v8[4] = a3;
  v8[5] = &v9;
  v8[6] = &v13;
  -[PRLexicon enumerateEntriesForString:usingBlock:](self, "enumerateEntriesForString:usingBlock:", a3, v8);
  v5 = *((unsigned __int8 *)v14 + 24);
  if (a4 && *((_BYTE *)v14 + 24))
    *a4 = v10[3];
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __49__PRLexicon_getProbabilityForString_probability___block_invoke(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if ((_DWORD)result)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (BOOL)getProbabilityForTokenID:(unsigned int)a3 probability:(double *)a4
{
  id v7;
  int v8;
  BOOL v9;
  _QWORD v11[6];
  unsigned int v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0xC03E000000000000;
  v7 = -[PRLexicon stringForTokenID:](self, "stringForTokenID:");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__PRLexicon_getProbabilityForTokenID_probability___block_invoke;
  v11[3] = &unk_1EA8CD500;
  v12 = a3;
  v11[4] = &v13;
  v11[5] = &v17;
  -[PRLexicon enumerateEntriesForString:usingBlock:](self, "enumerateEntriesForString:usingBlock:", v7, v11);
  v8 = *((unsigned __int8 *)v18 + 24);
  if (a4 && *((_BYTE *)v18 + 24))
    *a4 = v14[3];
  v9 = v8 != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __50__PRLexicon_getProbabilityForTokenID_probability___block_invoke(uint64_t result, double a2, uint64_t a3, int a4, uint64_t a5, _BYTE *a6)
{
  if (*(_DWORD *)(result + 48) == a4)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  id v8;

  v8 = -[PRLexicon createCursor](self, "createCursor");
  objc_msgSend(v8, "advanceWithString:", a3);
  objc_msgSend(v8, "enumerateCompletions:usingBlock:", a4, a5);

}

- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  id v8;

  v8 = -[PRLexicon createCursor](self, "createCursor");
  objc_msgSend(v8, "advanceWithString:", a3);
  objc_msgSend(v8, "enumerateCompletionEntries:usingBlock:", a4, a5);

}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 withBlock:(id)a5
{
  __int128 v6;
  const void *RootCursor;
  PRLexiconCorrectionCursor *v8;
  __CFBinaryHeap *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  _BOOL4 v18;
  const void *v19;
  PRLexiconCorrectionCursor *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  PRLexiconCorrectionCursor *v25;
  PRLexiconCorrectionCursor *v26;
  char v27;
  unint64_t v28;
  id v29;
  const __CFString *v30;
  BOOL v31;
  __CFBinaryHeap *heap;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  CFBinaryHeapCallBacks callBacks;

  v6 = *(_OWORD *)(MEMORY[0x1E0C9B330] + 16);
  *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B330];
  *(_OWORD *)&callBacks.release = v6;
  -[PRLexicon lexicon](self, "lexicon");
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  v8 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", RootCursor, 0, 0, 0, 0, 0);
  v29 = a3;
  v33 = objc_msgSend(a3, "length");
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  callBacks.compare = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))heapCorrectionCursorCompare;
  v9 = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks, 0);
  CFBinaryHeapAddValue(v9, v8);
  CFRelease(RootCursor);

  heap = v9;
  while (!*((_BYTE *)v35 + 24) && CFBinaryHeapGetCount(heap) >= 1)
  {
    CFBinaryHeapGetCount(heap);
    v10 = (id)CFBinaryHeapGetMinimum(heap);
    v11 = objc_msgSend(v10, "advancementLength");
    v12 = objc_msgSend(v10, "totalEdits");
    v13 = (const void *)objc_msgSend(v10, "cursor");
    CFBinaryHeapRemoveMinimumValue(heap);
    if (v11 < v33)
    {
      v14 = objc_msgSend(v29, "rangeOfComposedCharacterSequenceAtIndex:", v11);
      v16 = v15;
      v28 = v14;
      v30 = (const __CFString *)objc_msgSend(v29, "substringWithRange:");
      if (!v12 && v11)
        goto LABEL_14;
      objc_msgSend(v29, "substringFromIndex:", v11);
      v17 = (const void *)LXCursorCreateByAdvancing();
      if (!v17)
        goto LABEL_14;
LABEL_13:
      LXCursorEnumerateEntries();
      CFRelease(v17);
      goto LABEL_14;
    }
    if (!v12 && v11)
    {
      v31 = 0;
      v16 = 0;
      v30 = &stru_1EA8D8440;
      v28 = v33;
      goto LABEL_23;
    }
    v17 = CFRetain(v13);
    v16 = 0;
    v30 = &stru_1EA8D8440;
    v28 = v33;
    if (v17)
      goto LABEL_13;
LABEL_14:
    v18 = v12 == 0;
    v31 = v12 != 0;
    if (v11 >= v33 || v12)
      goto LABEL_22;
    v19 = (const void *)LXCursorCreateByAdvancing();
    if (v19)
    {
      v20 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v19, objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount"), objc_msgSend(v10, "transpositionsCount"), objc_msgSend(v10, "advancementLength") + v16);
      CFBinaryHeapAddValue(heap, v20);
      ++v39[3];

      CFRelease(v19);
    }
    if (!objc_msgSend(v10, "replacementsCount"))
      LXCursorEnumerateChildren();
    if (objc_msgSend(v10, "deletionsCount"))
    {
      v18 = 1;
LABEL_22:
      if (!v18)
        goto LABEL_29;
      goto LABEL_23;
    }
    v26 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v13, objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount") + 1, objc_msgSend(v10, "transpositionsCount"), objc_msgSend(v10, "advancementLength") + v16);
    CFBinaryHeapAddValue(heap, v26);
    ++v39[3];

LABEL_23:
    if (v11 + 1 < v33 && !objc_msgSend(v10, "transpositionsCount") && v28 + v16 < v33)
    {
      v21 = objc_msgSend(v29, "rangeOfComposedCharacterSequenceAtIndex:");
      v23 = v22;
      objc_msgSend((id)objc_msgSend(v29, "substringWithRange:", v21, v22), "stringByAppendingString:", v30);
      v24 = (const void *)LXCursorCreateByAdvancing();
      if (v24)
      {
        v25 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", v24, objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "replacementsCount"), objc_msgSend(v10, "deletionsCount"), objc_msgSend(v10, "transpositionsCount") + 1, v23 + v16 + objc_msgSend(v10, "advancementLength"));
        CFBinaryHeapAddValue(heap, v25);
        ++v39[3];

        CFRelease(v24);
      }
    }
LABEL_29:
    v27 = v11 > v33 || v31;
    if ((v27 & 1) == 0 && !objc_msgSend(v10, "insertionsCount"))
      LXCursorEnumerateChildren();

  }
  CFRelease(heap);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char MetaFlags;
  double v6;
  double v7;
  void *v8;
  const void *v9;

  LXEntryGetTokenID();
  MetaFlags = LXEntryGetMetaFlags();
  LXEntryGetProbability();
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "errorType");
  if ((MetaFlags & 0xC2) == 0)
  {
    v8 = (void *)LXEntryCopyString();
    if (v8)
    {
      v9 = v8;
      if ((unint64_t)objc_msgSend(v8, "length") >= 3
        && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v9) & 1) == 0)
      {
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(v7);
        if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 72))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          *a3 = 1;
        }
      }
      CFRelease(v9);
    }
  }
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *v4;
  PRLexiconCorrectionCursor *v5;

  v4 = (const void *)LXCursorCopyTraversedCharacters();
  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", v4) & 1) == 0)
  {
    v5 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", a2, objc_msgSend(*(id *)(a1 + 40), "replacementsCount") + 1, objc_msgSend(*(id *)(a1 + 40), "replacementsCount"), objc_msgSend(*(id *)(a1 + 40), "deletionsCount"), objc_msgSend(*(id *)(a1 + 40), "transpositionsCount"), *(_QWORD *)(a1 + 64) + objc_msgSend(*(id *)(a1 + 40), "advancementLength"));
    CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 72), v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  }
  CFRelease(v4);
}

void __72__PRLexicon_enumerateCorrectionEntriesForWord_maxCorrections_withBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  PRLexiconCorrectionCursor *v3;

  v3 = -[PRLexiconCorrectionCursor initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:]([PRLexiconCorrectionCursor alloc], "initWithCursor:replacementsCount:insertionsCount:deletionsCount:transpositionsCount:advancementLength:", a2, objc_msgSend(*(id *)(a1 + 32), "replacementsCount") + 1, objc_msgSend(*(id *)(a1 + 32), "replacementsCount"), objc_msgSend(*(id *)(a1 + 32), "deletionsCount"), objc_msgSend(*(id *)(a1 + 32), "transpositionsCount"), objc_msgSend(*(id *)(a1 + 32), "advancementLength"));
  CFBinaryHeapAddValue(*(CFBinaryHeapRef *)(a1 + 48), v3);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

@end
