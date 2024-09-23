@implementation PGThrowbackThursdayMemoryTitleGenerator

- (PGThrowbackThursdayMemoryTitleGenerator)initWithMomentNode:(id)a3 numberOfYearsAgo:(int64_t)a4 titleGenerationContext:(id)a5
{
  PGThrowbackThursdayMemoryTitleGenerator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGThrowbackThursdayMemoryTitleGenerator;
  result = -[PGTitleGenerator initWithMomentNode:type:titleGenerationContext:](&v7, sel_initWithMomentNode_type_titleGenerationContext_, a3, 6, a5);
  if (result)
    result->_numberOfYearsAgo = a4;
  return result;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int64_t numberOfYearsAgo;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGTimeTitleOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, void *, void *);

  v21 = (void (**)(id, void *, void *))a3;
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  if (((unint64_t)v8 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, self->_numberOfYearsAgo);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    numberOfYearsAgo = self->_numberOfYearsAgo;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (numberOfYearsAgo < 6)
      v12 = CFSTR("PGThrowbackThursdayTitleMoreRecent");
    else
      v12 = CFSTR("PGThrowbackThursdayTitleLongerAgo");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, v12, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v17, "setMomentNodes:", v18);

  -[PGTimeTitleOptions setAllowedFormats:](v17, "setAllowedFormats:", 1);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v19, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  if (v21)
    v21[2](v21, v16, v20);

}

- (id)titleGenerator:(id)a3 inputForArgument:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfYearsAgo, a4);
}

@end
