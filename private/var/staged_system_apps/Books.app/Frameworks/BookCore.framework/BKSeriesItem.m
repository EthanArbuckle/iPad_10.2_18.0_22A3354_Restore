@implementation BKSeriesItem

+ (id)insertSeriesItemWithAdamId:(id)a3 seriesAdamId:(id)a4 intoManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKSeriesItem"), a5));
  objc_msgSend(v9, "setAdamId:", v8);

  objc_msgSend(v9, "setSeriesAdamId:", v7);
  return v9;
}

+ (id)insertSeriesContainerWithSeriesAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "insertSeriesItemWithAdamId:seriesAdamId:intoManagedObjectContext:", a3, a3, a4));
  objc_msgSend(v4, "setIsContainer:", &__kCFBooleanTrue);
  return v4;
}

+ (id)insertStoreItemWithAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKSeriesItem"), a4));
  objc_msgSend(v6, "setAdamId:", v5);

  return v6;
}

+ (id)fetchRequest
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v3));

  return v4;
}

+ (id)predicateForItemWithAdamId:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("adamId"), a3);
}

+ (id)predicateForAllSeriesContainerItems
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("isContainer"), &__kCFBooleanTrue);
}

+ (id)predicateForContainerWithSeriesId:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = %@) AND (%K == %@)"), CFSTR("seriesAdamId"), a3, CFSTR("isContainer"), &__kCFBooleanTrue);
}

+ (id)predicateForAllBookItems
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ || %K == NULL"), CFSTR("isContainer"), &__kCFBooleanFalse, CFSTR("isContainer"));
}

+ (id)predicateForAllItemsAndContainersInSeries:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("seriesAdamId"), a3);
}

+ (id)predicateForAllItemsAndContainerWithAdamIdInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("adamId"), a3);
}

+ (id)predicateForAllNonSeriesBookItems
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ || %K == NULL"), CFSTR("seriesAdamId"), &stru_296430, CFSTR("seriesAdamId"));
}

@end
