@implementation PXMetadataUtilities

+ (id)originalCreationDateForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "px_originalCreationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "px_creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;

  }
  return v6;
}

+ (id)originalTimeZoneForItem:(id)a3
{
  return (id)objc_msgSend(a3, "px_originalTimeZone");
}

+ (id)originalLocationForItem:(id)a3
{
  return (id)objc_msgSend(a3, "px_originalLocation");
}

+ (void)requestExifMetadataProcessingIfNeededForItem:(id)a3 onProcessingQueue:(id)a4 withResultHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__PXMetadataUtilities_requestExifMetadataProcessingIfNeededForItem_onProcessingQueue_withResultHandler___block_invoke;
  v11[3] = &unk_1E5148CE0;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async((dispatch_queue_t)a4, v11);

}

+ (void)processExifMetadataForItem:(id)a3 resultHandler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = objc_opt_class();
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unable to process EXIF metadata for non-PHAsset item: %@", buf, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v8;
    v13 = os_log_create((const char *)*MEMORY[0x1E0D71100], "InfoPanelEXIFMetadataSignPost");
    v14 = os_signpost_id_make_with_pointer(v13, a1);
    v15 = v13;
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      objc_msgSend(v12, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)v17;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "InfoPanelEXIFMetadataProcessing", "beginning exif processing for asset: %@", buf, 0xCu);

    }
    objc_msgSend(v12, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke;
    v27[3] = &unk_1E5149198;
    v28 = v12;
    v21[0] = v19;
    v21[1] = 3221225472;
    v21[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_2;
    v21[3] = &unk_1E513E110;
    v26 = v14;
    v22 = v16;
    v23 = v28;
    v24 = v10;
    v25 = v9;
    v20 = v16;
    objc_msgSend(v18, "performChanges:completionHandler:", v27, v21);

  }
}

+ (unint64_t)flashTypeForItem:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "px_supportsImageProperties"))
  {
    objc_msgSend(v3, "px_flash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "integerValue") == 1)
      v5 = 2;
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)whiteBalanceTypeForItem:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(a3, "px_whiteBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  v5 = 1;
  switch(v4)
  {
    case 0:
      break;
    case 1:
    case 9:
      v5 = 2;
      break;
    case 2:
    case 12:
    case 13:
    case 14:
    case 15:
      v5 = 3;
      break;
    case 3:
    case 24:
      v5 = 4;
      break;
    case 4:
      v5 = 5;
      break;
    case 5:
    case 6:
    case 7:
    case 8:
    case 16:
      goto LABEL_11;
    case 10:
      v5 = 6;
      break;
    case 11:
      v5 = 7;
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
      v5 = 8;
      break;
    default:
      if ((unint64_t)(v4 - 1006) > 0xF || ((1 << (v4 + 18)) & 0xFE7B) == 0)
LABEL_11:
        v5 = 0;
      else
        v5 = 9;
      break;
  }

  return v5;
}

+ (unint64_t)meteringModeTypeForItem:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "px_meteringMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

+ (unint64_t)fileTypeForItem:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "fileTypeForItem:type:", v4, objc_msgSend(v4, "px_originalType"));

  return v5;
}

+ (unint64_t)fileTypeForItem:(id)a3 type:(unint64_t)a4
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "px_representsBurst") & 1) != 0)
  {
    a4 = 11;
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
        if (objc_msgSend(v5, "px_isLivePhoto"))
          a4 = 15;
        else
          a4 = 1;
        break;
      case 1uLL:
        if (objc_msgSend(v5, "px_isLivePhoto"))
          a4 = 16;
        else
          a4 = 2;
        break;
      case 2uLL:
        a4 = 0;
        break;
      case 3uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
        break;
      case 4uLL:
        a4 = 5;
        break;
      case 5uLL:
        a4 = 4;
        break;
      case 0xAuLL:
        if (objc_msgSend(v5, "px_isTimelapse"))
          a4 = 13;
        else
          a4 = 10;
        if (objc_msgSend(v5, "px_isSloMo"))
          a4 = 12;
        break;
      case 0xBuLL:
        a4 = 17;
        break;
      default:
        a4 = 18;
        break;
    }
  }

  return a4;
}

+ (id)localizedFileFormatForItem:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString **v5;
  unint64_t v6;
  void *v7;

  v3 = a3;
  v4 = +[PXMetadataUtilities codecTypeForItem:](PXMetadataUtilities, "codecTypeForItem:", v3) - 1;
  if (v4 < 3)
  {
    v5 = &off_1E5115EF8[v4];
LABEL_7:
    PXLocalizedStringFromTable(*v5, CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = +[PXMetadataUtilities fileTypeForItem:](PXMetadataUtilities, "fileTypeForItem:", v3);
  if (v6 < 0x12 && ((0x3C9FFu >> v6) & 1) != 0)
  {
    v5 = &off_1E5115F10[v6];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

+ (id)cameraSettingsForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXInfoPanelMissingValuePlaceholder"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (cameraSettingsForItem__onceToken != -1)
    dispatch_once(&cameraSettingsForItem__onceToken, &__block_literal_global_1785);
  objc_msgSend(v3, "px_ISORating");
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_focalLengthIn35mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v3, "px_focalLength");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = v8;

  objc_msgSend(v3, "px_aperture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)_apertureFormatter, "stringForObjectValue:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("f %@"), v11);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "px_shutterSpeed");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_exposureBias");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ e v"), v13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_FPS");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_duration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_bitRate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "px_sampleRate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)v43;
  if (v43)
  {
    objc_msgSend((id)_isoFormatter, "stringForObjectValue:", v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("iso"));

    v20 = v42;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("iso"));
    v20 = v5;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("iso.ax"));
  if (v45)
  {
    objc_msgSend((id)_focalLengthFormatter, "stringForObjectValue:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("focalLength"));

    if (v13)
    {
LABEL_11:
      objc_msgSend((id)_exposureFormatter, "stringForObjectValue:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("exposure"));

      v23 = v40;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("focalLength"));
    if (v13)
      goto LABEL_11;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("exposure"));
  v23 = v5;
LABEL_14:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("exposure.ax"));
  if (v9)
  {
    objc_msgSend((id)_apertureFormatter, "stringForObjectValue:", v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("aperture"));

    v25 = v41;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("aperture"));
    v25 = v5;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("aperture.ax"));
  if (v12)
  {
    objc_msgSend((id)_shutterSpeedFormatter, "stringForObjectValue:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("shutterSpeed"));

    objc_msgSend((id)_shutterSpeedAXFormatter, "stringForObjectValue:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("shutterSpeed.ax"));

    if (v14)
      goto LABEL_19;
LABEL_22:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("bitrate"));
    if (v17)
      goto LABEL_20;
    goto LABEL_23;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("shutterSpeed"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("shutterSpeed.ax"));
  if (!v14)
    goto LABEL_22;
LABEL_19:
  objc_msgSend((id)_mediaBitrateFormatter, "stringFromNumber:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("bitrate"));

  if (v17)
  {
LABEL_20:
    objc_msgSend((id)_mediaSampleRateFormatter, "stringFromNumber:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("sampleRate"));

    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("sampleRate"));
LABEL_24:
  if (v44)
  {
    objc_msgSend((id)_mediaFPSFormatter, "stringFromNumber:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("fps"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("fps"));
  }
  v31 = v39;
  if (v39)
  {
    objc_msgSend(v39, "doubleValue");
    v33 = round(v32);
    if (v33 <= 3600.0)
      v34 = CFSTR("mm:ss");
    else
      v34 = CFSTR("HH:mm:ss");
    objc_msgSend((id)_mediaDurationFormatter, "setDateFormat:", v34);
    v35 = (void *)_mediaDurationFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringFromDate:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("duration"));

    v31 = v39;
    v18 = (void *)v43;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));
  }

  return v4;
}

+ (id)_loadImageWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:withConfiguration:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_loadImageWithSystemName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", a3);
}

+ (id)flashImageForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 2)
    return 0;
  objc_msgSend(a1, "_loadImageWithName:", CFSTR("LCD-Flash-Fired"), v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)whiteBalanceImageForType:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 - 2 > 7)
    v3 = CFSTR("LCD-WB");
  else
    v3 = off_1E5115FA0[a3 - 2];
  return (id)objc_msgSend(a1, "_loadImageWithName:", v3);
}

+ (id)meteringModeImageForType:(unint64_t)a3
{
  const __CFString *v4;

  v4 = CFSTR("camera.metering.unknown");
  switch(a3)
  {
    case 0uLL:
      return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
    case 1uLL:
      v4 = CFSTR("camera.metering.center.weighted.average");
      break;
    case 2uLL:
      v4 = CFSTR("camera.metering.center.weighted");
      break;
    case 3uLL:
      v4 = CFSTR("camera.metering.spot");
      break;
    case 4uLL:
      v4 = CFSTR("camera.metering.multispot");
      break;
    case 5uLL:
      v4 = CFSTR("camera.metering.matrix");
      break;
    case 6uLL:
      v4 = CFSTR("camera.metering.partial");
      break;
    default:
      if (a3 != 255)
        v4 = CFSTR("camera.metering.none");
      break;
  }
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
}

+ (id)_accessibilityDescriptionForFileType:(unint64_t)a3
{
  __CFString *v3;

  if (a3 > 0x10)
    v3 = CFSTR("PXFileTypeAXDescriptionUnknown");
  else
    v3 = off_1E5115FE0[a3];
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_fileTypeImageForType:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 > 0x11)
    v3 = CFSTR("LCD-Filetype-JPEG");
  else
    v3 = off_1E5116068[a3];
  return (id)objc_msgSend(a1, "_loadImageWithName:", v3);
}

+ (unint64_t)codecTypeForItem:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "px_isProRes") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "px_isH264") & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "px_isHEVC"))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)fileTypeImageForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  PXMetadataDisplayItem *v7;

  objc_msgSend(a1, "_fileTypeImageForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityDescriptionForFileType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:]([PXMetadataDisplayItem alloc], "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v5, v6, 0, CFSTR("com.apple.photos.infoPanel.exif.fileType"), 0);

  return v7;
}

+ (id)megaPixelsDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  BOOL v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "px_resolution");
  v8 = v7;
  if (objc_msgSend(v5, "px_isImage"))
  {
    v9 = (double)(unint64_t)v6 * (double)(unint64_t)v8 / 1000000.0;
    if (v9 >= 1.0)
    {
      v14 = fmod((double)(unint64_t)v6 * (double)(unint64_t)v8 / 1000000.0, 1.0) < 0.9;
      v10 = floor(v9);
      v15 = ceil(v9);
      if (!v14)
        v10 = v15;
    }
    else
    {
      v10 = round(v9 * 10.0) / 10.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v18 = v17;
    if (v4)
      v19 = 5;
    else
      v19 = 1;
    if (v4)
      v20 = CFSTR("PXInfoPanelMegaPixelsAXFormat");
    else
      v20 = CFSTR("PXInfoPanelMegaPixelsFormat");
    objc_msgSend(v17, "setNumberStyle:", v19);
    objc_msgSend(v18, "stringFromNumber:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v20, CFSTR("PhotosUICore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    if (objc_msgSend(v5, "px_isVideo"))
    {
      if (v6 >= v8)
        v12 = v8;
      else
        v12 = v6;
      if (v12 <= 1439)
      {
        switch(v12)
        {
          case 480:
            if (v4)
              v13 = CFSTR("PXInfoPanelVideoResolutionAX480p");
            else
              v13 = CFSTR("PXInfoPanelVideoResolution480p");
            break;
          case 720:
            if (v4)
              v13 = CFSTR("PXInfoPanelVideoResolutionAX720p");
            else
              v13 = CFSTR("PXInfoPanelVideoResolution720p");
            break;
          case 1080:
            if (v4)
              v13 = CFSTR("PXInfoPanelVideoResolutionAX1080p");
            else
              v13 = CFSTR("PXInfoPanelVideoResolution1080p");
            break;
          default:
            goto LABEL_48;
        }
      }
      else if (v12 > 2159)
      {
        if (v12 == 2160)
        {
          if (v4)
            v13 = CFSTR("PXInfoPanelVideoResolutionAX4k");
          else
            v13 = CFSTR("PXInfoPanelVideoResolution4k");
        }
        else
        {
          if (v12 != 4320)
            goto LABEL_48;
          if (v4)
            v13 = CFSTR("PXInfoPanelVideoResolutionAX8k");
          else
            v13 = CFSTR("PXInfoPanelVideoResolution8k");
        }
      }
      else if (v12 == 1440)
      {
        if (v4)
          v13 = CFSTR("PXInfoPanelVideoResolutionAX1440p");
        else
          v13 = CFSTR("PXInfoPanelVideoResolution1440p");
      }
      else
      {
        if (v12 != 1584)
          goto LABEL_48;
        if (v4)
          v13 = CFSTR("PXInfoPanelVideoResolutionAX28k");
        else
          v13 = CFSTR("PXInfoPanelVideoResolution28k");
      }
      PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_48:

  return v11;
}

+ (id)cameraCaptureDeviceDisplayStringForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
    objc_msgSend(v4, "originalImageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C89C80]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (v9 = objc_msgSend(v7, "integerValue") - 2, v9 <= 4))
    {
      PXLocalizedStringFromTable(off_1E51160F8[v9], CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)resolutionDisplayStringForItem:(id)a3 isAccessibility:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v5 = objc_msgSend(a3, "px_resolution");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v12 = CFSTR("PXInfoPanelAXLCDResolutionFormat");
  else
    v12 = CFSTR("PXInfoPanelLCDResolutionFormat");
  PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)hardwareDisplayStringsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "fetchPropertySetsIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_formattedDeviceDescriptionForItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, PXMetadataUtilitiesHardwareKeyDevice);

  objc_msgSend(a1, "_formattedLensDescriptionForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, PXMetadataUtilitiesHardwareKeyFormattedLens);

  objc_msgSend(v4, "px_lensModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, PXMetadataUtilitiesHardwareKeyUnformattedLens);

  return v5;
}

+ (id)_formattedDeviceDescriptionForItem:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  objc_msgSend(v3, "px_formattedCameraModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((objc_msgSend(v3, "px_isScreenshot") & 1) != 0)
    {
      v5 = CFSTR("PXInfoPanelLCDScreenshot");
    }
    else if (objc_msgSend(v3, "px_isScreenRecording"))
    {
      v5 = CFSTR("PXInfoPanelLCDScreenRecording");
    }
    else
    {
      v5 = CFSTR("PXInfoPanelLCDUnknownCamera");
    }
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_formattedLensDescriptionForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXFocalDistanceFormatter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  float v39;
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
  id v54;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v4 = a3;
  objc_msgSend(v4, "px_make");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_lensModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("apple"));

  if ((v9 & 1) != 0)
  {
    v10 = v7;
    v11 = v10;
    if (!v6 || !v10)
      goto LABEL_35;
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1E5149688, 1, 0, objc_msgSend(v10, "length"));
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_apertureStringFromString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_focalLengthFromString:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!_focalLengthFormatter)
    {
      v15 = objc_alloc_init(PXFocalDistanceFormatter);
      v16 = (void *)_focalLengthFormatter;
      _focalLengthFormatter = (uint64_t)v15;

    }
    +[PXMetadataUtilitiesCameraDevice cameraForFocalLength:deviceName:](PXMetadataUtilitiesCameraDevice, "cameraForFocalLength:deviceName:", v14, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v14;
    v63 = a1;
    if (v17)
    {
      v18 = (void *)v13;
      v19 = (void *)_focalLengthFormatter;
      v20 = (void *)v12;
      v21 = v17;
      objc_msgSend(v17, "focalLengthIn35mm");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringForObjectValue:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v21, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ — %@ %@"), v25, v23, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

      objc_msgSend(v63, "_formattedApertureStringWithString:", v26);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringByTrimmingCharactersInSet:", v53);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && objc_msgSend(v11, "length"))
      {
        v54 = v11;
        v11 = v54;
LABEL_36:
        v27 = v54;

        goto LABEL_37;
      }
LABEL_35:
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDUnknownLens"), CFSTR("PhotosUICore"));
      v54 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    objc_msgSend(v4, "px_digitalZoomRatio");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_focalLengthIn35mm");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXMetadataUtilities cameraCaptureDeviceDisplayStringForItem:](PXMetadataUtilities, "cameraCaptureDeviceDisplayStringForItem:", v4);
    v28 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v13;
    if (!v14 || !v25)
    {
      v26 = (void *)v12;
      v23 = v61;
      if (!v28)
      {
LABEL_30:
        objc_msgSend(v26, "capitalizedString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDFaceTimeCamera"), CFSTR("PhotosUICore"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Facetime"), v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDFrontiSightCamera"), CFSTR("PhotosUICore"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Isight"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDFrontTrueDepthCamera"), CFSTR("PhotosUICore"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Truedepth"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Mm"), CFSTR("mm"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Camera "), CFSTR("Camera — "));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v61;
        v20 = 0;
        goto LABEL_31;
      }
LABEL_18:
      v20 = (void *)v28;
LABEL_31:
      v21 = 0;
      v18 = v60;
      goto LABEL_32;
    }
    v58 = v28;
    v29 = (void *)v12;
    if (v61 && (objc_msgSend(v61, "doubleValue"), v30 > 0.0))
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v25, "doubleValue");
      v33 = v32;
      objc_msgSend(v61, "doubleValue");
      objc_msgSend(v31, "numberWithDouble:", v33 / v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = v25;
    }
    v36 = v35;
    objc_msgSend(v63, "_focalLengthStringFromString:", v29);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)_focalLengthFormatter;
    v38 = (void *)MEMORY[0x1E0CB37E8];
    v57 = v36;
    objc_msgSend(v36, "floatValue");
    objc_msgSend(v38, "numberWithLong:", llroundf(v39));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringForObjectValue:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58 && v59 && v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ — %@ %@"), v58, v41, v60);
      v56 = objc_claimAutoreleasedReturnValue();
      v23 = v61;
      v42 = v29;
    }
    else
    {
      if (!v59 || !v41)
      {
        v23 = v61;
        v43 = v29;
LABEL_29:

        v26 = v43;
        v28 = v58;
        if (!v58)
          goto LABEL_30;
        goto LABEL_18;
      }
      v42 = v29;
      objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", v59, v41);
      v56 = objc_claimAutoreleasedReturnValue();
      v23 = v61;
    }

    v43 = (void *)v56;
    goto LABEL_29;
  }
  if (v7)
    objc_msgSend(a1, "_formattedApertureStringWithString:", v7);
  else
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDUnknownLens"), CFSTR("PhotosUICore"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v27;
}

+ (id)_focalLengthFromString:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_418);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_focalLengthStringFromString:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_419);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_apertureStringFromString:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_420);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_formattedApertureStringWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("f/"), CFSTR("ƒ"), 1, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cameraSettingsDisplayStringsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXMetadataDisplayItem *v8;
  PXMetadataDisplayItem *v9;
  void *v10;
  PXMetadataDisplayItem *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PXMetadataDisplayItem *v15;
  PXMetadataDisplayItem *v16;
  PXMetadataDisplayItem *v17;
  void *v18;
  PXMetadataDisplayItem *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __CFString *v23;
  PXMetadataDisplayItem *v24;
  PXMetadataDisplayItem *v25;
  PXMetadataDisplayItem *v26;
  PXMetadataDisplayItem *v27;
  PXMetadataDisplayItem *v28;
  PXMetadataDisplayItem *v29;
  void *v30;
  PXMetadataDisplayItem *v31;
  void *v33;
  PXMetadataDisplayItem *v34;
  void *v35;
  PXMetadataDisplayItem *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  PXMetadataDisplayItem *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  PXMetadataDisplayItem *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[7];

  v53[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "cameraSettingsForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "px_isVideo"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fps"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXMetadataDisplayItem emptyItem](PXMetadataDisplayItem, "emptyItem");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v48;
      v8 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsMediaFPSAXDescription"), CFSTR("PhotosUICore"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v8, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v6);
      v53[1] = v50;
      +[PXMetadataDisplayItem emptyItem](PXMetadataDisplayItem, "emptyItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v47;
      v9 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsMediaDurationAXDescription"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v9, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v7, v10, v7, CFSTR("com.apple.photos.infoPanel.exif.video.duration"), 0);
      v53[3] = v11;
      +[PXMetadataDisplayItem emptyItem](PXMetadataDisplayItem, "emptyItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v53[4] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "px_isAudio"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sampleRate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bitrate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsMediaBitrateAXDescription"), CFSTR("PhotosUICore"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v15, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v6, v49, v6, CFSTR("com.apple.photos.infoPanel.exif.audio.samplerate"), 0);
      v52[0] = v50;
      +[PXMetadataDisplayItem emptyItem](PXMetadataDisplayItem, "emptyItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v47;
      v16 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsMediaBitrateAXDescription"), CFSTR("PhotosUICore"));
      v45 = objc_claimAutoreleasedReturnValue();
      v11 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v16, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v7, v45, v7, CFSTR("com.apple.photos.infoPanel.exif.audio.bitrate"), 0);
      v52[2] = v11;
      +[PXMetadataDisplayItem emptyItem](PXMetadataDisplayItem, "emptyItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v52[3] = v12;
      v17 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsMediaDurationAXDescription"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)v14;
      v19 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v17, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v14, v18, v14, CFSTR("com.apple.photos.infoPanel.exif.audio.duration"), 0);
      v52[4] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)v45;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iso"));
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iso.ax"));
      v20 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v20;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("focalLength"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exposure"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exposure.ax"));
      v50 = (PXMetadataDisplayItem *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aperture"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E5149688);
      v46 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aperture.ax"));
      v11 = (PXMetadataDisplayItem *)objc_claimAutoreleasedReturnValue();
      -[PXMetadataDisplayItem stringByReplacingOccurrencesOfString:withString:](v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_1E5149688);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shutterSpeed"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shutterSpeed.ax"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v4, "px_shotWithNightMode");
      v23 = CFSTR("camera.nightmode");
      if (!v22)
        v23 = 0;
      v37 = v23;
      v24 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsISOAXDescription"), CFSTR("PhotosUICore"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v24, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v44, v42, v20, CFSTR("com.apple.photos.infoPanel.exif.image.iso"), 0);
      v51[0] = v41;
      v25 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsFocalLengthAXDescription"), CFSTR("PhotosUICore"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)v21;
      v36 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v25, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v21, v38, v21, CFSTR("com.apple.photos.infoPanel.exif.image.focalLength"), 0);
      v51[1] = v36;
      v26 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsExposureBiasAXDescription"), CFSTR("PhotosUICore"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v26, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v49, v35, v50, CFSTR("com.apple.photos.infoPanel.exif.image.exposureBias"), 0);
      v51[2] = v34;
      v27 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsApertureAXDescription"), CFSTR("PhotosUICore"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v27, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v46, v33, v12, CFSTR("com.apple.photos.infoPanel.exif.image.aperture"), 0);
      v51[3] = v28;
      v29 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXMetadataUtilitiesCameraSettingsShutterSpeedAXDescription"), CFSTR("PhotosUICore"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v29, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v43, v30, v39, CFSTR("com.apple.photos.infoPanel.exif.image.shutterSpeed"), v37);

      v51[4] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)v44;
      v10 = (void *)v46;

      v7 = v40;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

+ (id)symbolSystemNamesForItem:(id)a3
{
  id v4;
  id v5;
  PXMetadataDisplayItem *v6;
  void *v7;
  PXMetadataDisplayItem *v8;
  uint64_t v9;
  PXMetadataDisplayItem *v10;
  void *v11;
  PXMetadataDisplayItem *v12;
  PXMetadataDisplayItem *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  PXMetadataDisplayItem *v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a1, "flashTypeForItem:", v4) == 2)
  {
    v6 = [PXMetadataDisplayItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionFlash"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v6, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", CFSTR("bolt.circle"), v7, 0, CFSTR("com.apple.photos.infoPanel.exif.symbol.flash.fired"), 0);
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = objc_msgSend(a1, "codecTypeForItem:", v4);
  if (v9 == 1)
  {
    v10 = [PXMetadataDisplayItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelEXIFVideoProResBadge"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v10, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", CFSTR("video.circle.fill"), v11, 0, CFSTR("com.apple.photos.infoPanel.exif.symbol.proRes"), 0);
    objc_msgSend(v5, "addObject:", v12);

  }
  if (objc_msgSend(v4, "px_isCinematicVideo"))
  {
    v13 = [PXMetadataDisplayItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionCinematicVideo"), CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("cinematic.video");
    v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.cinematicVideo");
LABEL_32:
    v17 = -[PXMetadataDisplayItem initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:](v13, "initWithContent:accessibilityDescription:accessibilityValue:accessibilityIdentifier:accessoryImageSystemName:", v15, v14, 0, v16, 0);
    objc_msgSend(v5, "addObject:", v17);

    goto LABEL_33;
  }
  if (objc_msgSend(v4, "px_isActionModeVideo"))
  {
    v13 = [PXMetadataDisplayItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionActionModeVideo"), CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("figure.run.motion.circle.fill");
    v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.actionMode");
    goto LABEL_32;
  }
  if (objc_msgSend(v4, "px_isSpatialMedia"))
  {
    v13 = [PXMetadataDisplayItem alloc];
    PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionSpatialCapture"), CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("spatial");
    v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.spatial");
    goto LABEL_32;
  }
  if (v9 != 1)
  {
    if (objc_msgSend(v4, "px_isDepthEffect"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionDepthEffect"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("f.cursive.circle");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.portrait");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_representsBurst"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionBurst"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("square.stack.3d.down.forward");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.burst");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isPanorama"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionPano"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("pano");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.pano");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isSelfie"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionSelfie"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("person.crop.square");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.selfie");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isLivePhoto"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionLivePhoto"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("livephoto");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.livePhoto");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isScreenshot"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionScreenshot"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("camera.viewfinder");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.screenshot");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isScreenRecording"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionScreenRecording"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("record.circle");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.screenRecording");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isSloMo"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionSloMo"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("slowmo");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.slomo");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isTimelapse"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionTimelapse"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("timelapse");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.timelapse");
      goto LABEL_32;
    }
    if (objc_msgSend(v4, "px_isVideo"))
    {
      v13 = [PXMetadataDisplayItem alloc];
      PXLocalizedStringFromTable(CFSTR("PXInfoPanelSymbolAXDescriptionVideo"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("video");
      v16 = CFSTR("com.apple.photos.infoPanel.exif.symbol.video");
      goto LABEL_32;
    }
  }
LABEL_33:

  return v5;
}

+ (BOOL)isVisionProAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "px_make");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("apple"));

  v8 = 0;
  if (v7 && v5)
  {
    objc_msgSend(v5, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsString:", CFSTR("vision pro"));

  }
  return v8;
}

+ (id)semanticStylesDisplayStringForItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v3, "fetchPropertySetsIfNeeded"), v4 = objc_msgSend(v3, "currentSmartStyleCast"), (_DWORD)v4))
    {
      objc_msgSend(MEMORY[0x1E0D7CAA8], "adjustmentStyleCastDisplayName:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedUppercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v3, "px_semanticStylePreset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6 && v7)
    {
      if (objc_msgSend(v7, "integerValue"))
      {
        CEKDisplayStringForSemanticStyleMakerPreset();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedUppercaseString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __49__PXMetadataUtilities__apertureStringFromString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("f/"));
}

uint64_t __52__PXMetadataUtilities__focalLengthStringFromString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("mm"));
}

uint64_t __46__PXMetadataUtilities__focalLengthFromString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("mm"));
}

void __45__PXMetadataUtilities_cameraSettingsForItem___block_invoke()
{
  PXFocalDistanceFormatter *v0;
  void *v1;
  PXISOFormatter *v2;
  void *v3;
  PXExposureBiasFormatter *v4;
  void *v5;
  PXShutterSpeedFormatter *v6;
  void *v7;
  PXShutterSpeedFormatter *v8;
  void *v9;
  PXApertureFormatter *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;

  if (!_focalLengthFormatter)
  {
    v0 = objc_alloc_init(PXFocalDistanceFormatter);
    v1 = (void *)_focalLengthFormatter;
    _focalLengthFormatter = (uint64_t)v0;

  }
  if (!_isoFormatter)
  {
    v2 = objc_alloc_init(PXISOFormatter);
    v3 = (void *)_isoFormatter;
    _isoFormatter = (uint64_t)v2;

  }
  if (!_exposureFormatter)
  {
    v4 = objc_alloc_init(PXExposureBiasFormatter);
    v5 = (void *)_exposureFormatter;
    _exposureFormatter = (uint64_t)v4;

  }
  if (!_shutterSpeedFormatter)
  {
    v6 = objc_alloc_init(PXShutterSpeedFormatter);
    v7 = (void *)_shutterSpeedFormatter;
    _shutterSpeedFormatter = (uint64_t)v6;

  }
  if (!_shutterSpeedAXFormatter)
  {
    v8 = objc_alloc_init(PXShutterSpeedFormatter);
    v9 = (void *)_shutterSpeedAXFormatter;
    _shutterSpeedAXFormatter = (uint64_t)v8;

    objc_msgSend((id)_shutterSpeedAXFormatter, "setNumberStyle:", 5);
  }
  if (!_apertureFormatter)
  {
    v10 = objc_alloc_init(PXApertureFormatter);
    v11 = (void *)_apertureFormatter;
    _apertureFormatter = (uint64_t)v10;

  }
  if (!_dateFormatter)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v13 = (void *)_dateFormatter;
    _dateFormatter = (uint64_t)v12;

    v14 = (void *)_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimeZone:", v15);

  }
  if (!_intervalFormatter)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB3590]);
    v17 = (void *)_intervalFormatter;
    _intervalFormatter = (uint64_t)v16;

  }
  if (!_mediaDurationFormatter)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v19 = (void *)_mediaDurationFormatter;
    _mediaDurationFormatter = (uint64_t)v18;

    v20 = (void *)_mediaDurationFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTimeZone:", v21);

  }
  if (!_mediaFPSFormatter)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v23 = (void *)_mediaFPSFormatter;
    _mediaFPSFormatter = (uint64_t)v22;

    PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDMediaFPSNumberFormat"), CFSTR("PhotosUICore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_mediaFPSFormatter, "setPositiveFormat:", v24);

  }
  if (!_mediaBitrateFormatter)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v26 = (void *)_mediaBitrateFormatter;
    _mediaBitrateFormatter = (uint64_t)v25;

    PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDMediaBitrateNumberFormat"), CFSTR("PhotosUICore"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_mediaBitrateFormatter, "setPositiveFormat:", v27);

    objc_msgSend((id)_mediaBitrateFormatter, "setMultiplier:", &unk_1E53EF810);
  }
  if (!_mediaSampleRateFormatter)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v29 = (void *)_mediaSampleRateFormatter;
    _mediaSampleRateFormatter = (uint64_t)v28;

    PXLocalizedStringFromTable(CFSTR("PXInfoPanelLCDMediaSampleRateNumberFormat"), CFSTR("PhotosUICore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_mediaSampleRateFormatter, "setPositiveFormat:", v30);

    objc_msgSend((id)_mediaSampleRateFormatter, "setMultiplier:", &unk_1E53EF810);
  }
}

void __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateExtendedAttributesUsingOriginalMediaMetadata");

}

void __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "InfoPanelEXIFMetadataProcessing", ", buf, 2u);
  }

  if ((v5 || (a2 & 1) == 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to process EXIF metadata for asset: %@ with error: %@", buf, 0x16u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_164;
  v12[3] = &unk_1E51427B0;
  v9 = *(NSObject **)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = a2;
  dispatch_async(v9, v12);

}

uint64_t __78__PXMetadataUtilities_processExifMetadataForItem_resultHandler_callbackQueue___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __104__PXMetadataUtilities_requestExifMetadataProcessingIfNeededForItem_onProcessingQueue_withResultHandler___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "px_isExtendedPropertiesProcessed"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return +[PXMetadataUtilities processExifMetadataForItem:resultHandler:callbackQueue:](PXMetadataUtilities, "processExifMetadataForItem:resultHandler:callbackQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), MEMORY[0x1E0C80D38]);
}

@end
