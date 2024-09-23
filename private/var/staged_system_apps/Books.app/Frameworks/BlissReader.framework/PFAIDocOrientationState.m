@implementation PFAIDocOrientationState

- (id)initWitContentNodeBody:(id)a3 presentationType:(id)a4 readerState:(id)a5
{
  id v9;
  PFAIDocOrientationState *v10;
  objc_super v12;

  v9 = objc_msgSend(a3, "bodyStorage");
  v12.receiver = self;
  v12.super_class = (Class)PFAIDocOrientationState;
  v10 = -[PFXHtmlDocMediaState initWithStorage:readerState:defaultParagraphStyleIdentifier:](&v12, "initWithStorage:readerState:defaultParagraphStyleIdentifier:", v9, a5, kTSWPDefaultContentParagraphStyleIdentifier);
  if (v10)
  {
    v10->mContentNodeBody = (THModelContentNodeBody *)a3;
    v10->mPresentationType = (THPresentationType *)a4;
    v10->mPageDrawableMaps = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->mHintsExhausted = 0;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIDocOrientationState;
  -[PFXHtmlDocMediaState dealloc](&v3, "dealloc");
}

- (BOOL)hasHints
{
  return self->mHintLocations || self->mHintsExhausted;
}

- (void)popHint
{
  uint64_t v3;
  double v4;
  NSDictionary *v5;
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9;
  id v10;

  self->mLastHintLocation = self->mNextHintLocation;
  v3 = objc_opt_class(NSDictionary);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[NSEnumerator nextObject](self->mHintEnumerator, "nextObject")).n128_u64[0];
  self->mNextHintEntry = v5;
  if (v5)
  {

    v6 = objc_opt_class(NSNumber);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, -[NSDictionary objectForKey:](self->mNextHintEntry, "objectForKey:", CFSTR("p"))).n128_u64[0];
    self->mNextHintLocation = (unint64_t)objc_msgSend(v8, "integerValue", v7);
    v9 = objc_opt_class(NSString);
    TSUDynamicCast(v9, -[NSDictionary objectForKey:](self->mNextHintEntry, "objectForKey:", CFSTR("idref")));
    self->mNextHintShapeRef = (NSString *)v10;
  }
  else
  {
    -[PFAIDocOrientationState invalidateLineHints](self, "invalidateLineHints", v4);
    self->mHintsExhausted = 1;
  }
}

- (unint64_t)nextHintLocation
{
  return self->mNextHintLocation;
}

- (id)nextHintShapeRef
{
  return self->mNextHintShapeRef;
}

- (id)hintsData
{
  return self->mHintsData;
}

- (unint64_t)lastHintLocation
{
  return self->mLastHintLocation;
}

- (void)invalidateLineHints
{
  self->mNextHintLocation = 0x7FFFFFFFFFFFFFFFLL;
  self->mHintEnumerator = 0;

  self->mNextHintShapeRef = 0;
  self->mHintLocations = 0;
}

- (void)setCurrentPageIndex:(int64_t)a3
{
  id v4;

  self->mCurrentPageIndex = a3;
  while ((uint64_t)-[NSMutableArray count](self->mPageDrawableMaps, "count") <= self->mCurrentPageIndex)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSMutableArray addObject:](self->mPageDrawableMaps, "addObject:", v4);

  }
}

- (id)currentPageDrawableMap
{
  return -[NSMutableArray objectAtIndex:](self->mPageDrawableMaps, "objectAtIndex:", self->mCurrentPageIndex);
}

- (id)pageAtRelativeIndex:(unint64_t)a3
{
  if (-[NSArray count](-[THModelContentNodeBody pages](self->mContentNodeBody, "pages"), "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](-[THModelContentNodeBody pages](self->mContentNodeBody, "pages"), "objectAtIndex:", a3);
}

- (void)clearIDsForTemporaryTableCellStorage
{
  -[THModelContentNodeBody clearNodeUniqueIDForInfo:](self->mContentNodeBody, "clearNodeUniqueIDForInfo:", -[PFXHtmlDocMediaState temporaryTableCellStorage](self, "temporaryTableCellStorage"));
}

- (THModelContentNodeBody)contentNodeBody
{
  return self->mContentNodeBody;
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (int64_t)currentPageIndex
{
  return self->mCurrentPageIndex;
}

- (NSMutableArray)pageDrawableMaps
{
  return self->mPageDrawableMaps;
}

- (void)clearHints
{
  self->mNextHintLocation = 0x7FFFFFFFFFFFFFFFLL;
  self->mHintEnumerator = 0;

  self->mHintsData = 0;
  self->mHintLocations = 0;

  self->mNextHintShapeRef = 0;
}

- (void)takeHintsFromState:(id)a3
{
  if (*((_QWORD *)a3 + 58))
  {
    self->mHintLocations = (NSArray *)*((id *)a3 + 59);
    self->mHintsData = (NSData *)*((id *)a3 + 58);
    self->mHintEnumerator = (NSEnumerator *)*((_QWORD *)a3 + 54);
    self->mLastHintLocation = *((_QWORD *)a3 + 57);
    self->mNextHintEntry = (NSDictionary *)*((_QWORD *)a3 + 53);
    self->mNextHintLocation = *((_QWORD *)a3 + 55);
    self->mNextHintShapeRef = (NSString *)*((id *)a3 + 56);
    objc_msgSend(a3, "clearHints");
  }
}

- (void)setLineHints:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *mHintLocations;

  self->mHintsData = 0;
  self->mHintLocations = 0;
  self->mNextHintEntry = 0;
  self->mHintEnumerator = 0;
  self->mNextHintLocation = 0;
  if (a3)
  {
    v5 = objc_opt_class(NSNumber);
    *(_QWORD *)&v7 = TSUDynamicCast(v5, objc_msgSend(a3, "objectForKey:", CFSTR("version"))).n128_u64[0];
    if (v6)
    {
      if (objc_msgSend(v6, "integerValue", v7) == (char *)&dword_0 + 1)
      {
        v8 = objc_opt_class(NSData);
        TSUDynamicCast(v8, objc_msgSend(a3, "objectForKey:", CFSTR("data")));
        if (v9)
          self->mHintsData = (NSData *)v9;
        v10 = objc_opt_class(NSArray);
        TSUDynamicCast(v10, objc_msgSend(a3, "objectForKey:", CFSTR("positions")));
        if (v11)
        {
          mHintLocations = v11;
          self->mHintLocations = mHintLocations;
        }
        else
        {
          mHintLocations = self->mHintLocations;
        }
        self->mHintEnumerator = -[NSArray objectEnumerator](mHintLocations, "objectEnumerator");
        -[PFAIDocOrientationState popHint](self, "popHint");
      }
    }
  }
}

@end
