@implementation MBServiceConfiguration

+ (id)defaultConfiguration
{
  return objc_alloc_init(MBServiceConfiguration);
}

+ (id)configurationWithPropertyList:(id)a3
{
  return -[MBServiceConfiguration initWithPropertyList:]([MBServiceConfiguration alloc], "initWithPropertyList:", a3);
}

+ (id)configurationWithURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  MBError *v12;
  uint64_t v13;

  v13 = 0;
  v6 = +[MBURLConnection sendSyncRequest:properties:connection:response:error:](MBURLConnection, "sendSyncRequest:properties:connection:response:error:", +[MBURLRequest requestWithURL:](MBURLRequest, "requestWithURL:"), 0, 0, 0, &v13);
  if (v6)
  {
    v7 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v6, 0, 0, &v13);
    if (v7)
      return +[MBServiceConfiguration configurationWithPropertyList:](MBServiceConfiguration, "configurationWithPropertyList:", v7);
    if (a4)
    {
      v10 = v13;
      v11 = CFSTR("Error deserializing configuration");
      v9 = 1;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v9 = (int)+[MBError codeForNSError:](MBError, "codeForNSError:", v13);
    v10 = v13;
    v11 = CFSTR("Error getting configuration");
LABEL_8:
    v12 = +[MBError errorWithCode:error:URL:format:](MBError, "errorWithCode:error:URL:format:", v9, v10, a3, v11);
    result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

- (MBServiceConfiguration)initWithPropertyList:(id)a3
{
  MBServiceConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBServiceConfiguration;
  v4 = -[MBServiceConfiguration init](&v6, "init");
  if (v4)
    v4->_plist = (NSDictionary *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBServiceConfiguration;
  -[MBServiceConfiguration dealloc](&v3, "dealloc");
}

- (NSDictionary)propertyList
{
  return self->_plist;
}

- (NSArray)bundleIDsNotToBackUp
{
  NSArray *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", CFSTR("bundleIDsNotToBackUp"));
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
      v9 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
        return 0;
      if (v5 == (id)++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_4;
        return v2;
      }
    }
  }
  return v2;
}

- (NSSet)domainNamesNotToBackUp
{
  NSSet *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (NSSet *)+[NSMutableSet set](NSMutableSet, "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[MBServiceConfiguration bundleIDsNotToBackUp](self, "bundleIDsNotToBackUp", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSSet addObject:](v3, "addObject:", +[MBDomain nameWithAppID:](MBDomain, "nameWithAppID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8)));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (unint64_t)_positiveIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = -[NSDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", a3);
  if (v5
    && (v6 = v5, v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && (uint64_t)objc_msgSend(v6, "integerValue") >= 1)
  {
    return (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    return a4;
  }
}

- (unint64_t)addFilesCount
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("addFilesCount"), 100);
}

- (unint64_t)addFilesSize
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("addFilesSize"), 0x2000000);
}

- (unint64_t)getFilesCount
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("getFilesCount"), 100);
}

- (unint64_t)getFilesSize
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("getFilesSize"), 0x2000000);
}

- (unint64_t)removeFilesCount
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("removeFilesCount"), 100);
}

- (unint64_t)listFilesCount
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("listFilesCount"), 1000);
}

- (unint64_t)maxInflightContainers
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("maxInflightContainers"), 4);
}

- (unint64_t)maxFileAttributesSize
{
  return -[MBServiceConfiguration _positiveIntegerForKey:defaultValue:](self, "_positiveIntegerForKey:defaultValue:", CFSTR("maxFileAttributesSize"), 2048);
}

@end
