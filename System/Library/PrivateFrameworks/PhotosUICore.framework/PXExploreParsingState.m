@implementation PXExploreParsingState

- (int64_t)parseLocation
{
  return self->_parseLocation;
}

- (void)setParseLocation:(int64_t)a3
{
  self->_parseLocation = a3;
}

- (int64_t)nextRowType
{
  return self->_nextRowType;
}

- (void)setNextRowType:(int64_t)a3
{
  self->_nextRowType = a3;
}

- (int64_t)effectiveLargeHeroDensity
{
  return self->_effectiveLargeHeroDensity;
}

- (void)setDidMoveBestItemOutOfNextShortRow:(BOOL)a3
{
  self->_didMoveBestItemOutOfNextShortRow = a3;
}

- (void)setNumberOfConsecutiveMediumHeroRows:(int64_t)a3
{
  self->_numberOfConsecutiveMediumHeroRows = a3;
}

- (void)setDidMoveBestItemOutOfPreviousShortRowIntoHeroRow:(BOOL)a3
{
  self->_didMoveBestItemOutOfPreviousShortRowIntoHeroRow = a3;
}

- (void)setNextHeroSide:(int64_t)a3
{
  self->_nextHeroSide = a3;
  self->_canIgnoreNextHeroSide = 0;
}

- (int64_t)nextHeroSide
{
  return self->_nextHeroSide;
}

- (void)prepareWithMetrics:(id)a3
{
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "allowHeaders") & 1) != 0)
    v4 = 1;
  else
    v4 = (objc_msgSend(v11, "layoutType") == 2
       || objc_msgSend(v11, "layoutType") == 4
       || objc_msgSend(v11, "layoutType") == 5
       || objc_msgSend(v11, "layoutType") == 6)
      && objc_msgSend(v11, "layoutSubtype") != 3;
  -[PXExploreParsingState setParseLocation:](self, "setParseLocation:", 0);
  objc_msgSend(v11, "buildingBlockAspectRatio");
  v6 = v5;
  v7 = 1.0;
  if (v6 > 0.0)
    objc_msgSend(v11, "buildingBlockAspectRatio", 1.0);
  -[PXExploreParsingState setBuildingBlockAspectRatio:](self, "setBuildingBlockAspectRatio:", v7);
  if (objc_msgSend(v11, "layoutSubtype") == 3)
  {
    v8 = objc_msgSend(v11, "layoutType");
    v9 = 1;
    if (v8 != 1)
      v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  if (v4)
    v10 = 0;
  else
    v10 = v9;
  -[PXExploreParsingState setNextRowType:](self, "setNextRowType:", v10);
  -[PXExploreParsingState setNextHeroSide:](self, "setNextHeroSide:", 0);
  self->_canIgnoreNextHeroSide = 1;
  -[PXExploreParsingState setNumberOfConsecutiveMediumHeroRows:](self, "setNumberOfConsecutiveMediumHeroRows:", 0);
  -[PXExploreParsingState setEffectiveLargeHeroDensity:](self, "setEffectiveLargeHeroDensity:", objc_msgSend(v11, "largeHeroDensity"));
  -[PXExploreParsingState setNumberOfColumnsOverride:](self, "setNumberOfColumnsOverride:", 0);
  -[PXExploreParsingState setLastHeroRowTag:](self, "setLastHeroRowTag:", 0);

}

- (void)setEffectiveLargeHeroDensity:(int64_t)a3
{
  self->_effectiveLargeHeroDensity = a3;
}

- (void)setBuildingBlockAspectRatio:(double)a3
{
  self->_buildingBlockAspectRatio = a3;
}

- (void)setNumberOfColumnsOverride:(int64_t)a3
{
  self->_numberOfColumnsOverride = a3;
}

- (void)setLastHeroRowTag:(int64_t)a3
{
  self->_lastHeroRowTag = a3;
}

- (int64_t)numberOfConsecutiveMediumHeroRows
{
  return self->_numberOfConsecutiveMediumHeroRows;
}

- (double)buildingBlockAspectRatio
{
  return self->_buildingBlockAspectRatio;
}

- (BOOL)canIgnoreNextHeroSide
{
  return self->_canIgnoreNextHeroSide;
}

- (int64_t)numberOfColumnsOverride
{
  return self->_numberOfColumnsOverride;
}

- (int64_t)lastHeroRowTag
{
  return self->_lastHeroRowTag;
}

- (BOOL)didMoveBestItemOutOfNextShortRow
{
  return self->_didMoveBestItemOutOfNextShortRow;
}

- (BOOL)didMoveBestItemOutOfPreviousShortRowIntoHeroRow
{
  return self->_didMoveBestItemOutOfPreviousShortRowIntoHeroRow;
}

@end
