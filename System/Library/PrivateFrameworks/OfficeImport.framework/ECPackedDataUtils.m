@implementation ECPackedDataUtils

+ (void)writeString:(id)a3 toPackedData:(__CFData *)a4 packedDataSize:(unsigned int)a5 atIndex:(unsigned int)a6 withPreviousLength:(unsigned __int16)a7 outLength:(unsigned __int16 *)a8
{
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v10 = objc_msgSend(v12, "length");
  if ((unint64_t)(2 * v10) < 0x10000)
  {
    if (a8)
      *a8 = 2 * v10;
    objc_msgSend(v12, "getCharacters:range:", objc_msgSend(a1, "prepareForDataOfLength:atIndex:withPreviousLength:inPackedData:packedDataSize:"), 0, v10);
    v11 = v12;
  }
  else
  {
    *a8 = 0;
    v11 = v12;
  }

}

+ (char)prepareForDataOfLength:(unsigned int)a3 atIndex:(unsigned int)a4 withPreviousLength:(unsigned int)a5 inPackedData:(__CFData *)a6 packedDataSize:(unsigned int)a7
{
  __CFData *v7;
  UInt8 *MutableBytePtr;

  v7 = a6;
  if (a6)
  {
    if (a3 > a5)
      CFDataIncreaseLength(a6, a3 - a5);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (MutableBytePtr)
    {
      v7 = (__CFData *)&MutableBytePtr[a4];
      if (a3 != a5)
        memmove((char *)v7 + a3, (char *)v7 + a5, a7 - (a5 + a4));
    }
    else
    {
      return 0;
    }
  }
  return (char *)v7;
}

+ (id)readStringFromData:(char *)a3 atOffset:(unsigned int)a4 withLength:(unsigned int)a5
{
  if (!a5)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &a3[a4], a5 >> 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)setData:(char *)a3 ofLength:(unsigned int)a4 atIndex:(unsigned int)a5 withPreviousLength:(unsigned int)a6 inPackedData:(__CFData *)a7 packedDataSize:(unsigned int)a8
{
  memcpy((void *)objc_msgSend(a1, "prepareForDataOfLength:atIndex:withPreviousLength:inPackedData:packedDataSize:", *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8), a3, a4);
  return 1;
}

+ (id)dumpDataToHexadecimalString:(char *)a3 start:(unsigned int)a4 stop:(unsigned int)a5 nicelyFormatted:(BOOL)a6
{
  _BOOL4 v7;
  void *v11;
  uint64_t v12;
  char *v13;

  if (a5 == a4)
    return &stru_24F3BFFF8;
  v7 = a6;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > a4)
  {
    v12 = 0;
    v13 = &a3[a4];
    do
    {
      if ((unint64_t)a4 + v12 > a4 && v7 && (v12 & 3) == 0)
        objc_msgSend(v11, "appendString:", CFSTR(" "));
      objc_msgSend(v11, "appendFormat:", CFSTR("%02X"), v13[v12++]);
    }
    while (a4 - a5 + (_DWORD)v12);
  }
  if (v7)
    objc_msgSend(v11, "appendFormat:", CFSTR(" (%i bytes)"), a5 - a4);
  return v11;
}

@end
