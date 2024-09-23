@implementation IRDataConversion

+ (id)convertIRDataToNSDictionary:(id)a3
{
  applesauce::CF::DataRef *v3;
  CFTypeRef v4;
  applesauce::CF::DataRef *v5;
  BOOL v6;
  void *DictionaryIRData;
  void *__p;
  void *v10;
  uint64_t v11;
  CFTypeRef v12;
  IR::IRData::Implementation *v13;
  CFTypeRef cf;
  CFTypeRef v15[2];
  int v16;
  CFTypeRef v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  applesauce::CF::DataRef *v21;

  v3 = (applesauce::CF::DataRef *)a3;
  if (-[applesauce::CF::DataRef length](v3, "length"))
  {
    applesauce::CF::DataRef::from_ns_noexcept(v3, &v21);
    applesauce::CF::URLRef::URLRef((applesauce::CF::URLRef *)&v20, "temp", 0);
    v4 = v20;
    if (v20)
      CFRetain(v20);
    cf = v4;
    IR::IRDataAttributes::IRDataAttributes((uint64_t)v15, &cf, 0, 0, 2, 0.0);
    if (cf)
      CFRelease(cf);
    v16 = 2;
    v5 = v21;
    if (v21)
      CFRetain(v21);
    v11 = 0;
    v12 = v5;
    __p = 0;
    v10 = 0;
    IR::IRData::IRData(&v13, v15, &v12, &__p);
    if (__p)
    {
      v10 = __p;
      operator delete(__p);
    }
    if (v12)
      CFRelease(v12);
    DictionaryIRData = (void *)IR::IRData::createDictionaryIRData((IR::IRData *)&v13, (const IR::IRData *)1, v6);
    IR::IRData::~IRData(&v13);
    if (v19)
      CFRelease(v19);
    if (v18)
      CFRelease(v18);
    if (v17)
      CFRelease(v17);
    if (v15[0])
      CFRelease(v15[0]);
    if (v20)
      CFRelease(v20);
    if (v21)
      CFRelease(v21);
  }
  else
  {
    DictionaryIRData = 0;
  }

  return DictionaryIRData;
}

@end
