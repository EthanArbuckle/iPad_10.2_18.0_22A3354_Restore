@implementation SLDCollaborationAttributionViewRenderer

- (SLDCollaborationAttributionViewRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  SLDCollaborationAttributionViewRenderer *v9;
  SLDCollaborationAttributionViewRenderer *v10;
  SLCollaborationAttributionViewMetricsProvider *v11;
  SLCollaborationAttributionViewMetricsProvider *metricsProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationAttributionViewRenderer;
  v9 = -[SLDCollaborationAttributionViewRenderer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v10->_RTL = objc_msgSend(v7, "layoutDirection") == 1;
    v11 = -[SLCollaborationAttributionViewMetricsProvider initWithSlotStyle:tag:]([SLCollaborationAttributionViewMetricsProvider alloc], "initWithSlotStyle:tag:", v7, v8);
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;

  }
  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  NSObject *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGImage *v10;
  CGImage *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  void *v39;
  double v40;
  double MaxX;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  SLDCollaborationAttributionViewRenderer *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v76 = *MEMORY[0x1E0C80C00];
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v70 = 138412290;
    v71 = self;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer about to render.", (uint8_t *)&v70, 0xCu);
  }

  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[SLDCollaborationAttributionViewRenderer newAvatarImage](self, "newAvatarImage");
  if (v10)
  {
    v11 = v10;
    -[SLDCollaborationAttributionViewRenderer drawAvatarWithImageRef:inContext:](self, "drawAvatarWithImageRef:inContext:", v10, a3);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    CFRelease(v11);
  }
  else
  {
    -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SLDCollaborationAttributionViewRenderer shouldShowGenericIconIfApplicableForVariant:](self, "shouldShowGenericIconIfApplicableForVariant:", objc_msgSend(v20, "variant"));

    SLDaemonLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v23)
      {
        v70 = 138412290;
        v71 = self;
        _os_log_impl(&dword_199EFF000, v22, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Showing generic glyph because avatar image was nil.", (uint8_t *)&v70, 0xCu);
      }

      -[SLDCollaborationAttributionViewRenderer drawGenericGlyphInContext:](self, "drawGenericGlyphInContext:", a3);
      v13 = v24;
      v15 = v25;
      v17 = v26;
      v19 = v27;
    }
    else
    {
      if (v23)
      {
        v70 = 138412290;
        v71 = self;
        _os_log_impl(&dword_199EFF000, v22, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Not drawing an avatar because avatar image was nil and generic icon was not supported for the current variant.", (uint8_t *)&v70, 0xCu);
      }

      v19 = v9;
      v17 = v8;
      v15 = v7;
      v13 = v6;
    }
  }
  if (-[SLDCollaborationAttributionViewRenderer shouldShowLabels](self, "shouldShowLabels"))
  {
    -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "variant") == 2)
    {

    }
    else
    {
      -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "variant");

      if (v30 != 5)
      {
        -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          goto LABEL_17;
        goto LABEL_19;
      }
    }
    -[SLDCollaborationAttributionViewRenderer collaboratorsString](self, "collaboratorsString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
LABEL_17:
      -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "singleLineTitleForString:", v31);

      goto LABEL_20;
    }
LABEL_19:
    v33 = 0;
LABEL_20:
    if (-[SLDCollaborationAttributionViewRenderer shouldShowSubtitle](self, "shouldShowSubtitle"))
    {
      -[SLDCollaborationAttributionViewRenderer withCollaboratorsString](self, "withCollaboratorsString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "singleLineSubtitleForString:", v35);

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }
    v77.origin.x = v13;
    v77.origin.y = v15;
    v77.size.width = v17;
    v77.size.height = v19;
    v79.origin.x = v6;
    v79.origin.y = v7;
    v79.size.width = v8;
    v79.size.height = v9;
    v38 = 0.0;
    if (!CGRectEqualToRect(v77, v79))
    {
      -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "avatarLabelSpace");
      v38 = v40;

    }
    v78.origin.x = v13;
    v78.origin.y = v15;
    v78.size.width = v17;
    v78.size.height = v19;
    MaxX = CGRectGetMaxX(v78);
    -[SLDCollaborationAttributionViewRenderer heightForLine:withOptions:](self, "heightForLine:withOptions:", v33, 8);
    v43 = v42;
    -[SLDCollaborationAttributionViewRenderer heightForLine:withOptions:](self, "heightForLine:withOptions:", v37, 8);
    v45 = v44;
    v46 = v43 + v44;
    if (v44 > 0.0)
    {
      -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "titleSubtitleSpace");
      v46 = v46 + v48;

    }
    v49 = v38 + MaxX;
    if (v46 >= v19)
      v50 = 0.0;
    else
      v50 = (v19 - v46) * 0.5;
    if (v33)
    {
      -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "drawingSize");
      v53 = v52 - v49;

      -[SLDCollaborationAttributionViewRenderer drawLine:inRect:inContext:](self, "drawLine:inRect:inContext:", v33, a3, v49, v50, v53, v43);
      if (v37)
      {
LABEL_35:
        -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "titleSubtitleSpace");
        v56 = v43 + v50 + v55;
        -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "drawingSize");
        v59 = v58 - v49;

        -[SLDCollaborationAttributionViewRenderer drawLine:inRect:inContext:](self, "drawLine:inRect:inContext:", v37, a3, v49, v56, v59, v45);
LABEL_42:

        return;
      }
    }
    else
    {
      SLDaemonLogHandle();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "conversationDrawingMetadata");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "collaboratorDisplayNames");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 138412802;
        v71 = self;
        v72 = 2112;
        v73 = v62;
        v74 = 2112;
        v75 = v64;
        _os_log_impl(&dword_199EFF000, v60, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer failed to draw a title. conversationMetadata:%@ collaborationDisplayNames:%@.", (uint8_t *)&v70, 0x20u);

      }
      if (v37)
        goto LABEL_35;
    }
    SLDaemonLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "conversationDrawingMetadata");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "collaboratorDisplayNames");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 138412802;
      v71 = self;
      v72 = 2112;
      v73 = v67;
      v74 = 2112;
      v75 = v69;
      _os_log_impl(&dword_199EFF000, v65, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer failed to draw a subtitle. conversationMetadata:%@ collaborationDisplayNames:%@.", (uint8_t *)&v70, 0x20u);

    }
    goto LABEL_42;
  }
}

- (CGImage)newGroupPhotoImageFromFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CGImage *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  SLDCollaborationAttributionViewRenderer *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      v7 = SLDCreateGroupPhotoImageWithData(v5);
    }
    else
    {
      SLDaemonLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v12 = self;
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_199EFF000, v8, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewRenderer failed to retrieve group photo data from file URL %@. error: %@", buf, 0x20u);
      }

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGImage)newSnowglobeImageWithCGImages:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const void *v22;
  NSObject *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D13D50], "maxContacts");
  v6 = v4;
  if (objc_msgSend(v4, "count") > v5)
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(MEMORY[0x1E0D13D50], "maxContacts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v6, "count");
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v25 - v9;
  if (v8 >= 0x200)
    v11 = 512;
  else
    v11 = v8;
  bzero((char *)v25 - v9, v11);
  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v10[8 * v12] = v13;

      ++v12;
    }
    while (objc_msgSend(v6, "count") > v12);
  }
  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avatarDiameter");
  v16 = v15;

  v17 = (void *)MEMORY[0x1E0D13D30];
  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "renderingScopeWithPointSize:scale:rightToLeft:style:color:", -[SLDCollaborationAttributionViewRenderer isRTL](self, "isRTL"), 0, 0, v16, v16, (double)objc_msgSend(v18, "displayScale"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D13D60];
  v21 = objc_msgSend(v6, "count");
  v22 = (const void *)objc_msgSend(v20, "imageForAvatarImages:badgeImages:badgeTypes:rect:itemCount:scope:", v10, 0, MEMORY[0x1E0C9AA60], v21, v19, 0.0, 0.0, v16, v16);
  CFRetain(v22);
  if (!v22)
  {
    SLDaemonLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationAttributionViewRenderer newSnowglobeImageWithCGImages:].cold.1((uint64_t)self, v4, v23);

  }
  return (CGImage *)v22;
}

- (CGImage)newImageFromData:(id)a3
{
  id v3;
  const UInt8 *v4;
  CFIndex v5;
  const __CFData *v6;
  CGDataProvider *v7;
  CGImageRef ImageAtIndex;
  CGImageSource *v9;

  if (!a3)
    return 0;
  v3 = objc_retainAutorelease(a3);
  v4 = (const UInt8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = CFDataCreate(0, v4, v5);
  v7 = CGDataProviderCreateWithCFData(v6);
  ImageAtIndex = v7;
  if (v7)
  {
    v9 = CGImageSourceCreateWithDataProvider(v7, 0);
    CFRelease(ImageAtIndex);
    if (v9)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
      CFRelease(v9);
    }
    else
    {
      ImageAtIndex = 0;
    }
  }
  CFRelease(v6);
  return ImageAtIndex;
}

- (CGImage)newMonogramImageForContact:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGColorSpace *DeviceRGB;
  size_t v12;
  size_t AlignedBytesPerRow;
  CGContext *v14;
  void *v15;
  CGImage *Image;
  NSObject *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_6:
    Image = 0;
    goto LABEL_7;
  }
  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "displayScale");

  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarDiameter");
  v9 = v8;

  v10 = v9 * v6;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = vcvtpd_s64_f64(v10);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v14 = CGBitmapContextCreate(0, v12, v12, 8uLL, AlignedBytesPerRow, DeviceRGB, 1u);
  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SLDRenderContactMonogramInContextAtRect(v15, v4, v14, 0, v10, 0.0, 0.0, v10, v10);

  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  if (!Image)
  {
    SLDaemonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationAttributionViewRenderer newMonogramImageForContact:].cold.1();

    goto LABEL_6;
  }
LABEL_7:

  return Image;
}

- (CGImage)newAvatarImageForConversationDrawingMetadata:(id)a3 allowSnowglobe:(BOOL)a4 allowMonogram:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CGImage *v13;
  NSObject *v14;
  NSObject *v15;
  CGImage *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGImage *v23;
  CGImage *v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  SLDCollaborationAttributionViewRenderer *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v5 = a5;
  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!objc_msgSend(v8, "isGroupConversation"))
  {
    objc_msgSend(v8, "recipientDrawingMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = -[SLDCollaborationAttributionViewRenderer newAvatarImageForRecipientDrawingMetadata:allowMonogram:](self, "newAvatarImageForRecipientDrawingMetadata:allowMonogram:", v15, v5);
LABEL_21:
      v13 = v16;
LABEL_28:

      goto LABEL_29;
    }
    SLDaemonLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_199EFF000, v25, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because recipient drawing metadata was nil. %@.", buf, 0x16u);
    }

LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v8, "groupID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v8, "groupPhotoFileURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    if (v6)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v8, "recipientDrawingMetadata", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            v23 = -[SLDCollaborationAttributionViewRenderer newAvatarImageForRecipientDrawingMetadata:allowMonogram:](self, "newAvatarImageForRecipientDrawingMetadata:allowMonogram:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22), 1);
            if (v23)
            {
              v24 = v23;
              -[NSObject addObject:](v15, "addObject:", v23);
              CFRelease(v24);
            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v20);
      }

      v16 = -[SLDCollaborationAttributionViewRenderer newSnowglobeImageWithCGImages:](self, "newSnowglobeImageWithCGImages:", v15);
      goto LABEL_21;
    }
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_199EFF000, v15, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because there was no group photo and snowglobes aren't allowed. %@.", buf, 0x16u);
    }
    goto LABEL_27;
  }
  objc_msgSend(v8, "groupID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = SLDCreateGroupPhotoImageWithGroupID(v12);

  if (!v13)
  {
    SLDaemonLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v33 = self;
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_199EFF000, v14, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Failed to get avatar image from IMSPI. Trying with groupPhotoFileURL. %@.", buf, 0x16u);
    }

    objc_msgSend(v8, "groupPhotoFileURL");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[SLDCollaborationAttributionViewRenderer newGroupPhotoImageFromFileURL:](self, "newGroupPhotoImageFromFileURL:", v15);
    goto LABEL_21;
  }
LABEL_29:

  return v13;
}

- (CGImage)newAvatarImageForRecipientDrawingMetadata:(id)a3 allowMonogram:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  CGImage *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  SLDCollaborationAttributionViewRenderer *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SLDaemonLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because recipient contact was nil. %@.", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_15;
  }
  objc_msgSend(v6, "contactImageData");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v4)
    {
LABEL_11:
      v9 = -[SLDCollaborationAttributionViewRenderer newMonogramImageForContact:](self, "newMonogramImageForContact:", v7);
      goto LABEL_16;
    }
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because there was no contact photo and monograms aren't allowed. %@.", (uint8_t *)&v13, 0x16u);
    }

LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v9 = -[SLDCollaborationAttributionViewRenderer newImageFromData:](self, "newImageFromData:", v8);
  if (!v9 && v4)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationAttributionViewRenderer newAvatarImageForRecipientDrawingMetadata:allowMonogram:].cold.1();

    goto LABEL_11;
  }
LABEL_16:

  return v9;
}

- (CGImage)newAvatarImage
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  CGImage *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  CGImage *v18;
  CGImage *v19;
  NSObject *v20;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  SLDCollaborationAttributionViewRenderer *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if ((v4 & 1) != 0)
  {
    SLDaemonLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because slot tag isPlaceholder was YES.", buf, 0xCu);
    }
    goto LABEL_24;
  }
  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationDrawingMetadata");
  v5 = objc_claimAutoreleasedReturnValue();

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SLDCollaborationAttributionViewRenderer shouldShowSnowglobeIfApplicableForVariant:](self, "shouldShowSnowglobeIfApplicableForVariant:", objc_msgSend(v7, "variant"));

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SLDCollaborationAttributionViewRenderer shouldShowMonogramIfApplicableForVariant:](self, "shouldShowMonogramIfApplicableForVariant:", objc_msgSend(v9, "variant"));

  if (-[NSObject count](v5, "count") == 1)
  {
    -[NSObject firstObject](v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SLDCollaborationAttributionViewRenderer newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:](self, "newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:", v11, v8, v10);

    goto LABEL_25;
  }
  if ((unint64_t)-[NSObject count](v5, "count") < 2)
  {
    SLDaemonLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v21 = "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because slot tag conversationDra"
            "wingMetadata was empty.";
LABEL_22:
      _os_log_impl(&dword_199EFF000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    }
LABEL_23:

LABEL_24:
    v12 = 0;
    goto LABEL_25;
  }
  if (!v8)
  {
    SLDaemonLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v21 = "[%@] SLDCollaborationAttributionViewRenderer Returning nil for avatar image because snowglobes were not allo"
            "wed for the current variant.";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v5;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v5);
        v18 = -[SLDCollaborationAttributionViewRenderer newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:](self, "newAvatarImageForConversationDrawingMetadata:allowSnowglobe:allowMonogram:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), 0, 1, (_QWORD)v23);
        if (v18)
        {
          v19 = v18;
          objc_msgSend(v13, "addObject:", v18);
          CFRelease(v19);
        }
      }
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v15);
  }

  v12 = -[SLDCollaborationAttributionViewRenderer newSnowglobeImageWithCGImages:](self, "newSnowglobeImageWithCGImages:", v13);
LABEL_25:

  return v12;
}

- (BOOL)shouldShowMonogramIfApplicableForVariant:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x2Du >> a3);
}

- (BOOL)shouldShowSnowglobeIfApplicableForVariant:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x2Du >> a3);
}

- (BOOL)shouldShowGenericIconIfApplicableForVariant:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (CGRect)drawGenericGlyphInContext:(CGContext *)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect result;

  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawingSize");
  v7 = v6;
  v9 = v8;

  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (double)objc_msgSend(v10, "displayScale");

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "placeholderGlyphConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "coreUISize");
  v15 = objc_msgSend(v13, "weight");
  objc_msgSend(v13, "pointSize");
  if (v16 > 0.0)
  {
    objc_msgSend(v13, "pointSize");
    v19 = v20;
  }
  else
  {
    -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "avatarDiameter");
    v19 = SLRoundToScale(v18, v11);

  }
  if (!v15)
    v15 = 4;
  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SLDSystemVectorGlyphWithSlotStyle(v21, CFSTR("person.crop.circle.badge.checkmark"), v14, v15, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0DC5C70]);
  -[SLDCollaborationAttributionViewRenderer slotStyle](self, "slotStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithVectorGlyph:tintColor:", v22, objc_msgSend(v24, "tintColor"));

  objc_msgSend(v22, "contentBoundsUnrounded");
  v27 = v26;
  objc_msgSend(v22, "alignmentRectUnrounded");
  v29 = v27 - v28;
  objc_msgSend(v22, "baselineOffsetUnrounded");
  v31 = v29 - v30;
  objc_msgSend(v22, "capHeightUnrounded");
  v33 = (v31 + v31 - v32) * 0.5;
  objc_msgSend(v22, "contentBoundsUnrounded");
  v35 = (v7 - v34) * 0.5;
  objc_msgSend(v22, "contentBoundsUnrounded");
  v37 = (v9 - v36) * 0.5;
  objc_msgSend(v22, "contentBoundsUnrounded");
  v39 = v38;
  objc_msgSend(v22, "contentBoundsUnrounded");
  v41 = v40;
  objc_msgSend(v22, "contentBoundsUnrounded");
  v43 = v37 + v42 * 0.5 - v33;
  objc_msgSend(v22, "alignmentRectUnrounded");
  v45 = v35 + v44;
  objc_msgSend(v22, "alignmentRectUnrounded");
  v47 = v46 + v43;
  v48 = SLRoundToScale(v45, v11);
  v49 = SLRoundToScale(v47, v11);
  v50 = v35 + v48 - v45;
  v51 = v43 + v49 - v47;
  CGContextSaveGState(a3);
  objc_msgSend(v25, "drawInContext:atPoint:", a3, v50, v51);
  CGContextRestoreGState(a3);

  v52 = v50;
  v53 = v51;
  v54 = v39;
  v55 = v41;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (CGRect)drawAvatarWithImageRef:(CGImage *)a3 inContext:(CGContext *)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarDiameter");
  v9 = v8;

  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "drawingSize");
  v12 = v11 - v9;

  CGImageRetain(a3);
  CGContextSaveGState(a4);
  -[SLDCollaborationAttributionViewRenderer metricsProvider](self, "metricsProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "drawingSize");
  CGContextTranslateCTM(a4, 0.0, v14);

  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextBeginPath(a4);
  v19.origin.x = 0.0;
  v19.origin.y = v12;
  v19.size.width = v9;
  v19.size.height = v9;
  CGContextAddEllipseInRect(a4, v19);
  CGContextClip(a4);
  CGContextClosePath(a4);
  v20.origin.x = 0.0;
  v20.origin.y = v12;
  v20.size.width = v9;
  v20.size.height = v9;
  CGContextDrawImage(a4, v20, a3);
  CGContextRestoreGState(a4);
  CGImageRelease(a3);
  v15 = 0.0;
  v16 = v12;
  v17 = v9;
  v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)accessibilityLabelForTag:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((!objc_msgSend(v3, "variant") || objc_msgSend(v3, "variant") == 3)
    && (objc_msgSend(v3, "collaboratorDisplayNames"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:prefixingWith:](SLDCollaborationAttributionViewRenderer, "collaboratorsStringForTag:prefixingWith:", v3, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowSubtitle
{
  void *v2;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "variant");
  if (v5)
  {
    -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "variant") != 3)
    {
      v6 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collaboratorDisplayNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "count") != 0;

  if (v5)
    goto LABEL_5;
LABEL_6:

  return v6;
}

- (BOOL)shouldShowLabels
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "variant") == 1)
  {
    v4 = 0;
  }
  else
  {
    -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "variant") != 4;

  }
  return v4;
}

- (double)heightForLine:(__CTLine *)a3 withOptions:(unint64_t)a4
{
  CGFloat v5;
  CGFloat descent;
  CGRect BoundsWithOptions;

  if (!a3)
    return 0.0;
  BoundsWithOptions = CTLineGetBoundsWithOptions(a3, a4);
  v5 = BoundsWithOptions.size.height + BoundsWithOptions.origin.y;
  descent = 0.0;
  CTLineGetTypographicBounds(a3, 0, &descent, 0);
  return v5 + descent;
}

- (id)collaboratorsString
{
  void *v2;
  void *v3;

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:prefixingWith:](SLDCollaborationAttributionViewRenderer, "collaboratorsStringForTag:prefixingWith:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)withCollaboratorsString
{
  void *v2;
  void *v3;

  -[SLDCollaborationAttributionViewRenderer slotTag](self, "slotTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLDCollaborationAttributionViewRenderer collaboratorsStringForTag:prefixingWith:](SLDCollaborationAttributionViewRenderer, "collaboratorsStringForTag:prefixingWith:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)collaboratorsStringForTag:(id)a3 prefixingWith:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v29;

  objc_msgSend(a3, "collaboratorDisplayNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!objc_msgSend(v6, "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    SLFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4)
      v15 = CFSTR("With nobody");
    else
      v15 = CFSTR("nobody");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E3797070, CFSTR("SocialLayer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (objc_msgSend(v6, "count") != 1)
  {
    if (objc_msgSend(v6, "count") == 2)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      SLFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      if (a4)
        v18 = CFSTR("With %@ and %@");
      else
        v18 = CFSTR("%@ and %@");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1E3797070, CFSTR("SocialLayer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v19, v24, v25, v29);
    }
    else
    {
      v20 = objc_msgSend(v6, "count");
      v21 = (void *)MEMORY[0x1E0CB3940];
      SLFrameworkBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;
      if (v20 == 3)
      {
        if (a4)
          v23 = CFSTR("With %@, %@ & %@");
        else
          v23 = CFSTR("%@, %@ & %@");
        objc_msgSend(v22, "localizedStringForKey:value:table:", v23, &stru_1E3797070, CFSTR("SocialLayer"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", v19, v24, v25, v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_25;
      }
      if (a4)
        v26 = CFSTR("WITH_@_@_AND_N_OTHERS_FORMAT");
      else
        v26 = CFSTR("@_@_AND_N_OTHERS_FORMAT");
      objc_msgSend(v22, "localizedStringForKey:value:table:", v26, &stru_1E3797070, CFSTR("SocialLayer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v19, v24, v25, objc_msgSend(v6, "count") - 2);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    SLFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("With %@"), &stru_1E3797070, CFSTR("SocialLayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:

  return v11;
}

- (void)drawLine:(__CTLine *)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  double y;
  CGFloat x;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect BoundsWithOptions;

  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSaveGState(a5);
  CGContextSetFontRenderingStyle();
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 1.0, -1.0);
  v9 = v10;
  CGContextSetTextMatrix(a5, &v9);
  BoundsWithOptions = CTLineGetBoundsWithOptions(a3, 8uLL);
  CGContextTranslateCTM(a5, x, BoundsWithOptions.origin.y + y + BoundsWithOptions.size.height);
  CTLineDraw(a3, a5);
  CGContextRestoreGState(a5);
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_slotStyle, a3);
}

- (SLDCollaborationAttributionViewSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
  objc_storeStrong((id *)&self->_slotTag, a3);
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (SLCollaborationAttributionViewMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metricsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)newSnowglobeImageWithCGImages:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_15(&dword_199EFF000, a3, v4, "[%@] SLDCollaborationAttributionViewRenderer Had images, but the snowglobe image ref was still nil. cgImages.count: %li", (uint8_t *)&v5);
}

- (void)newMonogramImageForContact:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%@] SLDCollaborationAttributionViewRenderer Had a contact, but the monogram image ref was still nil. contact: %@", v1);
}

- (void)newAvatarImageForRecipientDrawingMetadata:allowMonogram:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_15(&dword_199EFF000, v0, (uint64_t)v0, "[%@] SLDCollaborationAttributionViewRenderer Had contact image data, but avatar image was still nil. Falling back to monogram. %@.", v1);
}

@end
