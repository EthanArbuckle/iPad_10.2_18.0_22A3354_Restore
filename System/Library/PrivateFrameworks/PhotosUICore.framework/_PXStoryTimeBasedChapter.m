@implementation _PXStoryTimeBasedChapter

- (_PXStoryTimeBasedChapter)initWithDateInterval:(id)a3 firstAssetLocalIdentifier:(id)a4
{
  id v7;
  id v8;
  _PXStoryTimeBasedChapter *v9;
  _PXStoryTimeBasedChapter *v10;
  uint64_t v11;
  NSString *firstAssetLocalIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryTimeBasedChapter;
  v9 = -[_PXStoryTimeBasedChapter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    v11 = objc_msgSend(v8, "copy");
    firstAssetLocalIdentifier = v10->_firstAssetLocalIdentifier;
    v10->_firstAssetLocalIdentifier = (NSString *)v11;

  }
  return v10;
}

- (int64_t)compareStartDateTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[_PXStoryTimeBasedChapter dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (NSDateInterval)extendedDateIntervalForComparisonWithAssetDates
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[_PXStoryTimeBasedChapter dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -0.2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v7 = (void *)objc_msgSend(v3, "initWithStartDate:duration:", v5, v6 + 0.4);

  return (NSDateInterval *)v7;
}

- (NSCopying)identifier
{
  void *v2;
  void *v3;

  -[_PXStoryTimeBasedChapter dateInterval](self, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v3;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_PXStoryTimeBasedChapter identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryTimeBasedChapter localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryTimeBasedChapter localizedSubtitle](self, "localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryTimeBasedChapter dateInterval](self, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ id=%@ title=“%@” subtitle=“%@” dateInterval=%@ }"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_PXStoryTimeBasedChapter dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryTimeBasedChapter firstAssetLocalIdentifier](self, "firstAssetLocalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDateInterval:firstAssetLocalIdentifier:", v5, v6);

  -[_PXStoryTimeBasedChapter localizedTitle](self, "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedTitle:", v8);

  -[_PXStoryTimeBasedChapter localizedSubtitle](self, "localizedSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedSubtitle:", v9);

  return v7;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (NSString)firstAssetLocalIdentifier
{
  return self->_firstAssetLocalIdentifier;
}

- (void)setFirstAssetLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
