@implementation NSNumber

- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4
{
  id v6;
  id v7;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  if (-[NSNumber compare:](v8, "compare:", v6) == NSOrderedAscending)
  {
    v9 = (NSNumber *)v6;

    v8 = v9;
  }
  if ((char *)-[NSNumber compare:](v8, "compare:", v7) == (char *)&dword_0 + 1)
  {
    v10 = (NSNumber *)v7;

    v8 = v10;
  }

  return v8;
}

- (id)bc_assertClampedToMinimum:(id)a3 maximum:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if ((-[NSNumber compare:](self, "compare:", v6) == NSOrderedAscending
     || (char *)-[NSNumber compare:](self, "compare:", v7) == (char *)&dword_0 + 1)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1B9E74((uint64_t)v6, (uint64_t)v7, (uint64_t)self, v8, v9, v10, v11, v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber bc_clampedToMinimum:maximum:](self, "bc_clampedToMinimum:maximum:", v6, v7));

  return v13;
}

- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4 orSubstitute:(id)a5
{
  id v8;
  id v9;
  NSNumber *v10;
  NSNumber *v11;

  v8 = a4;
  v9 = a5;
  v10 = self;
  if (-[NSNumber compare:](v10, "compare:", a3) == NSOrderedAscending
    || (char *)-[NSNumber compare:](v10, "compare:", v8) == (char *)&dword_0 + 1)
  {
    v11 = (NSNumber *)v9;

    v10 = v11;
  }

  return v10;
}

- (id)bc_assertClampedToUnitInterval
{
  return -[NSNumber bc_assertClampedToMinimum:maximum:](self, "bc_assertClampedToMinimum:maximum:", &off_2AA658, &off_2AA670);
}

- (id)bc_clampedToUnitIntervalOrNegativeOne
{
  return -[NSNumber bc_clampedToMinimum:maximum:orSubstitute:](self, "bc_clampedToMinimum:maximum:orSubstitute:", &off_2AA658, &off_2AA670, &off_2AA688);
}

@end
