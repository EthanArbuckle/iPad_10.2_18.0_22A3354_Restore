@implementation NFBootUUID

void __NFBootUUID_block_invoke()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  uuid_t uu;
  char in[16];
  _BYTE v5[21];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)in = 0u;
  memset(v5, 0, sizeof(v5));
  v2 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0, 0))
  {
    memset(uu, 0, sizeof(uu));
    uuid_parse(in, uu);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", uu, 16);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)qword_1ECFF6A48;
    qword_1ECFF6A48 = v0;

  }
}

@end
