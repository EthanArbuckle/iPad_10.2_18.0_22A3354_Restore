@implementation PHAsset(PXMetadataDetailsContentItem)

- (id)_px_currentRAWResource
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "ipx_isRAWOnTop"))
    return 0;
  objc_getAssociatedObject(a1, (const void *)_px_currentRAWResource_PXSelectionProviderContentItemCurrentRawResourceKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", a1);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v4)
            objc_enumerationMutation(v3);
          v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v6, "type", (_QWORD)v8) == 4)
          {
            v2 = v6;
            objc_setAssociatedObject(a1, (const void *)_px_currentRAWResource_PXSelectionProviderContentItemCurrentRawResourceKey, v2, (void *)1);
            goto LABEL_14;
          }
        }
        v2 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v2;
}

- (BOOL)px_isImage
{
  return objc_msgSend(a1, "mediaType") == 1;
}

- (BOOL)px_isVideo
{
  return objc_msgSend(a1, "mediaType") == 2;
}

- (BOOL)px_isAudio
{
  return objc_msgSend(a1, "mediaType") == 3;
}

- (uint64_t)px_type
{
  uint64_t v2;
  char v3;
  uint64_t result;
  char v5;

  v2 = objc_msgSend(a1, "RAWBadgeAttributes");
  v3 = objc_msgSend(a1, "isJPEG");
  result = 0;
  if ((v3 & 1) == 0 && v2 != 2)
  {
    if ((objc_msgSend(a1, "isHEIF") & 1) != 0)
    {
      return 1;
    }
    else
    {
      v5 = objc_msgSend(a1, "isRAW");
      result = 2;
      if ((v5 & 1) == 0 && v2 != 1)
      {
        if ((objc_msgSend(a1, "isAnimatedGIF") & 1) != 0)
        {
          return 3;
        }
        else if ((objc_msgSend(a1, "isPNG") & 1) != 0)
        {
          return 4;
        }
        else if ((objc_msgSend(a1, "isTIFF") & 1) != 0)
        {
          return 5;
        }
        else if ((objc_msgSend(a1, "isPDF") & 1) != 0)
        {
          return 6;
        }
        else if ((objc_msgSend(a1, "isPSD") & 1) != 0)
        {
          return 7;
        }
        else if ((objc_msgSend(a1, "isJPEG2000") & 1) != 0)
        {
          return 8;
        }
        else if ((objc_msgSend(a1, "isAudio") & 1) != 0)
        {
          return 9;
        }
        else if (objc_msgSend(a1, "isVideo"))
        {
          return 10;
        }
        else
        {
          return 12;
        }
      }
    }
  }
  return result;
}

- (uint64_t)px_originalType
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v1 = (void *)MEMORY[0x1E0D752F0];
  objc_msgSend(MEMORY[0x1E0CD1390], "originalUniformTypeIdentifierForAsset:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "typeWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "avifType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "conformsToType:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = 11;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC698]) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC5B8]) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4F8]) & 1) != 0)
    {
      v4 = 3;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0)
    {
      v4 = 4;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC600]) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0)
    {
      v4 = 6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "conformsToType:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = 7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D752F0], "jpeg2000Type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "conformsToType:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = 8;
        }
        else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC450]) & 1) != 0)
        {
          v4 = 9;
        }
        else if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]))
        {
          v4 = 10;
        }
        else
        {
          v4 = 12;
        }
      }
    }
  }

  return v4;
}

- (unint64_t)px_fileType
{
  return +[PXMetadataUtilities fileTypeForItem:type:](PXMetadataUtilities, "fileTypeForItem:type:", a1, objc_msgSend(a1, "px_type"));
}

- (unint64_t)px_originalFileType
{
  return +[PXMetadataUtilities fileTypeForItem:type:](PXMetadataUtilities, "fileTypeForItem:type:", a1, objc_msgSend(a1, "px_originalType"));
}

- (id)px_title
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "descriptionProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_assetDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "descriptionProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "assetDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)px_isExtendedPropertiesProcessed
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)px_filename
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_px_currentRAWResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = a1;
  objc_msgSend(v2, "originalFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)px_filesize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_px_currentRAWResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "fileSize"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "fetchPropertySetsIfNeeded");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "originalMetadataProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedLong:", objc_msgSend(v6, "originalFilesize"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)px_originalCreationDate
{
  return objc_msgSend(a1, "originalCreationDateWithTimeZone:", 0);
}

- (uint64_t)px_originalLocation
{
  return PHAssetOriginalLocationForAsset();
}

- (id)px_timeZone
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "originalMetadataProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)px_originalTimeZone
{
  void *v1;
  id v2;
  id v4;

  v4 = 0;
  objc_msgSend(a1, "originalCreationDateWithTimeZone:", &v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (uint64_t)px_fetchCloudLocalState
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "cloudLocalStateProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "assetCloudLocalState");

  return v2;
}

- (uint64_t)px_resolution
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "_px_currentRAWResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "pixelWidth");
    v5 = v3;
  }
  else
  {
    v4 = objc_msgSend(a1, "pixelWidth");
    v5 = a1;
  }
  objc_msgSend(v5, "pixelHeight");

  return v4;
}

- (uint64_t)px_supportsImageProperties
{
  uint64_t result;

  result = objc_msgSend(a1, "mediaType");
  if (result != 1)
    return objc_msgSend(a1, "mediaType") == 2;
  return result;
}

- (uint64_t)px_hasKeywords
{
  return 0;
}

- (uint64_t)px_duration
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "duration");
  return objc_msgSend(v1, "numberWithDouble:");
}

- (id)px_FPS
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_bitRate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bitrate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_sampleRate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sampleRate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_codec
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_aperture
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "aperture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_exposureBias
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "exposureBias");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_flash
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flashFired");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_focalLength
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "focalLength");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_focalLengthIn35mm
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "focalLengthIn35mm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_digitalZoomRatio
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "digitalZoomRatio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_ISORating
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "iso");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_lensModel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lensModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_make
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraMake");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_model
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_formattedCameraModel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "formattedCameraModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_meteringMode
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "meteringMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_shutterSpeed
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shutterSpeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)px_whiteBalance
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "whiteBalance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)px_audioTrackFormat
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trackFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (uint64_t)px_canUseLocation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  v3 = (void *)MEMORY[0x1E0D71860];
  objc_msgSend(a1, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v5 = objc_msgSend(v3, "canUseCoordinate:");

  return v5;
}

- (uint64_t)px_reverseLocationDataIsValid
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "photosOneUpProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "reverseLocationDataIsValid");

  return v2;
}

- (BOOL)ipx_isRAWOnTop
{
  return objc_msgSend(a1, "RAWBadgeAttributes") == 1;
}

- (unint64_t)px_isDepthEffect
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 4) & 1;
}

- (unint64_t)px_isActionModeVideo
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 22) & 1;
}

- (uint64_t)px_isPanorama
{
  return objc_msgSend(a1, "mediaSubtypes") & 1;
}

- (uint64_t)px_isSelfie
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "cameraCaptureDeviceProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isSelfie");

  return v2;
}

- (unint64_t)px_isScreenshot
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 2) & 1;
}

- (unint64_t)px_isScreenRecording
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 19) & 1;
}

- (unint64_t)px_isSloMo
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 17) & 1;
}

- (unint64_t)px_isTimelapse
{
  return ((unint64_t)objc_msgSend(a1, "mediaSubtypes") >> 18) & 1;
}

- (uint64_t)px_isH264
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "px_codec");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringForOSType(0x61766331u);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

- (uint64_t)px_isHEVC
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "px_codec");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringForOSType(0x68766331u);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

- (id)px_semanticStylePreset
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "photosInfoPanelExtendedProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "semanticStylePreset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
