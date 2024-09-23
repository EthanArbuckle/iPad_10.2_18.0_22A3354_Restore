@implementation ExtensionsDebugController

- (void)prepareContent
{
  id v3;
  id v4;
  void *v5;
  _MXExtensionManager *v6;
  _MXExtensionManager *extManager;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Restaurant Reservations"), &stru_1011DD0F8);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Car Extension"), &stru_1011DD118);
  if (!self->_extManager)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_MXExtensionManager _lookupPolicyForAllExtensions](_MXExtensionManager, "_lookupPolicyForAllExtensions"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100977624;
    v10[3] = &unk_1011AD9D0;
    objc_copyWeak(&v11, &location);
    v6 = (_MXExtensionManager *)objc_claimAutoreleasedReturnValue(+[_MXExtensionManager managerWithExtensionLookupPolicy:updateHandler:](_MXExtensionManager, "managerWithExtensionLookupPolicy:updateHandler:", v5, v10));
    extManager = self->_extManager;
    self->_extManager = v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (self->_extensions)
  {
    v13[0] = kMapsExtensionPointNameServices;
    v13[1] = kMapsExtensionPointNameServicesUI;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100977850;
    v9[3] = &unk_1011DD168;
    v9[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

  }
}

- (void)_addSectionWithMapsExtensionPointName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_extensions, "objectForKeyedSubscript:", v4));

  if (v5)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100977958;
    v7[3] = &unk_1011B4F90;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v8, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
  -[MapsDebugValuesViewController rebuildSections](self, "rebuildSections");
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Maps Extensions");
}

- (NSDictionary)extensions
{
  return self->_extensions;
}

- (_MXExtensionManager)extManager
{
  return self->_extManager;
}

- (void)setExtManager:(id)a3
{
  objc_storeStrong((id *)&self->_extManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extManager, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
