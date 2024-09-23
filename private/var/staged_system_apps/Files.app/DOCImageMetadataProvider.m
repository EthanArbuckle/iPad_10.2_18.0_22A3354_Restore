@implementation DOCImageMetadataProvider

+ (id)imageMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5
{
  id v7;
  const __CFURL *v8;
  void *v9;
  void *v10;
  void *v11;
  CGImageSource *v12;
  DOCImageMetadataProvider *v13;
  CFDictionaryRef v14;
  CGImageMetadataRef v15;

  v7 = a3;
  v8 = (const __CFURL *)a5;
  if (!v8)
    goto LABEL_9;
  if (qword_100658FC0 != -1)
    dispatch_once(&qword_100658FC0, &stru_1005BE778);
  v9 = (void *)qword_100658FB8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  LODWORD(v9) = objc_msgSend(v9, "containsObject:", v11);

  if ((_DWORD)v9)
  {
    v12 = CGImageSourceCreateWithURL(v8, 0);
    v13 = (DOCImageMetadataProvider *)v12;
    if (v12)
    {
      v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
      if (v14)
      {
        v15 = CGImageSourceCopyMetadataAtIndex((CGImageSourceRef)v13, 0, 0);
        CFRelease(v13);
        if (v15)
        {
          v13 = objc_opt_new(DOCImageMetadataProvider);
          v13->_levelOfDetail = a4;
          objc_storeStrong((id *)&v13->_imageProperties, v14);
          v13->_metadata = v15;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        CFRelease(v13);
      }
      v13 = 0;
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_metadata);
  v3.receiver = self;
  v3.super_class = (Class)DOCImageMetadataProvider;
  -[DOCImageMetadataProvider dealloc](&v3, "dealloc");
}

- (void)addHasSizeToDictionary:(id)a3
{
  NSDictionary *imageProperties;
  id v5;
  double v6;
  double v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  void *v18;
  id v19;

  imageProperties = self->_imageProperties;
  v5 = a3;
  v6 = 0.0;
  v7 = 0.0;
  v19 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](imageProperties, "objectForKeyedSubscript:", kCGImagePropertyPixelWidth));
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v7 = v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyPixelHeight));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v6 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyOrientation));
  v13 = v12;
  if (v12 && ((v14 = objc_msgSend(v12, "intValue"), v14 != 8) ? (v15 = v14 == 6) : (v15 = 1), v15))
  {
    v16 = v7;
  }
  else
  {
    v16 = v6;
    v6 = v7;
  }
  v17 = DOCLocalizedMetadataStringForWidthByHeight(v6, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("Dimensions"));

}

- (void)addHasDPIToDictionary:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyDPIWidth));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = 0.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyDPIHeight));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    if (v7 > 0.0 && v10 > 0.0)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyOrientation));
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, "intValue");
        v15 = v14 == 8 || v14 == 6;
        if (v15)
          v16 = v7;
        else
          v16 = v11;
        if (v15)
          v7 = v11;
        v11 = v16;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d × %d"), (int)v7, (int)v11));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("Resolution"));

    }
  }

}

- (void)addHasAlphaToDictionary:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyHasAlpha));
  v5 = v4;
  if (v4)
  {
    v6 = DOCLocalizedMetadataYesNoStringForBool(objc_msgSend(v4, "BOOLValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("hasAlpha"));

  }
}

- (void)addColorInfoToDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyNamedColorSpace));
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("ColorSpace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyProfileName));
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("ColorProfile"));

}

- (void)addCGExifPropertiesToDictionary:(id)a3
{
  void *v4;
  DOCDecimalMetadataDisplayFormat *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  DOCDecimalMetadataDisplayFormat *v11;
  void *v12;
  void *v13;
  DOCDecimalMetadataDisplayFormat *v14;
  void *v15;
  void *v16;
  DOCDecimalMetadataDisplayFormat *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;

  v34 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyExifDictionary));
  if (v4)
  {
    v5 = objc_opt_new(DOCDecimalMetadataDisplayFormat);
    -[DOCDecimalMetadataDisplayFormat setMaxFractionalDigits:](v5, "setMaxFractionalDigits:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifApertureValue));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataValue:](v5, "displayStringForMetadataValue:", v6));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v7, CFSTR("ApertureValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifExposureProgram));
    v9 = DOCLocalizedMetadataStringForExposureProgramNumber();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v10, CFSTR("ExposureProgram"));

    v11 = objc_opt_new(DOCDecimalMetadataDisplayFormat);
    -[DOCDecimalMetadataDisplayFormat setMaxFractionalDigits:](v11, "setMaxFractionalDigits:", 4);
    -[DOCDecimalMetadataDisplayFormat setPrefersIntegerFractionalDisplay:](v11, "setPrefersIntegerFractionalDisplay:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifExposureTime));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataValue:](v11, "displayStringForMetadataValue:", v12));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v13, CFSTR("ExposureTime"));

    v14 = objc_opt_new(DOCDecimalMetadataDisplayFormat);
    -[DOCDecimalMetadataDisplayFormat setMaxFractionalDigits:](v14, "setMaxFractionalDigits:", 4);
    -[DOCDecimalMetadataDisplayFormat setLengthUnits:](v14, "setLengthUnits:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifFocalLength));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataValue:](v14, "displayStringForMetadataValue:", v15));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v16, CFSTR("FocalLength"));

    v17 = objc_opt_new(DOCDecimalMetadataDisplayFormat);
    v18 = _DocumentManagerBundle(-[DOCDecimalMetadataDisplayFormat setMaxFractionalDigits:](v17, "setMaxFractionalDigits:", 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("f/%1$@"), CFSTR("f/%1$@"), CFSTR("Localizable")));

    -[DOCDecimalMetadataDisplayFormat setDecimalFormatString:](v17, "setDecimalFormatString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifFNumber));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DOCDecimalMetadataDisplayFormat displayStringForMetadataValue:](v17, "displayStringForMetadataValue:", v21));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, CFSTR("FNumber"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifMeteringMode));
    v24 = DOCLocalizedMetadataStringForMeteringModeNumber();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v25, CFSTR("MeteringMode"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifISOSpeedRatings));
    v27 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

      v26 = (void *)v28;
    }
    v29 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v26, v29) & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v30, CFSTR("ISOSpeed"));

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifWhiteBalance));
    v32 = DOCLocalizedMetadataStringForWhiteBalanceModeNumber();
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("WhiteBalance"));

  }
}

- (void)addFlashProperitesToDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyExifDictionary));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifFlash));
    v7 = v6;
    if (v6)
    {
      v8 = (unint64_t)objc_msgSend(v6, "integerValue");
      v9 = DOCLocalizedMetadataYesNoStringForBool(v8 & 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("Flash"));

      v11 = DOCLocalizedMetadataYesNoStringForBool((v8 >> 6) & 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("FlashRedEye"));

    }
  }

}

- (void)addGPSInfoToDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  v9 = 0.0;
  v10 = 0.0;
  if (DOCSpotlightGPSInfoFromCGImagePropertyDictionary(self->_imageProperties, &v10, &v9))
  {
    v5 = DOCLocalizedMetadataStringForLatitude(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = DOCLocalizedMetadataStringForLongitude(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (objc_msgSend(v6, "length") && objc_msgSend(v8, "length"))
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("GPSLatitude"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("GPSLongitude"));
    }

  }
}

- (void)addDigitalSourceTypeToDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyIPTCDictionary));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyIPTCExtDigitalSourceType));
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("CreatorTool"));

}

- (void)addCreditTypeToDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_imageProperties, "objectForKeyedSubscript:", kCGImagePropertyIPTCDictionary));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyIPTCCredit));
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("Credit"));

}

- (BOOL)readTag:(CGImageMetadataTag *)a3 path:(id)a4 title:(id *)a5 value:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v9 = a4;
  *a5 = (id)(id)CGImageMetadataTagCopyName(a3);
  v10 = (void *)CGImageMetadataTagCopyValue(a3);
  LODWORD(a3) = objc_msgSend(&__NSArray0__struct, "containsObject:", v9);

  if ((_DWORD)a3 && (objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0)
  {
    v11 = DOCLocalizedMetadataYesNoStringForBool(objc_msgSend(v10, "BOOLValue"));
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v12 = objc_retainAutorelease(v10);
  }
  *a6 = v12;

  return 1;
}

- (NSArray)displaySortOrder
{
  _QWORD v3[22];

  v3[0] = CFSTR("Dimensions");
  v3[1] = CFSTR("Resolution");
  v3[2] = CFSTR("ColorSpace");
  v3[3] = CFSTR("ColorProfile");
  v3[4] = CFSTR("hasAlpha");
  v3[5] = CFSTR("Make");
  v3[6] = CFSTR("Model");
  v3[7] = CFSTR("LensModel");
  v3[8] = CFSTR("ApertureValue");
  v3[9] = CFSTR("ExposureTime");
  v3[10] = CFSTR("ExposureProgram");
  v3[11] = CFSTR("FocalLength");
  v3[12] = CFSTR("ISOSpeed");
  v3[13] = CFSTR("Flash");
  v3[14] = CFSTR("FlashRedEye");
  v3[15] = CFSTR("FNumber");
  v3[16] = CFSTR("MeteringMode");
  v3[17] = CFSTR("WhiteBalance");
  v3[18] = CFSTR("Credit");
  v3[19] = CFSTR("CreatorTool");
  v3[20] = CFSTR("GPSLatitude");
  v3[21] = CFSTR("GPSLongitude");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 22));
}

- (NSDictionary)metadataValues
{
  int64_t levelOfDetail;
  const char *v3;

  levelOfDetail = self->_levelOfDetail;
  if (!levelOfDetail)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[DOCImageMetadataProvider compactMetadataValues](self, "compactMetadataValues"));
    goto LABEL_5;
  }
  if (levelOfDetail == 1)
  {
    v3 = (const char *)objc_claimAutoreleasedReturnValue(-[DOCImageMetadataProvider fullMetadataValues](self, "fullMetadataValues"));
LABEL_5:
    a2 = v3;
  }
  return (NSDictionary *)(id)a2;
}

- (id)compactMetadataValues
{
  NSMutableDictionary *v3;

  v3 = objc_opt_new(NSMutableDictionary);
  -[DOCImageMetadataProvider addHasSizeToDictionary:](self, "addHasSizeToDictionary:", v3);
  return v3;
}

- (id)fullMetadataValues
{
  NSMutableDictionary *v3;
  void *v4;
  CGImageMetadata *metadata;
  NSMutableDictionary *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  _QWORD block[4];
  id v12;
  DOCImageMetadataProvider *v13;
  NSMutableDictionary *v14;

  v3 = objc_opt_new(NSMutableDictionary);
  -[DOCImageMetadataProvider addHasSizeToDictionary:](self, "addHasSizeToDictionary:", v3);
  -[DOCImageMetadataProvider addHasDPIToDictionary:](self, "addHasDPIToDictionary:", v3);
  -[DOCImageMetadataProvider addHasAlphaToDictionary:](self, "addHasAlphaToDictionary:", v3);
  -[DOCImageMetadataProvider addColorInfoToDictionary:](self, "addColorInfoToDictionary:", v3);
  -[DOCImageMetadataProvider addGPSInfoToDictionary:](self, "addGPSInfoToDictionary:", v3);
  -[DOCImageMetadataProvider addCGExifPropertiesToDictionary:](self, "addCGExifPropertiesToDictionary:", v3);
  -[DOCImageMetadataProvider addFlashProperitesToDictionary:](self, "addFlashProperitesToDictionary:", v3);
  -[DOCImageMetadataProvider addCreditTypeToDictionary:](self, "addCreditTypeToDictionary:", v3);
  -[DOCImageMetadataProvider addDigitalSourceTypeToDictionary:](self, "addDigitalSourceTypeToDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", CFSTR("exifEX:LensModel"), CFSTR("tiff:Model"), CFSTR("tiff:Make"), CFSTR("xmp:CreatorTool"), 0));
  metadata = self->_metadata;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA9C0;
  block[3] = &unk_1005BE7A0;
  v12 = v4;
  v13 = self;
  v6 = v3;
  v14 = v6;
  v7 = v4;
  CGImageMetadataEnumerateTagsUsingBlock(metadata, 0, 0, block);
  v8 = v14;
  v9 = v6;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);
}

@end
