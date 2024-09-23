@implementation WLKSportsFavoriteFactory

+ (id)favoriteWithID:(id)a3
{
  id v3;
  WLKSportsFavorite *v4;

  v3 = a3;
  v4 = -[WLKSportsFavorite initWithID:]([WLKSportsFavorite alloc], "initWithID:", v3);

  return v4;
}

+ (id)favoriteFromDictionary:(id)a3
{
  id v3;
  WLKSportsFavorite *v4;

  v3 = a3;
  v4 = -[WLKSportsFavorite initWithDictionary:]([WLKSportsFavorite alloc], "initWithDictionary:", v3);

  return v4;
}

@end
