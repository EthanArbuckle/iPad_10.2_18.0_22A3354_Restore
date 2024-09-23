@implementation MBManifestBuilder

+ (id)manifestBuilderWithDirectory:(id)a3 error:(id *)a4
{
  return -[MBManifestBuilder initWithDirectory:error:]([MBManifestBuilder alloc], "initWithDirectory:error:", a3, a4);
}

- (MBManifestBuilder)initWithDirectory:(id)a3 error:(id *)a4
{
  MBManifestBuilder *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MBManifestBuilder;
  v6 = -[MBManifestBuilder init](&v9, "init");
  if (v6)
  {
    v6->_directory = (NSString *)a3;
    v6->_properties = (MBProperties *)objc_alloc_init((Class)MBProperties);
    v7 = +[MBEncoder encoderToFile:error:](MBEncoder, "encoderToFile:error:", -[MBManifestBuilder databasePath](v6, "databasePath"), a4);
    if (v7)
    {
      v6->_databaseBuilder = -[MBDatabaseBuilder initWithEncoder:]([MBDatabaseBuilder alloc], "initWithEncoder:", v7);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBManifestBuilder;
  -[MBManifestBuilder dealloc](&v3, "dealloc");
}

- (NSString)propertiesPath
{
  return -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("Manifest.plist"));
}

- (NSString)databasePath
{
  return -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", CFSTR("Manifest.mbdb"));
}

- (BOOL)closeWithError:(id *)a3
{
  unsigned int v4;

  v4 = -[MBProperties writeToFile:error:](self->_properties, "writeToFile:error:", -[MBManifestBuilder propertiesPath](self, "propertiesPath"), a3);
  if (v4)
    -[MBDatabaseBuilder close](self->_databaseBuilder, "close");
  return v4;
}

- (NSString)directory
{
  return self->_directory;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (MBDatabaseBuilder)databaseBuilder
{
  return self->_databaseBuilder;
}

@end
