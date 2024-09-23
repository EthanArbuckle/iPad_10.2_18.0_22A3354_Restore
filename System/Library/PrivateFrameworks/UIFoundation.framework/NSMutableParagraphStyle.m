@implementation NSMutableParagraphStyle

- (void)setAlignment:(NSTextAlignment)alignment
{
  CTTextAlignment v5;
  _QWORD *extraData;

  os_unfair_lock_lock_with_options();
  v5 = NSTextAlignmentToCTTextAlignment(alignment);
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v5 & 0xF);
  extraData = self->super._extraData;
  if (extraData)
  {
    if ((v5 & 0xFu) <= 4)
    {
      extraData[15] = qword_18D6CBF40[v5 & 0xF];
      *((_BYTE *)extraData + 82) = 0x1000000uLL >> (8 * (v5 & 0xFu));
      extraData = self->super._extraData;
    }
    *((_BYTE *)extraData + 83) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setParagraphStyle:(NSParagraphStyle *)obj
{
  _BOOL8 v5;
  _BOOL8 v6;
  int64_t v7;
  float v8;
  float v9;
  double v10;
  BOOL v11;

  -[NSMutableParagraphStyle setAlignment:](self, "setAlignment:", -[NSParagraphStyle alignment](obj, "alignment"));
  -[NSParagraphStyle lineSpacing](obj, "lineSpacing");
  -[NSMutableParagraphStyle setLineSpacing:](self, "setLineSpacing:");
  -[NSMutableParagraphStyle setLineBreakMode:](self, "setLineBreakMode:", -[NSParagraphStyle lineBreakMode](obj, "lineBreakMode"));
  -[NSParagraphStyle firstLineHeadIndent](obj, "firstLineHeadIndent");
  -[NSMutableParagraphStyle setFirstLineHeadIndent:](self, "setFirstLineHeadIndent:");
  -[NSParagraphStyle paragraphSpacing](obj, "paragraphSpacing");
  -[NSMutableParagraphStyle setParagraphSpacing:](self, "setParagraphSpacing:");
  -[NSParagraphStyle headIndent](obj, "headIndent");
  -[NSMutableParagraphStyle setHeadIndent:](self, "setHeadIndent:");
  -[NSParagraphStyle tailIndent](obj, "tailIndent");
  -[NSMutableParagraphStyle setTailIndent:](self, "setTailIndent:");
  -[NSParagraphStyle minimumLineHeight](obj, "minimumLineHeight");
  -[NSMutableParagraphStyle setMinimumLineHeight:](self, "setMinimumLineHeight:");
  -[NSParagraphStyle maximumLineHeight](obj, "maximumLineHeight");
  -[NSMutableParagraphStyle setMaximumLineHeight:](self, "setMaximumLineHeight:");
  -[NSMutableParagraphStyle setTabStops:](self, "setTabStops:", -[NSParagraphStyle tabStops](obj, "tabStops"));
  -[NSMutableParagraphStyle setBaseWritingDirection:](self, "setBaseWritingDirection:", -[NSParagraphStyle baseWritingDirection](obj, "baseWritingDirection"));
  -[NSParagraphStyle lineHeightMultiple](obj, "lineHeightMultiple");
  -[NSMutableParagraphStyle setLineHeightMultiple:](self, "setLineHeightMultiple:");
  -[NSParagraphStyle paragraphSpacingBefore](obj, "paragraphSpacingBefore");
  -[NSMutableParagraphStyle setParagraphSpacingBefore:](self, "setParagraphSpacingBefore:");
  -[NSParagraphStyle defaultTabInterval](obj, "defaultTabInterval");
  -[NSMutableParagraphStyle setDefaultTabInterval:](self, "setDefaultTabInterval:");
  -[NSParagraphStyle tighteningFactorForTruncation](obj, "tighteningFactorForTruncation");
  -[NSMutableParagraphStyle setTighteningFactorForTruncation:](self, "setTighteningFactorForTruncation:");
  -[NSMutableParagraphStyle setHeaderLevel:](self, "setHeaderLevel:", -[NSParagraphStyle headerLevel](obj, "headerLevel"));
  -[NSMutableParagraphStyle setTextBlocks:](self, "setTextBlocks:", -[NSParagraphStyle textBlocks](obj, "textBlocks"));
  -[NSMutableParagraphStyle setTextLists:](self, "setTextLists:", -[NSParagraphStyle textLists](obj, "textLists"));
  -[NSMutableParagraphStyle setAllowsDefaultTighteningForTruncation:](self, "setAllowsDefaultTighteningForTruncation:", -[NSParagraphStyle allowsDefaultTighteningForTruncation](obj, "allowsDefaultTighteningForTruncation"));
  -[NSMutableParagraphStyle setLineBreakStrategy:](self, "setLineBreakStrategy:", -[NSParagraphStyle lineBreakStrategy](obj, "lineBreakStrategy"));
  v5 = -[NSParagraphStyle usesDefaultHyphenation](obj, "usesDefaultHyphenation");
  v6 = -[NSParagraphStyle spansAllLines](obj, "spansAllLines");
  v7 = -[NSParagraphStyle secondaryLineBreakMode](obj, "secondaryLineBreakMode");
  -[NSParagraphStyle hyphenationFactor](obj, "hyphenationFactor");
  v9 = v8;
  -[NSMutableParagraphStyle setUsesDefaultHyphenation:](self, "setUsesDefaultHyphenation:", v5);
  LODWORD(v10) = 0;
  if (!v5 || *(float *)&__NSDefaultHyphenationFactor != v9)
    *(float *)&v10 = v9;
  -[NSMutableParagraphStyle setHyphenationFactor:](self, "setHyphenationFactor:", v10);
  -[NSMutableParagraphStyle setSpansAllLines:](self, "setSpansAllLines:", v6);
  -[NSMutableParagraphStyle setSecondaryLineBreakMode:](self, "setSecondaryLineBreakMode:", v7);
  -[NSMutableParagraphStyle setHorizontalAlignment:](self, "setHorizontalAlignment:", -[NSParagraphStyle horizontalAlignment](obj, "horizontalAlignment"));
  -[NSMutableParagraphStyle setFullyJustified:](self, "setFullyJustified:", -[NSParagraphStyle isFullyJustified](obj, "isFullyJustified"));
  v11 = -[NSParagraphStyle _alignmentFollowsWritingDirection](obj, "_alignmentFollowsWritingDirection");
  if (v11 || self->super._extraData)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_BYTE *)self->super._extraData + 83) = v11;
  }
  -[NSMutableParagraphStyle setCompositionLanguage:](self, "setCompositionLanguage:", -[NSParagraphStyle compositionLanguage](obj, "compositionLanguage"));
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  char v3;

  v3 = lineBreakMode;
  os_unfair_lock_lock_with_options();
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFF0F | (16 * (v3 & 0xF)));
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
  int v3;

  if (allowsDefaultTighteningForTruncation)
    v3 = 0x2000;
  else
    v3 = 0;
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFDFFF | v3);
}

- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple
{
  CGFloat *extraData;
  $22B4A0797DCB34CD9773A3EA0AC32B0B v6;

  extraData = (CGFloat *)self->super._extraData;
  if (extraData)
    goto LABEL_2;
  if (lineHeightMultiple == 0.0)
  {
    os_unfair_lock_lock_with_options();
    v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF);
  }
  else if (lineHeightMultiple == 1.0)
  {
    os_unfair_lock_lock_with_options();
    v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF | 0x800);
  }
  else if (lineHeightMultiple == 1.5)
  {
    os_unfair_lock_lock_with_options();
    v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF | 0x1000);
  }
  else
  {
    if (lineHeightMultiple != 2.0)
    {
      -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
      extraData = (CGFloat *)self->super._extraData;
LABEL_2:
      extraData[1] = lineHeightMultiple;
      return;
    }
    os_unfair_lock_lock_with_options();
    v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags | 0x1800);
  }
  self->super._flags = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setHyphenationFactor:(float)hyphenationFactor
{
  double *extraData;
  double v5;

  extraData = (double *)self->super._extraData;
  if (extraData)
  {
    extraData[3] = hyphenationFactor;
  }
  else if (hyphenationFactor != 0.0)
  {
    v5 = hyphenationFactor;
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((double *)self->super._extraData + 3) = v5;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setSpansAllLines:(BOOL)a3
{
  if (-[NSParagraphStyle spansAllLines](self, "spansAllLines") != a3)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_BYTE *)self->super._extraData + 81) = a3;
  }
}

- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight
{
  self->super._minimumLineHeight = minimumLineHeight;
}

- (void)setLineBreakStrategy:(NSLineBreakStrategy)lineBreakStrategy
{
  _QWORD *extraData;

  extraData = self->super._extraData;
  if (extraData)
  {
    extraData[9] = lineBreakStrategy;
  }
  else if (lineBreakStrategy)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 9) = lineBreakStrategy;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight
{
  self->super._maximumLineHeight = maximumLineHeight;
}

- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
  self->super._firstLineHeadIndent = firstLineHeadIndent;
}

- (void)setLineSpacing:(CGFloat)lineSpacing
{
  self->super._lineSpacing = lineSpacing;
}

- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection
{
  unsigned int v5;
  uint64_t v6;
  int v7;

  if (baseWritingDirection == NSWritingDirectionNatural)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection");
    os_unfair_lock_lock_with_options();
    if (v6 == 1)
      v7 = 1536;
    else
      v7 = 512;
    v5 = v7 | *(_DWORD *)&self->super._flags & 0xFFFFF9FF;
  }
  else
  {
    os_unfair_lock_lock_with_options();
    v5 = *(_DWORD *)&self->super._flags & 0xFFFFF9FF | ((baseWritingDirection == NSWritingDirectionRightToLeft) << 10);
  }
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)v5;
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setTabStops:(NSArray *)tabStops
{
  NSArray *v4;
  NSArray *v6;
  $22B4A0797DCB34CD9773A3EA0AC32B0B v7;

  v4 = self->super._tabStops;
  if (v4 != tabStops)
  {
    v6 = v4;
    if (defaultTabStops_onceToken != -1)
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_394);
    if ((NSArray *)defaultTabStops_array == tabStops)
    {
      self->super._tabStops = 0;
      os_unfair_lock_lock_with_options();
      v7 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFEFF);
    }
    else
    {
      self->super._tabStops = (NSArray *)-[NSArray mutableCopyWithZone:](tabStops, "mutableCopyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
      os_unfair_lock_lock_with_options();
      v7 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags | 0x100);
    }
    self->super._flags = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval
{
  self->super._defaultTabInterval = defaultTabInterval;
}

- (void)setParagraphSpacing:(CGFloat)paragraphSpacing
{
  self->super._paragraphSpacing = paragraphSpacing;
}

- (void)setHeadIndent:(CGFloat)headIndent
{
  self->super._headIndent = headIndent;
}

- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore
{
  CGFloat *extraData;

  extraData = (CGFloat *)self->super._extraData;
  if (extraData)
  {
    extraData[2] = paragraphSpacingBefore;
  }
  else if (paragraphSpacingBefore != 0.0)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((CGFloat *)self->super._extraData + 2) = paragraphSpacingBefore;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation
{
  _BYTE *extraData;

  if (-[NSParagraphStyle usesDefaultHyphenation](self, "usesDefaultHyphenation") != usesDefaultHyphenation)
  {
    extraData = self->super._extraData;
    if (!extraData)
    {
      -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
      extraData = self->super._extraData;
    }
    extraData[80] = usesDefaultHyphenation;
  }
}

- (void)setTighteningFactorForTruncation:(float)tighteningFactorForTruncation
{
  float v3;
  double *extraData;
  double v6;

  v3 = tighteningFactorForTruncation;
  extraData = (double *)self->super._extraData;
  v6 = tighteningFactorForTruncation;
  if (extraData)
  {
    extraData[4] = v6;
  }
  else
  {
    *(_QWORD *)&tighteningFactorForTruncation = __NSTightenFactor;
    if (*(double *)&__NSTightenFactor != v6)
    {
      -[NSParagraphStyle _allocExtraData](self, "_allocExtraData", *(double *)&__NSTightenFactor);
      *((double *)self->super._extraData + 4) = v6;
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
    }
  }
  if (v3 == 0.0)
    -[NSMutableParagraphStyle setAllowsDefaultTighteningForTruncation:](self, "setAllowsDefaultTighteningForTruncation:", 0, *(double *)&tighteningFactorForTruncation);
}

- (void)setTextLists:(NSArray *)textLists
{
  id extraData;
  NSArray *v6;
  NSArray *v7;

  extraData = self->super._extraData;
  if (extraData)
  {
    v6 = (NSArray *)*((_QWORD *)extraData + 7);
    if (v6 != textLists)
    {
      v7 = v6;
      *((_QWORD *)self->super._extraData + 7) = -[NSArray copyWithZone:](textLists, "copyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    }
  }
  else if (textLists)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 7) = -[NSArray copyWithZone:](textLists, "copyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setTextBlocks:(NSArray *)textBlocks
{
  id extraData;
  NSArray *v6;
  NSArray *v7;

  extraData = self->super._extraData;
  if (extraData)
  {
    v6 = (NSArray *)*((_QWORD *)extraData + 6);
    if (v6 != textBlocks)
    {
      v7 = v6;
      *((_QWORD *)self->super._extraData + 6) = -[NSArray copyWithZone:](textBlocks, "copyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    }
  }
  else if (textBlocks)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 6) = -[NSArray copyWithZone:](textBlocks, "copyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setTailIndent:(CGFloat)tailIndent
{
  self->super._tailIndent = tailIndent;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v5;
  _QWORD *extraData;
  int v7;
  int v8;
  int v9;

  v5 = -[NSParagraphStyle horizontalAlignment](self, "horizontalAlignment");
  if (!a3 || v5 != a3)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    extraData = self->super._extraData;
    extraData[15] = a3;
    *((_BYTE *)extraData + 83) = 1;
    v7 = *((unsigned __int8 *)extraData + 82);
    v8 = a3 - 2;
    if ((unint64_t)(a3 - 2) >= 3)
      v8 = 4;
    if (v7)
      v9 = 3;
    else
      v9 = v8;
    self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v9);
  }
}

- (void)setHeaderLevel:(NSInteger)headerLevel
{
  _QWORD *extraData;

  extraData = self->super._extraData;
  if (extraData)
  {
    extraData[5] = headerLevel;
  }
  else if (headerLevel)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 5) = headerLevel;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setFullyJustified:(BOOL)a3
{
  _BYTE *extraData;
  unint64_t v6;

  if (-[NSParagraphStyle isFullyJustified](self, "isFullyJustified") != a3)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    extraData = self->super._extraData;
    extraData[82] = a3;
    if (a3)
    {
      LODWORD(v6) = 3;
    }
    else
    {
      v6 = *((_QWORD *)extraData + 15) - 2;
      if (v6 >= 3)
        LODWORD(v6) = 4;
    }
    self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v6);
  }
}

- (void)setCompositionLanguage:(int64_t)a3
{
  _QWORD *extraData;

  if (-[NSParagraphStyle compositionLanguage](self, "compositionLanguage") != a3)
  {
    extraData = self->super._extraData;
    if (!extraData)
    {
      -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
      extraData = self->super._extraData;
    }
    extraData[11] = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSParagraphStyle _initWithParagraphStyle:](+[NSParagraphStyle allocWithZone:](NSParagraphStyle, "allocWithZone:", -[NSMutableParagraphStyle zone](self, "zone", a3)), "_initWithParagraphStyle:", self);
}

- (void)setSecondaryLineBreakMode:(int64_t)a3
{
  if (-[NSParagraphStyle secondaryLineBreakMode](self, "secondaryLineBreakMode") != a3)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 16) = a3;
  }
}

- (void)_mutateTabStops
{
  NSArray *tabStops;
  NSArray *v4;

  tabStops = self->super._tabStops;
  if (tabStops)
  {
    if ((*((_BYTE *)&self->super._flags + 1) & 1) == 0)
    {
      v4 = tabStops;
      self->super._tabStops = (NSArray *)-[NSArray mutableCopyWithZone:](tabStops, "mutableCopyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);

    }
  }
  else
  {
    if (defaultTabStops_onceToken != -1)
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_394);
    self->super._tabStops = (NSArray *)objc_msgSend((id)defaultTabStops_array, "mutableCopyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)addTabStop:(NSTextTab *)anObject
{
  double v5;
  double v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  double v11;
  NSArray *tabStops;

  -[NSTextTab location](anObject, "location");
  v6 = v5;
  -[NSMutableParagraphStyle _mutateTabStops](self, "_mutateTabStops");
  v7 = -[NSArray count](self->super._tabStops, "count");
  v8 = 0;
  do
  {
    v9 = v8;
    v10 = v7 + v8;
    if ((uint64_t)(v7 + v8) < 1)
      break;
    --v8;
    objc_msgSend(-[NSArray objectAtIndex:](self->super._tabStops, "objectAtIndex:", v9 - 1 + v7), "location");
  }
  while (v11 > v6);
  tabStops = self->super._tabStops;
  if (v9)
    -[NSArray insertObject:atIndex:](tabStops, "insertObject:atIndex:", anObject, v10);
  else
    -[NSArray addObject:](tabStops, "addObject:", anObject);
}

- (void)removeTabStop:(NSTextTab *)anObject
{
  NSUInteger v5;

  -[NSMutableParagraphStyle _mutateTabStops](self, "_mutateTabStops");
  v5 = -[NSArray indexOfObject:](self->super._tabStops, "indexOfObject:", anObject);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSArray removeObjectAtIndex:](self->super._tabStops, "removeObjectAtIndex:", v5);
}

- (void)_setLineBoundsOptions:(unint64_t)a3
{
  -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
  *((_QWORD *)self->super._extraData + 8) = a3;
  if (object_getClass(self) != (Class)__NSMutableParagraphStyleClass)
  {
    -[NSMutableParagraphStyle setAllowsHangingPunctuation:](self, "setAllowsHangingPunctuation:", (a3 >> 2) & 1);
    -[NSMutableParagraphStyle setUsesOpticalAlignment:](self, "setUsesOpticalAlignment:", (a3 >> 4) & 1);
  }
}

- (void)setAllowsHangingPunctuation:(BOOL)a3
{
  unint64_t extraData;
  uint64_t v5;
  unint64_t v6;

  extraData = (unint64_t)self->super._extraData;
  if (extraData)
    extraData = *(_QWORD *)(extraData + 64) & 0xFFFFFFFFFFFFFFFBLL;
  v5 = 4;
  if (!a3)
    v5 = 0;
  v6 = extraData | v5;
  -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
  *((_QWORD *)self->super._extraData + 8) = v6;
}

- (void)setUsesOpticalAlignment:(BOOL)a3
{
  unint64_t extraData;
  uint64_t v5;
  unint64_t v6;

  extraData = (unint64_t)self->super._extraData;
  if (extraData)
    extraData = *(_QWORD *)(extraData + 64) & 0xFFFFFFFFFFFFFFEFLL;
  v5 = 16;
  if (!a3)
    v5 = 0;
  v6 = extraData | v5;
  -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
  *((_QWORD *)self->super._extraData + 8) = v6;
}

- (void)setCodeBlockIntentLanguageHint:(id)a3
{
  id v5;

  -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
  v5 = (id)*((_QWORD *)self->super._extraData + 14);
  if (v5 != a3)
  {

    *((_QWORD *)self->super._extraData + 14) = objc_msgSend(a3, "copy");
  }
}

- (void)_setPresentationIntents:(id)a3
{
  id v5;

  -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
  v5 = (id)*((_QWORD *)self->super._extraData + 12);
  if (v5 != a3)
  {

    *((_QWORD *)self->super._extraData + 12) = objc_msgSend(a3, "copy");
  }
}

- (void)_setListIntentOrdinal:(int64_t)a3
{
  if (a3 || self->super._extraData)
  {
    -[NSParagraphStyle _allocExtraData](self, "_allocExtraData");
    *((_QWORD *)self->super._extraData + 13) = a3;
  }
}

@end
