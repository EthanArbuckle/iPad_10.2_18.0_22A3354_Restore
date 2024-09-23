@implementation THFlowTOCConfiguration

- (THFlowTOCConfiguration)initWithContext:(id)a3
{
  THFlowTOCConfiguration *v4;
  THFlowTOCConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THFlowTOCConfiguration;
  v4 = -[THFlowTOCConfiguration init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_context = (IMFrameEnvironment *)a3;
    -[THFlowTOCConfiguration _setupCompact](v4, "_setupCompact");
    -[THFlowTOCConfiguration _setupRegular](v5, "_setupRegular");
    -[THFlowTOCConfiguration _setupMegaPad](v5, "_setupMegaPad");
  }
  return v5;
}

- (double)cellHeight
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("cellHeight"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)chapterLabelFontSize
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("chapterLabelFontSize"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (BOOL)constrainTableWidthToLegacyiPadWidth
{
  return 0;
}

- (double)discloseButtonLeftMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("discloseButtonLeftMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)discloseButtonRadius
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("discloseButtonRadius"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)discloseButtonRightMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("discloseButtonRightMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)discloseButtonWidth
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("discloseButtonWidth"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)headerImageToTocTableMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("headerImageToTocTableMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (BOOL)multiLevelIndent
{
  double v2;

  -[THFlowTOCConfiguration BOOLForKey:context:](self, "BOOLForKey:context:", CFSTR("multiLevelIndent"), -[THFlowTOCConfiguration context](self, "context"));
  return v2 != 0.0;
}

- (double)ordinalNumberLeftMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalNumberLeftMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)ordinalNumberRightMarginChapter
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalNumberRightMarginChapter"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)ordinalNumberRightMarginSection
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalNumberRightMarginSection"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)ordinalWidthLevel1
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalWidthLevel1"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)ordinalWidthLevel2
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalWidthLevel2"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)ordinalWidthLevel3
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("ordinalWidthLevel3"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (BOOL)pageNumberDynamicWidth
{
  double v2;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("pageNumberDynamicWidth"), -[THFlowTOCConfiguration context](self, "context"));
  return v2 != 0.0;
}

- (double)pageNumberFontSize
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("pageNumberFontSize"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)pageNumberWidth
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("pageNumberWidth"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)sectionLabelFontSize
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("sectionLabelFontSize"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)sectionLabelRightMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("sectionLabelRightMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)separatorColorWhite
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("separatorColorWhite"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (double)viewTopToTocTableMargin
{
  double result;

  -[THFlowTOCConfiguration floatForKey:context:](self, "floatForKey:context:", CFSTR("viewTopToTocTableMargin"), -[THFlowTOCConfiguration context](self, "context"));
  return result;
}

- (void)_setupCompact
{
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_DCADC;
  v4[3] = &unk_4294D8;
  v4[4] = &stru_4294B0;
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPadSizeClassPredicate](IMConfigurationPredicate, "iPadSizeClassPredicate"), v4);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPad10SizeClassPredicate](IMConfigurationPredicate, "iPad10SizeClassPredicate", _NSConcreteStackBlock, 3221225472, sub_DCC7C, &unk_4294D8, &stru_4294B0), &v3);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPadOtherSizeClassPredicate](IMConfigurationPredicate, "iPadOtherSizeClassPredicate"), &v3);
}

- (void)_setupRegular
{
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPadSizeClassPredicate](IMConfigurationPredicate, "iPadSizeClassPredicate"), &stru_4294F8);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPad10SizeClassPredicate](IMConfigurationPredicate, "iPad10SizeClassPredicate"), &stru_429558);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate iPadOtherSizeClassPredicate](IMConfigurationPredicate, "iPadOtherSizeClassPredicate"), &stru_429558);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate superPhonePortraitExactSizePredicate](IMConfigurationPredicate, "superPhonePortraitExactSizePredicate"), &stru_4295B8);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate superPhoneLandscapeExactSizePredicate](IMConfigurationPredicate, "superPhoneLandscapeExactSizePredicate"), &stru_4295B8);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate superMegaPhonePortraitExactSizePredicate](IMConfigurationPredicate, "superMegaPhonePortraitExactSizePredicate"), &stru_4295B8);
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate superMegaPhoneLandscapeExactSizePredicate](IMConfigurationPredicate, "superMegaPhoneLandscapeExactSizePredicate"), &stru_4295B8);
}

- (void)_setupMegaPad
{
  -[THFlowTOCConfiguration addWithPredicate:adder:](self, "addWithPredicate:adder:", +[IMConfigurationPredicate megaPadSizeClassPredicate](IMConfigurationPredicate, "megaPadSizeClassPredicate"), &stru_4295D8);
}

- (double)pageNumberLeftMargin
{
  return self->_pageNumberLeftMargin;
}

- (IMFrameEnvironment)context
{
  return self->_context;
}

@end
