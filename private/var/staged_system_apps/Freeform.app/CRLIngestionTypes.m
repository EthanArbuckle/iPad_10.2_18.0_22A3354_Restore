@implementation CRLIngestionTypes

+ (NSArray)nativeTypes
{
  if (qword_101414BE0 != -1)
    dispatch_once(&qword_101414BE0, &stru_10122E198);
  return (NSArray *)(id)qword_101414BD8;
}

+ (NSArray)supportedImageTypes
{
  if (qword_101414BF0 != -1)
    dispatch_once(&qword_101414BF0, &stru_10122E1B8);
  return (NSArray *)(id)qword_101414BE8;
}

+ (NSArray)supportedImageUTTypes
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000313B0;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101414C00 != -1)
    dispatch_once(&qword_101414C00, block);
  return (NSArray *)(id)qword_101414BF8;
}

+ (NSArray)unsupportedImageTypes
{
  if (qword_101414C10 != -1)
    dispatch_once(&qword_101414C10, &stru_10122E1D8);
  return (NSArray *)(id)qword_101414C08;
}

+ (NSArray)supportedMovieTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMovie, "identifier"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeAudio, "identifier"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedMovieAnimatedImageTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));

  return (NSArray *)v7;
}

+ (NSArray)supportedMovieAnimatedImageTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeGIF, "identifier"));
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "highEfficiencyImageTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6));

  return (NSArray *)v7;
}

+ (NSArray)supportedMovieUTTypes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = UTTypeMovie;
  v7[1] = UTTypeAudio;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedMovieAnimatedImageUTTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return (NSArray *)v5;
}

+ (NSArray)supportedMovieAnimatedImageUTTypes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = UTTypeGIF;
  v7[1] = UTTypePNG;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "highEfficiencyImageUTTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return (NSArray *)v5;
}

+ (NSArray)supported3DFileUTTypes
{
  _QWORD v3[3];

  v3[0] = UTTypeUSDZ;
  v3[1] = UTTypeRealityFile;
  v3[2] = UTTypeUSD;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

+ (NSArray)supported3DFileTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUSDZ, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRealityFile, "identifier", v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUSD, "identifier"));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));

  return (NSArray *)v5;
}

+ (NSArray)supportedGenericFileUTTypes
{
  _QWORD v3[7];

  v3[0] = UTTypeContent;
  v3[1] = UTTypeEmailMessage;
  v3[2] = UTTypeArchive;
  v3[3] = UTTypeZIP;
  v3[4] = UTTypeExecutable;
  v3[5] = UTTypeDatabase;
  v3[6] = UTTypeDiskImage;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 7));
}

+ (NSArray)supportedGenericFileTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeContent, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeEmailMessage, "identifier", v2));
  v11[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeArchive, "identifier"));
  v11[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeZIP, "identifier"));
  v11[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeExecutable, "identifier"));
  v11[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeDatabase, "identifier"));
  v11[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeDiskImage, "identifier"));
  v11[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 7));

  return (NSArray *)v9;
}

+ (NSArray)supportedRichTextTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFlatRTFD, "identifier", v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTFD, "identifier"));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));

  return (NSArray *)v5;
}

+ (NSArray)supportedRichTextUTTypes
{
  _QWORD v3[3];

  v3[0] = UTTypeRTF;
  v3[1] = UTTypeFlatRTFD;
  v3[2] = UTTypeRTFD;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

+ (BOOL)isValidFileType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedGenericFileUTTypes](CRLIngestionTypes, "supportedGenericFileUTTypes"));
  if (objc_msgSend(v3, "crl_conformsToAnyUTType:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInfoImporterBoardItemProvider disallowedTypes](CRLInfoImporterBoardItemProvider, "disallowedTypes"));
    if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedRichTextUTTypes](CRLIngestionTypes, "supportedRichTextUTTypes"));
      if ((objc_msgSend(v3, "crl_conformsToAnyUTType:", v7) & 1) != 0)
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
        if (+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", v8)
          || (objc_msgSend(v3, "isEqual:", UTTypeHTML) & 1) != 0)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          v6 = objc_msgSend(v3, "isEqual:", UTTypeWebArchive) ^ 1;
        }

      }
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isValidPlainTextUTI:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_unsupportedPlainTextTypes"));
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_supportedPlainTextTypes"));
    if (objc_msgSend(v4, "crl_conformsToAnyUTI:", v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "supportedRichTextTypes"));
      v6 = objc_msgSend(v8, "containsObject:", v4) ^ 1;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  return v6;
}

+ (id)p_supportedPlainTextTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString readableTypeIdentifiersForItemProvider](NSString, "readableTypeIdentifiersForItemProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePlainText, "identifier"));
  v10[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeText, "identifier"));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL readableTypeIdentifiersForItemProvider](NSURL, "readableTypeIdentifiersForItemProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7));

  return v8;
}

+ (id)p_unsupportedPlainTextTypes
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
  v3 = sub_100030F44();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier", v2));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeSVG, "identifier"));
  v9[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));

  return v7;
}

+ (NSArray)highEfficiencyImageTypes
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHEIC, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHEIF, "identifier", v2));
  v9[1] = v3;
  v4 = sub_100032438();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));

  return (NSArray *)v7;
}

+ (NSArray)highEfficiencyImageUTTypes
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[0] = UTTypeHEIC;
  v6[1] = UTTypeHEIF;
  v2 = sub_100032438();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));

  return (NSArray *)v4;
}

+ (NSArray)imageTypesThatRequireConversion
{
  return (NSArray *)&__NSArray0__struct;
}

+ (id)imageUTTypesThatRequireConversion
{
  return &__NSArray0__struct;
}

@end
