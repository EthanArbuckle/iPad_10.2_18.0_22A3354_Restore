@implementation BEAXWebContentUtilities

+ (id)sharedUtilities
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E4B4;
  block[3] = &unk_20888;
  block[4] = a1;
  if (qword_27190 != -1)
    dispatch_once(&qword_27190, block);
  return (id)qword_27198;
}

+ (void)setWebProcessPlugin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedUtilities"));
  objc_msgSend(v5, "setWebProcessPlugin:", v4);

}

+ (_NSRange)lineRangeForCharacterPosition:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6;
  void *v7;
  _BYTE *v8;
  id v9;
  id v10;
  uint64_t v11;
  char *v12;
  void *i;
  void *v14;
  char *v15;
  uint64_t v16;
  NSUInteger v17;
  _BYTE *v18;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _NSRange result;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v6));
  v8 = objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v6);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    v12 = &v8[a3];
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v15 = (char *)objc_msgSend(v14, "rangeInChapter", (_QWORD)v22);
        if (v12 <= &v15[v16])
        {
          v18 = objc_msgSend(v14, "rangeInChapter");
          v10 = v19;
          v17 = v18 - v8;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  v20 = v17;
  v21 = (NSUInteger)v10;
  result.length = v21;
  result.location = v20;
  return result;
}

+ (_NSRange)lineRangeForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6;
  void *v7;
  _BYTE *v8;
  id v9;
  unint64_t v10;
  void *v11;
  _BYTE *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v6));
  v8 = objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v6);
  v9 = objc_msgSend(a1, "visibleLinesForBookContentElement:", v6);

  v10 = (unint64_t)v9 + a3;
  if (v10 >= (unint64_t)objc_msgSend(v7, "count"))
  {
    v14 = 0;
    v15 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v10));
    v12 = objc_msgSend(v11, "rangeInChapter");
    v14 = v13;

    v15 = v12 - v8;
  }

  v16 = v15;
  v17 = v14;
  result.length = v17;
  result.location = v16;
  return result;
}

+ (_NSRange)selectedTextRangeForBookContentElement:(id)a3
{
  id v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "elementTextRange") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "elementTextRange");
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  v7 = (NSUInteger)v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)attributedValueForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "attributedStringForRange:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributedStringForRange:", (char *)objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v7) + location, length));
  else
    v8 = 0;

  return v8;
}

+ (id)stringForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if ((objc_opt_respondsToSelector(v7, "stringForRange:") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForRange:", (char *)objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v7) + location, length));
  else
    v8 = 0;

  return v8;
}

+ (id)attributedValueForBookContentElement:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "attributedStringForElement") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributedStringForElement"));
  else
    v4 = 0;

  return v4;
}

+ (CGRect)frameForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6;
  char *v7;
  void *v8;
  void *v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v6 = a4;
  v7 = (char *)objc_msgSend(a1, "visibleLinesForBookContentElement:", v6) + a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v6));

  if (v7 >= objc_msgSend(v8, "count"))
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
    objc_msgSend(v9, "frameInScreenCoordinates");
    x = v10;
    y = v12;
    width = v14;
    height = v16;

  }
  +[BEAXLineInfo subtractOffsetForPoint:](BEAXLineInfo, "subtractOffsetForPoint:", x, y);
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)frameForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  objc_msgSend(v7, "baxBoundsForRange:", (char *)objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v7) + location, length);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (_NSRange)chapterRangeForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  char *v5;
  NSUInteger v6;
  _NSRange result;

  length = a3.length;
  v5 = (char *)objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", a4) + a3.location;
  v6 = length;
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

+ (id)attributedPageContentForBookContentElement:(id)a3
{
  return objc_msgSend(a1, "visiblePageContentForBookContentElement:", a3);
}

+ (int64_t)lineNumberForPoint:(CGPoint)a3 forBookContentElement:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double MinY;
  void *v28;
  char *v29;
  double v30;
  double v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  int64_t v43;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  CGPoint v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", x, y);
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v7));
  v13 = (uint64_t)objc_msgSend(a1, "visibleLinesForBookContentElement:", v7);
  v45 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v46 = v13;
  if (objc_msgSend(v12, "count"))
  {
    v16 = 0;
    v17 = -v13;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    v19 = 1.79769313e308;
    v47 = v9;
    v48 = v11;
    while (1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v16));
      objc_msgSend(v20, "frameInScreenCoordinates");
      v21 = v65.origin.x;
      v22 = v65.origin.y;
      width = v65.size.width;
      height = v65.size.height;
      v64.x = v9;
      v64.y = v11;
      if (CGRectContainsPoint(v65, v64))
        break;
      objc_msgSend(v20, "frameInScreenCoordinates");
      MidX = CGRectGetMidX(v66);
      objc_msgSend(v20, "frameInScreenCoordinates");
      MidY = CGRectGetMidY(v67);
      objc_msgSend(v20, "frameInScreenCoordinates");
      MinY = CGRectGetMinY(v68);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
      v29 = (char *)objc_msgSend(v28, "bookLayout");

      if (v29 == (_BYTE *)&dword_0 + 3)
      {
        v69.origin.x = v21;
        v69.origin.y = v22;
        v69.size.width = width;
        v69.size.height = height;
        if (CGRectGetMinY(v69) <= v48)
        {
          v70.origin.x = v21;
          v70.origin.y = v22;
          v70.size.width = width;
          v70.size.height = height;
          if (v48 <= CGRectGetMaxY(v70))
            objc_msgSend(v15, "addIndex:", v16);
        }
        v30 = vabdd_f64(v48, MidY);
        objc_msgSend(v20, "frameInScreenCoordinates");
        MinY = CGRectGetMinX(v71);
        v9 = v47;
        v31 = v47;
      }
      else
      {
        v9 = v47;
        v30 = vabdd_f64(v47, MidX);
        v72.origin.x = v21;
        v72.origin.y = v22;
        v72.size.width = width;
        v72.size.height = height;
        if (CGRectGetMinX(v72) <= v47)
        {
          v73.origin.x = v21;
          v73.origin.y = v22;
          v73.size.width = width;
          v73.size.height = height;
          if (v47 <= CGRectGetMaxX(v73))
            objc_msgSend(v15, "addIndex:", v16);
        }
        v31 = v48;
      }
      v32 = v30 >= v19;
      if (MinY < 0.0)
        v32 = 1;
      if (MinY > v31)
        v32 = 1;
      if (!v32)
      {
        v18 = v17 + v16;
        v19 = v30;
      }

      ++v16;
      v11 = v48;
      if (v16 >= (unint64_t)objc_msgSend(v12, "count"))
        goto LABEL_23;
    }

    if (v46 + 0x7FFFFFFFFFFFFFFFLL != v16)
    {
      v43 = v16 - v46;
      goto LABEL_30;
    }
  }
  else
  {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_23:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  objc_msgSend(v33, "primaryVisibleContentRect");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0x7FFFFFFFFFFFFFFFLL;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_EE3C;
  v49[3] = &unk_208B0;
  v52 = v9;
  v53 = v11;
  v54 = v35;
  v55 = v37;
  v56 = v39;
  v57 = v41;
  v50 = v12;
  v51 = &v60;
  v58 = v46;
  v59 = v45;
  objc_msgSend(v15, "enumerateIndexesUsingBlock:", v49);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v42 = 0;
  else
    v42 = v18;
  if (v61[3] == 0x7FFFFFFFFFFFFFFFLL)
    v43 = v42;
  else
    v43 = v61[3];

  _Block_object_dispose(&v60, 8);
LABEL_30:

  return v43;
}

+ (id)attributedStringForLineNumber:(int64_t)a3 forBookContentElement:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v6));
  v8 = objc_msgSend(a1, "visibleLinesForBookContentElement:", v6);

  v9 = (unint64_t)v8 + a3;
  if (v9 >= (unint64_t)objc_msgSend(v7, "count"))
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attributedText"));

  }
  return v11;
}

+ (id)jsContext
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedUtilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "webProcessPlugin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultJSContext"));

  return v4;
}

+ (CGPoint)offset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.pageOffset()")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evaluateScript:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("xOffset")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("yOffset")));
  objc_msgSend(v7, "floatValue");
  v10 = v9;
  objc_msgSend(v8, "floatValue");
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (_NSRange)rangeFromBookContentElement:(id)a3
{
  id v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "elementTextRange") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "elementTextRange");
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  v7 = (NSUInteger)v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (void)setSelectedTextRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  if ((objc_opt_respondsToSelector(v6, "_accessibilitySetSelectedTextRange:") & 1) != 0)
    objc_msgSend(v6, "_accessibilitySetSelectedTextRange:", location, length);

}

+ (id)visiblePageContentForBookContentElement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baxStoredAttributedPageContent"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baxStoredAttributedPageContent")),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        !v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedStringForElement"));
    v10 = (char *)objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v4);
    v12 = v11;
    if (&v10[v11] <= objc_msgSend(v9, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributedSubstringFromRange:", v10, v12));
      objc_msgSend(v4, "baxSetStoredAttributedPageContent:", v13);

    }
    else
    {
      objc_msgSend(v4, "baxSetStoredAttributedPageContent:", 0);
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baxStoredAttributedPageContent"));

  return v14;
}

+ (void)toggleBookmark
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v2 = objc_msgSend(v3, "evaluateScript:", CFSTR("__ibooks_content_support.notifyNativeOfBookmarkPage()"));

}

+ (void)toggleControlsVisibility
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v2 = objc_msgSend(v3, "evaluateScript:", CFSTR("__ibooks_content_support.notifyNativeOfToggleControlsVisibility()"));

}

+ (void)turnPageWithDirection:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.notifyNativeOfPageTurn('%@')"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v5 = objc_msgSend(v4, "evaluateScript:", v6);

}

+ (void)checkCanPerformActions
{
  void *v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.checkNativeForOperations()")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v4 = objc_msgSend(v3, "evaluateScript:", v5);

}

+ (void)performNativeAction:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.performNativeOperation('%@')"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v5 = objc_msgSend(v4, "evaluateScript:", v6);

}

+ (BOOL)checkIfCurrentSelection
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.checkIfCurrentSelection()")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "evaluateScript:", v3));
  v6 = objc_msgSend(v5, "toBool");

  return v6;
}

+ (void)jsSetSelectionWithFrame:(CGRect)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_support.setSelectionForRange('%f, %f')"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(_QWORD *)&a3.origin.x, *(_QWORD *)&a3.origin.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "jsContext"));
  v5 = objc_msgSend(v4, "evaluateScript:", v6);

}

+ (_NSRange)visibleLinesForBookContentElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  NSUInteger v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  _NSRange result;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
  if (objc_msgSend(v5, "isFixedLayoutBook"))
  {
    objc_msgSend(v3, "accessibilityVisibleContentRect");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    objc_msgSend(v10, "primaryVisibleContentRect");
    v7 = v11;
    v9 = v12;

  }
  +[BEAXLineInfo addOffsetForPoint:](BEAXLineInfo, "addOffsetForPoint:", v7, v9);
  v13 = +[BEAXWebContentUtilities _visibleRangeWithRect:withLineInfos:](BEAXWebContentUtilities, "_visibleRangeWithRect:withLineInfos:", v4);
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
    if (objc_msgSend(v15, "isFixedLayoutBook"))
    {
      objc_msgSend(v3, "accessibilityVisibleContentRect");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"));
      objc_msgSend(v24, "secondaryVisibleContentRect");
      v17 = v25;
      v19 = v26;
      v21 = v27;
      v23 = v28;

    }
    v13 = +[BEAXWebContentUtilities _visibleRangeWithRect:withLineInfos:](BEAXWebContentUtilities, "_visibleRangeWithRect:withLineInfos:", v4, v17, v19, v21, v23);
  }
  v29 = (NSUInteger)v13;
  v30 = v14;

  v31 = v29;
  v32 = v30;
  result.length = v32;
  result.location = v31;
  return result;
}

+ (_NSRange)_visibleRangeWithRect:(CGRect)a3 withLineInfos:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  char *v9;
  _BYTE *v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = 0;
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v10));
      objc_msgSend(v12, "frameInScreenCoordinates");
      v22.origin.x = v13;
      v22.origin.y = v14;
      v22.size.width = v15;
      v22.size.height = v16;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      if (CGRectIntersectsRect(v21, v22))
      {
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          v17 = (uint64_t)v10;
        else
          v17 = v11;
      }
      else
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = &v10[-v11];

          v17 = v11;
          goto LABEL_14;
        }
      }
      if (v10 == (char *)objc_msgSend(v8, "count") - 1)
        v9 = (char *)objc_msgSend(v8, "count") - v17;

      ++v10;
      v11 = v17;
      if (v10 >= objc_msgSend(v8, "count"))
        goto LABEL_14;
    }
  }
  v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  v18 = v17;
  v19 = (NSUInteger)v9;
  result.length = v19;
  result.location = v18;
  return result;
}

+ (_NSRange)visibleTextRangeInChapterForBookContentElement:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v4 = a3;
  v5 = (char *)objc_msgSend(a1, "visibleLinesForBookContentElement:", v4);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BEAXLineInfo chapterLineInfosForElement:](BEAXLineInfo, "chapterLineInfosForElement:", v4));

  if (v5 < objc_msgSend(v8, "count") && (v9 = &v5[v7], &v5[v7] <= objc_msgSend(v8, "count")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v5));
    v10 = objc_msgSend(v12, "rangeInChapter");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 1));
    v14 = (char *)objc_msgSend(v13, "rangeInChapter");
    v16 = v15;

    v11 = &v14[v16 - (_QWORD)v10];
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v17 = (NSUInteger)v10;
  v18 = (NSUInteger)v11;
  result.length = v18;
  result.location = v17;
  return result;
}

+ (id)childElementForRange:(_NSRange)a3 forBookContentElement:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  char *v9;
  void *v10;
  char *v11;
  char *v12;
  NSUInteger v13;
  void *v14;
  NSUInteger v15;
  NSRange v18;
  NSRange v19;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = objc_msgSend(a1, "visibleTextRangeInChapterForBookContentElement:", v7);
  v9 = (char *)objc_msgSend(v7, "accessibilityElementCount");
  v10 = 0;
  v11 = v9 - 1;
  if ((uint64_t)v9 >= 1)
  {
    v12 = 0;
    v13 = (NSUInteger)v8 + location;
    do
    {
      v14 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityElementAtIndex:", v12));

      v19.location = (NSUInteger)objc_msgSend(v10, "elementTextRange");
      v19.length = v15;
      v18.location = v13;
      v18.length = length;
      if (NSIntersectionRange(v18, v19).length)
        break;
    }
    while (v11 != v12++);
  }

  return v10;
}

+ (id)attributedStringWithFixedAttachments:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = UIAccessibilityTokenAttachment;
  v6 = objc_msgSend(v4, "length");
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_FA60;
  v13 = &unk_208D8;
  v14 = v4;
  v15 = a1;
  v7 = v4;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0x100000, &v10);
  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (BookEPUBWebProcessPlugin)webProcessPlugin
{
  return (BookEPUBWebProcessPlugin *)objc_loadWeakRetained((id *)&self->_webProcessPlugin);
}

- (void)setWebProcessPlugin:(id)a3
{
  objc_storeWeak((id *)&self->_webProcessPlugin, a3);
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_destroyWeak((id *)&self->_webProcessPlugin);
}

@end
