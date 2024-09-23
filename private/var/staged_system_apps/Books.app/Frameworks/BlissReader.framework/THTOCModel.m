@implementation THTOCModel

- (NSArray)tiles
{
  return self->mTiles;
}

- (void)setTiles:(id)a3
{
  id v5;

  -[THTOCModel willModify](self, "willModify");
  v5 = a3;

  self->mTiles = (NSArray *)a3;
}

- (NSString)bookTitle
{
  return self->mBookTitle;
}

- (void)setBookTitle:(id)a3
{
  NSString *v5;

  -[THTOCModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mBookTitle = v5;
}

- (NSString)bookSubtitle
{
  return self->mBookSubtitle;
}

- (void)setBookSubtitle:(id)a3
{
  NSString *v5;

  -[THTOCModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mBookSubtitle = v5;
}

- (TSPData)tocHeaderImageData
{
  return self->mTocHeaderImageData;
}

- (void)setTocHeaderImageData:(id)a3
{
  id v5;

  -[THTOCModel willModify](self, "willModify");
  v5 = a3;

  self->mTocHeaderImageData = (TSPData *)a3;
}

- (BOOL)showPageNumbers
{
  return self->mShowPageNumbers;
}

- (void)setShowPageNumbers:(BOOL)a3
{
  -[THTOCModel willModify](self, "willModify");
  self->mShowPageNumbers = a3;
}

- (void)dealloc
{
  objc_super v3;

  self->mTiles = 0;
  self->mBookTitle = 0;

  self->mBookSubtitle = 0;
  self->mTocHeaderImageData = 0;

  self->_figureReference = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCModel;
  -[THTOCModel dealloc](&v3, "dealloc");
}

- (unint64_t)pageIndex
{
  unint64_t result;

  result = -[NSArray count](-[THTOCModel tiles](self, "tiles"), "count");
  if (result)
    return (unint64_t)objc_msgSend(-[NSArray objectAtIndex:](-[THTOCModel tiles](self, "tiles"), "objectAtIndex:", 0), "pageIndex");
  return result;
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[THTOCModel tiles](self, "tiles", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      if ((unint64_t)objc_msgSend(v10, "pageIndex") > a3)
        break;
      if (objc_msgSend(v10, "displayPageNumberForPageIndex:", a3))
        v7 = v10;
      if (v6 == (id)++v9)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        return objc_msgSend(v7, "displayPageNumberForPageIndex:", a3);
      }
    }
  }
  else
  {
    v7 = 0;
  }
  return objc_msgSend(v7, "displayPageNumberForPageIndex:", a3);
}

- (NSDictionary)figureReference
{
  return self->_figureReference;
}

- (void)setFigureReference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int64_t)numberOfDivisionsInTOC:(id)a3
{
  return 1;
}

- (unint64_t)toc:(id)a3 numberOfTilesInDivision:(int64_t)a4
{
  if (!-[NSArray count](-[THTOCModel tiles](self, "tiles", a3, a4), "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCModel(THTOCViewControllerDataSource) toc:numberOfTilesInDivision:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCModel.m"), 80, CFSTR("No tiles in the TOC Model"));
  return -[NSArray count](-[THTOCModel tiles](self, "tiles"), "count");
}

- (id)toc:(id)a3 tileModelForChapterIndex:(int64_t)a4
{
  if (-[NSArray count](-[THTOCModel tiles](self, "tiles", a3), "count") <= a4)
    return 0;
  else
    return -[NSArray objectAtIndex:](-[THTOCModel tiles](self, "tiles"), "objectAtIndex:", a4);
}

- (id)bookTOCHeaderImageDataForTOC:(id)a3
{
  return -[THTOCModel tocHeaderImageData](self, "tocHeaderImageData", a3);
}

@end
