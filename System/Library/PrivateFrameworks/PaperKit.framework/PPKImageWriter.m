@implementation PPKImageWriter

+ (id)log
{
  objc_opt_self();
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_1);
  return (id)log__sharedLog;
}

void __21__PPKImageWriter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PaperKit", "image-writer");
  v1 = (void *)log__sharedLog;
  log__sharedLog = (uint64_t)v0;

}

- (void)writeUsingBaseImageData:(uint64_t)a3 annotationImage:(uint64_t)a4 asImageOfType:(uint64_t)a5 toConsumer:(uint64_t)a6 annotationMetadata:(uint64_t)a7 modifiedImageDescription:(char)a8 encryptPrivateMetadata:(uint64_t)a9 error:
{
  uint64_t v9;

  if (result)
  {
    LOBYTE(v9) = a8;
    return (void *)objc_msgSend(result, "writeUsingBaseImage:annotationImage:asImageOfType:toConsumer:annotationMetadata:modifiedImageDescription:encryptPrivateMetadata:error:", a2, a3, a4, a5, a6, a7, v9, a9);
  }
  return result;
}

- (BOOL)writeUsingBaseImage:(id)a3 annotationImage:(CGImage *)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 annotationMetadata:(id)a7 modifiedImageDescription:(id)a8 encryptPrivateMetadata:(BOOL)a9 error:(id *)a10
{
  const __CFURL *v16;
  __CFString **v17;
  CGImageSourceRef v18;
  CGImageSource *v19;
  const __CFDictionary *v20;
  CFDictionaryRef v21;
  const CGImageMetadata *v22;
  const CGImageMetadata *v23;
  _BOOL4 v24;
  CGImageMetadata *Mutable;
  __CFString *v26;
  __CFString *v27;
  CGImage *v28;
  CGImageDestination *v29;
  void *v30;
  void *v31;
  void *v32;
  CGImageMetadataTag *v33;
  __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  NSObject *v38;
  size_t Width;
  size_t Height;
  void *v41;
  void *v42;
  uint64_t (*v43)(CGImageMetadata *, id, CFErrorRef *);
  __CFString *v44;
  BOOL v45;
  BOOL v46;
  NSObject *v47;
  _BOOL4 v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  NSObject *v52;
  char v53;
  PPKImageWriter *v55;
  const __CFURL *v56;
  __CFString *type;
  id v58;
  id v59;
  CGImageRef cf;
  __CFString *name;
  CFDictionaryRef options;
  CFErrorRef v63;
  CFErrorRef err;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  __int128 buf;
  void *(*v72)(uint64_t);
  void *v73;
  uint64_t *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v16 = (const __CFURL *)a3;
  type = (__CFString *)a5;
  v59 = a7;
  v58 = a8;
  v17 = &kMetadataEncryptedModelTag;
  if (!a9)
    v17 = &kMetadataModelTag;
  name = *v17;
  objc_opt_class();
  v55 = self;
  v56 = v16;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = 0;
LABEL_12:
      cf = 0;
      options = 0;
      v24 = 0;
LABEL_15:
      Mutable = CGImageMetadataCreateMutable();
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = CGImageSourceCreateWithURL(v16, 0);
  else
    v18 = CGImageSourceCreateWithData(v16, 0);
  v19 = v18;
  if (!v18)
    goto LABEL_12;
  v69 = *MEMORY[0x1E0CBD138];
  v70 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v21 = CGImageSourceCopyPropertiesAtIndex(v19, 0, v20);
  options = (CFDictionaryRef)-[__CFDictionary muDeepMutableCopy](v21, "muDeepMutableCopy");

  v22 = CGImageSourceCopyMetadataAtIndex(v19, 0, 0);
  v23 = v22;
  v24 = v22 != 0;
  if (v22)
  {
    Mutable = CGImageMetadataCreateMutableCopy(v22);
    CFRelease(v23);
  }
  else
  {
    Mutable = 0;
  }
  cf = CGImageSourceCreateImageAtIndex(v19, 0, 0);

  if (!Mutable)
    goto LABEL_15;
LABEL_16:
  err = 0;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, kMetadataNamespacePaperKit, kMetadataPrefixPaperKit, &err);
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixAnnotationKit, name, v55, v56, type);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v26);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixPaperKit, name);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v27);

  }
  if (!cf)
  {
    +[PPKImageWriter log]();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DDB0F000, v38, OS_LOG_TYPE_DEFAULT, "Failed to create a CGImageRef.", (uint8_t *)&buf, 2u);
    }
    v28 = 0;
    goto LABEL_38;
  }
  v28 = CGImageRetain(a4);
  v29 = CGImageDestinationCreateWithDataConsumer(a6, type, 1uLL, 0);
  if (!v29)
  {
    +[PPKImageWriter log]();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DDB0F000, v38, OS_LOG_TYPE_DEFAULT, "Failed to create CGImageDestinationRef.", (uint8_t *)&buf, 2u);
    }
LABEL_38:
    v45 = 0;
    goto LABEL_52;
  }
  if (v59)
  {
    v30 = (void *)MEMORY[0x1DF0E5E20]();
    -[PPKImageWriter encodedModelFromData:encrypt:]((uint64_t)v55, v59, a9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CGImageMetadataTagCreate(kMetadataNamespacePaperKit, kMetadataPrefixPaperKit, name, kCGImageMetadataTypeString, v32);
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), kMetadataPrefixPaperKit, name);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CGImageMetadataSetTagWithPath(Mutable, 0, v34, v33);
      CFRelease(v33);

    }
    objc_autoreleasePoolPop(v30);
  }
  v35 = *MEMORY[0x1E0CBCFF0];
  -[__CFDictionary setObject:forKey:](options, "setObject:forKey:", &unk_1EA8771A8, *MEMORY[0x1E0CBCFF0]);
  v36 = (const __CFString *)*MEMORY[0x1E0CBD090];
  -[__CFDictionary objectForKey:](options, "objectForKey:", *MEMORY[0x1E0CBD090]);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
    -[NSObject setObject:forKey:](v37, "setObject:forKey:", &unk_1EA8771A8, v35);
  CGImageMetadataSetValueMatchingImageProperty(Mutable, v36, (CFStringRef)*MEMORY[0x1E0CBD0C0], &unk_1EA8771A8);
  Width = CGImageGetWidth(v28);
  Height = CGImageGetHeight(v28);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Width);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKey:](options, "setObject:forKey:", v41, *MEMORY[0x1E0CBD128]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", Height);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKey:](options, "setObject:forKey:", v42, *MEMORY[0x1E0CBCEA8]);

  if (!v58)
    goto LABEL_47;
  v63 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v43 = (uint64_t (*)(CGImageMetadata *, id, CFErrorRef *))getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
  v68 = getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
  if (!getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v72 = __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke;
    v73 = &unk_1EA839030;
    v74 = &v65;
    __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke((uint64_t)&buf);
    v43 = (uint64_t (*)(CGImageMetadata *, id, CFErrorRef *))v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v43)
    -[PPKImageWriter writeUsingBaseImage:annotationImage:asImageOfType:toConsumer:annotationMetadata:modifiedImageDescription:encryptPrivateMetadata:error:].cold.1();
  if ((v43(Mutable, v58, &v63) & 1) != 0)
    goto LABEL_47;
  if (v63)
  {
    v44 = (__CFString *)CFErrorCopyDescription(v63);
    CFRelease(v63);
  }
  else
  {
    v44 = 0;
  }
  v46 = -[__CFString length](v44, "length") == 0;
  +[PPKImageWriter log]();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    if (v48)
    {
      LOWORD(buf) = 0;
      v49 = "Error setting image description into metadata";
      v50 = v47;
      v51 = 2;
      goto LABEL_45;
    }
  }
  else if (v48)
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v44;
    v49 = "Error setting image description: %@";
    v50 = v47;
    v51 = 12;
LABEL_45:
    _os_log_impl(&dword_1DDB0F000, v50, OS_LOG_TYPE_DEFAULT, v49, (uint8_t *)&buf, v51);
  }

LABEL_47:
  CGImageDestinationAddImageAndMetadata(v29, v28, Mutable, options);
  v45 = CGImageDestinationFinalize(v29);
  if (!v45)
  {
    +[PPKImageWriter log]();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DDB0F000, v52, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed.", (uint8_t *)&buf, 2u);
    }

  }
  CFRelease(v29);
LABEL_52:

  if (v19)
    CFRelease(v19);
  if (cf)
    CFRelease(cf);
  if (v28)
    CFRelease(v28);
  if (Mutable)
    CFRelease(Mutable);
  if (a10)
    v53 = v45;
  else
    v53 = 1;
  if ((v53 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v45;
}

- (id)encodedModelFromData:(int)a3 encrypt:
{
  id v5;
  _BYTE *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  if (a1)
  {
    if (a3)
    {
      +[PPKPayloadEncryption sharedInstance]();
      v6 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      -[PPKPayloadEncryption encryptData:](v6, v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    v5 = v5;
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)writeUsingBaseImage:annotationImage:asImageOfType:toConsumer:annotationMetadata:modifiedImageDescription:encryptPrivateMetadata:error:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  __getPXDisplayAssetViewClass_block_invoke_cold_1(v0);
}

@end
