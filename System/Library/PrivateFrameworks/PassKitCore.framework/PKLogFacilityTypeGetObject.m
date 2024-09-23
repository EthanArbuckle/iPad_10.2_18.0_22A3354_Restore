@implementation PKLogFacilityTypeGetObject

void __PKLogFacilityTypeGetObject_block_invoke()
{
  const char *v0;
  unint64_t i;
  char *Name;
  os_log_t v3;
  char *v4;
  void *v5;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.passkit"), "UTF8String");
  for (i = 0; i != 48; ++i)
  {
    Name = PKLogFacilityTypeGetName(i);
    if (Name)
    {
      v3 = os_log_create(v0, Name);
      v4 = &_MergedGlobals_245[8 * i];
      v5 = (void *)*((_QWORD *)v4 + 5);
      *((_QWORD *)v4 + 5) = v3;

    }
  }
}

@end
