@implementation WeatherOpenURLHelper

+ (id)URLForCity:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "urlComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLForWeatherCityComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)URLForWeatherCityComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("long"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lng"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 == 0;

    }
  }
  else
  {
    v6 = 1;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isLocal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!v6 || v8 || v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__WeatherOpenURLHelper_URLForWeatherCityComponents___block_invoke;
    v16[3] = &unk_24DD9E470;
    v17 = v12;
    v13 = v12;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v16);
    v14 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v14, "setScheme:", CFSTR("weather"));
    objc_msgSend(v14, "setQueryItems:", v13);
    objc_msgSend(v14, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __52__WeatherOpenURLHelper_URLForWeatherCityComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

+ (id)cityFromURL:(id)a3 withContainerViewController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "objectForKey:", CFSTR("index"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cities");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v17, "integerValue"));
  else
    objc_msgSend(a1, "cityFromURLComponents:listedCities:", v7, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4
{
  return objc_msgSend(a1, "handleOpenURL:withContainerViewController:completion:", a3, a4, 0);
}

+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "cityFromURL:withContainerViewController:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(a1, "displayCity:usingController:completion:", v10, v8, v9);

  return v10 != 0;
}

+ (void)displayCity:(id)a3 usingController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __63__WeatherOpenURLHelper_displayCity_usingController_completion___block_invoke;
  v18 = &unk_24DD9E498;
  v11 = v9;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v22 = a1;
  v14 = (void (**)(_QWORD))MEMORY[0x220751644](&v15);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v15, v16, v17, v18))
    v14[2](v14);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __63__WeatherOpenURLHelper_displayCity_usingController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "cities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

  if (objc_msgSend(*(id *)(a1 + 40), "isTransient"))
    v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addAndUpdateViewsForCity:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "cities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "showPageForCityAtIndex:animated:completion:", v3, 0, 0);
  +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveCity:", v3);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 0x14)
    objc_msgSend(*(id *)(a1 + 56), "presentAddTransientCityDialog:usingController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)presentAddTransientCityDialog:(id)a3 usingController:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isTransient"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_TRANSIENT_CITY_ALERT_TITLE-%@"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v11, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_TRANSIENT_CITY_ALERT_CANCEL_TITLE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v16, 1, &__block_literal_global_18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v17);

    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ADD_TRANSIENT_CITY_ALERT_ADD_TITLE"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDF67E8];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __70__WeatherOpenURLHelper_presentAddTransientCityDialog_usingController___block_invoke_2;
    v25[3] = &unk_24DD9E4E0;
    v26 = v5;
    v23 = v6;
    v27 = v23;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v21, 0, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v24);

    objc_msgSend(v23, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

uint64_t __70__WeatherOpenURLHelper_presentAddTransientCityDialog_usingController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTransient:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "saveStateToDisk");
}

+ (id)cityFromURLComponents:(id)a3 listedCities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  float v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("lat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("long"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("lng"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v6, "objectForKey:", CFSTR("city"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v8, "floatValue");
  v16 = v15;
  objc_msgSend(v12, "floatValue");
  v18 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v16, v17);
  objc_msgSend(v6, "objectForKey:", CFSTR("isLocal"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (!v20
    || (objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_43),
        (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[City cityContainingLocation:expectedName:fromCities:](City, "cityContainingLocation:expectedName:fromCities:", v18, v13, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(a1, "transientCityFromURLComponents:", v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v21;
}

uint64_t __59__WeatherOpenURLHelper_cityFromURLComponents_listedCities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalWeatherCity");
}

+ (id)transientCityFromURLComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("lat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("long"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("lng"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v3, "objectForKey:", CFSTR("city"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setName:", v9);
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v10, "setLatitude:", v11);
  objc_msgSend(v8, "floatValue");
  objc_msgSend(v10, "setLongitude:", v12);
  objc_msgSend(v10, "setTransient:", 1);
  objc_msgSend(v10, "update");

  return v10;
}

@end
