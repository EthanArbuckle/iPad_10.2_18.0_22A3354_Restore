@implementation PCSIsMultiDevice

void ___PCSIsMultiDevice_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MKBUserTypeDeviceMode();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D4E5B0]) & 1) != 0)
  {
    v4 = 1;
    _PCSIsMultiDevice_deviceModeIsMultiUser = 1;
  }
  else
  {
    v4 = _PCSIsMultiDevice_deviceModeIsMultiUser;
  }
  PCSMigrationLog(*(_QWORD *)(a1 + 32), CFSTR("multiuser device: %d"), v4, 0);

}

@end
