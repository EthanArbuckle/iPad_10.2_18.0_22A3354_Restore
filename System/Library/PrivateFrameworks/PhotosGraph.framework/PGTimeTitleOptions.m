@implementation PGTimeTitleOptions

- (PGTimeTitleOptions)init
{
  PGTimeTitleOptions *v2;
  uint64_t v3;
  NSSet *momentNodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGTimeTitleOptions;
  v2 = -[PGTimeTitleOptions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    momentNodes = v2->_momentNodes;
    v2->_momentNodes = (NSSet *)v3;

    v2->_allowedFormats = 7;
    *(_WORD *)&v2->_filterDates = 1;
    v2->_filterForSignificantDateNodes = 1;
  }
  return v2;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (PGGraphYearNodeCollection)featuredYearNodes
{
  return self->_featuredYearNodes;
}

- (void)setFeaturedYearNodes:(id)a3
{
  objc_storeStrong((id *)&self->_featuredYearNodes, a3);
}

- (NSSet)locationNodes
{
  return self->_locationNodes;
}

- (void)setLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_locationNodes, a3);
}

- (unint64_t)allowedFormats
{
  return self->_allowedFormats;
}

- (void)setAllowedFormats:(unint64_t)a3
{
  self->_allowedFormats = a3;
}

- (BOOL)filterDates
{
  return self->_filterDates;
}

- (void)setFilterDates:(BOOL)a3
{
  self->_filterDates = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)usePeopleSubtitleFormatWithYears
{
  return self->_usePeopleSubtitleFormatWithYears;
}

- (void)setUsePeopleSubtitleFormatWithYears:(BOOL)a3
{
  self->_usePeopleSubtitleFormatWithYears = a3;
}

- (BOOL)filterForSignificantDateNodes
{
  return self->_filterForSignificantDateNodes;
}

- (void)setFilterForSignificantDateNodes:(BOOL)a3
{
  self->_filterForSignificantDateNodes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_locationNodes, 0);
  objc_storeStrong((id *)&self->_featuredYearNodes, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

@end
