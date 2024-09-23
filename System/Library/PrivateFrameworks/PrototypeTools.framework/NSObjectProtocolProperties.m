@implementation NSObjectProtocolProperties

void ___NSObjectProtocolProperties_block_invoke()
{
  objc_property_t *v0;
  id v1;
  void *v2;
  unint64_t i;
  const char *Name;
  void *v5;
  void *v6;
  unsigned int outCount;

  outCount = 0;
  v0 = protocol_copyPropertyList((Protocol *)&unk_1EF22B580, &outCount);
  v1 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v2 = (void *)_NSObjectProtocolProperties___properties;
  _NSObjectProtocolProperties___properties = (uint64_t)v1;

  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = property_getName(v0[i]);
      v5 = (void *)_NSObjectProtocolProperties___properties;
      _NSStringFromRuntimeString(Name);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
  }
  free(v0);
}

@end
