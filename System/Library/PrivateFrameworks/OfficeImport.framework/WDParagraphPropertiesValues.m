@implementation WDParagraphPropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  WDParagraphPropertiesValues *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = -[WDParagraphPropertiesValues init](+[WDParagraphPropertiesValues allocWithZone:](WDParagraphPropertiesValues, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[WDParagraphPropertiesValues baseStyle](self, "baseStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setBaseStyle:](v4, "setBaseStyle:", v5);

    -[WDParagraphPropertiesValues topBorder](self, "topBorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setTopBorder:](v4, "setTopBorder:", v6);

    -[WDParagraphPropertiesValues leftBorder](self, "leftBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setLeftBorder:](v4, "setLeftBorder:", v7);

    -[WDParagraphPropertiesValues bottomBorder](self, "bottomBorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setBottomBorder:](v4, "setBottomBorder:", v8);

    -[WDParagraphPropertiesValues rightBorder](self, "rightBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setRightBorder:](v4, "setRightBorder:", v9);

    -[WDParagraphPropertiesValues betweenBorder](self, "betweenBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setBetweenBorder:](v4, "setBetweenBorder:", v10);

    -[WDParagraphPropertiesValues barBorder](self, "barBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setBarBorder:](v4, "setBarBorder:", v11);

    -[WDParagraphPropertiesValues shading](self, "shading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setShading:](v4, "setShading:", v12);

    -[WDParagraphPropertiesValues setDropCap:](v4, "setDropCap:", (unsigned __int16)-[WDParagraphPropertiesValues dropCap](self, "dropCap"));
    -[WDParagraphPropertiesValues tabStopAddedTable](self, "tabStopAddedTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setTabStopAddedTable:](v4, "setTabStopAddedTable:", v13);

    -[WDParagraphPropertiesValues tabStopDeletedTable](self, "tabStopDeletedTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDParagraphPropertiesValues setTabStopDeletedTable:](v4, "setTabStopDeletedTable:", v14);

    -[WDParagraphPropertiesValues setListIndex:](v4, "setListIndex:", -[WDParagraphPropertiesValues listIndex](self, "listIndex"));
    -[WDParagraphPropertiesValues setTabStopAddedCount:](v4, "setTabStopAddedCount:", -[WDParagraphPropertiesValues tabStopAddedCount](self, "tabStopAddedCount"));
    -[WDParagraphPropertiesValues setTabStopDeletedCount:](v4, "setTabStopDeletedCount:", -[WDParagraphPropertiesValues tabStopDeletedCount](self, "tabStopDeletedCount"));
    -[WDParagraphPropertiesValues setWidth:](v4, "setWidth:", -[WDParagraphPropertiesValues width](self, "width"));
    -[WDParagraphPropertiesValues setVerticalSpace:](v4, "setVerticalSpace:", -[WDParagraphPropertiesValues verticalSpace](self, "verticalSpace"));
    -[WDParagraphPropertiesValues setHorizontalSpace:](v4, "setHorizontalSpace:", -[WDParagraphPropertiesValues horizontalSpace](self, "horizontalSpace"));
    -[WDParagraphPropertiesValues setHorizontalPosition:](v4, "setHorizontalPosition:", -[WDParagraphPropertiesValues horizontalPosition](self, "horizontalPosition"));
    -[WDParagraphPropertiesValues setVerticalPosition:](v4, "setVerticalPosition:", -[WDParagraphPropertiesValues verticalPosition](self, "verticalPosition"));
    -[WDParagraphPropertiesValues setLineSpacing:](v4, "setLineSpacing:", -[WDParagraphPropertiesValues lineSpacing](self, "lineSpacing"));
    -[WDParagraphPropertiesValues setLeftIndent:](v4, "setLeftIndent:", -[WDParagraphPropertiesValues leftIndent](self, "leftIndent"));
    -[WDParagraphPropertiesValues setRightIndent:](v4, "setRightIndent:", -[WDParagraphPropertiesValues rightIndent](self, "rightIndent"));
    -[WDParagraphPropertiesValues setLeadingIndent:](v4, "setLeadingIndent:", -[WDParagraphPropertiesValues leadingIndent](self, "leadingIndent"));
    -[WDParagraphPropertiesValues setFollowingIndent:](v4, "setFollowingIndent:", -[WDParagraphPropertiesValues followingIndent](self, "followingIndent"));
    -[WDParagraphPropertiesValues setFirstLineIndent:](v4, "setFirstLineIndent:", -[WDParagraphPropertiesValues firstLineIndent](self, "firstLineIndent"));
    -[WDParagraphPropertiesValues setLeftIndentChars:](v4, "setLeftIndentChars:", -[WDParagraphPropertiesValues leftIndentChars](self, "leftIndentChars"));
    -[WDParagraphPropertiesValues setRightIndentChars:](v4, "setRightIndentChars:", -[WDParagraphPropertiesValues rightIndentChars](self, "rightIndentChars"));
    -[WDParagraphPropertiesValues setFirstLineIndentChars:](v4, "setFirstLineIndentChars:", -[WDParagraphPropertiesValues firstLineIndentChars](self, "firstLineIndentChars"));
    -[WDParagraphPropertiesValues setSpaceBefore:](v4, "setSpaceBefore:", -[WDParagraphPropertiesValues spaceBefore](self, "spaceBefore"));
    -[WDParagraphPropertiesValues setSpaceAfter:](v4, "setSpaceAfter:", -[WDParagraphPropertiesValues spaceAfter](self, "spaceAfter"));
    -[WDParagraphPropertiesValues setHeight:](v4, "setHeight:", -[WDParagraphPropertiesValues height](self, "height"));
    -[WDParagraphPropertiesValues setOutlineLevel:](v4, "setOutlineLevel:", -[WDParagraphPropertiesValues outlineLevel](self, "outlineLevel"));
    -[WDParagraphPropertiesValues setIndexToAuthorIDOfFormattingChange:](v4, "setIndexToAuthorIDOfFormattingChange:", -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChange](self, "indexToAuthorIDOfFormattingChange"));
    -[WDParagraphPropertiesValues setWrapCode:](v4, "setWrapCode:", -[WDParagraphPropertiesValues wrapCode](self, "wrapCode"));
    -[WDParagraphPropertiesValues setHorizontalAnchor:](v4, "setHorizontalAnchor:", -[WDParagraphPropertiesValues horizontalAnchor](self, "horizontalAnchor"));
    -[WDParagraphPropertiesValues setVerticalAnchor:](v4, "setVerticalAnchor:", -[WDParagraphPropertiesValues verticalAnchor](self, "verticalAnchor"));
    -[WDParagraphPropertiesValues setLineSpacingRule:](v4, "setLineSpacingRule:", -[WDParagraphPropertiesValues lineSpacingRule](self, "lineSpacingRule"));
    -[WDParagraphPropertiesValues setHeightRule:](v4, "setHeightRule:", -[WDParagraphPropertiesValues heightRule](self, "heightRule"));
    -[WDParagraphPropertiesValues setListLevel:](v4, "setListLevel:", -[WDParagraphPropertiesValues listLevel](self, "listLevel"));
    -[WDParagraphPropertiesValues setJustification:](v4, "setJustification:", -[WDParagraphPropertiesValues justification](self, "justification"));
    -[WDParagraphPropertiesValues setPhysicalJustification:](v4, "setPhysicalJustification:", -[WDParagraphPropertiesValues physicalJustification](self, "physicalJustification"));
    -[WDParagraphPropertiesValues setFormattingChanged:](v4, "setFormattingChanged:", -[WDParagraphPropertiesValues formattingChanged](self, "formattingChanged"));
    -[WDParagraphPropertiesValues setBaseStyleOverridden:](v4, "setBaseStyleOverridden:", -[WDParagraphPropertiesValues baseStyleOverridden](self, "baseStyleOverridden"));
    -[WDParagraphPropertiesValues setPageBreakBefore:](v4, "setPageBreakBefore:", -[WDParagraphPropertiesValues pageBreakBefore](self, "pageBreakBefore"));
    -[WDParagraphPropertiesValues setPageBreakBeforeOverridden:](v4, "setPageBreakBeforeOverridden:", -[WDParagraphPropertiesValues pageBreakBeforeOverridden](self, "pageBreakBeforeOverridden"));
    -[WDParagraphPropertiesValues setListLevelOverridden:](v4, "setListLevelOverridden:", -[WDParagraphPropertiesValues listLevelOverridden](self, "listLevelOverridden"));
    -[WDParagraphPropertiesValues setListIndexOverridden:](v4, "setListIndexOverridden:", -[WDParagraphPropertiesValues listIndexOverridden](self, "listIndexOverridden"));
    -[WDParagraphPropertiesValues setTopBorderOverridden:](v4, "setTopBorderOverridden:", -[WDParagraphPropertiesValues topBorderOverridden](self, "topBorderOverridden"));
    -[WDParagraphPropertiesValues setLeftBorderOverridden:](v4, "setLeftBorderOverridden:", -[WDParagraphPropertiesValues leftBorderOverridden](self, "leftBorderOverridden"));
    -[WDParagraphPropertiesValues setBottomBorderOverridden:](v4, "setBottomBorderOverridden:", -[WDParagraphPropertiesValues bottomBorderOverridden](self, "bottomBorderOverridden"));
    -[WDParagraphPropertiesValues setRightBorderOverridden:](v4, "setRightBorderOverridden:", -[WDParagraphPropertiesValues rightBorderOverridden](self, "rightBorderOverridden"));
    -[WDParagraphPropertiesValues setBetweenBorderOverridden:](v4, "setBetweenBorderOverridden:", -[WDParagraphPropertiesValues betweenBorderOverridden](self, "betweenBorderOverridden"));
    -[WDParagraphPropertiesValues setBarBorderOverridden:](v4, "setBarBorderOverridden:", -[WDParagraphPropertiesValues barBorderOverridden](self, "barBorderOverridden"));
    -[WDParagraphPropertiesValues setShadingOverridden:](v4, "setShadingOverridden:", -[WDParagraphPropertiesValues shadingOverridden](self, "shadingOverridden"));
    -[WDParagraphPropertiesValues setDropCapOverridden:](v4, "setDropCapOverridden:", -[WDParagraphPropertiesValues dropCapOverridden](self, "dropCapOverridden"));
    -[WDParagraphPropertiesValues setWidthOverridden:](v4, "setWidthOverridden:", -[WDParagraphPropertiesValues widthOverridden](self, "widthOverridden"));
    -[WDParagraphPropertiesValues setHeightOverridden:](v4, "setHeightOverridden:", -[WDParagraphPropertiesValues heightOverridden](self, "heightOverridden"));
    -[WDParagraphPropertiesValues setHeightRuleOverridden:](v4, "setHeightRuleOverridden:", -[WDParagraphPropertiesValues heightRuleOverridden](self, "heightRuleOverridden"));
    -[WDParagraphPropertiesValues setVerticalSpaceOverridden:](v4, "setVerticalSpaceOverridden:", -[WDParagraphPropertiesValues verticalSpaceOverridden](self, "verticalSpaceOverridden"));
    -[WDParagraphPropertiesValues setHorizontalSpaceOverridden:](v4, "setHorizontalSpaceOverridden:", -[WDParagraphPropertiesValues horizontalSpaceOverridden](self, "horizontalSpaceOverridden"));
    -[WDParagraphPropertiesValues setWrap:](v4, "setWrap:", -[WDParagraphPropertiesValues wrap](self, "wrap"));
    -[WDParagraphPropertiesValues setWrapOverridden:](v4, "setWrapOverridden:", -[WDParagraphPropertiesValues wrapOverridden](self, "wrapOverridden"));
    -[WDParagraphPropertiesValues setHorizontalAnchorOverridden:](v4, "setHorizontalAnchorOverridden:", -[WDParagraphPropertiesValues horizontalAnchorOverridden](self, "horizontalAnchorOverridden"));
    -[WDParagraphPropertiesValues setVerticalAnchorOverridden:](v4, "setVerticalAnchorOverridden:", -[WDParagraphPropertiesValues verticalAnchorOverridden](self, "verticalAnchorOverridden"));
    -[WDParagraphPropertiesValues setHorizontalPositionOverridden:](v4, "setHorizontalPositionOverridden:", -[WDParagraphPropertiesValues horizontalPositionOverridden](self, "horizontalPositionOverridden"));
    -[WDParagraphPropertiesValues setVerticalPositionOverridden:](v4, "setVerticalPositionOverridden:", -[WDParagraphPropertiesValues verticalPositionOverridden](self, "verticalPositionOverridden"));
    -[WDParagraphPropertiesValues setWrapCodeOverridden:](v4, "setWrapCodeOverridden:", -[WDParagraphPropertiesValues wrapCodeOverridden](self, "wrapCodeOverridden"));
    -[WDParagraphPropertiesValues setAnchorLock:](v4, "setAnchorLock:", -[WDParagraphPropertiesValues anchorLock](self, "anchorLock"));
    -[WDParagraphPropertiesValues setAnchorLockOverridden:](v4, "setAnchorLockOverridden:", -[WDParagraphPropertiesValues anchorLockOverridden](self, "anchorLockOverridden"));
    -[WDParagraphPropertiesValues setSpaceBeforeOverridden:](v4, "setSpaceBeforeOverridden:", -[WDParagraphPropertiesValues spaceBeforeOverridden](self, "spaceBeforeOverridden"));
    -[WDParagraphPropertiesValues setSpaceBeforeAuto:](v4, "setSpaceBeforeAuto:", -[WDParagraphPropertiesValues spaceBeforeAuto](self, "spaceBeforeAuto"));
    -[WDParagraphPropertiesValues setSpaceBeforeAutoOverridden:](v4, "setSpaceBeforeAutoOverridden:", -[WDParagraphPropertiesValues spaceBeforeAutoOverridden](self, "spaceBeforeAutoOverridden"));
    -[WDParagraphPropertiesValues setSpaceAfterOverridden:](v4, "setSpaceAfterOverridden:", -[WDParagraphPropertiesValues spaceAfterOverridden](self, "spaceAfterOverridden"));
    -[WDParagraphPropertiesValues setSpaceAfterAuto:](v4, "setSpaceAfterAuto:", -[WDParagraphPropertiesValues spaceAfterAuto](self, "spaceAfterAuto"));
    -[WDParagraphPropertiesValues setSpaceAfterAutoOverridden:](v4, "setSpaceAfterAutoOverridden:", -[WDParagraphPropertiesValues spaceAfterAutoOverridden](self, "spaceAfterAutoOverridden"));
    -[WDParagraphPropertiesValues setLineSpacingOverridden:](v4, "setLineSpacingOverridden:", -[WDParagraphPropertiesValues lineSpacingOverridden](self, "lineSpacingOverridden"));
    -[WDParagraphPropertiesValues setLineSpacingRuleOverridden:](v4, "setLineSpacingRuleOverridden:", -[WDParagraphPropertiesValues lineSpacingRuleOverridden](self, "lineSpacingRuleOverridden"));
    -[WDParagraphPropertiesValues setLeftIndentOverridden:](v4, "setLeftIndentOverridden:", -[WDParagraphPropertiesValues leftIndentOverridden](self, "leftIndentOverridden"));
    -[WDParagraphPropertiesValues setRightIndentOverridden:](v4, "setRightIndentOverridden:", -[WDParagraphPropertiesValues rightIndentOverridden](self, "rightIndentOverridden"));
    -[WDParagraphPropertiesValues setLeadingIndentOverridden:](v4, "setLeadingIndentOverridden:", -[WDParagraphPropertiesValues leadingIndentOverridden](self, "leadingIndentOverridden"));
    -[WDParagraphPropertiesValues setFollowingIndentOverridden:](v4, "setFollowingIndentOverridden:", -[WDParagraphPropertiesValues followingIndentOverridden](self, "followingIndentOverridden"));
    -[WDParagraphPropertiesValues setFirstLineIndentOverridden:](v4, "setFirstLineIndentOverridden:", -[WDParagraphPropertiesValues firstLineIndentOverridden](self, "firstLineIndentOverridden"));
    -[WDParagraphPropertiesValues setLeftIndentCharsOverridden:](v4, "setLeftIndentCharsOverridden:", -[WDParagraphPropertiesValues leftIndentCharsOverridden](self, "leftIndentCharsOverridden"));
    -[WDParagraphPropertiesValues setRightIndentCharsOverridden:](v4, "setRightIndentCharsOverridden:", -[WDParagraphPropertiesValues rightIndentCharsOverridden](self, "rightIndentCharsOverridden"));
    -[WDParagraphPropertiesValues setFirstLineIndentCharsOverridden:](v4, "setFirstLineIndentCharsOverridden:", -[WDParagraphPropertiesValues firstLineIndentCharsOverridden](self, "firstLineIndentCharsOverridden"));
    -[WDParagraphPropertiesValues setJustificationOverridden:](v4, "setJustificationOverridden:", -[WDParagraphPropertiesValues justificationOverridden](self, "justificationOverridden"));
    -[WDParagraphPropertiesValues setPhysicalJustificationOverridden:](v4, "setPhysicalJustificationOverridden:", -[WDParagraphPropertiesValues physicalJustificationOverridden](self, "physicalJustificationOverridden"));
    -[WDParagraphPropertiesValues setOutlineLevelOverridden:](v4, "setOutlineLevelOverridden:", -[WDParagraphPropertiesValues outlineLevelOverridden](self, "outlineLevelOverridden"));
    -[WDParagraphPropertiesValues setKeepNextParagraphTogether:](v4, "setKeepNextParagraphTogether:", -[WDParagraphPropertiesValues keepNextParagraphTogether](self, "keepNextParagraphTogether"));
    -[WDParagraphPropertiesValues setKeepNextParagraphTogetherOverridden:](v4, "setKeepNextParagraphTogetherOverridden:", -[WDParagraphPropertiesValues keepNextParagraphTogetherOverridden](self, "keepNextParagraphTogetherOverridden"));
    -[WDParagraphPropertiesValues setKeepLinesTogether:](v4, "setKeepLinesTogether:", -[WDParagraphPropertiesValues keepLinesTogether](self, "keepLinesTogether"));
    -[WDParagraphPropertiesValues setKeepLinesTogetherOverridden:](v4, "setKeepLinesTogetherOverridden:", -[WDParagraphPropertiesValues keepLinesTogetherOverridden](self, "keepLinesTogetherOverridden"));
    -[WDParagraphPropertiesValues setSuppressAutoHyphens:](v4, "setSuppressAutoHyphens:", -[WDParagraphPropertiesValues suppressAutoHyphens](self, "suppressAutoHyphens"));
    -[WDParagraphPropertiesValues setSuppressAutoHyphensOverridden:](v4, "setSuppressAutoHyphensOverridden:", -[WDParagraphPropertiesValues suppressAutoHyphensOverridden](self, "suppressAutoHyphensOverridden"));
    -[WDParagraphPropertiesValues setSuppressLineNumbers:](v4, "setSuppressLineNumbers:", -[WDParagraphPropertiesValues suppressLineNumbers](self, "suppressLineNumbers"));
    -[WDParagraphPropertiesValues setSuppressLineNumbersOverridden:](v4, "setSuppressLineNumbersOverridden:", -[WDParagraphPropertiesValues suppressLineNumbersOverridden](self, "suppressLineNumbersOverridden"));
    -[WDParagraphPropertiesValues setWidowControl:](v4, "setWidowControl:", -[WDParagraphPropertiesValues widowControl](self, "widowControl"));
    -[WDParagraphPropertiesValues setWidowControlOverridden:](v4, "setWidowControlOverridden:", -[WDParagraphPropertiesValues widowControlOverridden](self, "widowControlOverridden"));
    -[WDParagraphPropertiesValues setKinsokuOff:](v4, "setKinsokuOff:", -[WDParagraphPropertiesValues kinsokuOff](self, "kinsokuOff"));
    -[WDParagraphPropertiesValues setKinsokuOffOverridden:](v4, "setKinsokuOffOverridden:", -[WDParagraphPropertiesValues kinsokuOffOverridden](self, "kinsokuOffOverridden"));
    -[WDParagraphPropertiesValues setTabStopAddedCountOverridden:](v4, "setTabStopAddedCountOverridden:", -[WDParagraphPropertiesValues tabStopAddedCountOverridden](self, "tabStopAddedCountOverridden"));
    -[WDParagraphPropertiesValues setTabStopDeletedCountOverridden:](v4, "setTabStopDeletedCountOverridden:", -[WDParagraphPropertiesValues tabStopDeletedCountOverridden](self, "tabStopDeletedCountOverridden"));
    -[WDParagraphPropertiesValues setFormattingChangedOverridden:](v4, "setFormattingChangedOverridden:", -[WDParagraphPropertiesValues formattingChangedOverridden](self, "formattingChangedOverridden"));
    -[WDParagraphPropertiesValues setBiDi:](v4, "setBiDi:", -[WDParagraphPropertiesValues biDi](self, "biDi"));
    -[WDParagraphPropertiesValues setBiDiOverridden:](v4, "setBiDiOverridden:", -[WDParagraphPropertiesValues biDiOverridden](self, "biDiOverridden"));
    -[WDParagraphPropertiesValues setCachedRtl:](v4, "setCachedRtl:", -[WDParagraphPropertiesValues cachedRtl](self, "cachedRtl"));
    -[WDParagraphPropertiesValues setCachedRtlOverridden:](v4, "setCachedRtlOverridden:", -[WDParagraphPropertiesValues cachedRtlOverridden](self, "cachedRtlOverridden"));
    -[WDParagraphPropertiesValues setIndexToAuthorIDOfFormattingChangeOverridden:](v4, "setIndexToAuthorIDOfFormattingChangeOverridden:", -[WDParagraphPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self, "indexToAuthorIDOfFormattingChangeOverridden"));
    -[WDParagraphPropertiesValues setContextualSpacing:](v4, "setContextualSpacing:", -[WDParagraphPropertiesValues contextualSpacing](self, "contextualSpacing"));
    -[WDParagraphPropertiesValues setContextualSpacingOverridden:](v4, "setContextualSpacingOverridden:", -[WDParagraphPropertiesValues contextualSpacingOverridden](self, "contextualSpacingOverridden"));
  }
  return v4;
}

- (BOOL)baseStyleOverridden
{
  return *((_BYTE *)self + 8) & 1;
}

- (void)setBaseStyleOverridden:(BOOL)a3
{
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFE | a3;
}

- (BOOL)pageBreakBefore
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setPageBreakBefore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFD | v3;
}

- (BOOL)pageBreakBeforeOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setPageBreakBeforeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v3;
}

- (BOOL)listLevelOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setListLevelOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xF7 | v3;
}

- (BOOL)listIndexOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setListIndexOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xEF | v3;
}

- (BOOL)topBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setTopBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xDF | v3;
}

- (BOOL)leftBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setLeftBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xBF | v3;
}

- (BOOL)bottomBorderOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setBottomBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = v3 & 0x80 | *((_BYTE *)self + 8) & 0x7F;
}

- (BOOL)rightBorderOverridden
{
  return *((_BYTE *)self + 9) & 1;
}

- (void)setRightBorderOverridden:(BOOL)a3
{
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFE | a3;
}

- (BOOL)betweenBorderOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setBetweenBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFD | v3;
}

- (BOOL)barBorderOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setBarBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFB | v3;
}

- (BOOL)shadingOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xF7 | v3;
}

- (BOOL)dropCapOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setDropCapOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xEF | v3;
}

- (BOOL)widthOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setWidthOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xDF | v3;
}

- (BOOL)heightOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setHeightOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xBF | v3;
}

- (BOOL)heightRuleOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setHeightRuleOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = v3 & 0x80 | *((_BYTE *)self + 9) & 0x7F;
}

- (BOOL)verticalSpaceOverridden
{
  return *((_BYTE *)self + 10) & 1;
}

- (void)setVerticalSpaceOverridden:(BOOL)a3
{
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFE | a3;
}

- (BOOL)horizontalSpaceOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setHorizontalSpaceOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFD | v3;
}

- (BOOL)wrap
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setWrap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFB | v3;
}

- (BOOL)wrapOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setWrapOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xF7 | v3;
}

- (BOOL)horizontalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setHorizontalAnchorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xEF | v3;
}

- (BOOL)verticalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setVerticalAnchorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xDF | v3;
}

- (BOOL)horizontalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setHorizontalPositionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xBF | v3;
}

- (BOOL)verticalPositionOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setVerticalPositionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = v3 & 0x80 | *((_BYTE *)self + 10) & 0x7F;
}

- (BOOL)wrapCodeOverridden
{
  return *((_BYTE *)self + 11) & 1;
}

- (void)setWrapCodeOverridden:(BOOL)a3
{
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFE | a3;
}

- (BOOL)anchorLock
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setAnchorLock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFD | v3;
}

- (BOOL)anchorLockOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setAnchorLockOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFB | v3;
}

- (BOOL)spaceBeforeOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setSpaceBeforeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xF7 | v3;
}

- (BOOL)spaceBeforeAuto
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setSpaceBeforeAuto:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xEF | v3;
}

- (BOOL)spaceBeforeAutoOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setSpaceBeforeAutoOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xDF | v3;
}

- (BOOL)spaceAfterOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setSpaceAfterOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xBF | v3;
}

- (BOOL)spaceAfterAuto
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setSpaceAfterAuto:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = v3 & 0x80 | *((_BYTE *)self + 11) & 0x7F;
}

- (BOOL)spaceAfterAutoOverridden
{
  return *((_BYTE *)self + 12) & 1;
}

- (void)setSpaceAfterAutoOverridden:(BOOL)a3
{
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFE | a3;
}

- (BOOL)lineSpacingOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setLineSpacingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFD | v3;
}

- (BOOL)lineSpacingRuleOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setLineSpacingRuleOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFB | v3;
}

- (BOOL)leftIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 3) & 1;
}

- (void)setLeftIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xF7 | v3;
}

- (BOOL)rightIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 4) & 1;
}

- (void)setRightIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xEF | v3;
}

- (BOOL)leadingIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 5) & 1;
}

- (void)setLeadingIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xDF | v3;
}

- (BOOL)followingIndentOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 6) & 1;
}

- (void)setFollowingIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xBF | v3;
}

- (BOOL)firstLineIndentOverridden
{
  return *((unsigned __int8 *)self + 12) >> 7;
}

- (void)setFirstLineIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = v3 & 0x80 | *((_BYTE *)self + 12) & 0x7F;
}

- (BOOL)leftIndentCharsOverridden
{
  return *((_BYTE *)self + 13) & 1;
}

- (void)setLeftIndentCharsOverridden:(BOOL)a3
{
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFE | a3;
}

- (BOOL)rightIndentCharsOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 1) & 1;
}

- (void)setRightIndentCharsOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFD | v3;
}

- (BOOL)firstLineIndentCharsOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 2) & 1;
}

- (void)setFirstLineIndentCharsOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFB | v3;
}

- (BOOL)justificationOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 3) & 1;
}

- (void)setJustificationOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xF7 | v3;
}

- (BOOL)physicalJustificationOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 4) & 1;
}

- (void)setPhysicalJustificationOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xEF | v3;
}

- (BOOL)outlineLevelOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 5) & 1;
}

- (void)setOutlineLevelOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xDF | v3;
}

- (BOOL)keepNextParagraphTogether
{
  return (*((unsigned __int8 *)self + 13) >> 6) & 1;
}

- (void)setKeepNextParagraphTogether:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xBF | v3;
}

- (BOOL)keepNextParagraphTogetherOverridden
{
  return *((unsigned __int8 *)self + 13) >> 7;
}

- (void)setKeepNextParagraphTogetherOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = v3 & 0x80 | *((_BYTE *)self + 13) & 0x7F;
}

- (BOOL)keepLinesTogether
{
  return *((_BYTE *)self + 14) & 1;
}

- (void)setKeepLinesTogether:(BOOL)a3
{
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFE | a3;
}

- (BOOL)keepLinesTogetherOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 1) & 1;
}

- (void)setKeepLinesTogetherOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFD | v3;
}

- (BOOL)suppressAutoHyphens
{
  return (*((unsigned __int8 *)self + 14) >> 2) & 1;
}

- (void)setSuppressAutoHyphens:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFB | v3;
}

- (BOOL)suppressAutoHyphensOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 3) & 1;
}

- (void)setSuppressAutoHyphensOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xF7 | v3;
}

- (BOOL)suppressLineNumbers
{
  return (*((unsigned __int8 *)self + 14) >> 4) & 1;
}

- (void)setSuppressLineNumbers:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xEF | v3;
}

- (BOOL)suppressLineNumbersOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 5) & 1;
}

- (void)setSuppressLineNumbersOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xDF | v3;
}

- (BOOL)widowControl
{
  return (*((unsigned __int8 *)self + 14) >> 6) & 1;
}

- (void)setWidowControl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xBF | v3;
}

- (BOOL)widowControlOverridden
{
  return *((unsigned __int8 *)self + 14) >> 7;
}

- (void)setWidowControlOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = v3 & 0x80 | *((_BYTE *)self + 14) & 0x7F;
}

- (BOOL)kinsokuOff
{
  return *((_BYTE *)self + 15) & 1;
}

- (void)setKinsokuOff:(BOOL)a3
{
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFE | a3;
}

- (BOOL)kinsokuOffOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 1) & 1;
}

- (void)setKinsokuOffOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFD | v3;
}

- (BOOL)tabStopAddedCountOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 2) & 1;
}

- (void)setTabStopAddedCountOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFB | v3;
}

- (BOOL)tabStopDeletedCountOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 3) & 1;
}

- (void)setTabStopDeletedCountOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xF7 | v3;
}

- (BOOL)formattingChangedOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 4) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xEF | v3;
}

- (BOOL)biDi
{
  return (*((unsigned __int8 *)self + 15) >> 5) & 1;
}

- (void)setBiDi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xDF | v3;
}

- (BOOL)biDiOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (void)setBiDiOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xBF | v3;
}

- (BOOL)cachedRtl
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (void)setCachedRtl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = v3 & 0x80 | *((_BYTE *)self + 15) & 0x7F;
}

- (BOOL)cachedRtlOverridden
{
  return *((_BYTE *)self + 16) & 1;
}

- (void)setCachedRtlOverridden:(BOOL)a3
{
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v3;
}

- (BOOL)contextualSpacing
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setContextualSpacing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v3;
}

- (BOOL)contextualSpacingOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setContextualSpacingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v3;
}

- (WDStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  objc_storeStrong((id *)&self->_baseStyle, a3);
}

- (WDBorder)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (WDBorder)leftBorder
{
  return self->_leftBorder;
}

- (void)setLeftBorder:(id)a3
{
  objc_storeStrong((id *)&self->_leftBorder, a3);
}

- (WDBorder)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorder, a3);
}

- (WDBorder)rightBorder
{
  return self->_rightBorder;
}

- (void)setRightBorder:(id)a3
{
  objc_storeStrong((id *)&self->_rightBorder, a3);
}

- (WDBorder)betweenBorder
{
  return self->_betweenBorder;
}

- (void)setBetweenBorder:(id)a3
{
  objc_storeStrong((id *)&self->_betweenBorder, a3);
}

- (WDBorder)barBorder
{
  return self->_barBorder;
}

- (void)setBarBorder:(id)a3
{
  objc_storeStrong((id *)&self->_barBorder, a3);
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
{
  objc_storeStrong((id *)&self->_shading, a3);
}

- ($06D0163FE0D7AFE752A9F21F38483579)dropCap
{
  $06D0163FE0D7AFE752A9F21F38483579 dest;

  objc_copyStruct(&dest, &self->_dropCap, 2, 1, 0);
  return dest;
}

- (void)setDropCap:(id)a3
{
  $06D0163FE0D7AFE752A9F21F38483579 src;

  src = a3;
  objc_copyStruct(&self->_dropCap, &src, 2, 1, 0);
}

- (NSMutableData)tabStopAddedTable
{
  return self->_tabStopAddedTable;
}

- (void)setTabStopAddedTable:(id)a3
{
  objc_storeStrong((id *)&self->_tabStopAddedTable, a3);
}

- (NSMutableData)tabStopDeletedTable
{
  return self->_tabStopDeletedTable;
}

- (void)setTabStopDeletedTable:(id)a3
{
  objc_storeStrong((id *)&self->_tabStopDeletedTable, a3);
}

- (int64_t)listIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(int64_t)a3
{
  self->_listIndex = a3;
}

- (unint64_t)tabStopAddedCount
{
  return self->_tabStopAddedCount;
}

- (void)setTabStopAddedCount:(unint64_t)a3
{
  self->_tabStopAddedCount = a3;
}

- (unint64_t)tabStopDeletedCount
{
  return self->_tabStopDeletedCount;
}

- (void)setTabStopDeletedCount:(unint64_t)a3
{
  self->_tabStopDeletedCount = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)verticalSpace
{
  return self->_verticalSpace;
}

- (void)setVerticalSpace:(int64_t)a3
{
  self->_verticalSpace = a3;
}

- (int64_t)horizontalSpace
{
  return self->_horizontalSpace;
}

- (void)setHorizontalSpace:(int64_t)a3
{
  self->_horizontalSpace = a3;
}

- (int64_t)horizontalPosition
{
  return self->_horizontalPosition;
}

- (void)setHorizontalPosition:(int64_t)a3
{
  self->_horizontalPosition = a3;
}

- (int64_t)verticalPosition
{
  return self->_verticalPosition;
}

- (void)setVerticalPosition:(int64_t)a3
{
  self->_verticalPosition = a3;
}

- (signed)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(signed __int16)a3
{
  self->_lineSpacing = a3;
}

- (signed)leftIndent
{
  return self->_leftIndent;
}

- (void)setLeftIndent:(signed __int16)a3
{
  self->_leftIndent = a3;
}

- (signed)rightIndent
{
  return self->_rightIndent;
}

- (void)setRightIndent:(signed __int16)a3
{
  self->_rightIndent = a3;
}

- (signed)leadingIndent
{
  return self->_leadingIndent;
}

- (void)setLeadingIndent:(signed __int16)a3
{
  self->_leadingIndent = a3;
}

- (signed)followingIndent
{
  return self->_followingIndent;
}

- (void)setFollowingIndent:(signed __int16)a3
{
  self->_followingIndent = a3;
}

- (signed)firstLineIndent
{
  return self->_firstLineIndent;
}

- (void)setFirstLineIndent:(signed __int16)a3
{
  self->_firstLineIndent = a3;
}

- (signed)leftIndentChars
{
  return self->_leftIndentChars;
}

- (void)setLeftIndentChars:(signed __int16)a3
{
  self->_leftIndentChars = a3;
}

- (signed)rightIndentChars
{
  return self->_rightIndentChars;
}

- (void)setRightIndentChars:(signed __int16)a3
{
  self->_rightIndentChars = a3;
}

- (signed)firstLineIndentChars
{
  return self->_firstLineIndentChars;
}

- (void)setFirstLineIndentChars:(signed __int16)a3
{
  self->_firstLineIndentChars = a3;
}

- (unsigned)spaceBefore
{
  return self->_spaceBefore;
}

- (void)setSpaceBefore:(unsigned __int16)a3
{
  self->_spaceBefore = a3;
}

- (unsigned)spaceAfter
{
  return self->_spaceAfter;
}

- (void)setSpaceAfter:(unsigned __int16)a3
{
  self->_spaceAfter = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned __int16)a3
{
  self->_height = a3;
}

- (unsigned)outlineLevel
{
  return self->_outlineLevel;
}

- (void)setOutlineLevel:(unsigned __int16)a3
{
  self->_outlineLevel = a3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  return self->_indexToAuthorIDOfFormattingChange;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfFormattingChange = a3;
}

- (char)wrapCode
{
  return self->_wrapCode;
}

- (void)setWrapCode:(char)a3
{
  self->_wrapCode = a3;
}

- (unsigned)horizontalAnchor
{
  return self->_horizontalAnchor;
}

- (void)setHorizontalAnchor:(unsigned __int8)a3
{
  self->_horizontalAnchor = a3;
}

- (unsigned)verticalAnchor
{
  return self->_verticalAnchor;
}

- (void)setVerticalAnchor:(unsigned __int8)a3
{
  self->_verticalAnchor = a3;
}

- (unsigned)lineSpacingRule
{
  return self->_lineSpacingRule;
}

- (void)setLineSpacingRule:(unsigned __int8)a3
{
  self->_lineSpacingRule = a3;
}

- (unsigned)heightRule
{
  return self->_heightRule;
}

- (void)setHeightRule:(unsigned __int8)a3
{
  self->_heightRule = a3;
}

- (unsigned)listLevel
{
  return self->_listLevel;
}

- (void)setListLevel:(unsigned __int8)a3
{
  self->_listLevel = a3;
}

- (unsigned)justification
{
  return self->_justification;
}

- (void)setJustification:(unsigned __int8)a3
{
  self->_justification = a3;
}

- (unsigned)physicalJustification
{
  return self->_physicalJustification;
}

- (void)setPhysicalJustification:(unsigned __int8)a3
{
  self->_physicalJustification = a3;
}

- (unsigned)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(unsigned __int8)a3
{
  self->_formattingChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabStopDeletedTable, 0);
  objc_storeStrong((id *)&self->_tabStopAddedTable, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_storeStrong((id *)&self->_barBorder, 0);
  objc_storeStrong((id *)&self->_betweenBorder, 0);
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
