@implementation PTPFile

- (unsigned)unsignedIntegerValue
{
  return self->_objectHandle;
}

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("file");
}

- (PTPFile)initWithPHPTPAsset:(id)a3 supportedFormats:(id)a4 andParent:(id)a5
{
  id v8;
  id v9;
  id v10;
  PTPFile *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *baseName;
  void *v16;
  void *v17;
  PTPObjectInfoDataset *v18;
  PTPObjectInfoDataset *objectInfoDataset;
  PTPObjectInfoDataset *v20;
  double v21;
  PTPObjectInfoDataset *v22;
  double v23;
  PTPObjectInfoDataset *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  PTPObjectInfoDataset *v30;
  uint64_t v31;
  unsigned int size;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  PHPTPAssetHandle *plAssetHandle;
  void *v40;
  PTPObjectInfoDataset *v41;
  void *v42;
  PTPObjectInfoDataset *v43;
  void *v44;
  PTPObjectInfoDataset *v45;
  void *v46;
  PTPObjectInfoDataset *v47;
  void *v48;
  PTPObjectInfoDataset *v49;
  void *v50;
  PTPObjectInfoDataset *v51;
  void *v52;
  PTPObjectInfoDataset *v53;
  void *v54;
  PTPObjectInfoDataset *v55;
  void *v56;
  PTPObjectInfoDataset *v57;
  void *v58;
  PTPObjectInfoDataset *v59;
  void *v60;
  PTPObjectInfoDataset *v61;
  void *v62;
  PTPObjectInfoDataset *v63;
  void *v64;
  PTPObjectInfoDataset *v65;
  void *v66;
  PTPObjectInfoDataset *v67;
  void *v68;
  PTPObjectInfoDataset *v69;
  void *v70;
  objc_super v72;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v72.receiver = self;
  v72.super_class = (Class)PTPFile;
  v11 = -[PTPFile init](&v72, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filename"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByDeletingPathExtension"));
    v14 = (NSString *)objc_msgSend(v13, "copy");
    baseName = v11->_baseName;
    v11->_baseName = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectCompressedSize"));
    v11->_size = (int64_t)objc_msgSend(v16, "unsignedLongLongValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storage"));
    v11->_storageID = objc_msgSend(v17, "storageID");

    objc_storeWeak(&v11->_parent, v10);
    v11->_objectHandle = sub_100004C30();
    v18 = objc_alloc_init(PTPObjectInfoDataset);
    objectInfoDataset = v11->_objectInfoDataset;
    v11->_objectInfoDataset = v18;

    v11->_desiredOrientation = objc_msgSend(v8, "desiredOrientation");
    -[PTPFile assignPTPObjectFormatCode:supportedFormats:](v11, "assignPTPObjectFormatCode:supportedFormats:", v8, v9);
    -[PTPObjectInfoDataset setStorageID:](v11->_objectInfoDataset, "setStorageID:", v11->_storageID);
    -[PTPObjectInfoDataset setObjectCompressedSize:](v11->_objectInfoDataset, "setObjectCompressedSize:", v11->_size);
    -[PTPObjectInfoDataset setProtectionStatus:](v11->_objectInfoDataset, "setProtectionStatus:", 0);
    -[PTPObjectInfoDataset setParentObject:](v11->_objectInfoDataset, "setParentObject:", objc_msgSend(v10, "objectHandle"));
    -[PTPObjectInfoDataset setSequenceNumber:](v11->_objectInfoDataset, "setSequenceNumber:", objc_msgSend(v8, "conversionGroup"));
    -[PTPObjectInfoDataset setFilename:](v11->_objectInfoDataset, "setFilename:", v12);
    -[PTPObjectInfoDataset setObjectHandle:](v11->_objectInfoDataset, "setObjectHandle:", v11->_objectHandle);
    v20 = v11->_objectInfoDataset;
    objc_msgSend(v8, "imagePixSize");
    -[PTPObjectInfoDataset setImagePixWidth:](v20, "setImagePixWidth:", v21);
    v22 = v11->_objectInfoDataset;
    objc_msgSend(v8, "imagePixSize");
    -[PTPObjectInfoDataset setImagePixHeight:](v22, "setImagePixHeight:", v23);
    v24 = v11->_objectInfoDataset;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "thumbOffset"));
    -[PTPObjectInfoDataset setThumbOffset:](v24, "setThumbOffset:", objc_msgSend(v25, "unsignedIntValue"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "thumbCompressedSize"));
    v27 = objc_msgSend(v26, "unsignedIntValue");

    if ((_DWORD)v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "thumbOffset"));
      v29 = objc_msgSend(v28, "unsignedIntValue");

      v30 = v11->_objectInfoDataset;
      if ((_DWORD)v29)
      {
        -[PTPObjectInfoDataset setThumbOffset:](v30, "setThumbOffset:", v29);
        v30 = v11->_objectInfoDataset;
        v31 = (uint64_t)v27;
      }
      else
      {
        size = v11->_size;
        v31 = size >= 0x4000 ? 0x4000 : size;
      }
      -[PTPObjectInfoDataset setThumbCompressedSize:](v30, "setThumbCompressedSize:", v31);
      -[PTPObjectInfoDataset setThumbFormat:](v11->_objectInfoDataset, "setThumbFormat:", 14344);
      objc_msgSend(v8, "thumbPixSize");
      v35 = v34;
      if (v33 != CGSizeZero.width || v34 != CGSizeZero.height)
      {
        -[PTPObjectInfoDataset setThumbPixWidth:](v11->_objectInfoDataset, "setThumbPixWidth:", v33);
        -[PTPObjectInfoDataset setThumbPixHeight:](v11->_objectInfoDataset, "setThumbPixHeight:", v35);
      }
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captureDateString"));
    if (v36)
      -[PTPObjectInfoDataset setCaptureDate:](v11->_objectInfoDataset, "setCaptureDate:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modificationDateString"));

    if (v37)
      -[PTPObjectInfoDataset setModificationDate:](v11->_objectInfoDataset, "setModificationDate:", v37);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetHandle"));
    plAssetHandle = v11->_plAssetHandle;
    v11->_plAssetHandle = (PHPTPAssetHandle *)v38;

    ++dword_10005E44C;
    if (v11->_size >= (uint64_t)&_mh_execute_header)
      ++dword_10005E450;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupUUID"));
    v11->_irisAsset = v40 != 0;

    v41 = v11->_objectInfoDataset;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createdFilename"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v41, "addCustomKeyword:withIdentifier:", v42, CFSTR("CFN"));

    v43 = v11->_objectInfoDataset;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fingerprint"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v43, "addCustomKeyword:withIdentifier:", v44, CFSTR("FPRINT"));

    v45 = v11->_objectInfoDataset;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "durationString"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v45, "addCustomKeyword:withIdentifier:", v46, CFSTR("D"));

    v47 = v11->_objectInfoDataset;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupUUID"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v47, "addCustomKeyword:withIdentifier:", v48, CFSTR("GUUID"));

    v49 = v11->_objectInfoDataset;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedUUID"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v49, "addCustomKeyword:withIdentifier:", v50, CFSTR("RUUID"));

    v51 = v11->_objectInfoDataset;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originatingAssetID"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v51, "addCustomKeyword:withIdentifier:", v52, CFSTR("OAID"));

    v53 = v11->_objectInfoDataset;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "spatialOverCaptureGroupIdentifier"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v53, "addCustomKeyword:withIdentifier:", v54, CFSTR("SOCGID"));

    v55 = v11->_objectInfoDataset;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "locationString"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v55, "addCustomKeyword:withIdentifier:", v56, CFSTR("G"));

    if (objc_msgSend(v8, "isBurstFavorite"))
    {
      v57 = v11->_objectInfoDataset;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "isBurstFavorite")));
      -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v57, "addCustomKeyword:withIdentifier:", v58, CFSTR("BFAV"));

    }
    if (objc_msgSend(v8, "isBurstPicked"))
    {
      v59 = v11->_objectInfoDataset;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "isBurstPicked")));
      -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v59, "addCustomKeyword:withIdentifier:", v60, CFSTR("BPIK"));

    }
    if (objc_msgSend(v8, "isBurstFirstPicked"))
    {
      v61 = v11->_objectInfoDataset;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "isBurstFirstPicked")));
      -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v61, "addCustomKeyword:withIdentifier:", v62, CFSTR("FPIK"));

    }
    if (objc_msgSend(v8, "isHighFrameRateVideo"))
    {
      v63 = v11->_objectInfoDataset;
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "isHighFrameRateVideo")));
      -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v63, "addCustomKeyword:withIdentifier:", v64, CFSTR("HFRV"));

    }
    if (objc_msgSend(v8, "isTimeLapseVideo"))
    {
      v65 = v11->_objectInfoDataset;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "isTimeLapseVideo")));
      -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v65, "addCustomKeyword:withIdentifier:", v66, CFSTR("TLV"));

    }
    v67 = v11->_objectInfoDataset;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "burstUUID"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v67, "addCustomKeyword:withIdentifier:", v68, CFSTR("BUUID"));

    v69 = v11->_objectInfoDataset;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalFilename"));
    -[PTPObjectInfoDataset addCustomKeyword:withIdentifier:](v69, "addCustomKeyword:withIdentifier:", v70, CFSTR("ON"));

  }
  return v11;
}

- (void)assignPTPObjectFormatCode:(id)a3 supportedFormats:(id)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  unsigned __int16 v10;
  BOOL v11;
  __int16 v12;
  __int16 v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filename"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension")));
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  if (!strncasecmp(v9, "JPG", 3uLL) || !strncasecmp(v9, "JPEG", 4uLL))
  {
    v10 = 14337;
    goto LABEL_52;
  }
  if (!strncasecmp(v9, "AAE", 3uLL) || !strncasecmp(v9, "DBG", 3uLL))
    goto LABEL_47;
  if (!strncasecmp(v9, "HEIF", 4uLL) || !strncasecmp(v9, "AVCI", 4uLL))
  {
    v11 = objc_msgSend(v6, "containsObject:", CFSTR("ptp.hevc")) == 0;
    v12 = 12301;
    v13 = -19423;
    goto LABEL_49;
  }
  if (!strncasecmp(v9, "HEIC", 4uLL))
  {
    v11 = objc_msgSend(v6, "containsObject:", CFSTR("ptp.heic")) == 0;
    v12 = 14337;
    v13 = -19455;
    goto LABEL_49;
  }
  if (!strncasecmp(v9, "HEICS", 5uLL))
  {
    v11 = objc_msgSend(v6, "containsObject:", CFSTR("ptp.heics")) == 0;
    v12 = 14337;
    v13 = -19454;
LABEL_49:
    if (v11)
      v10 = v12;
    else
      v10 = v13;
    goto LABEL_52;
  }
  if (strncasecmp(v9, "MOV", 3uLL))
  {
    if (!strncasecmp(v9, "PNG", 3uLL))
    {
      v10 = 14347;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "QT", 2uLL)
      || !strncasecmp(v9, "MQV", 3uLL)
      || !strncasecmp(v9, "MP4", 3uLL)
      || !strncasecmp(v9, "M4V", 3uLL)
      || !strncasecmp(v9, "3GP", 3uLL)
      || !strncasecmp(v9, "3G2", 3uLL))
    {
      v10 = 12301;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "AVI", 3uLL))
    {
      v10 = 12298;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "WAV", 3uLL))
    {
      v10 = 12296;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "ASF", 3uLL))
    {
      v10 = 12300;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "AIF", 3uLL)
      || !strncasecmp(v9, "AIFF", 4uLL)
      || !strncasecmp(v9, "M4A", 3uLL)
      || !strncasecmp(v9, "M4B", 3uLL)
      || !strncasecmp(v9, "M4R", 3uLL))
    {
      v10 = 12295;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "MP3", 3uLL))
    {
      v10 = 12297;
      goto LABEL_52;
    }
    if (!strncasecmp(v9, "GIF", 3uLL))
    {
      v10 = 14343;
      goto LABEL_52;
    }
    if (strncasecmp(v9, "XMP", 3uLL))
    {
      if (!strncasecmp(v9, "XML", 3uLL))
      {
        v10 = 12302;
      }
      else if (!strncasecmp(v9, "BMP", 3uLL))
      {
        v10 = 14340;
      }
      else if (!strncasecmp(v9, "TIF", 3uLL) || !strncasecmp(v9, "TIFF", 4uLL))
      {
        v10 = 14349;
      }
      else if (!strncasecmp(v9, "TXT", 3uLL) || !strncasecmp(v9, "TEXT", 4uLL))
      {
        v10 = 12292;
      }
      else if (!strncasecmp(v9, "HTM", 3uLL) || !strncasecmp(v9, "HTML", 4uLL))
      {
        v10 = 12293;
      }
      else if (!strncasecmp(v9, "CIF", 3uLL) || !strncasecmp(v9, "CIFF", 4uLL))
      {
        v10 = 14341;
      }
      else if (!strncasecmp(v9, "PIC", 3uLL) || !strncasecmp(v9, "PICT", 4uLL))
      {
        v10 = 14346;
      }
      else if (!strncasecmp(v9, "JP2", 3uLL))
      {
        v10 = 14351;
      }
      else if (!strncasecmp(v9, "JPX", 3uLL))
      {
        v10 = 14352;
      }
      else if (!strncasecmp(v9, "PCD", 3uLL))
      {
        v10 = 14345;
      }
      else if (!strncasecmp(v9, "FPX", 3uLL))
      {
        v10 = 14339;
      }
      else
      {
        v10 = 12288;
      }
      goto LABEL_52;
    }
LABEL_47:
    v10 = 12288;
    goto LABEL_52;
  }
  v10 = 12301;
  if (objc_msgSend(v6, "containsObject:", CFSTR("ptp.hevc")))
  {
    if (objc_msgSend(v14, "videoCodec") == 1752589105)
      v10 = -19423;
    else
      v10 = 12301;
  }
LABEL_52:
  -[PTPObjectInfoDataset setObjectFormat:](self->_objectInfoDataset, "setObjectFormat:", v10);

}

- (BOOL)hasThumbnail
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile objectInfoDataset](self, "objectInfoDataset"));
  if (objc_msgSend(v2, "thumbCompressedSize"))
    v3 = objc_msgSend(v2, "thumbFormat") == 14344;
  else
    v3 = 0;

  return v3;
}

- (id)thumbnailForMaxPixelSize:(unsigned int)a3 compressedSize:(unint64_t *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile plAssetHandle](self, "plAssetHandle"));
  v8 = sub_10000D990();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (a3 != 160 && a3)
  {
    v13 = (double)-[PTPObjectInfoDataset imagePixWidth](self->_objectInfoDataset, "imagePixWidth");
    v14 = -[PTPObjectInfoDataset imagePixHeight](self->_objectInfoDataset, "imagePixHeight");
    if (v13 < (double)v14)
      v15 = (double)v14;
    else
      v15 = v13;
    v16 = v15 / (double)a3;
    if (v16 == 0.0)
    {
      v18 = 160.0;
      v20 = 120.0;
    }
    else
    {
      v17 = v13 / v16;
      v18 = ceilf(v17);
      v19 = (double)v14 / v16;
      v20 = ceilf(v19);
    }
    LODWORD(v16) = 1064514355;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ptpThumbnailForAssetHandle:size:compressionQuality:", v7, v18, v20, v16));
    *a4 = (unint64_t)objc_msgSend(v12, "length");
    if (v12)
      goto LABEL_18;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile objectInfoDataset](self, "objectInfoDataset"));
    *a4 = objc_msgSend(v10, "thumbCompressedSize");

    if (v9)
    {
      LODWORD(v11) = 1.0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ptpThumbnailForAssetHandle:size:compressionQuality:", v7, 160.0, 120.0, v11));
      if (v12)
        goto LABEL_18;
    }
  }
  __ICOSLogCreate();
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile baseName](self, "baseName"));
  if ((unint64_t)objc_msgSend(v21, "length") >= 0x15)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringWithRange:", 0, 18));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

    v21 = (void *)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to retrieve a thumbnail from the Photo Library")));
  v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
    sub_100030914(v21, v25);

  v12 = 0;
LABEL_18:

  return v12;
}

- (id)metadata
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile plAssetHandle](self, "plAssetHandle"));
  v4 = sub_10000D990();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v5
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ptpImagePropertiesForAssetHandle:", v3))) == 0)
  {
    __ICOSLogCreate();
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPFile baseName](self, "baseName"));
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringWithRange:", 0, 18));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

      v8 = (void *)v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to retrieve metadata from the Photo Library")));
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_100030914(v8, v12);

    v7 = 0;
  }

  return v7;
}

- (PTPDataSource)dataSource
{
  PTPDataSource *dataSource;
  PTPDataSource *v4;
  PHPTPAssetHandle *plAssetHandle;
  int64_t size;
  void *v7;
  PTPDataSource *v8;
  PTPDataSource *v9;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [PTPDataSource alloc];
    plAssetHandle = self->_plAssetHandle;
    size = self->_size;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ptpd-%@"), self->_baseName));
    v8 = -[PTPDataSource initWithAssetHandle:assetSize:andQueueName:](v4, "initWithAssetHandle:assetSize:andQueueName:", plAssetHandle, size, v7);
    v9 = self->_dataSource;
    self->_dataSource = v8;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_storageID = a3;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_objectHandle = a3;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (timespec)captureTimeSpec
{
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  timespec result;

  tv_nsec = self->_captureTimeSpec.tv_nsec;
  tv_sec = self->_captureTimeSpec.tv_sec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setCaptureTimeSpec:(timespec)a3
{
  self->_captureTimeSpec = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (id)parent
{
  return objc_loadWeakRetained(&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak(&self->_parent, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PHPTPAssetHandle)plAssetHandle
{
  return self->_plAssetHandle;
}

- (void)setPlAssetHandle:(id)a3
{
  objc_storeStrong((id *)&self->_plAssetHandle, a3);
}

- (PTPObjectInfoDataset)objectInfoDataset
{
  return self->_objectInfoDataset;
}

- (void)setObjectInfoDataset:(id)a3
{
  objc_storeStrong((id *)&self->_objectInfoDataset, a3);
}

- (NSString)baseName
{
  return self->_baseName;
}

- (void)setBaseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)desiredOrientation
{
  return self->_desiredOrientation;
}

- (void)setDesiredOrientation:(unsigned int)a3
{
  self->_desiredOrientation = a3;
}

- (unsigned)fourCharCode
{
  return self->_fourCharCode;
}

- (void)setFourCharCode:(unsigned int)a3
{
  self->_fourCharCode = a3;
}

- (BOOL)irisAsset
{
  return self->_irisAsset;
}

- (void)setIrisAsset:(BOOL)a3
{
  self->_irisAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_objectInfoDataset, 0);
  objc_storeStrong((id *)&self->_plAssetHandle, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak(&self->_parent);
}

@end
