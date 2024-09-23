@implementation VCUIBadgeViewShim

+ (void)setRightBadgeViewForText:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x24BD0B790](a3, a2);
  v4 = (void *)__rightBadgeViewForText;
  __rightBadgeViewForText = v3;

}

+ (void)setRightBadgeSizeForDigits:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x24BD0B790](a3, a2);
  v4 = (void *)__rightBadgeSizeForDigits;
  __rightBadgeSizeForDigits = v3;

}

+ (id)rightBadgeViewForText
{
  return (id)MEMORY[0x24BD0B790](__rightBadgeViewForText, a2);
}

+ (id)rightBadgeSizeForDigits
{
  return (id)MEMORY[0x24BD0B790](__rightBadgeSizeForDigits, a2);
}

+ (void)setDownBadgeViewForText:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x24BD0B790](a3, a2);
  v4 = (void *)__downBadgeViewForText;
  __downBadgeViewForText = v3;

}

+ (void)setDownBadgeSizeForDigits:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = MEMORY[0x24BD0B790](a3, a2);
  v4 = (void *)__downBadgeSizeForDigits;
  __downBadgeSizeForDigits = v3;

}

+ (id)downBadgeViewForText
{
  return (id)MEMORY[0x24BD0B790](__downBadgeViewForText, a2);
}

+ (id)downBadgeSizeForDigits
{
  return (id)MEMORY[0x24BD0B790](__downBadgeSizeForDigits, a2);
}

@end
