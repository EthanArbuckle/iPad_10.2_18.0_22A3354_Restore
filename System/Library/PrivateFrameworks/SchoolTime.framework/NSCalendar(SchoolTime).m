@implementation NSCalendar(SchoolTime)

- (void)SCL_enumerateWeekdaysUsingBlock:()SchoolTime
{
  void (**v4)(id, unint64_t, _BYTE *);
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "firstWeekday");
  v6 = v5;
  v9 = 0;
  if (v5 > 7)
    goto LABEL_8;
  v7 = v5;
LABEL_3:
  v4[2](v4, v7, &v9);
  while (v7 != 7)
  {
    ++v7;
    if (!v9)
      goto LABEL_3;
  }
  if (v6 >= 2)
  {
LABEL_8:
    v8 = 1;
    do
    {
      if (!v9)
        v4[2](v4, v8, &v9);
      ++v8;
    }
    while (v6 != v8);
  }

}

- (id)SCL_orderedWeekdays
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__NSCalendar_SchoolTime__SCL_orderedWeekdays__block_invoke;
  v5[3] = &unk_24E29C080;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "SCL_enumerateWeekdaysUsingBlock:", v5);

  return v3;
}

- (uint64_t)SCL_nonWeekendDays
{
  void *v2;
  void *v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v22 = __44__NSCalendar_SchoolTime__SCL_nonWeekendDays__block_invoke;
  v23 = &unk_24E29C0A8;
  v4 = v3;
  v24 = v4;
  for (i = 1; i != 8; ++i)
  {
    if ((i - 8) >= 0xFFFFFFF9)
      v22((uint64_t)v21, i);
  }
  v6 = 0;
  v7 = 7;
  do
  {
    v8 = v2;
    v9 = objc_msgSend(a1, "component:fromDate:", 512, v2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v10);

    v11 = objc_msgSend(a1, "isDateInWeekend:", v8);
    if ((unint64_t)(v9 - 1) >= 7)
      v12 = 0;
    else
      v12 = (1 << (v9 - 1));
    v13 = v12 | v6;
    if ((v11 & 1) == 0)
      v6 = v13;
    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 512, 1, v8, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    --v7;
  }
  while (v7);
  if (objc_msgSend(v4, "count"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCA98];
      objc_msgSend(a1, "calendarIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Did not iterate all weekdays; %@; %@ %@ - %@"), v4, v16, v18, v19);

    }
    else
    {
      scl_framework_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[NSCalendar(SchoolTime) SCL_nonWeekendDays].cold.1((uint64_t)v4, a1, v16);
    }

  }
  return v6;
}

- (void)SCL_nonWeekendDays
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138544130;
  v11 = a1;
  v12 = 2114;
  v13 = v6;
  v14 = 2114;
  v15 = v8;
  v16 = 2114;
  v17 = v9;
  _os_log_fault_impl(&dword_21E4AD000, a3, OS_LOG_TYPE_FAULT, "Did not iterate all weekdays; %{public}@; %{public}@ %{public}@ - %{public}@",
    (uint8_t *)&v10,
    0x2Au);

}

@end
