@implementation TXRParserKTX

+ (BOOL)handlesData:(id)a3
{
  uint64_t v3;
  BOOL result;
  _BYTE v5[12];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "getBytes:length:", v5, 12);
  v3 = 0;
  result = 1;
  do
  {
    result &= *((unsigned __int8 *)&gKTXFileIdentifier + v3) == v5[v3];
    ++v3;
  }
  while (v3 != 12);
  return result;
}

- (BOOL)parseData:(id)a3 bufferAllocator:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint32x2_t *v14;
  uint32x2_t *v15;
  TXRTextureInfo *v16;
  TXRTextureInfo *textureInfo;
  int8x16_t v18;
  int8x16_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *parserQueue;
  TXRDeferredTextureInfo *v27;
  TXRDeferredTextureInfo *deferredTextureInfo;
  NSObject *v29;
  BOOL v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_retainAutorelease(v10);
  v14 = (uint32x2_t *)objc_msgSend(v13, "bytes");
  if (v14[1].i8[4] != 1 || (v15 = v14, v14[1].i8[5] != 2) || v14[1].i8[6] != 3 || v14[1].i8[7] != 4)
  {
    if (a6)
    {
      v31 = CFSTR("Only little endian KTX files are supported");
      v32 = 10;
LABEL_15:
      _newTXRErrorWithCodeAndErrorString(v32, (uint64_t)v31);
      v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v30 = 0;
    goto LABEL_19;
  }
  v16 = objc_alloc_init(TXRTextureInfo);
  textureInfo = self->_textureInfo;
  self->_textureInfo = v16;

  v18.i32[0] = v15[4].i32[1];
  *(uint32x2_t *)v19.i8 = vmax_u32(v15[5], (uint32x2_t)0x100000001);
  -[TXRTextureInfo setDimensions:](self->_textureInfo, "setDimensions:", *(double *)vextq_s8(vextq_s8(v18, v18, 4uLL), v19, 0xCuLL).i64);
  v20 = v15[6].u32[0];
  if (v20 <= 1)
    v21 = 1;
  else
    v21 = v20;
  -[TXRTextureInfo setArrayLength:](self->_textureInfo, "setArrayLength:", v21);
  -[TXRTextureInfo setCubemap:](self->_textureInfo, "setCubemap:", v15[6].i32[1] > 6u);
  v22 = v15[7].u32[0];
  if (v22 <= 1)
    v23 = 1;
  else
    v23 = v22;
  -[TXRTextureInfo setMipmapLevelCount:](self->_textureInfo, "setMipmapLevelCount:", v23);
  -[TXRTextureInfo setPixelFormat:](self->_textureInfo, "setPixelFormat:", -[TXRParserKTX determineFormatFromType:format:internalFormat:baseInternalFormat:](self, "determineFormatFromType:format:internalFormat:baseInternalFormat:", v15[2].u32[0], v15[3].u32[0], v15[3].u32[1], v15[4].u32[0]));
  if (!-[TXRTextureInfo pixelFormat](self->_textureInfo, "pixelFormat"))
  {
    if (a6)
    {
      v31 = CFSTR("Could not determine format from KTX header");
      v32 = 8;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  self->_bytesOfKeyValueData = v15[7].u32[1];
  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.txrtextureloaderparser", v24);
  parserQueue = self->_parserQueue;
  self->_parserQueue = v25;

  v27 = -[TXRDeferredTextureInfo initWithMipmapLevelCount:arrayLength:cubemap:]([TXRDeferredTextureInfo alloc], "initWithMipmapLevelCount:arrayLength:cubemap:", -[TXRTextureInfo mipmapLevelCount](self->_textureInfo, "mipmapLevelCount"), -[TXRTextureInfo arrayLength](self->_textureInfo, "arrayLength"), -[TXRTextureInfo cubemap](self->_textureInfo, "cubemap"));
  deferredTextureInfo = self->_deferredTextureInfo;
  self->_deferredTextureInfo = v27;

  v29 = self->_parserQueue;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__TXRParserKTX_parseData_bufferAllocator_options_error___block_invoke;
  v34[3] = &unk_1E977F5D0;
  v34[4] = self;
  v35 = v13;
  v36 = v12;
  v37 = v11;
  dispatch_async(v29, v34);

  v30 = 1;
LABEL_19:

  return v30;
}

uint64_t __56__TXRParserKTX_parseData_bufferAllocator_options_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseImageData:WithOptions:bufferAllocator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)parseImageData:(id)a3 WithOptions:(id)a4 bufferAllocator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t bytesOfKeyValueData;
  int8x8_t v12;
  int8x8_t v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  int8x8_t v18;
  uint64x2_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  unsigned int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  int v34;
  size_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  int8x16_t v56;
  id v57;
  id v58;
  unint64_t v59;
  int v60;
  uint64x2_t v61;
  int v62;
  id v63;
  size_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v69;
  int8x8_t v70;
  char *v71;
  TXRParserKTX *v72;
  int8x8_t v73;
  unint64_t v74;

  v8 = a3;
  v58 = a4;
  v9 = a5;
  v57 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v57, "bytes");
  bytesOfKeyValueData = self->_bytesOfKeyValueData;
  -[TXRTextureInfo dimensions](self->_textureInfo, "dimensions");
  v73 = v12;
  -[TXRTextureInfo dimensions](self->_textureInfo, "dimensions");
  v70 = v13;
  -[TXRTextureInfo dimensions](self->_textureInfo, "dimensions");
  v69 = v14;
  if (-[TXRTextureInfo mipmapLevelCount](self->_textureInfo, "mipmapLevelCount"))
  {
    v15 = 0;
    v16 = 0;
    v17 = v69;
    v18 = vext_s8(v70, v73, 4uLL);
    v19.i64[0] = v18.u32[0];
    v19.i64[1] = v18.u32[1];
    v61 = v19;
    v20 = v10 + bytesOfKeyValueData + 64;
    v21 = 0x1E977F000uLL;
    v63 = v9;
    v72 = self;
    do
    {
      v22 = -[TXRTextureInfo pixelFormat](self->_textureInfo, "pixelFormat");
      v23 = v22 - 130 > 0xD || ((1 << (v22 + 126)) & 0x3C3F) == 0;
      if (v23
        && v22 - 150 >= 4
        && (v22 & 0xFFFFFFFFFFFFFFF8) != 0xA0
        && (v22 - 170 <= 0x30 ? (v26 = ((1 << (v22 + 86)) & 0x1FF7C7FDF3F55) == 0) : (v26 = 1), v26))
      {
        v27 = -[TXRTextureInfo pixelFormat](self->_textureInfo, "pixelFormat");
        if (v27 <= 551)
        {
          v28 = 1;
          switch(v27)
          {
            case 1:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
              goto LABEL_56;
            case 20:
            case 22:
            case 23:
            case 24:
            case 25:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 40:
            case 41:
            case 42:
            case 43:
              v28 = 2;
              goto LABEL_56;
            case 53:
            case 54:
            case 55:
            case 60:
            case 62:
            case 63:
            case 64:
            case 65:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 80:
            case 81:
            case 90:
            case 91:
            case 92:
            case 93:
              goto LABEL_18;
            case 103:
            case 104:
            case 105:
            case 110:
            case 112:
            case 113:
            case 114:
            case 115:
              goto LABEL_54;
            case 123:
            case 124:
            case 125:
              v28 = 16;
              goto LABEL_56;
            default:
              goto LABEL_59;
          }
        }
        if ((unint64_t)(v27 - 552) < 2)
        {
LABEL_54:
          v28 = 8;
        }
        else if ((unint64_t)(v27 - 554) < 2)
        {
LABEL_18:
          v28 = 4;
        }
        else
        {
          if ((unint64_t)(v27 - 2147483649) >= 2)
LABEL_59:
            pixelBytes_cold_1();
          v28 = 3;
        }
LABEL_56:
        v30 = v28 * v61.i64[1];
        v31 = v61.i64[0] * v17 * v28 * v61.i64[1];
      }
      else
      {
        v24 = -[TXRTextureInfo pixelFormat](self->_textureInfo, "pixelFormat");
        v25 = 17040392;
        switch(v24)
        {
          case 0x82uLL:
          case 0x83uLL:
          case 0x8CuLL:
          case 0x8DuLL:
          case 0xA2uLL:
          case 0xA3uLL:
          case 0xA6uLL:
          case 0xA7uLL:
          case 0xAAuLL:
          case 0xACuLL:
          case 0xB4uLL:
          case 0xB5uLL:
          case 0xB6uLL:
          case 0xB7uLL:
            break;
          case 0x84uLL:
          case 0x85uLL:
          case 0x86uLL:
          case 0x87uLL:
          case 0x8EuLL:
          case 0x8FuLL:
          case 0x96uLL:
          case 0x97uLL:
          case 0x98uLL:
          case 0x99uLL:
          case 0xAEuLL:
          case 0xB0uLL:
          case 0xB2uLL:
          case 0xB3uLL:
          case 0xBAuLL:
          case 0xCCuLL:
            v25 = 17040400;
            break;
          case 0xA0uLL:
          case 0xA1uLL:
          case 0xA4uLL:
          case 0xA5uLL:
            goto LABEL_33;
          case 0xBBuLL:
          case 0xCDuLL:
            v25 = 17040656;
            break;
          case 0xBCuLL:
          case 0xCEuLL:
            v25 = 17106192;
            break;
          case 0xBDuLL:
          case 0xCFuLL:
            v25 = 17106448;
            break;
          case 0xBEuLL:
          case 0xD0uLL:
            v25 = 17171984;
            break;
          case 0xC0uLL:
          case 0xD2uLL:
            v25 = 17106960;
            break;
          case 0xC1uLL:
          case 0xD3uLL:
            v29 = 17171984;
            goto LABEL_24;
          case 0xC2uLL:
          case 0xD4uLL:
            v25 = 17303568;
            break;
          case 0xC3uLL:
          case 0xD5uLL:
            v25 = 17104912;
            break;
          case 0xC4uLL:
          case 0xD6uLL:
            v25 = 17171984;
LABEL_33:
            v25 += 1024;
            break;
          case 0xC5uLL:
          case 0xD7uLL:
            v29 = 17303568;
            goto LABEL_24;
          case 0xC6uLL:
          case 0xD8uLL:
            v25 = 17435152;
            break;
          case 0xC7uLL:
          case 0xD9uLL:
            v29 = 17435152;
LABEL_24:
            v25 = v29 + 512;
            break;
          case 0xC8uLL:
          case 0xDAuLL:
            v25 = 17566736;
            break;
          default:
            +[TXRPixelFormatInfo packedMemoryLayoutForFormat:dimensions:].cold.1();
        }
        v30 = (v61.i64[1] + (unint64_t)((v25 >> 8) & 0xF) - 1) / ((v25 >> 8) & 0xF) * (v25 & 0x18);
        v31 = v30 * ((v61.i64[0] + (unint64_t)(HIWORD(v25) & 0xF) - 1) / (HIWORD(v25) & 0xF));
      }
      v60 = v16;
      v32 = (char *)(v20 + 4);
      v59 = v17;
      if (-[TXRTextureInfo arrayLength](self->_textureInfo, "arrayLength"))
      {
        v66 = v15;
        v33 = 0;
        v34 = 0;
        v74 = v31;
        v35 = v31 * v17;
        v64 = v31 * v17;
        v65 = v30;
        do
        {
          v68 = v33;
          v62 = v34;
          v36 = -[TXRTextureInfo cubemap](self->_textureInfo, "cubemap");
          v37 = 0;
          v38 = 6;
          if (!v36)
            v38 = 1;
          v67 = v38;
          do
          {
            v71 = v32;
            v39 = objc_alloc_init(*(Class *)(v21 + 544));
            v40 = (void *)objc_msgSend(v9, "newBufferWithLength:", v35);
            objc_msgSend(v39, "setBuffer:", v40);

            objc_msgSend(v39, "setOffset:", 0);
            objc_msgSend(v39, "setBytesPerRow:", v30);
            objc_msgSend(v39, "setBytesPerImage:", v74);
            objc_msgSend(v39, "buffer");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "map");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            memcpy((void *)objc_msgSend(v42, "bytes"), v32, v35);
            -[TXRDeferredTextureInfo mipmaps](self->_deferredTextureInfo, "mipmaps");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", v66);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "elements");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndexedSubscript:", v68);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "faces");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", v37);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setInfo:", v39);

            -[TXRDeferredTextureInfo mipmaps](v72->_deferredTextureInfo, "mipmaps");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectAtIndexedSubscript:", v66);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "elements");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", v68);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "faces");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndexedSubscript:", v37);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "signalLoaded");

            self = v72;
            v21 = 0x1E977F000;
            v30 = v65;

            v35 = v64;
            v9 = v63;
            v32 = &v71[v74];
            if (-[TXRTextureInfo cubemap](v72->_textureInfo, "cubemap"))
              v32 = (char *)((unint64_t)(v32 + 3) & 0xFFFFFFFFFFFFFFFCLL);

            ++v37;
          }
          while (v67 != v37);
          v33 = (v62 + 1);
          v55 = -[TXRTextureInfo arrayLength](v72->_textureInfo, "arrayLength");
          v34 = v62 + 1;
        }
        while (v55 > v33);
      }
      v56 = (int8x16_t)vcgtq_u64(v61, (uint64x2_t)vdupq_n_s64(1uLL));
      v61 = (uint64x2_t)vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v61, 1uLL), v56), (int64x2_t)vmvnq_s8(v56));
      if (v59 <= 1)
        v17 = 1;
      else
        v17 = v59 >> 1;
      v20 = (unint64_t)(v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v16 = v60 + 1;
      v15 = (v60 + 1);
    }
    while (-[TXRTextureInfo mipmapLevelCount](self->_textureInfo, "mipmapLevelCount") > v15);
  }

}

- (unint64_t)determineFormatFromType:(unsigned int)a3 format:(unsigned int)a4 internalFormat:(unsigned int)a5 baseInternalFormat:(unsigned int)a6
{
  BOOL v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v7 = v6;
  if (a5 == a4 && (v7 & 1) == 0)
  {
    if ((int)a4 <= 33318)
    {
      v15 = 6403;
      v16 = 12;
      if (a3 != 5120)
        v16 = 0;
      if (a3 == 5121)
        v16 = 10;
      v17 = 70;
      if (a3 != 5121)
        v17 = 0;
      v18 = 80;
      if (a3 != 5121)
        v18 = 0;
      if (a4 != 32993)
        v18 = 0;
      if (a4 == 6408)
        v18 = v17;
    }
    else
    {
      if ((int)a4 <= 36243)
      {
        v8 = 30;
        if (a3 != 5121)
          v8 = 0;
        v9 = 34;
        if (a3 != 5120)
          v9 = 0;
        v10 = 33;
        if (a3 != 5121)
          v10 = v9;
        if (a4 != 33320)
          v10 = 0;
        if (a4 == 33319)
          return v8;
        else
          return v10;
      }
      v15 = 36244;
      v16 = 14;
      if (a3 != 5120)
        v16 = 0;
      if (a3 == 5121)
        v16 = 13;
      v19 = 91;
      if (a3 != 33640)
        v19 = 0;
      if (a4 == 36249)
        v18 = v19;
      else
        v18 = 0;
    }
    if (a4 == v15)
      return v16;
    else
      return v18;
  }
  if (a5 != a4 || ((v7 ^ 1) & 1) != 0)
  {
    v14 = 0;
    while (LOWORD(formatEquivalenceTable[v14 + 1]) != (unsigned __int16)a5)
    {
      v14 += 2;
      if (v14 == 230)
        return 0;
    }
    return formatEquivalenceTable[v14];
  }
  else
  {
    switch(a4)
    {
      case 0x8DBBu:
        v12 = a6 == 6407;
        v13 = 140;
        break;
      case 0x8DBCu:
        v12 = a6 == 6407;
        v13 = 141;
        break;
      case 0x8DBDu:
        v12 = a6 == 6407;
        v13 = 142;
        break;
      case 0x8DBEu:
        v12 = a6 == 6407;
        v13 = 143;
        break;
      default:
        switch(a4)
        {
          case 0x8E8Cu:
            v12 = a6 == 6408;
            v13 = 152;
            goto LABEL_65;
          case 0x8E8Du:
            v12 = a6 == 6408;
            v13 = 153;
            goto LABEL_65;
          case 0x8E8Eu:
            v12 = a6 == 6407;
            v13 = 150;
            goto LABEL_65;
          case 0x8E8Fu:
            v12 = a6 == 6407;
            v13 = 151;
            goto LABEL_65;
          default:
            return 0;
        }
    }
LABEL_65:
    if (v12)
      return v13;
    else
      return 0;
  }
}

- (id)parsedImageAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[TXRDeferredTextureInfo mipmaps](self->_deferredTextureInfo, "mipmaps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "faces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "info");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)exportTexture:(id)a3 url:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unsigned __int16 *v27;
  int v28;
  int v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void *v33;
  id v34;
  FILE *v35;
  int v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const void *v72;
  uint64_t v73;
  int v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  void *v81;
  unint64_t v82;
  void *v83;
  unint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id *v92;
  id v93;
  void *v94;
  unint64_t v95;
  unsigned int v96;
  int v97;
  unsigned int v98;
  void *v99;
  int v100;
  char v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  char v108[32];
  char v109[32];
  char v110[24];
  char v111[16];
  char v112[16];
  char v113[16];
  unint64_t __ptr;
  int v115;
  int v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v118 = 0u;
  v119 = 0u;
  v117 = 0u;
  v115 = 169478669;
  __ptr = 0xBB31312058544BABLL;
  v116 = 67305985;
  objc_msgSend(v7, "dimensions");
  v98 = v9;
  objc_msgSend(v7, "dimensions");
  *(_QWORD *)((char *)&v118 + 4) = __PAIR64__(v10, v98);
  objc_msgSend(v7, "dimensions");
  if (v11 < 2)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v7, "dimensions");
    v13 = v12;
  }
  HIDWORD(v118) = v13;
  objc_msgSend(v7, "mipmapLevels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") <= 1)
  {
    LODWORD(v119) = 0;
  }
  else
  {
    objc_msgSend(v7, "mipmapLevels");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "elements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v119) = objc_msgSend(v19, "count");

  }
  if (objc_msgSend(v7, "cubemap"))
    v20 = 6;
  else
    v20 = 1;
  DWORD1(v119) = v20;
  objc_msgSend(v7, "mipmapLevels");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  DWORD2(v119) = objc_msgSend(v21, "count");

  if (v13 && (_DWORD)v119)
  {
    if (a5)
    {
      _newTXRErrorWithCodeAndErrorString(10, (uint64_t)CFSTR("KTX does not support volume texture arrays"));
      v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
LABEL_43:
    v22 = 0;
    goto LABEL_48;
  }
  v23 = objc_msgSend(v7, "pixelFormat");
  if (v23 == 70)
  {
    v24 = 0;
  }
  else
  {
    v24 = 0;
    v25 = &qword_1D423F660;
    do
    {
      ++v24;
      v26 = *v25;
      v25 += 2;
    }
    while (v26 != v23);
  }
  v27 = (unsigned __int16 *)&formatEquivalenceTable[2 * v24];
  v28 = v27[4];
  DWORD2(v117) = v27[6];
  HIDWORD(v117) = v28;
  LODWORD(v117) = v27[5];
  LODWORD(v118) = v27[7];
  if ((v117 - 5122) > 9)
    v29 = 1;
  else
    v29 = dword_1D423FD80[(__int16)(v117 - 5122)];
  DWORD1(v117) = v29;
  v107 = -559038737;
  strcpy(v113, "KTXorientation");
  strcpy(v112, "S=r,T=d,R=i");
  strcpy(v111, "File Origin");
  strcpy(v110, "Apple TextureIO");
  v105 = 28;
  v106 = 27;
  strcpy(v109, "TextureIO major verison");
  v30 = (char *)malloc_type_malloc(2uLL, 0x306B4C95uLL);
  __sprintf_chk(v30, 0, 2uLL, "%d", 3);
  v104 = 26;
  strcpy(v108, "TextureIO minor verison");
  v31 = (char *)malloc_type_malloc(3uLL, 0xA727BA23uLL);
  v32 = __sprintf_chk(v31, 0, 3uLL, "%d", 10);
  v103 = 27;
  HIDWORD(v119) = 128;
  v33 = (void *)MEMORY[0x1D8259F7C](v32);
  v34 = objc_retainAutorelease(v8);
  v35 = fopen((const char *)objc_msgSend(v34, "fileSystemRepresentation"), "w+");
  objc_autoreleasePoolPop(v33);
  if (!v35)
  {
    if (a5)
    {
      v85 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v34, "absoluteString");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "stringWithFormat:", CFSTR("Cannot create file at %@"), v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      _newTXRErrorWithCodeAndErrorString(4, (uint64_t)v87);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_43;
  }
  v92 = a5;
  v93 = v8;
  fwrite(&__ptr, 0x40uLL, 1uLL, v35);
  fwrite(&v106, 4uLL, 1uLL, v35);
  fwrite(v113, 0xFuLL, 1uLL, v35);
  fwrite(v112, 0xCuLL, 1uLL, v35);
  fwrite(&v107, 1uLL, 1uLL, v35);
  fwrite(&v105, 4uLL, 1uLL, v35);
  fwrite(v111, 0xCuLL, 1uLL, v35);
  fwrite(v110, 0x10uLL, 1uLL, v35);
  fwrite(&v107, 0, 1uLL, v35);
  fwrite(&v104, 4uLL, 1uLL, v35);
  fwrite(v109, 0x18uLL, 1uLL, v35);
  fwrite(v30, 2uLL, 1uLL, v35);
  fwrite(&v107, 2uLL, 1uLL, v35);
  fwrite(&v103, 4uLL, 1uLL, v35);
  fwrite(v108, 0x18uLL, 1uLL, v35);
  fwrite(v31, 3uLL, 1uLL, v35);
  fwrite(&v107, 1uLL, 1uLL, v35);
  objc_msgSend(v7, "dimensions");
  v100 = v36;
  objc_msgSend(v7, "mipmapLevels");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    v39 = 0;
    v40 = 0;
    v41 = v100;
    v94 = v7;
    while (1)
    {
      v95 = v40;
      objc_msgSend(v7, "mipmapLevels");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", v39);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "elements");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "faces");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "bytesPerImage");

      v102 = 0;
      v96 = v41;
      objc_msgSend(v43, "elements");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v41 * v48 * objc_msgSend(v49, "count");
      objc_msgSend(v43, "elements");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "faces");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v50 * objc_msgSend(v53, "count");

      v102 = v54;
      fwrite(&v102, 4uLL, 1uLL, v35);
      objc_msgSend(v43, "elements");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");
      v57 = v119;

      if (v56 != v57)
        break;
      objc_msgSend(v43, "elements");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");

      if (v59)
      {
        v60 = 0;
        v61 = 0;
        v99 = v43;
        do
        {
          v97 = v61;
          objc_msgSend(v43, "elements");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "faces");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (v65)
          {
            v66 = 0;
            v67 = 1;
            do
            {
              objc_msgSend(v63, "faces");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "objectAtIndexedSubscript:", v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v69, "buffer");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "map");
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              v72 = (const void *)objc_msgSend(v71, "bytes");
              v73 = objc_msgSend(v69, "bytesPerImage");
              v74 = v73 * v96;
              fwrite(v72, v73 * v96, 1uLL, v35);
              objc_msgSend(v63, "faces");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v75, "count") <= 1)
              {

              }
              else
              {
                objc_msgSend(v99, "elements");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v76, "count");

                if (v77 == 1)
                {
                  v101 = -(char)v74 & 3;
                  if ((-v74 & 3) != 0)
                    fwrite(&v101, 1uLL, 1uLL, v35);
                }
              }

              v66 = v67;
              objc_msgSend(v63, "faces");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v78, "count");

            }
            while (v79 > v67++);
          }

          v60 = (v97 + 1);
          v43 = v99;
          objc_msgSend(v99, "elements");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v81, "count");

          v61 = v97 + 1;
        }
        while (v82 > v60);
      }

      if (v96 <= 1)
        v41 = 1;
      else
        v41 = v96 >> 1;
      v7 = v94;
      v39 = (v95 + 1);
      objc_msgSend(v94, "mipmapLevels");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "count");

      v40 = v39;
      if (v84 <= v39)
        goto LABEL_40;
    }
    if (v92)
    {
      objc_msgSend(v43, "elements");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "count");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid TXRTexture object: Level 0 has %d array elments but level %d has %d elements"), v119, v95, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      _newTXRErrorWithCodeAndErrorString(5, (uint64_t)v90);
      *v92 = (id)objc_claimAutoreleasedReturnValue();

    }
    fclose(v35);

    v22 = 0;
    v7 = v94;
  }
  else
  {
LABEL_40:
    fclose(v35);
    v22 = 1;
  }
  v8 = v93;
LABEL_48:

  return v22;
}

- (TXRTextureInfo)textureInfo
{
  return self->_textureInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserQueue, 0);
  objc_storeStrong((id *)&self->_deferredTextureInfo, 0);
  objc_storeStrong((id *)&self->_internalSizedFormatLookup, 0);
  objc_storeStrong((id *)&self->_textureInfo, 0);
}

@end
