@implementation FMFAppMapUtilities

+ (unint64_t)transformedMapTypeForType:(unint64_t)a3
{
  if (a3 == 2)
    return 3;
  else
    return 4 * (a3 == 1);
}

+ (unint64_t)storedMapType
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("storedMapSegmentIndex")));

  if (objc_msgSend(v3, "integerValue"))
    v4 = +[FMFAppMapUtilities transformedMapTypeForType:](FMFAppMapUtilities, "transformedMapTypeForType:", objc_msgSend(v3, "integerValue"));
  else
    v4 = 0;

  return v4;
}

@end
