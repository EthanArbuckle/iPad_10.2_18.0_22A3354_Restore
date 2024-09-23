@implementation ICMigrationDeviceInfo

- (ICMigrationDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  id v9;
  ICMigrationDeviceInfo *v10;
  ICMigrationDeviceInfo *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMigrationDeviceInfo;
  v10 = -[ICMigrationDeviceInfo init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_upgradable = a4;
    v11->_upgraded = a5;
  }

  return v11;
}

- (ICMigrationDeviceInfo)initWithName:(id)a3
{
  return -[ICMigrationDeviceInfo initWithName:upgradable:upgraded:](self, "initWithName:upgradable:upgraded:", a3, 1, 0);
}

- (BOOL)shouldBeHidden
{
  return 0;
}

- (id)loggableDescription
{
  return -[ICMigrationDeviceInfo description](self, "description");
}

+ (void)logDeviceList:(id)a3
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v5 = 138412290;
    v12 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = objc_claimAutoreleasedReturnValue(+[REMLogStore utility](REMLogStore, "utility", v12));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "loggableDescription"));
          *(_DWORD *)buf = v12;
          v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

}

- (BOOL)upgradedTo2019OSes
{
  return 0;
}

- (BOOL)upgradableTo2019OSes
{
  return 1;
}

- (BOOL)upgradedToSydneyRomeKincaid
{
  return 0;
}

- (BOOL)upgradableToSydneyRomeKincaid
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)upgraded
{
  return self->_upgraded;
}

- (BOOL)upgradable
{
  return self->_upgradable;
}

- (BOOL)isOSXDevice
{
  return self->_isOSXDevice;
}

- (BOOL)isIOSDevice
{
  return self->_isIOSDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
