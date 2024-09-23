@implementation MFAttachment

- (unint64_t)nanoAttachmentType
{
  if (-[MFAttachment isDXF](self, "isDXF"))
    return 2;
  if ((-[MFAttachment isPDFFile](self, "isPDFFile") & 1) != 0)
    return 14;
  if (-[MFAttachment isImageFile](self, "isImageFile"))
  {
    if (-[MFAttachment isGIF](self, "isGIF"))
      return 22;
    else
      return 5;
  }
  else if ((-[MFAttachment isMedia](self, "isMedia") & 1) != 0)
  {
    return 6;
  }
  else if ((-[MFAttachment isRFC822](self, "isRFC822") & 1) != 0)
  {
    return 7;
  }
  else if ((-[MFAttachment isCalendarFile](self, "isCalendarFile") & 1) != 0)
  {
    return 13;
  }
  else if ((-[MFAttachment isPass](self, "isPass") & 1) != 0)
  {
    return 20;
  }
  else if (-[MFAttachment isRTF](self, "isRTF"))
  {
    return 10;
  }
  else if (-[MFAttachment isCSV](self, "isCSV"))
  {
    return 11;
  }
  else if (-[MFAttachment isHTML](self, "isHTML"))
  {
    return 16;
  }
  else if (-[MFAttachment isVCard](self, "isVCard"))
  {
    return 4;
  }
  else if (-[MFAttachment isZip](self, "isZip"))
  {
    return 15;
  }
  else if (-[MFAttachment isExcel](self, "isExcel"))
  {
    return 17;
  }
  else if (-[MFAttachment isPowerpoint](self, "isPowerpoint"))
  {
    return 18;
  }
  else if (-[MFAttachment isMSWord](self, "isMSWord"))
  {
    return 19;
  }
  else if (-[MFAttachment isCertificate](self, "isCertificate"))
  {
    return 12;
  }
  else if (-[MFAttachment isProfile](self, "isProfile"))
  {
    return 3;
  }
  else if (-[MFAttachment isVPN](self, "isVPN"))
  {
    return 8;
  }
  else if (-[MFAttachment isWatchFace](self, "isWatchFace"))
  {
    return 21;
  }
  else if (-[MFAttachment isWorkout](self, "isWorkout"))
  {
    return 23;
  }
  else if (-[MFAttachment isPlainText](self, "isPlainText"))
  {
    return 9;
  }
  else
  {
    return 1;
  }
}

- (BOOL)isGIF
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeGIF, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isDXF
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
  v3 = objc_msgSend(CFSTR("image/vnd.dxf"), "caseInsensitiveCompare:", v2) == 0;

  return v3;
}

- (BOOL)isProfile
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  if (objc_msgSend(CFSTR("com.apple.mobileconfig"), "compare:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
    v5 = objc_msgSend(CFSTR("com.apple.mobileprovision"), "compare:", v4) == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isVCard
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isVPN
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePKCS12, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isPlainText
{
  void *v2;
  char IsPlainText;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  IsPlainText = MFContentTypeIsPlainText();

  return IsPlainText;
}

- (BOOL)isRTF
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isCSV
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeCommaSeparatedText, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isCertificate
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeX509Certificate, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isZip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeZIP, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  if (objc_msgSend(v3, "compare:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeGZIP, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
    if (objc_msgSend(v5, "compare:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeBZ2, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
      v9 = objc_msgSend(v7, "compare:", v8) == 0;

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isHTML
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHTML, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v5 = objc_msgSend(v3, "compare:", v4) == 0;

  return v5;
}

- (BOOL)isExcel
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("application/vnd.ms-excel"), CFSTR("application/vnd.ms-excel.sheet.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"), CFSTR("application/vnd.ms-excel.template.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.template"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
    v6 = objc_msgSend(v3, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPowerpoint
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("application/vnd.ms-powerpoint"), CFSTR("application/vnd.ms-powerpoint"), CFSTR("application/vnd.ms-powerpoint.template.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.template"), CFSTR("application/vnd.ms-powerpoint.slideshow.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.slideshow"), CFSTR("application/vnd.ms-powerpoint.presentation.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.presentation"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
    v6 = objc_msgSend(v3, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isMSWord
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("application/msword"), CFSTR("application/vnd.ms-word.document.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.document"), CFSTR("application/vnd.ms-word.template.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.template"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment mimeType](self, "mimeType"));
    v6 = objc_msgSend(v3, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isWatchFace
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentTypeIdentifier](self, "contentTypeIdentifier"));
  v3 = objc_msgSend(CFSTR("com.apple.watchface"), "compare:", v2) == 0;

  return v3;
}

- (BOOL)isWorkout
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFAttachment contentType](self, "contentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = objc_msgSend(CFSTR("com.apple.workout"), "compare:", v3) == 0;

  return v4;
}

@end
