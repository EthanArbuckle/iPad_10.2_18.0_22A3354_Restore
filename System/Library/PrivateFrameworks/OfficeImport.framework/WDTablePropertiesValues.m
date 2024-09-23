@implementation WDTablePropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  WDTablePropertiesValues *v4;
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
  void *v15;

  v4 = -[WDTablePropertiesValues init](+[WDTablePropertiesValues allocWithZone:](WDTablePropertiesValues, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[WDTablePropertiesValues baseStyle](self, "baseStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setBaseStyle:](v4, "setBaseStyle:", v5);

    -[WDTablePropertiesValues setLook:](v4, "setLook:", -[WDTablePropertiesValues look](self, "look"));
    -[WDTablePropertiesValues shading](self, "shading");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setShading:](v4, "setShading:", v6);

    -[WDTablePropertiesValues topBorder](self, "topBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setTopBorder:](v4, "setTopBorder:", v7);

    -[WDTablePropertiesValues leftBorder](self, "leftBorder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setLeftBorder:](v4, "setLeftBorder:", v8);

    -[WDTablePropertiesValues bottomBorder](self, "bottomBorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setBottomBorder:](v4, "setBottomBorder:", v9);

    -[WDTablePropertiesValues rightBorder](self, "rightBorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setRightBorder:](v4, "setRightBorder:", v10);

    -[WDTablePropertiesValues insideHorizontalBorder](self, "insideHorizontalBorder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setInsideHorizontalBorder:](v4, "setInsideHorizontalBorder:", v11);

    -[WDTablePropertiesValues insideVerticalBorder](self, "insideVerticalBorder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setInsideVerticalBorder:](v4, "setInsideVerticalBorder:", v12);

    -[WDTablePropertiesValues setJustification:](v4, "setJustification:", -[WDTablePropertiesValues justification](self, "justification"));
    -[WDTablePropertiesValues setAlignment:](v4, "setAlignment:", -[WDTablePropertiesValues alignment](self, "alignment"));
    -[WDTablePropertiesValues setWidth:](v4, "setWidth:", -[WDTablePropertiesValues width](self, "width"));
    -[WDTablePropertiesValues setWidthType:](v4, "setWidthType:", -[WDTablePropertiesValues widthType](self, "widthType"));
    -[WDTablePropertiesValues setIndent:](v4, "setIndent:", -[WDTablePropertiesValues indent](self, "indent"));
    -[WDTablePropertiesValues setIndentType:](v4, "setIndentType:", -[WDTablePropertiesValues indentType](self, "indentType"));
    -[WDTablePropertiesValues setCellSpacing:](v4, "setCellSpacing:", -[WDTablePropertiesValues cellSpacing](self, "cellSpacing"));
    -[WDTablePropertiesValues setCellSpacingType:](v4, "setCellSpacingType:", -[WDTablePropertiesValues cellSpacingType](self, "cellSpacingType"));
    -[WDTablePropertiesValues setVerticalAnchor:](v4, "setVerticalAnchor:", -[WDTablePropertiesValues verticalAnchor](self, "verticalAnchor"));
    -[WDTablePropertiesValues setHorizontalAnchor:](v4, "setHorizontalAnchor:", -[WDTablePropertiesValues horizontalAnchor](self, "horizontalAnchor"));
    -[WDTablePropertiesValues setVerticalPosition:](v4, "setVerticalPosition:", -[WDTablePropertiesValues verticalPosition](self, "verticalPosition"));
    -[WDTablePropertiesValues setHorizontalPosition:](v4, "setHorizontalPosition:", -[WDTablePropertiesValues horizontalPosition](self, "horizontalPosition"));
    -[WDTablePropertiesValues setLeftDistanceFromText:](v4, "setLeftDistanceFromText:", -[WDTablePropertiesValues leftDistanceFromText](self, "leftDistanceFromText"));
    -[WDTablePropertiesValues setTopDistanceFromText:](v4, "setTopDistanceFromText:", -[WDTablePropertiesValues topDistanceFromText](self, "topDistanceFromText"));
    -[WDTablePropertiesValues setRightDistanceFromText:](v4, "setRightDistanceFromText:", -[WDTablePropertiesValues rightDistanceFromText](self, "rightDistanceFromText"));
    -[WDTablePropertiesValues setBottomDistanceFromText:](v4, "setBottomDistanceFromText:", -[WDTablePropertiesValues bottomDistanceFromText](self, "bottomDistanceFromText"));
    -[WDTablePropertiesValues setDeleted:](v4, "setDeleted:", -[WDTablePropertiesValues deleted](self, "deleted"));
    -[WDTablePropertiesValues setEdited:](v4, "setEdited:", -[WDTablePropertiesValues edited](self, "edited"));
    -[WDTablePropertiesValues setFormattingChanged:](v4, "setFormattingChanged:", -[WDTablePropertiesValues formattingChanged](self, "formattingChanged"));
    -[WDTablePropertiesValues setBiDirectional:](v4, "setBiDirectional:", -[WDTablePropertiesValues biDirectional](self, "biDirectional"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfDeletion:](v4, "setIndexToAuthorIDOfDeletion:", -[WDTablePropertiesValues indexToAuthorIDOfDeletion](self, "indexToAuthorIDOfDeletion"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfEdit:](v4, "setIndexToAuthorIDOfEdit:", -[WDTablePropertiesValues indexToAuthorIDOfEdit](self, "indexToAuthorIDOfEdit"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfFormattingChange:](v4, "setIndexToAuthorIDOfFormattingChange:", -[WDTablePropertiesValues indexToAuthorIDOfFormattingChange](self, "indexToAuthorIDOfFormattingChange"));
    -[WDTablePropertiesValues deletionDate](self, "deletionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setDeletionDate:](v4, "setDeletionDate:", v13);

    -[WDTablePropertiesValues editDate](self, "editDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setEditDate:](v4, "setEditDate:", v14);

    -[WDTablePropertiesValues formattingChangeDate](self, "formattingChangeDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDTablePropertiesValues setFormattingChangeDate:](v4, "setFormattingChangeDate:", v15);

    -[WDTablePropertiesValues setBaseStyleOverridden:](v4, "setBaseStyleOverridden:", -[WDTablePropertiesValues baseStyleOverridden](self, "baseStyleOverridden"));
    -[WDTablePropertiesValues setLookOverridden:](v4, "setLookOverridden:", -[WDTablePropertiesValues lookOverridden](self, "lookOverridden"));
    -[WDTablePropertiesValues setShadingOverridden:](v4, "setShadingOverridden:", -[WDTablePropertiesValues shadingOverridden](self, "shadingOverridden"));
    -[WDTablePropertiesValues setTopBorderOverridden:](v4, "setTopBorderOverridden:", -[WDTablePropertiesValues topBorderOverridden](self, "topBorderOverridden"));
    -[WDTablePropertiesValues setLeftBorderOverridden:](v4, "setLeftBorderOverridden:", -[WDTablePropertiesValues leftBorderOverridden](self, "leftBorderOverridden"));
    -[WDTablePropertiesValues setBottomBorderOverridden:](v4, "setBottomBorderOverridden:", -[WDTablePropertiesValues bottomBorderOverridden](self, "bottomBorderOverridden"));
    -[WDTablePropertiesValues setRightBorderOverridden:](v4, "setRightBorderOverridden:", -[WDTablePropertiesValues rightBorderOverridden](self, "rightBorderOverridden"));
    -[WDTablePropertiesValues setInsideHorizontalBorderOverridden:](v4, "setInsideHorizontalBorderOverridden:", -[WDTablePropertiesValues insideHorizontalBorderOverridden](self, "insideHorizontalBorderOverridden"));
    -[WDTablePropertiesValues setInsideVerticalBorderOverridden:](v4, "setInsideVerticalBorderOverridden:", -[WDTablePropertiesValues insideVerticalBorderOverridden](self, "insideVerticalBorderOverridden"));
    -[WDTablePropertiesValues setJustificationOverridden:](v4, "setJustificationOverridden:", -[WDTablePropertiesValues justificationOverridden](self, "justificationOverridden"));
    -[WDTablePropertiesValues setAlignmentOverridden:](v4, "setAlignmentOverridden:", -[WDTablePropertiesValues alignmentOverridden](self, "alignmentOverridden"));
    -[WDTablePropertiesValues setWidthOverridden:](v4, "setWidthOverridden:", -[WDTablePropertiesValues widthOverridden](self, "widthOverridden"));
    -[WDTablePropertiesValues setWidthTypeOverridden:](v4, "setWidthTypeOverridden:", -[WDTablePropertiesValues widthTypeOverridden](self, "widthTypeOverridden"));
    -[WDTablePropertiesValues setIndentOverridden:](v4, "setIndentOverridden:", -[WDTablePropertiesValues indentOverridden](self, "indentOverridden"));
    -[WDTablePropertiesValues setIndentTypeOverridden:](v4, "setIndentTypeOverridden:", -[WDTablePropertiesValues indentTypeOverridden](self, "indentTypeOverridden"));
    -[WDTablePropertiesValues setCellSpacingOverridden:](v4, "setCellSpacingOverridden:", -[WDTablePropertiesValues cellSpacingOverridden](self, "cellSpacingOverridden"));
    -[WDTablePropertiesValues setCellSpacingTypeOverridden:](v4, "setCellSpacingTypeOverridden:", -[WDTablePropertiesValues cellSpacingTypeOverridden](self, "cellSpacingTypeOverridden"));
    -[WDTablePropertiesValues setVerticalAnchorOverridden:](v4, "setVerticalAnchorOverridden:", -[WDTablePropertiesValues verticalAnchorOverridden](self, "verticalAnchorOverridden"));
    -[WDTablePropertiesValues setHorizontalAnchorOverridden:](v4, "setHorizontalAnchorOverridden:", -[WDTablePropertiesValues horizontalAnchorOverridden](self, "horizontalAnchorOverridden"));
    -[WDTablePropertiesValues setVerticalPositionOverridden:](v4, "setVerticalPositionOverridden:", -[WDTablePropertiesValues verticalPositionOverridden](self, "verticalPositionOverridden"));
    -[WDTablePropertiesValues setHorizontalPositionOverridden:](v4, "setHorizontalPositionOverridden:", -[WDTablePropertiesValues horizontalPositionOverridden](self, "horizontalPositionOverridden"));
    -[WDTablePropertiesValues setLeftDistanceFromTextOverridden:](v4, "setLeftDistanceFromTextOverridden:", -[WDTablePropertiesValues leftDistanceFromTextOverridden](self, "leftDistanceFromTextOverridden"));
    -[WDTablePropertiesValues setTopDistanceFromTextOverridden:](v4, "setTopDistanceFromTextOverridden:", -[WDTablePropertiesValues topDistanceFromTextOverridden](self, "topDistanceFromTextOverridden"));
    -[WDTablePropertiesValues setRightDistanceFromTextOverridden:](v4, "setRightDistanceFromTextOverridden:", -[WDTablePropertiesValues rightDistanceFromTextOverridden](self, "rightDistanceFromTextOverridden"));
    -[WDTablePropertiesValues setBottomDistanceFromTextOverridden:](v4, "setBottomDistanceFromTextOverridden:", -[WDTablePropertiesValues bottomDistanceFromTextOverridden](self, "bottomDistanceFromTextOverridden"));
    -[WDTablePropertiesValues setDeletedOverridden:](v4, "setDeletedOverridden:", -[WDTablePropertiesValues deletedOverridden](self, "deletedOverridden"));
    -[WDTablePropertiesValues setEditedOverridden:](v4, "setEditedOverridden:", -[WDTablePropertiesValues editedOverridden](self, "editedOverridden"));
    -[WDTablePropertiesValues setFormattingChangedOverridden:](v4, "setFormattingChangedOverridden:", -[WDTablePropertiesValues formattingChangedOverridden](self, "formattingChangedOverridden"));
    -[WDTablePropertiesValues setBiDirectionalOverridden:](v4, "setBiDirectionalOverridden:", -[WDTablePropertiesValues biDirectionalOverridden](self, "biDirectionalOverridden"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfDeletionOverridden:](v4, "setIndexToAuthorIDOfDeletionOverridden:", -[WDTablePropertiesValues indexToAuthorIDOfDeletionOverridden](self, "indexToAuthorIDOfDeletionOverridden"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfEditOverridden:](v4, "setIndexToAuthorIDOfEditOverridden:", -[WDTablePropertiesValues indexToAuthorIDOfEditOverridden](self, "indexToAuthorIDOfEditOverridden"));
    -[WDTablePropertiesValues setIndexToAuthorIDOfFormattingChangeOverridden:](v4, "setIndexToAuthorIDOfFormattingChangeOverridden:", -[WDTablePropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self, "indexToAuthorIDOfFormattingChangeOverridden"));
    -[WDTablePropertiesValues setDeletionDateOverridden:](v4, "setDeletionDateOverridden:", -[WDTablePropertiesValues deletionDateOverridden](self, "deletionDateOverridden"));
    -[WDTablePropertiesValues setEditDateOverridden:](v4, "setEditDateOverridden:", -[WDTablePropertiesValues editDateOverridden](self, "editDateOverridden"));
    -[WDTablePropertiesValues setFormattingChangeDateOverridden:](v4, "setFormattingChangeDateOverridden:", -[WDTablePropertiesValues formattingChangeDateOverridden](self, "formattingChangeDateOverridden"));
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

- (BOOL)lookOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setLookOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFD | v3;
}

- (BOOL)shadingOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setShadingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v3;
}

- (BOOL)topBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setTopBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xF7 | v3;
}

- (BOOL)leftBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setLeftBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xEF | v3;
}

- (BOOL)bottomBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setBottomBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xDF | v3;
}

- (BOOL)rightBorderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setRightBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xBF | v3;
}

- (BOOL)insideHorizontalBorderOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setInsideHorizontalBorderOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = v3 & 0x80 | *((_BYTE *)self + 8) & 0x7F;
}

- (BOOL)insideVerticalBorderOverridden
{
  return *((_BYTE *)self + 9) & 1;
}

- (void)setInsideVerticalBorderOverridden:(BOOL)a3
{
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFE | a3;
}

- (BOOL)justificationOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setJustificationOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFD | v3;
}

- (BOOL)alignmentOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setAlignmentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFB | v3;
}

- (BOOL)widthOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setWidthOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xF7 | v3;
}

- (BOOL)widthTypeOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setWidthTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xEF | v3;
}

- (BOOL)indentOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setIndentOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xDF | v3;
}

- (BOOL)indentTypeOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setIndentTypeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xBF | v3;
}

- (BOOL)cellSpacingOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setCellSpacingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = v3 & 0x80 | *((_BYTE *)self + 9) & 0x7F;
}

- (BOOL)cellSpacingTypeOverridden
{
  return *((_BYTE *)self + 10) & 1;
}

- (void)setCellSpacingTypeOverridden:(BOOL)a3
{
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFE | a3;
}

- (BOOL)verticalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setVerticalAnchorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFD | v3;
}

- (BOOL)horizontalAnchorOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setHorizontalAnchorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFB | v3;
}

- (BOOL)verticalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setVerticalPositionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xF7 | v3;
}

- (BOOL)horizontalPositionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setHorizontalPositionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xEF | v3;
}

- (BOOL)leftDistanceFromTextOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setLeftDistanceFromTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xDF | v3;
}

- (BOOL)topDistanceFromTextOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setTopDistanceFromTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xBF | v3;
}

- (BOOL)rightDistanceFromTextOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setRightDistanceFromTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = v3 & 0x80 | *((_BYTE *)self + 10) & 0x7F;
}

- (BOOL)bottomDistanceFromTextOverridden
{
  return *((_BYTE *)self + 11) & 1;
}

- (void)setBottomDistanceFromTextOverridden:(BOOL)a3
{
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFE | a3;
}

- (BOOL)deletedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setDeletedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFD | v3;
}

- (BOOL)editedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setEditedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFB | v3;
}

- (BOOL)formattingChangedOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xF7 | v3;
}

- (BOOL)biDirectionalOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setBiDirectionalOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xEF | v3;
}

- (BOOL)indexToAuthorIDOfDeletionOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xDF | v3;
}

- (BOOL)indexToAuthorIDOfEditOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xBF | v3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = v3 & 0x80 | *((_BYTE *)self + 11) & 0x7F;
}

- (BOOL)deletionDateOverridden
{
  return *((_BYTE *)self + 12) & 1;
}

- (void)setDeletionDateOverridden:(BOOL)a3
{
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFE | a3;
}

- (BOOL)editDateOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setEditDateOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFD | v3;
}

- (BOOL)formattingChangeDateOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setFormattingChangeDateOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFB | v3;
}

- (WDStyle)baseStyle
{
  return (WDStyle *)objc_loadWeakRetained((id *)&self->_baseStyle);
}

- (void)setBaseStyle:(id)a3
{
  objc_storeWeak((id *)&self->_baseStyle, a3);
}

- (unsigned)look
{
  return self->_look;
}

- (void)setLook:(unsigned __int16)a3
{
  self->_look = a3;
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
{
  objc_storeStrong((id *)&self->_shading, a3);
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

- (WDBorder)insideHorizontalBorder
{
  return self->_insideHorizontalBorder;
}

- (void)setInsideHorizontalBorder:(id)a3
{
  objc_storeStrong((id *)&self->_insideHorizontalBorder, a3);
}

- (WDBorder)insideVerticalBorder
{
  return self->_insideVerticalBorder;
}

- (void)setInsideVerticalBorder:(id)a3
{
  objc_storeStrong((id *)&self->_insideVerticalBorder, a3);
}

- (int)justification
{
  return self->_justification;
}

- (void)setJustification:(int)a3
{
  self->_justification = a3;
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int)widthType
{
  return self->_widthType;
}

- (void)setWidthType:(int)a3
{
  self->_widthType = a3;
}

- (signed)indent
{
  return self->_indent;
}

- (void)setIndent:(signed __int16)a3
{
  self->_indent = a3;
}

- (int)indentType
{
  return self->_indentType;
}

- (void)setIndentType:(int)a3
{
  self->_indentType = a3;
}

- (signed)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(signed __int16)a3
{
  self->_cellSpacing = a3;
}

- (int)cellSpacingType
{
  return self->_cellSpacingType;
}

- (void)setCellSpacingType:(int)a3
{
  self->_cellSpacingType = a3;
}

- (int)verticalAnchor
{
  return self->_verticalAnchor;
}

- (void)setVerticalAnchor:(int)a3
{
  self->_verticalAnchor = a3;
}

- (int)horizontalAnchor
{
  return self->_horizontalAnchor;
}

- (void)setHorizontalAnchor:(int)a3
{
  self->_horizontalAnchor = a3;
}

- (int64_t)verticalPosition
{
  return self->_verticalPosition;
}

- (void)setVerticalPosition:(int64_t)a3
{
  self->_verticalPosition = a3;
}

- (int64_t)horizontalPosition
{
  return self->_horizontalPosition;
}

- (void)setHorizontalPosition:(int64_t)a3
{
  self->_horizontalPosition = a3;
}

- (int64_t)leftDistanceFromText
{
  return self->_leftDistanceFromText;
}

- (void)setLeftDistanceFromText:(int64_t)a3
{
  self->_leftDistanceFromText = a3;
}

- (int64_t)topDistanceFromText
{
  return self->_topDistanceFromText;
}

- (void)setTopDistanceFromText:(int64_t)a3
{
  self->_topDistanceFromText = a3;
}

- (int64_t)rightDistanceFromText
{
  return self->_rightDistanceFromText;
}

- (void)setRightDistanceFromText:(int64_t)a3
{
  self->_rightDistanceFromText = a3;
}

- (int64_t)bottomDistanceFromText
{
  return self->_bottomDistanceFromText;
}

- (void)setBottomDistanceFromText:(int64_t)a3
{
  self->_bottomDistanceFromText = a3;
}

- (int)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(int)a3
{
  self->_deleted = a3;
}

- (int)edited
{
  return self->_edited;
}

- (void)setEdited:(int)a3
{
  self->_edited = a3;
}

- (int)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(int)a3
{
  self->_formattingChanged = a3;
}

- (BOOL)biDirectional
{
  return self->_biDirectional;
}

- (void)setBiDirectional:(BOOL)a3
{
  self->_biDirectional = a3;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  return self->_indexToAuthorIDOfDeletion;
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfDeletion = a3;
}

- (unsigned)indexToAuthorIDOfEdit
{
  return self->_indexToAuthorIDOfEdit;
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfEdit = a3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  return self->_indexToAuthorIDOfFormattingChange;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  self->_indexToAuthorIDOfFormattingChange = a3;
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_deletionDate, a3);
}

- (NSDate)editDate
{
  return self->_editDate;
}

- (void)setEditDate:(id)a3
{
  objc_storeStrong((id *)&self->_editDate, a3);
}

- (NSDate)formattingChangeDate
{
  return self->_formattingChangeDate;
}

- (void)setFormattingChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_formattingChangeDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattingChangeDate, 0);
  objc_storeStrong((id *)&self->_editDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_insideVerticalBorder, 0);
  objc_storeStrong((id *)&self->_insideHorizontalBorder, 0);
  objc_storeStrong((id *)&self->_rightBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_leftBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_destroyWeak((id *)&self->_baseStyle);
}

@end
