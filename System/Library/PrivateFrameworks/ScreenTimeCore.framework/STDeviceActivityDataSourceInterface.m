@implementation STDeviceActivityDataSourceInterface

+ (NSDictionary)deviceIdentifiersByUserAltDSID
{
  return +[STDeviceActivityDataSource deviceIdentifiersByUserAltDSID](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "deviceIdentifiersByUserAltDSID");
}

+ (NSDictionary)deviceIdentifierByCoreDuetIdentifier
{
  return +[STDeviceActivityDataSource deviceIdentifierByCoreDuetIdentifier](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "deviceIdentifierByCoreDuetIdentifier");
}

+ (NSArray)allLocallyUsedBundleIdentifiers
{
  return +[STDeviceActivityDataSource allLocallyUsedBundleIdentifiers](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "allLocallyUsedBundleIdentifiers");
}

+ (void)setGenesisDate:(id)a3
{
  +[STDeviceActivityDataSource setGenesisDate:](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "setGenesisDate:", a3);
}

+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5
{
  return +[STDeviceActivityDataSource totalWeeklyUsageDuringDateInterval:userAltDSID:error:](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "totalWeeklyUsageDuringDateInterval:userAltDSID:error:", a3, a4, a5);
}

+ (id)lastUpdatedDateFor:(id)a3
{
  return +[STDeviceActivityDataSource lastUpdatedDateFor:](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "lastUpdatedDateFor:", a3);
}

+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4
{
  +[STDeviceActivityDataSource refreshAndUploadLocalDataSinceDate:completionHandler:](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "refreshAndUploadLocalDataSinceDate:completionHandler:", a3, a4);
}

+ (void)downloadRemoteData
{
  +[STDeviceActivityDataSource downloadRemoteData](_TtC14ScreenTimeCore26STDeviceActivityDataSource, "downloadRemoteData");
}

@end
