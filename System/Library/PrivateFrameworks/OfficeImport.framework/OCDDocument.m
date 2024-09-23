@implementation OCDDocument

- (OCDDocument)init
{
  OCDDocument *v2;
  OCDSummary *v3;
  OCDSummary *mSummary;
  OADBlipCollection *v5;
  OADBlipCollection *mBlips;
  OADTextListStyle *v7;
  OADTextListStyle *mDefaultTextStyle;
  NSMutableArray *v9;
  NSMutableArray *mCharts;
  OADTableStyleCollection *v11;
  OADTableStyleCollection *mTableStyles;
  OITSUPointerKeyDictionary *v13;
  OITSUPointerKeyDictionary *mDualDrawableMap;
  OADTheme *v15;
  OADTheme *mDocumentTheme;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OCDDocument;
  v2 = -[OCDDocument init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OCDSummary);
    mSummary = v2->mSummary;
    v2->mSummary = v3;

    v5 = objc_alloc_init(OADBlipCollection);
    mBlips = v2->mBlips;
    v2->mBlips = v5;

    v7 = -[OADTextListStyle initWithDefaults]([OADTextListStyle alloc], "initWithDefaults");
    mDefaultTextStyle = v2->mDefaultTextStyle;
    v2->mDefaultTextStyle = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mCharts = v2->mCharts;
    v2->mCharts = v9;

    v11 = objc_alloc_init(OADTableStyleCollection);
    mTableStyles = v2->mTableStyles;
    v2->mTableStyles = v11;

    v13 = objc_alloc_init(OITSUPointerKeyDictionary);
    mDualDrawableMap = v2->mDualDrawableMap;
    v2->mDualDrawableMap = v13;

    v15 = objc_alloc_init(OADTheme);
    mDocumentTheme = v2->mDocumentTheme;
    v2->mDocumentTheme = v15;

  }
  return v2;
}

- (void)setGraphicStyleCache:(id)a3
{
  objc_storeStrong((id *)&self->mGraphicStyleCache, a3);
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->mReader, a3);
}

- (OADTextListStyle)defaultTextStyle
{
  return self->mDefaultTextStyle;
}

- (OADBlipCollection)blips
{
  return self->mBlips;
}

- (OADGraphicStyleCache)graphicStyleCache
{
  return self->mGraphicStyleCache;
}

- (OCDSummary)summary
{
  return self->mSummary;
}

- (BOOL)isFromBinaryFile
{
  return -[OCDReader isBinaryReader](self->mReader, "isBinaryReader");
}

- (id)encryptionInfo
{
  return self->mEncryptionInfo;
}

- (void)setEncryptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->mEncryptionInfo, a3);
}

- (id)theme
{
  return self->mDocumentTheme;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->mDocumentTheme, a3);
}

- (id)bulletBlips
{
  return 0;
}

- (OCDReader)reader
{
  return self->mReader;
}

- (OCDWriter)writer
{
  return self->mWriter;
}

- (void)setWriter:(id)a3
{
  objc_storeStrong((id *)&self->mWriter, a3);
}

- (NSMutableArray)charts
{
  return self->mCharts;
}

- (OADTableStyleCollection)tableStyles
{
  return self->mTableStyles;
}

- (OITSUPointerKeyDictionary)dualDrawableMap
{
  return self->mDualDrawableMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReader, 0);
  objc_storeStrong((id *)&self->mEncryptionInfo, 0);
  objc_storeStrong((id *)&self->mGraphicStyleCache, 0);
  objc_storeStrong((id *)&self->mDefaultTextStyle, 0);
  objc_storeStrong((id *)&self->mDocumentTheme, 0);
  objc_storeStrong((id *)&self->mDualDrawableMap, 0);
  objc_storeStrong((id *)&self->mTableStyles, 0);
  objc_storeStrong((id *)&self->mCharts, 0);
  objc_storeStrong((id *)&self->mBlips, 0);
  objc_storeStrong((id *)&self->mSummary, 0);
  objc_storeStrong((id *)&self->mWriter, 0);
}

@end
