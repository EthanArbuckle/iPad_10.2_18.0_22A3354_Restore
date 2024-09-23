@implementation NavigationSettingsSimulationTypeController

+ (id)navigationDestinationTitle
{
  return CFSTR("Simulation Options");
}

+ (id)_descriptionForSimulationType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 5)
    return 0;
  else
    return *(&off_1011C8D90 + a3 + 1);
}

- (void)prepareContent
{
  void *Integer;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  MapsDebugTableSection *v12;
  id v13;
  _QWORD v14[4];
  id v15[2];
  id location;

  Integer = (void *)GEOConfigGetInteger(NavigationConfig_SimulationType[0], NavigationConfig_SimulationType[1]);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007D3AF4;
  v14[3] = &unk_1011C8B68;
  objc_copyWeak(v15, &location);
  v15[1] = Integer;
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Simulation Type"), v14);
  if (Integer == (void *)4)
    v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Follow Current Route => Off Route"), &stru_1011C8B88);
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Search for Parking"), &stru_1011C8BA8);
  v7 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8BE8);
  v8 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8C08);
  v9 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8C28);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8C48));
  objc_msgSend(v10, "setFooter:", CFSTR("These settings only apply if \"Override Simulation Speed\" is unset."));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011C8C88));
  objc_msgSend(v11, "setFooter:", CFSTR("Overrides the default simulation speed derived from Routing's estimates with a fixed speed."));

  v12 = objc_alloc_init(MapsDebugTableSection);
  v13 = -[MapsDebugTableSection addSwitchRowWithTitle:geoConfigKey:switchOnStateIfUnset:changeHandler:](v12, "addSwitchRowWithTitle:geoConfigKey:switchOnStateIfUnset:changeHandler:", CFSTR("Simulate geofences for transit routes"), NavigationConfig_SimulationSimulateGeoFences[0], NavigationConfig_SimulationSimulateGeoFences[1], 1, &stru_1011C8CC8);
  -[MapsDebugTableSection setVisible:](v12, "setVisible:", GEOConfigGetInteger(NavigationConfig_SimulationType[0], NavigationConfig_SimulationType[1]) != -1);
  -[MapsDebugValuesViewController addSection:](self, "addSection:", v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

@end
