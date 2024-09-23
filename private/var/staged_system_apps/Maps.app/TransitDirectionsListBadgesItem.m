@implementation TransitDirectionsListBadgesItem

- (TransitDirectionsListBadgesItem)initWithBadges:(id)a3
{
  id v5;
  TransitDirectionsListBadgesItem *v6;
  TransitDirectionsListBadgesItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsListBadgesItem;
  v6 = -[TransitDirectionsListItem initWithInstructions:](&v9, "initWithInstructions:", 0);
  v7 = v6;
  if (v6)
  {
    -[TransitDirectionsListItem setType:](v6, "setType:", 17);
    objc_storeStrong((id *)&v7->super._badges, a3);
  }

  return v7;
}

@end
