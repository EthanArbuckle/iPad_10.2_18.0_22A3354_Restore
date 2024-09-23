@implementation SXComponentTextRules

+ (id)defaultTextRules
{
  if (defaultTextRules_onceToken != -1)
    dispatch_once(&defaultTextRules_onceToken, &__block_literal_global_25);
  return (id)defaultTextRules___defaultTextRules;
}

uint64_t __53__SXComponentTextRules_Definitions__defaultTextRules__block_invoke()
{
  SXComponentTextRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)defaultTextRules___defaultTextRules;
  defaultTextRules___defaultTextRules = (uint64_t)v0;

  return objc_msgSend((id)defaultTextRules___defaultTextRules, "setFontTextStyle:", *MEMORY[0x24BDF77B0]);
}

+ (id)bodyTextRules
{
  if (bodyTextRules_onceToken != -1)
    dispatch_once(&bodyTextRules_onceToken, &__block_literal_global_1);
  return (id)bodyTextRules___bodyTextRules;
}

uint64_t __50__SXComponentTextRules_Definitions__bodyTextRules__block_invoke()
{
  SXComponentTextRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)bodyTextRules___bodyTextRules;
  bodyTextRules___bodyTextRules = (uint64_t)v0;

  objc_msgSend((id)bodyTextRules___bodyTextRules, "setShouldHyphenate:", 1);
  objc_msgSend((id)bodyTextRules___bodyTextRules, "setFontResizingTresholdFactor:", 1.0);
  objc_msgSend((id)bodyTextRules___bodyTextRules, "setFontSizeConstant:", 0.816);
  objc_msgSend((id)bodyTextRules___bodyTextRules, "setAllowsScrollPositionRestore:", 1);
  objc_msgSend((id)bodyTextRules___bodyTextRules, "setIsSelectable:", 1);
  objc_msgSend((id)bodyTextRules___bodyTextRules, "setTextFlow:", 1);
  return objc_msgSend((id)bodyTextRules___bodyTextRules, "setFontTextStyle:", *MEMORY[0x24BDF77B0]);
}

+ (id)smallTextRules
{
  if (smallTextRules_onceToken != -1)
    dispatch_once(&smallTextRules_onceToken, &__block_literal_global_2);
  return (id)smallTextRules___smallTextRules;
}

uint64_t __51__SXComponentTextRules_Definitions__smallTextRules__block_invoke()
{
  SXComponentTextRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)smallTextRules___smallTextRules;
  smallTextRules___smallTextRules = (uint64_t)v0;

  objc_msgSend((id)smallTextRules___smallTextRules, "setFontResizingTresholdFactor:", 1.0);
  objc_msgSend((id)smallTextRules___smallTextRules, "setFontSizeConstant:", 0.816);
  return objc_msgSend((id)smallTextRules___smallTextRules, "setFontTextStyle:", *MEMORY[0x24BDF77C0]);
}

+ (id)titleTextRules
{
  if (titleTextRules_onceToken != -1)
    dispatch_once(&titleTextRules_onceToken, &__block_literal_global_3_0);
  return (id)titleTextRules___titleTextRules;
}

uint64_t __51__SXComponentTextRules_Definitions__titleTextRules__block_invoke()
{
  SXComponentTextRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)titleTextRules___titleTextRules;
  titleTextRules___titleTextRules = (uint64_t)v0;

  objc_msgSend((id)titleTextRules___titleTextRules, "setTextFlow:", 1);
  return objc_msgSend((id)titleTextRules___titleTextRules, "setFontTextStyle:", *MEMORY[0x24BDF7848]);
}

+ (id)headingTextRules
{
  if (headingTextRules_onceToken != -1)
    dispatch_once(&headingTextRules_onceToken, &__block_literal_global_4_0);
  return (id)headingTextRules___headingTextRules;
}

uint64_t __53__SXComponentTextRules_Definitions__headingTextRules__block_invoke()
{
  SXComponentTextRules *v0;
  void *v1;

  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)headingTextRules___headingTextRules;
  headingTextRules___headingTextRules = (uint64_t)v0;

  objc_msgSend((id)headingTextRules___headingTextRules, "setTextFlow:", 1);
  return objc_msgSend((id)headingTextRules___headingTextRules, "setFontTextStyle:", *MEMORY[0x24BDF77E8]);
}

- (SXComponentTextRules)init
{
  SXComponentTextRules *v2;
  SXComponentTextRules *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXComponentTextRules;
  v2 = -[SXComponentTextRules init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_fontResizingTresholdFactor = xmmword_21713C6E0;
    *(_OWORD *)&v2->_lineHeightConstant = xmmword_21713C6F0;
    *(_WORD *)&v2->_shouldHyphenate = 256;
    v2->_allowsScrollPositionRestore = 0;
    v2->_textFlow = 0;
    objc_storeStrong((id *)&v2->_fontTextStyle, (id)*MEMORY[0x24BDF77B0]);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SXComponentTextRules fontResizingTresholdFactor](self, "fontResizingTresholdFactor");
  objc_msgSend(v4, "setFontResizingTresholdFactor:");
  -[SXComponentTextRules fontSizeConstant](self, "fontSizeConstant");
  objc_msgSend(v4, "setFontSizeConstant:");
  -[SXComponentTextRules lineHeightConstant](self, "lineHeightConstant");
  objc_msgSend(v4, "setLineHeightConstant:");
  -[SXComponentTextRules dropCapConstant](self, "dropCapConstant");
  objc_msgSend(v4, "setDropCapConstant:");
  objc_msgSend(v4, "setShouldHyphenate:", -[SXComponentTextRules shouldHyphenate](self, "shouldHyphenate"));
  objc_msgSend(v4, "setAllowsScrollPositionRestore:", -[SXComponentTextRules allowsScrollPositionRestore](self, "allowsScrollPositionRestore"));
  objc_msgSend(v4, "setIsSelectable:", -[SXComponentTextRules isSelectable](self, "isSelectable"));
  objc_msgSend(v4, "setTextFlow:", -[SXComponentTextRules textFlow](self, "textFlow"));
  -[SXComponentTextRules fontTextStyle](self, "fontTextStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontTextStyle:", v5);

  return v4;
}

- (double)fontResizingTresholdFactor
{
  return self->_fontResizingTresholdFactor;
}

- (void)setFontResizingTresholdFactor:(double)a3
{
  self->_fontResizingTresholdFactor = a3;
}

- (double)fontSizeConstant
{
  return self->_fontSizeConstant;
}

- (void)setFontSizeConstant:(double)a3
{
  self->_fontSizeConstant = a3;
}

- (double)lineHeightConstant
{
  return self->_lineHeightConstant;
}

- (void)setLineHeightConstant:(double)a3
{
  self->_lineHeightConstant = a3;
}

- (double)dropCapConstant
{
  return self->_dropCapConstant;
}

- (void)setDropCapConstant:(double)a3
{
  self->_dropCapConstant = a3;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)allowsScrollPositionRestore
{
  return self->_allowsScrollPositionRestore;
}

- (void)setAllowsScrollPositionRestore:(BOOL)a3
{
  self->_allowsScrollPositionRestore = a3;
}

- (int64_t)textFlow
{
  return self->_textFlow;
}

- (void)setTextFlow:(int64_t)a3
{
  self->_textFlow = a3;
}

- (NSString)fontTextStyle
{
  return self->_fontTextStyle;
}

- (void)setFontTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontTextStyle, 0);
}

@end
