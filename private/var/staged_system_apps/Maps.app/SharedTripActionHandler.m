@implementation SharedTripActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_opt_class(SharedTripAction);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    v7 = v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shareTrip"));

    objc_msgSend(v8, "openSharedTrip:", v9);
  }

}

@end
