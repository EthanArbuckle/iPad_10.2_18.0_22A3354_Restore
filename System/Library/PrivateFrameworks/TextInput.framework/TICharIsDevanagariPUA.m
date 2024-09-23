@implementation TICharIsDevanagariPUA

CFCharacterSetRef __TICharIsDevanagariPUA_block_invoke()
{
  CFCharacterSetRef result;
  CFRange v1;

  v1.location = 63197;
  v1.length = 33;
  result = CFCharacterSetCreateWithCharactersInRange(0, v1);
  TICharIsDevanagariPUA___devanagariPUACharacterSet = (uint64_t)result;
  return result;
}

@end
