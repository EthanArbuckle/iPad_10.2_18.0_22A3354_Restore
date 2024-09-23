@implementation OSAIsACDCDevice

void __OSAIsACDCDevice_block_invoke()
{
  uint8_t v0[16];

  if (os_variant_is_darwinos() && MGGetSInt32Answer() == 12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Device is an ACDC compute module", v0, 2u);
    }
    OSAIsACDCDevice_isACDCDevice = 1;
  }
}

@end
