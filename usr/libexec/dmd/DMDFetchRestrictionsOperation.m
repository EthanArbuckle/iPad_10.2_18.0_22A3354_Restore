@implementation DMDFetchRestrictionsOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = objc_opt_class(DMFFetchRestrictionsRequest);
  v5[1] = objc_opt_class(DMFFetchGlobalRestrictionsRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C2D48;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRestrictions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultRestrictions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:](MCRestrictionManager, "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:", v4, v5));

  v7 = objc_msgSend(objc_alloc((Class)DMFFetchRestrictionsResultObject), "initWithRestrictions:", v6);
  -[DMDFetchRestrictionsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v7);

}

@end
