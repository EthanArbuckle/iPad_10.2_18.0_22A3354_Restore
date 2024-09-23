@implementation PLMaxIOSurfaceDimension

unint64_t __PLMaxIOSurfaceDimension_block_invoke()
{
  unint64_t v0;
  unint64_t result;
  uint64_t v2;

  v0 = MEMORY[0x19AEBFE68](*MEMORY[0x1E0CBC1E0]);
  result = MEMORY[0x19AEBFE68](*MEMORY[0x1E0CBC008]);
  if (v0 >= result)
    v2 = result;
  else
    v2 = v0;
  PLMaxIOSurfaceDimension_maxDimension = v2;
  return result;
}

@end
