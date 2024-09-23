@implementation NSCachedDecimalTabAttribute

uint64_t ____NSCachedDecimalTabAttribute_block_invoke()
{
  uint64_t result;
  NSCharacterSet *v1;

  v1 = +[NSTextTab columnTerminatorsForLocale:](NSTextTab, "columnTerminatorsForLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  __NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", &v1, &NSTabColumnTerminatorsAttributeName, 1);
  result = _CFExecutableLinkedOnOrAfter();
  if (!(_DWORD)result)
  {
    result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSDecimalTabUsesNaturalAlignment"));
    if ((result & 1) == 0)
      __NSDecimalTabAlignment = 1;
  }
  return result;
}

@end
