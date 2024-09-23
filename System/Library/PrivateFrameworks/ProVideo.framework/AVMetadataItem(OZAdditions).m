@implementation AVMetadataItem(OZAdditions)

+ (uint64_t)simplyCreateMetadataItemWithObject:()OZAdditions identifier:timeRange:error:
{
  uint64_t result;
  __int128 v10;
  _OWORD v11[3];

  result = objc_msgSend(a3, "simplyEncode:", a6);
  if (result)
  {
    v10 = a5[1];
    v11[0] = *a5;
    v11[1] = v10;
    v11[2] = a5[2];
    return objc_msgSend(a1, "simplyCreateMetadataItemWithRawData:identifier:timeRange:", result, a4, v11);
  }
  return result;
}

+ (id)simplyCreateMetadataItemWithRawData:()OZAdditions identifier:timeRange:
{
  id v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v8 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v8, "setIdentifier:", a4);
  objc_msgSend(v8, "setValue:", a3);
  objc_msgSend(v8, "setDataType:", *MEMORY[0x1E0CA2440]);
  v12 = *a5;
  v13 = *((_QWORD *)a5 + 2);
  objc_msgSend(v8, "setTime:", &v12);
  v10 = *(__int128 *)((char *)a5 + 24);
  v11 = *((_QWORD *)a5 + 5);
  objc_msgSend(v8, "setDuration:", &v10);
  return v8;
}

+ (id)simplyCreateMetadataItemWithMediaCharacteristic:()OZAdditions
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  objc_msgSend(v4, "setIdentifier:", objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AAE8], *MEMORY[0x1E0C8A9F0]));
  objc_msgSend(v4, "setValue:", a3);
  return v4;
}

@end
