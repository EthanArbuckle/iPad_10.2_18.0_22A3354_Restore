@implementation SRSSPhoneticChecker

- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4
{
  return -[SRSSPhoneticChecker initWithLocaleIdentifier:modelPath:syncronously:](self, "initWithLocaleIdentifier:modelPath:syncronously:", a3, a4, 0);
}

- (SRSSPhoneticChecker)initWithLocaleIdentifier:(id)a3 modelPath:(id)a4 syncronously:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  SRSSPhoneticChecker *v11;
  SRSSPhoneticChecker *v12;
  uint64_t v13;
  NSDictionary *phoneIds;
  uint64_t v15;
  NSMutableArray *lexiconWords;
  uint64_t v17;
  NSMutableArray *lexiconEntries;
  uint64_t v19;
  NSMutableArray *regionsToFree;
  NSObject *v21;
  _QWORD block[4];
  SRSSPhoneticChecker *v24;
  id v25;
  id v26;
  objc_super v27;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SRSSPhoneticChecker;
  v11 = -[SRSSPhoneticChecker init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_localeIdentifier, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    phoneIds = v12->_phoneIds;
    v12->_phoneIds = (NSDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    lexiconWords = v12->_lexiconWords;
    v12->_lexiconWords = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    lexiconEntries = v12->_lexiconEntries;
    v12->_lexiconEntries = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    regionsToFree = v12->_regionsToFree;
    v12->_regionsToFree = (NSMutableArray *)v19;

    if (-[SRSSPhoneticChecker _loadConfusionMatrixWithModelPath:localization:](v12, "_loadConfusionMatrixWithModelPath:localization:", v10, v9))
    {
      v12->_lexiconLoaded = 0;
      if (v5)
      {
        -[SRSSPhoneticChecker _loadLexiconWithModelPath:localization:](v12, "_loadLexiconWithModelPath:localization:", v10, v9);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v21 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __71__SRSSPhoneticChecker_initWithLocaleIdentifier_modelPath_syncronously___block_invoke;
        block[3] = &unk_2518FCB50;
        v24 = v12;
        v25 = v10;
        v26 = v9;
        dispatch_async(v21, block);

      }
    }
    else
    {
      v12->_lexiconLoaded = 1;
    }
  }

  return v12;
}

void __71__SRSSPhoneticChecker_initWithLocaleIdentifier_modelPath_syncronously___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x249584EDC]();
  objc_msgSend(*(id *)(a1 + 32), "_loadLexiconWithModelPath:localization:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v3;

  -[SRSSPhoneticChecker _freeLexicon](self, "_freeLexicon");
  v3.receiver = self;
  v3.super_class = (Class)SRSSPhoneticChecker;
  -[SRSSPhoneticChecker dealloc](&v3, sel_dealloc);
}

- (void)_freeLexicon
{
  NSMutableArray *lexiconEntries;
  NSMutableArray *lexiconWords;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  lexiconEntries = self->_lexiconEntries;
  self->_lexiconEntries = 0;

  lexiconWords = self->_lexiconWords;
  self->_lexiconWords = 0;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = self->_regionsToFree;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        free((void *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "pointerValue", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_freeLexiconEntry:(PhoneticLexiconEntry *)a3
{
  unint64_t v4;
  PhoneSequence *v5;

  if (a3->var1)
  {
    v4 = 0;
    do
    {
      v5 = a3->var0[v4];
      free(v5->var1);
      free(v5);
      ++v4;
    }
    while (v4 < a3->var1);
  }
  free(a3->var0);
  free(a3);
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4
{
  -[SRSSPhoneticChecker guessesForString:maxResults:phoneticWeight:priorWeight:maxThreads:](self, "guessesForString:maxResults:phoneticWeight:priorWeight:maxThreads:", a3, a4, 10, 1.0, 0.5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PhoneticLexiconEntry)copyLexiconEntriesForString:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  size_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  PhoneticLexiconEntry *v32;
  id v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t i;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "componentsSeparatedByCharactersInSet:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v35;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        v6 = -[NSMutableArray indexOfObject:](self->_lexiconWords, "indexOfObject:", v5);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_EARUserProfileBuilder pronunciationsForOrthography:](self->_builder, "pronunciationsForOrthography:", v5);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "count"))
          {
            v47 = malloc_type_malloc(0x14uLL, 0x10800401F59AC77uLL);
            v7 = objc_msgSend(v39, "count");
            v47[8] = v7;
            *(_QWORD *)v47 = malloc_type_malloc(8 * v7, 0x2004093837F09uLL);
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v41 = v39;
            v8 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
            if (v8)
            {
              LODWORD(v48) = 0;
              v42 = *(id *)v59;
              do
              {
                v45 = v8;
                v9 = 0;
                v48 = (int)v48;
                do
                {
                  if (*(id *)v59 != v42)
                    objc_enumerationMutation(v41);
                  v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v9);
                  v11 = malloc_type_malloc(0x10uLL, 0x101004032DCA59EuLL);
                  *(_QWORD *)(*(_QWORD *)v47 + 8 * v48) = v11;
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = 0u;
                  v57 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v14 = v13;
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
                  if (v15)
                  {
                    v16 = *(_QWORD *)v55;
                    do
                    {
                      for (j = 0; j != v15; ++j)
                      {
                        if (*(_QWORD *)v55 != v16)
                          objc_enumerationMutation(v14);
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j)));
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "addObject:", v18);

                      }
                      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
                    }
                    while (v15);
                  }

                  v19 = objc_msgSend(v12, "count");
                  *(_BYTE *)v11 = v19;
                  v11[1] = malloc_type_malloc(v19, 0x100004077774924uLL);
                  if (v19)
                  {
                    for (k = 0; k != v19; ++k)
                    {
                      objc_msgSend(v12, "objectAtIndexedSubscript:", k);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_BYTE *)(v11[1] + k) = objc_msgSend(v21, "intValue");

                    }
                  }
                  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v47);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "addObject:", v22);

                  ++v48;
                  ++v9;
                }
                while (v9 != v45);
                v8 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
              }
              while (v8);
            }

          }
          else
          {
            v41 = v39;
          }
        }
        else
        {
          -[NSMutableArray objectAtIndex:](self->_lexiconEntries, "objectAtIndex:", v6);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:");
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v37);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = v44;
  v23 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v23)
  {
    v46 = 0;
    v24 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v51 != v24)
          objc_enumerationMutation(v43);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "pointerValue");
        v27 = v46 * *(unsigned __int8 *)(v26 + 8);
        v28 = 8 / v46;
        if (v27 < 9)
          v28 = *(unsigned __int8 *)(v26 + 8);
        else
          v27 = 8 / v46 * v46;
        if (v46)
        {
          v29 = v28;
        }
        else
        {
          v27 = *(unsigned __int8 *)(v26 + 8);
          v29 = v27;
        }
        if (v27 >= 8)
          v30 = 8;
        else
          v30 = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObject:", v31);
        v46 = v30;

      }
      v23 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v23);
  }
  else
  {
    v46 = 0;
  }

  v32 = (PhoneticLexiconEntry *)malloc_type_malloc(0x14uLL, 0x10800401F59AC77uLL);
  v32->var1 = v46;
  v32->var0 = (PhoneSequence **)malloc_type_malloc(8 * v46, 0x80040B8603338uLL);

  return v32;
}

- (id)_partitionEntriesWithCount:(unint64_t)a3 partitionCount:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = 0;
    v8 = 0;
    v9 = a3 / a4;
    v10 = a3 % a4 + a3 / a4;
    do
    {
      if (v7)
        v11 = v9;
      else
        v11 = v10;
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v12);
      v8 += v11;

      ++v7;
    }
    while (a4 != v7);
  }
  return v6;
}

- (id)phoneDescription:(PhoneSequence *)a3
{
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3->var0)
  {
    v5 = 0;
    v6 = &stru_2518FD7B8;
    do
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[NSDictionary allKeys](self->_phoneIds, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(obj);
            v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](self->_phoneIds, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "intValue") == a3->var1[v5])
            {
              -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "stringByAppendingString:", CFSTR("."));
              v13 = objc_claimAutoreleasedReturnValue();

              v6 = (__CFString *)v13;
            }

          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v7);
      }

      ++v5;
    }
    while (v5 < a3->var0);
  }
  else
  {
    v6 = &stru_2518FD7B8;
  }
  NSLog(CFSTR("%@"), v6);
  return v6;
}

- (void)_waitOnLexiconLoad
{
  while (!self->_lexiconLoaded)
    usleep(0x3E8u);
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6
{
  -[SRSSPhoneticChecker guessesForString:maxResults:phoneticWeight:priorWeight:maxThreads:](self, "guessesForString:maxResults:phoneticWeight:priorWeight:maxThreads:", a3, a4, 8, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)guessesForString:(id)a3 maxResults:(unint64_t)a4 phoneticWeight:(double)a5 priorWeight:(double)a6 maxThreads:(unint64_t)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PhoneticLexiconEntry *v26;
  NSObject *group;
  void *v28;
  id v29;
  _QWORD block[6];
  id v31;
  id v32;
  PhoneticLexiconEntry *v33;
  double v34;
  double v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  -[SRSSPhoneticChecker _waitOnLexiconLoad](self, "_waitOnLexiconLoad");
  if ((unint64_t)-[NSMutableArray count](self->_lexiconEntries, "count") >= 0x3E8)
  {
    v26 = -[SRSSPhoneticChecker copyLexiconEntriesForString:](self, "copyLexiconEntriesForString:", v29);
    group = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[SRSSPhoneticChecker _partitionEntriesWithCount:partitionCount:](self, "_partitionEntriesWithCount:partitionCount:", -[NSMutableArray count](self->_lexiconEntries, "count"), a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v17 = a4;
          v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v16);
          objc_msgSend(MEMORY[0x24BDBCEB8], "array", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v19);
          dispatch_get_global_queue(0, 0);
          v20 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke;
          block[3] = &unk_2518FCBE0;
          block[4] = v18;
          block[5] = self;
          v34 = a5;
          v35 = a6;
          v33 = v26;
          v31 = v19;
          a4 = v17;
          v36 = v17;
          v32 = v29;
          v21 = v19;
          dispatch_group_async(group, v20, block);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    -[SRSSPhoneticChecker _freeLexiconEntry:](self, "_freeLexiconEntry:", v26);
    objc_msgSend(v28, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count") > a4)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectsAtIndexes:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v24;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

void __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_2;
  v7[3] = &unk_2518FCBB8;
  v2 = *(_QWORD *)(a1 + 64);
  v10 = v14;
  v11 = v2;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = *(_OWORD *)(a1 + 72);
  v7[4] = v3;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 88);
  v8 = v5;
  v13 = v6;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);

  _Block_object_dispose(v14, 8);
}

void __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  long double v8;
  double v9;
  double v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  double *v22;
  unint64_t v23;
  unsigned __int8 *v24;
  double *v25;
  unsigned int v26;
  double v27;
  double *v28;
  double v29;
  unint64_t v30;
  unsigned __int8 *v31;
  unsigned int v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  double *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  double *v39;
  unsigned int v40;
  unsigned int v41;
  double v42;
  double v43;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  long double v50;
  double v51;
  long double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;

  v3 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a2);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 32) + 24), "objectAtIndexedSubscript:", a2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v57, "pointerValue");
  v5 = *(_QWORD *)(v3 + 64);
  if (v5)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0.0;
    v9 = 1.79769313e308;
    v10 = 0.0;
    v59 = v4;
    v60 = v3;
    do
    {
      if (v7 >= *(unsigned __int8 *)(v5 + 8))
        break;
      if (*(_BYTE *)(v6 + 8))
      {
        v11 = 0;
        v61 = v7;
        v62 = *(_BYTE **)(*(_QWORD *)v5 + 8 * v7);
        do
        {
          v63 = v11;
          v12 = *(unsigned __int8 **)(*(_QWORD *)v6 + 8 * v11);
          v13 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 48);
          v64 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 40);
          v14 = *v62;
          v15 = *v12;
          if (v14 <= v15)
            v16 = *v12;
          else
            v16 = *v62;
          if (v14 <= v15)
            v17 = v12;
          else
            v17 = v62;
          if (v14 >= v15)
            v18 = *v12;
          else
            v18 = *v62;
          if (v14 <= v15)
            v12 = v62;
          v19 = (unsigned __int8 *)*((_QWORD *)v12 + 1);
          v20 = (unsigned __int8 *)*((_QWORD *)v17 + 1);
          v21 = (v18 + 1);
          v22 = (double *)malloc_type_malloc((8 * (v21 + v21 * v16)), 0x100004000313F17uLL);
          bzero(v22, (8 * (v21 + v21 * v16)));
          if (v18)
          {
            if (v15 >= v14)
              v23 = v14;
            else
              v23 = v15;
            v24 = v19;
            v25 = v22;
            do
            {
              v26 = *v24++;
              v27 = *v25 + *(double *)(v13 + 8 * v64 * (unint64_t)v26);
              v25 += v16;
              *v25 = v27;
              --v23;
            }
            while (v23);
          }
          if ((_DWORD)v16)
          {
            v28 = v22 + 1;
            v29 = *v22;
            if (v15 <= v14)
              v30 = v14;
            else
              v30 = v15;
            v31 = v20;
            do
            {
              v32 = *v31++;
              v29 = v29 + *(double *)(v13 + 8 * v32);
              *v28++ = v29;
              --v30;
            }
            while (v30);
          }
          if (v18)
          {
            v33 = v16;
            v34 = v22;
            v35 = 1;
            do
            {
              v36 = v34;
              v37 = v20;
              v38 = v16;
              v39 = v34;
              do
              {
                v40 = *v37++;
                v41 = v64 * v19[v35 - 1];
                v42 = *(double *)(v13 + 8 * v41);
                v43 = *(double *)(v13 + 8 * v40);
                v44 = v41 + v40;
                v45 = v39[1];
                ++v39;
                v46 = v42 + v45;
                v47 = v43 + v36[v16];
                if (v46 >= v47)
                  v46 = v47;
                if (*(double *)(v13 + 8 * v44) + *v36 < v46)
                  v46 = *(double *)(v13 + 8 * v44) + *v36;
                v36[v33 + 1] = v46;
                v36 = v39;
                --v38;
              }
              while (v38);
              ++v35;
              v34 = (double *)((char *)v34 + v33 * 8);
            }
            while (v35 != v21);
          }
          v48 = v22[(v21 * v16)];
          free(v22);
          if (v48 >= 100.0)
          {
            v6 = v59;
            v3 = v60;
          }
          else
          {
            if (v48 < v9)
              v9 = v48;
            v6 = v59;
            v3 = v60;
            v8 = *(double *)(v59 + 12);
            v49 = v48 * *(double *)(v60 + 72);
            v50 = log(v8);
            v51 = *(double *)(v60 + 80);
            v52 = -(v49 + -v50 * v51);
            LOBYTE(v51) = *v62;
            v53 = exp(v52 / (double)*(unint64_t *)&v51);
            if (v53 > v10)
              v10 = v53;
          }
          v7 = v61;
          v11 = v63 + 1;
        }
        while (v63 + 1 < (unint64_t)*(unsigned __int8 *)(v6 + 8));
        v5 = *(_QWORD *)(v3 + 64);
      }
      ++v7;
    }
    while (v5);
    if (v9 < 100.0
      && (v10 > *(double *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24)
       || (unint64_t)objc_msgSend(*(id *)(v3 + 40), "count") < *(_QWORD *)(v3 + 88))
      && objc_msgSend(v58, "compare:", *(_QWORD *)(v3 + 48)))
    {
      v54 = (void *)objc_opt_new();
      objc_msgSend(v54, "setScore:", v10);
      objc_msgSend(v54, "setText:", v58);
      objc_msgSend(v54, "setPrior:", (double)v8);
      objc_msgSend(v54, "setPhoneticSimilarity:", v9);
      objc_msgSend(*(id *)(v3 + 40), "addObject:", v54);
      if ((unint64_t)objc_msgSend(*(id *)(v3 + 40), "count") > *(_QWORD *)(v3 + 88))
      {
        objc_msgSend(*(id *)(v3 + 40), "sortUsingComparator:", &__block_literal_global);
        objc_msgSend(*(id *)(v3 + 40), "removeLastObject");
      }
      objc_msgSend(*(id *)(v3 + 40), "lastObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "score");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8) + 24) = v56;

    }
  }

}

uint64_t __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "score");
    v11 = v10;
    objc_msgSend(v5, "score");
    if (v11 < v12)
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

uint64_t __89__SRSSPhoneticChecker_guessesForString_maxResults_phoneticWeight_priorWeight_maxThreads___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "score");
    v11 = v10;
    objc_msgSend(v5, "score");
    if (v11 < v12)
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

- (unsigned)_phoneForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSDictionary *phoneIds;
  void *v9;
  void *v10;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_phoneIds, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "intValue");
  }
  else
  {
    phoneIds = self->_phoneIds;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSDictionary count](phoneIds, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](phoneIds, "setValue:forKey:", v9, v4);

    -[NSDictionary objectForKey:](self->_phoneIds, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "intValue");
    v6 = v10;
  }

  return v7;
}

- (BOOL)_loadConfusionMatrixWithModelPath:(id)a3 localization:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  unint64_t i;
  void **v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t j;
  void *v24;
  void **v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void **v29;
  void *v30;
  unsigned int v31;
  uint64_t *v32;
  BOOL v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51[2];
  uint64_t v52;
  uint64_t *v53;
  id v54;
  id v55;
  void *__p[2];
  uint64_t v57;
  _QWORD v58[4];

  v58[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = a4;
  v7 = (void *)MEMORY[0x24BDBCF48];
  v48 = v6;
  v58[0] = v6;
  v58[1] = CFSTR("mini.json");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPathComponents:", v8);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v49, 0, &v55);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v55;
  if (v46)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v47, "length"))
  {
    v54 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v47, 0, &v54);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v54;
  }
  else
  {
    v9 = 0;
    v46 = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("phonetic-match-building"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("phonomap-file"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v50, "length"))
  {
    objc_msgSend(v48, "stringByAppendingPathComponent:", v50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v44 = objc_retainAutorelease(v11);
    std::string::basic_string[abi:ne180100]<0>(v51, (char *)objc_msgSend(v44, "UTF8String"));
    v12 = operator new();
    *(_OWORD *)__p = *(_OWORD *)v51;
    v57 = v52;
    v51[1] = 0;
    v52 = 0;
    v51[0] = 0;
    CMDPPhonomap::CMDPPhonomap(v12, __p);
    v53 = (uint64_t *)v12;
    if (SHIBYTE(v57) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v52) < 0)
      operator delete(v51[0]);
    v13 = 0;
    v15 = v53[1];
    v14 = v53[2];
    while ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 120))(v14) > v13)
    {
      (*(void (**)(void **__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v15 + 72))(__p, v15, v13);
      if (v57 >= 0)
        v16 = __p;
      else
        v16 = (void **)__p[0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", v17);

      if (SHIBYTE(v57) < 0)
        operator delete(__p[0]);
      ++v13;
    }
    for (i = 0; (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 120))(v15) > i; ++i)
    {
      (*(void (**)(void **__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v15 + 72))(__p, v15, i);
      if (v57 >= 0)
        v19 = __p;
      else
        v19 = (void **)__p[0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", v20);

      if (SHIBYTE(v57) < 0)
        operator delete(__p[0]);
    }
    v21 = -[NSDictionary count](self->_phoneIds, "count");
    self->_phoneCount = v21;
    v22 = 0;
    self->_confusionMatrix = (double *)malloc_type_malloc(8 * v21 * v21, 0x68FFC8EEuLL);
    while ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 120))(v14) > v22)
    {
      for (j = 0; (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 120))(v15) > j; ++j)
      {
        v24 = (void *)MEMORY[0x24BDD17C8];
        (*(void (**)(void **__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v14 + 72))(__p, v14, v22);
        if (v57 >= 0)
          v25 = __p;
        else
          v25 = (void **)__p[0];
        objc_msgSend(v24, "stringWithUTF8String:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", v26);

        if (SHIBYTE(v57) < 0)
          operator delete(__p[0]);
        v28 = (void *)MEMORY[0x24BDD17C8];
        (*(void (**)(void **__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v15 + 72))(__p, v15, j);
        if (v57 >= 0)
          v29 = __p;
        else
          v29 = (void **)__p[0];
        objc_msgSend(v28, "stringWithUTF8String:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", v30);

        if (SHIBYTE(v57) < 0)
          operator delete(__p[0]);
        self->_confusionMatrix[v31 + self->_phoneCount * v27] = *(float *)(*(_QWORD *)(v53[3] + 24 * v22) + 4 * j);
      }
      ++v22;
    }
    v32 = v53;
    v53 = 0;
    if (v32)
      std::default_delete<CMDPPhonomap>::operator()[abi:ne180100]((uint64_t)&v53, v32);
    v33 = 1;
    v34 = v44;
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "URLForResource:withExtension:", CFSTR("phonomaps"), CFSTR("plist"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    v33 = 0;
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKey:", v45);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v38, "length"))
  {
    objc_msgSend(v45, "componentsSeparatedByString:", CFSTR("_"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v40, "length"))
    {
      objc_msgSend(v37, "objectForKey:", v40);
      v41 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v41;
    }

  }
  if (objc_msgSend(v38, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "pathForResource:ofType:", v38, CFSTR("fst"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }

  v33 = 0;
LABEL_47:

LABEL_48:
  return v33;
}

- (BOOL)_loadConfusionMatrixFromJsonFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  unint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", CFSTR("_"));
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v4, 0, &v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v33;
  if (v6)
  {
    v7 = v6;
LABEL_3:
    v8 = 0;
    v9 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v7 = 0;
    goto LABEL_3;
  }
  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v32;
  objc_msgSend(v8, "objectForKey:", CFSTR("recs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("refs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v21;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v22;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        -[SRSSPhoneticChecker _phoneForString:](self, "_phoneForString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v15);
  }

  v18 = -[NSDictionary count](self->_phoneIds, "count");
  self->_phoneCount = v18;
  self->_confusionMatrix = (double *)malloc_type_malloc(8 * v18 * v18, 0xC6529EA5uLL);
  objc_msgSend(v8, "objectForKey:", CFSTR("confusionMatrix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __56__SRSSPhoneticChecker__loadConfusionMatrixFromJsonFile___block_invoke;
  v23[3] = &unk_2518FCC28;
  v23[4] = self;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v23);

  v9 = 1;
LABEL_20:

  return v9;
}

void __56__SRSSPhoneticChecker__loadConfusionMatrixFromJsonFile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v7 = v6;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
    NSLog(CFSTR("Unexpected entry count for phone confusion matrix.  Should be 2."));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "_phoneForString:", v9);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "_phoneForString:", v12);

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 40);
  if (v15 <= v10 || v15 <= v13)
    NSLog(CFSTR("Unexpected phone in confusion matrix.  Phone was not present in rec or ref phone list."));
  else
    *(double *)(*(_QWORD *)(v14 + 48) + 8 * (v13 + v15 * v10)) = -v7;

}

- (void)_loadLexiconWithModelPath:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _EARUserProfileBuilder *v15;
  _EARUserProfileBuilder *builder;
  _QWORD v17[18];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[5];

  v6 = a3;
  v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD58]), "initWithLocalization:", v7);
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("mini.json"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ncs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("en_US_napg.json"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("vocdelta.voc"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("pg.voc"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("mrec.psh"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_EARUserProfileBuilder *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E750]), "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:", v9, CFSTR("en_US"), 0, v11, v12, v13, v14);
  builder = self->_builder;
  self->_builder = v15;

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__SRSSPhoneticChecker__loadLexiconWithModelPath_localization___block_invoke;
  v17[3] = &unk_2518FCC50;
  v17[4] = self;
  v17[5] = v18;
  v17[6] = v22;
  v17[7] = v26;
  v17[8] = v30;
  v17[9] = v20;
  v17[10] = v23;
  v17[11] = v27;
  v17[12] = v21;
  v17[13] = v25;
  v17[14] = v29;
  v17[15] = v19;
  v17[16] = v24;
  v17[17] = v28;
  objc_msgSend(v8, "enumerateCompletionsForPrefix:usingBlock:", &stru_2518FD7B8, v17);
  self->_lexiconLoaded = 1;
  _Block_object_dispose(v18, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

}

void __62__SRSSPhoneticChecker__loadLexiconWithModelPath_localization___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  long double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *context;
  id v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v45 = a2;
  context = (void *)MEMORY[0x249584EDC]();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 0x9C41uLL)
    *a3 = 1;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(v45, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pronunciationsForOrthography:", v6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  v9 = v8 + 1;
  if ((unint64_t)(v8 + 1) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_QWORD *)(v7 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5000;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = malloc_type_malloc(0x186A0uLL, 0x10800401F59AC77uLL);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v7 + 24);
    v9 = v8 + 1;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  *(_QWORD *)(v7 + 24) = v9;
  *(_BYTE *)(v12 + 20 * v8 + 8) = objc_msgSend(v46, "count");
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if ((unint64_t)(objc_msgSend(v46, "count") + v13) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 5000;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = malloc_type_malloc(0x9C40uLL, 0x2004093837F09uLL);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  v49 = v12 + 20 * v8;
  *(_QWORD *)v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
                 + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v46, "count");
  objc_msgSend(v45, "probability");
  *(long double *)(v49 + 12) = exp(v16);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v46;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v50)
  {
    LODWORD(v52) = 0;
    v48 = *(_QWORD *)v58;
    do
    {
      v51 = 0;
      v52 = (int)v52;
      do
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v51);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v54 != v22)
                objc_enumerationMutation(v20);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(*(id *)(a1 + 32), "_phoneForString:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i)));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v24);

            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          }
          while (v21);
        }

        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v26 = *(_QWORD *)(v25 + 24);
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
        {
          *(_QWORD *)(v25 + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 5000;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = malloc_type_malloc(0x13880uLL, 0x101004032DCA59EuLL);
          v28 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v29);

          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          v26 = *(_QWORD *)(v25 + 24);
          v27 = v26 + 1;
        }
        v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        *(_QWORD *)(v25 + 24) = v27;
        v31 = objc_msgSend(v18, "count");
        v32 = (_BYTE *)(v30 + 16 * v26);
        *v32 = v31;
        v33 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v34 = *(_QWORD *)(v33 + 24);
        if ((unint64_t)(v34 + v31) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
        {
          *(_QWORD *)(v33 + 24) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 5000;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = malloc_type_malloc(0x1388uLL, 0x100004077774924uLL);
          v35 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v36);

          v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
        }
        v37 = v30 + 16 * v26;
        *(_QWORD *)(v37 + 8) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) + v34;
        v38 = (_QWORD *)(v37 + 8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) += v31;
        if (v31)
        {
          for (j = 0; j != v31; ++j)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", j);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_BYTE *)(*v38 + j) = objc_msgSend(v40, "intValue");

          }
        }
        *(_QWORD *)(*(_QWORD *)v49 + 8 * v52) = v32;

        ++v51;
        ++v52;
      }
      while (v51 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v50);
  }

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v49);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v45, "string");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObject:", v43);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v41);
  objc_autoreleasePoolPop(context);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_regionsToFree, 0);
  objc_storeStrong((id *)&self->_phoneIds, 0);
  objc_storeStrong((id *)&self->_lexiconEntries, 0);
  objc_storeStrong((id *)&self->_lexiconWords, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
