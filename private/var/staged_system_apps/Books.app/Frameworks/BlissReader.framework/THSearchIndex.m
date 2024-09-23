@implementation THSearchIndex

- (THSearchIndex)initWithContext:(id)a3
{
  THSearchIndex *v3;
  objc_super v5;
  __int128 v6;
  __int16 v7;

  v5.receiver = self;
  v5.super_class = (Class)THSearchIndex;
  v3 = -[THSearchIndex initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
  {
    v3->mTerms = objc_alloc_init(TSLSearchTree);
    v3->mReferences = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v3->mStemmer = -[TSLStemmer initWithLocale:]([TSLStemmer alloc], "initWithLocale:", 0);
    v6 = xmmword_3146C0;
    v7 = 4;
    v3->mParagraphBreakCharacterSet = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v6, 9));
  }
  return v3;
}

- (void)unload
{

  -[TSUNoCopyDictionary removeAllObjects](self->mReferences, "removeAllObjects");
  self->mTerms = objc_alloc_init(TSLSearchTree);

  self->mStemmer = -[TSLStemmer initWithLocale:]([TSLStemmer alloc], "initWithLocale:", 0);
  self->mLoaded = 0;
  self->mAllCfisLoaded = 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THSearchIndex;
  -[THSearchIndex dealloc](&v3, "dealloc");
}

- (id)addTermWithStem:(id)a3
{
  THModelSearchIndexTerm *v5;
  THModelSearchIndexTerm *v6;

  -[THSearchIndex willModify](self, "willModify");
  v5 = -[THModelSearchIndexTerm initWithStem:]([THModelSearchIndexTerm alloc], "initWithStem:", a3);
  -[TSLSearchTree insertWord:value:](self->mTerms, "insertWord:value:", a3, v5);
  v6 = v5;
  return v5;
}

- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7
{
  THModelSearchResult *v8;

  v8 = -[THModelSearchResult initWithTerm:rank:cfi:pageNumber:displayPageNumber:occurrenceIndex:context:]([THModelSearchResult alloc], "initWithTerm:rank:cfi:pageNumber:displayPageNumber:occurrenceIndex:context:", a3, a5->var0, -[TSUNoCopyDictionary objectForKey:](self->mReferences, "objectForKey:", a5->var4), a5->var2, a5->var3, a6, a4);
  if (a7)
    -[THModelSearchResult setOccurenceCount:](v8, "setOccurenceCount:", (char *)objc_msgSend(a7, "occurenceCount") + 1);
  return v8;
}

- (BOOL)p_isIndexedWord:(id)a3
{
  TSLSearchTree *mTerms;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  mTerms = self->mTerms;
  v5 = -[TSLStemmer stemWord:](self->mStemmer, "stemWord:");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D90D4;
  v7[3] = &unk_429388;
  v7[4] = a3;
  v7[5] = &v8;
  -[TSLSearchTree enumerateWordsForPrefix:withBlock:](mTerms, "enumerateWordsForPrefix:withBlock:", v5, v7);
  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (id)p_firstIndexedWordInQuery:(id)a3 outWordRange:(_NSRange *)a4 outHasMultipleWords:(BOOL *)a5
{
  __CFStringTokenizer *v9;
  __CFStringTokenizer *v10;
  const __CFString *v11;
  NSUInteger length;
  char v13;
  NSUInteger location;
  CFRange CurrentTokenRange;
  const __CFString *v16;
  BOOL v17;
  _NSRange *v19;
  CFRange v20;

  v20.length = (CFIndex)objc_msgSend(a3, "length");
  v20.location = 0;
  v9 = CFStringTokenizerCreate(0, (CFStringRef)a3, v20, 0, 0);
  if (v9)
  {
    v10 = v9;
    v19 = a4;
    if (CFStringTokenizerAdvanceToNextToken(v9))
    {
      v11 = 0;
      length = 0;
      v13 = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v10);
        v16 = (id)CFStringCreateWithSubstring(0, (CFStringRef)a3, CurrentTokenRange);
        if (v11)
        {
          v13 = 1;
          if (-[THSearchIndex p_isIndexedWord:](self, "p_isIndexedWord:", v11))
            break;
        }
        v11 = v16;
        location = CurrentTokenRange.location;
        length = CurrentTokenRange.length;
      }
      while (CFStringTokenizerAdvanceToNextToken(v10));
    }
    else
    {
      length = 0;
      v11 = 0;
      v13 = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
    }
    CFRelease(v10);
    v17 = v13 & 1;
    a4 = v19;
    if (a5)
      goto LABEL_12;
  }
  else
  {
    v17 = 0;
    length = 0;
    v11 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    if (a5)
LABEL_12:
      *a5 = v17;
  }
  if (a4)
  {
    a4->location = location;
    a4->length = length;
  }
  return (id)v11;
}

- (id)resultsForQuery:(id)a3 occurrenceMap:(id)a4 searchContextMap:(id)a5 suggestions:(BOOL)a6
{
  BOOL v6;
  id v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  int v23;
  void *v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  uint64_t v31;
  _BOOL4 v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  int v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  CFIndex v51;
  char *v52;
  CFRange v53;
  __CFStringTokenizer *v54;
  __CFStringTokenizer *v55;
  CFRange CurrentTokenRange;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id obj;
  uint64_t v69;
  id v72;
  uint64_t v73;
  _BOOL4 v74;
  id v75;
  id v76;
  THSearchIndex *v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  __CFString *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  char v92;
  _BYTE v93[128];
  _BYTE v94[128];

  v6 = a6;
  v74 = a6;
  if (!a3)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:]");
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndex.m");
    v12 = v10;
    v6 = v74;
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v12, v11, 175, CFSTR("Got a nil query"));
  }
  v13 = objc_msgSend(a3, "lowercaseString");
  v75 = +[NSMutableSet set](NSMutableSet, "set");
  v92 = 0;
  v91 = xmmword_3146B0;
  v81 = v13;
  if (-[THSearchIndex p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:](self, "p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:", v13, &v91, &v92)&& (_QWORD)v91 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v77 = self;
    v78 = objc_alloc_init((Class)NSMutableDictionary);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = objc_msgSend(a4, "allKeys");
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (!v72)
      goto LABEL_87;
    v69 = *(_QWORD *)v88;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v88 != v69)
          objc_enumerationMutation(obj);
        v73 = v14;
        v15 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v14);
        v16 = (__CFString *)objc_msgSend(a5, "objectForKey:", v15);
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v76 = objc_msgSend(a4, "objectForKey:", v15);
        v80 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
        if (v80)
        {
          v79 = *(_QWORD *)v84;
          v82 = v16;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v84 != v79)
                objc_enumerationMutation(v76);
              v18 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v17);
              v19 = objc_msgSend(objc_msgSend(v18, "first"), "inflection");
              v20 = (unsigned __int16 *)objc_msgSend(v18, "second");
              v21 = v20;
              v22 = v20[1];
              if (v92)
              {
                v23 = v20[1];
                v24 = v81;
                if (*v20 == 1)
                {
                  v25 = 1;
                  v24 = v81;
LABEL_21:
                  if ((objc_msgSend(v19, "hasPrefix:", v24) & 1) == 0)
                    goto LABEL_78;
                  v27 = 0;
                  v28 = 0;
                  v29 = 1;
                  if (!v6)
                  {
LABEL_41:
                    if (v29)
                      v41 = v19;
                    else
                      v41 = v24;
                    v42 = -[THSearchIndex p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:](v77, "p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:", v41, v82, v21, v22, 0);
                    objc_msgSend(v75, "addObject:", v42);

                    goto LABEL_78;
                  }
LABEL_57:
                  v47 = objc_msgSend(v19, "lowercaseString");
                  v48 = objc_msgSend(v78, "objectForKey:", v47);
                  v49 = v48;
                  if (v48 && (int)objc_msgSend(v48, "rank") <= *v21)
                  {
                    objc_msgSend(v49, "setOccurenceCount:", (char *)objc_msgSend(v49, "occurenceCount") + 1);
                  }
                  else
                  {
                    v50 = -[THSearchIndex p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:](v77, "p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:", v47, v82, v21, v22, v49);
                    objc_msgSend(v78, "setObject:forKey:", v50, v47);

                  }
                  if (((v29 | v25 ^ 1) & 1) == 0 && (unint64_t)objc_msgSend(v81, "length") >= 3)
                  {
                    v51 = v28 + v27;
                    v52 = (char *)-[__CFString length](v82, "length");
                    v53.length = (CFIndex)(v28 + v27 <= v28 + 1 ? &v52[-v51] : &v52[-v28 - v27 + 1]);
                    v53.location = v51 - (v51 > v28 + 1);
                    v54 = CFStringTokenizerCreate(0, v82, v53, 0, 0);
                    if (v54)
                    {
                      v55 = v54;
                      if (CFStringTokenizerAdvanceToNextToken(v54))
                      {
                        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v55);
                        v57 = -[__CFString substringWithRange:](v82, "substringWithRange:", v28, CurrentTokenRange.length - v28 + CurrentTokenRange.location);
                        if (objc_msgSend(v57, "length"))
                        {
                          v58 = objc_msgSend(v57, "lowercaseString");
                          v59 = objc_msgSend(v78, "objectForKey:", v58);
                          v60 = v59;
                          if (v59 && (int)objc_msgSend(v59, "rank") <= *v21)
                          {
                            if ((objc_msgSend(v47, "isEqualToString:", v58) & 1) == 0)
                              objc_msgSend(v60, "setOccurenceCount:", (char *)objc_msgSend(v60, "occurenceCount") + 1);
                          }
                          else
                          {
                            v61 = -[THSearchIndex p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:](v77, "p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:", v58, v82, v21, v22, v60);
                            objc_msgSend(v78, "setObject:forKey:", v61, v58);

                          }
                          if (CurrentTokenRange.location > (unint64_t)v51)
                          {
                            v62 = objc_msgSend(v81, "lowercaseString");
                            v63 = objc_msgSend(v78, "objectForKey:", v62);
                            v64 = v63;
                            if (v63 && (int)objc_msgSend(v63, "rank") <= *v21)
                            {
                              if ((objc_msgSend(v47, "isEqualToString:", v62) & 1) == 0)
                                objc_msgSend(v64, "setOccurenceCount:", (char *)objc_msgSend(v64, "occurenceCount") + 1);
                            }
                            else
                            {
                              v65 = -[THSearchIndex p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:](v77, "p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:", v62, v82, v21, v22, v64);
                              objc_msgSend(v78, "setObject:forKey:", v65, v62);

                            }
                          }
                        }
                      }
                      CFRelease(v55);
                    }
                  }
                  goto LABEL_78;
                }
              }
              else
              {
                v24 = v81;
                v26 = objc_msgSend(v19, "isEqualToString:", v81);
                v25 = v26;
                if (!v92)
                  v24 = v19;
                if (*v21 == 1)
                  goto LABEL_21;
                if (!v26)
                {
                  v29 = 0;
                  v27 = 0;
                  v28 = 0;
                  if (!v6)
                    goto LABEL_41;
                  goto LABEL_57;
                }
                v23 = v21[1];
              }
              if (!v23)
              {
                v29 = 0;
                v27 = 0;
                v28 = 0;
                goto LABEL_56;
              }
              v30 = -[__CFString rangeOfString:options:range:](v16, "rangeOfString:options:range:", v19, 1, 0, -[__CFString length](v16, "length"));
              v28 = 0x7FFFFFFFFFFFFFFFLL;
              if (v30 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
              {
                v27 = 0;
                v32 = 0;
                goto LABEL_47;
              }
              v33 = v30;
              v34 = v31;
              v35 = 0;
              while ((unint64_t)v33 < (unint64_t)v91)
              {
                v27 = 0;
                v28 = 0x7FFFFFFFFFFFFFFFLL;
                v37 = -1;
LABEL_37:
                v22 = (v37 + v22);
                if (++v35 >= (unint64_t)v21[1])
                  goto LABEL_46;
                v33 = -[__CFString rangeOfString:options:range:](v82, "rangeOfString:options:range:", v19, 1, &v33[v34], (_BYTE *)-[__CFString length](v82, "length") - &v33[v34]);
                v34 = v40;
                v28 = 0x7FFFFFFFFFFFFFFFLL;
                if (v33 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
                {
                  v27 = 0;
                  goto LABEL_46;
                }
              }
              v36 = &v33[-v91];
              v38 = (char *)objc_msgSend(v24, "length") + (_QWORD)v36;
              if (v38 <= -[__CFString length](v82, "length"))
              {
                v28 = (uint64_t)-[__CFString rangeOfString:options:range:](v82, "rangeOfString:options:range:", v24, 1, &v33[-v91], objc_msgSend(v24, "length"));
                v27 = v39;
                if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  v37 = -1;
                else
                  v37 = 0;
                goto LABEL_37;
              }
              v27 = 0;
              v28 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_46:
              v6 = v74;
              v32 = v74;
LABEL_47:
              if (v28 != 0x7FFFFFFFFFFFFFFFLL || !v32)
              {
                if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  goto LABEL_78;
                v29 = 0;
LABEL_56:
                v25 = 1;
                if (!v6)
                  goto LABEL_41;
                goto LABEL_57;
              }
              if (!v6)
                objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndex.m"), 264, CFSTR("Only include inflection when building suggestions."));
              v43 = objc_msgSend(v19, "lowercaseString");
              v44 = objc_msgSend(v78, "objectForKey:", v43);
              v45 = v44;
              if (v44 && (int)objc_msgSend(v44, "rank") <= *v21)
              {
                objc_msgSend(v45, "setOccurenceCount:", (char *)objc_msgSend(v45, "occurenceCount") + 1);
              }
              else
              {
                v46 = -[THSearchIndex p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:](v77, "p_createModelSearchResultForTerm:searchContext:occurrence:occurrenceIndex:previousEntry:", v43, v82, v21, v22, v45);
                objc_msgSend(v78, "setObject:forKey:", v46, v43);

              }
LABEL_78:
              v17 = (char *)v17 + 1;
              v16 = v82;
            }
            while (v17 != v80);
            v66 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
            v80 = v66;
          }
          while (v66);
        }
        v14 = v73 + 1;
      }
      while ((id)(v73 + 1) != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      if (!v72)
      {
LABEL_87:
        objc_msgSend(v75, "addObjectsFromArray:", objc_msgSend(v78, "allValues"));

        return v75;
      }
    }
  }
  return v75;
}

- (id)occurrenceMapForQuery:(id)a3
{
  id v5;
  id v6;
  id v7;
  id i;
  id v9;
  id v10;
  unsigned __int8 v11;
  TSLSearchTree *mTerms;
  _QWORD v14[6];
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15 = 0;
  v6 = -[THSearchIndex p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:](self, "p_firstIndexedWordInQuery:outWordRange:outHasMultipleWords:", objc_msgSend(a3, "lowercaseString"), 0, &v15);
  v7 = v6;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_D9C00;
    v14[3] = &unk_4293D8;
    v14[4] = v5;
    v14[5] = &v16;
    for (i = v6;
          (unint64_t)objc_msgSend(i, "length") > 2 || i == v7;
          i = objc_msgSend(i, "substringToIndex:", (char *)objc_msgSend(i, "length") - 1))
    {
      v9 = -[TSLStemmer stemWord:](self->mStemmer, "stemWord:", i);
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "isEqualToString:", i);
        mTerms = self->mTerms;
        if ((v11 & 1) != 0)
          -[TSLSearchTree enumerateWordsForPrefix:withBlock:](mTerms, "enumerateWordsForPrefix:withBlock:", i, v14);
        else
          -[TSLSearchTree enumerateWordsForPrefix:withBlock:](mTerms, "enumerateWordsForPrefix:withBlock:", v10, v14);
        if (*((_DWORD *)v17 + 6))
          break;
      }
    }
  }
  _Block_object_dispose(&v16, 8);
  return v5;
}

- (id)filterOutGlossaryKeysFromOccurrenceMap:(id)a3
{
  NSMutableArray *v4;
  _QWORD v6[5];

  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_D9D80;
  v6[3] = &unk_429400;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v4;
}

- (id)p_cfiForString:(id)a3 paragraphRange:(id)a4
{
  CFIndex var1;
  CFIndex var0;
  id v8;
  id v9;
  CFStringTokenizerRef v10;
  __CFStringTokenizer *v11;
  __CFString *v12;
  id v13;
  TSLSearchTree *mTerms;
  id v15;
  _QWORD v17[7];
  CFRange v18;
  CFRange CurrentTokenRange;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = objc_alloc_init((Class)NSMutableSet);
  v9 = objc_alloc_init((Class)NSMutableSet);
  v18.location = var0;
  v18.length = var1;
  v10 = CFStringTokenizerCreate(0, (CFStringRef)a3, v18, 0, 0);
  if (v10)
  {
    v11 = v10;
    while (CFStringTokenizerAdvanceToNextToken(v11))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      v12 = (__CFString *)CFStringCreateWithSubstring(0, (CFStringRef)a3, CurrentTokenRange);
      v13 = -[TSLStemmer newStemmedWord:](self->mStemmer, "newStemmedWord:", v12);
      mTerms = self->mTerms;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_DA048;
      v17[3] = &unk_429450;
      v17[4] = v12;
      v17[5] = self;
      v17[6] = v9;
      -[TSLSearchTree enumerateWordsForPrefix:withBlock:](mTerms, "enumerateWordsForPrefix:withBlock:", v13, v17);

      if (objc_msgSend(v9, "count"))
      {
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "intersectSet:", v9);
          if (!objc_msgSend(v8, "count"))
            break;
        }
        else
        {
          objc_msgSend(v8, "unionSet:", v9);
        }
        objc_msgSend(v9, "removeAllObjects");
      }
    }
    CFRelease(v11);
  }
  if (objc_msgSend(v8, "count") == (char *)&dword_0 + 1)
    v15 = objc_msgSend(v8, "anyObject");
  else
    v15 = 0;

  return v15;
}

- (id)unambiguousCFIForString:(id)a3
{
  __CFString *v4;
  CFStringTokenizerRef v5;
  __CFStringTokenizer *v6;
  CFRange CurrentTokenRange;
  id v8;
  void *v9;
  CFRange v11;

  v4 = (__CFString *)objc_msgSend(objc_msgSend(a3, "lowercaseString"), "tsu_stringByReplacingCharactersInSet:withCharacter:", self->mParagraphBreakCharacterSet, 8233);
  v11.length = (CFIndex)-[__CFString length](v4, "length");
  v11.location = 0;
  v5 = CFStringTokenizerCreate(0, v4, v11, 2uLL, 0);
  if (!v5)
    return 0;
  v6 = v5;
  while (CFStringTokenizerAdvanceToNextToken(v6))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
    v8 = -[THSearchIndex p_cfiForString:paragraphRange:](self, "p_cfiForString:paragraphRange:", v4, CurrentTokenRange.location, CurrentTokenRange.length);
    if (v8)
    {
      v9 = v8;
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:
  CFRelease(v6);
  return v9;
}

- (void)addReference:(id)a3 cfi:(id)a4
{
  -[TSUNoCopyDictionary setObject:forKey:](self->mReferences, "setObject:forKey:", a4, a3);
}

- (void)finishLoading
{
  self->mLoaded = 1;
}

- (void)setCfisLoaded:(BOOL)a3
{
  self->mAllCfisLoaded = a3;
}

- (BOOL)loaded
{
  return self->mLoaded;
}

- (BOOL)cfisLoaded
{
  return self->mAllCfisLoaded;
}

@end
