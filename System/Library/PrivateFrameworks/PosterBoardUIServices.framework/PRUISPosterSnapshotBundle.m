@implementation PRUISPosterSnapshotBundle

- (PRUISPosterSnapshotBundle)initWithUnderlyingSnapshotBundle:(id)a3
{
  id v5;
  PRUISPosterSnapshotBundle *v6;
  PRUISPosterSnapshotBundle *v7;
  PRUISPosterSnapshotBundle *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PRUISPosterSnapshotBundle;
    v6 = -[PRUISPosterSnapshotBundle init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_underlyingSnapshotBundle, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PRUISPosterSnapshotBundle)initWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PRUISPosterSnapshotBundle *v7;

  v4 = (objc_class *)MEMORY[0x24BE74ED0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  v7 = -[PRUISPosterSnapshotBundle initWithUnderlyingSnapshotBundle:](self, "initWithUnderlyingSnapshotBundle:", v6);
  return v7;
}

+ (id)snapshotBundleAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE74ED0], "snapshotBundleAtURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnderlyingSnapshotBundle:", v5);
  else
    v6 = 0;

  return v6;
}

- (NSURL)bundleURL
{
  return (NSURL *)-[PUIPosterSnapshotBundle bundleURL](self->_underlyingSnapshotBundle, "bundleURL");
}

- (NSDictionary)infoDictionary
{
  return (NSDictionary *)-[PUIPosterSnapshotBundle infoDictionary](self->_underlyingSnapshotBundle, "infoDictionary");
}

- (BOOL)isValidBundle
{
  return -[PUIPosterSnapshotBundle isValidBundle](self->_underlyingSnapshotBundle, "isValidBundle");
}

- (NSDate)dateCreated
{
  return (NSDate *)-[PUIPosterSnapshotBundle dateCreated](self->_underlyingSnapshotBundle, "dateCreated");
}

- (NSUUID)posterUUID
{
  return (NSUUID *)-[PUIPosterSnapshotBundle posterUUID](self->_underlyingSnapshotBundle, "posterUUID");
}

- (NSString)posterProvider
{
  return (NSString *)-[PUIPosterSnapshotBundle posterProvider](self->_underlyingSnapshotBundle, "posterProvider");
}

- (NSString)hardwareIdentifier
{
  return (NSString *)-[PUIPosterSnapshotBundle hardwareIdentifier](self->_underlyingSnapshotBundle, "hardwareIdentifier");
}

- (NSString)snapshotDefinitionIdentifier
{
  return (NSString *)-[PUIPosterSnapshotBundle snapshotDefinitionIdentifier](self->_underlyingSnapshotBundle, "snapshotDefinitionIdentifier");
}

- (NSString)bootSessionidentifier
{
  return (NSString *)-[PUIPosterSnapshotBundle bootSessionidentifier](self->_underlyingSnapshotBundle, "bootSessionidentifier");
}

- (NSArray)snapshotLevelSets
{
  void *v2;
  void *v3;

  -[PUIPosterSnapshotBundle snapshotLevelSets](self->_underlyingSnapshotBundle, "snapshotLevelSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

PRUISPosterLevelSet *__46__PRUISPosterSnapshotBundle_snapshotLevelSets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRUISPosterLevelSet *v3;
  void *v4;
  PRUISPosterLevelSet *v5;

  v2 = a2;
  v3 = [PRUISPosterLevelSet alloc];
  objc_msgSend(v2, "levels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PRUISPosterLevelSet initWithLevels:](v3, "initWithLevels:", v4);
  return v5;
}

- (unint64_t)snapshotEpoch
{
  return -[PUIPosterSnapshotBundle snapshotEpoch](self->_underlyingSnapshotBundle, "snapshotEpoch");
}

- (unint64_t)snapshotBundleVersion
{
  return -[PUIPosterSnapshotBundle snapshotBundleVersion](self->_underlyingSnapshotBundle, "snapshotBundleVersion");
}

- (unint64_t)posterVersion
{
  return -[PUIPosterSnapshotBundle posterVersion](self->_underlyingSnapshotBundle, "posterVersion");
}

- (CGSize)assetSize
{
  double v2;
  double v3;
  CGSize result;

  -[PUIPosterSnapshotBundle assetSize](self->_underlyingSnapshotBundle, "assetSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)interfaceOrientation
{
  return -[PUIPosterSnapshotBundle interfaceOrientation](self->_underlyingSnapshotBundle, "interfaceOrientation");
}

- (int64_t)deviceOrientation
{
  return -[PUIPosterSnapshotBundle deviceOrientation](self->_underlyingSnapshotBundle, "deviceOrientation");
}

- (int64_t)userInterfaceStyle
{
  return -[PUIPosterSnapshotBundle userInterfaceStyle](self->_underlyingSnapshotBundle, "userInterfaceStyle");
}

- (double)snapshotScale
{
  double result;

  -[PUIPosterSnapshotBundle snapshotScale](self->_underlyingSnapshotBundle, "snapshotScale");
  return result;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[PUIPosterSnapshotBundle objectForKeyedSubscript:](self->_underlyingSnapshotBundle, "objectForKeyedSubscript:", a3);
}

- (UIImage)foregroundSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle foregroundSnapshot](self->_underlyingSnapshotBundle, "foregroundSnapshot");
}

- (UIImage)floatingSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle floatingSnapshot](self->_underlyingSnapshotBundle, "floatingSnapshot");
}

- (UIImage)backgroundSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle backgroundSnapshot](self->_underlyingSnapshotBundle, "backgroundSnapshot");
}

- (UIImage)compositeSnapshot
{
  return (UIImage *)-[PUIPosterSnapshotBundle compositeSnapshot](self->_underlyingSnapshotBundle, "compositeSnapshot");
}

- (id)snapshotForLevelSet:(id)a3
{
  PUIPosterSnapshotBundle *underlyingSnapshotBundle;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  underlyingSnapshotBundle = self->_underlyingSnapshotBundle;
  v4 = (objc_class *)MEMORY[0x24BE74EB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "levels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithSet:", v7);
  -[PUIPosterSnapshotBundle snapshotForLevelSet:](underlyingSnapshotBundle, "snapshotForLevelSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (PRUISPosterSnapshotBundle)snapshotBundleWithPUIPosterSnapshotBundle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUnderlyingSnapshotBundle:", v4);

  return (PRUISPosterSnapshotBundle *)v5;
}

- (PUIColorStatistics)colorStatistics
{
  return (PUIColorStatistics *)-[PUIPosterSnapshotBundle colorStatistics](self->_underlyingSnapshotBundle, "colorStatistics");
}

- (PRPosterSnapshotBundle)prPosterSnapshotBundle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE74E20];
  -[PRUISPosterSnapshotBundle underlyingSnapshotBundle](self, "underlyingSnapshotBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotBundleWithPUIPosterSnapshotBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterSnapshotBundle *)v4;
}

- (PUIPosterSnapshotBundle)underlyingSnapshotBundle
{
  return self->_underlyingSnapshotBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSnapshotBundle, 0);
}

@end
