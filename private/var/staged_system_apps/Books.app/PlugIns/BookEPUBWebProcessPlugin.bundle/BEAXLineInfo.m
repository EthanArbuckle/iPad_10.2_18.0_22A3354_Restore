@implementation BEAXLineInfo

- (BEAXLineInfo)initWithRange:(_NSRange)a3 frame:(CGRect)a4 attributedText:(id)a5 element:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  BEAXLineInfo *v17;
  BEAXLineInfo *v18;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v22;
  CGRect v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  length = a3.length;
  location = a3.location;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BEAXLineInfo;
  v17 = -[BEAXLineInfo init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    v17->_rangeInChapter.location = location;
    v17->_rangeInChapter.length = length;
    v17->_frameInScreenCoordinates.origin.x = x;
    v17->_frameInScreenCoordinates.origin.y = y;
    v17->_frameInScreenCoordinates.size.width = width;
    v17->_frameInScreenCoordinates.size.height = height;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MidX = CGRectGetMidX(v23);
    MidY = CGRectGetMidY(v18->_frameInScreenCoordinates);
    v18->_frameCenterPoint.x = MidX;
    v18->_frameCenterPoint.y = MidY;
    objc_storeStrong((id *)&v18->_attributedText, a5);
    objc_storeStrong((id *)&v18->_objectWrapperElement, a6);
  }

  return v18;
}

+ (CGPoint)addOffsetForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  +[BEAXWebContentUtilities offset](BEAXWebContentUtilities, "offset");
  v6 = x + v5;
  v8 = y + v7;
  result.y = v8;
  result.x = v6;
  return result;
}

+ (CGPoint)subtractOffsetForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  +[BEAXWebContentUtilities offset](BEAXWebContentUtilities, "offset");
  v6 = x - v5;
  v8 = y - v7;
  result.y = v8;
  result.x = v6;
  return result;
}

+ (id)chapterLineInfosForElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "baxBookContentElement"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baxStoredLineInfos"));

    if (!v5)
    {
      v9 = objc_msgSend(v4, "elementTextRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      sub_FD90(v4, (NSUInteger *)&v9, v6);
      objc_msgSend(v4, "baxSetStoredLineInfos:", v6);

    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "baxStoredLineInfos"));

  return v7;
}

- (id)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSRange v12;
  NSRect v13;

  v3 = objc_opt_class(self, a2);
  v12.location = (NSUInteger)-[BEAXLineInfo rangeInChapter](self, "rangeInChapter");
  v4 = NSStringFromRange(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[BEAXLineInfo frameInScreenCoordinates](self, "frameInScreenCoordinates");
  v6 = NSStringFromRect(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEAXLineInfo attributedText](self, "attributedText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p range=%@ frame=%@ text='%@'>"), v3, self, v5, v7, v9));

  return v10;
}

+ (id)linkElementsForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  UIAccessibilityTraits v8;
  UIAccessibilityTraits v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((uint64_t)objc_msgSend(v3, "accessibilityElementCount") >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityElementAtIndex:", v6));
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (v6 < (uint64_t)objc_msgSend(v3, "accessibilityElementCount"));
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = UIAccessibilityTraitCausesPageTurn;
    v9 = UIAccessibilityTraitLink;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      v11 = v8 | (unint64_t)objc_msgSend(v10, "accessibilityTraits");
      objc_msgSend(v10, "setAccessibilityTraits:", v11);
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      if ((v9 & ~v11) != 0)
      {
        if ((uint64_t)objc_msgSend(v10, "accessibilityElementCount") >= 1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, objc_msgSend(v10, "accessibilityElementCount")));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          if ((uint64_t)objc_msgSend(v10, "accessibilityElementCount") >= 1)
          {
            v14 = 0;
            do
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accessibilityElementAtIndex:", v14));
              objc_msgSend(v13, "addObject:", v15);

              ++v14;
            }
            while (v14 < (uint64_t)objc_msgSend(v10, "accessibilityElementCount"));
          }
          objc_msgSend(v5, "insertObjects:atIndexes:", v13, v12);

        }
      }
      else
      {
        objc_msgSend(v4, "addObject:", v10);
      }

    }
    while (objc_msgSend(v5, "count"));
  }
  v16 = objc_msgSend(v4, "copy");

  return v16;
}

+ (id)lineRectsForElement:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lineRectsAndText"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "valueForKey:", CFSTR("rect"), (_QWORD)v13));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (objc_msgSend(v4, "count"))
      v11 = v4;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)textForElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textMarkerRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForTextMarkers:", v4));

  return v5;
}

- (_NSRange)rangeInChapter
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeInChapter.length;
  location = self->_rangeInChapter.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)frameInScreenCoordinates
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInScreenCoordinates.origin.x;
  y = self->_frameInScreenCoordinates.origin.y;
  width = self->_frameInScreenCoordinates.size.width;
  height = self->_frameInScreenCoordinates.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)frameCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_frameCenterPoint.x;
  y = self->_frameCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (BAXObjectWrapper)objectWrapperElement
{
  return self->_objectWrapperElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectWrapperElement, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
