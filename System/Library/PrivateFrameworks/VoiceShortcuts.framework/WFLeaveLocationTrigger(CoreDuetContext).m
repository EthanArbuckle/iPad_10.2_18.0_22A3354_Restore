@implementation WFLeaveLocationTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForCircularLocationRegions");
}

- (id)contextStorePredicate
{
  void *v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "region");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0C9E460]);
  objc_msgSend(v1, "center");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v1, "radius");
  v8 = v7;
  objc_msgSend(v1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithCenter:radius:identifier:", v9, v4, v6, v8);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "predicateForCircularLocationRegion:state:", v10, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
