@implementation PFXHtmlEntryMediaState

- (void)setPropertySet:(id)a3
{
  PFSPropertySet *mPropertySet;

  mPropertySet = self->mPropertySet;
  if (mPropertySet != a3)
  {

    self->mPropertySet = (PFSPropertySet *)a3;
  }
}

- (PFXHtmlEntryMediaState)initWithHtmlStackEntry:(id)a3 parentEntryMediaState:(id)a4
{
  PFXHtmlEntryMediaState *v6;
  PFXHtmlEntryMediaState *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFXHtmlEntryMediaState;
  v6 = -[PFXHtmlEntryMediaState init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->mHtmlStackEntry = (PFXHtmlStackEntry *)a3;
    v6->mParentEntryMediaState = (PFXHtmlEntryMediaState *)a4;
    v6->mFontSize = 12.0;
    v6->mWhitespace = 5;
    v6->mNextBreak = 0;
    v6->mStorage = (TSWPStorage *)objc_msgSend(a4, "storage");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlEntryMediaState;
  -[PFXHtmlEntryMediaState dealloc](&v3, "dealloc");
}

- (PFSPropertySet)propertySet
{
  -[PFXHtmlEntryMediaState loadPropertiesIfNecessary](self, "loadPropertiesIfNecessary");
  return self->mPropertySet;
}

- (int)whitespace
{
  -[PFXHtmlEntryMediaState loadPropertiesIfNecessary](self, "loadPropertiesIfNecessary");
  return self->mWhitespace;
}

- (double)parentFontSize
{
  PFXHtmlEntryMediaState *mParentEntryMediaState;
  double result;

  mParentEntryMediaState = self->mParentEntryMediaState;
  if (!mParentEntryMediaState)
    return self->mFontSize;
  -[PFXHtmlEntryMediaState fontSize](mParentEntryMediaState, "fontSize");
  return result;
}

- (unsigned)parentBreakState
{
  return -[PFXHtmlEntryMediaState currentBreakState](self->mParentEntryMediaState, "currentBreakState");
}

- (void)setCurrentBreakStateSameAsParent
{
  self->mNextBreak = -[PFXHtmlEntryMediaState currentBreakState](self->mParentEntryMediaState, "currentBreakState");
}

- (void)setParentBreakStateSameAsCurrent
{
  -[PFXHtmlEntryMediaState setCurrentBreakState:](self->mParentEntryMediaState, "setCurrentBreakState:", self->mNextBreak);
}

- (id)ancestorParagraphStyle
{
  id result;

  result = -[PFXHtmlEntryMediaState paragraphStyle](self->mParentEntryMediaState, "paragraphStyle");
  if (!result)
    return -[PFXHtmlEntryMediaState ancestorParagraphStyle](self->mParentEntryMediaState, "ancestorParagraphStyle");
  return result;
}

- (NSArray)childResults
{
  return &self->mChildResults->super;
}

- (unint64_t)childResultCount
{
  return (unint64_t)-[NSMutableArray count](self->mChildResults, "count");
}

- (id)childPairAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mChildResults, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mChildResults, "objectAtIndex:", a3);
}

- (id)childElementNameAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[PFXHtmlEntryMediaState childPairAtIndex:](self, "childPairAtIndex:", a3), "first");
}

- (id)childResultAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[PFXHtmlEntryMediaState childPairAtIndex:](self, "childPairAtIndex:", a3), "second");
}

- (id)firstChildResultWithElementName:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = -[NSMutableArray count](self->mChildResults, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  while (1)
  {
    v8 = -[NSMutableArray objectAtIndex:](self->mChildResults, "objectAtIndex:", v7);
    if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v8, "first")))
      break;
    if (v6 == (id)++v7)
      return 0;
  }
  return objc_msgSend(v8, "second");
}

- (void)addElementName:(const char *)a3 result:(id)a4
{
  id v7;

  if (a3 && a4 && xmlStrlen((const xmlChar *)a3))
  {
    if (!self->mChildResults)
      self->mChildResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = objc_msgSend(objc_alloc((Class)TSUPair), "initWithFirst:second:", +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", a3), a4);
    -[NSMutableArray addObject:](self->mChildResults, "addObject:", v7);

  }
}

- (void)addChildResultsFromState:(id)a3
{
  char *v5;
  char *v6;
  char *i;

  if (!self->mChildResults)
    self->mChildResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v5 = (char *)objc_msgSend(a3, "childResultCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NSMutableArray addObject:](self->mChildResults, "addObject:", objc_msgSend(a3, "childPairAtIndex:", i));
  }
}

- (id)xmlAttributeValueForResult:(id)a3 attributeName:(const char *)a4
{
  id result;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!a3)
    return 0;
  result = self->mChildAttributes;
  if (result)
  {
    result = objc_msgSend(result, "objectForKey:");
    if (result)
    {
      v6 = result;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      result = objc_msgSend(result, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (result)
      {
        v7 = result;
        v8 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
            if (xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(v10, "first"), "xmlString"), (const xmlChar *)a4))
            {
              return objc_msgSend(v10, "second");
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          result = 0;
          if (v7)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

- (void)setOverriddenStorage:(id)a3
{
  TSWPStorage *mStorage;

  mStorage = self->mStorage;
  if (mStorage != a3)
  {

    self->mStorage = (TSWPStorage *)a3;
  }
}

- (void)addAttributes:(const void *)a3 forResult:(id)a4
{
  char *v7;
  char *v8;
  PFXString *v9;
  id v10;
  char *v11;
  char *v12;
  BOOL v13;
  id v14;

  if (a4 && *((_QWORD *)a3 + 2))
  {
    if (!self->mChildAttributes)
      self->mChildAttributes = (NSMutableDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", *((_QWORD *)a3 + 2));
    v7 = *(char **)a3;
    v8 = (char *)a3 + 8;
    if (*(const void **)a3 != (char *)a3 + 8)
    {
      do
      {
        v9 = -[PFXString initWithXmlString:]([PFXString alloc], "initWithXmlString:", *((_QWORD *)v7 + 4));
        v10 = objc_msgSend(objc_alloc((Class)TSUPair), "initWithFirst:second:", v9, *((_QWORD *)v7 + 5));

        objc_msgSend(v14, "addObject:", v10);
        v11 = (char *)*((_QWORD *)v7 + 1);
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = *(char **)v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (char *)*((_QWORD *)v7 + 2);
            v13 = *(_QWORD *)v12 == (_QWORD)v7;
            v7 = v12;
          }
          while (!v13);
        }
        v7 = v12;
      }
      while (v12 != v8);
    }
    -[NSMutableDictionary setObject:forKey:](self->mChildAttributes, "setObject:forKey:", v14, a4);

  }
}

- (PFXHtmlEntryMediaState)parentEntryMediaState
{
  return self->mParentEntryMediaState;
}

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (TSWPStorage)originalStorage
{
  return self->mOriginalStorage;
}

- (void)setOriginalStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  self->mStylesheet = (TSSStylesheet *)a3;
}

- (TSWPCharacterStyle)characterStyle
{
  return self->mCharacterStyle;
}

- (void)setCharacterStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->mParagraphStyle;
}

- (void)setParagraphStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (double)fontSize
{
  return self->mFontSize;
}

- (void)setFontSize:(double)a3
{
  self->mFontSize = a3;
}

- (double)blockWidth
{
  return self->mBlockWidth;
}

- (void)setBlockWidth:(double)a3
{
  self->mBlockWidth = a3;
}

- (void)setWhitespace:(int)a3
{
  self->mWhitespace = a3;
}

- (unsigned)currentBreakState
{
  return self->mNextBreak;
}

- (void)setCurrentBreakState:(unsigned __int16)a3
{
  self->mNextBreak = a3;
}

- (unint64_t)startCharIndex
{
  return self->mStartCharIndex;
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->mStartCharIndex = a3;
}

- (double)leftMargin
{
  return self->mLeftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->mLeftMargin = a3;
}

- (double)rightMargin
{
  return self->mRightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->mRightMargin = a3;
}

- (double)marginBefore
{
  return self->mMarginBefore;
}

- (void)setMarginBefore:(double)a3
{
  self->mMarginBefore = a3;
}

- (double)marginAfter
{
  return self->mMarginAfter;
}

- (void)setMarginAfter:(double)a3
{
  self->mMarginAfter = a3;
}

- (double)leftPadding
{
  return self->mLeftPadding;
}

- (void)setLeftPadding:(double)a3
{
  self->mLeftPadding = a3;
}

- (double)rightPadding
{
  return self->mRightPadding;
}

- (void)setRightPadding:(double)a3
{
  self->mRightPadding = a3;
}

- (double)paddingBefore
{
  return self->mPaddingBefore;
}

- (void)setPaddingBefore:(double)a3
{
  self->mPaddingBefore = a3;
}

- (double)paddingAfter
{
  return self->mPaddingAfter;
}

- (void)setPaddingAfter:(double)a3
{
  self->mPaddingAfter = a3;
}

- (TSWPListStyle)listStyle
{
  return self->mListStyle;
}

- (void)setListStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)altDesc
{
  return self->mAltDesc;
}

- (void)setAltDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)URL
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)processOrientation
{
  return self->mProcessOrientation;
}

- (void)setProcessOrientation:(BOOL)a3
{
  self->mProcessOrientation = a3;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)loadPropertiesIfNecessary
{
  if (!self->mPropertySet)
    +[PFXHtmlStyle loadCssPropertiesForHtmlEntry:](PFXHtmlStyle, "loadCssPropertiesForHtmlEntry:", self->mHtmlStackEntry);
}

- (void)setNextBreak:(int64_t)a3
{
  self->mNextBreak = a3;
}

@end
