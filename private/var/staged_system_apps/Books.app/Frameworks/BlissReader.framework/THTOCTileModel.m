@implementation THTOCTileModel

- (THTOCModel)tocModel
{
  return self->mTOCModel;
}

- (void)setTocModel:(id)a3
{
  -[THTOCTileModel willModify](self, "willModify");
  self->mTOCModel = (THTOCModel *)a3;
}

- (NSArray)landscapeEntries
{
  return self->mLandscapeEntries;
}

- (void)setLandscapeEntries:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mLandscapeEntries = (NSArray *)a3;
}

- (NSArray)portraitEntries
{
  return self->mPortraitEntries;
}

- (void)setPortraitEntries:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mPortraitEntries = (NSArray *)a3;
}

- (NSString)frontOrdinalText
{
  return self->mFrontOrdinalText;
}

- (void)setFrontOrdinalText:(id)a3
{
  NSString *v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mFrontOrdinalText = v5;
}

- (NSString)frontTitleText
{
  return self->mFrontTitleText;
}

- (void)setFrontTitleText:(id)a3
{
  NSString *v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mFrontTitleText = v5;
}

- (TSPData)frontImage
{
  return self->mFrontImage;
}

- (void)setFrontImage:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mFrontImage = (TSPData *)a3;
}

- (NSString)backOrdinalText
{
  return self->mBackOrdinalText;
}

- (void)setBackOrdinalText:(id)a3
{
  NSString *v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mBackOrdinalText = v5;
}

- (NSString)backTitleText
{
  return self->mBackTitleText;
}

- (void)setBackTitleText:(id)a3
{
  NSString *v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mBackTitleText = v5;
}

- (TSPData)backImage
{
  return self->mBackImage;
}

- (void)setBackImage:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mBackImage = (TSPData *)a3;
}

- (TSPData)tocThumb
{
  return self->mTOCThumb;
}

- (void)setTocThumb:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mTOCThumb = (TSPData *)a3;
}

- (TSPData)notesThumb
{
  return self->mNotesThumb;
}

- (void)setNotesThumb:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mNotesThumb = (TSPData *)a3;
}

- (THModelContentNode)browserPageNode
{
  return self->mBrowserPageNode;
}

- (void)setBrowserPageNode:(id)a3
{
  id v5;

  -[THTOCTileModel willModify](self, "willModify");
  v5 = a3;

  self->mBrowserPageNode = (THModelContentNode *)a3;
}

- (void)addTinyThumb:(id)a3
{
  NSMutableArray *mTinyThumbs;

  mTinyThumbs = self->mTinyThumbs;
  if (!mTinyThumbs)
  {
    mTinyThumbs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mTinyThumbs = mTinyThumbs;
  }
  -[NSMutableArray addObject:](mTinyThumbs, "addObject:", a3);
}

- (void)addLargerThumb:(id)a3
{
  NSMutableArray *mLargerThumbs;

  mLargerThumbs = self->mLargerThumbs;
  if (!mLargerThumbs)
  {
    mLargerThumbs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mLargerThumbs = mLargerThumbs;
  }
  -[NSMutableArray addObject:](mLargerThumbs, "addObject:", a3);
}

- (THTOCTileModel)initWithTOCModel:(id)a3
{
  THTOCTileModel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTOCTileModel;
  result = -[THTOCTileModel initWithContext:](&v5, "initWithContext:", objc_msgSend(a3, "context"));
  if (result)
    result->mTOCModel = (THTOCModel *)a3;
  return result;
}

- (THModelLink)firstModelLink
{
  THModelLink *result;

  result = -[NSArray count](-[THTOCTileModel portraitEntries](self, "portraitEntries"), "count");
  if (result)
    return (THModelLink *)objc_msgSend(-[NSArray objectAtIndex:](-[THTOCTileModel portraitEntries](self, "portraitEntries"), "objectAtIndex:", 0), "modelLink");
  return result;
}

- (unint64_t)pageIndex
{
  unint64_t result;

  result = -[NSArray count](-[THTOCTileModel portraitEntries](self, "portraitEntries"), "count");
  if (result)
    return (unint64_t)objc_msgSend(-[NSArray objectAtIndex:](-[THTOCTileModel portraitEntries](self, "portraitEntries"), "objectAtIndex:", 0), "pageIndex");
  return result;
}

- (id)p_displayPageNumberForPageIndex:(unint64_t)a3 entries:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(a4);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if ((unint64_t)objc_msgSend(v11, "pageIndex") > a3)
        break;
      if (objc_msgSend(v11, "displayPageNumberForPageIndex:", a3))
        v8 = v11;
      if (v7 == (id)++v10)
      {
        v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        return objc_msgSend(v8, "displayPageNumberForPageIndex:", a3);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return objc_msgSend(v8, "displayPageNumberForPageIndex:", a3);
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  return -[THTOCTileModel p_displayPageNumberForPageIndex:entries:](self, "p_displayPageNumberForPageIndex:entries:", a3, -[THTOCTileModel portraitEntries](self, "portraitEntries"));
}

- (void)dealloc
{
  objc_super v3;

  self->mTOCModel = 0;

  self->mLandscapeEntries = 0;
  self->mPortraitEntries = 0;

  self->mFrontOrdinalText = 0;
  self->mFrontTitleText = 0;

  self->mFrontImage = 0;
  self->mBackOrdinalText = 0;

  self->mBackTitleText = 0;
  self->mBackImage = 0;

  self->mTinyThumbs = 0;
  self->mLargerThumbs = 0;

  self->mBrowserPageNode = 0;
  self->mTOCThumb = 0;

  self->mNotesThumb = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModel;
  -[THTOCTileModel dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) pageIndex=%@ frontOrdinalText='%@' frontTitleText='%@' backOrdinalText='%@' backTitleText='%@' firstModelLink=%@> \nlandscapeEntries = %@\nportraitEntries=%@\nbrowserPageNode = %@"), NSStringFromClass(v3), self, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THTOCTileModel pageIndex](self, "pageIndex")), -[THTOCTileModel frontOrdinalText](self, "frontOrdinalText"), -[THTOCTileModel frontTitleText](self, "frontTitleText"), -[THTOCTileModel backOrdinalText](self, "backOrdinalText"), -[THTOCTileModel backTitleText](self, "backTitleText"), -[THTOCTileModel firstModelLink](self, "firstModelLink"), -[THTOCTileModel landscapeEntries](self, "landscapeEntries"), -[THTOCTileModel portraitEntries](self, "portraitEntries"), -[THTOCTileModel browserPageNode](self, "browserPageNode"));
}

- (NSArray)tinyThumbs
{
  return &self->mTinyThumbs->super;
}

- (NSArray)largerThumbs
{
  return &self->mLargerThumbs->super;
}

@end
