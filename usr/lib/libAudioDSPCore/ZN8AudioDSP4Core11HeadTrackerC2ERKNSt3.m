@implementation ZN8AudioDSP4Core11HeadTrackerC2ERKNSt3

_QWORD *___ZN8AudioDSP4Core11HeadTrackerC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEb_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("disable_head_tracking"), CFSTR("com.apple.coreaudio"), (const __CFString *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 13), a4);
}

@end
