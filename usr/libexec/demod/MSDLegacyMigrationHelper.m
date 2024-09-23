@implementation MSDLegacyMigrationHelper

- (MSDLegacyMigrationHelper)init
{
  MSDLegacyMigrationHelper *v2;
  MSDLegacyMigrationHelper *v3;
  void *v4;
  void *v5;
  void *v6;
  MSDLegacyMigrationHelper *v7;
  _BYTE v9[24];
  _BYTE v10[24];
  _BYTE v11[24];
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MSDLegacyMigrationHelper;
  v2 = -[MSDLegacyMigrationHelper init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDLegacyMigrationHelper getSkyEquivalentVersion](v2, "getSkyEquivalentVersion");
    v24 = v26;
    v25 = v27;
    -[MSDLegacyMigrationHelper setSkyEquivalentVersion:](v3, "setSkyEquivalentVersion:", &v24);
    -[MSDLegacyMigrationHelper getSydneyEquivalentVersion](v3, "getSydneyEquivalentVersion");
    v20 = v22;
    v21 = v23;
    -[MSDLegacyMigrationHelper setSydneyEquivalentVersion:](v3, "setSydneyEquivalentVersion:", &v20);
    -[MSDLegacyMigrationHelper getLastMigrationVersion](v3, "getLastMigrationVersion");
    v16 = v18;
    v17 = v19;
    -[MSDLegacyMigrationHelper setLastMigrationVersion:](v3, "setLastMigrationVersion:", &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "operatingSystemVersion");
    }
    else
    {
      v14 = 0uLL;
      v15 = 0;
    }
    v12 = v14;
    v13 = v15;
    -[MSDLegacyMigrationHelper setCurrentOSVersion:](v3, "setCurrentOSVersion:", &v12);

    -[MSDLegacyMigrationHelper skyEquivalentVersion](v3, "skyEquivalentVersion");
    -[MSDLegacyMigrationHelper setDoPreSkyMigration:](v3, "setDoPreSkyMigration:", -[MSDLegacyMigrationHelper getDoMigrationForTargetRelease:](v3, "getDoMigrationForTargetRelease:", v11));
    -[MSDLegacyMigrationHelper sydneyEquivalentVersion](v3, "sydneyEquivalentVersion");
    -[MSDLegacyMigrationHelper setDoPreSydneyMigration:](v3, "setDoPreSydneyMigration:", -[MSDLegacyMigrationHelper getDoMigrationForTargetRelease:](v3, "getDoMigrationForTargetRelease:", v10));
    -[MSDLegacyMigrationHelper currentOSVersion](v3, "currentOSVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper stringFromNSOperatingSystemVersion:](v3, "stringFromNSOperatingSystemVersion:", v9));
    -[MSDLegacyMigrationHelper setOsVersionStr:](v3, "setOsVersionStr:", v6);

    v7 = v3;
  }

  return v3;
}

- (void)saveOSVerionAfterMigration
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper osVersionStr](self, "osVersionStr"));
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving last migration OS version: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper osVersionStr](self, "osVersionStr"));
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("LastMigrationVersion"));

}

- (id)stringFromNSOperatingSystemVersion:(id *)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%td.%td.%td"), a3->var0, a3->var1, a3->var2);
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSkyEquivalentVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 15;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getSydneyEquivalentVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 16;
  return self;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)getLastMigrationVersion
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;

  retstr->var1 = -1;
  retstr->var2 = -1;
  retstr->var0 = -1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LastMigrationVersion")));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(".")));
    v7 = v6;
    if (v6 && -[NSObject count](v6, "count") == (id)3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0));
      retstr->var0 = (int64_t)objc_msgSend(v8, "integerValue");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 1));
      retstr->var1 = (int64_t)objc_msgSend(v9, "integerValue");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 2));
      retstr->var2 = (int64_t)objc_msgSend(v10, "integerValue");

    }
    else
    {
      v14 = sub_1000604F0();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000C9888((uint64_t)v5, v15);

    }
  }
  else
  {
    v16 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C9848(v7);
  }

  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Last migration OS version: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  return result;
}

- (BOOL)getDoMigrationForTargetRelease:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  _QWORD v10[6];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D buf;

  buf = *a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLegacyMigrationHelper stringFromNSOperatingSystemVersion:](self, "stringFromNSOperatingSystemVersion:", &buf));
  -[MSDLegacyMigrationHelper lastMigrationVersion](self, "lastMigrationVersion");
  if (v10[3] == -1)
  {
    v6 = 1;
  }
  else
  {
    -[MSDLegacyMigrationHelper lastMigrationVersion](self, "lastMigrationVersion");
    buf = *a3;
    v6 = -[MSDLegacyMigrationHelper isVersion:lowerThan:](self, "isVersion:lowerThan:", v10, &buf);
  }
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138543618;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v5;
    WORD2(buf.var1) = 1026;
    *(_DWORD *)((char *)&buf.var1 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Need legacy migration for target OS release (%{public}@): %{public, BOOL}d", (uint8_t *)&buf, 0x12u);
  }

  return v6;
}

- (BOOL)isVersion:(id *)a3 lowerThan:(id *)a4
{
  BOOL v4;
  int64_t var1;
  int64_t v6;

  v4 = a3->var0 < a4->var0;
  if (a3->var0 == a4->var0)
  {
    var1 = a3->var1;
    v6 = a4->var1;
    v4 = var1 < v6;
    if (var1 == v6)
      return a3->var2 < a4->var2;
  }
  return v4;
}

- (BOOL)doPreSkyMigration
{
  return self->_doPreSkyMigration;
}

- (void)setDoPreSkyMigration:(BOOL)a3
{
  self->_doPreSkyMigration = a3;
}

- (BOOL)doPreSydneyMigration
{
  return self->_doPreSydneyMigration;
}

- (void)setDoPreSydneyMigration:(BOOL)a3
{
  self->_doPreSydneyMigration = a3;
}

- (NSString)osVersionStr
{
  return self->_osVersionStr;
}

- (void)setOsVersionStr:(id)a3
{
  self->_osVersionStr = (NSString *)a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)skyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[1];
  return self;
}

- (void)setSkyEquivalentVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_skyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_skyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)sydneyEquivalentVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (void)setSydneyEquivalentVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_sydneyEquivalentVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_sydneyEquivalentVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastMigrationVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (void)setLastMigrationVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastMigrationVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_lastMigrationVersion.majorVersion = v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[4];
  return self;
}

- (void)setCurrentOSVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_currentOSVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_currentOSVersion.majorVersion = v3;
}

@end
