@implementation BRCAccountSessionFPFS(BRCDatabaseManager)

- (void)readOnlyDB
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't open interactive DB: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)expensiveReadOnlyDB
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_230455000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: can't open expensive DB: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_startWatcher
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  brc_append_system_info_to_message();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_230455000, v1, v2, "[CRIT] %@%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)_stepBackupDetector:()BRCDatabaseManager newState:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14();
  v3 = v2;
  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v5 = 136315650;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  v9 = 2112;
  v10 = v1;
  _os_log_debug_impl(&dword_230455000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] failed stating '%s' %{errno}d%@", (uint8_t *)&v5, 0x1Cu);
}

- (void)saveServerZone:()BRCDatabaseManager toDB:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: saving the container state should always work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveServerZone:()BRCDatabaseManager toDB:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: sct.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveClientZoneToDB:()BRCDatabaseManager .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: saving the zone state should always work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveClientZoneToDB:()BRCDatabaseManager .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: lcz.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createServerZone:()BRCDatabaseManager .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: rowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createServerZone:()BRCDatabaseManager .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] trying to create server zone that already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveAppLibrary:()BRCDatabaseManager toDB:supportsEnhancedDrivePrivacy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: saving the app library state should always work%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)saveAppLibrary:()BRCDatabaseManager toDB:supportsEnhancedDrivePrivacy:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: lib.zoneRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createAppLibrary:()BRCDatabaseManager .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: lib.dbRowID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)newSharedClientZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: plist%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)newSharedServerZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: plist != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)newPrivateServerZoneFromPQLResultSet:()BRCDatabaseManager error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: mangledID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createDeviceKeyForNameInServerDB:()BRCDatabaseManager .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] this is the first time we hear of a device named '%@'%@");
  OUTLINED_FUNCTION_0();
}

- (void)createDeviceKeyForNameInServerDB:()BRCDatabaseManager .cold.2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  objc_msgSend(objc_retainAutorelease(v0), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: can't insert device name: '%s'%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_20();
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: unable to update user identity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: userIdentity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_setUserIdentity:()BRCDatabaseManager forName:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: userFormattedName != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createUserKeyForOwnerName:()BRCDatabaseManager .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: userName shouldn't be nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)createUserKeyForOwnerName:()BRCDatabaseManager .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] this is the first time we hear of a user named '%@'%@");
  OUTLINED_FUNCTION_0();
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:()BRCDatabaseManager .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] clearing needs-upgrade errors%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_registerLastBootIfNeeded:()BRCDatabaseManager table:skipControlFiles:deviceIDChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed getting deviceID through device-tracking file%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_checkIntegrity:()BRCDatabaseManager serverTruth:session:skipControlFiles:deviceIDChanged:error:.cold.1(char a1)
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "server";
  if ((a1 & 1) == 0)
    v1 = "client";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] Checking integrity of %s DB%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Client state dictionary is nil. Client state is: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] loaded client-state %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_loadClientStateFromDB:()BRCDatabaseManager .cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Loading client state from DB%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishClientTruthConnectionSetupWithError:()BRCDatabaseManager .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _databaseID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)openAndValidateDatabase:()BRCDatabaseManager serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] database is already on FPFS, skip control files check%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_230455000, v0, v1, "[CRIT] database is stale, can't be migrated (db at version %d, migration range [%d,%d])%@");
  OUTLINED_FUNCTION_20();
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_17(&dword_230455000, v0, v1, "[CRIT] database has a major version from the future: %d (want at most %d)%@");
  OUTLINED_FUNCTION_0();
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] can't reopen db after truncate: %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] failed opening connection: %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)_openConnection:()BRCDatabaseManager serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Opening DB %@%@");
  OUTLINED_FUNCTION_0();
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_19(&dword_230455000, v0, v1, "[DEBUG] no database migration required, version is current (db at version %d)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: db_version == DB_VERSION_CURRENT%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_validateDatabase:()BRCDatabaseManager baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:.cold.3(char a1)
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "server";
  if ((a1 & 1) == 0)
    v1 = "client";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v2, v3, "[DEBUG] Validating %s DB%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_0();
}

+ (void)upgradeOfflineDB:()BRCDatabaseManager serverTruth:session:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Not doing a database migration on an offline database where the major version matches%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_decorateUserInfoForFPFSDomain:()BRCDatabaseManager panicOnDomainIDMismatch:withError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Domain update failed: %@%@");
  OUTLINED_FUNCTION_0();
}

@end
