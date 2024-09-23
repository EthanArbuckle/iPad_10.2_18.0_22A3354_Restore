@implementation THFlowBodyLayout

- (BOOL)isLaidOut
{
  return -[NSMutableArray count](-[THBodyLayout columns](self, "columns"), "count") != 0;
}

- (THFlowBodyLayout)layoutWithLayoutManager:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  id location;
  double v8;
  double v9;
  uint64_t v10;
  float v11;

  length = a4.length;
  location = (id)a4.location;
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowBodyLayout layoutWithLayoutManager:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"), 42, CFSTR("invalid nil value for '%s'"), "layoutManager");
  if (!-[THFlowBodyLayout info](self, "info"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowBodyLayout layoutWithLayoutManager:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"), 43, CFSTR("invalid nil value for '%s'"), "self.info");
  if (!-[THFlowBodyLayout isLaidOut](self, "isLaidOut"))
    -[THBodyLayout createColumns](self, "createColumns");
  objc_msgSend(a3, "layoutIntoTarget:withRange:", self, location, length);
  v9 = v8;
  if (location != -[THBodyLayout columnRange](self, "columnRange") || length != v10)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowBodyLayout layoutWithLayoutManager:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"), 51, CFSTR("body contains the wrong range"));
  if (!-[THFlowBodyLayout isLaidOut](self, "isLaidOut"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowBodyLayout layoutWithLayoutManager:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowBodyLayout.mm"), 53, CFSTR("body should be laid out after laying out"));
  v11 = v9;
  -[THFlowBodyLayout setTextHeight:](self, "setTextHeight:", ceilf(v11));
  return (THFlowBodyLayout *)-[THBodyLayout invalidateSize](self, "invalidateSize");
}

- (_NSRange)expandedRangeForLayoutRange:(_NSRange)a3 styleProvider:(id)a4
{
  NSUInteger location;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  id v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger length;
  NSUInteger v53;
  _QWORD v54[2];
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = objc_msgSend(-[THFlowBodyLayout info](self, "info"), "bodyStorage");
  v8 = v6;
  if (location)
    v9 = (uint64_t)objc_msgSend(v6, "paragraphIndexAtCharIndex:", location - 1);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v10 = length;
    v11 = location + length;
    v12 = location;
  }
  else
  {
    v13 = 0;
    while (1)
    {
      v14 = objc_msgSend(a4, "paragraphStyleAtParIndex:effectiveRange:", v9, v54);
      v15 = objc_opt_class(TSWPDropCap);
      v7 = TSUDynamicCast(v15, objc_msgSend(v14, "objectForProperty:", 109)).n128_u64[0];
      v16 = v54[0];
      if (v17)
        break;
      if (objc_msgSend(v8, "characterAtIndex:", v54[0], *(double *)&v7) != 65532
        || (v18 = objc_opt_class(TSWPDrawableAttachment),
            v7 = TSUDynamicCast(v18, objc_msgSend(v8, "attachmentAtCharIndex:", v16)).n128_u64[0],
            !v19)
        || (v20 = v19,
            v21 = objc_opt_class(THWAnchoredWidgetInfo),
            v7 = TSUDynamicCast(v21, objc_msgSend(v20, "drawable")).n128_u64[0],
            !v22))
      {
        if (v9)
          --v9;
        else
          v9 = 0x7FFFFFFFFFFFFFFFLL;
        if (v9 != 0x7FFFFFFFFFFFFFFFLL && v13 <= 3)
        {
          ++v13;
          if (location - v16 < 0x800)
            continue;
        }
      }
      goto LABEL_5;
    }
    v11 = location + length;
    if (v54[0] <= location + length)
      v23 = location + length;
    else
      v23 = v54[0];
    if (v54[0] >= location + length)
      v12 = location + length;
    else
      v12 = v54[0];
    v10 = v23 - v12;
  }
  v24 = objc_msgSend(v8, "length", *(double *)&v7);
  if (v11)
  {
    v25 = (unint64_t)v24;
    v26 = (char *)objc_msgSend(v8, "paragraphIndexAtCharIndex:", v11 - 1);
    if (v26 != (char *)0x7FFFFFFFFFFFFFFFLL && v11 >= location)
    {
      v28 = v26;
      v51 = v12;
      v53 = v10;
      v29 = 0;
      v30 = v11;
      while (1)
      {
        if (v30 < v25 && objc_msgSend(v8, "characterAtIndex:", v30) == 65532)
        {
          v31 = objc_opt_class(TSWPDrawableAttachment);
          v27 = TSUDynamicCast(v31, objc_msgSend(v8, "attachmentAtCharIndex:", v30)).n128_u64[0];
          if (v32)
          {
            v33 = v32;
            v34 = objc_opt_class(THWAnchoredWidgetInfo);
            v27 = TSUDynamicCast(v34, objc_msgSend(v33, "drawable")).n128_u64[0];
            if (v35)
              break;
          }
        }
        v36 = objc_msgSend(a4, "paragraphStyleAtParIndex:effectiveRange:", &v28[v29], v54, *(double *)&v27, v51);
        v37 = objc_opt_class(TSWPDropCap);
        v27 = TSUDynamicCast(v37, objc_msgSend(v36, "objectForProperty:", 109)).n128_u64[0];
        v30 = v54[0];
        if (v38)
        {
          if (v11 < v25)
          {
            v39 = (char *)objc_msgSend(v8, "paragraphIndexAtCharIndex:", v11, *(double *)&v27);
            if (v39 != (char *)0x7FFFFFFFFFFFFFFFLL && (unint64_t)-v29 <= 4 && v11 - v30 <= 0x7FF)
            {
              v40 = v39;
              v41 = 0;
              v42 = 0x7FFFFFFFFFFFFFFELL - (_QWORD)v39;
              v43 = -v29;
              do
              {
                v54[0] = objc_msgSend(v8, "textRangeForParagraphAtIndex:", &v40[v41]);
                v54[1] = v44;
                v11 = v54[0] + v44;
                if (v54[0] + v44 >= v25 || v42 == v41 || (unint64_t)(v43 + v41) > 3)
                  break;
                ++v41;
              }
              while (v11 - v30 < 0x800);
            }
          }
          v12 = v51;
          v47 = v53 + v51;
          if (v53 + v51 <= v11)
            v47 = v11;
          goto LABEL_52;
        }
        if (((unint64_t)&v28[v29] & 0x7FFFFFFFFFFFFFFFLL) != 0)
        {
          --v29;
          if (v54[0] >= location)
            continue;
        }
        v12 = v51;
        v10 = v53;
        goto LABEL_58;
      }
      v12 = v51;
      v47 = v53 + v51;
      if (v53 + v51 <= v30)
        v47 = v30;
LABEL_52:
      if (v12 <= v47)
        v48 = v47;
      else
        v48 = v12;
      if (v12 >= v47)
        v12 = v47;
      v10 = v48 - v12;
    }
  }
LABEL_58:
  v49 = v12;
  v50 = v10;
  result.length = v50;
  result.location = v49;
  return result;
}

- (BOOL)usesInflation
{
  return 0;
}

- (unsigned)autosizeFlags
{
  return 3;
}

- (id)previousTargetLastColumn
{
  return 0;
}

- (id)nextTargetFirstColumn
{
  return 0;
}

- (id)nextTargetFirstChildHint
{
  return 0;
}

- (double)textHeight
{
  return self->mTextHeight;
}

- (void)setTextHeight:(double)a3
{
  self->mTextHeight = a3;
}

- (unsigned)bodyIndex
{
  return self->mBodyIndex;
}

- (void)setBodyIndex:(unsigned int)a3
{
  self->mBodyIndex = a3;
}

@end
