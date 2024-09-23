@implementation TSUPointerKeyDictionary

- (TSUPointerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  CFStringRef (__cdecl *v4)(const void *);
  TSUPointerKeyDictionary *v5;
  TSUPointerKeyDictionary *v6;
  __CFDictionary *mDictionary;
  objc_super v9;
  CFDictionaryKeyCallBacks keyCallBacks;

  keyCallBacks.version = *MEMORY[0x24BDBD6A0];
  keyCallBacks.retain = 0;
  v4 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x24BDBD6A0] + 24);
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = v4;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  v9.receiver = self;
  v9.super_class = (Class)TSUPointerKeyDictionary;
  v5 = -[TSUNoCopyDictionary initWithCapacity:](&v9, sel_initWithCapacity_);
  v6 = v5;
  if (v5)
  {
    mDictionary = v5->super.mDictionary;
    if (mDictionary)
      CFRelease(mDictionary);
    v6->super.mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x24BDBD6B0]);
  }
  return v6;
}

@end
