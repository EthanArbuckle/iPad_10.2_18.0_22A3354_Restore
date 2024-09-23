@implementation CMMotionActivity(RTMotionActivity)

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "cycling"))
    objc_msgSend(v2, "addObject:", CFSTR("cycling"));
  if (objc_msgSend(a1, "automotive"))
    objc_msgSend(v2, "addObject:", CFSTR("automotive"));
  if (objc_msgSend(a1, "running"))
    objc_msgSend(v2, "addObject:", CFSTR("running"));
  if (objc_msgSend(a1, "walking"))
    objc_msgSend(v2, "addObject:", CFSTR("walking"));
  if (objc_msgSend(a1, "stationary"))
    objc_msgSend(v2, "addObject:", CFSTR("stationary"));
  if (objc_msgSend(a1, "unknown"))
    objc_msgSend(v2, "addObject:", CFSTR("unknown"));
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(v2, "addObject:", CFSTR("moving"));
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "confidence");
  objc_msgSend(a1, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type, <%@>, confidence %ld, startDate, %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)rtMotionActivityType
{
  if ((objc_msgSend(a1, "cycling") & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "automotive") & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "running") & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "walking") & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "stationary") & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "unknown"))
    return 0;
  return 6;
}

- (unint64_t)rtMotionActivityConfidence
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "confidence");
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

@end
