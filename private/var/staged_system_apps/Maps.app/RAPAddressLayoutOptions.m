@implementation RAPAddressLayoutOptions

+ (id)clientOverrideOptions
{
  RAPAddressLayoutOptions *v2;

  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  -[RAPAddressLayoutOptions setShowFloor:](v2, "setShowFloor:", GEOConfigGetBOOL(MapsConfig_RAPShowFloorAddressCell, off_1014B4188));
  -[RAPAddressLayoutOptions setShowBuilding:](v2, "setShowBuilding:", GEOConfigGetBOOL(MapsConfig_RAPShowBuildingAddressCell, off_1014B4178));
  -[RAPAddressLayoutOptions setShowUnit:](v2, "setShowUnit:", GEOConfigGetBOOL(MapsConfig_RAPShowUnitAddressCell, off_1014B4198));
  return v2;
}

+ (id)allFieldsEnabledOptions
{
  RAPAddressLayoutOptions *v2;

  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  -[RAPAddressLayoutOptions setShowUnit:](v2, "setShowUnit:", 1);
  -[RAPAddressLayoutOptions setShowBuilding:](v2, "setShowBuilding:", 1);
  -[RAPAddressLayoutOptions setShowFloor:](v2, "setShowFloor:", 1);
  return v2;
}

+ (id)allFieldsDisabledOptions
{
  RAPAddressLayoutOptions *v2;

  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  -[RAPAddressLayoutOptions setShowUnit:](v2, "setShowUnit:", 0);
  -[RAPAddressLayoutOptions setShowBuilding:](v2, "setShowBuilding:", 0);
  -[RAPAddressLayoutOptions setShowFloor:](v2, "setShowFloor:", 0);
  return v2;
}

- (RAPAddressLayoutOptions)init
{
  RAPAddressLayoutOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPAddressLayoutOptions;
  result = -[RAPAddressLayoutOptions init](&v3, "init");
  if (result)
  {
    *(_WORD *)&result->_showUnit = 0;
    result->_showFloor = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setShowUnit:", -[RAPAddressLayoutOptions showUnit](self, "showUnit"));
  objc_msgSend(v4, "setShowBuilding:", -[RAPAddressLayoutOptions showBuilding](self, "showBuilding"));
  objc_msgSend(v4, "setShowFloor:", -[RAPAddressLayoutOptions showFloor](self, "showFloor"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v4 = a3;
  v5 = -[RAPAddressLayoutOptions showFloor](self, "showFloor");
  if (v5 == objc_msgSend(v4, "showFloor")
    && (v6 = -[RAPAddressLayoutOptions showUnit](self, "showUnit"), v6 == objc_msgSend(v4, "showUnit")))
  {
    v8 = -[RAPAddressLayoutOptions showBuilding](self, "showBuilding");
    v7 = v8 ^ objc_msgSend(v4, "showBuilding") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (int64_t)numberOfEnabledOptions
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  LODWORD(v3) = -[RAPAddressLayoutOptions showBuilding](self, "showBuilding");
  v4 = -[RAPAddressLayoutOptions showFloor](self, "showFloor");
  v5 = 1;
  if ((_DWORD)v3)
    v5 = 2;
  if (v4)
    v3 = v5;
  else
    v3 = v3;
  return v3 + -[RAPAddressLayoutOptions showUnit](self, "showUnit");
}

- (BOOL)showUnit
{
  return self->_showUnit;
}

- (void)setShowUnit:(BOOL)a3
{
  self->_showUnit = a3;
}

- (BOOL)showBuilding
{
  return self->_showBuilding;
}

- (void)setShowBuilding:(BOOL)a3
{
  self->_showBuilding = a3;
}

- (BOOL)showFloor
{
  return self->_showFloor;
}

- (void)setShowFloor:(BOOL)a3
{
  self->_showFloor = a3;
}

@end
