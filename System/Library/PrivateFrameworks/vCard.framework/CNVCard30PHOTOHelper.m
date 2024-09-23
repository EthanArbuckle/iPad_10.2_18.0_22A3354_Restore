@implementation CNVCard30PHOTOHelper

+ (id)log
{
  if (log_cn_once_token_1 != -1)
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_12);
  return (id)log_cn_once_object_1;
}

void __27__CNVCard30PHOTOHelper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.vcard", "vcardphotohelper");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

}

- (CNVCard30PHOTOHelper)init
{
  CNVCard30PHOTOHelper *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNVCard30PHOTOHelper)initWithPerson:(id)a3 options:(id)a4 maximumDataLength:(unint64_t)a5
{
  id v9;
  id v10;
  CNVCard30PHOTOHelper *v11;
  CNVCard30PHOTOHelper *v12;
  CNVCard30PHOTOHelper *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNVCard30PHOTOHelper;
  v11 = -[CNVCard30PHOTOHelper init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_maxBytes = a5;
    v13 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30PHOTOHelper person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("person"), v4);

  -[CNVCard30PHOTOHelper options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("options"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("maximumDataLength"), v8);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)bestEffortImage
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];
  NSSize v30;

  v29[2] = *MEMORY[0x1E0C80C00];
  if (!-[CNVCard30PHOTOHelper maxBytes](self, "maxBytes"))
    return 0;
  -[CNVCard30PHOTOHelper options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumImageSize");
  v30.width = v4;
  v30.height = v5;
  v6 = NSEqualSizes(*MEMORY[0x1E0CB3440], v30);

  if (v6)
  {
    -[CNVCard30PHOTOHelper options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "prefersUncroppedPhotos");

    if (v8)
    {
      -[CNVCard30PHOTOHelper largeImage](self, "largeImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 1024.0, 1024.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 512.0, 512.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVCard30PHOTOHelper scaleImage:toFitSizes:allowableCompressionQuality:](self, "scaleImage:toFitSizes:allowableCompressionQuality:", v9, v12, &unk_1E957CF78);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNVCard30PHOTOHelper logBestEfforImageIfNonNil:](self, "logBestEfforImageIfNonNil:", v13);
      v14 = v13;
      if (v14)
      {
        v15 = v14;
LABEL_8:
        v22 = v15;
LABEL_12:

        v15 = v22;
        goto LABEL_13;
      }

    }
    -[CNVCard30PHOTOHelper image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 1024.0, 1024.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 512.0, 512.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCard30PHOTOHelper scaleImage:toFitSizes:allowableCompressionQuality:](self, "scaleImage:toFitSizes:allowableCompressionQuality:", v9, v25, &unk_1E957CF90);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVCard30PHOTOHelper logBestEfforImageIfNonNil:](self, "logBestEfforImageIfNonNil:", v26);
    v15 = v26;

    if (!v15)
    {
      v22 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    -[CNVCard30PHOTOHelper image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCard30PHOTOHelper options](self, "options");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "maximumImageSize");
    objc_msgSend(v9, "setSize:");

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 1024.0, 1024.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 512.0, 512.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCard30PHOTOHelper scaleImage:toFitSizes:allowableCompressionQuality:](self, "scaleImage:toFitSizes:allowableCompressionQuality:", v9, v20, &unk_1E957CF60);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVCard30PHOTOHelper logBestEfforImageIfNonNil:](self, "logBestEfforImageIfNonNil:", v21);
    v15 = v21;
    if (v15)
      goto LABEL_8;
  }
LABEL_13:

  return v15;
}

- (id)largeImage
{
  CNVCardMutableImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNVCardMutableImage *v8;

  v3 = [CNVCardMutableImage alloc];
  -[CNVCard30PHOTOHelper person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "largeImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30PHOTOHelper person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "largeImageCropRects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNVCardImage initWithData:cropRects:](v3, "initWithData:cropRects:", v5, v7);

  return v8;
}

- (id)image
{
  CNVCardMutableImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNVCardMutableImage *v8;

  v3 = [CNVCardMutableImage alloc];
  -[CNVCard30PHOTOHelper person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCard30PHOTOHelper person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageCropRects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNVCardImage initWithData:cropRects:](v3, "initWithData:cropRects:", v5, v7);

  return v8;
}

- (id)scaleImage:(id)a3 toFitSizes:(id)a4 allowableCompressionQuality:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNVCard30PHOTOHelper options](self, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "compressPhotos");

  if ((v12 & 1) == 0)
  {
    v13 = v8;
    objc_msgSend(v13, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    v16 = -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes");

    if (v15 < v16)
      goto LABEL_16;

  }
  -[CNVCard30PHOTOHelper compressImage:allowableCompressions:](self, "compressImage:allowableCompressions:", v8, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "sizeValue", (_QWORD)v24);
          -[CNVCard30PHOTOHelper scaleImage:toFit:allowableCompressionQuality:](self, "scaleImage:toFit:allowableCompressionQuality:", v8, v10);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v13 = (id)v22;
            goto LABEL_15;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v19)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_15:

  }
LABEL_16:

  return v13;
}

- (id)scaleImage:(id)a3 toFit:(CGSize)a4 allowableCompressionQuality:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "size");
  if (v11 <= width && (objc_msgSend(v9, "size"), v12 <= height))
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v9, "setSize:", width, height);
    -[CNVCard30PHOTOHelper options](self, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compressPhotos");

    if ((v14 & 1) != 0)
    {
      -[CNVCard30PHOTOHelper compressImage:allowableCompressions:](self, "compressImage:allowableCompressions:", v9, v10);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "setCompressionQuality:", &unk_1E957CFE8);
      v16 = v9;
      objc_msgSend(v16, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      v19 = -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes");

      if (v18 >= v19)
        v15 = 0;
      else
        v15 = v16;

    }
  }

  return v15;
}

- (id)compressImage:(id)a3 allowableCompressions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNVCard30PHOTOHelper options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compressPhotos");

  if (!v9)
  {
    v10 = 0;
    goto LABEL_19;
  }
  if ((objc_msgSend(v6, "isSourceLossless") & 1) != 0 || objc_msgSend(v6, "hasAlphaChannel"))
  {
    objc_msgSend(v6, "setCompressionQuality:", &unk_1E957CFE8);
    v10 = v6;
    objc_msgSend(v10, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");
    v13 = -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes");

    if (v12 < v13)
      goto LABEL_19;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v23 = v7;
    v17 = *(_QWORD *)v25;
LABEL_8:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v17)
        objc_enumerationMutation(v14);
      objc_msgSend(v6, "setCompressionQuality:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18));
      v10 = v6;
      objc_msgSend(v10, "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");
      v21 = -[CNVCard30PHOTOHelper maxBytes](self, "maxBytes");

      if (v20 < v21)
        break;

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          goto LABEL_8;
        v10 = 0;
        break;
      }
    }
    v7 = v23;
  }
  else
  {
    v10 = 0;
  }

LABEL_19:
  return v10;
}

- (void)logBestEfforImageIfNonNil:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "size");
      v6 = v5;
      objc_msgSend(v3, "size");
      v8 = v7;
      objc_msgSend(v3, "cropRects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = v6;
      v12 = 2048;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D3C07000, v4, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Best effort image with size (%.2f x %.2f) and cropRects %@", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (CNVCardPerson)person
{
  return self->_person;
}

- (CNVCardWritingOptions)options
{
  return self->_options;
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
