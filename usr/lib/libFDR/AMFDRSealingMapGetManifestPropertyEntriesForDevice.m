@implementation AMFDRSealingMapGetManifestPropertyEntriesForDevice

uint64_t ___AMFDRSealingMapGetManifestPropertyEntriesForDevice_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = (const void *)copyProductType(*(_QWORD *)(a1 + 32));
  if (v1)
  {
    _AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties = (uint64_t)_AMFDRSealingMapGetManifestPropertiesEntries(v1);
    if (!_AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties)
      _AMFDRSealingMapGetManifestPropertyEntriesForDevice_deviceManifestProperties = (uint64_t)_AMFDRSealingMapGetManifestPropertiesEntries(CFSTR("iRefDefault"));
  }
  else
  {
    AMSupportLogInternal();
  }
  return AMSupportSafeRelease();
}

@end
