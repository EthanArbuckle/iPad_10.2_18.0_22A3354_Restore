@implementation THAnnotationSearchIndex

- (void)addTermsForAnnotation:(id)a3
{
  __CFString *v5;
  CFStringTokenizerRef v6;
  __CFStringTokenizer *v7;
  id v8;
  CFStringTokenizerRef v9;
  __CFStringTokenizer *v10;
  id v11;
  id v12;
  TSLSearchTree *mTerms;
  id v14;
  id v15;
  id v16;
  char *v17;
  __CFStringTokenizer *tokenizer;
  _QWORD v19[5];
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  CFRange v27;
  CFRange CurrentTokenRange;
  CFRange v29;

  v5 = (__CFString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "tsu_stringByReplacingCharactersInSet:withCharacter:", self->super.mParagraphBreakCharacterSet, 8233);
  v27.length = (CFIndex)-[__CFString length](v5, "length");
  v27.location = 0;
  v6 = CFStringTokenizerCreate(0, v5, v27, 2uLL, 0);
  if (v6)
  {
    v7 = v6;
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    if (CFStringTokenizerAdvanceToNextToken(v7))
    {
      tokenizer = v7;
      do
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
        v9 = CFStringTokenizerCreate(0, v5, CurrentTokenRange, 0, 0);
        if (v9)
        {
          v10 = v9;
          while (CFStringTokenizerAdvanceToNextToken(v10))
          {
            v29 = CFStringTokenizerGetCurrentTokenRange(v10);
            v11 = -[__CFString lowercaseString]((id)(id)CFStringCreateWithSubstring(0, v5, v29), "lowercaseString");
            v12 = -[TSLStemmer stemWord:](self->super.mStemmer, "stemWord:", v11);
            v21 = 0;
            v22 = &v21;
            v23 = 0x3052000000;
            v24 = sub_1B11E0;
            v25 = sub_1B11F0;
            v26 = 0;
            mTerms = self->super.mTerms;
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_1B11FC;
            v20[3] = &unk_4293D8;
            v20[4] = v12;
            v20[5] = &v21;
            -[TSLSearchTree enumerateWordsForPrefix:withBlock:](mTerms, "enumerateWordsForPrefix:withBlock:", v12, v20);
            v14 = (id)v22[5];
            if (!v14)
            {
              v14 = -[THSearchIndex addTermWithStem:](self, "addTermWithStem:", v12);
              v22[5] = (uint64_t)v14;
            }
            v15 = objc_msgSend(v14, "inflections");
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1B1250;
            v19[3] = &unk_428838;
            v19[4] = v11;
            v16 = objc_msgSend(v15, "tsu_firstObjectPassingTest:", v19);
            if (!v16)
              v16 = objc_msgSend((id)v22[5], "addInflection:", v11);
            v17 = (char *)objc_msgSend(objc_msgSend(v8, "objectForKey:", v11), "unsignedIntegerValue") + 1;
            objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17), v11);
            objc_msgSend(v16, "addOccurrence:rank:paragraphIndex:pageNumber:displayPageNumber:", objc_msgSend(a3, "annotationUuid"), 100, v17, objc_msgSend(a3, "annotationAbsolutePhysicalPageIndex"), 0);
            _Block_object_dispose(&v21, 8);
          }
          CFRelease(v10);
        }
        v7 = tokenizer;
      }
      while (CFStringTokenizerAdvanceToNextToken(tokenizer));
    }

    CFRelease(v7);
  }
}

- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7
{
  THModelSearchResult *v8;

  v8 = -[THModelSearchResult initWithTerm:annotation:pageNumber:displayPageNumber:occurrenceIndex:context:]([THModelSearchResult alloc], "initWithTerm:annotation:pageNumber:displayPageNumber:occurrenceIndex:context:", a3, -[THAnnotationStorageController annotationWithUuid:](-[THAnnotationSearchIndex annotationStorageController](self, "annotationStorageController"), "annotationWithUuid:", a5->var4), a5->var2, 0, a6, a4);
  if (a7)
    -[THModelSearchResult setOccurenceCount:](v8, "setOccurenceCount:", (char *)objc_msgSend(a7, "occurenceCount") + 1);
  return v8;
}

- (THAnnotationStorageController)annotationStorageController
{
  return self->_annotationStorageController;
}

- (void)setAnnotationStorageController:(id)a3
{
  self->_annotationStorageController = (THAnnotationStorageController *)a3;
}

@end
