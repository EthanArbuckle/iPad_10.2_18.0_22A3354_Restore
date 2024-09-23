@implementation PLImageFormat

- (unsigned)formatID
{
  return self->_formatID;
}

+ (PLImageFormat)formatWithID:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  __int16 v15;
  _QWORD v16[5];
  __int16 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  pl_dispatch_once(&formatWithID__onceToken, &__block_literal_global_181);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6068;
  v22 = __Block_byref_object_dispose__6069;
  v23 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__PLImageFormat_formatWithID___block_invoke_183;
  v16[3] = &unk_1E376AA00;
  v16[4] = &v18;
  v17 = v3;
  pl_dispatch_sync(formatWithID__readerWriterQueue, v16);
  if (!v19[5])
  {
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __30__PLImageFormat_formatWithID___block_invoke_2;
    v14[3] = &unk_1E376AA00;
    v14[4] = &v18;
    v15 = v3;
    pl_dispatch_barrier_sync(formatWithID__readerWriterQueue, v14);
    if (!v19[5])
    {
      objc_msgSend(a1, "_syncFormats");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19[5];
      v19[5] = v8;

    }
  }
  PLPhotoKitGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)v19[5], "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEBUG, "PLImageFormat formatWithID returning: %@", buf, 0xCu);

  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return (PLImageFormat *)v12;
}

- (unint64_t)metalPixelFormat
{
  return self->_metalPixelFormat;
}

- (__CFString)colorSpaceName
{
  return self->_colorSpaceName;
}

void __30__PLImageFormat_formatWithID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PLImageFormat *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = (void *)formatWithID__idsToFormats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = -[PLImageFormat initWithFormatID:]([PLImageFormat alloc], "initWithFormatID:", *(unsigned __int16 *)(a1 + 40));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v10)
    {
      v11 = (void *)formatWithID__idsToFormats;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
  }
}

- (PLImageFormat)initWithFormatID:(unsigned __int16)a3
{
  PLImageFormat *v4;
  const __CFString *v5;
  double v6;
  double v7;
  const __CFString *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PLImageFormat *v28;
  uint8_t v30[16];

  v4 = self;
  if ((int)a3 > 3600)
  {
    if ((int)a3 > 4199)
    {
      if ((int)a3 > 8001)
      {
        if ((int)a3 > 9987)
        {
          switch(a3)
          {
            case 0x270Du:
              v6 = *MEMORY[0x1E0C9D820];
              v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
              v5 = CFSTR("FullResolutionPenultimate");
              v13 = 0;
              v14 = 3;
              goto LABEL_139;
            case 0x270Eu:
              v6 = *MEMORY[0x1E0C9D820];
              v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
              v5 = CFSTR("FullResolutionCurrent");
              v13 = 0;
              v14 = 0;
              goto LABEL_139;
            case 0x270Fu:
              v6 = *MEMORY[0x1E0C9D820];
              v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
              v5 = CFSTR("FullResolutionUnadjusted");
              v13 = 0;
              v14 = 1;
              goto LABEL_139;
            case 0x2710u:
              v6 = *MEMORY[0x1E0C9D820];
              v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
              v5 = CFSTR("FullResolutionOriginal");
              v13 = 0;
              v14 = 2;
LABEL_139:
              v19 = 1;
              goto LABEL_147;
            default:
              if (a3 != 9988)
                goto LABEL_166;
              v9 = *MEMORY[0x1E0C9D820];
              v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
              v8 = CFSTR("SubstandardCurrent");
              break;
          }
          goto LABEL_162;
        }
        switch(a3)
        {
          case 0x1F42u:
            v8 = CFSTR("VideoScrubber32Portrait");
            v15 = 32.0;
            v9 = 24.0;
LABEL_107:
            v16 = 1;
LABEL_163:
            v17 = 0;
LABEL_164:
            v28 = -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:", v8, v16, 0, v17, v9, v15);
            goto LABEL_165;
          case 0x1FA5u:
            v8 = CFSTR("VideoScrubber64Landscape");
            v9 = 86.0;
            break;
          case 0x1FA6u:
            v8 = CFSTR("VideoScrubber64Portrait");
            v9 = 48.0;
            break;
          default:
            goto LABEL_166;
        }
        v21 = 0x4050000000000000;
        goto LABEL_106;
      }
      if ((int)a3 > 5000)
      {
        if ((int)a3 > 5004)
        {
          if (a3 != 5005)
          {
            if (a3 != 8001)
              goto LABEL_166;
            v8 = CFSTR("VideoScrubber32Landscape");
            v9 = 43.0;
            v21 = 0x4040000000000000;
            goto LABEL_106;
          }
          v5 = CFSTR("AspectShort360");
          v6 = 360.0;
        }
        else
        {
          if (a3 == 5001)
          {
            v5 = CFSTR("AspectShort128");
            v12 = 0x4060000000000000;
          }
          else
          {
            if (a3 != 5003)
              goto LABEL_166;
            v5 = CFSTR("AspectShort256");
            v12 = 0x4070000000000000;
          }
          v6 = *(double *)&v12;
        }
        v7 = v6;
        v13 = 0;
        v14 = 0;
        v19 = 0;
        v20 = 3;
LABEL_127:
        v26 = 2;
        goto LABEL_159;
      }
      if ((int)a3 <= 4530)
      {
        if (a3 == 4200)
        {
          v8 = CFSTR("WildcatCachedStackedImageHiDPI");
          v9 = 420.0;
        }
        else
        {
          if (a3 != 4300)
            goto LABEL_166;
          v8 = CFSTR("PhotoStreamDerivedSize");
          v9 = 1536.0;
        }
LABEL_161:
        v15 = v9;
        goto LABEL_162;
      }
      if (a3 == 4531)
      {
        v5 = CFSTR("AspectLong120_ASTC");
        v24 = 0x405E000000000000;
LABEL_156:
        v6 = *(double *)&v24;
LABEL_157:
        v7 = v6;
        v13 = 0;
        v14 = 0;
        v19 = 0;
        v20 = 2;
        goto LABEL_158;
      }
      if (a3 != 4532)
        goto LABEL_166;
      v5 = CFSTR("AspectLong120_BC7");
      v11 = 0x405E000000000000;
    }
    else
    {
      if ((int)a3 > 4028)
      {
        switch(a3)
        {
          case 0xFBDu:
            v5 = CFSTR("AspectLong180Table_ASTC");
            v6 = 180.0;
            goto LABEL_157;
          case 0xFBEu:
            v5 = CFSTR("AspectLong180Table");
            v6 = 180.0;
            goto LABEL_63;
          case 0xFBFu:
            v5 = CFSTR("AspectLong120");
            v18 = 0x405E000000000000;
            goto LABEL_62;
          case 0xFC0u:
            v5 = CFSTR("AspectLong32");
            v18 = 0x4040000000000000;
            goto LABEL_62;
          case 0xFC1u:
          case 0xFC2u:
          case 0xFC6u:
          case 0xFC7u:
            goto LABEL_166;
          case 0xFC3u:
            v5 = CFSTR("FullSize1536");
            v27 = 0x4098000000000000;
            goto LABEL_146;
          case 0xFC4u:
            v5 = CFSTR("FullSize768");
            v27 = 0x4088000000000000;
            goto LABEL_146;
          case 0xFC5u:
            v5 = CFSTR("FullSize3072");
            v27 = 0x40A8000000000000;
LABEL_146:
            v6 = *(double *)&v27;
            v7 = *(double *)&v27;
            v13 = 0;
            v14 = 0;
            v19 = 0;
            break;
          case 0xFC8u:
            v8 = CFSTR("WildcatStack");
            v9 = 166.0;
            goto LABEL_161;
          default:
            switch(a3)
            {
              case 0x1023u:
                v5 = CFSTR("AspectLong240");
                v6 = 240.0;
LABEL_85:
                v7 = v6;
                v13 = 0;
                v14 = 0;
                v19 = 0;
                v20 = 2;
                goto LABEL_127;
              case 0x1024u:
                v5 = CFSTR("AspectLong64");
                v18 = 0x4050000000000000;
                goto LABEL_62;
              case 0x1025u:
                v5 = CFSTR("AspectLong64_BC7");
                v11 = 0x4050000000000000;
                goto LABEL_153;
              case 0x1026u:
                v5 = CFSTR("AspectLong64_ASTC");
                v24 = 0x4050000000000000;
                goto LABEL_156;
              case 0x1027u:
              case 0x1028u:
              case 0x1029u:
              case 0x102Au:
              case 0x102Bu:
                goto LABEL_166;
              case 0x102Cu:
                v8 = CFSTR("WildcatStackHiDPI");
                v9 = 332.0;
                goto LABEL_161;
              default:
                if (a3 != 4100)
                  goto LABEL_166;
                v8 = CFSTR("WildcatCachedStackedImage");
                v9 = 210.0;
                break;
            }
            goto LABEL_161;
        }
LABEL_147:
        v20 = 4;
        v26 = 0;
        goto LABEL_159;
      }
      if ((int)a3 > 4006)
      {
        switch(a3)
        {
          case 0xFA7u:
            v8 = CFSTR("FullScreen");
            break;
          case 0xFA9u:
            v8 = CFSTR("FilledScreen");
            break;
          case 0xFABu:
            v8 = CFSTR("FilledHalfScreen");
            break;
          default:
            goto LABEL_166;
        }
        v9 = -1.0;
        v15 = -1.0;
        v16 = 0;
        v17 = 1;
        goto LABEL_164;
      }
      if (a3 == 3601)
      {
        v5 = CFSTR("AspectLong160Table");
        v18 = 0x4064000000000000;
LABEL_62:
        v6 = *(double *)&v18;
LABEL_63:
        v7 = v6;
        v13 = 0;
        v14 = 0;
        v19 = 0;
        v20 = 2;
LABEL_124:
        v26 = 1;
        goto LABEL_159;
      }
      if (a3 != 3602)
        goto LABEL_166;
      v5 = CFSTR("AspectLong160Table_BC7");
      v11 = 0x4064000000000000;
    }
LABEL_153:
    v6 = *(double *)&v11;
    v7 = *(double *)&v11;
    v13 = 0;
    v14 = 0;
    v19 = 0;
    v20 = 2;
    goto LABEL_154;
  }
  if ((int)a3 > 3300)
  {
    if ((int)a3 <= 3354)
    {
      switch(a3)
      {
        case 0xCE5u:
          v5 = CFSTR("Square16");
          v6 = 16.0;
          v7 = 16.0;
          goto LABEL_123;
        case 0xCE6u:
        case 0xCECu:
        case 0xCF0u:
        case 0xCF1u:
        case 0xCF5u:
        case 0xCF6u:
        case 0xCF8u:
        case 0xCF9u:
        case 0xCFAu:
        case 0xCFBu:
        case 0xCFDu:
        case 0xCFEu:
        case 0xCFFu:
        case 0xD00u:
        case 0xD01u:
        case 0xD02u:
        case 0xD03u:
        case 0xD04u:
        case 0xD05u:
        case 0xD07u:
        case 0xD08u:
        case 0xD09u:
        case 0xD0Au:
          goto LABEL_166;
        case 0xCE7u:
          v5 = CFSTR("Square22");
          v6 = 22.0;
          v7 = 22.0;
          goto LABEL_123;
        case 0xCE8u:
          v5 = CFSTR("Square25");
          v6 = 25.0;
          v7 = 25.0;
          goto LABEL_123;
        case 0xCE9u:
          v5 = CFSTR("Square32");
          v25 = 0x4040000000000000;
          goto LABEL_121;
        case 0xCEAu:
          v5 = CFSTR("Square39");
          v6 = 39.0;
          goto LABEL_122;
        case 0xCEBu:
          v5 = CFSTR("Square40_ASTC");
          v22 = 0x4044000000000000;
          break;
        case 0xCEDu:
          v5 = CFSTR("Square64");
          v25 = 0x4050000000000000;
          goto LABEL_121;
        case 0xCEEu:
          v5 = CFSTR("Square75");
          v6 = 75.0;
          goto LABEL_122;
        case 0xCEFu:
          v5 = CFSTR("Square78");
          v6 = 78.0;
          goto LABEL_122;
        case 0xCF2u:
          v5 = CFSTR("Square125");
          v6 = 125.0;
          goto LABEL_122;
        case 0xCF3u:
          v5 = CFSTR("Square128");
          v25 = 0x4060000000000000;
LABEL_121:
          v6 = *(double *)&v25;
LABEL_122:
          v7 = v6;
LABEL_123:
          v13 = 1;
          v14 = 0;
          v19 = 0;
          v20 = 1;
          goto LABEL_124;
        case 0xCF4u:
          v5 = CFSTR("Square128_ASTC");
          v22 = 0x4060000000000000;
          break;
        case 0xCF7u:
          v5 = CFSTR("Square157");
          v6 = 157.0;
          v7 = 157.0;
          v13 = 1;
          v14 = 0;
          v19 = 0;
          v20 = 1;
          goto LABEL_127;
        case 0xCFCu:
          v5 = CFSTR("Square124_ASTC");
          v22 = 0x405F000000000000;
          break;
        case 0xD06u:
          v5 = CFSTR("Square24_ASTC");
          v6 = 24.0;
          v7 = 24.0;
          goto LABEL_132;
        case 0xD0Bu:
          v5 = CFSTR("Square64_ASTC");
          v22 = 0x4050000000000000;
          break;
        default:
          if (a3 != 3350)
            goto LABEL_166;
          v5 = CFSTR("Square76_ASTC");
          v22 = 0x4053000000000000;
          break;
      }
LABEL_131:
      v6 = *(double *)&v22;
      v7 = *(double *)&v22;
LABEL_132:
      v13 = 1;
      v14 = 0;
      v19 = 0;
      v20 = 1;
LABEL_158:
      v26 = 3;
      goto LABEL_159;
    }
    switch(a3)
    {
      case 0xDADu:
        v5 = CFSTR("AspectLong132");
        v6 = 132.0;
        goto LABEL_85;
      case 0xDAEu:
      case 0xDB0u:
      case 0xDB2u:
        goto LABEL_166;
      case 0xDAFu:
        v5 = CFSTR("AspectLong180");
        v6 = 180.0;
        goto LABEL_85;
      case 0xDB1u:
        v5 = CFSTR("AspectLong264");
        v6 = 264.0;
        goto LABEL_85;
      case 0xDB3u:
        v5 = CFSTR("AspectLong360");
        v6 = 360.0;
        goto LABEL_85;
      default:
        if (a3 == 3355)
        {
          v5 = CFSTR("Square32_ASTC");
          v22 = 0x4040000000000000;
          goto LABEL_131;
        }
        if (a3 != 3356)
          goto LABEL_166;
        v5 = CFSTR("Square32_BC7");
        v6 = 32.0;
        v7 = 32.0;
        v13 = 1;
        v14 = 0;
        v19 = 0;
        v20 = 1;
        break;
    }
LABEL_154:
    v26 = 4;
LABEL_159:
    v28 = -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:", v5, v13, v14, v19, v20, v26, v6, v7);
LABEL_165:
    v4 = v28;
LABEL_166:
    if (v4)
      v4->_formatID = a3;
    return v4;
  }
  if ((int)a3 > 3033)
  {
    if ((int)a3 <= 3140)
    {
      switch(a3)
      {
        case 0xBDAu:
          v8 = CFSTR("PosterThumbnail");
          v9 = 55.0;
          break;
        case 0xBDFu:
          v8 = CFSTR("LowResFullScreen");
          v9 = 160.0;
          v10 = 0x405E000000000000;
LABEL_100:
          v15 = *(double *)&v10;
LABEL_162:
          v16 = 0;
          goto LABEL_163;
        case 0xBE1u:
          v8 = CFSTR("Square79Baked");
          v9 = 79.0;
          break;
        default:
          goto LABEL_166;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 3211)
    {
      if (a3 == 3141)
      {
        v8 = CFSTR("Square158Baked");
        v9 = 158.0;
      }
      else
      {
        if (a3 != 3143)
          goto LABEL_166;
        v8 = CFSTR("PosterThumbnailHiDPI");
        v9 = 110.0;
      }
LABEL_103:
      v15 = v9;
      goto LABEL_107;
    }
    if (a3 == 3212)
    {
      v8 = CFSTR("VideoScrubberLandscapeHiDPI");
      v9 = 78.0;
    }
    else
    {
      if (a3 != 3213)
        goto LABEL_166;
      v8 = CFSTR("VideoScrubberPortraitHiDPI");
      v9 = 44.0;
    }
    v21 = 0x404D000000000000;
LABEL_106:
    v15 = *(double *)&v21;
    goto LABEL_107;
  }
  if ((int)a3 > 1095)
  {
    if ((int)a3 > 3011)
    {
      if (a3 != 3012)
      {
        if (a3 != 3013)
          goto LABEL_166;
        v8 = CFSTR("VideoScrubberPortrait");
        v9 = 22.0;
        v15 = 29.0;
        goto LABEL_107;
      }
      v8 = CFSTR("VideoScrubberLandscape");
      v9 = 39.0;
    }
    else
    {
      if (a3 != 1096)
      {
        if (a3 != 3010)
          goto LABEL_166;
        v8 = CFSTR("LowResFullScreenPortrait");
        v9 = 120.0;
        v10 = 0x4064000000000000;
        goto LABEL_100;
      }
      v8 = CFSTR("ThumbnailHiDPI");
      v9 = 150.0;
    }
    goto LABEL_103;
  }
  if (a3)
  {
    if (a3 == 901)
    {
      v8 = CFSTR("FaceThumbnail");
      v9 = 132.0;
    }
    else
    {
      if (a3 != 1095)
        goto LABEL_166;
      v8 = CFSTR("Thumbnail");
      v9 = 75.0;
    }
    goto LABEL_103;
  }
  PLImageManagerGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_199DF7000, v23, OS_LOG_TYPE_DEBUG, "Creating an image format with an unknown type is an error", v30, 2u);
  }

  return 0;
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7 formatMode:(int64_t)a8 thumbnailKind:(int64_t)thumbnailKind
{
  double height;
  double width;
  id v18;
  PLImageFormat *v19;
  PLImageFormat *v20;
  uint64_t v21;
  NSString *name;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  objc_class *v28;
  void *v30;
  objc_super v31;

  height = a4.height;
  width = a4.width;
  v18 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PLImageFormat;
  v19 = -[PLImageFormat init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_formatID = 0;
    v21 = objc_msgSend(v18, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v20->_size.width = width;
    v20->_size.height = height;
    v20->_isCropped = a5;
    v20->_thumbnailKind = thumbnailKind;
    v20->_formatMode = a8;
    v20->_dimension = width;
    v20->_version = a6;
    v20->_isAlwaysFullScreen = a7;
    if (thumbnailKind && (unint64_t)(a8 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("PLImageFormat.m"), 155, CFSTR("Thumbnail image formats must be either square, aspect short, or aspect long"));

      thumbnailKind = v20->_thumbnailKind;
    }
    if ((unint64_t)(thumbnailKind - 3) <= 1)
    {
      v24 = (int)width + 3;
      v25 = v24 <= 0 ? -(-v24 & 3) : v24 & 3;
      if (width != (double)(v24 - v25)
        || ((v26 = (int)height + 3, v26 <= 0) ? (v27 = -(-v26 & 3)) : (v27 = v26 & 3), height != (double)(v26 - v27)))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("PLImageFormat.m"), 158, CFSTR("ASTC/BC7 format dimensions must be in even multiples of 4."));

      }
    }
    v28 = -[PLImageFormat _tableClass](v20, "_tableClass");
    v20->_metalPixelFormat = -[objc_class metalPixelFormat](v28, "metalPixelFormat");
    v20->_colorSpaceName = (__CFString *)-[objc_class colorSpaceName](v28, "colorSpaceName");
  }

  return v20;
}

- (Class)_tableClass
{
  int64_t thumbnailKind;
  void *v3;

  thumbnailKind = self->_thumbnailKind;
  if (thumbnailKind == 1 || thumbnailKind == 4 || thumbnailKind == 3)
    v3 = (void *)objc_opt_class();
  else
    v3 = 0;
  return (Class)v3;
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5 version:(int64_t)a6 isAlwaysFullScreen:(BOOL)a7
{
  return -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:formatMode:thumbnailKind:", a3, a5, a6, a7, 0, 0, a4.width, a4.height);
}

- (BOOL)isThumbnail
{
  return self->_thumbnailKind > 0;
}

- (id)createTableWithPath:(id)a3 readOnly:(BOOL)a4 format:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(-[PLImageFormat _tableClass](self, "_tableClass")), "initWithPath:readOnly:format:", v9, v5, v8);

  return v10;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)tableFormatBytesPerRowForWidth:(int)a3
{
  unint64_t v4;
  int v5;

  v4 = -[PLImageFormat tableFormatBytesPerPixel](self, "tableFormatBytesPerPixel");
  if (a3 + 7 <= 0)
    v5 = -(-(a3 + 7) & 7);
  else
    v5 = (a3 + 7) & 7;
  return v4 * (a3 + 7 - v5);
}

- (unint64_t)tableFormatBytesPerPixel
{
  int64_t v2;

  v2 = -[PLImageFormat thumbnailKind](self, "thumbnailKind");
  if ((unint64_t)(v2 - 1) > 3)
    return 0;
  else
    return qword_199EB0BB8[v2 - 1];
}

- (int64_t)thumbnailKind
{
  return self->_thumbnailKind;
}

- (BOOL)isCropped
{
  return self->_isCropped;
}

- (BOOL)isSquare
{
  return self->_formatMode == 1;
}

- (BOOL)isTable
{
  return (self->_thumbnailKind < 5uLL) & (0x1Au >> self->_thumbnailKind);
}

- (BOOL)_isAcceptableForViewSize:(CGSize)a3 contentMode:(int64_t)a4 sourceAspectRatio:(double)a5 desiredImageSize:(CGSize)a6 demoteFactor:(double)a7
{
  double height;
  double width;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL result;
  double v23;
  double v24;

  height = a6.height;
  width = a6.width;
  v11 = a3.height;
  v12 = a3.width;
  v14 = 1.0 / a5;
  if (a5 <= 1.0)
    v15 = a5;
  else
    v15 = 1.0 / a5;
  if (a5 > 1.0)
    v14 = a5;
  if (a4 == 1)
    v16 = v15;
  else
    v16 = v14;
  switch(-[PLImageFormat formatMode](self, "formatMode", v14))
  {
    case 0:
      -[PLImageFormat dimension](self, "dimension");
      goto LABEL_26;
    case 1:
      -[PLImageFormat dimension](self, "dimension");
      result = 0;
      if (a4 != 1 || v12 != v11)
        return result;
      goto LABEL_26;
    case 2:
      -[PLImageFormat dimension](self, "dimension");
      v19 = 1.0;
      if (a4 == 1)
        v19 = v15;
      v17 = v18 * v19;
      goto LABEL_26;
    case 3:
      -[PLImageFormat dimension](self, "dimension");
      if (a4 == 1)
        goto LABEL_26;
      v20 = 5.0;
LABEL_24:
      v21 = fmin(v16, v20);
      break;
    case 4:
      -[PLImageFormat dimension](self, "dimension");
      v20 = 2.66666667;
      if (a4 != 1)
        goto LABEL_24;
      v21 = v16 * 2.66666667;
      if (v16 * 2.66666667 > 1.0)
        v21 = 1.0;
      break;
    default:
      v17 = 0.0;
      goto LABEL_26;
  }
  v17 = v21 * v17;
LABEL_26:
  if (width >= height)
    v23 = height;
  else
    v23 = width;
  if (width >= height)
    v24 = width;
  else
    v24 = height;
  if (a4 != 1)
    v23 = v24;
  return v23 < (a7 + 1.0) * v17;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  int64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  v4 = a3;
  -[PLImageFormat dimension](self, "dimension");
  v6 = v5;
  objc_msgSend(v4, "dimension");
  if (v6 <= 0.0 || v7 <= 0.0)
  {
    v10 = -[PLImageFormat formatID](self, "formatID");
    v11 = objc_msgSend(v4, "formatID");
    if (v10 >= v11)
      v12 = 0;
    else
      v12 = -1;
    if (v10 <= v11)
      v9 = v12;
    else
      v9 = 1;
  }
  else
  {
    v8 = -1;
    if (v6 >= v7)
      v8 = 0;
    if (v6 <= v7)
      v9 = v8;
    else
      v9 = 1;
  }

  return v9;
}

- (double)dimension
{
  return self->_dimension;
}

- (int64_t)formatMode
{
  return self->_formatMode;
}

void __30__PLImageFormat_formatWithID___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.photos.PLImageFormat", MEMORY[0x1E0C80D50]);
  v1 = (void *)formatWithID__readerWriterQueue;
  formatWithID__readerWriterQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)formatWithID__idsToFormats;
  formatWithID__idsToFormats = (uint64_t)v2;

}

- (BOOL)_canDegradeToFormat:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[PLImageFormat isSquare](self, "isSquare") && (objc_msgSend(v4, "isSquare") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if (-[PLImageFormat isSquare](self, "isSquare"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "isSquare") ^ 1;
  }

  return v5;
}

- (PLImageFormat)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[PLAssetFormat init] unsupported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PLImageFormat)initWithName:(id)a3 size:(CGSize)a4 isCropped:(BOOL)a5
{
  return -[PLImageFormat initWithName:size:isCropped:version:isAlwaysFullScreen:](self, "initWithName:size:isCropped:version:isAlwaysFullScreen:", a3, a5, 0, 0, a4.width, a4.height);
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04lu-%@"), self->_formatID, self->_name);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLImageFormat;
  -[PLImageFormat description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImageFormat shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImageFormat dimension](self, "dimension");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - %@, %f"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToFormat:(id)a3
{
  id v4;
  void *v5;
  int formatID;
  BOOL v7;
  BOOL v8;
  double v9;
  double v10;
  BOOL v11;
  double dimension;
  double v13;
  int isCropped;
  int64_t formatMode;
  int64_t thumbnailKind;
  int isAlwaysFullScreen;
  int64_t version;

  v4 = a3;
  v5 = v4;
  if (self->_formatID)
  {
    formatID = self->_formatID;
    v7 = formatID == objc_msgSend(v4, "formatID");
  }
  else
  {
    objc_msgSend(v4, "size");
    v11 = self->_size.width == v10 && self->_size.height == v9;
    if (!v11
      || (dimension = self->_dimension, objc_msgSend(v5, "dimension"), dimension != v13)
      || (isCropped = self->_isCropped, isCropped != objc_msgSend(v5, "isCropped"))
      || (formatMode = self->_formatMode, formatMode != objc_msgSend(v5, "formatMode"))
      || (thumbnailKind = self->_thumbnailKind, thumbnailKind != objc_msgSend(v5, "thumbnailKind"))
      || (isAlwaysFullScreen = self->_isAlwaysFullScreen,
          isAlwaysFullScreen != objc_msgSend(v5, "isAlwaysFullScreen")))
    {
      v8 = 0;
      goto LABEL_18;
    }
    version = self->_version;
    v7 = version == objc_msgSend(v5, "version");
  }
  v8 = v7;
LABEL_18:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PLImageFormat *v4;
  BOOL v5;

  v4 = (PLImageFormat *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PLImageFormat isEqualToFormat:](self, "isEqualToFormat:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_formatID;
}

- (BOOL)refersToLatestVersion
{
  return self->_version == 0;
}

- (BOOL)refersToUnadjustedVersion
{
  return (unint64_t)(self->_version - 1) < 2;
}

- (BOOL)refersToPenultimateVersion
{
  return self->_version == 3;
}

- (BOOL)refersToOriginalVersion
{
  return self->_version == 2;
}

- (BOOL)dimensionsReferToShortSide
{
  return (self->_formatMode & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (unint64_t)fullSizeDesiredLongSide
{
  void *v4;

  if (self->_formatID - 4035 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageFormat.m"), 643, CFSTR("Passed a format that isn't a full size format"));

  }
  return (unint64_t)(self->_size.width / 0.75);
}

- (unint64_t)fullSizeMinShortSide
{
  void *v4;

  if (self->_formatID - 4035 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageFormat.m"), 657, CFSTR("Passed a format that isn't a full size format"));

  }
  return (unint64_t)self->_size.width;
}

- (unint64_t)fullSizeMaxLongSide
{
  return 2 * -[PLImageFormat fullSizeDesiredLongSide](self, "fullSizeDesiredLongSide");
}

- (CGSize)_shortSideFormatScaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4
{
  double width;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  width = self->_size.width;
  if (width < self->_size.height)
    width = self->_size.height;
  if (a4)
    v5 = 5 * (int)width;
  else
    v5 = 0x7FFFFFFFLL;
  v6 = PLScaleDimensionsForThumbnailCore((int)width, (int)width, v5, 2, (uint64_t)a3.width, (uint64_t)a3.height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)scaledSizeForSourceSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = PLScaledSizeWithinSizeCore(a3.width, a3.height, self->_size.width, self->_size.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)scaledSizeForSourceSize:(CGSize)a3 capLength:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double v8;
  double v9;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  if (-[PLImageFormat dimensionsReferToShortSide](self, "dimensionsReferToShortSide"))
    -[PLImageFormat _shortSideFormatScaledSizeForSourceSize:capLength:](self, "_shortSideFormatScaledSizeForSourceSize:capLength:", v4, width, height);
  else
    -[PLImageFormat scaledSizeForSourceSize:](self, "scaledSizeForSourceSize:", width, height);
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)thumbnailSpecification
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("cropMode");
  if (self->_isCropped)
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("width");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("height");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_thumbnailKind);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("bpp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[PLImageFormat tableFormatBytesPerPixel](self, "tableFormatBytesPerPixel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("formatID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PLImageFormat formatID](self, "formatID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setFormatID:(unsigned __int16)a3
{
  self->_formatID = a3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isAlwaysFullScreen
{
  return self->_isAlwaysFullScreen;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)_syncFormats
{
  pl_dispatch_once(&_syncFormats_onceToken, &__block_literal_global_6074);
  return (id)_syncFormats_syncFormats;
}

void __30__PLImageFormat_formatWithID___block_invoke_183(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)formatWithID__idsToFormats;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __29__PLImageFormat__syncFormats__block_invoke()
{
  id v0;
  void *v1;
  uint64_t (*v2)(const __CFString *);
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  _BOOL8 v17;
  PLImageFormat *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = dlopen("/usr/lib/libMobileCheckpoint.dylib", 1);
  v2 = (uint64_t (*)(const __CFString *))dlsym(v1, "MCCopyCheckpointValue");
  v3 = (void *)v2(CFSTR("ImageSpecifications"));
  if (v3
    || (objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/Checkpoint.xml")), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "objectForKey:", CFSTR("ImageSpecifications")), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4, v3))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 1;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        v23 = v8;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v5);
          if ((v8 & 1) == 0)
          {
            v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
            objc_msgSend(v11, "objectForKey:", CFSTR("RenderWidth"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (double)(int)objc_msgSend(v12, "intValue");
            objc_msgSend(v11, "objectForKey:", CFSTR("RenderHeight"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (double)(int)objc_msgSend(v14, "intValue");

            objc_msgSend(v11, "objectForKey:", CFSTR("Crop"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (int)objc_msgSend(v16, "intValue") > 0;

            v18 = -[PLImageFormat initWithName:size:isCropped:]([PLImageFormat alloc], "initWithName:size:isCropped:", CFSTR("?"), v17, v13, v15);
            objc_msgSend(v11, "objectForKey:", CFSTR("FormatId"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLImageFormat setFormatID:](v18, "setFormatID:", (unsigned __int16)objc_msgSend(v19, "intValue"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PLImageFormat formatID](v18, "formatID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v0, "setObject:forKeyedSubscript:", v18, v20);

          }
          LOBYTE(v8) = v8 ^ 1;
          ++v10;
        }
        while (v7 != v10);
        v8 = v23 ^ v7;
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v7);
    }

  }
  v21 = objc_msgSend(v0, "copy");
  v22 = (void *)_syncFormats_syncFormats;
  _syncFormats_syncFormats = v21;

}

@end
