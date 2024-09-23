@implementation PGBestOfTimeMemoryTitleGenerator

- (PGBestOfTimeMemoryTitleGenerator)initWithStartDate:(id)a3 endDate:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  PGBestOfTimeMemoryTitleGenerator *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = a5;
  objc_msgSend(v11, "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PGBestOfTimeMemoryTitleGenerator;
  v14 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v16, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, v13, 0, 0, 0, 0, 0, v12);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_startDate, a3);
    objc_storeStrong((id *)&v14->_endDate, a4);
    v14->_year = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

- (PGBestOfTimeMemoryTitleGenerator)initWithYear:(int64_t)a3 titleGenerationContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  PGBestOfTimeMemoryTitleGenerator *v9;
  objc_super v11;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PGBestOfTimeMemoryTitleGenerator;
  v9 = -[PGTitleGenerator initWithMomentNodes:referenceDateInterval:keyAsset:curatedAssetCollection:assetCollection:type:titleGenerationContext:](&v11, sel_initWithMomentNodes_referenceDateInterval_keyAsset_curatedAssetCollection_assetCollection_type_titleGenerationContext_, v8, 0, 0, 0, 0, 0, v7);

  if (v9)
    v9->_year = a3;
  return v9;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  if (self->_startDate && self->_endDate)
  {
    v5 = a3;
    -[PGBestOfTimeMemoryTitleGenerator _bestOfPastTimeTitle](self, "_bestOfPastTimeTitle");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a3;
    -[PGBestOfTimeMemoryTitleGenerator _bestOfYearTitle](self, "_bestOfYearTitle");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v6;
  -[PGBestOfTimeMemoryTitleGenerator _generateSubtitle](self, "_generateSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a3 + 2))(a3, v9, v8);

}

- (id)_bestOfPastTimeTitle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGRecentHighlightsTitleFormat"), CFSTR("PGRecentHighlightsTitleFormat"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bestOfYearTitle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGBestOfTheYearMemoryTitleFormat"), CFSTR("PGBestOfTheYearMemoryTitleFormat"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_generateSubtitle
{
  NSDate *startDate;
  void *v4;
  uint64_t v5;
  id v6;
  NSDate *v7;
  void *v8;
  void *v9;

  startDate = self->_startDate;
  if (!startDate)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v6, "setDay:", 1);
    objc_msgSend(v6, "setMonth:", 1);
    objc_msgSend(v6, "setYear:", self->_year);
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v6, 0);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v7, 0.0);

    v5 = 4;
    goto LABEL_7;
  }
  if (!self->_endDate)
  {
    v7 = startDate;
    goto LABEL_6;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", self->_startDate, self->_endDate);
  v5 = 7;
LABEL_7:
  +[PGTimeTitleUtility timeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "timeTitleWithDateInterval:allowedFormats:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v8, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)year
{
  return self->_year;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
