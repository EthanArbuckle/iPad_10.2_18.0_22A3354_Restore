@implementation MFSniffer

+ (int)fileType:(id)a3
{
  id v3;
  unsigned __int16 *v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v11;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int16 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = 2;
  if (v4 && v5 > 3)
  {
    v7 = *v4;
    v8 = *((unsigned __int8 *)v4 + 2);
    v9 = *((unsigned __int8 *)v4 + 3);
    if (v7 <= 1 && (v8 | (v9 << 8)) == 9)
    {
      v6 = 0;
    }
    else
    {
      v11 = (v9 << 24) | (v8 << 16) | v7;
      v6 = 2 * (v11 != -1698247209);
      if (v5 >= 0x2C && v11 != -1698247209)
      {
        if (*((_DWORD *)v4 + 10) == 1179469088)
          v6 = 1;
        else
          v6 = 2;
      }
    }
  }

  return v6;
}

@end
