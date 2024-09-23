@implementation CRLWPEditorHelper

- (id)editorKeyboardLanguage
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "textInputMode"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "primaryLanguage"));

    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("dictation")) & 1) == 0)
      objc_storeStrong((id *)&qword_101414FC8, v2);

  }
  if (qword_101414FC8)
    v3 = (uint64_t)objc_msgSend((id)qword_101414FC8, "rangeOfString:", CFSTR("-"));
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = (id)qword_101414FC8;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101414FC8, "substringToIndex:"));
  v5 = v4;
  if (v4 && (unint64_t)objc_msgSend(v4, "length") >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240EC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E06AAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101240EE8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DFF474();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *CRLWPGetPrimaryInputLanguage()"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPUtilities.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2642, 0, "Unexpected input language code returned by the OS");

  }
  v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("zh"));
  v10 = (void *)qword_101414FC8;
  if (!v9)
    v10 = v5;
  v11 = v10;
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "preferredLocalizations"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240F08);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E06A20();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101240F28);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DFF474();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *CRLWPGetPrimaryInputLanguage()"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPUtilities.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 2651, 0, "invalid nil value for '%{public}s'", "result");

      v11 = 0;
    }
  }

  return v11;
}

- (CRLWPTextSource)textSource
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  objc_opt_class(_TtC8Freeform12CRLWPStorage, a2);
  v4 = sub_100221D0C(v3, self->_textSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "copyWithMarkedText");

  return (CRLWPTextSource *)v6;
}

- (CRLWPEditorHelper)initWithTextSource:(id)a3 icc:(id)a4 layout:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRLWPEditorHelper *v12;
  CRLWPEditorHelper *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPEditorHelper;
  v12 = -[CRLWPEditorHelper init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textSource, a3);
    objc_storeStrong((id *)&v13->_interactiveCanvasController, a4);
    v13->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v13->_layout, a5);
  }

  return v13;
}

- (id)editorController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));

  return v3;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  id v10;
  CFIndex v11;
  CFIndex v12;
  void *v13;
  __CFString *v14;
  uint64_t CharacterAtIndex;
  int v16;
  uint64_t v17;
  int v18;
  __CFStringTokenizer *v19;
  __CFStringTokenizer *v20;
  CFIndex location;
  CFIndex length;
  CFRange CurrentTokenRange;
  NSUInteger v25;
  NSUInteger v26;
  _NSRange result;
  CFRange v28;

  v4 = a4;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v10 = objc_msgSend(v9, "range");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));

  if (CFStringGetLength(v14) <= a3)
  {
    v16 = 0;
  }
  else
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(v14, a3);
    v16 = 0;
    if ((_DWORD)CharacterAtIndex && (unint64_t)v10 + v12 > a3)
      v16 = sub_1001AE368(CharacterAtIndex) ^ 1;
  }
  if (v4 && (unint64_t)v10 < a3)
  {
    v17 = CFStringGetCharacterAtIndex(v14, a3 - 1);
    v18 = sub_1001AE368(v17);
    v16 |= v18 ^ 1;
    if (!v18)
      --a3;
  }
  if (v16)
  {
    if (v12)
    {
      v28.location = (CFIndex)v10;
      v28.length = v12;
      v19 = CFStringTokenizerCreate(0, v14, v28, 4uLL, 0);
      if (v19)
      {
        v20 = v19;
        if (CFStringTokenizerGoToTokenAtIndex(v19, a3))
        {
          CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v20);
          length = CurrentTokenRange.length;
          location = CurrentTokenRange.location;
        }
        else
        {
          length = 0;
          location = -1;
        }
        if (location != -1 && length != 0)
        {
          v7 = location;
          v8 = length;
        }
        CFRelease(v20);
      }
    }
  }
  v25 = v7;
  v26 = v8;
  result.length = v26;
  result.location = v25;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  id v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[CRLWPEditorHelper p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:](self, "p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:", a3, a4, 1);
  result.length = v5;
  result.location = (NSUInteger)v4;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[CRLWPEditorHelper whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", a3, 1);
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;
  int v17;
  unsigned __int8 v18;
  char v19;
  unint64_t v20;
  void *v21;
  id v22;
  int v23;
  unsigned __int8 v24;
  char v25;
  NSUInteger v26;
  NSUInteger v27;
  _NSRange result;

  v7 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  if ((unint64_t)objc_msgSend(v10, "length") <= a3)
  {

    goto LABEL_28;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v12 = sub_1001AE368((uint64_t)objc_msgSend(v11, "characterAtIndex:", a3));

  if (!v12)
  {
LABEL_28:
    v26 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  v13 = a3;
  if ((unint64_t)v7 < a3)
  {
    v13 = a3;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v15 = v13 - 1;
      v16 = objc_msgSend(v14, "characterAtIndex:", v13 - 1);
      v17 = sub_1001AE368((uint64_t)v16);
      if (!v17 || a4)
      {

        if (!v17)
          goto LABEL_15;
      }
      else
      {
        v18 = sub_1001AE2A0((uint64_t)v16);
        if ((_DWORD)v16 == 8232)
          v19 = 1;
        else
          v19 = v18;

        if ((v19 & 1) != 0)
          goto LABEL_15;
      }
      --v13;
    }
    while (v15 > (unint64_t)v7);
    v13 = (unint64_t)v7;
  }
LABEL_15:
  v20 = (unint64_t)v7 + v9;
  if ((unint64_t)v7 + v9 > a3)
  {
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v22 = objc_msgSend(v21, "characterAtIndex:", a3);
      v23 = sub_1001AE368((uint64_t)v22);
      if (!v23 || a4)
      {

        if (!v23)
          goto LABEL_26;
      }
      else
      {
        v24 = sub_1001AE2A0((uint64_t)v22);
        if ((_DWORD)v22 == 8232)
          v25 = 1;
        else
          v25 = v24;

        if ((v25 & 1) != 0)
          goto LABEL_26;
      }
      ++a3;
    }
    while (v20 != a3);
    a3 = v20;
  }
LABEL_26:
  v26 = a3 - v13;
LABEL_29:
  v27 = v13;
  result.length = v26;
  result.location = v27;
  return result;
}

- (BOOL)hasWhitespaceBoundedWordAtSelection:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  char *v23;
  uint64_t v24;
  char v25;
  char v26;
  unsigned __int8 v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  CRLWPTextSource *textSource;
  id v35;
  uint64_t v36;
  char v38;

  v4 = a3;
  v38 = 0;
  if (objc_msgSend(v4, "isVisual"))
  {
    v5 = (char *)objc_msgSend(v4, "superRange");
    if (&v5[v6] > -[CRLWPTextSource length](self->_textSource, "length"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DE68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1ADF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DE88);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 217, 0, "bad selection -- extends past end of storage");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v10, "layoutIfNeeded");

    v11 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v4, &v38);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DEA8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1ACF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DEC8);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 221, 0, "Couldn't find left edge char index");

      goto LABEL_44;
    }
    v28 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v11, 3);
    if ((sub_1001AE368((uint64_t)-[CRLWPTextSource characterAtIndex:](self->_textSource, "characterAtIndex:", v11)) & 1) != 0
      || v28 == -[CRLWPTextSource length](self->_textSource, "length")
      || sub_1001AE368((uint64_t)-[CRLWPTextSource characterAtIndex:](self->_textSource, "characterAtIndex:", v28)))
    {
      v29 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v4, &v38);
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124DEE8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1AD74();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124DF08);
        v30 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 242, 0, "Invalid index for right edge of selection");

        goto LABEL_46;
      }
      v33 = -[CRLWPTextSource characterAtIndex:](self->_textSource, "characterAtIndex:", v29);
      if ((sub_1001AE2A0((uint64_t)v33) & 1) != 0)
      {
LABEL_46:
        v25 = 0;
        v26 = 1;
        goto LABEL_49;
      }
      sub_1001AE368((uint64_t)v33);
      textSource = self->_textSource;
      v35 = objc_msgSend(v4, "range");
      v27 = -[CRLWPTextSource isAllWhitespaceInRange:](textSource, "isAllWhitespaceInRange:", v35, v36);
LABEL_48:
      v25 = v27 ^ 1;
      v26 = v27 ^ 1;
      goto LABEL_49;
    }
LABEL_44:
    v25 = 0;
    v26 = 0;
    goto LABEL_49;
  }
  if (!objc_msgSend(v4, "isValid"))
    goto LABEL_44;
  if (!objc_msgSend(v4, "isRange"))
    goto LABEL_44;
  v15 = (char *)objc_msgSend(v4, "range");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet crlwp_preSmartSet](NSCharacterSet, "crlwp_preSmartSet"));
  v19 = objc_msgSend(v18, "characterIsMember:", -[CRLWPTextSource characterAtIndex:](self->_textSource, "characterAtIndex:", v15));

  if ((v19 & 1) == 0
    && -[CRLWPTextSource wordAtCharIndex:includePreviousWord:](self->_textSource, "wordAtCharIndex:includePreviousWord:", v15, 0) != v15)
  {
    goto LABEL_44;
  }
  v20 = -[CRLWPTextSource characterAtIndex:](self->_textSource, "characterAtIndex:", &v15[v17 - 1]);
  if ((sub_1001AE2A0((uint64_t)v20) & 1) != 0)
    goto LABEL_46;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet crlwp_postSmartSet](NSCharacterSet, "crlwp_postSmartSet"));
  v22 = objc_msgSend(v21, "characterIsMember:", v20);

  if ((v22 & 1) != 0
    || (v23 = (char *)-[CRLWPTextSource wordAtCharIndex:includePreviousWord:](self->_textSource, "wordAtCharIndex:includePreviousWord:", &v15[v17], 1), v25 = 0, v26 = 1, v24)&& &v23[v24] == &v15[v17])
  {
    v27 = -[CRLWPTextSource isAllWhitespaceInRange:](self->_textSource, "isAllWhitespaceInRange:", v15, v17);
    goto LABEL_48;
  }
LABEL_49:

  return v25 & v26;
}

- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  NSUInteger v12;
  _NSRange result;

  v5 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  v7 = a3;
  if ((unint64_t)v5 + v6 > a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v9 = sub_1001AE368((uint64_t)objc_msgSend(v8, "characterAtIndex:", a3));

    v7 = a3;
    if (v9)
    {
      v10 = -[CRLWPEditorHelper whiteSpaceRangeAtCharIndex:](self, "whiteSpaceRangeAtCharIndex:", a3);
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
        v7 = a3;
      else
        v7 = (unint64_t)v10;
    }
  }
  v11 = -[CRLWPEditorHelper wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", a3, 1);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    v11 = (id)v7;
  v12 = a3 - (_QWORD)v11;
  result.length = v12;
  result.location = (NSUInteger)v11;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  id v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[CRLWPEditorHelper wordAtCharIndex:includePreviousWord:includeHyphenation:](self, "wordAtCharIndex:includePreviousWord:includeHyphenation:", a3, a4, 0);
  result.length = v5;
  result.location = (NSUInteger)v4;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v10 = objc_msgSend(v9, "textRangeForParagraphAtCharIndex:", a3);
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
  v15 = objc_msgSend(v14, "crlwp_rangeOfWordAtCharacterIndex:range:includePreviousWord:includeHyphenation:", a3, v10, v12, v6, v5);
  v17 = v16;

  v18 = (NSUInteger)v15;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5
{
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSUInteger v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  BOOL v27;
  unint64_t v28;
  NSUInteger v29;
  unint64_t v30;
  NSUInteger v31;
  void *v32;
  void *v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  unint64_t v37;
  _BOOL4 v38;
  _NSRange result;

  v38 = a5;
  v7 = a4 - 1;
  if (a3 != a4 && v7 != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DF28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AEF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DF48);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 381, 0, "Precondition: caretIndex is either equal to the given charIndex or one past");

  }
  v37 = v7;
  v11 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:", a4);
  v13 = (unint64_t)v11;
  v14 = v12;
  if ((unint64_t)v11 <= a3)
    v15 = a3;
  else
    v15 = (unint64_t)v11;
  if (v12 - 1 < v15 - (unint64_t)v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DF68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AE74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DF88);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 390, 0, "Character index should be inside allowable selection range.");

  }
  v19 = v13 + v14;
  if (v15 >= v13 + v14)
  {
    v21 = 0;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v21 = objc_msgSend(v20, "characterAtIndex:", v15);

  }
  if (!sub_1001AE3AC((int)v21))
  {
    if (v38 && sub_1001AE368((uint64_t)v21))
    {
      if (v15 != a4 || !v15 || v13 >= a3)
      {
        v37 = v15;
        if (v15 + 1 == a4)
        {
          if (v19 <= a4)
            v24 = v15;
          else
            v24 = a4;
          v37 = v24;
        }
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v26 = objc_msgSend(v25, "characterAtIndex:", v37);

      if ((sub_1001AE368((uint64_t)v26) & 1) == 0)
      {
        v27 = sub_1001AE3AC((int)v26);
        v28 = v37;
        if (!v27)
          goto LABEL_47;
      }
      v23 = (uint64_t)-[CRLWPEditorHelper whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", v15, 0);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v29;
        v28 = v15;
        if (v29)
          goto LABEL_50;
        goto LABEL_47;
      }
    }
    v28 = v15;
LABEL_47:
    v30 = v28;
    v23 = (uint64_t)-[CRLWPEditorHelper wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:");
    v22 = v31;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_50;
    if (v30 < v19)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "string"));
      v23 = (uint64_t)objc_msgSend(v33, "rangeOfComposedCharacterSequenceAtIndex:", v30);
      v22 = v34;

      goto LABEL_50;
    }
    goto LABEL_30;
  }
  v22 = 0;
LABEL_30:
  v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_50:
  v35 = v23;
  v36 = v22;
  result.length = v36;
  result.location = v35;
  return result;
}

- (Class)wpSelectionClass
{
  return (Class)objc_opt_class(CRLWPSelection, a2);
}

- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3
{
  return -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:styleProvider:](self, "paragraphEnumeratorAtCharIndex:styleProvider:", a4, 0);
}

- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CRLWPParagraphEnumerator *result;
  id v13;

  v13 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v10 = objc_msgSend(v9, "paragraphIndexAtCharIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  sub_1001720FC((uint64_t)retstr, v8, v13, (uint64_t)v10, (uint64_t)objc_msgSend(v11, "paragraphCount") - 1, 1);

  return result;
}

- (id)selection
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPSelection, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionForEditor:", v7));
  v9 = sub_100221D0C(v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (void)setVisualSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
  -[CRLWPEditorHelper setSelectionOfType:withRange:endOfLine:withFlags:](self, "setSelectionOfType:withRange:endOfLine:withFlags:", 7, a3.location, a3.length, a4, 32);
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
  -[CRLWPEditorHelper setSelectionWithRange:endOfLine:withFlags:](self, "setSelectionWithRange:endOfLine:withFlags:", a3.location, a3.length, a4, 32);
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4 withFlags:(unint64_t)a5
{
  -[CRLWPEditorHelper setSelectionOfType:withRange:endOfLine:withFlags:](self, "setSelectionOfType:withRange:endOfLine:withFlags:", 0, a3.location, a3.length, a4, a5);
}

- (void)setSelectionOfType:(unint64_t)a3 withRange:(_NSRange)a4 endOfLine:(BOOL)a5 withFlags:(unint64_t)a6
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  char *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  CRLWPSelection *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  CRLWPSelection *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  CRLWPSelection *v54;

  v7 = a5;
  length = a4.length;
  location = a4.location;
  v53 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v53, "textSelectionWillChange");

  v54 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([CRLWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", a3, location, length, 0, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentEditors"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));

  if (v14 == v15)
  {
    if (-[CRLWPSelection isInsertionPoint](v54, "isInsertionPoint"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      v17 = objc_msgSend(v16, "editingDisabled");

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        objc_msgSend(v18, "endEditingAndSelectParent:", self);
LABEL_23:

        goto LABEL_24;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionForEditor:", v20));

    objc_opt_class(CRLWPSelection, v21);
    v23 = sub_100221D0C(v22, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (char *)objc_msgSend(v24, "range");
    if (v25 == (char *)location || &v25[v26] == (char *)(location + length))
    {
      v27 = 1;
    }
    else
    {
      v27 = 0;
      a6 |= 4uLL;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "selectionPath"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v18, v54));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v31, "setSelectionPath:withSelectionFlags:", v30, a6);

    if (v24)
      v32 = v27;
    else
      v32 = 0;
    if (v32 != 1)
    {
LABEL_22:

      goto LABEL_23;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v34 = (char *)objc_msgSend(v24, "superRange");
    v36 = v35;
    v37 = (char *)objc_msgSend(v33, "superRange");
    v39 = v37;
    if (v34 != v37 || v36 != v38)
    {
      if (v34 == v37)
      {
        v39 = &v34[v38];
        v40 = 1;
        goto LABEL_19;
      }
      if (&v34[v36] == &v37[v38])
      {
        v40 = 0;
LABEL_19:
        if (v39 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v41 = [CRLWPSelection alloc];
          v42 = objc_msgSend(v33, "type");
          v43 = objc_msgSend(v33, "styleInsertionBehavior");
          v44 = objc_msgSend(v33, "smartFieldRange");
          LOBYTE(v52) = 1;
          v46 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](v41, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v42, v39, 0, v43, v40, v44, v45, v52, v39);
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "selectionPath"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:", v46));

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
          objc_msgSend(v50, "scrollToSelectionPath:scrollOptions:", v49, 1);

        }
      }
    }

    goto LABEL_22;
  }
LABEL_24:
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v51, "textSelectionDidChange");

}

- (unint64_t)p_moveFromCharIndex:(unint64_t *)a3 leadingEdge:(BOOL *)a4 tokenizerRef:(__CFStringTokenizer *)a5 tokenizerRange:(_NSRange *)a6 direction:(int64_t)a7 currentWordRange:(_NSRange)a8 newWordRange:(_NSRange *)a9 reasonToStop:(unint64_t)a10
{
  NSUInteger location;
  id v15;
  NSUInteger v16;
  unint64_t v17;
  NSUInteger v18;
  __CFStringTokenizer *v19;
  CFStringTokenizerTokenType v21;
  NSUInteger v22;
  BOOL v23;
  BOOL v24;
  CFRange CurrentTokenRange;
  id v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  uint64_t v32;
  _BOOL4 v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _NSRange *v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  void *v44;
  id v47;
  NSRange v48;
  NSRange v49;
  NSRange v50;

  -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", *a3);
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  location = a8.location;
  if (a8.location == -1)
  {
    v42 = 0;
    v43 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v15 = objc_msgSend(v44, "charRangeMappedFromStorage:", a8.location, a8.length);
    v42 = v16;
    v43 = (NSUInteger)v15;
  }
  v40 = a9;
  v17 = *a3;
  while (1)
  {
    v18 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", v17, *a4, a7, v40);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_49;
    v19 = *a5;
    if (!*a5)
      goto LABEL_13;
    if (v18 < a6->location || v18 - a6->location >= a6->length)
    {
      CFRelease(v19);
      *a5 = 0;
LABEL_13:
      v19 = -[CRLWPEditorHelper createTokenizerForCharIndex:outTokenizerRange:](self, "createTokenizerForCharIndex:outTokenizerRange:", v18, a6);
      *a5 = v19;
    }
    v21 = CFStringTokenizerGoToTokenAtIndex(v19, v18);
    if ((a10 & 2) != 0 && !v21)
    {
      v35 = 2;
      goto LABEL_50;
    }
    v22 = location;
    if (!v21)
      goto LABEL_32;
    v23 = location == 0x7FFFFFFFFFFFFFFFLL && a8.length == 0;
    v24 = v23;
    if ((a10 & 4) != 0 && !v24)
      break;
    if ((a10 & 8) != 0)
    {
      *(CFRange *)v40 = CFStringTokenizerGetCurrentTokenRange(*a5);
      v35 = 8;
      goto LABEL_50;
    }
LABEL_32:
    v33 = *a4;
    v34 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", *a3, a4, a7, 0);
    v17 = v34;
    location = v22;
    if (v34 == *a3)
    {
      if (*a4 == v33 || v34 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_40:
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", v34);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124DFA8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1AF74();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124DFC8);
          v36 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:]"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 603, 0, "Should not have received NSNotFound.");

        }
LABEL_49:
        v35 = 1;
        goto LABEL_50;
      }
    }
    else if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_40;
    }
    *a3 = v34;
  }
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(*a5);
  v26 = objc_msgSend(v44, "charRangeMappedFromStorage:", CurrentTokenRange.location, CurrentTokenRange.length);
  v28 = v27;
  v48.location = v22;
  v48.length = a8.length;
  v41 = sub_1001E9700(v48, (NSRange)CurrentTokenRange);
  v30 = v29;
  v49.length = v42;
  v49.location = v43;
  v50.location = (NSUInteger)v26;
  v50.length = v28;
  v31 = sub_1001E9700(v49, v50);
  if (CurrentTokenRange.location == v22 && CurrentTokenRange.length == a8.length || v32 | v31 && (v30 || !v41))
    goto LABEL_32;
  *(CFRange *)v40 = CurrentTokenRange;
  v35 = 4;
LABEL_50:

  sub_100171FA4(&v47);
  return v35;
}

- (__CFStringTokenizer)createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4
{
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  __CFString *v12;
  __CFStringTokenizer *v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v8 = objc_msgSend(v7, "textRangeForParagraphAtCharIndex:", a3);
  v10 = v9;

  a4->location = (NSUInteger)v8;
  a4->length = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
  v13 = CFStringTokenizerCreate(0, v12, *(CFRange *)a4, 0, 0);

  CFStringTokenizerGoToTokenAtIndex(v13, a3);
  return v13;
}

- (unint64_t)charIndexMovingForwardByCharacterFromCharIndex:(unint64_t)a3
{
  return -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", a3, 0);
}

- (unint64_t)charIndexMovingBackwardByCharacterFromCharIndex:(unint64_t)a3
{
  return -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", a3, 1);
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DFE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AFF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E008);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 633, 0, "invalid nil value for '%{public}s'", "self.textSource");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v12 = v11 == 0;

  if (v12)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", a3, 0, a4, 1);
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6
{
  return -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:", a3, a4, a5, a6, 0);
}

- (_NSRange)p_expandParagraphRangeForEnumerator:(CRLWPParagraphEnumerator *)a3
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger length;
  NSUInteger v7;
  NSRange v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  _NSRange result;
  NSRange v16;
  NSRange v17;

  location = (NSUInteger)sub_100172228((uint64_t)a3);
  length = v5;
  if (!sub_100172390((uint64_t)a3))
  {
    sub_100172100((uint64_t)a3);
    v16.location = (NSUInteger)sub_100172228((uint64_t)a3);
    v16.length = v7;
    v13.location = location;
    v13.length = length;
    v8 = NSUnionRange(v13, v16);
    location = v8.location;
    length = v8.length;
    sub_100172124((uint64_t)a3);
  }
  if (sub_100172154((uint64_t)a3))
  {
    v9 = location;
    v10 = length;
  }
  else
  {
    sub_100172124((uint64_t)a3);
    v17.location = (NSUInteger)sub_100172228((uint64_t)a3);
    v17.length = v11;
    v14.location = location;
    v14.length = length;
    v12 = NSUnionRange(v14, v17);
    v10 = v12.length;
    v9 = v12.location;
  }
  result.length = v10;
  result.location = v9;
  return result;
}

- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "layoutIfNeeded");

  v8 = 0;
  v6 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v8, 0);
  return !v6 || sub_100144A40((__int128 *)v6, a3) == 0;
}

- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  __int128 *v27;
  char *v28;
  char *v29;
  unint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36;
  int v37;
  int v38;
  unsigned int v39;
  char *v40;
  char *v41;
  unint64_t v42;
  _BOOL4 v44;
  void *v45;
  char *v46;
  _BYTE *v47;
  char *v48;
  int64_t v49;
  char *v50;
  char *v51;
  void *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  char *v59;
  __int128 *v60;
  __int128 *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t *v72;
  CRLWPEditorHelper *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  uint64_t v77;
  id *v78;
  id v79;
  uint64_t v80;
  char v81;
  unsigned int v82;
  char *v83;
  unint64_t v84;
  char *v85;
  int v87;
  void *v88;
  char *v89;
  void *v90;
  char *v91;
  CRLWPMutableRangeArray *v92;
  void *v93;
  id v94;
  void *v95;
  unsigned __int8 v96;
  void *v97;
  _BOOL4 v98;
  uint64_t v99;
  CRLWPEditorHelper *v100;
  CRLWPMutableRangeArray *v101;
  char *v102;
  char *v103;
  _QWORD v104[5];
  id v105;
  char *v106;
  __int128 v107;
  uint64_t v108;
  BOOL v109;
  void *__p;
  __int128 v111;
  _QWORD v112[6];
  _QWORD v113[9];
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD v122[5];
  id v123;
  _QWORD v124[5];
  id v125;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "validVisualRanges") & 1) != 0
    || objc_msgSend(v6, "isInsertionPoint"))
  {
    v7 = v6;
    goto LABEL_4;
  }
  v100 = self;
  if (objc_msgSend(v6, "type") != (id)7)
  {
    v7 = v6;
    if (v4)
      goto LABEL_198;
    goto LABEL_4;
  }
  v103 = (char *)objc_msgSend(v6, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v10 = objc_msgSend(v6, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v12 = objc_msgSend(v11, "characterCount");
  if (v12 >= v10)
    v13 = v10;
  else
    v13 = v12;
  v14 = (char *)objc_msgSend(v9, "previousCharacterIndex:", v13);

  v101 = objc_opt_new(CRLWPMutableRangeArray);
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x3032000000;
  v124[3] = sub_1002D6260;
  v124[4] = sub_1002D6270;
  v125 = 0;
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3032000000;
  v122[3] = sub_1002D6260;
  v122[4] = sub_1002D6270;
  v123 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x2020000000;
  v121 = 0;
  v114 = 0;
  v115 = &v114;
  v116 = 0x2020000000;
  v117 = 0;
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_1002D6278;
  v113[3] = &unk_10124E030;
  v113[4] = v124;
  v113[5] = &v118;
  v113[7] = &v114;
  v113[8] = v14;
  v113[6] = v122;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v103, 0, v113);
  v98 = v4;
  if (!v119[3]
    || !objc_msgSend(v6, "isRange")
    || !v115[3]
    && (v112[0] = _NSConcreteStackBlock,
        v112[1] = 3221225472,
        v112[2] = sub_1002D635C,
        v112[3] = &unk_10124E058,
        v112[4] = v122,
        v112[5] = &v114,
        -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v14, 0, v112), !v115[3]))
  {
    v102 = v14;
    goto LABEL_192;
  }
  v15 = sub_100145F64(v119[3], (unint64_t)v103);
  v16 = sub_100145F64(v115[3], (unint64_t)v14);
  v17 = v119[3];
  v18 = *(_QWORD *)(v17 + 24);
  if ((~*(_DWORD *)(v17 + 24) & 0x801) != 0)
  {
    v22 = 0;
  }
  else
  {
    v19 = &xmmword_100EEE418;
    if (v18 >= 0)
      v19 = (__int128 *)v119[3];
    v21 = *(_QWORD *)v19;
    v20 = *((_QWORD *)v19 + 1);
    v22 = v21 + v20 <= (unint64_t)objc_msgSend(v6, "end");
    v17 = v119[3];
  }
  sub_1001469CC(v17, &__p);
  v23 = (v18 & 1) == 0 || v22;
  if (__p == (void *)v111 && v23)
  {
    v24 = v119[3];
    if (*(uint64_t *)(v24 + 24) < 0)
      v25 = &xmmword_100EEE418;
    else
      v25 = (__int128 *)v119[3];
    v26 = *((_QWORD *)v25 + 1);
    *((_QWORD *)&v107 + 1) = *(_QWORD *)v25;
    v108 = v26;
    v109 = (*(_QWORD *)(v24 + 24) & 0x1000) == 0;
    v106 = (char *)*((_QWORD *)&v107 + 1);
    *(_QWORD *)&v107 = *((_QWORD *)&v107 + 1);
    sub_1002D63AC(&__p, (__int128 *)&v106);
  }
  v27 = (__int128 *)v119[3];
  v99 = *((_QWORD *)v27 + 3);
  v28 = v103;
  if (v27 == (__int128 *)v115[3] && v15 > v16)
    v29 = v103;
  else
    v29 = v14;
  if (v27 == (__int128 *)v115[3] && v15 > v16)
    v28 = v14;
  v102 = v29;
  v103 = v28;
  if ((v18 & 1) != 0)
  {
    if (v99 < 0)
      v27 = &xmmword_100EEE418;
    v30 = *(_QWORD *)v27;
    if (v30 >= (unint64_t)objc_msgSend(v6, "start"))
    {
      -[CRLWPMutableRangeArray addRange:](v101, "addRange:", *(_QWORD *)v119[3], 1);
      if ((void *)v111 != __p && !v22)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E078);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1B084();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E098);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper calculateVisualRunsFromSelection:updateControllerSelection:]"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 758, 0, "Expect no runs for a partitioned attachment line fragment");

      }
    }
  }
  v35 = __p;
  if ((void *)v111 == __p)
  {
LABEL_134:
    v60 = (__int128 *)v119[3];
    v61 = (__int128 *)v115[3];
    v62 = *((_QWORD *)v60 + 3);
    if (v60 == v61 && (v62 & 0x4000) != 0)
    {
      v63 = objc_msgSend(v6, "range");
      v65 = v64;
LABEL_188:
      -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v63, v65);
      goto LABEL_189;
    }
    if (v62 < 0)
      v60 = &xmmword_100EEE418;
    v66 = *(_QWORD *)v60 + *((_QWORD *)v60 + 1);
    v67 = *(_QWORD *)v61;
    if (v66 <= v67)
      v68 = v67;
    else
      v68 = v66;
    if (v66 >= v67)
      v69 = v67;
    else
      v69 = v66;
    -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v69, v68 - v69);
    sub_1001469CC(v115[3], &v106);
    if (__p)
    {
      *(_QWORD *)&v111 = __p;
      operator delete(__p);
    }
    v70 = v106;
    __p = v106;
    v111 = v107;
    v71 = (char *)v107;
    v72 = v115;
    v73 = v100;
    if (v106 == (char *)v107)
    {
      v74 = v115[3];
      v75 = *(_QWORD *)(v74 + 24);
      if ((v75 & 0x800) == 0)
        goto LABEL_184;
      if (v75 < 0)
        v76 = &xmmword_100EEE418;
      else
        v76 = (__int128 *)v115[3];
      v77 = *((_QWORD *)v76 + 1);
      *((_QWORD *)&v107 + 1) = *(_QWORD *)v76;
      v108 = v77;
      v109 = (*(_QWORD *)(v74 + 24) & 0x1000) == 0;
      v106 = (char *)*((_QWORD *)&v107 + 1);
      *(_QWORD *)&v107 = *((_QWORD *)&v107 + 1);
      sub_1002D63AC(&__p, (__int128 *)&v106);
      v72 = v115;
      v70 = (char *)__p;
      v71 = (char *)v111;
    }
    v78 = (id *)v72[3];
    v79 = v78[3];
    if (v71 == v70)
    {
LABEL_185:
      if ((v79 & 1) == 0)
      {
        v92 = objc_opt_new(CRLWPMutableRangeArray);

        v101 = v92;
        goto LABEL_189;
      }
      v63 = *v78;
      v65 = 1;
      goto LABEL_188;
    }
    v80 = 0;
    v81 = 0;
    v82 = 0;
    while (1)
    {
      v83 = &v70[40 * v80];
      v85 = (char *)*((_QWORD *)v83 + 2);
      v84 = *((_QWORD *)v83 + 3);
      if (v102 < v85 || v102 - v85 >= v84)
      {
        if (((unsigned __int16)v79 & 0x1000) == 0)
          goto LABEL_176;
        if ((v81 & 1) != 0)
          goto LABEL_182;
LABEL_177:
        v81 = 0;
        v70 = (char *)__p;
        v80 = ++v82;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (_QWORD)__p) >> 3) <= v82)
        {
          v72 = v115;
LABEL_184:
          v78 = (id *)v72[3];
          v79 = v78[3];
          goto LABEL_185;
        }
      }
      else
      {
        v87 = v70[40 * v80 + 32];
        if (((unsigned __int16)v79 & 0x1000) == 0)
        {
          if (v87)
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v73, "textSource"));
            v89 = (char *)objc_msgSend(v88, "nextCharacterIndex:", v102);
            if (v85 >= v89)
              v85 = v89;

            v81 = 1;
            v73 = v100;
          }
          else
          {
            if (v102 >= &v85[v84])
              v85 += v84;
            else
              v85 = v102;
            v81 = 1;
          }
LABEL_176:
          -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v85);
          if ((v81 & 1) != 0)
            goto LABEL_189;
          goto LABEL_177;
        }
        if (v87)
        {
          if (v102 >= &v85[v84])
            v85 += v84;
          else
            v85 = v102;
        }
        else
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v73, "textSource"));
          v91 = (char *)objc_msgSend(v90, "nextCharacterIndex:", v102);
          if (v85 >= v91)
            v85 = v91;

          v73 = v100;
        }
LABEL_182:
        -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v85);
        v70 = (char *)__p;
        v81 = 1;
        v80 = ++v82;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (_QWORD)__p) >> 3) <= v82)
          goto LABEL_189;
      }
    }
  }
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 1;
  do
  {
    v40 = &v35[40 * v36];
    v42 = *((_QWORD *)v40 + 2);
    v41 = (char *)*((_QWORD *)v40 + 3);
    v44 = (unint64_t)v103 >= v42 && &v103[-v42] < v41;
    if (!v44)
    {
      v48 = (char *)*((_QWORD *)v40 + 2);
      v49 = *((_QWORD *)v40 + 3);
      goto LABEL_87;
    }
    if ((v99 & 0x1000) == 0 || v119[3] == v115[3])
    {
      if (v35[40 * v36 + 32])
      {
LABEL_72:
        if (v103 <= &v41[v42])
          v50 = &v41[v42];
        else
          v50 = v103;
        if (v103 >= &v41[v42])
          v48 = &v41[v42];
        else
          v48 = v103;
        v49 = v50 - v48;
        goto LABEL_86;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v100, "textSource"));
      v51 = (char *)objc_msgSend(v45, "nextCharacterIndex:", v103);
      if (v42 <= (unint64_t)v51)
        v47 = v51;
      else
        v47 = (_BYTE *)v42;
      if (v42 >= (unint64_t)v51)
        v48 = v51;
      else
        v48 = (char *)v42;
    }
    else
    {
      if (!v35[40 * v36 + 32])
        goto LABEL_72;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v100, "textSource"));
      v46 = (char *)objc_msgSend(v45, "nextCharacterIndex:", v103);
      if (v42 <= (unint64_t)v46)
        v47 = v46;
      else
        v47 = (_BYTE *)v42;
      if (v42 >= (unint64_t)v46)
        v48 = v46;
      else
        v48 = (char *)v42;
    }

    v49 = v47 - v48;
LABEL_86:
    v37 = 1;
LABEL_87:
    if ((unint64_t)v102 >= v42 && &v102[-v42] < v41)
    {
      if (*((_BYTE *)__p + 40 * v36 + 32))
      {
        if (v44)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v100, "textSource"));
          v54 = (char *)objc_msgSend(v53, "nextCharacterIndex:", v102);
          if (v103 <= v54)
            v55 = v54;
          else
            v55 = v103;
          if (v103 >= v54)
            v48 = v54;
          else
            v48 = v103;
        }
        else
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v100, "textSource"));
          v57 = (char *)objc_msgSend(v53, "nextCharacterIndex:", v102);
          if (v42 <= (unint64_t)v57)
            v55 = v57;
          else
            v55 = (char *)v42;
          if (v42 >= (unint64_t)v57)
            v48 = v57;
          else
            v48 = (char *)v42;
        }
      }
      else
      {
        if (!v44)
        {
          if (v102 <= &v41[v42])
            v59 = &v41[v42];
          else
            v59 = v102;
          if (v102 >= &v41[v42])
            v48 = &v41[v42];
          else
            v48 = v102;
          v49 = v59 - v48;
          goto LABEL_113;
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](v100, "textSource"));
        v56 = (char *)objc_msgSend(v53, "nextCharacterIndex:", v103);
        if (v102 <= v56)
          v55 = v56;
        else
          v55 = v102;
        if (v102 >= v56)
          v48 = v56;
        else
          v48 = v102;
      }

      v49 = v55 - v48;
LABEL_113:
      v38 = 1;
    }
    if ((v99 & 0x1000) != 0)
    {
      if (((v38 | v37) & 1) != 0 || v119[3] != v115[3])
        -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v48, v49);
      if ((v37 & 1) != 0)
      {
        if ((v119[3] != v115[3]) | v38 & 1)
          break;
        goto LABEL_124;
      }
    }
    else if ((v37 & 1) != 0)
    {
      -[CRLWPMutableRangeArray addRange:](v101, "addRange:", v48, v49);
    }
    if ((v38 & 1) != 0)
      goto LABEL_189;
LABEL_124:
    v36 = v39;
    v35 = __p;
  }
  while (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (_QWORD)__p) >> 3) > v39++);
  if ((v38 & 1) == 0)
    goto LABEL_134;
LABEL_189:
  if (__p)
  {
    *(_QWORD *)&v111 = __p;
    operator delete(__p);
  }
  self = v100;
LABEL_192:
  if (-[CRLWPRangeArray rangeCount](v101, "rangeCount"))
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v94 = objc_msgSend(v93, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", objc_msgSend(v6, "start"));
    v7 = objc_msgSend(v6, "copyWithVisualRanges:headCharIndex:tailCharIndex:rightToLeft:sameLine:", v101, v103, v102, v94, v119[3] == v115[3]);

  }
  else if (objc_msgSend(v6, "isRange"))
  {
    v7 = objc_msgSend(v6, "copyWithNewType:", 0);
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(v122, 8);

  _Block_object_dispose(v124, 8);
  self = v100;
  if (v98)
  {
LABEL_198:
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v96 = objc_msgSend(v95, "isEqual:", v7);

    if ((v96 & 1) == 0)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](v100, "editorController"));
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1002D6538;
      v104[3] = &unk_10124E0C0;
      v104[4] = v100;
      v7 = v7;
      v105 = v7;
      objc_msgSend(v97, "performBlockAfterSettingSelection:", v104);

    }
  }
LABEL_4:

  return v7;
}

- (void)p_selection:(id)a3 toGlyphRange:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  BOOL *p_var7;
  char *v10;
  _BOOL4 var6;
  id v12;
  CRLWPLineFragment *var0;
  char v14;
  CRLWPLineFragment *v15;
  uint64_t v16;
  __int128 *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t var2;
  CRLWPLineFragment *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  a4->var6 = objc_msgSend(v6, "isInsertionPoint");
  v7 = (char *)objc_msgSend(v6, "rawRange");
  v8 = (uint64_t)v7;
  if (a4->var6)
  {
    a4->var7 = 0;
    p_var7 = &a4->var7;
    v29 = 0;
    v30 = 0;
    v10 = v7;
  }
  else
  {
    v10 = (char *)objc_msgSend(v6, "end") - 1;
    a4->var7 = 0;
    p_var7 = &a4->var7;
    var6 = a4->var6;
    v29 = 0;
    v30 = 0;
    if (!var6)
      goto LABEL_6;
  }
  if (objc_msgSend(v6, "caretAffinity") == (id)1)
  {
    v12 = objc_msgSend(v6, "leadingEdge");
    goto LABEL_7;
  }
LABEL_6:
  v12 = 0;
LABEL_7:
  var0 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v8, &v30, v12);
  a4->var0 = var0;
  v14 = v12 ^ 1;
  if (var0)
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    var0 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v8 - 1, &v30, 1);
    a4->var0 = var0;
  }
  v15 = var0;
  if (!a4->var6)
  {
    v15 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v10, &v29, objc_msgSend(v6, "caretAffinity") == (id)1);
    var0 = a4->var0;
  }
  a4->var1 = v15;
  if (var0)
  {
    if (*((_QWORD *)var0 + 1))
    {
      if (a4->var6)
      {
        v16 = *((_QWORD *)var0 + 3);
        v17 = &xmmword_100EEE418;
        if (v16 >= 0)
          v17 = (__int128 *)var0;
        if (v8 == *(_QWORD *)v17 + *((_QWORD *)v17 + 1))
          v18 = ((unint64_t)v16 >> 12) & 1;
        else
          LODWORD(v18) = sub_100144A40((__int128 *)var0, v8) == 1;
        if ((_DWORD)v18 == objc_msgSend(v6, "leadingEdge"))
        {
          v22 = a4->var0;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "storage"));
          v8 = sub_100147718((uint64_t)v22, v8, 2, v24);

        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL
          || (v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor")),
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "storage")),
              v27 = objc_msgSend(v26, "length"),
              v26,
              v25,
              (id)v8 == v27))
        {
          v8 = sub_1001449A4((uint64_t)a4->var0);
          *p_var7 = 1;
        }
        v28 = sub_100145F64((uint64_t)a4->var0, v8);
        a4->var2 = v28;
        a4->var3 = v8;
        a4->var4 = v28;
        a4->var5 = v8;
      }
      else if (v15)
      {
        a4->var2 = sub_100145F64((uint64_t)var0, v8);
        v20 = sub_100145F64((uint64_t)a4->var1, (unint64_t)v10);
        a4->var3 = v8;
        a4->var4 = v20;
        a4->var5 = (unint64_t)v10;
        if (a4->var0 == a4->var1)
        {
          var2 = a4->var2;
          if (var2 >= v20 != (*((_BYTE *)a4->var0 + 25) & 0x10) >> 4)
          {
            a4->var2 = v20;
            a4->var3 = (unint64_t)v10;
            a4->var4 = var2;
            a4->var5 = v8;
          }
        }
      }
    }
    else
    {
      a4->var2 = 0;
      a4->var4 = 0;
      if ((*((_QWORD *)var0 + 3) & 0x1000) != 0)
        v19 = v8 - 1;
      else
        v19 = v8;
      a4->var3 = v19;
      a4->var5 = v8 - 1;
    }
  }

}

- (unint64_t)p_leftCharForInsertion:(id *)a3
{
  CRLWPLineFragment *var0;
  void *v6;
  void *v7;
  unint64_t var3;
  _BOOL4 var7;
  id v10;
  uint64_t v11;
  __int128 *v12;
  id v13;

  var0 = a3->var0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storage"));

  var3 = a3->var3;
  if (*((_QWORD *)var0 + 1))
  {
    var7 = a3->var7;
    v10 = (id)a3->var3;
    if (!var7)
      v10 = (id)sub_100147718((uint64_t)var0, var3, 3, v7);
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = *((_QWORD *)var0 + 3);
      if ((v11 & 0x1000) != 0)
      {
        v13 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", var3, 0, 3, 1);
      }
      else
      {
        if (!var3)
        {
          v10 = 0;
          goto LABEL_15;
        }
        if (v11 < 0)
          v12 = &xmmword_100EEE418;
        else
          v12 = (__int128 *)var0;
        v13 = objc_msgSend(v7, "previousCharacterIndex:", *(_QWORD *)v12);
      }
    }
    else
    {
      if (v10 != objc_msgSend(v7, "characterCount"))
      {
LABEL_15:
        var3 = (unint64_t)v10;
        goto LABEL_16;
      }
      v13 = objc_msgSend(v7, "previousCharacterIndex:", v10);
    }
    v10 = v13;
    goto LABEL_15;
  }
LABEL_16:

  return var3;
}

- (_NSRange)adjustVisualSelection:(id)a3 withOtherSelection:(id)a4 outLeadingEdge:(BOOL *)a5 outCaretAffinity:(unint64_t *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  NSUInteger v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unint64_t v28;
  id v29;
  unint64_t v30;
  __int128 *v31;
  __int128 *v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  unint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  NSUInteger v55;
  NSUInteger v56;
  void *v57;
  int64x2_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  int64x2_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char v70;
  _NSRange result;

  v10 = a3;
  v11 = a4;
  *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v13));
  v17 = sub_100221D0C(v15, v16);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v19 = 0;
  if (a5)
    *a5 = 1;
  if (a6)
    *a6 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper calculateVisualRunsFromSelection:updateControllerSelection:](self, "calculateVisualRunsFromSelection:updateControllerSelection:", v10, 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper calculateVisualRunsFromSelection:updateControllerSelection:](self, "calculateVisualRunsFromSelection:updateControllerSelection:", v11, 0));
  -[CRLWPEditorHelper p_selection:toGlyphRange:](self, "p_selection:toGlyphRange:", v20, &v65);
  -[CRLWPEditorHelper p_selection:toGlyphRange:](self, "p_selection:toGlyphRange:", v21, &v58);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v65), (int32x4_t)vceqzq_s64(v58)))) & 1) == 0)
  {
    if (v67 == v60 && v69 == v62 && v70 == v64)
    {
      if (a5)
        *a5 = objc_msgSend(v20, "leadingEdge");
      if (a6)
        *a6 = (unint64_t)objc_msgSend(v20, "caretAffinity");
      v18 = (unint64_t)objc_msgSend(v20, "rawRange");
      v19 = v22;
      goto LABEL_144;
    }
    if (objc_msgSend(v20, "isInsertionPoint"))
    {
      if (!objc_msgSend(v21, "isInsertionPoint"))
      {
        if (v65.i64[0] == v58.i64[0])
        {
          if (v66 >= v59)
          {
            v39 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v65);
            v40 = &v60;
          }
          else
          {
            v39 = v67;
            v40 = &v62;
          }
          v49 = *v40;
          if (v39 >= v49)
            v23 = v49;
          else
            v23 = v39;
          if (v39 <= v49)
            v36 = v49;
          else
            v36 = v39;
          goto LABEL_119;
        }
        v36 = v67;
        v23 = v60;
        v37 = *(_QWORD *)(v65.i64[0] + 24);
        if (v67 >= v60)
        {
          if ((v37 & 0x1000) != 0)
            goto LABEL_112;
          goto LABEL_51;
        }
        if ((v37 & 0x1000) != 0)
          v36 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v65);
        v23 = v36;
        v36 = v62;
LABEL_112:
        if (v23 > v36)
        {
          v50 = objc_msgSend(v57, "nextCharacterIndex:", v23);
          if (v36 <= (unint64_t)v50)
            v51 = (unint64_t)v50;
          else
            v51 = v36;
          if (v36 >= (unint64_t)v50)
            v18 = (unint64_t)v50;
          else
            v18 = v36;
LABEL_143:
          v19 = v51 - v18;
          goto LABEL_144;
        }
LABEL_119:
        v52 = objc_msgSend(v57, "nextCharacterIndex:", v36);
        if (v23 <= (unint64_t)v52)
          v51 = (unint64_t)v52;
        else
          v51 = v23;
        if (v23 >= (unint64_t)v52)
          v18 = (unint64_t)v52;
        else
          v18 = v23;
        goto LABEL_143;
      }
      if (v65.i64[0] != v58.i64[0])
      {
        v23 = v67;
        if (v67 < v60)
        {
          if ((*(_BYTE *)(v65.i64[0] + 25) & 0x10) != 0)
          {
            v24 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v65);
          }
          else
          {
            if (!v70)
              goto LABEL_100;
            v24 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:", v67, 0, 2, 1, 1);
          }
          v23 = v24;
LABEL_100:
          if ((*(_BYTE *)(v58.i64[0] + 25) & 0x10) != 0)
          {
            v36 = v60;
            if (!v64)
              goto LABEL_112;
            v42 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:", v60, 0, 2, 1, 1);
          }
          else
          {
            v42 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58);
          }
          goto LABEL_111;
        }
        if ((*(_BYTE *)(v58.i64[0] + 25) & 0x10) != 0)
        {
          v41 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58);
        }
        else
        {
          if (!v64)
          {
            v23 = v60;
            goto LABEL_104;
          }
          v41 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:");
        }
        v23 = v41;
LABEL_104:
        if ((*(_BYTE *)(v65.i64[0] + 25) & 0x10) == 0)
        {
LABEL_51:
          v42 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v65);
LABEL_111:
          v36 = v42;
          goto LABEL_112;
        }
        v36 = v67;
        if (v67 && v70)
        {
          v42 = sub_1001AF900(v67, v57);
          goto LABEL_111;
        }
        goto LABEL_112;
      }
      if (v66 <= v59)
      {
        v36 = v67;
        if (!v70)
        {
          v48 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58);
LABEL_85:
          if (v36 >= v48)
            v23 = v48;
          else
            v23 = v36;
          if (v36 <= v48)
            v36 = v48;
          goto LABEL_119;
        }
      }
      else
      {
        v36 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v65);
      }
      v48 = v60;
      goto LABEL_85;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "visualRanges"));
    if ((objc_msgSend(v25, "containsCharacterAtIndex:", v60) & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "visualRanges"));
      v27 = objc_msgSend(v26, "containsCharacterAtIndex:", v62);

      if (v27)
      {
        v28 = v60;
        v29 = objc_msgSend(v20, "superRange");
        if (v28 <= (unint64_t)v29 + (v30 >> 1))
        {
          v34 = v60;
          v35 = objc_msgSend(v57, "nextCharacterIndex:", v69);
LABEL_137:
          if (v34 <= (unint64_t)v35)
            v51 = (unint64_t)v35;
          else
            v51 = v34;
          if (v34 >= (unint64_t)v35)
            v18 = (unint64_t)v35;
          else
            v18 = v34;
          goto LABEL_143;
        }
        v31 = (__int128 *)v58.i64[0];
        v32 = (__int128 *)v65.i64[0];
        if (v58.i64[0] != v65.i64[0])
        {
          if (*(uint64_t *)(v65.i64[0] + 24) < 0)
            v32 = &xmmword_100EEE418;
          v33 = *(_QWORD *)v32;
          if (*(uint64_t *)(v58.i64[0] + 24) < 0)
            v31 = &xmmword_100EEE418;
          v34 = v67;
          if (v33 <= *(_QWORD *)v31)
            v35 = objc_msgSend(v57, "nextCharacterIndex:", -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58));
          else
            v35 = objc_msgSend(v57, "nextCharacterIndex:", v60);
          goto LABEL_137;
        }
        v53 = *(_QWORD *)(v58.i64[0] + 24);
        v54 = (id)v60;
        if ((v53 & 0x1000) != 0)
        {
          v54 = objc_msgSend(v57, "nextCharacterIndex:", v60);
          v53 = *(_QWORD *)(v58.i64[0] + 24);
        }
        if ((v53 & 0x1000) == 0 && v64)
          v54 = objc_msgSend(v57, "nextCharacterIndex:", v60);
        if (v67 <= (unint64_t)v54)
          v47 = (unint64_t)v54;
        else
          v47 = v67;
        if (v67 >= (unint64_t)v54)
          v18 = (unint64_t)v54;
        else
          v18 = v67;
LABEL_82:
        v19 = v47 - v18;
        goto LABEL_144;
      }
    }
    else
    {

    }
    if (v58.i64[0] == v65.i64[0])
    {
      if ((*(_BYTE *)(v58.i64[0] + 25) & 0x10) != 0)
      {
        if (v59 < v66)
          goto LABEL_39;
      }
      else if (v59 >= v66)
      {
        goto LABEL_39;
      }
    }
    else if (v60 > v67)
    {
LABEL_39:
      v38 = v67;
      goto LABEL_58;
    }
    if (v63 && (*(_BYTE *)(v58.i64[0] + 25) & 0x10) != 0)
      v38 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58);
    else
      v38 = v60;
LABEL_58:
    if (v58.i64[1] == v65.i64[1])
    {
      if ((*(_BYTE *)(v58.i64[1] + 25) & 0x10) != 0)
      {
        if (v61 > v68)
          goto LABEL_60;
      }
      else if (v61 < v68)
      {
        goto LABEL_60;
      }
    }
    else if (v62 < v69)
    {
LABEL_60:
      v43 = v69;
      goto LABEL_70;
    }
    if (v63)
    {
      if ((*(_BYTE *)(v58.i64[0] + 25) & 0x10) != 0)
        v43 = v60;
      else
        v43 = -[CRLWPEditorHelper p_leftCharForInsertion:](self, "p_leftCharForInsertion:", &v58);
    }
    else
    {
      v43 = v62;
    }
LABEL_70:
    if (v38 <= v43)
      v44 = v43;
    else
      v44 = v38;
    v45 = objc_msgSend(v57, "nextCharacterIndex:", v44);
    if (v38 >= v43)
      v46 = v43;
    else
      v46 = v38;
    if (v46 <= (unint64_t)v45)
      v47 = (unint64_t)v45;
    else
      v47 = v46;
    if (v46 >= (unint64_t)v45)
      v18 = (unint64_t)v45;
    else
      v18 = v46;
    goto LABEL_82;
  }
LABEL_144:

  v55 = v18;
  v56 = v19;
  result.length = v56;
  result.location = v55;
  return result;
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  _BOOL4 selectionLastModifiedWithKeyboard;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unsigned __int8 v52;
  _QWORD v53[4];
  id v54;
  id v55;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isValid") && objc_msgSend(v8, "isValid"))
  {
    objc_msgSend(v7, "superRange");
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1002D75A0;
    v53[3] = &unk_10124E0E8;
    v7 = v7;
    v54 = v7;
    v9 = v8;
    v55 = v9;
    v50 = objc_retainBlock(v53);
    if (objc_msgSend(v9, "type") == (id)7 && !objc_msgSend(v7, "type"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper logicalToVisualSelection:](self, "logicalToVisualSelection:", v7));

      v11 = objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper calculateVisualRunsFromSelection:updateControllerSelection:](self, "calculateVisualRunsFromSelection:updateControllerSelection:", v10, 0));
      v7 = (id)v11;
    }
    if (objc_msgSend(v9, "type") == (id)7 && objc_msgSend(v7, "type") == (id)7)
    {
      v52 = 1;
      v51 = 0;
      v12 = -[CRLWPEditorHelper adjustVisualSelection:withOtherSelection:outLeadingEdge:outCaretAffinity:](self, "adjustVisualSelection:withOtherSelection:outLeadingEdge:outCaretAffinity:", v7, v9, &v52, &v51);
      v49 = v13;
      v14 = v12;
      if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = ((uint64_t (*)(void))v50[2])();
        v49 = v16;
        v14 = (id)v15;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      if ((objc_msgSend(v17, "isValid") & 1) != 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
        v19 = objc_msgSend(v18, "range");
        v21 = v20;

        if (v19 == v14 && v21 == v49)
        {
          v22 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {

      }
      v48 = objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass"));
      v47 = v51;
      v31 = v52;
      *(_QWORD *)&v33 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v32).n128_u64[0];
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v33));
      v37 = sub_100221D0C(v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      LOBYTE(v46) = v31 != 0;
      v22 = objc_msgSend(v48, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v14, v49, 0, v47, 0x7FFFFFFFFFFFFFFFLL, 0, v46, v38);

      if (!v22)
        goto LABEL_25;
    }
    else
    {
      v23 = ((uint64_t (*)(void))v50[2])();
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      if ((objc_msgSend(v26, "isValid") & 1) != 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
        v28 = objc_msgSend(v27, "range");
        v30 = v29;

        if (v28 == (id)v23 && v30 == v25)
        {
          v22 = 0;
          goto LABEL_25;
        }
      }
      else
      {

      }
      v22 = objc_msgSend(objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass")), "initWithRange:", v23, v25);
      if (!v22)
        goto LABEL_25;
    }
    selectionLastModifiedWithKeyboard = self->_selectionLastModifiedWithKeyboard;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    objc_msgSend(v40, "setSelection:forEditor:withFlags:", v22, v41, 8);

    if (selectionLastModifiedWithKeyboard)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "selectionPath"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:", v9));

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v45, "scrollToSelectionPath:scrollOptions:", v44, 1);

    }
    goto LABEL_25;
  }
LABEL_26:

}

- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 forDirection:(int64_t)a5
{
  int v6;
  unint64_t v7;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v28;

  v6 = a4;
  v7 = a3;
  v28 = a4;
  if ((unint64_t)a5 < 2)
  {
    if (!a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v7 = (unint64_t)objc_msgSend(v14, "nextCharacterIndex:", v7);

    }
    if (!a5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v7 = (unint64_t)objc_msgSend(v23, "charIndexRemappedFromStorage:", v7);

      return v7;
    }
    if (a5 != 1)
      return 0x7FFFFFFFFFFFFFFFLL;
    v15 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v7, 1);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL || v15 == v7)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = v15;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E148);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B204();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E168);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1283, 0, "Should not have received NSNotFound.");

      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if ((unint64_t)(a5 - 2) > 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E188);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1B104();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E1A8);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1295, 0, "illegal direction");

  }
  else
  {
    v9 = -[CRLWPEditorHelper p_isLayoutLeftToRightAtCharIndex:](self, "p_isLayoutLeftToRightAtCharIndex:", a3);
    v10 = 2;
    if (v9 != v6)
      v10 = 3;
    if (v10 != a5)
    {
      v11 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", v7, &v28, a5, 0);
      if (v11 == v7)
      {
        if (v28 == v6 || v7 == 0x7FFFFFFFFFFFFFFFLL)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = v7;
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
          return v13;
      }
      else
      {
        v7 = v11;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          return v7;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E108);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B184();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E128);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 1267, 0, "Should not have received NSNotFound.");

      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (_NSRange)availableSelectionRangeForCharIndex:(unint64_t)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform12CRLWPStorage, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v4));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = objc_msgSend(v9, "copyWithMarkedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeForAllOf:](_TtC8Freeform12CRLTextRange, "textRangeForAllOf:", v10));
  v12 = objc_msgSend(v11, "nsRange");
  v14 = v13;

  v15 = (NSUInteger)v12;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5
{
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t result;
  CFRange CurrentTokenRange;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  CFTypeRef cf;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  BOOL v32;

  if (a4)
    v9 = *a4;
  else
    v9 = 1;
  v32 = v9;
  if ((unint64_t)a5 > 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E248);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1B384();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E268);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 1400, 0, "Unsupported direction");

    result = 0x7FFFFFFFFFFFFFFFLL;
LABEL_35:
    if (!a4)
      return result;
    goto LABEL_36;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeForAllOf:](_TtC8Freeform12CRLTextRange, "textRangeForAllOf:", v10));
  v12 = objc_msgSend(v11, "nsRange");
  v14 = v13;

  v31 = a3;
  v30 = xmmword_100EEE418;
  v15 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, v32, a5);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_35;
  v29 = xmmword_100EEE418;
  cf = -[CRLWPEditorHelper createTokenizerForCharIndex:outTokenizerRange:](self, "createTokenizerForCharIndex:outTokenizerRange:", v15, &v29);
  CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)cf);
  v18 = -[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v31, &v32, &cf, &v29, a5, CurrentTokenRange.location, CurrentTokenRange.length, &v30, 7);
  if (CurrentTokenRange.location == 0x7FFFFFFFFFFFFFFFLL && !CurrentTokenRange.length || (v19 = v31, v31 == a3))
  {
    if (v18 == 4 || v18 == 1)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (v18 > 4 || ((1 << v18) & 0x16) == 0)
  {
LABEL_11:
    -[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v31, &v32, &cf, &v29, a5, 0x7FFFFFFFFFFFFFFFLL, 0, &v30, 8);
LABEL_12:
    v19 = v31;
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v19 >= (unint64_t)v12)
    {
      v26 = (unint64_t)v12 + v14;
      a3 = v19;
      if (v19 <= v26)
        goto LABEL_52;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E208);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B304();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E228);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1392, 0, "Result beyond selection range max.");
      a3 = v26;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E1C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B284();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E1E8);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1389, 0, "Result beyond selection range min.");
      a3 = (unint64_t)v12;
    }

  }
LABEL_52:
  result = a3;
  if (!a4)
    return result;
LABEL_36:
  *a4 = v32;
  return result;
}

- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  const void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  *a4 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D8608;
  v7[3] = &unk_10124E290;
  v7[4] = &v8;
  v7[5] = a4;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", a3, a5, v7);
  v5 = (const void *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)p_withLineFragmentsForLogicalLineContainingCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  uint64_t v5;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002D8728;
  v10[3] = &unk_10124E2B8;
  v11 = a5;
  v12 = &v13;
  v8 = v11;
  -[CRLWPEditorHelper p_withLineIndexForCharIndex:eol:performBlock:](self, "p_withLineIndexForCharIndex:eol:performBlock:", a3, v5, v10);
  LOBYTE(v5) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (unint64_t)p_lastVisibleCharIndexForCharIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper layout](self, "layout", a3));
  v10 = sub_100221DDC(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "columns"));
    v13 = +[CRLWPColumn rangeOfColumns:](CRLWPColumn, "rangeOfColumns:", v12);
    v15 = (unint64_t)v13 + v14;

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E2D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1B404();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E2F8);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_lastVisibleCharIndexForCharIndex:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1472, 0, "invalid nil value for '%{public}s'", "layout");

  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (unint64_t)p_lineIndexForMovingCharIndex:(unint64_t)a3 column:(id *)a4 up:(BOOL)a5 atStart:(BOOL)a6 eol:(BOOL *)a7
{
  _BOOL8 v7;
  _BOOL8 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[7];
  BOOL v21;
  _QWORD v22[11];
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  uint64_t (*v33)();
  void *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v7 = a5;
  *a4 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = 0;
  v30 = &v29;
  v31 = 0x4012000000;
  v32 = sub_1002D9038;
  v33 = nullsub_38;
  v34 = &unk_1010E66AB;
  v35 = xmmword_100EEE418;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x8000000000000000;
  v10 = *a7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002D9048;
  v22[3] = &unk_10124E320;
  v22[8] = a3;
  v22[9] = a7;
  v22[4] = self;
  v22[5] = &v29;
  v23 = a5;
  v22[6] = &v25;
  v22[7] = &v36;
  v22[10] = a4;
  v24 = a6;
  -[CRLWPEditorHelper p_withLayoutTargetForCharIndex:eolAffinity:performBlock:](self, "p_withLayoutTargetForCharIndex:eolAffinity:performBlock:", a3, v10, v22);
  v11 = v37[3];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v30[6];
    v13 = v30[7];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL || v13)
    {
      if (v7)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v15 = sub_1001AEAA8(v12, v14);

        if ((v26[3] & 0x300) == 0x100)
          v15 = v30[6];
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v15 = sub_1001AF294(v13 + v12, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v18 = objc_msgSend(v17, "length");
        if ((unint64_t)v18 < v15)
          v15 = (unint64_t)v18;

      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1002D95B0;
      v20[3] = &unk_10124E348;
      v21 = v7;
      v20[4] = &v36;
      v20[5] = v15;
      v20[6] = a4;
      -[CRLWPEditorHelper p_withLayoutTargetForCharIndex:eolAffinity:performBlock:](self, "p_withLayoutTargetForCharIndex:eolAffinity:performBlock:", v15, v7, v20);
      v11 = v37[3];
    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v36, 8);
  return v11;
}

- (void)p_withLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  BOOL v12;

  v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D97D4;
  v9[3] = &unk_10124E370;
  v12 = a4;
  v10 = a5;
  v11 = a3;
  v8 = v10;
  -[CRLWPEditorHelper p_withLayoutTargetForCharIndex:eolAffinity:performBlock:](self, "p_withLayoutTargetForCharIndex:eolAffinity:performBlock:", a3, v5, v9);

}

- (_TtC8Freeform11CRLWPLayout)layout
{
  _TtC8Freeform11CRLWPLayout *layout;
  _TtC8Freeform11CRLWPLayout *v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  layout = self->_layout;
  if (layout)
  {
    v3 = layout;
  }
  else
  {
    *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform11CRLWPLayout, a2).n128_u64[0];
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    objc_opt_class(NSObject, v10);
    v17 = sub_10022209C(v9, v11, 1, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutForInfo:", v18));
    v20 = sub_100221D0C(v7, v19);
    v3 = (_TtC8Freeform11CRLWPLayout *)objc_claimAutoreleasedReturnValue(v20);

  }
  return v3;
}

- (void)p_withLayoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 performBlock:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = (void (**)(id, void *))a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper layout](self, "layout"));
  v13 = sub_100221DDC(v6, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15[2](v15, v14);
}

- (void)withLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002D9BB0;
  v9[3] = &unk_10124E3D8;
  v10 = a5;
  v8 = v10;
  -[CRLWPEditorHelper p_withLineIndexForCharIndex:eol:performBlock:](self, "p_withLineIndexForCharIndex:eol:performBlock:", a3, v5, v9);

}

- (unint64_t)caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4;
  unint64_t result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E3F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B514();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E418);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper caretCharIndexForLayoutOrderCharIndex:inDirection:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1707, 0, "Unsupported vertical character direction");

    }
    else
    {
      result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        return result;
      v7 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:", a3);
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v10, "layoutIfNeeded");

      v19[0] = 0;
      v11 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v4, v19, 0);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));
        v14 = sub_100147114((uint64_t)v11, v4, v13);

        if (v14 <= (unint64_t)v7 + v9 && v14 >= (unint64_t)v7)
          return v14;
      }
    }
  }
  return v4;
}

- (unint64_t)p_layoutOrderCharIndexForCaretCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4;
  unint64_t result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E438);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B594();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E458);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_layoutOrderCharIndexForCaretCharIndex:inDirection:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1748, 0, "Unsupported vertical character direction");

    }
    else
    {
      result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
        return result;
      v7 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:", a3);
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v10, "layoutIfNeeded");

      v19[0] = 0;
      v11 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v4, v19, 0);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));
        v14 = sub_100146B34((uint64_t)v11, v4, v13);

        if (v14 <= (unint64_t)v7 + v9 && v14 >= (unint64_t)v7)
          return v14;
      }
    }
  }
  return v4;
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  return -[CRLWPEditorHelper p_charIndexByMovingPosition:toBoundary:inDirection:preferPosition:outEolAffinity:](self, "p_charIndexByMovingPosition:toBoundary:inDirection:preferPosition:outEolAffinity:", a3, a4, a5, a6, 0);
}

- (unint64_t)p_charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6 outEolAffinity:(unint64_t *)a7
{
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  CRLWPSelection *v17;
  int v18;
  void *v19;
  void *v20;
  CRLWPSelection *v21;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;

  v12 = a3;
  v13 = objc_msgSend(v12, "location");
  v25 = objc_msgSend(v12, "eolAffinity");
  v24 = 1;
  if (a4)
    v14 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", objc_msgSend(v12, "location"), &v25, a4, a5, a6, &v24);
  else
    v14 = -[CRLWPEditorHelper caretCharIndexForLayoutOrderCharIndex:inDirection:](self, "caretCharIndexForLayoutOrderCharIndex:inDirection:", -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[CRLWPEditorHelper p_layoutOrderCharIndexForCaretCharIndex:inDirection:](self, "p_layoutOrderCharIndexForCaretCharIndex:inDirection:", objc_msgSend(v12, "location"), a5), a5), a5);
  v15 = v14;
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v25;
    if (a7)
      *a7 = v25;
    v17 = [CRLWPSelection alloc];
    v18 = v24;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "storage"));
    LOBYTE(v23) = v18 != 0;
    v21 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v17, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, 0, 0, v16, 0x7FFFFFFFFFFFFFFFLL, 0, v23, v20);

    v13 = -[CRLWPSelection leadingCharIndex](v21, "leadingCharIndex");
  }

  return (unint64_t)v13;
}

- (unint64_t)charIndexForBeginningOfLineFromCharIndex:(unint64_t)a3
{
  char v4;
  uint64_t v5;
  char v6;

  v6 = 0;
  v5 = 0;
  v4 = 1;
  return -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", a3, &v6, 4, 1, &v5, &v4);
}

- (unint64_t)charIndexForEndOfLineFromCharIndex:(unint64_t)a3
{
  char v4;
  uint64_t v5;
  char v6;

  v6 = 0;
  v5 = 0;
  v4 = 0;
  return -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", a3, &v6, 4, 0, &v5, &v4);
}

- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int64_t)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8
{
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  CFIndex v28;
  CFIndex v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  char *v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger location;
  NSUInteger length;
  id v45;
  NSUInteger v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  unsigned int v51;
  uint64_t v52;
  CFIndex v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  double v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  NSRange v63;
  __CFString *v64;
  __CFStringTokenizer *v65;
  CFStringTokenizerTokenType Token;
  CFRange CurrentTokenRange;
  CFIndex v68;
  CFIndex v69;
  void *v70;
  void *v71;
  void *v72;
  CFIndex v73;
  CFRange v74;
  unint64_t v75;
  unint64_t v76;
  CFRange v77;
  double *v78;
  unint64_t v79;
  double v80;
  double v81;
  double *v82;
  double *v83;
  uint64_t v84;
  BOOL v85;
  __int128 *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  int v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 *v102;
  __int128 *v103;
  uint64_t v104;
  uint64_t v105;
  __int128 *v106;
  uint64_t v107;
  id v108;
  int v109;
  unsigned int v110;
  __int128 *v111;
  uint64_t v112;
  uint64_t v113;
  __int128 *v114;
  __int128 *v115;
  void *v116;
  _QWORD v118[5];
  id v119;
  void **v120;
  int64_t v121;
  BOOL *v122;
  BOOL *v123;
  char *v124;
  unint64_t v125;
  id v126;
  id v127;
  void **v128;
  uint64_t v129;
  uint64_t v130;
  NSRange v131;
  NSRange v132;
  CFRange v133;

  v14 = (char *)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v24 = sub_100221DDC(v17, 1, v18, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___CRLWPTextSource);
  v116 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v25 = &v14[v16];

  if ((unint64_t)&v14[v16] < a3)
    goto LABEL_2;
  v28 = 0;
  switch(a5)
  {
    case 0:
      v30 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", a3, a8, a6, 1);
      goto LABEL_50;
    case 1:
      v30 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", a3, a8, a6);
LABEL_50:
      v26 = v30;
      goto LABEL_51;
    case 2:
      if ((unint64_t)a6 >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E520);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1B748();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E540);
        v36 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 2066, 0, "sentence movement in layout direction is not supported");

      }
      if (a8)
        *a8 = 1;
      v39 = (char *)objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", a3);
      v40 = (NSUInteger)v39;
      v42 = v41;
      location = 0x7FFFFFFFFFFFFFFFLL;
      length = 0;
      if (a6 == 1 && v39)
      {
        v45 = objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", v39 - 1);
LABEL_44:
        location = (NSUInteger)v45;
        length = v46;
        goto LABEL_68;
      }
      if (!a6)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v58 = v40 + v42 < (unint64_t)objc_msgSend(v57, "length");

        if (v58)
        {
          v45 = objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", v42 + v40 + 1);
          goto LABEL_44;
        }
      }
LABEL_68:
      if (v40 != 0x7FFFFFFFFFFFFFFFLL || v42)
      {
        if (location != 0x7FFFFFFFFFFFFFFFLL || length)
        {
          v131.location = v40;
          v131.length = v42;
          v132.location = location;
          v132.length = length;
          v63 = NSUnionRange(v131, v132);
          location = v63.location;
          length = v63.length;
        }
        else
        {
          location = v40;
          length = v42;
        }
      }
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "string"));
      v133.location = location;
      v133.length = length;
      v65 = CFStringTokenizerCreate(kCFAllocatorDefault, v64, v133, 1uLL, 0);

      v27 = 0x7FFFFFFFFFFFFFFFLL;
      v28 = 0;
      Token = CFStringTokenizerGoToTokenAtIndex(v65, a3);
      if (Token)
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v65);
        v68 = CurrentTokenRange.location;
        v69 = CurrentTokenRange.length;
        if ((a6 | 2) == 2 && CurrentTokenRange.location + CurrentTokenRange.length == (int)a3)
          Token = CFStringTokenizerAdvanceToNextToken(v65);
      }
      else
      {
        if ((a6 | 2) == 2)
        {
          Token = CFStringTokenizerAdvanceToNextToken(v65);
          v69 = 0;
        }
        else
        {
          v69 = 0;
          Token = 0;
        }
        v68 = -1;
      }
      if ((a6 | 2) == 3)
      {
        if (Token)
        {
          v74 = CFStringTokenizerGetCurrentTokenRange(v65);
          v73 = v74.length;
          v68 = v74.location;
          if (a3 > LODWORD(v74.location))
            goto LABEL_113;
        }
        v75 = a3;
        do
          v76 = v75--;
        while (v76 > (unint64_t)v14 && !CFStringTokenizerGoToTokenAtIndex(v65, v75));
        if (v75 <= (unint64_t)v14)
        {
          v26 = (unint64_t)v14;
          goto LABEL_118;
        }
LABEL_112:
        v77 = CFStringTokenizerGetCurrentTokenRange(v65);
        v73 = v77.length;
        v68 = v77.location;
LABEL_113:
        v69 = v73;
        goto LABEL_114;
      }
      if (Token)
        goto LABEL_112;
      if (v25 == (char *)a3)
      {
        v27 = (unint64_t)v25;
        v28 = 0;
      }
LABEL_114:
      if (v68 != -1)
      {
        v27 = v68;
        v28 = v69;
      }
      v26 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_118:
      CFRelease(v65);
      goto LABEL_4;
    case 3:
      if (a8)
        *a8 = 1;
      v47 = (char *)objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", a3);
      v49 = v48;
      if (v48)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v51 = sub_1001AE2A0((uint64_t)objc_msgSend(v50, "characterAtIndex:", &v47[v49 - 1]));

        v52 = v49 - v51;
      }
      else
      {
        v52 = 0;
      }
      switch(a6)
      {
        case 0:
        case 2:
          if (&v47[v52] == (char *)a3 && &v47[v52] < v25)
          {
            v60 = (char *)objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", a3 + 1);
            v47 = v60;
            if (v61)
              v52 = v61 - sub_1001AE2A0((uint64_t)objc_msgSend(v116, "characterAtIndex:", &v60[v61 - 1]));
            else
              v52 = 0;
          }
          break;
        case 1:
        case 3:
          if (v47 == (char *)a3 && v47 > v14)
          {
            v47 = (char *)objc_msgSend(v116, "textRangeForParagraphAtCharIndex:", a3 - 1);
            v52 = v62 - 1;
          }
          break;
        default:
          break;
      }
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (v47 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        switch(a6)
        {
          case 0:
          case 2:
            v26 = (unint64_t)&v47[v52];
            break;
          case 1:
          case 3:
            v26 = (unint64_t)v47;
            break;
          default:
            break;
        }
      }
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      v28 = 0;
      goto LABEL_4;
    case 4:
      if (a8)
        *a8 = 1;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v34, "layoutIfNeeded");

      if ((unint64_t)a6 < 4)
      {
        v127 = 0;
        v128 = &v127;
        v129 = 0x2020000000;
        v130 = 0x7FFFFFFFFFFFFFFFLL;
        v35 = *a4;
        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = sub_1002DB59C;
        v118[3] = &unk_10124E4C0;
        v121 = a6;
        v122 = a8;
        v120 = &v127;
        v118[4] = self;
        v119 = v116;
        v123 = a4;
        v124 = v14;
        v125 = a3;
        v26 = (unint64_t)&v14[v16];
        if (-[CRLWPEditorHelper p_withLineFragmentsForLogicalLineContainingCharIndex:eol:performBlock:](self, "p_withLineFragmentsForLogicalLineContainingCharIndex:eol:performBlock:", a3, v35, v118))
        {
          v26 = (unint64_t)v128[3];
        }

        _Block_object_dispose(&v127, 8);
        goto LABEL_3;
      }
      if ((unint64_t)(a6 - 4) >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E4E0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1B694();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E500);
        v70 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v71, v72, 2008, 0, "Unsupported horizontal line direction");

        goto LABEL_2;
      }
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      if (a7)
        v59 = *a7;
      else
        v59 = NAN;
      v127 = 0;
      v78 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v127, *a4);
      if (!v78)
      {
        v26 = (unint64_t)v25;
        if (a6 == 4)
        {
          v26 = -[CRLWPEditorHelper p_lastVisibleCharIndexForCharIndex:](self, "p_lastVisibleCharIndexForCharIndex:", a3);
          *a4 = 1;
        }
        goto LABEL_4;
      }
      v126 = 0;
      v79 = -[CRLWPEditorHelper p_lineIndexForMovingCharIndex:column:up:atStart:eol:](self, "p_lineIndexForMovingCharIndex:column:up:atStart:eol:", a3, &v126, a6 == 4, v59 == 0.0, a4);
      if (v79 > 0x7FFFFFFFFFFFFFFELL)
      {
        v26 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_51:
        v27 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      }
      objc_msgSend(v126, "frameBounds");
      v81 = v59 + v80;
      v82 = (double *)objc_msgSend(v126, "nearestLineFragmentWithSameVerticalPositionAs:xPos:", v79, v81);
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      v83 = v82;
      if (!v82)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10124E478);
        v94 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
          goto LABEL_149;
        goto LABEL_55;
      }
      if (v82 == v78 || v126 == v127 && v78[6] == v82[6])
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10124E498);
        v94 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_DEBUG))
        {
LABEL_149:
          sub_100E1B714(v94, v95, v96, v97, v98, v99, v100, v101);
LABEL_2:
          v26 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_3:
          v27 = 0x7FFFFFFFFFFFFFFFLL;
          v28 = 0;
          goto LABEL_4;
        }
LABEL_55:
        v26 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      }
      v84 = *((_QWORD *)v82 + 3);
      if (*a4)
      {
        v85 = v84 < 0;
        v86 = &xmmword_100EEE418;
        if (!v85)
          v86 = (__int128 *)v82;
        v87 = *(_QWORD *)v86;
        v88 = *((_QWORD *)v86 + 1);
        if (v88)
        {
          v89 = objc_msgSend(v116, "characterAtIndex:", v88 + v87 - 1);
          v90 = (int)v89;
          v91 = sub_1001AE2A0((uint64_t)v89);
          if (v90 == 8232)
            v92 = 1;
          else
            v92 = v91;
          v93 = v88 - v92;
        }
        else
        {
          v93 = 0;
        }
        v26 = v93 + v87;
        goto LABEL_3;
      }
      if (a6 == 4)
      {
        v102 = &xmmword_100EEE418;
        if (v84 >= 0)
          v102 = (__int128 *)v82;
        v26 = *(_QWORD *)v102 + *((_QWORD *)v102 + 1);
      }
      else
      {
        v103 = &xmmword_100EEE418;
        if (v84 >= 0)
          v103 = (__int128 *)v82;
        v26 = *(_QWORD *)v103;
      }
      if ((v84 & 1) != 0)
      {
        if ((v84 & 0x200) != 0)
        {
          v85 = v84 < 0;
          v115 = &xmmword_100EEE418;
          if (!v85)
            v115 = (__int128 *)v82;
          v26 = *(_QWORD *)v115;
        }
        else if ((v84 & 0x100) != 0)
        {
          v111 = &xmmword_100EEE418;
          if (v84 >= 0)
            v111 = (__int128 *)v82;
          v114 = v111;
          v112 = *(_QWORD *)v111;
          v113 = *((_QWORD *)v114 + 1);
          v26 = v112 + v113;
          if ((v84 & 0x800) != 0)
            v26 = sub_1001AEAA8(v112 + v113, v116);
        }
      }
      else
      {
        v104 = sub_1001464C4((__int128 *)v82, 1, 0, 0, 0, v81);
        v105 = v104;
        v106 = &xmmword_100EEE418;
        if (*((uint64_t *)v83 + 3) >= 0)
          v106 = (__int128 *)v83;
        v107 = *((_QWORD *)v106 + 1);
        if (v107)
        {
          v26 = v104;
          if (v104 == *(_QWORD *)v106 + v107)
          {
            if ((char *)v104 != v25)
              goto LABEL_172;
            v108 = objc_msgSend(v116, "characterAtIndex:", v25 - 1);
            v109 = (int)v108;
            v110 = sub_1001AE2A0((uint64_t)v108) ^ 1;
            if (v109 == 8232)
              LOBYTE(v110) = 0;
            v26 = (unint64_t)v25;
            v27 = 0x7FFFFFFFFFFFFFFFLL;
            if ((v110 & 1) == 0)
LABEL_172:
              v26 = v105 - 1;
          }
        }
        else
        {
          v26 = v104;
        }
      }
LABEL_4:
      switch(a6)
      {
        case 0:
        case 2:
          if (v27 <= a3)
            v29 = v28;
          else
            v29 = 0;
          v26 = v29 + v27;
          break;
        case 1:
        case 3:
          if (v28 + v27 >= a3)
            v26 = v27;
          else
            v26 = v28 + v27;
          break;
        default:
          break;
      }
      if ((unint64_t)v25 >= v26)
        v31 = (char *)v26;
      else
        v31 = v25;
      if (v31 <= v14)
        v31 = v14;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        v32 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v32 = (unint64_t)v31;

      return v32;
    case 5:
      if (a8)
        *a8 = 1;
      v27 = (unint64_t)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:", a3);
      v28 = v53;
      goto LABEL_55;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E560);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B614();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E580);
      v54 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 2136, 0, "Unsupported granularity");

      goto LABEL_2;
  }
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6 useLeadingEdgeOfNextLine:(BOOL)a7
{
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  __int128 *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  char *v40;
  unint64_t v41;
  char *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  unint64_t v47;
  BOOL v48;
  int v49;
  _BOOL4 v50;
  uint64_t v51;
  __int128 *v52;
  id v53;
  int v54;
  __int128 *v55;
  void *v56;
  id v57;
  int v58;
  unsigned __int8 v59;
  char v60;
  unsigned int v61;
  __int128 *v62;
  unint64_t v63;
  uint64_t v64;
  unsigned __int8 *v65;
  unsigned __int8 *v66;
  char v67;
  uint64_t v68;
  _BOOL4 v70;
  int v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  id v75;
  _QWORD v76[4];

  v72 = a7;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v11 = (char *)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:", a3);
  v13 = v12;
  -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", a3);
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v14 = (unint64_t)&v11[v13];
  v15 = 1;
  switch(a5)
  {
    case 0:
      v16 = objc_msgSend(v74, "charIndexMappedFromStorage:", a3);
      if (v16 >= objc_msgSend(v74, "charIndexMappedFromStorage:", v14))
      {
        a3 = (unint64_t)objc_msgSend(v74, "charIndexRemappedFromStorage:", v14);
      }
      else
      {
        v17 = objc_msgSend(v74, "charIndexMappedToStorage:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
        v19 = objc_msgSend(v18, "rangeOfComposedCharacterSequenceAtIndex:", v17);
        v21 = v20;

        a3 = (unint64_t)v19 + v21;
        if (a3 > v14)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124E5A0);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1B848();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124E5C0);
          v22 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 2219, 0, "composed character extends past storage boundary");

        }
      }
      goto LABEL_118;
    case 1:
      v28 = (char *)objc_msgSend(v74, "charIndexMappedFromStorage:", a3);
      if (v28 > objc_msgSend(v74, "charIndexMappedFromStorage:", v11))
      {
        v29 = objc_msgSend(v74, "charIndexMappedToStorage:", v28 - 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
        if (v29 >= objc_msgSend(v30, "length"))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
          v32 = objc_msgSend(v31, "length");
        }
        else
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
          v32 = objc_msgSend(v31, "rangeOfComposedCharacterSequenceAtIndex:", v29);
        }
        a3 = (unint64_t)v32;

      }
      v42 = (char *)objc_msgSend(v74, "charIndexMappedToStorage:", v28);
      if (v42 > v11)
      {
        v43 = objc_msgSend(v74, "charIndexRemappedFromStorage:", v42 - 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
        if (v43 >= objc_msgSend(v44, "length"))
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
          v46 = objc_msgSend(v45, "length");
        }
        else
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "string"));
          v46 = objc_msgSend(v45, "rangeOfComposedCharacterSequenceAtIndex:", v43);
        }
        v47 = (unint64_t)v46;

        if (v47 < a3)
          a3 = v47;
      }
      goto LABEL_118;
    case 2:
      goto LABEL_26;
    case 3:
      v15 = 0;
LABEL_26:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v33, "layoutIfNeeded");

      v76[0] = 0;
      v35 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, v76, 0);
      if (!v35)
      {
        if (v15 == objc_msgSend(v74, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3))
        {
          if (!a3)
          {
            v40 = 0;
            goto LABEL_48;
          }
          v41 = sub_1001AEAA8(a3, v74);
        }
        else
        {
          v40 = (char *)a3;
          if (objc_msgSend(v74, "length") == (id)a3)
            goto LABEL_48;
          v41 = sub_1001AF294(a3, v74);
        }
        v40 = (char *)v41;
        goto LABEL_48;
      }
      if (v15)
        v36 = 2;
      else
        v36 = 3;
      objc_opt_class(_TtC8Freeform12CRLWPStorage, v34);
      v38 = sub_100221D0C(v37, v73);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = (char *)sub_100147718((uint64_t)v35, a3, v36, v39);

LABEL_48:
      if (a4)
        v48 = v35 == 0;
      else
        v48 = 1;
      v49 = !v48;
      if (v40 == (char *)0x7FFFFFFFFFFFFFFFLL || v40 < v11 || (unint64_t)v40 > v14)
      {
        if (v49)
        {
          v52 = *((uint64_t *)v35 + 3) < 0 ? &xmmword_100EEE418 : v35;
          if (*(_QWORD *)v52 + *((_QWORD *)v52 + 1) > a3)
          {
            v53 = (id)a3;
            v71 = *a4;
            v54 = sub_100144A40(v35, a3) == 1;
            if (v15)
            {
              if (v71 == v54)
                goto LABEL_85;
            }
            else if (v71 != v54)
            {
              goto LABEL_85;
            }
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
            v70 = a3 < (unint64_t)objc_msgSend(v56, "length");

            if (v70)
            {
              v57 = objc_msgSend(v73, "characterAtIndex:", a3);
              v58 = (int)v57;
              v59 = sub_1001AE2A0((uint64_t)v57);
              v60 = v58 == 8232 ? 1 : v59;
              if ((v60 & 1) == 0)
              {
                *a4 = v71 ^ 1;
                goto LABEL_84;
              }
            }
          }
        }
LABEL_85:
        v61 = v15 ^ objc_msgSend(v73, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", a3);
        if (v35)
        {
          v62 = &xmmword_100EEE418;
          if (*((uint64_t *)v35 + 3) >= 0)
            v62 = v35;
          v63 = *(_QWORD *)v62;
          v64 = *((_QWORD *)v62 + 1);
          if (v61)
            goto LABEL_89;
        }
        else
        {
          v64 = 0;
          v63 = a3;
          if (v61)
          {
LABEL_89:
            if (v64 + v63 < v14 || v35 && (*((_QWORD *)v35 + 3) & 0x100000800) != 0)
            {
              if (v64)
                v40 = (char *)(v64 + v63);
              else
                v40 = (char *)(v63 + 1);
            }
            goto LABEL_100;
          }
        }
        if (v63 > (unint64_t)v11)
        {
          v40 = (char *)objc_msgSend(v73, "previousCharacterIndex:");
          if (a4)
            *a4 = 1;
        }
LABEL_100:
        if (v40 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_101:
          v53 = objc_msgSend(v74, "charIndexRemappedFromStorage:", a3);
          goto LABEL_117;
        }
        v65 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v40, v76, 0);
        v66 = v65;
        if (!v65)
        {
LABEL_114:
          if (v40 != (char *)0x7FFFFFFFFFFFFFFFLL && v40 >= v11)
          {
            v53 = v40;
            if ((unint64_t)v40 <= v14)
              goto LABEL_117;
          }
          goto LABEL_101;
        }
        if (v72)
        {
          v67 = v15 ^ 1;
          if (!v35)
            v67 = 1;
          if ((v67 & 1) == 0 && ((v65[25] ^ *((unsigned __int8 *)v35 + 25)) & 0x10) == 0)
            goto LABEL_108;
        }
        else if (v15)
        {
LABEL_108:
          v68 = sub_100144974((uint64_t)v65);
LABEL_111:
          v40 = (char *)v68;
          if (a4 && (*((_QWORD *)v66 + 3) & 0x4800) == 0x4000)
            *a4 = 1;
          goto LABEL_114;
        }
        v68 = sub_1001449A4((uint64_t)v65);
        goto LABEL_111;
      }
      if (!v49)
        goto LABEL_95;
      v50 = *a4;
      v51 = sub_100144A40(v35, (uint64_t)v40);
      if (v51 == sub_100144A40(v35, a3))
      {
        if (!*a4)
          goto LABEL_70;
LABEL_95:
        v53 = v40;
        goto LABEL_117;
      }
      *a4 = !v50;
      if (!v50)
        goto LABEL_95;
LABEL_70:
      if (*((uint64_t *)v35 + 3) < 0)
        v55 = &xmmword_100EEE418;
      else
        v55 = v35;
      if (v40 == (char *)(*(_QWORD *)v55 + *((_QWORD *)v55 + 1)))
      {
        *a4 = 1;
        goto LABEL_95;
      }
      if (!sub_1001AE2A0((uint64_t)objc_msgSend(v74, "characterAtIndex:", objc_msgSend(v74, "charIndexMappedFromStorage:", v40))))goto LABEL_95;
      *a4 = 1;
      v53 = (id)sub_1001AF294((unint64_t)v40, v74);
LABEL_84:
      if (v53 == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_85;
LABEL_117:
      a3 = (unint64_t)v53;
LABEL_118:

      sub_100171FA4(&v75);
      return a3;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E5E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1B7C8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E600);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 2328, 0, "Unsupported vertical character direction");

      a3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_118;
  }
}

- (void)moveForward:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v7, "isValid"))
  {
    if ((v4 = objc_msgSend(v7, "end"), objc_msgSend(v7, "isInsertionPoint"))
      && (v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v4, 0), (id)v5 != v4)|| (v6 = objc_msgSend(v7, "isInsertionPoint"), v5 = (unint64_t)v4, (v6 & 1) == 0))
    {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, 0, 0);
    }
  }

}

- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6;
  __int128 *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v18;
  BOOL v19;
  __int128 *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  __int128 *v25;
  void *v26;
  BOOL v27;
  uint64_t v29;

  v6 = a3;
  v29 = 0;
  v7 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(v6, "start"), &v29, objc_msgSend(v6, "caretAffinity") == (id)1);
  if (!v7)
  {
LABEL_15:
    v8 = (unint64_t)objc_msgSend(v6, "insertionChar");
    goto LABEL_53;
  }
  if (objc_msgSend(v6, "isRange"))
  {
    if (objc_msgSend(v6, "isVisual"))
    {
      v8 = (unint64_t)objc_msgSend(v6, "range");
      objc_msgSend(v6, "range");
      v10 = v9;
      if (*((uint64_t *)v7 + 3) < 0)
        v11 = &xmmword_100EEE418;
      else
        v11 = v7;
      v13 = *(_QWORD *)v11;
      v12 = *((_QWORD *)v11 + 1);
      v14 = objc_msgSend(v6, "range");
      v16 = v8 + v10 - 1;
      if (v13 <= (unint64_t)v14 && v13 + v12 >= (unint64_t)v14 + v15)
      {
        if ((*((_QWORD *)v7 + 3) & 0x1000) == 0)
          v8 = v16;
      }
      else if ((*((_BYTE *)v7 + 25) & 0x10) == 0)
      {
        v18 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v16, &v29, 0);
        if (v18)
        {
          if ((v18[25] & 0x10) != 0)
            v19 = sub_100144A40((__int128 *)v18, v16) != 1;
          else
            v19 = sub_100144A40((__int128 *)v18, v16) == 1;
          v8 = v16;
          goto LABEL_52;
        }
        goto LABEL_15;
      }
      v27 = sub_100144A40(v7, v8) == 1;
      goto LABEL_49;
    }
    if (!objc_msgSend(v6, "isValid"))
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_53;
    }
    v8 = (unint64_t)objc_msgSend(v6, "end");
    v19 = 1;
LABEL_52:
    *a4 = v19;
    goto LABEL_53;
  }
  v8 = (unint64_t)objc_msgSend(v6, "insertionChar");
  if (objc_msgSend(v6, "type") != (id)7)
  {
    v20 = *((uint64_t *)v7 + 3) < 0 ? &xmmword_100EEE418 : v7;
    v21 = *((_QWORD *)v20 + 1);
    if (v8 == *(_QWORD *)v20 + v21)
    {
      v22 = !v21 || !*a4;
      if (!v22 && v8 != 0)
        goto LABEL_39;
    }
  }
  if (objc_msgSend(v6, "type") == (id)7 && v8 < *(_QWORD *)v7 && !*a4)
  {
    if ((*((_BYTE *)v7 + 25) & 0x10) != 0)
      v24 = sub_1001449A4((uint64_t)v7);
    else
      v24 = sub_100144974((uint64_t)v7);
    v8 = v24;
    v27 = sub_100144A40(v7, v24) == ((*((_QWORD *)v7 + 3) >> 12) & 1);
LABEL_49:
    v19 = v27;
    goto LABEL_52;
  }
  v25 = *((uint64_t *)v7 + 3) < 0 ? &xmmword_100EEE418 : v7;
  if (v8 && v8 == *(_QWORD *)v25 + *((_QWORD *)v25 + 1))
  {
LABEL_39:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = (unint64_t)objc_msgSend(v26, "previousCharacterIndex:", v8);

    v19 = 0;
    goto LABEL_52;
  }
LABEL_53:

  return v8;
}

- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6;
  id v7;
  __int128 *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  _BYTE *v19;
  BOOL v20;
  __int128 *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v25;
  __int128 *v26;
  void *v27;
  _BYTE *v28;
  BOOL v29;
  unsigned int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;

  v6 = a3;
  v7 = objc_msgSend(v6, "caretAffinity");
  v40 = 0;
  v8 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(v6, "start"), &v40, v7 == (id)1);
  if (!v8)
    goto LABEL_33;
  if (objc_msgSend(v6, "isVisual") && objc_msgSend(v6, "isRange"))
  {
    v9 = (char *)objc_msgSend(v6, "range");
    objc_msgSend(v6, "range");
    v11 = v10;
    if (*((uint64_t *)v8 + 3) < 0)
      v12 = &xmmword_100EEE418;
    else
      v12 = v8;
    v14 = *(_QWORD *)v12;
    v13 = *((_QWORD *)v12 + 1);
    v15 = objc_msgSend(v6, "range");
    v17 = &v9[v11 - 1];
    if (v14 <= (unint64_t)v15 && v14 + v13 >= (unint64_t)v15 + v16)
    {
      if ((*((_BYTE *)v8 + 25) & 0x10) == 0)
        v17 = v9;
      if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E620);
        v31 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v38 = *((_QWORD *)v8 + 3);
          *(_DWORD *)buf = 67110402;
          v23 = (v38 & 0x1000) == 0;
          v39 = CFSTR("head");
          if (v23)
            v39 = CFSTR("tail");
          v42 = v30;
          v43 = 2082;
          v44 = "-[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:]";
          v45 = 2082;
          v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm";
          v47 = 1024;
          v48 = 2441;
          v49 = 2114;
          v50 = v39;
          v51 = 2112;
          v52 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to find %{public}@ char index for %@", buf, 0x36u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124E640);
        v32 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:]"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        v35 = CFSTR("head");
        if ((*((_QWORD *)v8 + 3) & 0x1000) == 0)
          v35 = CFSTR("tail");
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 2441, 0, "Failed to find %{public}@ char index for %@", v35, v6);

      }
      v36 = sub_100144A40(v8, (uint64_t)v17);
LABEL_66:
      v20 = v36 != 1;
      goto LABEL_67;
    }
    if ((*((_BYTE *)v8 + 25) & 0x10) == 0)
    {
      v19 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v9, &v40, v7 == (id)1);
      if (v19)
      {
        if ((v19[25] & 0x10) != 0)
          v20 = sub_100144A40((__int128 *)v19, (uint64_t)v9) == 1;
        else
          v20 = sub_100144A40((__int128 *)v19, (uint64_t)v9) != 1;
        v17 = v9;
        goto LABEL_67;
      }
      goto LABEL_33;
    }
    v28 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v17, &v40, v7 == (id)1);
    if (v28)
    {
      if ((v28[25] & 0x10) == 0)
      {
        v29 = sub_100144A40((__int128 *)v28, (uint64_t)v17) == 1;
LABEL_45:
        v20 = v29;
        goto LABEL_67;
      }
      v36 = sub_100144A40((__int128 *)v28, (uint64_t)v17);
      goto LABEL_66;
    }
LABEL_33:
    v17 = (char *)objc_msgSend(v6, "insertionChar");
    goto LABEL_68;
  }
  v17 = (char *)objc_msgSend(v6, "insertionChar");
  if (objc_msgSend(v6, "type") != (id)7)
  {
    v21 = *((uint64_t *)v8 + 3) < 0 ? &xmmword_100EEE418 : v8;
    v22 = *((_QWORD *)v21 + 1);
    if (v17 == (char *)(*(_QWORD *)v21 + v22))
    {
      v23 = !v22 || !*a4;
      if (!v23 && v17 != 0)
        goto LABEL_39;
    }
  }
  if (objc_msgSend(v6, "type") == (id)7 && (unint64_t)v17 < *(_QWORD *)v8 && !*a4)
  {
    if ((*((_BYTE *)v8 + 25) & 0x10) != 0)
      v25 = sub_1001449A4((uint64_t)v8);
    else
      v25 = sub_100144974((uint64_t)v8);
    v17 = (char *)v25;
    v29 = sub_100144A40(v8, v25) == ((*((_QWORD *)v8 + 3) >> 12) & 1);
    goto LABEL_45;
  }
  v26 = *((uint64_t *)v8 + 3) < 0 ? &xmmword_100EEE418 : v8;
  if (v17 && v17 == (char *)(*(_QWORD *)v26 + *((_QWORD *)v26 + 1)))
  {
LABEL_39:
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v17 = (char *)objc_msgSend(v27, "previousCharacterIndex:", v17);

    v20 = 0;
LABEL_67:
    *a4 = v20;
  }
LABEL_68:

  return (unint64_t)v17;
}

- (void)p_moveInLineLayoutDirectionLeft:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  int v10;
  unsigned int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  CRLWPTextSource *v16;
  void *v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  id v22[9];
  unsigned __int8 v23;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    -[CRLWPEditorHelper setAnchorSelection:](self, "setAnchorSelection:", 0);
    v23 = objc_msgSend(v5, "leadingEdge");
    if (v3)
      v6 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v5, &v23);
    else
      v6 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v5, &v23);
    v7 = v6;
    if (!v23 && v6 != 0x7FFFFFFFFFFFFFFFLL && v6 > (unint64_t)objc_msgSend(v5, "start"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v9 = objc_msgSend(v8, "characterAtIndex:", v7);
      v10 = (int)v9;
      v11 = sub_1001AE2A0((uint64_t)v9);
      v12 = v10 == 8232 ? 1 : v11;

      if (v12)
      {
        -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", v7);
        if (sub_100172154((uint64_t)v22))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124E660);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1B8C8();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124E680);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_moveInLineLayoutDirectionLeft:]"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 2505, 0, "Should not be on last paragraph yet.");

        }
        v16 = -[CRLWPEditorHelper textSource](self, "textSource", sub_100172124((uint64_t)v22));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v7 = sub_1001AF294(v7, v17);

        v23 = 1;
        sub_100171FA4(v22);
      }
    }
    v18 = v23;
    v19 = v7;
    if (objc_msgSend(v5, "isInsertionPoint"))
    {
      if (v3)
        v20 = 3;
      else
        v20 = 2;
      v19 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", v7, &v23, v20, 1);
    }
    v21 = v23;
    if (v19 != v7 || v23 != v18)
      goto LABEL_32;
    if ((objc_msgSend(v5, "isInsertionPoint") & 1) == 0)
    {
      v21 = v23;
LABEL_32:
      -[CRLWPEditorHelper setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:](self, "setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:", v19, 0, v21 != 0, 0);
    }
  }

}

- (void)moveRight:(id)a3
{
  -[CRLWPEditorHelper p_moveInLineLayoutDirectionLeft:](self, "p_moveInLineLayoutDirectionLeft:", 0);
}

- (void)moveBackward:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v7, "isValid"))
  {
    if ((v4 = objc_msgSend(v7, "start"), objc_msgSend(v7, "isInsertionPoint"))
      && (v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v4, 1), (id)v5 != v4)|| (v6 = objc_msgSend(v7, "isInsertionPoint"), v5 = (unint64_t)v4, (v6 & 1) == 0))
    {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, 0, 0);
    }
  }

}

- (void)moveLeft:(id)a3
{
  -[CRLWPEditorHelper p_moveInLineLayoutDirectionLeft:](self, "p_moveInLineLayoutDirectionLeft:", 1);
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  id v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v4 = a4;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v10 = objc_msgSend(v9, "length");

  if ((unint64_t)v10 >= a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v7 = (uint64_t)objc_msgSend(v11, "wordAtCharIndex:includePreviousWord:", a3, v4);
    v8 = v12;

    if (v7 == a3 && v4)
    {
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      v8 = 0;
    }
  }
  v13 = v7;
  v14 = v8;
  result.length = v14;
  result.location = v13;
  return result;
}

- (id)logicalToVisualSelection:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  _BYTE *v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  NSRange v21;
  void *v22;
  void *v23;
  BOOL v24;
  _BYTE *v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  NSRange v29;
  void *v30;
  void *v31;
  char *v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  NSRange v36;
  void *v37;
  void *v38;
  void *v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  int64_t v44;
  _BYTE *location;
  _BYTE *v46;
  NSRange range2;
  uint64_t v48;
  double (*v49)(_QWORD *, uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t *v52;
  void **p_p;
  void *__p;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  __n128 (*v64)(__n128 *, __n128 *);
  uint64_t (*v65)();
  void *v66;
  __int128 v67;
  _QWORD v68[7];
  _BYTE *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  __n128 (*v79)(__n128 *, __n128 *);
  uint64_t (*v80)();
  void *v81;
  __int128 v82;
  NSRange v83;
  NSRange v84;
  NSRange v85;

  v4 = a3;
  if (objc_msgSend(v4, "type") == (id)7 || objc_msgSend(v4, "type") == (id)1 || objc_msgSend(v4, "type") == (id)2)
  {
    v5 = v4;
    goto LABEL_5;
  }
  objc_msgSend(v4, "range");
  if (!v11)
  {
    v5 = objc_msgSend(v4, "copyWithNewType:", 7);
LABEL_5:
    v6 = v5;
    if (v5)
      goto LABEL_15;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v12, "layoutIfNeeded");

  v46 = objc_msgSend(v4, "start");
  v76 = 0;
  v77 = &v76;
  v78 = 0x4012000000;
  v79 = sub_1002D9038;
  v80 = nullsub_38;
  v81 = &unk_1010E66AB;
  v82 = xmmword_100EEE418;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[5] = &v72;
  v68[6] = &v69;
  v68[2] = sub_1002DDD34;
  v68[3] = &unk_10124E6A8;
  v68[4] = &v76;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v46, objc_msgSend(v4, "caretAffinity") == (id)1, v68);
  if (v77[6] == 0x7FFFFFFFFFFFFFFFLL && !v77[7])
  {
    v6 = v4;
    goto LABEL_77;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  location = objc_msgSend(v13, "previousCharacterIndex:", objc_msgSend(v4, "end"));

  v61 = 0;
  v62 = &v61;
  v63 = 0x4012000000;
  v64 = sub_1002D9038;
  v65 = nullsub_38;
  v66 = &unk_1010E66AB;
  v67 = xmmword_100EEE418;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  __p = 0;
  v55 = 0;
  v56 = 0;
  range2.length = (NSUInteger)_NSConcreteStackBlock;
  v48 = 3221225472;
  v49 = sub_1002DDDD8;
  v50 = &unk_10124E6A8;
  v52 = &v57;
  p_p = &__p;
  v51 = &v61;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", location, objc_msgSend(v4, "isAtEndOfLine"), &range2.length);
  if (v62[6] != 0x7FFFFFFFFFFFFFFFLL || v62[7])
  {
    range2.location = (NSUInteger)objc_msgSend(v4, "range");
    v16 = v15;
    if (v77[6] == v62[6] && v77[7] == v62[7])
    {
      v17 = v69;
      if (v70 != v69)
      {
        v18 = 0;
        v19 = 0;
        v20 = 1;
        do
        {
          v83.location = range2.location;
          v83.length = v16;
          v21 = NSIntersectionRange(*(NSRange *)&v17[40 * v18 + 16], v83);
          v17 = v69;
          if ((v19 & 1) == 0 && v21.length)
          {
            if (!v69[40 * v18 + 32])
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
              v46 = objc_msgSend(v23, "previousCharacterIndex:", v21.location + v21.length);

              v19 = 1;
              v17 = v69;
LABEL_33:
              if (v21.length)
              {
                if (v17[40 * v18 + 32])
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
                  location = objc_msgSend(v22, "previousCharacterIndex:", v21.location + v21.length);

                  v17 = v69;
                }
                else
                {
                  location = (_BYTE *)v21.location;
                }
              }
              goto LABEL_38;
            }
            v19 = 1;
            v46 = (_BYTE *)v21.location;
          }
          if ((v19 & 1) != 0)
            goto LABEL_33;
LABEL_38:
          v18 = v20;
          v24 = 0xCCCCCCCCCCCCCCCDLL * ((v70 - v17) >> 3) > v20++;
        }
        while (v24);
      }
    }
    else
    {
      v25 = v69;
      if (v70 != v69)
      {
        v26 = 0;
        v27 = *((unsigned __int8 *)v73 + 24);
        v28 = 1;
        do
        {
          v84.location = range2.location;
          v84.length = v16;
          v29 = NSIntersectionRange(*(NSRange *)&v25[40 * v26 + 16], v84);
          if (v29.length)
          {
            if (!v27)
            {
              if (v69[40 * v26 + 32])
              {
                v46 = (_BYTE *)v29.location;
              }
              else
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
                v46 = objc_msgSend(v31, "previousCharacterIndex:", v29.location + v29.length);

              }
              break;
            }
            if (v69[40 * v26 + 32])
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
              v46 = objc_msgSend(v30, "previousCharacterIndex:", v29.location + v29.length);

            }
            else
            {
              v46 = (_BYTE *)v29.location;
            }
          }
          v26 = v28;
          v25 = v69;
          v24 = 0xCCCCCCCCCCCCCCCDLL * ((v70 - v69) >> 3) > v28++;
        }
        while (v24);
      }
      v32 = (char *)__p;
      if (v55 != __p)
      {
        v33 = 0;
        v34 = *((unsigned __int8 *)v58 + 24);
        v35 = 1;
        do
        {
          v85.location = range2.location;
          v85.length = v16;
          v36 = NSIntersectionRange(*(NSRange *)&v32[40 * v33 + 16], v85);
          if (v36.length)
          {
            if (v34)
            {
              if (*((_BYTE *)__p + 40 * v33 + 32))
              {
                location = (_BYTE *)v36.location;
              }
              else
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
                location = objc_msgSend(v38, "previousCharacterIndex:", v36.location + v36.length);

              }
              break;
            }
            if (*((_BYTE *)__p + 40 * v33 + 32))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
              location = objc_msgSend(v37, "previousCharacterIndex:", v36.location + v36.length);

            }
            else
            {
              location = (_BYTE *)v36.location;
            }
          }
          v33 = v35;
          v32 = (char *)__p;
          v24 = 0xCCCCCCCCCCCCCCCDLL * ((v55 - (_BYTE *)__p) >> 3) > v35++;
        }
        while (v24);
      }
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    if (v46 <= location)
    {
      v40 = objc_msgSend(v39, "nextCharacterIndex:", location);
      v41 = v46;
    }
    else
    {
      v40 = objc_msgSend(v39, "nextCharacterIndex:", v46);
      v41 = location;
    }
    if (v41 <= v40)
      v42 = v40;
    else
      v42 = v41;
    if (v41 >= v40)
      v43 = v40;
    else
      v43 = v41;
    v44 = v42 - v43;

    v14 = objc_msgSend(v4, "copyWithNewVisualTypeRange:head:tail:", v43, v44, v46, location);
    goto LABEL_74;
  }
  v14 = v4;
LABEL_74:
  v6 = v14;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
LABEL_77:
  objc_msgSend(v6, "type");
  if (v69)
  {
    v70 = v69;
    operator delete(v69);
  }
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  if (!v6)
  {
LABEL_6:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E6C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1B948();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E6E8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper logicalToVisualSelection:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2685, 0, "invalid nil value for '%{public}s'", "result");

  }
LABEL_15:

  return v6;
}

- (BOOL)p_adjustSelection:(id)a3 forWordWithCharIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  objc_class *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;

  v6 = a3;
  v8 = -[CRLWPEditorHelper rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", a4, 0);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v10 = objc_msgSend(v9, "length");

    v11 = -[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass");
    *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v12).n128_u64[0];
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v13));
    v17 = sub_100221D0C(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class selectionWithRange:type:leadingEdge:storage:](v11, "selectionWithRange:type:leadingEdge:storage:", a4, 0, 7, v10 == (id)a4, v18));

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class selectionWithRange:](-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass"), "selectionWithRange:", v8, v7));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper logicalToVisualSelection:](self, "logicalToVisualSelection:", v16));
  }

  v20 = (char *)objc_msgSend(v19, "range");
  v22 = v21;
  v23 = (char *)objc_msgSend(v6, "range");
  if (v20 <= v23 && &v20[v22] >= &v23[v24])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    objc_msgSend(v26, "setSelection:forEditor:withFlags:", v19, v27, 8);

    v25 = 1;
  }
  else
  {
    -[CRLWPEditorHelper p_adjustSelection:withOtherSelection:textSelectionGranularity:](self, "p_adjustSelection:withOtherSelection:textSelectionGranularity:", v6, v19, 1);
    v25 = 0;
  }

  return v25;
}

- (void)p_moveAndModifySelectionRight:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  objc_class *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  const void *v28;
  _BOOL8 v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v5, "textSelectionWillChange");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (!objc_msgSend(v6, "isValid"))
    goto LABEL_42;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));

  if (!v7)
  {
    v50 = 0;
    if (-[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v50 = objc_msgSend(v6, "leadingEdge");
      v49 = 0;
      if (!-[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(v6, "start"), &v49, objc_msgSend(v6, "caretAffinity") == (id)1))
      {
        -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", objc_msgSend(v6, "start"));
        if (sub_100172378((uint64_t)&v47) == v3)
          v9 = objc_msgSend(v6, "end");
        else
          v9 = objc_msgSend(v6, "start");
        v10 = v9;
        sub_100171FA4((id *)&v47);
        goto LABEL_12;
      }
      if (v3)
        v8 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v6, &v50);
      else
        v8 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v6, &v50);
    }
    else
    {
      v50 = -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge");
      v8 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
    }
    v10 = (id)v8;
LABEL_12:
    v11 = -[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass");
    v12 = v50;
    objc_opt_class(_TtC8Freeform12CRLWPStorage, v13);
    v15 = sub_100221D0C(v14, v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class selectionWithRange:type:leadingEdge:storage:](v11, "selectionWithRange:type:leadingEdge:storage:", v10, 0, 7, v12 != 0, v16));
    -[CRLWPEditorHelper setAnchorSelection:](self, "setAnchorSelection:", v17);

  }
  v50 = 0;
  v50 = objc_msgSend(v6, "leadingEdge");
  v18 = -[CRLWPEditorHelper p_oppositeEdgeForSelection:withLeadingEdge:](self, "p_oppositeEdgeForSelection:withLeadingEdge:", v6, &v50);
  if (v3)
    v19 = 2;
  else
    v19 = 3;
  v20 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:", v18, &v50, v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v20, 6, &v47));

  if (v22
    || (v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource")),
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v20, 21, &v47)),
        v23,
        v22))
  {
    v24 = (char *)objc_msgSend(v6, "superRange");
    if (v24 <= v47)
    {
      v26 = &v47[v48];
      if (&v24[v25] >= &v47[v48] && (v20 > v47 || !v50 && v20 == v47) && v20 < v26)
      {
        if (v18 != v47)
        {
          v50 = 1;
          v45 = (void *)v22;
          v20 = v47;
          goto LABEL_27;
        }
        v50 = 0;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v20 = (char *)sub_1001AEAA8((unint64_t)v26, v27);

      }
    }
    v45 = (void *)v22;
  }
  else
  {
    v45 = 0;
  }
LABEL_27:
  v49 = 0;
  v28 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v20, &v49, 0);
  v30 = v20 > v18 && v50 != 0;
  v32 = objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass"));
  if (v28)
    v33 = 7;
  else
    v33 = 0;
  v34 = v50;
  objc_opt_class(_TtC8Freeform12CRLWPStorage, v31);
  v36 = sub_100221D0C(v35, v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  LOBYTE(v44) = v34 != 0;
  v38 = objc_msgSend(v32, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v33, v20, 0, 0, v30, 0x7FFFFFFFFFFFFFFFLL, 0, v44, v37);

  -[CRLWPEditorHelper setSelectionLastModifiedWithKeyboard:](self, "setSelectionLastModifiedWithKeyboard:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
  -[CRLWPEditorHelper p_adjustSelection:withOtherSelection:textSelectionGranularity:](self, "p_adjustSelection:withOtherSelection:textSelectionGranularity:", v39, v38, 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
  if (v40)
  {
    v32 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
    v41 = (uint64_t)objc_msgSend(v32, "insertionChar");
  }
  else
  {
    v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[CRLWPEditorHelper setSelectionAnchor:](self, "setSelectionAnchor:", v41);
  if (v40)

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
  -[CRLWPEditorHelper setSelectionAnchorEdge:](self, "setSelectionAnchorEdge:", objc_msgSend(v42, "leadingEdge"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v43, "textSelectionDidChange");

LABEL_42:
}

- (void)moveRightAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_moveAndModifySelectionRight:](self, "p_moveAndModifySelectionRight:", 1);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_moveAndModifySelectionRight:](self, "p_moveAndModifySelectionRight:", 0);
}

- (void)moveBackwardAndModifySelection:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 1, &v6), 1);
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v5, v6);
  }

}

- (void)moveForwardAndModifySelection:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 0, &v6), 0);
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v5, v6);
  }

}

- (double)preferredOffsetFromSelection:(id)a3
{
  return NAN;
}

- (void)moveUp:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  id v8;
  unsigned __int8 v9;
  char v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    -[CRLWPEditorHelper preferredOffsetFromSelection:](self, "preferredOffsetFromSelection:", v4);
    v11 = v5;
    v6 = objc_msgSend(v4, "start");
    v10 = 1;
    v9 = objc_msgSend(v4, "isAtEndOfLine");
    v7 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v9, 4, 4, &v11, &v10);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = (id)v7;
    if (v8 != objc_msgSend(v4, "start") || (objc_msgSend(v4, "isInsertionPoint") & 1) == 0)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v8, 0, v9);
  }

}

- (void)moveDown:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  void *v17;
  id v18;
  unint64_t v19;
  id v20;
  unsigned __int8 v21;
  char v22;
  uint64_t v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    -[CRLWPEditorHelper preferredOffsetFromSelection:](self, "preferredOffsetFromSelection:", v4);
    v23 = v5;
    v6 = objc_msgSend(v4, "end");
    if (v6)
    {
      if (objc_msgSend(v4, "isRange"))
      {
        v7 = objc_msgSend(v4, "superRange");
        v9 = v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v11 = sub_1001AEAA8((unint64_t)v7 + v9, v10);

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v14 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v13, "charIndexMappedFromStorage:", v11));

          v15 = sub_1001AE2A0((uint64_t)v14);
          if ((_DWORD)v14 == 8232 ? 1 : v15)
            v6 = (id)v11;
        }
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v18 = objc_msgSend(v17, "length");

    v22 = 1;
    v21 = objc_msgSend(v4, "isAtEndOfLine");
    v19 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v21, 4, 5, &v23, &v22);
    if ((unint64_t)v18 >= v19)
      v20 = (id)v19;
    else
      v20 = v18;
    if (v20 != objc_msgSend(v4, "end") || (objc_msgSend(v4, "isInsertionPoint") & 1) == 0)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v20, 0, objc_msgSend(v4, "isAtEndOfLine"));
  }

}

- (void)moveUpAndModifySelection:(id)a3
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unint64_t v17;
  uint64_t v18;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v6, "isValid"))
  {
    -[CRLWPEditorHelper preferredOffsetFromSelection:](self, "preferredOffsetFromSelection:", v6);
    v18 = v7;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 4, &v17);
    v16 = 1;
    v15 = objc_msgSend(v6, "isAtEndOfLine");
    v9 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v8, &v15, 4, 4, &v18, &v16);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v12 = objc_msgSend(v11, "validVisualRanges");
    if ((v12 & 1) != 0
      && ((v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection")),
           v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visualRanges")),
           v13 = objc_msgSend(v4, "containsCharacterAtIndex:", v10),
           v10 < v17)
        ? (v14 = v13)
        : (v14 = 0),
          (v14 & 1) != 0)
      || (-[CRLWPEditorHelper p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:](self, "p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:", v10, v16), v12))
    {

    }
  }

}

- (void)moveDownAndModifySelection:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  char *v8;
  unint64_t v9;
  char *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    -[CRLWPEditorHelper preferredOffsetFromSelection:](self, "preferredOffsetFromSelection:", v4);
    v14 = v5;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 5, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = (char *)objc_msgSend(v7, "length");

    v12 = 1;
    v11 = objc_msgSend(v4, "isAtEndOfLine");
    v9 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v11, 4, 5, &v14, &v12);
    if ((unint64_t)(v8 - 1) >= v9)
      v10 = (char *)v9;
    else
      v10 = v8 - 1;
    -[CRLWPEditorHelper p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:](self, "p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:", v10, v12, v13, 1);
  }

}

- (BOOL)p_isEdgeAtCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 withinWordInDirection:(int64_t)a5
{
  unint64_t v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;

  v6 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v8 = objc_msgSend(v7, "length");

  if (v6 > (unint64_t)v8)
    return 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v11 = objc_msgSend(v10, "wordAtCharIndex:includePreviousWord:", v6, 0);
  v13 = v12;

  return v6 >= (unint64_t)v11 && v6 - (unint64_t)v11 < v13;
}

- (void)moveWordInLayoutDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v16;
  int v17;
  unsigned __int8 v18;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E708);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1B9D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E728);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper moveWordInLayoutDirection:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2994, 0, "Unsupported direction: %lu", a3);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v8, "isValid"))
  {
    -[CRLWPEditorHelper setAnchorSelection:](self, "setAnchorSelection:", 0);
    v18 = objc_msgSend(v8, "leadingEdge");
    if (a3 == 2)
      v9 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v8, &v18);
    else
      v9 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v8, &v18);
    v10 = v9;
    v11 = -[CRLWPEditorHelper p_isEdgeAtCharIndex:leadingEdge:withinWordInDirection:](self, "p_isEdgeAtCharIndex:leadingEdge:withinWordInDirection:", v9, v18, a3);
    v12 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v10, &v18, a3);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 1;
    else
      v13 = v11;
    if ((v13 & 1) == 0)
    {
      v14 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v12, &v18, a3);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        v12 = v14;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0)
      v16 = 0;
    else
      v16 = v12;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 != v10
        || (v17 = v18, v17 != objc_msgSend(v8, "leadingEdge"))
        || (objc_msgSend(v8, "isInsertionPoint") & 1) == 0)
      {
        -[CRLWPEditorHelper setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:](self, "setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:", v16, 0, v18, 0);
      }
    }
  }

}

- (void)moveWordRight:(id)a3
{
  -[CRLWPEditorHelper moveWordInLayoutDirection:](self, "moveWordInLayoutDirection:", 2);
}

- (void)moveWordLeft:(id)a3
{
  -[CRLWPEditorHelper moveWordInLayoutDirection:](self, "moveWordInLayoutDirection:", 3);
}

- (void)moveWordRightAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_moveWordAndModifySelectionInLayoutDirection:](self, "p_moveWordAndModifySelectionInLayoutDirection:", 2);
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_moveWordAndModifySelectionInLayoutDirection:](self, "p_moveWordAndModifySelectionInLayoutDirection:", 3);
}

- (void)p_moveWordAndModifySelectionInLayoutDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  char v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  uint64_t v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v5, "textSelectionWillChange");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v6, "isValid"))
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v18 = 1;
    v17 = 1;
    v7 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:](self, "p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:", &v17, a3, &v19, &v18);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = -[CRLWPEditorHelper p_isEdgeAtCharIndex:leadingEdge:withinWordInDirection:](self, "p_isEdgeAtCharIndex:leadingEdge:withinWordInDirection:", v7, v17, a3);
      v16 = 0;
      v15 = v17;
      v9 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v7, &v16, 1, a3, 0, &v15);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((v8 & 1) != 0)
        {
          v10 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v7, v17);
          v11 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v9, v15);
          v12 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"), -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"));
          if ((v10 >= v12 || v12 >= v11) && (v11 >= v12 || v12 >= v10))
          {
            v13 = v15;
          }
          else
          {
            v9 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
            v13 = -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge");
          }
          v17 = v13;
        }
        else
        {
          v16 = 0;
          v17 = v15;
          v9 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v9, &v16, 1, a3, 0, &v17);
          v13 = v17;
        }
        -[CRLWPEditorHelper p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:](self, "p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:", v9, v13 != 0, v19, v18);
      }
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v14, "textSelectionDidChange");

}

- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  if (a4 != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4, a5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E748);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BA64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E768);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_isCharIndex:withinTextUnit:inDirection:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 3117, 0, "unexpected granularity");

    return 0;
  }
  if ((unint64_t)a5 > 5)
    return 0;
  if (((1 << a5) & 0x1A) != 0)
  {
    v6 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = objc_msgSend(v7, "length");

    if (v6 <= (unint64_t)v8)
      goto LABEL_17;
    return 0;
  }
  v6 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v14 = objc_msgSend(v13, "length");

  if (v6 > (unint64_t)v14)
    return 0;
LABEL_17:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v16 = objc_msgSend(v15, "wordAtCharIndex:includePreviousWord:", v6, 0);
  v18 = v17;

  return v6 >= (unint64_t)v16 && v6 - (unint64_t)v16 < v18;
}

- (int64_t)p_writingDirectionForCharAtIndex:(unint64_t)a3
{
  uint64_t *v4;
  __int128 *v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  v10 = 0;
  v4 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, &v10, 0);
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E788);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BAE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E7A8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_writingDirectionForCharAtIndex:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 3129, 0, "invalid nil value for '%{public}s'", "lineFragment");

    return -1;
  }
  if (v4[3] < 0)
    v5 = &xmmword_100EEE418;
  else
    v5 = (__int128 *)v4;
  return sub_100144A40((__int128 *)v4, a3 - (*(_QWORD *)v5 + *((_QWORD *)v5 + 1) == a3));
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6
{
  _BOOL8 v8;
  char *v11;
  CFIndex v12;
  char *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  CFIndex v17;
  CFIndex v18;
  CFIndex v19;
  BOOL v20;
  void *v21;
  id location;
  NSUInteger v23;
  NSUInteger length;
  void *v25;
  NSUInteger v26;
  NSRange v27;
  void *v28;
  __CFString *v29;
  __CFStringTokenizer *v30;
  CFRange CurrentTokenRange;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  char *v41;
  unint64_t v42;
  BOOL v43;
  id v44;
  __int128 *v45;
  __int128 *v46;
  BOOL result;
  unsigned int v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  CFIndex v52;
  uint64_t v53;
  int64_t v54;
  int64_t v56;
  void *v57;
  id obj;
  char *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  NSRange v65;
  NSRange v66;
  CFRange v67;

  v8 = a4;
  v11 = (char *)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  v59 = v11;
  v13 = &v11[v12];
  if (a3)
    v14 = a3 - (&v11[v12] == (char *)a3);
  else
    v14 = 0;
  if (v14 >= (unint64_t)v13)
    return 0;
  switch(a5)
  {
    case 0:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "string"));
      v17 = (CFIndex)objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", v14);
      v19 = v18;

      goto LABEL_59;
    case 1:
      if ((unint64_t)a6 > 1)
      {
        v49 = -[CRLWPEditorHelper p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", v14);
        v50 = 2;
        if (v49 == 1)
          v50 = 3;
        v20 = v50 == a6;
      }
      else
      {
        v20 = a6 == 0;
      }
      v51 = v20;
      v17 = (CFIndex)-[CRLWPEditorHelper rangeOfWordEnclosingCharIndex:backward:](self, "rangeOfWordEnclosingCharIndex:backward:", v14, v51);
      v19 = v52;
      goto LABEL_59;
    case 2:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      location = objc_msgSend(v21, "textRangeForParagraphAtCharIndex:", a3);
      length = v23;

      if (a3 && location == (id)a3)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v66.location = (NSUInteger)objc_msgSend(v25, "textRangeForParagraphAtCharIndex:", a3 - 1);
        v66.length = v26;
        v65.location = (NSUInteger)location;
        v65.length = length;
        v27 = NSUnionRange(v65, v66);
        location = (id)v27.location;
        length = v27.length;

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "string"));
      v67.location = (CFIndex)location;
      v67.length = length;
      v30 = CFStringTokenizerCreate(kCFAllocatorDefault, v29, v67, 1uLL, 0);

      if (CFStringTokenizerGoToTokenAtIndex(v30, a3))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
        v17 = CurrentTokenRange.location;
        v19 = CurrentTokenRange.length;
      }
      else
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        v19 = 0;
      }
      CFRelease(v30);
      goto LABEL_59;
    case 3:
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v17 = (CFIndex)objc_msgSend(v32, "textRangeForParagraphAtCharIndex:", a3);
      v34 = v33;

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v36 = sub_1001AE2A0((uint64_t)objc_msgSend(v35, "characterAtIndex:", v34 + v17 - 1));

        v19 = v34 - v36;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_59;
    case 4:
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper layout](self, "layout"));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "columns"));
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      v56 = a6;
      if (!v37)
        goto LABEL_37;
      v38 = *(_QWORD *)v61;
      break;
    default:
      v19 = v12;
      v17 = (CFIndex)v11;
      goto LABEL_39;
  }
  while (2)
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(_QWORD *)v61 != v38)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
      v41 = (char *)objc_msgSend(v40, "range", v56);
      v43 = v14 < (unint64_t)v41 || v14 - (unint64_t)v41 >= v42;
      if (!v43 || v8 && (char *)v14 == &v41[v42])
      {
        v44 = objc_msgSend(v40, "lineIndexForCharIndex:eol:", v14, v8);
        if ((unint64_t)v44 > 0x7FFFFFFFFFFFFFFELL)
        {
LABEL_37:
          v19 = 0;
          v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v45 = (__int128 *)objc_msgSend(v40, "lineFragmentAtIndex:", v44);
          if (*((uint64_t *)v45 + 3) < 0)
            v46 = &xmmword_100EEE418;
          else
            v46 = v45;
          v17 = *(_QWORD *)v46;
          v19 = *((_QWORD *)v46 + 1);
        }
        goto LABEL_38;
      }
    }
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    v19 = 0;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v37)
      continue;
    break;
  }
LABEL_38:

  a6 = v56;
LABEL_39:
  if (a5 != 5)
  {
LABEL_59:
    result = v17 + v19 == a3;
    if (v17 != a3 && v17 + v19 != a3)
      return 0;
    switch(a5)
    {
      case 0:
      case 2:
        if (a6 == 1)
        {
          if (v13 == (char *)a3)
            return 0;
        }
        else if (!a6 && v59 == (char *)a3)
        {
          return 0;
        }
        return (unint64_t)(a6 - 6) < 0xFFFFFFFFFFFFFFFELL;
      case 1:
      case 4:
        if ((unint64_t)a6 > 1)
        {
          v54 = -[CRLWPEditorHelper p_writingDirectionForCharAtIndex:](self, "p_writingDirectionForCharAtIndex:", a3);
          v53 = 2;
          if (v54 == 1)
            v53 = 3;
          if (v17 == a3)
            return (a6 & 0xFFFFFFFFFFFFFFFELL) == 2 && v53 != a6;
        }
        else
        {
          v53 = v17 == a3;
        }
        return v53 == a6;
      case 3:
        if (v59 == (char *)a3 && (unint64_t)a6 <= 5 && ((1 << a6) & 0x25) != 0
          || v13 == (char *)a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0)
        {
          return 0;
        }
        if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
          return v17 == a3;
        if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 0)
          return result;
        return 0;
      default:
        return 0;
    }
  }
  if (v59 == (char *)a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0)
    return 1;
  v48 = (0x25u >> a6) & 1;
  if ((unint64_t)a6 >= 6)
    LOBYTE(v48) = 0;
  if (v13 == (char *)a3)
    return v48;
  else
    return 0;
}

- (void)moveWordForward:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unint64_t v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v7, "isValid"))
  {
    v4 = objc_msgSend(v7, "end");
    v5 = -[CRLWPEditorHelper p_isCharIndex:withinTextUnit:inDirection:](self, "p_isCharIndex:withinTextUnit:inDirection:", v4, 1, 0);
    v6 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v4, 0, 0);
    if ((v5 & 1) == 0
      && -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v6, 0, 1, 1))
    {
      v6 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v6, 0, 0);
    }
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && ((id)v6 != v4 || (objc_msgSend(v7, "isInsertionPoint") & 1) == 0))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
  }

}

- (void)moveWordBackward:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unint64_t v6;
  BOOL v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v8, "isValid"))
  {
    v4 = objc_msgSend(v8, "start");
    v5 = -[CRLWPEditorHelper p_isCharIndex:withinTextUnit:inDirection:](self, "p_isCharIndex:withinTextUnit:inDirection:", v4, 1, 1);
    v6 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v4, 0, 1);
    if ((v5 & 1) == 0
      && -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v6, 0, 1, 0))
    {
      v6 = -[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:](self, "charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:", v6, 0, 1);
    }
    if (v4)
      v7 = 0;
    else
      v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
    if (v7)
      v6 = 0;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && ((id)v6 != v4 || (objc_msgSend(v8, "isInsertionPoint") & 1) == 0))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
  }

}

- (void)moveWordAndModifySelectionInStorageDirection:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", a3, &v11);
    v7 = -[CRLWPEditorHelper p_isCharIndex:withinTextUnit:inDirection:](self, "p_isCharIndex:withinTextUnit:inDirection:", v6, 1, a3);
    v10 = 0;
    v8 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v10, 1, a3, 0, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v7 & 1) == 0
        && -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v8, v10, 1, a3 == 0))
      {
        v10 = 0;
        v8 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v8, &v10, 1, a3, 0, 0);
      }
      if (v6 != (void *)-[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"))
      {
        v9 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
        if ((unint64_t)v6 <= v9 == v8 > -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"))
          v8 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
      }
      -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v8, v11);
    }
  }

}

- (void)moveWordForwardAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper moveWordAndModifySelectionInStorageDirection:](self, "moveWordAndModifySelectionInStorageDirection:", 0);
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper moveWordAndModifySelectionInStorageDirection:](self, "moveWordAndModifySelectionInStorageDirection:", 1);
}

- (void)selectParagraph:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  char *v12;
  NSUInteger v13;
  NSUInteger v14;
  unsigned int v15;
  _BOOL4 v16;
  NSRange v17;
  NSRange v18;
  id v19;
  NSRange v20;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v19, "isValid"))
  {
    v4 = (char *)objc_msgSend(v19, "range");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = objc_msgSend(v7, "textRangeForParagraphAtCharIndex:", v4);
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v12 = (char *)objc_msgSend(v11, "textRangeForParagraphAtCharIndex:", &v4[v6]);
    v14 = v13;

    v15 = objc_msgSend(v19, "isRange");
    v16 = &v4[v6] == v12;
    if ((v15 & v16) != 0)
      v17.location = (NSUInteger)&v4[v6];
    else
      v17.location = (NSUInteger)v12;
    if ((v15 & v16) != 0)
      v17.length = 0;
    else
      v17.length = v14;
    v20.location = (NSUInteger)v8;
    v20.length = v10;
    v18 = NSUnionRange(v20, v17);
    if ((char *)v18.location != v4 || v18.length != v6)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v18.location, v18.length, 0);
  }

}

- (void)selectLine:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  NSUInteger v6;
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  NSUInteger v11;
  void *v12;
  unsigned int v13;
  char *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSUInteger v19;
  NSRange v20;
  NSRange v21;
  uint64_t v22;
  unsigned __int8 v23;
  NSRange v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    v23 = 0;
    if ((objc_msgSend(v4, "isRange") & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v4, "isAtEndOfLine");
    v23 = v5;
    v6 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", objc_msgSend(v4, "start"), &v23, 4, 1, 0, 0);
    if ((objc_msgSend(v4, "isRange") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v4, "isAtEndOfLine");
    v23 = v7;
    v8 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", objc_msgSend(v4, "start"), &v23, 4, 0, 0, 0);
    if (v6 <= v8)
      v9 = v8;
    else
      v9 = v6;
    if (v6 >= v8)
      v6 = v8;
    if ((objc_msgSend(v4, "isRange") & 1) != 0)
      v10 = 0;
    else
      v10 = objc_msgSend(v4, "isAtEndOfLine");
    v23 = v10;
    v11 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", objc_msgSend(v4, "end"), &v23, 4, 1, 0, 0);
    if (objc_msgSend(v4, "isRange")
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource")),
          v13 = sub_1001AE2A0((uint64_t)objc_msgSend(v12, "characterAtIndex:", (char *)objc_msgSend(v4, "end") - 1)), v12, v13))
    {
      v14 = (char *)objc_msgSend(v4, "end");
    }
    else
    {
      if ((objc_msgSend(v4, "isRange") & 1) != 0)
        v15 = 1;
      else
        v15 = objc_msgSend(v4, "isAtEndOfLine");
      v23 = v15;
      v14 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", objc_msgSend(v4, "end"), &v23, 4, 0, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      if (v14 >= (char *)objc_msgSend(v16, "length") - 1)
      {

      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v18 = sub_1001AE2A0((uint64_t)objc_msgSend(v17, "characterAtIndex:", v14));

        v14 += v18;
      }
    }
    if (v11 <= (unint64_t)v14)
      v19 = (NSUInteger)v14;
    else
      v19 = v11;
    if (v11 >= (unint64_t)v14)
      v20.location = (NSUInteger)v14;
    else
      v20.location = v11;
    v20.length = v19 - v20.location;
    v24.location = v6;
    v24.length = v9 - v6;
    v21 = NSUnionRange(v24, v20);
    if ((id)v21.location != objc_msgSend(v4, "range") || v21.length != v22)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v21.location, v21.length, 0);
  }

}

- (void)selectWord:(id)a3
{
  -[CRLWPEditorHelper selectWordWithFlags:](self, "selectWordWithFlags:", 0);
}

- (void)selectWordWithFlags:(unint64_t)a3
{
  void *v5;
  id v6;
  id location;
  NSUInteger v8;
  NSUInteger length;
  uint64_t v10;
  id v11;
  NSUInteger v12;
  NSRange v13;
  NSRange v14;
  uint64_t v15;
  id v16;
  NSRange v17;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  if (objc_msgSend(v16, "isValid") && objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v16, "start");
    if (v6
      && (v6 == objc_msgSend(v5, "length")
       || sub_1001AE2A0((uint64_t)objc_msgSend(v5, "characterAtIndex:", v6))))
    {
      v6 = objc_msgSend(v5, "previousCharacterIndex:", v6);
    }
    location = -[CRLWPEditorHelper rangeForSelectionAtCharIndex:caretIndex:](self, "rangeForSelectionAtCharIndex:caretIndex:", v6, v6);
    length = v8;
    if (objc_msgSend(v16, "isRange") && (location != objc_msgSend(v16, "range") || length != v10))
    {
      if (location == (id)0x7FFFFFFFFFFFFFFFLL && length == 0)
        length = 0;
      else
        v6 = location;
      v11 = objc_msgSend(v5, "previousCharacterIndex:", objc_msgSend(v16, "end"));
      v13.location = (NSUInteger)-[CRLWPEditorHelper rangeForSelectionAtCharIndex:caretIndex:](self, "rangeForSelectionAtCharIndex:caretIndex:", v11, v11);
      v13.length = v12;
      if (v13.location == 0x7FFFFFFFFFFFFFFFLL && !v12)
      {
        v13.location = (NSUInteger)objc_msgSend(v16, "end", 0x7FFFFFFFFFFFFFFFLL, 0);
        v13.length = 0;
      }
      v17.location = (NSUInteger)v6;
      v17.length = length;
      v14 = NSUnionRange(v17, v13);
      location = (id)v14.location;
      length = v14.length;
    }
    if (location != objc_msgSend(v16, "range") || length != v15)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:withFlags:](self, "setSelectionWithRange:endOfLine:withFlags:", location, length, 0, a3);
  }

}

- (void)setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5
{
  -[CRLWPEditorHelper p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:](self, "p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:", a3.location, a3.length, a4, a5, 1);
}

- (void)p_setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5 allowEndOfLineChange:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  double v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSUInteger v56;
  id v57;

  v6 = a5;
  length = a3.length;
  location = a3.location;
  v11 = objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass", a3.location, a3.length, a4, a5, a6));
  *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v13));
  v17 = sub_100221D0C(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v56 = length;
  LOBYTE(v55) = a4;
  v57 = objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, location, length, 0, v6, 0x7FFFFFFFFFFFFFFFLL, 0, v55, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPath"));

  *(_QWORD *)&v22 = objc_opt_class(CRLWPSelection, v21).n128_u64[0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mostSpecificSelectionOfClass:", v23, v22));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v24, v57));
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionModelTranslator"));
    v28 = objc_msgSend(v57, "range");
    v30 = v29;
    *(_QWORD *)&v31 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v29).n128_u64[0];
    v33 = v32;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v31));
    v35 = sub_100221D0C(v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectionPathForRange:onStorage:", v28, v30, v36));

  }
  v37 = (char *)objc_msgSend(v24, "range");
  v39 = v38;
  v40 = location;
  if ((objc_msgSend(v57, "isRange") & 1) != 0)
  {
    v40 = location + v56;
    if (v37 != (char *)location)
    {
      if ((char *)v40 == &v37[v39])
        v40 = location;
      else
        v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v42 = v41;
  if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    v43 = 36;
  else
    v43 = 32;
  objc_msgSend(v41, "setSelectionPath:withSelectionFlags:", v25, v43);

  if (v40 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v57, "isInsertionPoint"))
    {
      v45 = v57;
    }
    else
    {
      *(_QWORD *)&v46 = objc_opt_class(v57, v44).n128_u64[0];
      v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "selectionWithRange:", v40, 0, v46));
    }
    v48 = v45;
    if (objc_msgSend(v57, "isInsertionPoint"))
      v49 = (uint64_t)objc_msgSend(v57, "caretAffinity");
    else
      v49 = 0;
    if ((objc_msgSend(v57, "isRange") & (v40 == location + v56)) != 0)
      v49 = 1;
    if (objc_msgSend(v48, "caretAffinity") != (id)v49)
    {
      v50 = objc_msgSend(v48, "copyWithNewStyleInsertionBehavior:newCaretAffinity:", 0, v49);

      v48 = v50;
    }
    v51 = v20;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:", v48));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v53, "scrollToSelectionPath:scrollOptions:", v52, 0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v54, "layoutIfNeeded");

    v20 = v51;
  }
  -[CRLWPEditorHelper setSelectionLastModifiedWithKeyboard:](self, "setSelectionLastModifiedWithKeyboard:", 1);
  if (objc_msgSend(v57, "isInsertionPoint"))
    self->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLWPEditorHelper p_clearEditMenuFlags](self, "p_clearEditMenuFlags");

}

- (void)p_moveToEndOfLineRight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char *v6;
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  char *v12;
  unsigned __int8 v13;
  unint64_t v14;
  int v15;
  unsigned __int8 v16;
  unsigned __int8 v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v17 = objc_msgSend(v5, "leadingEdge");
    if (v3)
    {
      v6 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v5, &v17);
      v7 = 2;
    }
    else
    {
      v6 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v5, &v17);
      v7 = 3;
    }
    v8 = v17;
    v9 = -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v6, 1, 4, v7);
    if (objc_msgSend(v5, "isRange") && v6 == objc_msgSend(v5, "end"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v11 = sub_1001AE2A0((uint64_t)objc_msgSend(v10, "characterAtIndex:", v6 - 1));

      v12 = &v6[-v11];
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v6;
    }
    if (objc_msgSend(v5, "isInsertionPoint"))
      v13 = objc_msgSend(v5, "isAtEndOfLine");
    else
      v13 = v11 | v9;
    v16 = v13;
    v14 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v12, &v16, 4, v7, 0, &v17);
    v15 = v17;
    if ((char *)v14 != v6 || v8 != v17)
      goto LABEL_16;
    if (objc_msgSend(v5, "isRange"))
    {
      v15 = v17;
LABEL_16:
      -[CRLWPEditorHelper p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:](self, "p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:", v14, 0, v15 != 0, v16, 0);
    }
  }

}

- (void)moveToLeftEndOfLine:(id)a3
{
  -[CRLWPEditorHelper p_moveToEndOfLineRight:](self, "p_moveToEndOfLineRight:", 0);
}

- (void)moveToRightEndOfLine:(id)a3
{
  -[CRLWPEditorHelper p_moveToEndOfLineRight:](self, "p_moveToEndOfLineRight:", 1);
}

- (void)p_extendToEndOfLineRight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  char *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  unsigned __int8 v11;
  unint64_t v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v15 = objc_msgSend(v5, "leadingEdge");
    if (v3)
      v6 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v5, &v15);
    else
      v6 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v5, &v15);
    v7 = (char *)v6;
    if (!objc_msgSend(v5, "isRange")
      || v7 != objc_msgSend(v5, "end")
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource")),
          v9 = sub_1001AE2A0((uint64_t)objc_msgSend(v8, "characterAtIndex:", v7 - 1)),
          v8,
          (v9 & 1) == 0))
    {
      if (v3)
        v10 = 2;
      else
        v10 = 3;
      v11 = -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v7, 1, 4, v10);
      if (objc_msgSend(v5, "isInsertionPoint"))
        v11 = objc_msgSend(v5, "isAtEndOfLine");
      v14 = v11;
      v7 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v7, &v14, 4, v10, 0, &v15);
    }
    v13 = objc_msgSend(v5, "leadingEdge");
    if (v3)
      v12 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v5, &v13);
    else
      v12 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v5, &v13);
    -[CRLWPEditorHelper p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:](self, "p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:", v7, v15, v12, v13);
  }

}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_extendToEndOfLineRight:](self, "p_extendToEndOfLineRight:", 0);
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
  -[CRLWPEditorHelper p_extendToEndOfLineRight:](self, "p_extendToEndOfLineRight:", 1);
}

- (void)moveToBeginningOfLine:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = objc_msgSend(v4, "start");
    v7 = objc_msgSend(v4, "isAtEndOfLine");
    v6 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v5, &v7, 4, 1, 0, 0);
    if ((id)v6 != v5 || objc_msgSend(v4, "isRange"))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
  }

}

- (void)moveToEndOfLine:(id)a3
{
  void *v4;
  char *v5;
  char *v6;
  void *v7;
  unsigned int v8;
  unsigned __int8 v9;
  unint64_t v10;
  unsigned __int8 v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid"))
  {
    v5 = (char *)objc_msgSend(v4, "end");
    v6 = v5;
    if (objc_msgSend(v4, "isRange"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v8 = sub_1001AE2A0((uint64_t)objc_msgSend(v7, "characterAtIndex:", v5 - 1));

      v6 = &v5[-v8];
    }
    v9 = -[CRLWPEditorHelper p_isCharIndex:withEolAffinity:atBoundary:inDirection:](self, "p_isCharIndex:withEolAffinity:atBoundary:inDirection:", v6, 1, 4, 0);
    if (objc_msgSend(v4, "isInsertionPoint"))
      v9 = objc_msgSend(v4, "isAtEndOfLine");
    v11 = v9;
    v10 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v11, 4, 0, 0, 0);
    if ((char *)v10 != v5 || objc_msgSend(v4, "isRange"))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v10, 0, 1);
  }

}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v4, "textSelectionWillChange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v6 = objc_msgSend(v5, "start");
    v8 = objc_msgSend(v5, "isAtEndOfLine");
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v8, 4, 1, 0, 0), objc_msgSend(v5, "end"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v7, "textSelectionDidChange");

}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v4, "textSelectionWillChange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v6 = (char *)objc_msgSend(v5, "end");
    if (objc_msgSend(v5, "isInsertionPoint"))
      v7 = objc_msgSend(v5, "isAtEndOfLine");
    else
      v7 = 1;
    v11 = v7;
    if (!objc_msgSend(v5, "isRange")
      || v6 != objc_msgSend(v5, "end")
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource")),
          v9 = sub_1001AE2A0((uint64_t)objc_msgSend(v8, "characterAtIndex:", v6 - 1)),
          v8,
          (v9 & 1) == 0))
    {
      v6 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v11, 4, 0, 0, 0);
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v6, objc_msgSend(v5, "start"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v10, "textSelectionDidChange");

}

- (void)moveToBeginningOfParagraph:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v8, "textSelectionWillChange");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v9, "isValid"))
  {
    v4 = objc_msgSend(v9, "start");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v6 = objc_msgSend(v5, "textRangeForParagraphAtCharIndex:", v4);

    if (v6 != v4 || objc_msgSend(v9, "isRange"))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v7, "textSelectionDidChange");

}

- (void)moveToEndOfParagraph:(id)a3
{
  char *v4;
  char *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  id v17;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v16, "textSelectionWillChange");

  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v17, "isValid"))
  {
    v4 = (char *)objc_msgSend(v17, "end");
    v5 = v4;
    if (objc_msgSend(v17, "isRange"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v7 = sub_1001AE2A0((uint64_t)objc_msgSend(v6, "characterAtIndex:", v4 - 1));

      v5 = &v4[-v7];
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v9 = (char *)objc_msgSend(v8, "textRangeForParagraphAtCharIndex:", v5);
    v11 = v10;

    v12 = &v9[v11];
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v14 = sub_1001AE2A0((uint64_t)objc_msgSend(v13, "characterAtIndex:", v12 - 1));

      v12 -= v14;
    }
    if (v12 != v4 || objc_msgSend(v17, "isRange"))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v12, 0, 0);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v15, "textSelectionDidChange");

}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v10, "textSelectionWillChange");

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v11, "isValid"))
  {
    v4 = (char *)objc_msgSend(v11, "range");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = objc_msgSend(v7, "textRangeForParagraphAtCharIndex:", v4);

    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v8, &v4[v6]);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v9, "textSelectionDidChange");

}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v20, "textSelectionWillChange");

  v21 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v21, "isValid"))
  {
    v4 = (char *)objc_msgSend(v21, "range");
    v6 = v5;
    v7 = &v4[v5];
    if (objc_msgSend(v21, "isRange"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v9 = sub_1001AE2A0((uint64_t)objc_msgSend(v8, "characterAtIndex:", v7 - 1));

      v7 -= v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v11 = (char *)objc_msgSend(v10, "textRangeForParagraphAtCharIndex:", v7);
    v13 = v12;

    v14 = &v11[v13];
    if (v4 <= &v11[v13])
      v15 = &v11[v13];
    else
      v15 = v4;
    if (v4 >= &v11[v13])
      v16 = &v11[v13];
    else
      v16 = v4;
    if (v4 > v14 || v15 - v16 != v6)
    {
      if (v13)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v18 = sub_1001AE2A0((uint64_t)objc_msgSend(v17, "characterAtIndex:", v14 - 1));

        v14 = &v11[v13 - v18];
      }
      -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v14, v4);
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v19, "textSelectionDidChange");

}

- (void)moveParagraphForward:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLWPEditorHelper moveForward:](self, "moveForward:");
  -[CRLWPEditorHelper moveToEndOfParagraph:](self, "moveToEndOfParagraph:", v4);

}

- (void)moveParagraphBackward:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLWPEditorHelper moveBackward:](self, "moveBackward:");
  -[CRLWPEditorHelper moveToBeginningOfParagraph:](self, "moveToBeginningOfParagraph:", v4);

}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v4, "textSelectionWillChange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 0, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = objc_msgSend(v7, "textRangeForParagraphAtCharIndex:", v6);
    v10 = v9;

    v11 = (unint64_t)v8 + v10;
    if (v6 < -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor")
      && -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor") < v11)
    {
      v11 = v13;
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v12, "textSelectionDidChange");

}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v4, "textSelectionWillChange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v5, "isValid"))
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 1, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v8 = objc_msgSend(v7, "textRangeForParagraphAtCharIndex:", v6);

    if (v6 && (id)v6 == v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v8 = objc_msgSend(v9, "textRangeForParagraphAtCharIndex:", v6 - 1);

    }
    if (v6 > -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor")
      && (id)-[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor") > v8)
    {
      v8 = (id)v11;
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v8);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v10, "textSelectionDidChange");

}

- (void)moveToBeginningOfDocument:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v4, "isValid")
    && (objc_msgSend(v4, "start") || objc_msgSend(v4, "isRange")))
  {
    -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", 0, 0, 0);
  }

}

- (void)moveToEndOfDocument:(id)a3
{
  void *v4;
  char *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v6, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v5 = (char *)objc_msgSend(v4, "length");

    if (v5 - 1 != objc_msgSend(v6, "end") || objc_msgSend(v6, "isRange"))
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5 - 1, 0, 0);
  }

}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v5, "textSelectionWillChange");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v6, "isValid"))
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", 0, objc_msgSend(v6, "end"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v4, "textSelectionDidChange");

}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
  void *v4;
  char *v5;
  void *v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v7, "textSelectionWillChange");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v8, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v5 = (char *)objc_msgSend(v4, "length");

    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v5 - 1, objc_msgSend(v8, "start"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v6, "textSelectionDidChange");

}

- (CGRect)p_viewRectForSelection:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGAffineTransform v50[2];
  CGRect v51;
  CGRect v52;
  CGRect result;

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (objc_msgSend(v4, "isValid"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class selectionWithRange:](-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass"), "selectionWithRange:", objc_msgSend(v4, "start"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPathPoppingOffSelection:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathWithAppendedSelection:", v9));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "infoForSelectionPath:", v14));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutForInfoNearestVisibleRect:intersectingSelectionPath:", v16, v14));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v19, "layoutIfNeeded");

    *(_QWORD *)&v21 = objc_opt_class(CRLWPRep, v20).n128_u64[0];
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v21));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "repForLayout:", v18));
    v26 = sub_100221D0C(v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (v27)
    {
      if (objc_msgSend(v4, "isRange"))
        objc_msgSend(v27, "rectForSelection:includeRuby:includePaginatedAttachments:", v4, 0, 0);
      else
        objc_msgSend(v27, "caretRectForSelection:", v4);
      v32 = v28;
      v33 = v29;
      v34 = v30;
      v35 = v31;
      memset(&v50[1], 0, sizeof(CGAffineTransform));
      if (v18)
        objc_msgSend(v18, "transformInRoot");
      v50[0] = v50[1];
      v51.origin.x = v32;
      v51.origin.y = v33;
      v51.size.width = v34;
      v51.size.height = v35;
      v52 = CGRectApplyAffineTransform(v51, v50);
      v36 = v52.origin.x;
      v37 = v52.origin.y;
      v38 = v52.size.width;
      v39 = v52.size.height;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvas"));
      objc_msgSend(v41, "convertUnscaledToBoundsRect:", v36, v37, v38, v39);
      x = v42;
      y = v43;
      width = v44;
      height = v45;

    }
  }

  v46 = x;
  v47 = y;
  v48 = width;
  v49 = height;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (BOOL)p_canReplaceSelection
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (objc_msgSend(v3, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v4, "type") != (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)notifySelectionChangedWithFlags:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11[0] = CFSTR("CRLWPEditorKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v12[0] = v6;
  v11[1] = CFSTR("CRLWPEditorSelectionFlagsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("CRLTPEditorSelectionChanged"), v10, v8);

}

- (void)insertParagraphSeparator:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v3, "insertText:", CFSTR("\n"));

}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3));
  objc_msgSend(v3, "insertText:", CFSTR("\n"));

}

- (BOOL)areCollabUserActionsCurrentlyPermitted
{
  return 1;
}

- (id)styleProvider
{
  return 0;
}

- (BOOL)editorKeyboardLanguageIsRTL
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorKeyboardLanguage](self, "editorKeyboardLanguage"));
  v3 = (id)+[NSLocale characterDirectionForLanguage:](NSLocale, "characterDirectionForLanguage:", v2) == (id)2;

  return v3;
}

- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4
{
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  int v17;
  UChar32 v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  __int128 *v27;
  unint64_t v28;
  uint64_t v29;
  UChar32 v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  id v35;
  void *v36;
  __int128 *v37;
  uint64_t v38;
  UChar32 v39;
  int v41;
  BOOL v42;
  __int16 v43;
  unsigned int v44;
  int v45;
  id v46;
  void *v47;

  v46 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v47 = 0;
  v7 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", objc_msgSend(v46, "insertionChar"), &v47, 0);
  v8 = v47;
  if (v7 && !v47)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E7C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BB74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E7E8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_lineFragmentWithCaretInfo:forSelection:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 3990, 0, "Column should not be nil");

    v8 = v47;
  }
  if (!v8)
  {
    if (!v7)
      goto LABEL_55;
LABEL_16:
    v14 = v7[3];
    v15 = objc_msgSend(v46, "insertionChar");
    v16 = sub_100144A40((__int128 *)v7, (uint64_t)v15);
    v42 = v16 == 1;
    v44 = objc_msgSend(v46, "leadingEdge");
    v43 = v14;
    if ((v14 & 0x1000) != 0)
      v17 = 2;
    else
      v17 = 1;
    v45 = v17;
    if (v15 < objc_msgSend(v6, "length"))
    {
      v18 = sub_1001AF904((unint64_t)v15, v6);
      v45 = sub_1001B0EFC(v18);
    }
    v20 = (v14 >> 12) & 1;
    if ((objc_msgSend(v46, "isVisual") & 1) != 0
      || (unint64_t)v15 <= *v7
      || (v16 == 1) == -[CRLWPEditorHelper editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
    {
      v41 = v16 == 1;
      if (v41 != v44)
        goto LABEL_27;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v15 = objc_msgSend(v21, "previousCharacterIndex:", objc_msgSend(v46, "insertionChar"));

      LOBYTE(v44) = 0;
      if (sub_100144A40((__int128 *)v7, (uint64_t)v15) == 1)
      {
        LOBYTE(v41) = 1;
        v42 = 1;
LABEL_27:
        v22 = v6;
        objc_opt_class(_TtC8Freeform12CRLWPStorage, v19);
        v24 = sub_100221D0C(v23, v6);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = sub_100147718((uint64_t)v7, (uint64_t)v15, 3, v25);

        if ((uint64_t)v7[3] < 0)
          v27 = &xmmword_100EEE418;
        else
          v27 = (__int128 *)v7;
        if (v26 == *(_QWORD *)v27 + *((_QWORD *)v27 + 1))
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = sub_100144A40((__int128 *)v7, v28);
          v30 = sub_1001AF904(v28, v22);
          LOBYTE(v20) = v29 == 1;
          v17 = sub_1001B0EFC(v30);
        }
        if (v15 == (id)sub_1001449A4((uint64_t)v7) && (*((_BYTE *)v7 + 25) & 8) != 0)
        {
          v31 = (uint64_t)v15;
          v32 = v45;
          if ((v43 & 0x1000) == 0)
          {
            v42 = 0;
            v32 = 1;
            v31 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
          v31 = (uint64_t)v15;
          v32 = v45;
        }
        v33 = v42;
LABEL_54:
        a3->var4 = v28;
        a3->var5 = v20;
        a3->var2 = v44;
        a3->var6 = v17;
        a3->var7 = v31;
        a3->var8 = v33;
        a3->var9 = v32;
        a3->var0 = (unint64_t)v15;
        a3->var1 = v41;
        a3->var3 = v45;
        v6 = v22;
        goto LABEL_55;
      }
      LOBYTE(v41) = 0;
      v42 = 0;
    }
    objc_opt_class(_TtC8Freeform12CRLWPStorage, v19);
    v35 = sub_100221D0C(v34, v6);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v31 = sub_100147718((uint64_t)v7, (uint64_t)v15, 2, v36);

    v37 = &xmmword_100EEE418;
    if ((uint64_t)v7[3] >= 0)
      v37 = (__int128 *)v7;
    if (v31 == *(_QWORD *)v37 + *((_QWORD *)v37 + 1))
      v31 = 0x7FFFFFFFFFFFFFFFLL;
    v33 = (v14 & 0x1000) != 0;
    v32 = v17;
    if (v31 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = sub_100144A40((__int128 *)v7, v31);
      v39 = sub_1001AF904(v31, v6);
      v33 = v38 == 1;
      v32 = sub_1001B0EFC(v39);
    }
    v22 = v6;
    if (v15 == (id)sub_100144974((uint64_t)v7) && (*((_BYTE *)v7 + 25) & 8) != 0)
    {
      v28 = (unint64_t)v15;
      v17 = v45;
      if ((v43 & 0x1000) != 0)
      {
        v17 = 2;
        v42 = 1;
        v28 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v28 = (unint64_t)v15;
      v17 = v45;
    }
    LOBYTE(v20) = v42;
    goto LABEL_54;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
  v13 = v12 != v6;

  if (!v13 && v7 != 0)
    goto LABEL_16;
  v7 = 0;
LABEL_55:

  return v7;
}

- (unint64_t)getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  __int128 *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  __int128 *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void *v26;
  char *v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char v31;
  int v32;
  char *v33;
  char v34;
  int v35;

  v6 = a3;
  if (a4)
  {
    v7 = *a4;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E808);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BC74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E828);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualDeletionIndexForSelection:backward:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 4096, 0, "backwards should never be NULL!");

    v7 = 1;
  }
  v11 = (char *)objc_msgSend(v6, "range");
  if ((objc_msgSend(v6, "isInsertionPoint") & 1) == 0)
  {
    objc_msgSend(v6, "range");
    if (((v12 != 0) & ~v7) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E848);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1BBF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124E868);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualDeletionIndexForSelection:backward:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 4099, 0, "invalid selection type");

    }
  }
  v16 = -[CRLWPEditorHelper p_lineFragmentWithCaretInfo:forSelection:](self, "p_lineFragmentWithCaretInfo:forSelection:", &v29, v6);
  v17 = (__int128 *)v16;
  if (!v16 || !v16[1] || !objc_msgSend(v6, "isVisual"))
    goto LABEL_45;
  if ((objc_msgSend(v6, "isInsertionPoint") & 1) == 0)
  {
    objc_msgSend(v6, "range");
    v19 = v18 ? v7 : 1;
    if ((v19 & 1) != 0)
      goto LABEL_45;
  }
  v20 = *((_QWORD *)v17 + 3);
  v21 = &xmmword_100EEE418;
  if (v20 >= 0)
    v21 = v17;
  v22 = *(char **)v21;
  v23 = *((_QWORD *)v21 + 1) + (v20 << 52 >> 63);
  if (v31 != v34 && v32 != 3 && v35 != 3)
  {
    if (v31)
    {
      if (-[CRLWPEditorHelper editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
        v24 = v30;
      else
        v24 = v33;
      LOBYTE(v7) = v24 == (char *)0x7FFFFFFFFFFFFFFFLL;
      if (v24 == (char *)0x7FFFFFFFFFFFFFFFLL)
        v22 += v23;
      else
        v22 = v24;
      goto LABEL_46;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    if (-[CRLWPEditorHelper editorKeyboardLanguageIsRTL](self, "editorKeyboardLanguageIsRTL"))
    {
      v27 = v33;
      if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_60:
        v22 = (char *)objc_msgSend(v26, "nextCharacterIndex:", v27);
        goto LABEL_61;
      }
      if (!v31)
      {
        v27 = v30;
        goto LABEL_60;
      }
    }
    else
    {
      v27 = v30;
      if (v30 != (char *)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_60;
      if (v34)
      {
        v27 = v33;
        goto LABEL_60;
      }
    }
LABEL_61:

    LOBYTE(v7) = 1;
    goto LABEL_46;
  }
  if (v31 == v34 || !objc_msgSend(v6, "isVisual"))
  {
LABEL_45:
    v22 = v11;
    goto LABEL_46;
  }
  if (v31)
  {
    if (v30 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v22 += v23;
    else
      v22 = v30;
  }
  else if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v22 = (char *)objc_msgSend(v28, "nextCharacterIndex:", v33);

  }
LABEL_46:
  if (a4)
    *a4 = v7;

  return (unint64_t)v22;
}

- (id)characterStyleForDeletedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characterStyleAtCharIndex:effectiveRange:", location, v9));

  v7 = 0;
  if (v6 && v9[0] == location)
  {
    if (v9[1] + location <= location + length)
      v7 = v6;
    else
      v7 = 0;
  }

  return v7;
}

- (void)p_deleteSelectionBackward:(BOOL)a3 decomposeCharacter:(BOOL)a4 smart:(BOOL)a5 kill:(BOOL)a6
{
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  _BOOL4 v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  char *v44;
  void *v45;
  char *v46;
  void *v47;
  char *v48;
  _TtC8Freeform12CRLTextRange *v49;
  void *v50;
  id v51;
  id v52;
  id v53[9];
  BOOL v54;

  v54 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor", a3, a4, a5, a6));
  objc_msgSend(v7, "unmarkText");

  v51 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if ((objc_msgSend(v51, "isValid") & 1) == 0)
    goto LABEL_37;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  if (!objc_msgSend(v8, "length"))
  {

LABEL_37:
    return;
  }
  v9 = -[CRLWPEditorHelper areCollabUserActionsCurrentlyPermitted](self, "areCollabUserActionsCurrentlyPermitted");

  if (!v9)
    return;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v10, "layoutIfNeeded");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "commandController"));

  v52 = (id)v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E888);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BD74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E8A8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 4223, 0, "can't delete without a command controller");

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  v17 = (char *)objc_msgSend(v16, "superRange");
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  v21 = (char *)objc_msgSend(v20, "range");
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v25 = &v17[v19] > objc_msgSend(v24, "length");

  if (v25)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E8C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BCF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E8E8);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 4230, 0, "Trying to delete past end of storage");

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v30 = &v21[v23] > objc_msgSend(v29, "length");

  if (v30)
    goto LABEL_49;
  if (!v19)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper styleProvider](self, "styleProvider"));
    -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:styleProvider:](self, "paragraphEnumeratorAtCharIndex:styleProvider:", v17, v31);

    v32 = sub_100172320((uint64_t)v53);
    if (v54 && v32)
    {
      v34 = sub_10017226C((uint64_t)v53);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%C"), 65532, v52));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", v36, &stru_1012A72B0));

      if (!objc_msgSend(v37, "length")
        || (v38 = sub_1001AE1DC(),
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38),
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByTrimmingCharactersInSet:", v39)),
            v41 = objc_msgSend(v40, "length") == 0,
            v40,
            v39,
            v41))
      {
        -[CRLWPEditorHelper p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:](self, "p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:", v21, v23, 1);

        goto LABEL_47;
      }

    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v21 = -[CRLWPEditorHelper getVisualDeletionIndexForSelection:backward:](self, "getVisualDeletionIndexForSelection:backward:", v42, &v54);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v44 = (char *)objc_msgSend(v43, "length");

    if (v54)
    {
      if (v21)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        v46 = (char *)objc_msgSend(v45, "previousCharacterIndex:", v21);

LABEL_41:
        if (v21 <= v46)
          v48 = v46;
        else
          v48 = v21;
        if (v21 >= v46)
          v21 = v46;
        v23 = v48 - v21;
      }
    }
    else if (v21 < v44 - 1)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v46 = (char *)objc_msgSend(v47, "nextCharacterIndex:", v21);

      goto LABEL_41;
    }
LABEL_47:
    sub_100171FA4(v53);
  }
  v49 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v21, v23);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  objc_msgSend(v50, "replace:with:", v49, &stru_1012A72B0);

LABEL_49:
}

- (BOOL)wantsToReceiveTextInput
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v3 = objc_msgSend(v2, "wantsToReceiveTextInput");

  return v3;
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
    -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 1, 1, 0, 0);
}

- (void)deleteWordForward:(id)a3
{
  unsigned int v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v4 = objc_msgSend(v7, "isValid");

    if (v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v5 = objc_msgSend(v8, "isInsertionPoint");

      if ((v5 & 1) != 0)
      {
        v6 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveWordForwardAndModifySelection:](self, "moveWordForwardAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v6);
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 0, 0, 0, 0);
      }
      else
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        objc_msgSend(v9, "deleteForward:", 0);

      }
    }
  }
}

- (void)deleteWordBackward:(id)a3
{
  unsigned int v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v4 = objc_msgSend(v7, "isValid");

    if (v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v5 = objc_msgSend(v8, "isInsertionPoint");

      if ((v5 & 1) != 0)
      {
        v6 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveWordBackwardAndModifySelection:](self, "moveWordBackwardAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v6);
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 1, 0, 0, 0);
      }
      else
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        objc_msgSend(v9, "deleteBackward:", 0);

      }
    }
  }
}

- (void)deleteToBeginningOfLine:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  unsigned __int8 v10;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v7 = objc_msgSend(v6, "isInsertionPoint");

      if (v7)
      {
        v8 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveToBeginningOfLineAndModifySelection:](self, "moveToBeginningOfLineAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v8);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v10 = objc_msgSend(v9, "isInsertionPoint");

      if ((v10 & 1) == 0)
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 1, 0, 0, 1);
    }
  }
}

- (void)deleteToEndOfLine:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  unsigned __int8 v10;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v7 = objc_msgSend(v6, "isInsertionPoint");

      if (v7)
      {
        v8 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveToEndOfLineAndModifySelection:](self, "moveToEndOfLineAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v8);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v10 = objc_msgSend(v9, "isInsertionPoint");

      if ((v10 & 1) == 0)
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 0, 0, 0, 1);
    }
  }
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  unsigned __int8 v10;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v7 = objc_msgSend(v6, "isInsertionPoint");

      if (v7)
      {
        v8 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveToBeginningOfParagraphAndModifySelection:](self, "moveToBeginningOfParagraphAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v8);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v10 = objc_msgSend(v9, "isInsertionPoint");

      if ((v10 & 1) == 0)
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 1, 0, 0, 1);
    }
  }
}

- (void)deleteToEndOfParagraph:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  _BOOL8 v16;
  void *v17;
  unsigned __int8 v18;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v4, "isValid");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v7 = objc_msgSend(v6, "isInsertionPoint");

      if (v7)
      {
        v8 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
        -[CRLWPEditorHelper moveToEndOfParagraphAndModifySelection:](self, "moveToEndOfParagraphAndModifySelection:", self);
        -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v8);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      if (objc_msgSend(v9, "isInsertionPoint"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
        v11 = objc_msgSend(v10, "range");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
        if (v11 < objc_msgSend(v12, "length"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
          v15 = sub_1001AE2A0((uint64_t)objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v14, "range")));

          if (v15)
          {
            v16 = -[CRLWPEditorHelper continueKillRing](self, "continueKillRing");
            -[CRLWPEditorHelper moveForwardAndModifySelection:](self, "moveForwardAndModifySelection:", self);
            -[CRLWPEditorHelper setContinueKillRing:](self, "setContinueKillRing:", v16);
          }
          goto LABEL_11;
        }

      }
LABEL_11:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v18 = objc_msgSend(v17, "isInsertionPoint");

      if ((v18 & 1) == 0)
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 0, 0, 0, 1);
    }
  }
}

- (void)yank:(id)a3
{
  unsigned int v4;
  id v5;
  _TtC8Freeform12CRLTextRange *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _TtC8Freeform12CRLTextRange *v10;
  void *v11;
  id v12;
  id v13;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v4 = objc_msgSend(v12, "isValid");

    if (v4)
    {
      v5 = sub_1003A7B24();
      v13 = (id)objc_claimAutoreleasedReturnValue(v5);
      v6 = [_TtC8Freeform12CRLTextRange alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v8 = objc_msgSend(v7, "range");
      v10 = -[CRLTextRange initWithRange:](v6, "initWithRange:", v8, v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      objc_msgSend(v11, "replace:with:", v10, v13);

      sub_1003A7B14();
    }
  }
}

- (void)yankAndSelect:(id)a3
{
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _TtC8Freeform12CRLTextRange *v9;
  void *v10;
  id v11;
  id v12;

  if (-[CRLWPEditorHelper wantsToReceiveTextInput](self, "wantsToReceiveTextInput", a3))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v4 = objc_msgSend(v11, "isValid");

    if (v4)
    {
      v5 = sub_1003A7B78();
      v12 = (id)objc_claimAutoreleasedReturnValue(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v7 = objc_msgSend(v6, "range");
      v8 = objc_msgSend(v12, "length");

      v9 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      objc_msgSend(v10, "replace:with:", v9, v12);

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v7, v8, 0);
      sub_1003A7B14();

    }
  }
}

- (void)setMark:(id)a3
{
  unsigned int v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  v4 = objc_msgSend(v7, "isValid");

  if (v4)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v5 = objc_msgSend(v8, "range");
    -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v5, v6);

  }
}

- (_NSRange)p_sanitizeMark
{
  _BYTE *v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  _BYTE *v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v3 = -[CRLWPEditorHelper emacsMarkRange](self, "emacsMarkRange");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v7 = objc_msgSend(v6, "length");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
  v9 = objc_msgSend(v8, "length");
  if (v3 >= v7)
    v3 = v7;
  if (v5 >= v9 - v3)
    v5 = v9 - v3;

  -[CRLWPEditorHelper emacsMarkRange](self, "emacsMarkRange");
  v10 = (NSUInteger)v3;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)deleteToMark:(id)a3
{
  id v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  id v11;
  NSRange v12;
  NSRange v13;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v10, "isValid"))
  {
    v4 = -[CRLWPEditorHelper emacsMarkRange](self, "emacsMarkRange");

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = -[CRLWPEditorHelper p_sanitizeMark](self, "p_sanitizeMark");
      v7 = v6;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v13.location = (NSUInteger)objc_msgSend(v11, "range");
      v13.length = v8;
      v12.location = (NSUInteger)v5;
      v12.length = v7;
      v9 = NSUnionRange(v12, v13);

      if (v9.length)
      {
        -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9.location, v9.length, 0);
        -[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:](self, "p_deleteSelectionBackward:decomposeCharacter:smart:kill:", 0, 0, 0, 1);
      }
    }
  }
  else
  {

  }
}

- (void)selectToMark:(id)a3
{
  id v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  id v11;
  NSRange v12;
  NSRange v13;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v10, "isValid"))
  {
    v4 = -[CRLWPEditorHelper emacsMarkRange](self, "emacsMarkRange");

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = -[CRLWPEditorHelper p_sanitizeMark](self, "p_sanitizeMark");
      v7 = v6;
      -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v5, v6);
      v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v13.location = (NSUInteger)objc_msgSend(v11, "range");
      v13.length = v8;
      v12.location = (NSUInteger)v5;
      v12.length = v7;
      v9 = NSUnionRange(v12, v13);

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9.location, v9.length, 0);
    }
  }
  else
  {

  }
}

- (void)swapWithMark:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v10, "isValid"))
  {
    v4 = -[CRLWPEditorHelper emacsMarkRange](self, "emacsMarkRange");

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = -[CRLWPEditorHelper p_sanitizeMark](self, "p_sanitizeMark");
      v7 = v6;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
      v8 = objc_msgSend(v11, "range");
      -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v8, v9);

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, v7, 0);
    }
  }
  else
  {

  }
}

- (BOOL)p_storageRangeCanBeTransposed:(_NSRange)a3 storage:(id)a4
{
  return 1;
}

- (BOOL)p_filteredRangeCanBeTransposed:(_NSRange)a3 inFilteredStorage:(id)a4
{
  return objc_msgSend(a4, "hasSmartFieldsInRange:", a3.location, a3.length) ^ 1;
}

- (void)transpose:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v30 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v30, "isInsertionPoint"))
  {
    v4 = objc_msgSend(v30, "range");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v6 = objc_msgSend(v5, "length");
    if (v4 && v4 == v6)
      v4 = objc_msgSend(v5, "previousCharacterIndex:", v4);
    if (v4)
    {
      if (v4 < objc_msgSend(v5, "length"))
      {
        v7 = -[CRLWPEditorHelper p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:](self, "p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:", objc_msgSend(v5, "previousCharacterIndex:", v4), v5, 1);
        v8 = -[CRLWPEditorHelper p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:](self, "p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:", v4, v5, 0);
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v8;
          if (v8 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = objc_msgSend(v5, "nextCharacterIndex:", v8);
            if (v7 <= (unint64_t)v10)
              v12 = v10;
            else
              v12 = (_BYTE *)v7;
            if (v7 >= (unint64_t)v10)
              v13 = v10;
            else
              v13 = (_BYTE *)v7;
            *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v11).n128_u64[0];
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v14));
            v18 = sub_100221D0C(v16, v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

            if (v19)
            {
              v20 = objc_msgSend(v5, "charRangeMappedToStorage:", v13, v12 - v13);
              if (-[CRLWPEditorHelper p_storageRangeCanBeTransposed:storage:](self, "p_storageRangeCanBeTransposed:storage:", v20, v21, v19))
              {
                if (-[CRLWPEditorHelper p_filteredRangeCanBeTransposed:inFilteredStorage:](self, "p_filteredRangeCanBeTransposed:inFilteredStorage:", v13, v12 - v13, v5))
                {
                  v22 = objc_msgSend(v5, "charRangeMappedToStorage:", v7, (char *)objc_msgSend(v5, "nextCharacterIndex:", v7) - v7);
                  v24 = v23;
                  v25 = (char *)objc_msgSend(v5, "charRangeMappedToStorage:", v9, (char *)objc_msgSend(v5, "nextCharacterIndex:", v9) - v9);
                  v27 = v26;
                  if (-[CRLWPEditorHelper p_transposeRanges:withRange:](self, "p_transposeRanges:withRange:", v22, v24, v25, v26))
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", &v25[v27], 0));
                    objc_msgSend(v28, "setSelection:", v29);

                  }
                }
              }
            }

          }
        }
      }
    }

  }
}

- (void)transposeWords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _TtC8Freeform12CRLTextRange *v32;
  id v33;

  v33 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection", a3));
  if (objc_msgSend(v33, "isInsertionPoint"))
  {
    v4 = objc_msgSend(v33, "range");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v6 = v5;
    if (v4
      && v4 < objc_msgSend(v5, "length")
      && ((sub_1001AE43C((uint64_t)objc_msgSend(v6, "characterAtIndex:", v4)) & 1) != 0
       || sub_1001AE43C((uint64_t)objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "previousCharacterIndex:", v4)))))
    {
      if (sub_1001AE368((uint64_t)objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "previousCharacterIndex:", v4)))&& (v4 = objc_msgSend(v6, "previousCharacterIndex:", v4)) == 0)
      {
        v7 = 0x7FFFFFFFFFFFFFFFLL;
        v9 = 0;
      }
      else
      {
        do
        {
          v7 = (uint64_t)objc_msgSend(v6, "wordAtCharIndex:includePreviousWord:", v4, 1);
          v9 = v8;
          v10 = objc_msgSend(v6, "previousCharacterIndex:", v4);
          v4 = v10;
        }
        while (v7 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0 && v10 != 0);
      }
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
      {
        v13 = objc_msgSend(v6, "nextCharacterIndex:", v9 + v7);
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        v14 = 0;
        do
        {
          if (v13 >= objc_msgSend(v6, "length"))
            break;
          v15 = (unint64_t)objc_msgSend(v6, "wordAtCharIndex:includePreviousWord:", v13, 1);
          v14 = v16;
          v13 = objc_msgSend(v6, "nextCharacterIndex:", v13);
        }
        while (v15 == 0x7FFFFFFFFFFFFFFFLL && v14 == 0);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL && v14)
        {
          v18 = objc_msgSend(v6, "nextCharacterIndex:");
          if (v15 <= (unint64_t)v18)
            v20 = v18;
          else
            v20 = (_BYTE *)v15;
          if (v15 >= (unint64_t)v18)
            v21 = v18;
          else
            v21 = (_BYTE *)v15;
          *(_QWORD *)&v22 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v19).n128_u64[0];
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v22));
          v26 = sub_100221D0C(v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

          v28 = objc_msgSend(v6, "charRangeMappedToStorage:", v21, v20 - v21);
          if (-[CRLWPEditorHelper p_storageRangeCanBeTransposed:storage:](self, "p_storageRangeCanBeTransposed:storage:", v28, v29, v27)&& -[CRLWPEditorHelper p_transposeRanges:withRange:](self, "p_transposeRanges:withRange:", v7, v9, v15, v14))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "textSelectionDelegate"));
            v32 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v14 + v15, 0);
            objc_msgSend(v31, "setSelectedTextRange:", v32);

          }
        }
      }
    }

  }
}

- (BOOL)p_transposeRanges:(_NSRange)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSRange v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _TtC8Freeform23CRLWPReplaceTextCommand *v31;
  void *v32;
  void *v33;
  void *v34;
  _TtC8Freeform23CRLWPReplaceTextCommand *v35;
  _TtC8Freeform23CRLWPReplaceTextCommand *v36;
  void *v37;
  void *v38;
  void *v39;
  _TtC8Freeform23CRLWPReplaceTextCommand *v40;
  void *v41;
  void *v42;
  CRLCanvasCommandSelectionBehavior *v43;
  id v45;
  id v46;
  void *v47;
  NSRange v50;

  length = a4.length;
  location = a4.location;
  if (a3.location >= a4.location)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E908);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BEF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E928);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4734, 0, "bad ranges");

  }
  if (!a3.length || !length)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E948);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BE74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E968);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 4735, 0, "bad range lengths");

  }
  v50.location = location;
  v50.length = length;
  v13 = NSIntersectionRange(a3, v50);
  v12 = v13.length;
  if (v13.length)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E988);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BDF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E9A8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 4737, 0, "overlapping transposition ranges");

  }
  *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v12).n128_u64[0];
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v17));
  v21 = sub_100221D0C(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  if (!v13.length)
  {
    v46 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v22, a3.location, a3.length);
    *(_QWORD *)&v24 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v23).n128_u64[0];
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v24));
    v28 = sub_100221D0C(v26, v27);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v45 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v47, location, length);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "commandController"));

    objc_msgSend(v30, "openGroup");
    v31 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "enclosingShape"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "string"));
    v35 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v31, "initWithShapeItem:range:text:", v33, location, length, v34);

    objc_msgSend(v30, "enqueueCommand:", v35);
    v36 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "enclosingShape"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "string"));
    v40 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v36, "initWithShapeItem:range:text:", v38, a3.location, a3.length, v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "canvasEditor"));

    v43 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:]([CRLCanvasCommandSelectionBehavior alloc], "initWithCanvasEditor:type:", v42, 2);
    objc_msgSend(v30, "enqueueCommand:withSelectionBehavior:", v40, v43);
    objc_msgSend(v30, "closeGroup");

  }
  return v13.length == 0;
}

- (id)protectedSelectionBehaviorForCommand:(id)a3
{
  CRLCommandSelectionBehavior *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLCommandSelectionBehavior *v11;

  v4 = [CRLCommandSelectionBehavior alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
  v11 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:](v4, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", v7, v10, 0);

  return v11;
}

- (BOOL)isACurrentEditor
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editorController](self, "editorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentEditors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)p_replaceRange:(_NSRange)a3 withText:(id)a4 dictationAndAutocorrectionKey:(id)a5 applyingDictationAlternative:(BOOL)a6 restoreSelection:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC8Freeform12CRLTextRange *v38;
  id v39;
  uint64_t v40;
  _TtC8Freeform12CRLTextRange *v41;
  void *v42;
  void *v43;
  NSString *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  uint8_t buf[4];
  unsigned int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  NSRange v63;
  NSRange v64;

  length = a3.length;
  location = a3.location;
  v12 = a4;
  v48 = a5;
  v49 = a7;
  v50 = v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E9C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1BFF4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124E9E8);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 4870, 0, "invalid nil value for '%{public}s'", "aStr");

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "storage"));
  v18 = location + length > (unint64_t)objc_msgSend(v17, "length");

  if (v18)
  {
    v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EA08);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      v64.location = location;
      v64.length = length;
      v44 = NSStringFromRange(v64);
      v47 = (id)objc_claimAutoreleasedReturnValue(v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "storage"));
      *(_DWORD *)buf = 67110402;
      v52 = v19;
      v53 = 2082;
      v54 = "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]";
      v55 = 2082;
      v56 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm";
      v57 = 1024;
      v58 = 4872;
      v59 = 2114;
      v60 = v47;
      v61 = 2048;
      v62 = objc_msgSend(v45, "length");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad replacement range %{public}@ is past end of storage: %lu", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EA28);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    v63.location = location;
    v63.length = length;
    v24 = NSStringFromRange(v63);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storage"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 4872, 0, "Bad replacement range %{public}@ is past end of storage: %lu", v25, objc_msgSend(v27, "length"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "storage"));
  v30 = location + length > (unint64_t)objc_msgSend(v29, "length");

  if (!v30)
  {
    v31 = objc_msgSend(objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass")), "initWithRange:", location, length);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "commandController"));

    if (!v33)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124EA48);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1BF74();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124EA68);
      v34 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 4895, 0, "can't delete without a command controller");

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v38 = [_TtC8Freeform12CRLTextRange alloc];
    v39 = objc_msgSend(v31, "superRange");
    v41 = -[CRLTextRange initWithRange:](v38, "initWithRange:", v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "commandForReplacingTextInRange:withText:", v41, v50));

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper protectedSelectionBehaviorForCommand:](self, "protectedSelectionBehaviorForCommand:", v42));
    objc_msgSend(v33, "enqueueCommand:withSelectionBehavior:", v42, v43);

  }
}

- (void)replaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  unsigned int v8;
  id v9;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
  v8 = objc_msgSend(v7, "wantsToReceiveTextInput");

  if (v8)
    -[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:](self, "p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:", location, length, v9, 0, 0, 0);

}

- (void)p_transformWordWithActionString:(id)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  CRLWPMutableRangeArray *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLWPMutableRangeArray *v19;
  NSRange v20;
  CRLWPMutableRangeArray *v21;
  char *v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  CRLWPEditorHelper *v43;
  NSUInteger v44;
  NSUInteger v45;
  CRLWPMutableRangeArray *v46;
  id v47;
  _QWORD v48[4];
  CRLWPMutableRangeArray *v49;
  id v50[10];
  NSRange v51;
  NSRange v52;

  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  -[CRLWPEditorHelper selectWord:](self, "selectWord:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  v9 = objc_msgSend(v8, "isRange");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v11 = objc_msgSend(v10, "range");
    v44 = v12;
    v45 = (NSUInteger)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", objc_msgSend(v13, "range"));

    while (!sub_100172154((uint64_t)v50))
      sub_100172124((uint64_t)v50);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandController"));

    v15 = objc_opt_new(CRLWPMutableRangeArray);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1002E6988;
    v48[3] = &unk_10124EA90;
    v46 = v15;
    v49 = v46;
    objc_msgSend(v16, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v45, v44, v48);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storage"));
    v43 = self;
    v41 = v6;

    v47 = objc_alloc_init((Class)NSMutableArray);
    v19 = objc_opt_new(CRLWPMutableRangeArray);
    while (1)
    {
      v51.location = (NSUInteger)sub_100172228((uint64_t)v50);
      v52.length = v44;
      v52.location = v45;
      v20 = NSIntersectionRange(v51, v52);
      v21 = -[CRLWPRangeArray initWithRange:]([CRLWPMutableRangeArray alloc], "initWithRange:", v20.location, v20.length);
      if (-[CRLWPRangeArray intersectsRange:](v46, "intersectsRange:", v20.location, v20.length))
        -[CRLWPMutableRangeArray subtract:](v21, "subtract:", v46);
      v22 = -[CRLWPRangeArray rangeCount](v21, "rangeCount");
      if ((uint64_t)(v22 - 1) >= 0)
      {
        do
        {
          v23 = -[CRLWPRangeArray rangeAtIndex:](v21, "rangeAtIndex:", --v22);
          if (v24)
          {
            v25 = (char *)objc_msgSend(v18, "charRangeMappedFromStorage:", v23, v24);
            v27 = v26;
            v28 = v26 - 1;
            v29 = objc_msgSend(v18, "characterAtIndex:", &v25[v26 - 1]);
            if (v27)
            {
              if ((sub_1001AE2A0((uint64_t)v29) & 1) == 0 || (v27 = v28) != 0)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringWithRange:", v25, v27));
                v31 = v7[2](v7, v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
                objc_msgSend(v32, "length");
                objc_msgSend(v30, "length");
                v33 = v32;

                v34 = objc_msgSend(v18, "charRangeMappedToStorage:", v25, v27);
                v36 = v35;
                if (objc_msgSend(v33, "length"))
                {
                  objc_msgSend(v47, "addObject:", v33);
                  -[CRLWPMutableRangeArray concatenateRange:](v19, "concatenateRange:", v34, v36);
                }

              }
            }
          }
        }
        while ((uint64_t)v22 > 0);
      }
      if (sub_100172390((uint64_t)v50))
        break;
      sub_100172100((uint64_t)v50);

    }
    if (-[CRLWPRangeArray rangeCount](v19, "rangeCount"))
    {
      objc_msgSend(v42, "openGroup");
      objc_msgSend(v42, "setCurrentGroupActionString:", v41);
      for (i = 0; i < -[CRLWPRangeArray rangeCount](v19, "rangeCount"); ++i)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", i));
        v39 = -[CRLWPRangeArray rangeAtIndex:](v19, "rangeAtIndex:", i);
        -[CRLWPEditorHelper replaceRange:withText:](v43, "replaceRange:withText:", v39, v40, v38);

      }
      objc_msgSend(v42, "closeGroup");
    }

    sub_100171FA4(v50);
    v6 = v41;
  }

}

- (void)uppercaseWord:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Make Upper Case"), 0, CFSTR("UndoStrings")));
  -[CRLWPEditorHelper p_transformWordWithActionString:usingBlock:](self, "p_transformWordWithActionString:usingBlock:", v4, &stru_10124EAD0);

}

- (void)lowercaseWord:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Make Lower Case"), 0, CFSTR("UndoStrings")));
  -[CRLWPEditorHelper p_transformWordWithActionString:usingBlock:](self, "p_transformWordWithActionString:usingBlock:", v4, &stru_10124EAF0);

}

- (void)capitalizeWord:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Capitalize"), 0, CFSTR("UndoStrings")));
  -[CRLWPEditorHelper p_transformWordWithActionString:usingBlock:](self, "p_transformWordWithActionString:usingBlock:", v4, &stru_10124EB10);

}

- (unint64_t)getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  void *v33;
  void *v34;
  int64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  char *v41;
  BOOL v42;
  BOOL v43;
  _BOOL4 v44;
  int v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v59;
  uint64_t v60;
  int v61;
  void *__p;
  _BYTE *v63;
  __int128 v64;
  char v65[16];
  char *v66;
  unsigned __int8 v67;
  int v68;
  char *v69;
  unsigned __int8 v70;
  int v71;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v8, "layoutIfNeeded");

  if (!objc_msgSend(v7, "isInsertionPoint") || (objc_msgSend(v7, "isVisual") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EB30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1C084();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EB50);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualInsertionPointIndexForString:selection:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 5122, 0, "invalid selection type");

  }
  v12 = (char *)objc_msgSend(v7, "range");
  v13 = -[CRLWPEditorHelper p_lineFragmentWithCaretInfo:forSelection:](self, "p_lineFragmentWithCaretInfo:forSelection:", v65, v7);
  if (!v13)
    goto LABEL_107;
  if (!objc_msgSend(v7, "isInsertionPoint"))
    goto LABEL_107;
  if (!objc_msgSend(v7, "isVisual"))
    goto LABEL_107;
  v14 = v13[3];
  if ((v14 & 0x4000) != 0)
    goto LABEL_107;
  if (v14 < 0)
    v15 = &xmmword_100EEE418;
  else
    v15 = (__int128 *)v13;
  v60 = *((_QWORD *)v15 + 1);
  if (objc_msgSend(v6, "length", *(_QWORD *)v15))
    v61 = sub_1001B0EFC((UChar32)objc_msgSend(v6, "crlwp_utf32CharacterAtIndex:", 0));
  else
    v61 = 6;
  v64 = xmmword_100EEE418;
  v16 = (unint64_t)v66;
  if (v66 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storage"));
    v19 = v16 < (unint64_t)objc_msgSend(v18, "length");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storage"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v66, 6, &v64));

      if (v22)
      {
        if ((*((_BYTE *)v13 + 25) & 0x10) != 0)
        {
LABEL_26:
          v12 = (char *)v64;

          goto LABEL_107;
        }
LABEL_30:
        v26 = *((_QWORD *)&v64 + 1);
        v25 = v64;

        v12 = (char *)(v26 + v25);
        goto LABEL_107;
      }
    }
  }
  if (v69 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "storage"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v69, 6, &v64));

    if (v22)
    {
      if ((*((_BYTE *)v13 + 25) & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_30;
    }
  }
  if (v68 == v71)
    goto LABEL_107;
  v27 = v60 + (v14 << 52 >> 63);
  if (v61 == v68)
  {
    v12 = v66;
    if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = v27 & (v14 << 51 >> 63);
LABEL_40:
      v12 = (char *)(v28 + v59);
      goto LABEL_107;
    }
    if (!v67)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "storage"));
      v12 = (char *)objc_msgSend(v30, "nextCharacterIndex:", v66);

    }
    goto LABEL_107;
  }
  if (v61 != v71)
  {
    if ((v61 - 1) >= 3)
    {
      if (sub_1001B2A58())
        v31 = 2;
      else
        v31 = 1;
      v61 = v31;
    }
    sub_1001469CC((uint64_t)v13, &__p);
    if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = 0;
    }
    else
    {
      v35 = v63 - (_BYTE *)__p;
      if (v63 == __p)
        goto LABEL_69;
      v36 = 0;
      v37 = v35 / 40;
      v42 = v35 / 40 != 0;
      v38 = v35 / 40 - 1;
      if (v38 == 0 || !v42)
        v37 = 1;
      v39 = (char *)__p + 24;
      while (1)
      {
        v40 = *(v39 - 1);
        v42 = (unint64_t)v66 >= v40;
        v41 = &v66[-v40];
        v42 = !v42 || (unint64_t)v41 >= *v39;
        if (!v42)
          break;
        v39 += 5;
        if (v37 == ++v36)
        {
          v36 = v37;
          break;
        }
      }
      v32 = v36 + 1;
      if (v36 == 0x7FFFFFFFFFFFFFFELL || v36 >= v38)
        goto LABEL_69;
    }
    if (*((_BYTE *)__p + 40 * v32 + 33))
      v43 = v61 == 2;
    else
      v43 = 0;
    if (v43)
    {
      if (v69 == *((char **)__p + 5 * v32 + 2))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "storage"));
        v12 = (char *)objc_msgSend(v48, "nextCharacterIndex:", *((_QWORD *)__p + 5 * v32 + 1));

        goto LABEL_105;
      }
      goto LABEL_75;
    }
LABEL_69:
    if (v61 != 2)
    {
      if (v61 != 3)
      {
        v46 = v67 == 0;
        v44 = v70 == 0;
        v45 = 1;
        goto LABEL_87;
      }
      if (!(v67 | v70))
      {
        v44 = 1;
        v45 = 1;
        v46 = 1;
        goto LABEL_87;
      }
      v49 = sub_1001B2A58();
LABEL_78:
      v45 = !v49;
      v46 = v67 == 0;
      if (v49 && v67)
      {
        if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
          v12 = (char *)((v27 & (v14 << 51 >> 63)) + v59);
        else
          v12 = v66;
        goto LABEL_105;
      }
      v44 = v70 == 0;
      if (v70)
        v50 = !v49;
      else
        v50 = 1;
      if ((v50 & 1) == 0)
      {
        if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          if ((v14 & 0x1000) != 0)
            v51 = 0;
          else
            v51 = v60 + (v14 << 52 >> 63);
          goto LABEL_102;
        }
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "storage"));
        v12 = (char *)objc_msgSend(v57, "nextCharacterIndex:", v69);

LABEL_105:
        if (__p)
        {
          v63 = __p;
          operator delete(__p);
        }
        goto LABEL_107;
      }
LABEL_87:
      if (!v45 || !v46)
      {
        if ((v45 & v44) == 1)
        {
          if ((v14 & 0x1000) != 0)
            v52 = 0;
          else
            v52 = v60 + (v14 << 52 >> 63);
          v53 = (char *)(v52 + v59);
          if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL)
            v12 = v53;
          else
            v12 = v69;
        }
        goto LABEL_105;
      }
      if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v51 = v27 & (v14 << 51 >> 63);
LABEL_102:
        v12 = (char *)(v51 + v59);
        goto LABEL_105;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "storage"));
      v12 = (char *)objc_msgSend(v55, "nextCharacterIndex:", v66);

      goto LABEL_105;
    }
LABEL_75:
    v49 = 1;
    goto LABEL_78;
  }
  v12 = v69;
  if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v14 & 0x1000) != 0)
      v28 = 0;
    else
      v28 = v60 + (v14 << 52 >> 63);
    goto LABEL_40;
  }
  if (v70)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper editor](self, "editor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "storage"));
    v12 = (char *)objc_msgSend(v34, "nextCharacterIndex:", v69);

  }
LABEL_107:

  return (unint64_t)v12;
}

- (BOOL)p_setVisualSelectionWithCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 andAnchor:(unint64_t)a5 andAnchorLeadingEdge:(BOOL)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL8 v10;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  char v37;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = a6;
    v10 = a4;
    v37 = 1;
    *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform12CRLWPStorage, a2).n128_u64[0];
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v13));
    v17 = sub_100221D0C(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", a5, 0, 7, v8, v18));

    *(_QWORD *)&v21 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v20).n128_u64[0];
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource", v21));
    v25 = sub_100221D0C(v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", a3, 0, 7, v10, v26));

    v28 = -[CRLWPEditorHelper adjustVisualSelection:withOtherSelection:outLeadingEdge:outCaretAffinity:](self, "adjustVisualSelection:withOtherSelection:outLeadingEdge:outCaretAffinity:", v19, v27, &v37, 0);
    v30 = v28;
    v31 = v29;
    if (v28 == (id)0x7FFFFFFFFFFFFFFFLL && !v29)
    {
      if (a3 <= a5)
        v32 = a5;
      else
        v32 = a3;
      if (a3 >= a5)
        v30 = (id)a5;
      else
        v30 = (id)a3;
      v31 = v32 - (_QWORD)v30;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v7 = v30 != objc_msgSend(v33, "range") || v31 != v34;

    if (v7)
      -[CRLWPEditorHelper setVisualSelectionWithRange:endOfLine:](self, "setVisualSelectionWithRange:endOfLine:", v30, v31, 0);
    -[CRLWPEditorHelper setSelectionAnchor:](self, "setSelectionAnchor:", a5);
    -[CRLWPEditorHelper setSelectionAnchorEdge:](self, "setSelectionAnchorEdge:", v8);

  }
  return v7;
}

- (BOOL)p_setSelectionWithCharIndex:(unint64_t)a3 andAnchor:(unint64_t)a4
{
  _BOOL4 v5;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if (a3 <= a4)
      v8 = a4;
    else
      v8 = a3;
    if (a3 >= a4)
      v9 = (id)a4;
    else
      v9 = (id)a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
    v12 = v8 - (_QWORD)v9;
    v5 = v9 != objc_msgSend(v10, "range") || v12 != v11;

    if (v5)
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9, v12, 0);
    -[CRLWPEditorHelper setSelectionAnchor:](self, "setSelectionAnchor:", a4);
    -[CRLWPEditorHelper setSelectionAnchorEdge:](self, "setSelectionAnchorEdge:", 1);
  }
  return v5;
}

- (unint64_t)p_oppositeEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[7];
  unsigned __int8 v20;
  _QWORD v21[7];
  unsigned __int8 v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  __n128 (*v34)(__n128 *, __n128 *);
  uint64_t (*v35)();
  void *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  __n128 (*v41)(__n128 *, __n128 *);
  uint64_t (*v42)();
  void *v43;
  __int128 v44;
  unsigned __int8 v45;
  unsigned __int8 v46[9];

  v6 = a3;
  v46[0] = objc_msgSend(v6, "leadingEdge");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
  v8 = objc_msgSend(v7, "leadingEdge");

  v45 = v8;
  v9 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v6, v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
  v11 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v10, &v45);

  v38 = 0;
  v39 = &v38;
  v40 = 0x4012000000;
  v41 = sub_1002D9038;
  v42 = nullsub_38;
  v43 = &unk_1010E66AB;
  v44 = xmmword_100EEE418;
  v31 = 0;
  v32 = &v31;
  v33 = 0x4012000000;
  v34 = sub_1002D9038;
  v35 = nullsub_38;
  v36 = &unk_1010E66AB;
  v37 = xmmword_100EEE418;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0x7FF8000000000000;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0x7FF8000000000000;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002E7BCC;
  v21[3] = &unk_10124EB78;
  v21[4] = &v38;
  v21[5] = &v27;
  v21[6] = v9;
  v22 = v46[0];
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v9, 0, v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002E7C38;
  v19[3] = &unk_10124EB78;
  v19[4] = &v31;
  v19[5] = &v23;
  v19[6] = v11;
  v20 = v45;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v11, 0, v19);
  v13 = v39[6];
  v12 = v39[7];
  if (__PAIR128__(v12, v13) == *((_OWORD *)v32 + 3) && (v13 != 0x7FFFFFFFFFFFFFFFLL || v12))
  {
    if (v28[3] == v24[3])
    {
      v17 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v6, a4);
LABEL_12:
      v9 = (unint64_t)v17;
      goto LABEL_13;
    }
  }
  else if (v13 == 0x7FFFFFFFFFFFFFFFLL && !v12)
  {
    *a4 = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper anchorSelection](self, "anchorSelection"));
    v15 = objc_msgSend(v14, "start");
    v16 = objc_msgSend(v6, "start");

    if (v15 == v16)
      v17 = objc_msgSend(v6, "end");
    else
      v17 = objc_msgSend(v6, "start");
    goto LABEL_12;
  }
  *a4 = v46[0];
LABEL_13:
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v38, 8);

  return v9;
}

- (unint64_t)forwardSelectionEdge
{
  uint64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  return -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 0, &v3);
}

- (unint64_t)backwardSelectionEdge
{
  uint64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  return -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 1, &v3);
}

- (unint64_t)forwardSelectionAnchor
{
  unint64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 0, &v3);
  return v3;
}

- (unint64_t)backwardSelectionAnchor
{
  unint64_t v3;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:](self, "p_selectionEdgeToMutateWithDirection:newAnchor:", 1, &v3);
  return v3;
}

- (unint64_t)p_selectionEdgeToMutateWithDirection:(int64_t)a3 newAnchor:(unint64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t *v16;
  BOOL v17;
  char *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  BOOL v42;
  unsigned __int8 v44;
  unsigned __int8 v45;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EB98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1C21C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EBB8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 5379, 0, "invalid nil value for '%{public}s'", "selection");

  }
  v10 = (char *)objc_msgSend(v6, "superRange");
  v12 = v11;
  v45 = objc_msgSend(v6, "leadingEdge");
  v44 = objc_msgSend(v6, "leadingEdge");
  v13 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v6, &v45);
  v14 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v6, &v44);
  if (-[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  if (-[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"))
  {
    v18 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
    v18 = (char *)objc_msgSend(v19, "nextCharacterIndex:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"));

  }
  if ((unint64_t)a3 > 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EBD8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1C190();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124EBF8);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 5415, 0, "illegal text direction: %ld", a3);

  }
  else
  {
    if (((1 << a3) & 0x33) != 0)
    {
      if (v18 == v10)
      {
LABEL_22:
        v14 = (unint64_t)&v10[v12];
        *a4 = (unint64_t)v10;
        goto LABEL_42;
      }
      if (v18 == &v10[v12])
      {
LABEL_32:
        *a4 = (unint64_t)&v10[v12];
        v14 = (unint64_t)v10;
        goto LABEL_42;
      }
      goto LABEL_12;
    }
    if (v44)
    {
      if (v18 == (char *)v14)
        goto LABEL_25;
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v40 = v18 == objc_msgSend(v39, "nextCharacterIndex:", v14);

      if (v40)
      {
LABEL_25:
        v20 = v45;
        v16 = a4;
        *a4 = v14;
        v17 = v44 != 0;
        v14 = v13;
        if (!v20)
        {
LABEL_26:
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v22 = objc_msgSend(v21, "range");
          v24 = v14 < (unint64_t)v22 + v23;

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
            v14 = (unint64_t)objc_msgSend(v25, "nextCharacterIndex:", v14);

          }
          v16 = a4;
          if (v17)
            goto LABEL_42;
LABEL_29:
          v26 = *v16;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v28 = objc_msgSend(v27, "range");
          v30 = v26 < (unint64_t)v28 + v29;

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
            *a4 = (unint64_t)objc_msgSend(v31, "nextCharacterIndex:", *a4);

          }
          goto LABEL_42;
        }
LABEL_14:
        if (v17)
          goto LABEL_42;
        goto LABEL_29;
      }
    }
    if (v45)
    {
      if (v18 == (char *)v13)
        goto LABEL_13;
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
      v42 = v18 == objc_msgSend(v41, "nextCharacterIndex:", v13);

      if (v42)
      {
LABEL_13:
        v15 = v44;
        v16 = a4;
        *a4 = v13;
        v17 = v45 != 0;
        if (!v15)
          goto LABEL_26;
        goto LABEL_14;
      }
    }
  }
LABEL_12:
  switch(a3)
  {
    case 0:
    case 5:
      goto LABEL_22;
    case 1:
    case 4:
      goto LABEL_32;
    case 2:
      goto LABEL_25;
    case 3:
      goto LABEL_13;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124EC18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1C104();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124EC38);
      v32 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 5450, 0, "illegal text direction: %ld", a3);

      v14 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
LABEL_42:

  return v14;
}

- (unint64_t)p_selectionEdgeToMutateWithLeadingEdge:(BOOL *)a3 Direction:(int64_t)a4 newAnchor:(unint64_t *)a5 anchorLeadingEdge:(BOOL *)a6
{
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper selection](self, "selection"));
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "range");
    v38 = v14;
    v15 = (unint64_t)v13;
    v40 = objc_msgSend(v12, "leadingEdge");
    v39 = objc_msgSend(v12, "leadingEdge");
    v16 = -[CRLWPEditorHelper p_rightEdgeForSelection:withLeadingEdge:](self, "p_rightEdgeForSelection:withLeadingEdge:", v12, &v40);
    v37 = -[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:](self, "p_leftEdgeForSelection:withLeadingEdge:", v12, &v39);
    if (-[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((unint64_t)a4 > 5)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124ED18);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1C3C8();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124ED38);
        v27 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 5506, 0, "illegal text direction: %ld", a4);
LABEL_53:

        goto LABEL_54;
      }
      if (((1 << a4) & 0x33) != 0)
      {
        if (-[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"))
        {
          v17 = -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor");
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditorHelper textSource](self, "textSource"));
          v17 = objc_msgSend(v26, "nextCharacterIndex:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"));

        }
        if (v17 == (id)v15)
        {
          *a3 = 1;
LABEL_55:
          v16 = v15 + v38;
          *a5 = v15;
          goto LABEL_70;
        }
        if (v17 == (id)(v15 + v38))
        {
          *a3 = 1;
LABEL_56:
          *a5 = v15 + v38;
          v16 = v15;
          goto LABEL_70;
        }
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124EC98);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1C454();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124ECB8);
        v30 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 5487, 0, "Invalid selection anchor");
        goto LABEL_53;
      }
      v21 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"), -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"));
      if (v21 != (void *)-[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v37, v39))
      {
        v22 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"), -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"));
        if (v22 != (void *)-[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v16, v40))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124ECD8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E1C4D4();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124ECF8);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v24, 5497, 0, "Invalid selection anchor");

        }
      }
      v25 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"), -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"));
      if (v25 == (void *)-[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v37, v39))
      {
        *a3 = 1;
LABEL_57:
        *a3 = v40;
        *a5 = v37;
        *a6 = v39;
        goto LABEL_70;
      }
      v34 = -[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", -[CRLWPEditorHelper selectionAnchor](self, "selectionAnchor"), -[CRLWPEditorHelper selectionAnchorEdge](self, "selectionAnchorEdge"));
      if (v34 == (void *)-[CRLWPEditorHelper p_layoutIndexForCharIndex:leadingEdge:](self, "p_layoutIndexForCharIndex:leadingEdge:", v16, v40))
      {
        *a3 = 1;
LABEL_69:
        *a3 = v39;
        *a5 = v16;
        *a6 = v40;
        v16 = v37;
        goto LABEL_70;
      }
    }
LABEL_54:
    *a3 = 1;
    switch(a4)
    {
      case 0:
      case 5:
        goto LABEL_55;
      case 1:
      case 4:
        goto LABEL_56;
      case 2:
        goto LABEL_57;
      case 3:
        goto LABEL_69;
      default:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124ED58);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1C33C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124ED78);
        v31 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 5540, 0, "illegal text direction: %ld", a4);

        goto LABEL_16;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124EC58);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E1C2AC();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124EC78);
  v18 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 5469, 0, "invalid nil value for '%{public}s'", "selection");

LABEL_16:
  v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_70:

  return v16;
}

- (int64_t)p_layoutIndexForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  const void *v9;
  _QWORD v11[5];

  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[3] = v4;
    v11[4] = v5;
    v7 = a4;
    v8 = a3;
    v11[0] = 0;
    v9 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", a3, v11, 0);
    if (v9)
      return sub_100146004((uint64_t)v9, v8, v7);
    return v8;
  }
  return v6;
}

- (unint64_t)p_indexToTransposableCharacterStartingAtIndex:(unint64_t)a3 filterStorage:(id)a4 searchTowardsStorageStart:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  while (objc_msgSend(v7, "characterAtIndex:", a3) == 65532)
  {
    if (a3 || !v5)
    {
      v8 = v5 ? objc_msgSend(v7, "previousCharacterIndex:", a3) : objc_msgSend(v7, "nextCharacterIndex:", a3);
      a3 = (unint64_t)v8;
      if (v8 < objc_msgSend(v7, "length"))
        continue;
    }
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    break;
  }

  return a3;
}

- (_TtC8Freeform11CRLWPEditor)editor
{
  return (_TtC8Freeform11CRLWPEditor *)objc_loadWeakRetained((id *)&self->_editor);
}

- (void)setEditor:(id)a3
{
  objc_storeWeak((id *)&self->_editor, a3);
}

- (CRLWPSelection)anchorSelection
{
  return self->_anchorSelection;
}

- (void)setAnchorSelection:(id)a3
{
  objc_storeStrong((id *)&self->_anchorSelection, a3);
}

- (unint64_t)selectionAnchor
{
  return self->_selectionAnchor;
}

- (void)setSelectionAnchor:(unint64_t)a3
{
  self->_selectionAnchor = a3;
}

- (BOOL)selectionAnchorEdge
{
  return self->_selectionAnchorEdge;
}

- (void)setSelectionAnchorEdge:(BOOL)a3
{
  self->_selectionAnchorEdge = a3;
}

- (BOOL)selectionLastModifiedWithKeyboard
{
  return self->_selectionLastModifiedWithKeyboard;
}

- (void)setSelectionLastModifiedWithKeyboard:(BOOL)a3
{
  self->_selectionLastModifiedWithKeyboard = a3;
}

- (_NSRange)emacsMarkRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_emacsMarkRange.length;
  location = self->_emacsMarkRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEmacsMarkRange:(_NSRange)a3
{
  self->_emacsMarkRange = a3;
}

- (BOOL)continueKillRing
{
  return self->_continueKillRing;
}

- (void)setContinueKillRing:(BOOL)a3
{
  self->_continueKillRing = a3;
}

- (void)setTextSource:(id)a3
{
  objc_storeStrong((id *)&self->_textSource, a3);
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveCanvasController, a3);
}

- (NSMutableDictionary)autocorrectedEntries
{
  return self->_autocorrectedEntries;
}

- (void)setAutocorrectedEntries:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectedEntries, a3);
}

- (unint64_t)lastChangedCharIndex
{
  return self->_lastChangedCharIndex;
}

- (void)setLastChangedCharIndex:(unint64_t)a3
{
  self->_lastChangedCharIndex = a3;
}

- (unint64_t)correctionCharIndexToIgnoreHUD
{
  return self->_correctionCharIndexToIgnoreHUD;
}

- (void)setCorrectionCharIndexToIgnoreHUD:(unint64_t)a3
{
  self->_correctionCharIndexToIgnoreHUD = a3;
}

- (_NSRange)lastAutocorrectionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lastAutocorrectionRange.length;
  location = self->_lastAutocorrectionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastAutocorrectionRange:(_NSRange)a3
{
  self->_lastAutocorrectionRange = a3;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_autocorrectedEntries, 0);
  objc_storeStrong((id *)&self->_interactiveCanvasController, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_anchorSelection, 0);
  objc_destroyWeak((id *)&self->_editor);
}

@end
