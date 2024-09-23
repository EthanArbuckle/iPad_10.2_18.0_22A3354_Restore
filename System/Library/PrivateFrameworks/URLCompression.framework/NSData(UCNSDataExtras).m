@implementation NSData(UCNSDataExtras)

- (id)transformV2ToV1Encoding
{
  id v2;
  __int16 v3;
  id v4;
  id v5;
  _BYTE v7[2];

  if (objc_msgSend(a1, "length") != 4)
    return 0;
  v2 = objc_retainAutorelease(a1);
  v3 = *(unsigned __int8 *)objc_msgSend(v2, "bytes") << 6;
  v7[0] = HIBYTE(v3);
  v7[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v7, 2);
  objc_msgSend(v4, "increaseLengthBy:", 13);
  v5 = (id)objc_msgSend(v2, "subdataWithRange:", 1, 3);
  objc_msgSend(v4, "appendData:", v5);

  return v4;
}

- (id)transformV3ToV1Encoding
{
  id v2;
  __int16 v4;

  if (objc_msgSend(a1, "length") != 19)
    return 0;
  v4 = 0;
  v2 = (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v4, 2);
  objc_msgSend(v2, "appendData:", a1);
  return v2;
}

- (id)transformV1ToV2Encoding
{
  id v2;
  unsigned __int8 *v3;
  unint64_t v4;
  id v5;
  id v6;
  char v8;

  if (objc_msgSend(a1, "length") != 18)
    return 0;
  v2 = objc_retainAutorelease(a1);
  v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
  HIDWORD(v4) = *v3;
  LODWORD(v4) = v3[1] << 24;
  v8 = v4 >> 30;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v8, 1);
  v6 = (id)objc_msgSend(v2, "subdataWithRange:", objc_msgSend(v2, "length") - 3, 3);
  objc_msgSend(v5, "appendData:", v6);

  return v5;
}

- (id)transformV1ToV3Encoding
{
  id v2;

  if (objc_msgSend(a1, "length") == 21)
    v2 = (id)objc_msgSend(a1, "subdataWithRange:", 2, objc_msgSend(a1, "length") - 2);
  else
    v2 = 0;
  return v2;
}

@end
