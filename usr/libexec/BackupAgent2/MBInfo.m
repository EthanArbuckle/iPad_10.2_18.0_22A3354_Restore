@implementation MBInfo

+ (id)info
{
  return objc_alloc_init(MBInfo);
}

+ (id)infoWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  return -[MBInfo initWithDrive:path:error:]([MBInfo alloc], "initWithDrive:path:error:", a3, a4, a5);
}

- (MBInfo)init
{
  MBInfo *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBInfo;
  v2 = -[MBInfo init](&v4, "init");
  if (v2)
    v2->_plist = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
  return v2;
}

- (MBInfo)initWithPropertyList:(id)a3
{
  MBInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBInfo;
  v4 = -[MBInfo init](&v6, "init");
  if (v4)
    v4->_plist = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  return v4;
}

- (MBInfo)initWithDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  MBInfo *v8;
  objc_super v10;

  v6 = objc_msgSend(a3, "propertyListAtPath:options:error:", a4, 0, a5);
  if (v6)
  {
    v7 = v6;
    v10.receiver = self;
    v10.super_class = (Class)MBInfo;
    v8 = -[MBInfo init](&v10, "init");
    if (v8)
      v8->_plist = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBInfo;
  -[MBInfo dealloc](&v3, "dealloc");
}

- (NSString)displayName
{
  NSString *result;

  result = (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Display Name"));
  if (!result)
  {
    result = -[MBInfo deviceName](self, "deviceName");
    if (!result)
      return (NSString *)MBDeviceClass();
  }
  return result;
}

- (void)setDisplayName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Display Name"));
}

- (NSString)deviceName
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Device Name"));
}

- (void)setDeviceName:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Device Name"));
}

- (NSDate)lastBackupDate
{
  NSDate *result;

  result = (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Last Backup Date"));
  if (!result)
    return +[NSDate date](NSDate, "date");
  return result;
}

- (void)setLastBackupDate:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Last Backup Date"));
}

- (NSString)targetIdentifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Target Identifier"));
}

- (void)setTargetIdentifier:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Target Identifier"));
}

- (NSString)productVersion
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("Product Version"));
}

- (BOOL)writeToDrive:(id)a3 path:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "uploadPropertyList:toPath:options:error:", self->_plist, a4, 0, a5);
}

@end
