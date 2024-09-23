@implementation __NSTextListElementEditedRangeValidator

- (_NSRange)adjustedInvalidationRangeForRange:(_NSRange)a3 limitRange:(_NSRange)a4 textContentStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  NSRange v16;
  NSRange v17;
  _NSRange result;
  NSRange v19;
  NSRange v20;

  length = a4.length;
  location = a4.location;
  v7 = a3.length;
  v8 = a3.location;
  v9 = (void *)objc_msgSend(a5, "attributedString");
  if (v8 < objc_msgSend(v9, "length"))
  {
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v8, 0), "textLists"), "firstObject");
    if (v10)
    {
      v11 = objc_msgSend(v9, "rangeOfTextList:atIndex:", v10, v8);
      if (v12)
      {
        v19.location = v11;
        v19.length = v12;
        v16.location = v8;
        v16.length = v7;
        v20 = NSUnionRange(v16, v19);
        v17.location = location;
        v17.length = length;
        v13 = NSIntersectionRange(v17, v20);
        v8 = v13.location;
        v7 = v13.length;
      }
    }
  }
  v14 = v8;
  v15 = v7;
  result.length = v15;
  result.location = v14;
  return result;
}

@end
