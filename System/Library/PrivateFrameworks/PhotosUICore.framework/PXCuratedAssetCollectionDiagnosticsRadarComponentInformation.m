@implementation PXCuratedAssetCollectionDiagnosticsRadarComponentInformation

- (PXCuratedAssetCollectionDiagnosticsRadarComponentInformation)initWithComponentID:(id)a3 name:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXCuratedAssetCollectionDiagnosticsRadarComponentInformation *v11;
  uint64_t v12;
  NSString *componentID;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *version;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXCuratedAssetCollectionDiagnosticsRadarComponentInformation;
  v11 = -[PXCuratedAssetCollectionDiagnosticsRadarComponentInformation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    componentID = v11->_componentID;
    v11->_componentID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    version = v11->_version;
    v11->_version = (NSString *)v16;

  }
  return v11;
}

- (NSString)componentID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
}

@end
