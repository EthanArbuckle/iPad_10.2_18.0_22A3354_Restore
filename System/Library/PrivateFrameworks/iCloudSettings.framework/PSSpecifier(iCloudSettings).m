@implementation PSSpecifier(iCloudSettings)

- (BOOL)ics_startSpinner
{
  return +[ICSPSSpecifier _startSpinnerWithSpecifier:](ICSPSSpecifier, "_startSpinnerWithSpecifier:", a1);
}

- (BOOL)ics_stopSpinner
{
  return +[ICSPSSpecifier _stopSpinnerWithSpecifier:](ICSPSSpecifier, "_stopSpinnerWithSpecifier:", a1);
}

- (void)ics_overrideAccessorsWithTarget:()iCloudSettings getter:setter:
{
  void *v8;
  void *v9;
  void *v10;
  int *v11;
  void *v12;
  void *v13;
  int *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(a1, "propertyForKey:", CFSTR("_ics_overridenTarget"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(a1, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setProperty:forKey:", v9, CFSTR("_ics_overridenTarget"));

  }
  objc_msgSend(a1, "propertyForKey:", CFSTR("_ics_overridenGetter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int *)MEMORY[0x24BE75750];
  if (!v10)
  {
    NSStringFromSelector(*(SEL *)&a1[*MEMORY[0x24BE75750]]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setProperty:forKey:", v12, CFSTR("_ics_overridenGetter"));

  }
  objc_msgSend(a1, "propertyForKey:", CFSTR("_ics_overridenSetter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (int *)MEMORY[0x24BE75760];
  if (!v13)
  {
    NSStringFromSelector(*(SEL *)&a1[*MEMORY[0x24BE75760]]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setProperty:forKey:", v15, CFSTR("_ics_overridenSetter"));

  }
  objc_msgSend(a1, "setTarget:", v16);
  *(_QWORD *)&a1[*v11] = a4;
  *(_QWORD *)&a1[*v14] = a5;

}

- (id)ics_performSuperGetter
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "propertyForKey:", CFSTR("_ics_overridenTarget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_ics_selectorForKey:", CFSTR("_ics_overridenGetter"));
  if (v3 && (v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
  {
    ((void (*)(void *, uint64_t, void *))objc_msgSend(v2, "methodForSelector:", v4))(v2, v4, a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)ics_performSuperSetterWithValue:()iCloudSettings
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "propertyForKey:", CFSTR("_ics_overridenTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "_ics_selectorForKey:", CFSTR("_ics_overridenSetter"));
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      ((void (*)(void *, uint64_t, id, void *))objc_msgSend(v4, "methodForSelector:", v6))(v4, v6, v7, a1);
  }

}

- (SEL)_ics_selectorForKey:()iCloudSettings
{
  NSString *v1;
  SEL v2;

  objc_msgSend(a1, "propertyForKey:");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = NSSelectorFromString(v1);
  else
    v2 = 0;

  return v2;
}

@end
