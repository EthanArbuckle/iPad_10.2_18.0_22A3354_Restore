@implementation TSURetainedPointerKeyDictionary

- (TSURetainedPointerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  CFIndex v4;
  CFStringRef (__cdecl *v5)(const void *);
  TSURetainedPointerKeyDictionary *v6;
  TSURetainedPointerKeyDictionary *v7;
  __CFDictionary *mDictionary;
  objc_super v10;
  CFDictionaryKeyCallBacks keyCallBacks;

  v4 = *MEMORY[0x24BDBD6A0];
  *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x24BDBD6A0] + 8);
  v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x24BDBD6A0] + 24);
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = v5;
  v10.receiver = self;
  v10.super_class = (Class)TSURetainedPointerKeyDictionary;
  keyCallBacks.version = v4;
  v6 = -[TSUNoCopyDictionary initWithCapacity:](&v10, sel_initWithCapacity_);
  v7 = v6;
  if (v6)
  {
    mDictionary = v6->super.mDictionary;
    if (mDictionary)
      CFRelease(mDictionary);
    v7->super.mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x24BDBD6B0]);
  }
  return v7;
}

@end
