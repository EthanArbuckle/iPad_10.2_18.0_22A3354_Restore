@implementation MAAsset

void __41__MAAsset_SUS__cancelDownloadIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    SULogInfo(CFSTR("Unable to cancel downloading asset: %d"), a2, a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __28__MAAsset_SUS__cleanupAsset__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "cancelDownloadIfNecessary");
  result = objc_msgSend(*(id *)(a1 + 32), "isInstalled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "purge:", &__block_literal_global_289);
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assetType"), "isEqualToString:", CFSTR("com.apple.MobileAsset.SoftwareUpdate"));
    if ((_DWORD)result)
      return +[SUAssetSupport purgeMSUUpdate:](SUAssetSupport, "purgeMSUUpdate:", 0);
  }
  return result;
}

void __28__MAAsset_SUS__cleanupAsset__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
    SULogDebug(CFSTR("Unable to purge asset: %d"), a2, a3, a4, a5, a6, a7, a8, a2);
}

intptr_t __30__MAAsset_SUS__cancelDownload__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFString *v9;
  uint64_t v11;

  if (a2)
  {
    v9 = CFSTR("Failed to cancel download");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v9 = CFSTR("Update download cancelled.");
  }
  SULogInfo(v9, a2, a3, a4, a5, a6, a7, a8, v11);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __21__MAAsset_SUS__purge__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (a2)
  {
    SULogInfo(CFSTR("Failed to purge asset"), a2, a3, a4, a5, a6, a7, a8, v10);
  }
  else
  {
    SULogInfo(CFSTR("Successfully purged asset"), 0, a3, a4, a5, a6, a7, a8, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
