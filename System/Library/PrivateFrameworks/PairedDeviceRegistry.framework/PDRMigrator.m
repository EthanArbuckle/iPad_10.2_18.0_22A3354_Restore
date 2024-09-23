@implementation PDRMigrator

+ (id)sharedMigrator
{
  return +[PDRMigrator sharedMigrator](PDRMigrator_Impl, "sharedMigrator");
}

- (NSString)lastMigrationRequestPhoneName
{
  return self->_lastMigrationRequestPhoneName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMigrationRequestPhoneName, 0);
}

- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)migrationConsentRequestData
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (BOOL)migrationIsAvailable
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (NSArray)devicesExpectedToBeMigratableAfterRestore
{
  NSArray *result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSArray)migratableDevicesRequiringConsent
{
  NSArray *result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (NSArray)migratableDevices
{
  NSArray *result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_2();
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_2();
}

- (id)beginMigrationWithDevice:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

@end
