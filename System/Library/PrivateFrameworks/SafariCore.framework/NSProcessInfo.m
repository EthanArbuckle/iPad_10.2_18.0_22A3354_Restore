@implementation NSProcessInfo

void __70__NSProcessInfo_SafariCoreExtras__safari_operatingSystemVersionString__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v1 = *(void **)(a1 + 32);
  if (v1)
    objc_msgSend(*(id *)(a1 + 32), "operatingSystemVersion");
  else
    memset(v4, 0, sizeof(v4));
  objc_msgSend(v1, "_safari_operatingSystemVersionStringFromOperatingSystemVersion:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)safari_operatingSystemVersionString_osVersionString;
  safari_operatingSystemVersionString_osVersionString = v2;

}

void __52__NSProcessInfo_SafariCoreExtras__safari_deviceUDID__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  timespec v4;
  uuid_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  memset(v5, 0, sizeof(v5));
  if (gethostuuid(v5, &v4))
    v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  else
    v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v5);
  v1 = v0;
  objc_msgSend(v0, "UUIDString");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)safari_deviceUDID_udid;
  safari_deviceUDID_udid = v2;

}

@end
