@implementation RELemmaEnumerator

- (RELemmaEnumerator)init
{
  RELemmaEnumerator *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  NLTagger *tagger;
  objc_super v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18[2];
  __int128 v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)RELemmaEnumerator;
  v2 = -[RELemmaEnumerator init](&v13, sel_init);
  if (v2)
  {
    if (!NaturalLanguageLibraryCore_frameworkLibrary)
    {
      v19 = xmmword_24CF8AC18;
      v20 = 0;
      NaturalLanguageLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (NaturalLanguageLibraryCore_frameworkLibrary)
    {
      *(_QWORD *)&v19 = 0;
      *((_QWORD *)&v19 + 1) = &v19;
      v20 = 0x2020000000;
      v3 = (id *)getNLTagSchemeLanguageSymbolLoc_ptr;
      v21 = (void *)getNLTagSchemeLanguageSymbolLoc_ptr;
      if (!getNLTagSchemeLanguageSymbolLoc_ptr)
      {
        v4 = (void *)NaturalLanguageLibrary();
        v3 = (id *)dlsym(v4, "NLTagSchemeLanguage");
        *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24) = v3;
        getNLTagSchemeLanguageSymbolLoc_ptr = (uint64_t)v3;
      }
      _Block_object_dispose(&v19, 8);
      if (!v3)
      {
        -[RELemmaEnumerator init].cold.1();
        __break(1u);
      }
      v18[0] = *v3;
      v5 = v18[0];
      getNLTagSchemeLemma();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v15 = &v14;
      v16 = 0x2050000000;
      v8 = (void *)getNLTaggerClass_softClass;
      v17 = getNLTaggerClass_softClass;
      if (!getNLTaggerClass_softClass)
      {
        *(_QWORD *)&v19 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v19 + 1) = 3221225472;
        v20 = (uint64_t)__getNLTaggerClass_block_invoke;
        v21 = &unk_24CF8AC38;
        v22 = &v14;
        __getNLTaggerClass_block_invoke((uint64_t)&v19);
        v8 = (void *)v15[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v14, 8);
      v10 = objc_msgSend([v9 alloc], "initWithTagSchemes:", v7);
      tagger = v2->_tagger;
      v2->_tagger = (NLTagger *)v10;

    }
  }
  return v2;
}

- (BOOL)enumerateLemmasInString:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NLTagger *tagger;
  void *v9;
  void *v10;
  BOOL v11;
  NLTagger *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    tagger = self->_tagger;
    if (tagger)
    {
      -[NLTagger setString:](tagger, "setString:", v6);
      -[NLTagger dominantLanguage](self->_tagger, "dominantLanguage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("und")) & 1) == 0)
      {
        v12 = self->_tagger;
        v13 = objc_msgSend(v6, "length");
        getNLTagSchemeLemma();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __55__RELemmaEnumerator_enumerateLemmasInString_withBlock___block_invoke;
        v16[3] = &unk_24CF8ABF8;
        v17 = v6;
        v18 = v7;
        -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](v12, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v13, 0, v14, 14, v16);

        v11 = 1;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

void __55__RELemmaEnumerator_enumerateLemmasInString_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a2;
  v10 = v7;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagger, 0);
}

- (uint64_t)init
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getNLTaggerClass_block_invoke_cold_1(v0);
}

@end
