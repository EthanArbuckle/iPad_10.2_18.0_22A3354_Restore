@implementation SSGetMDPlistObject

void ___SSGetMDPlistObject_block_invoke()
{
  id v0;
  const char *v1;
  int v2;
  int v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  stat v8;

  SSDefaultsGetAssetPath(CFSTR("appExtras.mdplist"));
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v0, "cStringUsingEncoding:", 4);
  if (v1)
  {
    v2 = open(v1, 0);
    if (v2 != -1)
    {
      v3 = v2;
      memset(&v8, 0, sizeof(v8));
      if (!fstat(v2, &v8))
      {
        v4 = mmap(0, v8.st_size, 1, 1, v3, 0);
        if (v4 == (void *)-1)
          goto LABEL_11;
        v5 = v4;
        _SSGetMDPlistObject_sAppExtrasContainer = _MDPlistContainerCreateWithBytes();
        if (_SSGetMDPlistObject_sAppExtrasContainer)
        {
          _MDPlistGetRootPlistObjectFromPlist();
          _SSGetMDPlistObject_rootObj = v6;
          qword_1EF1B5498 = v7;
          if (_MDPlistGetPlistObjectType() == 241)
          {
            if (!_SSGetMDPlistObject_sAppExtrasContainer)
              goto LABEL_10;
LABEL_11:
            close(v3);
            goto LABEL_12;
          }
          _SSGetMDPlistObject_sAppExtrasContainer = 0;
        }
LABEL_10:
        munmap(v5, v8.st_size);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

@end
