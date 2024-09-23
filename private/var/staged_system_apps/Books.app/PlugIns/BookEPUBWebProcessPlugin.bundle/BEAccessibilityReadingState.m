@implementation BEAccessibilityReadingState

+ (id)currentReadingState
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_116D4;
  block[3] = &unk_20888;
  block[4] = a1;
  if (qword_271A8 != -1)
    dispatch_once(&qword_271A8, block);
  return (id)qword_271B0;
}

- (BEAccessibilityReadingState)init
{
  BEAccessibilityReadingState *v2;
  NSPointerArray *v3;
  NSPointerArray *knownBookContentElements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEAccessibilityReadingState;
  v2 = -[BEAccessibilityReadingState init](&v6, "init");
  if (v2)
  {
    v3 = (NSPointerArray *)objc_msgSend(objc_alloc((Class)NSPointerArray), "initWithOptions:", 5);
    knownBookContentElements = v2->_knownBookContentElements;
    v2->_knownBookContentElements = v3;

  }
  return v2;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BEAccessibilityReadingState currentPageLocation](self, "currentPageLocation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BEAccessibilityReadingState currentPageLength](self, "currentPageLength")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BEAccessibilityReadingState pageCount](self, "pageCount")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEAccessibilityReadingState visibleAnnotations](self, "visibleAnnotations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEAccessibilityReadingState isVisiblePageBookmarked](self, "isVisiblePageBookmarked")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BEAccessibilityReadingState bookLayout](self, "bookLayout")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BEAccessibilityReadingState isFixedLayoutBook](self, "isFixedLayoutBook")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p currentPageLocation=%@ currentPageLength=%@ totalPages=%@ annotations=%@ bookmarked=%@ bookLayout=%@ fixedLayout=%@>"), v3, self, v4, v5, v6, v8, v9, v10, v11));

  return v12;
}

- (_NSRange)currentPage
{
  int64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[BEAccessibilityReadingState currentPageLocation](self, "currentPageLocation");
  v4 = -[BEAccessibilityReadingState currentPageLength](self, "currentPageLength");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)setCurrentPageLocation:(int64_t)a3
{
  if (self->_currentPageLocation != a3)
    self->_currentPageLocation = a3;
}

- (void)setCurrentPageNumber:(int64_t)a3
{
  if (self->_currentPageNumber != a3)
    self->_currentPageNumber = a3;
}

- (void)setScreenHeight:(int64_t)a3
{
  if (self->_screenHeight != a3)
    self->_screenHeight = a3;
}

- (void)setScreenWidth:(int64_t)a3
{
  if (self->_screenWidth != a3)
    self->_screenWidth = a3;
}

- (void)setIsPaginated:(BOOL)a3
{
  if (self->_isPaginated != a3)
  {
    self->_isPaginated = a3;
    -[BEAccessibilityReadingState documentChanged](self, "documentChanged");
  }
}

- (void)documentChanged
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAccessibilityReadingState knownBookContentElements](self, "knownBookContentElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "baxInvalidateLineInfos") & 1) != 0)
        {
          objc_msgSend(v9, "baxInvalidateLineInfos");
        }
        else if ((objc_opt_respondsToSelector(v9, "baxInvalidateCaches") & 1) != 0)
        {
          objc_msgSend(v9, "baxInvalidateCaches", (_QWORD)v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)invalidateCaches
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEAccessibilityReadingState knownBookContentElements](self, "knownBookContentElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "baxInvalidateCaches", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)registerBookContentElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentReadingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "knownBookContentElements"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if ((v7 & 1) == 0)
    objc_msgSend(v5, "addPointer:", v8);

}

+ (void)registerBookContentWrapper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "currentReadingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "knownBookContentElements"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if ((v7 & 1) == 0)
    objc_msgSend(v5, "addPointer:", v8);

}

- (NSArray)visibleAnnotations
{
  return self->_visibleAnnotations;
}

- (void)setVisibleAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isVisiblePageBookmarked
{
  return self->_isVisiblePageBookmarked;
}

- (void)setIsVisiblePageBookmarked:(BOOL)a3
{
  self->_isVisiblePageBookmarked = a3;
}

- (int64_t)currentPageLocation
{
  return self->_currentPageLocation;
}

- (int64_t)currentPageLength
{
  return self->_currentPageLength;
}

- (void)setCurrentPageLength:(int64_t)a3
{
  self->_currentPageLength = a3;
}

- (int64_t)currentPageNumber
{
  return self->_currentPageNumber;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (unint64_t)bookLayout
{
  return self->_bookLayout;
}

- (void)setBookLayout:(unint64_t)a3
{
  self->_bookLayout = a3;
}

- (BOOL)isFixedLayoutBook
{
  return self->_isFixedLayoutBook;
}

- (void)setIsFixedLayoutBook:(BOOL)a3
{
  self->_isFixedLayoutBook = a3;
}

- (NSPointerArray)knownBookContentElements
{
  return self->_knownBookContentElements;
}

- (void)setKnownBookContentElements:(id)a3
{
  objc_storeStrong((id *)&self->_knownBookContentElements, a3);
}

- (NSArray)performableOperations
{
  return self->_performableOperations;
}

- (void)setPerformableOperations:(id)a3
{
  objc_storeStrong((id *)&self->_performableOperations, a3);
}

- (CGRect)primaryVisibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryVisibleContentRect.origin.x;
  y = self->_primaryVisibleContentRect.origin.y;
  width = self->_primaryVisibleContentRect.size.width;
  height = self->_primaryVisibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPrimaryVisibleContentRect:(CGRect)a3
{
  self->_primaryVisibleContentRect = a3;
}

- (CGRect)secondaryVisibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryVisibleContentRect.origin.x;
  y = self->_secondaryVisibleContentRect.origin.y;
  width = self->_secondaryVisibleContentRect.size.width;
  height = self->_secondaryVisibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSecondaryVisibleContentRect:(CGRect)a3
{
  self->_secondaryVisibleContentRect = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)isSpreadWithChapterBoundary
{
  return self->_isSpreadWithChapterBoundary;
}

- (void)setIsSpreadWithChapterBoundary:(BOOL)a3
{
  self->_isSpreadWithChapterBoundary = a3;
}

- (BOOL)isPaginated
{
  return self->_isPaginated;
}

- (BOOL)isTextHorizontal
{
  return self->_isTextHorizontal;
}

- (void)setIsTextHorizontal:(BOOL)a3
{
  self->_isTextHorizontal = a3;
}

- (BOOL)hasVisibleControls
{
  return self->_hasVisibleControls;
}

- (void)setHasVisibleControls:(BOOL)a3
{
  self->_hasVisibleControls = a3;
}

- (int64_t)screenHeight
{
  return self->_screenHeight;
}

- (int64_t)screenWidth
{
  return self->_screenWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performableOperations, 0);
  objc_storeStrong((id *)&self->_knownBookContentElements, 0);
  objc_storeStrong((id *)&self->_visibleAnnotations, 0);
}

@end
