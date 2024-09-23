@implementation OABBlip

+ (id)readBlipFromBse:(id)a3
{
  const void *v4;
  _DWORD *v5;
  int v6;
  OADBlip *v7;

  v4 = (const void *)objc_msgSend(a3, "eshObject");
  if (v4
  {
    v6 = v5[13];
    if (v6 && *((_QWORD *)v5 + 4))
    {
      objc_msgSend(a1, "readBlipFromEshBlip:");
      v7 = (OADBlip *)objc_claimAutoreleasedReturnValue();
      *-[OADBlip referenceCount](v7, "referenceCount") = v6;
    }
    else
    {
      v7 = objc_alloc_init(OADBlip);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)readBlipFromEshBlip:(EshBlip *)a3
{
  int RecordType;
  OADBlip *v6;
  uint64_t v7;
  OADSubBlip *v8;
  ESDDibFileBlipContext *v9;
  OADBlip *v10;

  if (a3)
  {
    RecordType = EshRecord::getRecordType((EshRecord *)a3);
    v6 = objc_alloc_init(OADBlip);
    if ((RecordType - 61466) >= 6 && (RecordType - 61481) > 1)
      goto LABEL_18;
    if (((*((uint64_t (**)(EshBlip *))a3->var0 + 10))(a3) & 1) == 0)
    {
      +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
      v10 = 0;
LABEL_19:

      return v10;
    }
    v7 = 2;
    if (RecordType <= 61470)
    {
      if (RecordType != 61469)
      {
        if (RecordType != 61470)
          goto LABEL_21;
        v7 = 3;
      }
    }
    else if (RecordType != 61482)
    {
      if (RecordType != 61481)
      {
        if (RecordType == 61471)
        {
          v8 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", 0, 1);
          v9 = -[ESDBlipContext initWithOffset:byteCount:stream:streamID:]([ESDDibFileBlipContext alloc], "initWithOffset:byteCount:stream:streamID:", *(unsigned int *)&a3[1].var3.var0[4], *(unsigned int *)&a3[1].var3.var0[12], *(_QWORD *)&a3[2].var2.var1, *(unsigned int *)&a3[1].var3.var0[8]);
          -[OCDDelayedNode setDelayedContext:](v8, "setDelayedContext:", v9);
          -[OADBlip setMainSubBlip:](v6, "setMainSubBlip:", v8);
LABEL_17:

LABEL_18:
          v10 = v6;
          goto LABEL_19;
        }
LABEL_21:
        objc_msgSend(a1, "delayedSubBlipWithMetafileInfo:", &a3[1]);
        v8 = (OADSubBlip *)objc_claimAutoreleasedReturnValue();
        -[OADBlip setMainSubBlip:](v6, "setMainSubBlip:", v8);
        objc_msgSend(a1, "delayedSubBlipWithMetafileInfo:", &a3[3].var2.var4);
        v9 = (ESDDibFileBlipContext *)objc_claimAutoreleasedReturnValue();
        if (v9)
          -[OADBlip setAltSubBlip:](v6, "setAltSubBlip:", v9);
        goto LABEL_17;
      }
      v7 = 8;
    }
    v8 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", 0, v7);
    v9 = -[ESDBlipContext initWithOffset:byteCount:stream:streamID:]([ESDBlipContext alloc], "initWithOffset:byteCount:stream:streamID:", *(unsigned int *)&a3[1].var3.var0[4], *(unsigned int *)&a3[1].var3.var0[12], *(_QWORD *)&a3[2].var2.var1, *(unsigned int *)&a3[1].var3.var0[8]);
    -[OCDDelayedNode setDelayedContext:](v8, "setDelayedContext:", v9);
    -[OADBlip setMainSubBlip:](v6, "setMainSubBlip:", v8);
    goto LABEL_17;
  }
  v10 = 0;
  return v10;
}

+ (id)delayedSubBlipWithMetafileInfo:(const void *)a3
{
  int v4;
  int v5;
  uint64_t v6;
  OADSubBlip *v7;
  ESDMetafileBlipContext *v8;

  v4 = **(_WORD **)a3 & 0xFFFE;
  if (v4 && (v5 = v4 == 1346, v6 = objc_msgSend(a1, "blipTypeForBlipSignature:"), (_DWORD)v6) && *((_DWORD *)a3 + 10))
  {
    v7 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", 0, v6);
    -[OADSubBlip setSizeInPoints:](v7, "setSizeInPoints:", (double)*((int *)a3 + 23) / 12700.0, (double)*((int *)a3 + 24) / 12700.0);
    -[OADSubBlip setFrame:](v7, "setFrame:", (double)*((int *)a3 + 19), (double)*((int *)a3 + 20), (double)(*((_DWORD *)a3 + 21) - *((_DWORD *)a3 + 19)), (double)(*((_DWORD *)a3 + 22) - *((_DWORD *)a3 + 20)));
    v8 = -[ESDMetafileBlipContext initWithOffset:byteCount:uncompressed:stream:streamID:]([ESDMetafileBlipContext alloc], "initWithOffset:byteCount:uncompressed:stream:streamID:", *((unsigned int *)a3 + 8), *((unsigned int *)a3 + 10), *((unsigned int *)a3 + 18), *((_QWORD *)a3 + 8), *((unsigned int *)a3 + 9));
    -[ESDMetafileBlipContext setDefaultHeaderSize:](v8, "setDefaultHeaderSize:", (v5 << 9));
    -[OCDDelayedNode setDelayedContext:](v7, "setDelayedContext:", v8);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (int)blipTypeForBlipSignature:(int)a3
{
  if (a3 <= 1759)
  {
    if (a3 <= 1129)
    {
      if (a3 == 534)
        return 4;
      if (a3 == 980)
        return 5;
      return 0;
    }
    if (a3 != 1130)
    {
      if (a3 == 1346)
        return 6;
      return 0;
    }
    return 2;
  }
  if (a3 <= 1763)
  {
    if (a3 == 1760)
      return 3;
    if (a3 != 1762)
      return 0;
    return 2;
  }
  if (a3 == 1764)
    return 8;
  return a3 == 1960;
}

+ (EshBlip)writeBlip:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  unsigned __int16 v15;
  uint64_t v16;
  const __CFUUID *v17;
  CFUUIDBytes v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  __int16 v26;

  v5 = (void *)MEMORY[0x22E2DDB58](a1, a2);
  objc_msgSend(a3, "mainSubBlip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v6, "type"))
  {
    case 2u:
      v7 = 0;
      v8 = 0;
      v9 = 3;
      v10 = 1;
      v11 = 1;
      break;
    case 3u:
      v11 = 0;
      v8 = 0;
      v9 = 4;
      v10 = 1;
      v7 = 1;
      break;
    case 4u:
      v11 = 0;
      v7 = 0;
      v8 = 0;
      v10 = 1;
      v9 = 1;
      break;
    case 5u:
      v11 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 1;
      break;
    case 6u:
      v11 = 0;
      v7 = 0;
      v9 = 2;
      v10 = 1;
      v8 = 1;
      break;
    default:
      v10 = 0;
      v11 = 0;
      v7 = 0;
      v8 = 0;
      v9 = -2;
      break;
  }
  objc_msgSend(v6, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = v10;
  else
    v14 = 0;
  if (v14 == 1 && objc_msgSend(v12, "length"))
  {
    if ((v10 & 1) != 0)
    {
      v26 = word_22A4BE1B8[v9];
      v15 = v9 - 4070;
    }
    else
    {
      v26 = 0;
      v15 = -4072;
    }
    v17 = CFUUIDCreate(0);
    v18 = CFUUIDGetUUIDBytes(v17);
    v25 = *(_QWORD *)&v18.byte0;
    if ((v11 | v7) == 1)
    {
      v16 = operator new();
      EshBitmapBlip::EshBitmapBlip((EshBitmapBlip *)v16, v15);
      EshRecord::setInstance(v16, v26);
      v19 = v16 + 48;
      *(_BYTE *)(v16 + 120) = -1;
    }
    else
    {
      v16 = operator new();
      EshMetafileBlip::EshMetafileBlip((EshMetafileBlip *)v16, v15);
      EshRecord::setInstance(v16, v26 | 1);
      v19 = v16 + 48;
      **(_WORD **)(v16 + 48) |= 1u;
      *(CFUUIDBytes *)(v16 + 56) = v18;
      if (v8)
      {
        objc_msgSend(a1, "setMetafileBoundsFromPictData:info:", v13, v16 + 48);
        v20 = (void *)MEMORY[0x24BDBCE50];
        v21 = objc_retainAutorelease(v13);
        objc_msgSend(v20, "dataWithBytes:length:", objc_msgSend(v21, "bytes") + 512, objc_msgSend(v21, "length") - 512);
        v22 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v22;
      }
      objc_msgSend(a1, "compressMetafileData:info:", v13, v16 + 48, *(_QWORD *)&v18.byte0);
      v23 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v23;
    }
    *(_QWORD *)(v16 + 28) = v25;
    *(_QWORD *)(v16 + 36) = *(_QWORD *)&v18.byte8;
    CFRelease(v17);
    **(_WORD **)v19 = **(_WORD **)v19 & 1 | v26;
    v13 = objc_retainAutorelease(v13);
    OcBinaryData::copyBuffer((OcBinaryData *)(v19 + 24), (const unsigned __int8 *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return (EshBlip *)v16;
}

+ (void)writeBlip:(id)a3 toBlipStoreEntry:(EshBSE *)a4
{
  void *v6;
  int v7;
  EshBlip *v8;
  EshBlip *v9;
  int BlipType;
  int v11;
  int v12;
  id v13;

  v13 = a3;
  if (*(_DWORD *)objc_msgSend(v13, "referenceCount")
    && (objc_msgSend(v13, "mainSubBlip"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "sizeInBytes"),
        v6,
        v7 >= 1)
    && (v8 = (EshBlip *)objc_msgSend(a1, "writeBlip:", v13), (v9 = v8) != 0))
  {
    BlipType = EshBlip::getBlipType(v8);
    v11 = BlipType;
    v12 = BlipType;
    switch(BlipType)
    {
      case 0:
        goto LABEL_6;
      case 1:
        break;
      case 2:
      case 3:
        v12 = 4;
        break;
      case 4:
        v12 = 4;
        v11 = 3;
        break;
      default:
        v12 = BlipType;
        break;
    }
    EshRecord::setInstance((uint64_t)a4, BlipType);
    a4->var11 = v11;
    a4->var12 = v12;
    a4->var8 = 255;
    a4->var9 = 0;
    a4->var6 = *(_DWORD *)objc_msgSend(v13, "referenceCount");
    a4->var15 = v9->var3;
    a4->var3 = v9;
  }
  else
  {
LABEL_6:
    objc_msgSend(a1, "writeEmptyBlipStoreEntry:", a4);
  }

}

+ (id)dibFileContentsWithDibBlipData:(const OcBinaryData *)a3
{
  void *v4;
  unsigned int *var5;
  uint64_t var3;
  int SInt32;
  uint64_t v8;
  unsigned int UInt16;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  unsigned int v16;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var5 = (unsigned int *)a3->var5;
  var3 = a3->var3;
  v16 = var3 + 14;
  SInt32 = CsLeReadSInt32(var5);
  v8 = 14;
  if (SInt32 == 12)
    v8 = 10;
  UInt16 = CsLeReadUInt16((unsigned __int16 *)((char *)var5 + v8));
  if (SInt32 == 12)
    v10 = 3;
  else
    v10 = 4;
  v11 = 1 << UInt16;
  if (UInt16 >= 9)
    v11 = 0;
  v15 = SInt32 + v11 * v10 + 14;
  objc_msgSend(v4, "appendBytes:length:", "BM", 2);
  v14 = CsLeReadSInt32(&v16);
  objc_msgSend(v4, "appendBytes:length:", &v14, 4);
  objc_msgSend(v4, "appendBytes:length:", &unk_22A4BE1B2, 4);
  v13 = CsLeReadSInt32((unsigned int *)&v15);
  objc_msgSend(v4, "appendBytes:length:", &v13, 4);
  objc_msgSend(v4, "appendBytes:length:", var5, var3);
  return v4;
}

+ (id)subBlipWithMetafileInfo:(const void *)a3
{
  int v3;
  uint64_t v5;
  int v6;
  uLong v7;
  uLongf v8;
  id v9;
  BOOL v10;
  OADSubBlip *v11;
  uLongf destLen;

  v3 = **(_WORD **)a3 & 0xFFFE;
  if ((**(_WORD **)a3 & 0xFFFE) == 0)
    return 0;
  v5 = objc_msgSend(a1, "blipTypeForBlipSignature:", **(_WORD **)a3 & 0xFFFE);
  v6 = v3 == 1346;
  v7 = *((unsigned int *)a3 + 25);
  v8 = *((unsigned int *)a3 + 18);
  destLen = v8;
  v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", (v8 + (v6 << 9))));
  if (uncompress((Bytef *)(objc_msgSend(v9, "mutableBytes") + (v6 << 9)), &destLen, *((const Bytef **)a3 + 6), v7))
  {
    v10 = 0;
  }
  else
  {
    v10 = destLen == v8;
  }
  if (v10)
  {
    v11 = -[OADSubBlip initWithData:type:]([OADSubBlip alloc], "initWithData:type:", v9, v5);
    -[OADSubBlip setSizeInPoints:](v11, "setSizeInPoints:", (double)*((int *)a3 + 23) / 12700.0, (double)*((int *)a3 + 24) / 12700.0);
    -[OADSubBlip setFrame:](v11, "setFrame:", (double)*((int *)a3 + 19), (double)*((int *)a3 + 20), (double)(*((_DWORD *)a3 + 21) - *((_DWORD *)a3 + 19)), (double)(*((_DWORD *)a3 + 22) - *((_DWORD *)a3 + 20)));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)setMetafileBoundsFromPictData:(id)a3 info:(void *)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  int v12;
  float v13;
  id v14;

  v14 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v14);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "size");
  }
  else
  {
    v7 = 1000.0;
    v8 = 1000.0;
  }
  v9 = v7 * 12700.0;
  v10 = v8 * 12700.0;
  *((_DWORD *)a4 + 23) = llroundf(v9);
  *((_DWORD *)a4 + 24) = llroundf(v10);
  v11 = v7;
  v12 = llroundf(v11);
  v13 = v8;
  *((_DWORD *)a4 + 19) = 0;
  *((_DWORD *)a4 + 20) = 0;
  *((_DWORD *)a4 + 21) = v12;
  *((_DWORD *)a4 + 22) = llroundf(v13);

}

+ (id)compressMetafileData:(id)a3 info:(void *)a4
{
  id v5;
  int v6;
  uLongf v7;
  id v8;
  Bytef *v9;
  id v10;
  uLongf destLen;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  *((_DWORD *)a4 + 18) = v6;
  v7 = (int)vcvtps_s32_f32((float)((float)v6 * 1.01) + 12.0);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v7);
  destLen = v7;
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (Bytef *)objc_msgSend(v8, "mutableBytes");
  v10 = objc_retainAutorelease(v5);
  if (compress(v9, &destLen, (const Bytef *)objc_msgSend(v10, "bytes"), v6))
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
  objc_msgSend(v8, "setLength:", destLen);
  *((_DWORD *)a4 + 25) = destLen;
  *((_WORD *)a4 + 52) = -512;

  return v8;
}

+ (void)writeEmptyBlipStoreEntry:(EshBSE *)a3
{
  EshRecord::setInstance((uint64_t)a3, 0);
  *(_QWORD *)&a3->var11 = 0;
  a3->var8 = 255;
  a3->var9 = 0;
  a3->var6 = 0;
}

@end
