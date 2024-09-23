@implementation WFPresentResumeSyncConfirmationAlertWithUserInterfaceIfNeeded

uint64_t __WFPresentResumeSyncConfirmationAlertWithUserInterfaceIfNeeded_block_invoke_2()
{
  +[WFCloudKitSyncSession setZoneWasPurged:](WFCloudKitSyncSession, "setZoneWasPurged:", 0);
  +[WFCloudKitSyncSession setIgnoresUserDeletedZoneErrors:](WFCloudKitSyncSession, "setIgnoresUserDeletedZoneErrors:", 1);
  return +[WFCloudKitSyncSession setSyncEnabled:](WFCloudKitSyncSession, "setSyncEnabled:", 0);
}

uint64_t __WFPresentResumeSyncConfirmationAlertWithUserInterfaceIfNeeded_block_invoke()
{
  uint64_t result;

  +[WFCloudKitSyncSession setZoneWasPurged:](WFCloudKitSyncSession, "setZoneWasPurged:", 0);
  +[WFCloudKitSyncSession setIgnoresUserDeletedZoneErrors:](WFCloudKitSyncSession, "setIgnoresUserDeletedZoneErrors:", 1);
  result = +[WFCloudKitSyncSession isSyncEnabled](WFCloudKitSyncSession, "isSyncEnabled");
  if ((_DWORD)result)
    return notify_post("com.apple.shortcuts.daemon-wakeup-request");
  return result;
}

@end
