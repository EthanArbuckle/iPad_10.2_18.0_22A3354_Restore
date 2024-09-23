@implementation NSStringDrawingContext

- (double)firstBaselineOffset
{
  return self->_firstBaselineOffset;
}

- (void)setLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (id)layout
{
  return self->_layout;
}

- (BOOL)cachesLayout
{
  return (*(_WORD *)&self->_sdcFlags >> 7) & 1;
}

- (double)scaledLineHeight
{
  return self->_scaledLineHeight;
}

- (CGFloat)actualScaleFactor
{
  return self->_actualScaleFactor;
}

- (BOOL)wrapsForTruncationMode
{
  return (*(_WORD *)&self->_sdcFlags >> 1) & 1;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (BOOL)wantsBaselineOffset
{
  return (*(_WORD *)&self->_sdcFlags >> 2) & 1;
}

- (void)setTotalBounds:(CGRect)a3
{
  self->_totalBounds = a3;
}

- (void)setNumberOfLineFragments:(unint64_t)a3
{
  self->_numberOfLineFragments = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSStringDrawingContext *v4;

  v4 = -[NSStringDrawingContext init](+[NSStringDrawingContext allocWithZone:](NSStringDrawingContext, "allocWithZone:", a3), "init");
  -[NSStringDrawingContext minimumScaleFactor](self, "minimumScaleFactor");
  -[NSStringDrawingContext setMinimumScaleFactor:](v4, "setMinimumScaleFactor:");
  -[NSStringDrawingContext minimumTrackingAdjustment](self, "minimumTrackingAdjustment");
  -[NSStringDrawingContext setMinimumTrackingAdjustment:](v4, "setMinimumTrackingAdjustment:");
  -[NSStringDrawingContext setWantsNumberOfLineFragments:](v4, "setWantsNumberOfLineFragments:", -[NSStringDrawingContext wantsNumberOfLineFragments](self, "wantsNumberOfLineFragments"));
  -[NSStringDrawingContext setWrapsForTruncationMode:](v4, "setWrapsForTruncationMode:", -[NSStringDrawingContext wrapsForTruncationMode](self, "wrapsForTruncationMode"));
  -[NSStringDrawingContext setMaximumNumberOfLines:](v4, "setMaximumNumberOfLines:", -[NSStringDrawingContext maximumNumberOfLines](self, "maximumNumberOfLines"));
  -[NSStringDrawingContext setWantsBaselineOffset:](v4, "setWantsBaselineOffset:", -[NSStringDrawingContext wantsBaselineOffset](self, "wantsBaselineOffset"));
  -[NSStringDrawingContext setWantsScaledBaselineOffset:](v4, "setWantsScaledBaselineOffset:", -[NSStringDrawingContext wantsScaledBaselineOffset](self, "wantsScaledBaselineOffset"));
  -[NSStringDrawingContext setWantsScaledLineHeight:](v4, "setWantsScaledLineHeight:", -[NSStringDrawingContext wantsScaledLineHeight](self, "wantsScaledLineHeight"));
  -[NSStringDrawingContext setDrawsDebugBaselines:](v4, "setDrawsDebugBaselines:", -[NSStringDrawingContext drawsDebugBaselines](self, "drawsDebugBaselines"));
  -[NSStringDrawingContext setCachesLayout:](v4, "setCachesLayout:", -[NSStringDrawingContext cachesLayout](self, "cachesLayout"));
  -[NSStringDrawingContext setLayout:](v4, "setLayout:", -[NSStringDrawingContext layout](self, "layout"));
  -[NSStringDrawingContext setCuiCatalog:](v4, "setCuiCatalog:", -[NSStringDrawingContext cuiCatalog](self, "cuiCatalog"));
  -[NSStringDrawingContext setCuiStyleEffects:](v4, "setCuiStyleEffects:", -[NSStringDrawingContext cuiStyleEffects](self, "cuiStyleEffects"));
  -[NSStringDrawingContext setUsesSimpleTextEffects:](v4, "setUsesSimpleTextEffects:", -[NSStringDrawingContext usesSimpleTextEffects](self, "usesSimpleTextEffects"));
  -[NSStringDrawingContext setApplicationFrameworkContext:](v4, "setApplicationFrameworkContext:", -[NSStringDrawingContext applicationFrameworkContext](self, "applicationFrameworkContext"));
  -[NSStringDrawingContext setLinkTextAttributesProvider:](v4, "setLinkTextAttributesProvider:", -[NSStringDrawingContext linkTextAttributesProvider](self, "linkTextAttributesProvider"));
  -[NSStringDrawingContext setWantsMultilineDeviceMetrics:](v4, "setWantsMultilineDeviceMetrics:", -[NSStringDrawingContext wantsMultilineDeviceMetrics](self, "wantsMultilineDeviceMetrics"));
  -[NSStringDrawingContext multilineDeviceMetricsRect](self, "multilineDeviceMetricsRect");
  -[NSStringDrawingContext setMultilineDeviceMetricsRect:](v4, "setMultilineDeviceMetricsRect:");
  return v4;
}

- (void)setWrapsForTruncationMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFD | v3;
}

- (void)setCuiStyleEffects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setWantsNumberOfLineFragments:(BOOL)a3
{
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFE | a3;
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  self->_minimumScaleFactor = minimumScaleFactor;
}

- (void)setLinkTextAttributesProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (BOOL)wantsNumberOfLineFragments
{
  return *(_WORD *)&self->_sdcFlags & 1;
}

- (void)setWantsScaledLineHeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFEF | v3;
}

- (void)setWantsScaledBaselineOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFF7 | v3;
}

- (NSStringDrawingContext)init
{
  NSStringDrawingContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSStringDrawingContext;
  v2 = -[NSStringDrawingContext init](&v4, sel_init);
  if (v2)
    -[NSStringDrawingContext setApplicationFrameworkContext:](v2, "setApplicationFrameworkContext:", _NSTextScalingTypeForCurrentEnvironment());
  return v2;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3)
    LOWORD(a3) = _NSTextScalingTypeForCurrentEnvironment();
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0x1FFF | ((_WORD)a3 << 13);
}

- (unint64_t)activeRenderers
{
  return ((unint64_t)*(_WORD *)&self->_sdcFlags >> 9) & 0xF;
}

- (BOOL)wantsMultilineDeviceMetrics
{
  return (*(_WORD *)&self->_sdcFlags >> 6) & 1;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (void)setFirstBaselineOffset:(double)a3
{
  self->_firstBaselineOffset = a3;
}

- (void)setActiveRenderers:(unint64_t)a3
{
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xE1FF | ((a3 & 0xF) << 9);
}

- (int64_t)applicationFrameworkContext
{
  return (unint64_t)*(_WORD *)&self->_sdcFlags >> 13;
}

- (void)setActualScaleFactor:(double)a3
{
  self->_actualScaleFactor = a3;
}

- (BOOL)drawsDebugBaselines
{
  return (*(_WORD *)&self->_sdcFlags >> 5) & 1;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (void)setCachesLayout:(BOOL)a3
{
  __int16 sdcFlags;
  __int16 v4;

  sdcFlags = (__int16)self->_sdcFlags;
  if (((((sdcFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 128;
    else
      v4 = 0;
    *(_WORD *)&self->_sdcFlags = sdcFlags & 0xFF7F | v4;
    -[NSStringDrawingContext setLayout:](self, "setLayout:", 0);
  }
}

- (void)setWantsBaselineOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFB | v3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (CGFloat)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (unint64_t)numberOfLineFragments
{
  return self->_numberOfLineFragments;
}

- (void)setScaledBaselineOffset:(double)a3
{
  self->_scaledBaselineOffset = a3;
}

- (void)setScaledLineHeight:(double)a3
{
  self->_scaledLineHeight = a3;
}

- (BOOL)wantsScaledLineHeight
{
  return (*(_WORD *)&self->_sdcFlags >> 4) & 1;
}

- (BOOL)wantsScaledBaselineOffset
{
  return (*(_WORD *)&self->_sdcFlags >> 3) & 1;
}

- (void)setMinimumTrackingAdjustment:(CGFloat)minimumTrackingAdjustment
{
  self->_minimumTrackingAdjustment = minimumTrackingAdjustment;
}

- (CGFloat)minimumTrackingAdjustment
{
  return self->_minimumTrackingAdjustment;
}

- (BOOL)usesSimpleTextEffects
{
  return HIBYTE(*(_WORD *)&self->_sdcFlags) & 1;
}

- (void)setWantsMultilineDeviceMetrics:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFBF | v3;
}

- (void)setUsesSimpleTextEffects:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFEFF | v3;
}

- (void)setMultilineDeviceMetricsRect:(CGRect)a3
{
  self->_multilineDeviceMetricsRect = a3;
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFDF | v3;
}

- (void)setCuiCatalog:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CGRect)multilineDeviceMetricsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_multilineDeviceMetricsRect.origin.x;
  y = self->_multilineDeviceMetricsRect.origin.y;
  width = self->_multilineDeviceMetricsRect.size.width;
  height = self->_multilineDeviceMetricsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)linkTextAttributesProvider
{
  return objc_getProperty(self, a2, 152, 1);
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_CUIStyleEffects;
}

- (CUICatalog)cuiCatalog
{
  return self->_CUICatalog;
}

- (double)scaledBaselineOffset
{
  return self->_scaledBaselineOffset;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSStringDrawingContext;
  -[NSStringDrawingContext dealloc](&v3, sel_dealloc);
}

- (CGRect)totalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_totalBounds.origin.x;
  y = self->_totalBounds.origin.y;
  width = self->_totalBounds.size.width;
  height = self->_totalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)NSStringDrawingContext;
  v4 = -[NSStringDrawingContext description](&v6, sel_description);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nminimumScaleFactor:%f minimumTrackingAdjustment:%f actualScaleFactor:%f actualTrackingAdjustment:%f totalBounds:%@"), v4, *(_QWORD *)&self->_minimumScaleFactor, *(_QWORD *)&self->_minimumTrackingAdjustment, *(_QWORD *)&self->_actualScaleFactor, *(_QWORD *)&self->_actualTrackingAdjustment, NSStringFromRect(self->_totalBounds));
}

- (id)layoutManager:(id)a3 linkAttributesForAttributes:(id)a4 forCharacterAtIndex:(unint64_t)a5
{
  id result;

  result = self->_linkTextAttributesProvider;
  if (result)
    return (id)(*((uint64_t (**)(id, id, unint64_t))result + 2))(result, a4, a5);
  return result;
}

- (BOOL)hasTruncatedRanges
{
  return self->_hasTruncatedRanges;
}

- (void)setHasTruncatedRanges:(BOOL)a3
{
  self->_hasTruncatedRanges = a3;
}

- (CGFloat)actualTrackingAdjustment
{
  return self->_actualTrackingAdjustment;
}

- (void)setActualTrackingAdjustment:(double)a3
{
  self->_actualTrackingAdjustment = a3;
}

@end
