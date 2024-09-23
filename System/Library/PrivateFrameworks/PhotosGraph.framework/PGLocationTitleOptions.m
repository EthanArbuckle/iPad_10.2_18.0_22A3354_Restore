@implementation PGLocationTitleOptions

- (PGLocationTitleOptions)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGLocationTitleOptions;
  v2 = -[PGLocationTitleOptions init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(1uLL);
    *(_OWORD *)(v2 + 56) = xmmword_1CA8E4CA0;
    *((_DWORD *)v2 + 2) = 65537;
    *((_WORD *)v2 + 6) = 0;
  }
  return (PGLocationTitleOptions *)v2;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNodes:(id)a3
{
  objc_storeStrong((id *)&self->_momentNodes, a3);
}

- (PGGraphAddressNode)keyAssetAddressNode
{
  return self->_keyAssetAddressNode;
}

- (void)setKeyAssetAddressNode:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetAddressNode, a3);
}

- (NSSet)curationAddressNodes
{
  return self->_curationAddressNodes;
}

- (void)setCurationAddressNodes:(id)a3
{
  objc_storeStrong((id *)&self->_curationAddressNodes, a3);
}

- (unint64_t)aoiDisplayType
{
  return self->_aoiDisplayType;
}

- (void)setAoiDisplayType:(unint64_t)a3
{
  self->_aoiDisplayType = a3;
}

- (BOOL)useCities
{
  return self->_useCities;
}

- (void)setUseCities:(BOOL)a3
{
  self->_useCities = a3;
}

- (BOOL)showAllCities
{
  return self->_showAllCities;
}

- (void)setShowAllCities:(BOOL)a3
{
  self->_showAllCities = a3;
}

- (unint64_t)peopleDisplayType
{
  return self->_peopleDisplayType;
}

- (void)setPeopleDisplayType:(unint64_t)a3
{
  self->_peopleDisplayType = a3;
}

- (BOOL)useTripTitleForLongDuration
{
  return self->_useTripTitleForLongDuration;
}

- (void)setUseTripTitleForLongDuration:(BOOL)a3
{
  self->_useTripTitleForLongDuration = a3;
}

- (unint64_t)filterSignificantLocationsType
{
  return self->_filterSignificantLocationsType;
}

- (void)setFilterSignificantLocationsType:(unint64_t)a3
{
  self->_filterSignificantLocationsType = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (BOOL)useBusinessItems
{
  return self->_useBusinessItems;
}

- (void)setUseBusinessItems:(BOOL)a3
{
  self->_useBusinessItems = a3;
}

- (BOOL)useDistrict
{
  return self->_useDistrict;
}

- (void)setUseDistrict:(BOOL)a3
{
  self->_useDistrict = a3;
}

- (BOOL)allowFamilyHome
{
  return self->_allowFamilyHome;
}

- (void)setAllowFamilyHome:(BOOL)a3
{
  self->_allowFamilyHome = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationAddressNodes, 0);
  objc_storeStrong((id *)&self->_keyAssetAddressNode, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

+ (id)onlyPeopleLocationTitleOptions
{
  PGLocationTitleOptions *v2;

  v2 = objc_alloc_init(PGLocationTitleOptions);
  -[PGLocationTitleOptions setAoiDisplayType:](v2, "setAoiDisplayType:", 0);
  -[PGLocationTitleOptions setFilterSignificantLocationsType:](v2, "setFilterSignificantLocationsType:", 0);
  -[PGLocationTitleOptions setPeopleDisplayType:](v2, "setPeopleDisplayType:", 2);
  -[PGLocationTitleOptions setUseTripTitleForLongDuration:](v2, "setUseTripTitleForLongDuration:", 0);
  -[PGLocationTitleOptions setUseCities:](v2, "setUseCities:", 0);
  return v2;
}

@end
