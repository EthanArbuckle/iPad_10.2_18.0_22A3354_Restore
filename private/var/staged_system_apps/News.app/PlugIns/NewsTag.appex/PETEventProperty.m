@implementation PETEventProperty

+ (id)ft_appearanceTypeProperty
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v5[0] = &off_1000AECB8;
  v5[1] = &off_1000AECD0;
  v6[0] = CFSTR("stories");
  v6[1] = CFSTR("nostories");
  v5[2] = &off_1000AECE8;
  v5[3] = &off_1000AED00;
  v6[2] = CFSTR("error");
  v6[3] = CFSTR("offline");
  v5[4] = &off_1000AED18;
  v6[4] = CFSTR("placeholder");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 5));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:enumMapping:](PETEventProperty, "propertyWithName:enumMapping:", CFSTR("type"), v2));

  return v3;
}

+ (id)ft_headlineSourceProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:](PETEventProperty, "freeValuedPropertyWithName:", CFSTR("widgetMode"));
}

+ (id)ft_sectionProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:](PETEventProperty, "freeValuedPropertyWithName:", CFSTR("section"));
}

+ (id)ft_widgetDisplayModeProperty
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = &off_1000AECD0;
  v5[1] = &off_1000AECE8;
  v6[0] = CFSTR("compact");
  v6[1] = CFSTR("expanded");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:enumMapping:autoSanitizeValues:](PETEventProperty, "propertyWithName:enumMapping:autoSanitizeValues:", CFSTR("displayMode"), v2, 0));

  return v3;
}

+ (id)ft_userGroupProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:](PETEventProperty, "freeValuedPropertyWithName:", CFSTR("userGroup"));
}

+ (id)ft_localTimeHourProperty
{
  return +[PETEventProperty propertyWithName:range:](PETEventProperty, "propertyWithName:range:", CFSTR("localHour"), 0, 24);
}

+ (id)ft_timeZoneProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:](PETEventProperty, "freeValuedPropertyWithName:", CFSTR("tz"));
}

+ (id)ft_BOOLeanPropertyWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008186C();
  v7[0] = CFSTR("yes");
  v7[1] = CFSTR("no");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PETEventProperty propertyWithName:possibleValues:](PETEventProperty, "propertyWithName:possibleValues:", v3, v4));

  return v5;
}

@end
