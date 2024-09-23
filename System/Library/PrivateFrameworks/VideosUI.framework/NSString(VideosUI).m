@implementation NSString(VideosUI)

- (uint64_t)vui_stringWithFirstStrongDirectionalIsolates
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⁨%@⁩"), a1);
}

@end
