@implementation TransitPreferencesViewControllerDataSource

- (TransitPreferencesViewControllerDataSource)initWithPreferences:(id)a3 displayHints:(id)a4
{
  id v6;
  id v7;
  TransitPreferencesViewControllerDataSource *v8;
  TransitMutablePreferences *v9;
  TransitMutablePreferences *preferences;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransitPreferencesViewControllerDataSource;
  v8 = -[TransitPreferencesViewControllerDataSource init](&v12, "init");
  if (v8)
  {
    v9 = (TransitMutablePreferences *)objc_msgSend(v6, "mutableCopy");
    preferences = v8->_preferences;
    v8->_preferences = v9;

    if (v7)
      -[TransitPreferencesViewControllerDataSource _configureWithDisplayHints:](v8, "_configureWithDisplayHints:", v7);
  }

  return v8;
}

- (void)_configureWithDisplayHints:(id)a3
{
  GEOSurchargeOption *v4;
  GEOSurchargeOption *surchargeOptions;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *allTransitPrioritizations;
  NSArray *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (GEOSurchargeOption *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "surchargeOptions"));
  surchargeOptions = self->_surchargeOptions;
  self->_surchargeOptions = v4;

  self->_showICFareOption = 0;
  v6 = objc_msgSend(v16, "availablePaymentTypesCount");
  v7 = v16;
  if (v6)
  {
    v8 = 0;
    while (objc_msgSend(v7, "availablePaymentTypeAtIndex:", v8) != 1)
    {
      ++v8;
      v9 = objc_msgSend(v16, "availablePaymentTypesCount");
      v7 = v16;
      if (v8 >= (unint64_t)v9)
        goto LABEL_7;
    }
    self->_showICFareOption = 1;
    v7 = v16;
  }
LABEL_7:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prioritizationOptions"));
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  allTransitPrioritizations = self->_allTransitPrioritizations;
  self->_allTransitPrioritizations = v11;

  v13 = self->_allTransitPrioritizations;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[TransitPreferences sortOption](self->_preferences, "sortOption")));
  LOBYTE(v13) = -[NSArray containsObject:](v13, "containsObject:", v14);

  if ((v13 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_allTransitPrioritizations, "firstObject"));
    -[TransitPreferences setSortOption:](self->_preferences, "setSortOption:", objc_msgSend(v15, "integerValue"));

  }
}

- (int64_t)normalizedSectionIndex:(int64_t)a3
{
  void *v5;
  id v6;

  if (a3 < 0 || -[NSArray count](self->_sections, "count") <= a3)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "integerValue");

  return (int64_t)v6;
}

- (int64_t)numberOfSections
{
  NSArray *sections;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;

  sections = self->_sections;
  if (!sections)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
    objc_msgSend(v4, "addObject:", &off_10126D2D0);
    if (-[NSArray count](self->_allTransitPrioritizations, "count"))
      objc_msgSend(v4, "addObject:", &off_10126D2E8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSurchargeOption surchargeTypes](self->_surchargeOptions, "surchargeTypes"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
      objc_msgSend(v4, "addObject:", &off_10126D300);
    if (self->_showICFareOption)
      objc_msgSend(v4, "addObject:", &off_10126D318);
    v7 = (NSArray *)objc_msgSend(v4, "copy");
    v8 = self->_sections;
    self->_sections = v7;

    sections = self->_sections;
  }
  return -[NSArray count](sections, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  int64_t v4;
  NSArray *allTransitPrioritizations;
  void *v6;
  id v7;

  v4 = -[TransitPreferencesViewControllerDataSource normalizedSectionIndex:](self, "normalizedSectionIndex:", a3);
  switch(v4)
  {
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSurchargeOption surchargeTypes](self->_surchargeOptions, "surchargeTypes"));
      v7 = objc_msgSend(v6, "count");

      return (int64_t)v7;
    case 1:
      allTransitPrioritizations = self->_allTransitPrioritizations;
      return -[NSArray count](allTransitPrioritizations, "count");
    case 0:
      if (qword_1014D24F8 != -1)
        dispatch_once(&qword_1014D24F8, &stru_1011B5D88);
      allTransitPrioritizations = (NSArray *)qword_1014D24F0;
      return -[NSArray count](allTransitPrioritizations, "count");
  }
  return 1;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  v3 = -[TransitPreferencesViewControllerDataSource normalizedSectionIndex:](self, "normalizedSectionIndex:", a3);
  if (v3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Surcharge Options");
LABEL_7:
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

    return v4;
  }
  if (v3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Prefer");
    goto LABEL_7;
  }
  if (v3)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitPreferencesText headerTextForDisabledModes](TransitPreferencesText, "headerTextForDisabledModes"));
  return v4;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  void *v3;

  if ((id)-[TransitPreferencesViewControllerDataSource normalizedSectionIndex:](self, "normalizedSectionIndex:", a3) == (id)3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransitPreferencesText footerTextForICFares](TransitPreferencesText, "footerTextForICFares"));
  else
    v3 = 0;
  return v3;
}

- (unint64_t)_modeForIndexPath:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  if (qword_1014D24F8 != -1)
    dispatch_once(&qword_1014D24F8, &stru_1011B5D88);
  v4 = (id)qword_1014D24F0;
  v5 = objc_msgSend(v3, "item");
  if (v5 >= objc_msgSend(v4, "count"))
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v3, "item")));
    v7 = objc_msgSend(v6, "integerValue");

  }
  return (unint64_t)v7;
}

- (int)_sortForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  if (v5 >= (id)-[NSArray count](self->_allTransitPrioritizations, "count"))
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_allTransitPrioritizations, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));
    v7 = objc_msgSend(v6, "integerValue");

  }
  return v7;
}

- (id)_surchargeForIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSurchargeOption surchargeTypes](self->_surchargeOptions, "surchargeTypes"));
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSurchargeOption surchargeTypes](self->_surchargeOptions, "surchargeTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));

  }
  return v9;
}

- (id)_localizedNameForPriorityOption:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("TransitOptionsSortOrder_Default");
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("TransitOptionsSortOrder_Fastest");
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("TransitOptionsSortOrder_FewestTransfers");
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("TransitOptionsSortOrder_LeastWalking");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (int)_surchargeOptionValueToDisplayAsSelected
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences surchargeOption](self->_preferences, "surchargeOption"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPreferences surchargeOption](self->_preferences, "surchargeOption"));
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSurchargeOption selectedSurchargeType](self->_surchargeOptions, "selectedSurchargeType"));
    v5 = objc_msgSend(v4, "value");
  }

  return v5;
}

- (BOOL)_isCurrentSelectedTransitModeIndividual
{
  unint64_t v2;

  v2 = ~-[TransitPreferences disabledModes](self->_preferences, "disabledModes") & 0xF;
  return (v2 < 9) & (0x116u >> v2);
}

- (TransitMutablePreferences)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_surchargeOptions, 0);
  objc_storeStrong((id *)&self->_allTransitPrioritizations, 0);
}

@end
