@implementation InitializeRGBColorSpace

CGColorSpaceRef ___InitializeRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  _MergedGlobals_199 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  qword_1ECF22268 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  qword_1ECF22270 = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  qword_1ECF22278 = (uint64_t)result;
  return result;
}

@end
