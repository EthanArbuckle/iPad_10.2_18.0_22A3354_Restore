@implementation WDCharacterPropertiesValues

- (id)copyWithZone:(_NSZone *)a3
{
  WDCharacterPropertiesValues *v4;
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
  void *v16;
  void *v17;
  void *v18;

  v4 = -[WDCharacterPropertiesValues init](+[WDCharacterPropertiesValues allocWithZone:](WDCharacterPropertiesValues, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[WDCharacterPropertiesValues baseStyle](self, "baseStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setBaseStyle:](v4, "setBaseStyle:", v5);

    -[WDCharacterPropertiesValues border](self, "border");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setBorder:](v4, "setBorder:", v6);

    -[WDCharacterPropertiesValues shading](self, "shading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setShading:](v4, "setShading:", v7);

    -[WDCharacterPropertiesValues font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setFont:](v4, "setFont:", v8);

    -[WDCharacterPropertiesValues extendedFont](self, "extendedFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setExtendedFont:](v4, "setExtendedFont:", v9);

    -[WDCharacterPropertiesValues farEastFont](self, "farEastFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setFarEastFont:](v4, "setFarEastFont:", v10);

    -[WDCharacterPropertiesValues symbolFont](self, "symbolFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setSymbolFont:](v4, "setSymbolFont:", v11);

    -[WDCharacterPropertiesValues setFontHint:](v4, "setFontHint:", -[WDCharacterPropertiesValues fontHint](self, "fontHint"));
    -[WDCharacterPropertiesValues setLanguageForFarEast:](v4, "setLanguageForFarEast:", -[WDCharacterPropertiesValues languageForFarEast](self, "languageForFarEast"));
    -[WDCharacterPropertiesValues setLanguageForBiText:](v4, "setLanguageForBiText:", -[WDCharacterPropertiesValues languageForBiText](self, "languageForBiText"));
    -[WDCharacterPropertiesValues setLanguageForDefaultText:](v4, "setLanguageForDefaultText:", -[WDCharacterPropertiesValues languageForDefaultText](self, "languageForDefaultText"));
    -[WDCharacterPropertiesValues color](self, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setColor:](v4, "setColor:", v12);

    -[WDCharacterPropertiesValues underlineColor](self, "underlineColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setUnderlineColor:](v4, "setUnderlineColor:", v13);

    -[WDCharacterPropertiesValues outlineColor](self, "outlineColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setOutlineColor:](v4, "setOutlineColor:", v14);

    -[WDCharacterPropertiesValues deletionDate](self, "deletionDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setDeletionDate:](v4, "setDeletionDate:", v15);

    -[WDCharacterPropertiesValues editDate](self, "editDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setEditDate:](v4, "setEditDate:", v16);

    -[WDCharacterPropertiesValues setCharPositionOfPictureBulletInBookmark:](v4, "setCharPositionOfPictureBulletInBookmark:", -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmark](self, "charPositionOfPictureBulletInBookmark"));
    -[WDCharacterPropertiesValues setObjectIDForOle2:](v4, "setObjectIDForOle2:", -[WDCharacterPropertiesValues objectIDForOle2](self, "objectIDForOle2"));
    -[WDCharacterPropertiesValues setOffsetToPictureData:](v4, "setOffsetToPictureData:", -[WDCharacterPropertiesValues offsetToPictureData](self, "offsetToPictureData"));
    -[WDCharacterPropertiesValues setSpacing:](v4, "setSpacing:", -[WDCharacterPropertiesValues spacing](self, "spacing"));
    -[WDCharacterPropertiesValues setPosition:](v4, "setPosition:", -[WDCharacterPropertiesValues position](self, "position"));
    -[WDCharacterPropertiesValues reflection](self, "reflection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setReflection:](v4, "setReflection:", v17);

    -[WDCharacterPropertiesValues shadow2010](self, "shadow2010");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterPropertiesValues setShadow2010:](v4, "setShadow2010:", v18);

    -[WDCharacterPropertiesValues shadow2010Opacity](self, "shadow2010Opacity");
    -[WDCharacterPropertiesValues setShadow2010Opacity:](v4, "setShadow2010Opacity:");
    -[WDCharacterPropertiesValues setFontSize:](v4, "setFontSize:", -[WDCharacterPropertiesValues fontSize](self, "fontSize"));
    -[WDCharacterPropertiesValues setFontSizeForBiText:](v4, "setFontSizeForBiText:", -[WDCharacterPropertiesValues fontSizeForBiText](self, "fontSizeForBiText"));
    -[WDCharacterPropertiesValues setKerning:](v4, "setKerning:", -[WDCharacterPropertiesValues kerning](self, "kerning"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfDeletion:](v4, "setIndexToAuthorIDOfDeletion:", -[WDCharacterPropertiesValues indexToAuthorIDOfDeletion](self, "indexToAuthorIDOfDeletion"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfEdit:](v4, "setIndexToAuthorIDOfEdit:", -[WDCharacterPropertiesValues indexToAuthorIDOfEdit](self, "indexToAuthorIDOfEdit"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfFormattingChange:](v4, "setIndexToAuthorIDOfFormattingChange:", -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChange](self, "indexToAuthorIDOfFormattingChange"));
    -[WDCharacterPropertiesValues setTextScale:](v4, "setTextScale:", -[WDCharacterPropertiesValues textScale](self, "textScale"));
    -[WDCharacterPropertiesValues setUnderline:](v4, "setUnderline:", -[WDCharacterPropertiesValues underline](self, "underline"));
    -[WDCharacterPropertiesValues setOutline:](v4, "setOutline:", -[WDCharacterPropertiesValues outline](self, "outline"));
    -[WDCharacterPropertiesValues outline2010Width](self, "outline2010Width");
    -[WDCharacterPropertiesValues setOutline2010Width:](v4, "setOutline2010Width:");
    -[WDCharacterPropertiesValues setShadow:](v4, "setShadow:", -[WDCharacterPropertiesValues shadow](self, "shadow"));
    -[WDCharacterPropertiesValues setEmbossed:](v4, "setEmbossed:", -[WDCharacterPropertiesValues embossed](self, "embossed"));
    -[WDCharacterPropertiesValues setImprint:](v4, "setImprint:", -[WDCharacterPropertiesValues imprint](self, "imprint"));
    -[WDCharacterPropertiesValues setBold:](v4, "setBold:", -[WDCharacterPropertiesValues bold](self, "bold"));
    -[WDCharacterPropertiesValues setBoldForBiText:](v4, "setBoldForBiText:", -[WDCharacterPropertiesValues boldForBiText](self, "boldForBiText"));
    -[WDCharacterPropertiesValues setItalic:](v4, "setItalic:", -[WDCharacterPropertiesValues italic](self, "italic"));
    -[WDCharacterPropertiesValues setItalicForBiText:](v4, "setItalicForBiText:", -[WDCharacterPropertiesValues italicForBiText](self, "italicForBiText"));
    -[WDCharacterPropertiesValues setVerticalAlign:](v4, "setVerticalAlign:", -[WDCharacterPropertiesValues verticalAlign](self, "verticalAlign"));
    -[WDCharacterPropertiesValues setEmphasisMark:](v4, "setEmphasisMark:", -[WDCharacterPropertiesValues emphasisMark](self, "emphasisMark"));
    -[WDCharacterPropertiesValues setDeleted:](v4, "setDeleted:", -[WDCharacterPropertiesValues deleted](self, "deleted"));
    -[WDCharacterPropertiesValues setEdited:](v4, "setEdited:", -[WDCharacterPropertiesValues edited](self, "edited"));
    -[WDCharacterPropertiesValues setFormattingChanged:](v4, "setFormattingChanged:", -[WDCharacterPropertiesValues formattingChanged](self, "formattingChanged"));
    -[WDCharacterPropertiesValues setStrikeThrough:](v4, "setStrikeThrough:", -[WDCharacterPropertiesValues strikeThrough](self, "strikeThrough"));
    -[WDCharacterPropertiesValues setDoubleStrikeThrough:](v4, "setDoubleStrikeThrough:", -[WDCharacterPropertiesValues doubleStrikeThrough](self, "doubleStrikeThrough"));
    -[WDCharacterPropertiesValues setHighlightColor:](v4, "setHighlightColor:", -[WDCharacterPropertiesValues highlightColor](self, "highlightColor"));
    -[WDCharacterPropertiesValues setLigature:](v4, "setLigature:", -[WDCharacterPropertiesValues ligature](self, "ligature"));
    -[WDCharacterPropertiesValues setSmallCaps:](v4, "setSmallCaps:", -[WDCharacterPropertiesValues smallCaps](self, "smallCaps"));
    -[WDCharacterPropertiesValues setCaps:](v4, "setCaps:", -[WDCharacterPropertiesValues caps](self, "caps"));
    -[WDCharacterPropertiesValues setHidden:](v4, "setHidden:", -[WDCharacterPropertiesValues hidden](self, "hidden"));
    -[WDCharacterPropertiesValues setBracketTwoLinesInOne:](v4, "setBracketTwoLinesInOne:", -[WDCharacterPropertiesValues bracketTwoLinesInOne](self, "bracketTwoLinesInOne"));
    -[WDCharacterPropertiesValues setRightToLeft:](v4, "setRightToLeft:", -[WDCharacterPropertiesValues rightToLeft](self, "rightToLeft"));
    -[WDCharacterPropertiesValues setUseCsFont:](v4, "setUseCsFont:", -[WDCharacterPropertiesValues useCsFont](self, "useCsFont"));
    -[WDCharacterPropertiesValues setSymbolCharacter:](v4, "setSymbolCharacter:", -[WDCharacterPropertiesValues symbolCharacter](self, "symbolCharacter"));
    -[WDCharacterPropertiesValues setBaseStyleOverridden:](v4, "setBaseStyleOverridden:", -[WDCharacterPropertiesValues baseStyleOverridden](self, "baseStyleOverridden"));
    -[WDCharacterPropertiesValues setBorderOverridden:](v4, "setBorderOverridden:", -[WDCharacterPropertiesValues borderOverridden](self, "borderOverridden"));
    -[WDCharacterPropertiesValues setShadingOverridden:](v4, "setShadingOverridden:", -[WDCharacterPropertiesValues shadingOverridden](self, "shadingOverridden"));
    -[WDCharacterPropertiesValues setFontOverridden:](v4, "setFontOverridden:", -[WDCharacterPropertiesValues fontOverridden](self, "fontOverridden"));
    -[WDCharacterPropertiesValues setExtendedFontOverridden:](v4, "setExtendedFontOverridden:", -[WDCharacterPropertiesValues extendedFontOverridden](self, "extendedFontOverridden"));
    -[WDCharacterPropertiesValues setFarEastFontOverridden:](v4, "setFarEastFontOverridden:", -[WDCharacterPropertiesValues farEastFontOverridden](self, "farEastFontOverridden"));
    -[WDCharacterPropertiesValues setSymbolCharacterOverridden:](v4, "setSymbolCharacterOverridden:", -[WDCharacterPropertiesValues symbolCharacterOverridden](self, "symbolCharacterOverridden"));
    -[WDCharacterPropertiesValues setSymbolFontOverridden:](v4, "setSymbolFontOverridden:", -[WDCharacterPropertiesValues symbolFontOverridden](self, "symbolFontOverridden"));
    -[WDCharacterPropertiesValues setFontHintOverridden:](v4, "setFontHintOverridden:", -[WDCharacterPropertiesValues fontHintOverridden](self, "fontHintOverridden"));
    -[WDCharacterPropertiesValues setBoldOverridden:](v4, "setBoldOverridden:", -[WDCharacterPropertiesValues boldOverridden](self, "boldOverridden"));
    -[WDCharacterPropertiesValues setBoldForBiTextOverridden:](v4, "setBoldForBiTextOverridden:", -[WDCharacterPropertiesValues boldForBiTextOverridden](self, "boldForBiTextOverridden"));
    -[WDCharacterPropertiesValues setItalicOverridden:](v4, "setItalicOverridden:", -[WDCharacterPropertiesValues italicOverridden](self, "italicOverridden"));
    -[WDCharacterPropertiesValues setItalicForBiTextOverridden:](v4, "setItalicForBiTextOverridden:", -[WDCharacterPropertiesValues italicForBiTextOverridden](self, "italicForBiTextOverridden"));
    -[WDCharacterPropertiesValues setOutlineOverridden:](v4, "setOutlineOverridden:", -[WDCharacterPropertiesValues outlineOverridden](self, "outlineOverridden"));
    -[WDCharacterPropertiesValues setOutlineColorOverridden:](v4, "setOutlineColorOverridden:", -[WDCharacterPropertiesValues outlineColorOverridden](self, "outlineColorOverridden"));
    -[WDCharacterPropertiesValues setOutline2010WidthOverridden:](v4, "setOutline2010WidthOverridden:", -[WDCharacterPropertiesValues outline2010WidthOverridden](self, "outline2010WidthOverridden"));
    -[WDCharacterPropertiesValues setShadowOverridden:](v4, "setShadowOverridden:", -[WDCharacterPropertiesValues shadowOverridden](self, "shadowOverridden"));
    -[WDCharacterPropertiesValues setReflectionOverridden:](v4, "setReflectionOverridden:", -[WDCharacterPropertiesValues reflectionOverridden](self, "reflectionOverridden"));
    -[WDCharacterPropertiesValues setShadow2010Overridden:](v4, "setShadow2010Overridden:", -[WDCharacterPropertiesValues shadow2010Overridden](self, "shadow2010Overridden"));
    -[WDCharacterPropertiesValues setShadow2010OpacityOverridden:](v4, "setShadow2010OpacityOverridden:", -[WDCharacterPropertiesValues shadow2010OpacityOverridden](self, "shadow2010OpacityOverridden"));
    -[WDCharacterPropertiesValues setEmbossedOverridden:](v4, "setEmbossedOverridden:", -[WDCharacterPropertiesValues embossedOverridden](self, "embossedOverridden"));
    -[WDCharacterPropertiesValues setImprintOverridden:](v4, "setImprintOverridden:", -[WDCharacterPropertiesValues imprintOverridden](self, "imprintOverridden"));
    -[WDCharacterPropertiesValues setKerningOverridden:](v4, "setKerningOverridden:", -[WDCharacterPropertiesValues kerningOverridden](self, "kerningOverridden"));
    -[WDCharacterPropertiesValues setTextScaleOverridden:](v4, "setTextScaleOverridden:", -[WDCharacterPropertiesValues textScaleOverridden](self, "textScaleOverridden"));
    -[WDCharacterPropertiesValues setUnderlineColorOverridden:](v4, "setUnderlineColorOverridden:", -[WDCharacterPropertiesValues underlineColorOverridden](self, "underlineColorOverridden"));
    -[WDCharacterPropertiesValues setUnderlineOverridden:](v4, "setUnderlineOverridden:", -[WDCharacterPropertiesValues underlineOverridden](self, "underlineOverridden"));
    -[WDCharacterPropertiesValues setStrikeThroughOverridden:](v4, "setStrikeThroughOverridden:", -[WDCharacterPropertiesValues strikeThroughOverridden](self, "strikeThroughOverridden"));
    -[WDCharacterPropertiesValues setDoubleStrikeThroughOverridden:](v4, "setDoubleStrikeThroughOverridden:", -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](self, "doubleStrikeThroughOverridden"));
    -[WDCharacterPropertiesValues setHighlight:](v4, "setHighlight:", -[WDCharacterPropertiesValues highlight](self, "highlight"));
    -[WDCharacterPropertiesValues setHighlightOverridden:](v4, "setHighlightOverridden:", -[WDCharacterPropertiesValues highlightOverridden](self, "highlightOverridden"));
    -[WDCharacterPropertiesValues setHighlightColorOverridden:](v4, "setHighlightColorOverridden:", -[WDCharacterPropertiesValues highlightColorOverridden](self, "highlightColorOverridden"));
    -[WDCharacterPropertiesValues setLigatureOverridden:](v4, "setLigatureOverridden:", -[WDCharacterPropertiesValues ligatureOverridden](self, "ligatureOverridden"));
    -[WDCharacterPropertiesValues setSmallCapsOverridden:](v4, "setSmallCapsOverridden:", -[WDCharacterPropertiesValues smallCapsOverridden](self, "smallCapsOverridden"));
    -[WDCharacterPropertiesValues setCapsOverridden:](v4, "setCapsOverridden:", -[WDCharacterPropertiesValues capsOverridden](self, "capsOverridden"));
    -[WDCharacterPropertiesValues setLowerCase:](v4, "setLowerCase:", -[WDCharacterPropertiesValues lowerCase](self, "lowerCase"));
    -[WDCharacterPropertiesValues setLowerCaseOverridden:](v4, "setLowerCaseOverridden:", -[WDCharacterPropertiesValues lowerCaseOverridden](self, "lowerCaseOverridden"));
    -[WDCharacterPropertiesValues setHiddenOverridden:](v4, "setHiddenOverridden:", -[WDCharacterPropertiesValues hiddenOverridden](self, "hiddenOverridden"));
    -[WDCharacterPropertiesValues setSpacingOverridden:](v4, "setSpacingOverridden:", -[WDCharacterPropertiesValues spacingOverridden](self, "spacingOverridden"));
    -[WDCharacterPropertiesValues setPositionOverridden:](v4, "setPositionOverridden:", -[WDCharacterPropertiesValues positionOverridden](self, "positionOverridden"));
    -[WDCharacterPropertiesValues setFontSizeOverridden:](v4, "setFontSizeOverridden:", -[WDCharacterPropertiesValues fontSizeOverridden](self, "fontSizeOverridden"));
    -[WDCharacterPropertiesValues setVerticalAlignOverridden:](v4, "setVerticalAlignOverridden:", -[WDCharacterPropertiesValues verticalAlignOverridden](self, "verticalAlignOverridden"));
    -[WDCharacterPropertiesValues setEmphasisMarkOverridden:](v4, "setEmphasisMarkOverridden:", -[WDCharacterPropertiesValues emphasisMarkOverridden](self, "emphasisMarkOverridden"));
    -[WDCharacterPropertiesValues setColorOverridden:](v4, "setColorOverridden:", -[WDCharacterPropertiesValues colorOverridden](self, "colorOverridden"));
    -[WDCharacterPropertiesValues setColorAuto:](v4, "setColorAuto:", -[WDCharacterPropertiesValues colorAuto](self, "colorAuto"));
    -[WDCharacterPropertiesValues setColorAutoOverridden:](v4, "setColorAutoOverridden:", -[WDCharacterPropertiesValues colorAutoOverridden](self, "colorAutoOverridden"));
    -[WDCharacterPropertiesValues setLanguageForDefaultTextOverridden:](v4, "setLanguageForDefaultTextOverridden:", -[WDCharacterPropertiesValues languageForDefaultTextOverridden](self, "languageForDefaultTextOverridden"));
    -[WDCharacterPropertiesValues setDeletedOverridden:](v4, "setDeletedOverridden:", -[WDCharacterPropertiesValues deletedOverridden](self, "deletedOverridden"));
    -[WDCharacterPropertiesValues setEditedOverridden:](v4, "setEditedOverridden:", -[WDCharacterPropertiesValues editedOverridden](self, "editedOverridden"));
    -[WDCharacterPropertiesValues setFormattingChangedOverridden:](v4, "setFormattingChangedOverridden:", -[WDCharacterPropertiesValues formattingChangedOverridden](self, "formattingChangedOverridden"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfDeletionOverridden:](v4, "setIndexToAuthorIDOfDeletionOverridden:", -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](self, "indexToAuthorIDOfDeletionOverridden"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfEditOverridden:](v4, "setIndexToAuthorIDOfEditOverridden:", -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](self, "indexToAuthorIDOfEditOverridden"));
    -[WDCharacterPropertiesValues setIndexToAuthorIDOfFormattingChangeOverridden:](v4, "setIndexToAuthorIDOfFormattingChangeOverridden:", -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self, "indexToAuthorIDOfFormattingChangeOverridden"));
    -[WDCharacterPropertiesValues setDeletionDateOverridden:](v4, "setDeletionDateOverridden:", -[WDCharacterPropertiesValues deletionDateOverridden](self, "deletionDateOverridden"));
    -[WDCharacterPropertiesValues setEditDateOverridden:](v4, "setEditDateOverridden:", -[WDCharacterPropertiesValues editDateOverridden](self, "editDateOverridden"));
    -[WDCharacterPropertiesValues setSpecialCharacter:](v4, "setSpecialCharacter:", -[WDCharacterPropertiesValues specialCharacter](self, "specialCharacter"));
    -[WDCharacterPropertiesValues setSpecialCharacterOverridden:](v4, "setSpecialCharacterOverridden:", -[WDCharacterPropertiesValues specialCharacterOverridden](self, "specialCharacterOverridden"));
    -[WDCharacterPropertiesValues setListCharacterPictureBullet:](v4, "setListCharacterPictureBullet:", -[WDCharacterPropertiesValues listCharacterPictureBullet](self, "listCharacterPictureBullet"));
    -[WDCharacterPropertiesValues setListCharacterPictureBulletOverridden:](v4, "setListCharacterPictureBulletOverridden:", -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](self, "listCharacterPictureBulletOverridden"));
    -[WDCharacterPropertiesValues setCharPositionOfPictureBulletInBookmarkOverridden:](v4, "setCharPositionOfPictureBulletInBookmarkOverridden:", -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](self, "charPositionOfPictureBulletInBookmarkOverridden"));
    -[WDCharacterPropertiesValues setLanguageForFarEastOverridden:](v4, "setLanguageForFarEastOverridden:", -[WDCharacterPropertiesValues languageForFarEastOverridden](self, "languageForFarEastOverridden"));
    -[WDCharacterPropertiesValues setLanguageForBiTextOverridden:](v4, "setLanguageForBiTextOverridden:", -[WDCharacterPropertiesValues languageForBiTextOverridden](self, "languageForBiTextOverridden"));
    -[WDCharacterPropertiesValues setFontSizeForBiTextOverridden:](v4, "setFontSizeForBiTextOverridden:", -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](self, "fontSizeForBiTextOverridden"));
    -[WDCharacterPropertiesValues setEmbeddedObject:](v4, "setEmbeddedObject:", -[WDCharacterPropertiesValues embeddedObject](self, "embeddedObject"));
    -[WDCharacterPropertiesValues setEmbeddedObjectOverridden:](v4, "setEmbeddedObjectOverridden:", -[WDCharacterPropertiesValues embeddedObjectOverridden](self, "embeddedObjectOverridden"));
    -[WDCharacterPropertiesValues setOle2:](v4, "setOle2:", -[WDCharacterPropertiesValues ole2](self, "ole2"));
    -[WDCharacterPropertiesValues setOle2Overridden:](v4, "setOle2Overridden:", -[WDCharacterPropertiesValues ole2Overridden](self, "ole2Overridden"));
    -[WDCharacterPropertiesValues setObjectIDForOle2Overridden:](v4, "setObjectIDForOle2Overridden:", -[WDCharacterPropertiesValues objectIDForOle2Overridden](self, "objectIDForOle2Overridden"));
    -[WDCharacterPropertiesValues setOffsetToPictureDataOverridden:](v4, "setOffsetToPictureDataOverridden:", -[WDCharacterPropertiesValues offsetToPictureDataOverridden](self, "offsetToPictureDataOverridden"));
    -[WDCharacterPropertiesValues setRightToLeftOverridden:](v4, "setRightToLeftOverridden:", -[WDCharacterPropertiesValues rightToLeftOverridden](self, "rightToLeftOverridden"));
    -[WDCharacterPropertiesValues setUseCsFontOverridden:](v4, "setUseCsFontOverridden:", -[WDCharacterPropertiesValues useCsFontOverridden](self, "useCsFontOverridden"));
    -[WDCharacterPropertiesValues setHorizontalInVertical:](v4, "setHorizontalInVertical:", -[WDCharacterPropertiesValues horizontalInVertical](self, "horizontalInVertical"));
    -[WDCharacterPropertiesValues setHorizontalInVerticalOverridden:](v4, "setHorizontalInVerticalOverridden:", -[WDCharacterPropertiesValues horizontalInVerticalOverridden](self, "horizontalInVerticalOverridden"));
    -[WDCharacterPropertiesValues setCompressHorizontalInVertical:](v4, "setCompressHorizontalInVertical:", -[WDCharacterPropertiesValues compressHorizontalInVertical](self, "compressHorizontalInVertical"));
    -[WDCharacterPropertiesValues setCompressHorizontalInVerticalOverridden:](v4, "setCompressHorizontalInVerticalOverridden:", -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](self, "compressHorizontalInVerticalOverridden"));
    -[WDCharacterPropertiesValues setTwoLinesInOne:](v4, "setTwoLinesInOne:", -[WDCharacterPropertiesValues twoLinesInOne](self, "twoLinesInOne"));
    -[WDCharacterPropertiesValues setTwoLinesInOneOverridden:](v4, "setTwoLinesInOneOverridden:", -[WDCharacterPropertiesValues twoLinesInOneOverridden](self, "twoLinesInOneOverridden"));
    -[WDCharacterPropertiesValues setBracketTwoLinesInOneOverridden:](v4, "setBracketTwoLinesInOneOverridden:", -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](self, "bracketTwoLinesInOneOverridden"));
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

- (BOOL)borderOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setBorderOverridden:(BOOL)a3
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

- (BOOL)fontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 3) & 1;
}

- (void)setFontOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xF7 | v3;
}

- (BOOL)extendedFontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 4) & 1;
}

- (void)setExtendedFontOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xEF | v3;
}

- (BOOL)farEastFontOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 5) & 1;
}

- (void)setFarEastFontOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xDF | v3;
}

- (BOOL)symbolCharacterOverridden
{
  return (*((unsigned __int8 *)self + 8) >> 6) & 1;
}

- (void)setSymbolCharacterOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xBF | v3;
}

- (BOOL)symbolFontOverridden
{
  return *((unsigned __int8 *)self + 8) >> 7;
}

- (void)setSymbolFontOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = v3 & 0x80 | *((_BYTE *)self + 8) & 0x7F;
}

- (BOOL)fontHintOverridden
{
  return *((_BYTE *)self + 9) & 1;
}

- (void)setFontHintOverridden:(BOOL)a3
{
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFE | a3;
}

- (BOOL)boldOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 1) & 1;
}

- (void)setBoldOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFD | v3;
}

- (BOOL)boldForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 2) & 1;
}

- (void)setBoldForBiTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xFB | v3;
}

- (BOOL)italicOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 3) & 1;
}

- (void)setItalicOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xF7 | v3;
}

- (BOOL)italicForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 4) & 1;
}

- (void)setItalicForBiTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xEF | v3;
}

- (BOOL)outlineOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 5) & 1;
}

- (void)setOutlineOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xDF | v3;
}

- (BOOL)outlineColorOverridden
{
  return (*((unsigned __int8 *)self + 9) >> 6) & 1;
}

- (void)setOutlineColorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = *((_BYTE *)self + 9) & 0xBF | v3;
}

- (BOOL)outline2010WidthOverridden
{
  return *((unsigned __int8 *)self + 9) >> 7;
}

- (void)setOutline2010WidthOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 9) = v3 & 0x80 | *((_BYTE *)self + 9) & 0x7F;
}

- (BOOL)shadowOverridden
{
  return *((_BYTE *)self + 10) & 1;
}

- (void)setShadowOverridden:(BOOL)a3
{
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFE | a3;
}

- (BOOL)reflectionOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 1) & 1;
}

- (void)setReflectionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFD | v3;
}

- (BOOL)shadow2010Overridden
{
  return (*((unsigned __int8 *)self + 10) >> 2) & 1;
}

- (void)setShadow2010Overridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xFB | v3;
}

- (BOOL)shadow2010OpacityOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 3) & 1;
}

- (void)setShadow2010OpacityOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xF7 | v3;
}

- (BOOL)embossedOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 4) & 1;
}

- (void)setEmbossedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xEF | v3;
}

- (BOOL)imprintOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 5) & 1;
}

- (void)setImprintOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xDF | v3;
}

- (BOOL)kerningOverridden
{
  return (*((unsigned __int8 *)self + 10) >> 6) & 1;
}

- (void)setKerningOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = *((_BYTE *)self + 10) & 0xBF | v3;
}

- (BOOL)textScaleOverridden
{
  return *((unsigned __int8 *)self + 10) >> 7;
}

- (void)setTextScaleOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 10) = v3 & 0x80 | *((_BYTE *)self + 10) & 0x7F;
}

- (BOOL)underlineColorOverridden
{
  return *((_BYTE *)self + 11) & 1;
}

- (void)setUnderlineColorOverridden:(BOOL)a3
{
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFE | a3;
}

- (BOOL)underlineOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 1) & 1;
}

- (void)setUnderlineOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFD | v3;
}

- (BOOL)strikeThroughOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 2) & 1;
}

- (void)setStrikeThroughOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xFB | v3;
}

- (BOOL)doubleStrikeThroughOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 3) & 1;
}

- (void)setDoubleStrikeThroughOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xF7 | v3;
}

- (BOOL)highlight
{
  return (*((unsigned __int8 *)self + 11) >> 4) & 1;
}

- (void)setHighlight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xEF | v3;
}

- (BOOL)highlightOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 5) & 1;
}

- (void)setHighlightOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xDF | v3;
}

- (BOOL)highlightColorOverridden
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (void)setHighlightColorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = *((_BYTE *)self + 11) & 0xBF | v3;
}

- (BOOL)ligatureOverridden
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (void)setLigatureOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 11) = v3 & 0x80 | *((_BYTE *)self + 11) & 0x7F;
}

- (BOOL)smallCapsOverridden
{
  return *((_BYTE *)self + 12) & 1;
}

- (void)setSmallCapsOverridden:(BOOL)a3
{
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFE | a3;
}

- (BOOL)capsOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 1) & 1;
}

- (void)setCapsOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFD | v3;
}

- (BOOL)lowerCase
{
  return (*((unsigned __int8 *)self + 12) >> 2) & 1;
}

- (void)setLowerCase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xFB | v3;
}

- (BOOL)lowerCaseOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 3) & 1;
}

- (void)setLowerCaseOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xF7 | v3;
}

- (BOOL)hiddenOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 4) & 1;
}

- (void)setHiddenOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xEF | v3;
}

- (BOOL)spacingOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 5) & 1;
}

- (void)setSpacingOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xDF | v3;
}

- (BOOL)positionOverridden
{
  return (*((unsigned __int8 *)self + 12) >> 6) & 1;
}

- (void)setPositionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = *((_BYTE *)self + 12) & 0xBF | v3;
}

- (BOOL)fontSizeOverridden
{
  return *((unsigned __int8 *)self + 12) >> 7;
}

- (void)setFontSizeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 12) = v3 & 0x80 | *((_BYTE *)self + 12) & 0x7F;
}

- (BOOL)verticalAlignOverridden
{
  return *((_BYTE *)self + 13) & 1;
}

- (void)setVerticalAlignOverridden:(BOOL)a3
{
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFE | a3;
}

- (BOOL)emphasisMarkOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 1) & 1;
}

- (void)setEmphasisMarkOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFD | v3;
}

- (BOOL)colorOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 2) & 1;
}

- (void)setColorOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xFB | v3;
}

- (BOOL)colorAuto
{
  return (*((unsigned __int8 *)self + 13) >> 3) & 1;
}

- (void)setColorAuto:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xF7 | v3;
}

- (BOOL)colorAutoOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 4) & 1;
}

- (void)setColorAutoOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xEF | v3;
}

- (BOOL)languageForDefaultTextOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 5) & 1;
}

- (void)setLanguageForDefaultTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xDF | v3;
}

- (BOOL)deletedOverridden
{
  return (*((unsigned __int8 *)self + 13) >> 6) & 1;
}

- (void)setDeletedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = *((_BYTE *)self + 13) & 0xBF | v3;
}

- (BOOL)editedOverridden
{
  return *((unsigned __int8 *)self + 13) >> 7;
}

- (void)setEditedOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 13) = v3 & 0x80 | *((_BYTE *)self + 13) & 0x7F;
}

- (BOOL)formattingChangedOverridden
{
  return *((_BYTE *)self + 14) & 1;
}

- (void)setFormattingChangedOverridden:(BOOL)a3
{
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFE | a3;
}

- (BOOL)indexToAuthorIDOfDeletionOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 1) & 1;
}

- (void)setIndexToAuthorIDOfDeletionOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFD | v3;
}

- (BOOL)indexToAuthorIDOfEditOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 2) & 1;
}

- (void)setIndexToAuthorIDOfEditOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xFB | v3;
}

- (BOOL)indexToAuthorIDOfFormattingChangeOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 3) & 1;
}

- (void)setIndexToAuthorIDOfFormattingChangeOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xF7 | v3;
}

- (BOOL)deletionDateOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 4) & 1;
}

- (void)setDeletionDateOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xEF | v3;
}

- (BOOL)editDateOverridden
{
  return (*((unsigned __int8 *)self + 14) >> 5) & 1;
}

- (void)setEditDateOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xDF | v3;
}

- (BOOL)specialCharacter
{
  return (*((unsigned __int8 *)self + 14) >> 6) & 1;
}

- (void)setSpecialCharacter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = *((_BYTE *)self + 14) & 0xBF | v3;
}

- (BOOL)specialCharacterOverridden
{
  return *((unsigned __int8 *)self + 14) >> 7;
}

- (void)setSpecialCharacterOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 14) = v3 & 0x80 | *((_BYTE *)self + 14) & 0x7F;
}

- (BOOL)listCharacterPictureBullet
{
  return *((_BYTE *)self + 15) & 1;
}

- (void)setListCharacterPictureBullet:(BOOL)a3
{
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFE | a3;
}

- (BOOL)listCharacterPictureBulletOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 1) & 1;
}

- (void)setListCharacterPictureBulletOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFD | v3;
}

- (BOOL)charPositionOfPictureBulletInBookmarkOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 2) & 1;
}

- (void)setCharPositionOfPictureBulletInBookmarkOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xFB | v3;
}

- (BOOL)languageForFarEastOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 3) & 1;
}

- (void)setLanguageForFarEastOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xF7 | v3;
}

- (BOOL)languageForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 4) & 1;
}

- (void)setLanguageForBiTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xEF | v3;
}

- (BOOL)fontSizeForBiTextOverridden
{
  return (*((unsigned __int8 *)self + 15) >> 5) & 1;
}

- (void)setFontSizeForBiTextOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xDF | v3;
}

- (BOOL)embeddedObject
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (void)setEmbeddedObject:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = *((_BYTE *)self + 15) & 0xBF | v3;
}

- (BOOL)embeddedObjectOverridden
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (void)setEmbeddedObjectOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 15) = v3 & 0x80 | *((_BYTE *)self + 15) & 0x7F;
}

- (BOOL)ole2
{
  return *((_BYTE *)self + 16) & 1;
}

- (void)setOle2:(BOOL)a3
{
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFE | a3;
}

- (BOOL)ole2Overridden
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setOle2Overridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFD | v3;
}

- (BOOL)objectIDForOle2Overridden
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setObjectIDForOle2Overridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xFB | v3;
}

- (BOOL)offsetToPictureDataOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setOffsetToPictureDataOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xF7 | v3;
}

- (BOOL)rightToLeftOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 4) & 1;
}

- (void)setRightToLeftOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xEF | v3;
}

- (BOOL)useCsFontOverridden
{
  return (*((unsigned __int8 *)self + 16) >> 5) & 1;
}

- (void)setUseCsFontOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xDF | v3;
}

- (BOOL)horizontalInVertical
{
  return (*((unsigned __int8 *)self + 16) >> 6) & 1;
}

- (void)setHorizontalInVertical:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = *((_BYTE *)self + 16) & 0xBF | v3;
}

- (BOOL)horizontalInVerticalOverridden
{
  return *((unsigned __int8 *)self + 16) >> 7;
}

- (void)setHorizontalInVerticalOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 16) = v3 & 0x80 | *((_BYTE *)self + 16) & 0x7F;
}

- (BOOL)compressHorizontalInVertical
{
  return *((_BYTE *)self + 17) & 1;
}

- (void)setCompressHorizontalInVertical:(BOOL)a3
{
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xFE | a3;
}

- (BOOL)compressHorizontalInVerticalOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 1) & 1;
}

- (void)setCompressHorizontalInVerticalOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xFD | v3;
}

- (BOOL)twoLinesInOne
{
  return (*((unsigned __int8 *)self + 17) >> 2) & 1;
}

- (void)setTwoLinesInOne:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xFB | v3;
}

- (BOOL)twoLinesInOneOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 3) & 1;
}

- (void)setTwoLinesInOneOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xF7 | v3;
}

- (BOOL)bracketTwoLinesInOneOverridden
{
  return (*((unsigned __int8 *)self + 17) >> 4) & 1;
}

- (void)setBracketTwoLinesInOneOverridden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 17) = *((_BYTE *)self + 17) & 0xEF | v3;
}

- (WDStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  objc_storeStrong((id *)&self->_baseStyle, a3);
}

- (WDBorder)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
  objc_storeStrong((id *)&self->_border, a3);
}

- (WDShading)shading
{
  return self->_shading;
}

- (void)setShading:(id)a3
{
  objc_storeStrong((id *)&self->_shading, a3);
}

- (WDFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (WDFont)extendedFont
{
  return self->_extendedFont;
}

- (void)setExtendedFont:(id)a3
{
  objc_storeStrong((id *)&self->_extendedFont, a3);
}

- (WDFont)farEastFont
{
  return self->_farEastFont;
}

- (void)setFarEastFont:(id)a3
{
  objc_storeStrong((id *)&self->_farEastFont, a3);
}

- (WDFont)symbolFont
{
  return self->_symbolFont;
}

- (void)setSymbolFont:(id)a3
{
  objc_storeStrong((id *)&self->_symbolFont, a3);
}

- (int)fontHint
{
  return self->_fontHint;
}

- (void)setFontHint:(int)a3
{
  self->_fontHint = a3;
}

- (int)languageForFarEast
{
  return self->_languageForFarEast;
}

- (void)setLanguageForFarEast:(int)a3
{
  self->_languageForFarEast = a3;
}

- (int)languageForBiText
{
  return self->_languageForBiText;
}

- (void)setLanguageForBiText:(int)a3
{
  self->_languageForBiText = a3;
}

- (int)languageForDefaultText
{
  return self->_languageForDefaultText;
}

- (void)setLanguageForDefaultText:(int)a3
{
  self->_languageForDefaultText = a3;
}

- (OITSUColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (OITSUColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlineColor, a3);
}

- (OITSUColor)outlineColor
{
  return self->_outlineColor;
}

- (void)setOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_outlineColor, a3);
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

- (int)charPositionOfPictureBulletInBookmark
{
  return self->_charPositionOfPictureBulletInBookmark;
}

- (void)setCharPositionOfPictureBulletInBookmark:(int)a3
{
  self->_charPositionOfPictureBulletInBookmark = a3;
}

- (int)objectIDForOle2
{
  return self->_objectIDForOle2;
}

- (void)setObjectIDForOle2:(int)a3
{
  self->_objectIDForOle2 = a3;
}

- (int)offsetToPictureData
{
  return self->_offsetToPictureData;
}

- (void)setOffsetToPictureData:(int)a3
{
  self->_offsetToPictureData = a3;
}

- (signed)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(signed __int16)a3
{
  self->_spacing = a3;
}

- (signed)position
{
  return self->_position;
}

- (void)setPosition:(signed __int16)a3
{
  self->_position = a3;
}

- (OADReflectionEffect)reflection
{
  return self->_reflection;
}

- (void)setReflection:(id)a3
{
  objc_storeStrong((id *)&self->_reflection, a3);
}

- (OADShadowEffect)shadow2010
{
  return self->_shadow2010;
}

- (void)setShadow2010:(id)a3
{
  objc_storeStrong((id *)&self->_shadow2010, a3);
}

- (float)shadow2010Opacity
{
  return self->_shadow2010Opacity;
}

- (void)setShadow2010Opacity:(float)a3
{
  self->_shadow2010Opacity = a3;
}

- (unsigned)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(unsigned __int16)a3
{
  self->_fontSize = a3;
}

- (unsigned)fontSizeForBiText
{
  return self->_fontSizeForBiText;
}

- (void)setFontSizeForBiText:(unsigned __int16)a3
{
  self->_fontSizeForBiText = a3;
}

- (unsigned)kerning
{
  return self->_kerning;
}

- (void)setKerning:(unsigned __int16)a3
{
  self->_kerning = a3;
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

- (unsigned)textScale
{
  return self->_textScale;
}

- (void)setTextScale:(unsigned __int16)a3
{
  self->_textScale = a3;
}

- (unsigned)underline
{
  return self->_underline;
}

- (void)setUnderline:(unsigned __int8)a3
{
  self->_underline = a3;
}

- (unsigned)outline
{
  return self->_outline;
}

- (void)setOutline:(unsigned __int8)a3
{
  self->_outline = a3;
}

- (float)outline2010Width
{
  return self->_outline2010Width;
}

- (void)setOutline2010Width:(float)a3
{
  self->_outline2010Width = a3;
}

- (unsigned)shadow
{
  return self->_shadow;
}

- (void)setShadow:(unsigned __int8)a3
{
  self->_shadow = a3;
}

- (unsigned)embossed
{
  return self->_embossed;
}

- (void)setEmbossed:(unsigned __int8)a3
{
  self->_embossed = a3;
}

- (unsigned)imprint
{
  return self->_imprint;
}

- (void)setImprint:(unsigned __int8)a3
{
  self->_imprint = a3;
}

- (unsigned)bold
{
  return self->_bold;
}

- (void)setBold:(unsigned __int8)a3
{
  self->_bold = a3;
}

- (unsigned)boldForBiText
{
  return self->_boldForBiText;
}

- (void)setBoldForBiText:(unsigned __int8)a3
{
  self->_boldForBiText = a3;
}

- (unsigned)italic
{
  return self->_italic;
}

- (void)setItalic:(unsigned __int8)a3
{
  self->_italic = a3;
}

- (unsigned)italicForBiText
{
  return self->_italicForBiText;
}

- (void)setItalicForBiText:(unsigned __int8)a3
{
  self->_italicForBiText = a3;
}

- (unsigned)verticalAlign
{
  return self->_verticalAlign;
}

- (void)setVerticalAlign:(unsigned __int8)a3
{
  self->_verticalAlign = a3;
}

- (int)emphasisMark
{
  return self->_emphasisMark;
}

- (void)setEmphasisMark:(int)a3
{
  self->_emphasisMark = a3;
}

- (unsigned)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(unsigned __int8)a3
{
  self->_deleted = a3;
}

- (unsigned)edited
{
  return self->_edited;
}

- (void)setEdited:(unsigned __int8)a3
{
  self->_edited = a3;
}

- (BOOL)formattingChanged
{
  return self->_formattingChanged;
}

- (void)setFormattingChanged:(BOOL)a3
{
  self->_formattingChanged = a3;
}

- (unsigned)strikeThrough
{
  return self->_strikeThrough;
}

- (void)setStrikeThrough:(unsigned __int8)a3
{
  self->_strikeThrough = a3;
}

- (unsigned)doubleStrikeThrough
{
  return self->_doubleStrikeThrough;
}

- (void)setDoubleStrikeThrough:(unsigned __int8)a3
{
  self->_doubleStrikeThrough = a3;
}

- (unsigned)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(unsigned __int8)a3
{
  self->_highlightColor = a3;
}

- (unsigned)ligature
{
  return self->_ligature;
}

- (void)setLigature:(unsigned __int8)a3
{
  self->_ligature = a3;
}

- (unsigned)smallCaps
{
  return self->_smallCaps;
}

- (void)setSmallCaps:(unsigned __int8)a3
{
  self->_smallCaps = a3;
}

- (unsigned)caps
{
  return self->_caps;
}

- (void)setCaps:(unsigned __int8)a3
{
  self->_caps = a3;
}

- (unsigned)hidden
{
  return self->_hidden;
}

- (void)setHidden:(unsigned __int8)a3
{
  self->_hidden = a3;
}

- (unsigned)bracketTwoLinesInOne
{
  return self->_bracketTwoLinesInOne;
}

- (void)setBracketTwoLinesInOne:(unsigned __int8)a3
{
  self->_bracketTwoLinesInOne = a3;
}

- (unsigned)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(unsigned __int8)a3
{
  self->_rightToLeft = a3;
}

- (unsigned)useCsFont
{
  return self->_useCsFont;
}

- (void)setUseCsFont:(unsigned __int8)a3
{
  self->_useCsFont = a3;
}

- (unsigned)symbolCharacter
{
  return self->_symbolCharacter;
}

- (void)setSymbolCharacter:(unsigned __int16)a3
{
  self->_symbolCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow2010, 0);
  objc_storeStrong((id *)&self->_reflection, 0);
  objc_storeStrong((id *)&self->_editDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_farEastFont, 0);
  objc_storeStrong((id *)&self->_extendedFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_shading, 0);
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end
