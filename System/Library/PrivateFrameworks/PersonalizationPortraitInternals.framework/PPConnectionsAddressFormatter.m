@implementation PPConnectionsAddressFormatter

+ (id)addressComponentValueWithLocationField:(unsigned __int8)a3 forAddress:(id)a4 duetEvent:(id)a5
{
  int v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  v10 = 0;
  switch(v6)
  {
    case 2:
      objc_msgSend(v8, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A60], "locationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PPCollapseWhitespaceAndStrip();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      objc_msgSend(v7, "street");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(v7, "city");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(v7, "postalCode");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      objc_msgSend(v7, "state");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      v15 = (void *)objc_opt_class();
      objc_msgSend(v7, "city");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formattedCityAndStateWithCity:state:", v11, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      objc_msgSend(v7, "country");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = (void *)v14;
      PPCollapseWhitespaceAndStrip();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 10:
      objc_msgSend(v8, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A60], "phoneNumbers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PPCollapseWhitespaceAndStrip();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_12:

LABEL_13:
      break;
    default:
      break;
  }

  return v10;
}

+ (BOOL)isValidAddressDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Thoroughfare"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Street"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v7 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZIP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("City"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  if (!v5)
    goto LABEL_9;
LABEL_10:

  return v7;
}

+ (id)formattedStreetNameWithThoroughfare:(id)a3 subThoroughfare:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length") && !objc_msgSend(v5, "hasPrefix:", v6))
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v6, v5);
  else
    v7 = v5;
  v8 = v7;
  PPCollapseWhitespaceAndStrip();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)formattedCityAndStateWithCity:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@, %@"), v5, v6);
  else
    v7 = v5;
  v8 = v7;
  PPCollapseWhitespaceAndStrip();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)singleLineFormattedAddressWithPostalAddress:(id)a3 shortStyle:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "street");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStreet:", v7);

    objc_msgSend(v5, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCity:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)postalAddressFromDuetEvent:(id)a3
{
  id v5;
  void *v6;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPConnectionsAddressFormatter.m"), 156, CFSTR("_DKEvent is nil"));

  }
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "thoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "subThoroughfare");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStreetNameWithThoroughfare:subThoroughfare:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setStreet:", v13);
  objc_msgSend(v5, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "city");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCity:", v18);

  objc_msgSend(v5, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "postalCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPostalCode:", v22);

  objc_msgSend(v5, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "stateOrProvince");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setState:", v26);

  objc_msgSend(v5, "metadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A60], "country");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCountry:", v30);

  return v14;
}

+ (id)postalAddressFromAttributeSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "thoroughfare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStreetNameWithThoroughfare:subThoroughfare:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStreet:", v8);

  objc_msgSend(v3, "city");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCity:", v10);

  objc_msgSend(v3, "postalCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostalCode:", v12);

  objc_msgSend(v3, "stateOrProvince");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", v14);

  objc_msgSend(v3, "country");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PPCollapseWhitespaceAndStrip();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountry:", v16);

  return v4;
}

+ (id)formattedAddressWithLocationField:(unsigned __int8)a3 address:(id)a4 duetEvent:(id)a5 shortStyle:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_class();
  if ((_DWORD)v8 == 1)
    objc_msgSend(v11, "singleLineFormattedAddressWithPostalAddress:shortStyle:", v10, v6);
  else
    objc_msgSend(v11, "addressComponentValueWithLocationField:forAddress:duetEvent:", v8, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)addressDictionaryFromAttributeSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "postalAddressFromAttributeSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsAddressFormatter singleLineFormattedAddressWithPostalAddress:shortStyle:](PPConnectionsAddressFormatter, "singleLineFormattedAddressWithPostalAddress:shortStyle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v26[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("FormattedAddressLines"));

  }
  v25 = v6;
  objc_msgSend(v3, "subThoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("SubThoroughfare"));
  objc_msgSend(v3, "thoroughfare");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("Thoroughfare"));
  objc_msgSend(v3, "postalCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("ZIP"));
  objc_msgSend(v3, "city");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("City"));
  objc_msgSend(v3, "stateOrProvince");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("State"));
  objc_msgSend(v3, "country");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("Country"));
  objc_msgSend(v3, "namedLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PPCollapseWhitespaceAndStrip();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("Name"));
  if (objc_msgSend(v4, "count"))
    v22 = v4;
  else
    v22 = 0;
  v23 = v22;

  return v23;
}

@end
