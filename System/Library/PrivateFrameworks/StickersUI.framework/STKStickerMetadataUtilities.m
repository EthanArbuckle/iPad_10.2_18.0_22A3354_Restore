@implementation STKStickerMetadataUtilities

+ (id)encodeImageData:(id)a3 withStickerEffectType:(unint64_t)a4
{
  CGImageSourceRef v6;
  void *v7;

  v6 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  objc_msgSend(a1, "encodeCGImageSource:withStickerEffectType:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFRelease(v6);
  return v7;
}

+ (id)encodeImage:(id)a3 withStickerEffectType:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "encodeCGImage:withStickerEffectType:", objc_msgSend(objc_retainAutorelease(a3), "CGImage"), a4);
}

+ (id)encodeCGImage:(CGImage *)a3 withStickerEffectType:(unint64_t)a4
{
  CGDataProvider *DataProvider;
  CGImageSourceRef v7;
  void *v8;

  DataProvider = CGImageGetDataProvider(a3);
  v7 = CGImageSourceCreateWithDataProvider(DataProvider, 0);
  objc_msgSend(a1, "encodeCGImageSource:withStickerEffectType:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFRelease(v7);
  return v8;
}

+ (id)encodeCGImageSource:(CGImageSource *)a3 withStickerEffectType:(unint64_t)a4
{
  const CGImageMetadata *v7;
  const CGImageMetadata *v8;
  const CGImageMetadata *MutableCopy;
  void *v10;
  CGImageMetadataTag *v11;
  __CFData *Mutable;
  __CFString *v13;
  CGImageDestination *v14;
  CGImage *ImageAtIndex;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[8];
  CFErrorRef err;

  v7 = CGImageSourceCopyMetadataAtIndex(a3, 0, 0);
  if (v7)
  {
    v8 = v7;
    MutableCopy = CGImageMetadataCreateMutableCopy(v7);
    CFRelease(v8);
  }
  else
  {
    MutableCopy = CGImageMetadataCreateMutable();
  }
  err = 0;
  objc_msgSend(a1, "stringFromStickerEffectType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, CFSTR("http://ns.apple.com/Stickers/1.0/"), CFSTR("stickerEffect"), &err))
  {
    v11 = CGImageMetadataTagCreate(CFSTR("http://ns.apple.com/Stickers/1.0/"), CFSTR("stickerEffect"), CFSTR("stickerEffect"), kCGImageMetadataTypeString, v10);
    Mutable = 0;
    if (CGImageMetadataSetTagWithPath(MutableCopy, 0, CFSTR("stickerEffect:type"), v11))
    {
      Mutable = CFDataCreateMutable(0, 0);
      objc_msgSend((id)*MEMORY[0x24BDF83E8], "identifier");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = CGImageDestinationCreateWithData(Mutable, v13, 1uLL, 0);

      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
      CGImageDestinationAddImageAndMetadata(v14, ImageAtIndex, MutableCopy, 0);
      CGImageDestinationFinalize(v14);
      if (ImageAtIndex)
        CFRelease(ImageAtIndex);
      if (v14)
        CFRelease(v14);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_247A2B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully added sticker metadata", v17, 2u);
      }
    }
    if (v11)
      CFRelease(v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247A2B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to crate XMP Tag for sticker metadata", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_247A2B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to set XMP Tag for sticker metadata", v18, 2u);
    }
    Mutable = 0;
  }
  if (MutableCopy)
    CFRelease(MutableCopy);

  return Mutable;
}

+ (unint64_t)stickerEffectTypeFromImageData:(id)a3
{
  CGImageSource *v4;
  const CGImageMetadata *v5;
  const CGImageMetadata *v6;
  CGImageMetadataTag *v7;
  CGImageMetadataTag *v8;
  CFTypeRef v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  uint8_t v15[16];
  uint8_t buf[2];
  __int16 v17;

  v4 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  v5 = CGImageSourceCopyMetadataAtIndex(v4, 0, 0);
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_247A2B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unable to get metadata object while trying to get sticker effect type", v15, 2u);
    }
    v10 = 0;
    if (v4)
      goto LABEL_16;
    return v10;
  }
  v6 = v5;
  v7 = CGImageMetadataCopyTagWithPath(v5, 0, CFSTR("stickerEffect:type"));
  if (v7)
  {
    v8 = v7;
    v9 = CGImageMetadataTagCopyValue(v7);
    CFRelease(v8);
    if (v9)
    {
      v10 = objc_msgSend(a1, "stickerEffectTypeFromString:", v9);
      CFRelease(v9);
      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Metadata exists, but no value found for sticker effect type";
      v13 = buf;
      goto LABEL_13;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "Unable to get metadata tag for sticker effect type";
    v13 = (uint8_t *)&v17;
LABEL_13:
    _os_log_impl(&dword_247A2B000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
  }
  v10 = 0;
LABEL_15:
  CFRelease(v6);
  if (v4)
LABEL_16:
    CFRelease(v4);
  return v10;
}

+ (id)stringFromStickerEffectType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("none");
  else
    return (id)*((_QWORD *)&off_251918AA8 + a3 - 1);
}

+ (unint64_t)stickerEffectTypeFromString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("stroke")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("comic")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("puffy")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("iridescent")))
  {
    v6 = 4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)playSettlingAnimation:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "playSettlingAnimation");

}

+ (void)clearCachedPreviewsForStickerView:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "clearCachedPreviewsForCurrentSticker");

}

+ (void)setBoundsIncludeStroke:(BOOL)a3 effectView:(id)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setBoundsIncludeStroke:", v4);

}

+ (int64_t)effectTypeForStickerEffectView:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(v3, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "effect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)stickerEffect:(id)a3 applyWithWideStrokeToImage:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) != 0)
    objc_msgSend(v7, "setForceSmallStrokeRadiusMultiplier:", 1);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__STKStickerMetadataUtilities_stickerEffect_applyWithWideStrokeToImage_completion___block_invoke;
  v13[3] = &unk_251918A88;
  v16 = v10 & 1;
  v14 = v7;
  v15 = v9;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v12, "applyToImage:completion:", v8, v13);

}

void __83__STKStickerMetadataUtilities_stickerEffect_applyWithWideStrokeToImage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setForceSmallStrokeRadiusMultiplier:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
