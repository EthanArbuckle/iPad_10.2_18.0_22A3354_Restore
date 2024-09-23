@implementation NSStringDrawingTextStorageSettings

+ (NSStringDrawingTextStorageSettings)threadSpecificStringDrawingTextStorageSettings:(uint64_t)a1
{
  NSStringDrawingTextStorageSettings *v3;
  BOOL v4;

  objc_opt_self();
  v3 = (NSStringDrawingTextStorageSettings *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("kNSStringDrawingTextStorageSettings"));
  if (v3)
    v4 = 1;
  else
    v4 = a2 == 0;
  if (!v4)
  {
    v3 = objc_alloc_init(NSStringDrawingTextStorageSettings);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "setObject:forKey:", v3, CFSTR("kNSStringDrawingTextStorageSettings"));

  }
  return v3;
}

- (NSStringDrawingTextStorageSettings)init
{
  NSStringDrawingTextStorageSettings *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSStringDrawingTextStorageSettings;
  v2 = -[NSStringDrawingTextStorageSettings init](&v4, sel_init);
  if (v2)
    *(_WORD *)&v2->_settings._flags = *(_WORD *)&v2->_settings._flags & 0xFD | ((unsigned __int16)+[NSTypesetter defaultStringDrawingTypesetterBehavior](NSTypesetter, "defaultStringDrawingTypesetterBehavior") << 8);
  return v2;
}

@end
