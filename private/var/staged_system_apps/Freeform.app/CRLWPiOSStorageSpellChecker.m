@implementation CRLWPiOSStorageSpellChecker

+ (void)initialize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if ((id)objc_opt_class(CRLWPiOSStorageSpellChecker, a2) == a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, "p_inputLanguageDidChangeNotification:", UITextInputCurrentInputModeDidChangeNotification, 0);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textInputMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryLanguage"));
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)qword_101414E60;
    qword_101414E60 = (uint64_t)v6;

  }
}

+ (id)newSpellCheckerForStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  CRLWPiOSStorageSpellChecker *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CRLWPiOSStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:]([CRLWPiOSStorageSpellChecker alloc], "initWithStorage:selectionPath:orSearchCanvasDelegate:", v9, v8, v7);

  return v10;
}

- (id)suggestionsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker p_textSourceWithoutDeletionsWithSubRange:](self, "p_textSourceWithoutDeletionsWithSubRange:"));
  v7 = objc_msgSend(v6, "charRangeMappedFromStorage:", location, length);
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSStorageSpellChecker textChecker](self, "textChecker"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPiOSStorageSpellChecker p_language](CRLWPiOSStorageSpellChecker, "p_language"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guessesForWordRange:inString:language:", v9, v10, v12, v13));

  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

+ (BOOL)canCheckSpelling
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_language"));
  v3 = v2 != 0;

  return v3;
}

+ (void)p_inputLanguageDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v13;

  v4 = a3;
  byte_10147E578 = 0;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239E08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFD000();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239E28);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPiOSStorageSpellChecker p_inputLanguageDidChangeNotification:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 74, 0, "This operation must only be performed on the main thread.");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textInputMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryLanguage"));

  v11 = a1;
  objc_sync_enter(v11);
  v12 = (id)qword_101414E60;
  objc_storeStrong((id *)&qword_101414E60, v10);
  objc_sync_exit(v11);

  if (!v12 || (objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
  {
    v13.receiver = v11;
    v13.super_class = (Class)&OBJC_METACLASS___CRLWPiOSStorageSpellChecker;
    objc_msgSendSuper2(&v13, "p_inputLanguageDidChangeNotification:", v4);
  }

}

+ (id)p_determineLanguage
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITextChecker availableLanguages](UITextChecker, "availableLanguages"));
  v4 = objc_msgSend(v3, "copy");

  v5 = a1;
  objc_sync_enter(v5);
  v6 = (id)qword_101414E60;
  objc_sync_exit(v5);

  if (v6 && objc_msgSend(v6, "length"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_")));

    if (objc_msgSend(v4, "containsObject:", v7))
    {
      v7 = v7;
      v8 = v7;
    }
    else if ((unint64_t)objc_msgSend(v7, "length") < 2)
    {
      v8 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", 0, 2));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v4;
      v8 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v12 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v11);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v14, "rangeOfString:", v10, (_QWORD)v17))
              v16 = 0;
            else
              v16 = v15 == 2;
            if (v16)
            {
              v8 = v14;
              goto LABEL_22;
            }
          }
          v8 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_22:

    }
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v7 = v6;
  }

  return v8;
}

+ (id)p_language
{
  void *v2;
  id v3;
  void *v4;

  if (!byte_10147E578)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_determineLanguage"));
    v3 = objc_msgSend(v2, "copy");
    v4 = (void *)qword_101414E68;
    qword_101414E68 = (uint64_t)v3;

    byte_10147E578 = 1;
  }
  return (id)qword_101414E68;
}

- (CRLWPiOSStorageSpellChecker)initWithStorage:(id)a3 selectionPath:(id)a4 orSearchCanvasDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CRLWPiOSStorageSpellChecker *v14;
  CRLWPiOSStorageSpellChecker *v15;
  CRLWPiOSStorageSpellChecker *v16;
  UITextChecker *v17;
  UITextChecker *textChecker;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSString *language;
  CRLWPSpellingResults *v23;
  CRLWPSpellingResults *spellingResults;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239E48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFD084();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239E68);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPiOSStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 149, 0, "invalid nil value for '%{public}s'", "storage");

  }
  v27.receiver = self;
  v27.super_class = (Class)CRLWPiOSStorageSpellChecker;
  v14 = -[CRLWPStorageSpellChecker initWithStorage:selectionPath:orSearchCanvasDelegate:](&v27, "initWithStorage:selectionPath:orSearchCanvasDelegate:", v8, v9, v10);
  v15 = v14;
  v16 = 0;
  if (v8 && v14)
  {
    v17 = (UITextChecker *)objc_alloc_init((Class)UITextChecker);
    textChecker = v15->_textChecker;
    v15->_textChecker = v17;

    v20 = objc_msgSend((id)objc_opt_class(v15, v19), "p_language");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    language = v15->_language;
    v15->_language = (NSString *)v21;

    v23 = objc_alloc_init(CRLWPSpellingResults);
    spellingResults = v15->super._spellingResults;
    v15->super._spellingResults = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v15, "i_resetSpellCheckingForNotification:", CFSTR("CRLWPSpellCheckingLearnedWordsChangedNotification"), 0);

    v16 = v15;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPStorageSpellChecker cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPiOSStorageSpellChecker;
  -[CRLWPStorageSpellChecker dealloc](&v3, "dealloc");
}

- (BOOL)i_addSpellingAndGrammarMarksInRange:(_NSRange)a3 spellingResults:(id)a4 grammarResults:(id)a5 sync:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRLWPiOSStorageSpellChecker *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v36;
  void *v37;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageSpellChecker p_textSourceWithoutDeletionsWithSubRange:](self, "p_textSourceWithoutDeletionsWithSubRange:", location, length));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "string"));
    v12 = (char *)objc_msgSend(v10, "charRangeMappedFromStorage:", location, length);
    v14 = v13;
    v15 = (unint64_t)&v12[v13];
    if (&v12[v13] > objc_msgSend(v11, "length"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239E88);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFD130();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101239EA8);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPiOSStorageSpellChecker i_addSpellingAndGrammarMarksInRange:spellingResults:grammarResults:sync:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPiOSStorageSpellChecker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 177, 0, "attempt to spellcheck past end of string");

    }
    if (v15 <= (unint64_t)objc_msgSend(v11, "length"))
    {
      v19 = objc_claimAutoreleasedReturnValue(+[CRLWPiOSStorageSpellChecker p_language](CRLWPiOSStorageSpellChecker, "p_language"));
      v36 = v9;
      v37 = v11;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSStorageSpellChecker textChecker](self, "textChecker"));
      v21 = v11;
      v22 = (void *)v19;
      v23 = v10;
      v24 = self;
      v25 = (char *)objc_msgSend(v20, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v21, v12, v14, v12, 0, v19);
      v27 = v26;

      while (v25 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = objc_msgSend(v23, "charRangeMappedToStorage:", v25, v27);
        v30 = v29;
        v31 = v12;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", v28, v29));
        -[CRLWPStorageSpellChecker i_addMisspelledWord:atIndex:ifValidForRange:toResults:](v24, "i_addMisspelledWord:atIndex:ifValidForRange:toResults:", v32, 0x7FFFFFFFFFFFFFFFLL, v28, v30, v36);

        v12 = v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPiOSStorageSpellChecker textChecker](v24, "textChecker"));
        v25 = (char *)objc_msgSend(v33, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v37, v31, v14, &v25[v27], 0, v22);
        v27 = v34;

      }
      v9 = v36;
      v11 = v37;
      v10 = v23;
    }

  }
  return 1;
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textInputMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryLanguage"));

  v8 = -[CRLWPStorageSpellChecker rangeOfNumericalSuffixPrecedingCharIndex:forLocale:](self, "rangeOfNumericalSuffixPrecedingCharIndex:forLocale:", a3, v7);
  v10 = v9;

  v11 = (NSUInteger)v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
  objc_storeStrong((id *)&self->_textChecker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
}

@end
