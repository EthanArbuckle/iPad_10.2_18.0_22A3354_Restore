@implementation THTOCTileModelEntry

- (THTOCTileModelEntry)init
{
  THTOCTileModelEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModelEntry;
  result = -[THTOCTileModelEntry init](&v3, "init");
  if (result)
  {
    result->mPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    result->mDisplayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;
    result->mDisplayPageNumberFormat = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[THTOCTileModelEntry setSectionIdentifier:](self, "setSectionIdentifier:", 0);
  -[THTOCTileModelEntry setTitle:](self, "setTitle:", 0);
  -[THTOCTileModelEntry setNodeGUID:](self, "setNodeGUID:", 0);
  -[THTOCTileModelEntry setModelLink:](self, "setModelLink:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModelEntry;
  -[THTOCTileModelEntry dealloc](&v3, "dealloc");
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  if (self->mDisplayPageNumberValue == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t)(self->mDisplayPageNumberValue + a3 - -[THTOCTileModelEntry pageIndex](self, "pageIndex")) < 1)
  {
    return 0;
  }
  else
  {
    return +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:");
  }
}

- (NSString)displayPageNumber
{
  return (NSString *)-[THTOCTileModelEntry displayPageNumberForPageIndex:](self, "displayPageNumberForPageIndex:", -[THTOCTileModelEntry pageIndex](self, "pageIndex"));
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSString *v9;
  uint64_t v10;
  const __CFString *v11;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = -[THTOCTileModelEntry title](self, "title");
  v6 = -[THTOCTileModelEntry sectionIdentifier](self, "sectionIdentifier");
  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THTOCTileModelEntry pageIndex](self, "pageIndex"));
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THTOCTileModelEntry pageCount](self, "pageCount"));
  v9 = -[THTOCTileModelEntry displayPageNumber](self, "displayPageNumber");
  v10 = -[THTOCTileModelEntry displayPageNumberFormat](self, "displayPageNumberFormat");
  if (-[THTOCTileModelEntry includeInTOC](self, "includeInTOC"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) title=%@ section=%@ pageIndex=%@ pageCount=%@ displayPageNumber=%@ displayPageNumberFormat=%lu includeInToc=%@ modelLink=%@"), v4, self, v5, v6, v7, v8, v9, v10, v11, -[THTOCTileModelEntry modelLink](self, "modelLink"));
}

- (NSString)sectionIdentifier
{
  return self->mSectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)nodeGUID
{
  return self->mNodeGUID;
}

- (void)setNodeGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (THModelLink)modelLink
{
  return self->mLink;
}

- (void)setModelLink:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)indentLevel
{
  return self->mIndentLevel;
}

- (void)setIndentLevel:(int64_t)a3
{
  self->mIndentLevel = a3;
}

- (unint64_t)pageIndex
{
  return self->mPageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->mPageIndex = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

- (int64_t)displayPageNumberValue
{
  return self->mDisplayPageNumberValue;
}

- (void)setDisplayPageNumberValue:(int64_t)a3
{
  self->mDisplayPageNumberValue = a3;
}

- (int)displayPageNumberFormat
{
  return self->mDisplayPageNumberFormat;
}

- (void)setDisplayPageNumberFormat:(int)a3
{
  self->mDisplayPageNumberFormat = a3;
}

- (BOOL)includeInTOC
{
  return self->mIncludeInTOC;
}

- (void)setIncludeInTOC:(BOOL)a3
{
  self->mIncludeInTOC = a3;
}

@end
