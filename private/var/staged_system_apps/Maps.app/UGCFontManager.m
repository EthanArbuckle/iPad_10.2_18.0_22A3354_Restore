@implementation UGCFontManager

+ (id)ratingCategoryLabelFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightMedium);
}

+ (id)ratingGlyphButtonFont
{
  return +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleBody, UIFontWeightSemibold);
}

+ (id)poiEnrichmentHeaderViewTitleFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightSemibold);
}

+ (id)poiEnrichmentHeaderViewSecondaryTitleFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

+ (id)poiEnrichmentSectionHeaderTitleFont
{
  return +[UIFont system20Bold](UIFont, "system20Bold");
}

+ (id)userInfoPrimaryLabelFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline);
}

+ (id)userInfoSecondaryLabelFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1);
}

+ (id)userInfoPrimaryLabelFontCommunityID
{
  return +[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 13.0);
}

@end
