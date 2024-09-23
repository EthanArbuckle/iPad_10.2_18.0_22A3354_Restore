@implementation ISOPBSubscriptiondPetMessage

- (void)setTimestampMillis:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_timestampMillis = a3;
}

- (void)setHasTimestampMillis:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestampMillis
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHourOfDay:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_hourOfDay = a3;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHourOfDay
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (BOOL)hasLastOpenedAppId24h
{
  return self->_lastOpenedAppId24h != 0;
}

- (void)setLastOpenedAppHour24h:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_lastOpenedAppHour24h = a3;
}

- (void)setHasLastOpenedAppHour24h:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasLastOpenedAppHour24h
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsSleepModeOn:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_isSleepModeOn = a3;
}

- (void)setHasIsSleepModeOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOn
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setIsDoNotDisturbOn:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_isDoNotDisturbOn = a3;
}

- (void)setHasIsDoNotDisturbOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOn
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setIsDrivingModeOn:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_isDrivingModeOn = a3;
}

- (void)setHasIsDrivingModeOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDrivingModeOn
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setOpenedNotificationRatio24h:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_openedNotificationRatio24h = a3;
}

- (void)setHasOpenedNotificationRatio24h:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationRatio24h
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setGoogleDriveAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_googleDriveAppLaunchCount1w = a3;
}

- (void)setHasGoogleDriveAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasGoogleDriveAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setGooglePhotoAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_googlePhotoAppLaunchCount1w = a3;
}

- (void)setHasGooglePhotoAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasGooglePhotoAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDropboxAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_dropboxAppLaunchCount1w = a3;
}

- (void)setHasDropboxAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasDropboxAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCameraAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_cameraAppLaunchCount1w = a3;
}

- (void)setHasCameraAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCameraAppLaunchCount1w
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPhotosAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_photosAppLaunchCount1w = a3;
}

- (void)setHasPhotosAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setFilesAppLaunchCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_filesAppLaunchCount1w = a3;
}

- (void)setHasFilesAppLaunchCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasFilesAppLaunchCount1w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTotalNotificationCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_totalNotificationCount1w = a3;
}

- (void)setHasTotalNotificationCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount1w
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTotalOpenedNotificationCount1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_totalOpenedNotificationCount1w = a3;
}

- (void)setHasTotalOpenedNotificationCount1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalOpenedNotificationCount1w
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setOpenedNotificationRatio1w:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_openedNotificationRatio1w = a3;
}

- (void)setHasOpenedNotificationRatio1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationRatio1w
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setOpenedICloudNotificationRatio1w:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_openedICloudNotificationRatio1w = a3;
}

- (void)setHasOpenedICloudNotificationRatio1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasOpenedICloudNotificationRatio1w
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (BOOL)hasNotificationUsageTypeTop1
{
  return self->_notificationUsageTypeTop1 != 0;
}

- (BOOL)hasNotificationUsageTypeTop2
{
  return self->_notificationUsageTypeTop2 != 0;
}

- (BOOL)hasNotificationUsageTypeTop3
{
  return self->_notificationUsageTypeTop3 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop1
{
  return self->_iCloudNotificationUsageTypeTop1 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop2
{
  return self->_iCloudNotificationUsageTypeTop2 != 0;
}

- (BOOL)hasICloudNotificationUsageTypeTop3
{
  return self->_iCloudNotificationUsageTypeTop3 != 0;
}

- (void)setMlServerScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_mlServerScore = a3;
}

- (void)setHasMlServerScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMlServerScore
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (BOOL)hasLabelMessage
{
  return self->_labelMessage != 0;
}

- (void)setDiskStorageCapacityBytes:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_diskStorageCapacityBytes = a3;
}

- (void)setHasDiskStorageCapacityBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasDiskStorageCapacityBytes
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setUsedDiskCapacityBytes:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_usedDiskCapacityBytes = a3;
}

- (void)setHasUsedDiskCapacityBytes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUsedDiskCapacityBytes
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setOpenedICloudNotificationRatio2w:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_openedICloudNotificationRatio2w = a3;
}

- (void)setHasOpenedICloudNotificationRatio2w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasOpenedICloudNotificationRatio2w
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)trafficType
{
  if ((*((_BYTE *)&self->_has + 6) & 8) != 0)
    return self->_trafficType;
  else
    return 0;
}

- (void)setTrafficType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTrafficType
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (id)trafficTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24F187E60[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrafficType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYNTHESIZED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDailyScreenTimeSeconds:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_dailyScreenTimeSeconds = a3;
}

- (void)setHasDailyScreenTimeSeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasDailyScreenTimeSeconds
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setAvgWeeklyScreenTimeSeconds2w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_avgWeeklyScreenTimeSeconds2w = a3;
}

- (void)setHasAvgWeeklyScreenTimeSeconds2w:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAvgWeeklyScreenTimeSeconds2w
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDaemonVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_daemonVersion = a3;
}

- (void)setHasDaemonVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasDaemonVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasOBSOLETEDayOfWeek
{
  return self->_oBSOLETEDayOfWeek != 0;
}

- (BOOL)hasDeviceModelName
{
  return self->_deviceModelName != 0;
}

- (int)dayOfWeek
{
  if ((*((_BYTE *)&self->_has + 5) & 0x80) != 0)
    return self->_dayOfWeek;
  else
    return 0;
}

- (void)setDayOfWeek:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasDayOfWeek
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 < 8)
    return off_24F187DF0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNAVAILABLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setOsVersionMajorVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_osVersionMajorVersion = a3;
}

- (void)setHasOsVersionMajorVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionMajorVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setOsVersionMinorVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_osVersionMinorVersion = a3;
}

- (void)setHasOsVersionMinorVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionMinorVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setOsVersionPatchVersion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_osVersionPatchVersion = a3;
}

- (void)setHasOsVersionPatchVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasOsVersionPatchVersion
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setOffsetMins:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_offsetMins = a3;
}

- (void)setHasOffsetMins:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasOffsetMins
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)icloudNotificationActionLabel
{
  if ((*((_BYTE *)&self->_has + 6) & 2) != 0)
    return self->_icloudNotificationActionLabel;
  else
    return 0;
}

- (void)setIcloudNotificationActionLabel:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_icloudNotificationActionLabel = a3;
}

- (void)setHasIcloudNotificationActionLabel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIcloudNotificationActionLabel
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (id)icloudNotificationActionLabelAsString:(int)a3
{
  if (a3 < 3)
    return off_24F187E30[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIcloudNotificationActionLabel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LABEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLICK")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLEAR")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMinsUntilICloudNotificationOpened:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_minsUntilICloudNotificationOpened = a3;
}

- (void)setHasMinsUntilICloudNotificationOpened:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudNotificationOpened
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAppLaunchCountSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_appLaunchCountSameSlot = a3;
}

- (void)setHasAppLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAppLaunchCountSameSlot
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCameraLaunchCountSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_cameraLaunchCountSameSlot = a3;
}

- (void)setHasCameraLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCameraLaunchCountSameSlot
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPhotosLaunchCountSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_photosLaunchCountSameSlot = a3;
}

- (void)setHasPhotosLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCountSameSlot
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setFilesLaunchCountSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_filesLaunchCountSameSlot = a3;
}

- (void)setHasFilesLaunchCountSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasFilesLaunchCountSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsSleepModeOnSameSlot:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_isSleepModeOnSameSlot = a3;
}

- (void)setHasIsSleepModeOnSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOnSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setIsDoNotDisturbOnSameSlot:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_isDoNotDisturbOnSameSlot = a3;
}

- (void)setHasIsDoNotDisturbOnSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOnSameSlot
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setIsDrivingModeOnSameSlot:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_isDrivingModeOnSameSlot = a3;
}

- (void)setHasIsDrivingModeOnSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasIsDrivingModeOnSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setNumNotificationsSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_numNotificationsSameSlot = a3;
}

- (void)setHasNumNotificationsSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasNumNotificationsSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNumOpenedNotificationsSameSlot:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_numOpenedNotificationsSameSlot = a3;
}

- (void)setHasNumOpenedNotificationsSameSlot:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasNumOpenedNotificationsSameSlot
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMinsSinceLastCameraAppLaunch1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_minsSinceLastCameraAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastCameraAppLaunch1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMinsSinceLastCameraAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinsSinceLastPhotosAppLaunch1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_minsSinceLastPhotosAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastPhotosAppLaunch1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMinsSinceLastPhotosAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMinsSinceLastFilesAppLaunch1w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_minsSinceLastFilesAppLaunch1w = a3;
}

- (void)setHasMinsSinceLastFilesAppLaunch1w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMinsSinceLastFilesAppLaunch1w
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsSleepModeOnCount2w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_isSleepModeOnCount2w = a3;
}

- (void)setHasIsSleepModeOnCount2w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasIsSleepModeOnCount2w
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setIsDoNotDisturbOnCount2w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_isDoNotDisturbOnCount2w = a3;
}

- (void)setHasIsDoNotDisturbOnCount2w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIsDoNotDisturbOnCount2w
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsDrivingModeOnCount2w:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_isDrivingModeOnCount2w = a3;
}

- (void)setHasIsDrivingModeOnCount2w:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasIsDrivingModeOnCount2w
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAppLaunchCount2wMedian:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_appLaunchCount2wMedian = a3;
}

- (void)setHasAppLaunchCount2wMedian:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppLaunchCount2wMedian
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAppLaunchCount2wMax:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_appLaunchCount2wMax = a3;
}

- (void)setHasAppLaunchCount2wMax:(BOOL)a3
{
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppLaunchCount2wMax
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhotosLaunchCount2wMedian:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_photosLaunchCount2wMedian = a3;
}

- (void)setHasPhotosLaunchCount2wMedian:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCount2wMedian
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setPhotosLaunchCount2wMax:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_photosLaunchCount2wMax = a3;
}

- (void)setHasPhotosLaunchCount2wMax:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPhotosLaunchCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTotalNotificationCount2wMedian:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_totalNotificationCount2wMedian = a3;
}

- (void)setHasTotalNotificationCount2wMedian:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount2wMedian
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTotalNotificationCount2wMax:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_totalNotificationCount2wMax = a3;
}

- (void)setHasTotalNotificationCount2wMax:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTotalNotificationCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setOpenedNotificationCount2wMedian:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_openedNotificationCount2wMedian = a3;
}

- (void)setHasOpenedNotificationCount2wMedian:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationCount2wMedian
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setOpenedNotificationCount2wMax:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_openedNotificationCount2wMax = a3;
}

- (void)setHasOpenedNotificationCount2wMax:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasOpenedNotificationCount2wMax
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setBuyLabel:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_buyLabel = a3;
}

- (void)setHasBuyLabel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasBuyLabel
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setMinsUntilICloudBuy:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_minsUntilICloudBuy = a3;
}

- (void)setHasMinsUntilICloudBuy:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudBuy
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOpenLabelSubStream:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_openLabelSubStream = a3;
}

- (void)setHasOpenLabelSubStream:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasOpenLabelSubStream
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setMinsUntilICloudOpenedSubStream:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_minsUntilICloudOpenedSubStream = a3;
}

- (void)setHasMinsUntilICloudOpenedSubStream:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMinsUntilICloudOpenedSubStream
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)userTier
{
  if ((*((_BYTE *)&self->_has + 6) & 0x10) != 0)
    return self->_userTier;
  else
    return 0;
}

- (void)setUserTier:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_userTier = a3;
}

- (void)setHasUserTier:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUserTier
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (id)userTierAsString:(int)a3
{
  if (a3 < 3)
    return off_24F187E48[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUserTier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USERTIER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAID")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)oBSOLETETrafficType
{
  if ((*((_BYTE *)&self->_has + 6) & 4) != 0)
    return self->_oBSOLETETrafficType;
  else
    return 0;
}

- (void)setOBSOLETETrafficType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_oBSOLETETrafficType = a3;
}

- (void)setHasOBSOLETETrafficType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($28C44C570028719347E25634D282F7AE)(*(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasOBSOLETETrafficType
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (id)oBSOLETETrafficTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24F187E60[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOBSOLETETrafficType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYNTHESIZED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ISOPBSubscriptiondPetMessage;
  -[ISOPBSubscriptiondPetMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISOPBSubscriptiondPetMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $28C44C570028719347E25634D282F7AE has;
  void *v5;
  void *v6;
  NSString *lastOpenedAppId24h;
  $28C44C570028719347E25634D282F7AE v8;
  void *v9;
  NSString *notificationUsageTypeTop1;
  NSString *notificationUsageTypeTop2;
  NSString *notificationUsageTypeTop3;
  NSString *iCloudNotificationUsageTypeTop1;
  NSString *iCloudNotificationUsageTypeTop2;
  NSString *iCloudNotificationUsageTypeTop3;
  void *v16;
  ISOPBSubscriptionLabelMessage *labelMessage;
  void *v18;
  $28C44C570028719347E25634D282F7AE v19;
  void *v20;
  NSString *oBSOLETEDayOfWeek;
  NSString *deviceModelName;
  $28C44C570028719347E25634D282F7AE v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t trafficType;
  __CFString *v42;
  uint64_t dayOfWeek;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t icloudNotificationActionLabel;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t userTier;
  __CFString *v82;
  uint64_t oBSOLETETrafficType;
  __CFString *v84;
  id v85;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timestampMillis);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestampMillis"));

    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_hourOfDay);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("hourOfDay"));

  }
  lastOpenedAppId24h = self->_lastOpenedAppId24h;
  if (lastOpenedAppId24h)
    objc_msgSend(v3, "setObject:forKey:", lastOpenedAppId24h, CFSTR("lastOpenedAppId24h"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastOpenedAppHour24h);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("lastOpenedAppHour24h"));

    v8 = self->_has;
    if ((*(_QWORD *)&v8 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(_QWORD *)&v8 & 0x40000000000000) == 0)
        goto LABEL_10;
      goto LABEL_90;
    }
  }
  else if ((*(_QWORD *)&v8 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSleepModeOn);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("isSleepModeOn"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&v8 & 0x100000000000000) == 0)
      goto LABEL_11;
    goto LABEL_91;
  }
LABEL_90:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDoNotDisturbOn);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("isDoNotDisturbOn"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&v8 & 0x200000000) == 0)
      goto LABEL_12;
    goto LABEL_92;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDrivingModeOn);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("isDrivingModeOn"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_93;
  }
LABEL_92:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_openedNotificationRatio24h);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("openedNotificationRatio24h"));

  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_googleDriveAppLaunchCount1w);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("googleDriveAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_95;
  }
LABEL_94:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_googlePhotoAppLaunchCount1w);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("googlePhotoAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_96;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dropboxAppLaunchCount1w);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("dropboxAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x10) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
      goto LABEL_17;
    goto LABEL_97;
  }
LABEL_96:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cameraAppLaunchCount1w);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("cameraAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_98;
  }
LABEL_97:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_photosAppLaunchCount1w);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("photosAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&v8 & 0x40000000000) == 0)
      goto LABEL_19;
    goto LABEL_99;
  }
LABEL_98:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_filesAppLaunchCount1w);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("filesAppLaunchCount1w"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
      goto LABEL_20;
    goto LABEL_100;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_totalNotificationCount1w);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("totalNotificationCount1w"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v8 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_totalOpenedNotificationCount1w);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("totalOpenedNotificationCount1w"));

  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_openedNotificationRatio1w);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("openedNotificationRatio1w"));

  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_openedICloudNotificationRatio1w);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("openedICloudNotificationRatio1w"));

  }
LABEL_23:
  notificationUsageTypeTop1 = self->_notificationUsageTypeTop1;
  if (notificationUsageTypeTop1)
    objc_msgSend(v3, "setObject:forKey:", notificationUsageTypeTop1, CFSTR("notificationUsageTypeTop1"));
  notificationUsageTypeTop2 = self->_notificationUsageTypeTop2;
  if (notificationUsageTypeTop2)
    objc_msgSend(v3, "setObject:forKey:", notificationUsageTypeTop2, CFSTR("notificationUsageTypeTop2"));
  notificationUsageTypeTop3 = self->_notificationUsageTypeTop3;
  if (notificationUsageTypeTop3)
    objc_msgSend(v3, "setObject:forKey:", notificationUsageTypeTop3, CFSTR("notificationUsageTypeTop3"));
  iCloudNotificationUsageTypeTop1 = self->_iCloudNotificationUsageTypeTop1;
  if (iCloudNotificationUsageTypeTop1)
    objc_msgSend(v3, "setObject:forKey:", iCloudNotificationUsageTypeTop1, CFSTR("iCloudNotificationUsageTypeTop1"));
  iCloudNotificationUsageTypeTop2 = self->_iCloudNotificationUsageTypeTop2;
  if (iCloudNotificationUsageTypeTop2)
    objc_msgSend(v3, "setObject:forKey:", iCloudNotificationUsageTypeTop2, CFSTR("iCloudNotificationUsageTypeTop2"));
  iCloudNotificationUsageTypeTop3 = self->_iCloudNotificationUsageTypeTop3;
  if (iCloudNotificationUsageTypeTop3)
    objc_msgSend(v3, "setObject:forKey:", iCloudNotificationUsageTypeTop3, CFSTR("iCloudNotificationUsageTypeTop3"));
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_mlServerScore);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("mlServerScore"));

  }
  labelMessage = self->_labelMessage;
  if (labelMessage)
  {
    -[ISOPBSubscriptionLabelMessage dictionaryRepresentation](labelMessage, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("labelMessage"));

  }
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_diskStorageCapacityBytes);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("diskStorageCapacityBytes"));

    v19 = self->_has;
    if ((*(_QWORD *)&v19 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v19 & 0x20000000) == 0)
        goto LABEL_42;
      goto LABEL_105;
    }
  }
  else if ((*(_QWORD *)&v19 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_usedDiskCapacityBytes);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("usedDiskCapacityBytes"));

  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v19 & 0x8000000000000) == 0)
      goto LABEL_43;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_openedICloudNotificationRatio2w);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("openedICloudNotificationRatio2w"));

  v19 = self->_has;
  if ((*(_QWORD *)&v19 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v19 & 0x80) == 0)
      goto LABEL_44;
    goto LABEL_112;
  }
LABEL_106:
  trafficType = self->_trafficType;
  if (trafficType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trafficType);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = off_24F187E60[trafficType];
  }
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("trafficType"));

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x80) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v19 & 8) == 0)
      goto LABEL_45;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_dailyScreenTimeSeconds);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("dailyScreenTimeSeconds"));

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 8) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v19 & 0x40) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_avgWeeklyScreenTimeSeconds2w);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("avgWeeklyScreenTimeSeconds2w"));

  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_daemonVersion);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("daemonVersion"));

  }
LABEL_47:
  oBSOLETEDayOfWeek = self->_oBSOLETEDayOfWeek;
  if (oBSOLETEDayOfWeek)
    objc_msgSend(v3, "setObject:forKey:", oBSOLETEDayOfWeek, CFSTR("OBSOLETE_dayOfWeek"));
  deviceModelName = self->_deviceModelName;
  if (deviceModelName)
    objc_msgSend(v3, "setObject:forKey:", deviceModelName, CFSTR("deviceModelName"));
  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x800000000000) != 0)
  {
    dayOfWeek = self->_dayOfWeek;
    if (dayOfWeek >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dayOfWeek);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = off_24F187DF0[dayOfWeek];
    }
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("dayOfWeek"));

    v23 = self->_has;
    if ((*(_QWORD *)&v23 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(_QWORD *)&v23 & 0x800000000) == 0)
        goto LABEL_54;
      goto LABEL_118;
    }
  }
  else if ((*(_QWORD *)&v23 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_osVersionMajorVersion);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("osVersionMajorVersion"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v23 & 0x1000000000) == 0)
      goto LABEL_55;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_osVersionMinorVersion);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("osVersionMinorVersion"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v23 & 0x8000000) == 0)
      goto LABEL_56;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_osVersionPatchVersion);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("osVersionPatchVersion"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v23 & 0x2000000000000) == 0)
      goto LABEL_57;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_offsetMins);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("offsetMins"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v23 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_125;
  }
LABEL_121:
  icloudNotificationActionLabel = self->_icloudNotificationActionLabel;
  if (icloudNotificationActionLabel >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_icloudNotificationActionLabel);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_24F187E30[icloudNotificationActionLabel];
  }
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("icloudNotificationActionLabel"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v23 & 4) == 0)
      goto LABEL_59;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsUntilICloudNotificationOpened);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("minsUntilICloudNotificationOpened"));

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 4) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v23 & 0x20) == 0)
      goto LABEL_60;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appLaunchCountSameSlot);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("appLaunchCountSameSlot"));

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 0x20) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v23 & 0x10000000000) == 0)
      goto LABEL_61;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cameraLaunchCountSameSlot);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("cameraLaunchCountSameSlot"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v23 & 0x800) == 0)
      goto LABEL_62;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_photosLaunchCountSameSlot);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("photosLaunchCountSameSlot"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x800) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v23 & 0x800000000000000) == 0)
      goto LABEL_63;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_filesLaunchCountSameSlot);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("filesLaunchCountSameSlot"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v23 & 0x80000000000000) == 0)
      goto LABEL_64;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSleepModeOnSameSlot);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("isSleepModeOnSameSlot"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v23 & 0x200000000000000) == 0)
      goto LABEL_65;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDoNotDisturbOnSameSlot);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("isDoNotDisturbOnSameSlot"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v23 & 0x2000000) == 0)
      goto LABEL_66;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDrivingModeOnSameSlot);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("isDrivingModeOnSameSlot"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v23 & 0x4000000) == 0)
      goto LABEL_67;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numNotificationsSameSlot);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("numNotificationsSameSlot"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v23 & 0x40000) == 0)
      goto LABEL_68;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numOpenedNotificationsSameSlot);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("numOpenedNotificationsSameSlot"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v23 & 0x100000) == 0)
      goto LABEL_69;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsSinceLastCameraAppLaunch1w);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("minsSinceLastCameraAppLaunch1w"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v23 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsSinceLastPhotosAppLaunch1w);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("minsSinceLastPhotosAppLaunch1w"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v23 & 0x10000) == 0)
      goto LABEL_71;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsSinceLastFilesAppLaunch1w);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("minsSinceLastFilesAppLaunch1w"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v23 & 0x4000) == 0)
      goto LABEL_72;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isSleepModeOnCount2w);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("isSleepModeOnCount2w"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v23 & 0x8000) == 0)
      goto LABEL_73;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isDoNotDisturbOnCount2w);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("isDoNotDisturbOnCount2w"));

  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&v23 & 2) == 0)
      goto LABEL_74;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_isDrivingModeOnCount2w);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("isDrivingModeOnCount2w"));

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 2) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v23 & 1) == 0)
      goto LABEL_75;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appLaunchCount2wMedian);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("appLaunchCount2wMedian"));

  v23 = self->_has;
  if ((*(_BYTE *)&v23 & 1) == 0)
  {
LABEL_75:
    if ((*(_QWORD *)&v23 & 0x8000000000) == 0)
      goto LABEL_76;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appLaunchCount2wMax);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("appLaunchCount2wMax"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
      goto LABEL_77;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_photosLaunchCount2wMedian);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("photosLaunchCount2wMedian"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(_QWORD *)&v23 & 0x100000000000) == 0)
      goto LABEL_78;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_photosLaunchCount2wMax);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("photosLaunchCount2wMax"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(_QWORD *)&v23 & 0x80000000000) == 0)
      goto LABEL_79;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_totalNotificationCount2wMedian);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("totalNotificationCount2wMedian"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v23 & 0x80000000) == 0)
      goto LABEL_80;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_totalNotificationCount2wMax);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("totalNotificationCount2wMax"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v23 & 0x40000000) == 0)
      goto LABEL_81;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_openedNotificationCount2wMedian);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("openedNotificationCount2wMedian"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(_QWORD *)&v23 & 0x20000000000000) == 0)
      goto LABEL_82;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_openedNotificationCount2wMax);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("openedNotificationCount2wMax"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v23 & 0x200000) == 0)
      goto LABEL_83;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_buyLabel);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("buyLabel"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(_QWORD *)&v23 & 0x1000000000000000) == 0)
      goto LABEL_84;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsUntilICloudBuy);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("minsUntilICloudBuy"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v23 & 0x800000) == 0)
      goto LABEL_85;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_openLabelSubStream);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("openLabelSubStream"));

  v23 = self->_has;
  if ((*(_DWORD *)&v23 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(_QWORD *)&v23 & 0x10000000000000) == 0)
      goto LABEL_86;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minsUntilICloudOpenedSubStream);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("minsUntilICloudOpenedSubStream"));

  v23 = self->_has;
  if ((*(_QWORD *)&v23 & 0x10000000000000) == 0)
  {
LABEL_86:
    if ((*(_QWORD *)&v23 & 0x4000000000000) == 0)
      goto LABEL_161;
    goto LABEL_157;
  }
LABEL_153:
  userTier = self->_userTier;
  if (userTier >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userTier);
    v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82 = off_24F187E48[userTier];
  }
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("userTier"));

  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
  {
LABEL_157:
    oBSOLETETrafficType = self->_oBSOLETETrafficType;
    if (oBSOLETETrafficType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_oBSOLETETrafficType);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v84 = off_24F187E60[oBSOLETETrafficType];
    }
    objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("OBSOLETE_trafficType"));

  }
LABEL_161:
  v85 = v3;

  return v85;
}

- (BOOL)readFrom:(id)a3
{
  return ISOPBSubscriptiondPetMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $28C44C570028719347E25634D282F7AE has;
  $28C44C570028719347E25634D282F7AE v5;
  $28C44C570028719347E25634D282F7AE v6;
  $28C44C570028719347E25634D282F7AE v7;
  id v8;

  v8 = a3;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_lastOpenedAppId24h)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = self->_has;
    if ((*(_QWORD *)&v5 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(_QWORD *)&v5 & 0x40000000000000) == 0)
        goto LABEL_10;
      goto LABEL_91;
    }
  }
  else if ((*(_QWORD *)&v5 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&v5 & 0x100000000000000) == 0)
      goto LABEL_11;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&v5 & 0x200000000) == 0)
      goto LABEL_12;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteDoubleField();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v5 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&v5 & 0x2000000000) == 0)
      goto LABEL_17;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&v5 & 0x40000000000) == 0)
      goto LABEL_19;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&v5 & 0x200000000000) == 0)
      goto LABEL_20;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v5 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_QWORD *)&v5 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_102:
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
LABEL_22:
    PBDataWriterWriteDoubleField();
LABEL_23:
  if (self->_notificationUsageTypeTop1)
    PBDataWriterWriteStringField();
  if (self->_notificationUsageTypeTop2)
    PBDataWriterWriteStringField();
  if (self->_notificationUsageTypeTop3)
    PBDataWriterWriteStringField();
  if (self->_iCloudNotificationUsageTypeTop1)
    PBDataWriterWriteStringField();
  if (self->_iCloudNotificationUsageTypeTop2)
    PBDataWriterWriteStringField();
  if (self->_iCloudNotificationUsageTypeTop3)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_labelMessage)
    PBDataWriterWriteSubmessage();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = self->_has;
    if ((*(_QWORD *)&v6 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v6 & 0x20000000) == 0)
        goto LABEL_42;
      goto LABEL_106;
    }
  }
  else if ((*(_QWORD *)&v6 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v6 & 0x8000000000000) == 0)
      goto LABEL_43;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteDoubleField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_44;
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_45;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_109:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
LABEL_46:
    PBDataWriterWriteInt64Field();
LABEL_47:
  if (self->_oBSOLETEDayOfWeek)
    PBDataWriterWriteStringField();
  if (self->_deviceModelName)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x800000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_has;
    if ((*(_QWORD *)&v7 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(_QWORD *)&v7 & 0x800000000) == 0)
        goto LABEL_54;
      goto LABEL_113;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
      goto LABEL_55;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x8000000) == 0)
      goto LABEL_56;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v7 & 0x2000000000000) == 0)
      goto LABEL_57;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_59;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_60;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v7 & 0x10000000000) == 0)
      goto LABEL_61;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_62;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
      goto LABEL_63;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v7 & 0x80000000000000) == 0)
      goto LABEL_64;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v7 & 0x200000000000000) == 0)
      goto LABEL_65;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
      goto LABEL_66;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v7 & 0x4000000) == 0)
      goto LABEL_67;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_68;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_69;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_71;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_72;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v7 & 0x8000) == 0)
      goto LABEL_73;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_74;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_75;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_75:
    if ((*(_QWORD *)&v7 & 0x8000000000) == 0)
      goto LABEL_76;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(_QWORD *)&v7 & 0x4000000000) == 0)
      goto LABEL_77;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(_QWORD *)&v7 & 0x100000000000) == 0)
      goto LABEL_78;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
      goto LABEL_79;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0)
      goto LABEL_80;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0)
      goto LABEL_81;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(_QWORD *)&v7 & 0x20000000000000) == 0)
      goto LABEL_82;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_83;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
      goto LABEL_84;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_85;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteBOOLField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(_QWORD *)&v7 & 0x10000000000000) == 0)
      goto LABEL_86;
LABEL_145:
    PBDataWriterWriteInt32Field();
    if ((*(_QWORD *)&self->_has & 0x4000000000000) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_144:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x10000000000000) != 0)
    goto LABEL_145;
LABEL_86:
  if ((*(_QWORD *)&v7 & 0x4000000000000) != 0)
LABEL_87:
    PBDataWriterWriteInt32Field();
LABEL_88:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $28C44C570028719347E25634D282F7AE has;
  $28C44C570028719347E25634D282F7AE v6;
  $28C44C570028719347E25634D282F7AE v7;
  $28C44C570028719347E25634D282F7AE v8;
  _QWORD *v9;

  v4 = a3;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    v4[42] = self->_timestampMillis;
    *(_QWORD *)((char *)v4 + 508) |= 0x20000000000uLL;
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *((_DWORD *)v4 + 100) = self->_hourOfDay;
    *(_QWORD *)((char *)v4 + 508) |= 0x1000000000000uLL;
  }
  v9 = v4;
  if (self->_lastOpenedAppId24h)
  {
    objc_msgSend(v4, "setLastOpenedAppId24h:");
    v4 = v9;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) != 0)
  {
    v4[18] = self->_lastOpenedAppHour24h;
    *(_QWORD *)((char *)v4 + 508) |= 0x20000uLL;
    v6 = self->_has;
    if ((*(_QWORD *)&v6 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((*(_QWORD *)&v6 & 0x40000000000000) == 0)
        goto LABEL_10;
      goto LABEL_91;
    }
  }
  else if ((*(_QWORD *)&v6 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 505) = self->_isSleepModeOn;
  *(_QWORD *)((char *)v4 + 508) |= 0x400000000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((*(_QWORD *)&v6 & 0x100000000000000) == 0)
      goto LABEL_11;
    goto LABEL_92;
  }
LABEL_91:
  *((_BYTE *)v4 + 501) = self->_isDoNotDisturbOn;
  *(_QWORD *)((char *)v4 + 508) |= 0x40000000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((*(_QWORD *)&v6 & 0x200000000) == 0)
      goto LABEL_12;
    goto LABEL_93;
  }
LABEL_92:
  *((_BYTE *)v4 + 503) = self->_isDrivingModeOn;
  *(_QWORD *)((char *)v4 + 508) |= 0x100000000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x200000000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_94;
  }
LABEL_93:
  v4[34] = *(_QWORD *)&self->_openedNotificationRatio24h;
  *(_QWORD *)((char *)v4 + 508) |= 0x200000000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_95;
  }
LABEL_94:
  v4[13] = self->_googleDriveAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x1000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_96;
  }
LABEL_95:
  v4[14] = self->_googlePhotoAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x2000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_97;
  }
LABEL_96:
  v4[10] = self->_dropboxAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x200uLL;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
      goto LABEL_17;
    goto LABEL_98;
  }
LABEL_97:
  v4[5] = self->_cameraAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x10uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_99;
  }
LABEL_98:
  v4[38] = self->_photosAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x2000000000uLL;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&v6 & 0x40000000000) == 0)
      goto LABEL_19;
    goto LABEL_100;
  }
LABEL_99:
  v4[11] = self->_filesAppLaunchCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x400uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((*(_QWORD *)&v6 & 0x200000000000) == 0)
      goto LABEL_20;
    goto LABEL_101;
  }
LABEL_100:
  v4[43] = self->_totalNotificationCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x40000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((*(_QWORD *)&v6 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_102;
  }
LABEL_101:
  v4[46] = self->_totalOpenedNotificationCount1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x200000000000uLL;
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_102:
  v4[33] = *(_QWORD *)&self->_openedNotificationRatio1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_22:
    v4[29] = *(_QWORD *)&self->_openedICloudNotificationRatio1w;
    *(_QWORD *)((char *)v4 + 508) |= 0x10000000uLL;
  }
LABEL_23:
  if (self->_notificationUsageTypeTop1)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop1:");
    v4 = v9;
  }
  if (self->_notificationUsageTypeTop2)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop2:");
    v4 = v9;
  }
  if (self->_notificationUsageTypeTop3)
  {
    objc_msgSend(v9, "setNotificationUsageTypeTop3:");
    v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop1)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop1:");
    v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop2)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop2:");
    v4 = v9;
  }
  if (self->_iCloudNotificationUsageTypeTop3)
  {
    objc_msgSend(v9, "setICloudNotificationUsageTypeTop3:");
    v4 = v9;
  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    v4[25] = *(_QWORD *)&self->_mlServerScore;
    *(_QWORD *)((char *)v4 + 508) |= 0x1000000uLL;
  }
  if (self->_labelMessage)
  {
    objc_msgSend(v9, "setLabelMessage:");
    v4 = v9;
  }
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    v4[9] = self->_diskStorageCapacityBytes;
    *(_QWORD *)((char *)v4 + 508) |= 0x100uLL;
    v7 = self->_has;
    if ((*(_QWORD *)&v7 & 0x400000000000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v7 & 0x20000000) == 0)
        goto LABEL_42;
      goto LABEL_106;
    }
  }
  else if ((*(_QWORD *)&v7 & 0x400000000000) == 0)
  {
    goto LABEL_41;
  }
  v4[47] = self->_usedDiskCapacityBytes;
  *(_QWORD *)((char *)v4 + 508) |= 0x400000000000uLL;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v7 & 0x8000000000000) == 0)
      goto LABEL_43;
    goto LABEL_107;
  }
LABEL_106:
  v4[30] = *(_QWORD *)&self->_openedICloudNotificationRatio2w;
  *(_QWORD *)((char *)v4 + 508) |= 0x20000000uLL;
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_44;
    goto LABEL_108;
  }
LABEL_107:
  *((_DWORD *)v4 + 123) = self->_trafficType;
  *(_QWORD *)((char *)v4 + 508) |= 0x8000000000000uLL;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_45;
    goto LABEL_109;
  }
LABEL_108:
  v4[8] = self->_dailyScreenTimeSeconds;
  *(_QWORD *)((char *)v4 + 508) |= 0x80uLL;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_109:
  v4[4] = self->_avgWeeklyScreenTimeSeconds2w;
  *(_QWORD *)((char *)v4 + 508) |= 8uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    v4[7] = self->_daemonVersion;
    *(_QWORD *)((char *)v4 + 508) |= 0x40uLL;
  }
LABEL_47:
  if (self->_oBSOLETEDayOfWeek)
  {
    objc_msgSend(v9, "setOBSOLETEDayOfWeek:");
    v4 = v9;
  }
  if (self->_deviceModelName)
  {
    objc_msgSend(v9, "setDeviceModelName:");
    v4 = v9;
  }
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x800000000000) != 0)
  {
    *((_DWORD *)v4 + 96) = self->_dayOfWeek;
    *(_QWORD *)((char *)v4 + 508) |= 0x800000000000uLL;
    v8 = self->_has;
    if ((*(_QWORD *)&v8 & 0x400000000) == 0)
    {
LABEL_53:
      if ((*(_QWORD *)&v8 & 0x800000000) == 0)
        goto LABEL_54;
      goto LABEL_113;
    }
  }
  else if ((*(_QWORD *)&v8 & 0x400000000) == 0)
  {
    goto LABEL_53;
  }
  v4[35] = self->_osVersionMajorVersion;
  *(_QWORD *)((char *)v4 + 508) |= 0x400000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x800000000) == 0)
  {
LABEL_54:
    if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
      goto LABEL_55;
    goto LABEL_114;
  }
LABEL_113:
  v4[36] = self->_osVersionMinorVersion;
  *(_QWORD *)((char *)v4 + 508) |= 0x800000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x1000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0)
      goto LABEL_56;
    goto LABEL_115;
  }
LABEL_114:
  v4[37] = self->_osVersionPatchVersion;
  *(_QWORD *)((char *)v4 + 508) |= 0x1000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v8 & 0x2000000000000) == 0)
      goto LABEL_57;
    goto LABEL_116;
  }
LABEL_115:
  v4[28] = self->_offsetMins;
  *(_QWORD *)((char *)v4 + 508) |= 0x8000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x2000000000000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_117;
  }
LABEL_116:
  *((_DWORD *)v4 + 108) = self->_icloudNotificationActionLabel;
  *(_QWORD *)((char *)v4 + 508) |= 0x2000000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_59;
    goto LABEL_118;
  }
LABEL_117:
  v4[23] = self->_minsUntilICloudNotificationOpened;
  *(_QWORD *)((char *)v4 + 508) |= 0x400000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_59:
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_60;
    goto LABEL_119;
  }
LABEL_118:
  v4[3] = self->_appLaunchCountSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 4uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v8 & 0x10000000000) == 0)
      goto LABEL_61;
    goto LABEL_120;
  }
LABEL_119:
  v4[6] = self->_cameraLaunchCountSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x20uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x10000000000) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_62;
    goto LABEL_121;
  }
LABEL_120:
  v4[41] = self->_photosLaunchCountSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x10000000000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_62:
    if ((*(_QWORD *)&v8 & 0x800000000000000) == 0)
      goto LABEL_63;
    goto LABEL_122;
  }
LABEL_121:
  v4[12] = self->_filesLaunchCountSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x800uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x800000000000000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v8 & 0x80000000000000) == 0)
      goto LABEL_64;
    goto LABEL_123;
  }
LABEL_122:
  *((_BYTE *)v4 + 506) = self->_isSleepModeOnSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x800000000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x80000000000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v8 & 0x200000000000000) == 0)
      goto LABEL_65;
    goto LABEL_124;
  }
LABEL_123:
  *((_BYTE *)v4 + 502) = self->_isDoNotDisturbOnSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x80000000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x200000000000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0)
      goto LABEL_66;
    goto LABEL_125;
  }
LABEL_124:
  *((_BYTE *)v4 + 504) = self->_isDrivingModeOnSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x200000000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0)
      goto LABEL_67;
    goto LABEL_126;
  }
LABEL_125:
  v4[26] = self->_numNotificationsSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x2000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_67:
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
      goto LABEL_68;
    goto LABEL_127;
  }
LABEL_126:
  v4[27] = self->_numOpenedNotificationsSameSlot;
  *(_QWORD *)((char *)v4 + 508) |= 0x4000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_68:
    if ((*(_DWORD *)&v8 & 0x100000) == 0)
      goto LABEL_69;
    goto LABEL_128;
  }
LABEL_127:
  v4[19] = self->_minsSinceLastCameraAppLaunch1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x40000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_69:
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_129;
  }
LABEL_128:
  v4[21] = self->_minsSinceLastPhotosAppLaunch1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x100000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
      goto LABEL_71;
    goto LABEL_130;
  }
LABEL_129:
  v4[20] = self->_minsSinceLastFilesAppLaunch1w;
  *(_QWORD *)((char *)v4 + 508) |= 0x80000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v8 & 0x4000) == 0)
      goto LABEL_72;
    goto LABEL_131;
  }
LABEL_130:
  v4[17] = self->_isSleepModeOnCount2w;
  *(_QWORD *)((char *)v4 + 508) |= 0x10000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v8 & 0x8000) == 0)
      goto LABEL_73;
    goto LABEL_132;
  }
LABEL_131:
  v4[15] = self->_isDoNotDisturbOnCount2w;
  *(_QWORD *)((char *)v4 + 508) |= 0x4000uLL;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_74;
    goto LABEL_133;
  }
LABEL_132:
  v4[16] = self->_isDrivingModeOnCount2w;
  *(_QWORD *)((char *)v4 + 508) |= 0x8000uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_75;
    goto LABEL_134;
  }
LABEL_133:
  v4[2] = self->_appLaunchCount2wMedian;
  *(_QWORD *)((char *)v4 + 508) |= 2uLL;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 1) == 0)
  {
LABEL_75:
    if ((*(_QWORD *)&v8 & 0x8000000000) == 0)
      goto LABEL_76;
    goto LABEL_135;
  }
LABEL_134:
  v4[1] = self->_appLaunchCount2wMax;
  *(_QWORD *)((char *)v4 + 508) |= 1uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x8000000000) == 0)
  {
LABEL_76:
    if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
      goto LABEL_77;
    goto LABEL_136;
  }
LABEL_135:
  v4[40] = self->_photosLaunchCount2wMedian;
  *(_QWORD *)((char *)v4 + 508) |= 0x8000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x4000000000) == 0)
  {
LABEL_77:
    if ((*(_QWORD *)&v8 & 0x100000000000) == 0)
      goto LABEL_78;
    goto LABEL_137;
  }
LABEL_136:
  v4[39] = self->_photosLaunchCount2wMax;
  *(_QWORD *)((char *)v4 + 508) |= 0x4000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000000) == 0)
  {
LABEL_78:
    if ((*(_QWORD *)&v8 & 0x80000000000) == 0)
      goto LABEL_79;
    goto LABEL_138;
  }
LABEL_137:
  v4[45] = self->_totalNotificationCount2wMedian;
  *(_QWORD *)((char *)v4 + 508) |= 0x100000000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x80000000000) == 0)
  {
LABEL_79:
    if ((*(_DWORD *)&v8 & 0x80000000) == 0)
      goto LABEL_80;
    goto LABEL_139;
  }
LABEL_138:
  v4[44] = self->_totalNotificationCount2wMax;
  *(_QWORD *)((char *)v4 + 508) |= 0x80000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0)
      goto LABEL_81;
    goto LABEL_140;
  }
LABEL_139:
  v4[32] = self->_openedNotificationCount2wMedian;
  *(_QWORD *)((char *)v4 + 508) |= 0x80000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_81:
    if ((*(_QWORD *)&v8 & 0x20000000000000) == 0)
      goto LABEL_82;
    goto LABEL_141;
  }
LABEL_140:
  v4[31] = self->_openedNotificationCount2wMax;
  *(_QWORD *)((char *)v4 + 508) |= 0x40000000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x20000000000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v8 & 0x200000) == 0)
      goto LABEL_83;
    goto LABEL_142;
  }
LABEL_141:
  *((_BYTE *)v4 + 500) = self->_buyLabel;
  *(_QWORD *)((char *)v4 + 508) |= 0x20000000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_83:
    if ((*(_QWORD *)&v8 & 0x1000000000000000) == 0)
      goto LABEL_84;
    goto LABEL_143;
  }
LABEL_142:
  v4[22] = self->_minsUntilICloudBuy;
  *(_QWORD *)((char *)v4 + 508) |= 0x200000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x1000000000000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v8 & 0x800000) == 0)
      goto LABEL_85;
    goto LABEL_144;
  }
LABEL_143:
  *((_BYTE *)v4 + 507) = self->_openLabelSubStream;
  *(_QWORD *)((char *)v4 + 508) |= 0x1000000000000000uLL;
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_85:
    if ((*(_QWORD *)&v8 & 0x10000000000000) == 0)
      goto LABEL_86;
LABEL_145:
    *((_DWORD *)v4 + 124) = self->_userTier;
    *(_QWORD *)((char *)v4 + 508) |= 0x10000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x4000000000000) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_144:
  v4[24] = self->_minsUntilICloudOpenedSubStream;
  *(_QWORD *)((char *)v4 + 508) |= 0x800000uLL;
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x10000000000000) != 0)
    goto LABEL_145;
LABEL_86:
  if ((*(_QWORD *)&v8 & 0x4000000000000) != 0)
  {
LABEL_87:
    *((_DWORD *)v4 + 122) = self->_oBSOLETETrafficType;
    *(_QWORD *)((char *)v4 + 508) |= 0x4000000000000uLL;
  }
LABEL_88:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $28C44C570028719347E25634D282F7AE has;
  uint64_t v8;
  void *v9;
  $28C44C570028719347E25634D282F7AE v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  $28C44C570028719347E25634D282F7AE v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  $28C44C570028719347E25634D282F7AE v30;
  id v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    *(_QWORD *)(v5 + 336) = self->_timestampMillis;
    *(_QWORD *)(v5 + 508) |= 0x20000000000uLL;
    has = self->_has;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    *(_DWORD *)(v5 + 400) = self->_hourOfDay;
    *(_QWORD *)(v5 + 508) |= 0x1000000000000uLL;
  }
  v8 = -[NSString copyWithZone:](self->_lastOpenedAppId24h, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 448);
  *(_QWORD *)(v6 + 448) = v8;

  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) != 0)
  {
    *(_QWORD *)(v6 + 144) = self->_lastOpenedAppHour24h;
    *(_QWORD *)(v6 + 508) |= 0x20000uLL;
    v10 = self->_has;
    if ((*(_QWORD *)&v10 & 0x400000000000000) == 0)
    {
LABEL_7:
      if ((*(_QWORD *)&v10 & 0x40000000000000) == 0)
        goto LABEL_8;
      goto LABEL_71;
    }
  }
  else if ((*(_QWORD *)&v10 & 0x400000000000000) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v6 + 505) = self->_isSleepModeOn;
  *(_QWORD *)(v6 + 508) |= 0x400000000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x40000000000000) == 0)
  {
LABEL_8:
    if ((*(_QWORD *)&v10 & 0x100000000000000) == 0)
      goto LABEL_9;
    goto LABEL_72;
  }
LABEL_71:
  *(_BYTE *)(v6 + 501) = self->_isDoNotDisturbOn;
  *(_QWORD *)(v6 + 508) |= 0x40000000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x100000000000000) == 0)
  {
LABEL_9:
    if ((*(_QWORD *)&v10 & 0x200000000) == 0)
      goto LABEL_10;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v6 + 503) = self->_isDrivingModeOn;
  *(_QWORD *)(v6 + 508) |= 0x100000000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_74;
  }
LABEL_73:
  *(double *)(v6 + 272) = self->_openedNotificationRatio24h;
  *(_QWORD *)(v6 + 508) |= 0x200000000uLL;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v10 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_75;
  }
LABEL_74:
  *(_QWORD *)(v6 + 104) = self->_googleDriveAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x1000uLL;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_76;
  }
LABEL_75:
  *(_QWORD *)(v6 + 112) = self->_googlePhotoAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x2000uLL;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_77;
  }
LABEL_76:
  *(_QWORD *)(v6 + 80) = self->_dropboxAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x200uLL;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
LABEL_14:
    if ((*(_QWORD *)&v10 & 0x2000000000) == 0)
      goto LABEL_15;
    goto LABEL_78;
  }
LABEL_77:
  *(_QWORD *)(v6 + 40) = self->_cameraAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x10uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x2000000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v10 & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_79;
  }
LABEL_78:
  *(_QWORD *)(v6 + 304) = self->_photosAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x2000000000uLL;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_QWORD *)&v10 & 0x40000000000) == 0)
      goto LABEL_17;
    goto LABEL_80;
  }
LABEL_79:
  *(_QWORD *)(v6 + 88) = self->_filesAppLaunchCount1w;
  *(_QWORD *)(v6 + 508) |= 0x400uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x40000000000) == 0)
  {
LABEL_17:
    if ((*(_QWORD *)&v10 & 0x200000000000) == 0)
      goto LABEL_18;
    goto LABEL_81;
  }
LABEL_80:
  *(_QWORD *)(v6 + 344) = self->_totalNotificationCount1w;
  *(_QWORD *)(v6 + 508) |= 0x40000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x200000000000) == 0)
  {
LABEL_18:
    if ((*(_QWORD *)&v10 & 0x100000000) == 0)
      goto LABEL_19;
    goto LABEL_82;
  }
LABEL_81:
  *(_QWORD *)(v6 + 368) = self->_totalOpenedNotificationCount1w;
  *(_QWORD *)(v6 + 508) |= 0x200000000000uLL;
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x100000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v10 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_82:
  *(double *)(v6 + 264) = self->_openedNotificationRatio1w;
  *(_QWORD *)(v6 + 508) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_20:
    *(double *)(v6 + 232) = self->_openedICloudNotificationRatio1w;
    *(_QWORD *)(v6 + 508) |= 0x10000000uLL;
  }
LABEL_21:
  v11 = -[NSString copyWithZone:](self->_notificationUsageTypeTop1, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 456);
  *(_QWORD *)(v6 + 456) = v11;

  v13 = -[NSString copyWithZone:](self->_notificationUsageTypeTop2, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 464);
  *(_QWORD *)(v6 + 464) = v13;

  v15 = -[NSString copyWithZone:](self->_notificationUsageTypeTop3, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 472);
  *(_QWORD *)(v6 + 472) = v15;

  v17 = -[NSString copyWithZone:](self->_iCloudNotificationUsageTypeTop1, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v17;

  v19 = -[NSString copyWithZone:](self->_iCloudNotificationUsageTypeTop2, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v19;

  v21 = -[NSString copyWithZone:](self->_iCloudNotificationUsageTypeTop3, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v21;

  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *(double *)(v6 + 200) = self->_mlServerScore;
    *(_QWORD *)(v6 + 508) |= 0x1000000uLL;
  }
  v23 = -[ISOPBSubscriptionLabelMessage copyWithZone:](self->_labelMessage, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 440);
  *(_QWORD *)(v6 + 440) = v23;

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) != 0)
  {
    *(_QWORD *)(v6 + 72) = self->_diskStorageCapacityBytes;
    *(_QWORD *)(v6 + 508) |= 0x100uLL;
    v25 = self->_has;
    if ((*(_QWORD *)&v25 & 0x400000000000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v25 & 0x20000000) == 0)
        goto LABEL_26;
      goto LABEL_86;
    }
  }
  else if ((*(_QWORD *)&v25 & 0x400000000000) == 0)
  {
    goto LABEL_25;
  }
  *(_QWORD *)(v6 + 376) = self->_usedDiskCapacityBytes;
  *(_QWORD *)(v6 + 508) |= 0x400000000000uLL;
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_QWORD *)&v25 & 0x8000000000000) == 0)
      goto LABEL_27;
    goto LABEL_87;
  }
LABEL_86:
  *(double *)(v6 + 240) = self->_openedICloudNotificationRatio2w;
  *(_QWORD *)(v6 + 508) |= 0x20000000uLL;
  v25 = self->_has;
  if ((*(_QWORD *)&v25 & 0x8000000000000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v25 & 0x80) == 0)
      goto LABEL_28;
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v6 + 492) = self->_trafficType;
  *(_QWORD *)(v6 + 508) |= 0x8000000000000uLL;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v25 & 8) == 0)
      goto LABEL_29;
    goto LABEL_89;
  }
LABEL_88:
  *(_QWORD *)(v6 + 64) = self->_dailyScreenTimeSeconds;
  *(_QWORD *)(v6 + 508) |= 0x80uLL;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 8) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v25 & 0x40) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_89:
  *(_QWORD *)(v6 + 32) = self->_avgWeeklyScreenTimeSeconds2w;
  *(_QWORD *)(v6 + 508) |= 8uLL;
  if ((*(_QWORD *)&self->_has & 0x40) != 0)
  {
LABEL_30:
    *(_QWORD *)(v6 + 56) = self->_daemonVersion;
    *(_QWORD *)(v6 + 508) |= 0x40uLL;
  }
LABEL_31:
  v26 = -[NSString copyWithZone:](self->_oBSOLETEDayOfWeek, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 480);
  *(_QWORD *)(v6 + 480) = v26;

  v28 = -[NSString copyWithZone:](self->_deviceModelName, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v28;

  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x800000000000) != 0)
  {
    *(_DWORD *)(v6 + 384) = self->_dayOfWeek;
    *(_QWORD *)(v6 + 508) |= 0x800000000000uLL;
    v30 = self->_has;
    if ((*(_QWORD *)&v30 & 0x400000000) == 0)
    {
LABEL_33:
      if ((*(_QWORD *)&v30 & 0x800000000) == 0)
        goto LABEL_34;
      goto LABEL_93;
    }
  }
  else if ((*(_QWORD *)&v30 & 0x400000000) == 0)
  {
    goto LABEL_33;
  }
  *(_QWORD *)(v6 + 280) = self->_osVersionMajorVersion;
  *(_QWORD *)(v6 + 508) |= 0x400000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x800000000) == 0)
  {
LABEL_34:
    if ((*(_QWORD *)&v30 & 0x1000000000) == 0)
      goto LABEL_35;
    goto LABEL_94;
  }
LABEL_93:
  *(_QWORD *)(v6 + 288) = self->_osVersionMinorVersion;
  *(_QWORD *)(v6 + 508) |= 0x800000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v30 & 0x8000000) == 0)
      goto LABEL_36;
    goto LABEL_95;
  }
LABEL_94:
  *(_QWORD *)(v6 + 296) = self->_osVersionPatchVersion;
  *(_QWORD *)(v6 + 508) |= 0x1000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_QWORD *)&v30 & 0x2000000000000) == 0)
      goto LABEL_37;
    goto LABEL_96;
  }
LABEL_95:
  *(_QWORD *)(v6 + 224) = self->_offsetMins;
  *(_QWORD *)(v6 + 508) |= 0x8000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x2000000000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v30 & 0x400000) == 0)
      goto LABEL_38;
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 432) = self->_icloudNotificationActionLabel;
  *(_QWORD *)(v6 + 508) |= 0x2000000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_BYTE *)&v30 & 4) == 0)
      goto LABEL_39;
    goto LABEL_98;
  }
LABEL_97:
  *(_QWORD *)(v6 + 184) = self->_minsUntilICloudNotificationOpened;
  *(_QWORD *)(v6 + 508) |= 0x400000uLL;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 4) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v30 & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_99;
  }
LABEL_98:
  *(_QWORD *)(v6 + 24) = self->_appLaunchCountSameSlot;
  *(_QWORD *)(v6 + 508) |= 4uLL;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 0x20) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&v30 & 0x10000000000) == 0)
      goto LABEL_41;
    goto LABEL_100;
  }
LABEL_99:
  *(_QWORD *)(v6 + 48) = self->_cameraLaunchCountSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x20uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v30 & 0x800) == 0)
      goto LABEL_42;
    goto LABEL_101;
  }
LABEL_100:
  *(_QWORD *)(v6 + 328) = self->_photosLaunchCountSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x10000000000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_QWORD *)&v30 & 0x800000000000000) == 0)
      goto LABEL_43;
    goto LABEL_102;
  }
LABEL_101:
  *(_QWORD *)(v6 + 96) = self->_filesLaunchCountSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x800uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x800000000000000) == 0)
  {
LABEL_43:
    if ((*(_QWORD *)&v30 & 0x80000000000000) == 0)
      goto LABEL_44;
    goto LABEL_103;
  }
LABEL_102:
  *(_BYTE *)(v6 + 506) = self->_isSleepModeOnSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x800000000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x80000000000000) == 0)
  {
LABEL_44:
    if ((*(_QWORD *)&v30 & 0x200000000000000) == 0)
      goto LABEL_45;
    goto LABEL_104;
  }
LABEL_103:
  *(_BYTE *)(v6 + 502) = self->_isDoNotDisturbOnSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x80000000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x200000000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v30 & 0x2000000) == 0)
      goto LABEL_46;
    goto LABEL_105;
  }
LABEL_104:
  *(_BYTE *)(v6 + 504) = self->_isDrivingModeOnSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x200000000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v30 & 0x4000000) == 0)
      goto LABEL_47;
    goto LABEL_106;
  }
LABEL_105:
  *(_QWORD *)(v6 + 208) = self->_numNotificationsSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x2000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v30 & 0x40000) == 0)
      goto LABEL_48;
    goto LABEL_107;
  }
LABEL_106:
  *(_QWORD *)(v6 + 216) = self->_numOpenedNotificationsSameSlot;
  *(_QWORD *)(v6 + 508) |= 0x4000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v30 & 0x100000) == 0)
      goto LABEL_49;
    goto LABEL_108;
  }
LABEL_107:
  *(_QWORD *)(v6 + 152) = self->_minsSinceLastCameraAppLaunch1w;
  *(_QWORD *)(v6 + 508) |= 0x40000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x100000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v30 & 0x80000) == 0)
      goto LABEL_50;
    goto LABEL_109;
  }
LABEL_108:
  *(_QWORD *)(v6 + 168) = self->_minsSinceLastPhotosAppLaunch1w;
  *(_QWORD *)(v6 + 508) |= 0x100000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v30 & 0x10000) == 0)
      goto LABEL_51;
    goto LABEL_110;
  }
LABEL_109:
  *(_QWORD *)(v6 + 160) = self->_minsSinceLastFilesAppLaunch1w;
  *(_QWORD *)(v6 + 508) |= 0x80000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x10000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v30 & 0x4000) == 0)
      goto LABEL_52;
    goto LABEL_111;
  }
LABEL_110:
  *(_QWORD *)(v6 + 136) = self->_isSleepModeOnCount2w;
  *(_QWORD *)(v6 + 508) |= 0x10000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x4000) == 0)
  {
LABEL_52:
    if ((*(_WORD *)&v30 & 0x8000) == 0)
      goto LABEL_53;
    goto LABEL_112;
  }
LABEL_111:
  *(_QWORD *)(v6 + 120) = self->_isDoNotDisturbOnCount2w;
  *(_QWORD *)(v6 + 508) |= 0x4000uLL;
  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x8000) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&v30 & 2) == 0)
      goto LABEL_54;
    goto LABEL_113;
  }
LABEL_112:
  *(_QWORD *)(v6 + 128) = self->_isDrivingModeOnCount2w;
  *(_QWORD *)(v6 + 508) |= 0x8000uLL;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 2) == 0)
  {
LABEL_54:
    if ((*(_BYTE *)&v30 & 1) == 0)
      goto LABEL_55;
    goto LABEL_114;
  }
LABEL_113:
  *(_QWORD *)(v6 + 16) = self->_appLaunchCount2wMedian;
  *(_QWORD *)(v6 + 508) |= 2uLL;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 1) == 0)
  {
LABEL_55:
    if ((*(_QWORD *)&v30 & 0x8000000000) == 0)
      goto LABEL_56;
    goto LABEL_115;
  }
LABEL_114:
  *(_QWORD *)(v6 + 8) = self->_appLaunchCount2wMax;
  *(_QWORD *)(v6 + 508) |= 1uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x8000000000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v30 & 0x4000000000) == 0)
      goto LABEL_57;
    goto LABEL_116;
  }
LABEL_115:
  *(_QWORD *)(v6 + 320) = self->_photosLaunchCount2wMedian;
  *(_QWORD *)(v6 + 508) |= 0x8000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x4000000000) == 0)
  {
LABEL_57:
    if ((*(_QWORD *)&v30 & 0x100000000000) == 0)
      goto LABEL_58;
    goto LABEL_117;
  }
LABEL_116:
  *(_QWORD *)(v6 + 312) = self->_photosLaunchCount2wMax;
  *(_QWORD *)(v6 + 508) |= 0x4000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x100000000000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v30 & 0x80000000000) == 0)
      goto LABEL_59;
    goto LABEL_118;
  }
LABEL_117:
  *(_QWORD *)(v6 + 360) = self->_totalNotificationCount2wMedian;
  *(_QWORD *)(v6 + 508) |= 0x100000000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x80000000000) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v30 & 0x80000000) == 0)
      goto LABEL_60;
    goto LABEL_119;
  }
LABEL_118:
  *(_QWORD *)(v6 + 352) = self->_totalNotificationCount2wMax;
  *(_QWORD *)(v6 + 508) |= 0x80000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x80000000) == 0)
  {
LABEL_60:
    if ((*(_DWORD *)&v30 & 0x40000000) == 0)
      goto LABEL_61;
    goto LABEL_120;
  }
LABEL_119:
  *(_QWORD *)(v6 + 256) = self->_openedNotificationCount2wMedian;
  *(_QWORD *)(v6 + 508) |= 0x80000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000000) == 0)
  {
LABEL_61:
    if ((*(_QWORD *)&v30 & 0x20000000000000) == 0)
      goto LABEL_62;
    goto LABEL_121;
  }
LABEL_120:
  *(_QWORD *)(v6 + 248) = self->_openedNotificationCount2wMax;
  *(_QWORD *)(v6 + 508) |= 0x40000000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x20000000000000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v30 & 0x200000) == 0)
      goto LABEL_63;
    goto LABEL_122;
  }
LABEL_121:
  *(_BYTE *)(v6 + 500) = self->_buyLabel;
  *(_QWORD *)(v6 + 508) |= 0x20000000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x200000) == 0)
  {
LABEL_63:
    if ((*(_QWORD *)&v30 & 0x1000000000000000) == 0)
      goto LABEL_64;
    goto LABEL_123;
  }
LABEL_122:
  *(_QWORD *)(v6 + 176) = self->_minsUntilICloudBuy;
  *(_QWORD *)(v6 + 508) |= 0x200000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x1000000000000000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v30 & 0x800000) == 0)
      goto LABEL_65;
    goto LABEL_124;
  }
LABEL_123:
  *(_BYTE *)(v6 + 507) = self->_openLabelSubStream;
  *(_QWORD *)(v6 + 508) |= 0x1000000000000000uLL;
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x800000) == 0)
  {
LABEL_65:
    if ((*(_QWORD *)&v30 & 0x10000000000000) == 0)
      goto LABEL_66;
LABEL_125:
    *(_DWORD *)(v6 + 496) = self->_userTier;
    *(_QWORD *)(v6 + 508) |= 0x10000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x4000000000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_124:
  *(_QWORD *)(v6 + 192) = self->_minsUntilICloudOpenedSubStream;
  *(_QWORD *)(v6 + 508) |= 0x800000uLL;
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x10000000000000) != 0)
    goto LABEL_125;
LABEL_66:
  if ((*(_QWORD *)&v30 & 0x4000000000000) != 0)
  {
LABEL_67:
    *(_DWORD *)(v6 + 488) = self->_oBSOLETETrafficType;
    *(_QWORD *)(v6 + 508) |= 0x4000000000000uLL;
  }
LABEL_68:
  v31 = (id)v6;

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $28C44C570028719347E25634D282F7AE has;
  uint64_t v6;
  NSString *lastOpenedAppId24h;
  uint64_t v8;
  NSString *notificationUsageTypeTop1;
  NSString *notificationUsageTypeTop2;
  NSString *notificationUsageTypeTop3;
  NSString *iCloudNotificationUsageTypeTop1;
  NSString *iCloudNotificationUsageTypeTop2;
  NSString *iCloudNotificationUsageTypeTop3;
  $28C44C570028719347E25634D282F7AE v15;
  uint64_t v16;
  ISOPBSubscriptionLabelMessage *labelMessage;
  uint64_t v18;
  NSString *oBSOLETEDayOfWeek;
  NSString *deviceModelName;
  $28C44C570028719347E25634D282F7AE v21;
  uint64_t v22;
  BOOL v23;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_353;
  has = self->_has;
  v6 = *(_QWORD *)(v4 + 508);
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_timestampMillis != *((_QWORD *)v4 + 42))
      goto LABEL_353;
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x1000000000000) != 0)
  {
    if ((v6 & 0x1000000000000) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 100))
      goto LABEL_353;
  }
  else if ((v6 & 0x1000000000000) != 0)
  {
    goto LABEL_353;
  }
  lastOpenedAppId24h = self->_lastOpenedAppId24h;
  if ((unint64_t)lastOpenedAppId24h | *((_QWORD *)v4 + 56))
  {
    if (!-[NSString isEqual:](lastOpenedAppId24h, "isEqual:"))
      goto LABEL_353;
    has = self->_has;
  }
  v8 = *(_QWORD *)(v4 + 508);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_lastOpenedAppHour24h != *((_QWORD *)v4 + 18))
      goto LABEL_353;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x400000000000000) != 0)
  {
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_353;
    if (self->_isSleepModeOn)
    {
      if (!v4[505])
        goto LABEL_353;
    }
    else if (v4[505])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x400000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x40000000000000) != 0)
  {
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_353;
    if (self->_isDoNotDisturbOn)
    {
      if (!v4[501])
        goto LABEL_353;
    }
    else if (v4[501])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x40000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_353;
    if (self->_isDrivingModeOn)
    {
      if (!v4[503])
        goto LABEL_353;
    }
    else if (v4[503])
    {
      goto LABEL_353;
    }
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_openedNotificationRatio24h != *((double *)v4 + 34))
      goto LABEL_353;
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_googleDriveAppLaunchCount1w != *((_QWORD *)v4 + 13))
      goto LABEL_353;
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_googlePhotoAppLaunchCount1w != *((_QWORD *)v4 + 14))
      goto LABEL_353;
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_dropboxAppLaunchCount1w != *((_QWORD *)v4 + 10))
      goto LABEL_353;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_cameraAppLaunchCount1w != *((_QWORD *)v4 + 5))
      goto LABEL_353;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_photosAppLaunchCount1w != *((_QWORD *)v4 + 38))
      goto LABEL_353;
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_filesAppLaunchCount1w != *((_QWORD *)v4 + 11))
      goto LABEL_353;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_totalNotificationCount1w != *((_QWORD *)v4 + 43))
      goto LABEL_353;
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x200000000000) != 0)
  {
    if ((v8 & 0x200000000000) == 0 || self->_totalOpenedNotificationCount1w != *((_QWORD *)v4 + 46))
      goto LABEL_353;
  }
  else if ((v8 & 0x200000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&has & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_openedNotificationRatio1w != *((double *)v4 + 33))
      goto LABEL_353;
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_openedICloudNotificationRatio1w != *((double *)v4 + 29))
      goto LABEL_353;
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_353;
  }
  notificationUsageTypeTop1 = self->_notificationUsageTypeTop1;
  if ((unint64_t)notificationUsageTypeTop1 | *((_QWORD *)v4 + 57)
    && !-[NSString isEqual:](notificationUsageTypeTop1, "isEqual:"))
  {
    goto LABEL_353;
  }
  notificationUsageTypeTop2 = self->_notificationUsageTypeTop2;
  if ((unint64_t)notificationUsageTypeTop2 | *((_QWORD *)v4 + 58))
  {
    if (!-[NSString isEqual:](notificationUsageTypeTop2, "isEqual:"))
      goto LABEL_353;
  }
  notificationUsageTypeTop3 = self->_notificationUsageTypeTop3;
  if ((unint64_t)notificationUsageTypeTop3 | *((_QWORD *)v4 + 59))
  {
    if (!-[NSString isEqual:](notificationUsageTypeTop3, "isEqual:"))
      goto LABEL_353;
  }
  iCloudNotificationUsageTypeTop1 = self->_iCloudNotificationUsageTypeTop1;
  if ((unint64_t)iCloudNotificationUsageTypeTop1 | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop1, "isEqual:"))
      goto LABEL_353;
  }
  iCloudNotificationUsageTypeTop2 = self->_iCloudNotificationUsageTypeTop2;
  if ((unint64_t)iCloudNotificationUsageTypeTop2 | *((_QWORD *)v4 + 52))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop2, "isEqual:"))
      goto LABEL_353;
  }
  iCloudNotificationUsageTypeTop3 = self->_iCloudNotificationUsageTypeTop3;
  if ((unint64_t)iCloudNotificationUsageTypeTop3 | *((_QWORD *)v4 + 53))
  {
    if (!-[NSString isEqual:](iCloudNotificationUsageTypeTop3, "isEqual:"))
      goto LABEL_353;
  }
  v15 = self->_has;
  v16 = *(_QWORD *)(v4 + 508);
  if ((*(_DWORD *)&v15 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_mlServerScore != *((double *)v4 + 25))
      goto LABEL_353;
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_353;
  }
  labelMessage = self->_labelMessage;
  if ((unint64_t)labelMessage | *((_QWORD *)v4 + 55))
  {
    if (!-[ISOPBSubscriptionLabelMessage isEqual:](labelMessage, "isEqual:"))
      goto LABEL_353;
    v15 = self->_has;
  }
  v18 = *(_QWORD *)(v4 + 508);
  if ((*(_WORD *)&v15 & 0x100) != 0)
  {
    if ((v18 & 0x100) == 0 || self->_diskStorageCapacityBytes != *((_QWORD *)v4 + 9))
      goto LABEL_353;
  }
  else if ((v18 & 0x100) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v15 & 0x400000000000) != 0)
  {
    if ((v18 & 0x400000000000) == 0 || self->_usedDiskCapacityBytes != *((_QWORD *)v4 + 47))
      goto LABEL_353;
  }
  else if ((v18 & 0x400000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    if ((v18 & 0x20000000) == 0 || self->_openedICloudNotificationRatio2w != *((double *)v4 + 30))
      goto LABEL_353;
  }
  else if ((v18 & 0x20000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v15 & 0x8000000000000) != 0)
  {
    if ((v18 & 0x8000000000000) == 0 || self->_trafficType != *((_DWORD *)v4 + 123))
      goto LABEL_353;
  }
  else if ((v18 & 0x8000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v15 & 0x80) != 0)
  {
    if ((v18 & 0x80) == 0 || self->_dailyScreenTimeSeconds != *((_QWORD *)v4 + 8))
      goto LABEL_353;
  }
  else if ((v18 & 0x80) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_avgWeeklyScreenTimeSeconds2w != *((_QWORD *)v4 + 4))
      goto LABEL_353;
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v15 & 0x40) != 0)
  {
    if ((v18 & 0x40) == 0 || self->_daemonVersion != *((_QWORD *)v4 + 7))
      goto LABEL_353;
  }
  else if ((v18 & 0x40) != 0)
  {
    goto LABEL_353;
  }
  oBSOLETEDayOfWeek = self->_oBSOLETEDayOfWeek;
  if ((unint64_t)oBSOLETEDayOfWeek | *((_QWORD *)v4 + 60)
    && !-[NSString isEqual:](oBSOLETEDayOfWeek, "isEqual:"))
  {
    goto LABEL_353;
  }
  deviceModelName = self->_deviceModelName;
  if ((unint64_t)deviceModelName | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](deviceModelName, "isEqual:"))
      goto LABEL_353;
  }
  v21 = self->_has;
  v22 = *(_QWORD *)(v4 + 508);
  if ((*(_QWORD *)&v21 & 0x800000000000) != 0)
  {
    if ((v22 & 0x800000000000) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 96))
      goto LABEL_353;
  }
  else if ((v22 & 0x800000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0 || self->_osVersionMajorVersion != *((_QWORD *)v4 + 35))
      goto LABEL_353;
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x800000000) != 0)
  {
    if ((v22 & 0x800000000) == 0 || self->_osVersionMinorVersion != *((_QWORD *)v4 + 36))
      goto LABEL_353;
  }
  else if ((v22 & 0x800000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x1000000000) != 0)
  {
    if ((v22 & 0x1000000000) == 0 || self->_osVersionPatchVersion != *((_QWORD *)v4 + 37))
      goto LABEL_353;
  }
  else if ((v22 & 0x1000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x8000000) != 0)
  {
    if ((v22 & 0x8000000) == 0 || self->_offsetMins != *((_QWORD *)v4 + 28))
      goto LABEL_353;
  }
  else if ((v22 & 0x8000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x2000000000000) != 0)
  {
    if ((v22 & 0x2000000000000) == 0 || self->_icloudNotificationActionLabel != *((_DWORD *)v4 + 108))
      goto LABEL_353;
  }
  else if ((v22 & 0x2000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x400000) != 0)
  {
    if ((v22 & 0x400000) == 0 || self->_minsUntilICloudNotificationOpened != *((_QWORD *)v4 + 23))
      goto LABEL_353;
  }
  else if ((v22 & 0x400000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v21 & 4) != 0)
  {
    if ((v22 & 4) == 0 || self->_appLaunchCountSameSlot != *((_QWORD *)v4 + 3))
      goto LABEL_353;
  }
  else if ((v22 & 4) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v21 & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_cameraLaunchCountSameSlot != *((_QWORD *)v4 + 6))
      goto LABEL_353;
  }
  else if ((v22 & 0x20) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x10000000000) != 0)
  {
    if ((v22 & 0x10000000000) == 0 || self->_photosLaunchCountSameSlot != *((_QWORD *)v4 + 41))
      goto LABEL_353;
  }
  else if ((v22 & 0x10000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x800) != 0)
  {
    if ((v22 & 0x800) == 0 || self->_filesLaunchCountSameSlot != *((_QWORD *)v4 + 12))
      goto LABEL_353;
  }
  else if ((v22 & 0x800) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x800000000000000) != 0)
  {
    if ((v22 & 0x800000000000000) == 0)
      goto LABEL_353;
    if (self->_isSleepModeOnSameSlot)
    {
      if (!v4[506])
        goto LABEL_353;
    }
    else if (v4[506])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x800000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x80000000000000) != 0)
  {
    if ((v22 & 0x80000000000000) == 0)
      goto LABEL_353;
    if (self->_isDoNotDisturbOnSameSlot)
    {
      if (!v4[502])
        goto LABEL_353;
    }
    else if (v4[502])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x80000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x200000000000000) != 0)
  {
    if ((v22 & 0x200000000000000) == 0)
      goto LABEL_353;
    if (self->_isDrivingModeOnSameSlot)
    {
      if (!v4[504])
        goto LABEL_353;
    }
    else if (v4[504])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x200000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x2000000) != 0)
  {
    if ((v22 & 0x2000000) == 0 || self->_numNotificationsSameSlot != *((_QWORD *)v4 + 26))
      goto LABEL_353;
  }
  else if ((v22 & 0x2000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x4000000) != 0)
  {
    if ((v22 & 0x4000000) == 0 || self->_numOpenedNotificationsSameSlot != *((_QWORD *)v4 + 27))
      goto LABEL_353;
  }
  else if ((v22 & 0x4000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    if ((v22 & 0x40000) == 0 || self->_minsSinceLastCameraAppLaunch1w != *((_QWORD *)v4 + 19))
      goto LABEL_353;
  }
  else if ((v22 & 0x40000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    if ((v22 & 0x100000) == 0 || self->_minsSinceLastPhotosAppLaunch1w != *((_QWORD *)v4 + 21))
      goto LABEL_353;
  }
  else if ((v22 & 0x100000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x80000) != 0)
  {
    if ((v22 & 0x80000) == 0 || self->_minsSinceLastFilesAppLaunch1w != *((_QWORD *)v4 + 20))
      goto LABEL_353;
  }
  else if ((v22 & 0x80000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x10000) != 0)
  {
    if ((v22 & 0x10000) == 0 || self->_isSleepModeOnCount2w != *((_QWORD *)v4 + 17))
      goto LABEL_353;
  }
  else if ((v22 & 0x10000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x4000) != 0)
  {
    if ((v22 & 0x4000) == 0 || self->_isDoNotDisturbOnCount2w != *((_QWORD *)v4 + 15))
      goto LABEL_353;
  }
  else if ((v22 & 0x4000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_isDrivingModeOnCount2w != *((_QWORD *)v4 + 16))
      goto LABEL_353;
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v21 & 2) != 0)
  {
    if ((v22 & 2) == 0 || self->_appLaunchCount2wMedian != *((_QWORD *)v4 + 2))
      goto LABEL_353;
  }
  else if ((v22 & 2) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_BYTE *)&v21 & 1) != 0)
  {
    if ((v22 & 1) == 0 || self->_appLaunchCount2wMax != *((_QWORD *)v4 + 1))
      goto LABEL_353;
  }
  else if ((v22 & 1) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x8000000000) != 0)
  {
    if ((v22 & 0x8000000000) == 0 || self->_photosLaunchCount2wMedian != *((_QWORD *)v4 + 40))
      goto LABEL_353;
  }
  else if ((v22 & 0x8000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x4000000000) != 0)
  {
    if ((v22 & 0x4000000000) == 0 || self->_photosLaunchCount2wMax != *((_QWORD *)v4 + 39))
      goto LABEL_353;
  }
  else if ((v22 & 0x4000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x100000000000) != 0)
  {
    if ((v22 & 0x100000000000) == 0 || self->_totalNotificationCount2wMedian != *((_QWORD *)v4 + 45))
      goto LABEL_353;
  }
  else if ((v22 & 0x100000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x80000000000) != 0)
  {
    if ((v22 & 0x80000000000) == 0 || self->_totalNotificationCount2wMax != *((_QWORD *)v4 + 44))
      goto LABEL_353;
  }
  else if ((v22 & 0x80000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    if ((v22 & 0x80000000) == 0 || self->_openedNotificationCount2wMedian != *((_QWORD *)v4 + 32))
      goto LABEL_353;
  }
  else if ((v22 & 0x80000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x40000000) != 0)
  {
    if ((v22 & 0x40000000) == 0 || self->_openedNotificationCount2wMax != *((_QWORD *)v4 + 31))
      goto LABEL_353;
  }
  else if ((v22 & 0x40000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x20000000000000) != 0)
  {
    if ((v22 & 0x20000000000000) == 0)
      goto LABEL_353;
    if (self->_buyLabel)
    {
      if (!v4[500])
        goto LABEL_353;
    }
    else if (v4[500])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x20000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x200000) != 0)
  {
    if ((v22 & 0x200000) == 0 || self->_minsUntilICloudBuy != *((_QWORD *)v4 + 22))
      goto LABEL_353;
  }
  else if ((v22 & 0x200000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x1000000000000000) != 0)
  {
    if ((v22 & 0x1000000000000000) == 0)
      goto LABEL_353;
    if (self->_openLabelSubStream)
    {
      if (!v4[507])
        goto LABEL_353;
    }
    else if (v4[507])
    {
      goto LABEL_353;
    }
  }
  else if ((v22 & 0x1000000000000000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_DWORD *)&v21 & 0x800000) != 0)
  {
    if ((v22 & 0x800000) == 0 || self->_minsUntilICloudOpenedSubStream != *((_QWORD *)v4 + 24))
      goto LABEL_353;
  }
  else if ((v22 & 0x800000) != 0)
  {
    goto LABEL_353;
  }
  if ((*(_QWORD *)&v21 & 0x10000000000000) == 0)
  {
    if ((v22 & 0x10000000000000) == 0)
      goto LABEL_348;
LABEL_353:
    v23 = 0;
    goto LABEL_354;
  }
  if ((v22 & 0x10000000000000) == 0 || self->_userTier != *((_DWORD *)v4 + 124))
    goto LABEL_353;
LABEL_348:
  if ((*(_QWORD *)&v21 & 0x4000000000000) != 0)
  {
    if ((v22 & 0x4000000000000) == 0 || self->_oBSOLETETrafficType != *((_DWORD *)v4 + 122))
      goto LABEL_353;
    v23 = 1;
  }
  else
  {
    v23 = (v22 & 0x4000000000000) == 0;
  }
LABEL_354:

  return v23;
}

- (unint64_t)hash
{
  $28C44C570028719347E25634D282F7AE has;
  $28C44C570028719347E25634D282F7AE v4;
  double openedNotificationRatio24h;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double openedNotificationRatio1w;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double openedICloudNotificationRatio1w;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double mlServerScore;
  double v22;
  long double v23;
  double v24;
  $28C44C570028719347E25634D282F7AE v25;
  double openedICloudNotificationRatio2w;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  $28C44C570028719347E25634D282F7AE v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  NSUInteger v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  NSUInteger v83;
  NSUInteger v84;
  NSUInteger v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSUInteger v101;
  uint64_t v102;
  uint64_t v103;

  has = self->_has;
  if ((*(_QWORD *)&has & 0x20000000000) != 0)
  {
    v103 = 2654435761 * self->_timestampMillis;
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
      goto LABEL_3;
  }
  else
  {
    v103 = 0;
    if ((*(_QWORD *)&has & 0x1000000000000) != 0)
    {
LABEL_3:
      v102 = 2654435761 * self->_hourOfDay;
      goto LABEL_6;
    }
  }
  v102 = 0;
LABEL_6:
  v101 = -[NSString hash](self->_lastOpenedAppId24h, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
    v100 = 2654435761 * self->_lastOpenedAppHour24h;
    if ((*(_QWORD *)&v4 & 0x400000000000000) != 0)
    {
LABEL_8:
      v99 = 2654435761 * self->_isSleepModeOn;
      if ((*(_QWORD *)&v4 & 0x40000000000000) != 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else
  {
    v100 = 0;
    if ((*(_QWORD *)&v4 & 0x400000000000000) != 0)
      goto LABEL_8;
  }
  v99 = 0;
  if ((*(_QWORD *)&v4 & 0x40000000000000) != 0)
  {
LABEL_9:
    v98 = 2654435761 * self->_isDoNotDisturbOn;
    if ((*(_QWORD *)&v4 & 0x100000000000000) != 0)
      goto LABEL_10;
LABEL_18:
    v97 = 0;
    if ((*(_QWORD *)&v4 & 0x200000000) != 0)
      goto LABEL_11;
LABEL_19:
    v9 = 0;
    goto LABEL_22;
  }
LABEL_17:
  v98 = 0;
  if ((*(_QWORD *)&v4 & 0x100000000000000) == 0)
    goto LABEL_18;
LABEL_10:
  v97 = 2654435761 * self->_isDrivingModeOn;
  if ((*(_QWORD *)&v4 & 0x200000000) == 0)
    goto LABEL_19;
LABEL_11:
  openedNotificationRatio24h = self->_openedNotificationRatio24h;
  v6 = -openedNotificationRatio24h;
  if (openedNotificationRatio24h >= 0.0)
    v6 = self->_openedNotificationRatio24h;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_22:
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    v95 = 2654435761 * self->_googleDriveAppLaunchCount1w;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
    {
LABEL_24:
      v94 = 2654435761 * self->_googlePhotoAppLaunchCount1w;
      if ((*(_WORD *)&v4 & 0x200) != 0)
        goto LABEL_25;
      goto LABEL_37;
    }
  }
  else
  {
    v95 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_24;
  }
  v94 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_25:
    v93 = 2654435761 * self->_dropboxAppLaunchCount1w;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  v93 = 0;
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
LABEL_26:
    v92 = 2654435761 * self->_cameraAppLaunchCount1w;
    if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
      goto LABEL_27;
    goto LABEL_39;
  }
LABEL_38:
  v92 = 0;
  if ((*(_QWORD *)&v4 & 0x2000000000) != 0)
  {
LABEL_27:
    v91 = 2654435761 * self->_photosAppLaunchCount1w;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_28;
    goto LABEL_40;
  }
LABEL_39:
  v91 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_28:
    v90 = 2654435761 * self->_filesAppLaunchCount1w;
    if ((*(_QWORD *)&v4 & 0x40000000000) != 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  v90 = 0;
  if ((*(_QWORD *)&v4 & 0x40000000000) != 0)
  {
LABEL_29:
    v89 = 2654435761 * self->_totalNotificationCount1w;
    if ((*(_QWORD *)&v4 & 0x200000000000) != 0)
      goto LABEL_30;
LABEL_42:
    v88 = 0;
    if ((*(_QWORD *)&v4 & 0x100000000) != 0)
      goto LABEL_31;
LABEL_43:
    v14 = 0;
    goto LABEL_46;
  }
LABEL_41:
  v89 = 0;
  if ((*(_QWORD *)&v4 & 0x200000000000) == 0)
    goto LABEL_42;
LABEL_30:
  v88 = 2654435761 * self->_totalOpenedNotificationCount1w;
  if ((*(_QWORD *)&v4 & 0x100000000) == 0)
    goto LABEL_43;
LABEL_31:
  openedNotificationRatio1w = self->_openedNotificationRatio1w;
  v11 = -openedNotificationRatio1w;
  if (openedNotificationRatio1w >= 0.0)
    v11 = self->_openedNotificationRatio1w;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_46:
  v87 = v14;
  if ((*(_DWORD *)&v4 & 0x10000000) != 0)
  {
    openedICloudNotificationRatio1w = self->_openedICloudNotificationRatio1w;
    v17 = -openedICloudNotificationRatio1w;
    if (openedICloudNotificationRatio1w >= 0.0)
      v17 = self->_openedICloudNotificationRatio1w;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v86 = v15;
  v85 = -[NSString hash](self->_notificationUsageTypeTop1, "hash");
  v84 = -[NSString hash](self->_notificationUsageTypeTop2, "hash");
  v83 = -[NSString hash](self->_notificationUsageTypeTop3, "hash");
  v82 = -[NSString hash](self->_iCloudNotificationUsageTypeTop1, "hash");
  v81 = -[NSString hash](self->_iCloudNotificationUsageTypeTop2, "hash");
  v80 = -[NSString hash](self->_iCloudNotificationUsageTypeTop3, "hash");
  v96 = v9;
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    mlServerScore = self->_mlServerScore;
    v22 = -mlServerScore;
    if (mlServerScore >= 0.0)
      v22 = self->_mlServerScore;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  v79 = v20;
  v78 = -[ISOPBSubscriptionLabelMessage hash](self->_labelMessage, "hash");
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
    v77 = 0;
    if ((*(_QWORD *)&v25 & 0x400000000000) != 0)
      goto LABEL_64;
LABEL_70:
    v76 = 0;
    if ((*(_DWORD *)&v25 & 0x20000000) != 0)
      goto LABEL_65;
LABEL_71:
    v30 = 0;
    goto LABEL_74;
  }
  v77 = 2654435761 * self->_diskStorageCapacityBytes;
  if ((*(_QWORD *)&v25 & 0x400000000000) == 0)
    goto LABEL_70;
LABEL_64:
  v76 = 2654435761 * self->_usedDiskCapacityBytes;
  if ((*(_DWORD *)&v25 & 0x20000000) == 0)
    goto LABEL_71;
LABEL_65:
  openedICloudNotificationRatio2w = self->_openedICloudNotificationRatio2w;
  v27 = -openedICloudNotificationRatio2w;
  if (openedICloudNotificationRatio2w >= 0.0)
    v27 = self->_openedICloudNotificationRatio2w;
  v28 = floor(v27 + 0.5);
  v29 = (v27 - v28) * 1.84467441e19;
  v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
  if (v29 >= 0.0)
  {
    if (v29 > 0.0)
      v30 += (unint64_t)v29;
  }
  else
  {
    v30 -= (unint64_t)fabs(v29);
  }
LABEL_74:
  if ((*(_QWORD *)&v25 & 0x8000000000000) == 0)
  {
    v74 = 0;
    if ((*(_BYTE *)&v25 & 0x80) != 0)
      goto LABEL_76;
LABEL_79:
    v73 = 0;
    if ((*(_BYTE *)&v25 & 8) != 0)
      goto LABEL_77;
    goto LABEL_80;
  }
  v74 = 2654435761 * self->_trafficType;
  if ((*(_BYTE *)&v25 & 0x80) == 0)
    goto LABEL_79;
LABEL_76:
  v73 = 2654435761 * self->_dailyScreenTimeSeconds;
  if ((*(_BYTE *)&v25 & 8) != 0)
  {
LABEL_77:
    v72 = 2654435761 * self->_avgWeeklyScreenTimeSeconds2w;
    goto LABEL_81;
  }
LABEL_80:
  v72 = 0;
LABEL_81:
  v75 = v30;
  if ((*(_BYTE *)&v25 & 0x40) != 0)
    v71 = 2654435761 * self->_daemonVersion;
  else
    v71 = 0;
  v70 = -[NSString hash](self->_oBSOLETEDayOfWeek, "hash");
  v69 = -[NSString hash](self->_deviceModelName, "hash");
  v31 = self->_has;
  if ((*(_QWORD *)&v31 & 0x800000000000) != 0)
  {
    v68 = 2654435761 * self->_dayOfWeek;
    if ((*(_QWORD *)&v31 & 0x400000000) != 0)
    {
LABEL_86:
      v67 = 2654435761 * self->_osVersionMajorVersion;
      if ((*(_QWORD *)&v31 & 0x800000000) != 0)
        goto LABEL_87;
      goto LABEL_123;
    }
  }
  else
  {
    v68 = 0;
    if ((*(_QWORD *)&v31 & 0x400000000) != 0)
      goto LABEL_86;
  }
  v67 = 0;
  if ((*(_QWORD *)&v31 & 0x800000000) != 0)
  {
LABEL_87:
    v66 = 2654435761 * self->_osVersionMinorVersion;
    if ((*(_QWORD *)&v31 & 0x1000000000) != 0)
      goto LABEL_88;
    goto LABEL_124;
  }
LABEL_123:
  v66 = 0;
  if ((*(_QWORD *)&v31 & 0x1000000000) != 0)
  {
LABEL_88:
    v65 = 2654435761 * self->_osVersionPatchVersion;
    if ((*(_DWORD *)&v31 & 0x8000000) != 0)
      goto LABEL_89;
    goto LABEL_125;
  }
LABEL_124:
  v65 = 0;
  if ((*(_DWORD *)&v31 & 0x8000000) != 0)
  {
LABEL_89:
    v64 = 2654435761 * self->_offsetMins;
    if ((*(_QWORD *)&v31 & 0x2000000000000) != 0)
      goto LABEL_90;
    goto LABEL_126;
  }
LABEL_125:
  v64 = 0;
  if ((*(_QWORD *)&v31 & 0x2000000000000) != 0)
  {
LABEL_90:
    v63 = 2654435761 * self->_icloudNotificationActionLabel;
    if ((*(_DWORD *)&v31 & 0x400000) != 0)
      goto LABEL_91;
    goto LABEL_127;
  }
LABEL_126:
  v63 = 0;
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
LABEL_91:
    v62 = 2654435761 * self->_minsUntilICloudNotificationOpened;
    if ((*(_BYTE *)&v31 & 4) != 0)
      goto LABEL_92;
    goto LABEL_128;
  }
LABEL_127:
  v62 = 0;
  if ((*(_BYTE *)&v31 & 4) != 0)
  {
LABEL_92:
    v61 = 2654435761 * self->_appLaunchCountSameSlot;
    if ((*(_BYTE *)&v31 & 0x20) != 0)
      goto LABEL_93;
    goto LABEL_129;
  }
LABEL_128:
  v61 = 0;
  if ((*(_BYTE *)&v31 & 0x20) != 0)
  {
LABEL_93:
    v60 = 2654435761 * self->_cameraLaunchCountSameSlot;
    if ((*(_QWORD *)&v31 & 0x10000000000) != 0)
      goto LABEL_94;
    goto LABEL_130;
  }
LABEL_129:
  v60 = 0;
  if ((*(_QWORD *)&v31 & 0x10000000000) != 0)
  {
LABEL_94:
    v59 = 2654435761 * self->_photosLaunchCountSameSlot;
    if ((*(_WORD *)&v31 & 0x800) != 0)
      goto LABEL_95;
    goto LABEL_131;
  }
LABEL_130:
  v59 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_95:
    v32 = 2654435761 * self->_filesLaunchCountSameSlot;
    if ((*(_QWORD *)&v31 & 0x800000000000000) != 0)
      goto LABEL_96;
    goto LABEL_132;
  }
LABEL_131:
  v32 = 0;
  if ((*(_QWORD *)&v31 & 0x800000000000000) != 0)
  {
LABEL_96:
    v33 = 2654435761 * self->_isSleepModeOnSameSlot;
    if ((*(_QWORD *)&v31 & 0x80000000000000) != 0)
      goto LABEL_97;
    goto LABEL_133;
  }
LABEL_132:
  v33 = 0;
  if ((*(_QWORD *)&v31 & 0x80000000000000) != 0)
  {
LABEL_97:
    v34 = 2654435761 * self->_isDoNotDisturbOnSameSlot;
    if ((*(_QWORD *)&v31 & 0x200000000000000) != 0)
      goto LABEL_98;
    goto LABEL_134;
  }
LABEL_133:
  v34 = 0;
  if ((*(_QWORD *)&v31 & 0x200000000000000) != 0)
  {
LABEL_98:
    v35 = 2654435761 * self->_isDrivingModeOnSameSlot;
    if ((*(_DWORD *)&v31 & 0x2000000) != 0)
      goto LABEL_99;
    goto LABEL_135;
  }
LABEL_134:
  v35 = 0;
  if ((*(_DWORD *)&v31 & 0x2000000) != 0)
  {
LABEL_99:
    v36 = 2654435761 * self->_numNotificationsSameSlot;
    if ((*(_DWORD *)&v31 & 0x4000000) != 0)
      goto LABEL_100;
    goto LABEL_136;
  }
LABEL_135:
  v36 = 0;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
LABEL_100:
    v37 = 2654435761 * self->_numOpenedNotificationsSameSlot;
    if ((*(_DWORD *)&v31 & 0x40000) != 0)
      goto LABEL_101;
    goto LABEL_137;
  }
LABEL_136:
  v37 = 0;
  if ((*(_DWORD *)&v31 & 0x40000) != 0)
  {
LABEL_101:
    v38 = 2654435761 * self->_minsSinceLastCameraAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x100000) != 0)
      goto LABEL_102;
    goto LABEL_138;
  }
LABEL_137:
  v38 = 0;
  if ((*(_DWORD *)&v31 & 0x100000) != 0)
  {
LABEL_102:
    v39 = 2654435761 * self->_minsSinceLastPhotosAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x80000) != 0)
      goto LABEL_103;
    goto LABEL_139;
  }
LABEL_138:
  v39 = 0;
  if ((*(_DWORD *)&v31 & 0x80000) != 0)
  {
LABEL_103:
    v40 = 2654435761 * self->_minsSinceLastFilesAppLaunch1w;
    if ((*(_DWORD *)&v31 & 0x10000) != 0)
      goto LABEL_104;
    goto LABEL_140;
  }
LABEL_139:
  v40 = 0;
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
LABEL_104:
    v41 = 2654435761 * self->_isSleepModeOnCount2w;
    if ((*(_WORD *)&v31 & 0x4000) != 0)
      goto LABEL_105;
    goto LABEL_141;
  }
LABEL_140:
  v41 = 0;
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
LABEL_105:
    v42 = 2654435761 * self->_isDoNotDisturbOnCount2w;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
      goto LABEL_106;
    goto LABEL_142;
  }
LABEL_141:
  v42 = 0;
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
LABEL_106:
    v43 = 2654435761 * self->_isDrivingModeOnCount2w;
    if ((*(_BYTE *)&v31 & 2) != 0)
      goto LABEL_107;
    goto LABEL_143;
  }
LABEL_142:
  v43 = 0;
  if ((*(_BYTE *)&v31 & 2) != 0)
  {
LABEL_107:
    v44 = 2654435761 * self->_appLaunchCount2wMedian;
    if ((*(_BYTE *)&v31 & 1) != 0)
      goto LABEL_108;
    goto LABEL_144;
  }
LABEL_143:
  v44 = 0;
  if ((*(_BYTE *)&v31 & 1) != 0)
  {
LABEL_108:
    v45 = 2654435761 * self->_appLaunchCount2wMax;
    if ((*(_QWORD *)&v31 & 0x8000000000) != 0)
      goto LABEL_109;
    goto LABEL_145;
  }
LABEL_144:
  v45 = 0;
  if ((*(_QWORD *)&v31 & 0x8000000000) != 0)
  {
LABEL_109:
    v46 = 2654435761 * self->_photosLaunchCount2wMedian;
    if ((*(_QWORD *)&v31 & 0x4000000000) != 0)
      goto LABEL_110;
    goto LABEL_146;
  }
LABEL_145:
  v46 = 0;
  if ((*(_QWORD *)&v31 & 0x4000000000) != 0)
  {
LABEL_110:
    v47 = 2654435761 * self->_photosLaunchCount2wMax;
    if ((*(_QWORD *)&v31 & 0x100000000000) != 0)
      goto LABEL_111;
    goto LABEL_147;
  }
LABEL_146:
  v47 = 0;
  if ((*(_QWORD *)&v31 & 0x100000000000) != 0)
  {
LABEL_111:
    v48 = 2654435761 * self->_totalNotificationCount2wMedian;
    if ((*(_QWORD *)&v31 & 0x80000000000) != 0)
      goto LABEL_112;
    goto LABEL_148;
  }
LABEL_147:
  v48 = 0;
  if ((*(_QWORD *)&v31 & 0x80000000000) != 0)
  {
LABEL_112:
    v49 = 2654435761 * self->_totalNotificationCount2wMax;
    if ((*(_DWORD *)&v31 & 0x80000000) != 0)
      goto LABEL_113;
    goto LABEL_149;
  }
LABEL_148:
  v49 = 0;
  if ((*(_DWORD *)&v31 & 0x80000000) != 0)
  {
LABEL_113:
    v50 = 2654435761 * self->_openedNotificationCount2wMedian;
    if ((*(_DWORD *)&v31 & 0x40000000) != 0)
      goto LABEL_114;
    goto LABEL_150;
  }
LABEL_149:
  v50 = 0;
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
LABEL_114:
    v51 = 2654435761 * self->_openedNotificationCount2wMax;
    if ((*(_QWORD *)&v31 & 0x20000000000000) != 0)
      goto LABEL_115;
    goto LABEL_151;
  }
LABEL_150:
  v51 = 0;
  if ((*(_QWORD *)&v31 & 0x20000000000000) != 0)
  {
LABEL_115:
    v52 = 2654435761 * self->_buyLabel;
    if ((*(_DWORD *)&v31 & 0x200000) != 0)
      goto LABEL_116;
    goto LABEL_152;
  }
LABEL_151:
  v52 = 0;
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
LABEL_116:
    v53 = 2654435761 * self->_minsUntilICloudBuy;
    if ((*(_QWORD *)&v31 & 0x1000000000000000) != 0)
      goto LABEL_117;
    goto LABEL_153;
  }
LABEL_152:
  v53 = 0;
  if ((*(_QWORD *)&v31 & 0x1000000000000000) != 0)
  {
LABEL_117:
    v54 = 2654435761 * self->_openLabelSubStream;
    if ((*(_DWORD *)&v31 & 0x800000) != 0)
      goto LABEL_118;
    goto LABEL_154;
  }
LABEL_153:
  v54 = 0;
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
LABEL_118:
    v55 = 2654435761 * self->_minsUntilICloudOpenedSubStream;
    if ((*(_QWORD *)&v31 & 0x10000000000000) != 0)
      goto LABEL_119;
LABEL_155:
    v56 = 0;
    if ((*(_QWORD *)&v31 & 0x4000000000000) != 0)
      goto LABEL_120;
LABEL_156:
    v57 = 0;
    return v102 ^ v103 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v101 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57;
  }
LABEL_154:
  v55 = 0;
  if ((*(_QWORD *)&v31 & 0x10000000000000) == 0)
    goto LABEL_155;
LABEL_119:
  v56 = 2654435761 * self->_userTier;
  if ((*(_QWORD *)&v31 & 0x4000000000000) == 0)
    goto LABEL_156;
LABEL_120:
  v57 = 2654435761 * self->_oBSOLETETrafficType;
  return v102 ^ v103 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v101 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44 ^ v45 ^ v46 ^ v47 ^ v48 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  ISOPBSubscriptionLabelMessage *labelMessage;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v4 = (char *)a3;
  v5 = v4;
  v6 = *(_QWORD *)(v4 + 508);
  if ((v6 & 0x20000000000) != 0)
  {
    self->_timestampMillis = *((_QWORD *)v4 + 42);
    *(_QWORD *)&self->_has |= 0x20000000000uLL;
    v6 = *(_QWORD *)(v4 + 508);
  }
  if ((v6 & 0x1000000000000) != 0)
  {
    self->_hourOfDay = *((_DWORD *)v4 + 100);
    *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  }
  v12 = v4;
  if (*((_QWORD *)v4 + 56))
  {
    -[ISOPBSubscriptiondPetMessage setLastOpenedAppId24h:](self, "setLastOpenedAppId24h:");
    v5 = v12;
  }
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x20000) != 0)
  {
    self->_lastOpenedAppHour24h = *((_QWORD *)v5 + 18);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v7 = *(_QWORD *)(v5 + 508);
    if ((v7 & 0x400000000000000) == 0)
    {
LABEL_9:
      if ((v7 & 0x40000000000000) == 0)
        goto LABEL_10;
      goto LABEL_42;
    }
  }
  else if ((v7 & 0x400000000000000) == 0)
  {
    goto LABEL_9;
  }
  self->_isSleepModeOn = v5[505];
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  self->_isDoNotDisturbOn = v5[501];
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x100000000000000) == 0)
  {
LABEL_11:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  self->_isDrivingModeOn = v5[503];
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_12:
    if ((v7 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  self->_openedNotificationRatio24h = *((double *)v5 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x1000) == 0)
  {
LABEL_13:
    if ((v7 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  self->_googleDriveAppLaunchCount1w = *((_QWORD *)v5 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_47;
  }
LABEL_46:
  self->_googlePhotoAppLaunchCount1w = *((_QWORD *)v5 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x200) == 0)
  {
LABEL_15:
    if ((v7 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_48;
  }
LABEL_47:
  self->_dropboxAppLaunchCount1w = *((_QWORD *)v5 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x10) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_17;
    goto LABEL_49;
  }
LABEL_48:
  self->_cameraAppLaunchCount1w = *((_QWORD *)v5 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_17:
    if ((v7 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_50;
  }
LABEL_49:
  self->_photosAppLaunchCount1w = *((_QWORD *)v5 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x400) == 0)
  {
LABEL_18:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_19;
    goto LABEL_51;
  }
LABEL_50:
  self->_filesAppLaunchCount1w = *((_QWORD *)v5 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_19:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_20;
    goto LABEL_52;
  }
LABEL_51:
  self->_totalNotificationCount1w = *((_QWORD *)v5 + 43);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_21;
    goto LABEL_53;
  }
LABEL_52:
  self->_totalOpenedNotificationCount1w = *((_QWORD *)v5 + 46);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v7 = *(_QWORD *)(v5 + 508);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_53:
  self->_openedNotificationRatio1w = *((double *)v5 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  if ((*(_QWORD *)(v5 + 508) & 0x10000000) != 0)
  {
LABEL_22:
    self->_openedICloudNotificationRatio1w = *((double *)v5 + 29);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
LABEL_23:
  if (*((_QWORD *)v5 + 57))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop1:](self, "setNotificationUsageTypeTop1:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 58))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop2:](self, "setNotificationUsageTypeTop2:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 59))
  {
    -[ISOPBSubscriptiondPetMessage setNotificationUsageTypeTop3:](self, "setNotificationUsageTypeTop3:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 51))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop1:](self, "setICloudNotificationUsageTypeTop1:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 52))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop2:](self, "setICloudNotificationUsageTypeTop2:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 53))
  {
    -[ISOPBSubscriptiondPetMessage setICloudNotificationUsageTypeTop3:](self, "setICloudNotificationUsageTypeTop3:");
    v5 = v12;
  }
  if ((v5[511] & 1) != 0)
  {
    self->_mlServerScore = *((double *)v5 + 25);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
  }
  labelMessage = self->_labelMessage;
  v9 = *((_QWORD *)v5 + 55);
  if (labelMessage)
  {
    if (!v9)
      goto LABEL_58;
    -[ISOPBSubscriptionLabelMessage mergeFrom:](labelMessage, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_58;
    -[ISOPBSubscriptiondPetMessage setLabelMessage:](self, "setLabelMessage:");
  }
  v5 = v12;
LABEL_58:
  v10 = *(_QWORD *)(v5 + 508);
  if ((v10 & 0x100) != 0)
  {
    self->_diskStorageCapacityBytes = *((_QWORD *)v5 + 9);
    *(_QWORD *)&self->_has |= 0x100uLL;
    v10 = *(_QWORD *)(v5 + 508);
    if ((v10 & 0x400000000000) == 0)
    {
LABEL_60:
      if ((v10 & 0x20000000) == 0)
        goto LABEL_61;
      goto LABEL_110;
    }
  }
  else if ((v10 & 0x400000000000) == 0)
  {
    goto LABEL_60;
  }
  self->_usedDiskCapacityBytes = *((_QWORD *)v5 + 47);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v10 = *(_QWORD *)(v5 + 508);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_61:
    if ((v10 & 0x8000000000000) == 0)
      goto LABEL_62;
    goto LABEL_111;
  }
LABEL_110:
  self->_openedICloudNotificationRatio2w = *((double *)v5 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v10 = *(_QWORD *)(v5 + 508);
  if ((v10 & 0x8000000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x80) == 0)
      goto LABEL_63;
    goto LABEL_112;
  }
LABEL_111:
  self->_trafficType = *((_DWORD *)v5 + 123);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v10 = *(_QWORD *)(v5 + 508);
  if ((v10 & 0x80) == 0)
  {
LABEL_63:
    if ((v10 & 8) == 0)
      goto LABEL_64;
    goto LABEL_113;
  }
LABEL_112:
  self->_dailyScreenTimeSeconds = *((_QWORD *)v5 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v10 = *(_QWORD *)(v5 + 508);
  if ((v10 & 8) == 0)
  {
LABEL_64:
    if ((v10 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_113:
  self->_avgWeeklyScreenTimeSeconds2w = *((_QWORD *)v5 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  if ((*(_QWORD *)(v5 + 508) & 0x40) != 0)
  {
LABEL_65:
    self->_daemonVersion = *((_QWORD *)v5 + 7);
    *(_QWORD *)&self->_has |= 0x40uLL;
  }
LABEL_66:
  if (*((_QWORD *)v5 + 60))
  {
    -[ISOPBSubscriptiondPetMessage setOBSOLETEDayOfWeek:](self, "setOBSOLETEDayOfWeek:");
    v5 = v12;
  }
  if (*((_QWORD *)v5 + 49))
  {
    -[ISOPBSubscriptiondPetMessage setDeviceModelName:](self, "setDeviceModelName:");
    v5 = v12;
  }
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x800000000000) != 0)
  {
    self->_dayOfWeek = *((_DWORD *)v5 + 96);
    *(_QWORD *)&self->_has |= 0x800000000000uLL;
    v11 = *(_QWORD *)(v5 + 508);
    if ((v11 & 0x400000000) == 0)
    {
LABEL_72:
      if ((v11 & 0x800000000) == 0)
        goto LABEL_73;
      goto LABEL_117;
    }
  }
  else if ((v11 & 0x400000000) == 0)
  {
    goto LABEL_72;
  }
  self->_osVersionMajorVersion = *((_QWORD *)v5 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x800000000) == 0)
  {
LABEL_73:
    if ((v11 & 0x1000000000) == 0)
      goto LABEL_74;
    goto LABEL_118;
  }
LABEL_117:
  self->_osVersionMinorVersion = *((_QWORD *)v5 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x1000000000) == 0)
  {
LABEL_74:
    if ((v11 & 0x8000000) == 0)
      goto LABEL_75;
    goto LABEL_119;
  }
LABEL_118:
  self->_osVersionPatchVersion = *((_QWORD *)v5 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x8000000) == 0)
  {
LABEL_75:
    if ((v11 & 0x2000000000000) == 0)
      goto LABEL_76;
    goto LABEL_120;
  }
LABEL_119:
  self->_offsetMins = *((_QWORD *)v5 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x2000000000000) == 0)
  {
LABEL_76:
    if ((v11 & 0x400000) == 0)
      goto LABEL_77;
    goto LABEL_121;
  }
LABEL_120:
  self->_icloudNotificationActionLabel = *((_DWORD *)v5 + 108);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x400000) == 0)
  {
LABEL_77:
    if ((v11 & 4) == 0)
      goto LABEL_78;
    goto LABEL_122;
  }
LABEL_121:
  self->_minsUntilICloudNotificationOpened = *((_QWORD *)v5 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 4) == 0)
  {
LABEL_78:
    if ((v11 & 0x20) == 0)
      goto LABEL_79;
    goto LABEL_123;
  }
LABEL_122:
  self->_appLaunchCountSameSlot = *((_QWORD *)v5 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x20) == 0)
  {
LABEL_79:
    if ((v11 & 0x10000000000) == 0)
      goto LABEL_80;
    goto LABEL_124;
  }
LABEL_123:
  self->_cameraLaunchCountSameSlot = *((_QWORD *)v5 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_80:
    if ((v11 & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_125;
  }
LABEL_124:
  self->_photosLaunchCountSameSlot = *((_QWORD *)v5 + 41);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x800) == 0)
  {
LABEL_81:
    if ((v11 & 0x800000000000000) == 0)
      goto LABEL_82;
    goto LABEL_126;
  }
LABEL_125:
  self->_filesLaunchCountSameSlot = *((_QWORD *)v5 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x800000000000000) == 0)
  {
LABEL_82:
    if ((v11 & 0x80000000000000) == 0)
      goto LABEL_83;
    goto LABEL_127;
  }
LABEL_126:
  self->_isSleepModeOnSameSlot = v5[506];
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_83:
    if ((v11 & 0x200000000000000) == 0)
      goto LABEL_84;
    goto LABEL_128;
  }
LABEL_127:
  self->_isDoNotDisturbOnSameSlot = v5[502];
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x200000000000000) == 0)
  {
LABEL_84:
    if ((v11 & 0x2000000) == 0)
      goto LABEL_85;
    goto LABEL_129;
  }
LABEL_128:
  self->_isDrivingModeOnSameSlot = v5[504];
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_85:
    if ((v11 & 0x4000000) == 0)
      goto LABEL_86;
    goto LABEL_130;
  }
LABEL_129:
  self->_numNotificationsSameSlot = *((_QWORD *)v5 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_86:
    if ((v11 & 0x40000) == 0)
      goto LABEL_87;
    goto LABEL_131;
  }
LABEL_130:
  self->_numOpenedNotificationsSameSlot = *((_QWORD *)v5 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x40000) == 0)
  {
LABEL_87:
    if ((v11 & 0x100000) == 0)
      goto LABEL_88;
    goto LABEL_132;
  }
LABEL_131:
  self->_minsSinceLastCameraAppLaunch1w = *((_QWORD *)v5 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x100000) == 0)
  {
LABEL_88:
    if ((v11 & 0x80000) == 0)
      goto LABEL_89;
    goto LABEL_133;
  }
LABEL_132:
  self->_minsSinceLastPhotosAppLaunch1w = *((_QWORD *)v5 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x80000) == 0)
  {
LABEL_89:
    if ((v11 & 0x10000) == 0)
      goto LABEL_90;
    goto LABEL_134;
  }
LABEL_133:
  self->_minsSinceLastFilesAppLaunch1w = *((_QWORD *)v5 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x10000) == 0)
  {
LABEL_90:
    if ((v11 & 0x4000) == 0)
      goto LABEL_91;
    goto LABEL_135;
  }
LABEL_134:
  self->_isSleepModeOnCount2w = *((_QWORD *)v5 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x4000) == 0)
  {
LABEL_91:
    if ((v11 & 0x8000) == 0)
      goto LABEL_92;
    goto LABEL_136;
  }
LABEL_135:
  self->_isDoNotDisturbOnCount2w = *((_QWORD *)v5 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x8000) == 0)
  {
LABEL_92:
    if ((v11 & 2) == 0)
      goto LABEL_93;
    goto LABEL_137;
  }
LABEL_136:
  self->_isDrivingModeOnCount2w = *((_QWORD *)v5 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 2) == 0)
  {
LABEL_93:
    if ((v11 & 1) == 0)
      goto LABEL_94;
    goto LABEL_138;
  }
LABEL_137:
  self->_appLaunchCount2wMedian = *((_QWORD *)v5 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 1) == 0)
  {
LABEL_94:
    if ((v11 & 0x8000000000) == 0)
      goto LABEL_95;
    goto LABEL_139;
  }
LABEL_138:
  self->_appLaunchCount2wMax = *((_QWORD *)v5 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x8000000000) == 0)
  {
LABEL_95:
    if ((v11 & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_140;
  }
LABEL_139:
  self->_photosLaunchCount2wMedian = *((_QWORD *)v5 + 40);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x4000000000) == 0)
  {
LABEL_96:
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_97;
    goto LABEL_141;
  }
LABEL_140:
  self->_photosLaunchCount2wMax = *((_QWORD *)v5 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_97:
    if ((v11 & 0x80000000000) == 0)
      goto LABEL_98;
    goto LABEL_142;
  }
LABEL_141:
  self->_totalNotificationCount2wMedian = *((_QWORD *)v5 + 45);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_98:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_99;
    goto LABEL_143;
  }
LABEL_142:
  self->_totalNotificationCount2wMax = *((_QWORD *)v5 + 44);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_99:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_100;
    goto LABEL_144;
  }
LABEL_143:
  self->_openedNotificationCount2wMedian = *((_QWORD *)v5 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_100:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_145;
  }
LABEL_144:
  self->_openedNotificationCount2wMax = *((_QWORD *)v5 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((v11 & 0x200000) == 0)
      goto LABEL_102;
    goto LABEL_146;
  }
LABEL_145:
  self->_buyLabel = v5[500];
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x200000) == 0)
  {
LABEL_102:
    if ((v11 & 0x1000000000000000) == 0)
      goto LABEL_103;
    goto LABEL_147;
  }
LABEL_146:
  self->_minsUntilICloudBuy = *((_QWORD *)v5 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x1000000000000000) == 0)
  {
LABEL_103:
    if ((v11 & 0x800000) == 0)
      goto LABEL_104;
    goto LABEL_148;
  }
LABEL_147:
  self->_openLabelSubStream = v5[507];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x800000) == 0)
  {
LABEL_104:
    if ((v11 & 0x10000000000000) == 0)
      goto LABEL_105;
LABEL_149:
    self->_userTier = *((_DWORD *)v5 + 124);
    *(_QWORD *)&self->_has |= 0x10000000000000uLL;
    if ((*(_QWORD *)(v5 + 508) & 0x4000000000000) == 0)
      goto LABEL_107;
    goto LABEL_106;
  }
LABEL_148:
  self->_minsUntilICloudOpenedSubStream = *((_QWORD *)v5 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v11 = *(_QWORD *)(v5 + 508);
  if ((v11 & 0x10000000000000) != 0)
    goto LABEL_149;
LABEL_105:
  if ((v11 & 0x4000000000000) != 0)
  {
LABEL_106:
    self->_oBSOLETETrafficType = *((_DWORD *)v5 + 122);
    *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  }
LABEL_107:

}

- (int64_t)timestampMillis
{
  return self->_timestampMillis;
}

- (int)hourOfDay
{
  return self->_hourOfDay;
}

- (NSString)lastOpenedAppId24h
{
  return self->_lastOpenedAppId24h;
}

- (void)setLastOpenedAppId24h:(id)a3
{
  objc_storeStrong((id *)&self->_lastOpenedAppId24h, a3);
}

- (int64_t)lastOpenedAppHour24h
{
  return self->_lastOpenedAppHour24h;
}

- (BOOL)isSleepModeOn
{
  return self->_isSleepModeOn;
}

- (BOOL)isDoNotDisturbOn
{
  return self->_isDoNotDisturbOn;
}

- (BOOL)isDrivingModeOn
{
  return self->_isDrivingModeOn;
}

- (double)openedNotificationRatio24h
{
  return self->_openedNotificationRatio24h;
}

- (int64_t)googleDriveAppLaunchCount1w
{
  return self->_googleDriveAppLaunchCount1w;
}

- (int64_t)googlePhotoAppLaunchCount1w
{
  return self->_googlePhotoAppLaunchCount1w;
}

- (int64_t)dropboxAppLaunchCount1w
{
  return self->_dropboxAppLaunchCount1w;
}

- (int64_t)cameraAppLaunchCount1w
{
  return self->_cameraAppLaunchCount1w;
}

- (int64_t)photosAppLaunchCount1w
{
  return self->_photosAppLaunchCount1w;
}

- (int64_t)filesAppLaunchCount1w
{
  return self->_filesAppLaunchCount1w;
}

- (int64_t)totalNotificationCount1w
{
  return self->_totalNotificationCount1w;
}

- (int64_t)totalOpenedNotificationCount1w
{
  return self->_totalOpenedNotificationCount1w;
}

- (double)openedNotificationRatio1w
{
  return self->_openedNotificationRatio1w;
}

- (double)openedICloudNotificationRatio1w
{
  return self->_openedICloudNotificationRatio1w;
}

- (NSString)notificationUsageTypeTop1
{
  return self->_notificationUsageTypeTop1;
}

- (void)setNotificationUsageTypeTop1:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUsageTypeTop1, a3);
}

- (NSString)notificationUsageTypeTop2
{
  return self->_notificationUsageTypeTop2;
}

- (void)setNotificationUsageTypeTop2:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUsageTypeTop2, a3);
}

- (NSString)notificationUsageTypeTop3
{
  return self->_notificationUsageTypeTop3;
}

- (void)setNotificationUsageTypeTop3:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUsageTypeTop3, a3);
}

- (NSString)iCloudNotificationUsageTypeTop1
{
  return self->_iCloudNotificationUsageTypeTop1;
}

- (void)setICloudNotificationUsageTypeTop1:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop1, a3);
}

- (NSString)iCloudNotificationUsageTypeTop2
{
  return self->_iCloudNotificationUsageTypeTop2;
}

- (void)setICloudNotificationUsageTypeTop2:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop2, a3);
}

- (NSString)iCloudNotificationUsageTypeTop3
{
  return self->_iCloudNotificationUsageTypeTop3;
}

- (void)setICloudNotificationUsageTypeTop3:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop3, a3);
}

- (double)mlServerScore
{
  return self->_mlServerScore;
}

- (ISOPBSubscriptionLabelMessage)labelMessage
{
  return self->_labelMessage;
}

- (void)setLabelMessage:(id)a3
{
  objc_storeStrong((id *)&self->_labelMessage, a3);
}

- (int64_t)diskStorageCapacityBytes
{
  return self->_diskStorageCapacityBytes;
}

- (int64_t)usedDiskCapacityBytes
{
  return self->_usedDiskCapacityBytes;
}

- (double)openedICloudNotificationRatio2w
{
  return self->_openedICloudNotificationRatio2w;
}

- (int64_t)dailyScreenTimeSeconds
{
  return self->_dailyScreenTimeSeconds;
}

- (int64_t)avgWeeklyScreenTimeSeconds2w
{
  return self->_avgWeeklyScreenTimeSeconds2w;
}

- (int64_t)daemonVersion
{
  return self->_daemonVersion;
}

- (NSString)oBSOLETEDayOfWeek
{
  return self->_oBSOLETEDayOfWeek;
}

- (void)setOBSOLETEDayOfWeek:(id)a3
{
  objc_storeStrong((id *)&self->_oBSOLETEDayOfWeek, a3);
}

- (NSString)deviceModelName
{
  return self->_deviceModelName;
}

- (void)setDeviceModelName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelName, a3);
}

- (int64_t)osVersionMajorVersion
{
  return self->_osVersionMajorVersion;
}

- (int64_t)osVersionMinorVersion
{
  return self->_osVersionMinorVersion;
}

- (int64_t)osVersionPatchVersion
{
  return self->_osVersionPatchVersion;
}

- (int64_t)offsetMins
{
  return self->_offsetMins;
}

- (int64_t)minsUntilICloudNotificationOpened
{
  return self->_minsUntilICloudNotificationOpened;
}

- (int64_t)appLaunchCountSameSlot
{
  return self->_appLaunchCountSameSlot;
}

- (int64_t)cameraLaunchCountSameSlot
{
  return self->_cameraLaunchCountSameSlot;
}

- (int64_t)photosLaunchCountSameSlot
{
  return self->_photosLaunchCountSameSlot;
}

- (int64_t)filesLaunchCountSameSlot
{
  return self->_filesLaunchCountSameSlot;
}

- (BOOL)isSleepModeOnSameSlot
{
  return self->_isSleepModeOnSameSlot;
}

- (BOOL)isDoNotDisturbOnSameSlot
{
  return self->_isDoNotDisturbOnSameSlot;
}

- (BOOL)isDrivingModeOnSameSlot
{
  return self->_isDrivingModeOnSameSlot;
}

- (int64_t)numNotificationsSameSlot
{
  return self->_numNotificationsSameSlot;
}

- (int64_t)numOpenedNotificationsSameSlot
{
  return self->_numOpenedNotificationsSameSlot;
}

- (int64_t)minsSinceLastCameraAppLaunch1w
{
  return self->_minsSinceLastCameraAppLaunch1w;
}

- (int64_t)minsSinceLastPhotosAppLaunch1w
{
  return self->_minsSinceLastPhotosAppLaunch1w;
}

- (int64_t)minsSinceLastFilesAppLaunch1w
{
  return self->_minsSinceLastFilesAppLaunch1w;
}

- (int64_t)isSleepModeOnCount2w
{
  return self->_isSleepModeOnCount2w;
}

- (int64_t)isDoNotDisturbOnCount2w
{
  return self->_isDoNotDisturbOnCount2w;
}

- (int64_t)isDrivingModeOnCount2w
{
  return self->_isDrivingModeOnCount2w;
}

- (int64_t)appLaunchCount2wMedian
{
  return self->_appLaunchCount2wMedian;
}

- (int64_t)appLaunchCount2wMax
{
  return self->_appLaunchCount2wMax;
}

- (int64_t)photosLaunchCount2wMedian
{
  return self->_photosLaunchCount2wMedian;
}

- (int64_t)photosLaunchCount2wMax
{
  return self->_photosLaunchCount2wMax;
}

- (int64_t)totalNotificationCount2wMedian
{
  return self->_totalNotificationCount2wMedian;
}

- (int64_t)totalNotificationCount2wMax
{
  return self->_totalNotificationCount2wMax;
}

- (int64_t)openedNotificationCount2wMedian
{
  return self->_openedNotificationCount2wMedian;
}

- (int64_t)openedNotificationCount2wMax
{
  return self->_openedNotificationCount2wMax;
}

- (BOOL)buyLabel
{
  return self->_buyLabel;
}

- (int64_t)minsUntilICloudBuy
{
  return self->_minsUntilICloudBuy;
}

- (BOOL)openLabelSubStream
{
  return self->_openLabelSubStream;
}

- (int64_t)minsUntilICloudOpenedSubStream
{
  return self->_minsUntilICloudOpenedSubStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oBSOLETEDayOfWeek, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop3, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop2, 0);
  objc_storeStrong((id *)&self->_notificationUsageTypeTop1, 0);
  objc_storeStrong((id *)&self->_lastOpenedAppId24h, 0);
  objc_storeStrong((id *)&self->_labelMessage, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop3, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop2, 0);
  objc_storeStrong((id *)&self->_iCloudNotificationUsageTypeTop1, 0);
  objc_storeStrong((id *)&self->_deviceModelName, 0);
}

@end
