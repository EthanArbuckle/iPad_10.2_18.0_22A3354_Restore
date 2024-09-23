@implementation UILogRegulatoryLog

void ____UILogRegulatoryLog_block_invoke()
{
  void *v0;
  _OWORD *v1;
  id v2;

  v2 = (id)MGCopyAnswer();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("Carrier")))
  {
    _UIPrivateMainBundleIdentifier();
    v0 = (void *)objc_claimAutoreleasedReturnValue();

    if (v0)
    {
      v1 = malloc_type_malloc(0x100uLL, 0x2004037CDC9F9uLL);
      qword_1ECD81DC0 = (uint64_t)v1;
      *v1 = 0u;
      v1[1] = 0u;
      v1[2] = 0u;
      v1[3] = 0u;
      v1[4] = 0u;
      v1[5] = 0u;
      v1[6] = 0u;
      v1[7] = 0u;
      v1[8] = 0u;
      v1[9] = 0u;
      v1[10] = 0u;
      v1[11] = 0u;
      v1[12] = 0u;
      v1[13] = 0u;
      v1[14] = 0u;
      v1[15] = 0u;
    }
  }

}

@end
