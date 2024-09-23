@implementation AVAsset(PhotoLibraryServices)

- (id)plVideoCodecName
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a1);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "isEnabled"))
        {
          objc_msgSend(v6, "formatDescriptions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            objc_msgSend(v7, "firstObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v8);
            CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v8);
            MTCopyStringsForMediaTypeAndSubType();
          }

          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return 0;
}

- (id)plVideoCodecFourCharCodeString
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FourCharCode MediaSubType;
  _BYTE v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a1);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v6, "isEnabled"))
        {
          objc_msgSend(v6, "formatDescriptions");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "count"))
          {
            objc_msgSend(v8, "firstObject");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v9);
            v12[0] = HIBYTE(MediaSubType);
            v12[1] = BYTE2(MediaSubType);
            v12[2] = BYTE1(MediaSubType);
            v12[3] = MediaSubType;
            v12[4] = 0;
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v12, 30);
          }
          else
          {
            v7 = 0;
          }

          goto LABEL_14;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_14:

  return v7;
}

@end
