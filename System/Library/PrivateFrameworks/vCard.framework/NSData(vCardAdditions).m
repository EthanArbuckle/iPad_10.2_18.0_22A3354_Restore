@implementation NSData(vCardAdditions)

+ (unint64_t)_cn_maxDataLengthFittingInBase64EncodingLength:()vCardAdditions
{
  return (unint64_t)((double)(3 * (-3 * ((a3 & 0xFFFFFFFFFFFFFFFCLL) / 0x4B) + (a3 & 0xFFFFFFFFFFFFFFFCLL)))
                          * 0.25);
}

- (id)_cn_encodeVCardBase64DataWithInitialLength:()vCardAdditions
{
  NSUInteger v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;

  v5 = 4 * objc_msgSend(a1, "length") / 3uLL;
  v6 = NSZoneMalloc(0, 0x18uLL);
  if (v5 <= 1)
    v5 = 1;
  v7 = NSZoneMalloc(0, v5);
  v6[1] = 0;
  v6[2] = v5;
  *v6 = v7;
  v8 = objc_retainAutorelease(a1);
  v9 = (_BYTE *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  if (v10 < 1)
    goto LABEL_18;
  v11 = v10;
  v12 = 0;
  v13 = v10;
  do
  {
    v14 = v12 % 3;
    if (v12 % 3 == 2)
    {
      a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 6) & 0x3F], a3);
      v15 = *v9 & 0x3F;
    }
    else if (v14 == 1)
    {
      v15 = ((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 4) & 0x3F;
    }
    else
    {
      if (v14)
        goto LABEL_12;
      v15 = (unint64_t)*v9 >> 2;
    }
    a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[v15], a3);
LABEL_12:
    ++v12;
    ++v9;
    --v13;
  }
  while (v13);
  if (v11 % 3 == 2)
  {
    v18 = Encode64Table[4 * (*(v9 - 1) & 0xF)];
    v17 = (uint64_t)v6;
    v16 = a3;
LABEL_17:
    v19 = appendToBufferWithLineFolding(v17, v18, v16);
    appendToBufferWithLineFolding((uint64_t)v6, 61, v19);
  }
  else if (v11 % 3 == 1)
  {
    v16 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[16 * (*(v9 - 1) & 3)], a3);
    v17 = (uint64_t)v6;
    v18 = 61;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", *v6, v6[1]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSZoneFree(0, v6);
  return v20;
}

@end
