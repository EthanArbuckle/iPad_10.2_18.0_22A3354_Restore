@implementation PXTrimTimeCodeStringFromSecondsAndRound

uint64_t __PXTrimTimeCodeStringFromSecondsAndRound_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)PXTrimTimeCodeStringFromSecondsAndRound_minuteSecondFormatter;
  PXTrimTimeCodeStringFromSecondsAndRound_minuteSecondFormatter = (uint64_t)v0;

  objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_minuteSecondFormatter, "setAllowedUnits:", 192);
  objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_minuteSecondFormatter, "setUnitsStyle:", 0);
  objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_minuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v3 = (void *)PXTrimTimeCodeStringFromSecondsAndRound_hourMinuteSecondFormatter;
  PXTrimTimeCodeStringFromSecondsAndRound_hourMinuteSecondFormatter = (uint64_t)v2;

  objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_hourMinuteSecondFormatter, "setAllowedUnits:", 224);
  objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_hourMinuteSecondFormatter, "setUnitsStyle:", 0);
  return objc_msgSend((id)PXTrimTimeCodeStringFromSecondsAndRound_hourMinuteSecondFormatter, "setZeroFormattingBehavior:", 0x10000);
}

@end
