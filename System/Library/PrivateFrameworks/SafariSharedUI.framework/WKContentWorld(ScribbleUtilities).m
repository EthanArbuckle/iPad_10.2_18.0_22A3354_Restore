@implementation WKContentWorld(ScribbleUtilities)

+ (uint64_t)safari_worldForScribbleScript
{
  return objc_msgSend(MEMORY[0x1E0CEF5E0], "worldWithName:", CFSTR("safari-scribble"));
}

@end
