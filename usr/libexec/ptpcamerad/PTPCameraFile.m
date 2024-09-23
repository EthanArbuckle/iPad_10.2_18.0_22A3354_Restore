@implementation PTPCameraFile

- (id)mediaItemType
{
  return CFSTR("file");
}

- (BOOL)isAppleDevice
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v3 = objc_msgSend(v2, "deviceVendorID") == 1452;

  return v3;
}

- (int64_t)skipBytes:(int64_t)a3
{
  char *v5;
  char *v6;

  v5 = (char *)-[PTPCameraFile dpOffset](self, "dpOffset") + a3;
  if (v5 <= (char *)-[PTPCameraItem size](self, "size"))
    v6 = (char *)-[PTPCameraFile dpOffset](self, "dpOffset") + a3;
  else
    v6 = -[PTPCameraItem size](self, "size");
  -[PTPCameraFile setDpOffset:](self, "setDpOffset:", v6);
  return -[PTPCameraFile dpOffset](self, "dpOffset");
}

- (void)rewind
{
  -[PTPCameraFile setDpOffset:](self, "setDpOffset:", 0);
}

- (void)releaseProvider
{
  -[PTPCameraFile setDpOffset:](self, "setDpOffset:", 0);
}

- (unint64_t)readStream:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  void *v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  float v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  mach_timebase_info info;
  unint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v25 = 0;
  v10 = a5;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = -[PTPCameraFile dpOffset](self, "dpOffset");
  if (v10 + a4 > -[PTPCameraItem size](self, "size"))
    a4 = -[PTPCameraItem size](self, "size") - v10;
  info = 0;
  mach_timebase_info(&info);
  dword_10005F50C = 0;
  *(float *)&dword_10005F50C = (float)mach_absolute_time();
  v11 = objc_msgSend(v9, "partialDataFromFile:fromOffset:maxSize:actualSize:useBuffer:", self, v10, a4, &v25, a3);
  v12 = v25;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL && v25)
    -[PTPCameraFile setDpOffset:](self, "setDpOffset:", v25 + v10);
  v13 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  v14 = CFSTR("readStream");
  if ((unint64_t)objc_msgSend(CFSTR("readStream"), "length") >= 0x15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("readStream"), "substringWithRange:", 0, 18));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

  }
  if (v13 <= 300.0)
    v16 = CFSTR("{𝚫}");
  else
    v16 = CFSTR("{⊗}");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(requested):%lu @ (offset):%llu (bytes read):%u"), a4, v10, v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v16, v13, v17));

  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_retainAutorelease(v14);
    v21 = v19;
    v22 = -[__CFString UTF8String](v20, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v27 = v22;
    v28 = 2114;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  dword_10005F508 = LODWORD(v13);

  return v12;
}

- (PTPCameraFile)initWithStorageID:(unsigned int)a3 ptpObjectInfo:(id)a4 objHandle:(unsigned int)a5 parent:(id)a6 initiator:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  PTPCameraFile *v14;
  PTPCameraFile *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UTType *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  UTType *v27;
  void *v28;
  _QWORD v29[4];
  PTPCameraFile *v30;
  objc_super v31;

  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PTPCameraFile;
  v14 = -[PTPCameraItem initWithStorageID:objHandle:parent:initiator:](&v31, "initWithStorageID:objHandle:parent:initiator:", v10, v9, a6, v13);
  v15 = v14;
  if (!v14)
    goto LABEL_18;
  -[PTPCameraItem setInfo:](v14, "setInfo:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](v15, "name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathExtension"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));

  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PTPCameraItem UTTypeWithFilenameExtension:](PTPCameraItem, "UTTypeWithFilenameExtension:", v18));
  else
    v19 = 0;
  if (!-[PTPCameraFile rawImageSupported](v15, "rawImageSupported")
    && !-[PTPCameraFile imageIOSupported](v15, "imageIOSupported"))
  {
    if (!v19)
      goto LABEL_21;
    if (objc_msgSend(v19, "conformsToType:", UTTypeMovie))
    {
      v20 = UTTypeMovie;
      goto LABEL_8;
    }
    if (objc_msgSend(v19, "conformsToType:", UTTypeAudio))
      v27 = UTTypeAudio;
    else
LABEL_21:
      v27 = UTTypeData;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v27, "identifier"));
    -[PTPCameraFile setUTI:](v15, "setUTI:", v28);

    goto LABEL_9;
  }
  v20 = UTTypeImage;
LABEL_8:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v20, "identifier"));
  -[PTPCameraFile setUTI:](v15, "setUTI:", v21);

  -[PTPCameraFile setHasThumbnail:](v15, "setHasThumbnail:", 1);
LABEL_9:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[PTPCameraFile setSubImages:](v15, "setSubImages:", v22);

  if (!-[PTPCameraFile isAppleDevice](v15, "isAppleDevice"))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001F810;
    v29[3] = &unk_100048A38;
    v30 = v15;
    v23 = objc_retainBlock(v29);
    if (objc_msgSend(v13, "prioritizeSpeed"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v23));
      objc_msgSend(v24, "addInitiatedOperation:", v25);

    }
    else
    {
      ((void (*)(_QWORD *))v23[2])(v23);
    }

  }
LABEL_18:

  return v15;
}

- (void)fetchBasicMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  uint64_t v21;
  size_t v22;
  float v23;
  void *v24;
  char *v25;
  CGDataProvider *v26;
  CGDataProvider *v27;
  CGImageSource *v28;
  CFDictionaryRef v29;
  CFDictionaryRef v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  UInt8 *v43;
  CFDataRef v44;
  CFDataRef v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  void *v53;
  void *v54;
  uint64_t v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *i;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  float v71;
  void *v72;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  const __CFDictionary *v89;
  CGDataProvider *v90;
  void *v91;
  void *v92;
  CGImageSource *v93;
  void *v94;
  void *v95;
  id obj;
  id obja;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  mach_timebase_info info;
  void *v103;
  const __CFString *v104;
  void *v105;
  uint8_t buf[4];
  id v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];

  if (!-[PTPCameraFile updatedBasicMetadata](self, "updatedBasicMetadata")
    && !-[PTPCameraFile isAppleDevice](self, "isAppleDevice"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile UTI](self, "UTI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      if (v4
        && v5
        && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationsSupported")),
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4123)), v11 = objc_msgSend(v9, "containsObject:", v10), v10, v9, v11))
      {
        if (-[PTPCameraItem size](self, "size") <= 0x80000)
          v12 = -[PTPCameraItem size](self, "size");
        else
          v12 = 0x80000;
        v20 = -[PTPCameraFile rawImageSupported](self, "rawImageSupported");
        v21 = v12 + 12;
        if (v12 < -12)
          v21 = v12 + 16395;
        v22 = (v21 & 0xFFFFFFFFFFFFC000) + 0x4000;
        if (v20)
        {
          info = 0;
          mach_timebase_info(&info);
          v23 = (float)mach_absolute_time();
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v25 = (char *)malloc_type_malloc(v22, 0x94EBF00BuLL);
          v26 = CGDataProviderCreateWithData(0, v25 + 12, -[PTPCameraFile readStream:size:offset:](self, "readStream:size:offset:", v25, v12, 0), 0);
          if (v26)
          {
            v27 = v26;
            v28 = CGImageSourceCreateWithDataProvider(v26, 0);
            v29 = CGImageSourceCopyProperties(v28, 0);
            v30 = v29;
            if (v29)
            {
              v93 = v28;
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", CFSTR("{raw}")));
              v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Thumbnails")));

              v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("{raw}")));
              v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("CropSize")));

              v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", CFSTR("{raw}")));
              v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Orientation")));

              if (!-[PTPCameraFile imageWidth](self, "imageWidth")
                && !-[PTPCameraFile imageWidth](self, "imageWidth")
                && v95)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Height")));
                -[PTPCameraFile setImageHeight:](self, "setImageHeight:", objc_msgSend(v34, "intValue"));

                v35 = v30;
                v36 = v24;
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Width")));
                -[PTPCameraFile setImageWidth:](self, "setImageWidth:", objc_msgSend(v37, "intValue"));

                v24 = v36;
                v30 = v35;
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Width")));
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v38, CFSTR("PixelWidth"));

                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Height")));
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v39, CFSTR("PixelHeight"));

              }
              v40 = v92;
              v28 = v93;
              if (!-[PTPCameraFile imageOrientation](self, "imageOrientation"))
              {
                v91 = v24;
                if (v94)
                {
                  -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", objc_msgSend(v94, "intValue"));
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v94, CFSTR("Orientation"));
                }
                else if (v92)
                {
                  v89 = v30;
                  v90 = v27;
                  v100 = 0u;
                  v101 = 0u;
                  v98 = 0u;
                  v99 = 0u;
                  obja = v92;
                  v63 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
                  if (v63)
                  {
                    v64 = v63;
                    v65 = *(_QWORD *)v99;
                    while (2)
                    {
                      for (i = 0; i != v64; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v99 != v65)
                          objc_enumerationMutation(obja);
                        v67 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
                        if (!-[PTPCameraFile imageOrientation](self, "imageOrientation"))
                        {
                          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Orientation")));

                          if (v68)
                          {
                            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Orientation")));
                            -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", objc_msgSend(v69, "intValue"));

                            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Orientation")));
                            v24 = v91;
                            objc_msgSend(v91, "setObject:forKeyedSubscript:", v70, kCGImagePropertyTIFFOrientation);

                            goto LABEL_56;
                          }
                        }
                      }
                      v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
                      if (v64)
                        continue;
                      break;
                    }
                  }

                  v24 = v91;
LABEL_56:
                  v30 = v89;
                  v27 = v90;
                  v40 = v92;
                  v28 = v93;
                }
              }
              -[PTPCameraFile setSizeAndOrientationFromImageProperties:](self, "setSizeAndOrientationFromImageProperties:", v24);

            }
            if (v28)
              CFRelease(v28);
            CFRelease(v27);

          }
          free(v25);
          v71 = (float)((float)((float)((float)mach_absolute_time() - v23) * (float)info.numer) / (float)info.denom)
              / 1000000.0;
          __ICOSLogCreate();
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
          if ((unint64_t)objc_msgSend(v72, "length") >= 0x15)
          {
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "substringWithRange:", 0, 18));
            v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringByAppendingString:", CFSTR("..")));

            v72 = (void *)v74;
          }
          if (v71 <= 300.0)
            v75 = CFSTR("{𝚫}");
          else
            v75 = CFSTR("{⊗}");
          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("raw:fetchBasicMetadata")));
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v75, v71, v76));

          v78 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v79 = objc_retainAutorelease(v72);
            v80 = v78;
            v81 = objc_msgSend(v79, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v107 = v81;
            v108 = 2114;
            v109 = v77;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
        else
        {
          info = 0;
          mach_timebase_info(&info);
          v41 = (float)mach_absolute_time();
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v43 = (UInt8 *)malloc_type_malloc(v22, 0x6231B35EuLL);
          v44 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v43 + 12, -[PTPCameraFile readStream:size:offset:](self, "readStream:size:offset:", v43, v12, 0), kCFAllocatorNull);
          if (v44)
          {
            v45 = v44;
            v46 = (void *)CopyMetadataFromCFData();
            v47 = v46;
            if (v46)
            {
              obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("PixelYDimension")));
              if (obj)
              {
                v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PixelXDimension")));
                if (v48)
                {
                  v49 = (void *)v48;
                  objc_msgSend(v42, "setObject:forKeyedSubscript:", v48, CFSTR("PixelWidth"));
                  objc_msgSend(v42, "setObject:forKeyedSubscript:", obj, CFSTR("PixelHeight"));

                }
              }
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Orientation")));
              if (v50)
                objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, CFSTR("Orientation"));
              -[PTPCameraFile setSizeAndOrientationFromImageProperties:](self, "setSizeAndOrientationFromImageProperties:", v42);
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ThumbnailSize")));
              -[PTPCameraFile setHasThumbnail:](self, "setHasThumbnail:", (int)objc_msgSend(v51, "intValue") > 0);

            }
            CFRelease(v45);

          }
          free(v43);
          v52 = (float)((float)((float)((float)mach_absolute_time() - v41) * (float)info.numer) / (float)info.denom)
              / 1000000.0;
          __ICOSLogCreate();
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
          if ((unint64_t)objc_msgSend(v53, "length") >= 0x15)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "substringWithRange:", 0, 18));
            v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stringByAppendingString:", CFSTR("..")));

            v53 = (void *)v55;
          }
          if (v52 <= 300.0)
            v56 = CFSTR("{𝚫}");
          else
            v56 = CFSTR("{⊗}");
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("jpeg/heif:fetchBasicMetadata")));
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v56, v52, v57));

          v59 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v60 = objc_retainAutorelease(v53);
            v61 = v59;
            v62 = objc_msgSend(v60, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v107 = v62;
            v108 = 2114;
            v109 = v58;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
        -[PTPCameraFile setUpdatedBasicMetadata:](self, "setUpdatedBasicMetadata:", 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "delegate"));

        v104 = CFSTR("ICPTPObjectInfoArray");
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "content:", 2));
        v103 = v85;
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
        v105 = v86;
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));

        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "allConnections"));
        objc_msgSend(v83, "sendUpdatedItemsNotification:toConnections:", v87, v88);

      }
      else
      {
        __ICOSLogCreate();
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
        if ((unint64_t)objc_msgSend(v13, "length") >= 0x15)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringWithRange:", 0, 18));
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

          v13 = (void *)v15;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No Partial Object Support:fetchBasicMetadata")));
        v17 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_retainAutorelease(v13);
          v19 = v17;
          *(_DWORD *)buf = 136446466;
          v107 = objc_msgSend(v18, "UTF8String");
          v108 = 2114;
          v109 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        -[PTPCameraFile setUpdatedBasicMetadata:](self, "setUpdatedBasicMetadata:", 1);
      }
    }

  }
}

- (void)fetchFullMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *(__cdecl **v8)(CFAllocatorRef, void *, CFIndex, CFOptionFlags);
  void *v9;
  void *v10;
  unsigned int v11;
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
  unsigned int v22;
  float v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  PTPCameraFile *v66;
  _BOOL8 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  mach_timebase_info info;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;

  if (!-[PTPCameraFile updatedExpensiveMetadata](self, "updatedExpensiveMetadata"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
    v5 = objc_autoreleasePoolPush();
    if (!v4)
    {
LABEL_34:
      objc_autoreleasePoolPop(v5);
      -[PTPCameraFile setUpdatedExpensiveMetadata:](self, "setUpdatedExpensiveMetadata:", 1);

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceInfo"));
    v7 = v6;
    v8 = &CFAllocatorReallocate_ptr;
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operationsSupported"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 36873));
      if ((objc_msgSend(v9, "containsObject:", v10) & 1) != 0)
      {
        v11 = -[PTPCameraFile isAppleDevice](self, "isAppleDevice");

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadataFromFile:", self));
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver icUnarchivedObjectFromData:withKey:](NSKeyedUnarchiver, "icUnarchivedObjectFromData:withKey:", v12, CFSTR("metadata")));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));

            if (!v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
              -[PTPCameraItem setMetadata:](self, "setMetadata:", v15);

            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
            objc_msgSend(v16, "addEntriesFromDictionary:", v13);

          }
          goto LABEL_31;
        }
      }
      else
      {

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "operationsSupported"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 4123));
      if ((objc_msgSend(v17, "containsObject:", v18) & 1) != 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));

        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile UTI](self, "UTI"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
          v22 = objc_msgSend(v20, "isEqualToString:", v21);

          if (v22)
          {
            if (-[PTPCameraFile rawImageSupported](self, "rawImageSupported")
              || -[PTPCameraFile imageIOSupported](self, "imageIOSupported"))
            {
              info = 0;
              mach_timebase_info(&info);
              dword_10005F50C = 0;
              *(float *)&dword_10005F50C = (float)mach_absolute_time();
              -[PTPCameraFile setHasThumbnail:](self, "setHasThumbnail:", 1);
              -[PTPCameraFile imageInspectMetadata](self, "imageInspectMetadata");
              v23 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)info.numer)
                          / (float)info.denom)
                  / 1000000.0;
              __ICOSLogCreate();
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
              if ((unint64_t)objc_msgSend(v24, "length") >= 0x15)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", 0, 18));
                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

                v24 = (void *)v26;
              }
              if (v23 <= 300.0)
                v27 = CFSTR("{𝚫}");
              else
                v27 = CFSTR("{⊗}");
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("image:fetchFullMetadata")));
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v27, v23, v28));

              v30 = (void *)_gICOSLog;
              if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
              {
                v31 = objc_retainAutorelease(v24);
                v32 = v30;
                v33 = objc_msgSend(v31, "UTF8String");
                *(_DWORD *)buf = 136446466;
                v75 = v33;
                v76 = 2114;
                v77 = v29;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

              }
              dword_10005F508 = LODWORD(v23);
              v8 = &CFAllocatorReallocate_ptr;
              goto LABEL_31;
            }
            -[PTPCameraFile setThmSize:](self, "setThmSize:", 1);
            v67 = -[PTPCameraFile thmSize](self, "thmSize") > 0;
            v66 = self;
          }
          else
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile UTI](self, "UTI"));
            v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("movie"));

            if (!v65)
            {
LABEL_31:
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "allKeys"));
              v43 = objc_msgSend(v42, "count");

              if (!v43)
              {
                v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", objc_msgSend(v4, "imagePixWidth")));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", objc_msgSend(v4, "imagePixHeight")));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "captureDate"));
                v47 = sub_10001E81C(v46);
                v72 = v4;
                v48 = objc_claimAutoreleasedReturnValue(v47);

                v49 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
                objc_msgSend(v49, "setObject:forKey:", v45, kCGImagePropertyPixelHeight);

                v50 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
                v68 = (void *)v44;
                objc_msgSend(v50, "setObject:forKey:", v44, kCGImagePropertyPixelWidth);

                v51 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
                v69 = v7;
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", objc_msgSend(v72, "imageBitDepth")));
                objc_msgSend(v51, "setObject:forKey:", v52, kCGImagePropertyDepth);

                v53 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
                v71 = v3;
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "modificationDate"));
                v55 = sub_10001E81C(v54);
                v70 = v5;
                v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
                v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v56, kCGImagePropertyExifDateTimeDigitized, v48, kCGImagePropertyExifDateTimeOriginal, v44, kCGImagePropertyExifPixelXDimension, v45, kCGImagePropertyExifPixelYDimension, 0));
                objc_msgSend(v53, "setObject:forKey:", v57, kCGImagePropertyExifDictionary);

                v58 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
                v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", 2));
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", 72));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[79], "numberWithUnsignedInt:", 72));
                v62 = (void *)v48;
                v4 = v72;
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v62, kCGImagePropertyTIFFDateTime, v59, kCGImagePropertyTIFFResolutionUnit, v60, kCGImagePropertyTIFFXResolution, v61, kCGImagePropertyTIFFYResolution, 0));
                objc_msgSend(v58, "setObject:forKey:", v63, kCGImagePropertyTIFFDictionary);

                v3 = v71;
                v5 = v70;

                v7 = v69;
              }

              goto LABEL_34;
            }
            v66 = self;
            v67 = 1;
          }
          -[PTPCameraFile setHasThumbnail:](v66, "setHasThumbnail:", v67);
          goto LABEL_31;
        }
      }
      else
      {

      }
    }
    __ICOSLogCreate();
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
    if ((unint64_t)objc_msgSend(v34, "length") >= 0x15)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "substringWithRange:", 0, 18));
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR("..")));

      v34 = (void *)v36;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No Partial Object Support:fetchFullMetadata")));
    v38 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_retainAutorelease(v34);
      v40 = v38;
      *(_DWORD *)buf = 136446466;
      v75 = objc_msgSend(v39, "UTF8String");
      v76 = 2114;
      v77 = v37;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    -[PTPCameraFile setUpdatedExpensiveMetadata:](self, "setUpdatedExpensiveMetadata:", 1);
    goto LABEL_31;
  }
}

- (void)thumbnailDataWithOptions:(id)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CFStringRef v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kCGImageSourceThumbnailMaxPixelSize")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile thumbnailForPixelWidth:](self, "thumbnailForPixelWidth:", objc_msgSend(v6, "intValue")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[PTPCameraFile fetchFullMetadata](self, "fetchFullMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("metadata"));

  }
  if (-[PTPCameraFile imageOrientation](self, "imageOrientation")
    && (v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PTPCameraFile imageOrientation](self, "imageOrientation")))) != 0)
  {
    v12 = (void *)v11;
    v13 = kCGImagePropertyOrientation;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
    v13 = kCGImagePropertyOrientation;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", kCGImagePropertyOrientation));

    if (!v12)
      goto LABEL_8;
  }
  objc_msgSend(v8, "setObject:forKey:", v12, v13);

LABEL_8:
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("thumb"));
  v15[2](v15, v8);

}

- (void)metadataWithOptions:(id)a3 reply:(id)a4
{
  void (**v5)(id, id);
  id v6;

  v5 = (void (**)(id, id))a4;
  -[PTPCameraFile fetchFullMetadata](self, "fetchFullMetadata");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PTPCameraItem metadata](self, "metadata"));
  v5[2](v5, v6);

}

- (id)altThumbnaillForMaxPixelSize:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  __CFData *Mutable;
  CGImage *v8;
  float v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  __CFString *v20;
  CGImageDestination *v21;
  float v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __CFData *v36;
  mach_timebase_info v38;
  mach_timebase_info info;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile UTI](self, "UTI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));

  if (v5 != v6)
    goto LABEL_2;
  -[PTPCameraFile fetchFullMetadata](self, "fetchFullMetadata");
  info = 0;
  mach_timebase_info(&info);
  dword_10005F50C = 0;
  *(float *)&dword_10005F50C = (float)mach_absolute_time();
  v8 = -[PTPCameraFile copyThumbnailForPixelWidth:](self, "copyThumbnailForPixelWidth:", v3);
  v9 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)info.numer)
             / (float)info.denom)
     / 1000000.0;
  __ICOSLogCreate();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x15)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", 0, 18));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

    v10 = (void *)v12;
  }
  if (v9 <= 300.0)
    v13 = CFSTR("{𝚫}");
  else
    v13 = CFSTR("{⊗}");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%d] <<<< copyThumbnailForPixelWidth"), v3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v13, v9, v14));

  v16 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v10);
    v18 = v16;
    v19 = objc_msgSend(v17, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v41 = v19;
    v42 = 2114;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  dword_10005F508 = LODWORD(v9);
  if (v8)
  {
    v38 = 0;
    mach_timebase_info(&v38);
    dword_10005F50C = 0;
    *(float *)&dword_10005F50C = (float)mach_absolute_time();
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeJPEG, "identifier"));
    v21 = CGImageDestinationCreateWithData(Mutable, v20, 1uLL, 0);

    if (v21)
    {
      CGImageDestinationAddImage(v21, v8, 0);
      if (!CGImageDestinationFinalize(v21))
      {

        Mutable = 0;
      }
      CFRelease(v21);
    }
    else
    {

      Mutable = 0;
    }
    CFRelease(v8);
    v22 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)v38.numer)
                / (float)v38.denom)
        / 1000000.0;
    __ICOSLogCreate();
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
    if ((unint64_t)objc_msgSend(v23, "length") >= 0x15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", 0, 18));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

      v23 = (void *)v25;
    }
    if (v22 <= 300.0)
      v26 = CFSTR("{𝚫}");
    else
      v26 = CFSTR("{⊗}");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%d] <<<< CGImageDestinationFinalize"), v3));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v26, v22, v27));

    v29 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v30 = objc_retainAutorelease(v23);
      v31 = v29;
      v32 = objc_msgSend(v30, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v41 = v32;
      v42 = 2114;
      v43 = v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    dword_10005F508 = LODWORD(v22);
  }
  else
  {
LABEL_2:
    Mutable = 0;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile UTI](self, "UTI"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMovie, "identifier"));

  if (v33 == v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile thumbnailForPixelWidth:](self, "thumbnailForPixelWidth:", 160));
    v36 = (__CFData *)objc_msgSend(v35, "mutableCopy");

    Mutable = v36;
  }
  return Mutable;
}

- (BOOL)imageIOSupported
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_10005F4C8 != -1)
    dispatch_once(&qword_10005F4C8, &stru_100048D60);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  LOBYTE(v3) = objc_msgSend((id)qword_10005F510, "containsObject:", v5);
  return (char)v3;
}

- (BOOL)rawImageSupported
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_10005F4D0 != -1)
    dispatch_once(&qword_10005F4D0, &stru_100048D80);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  LOBYTE(v3) = objc_msgSend((id)qword_10005F518, "containsObject:", v5);
  return (char)v3;
}

- (void)setSizeAndOrientationFromImageProperties:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v9 = a3;
  v10 = 0;
  sub_10001E8E0(v9, &v12, &v11, &v10);
  v4 = v12;
  v5 = v11;
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem info](self, "info"));
  -[PTPCameraFile setImageOrientation:](self, "setImageOrientation:", objc_msgSend(v4, "intValue"));
  if (-[PTPCameraFile imageOrientation](self, "imageOrientation") < 5)
  {
    -[PTPCameraFile setImageWidth:](self, "setImageWidth:", objc_msgSend(v5, "intValue"));
    -[PTPCameraFile setImageHeight:](self, "setImageHeight:", objc_msgSend(v6, "intValue"));
  }
  else
  {
    -[PTPCameraFile setImageWidth:](self, "setImageWidth:", objc_msgSend(v6, "intValue"));
    -[PTPCameraFile setImageHeight:](self, "setImageHeight:", objc_msgSend(v5, "intValue"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("PixelHeight"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("PixelWidth"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("PixelYDimension"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("PixelXDimension"));
  }
  objc_msgSend(v7, "setImagePixHeight:", -[PTPCameraFile imageHeight](self, "imageHeight"));
  objc_msgSend(v7, "setImagePixWidth:", -[PTPCameraFile imageWidth](self, "imageWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v4));
  objc_msgSend(v7, "addCustomKeyword:withIdentifier:", v8, CFSTR("IO"));

}

- (BOOL)processMetadata:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CFStringRef v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;

  v4 = a3;
  if (!-[PTPCameraFile updatedExpensiveMetadata](self, "updatedExpensiveMetadata"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (!v4)
    {
      v5 = 0;
LABEL_77:

      goto LABEL_78;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyExifDictionary));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCGImagePropertyTIFFDictionary));
    if (!v7)
    {
      v5 = 0;
LABEL_76:

      goto LABEL_77;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, kCGImagePropertyExifDictionary);
    if (-[PTPCameraFile imageHeight](self, "imageHeight"))
      v9 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PTPCameraFile imageHeight](self, "imageHeight")));
    else
      v9 = 0;
    if (-[PTPCameraFile imageWidth](self, "imageWidth"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PTPCameraFile imageWidth](self, "imageWidth")));
      if (v9)
        goto LABEL_13;
    }
    else
    {
      v10 = 0;
      if (v9)
      {
LABEL_13:
        if (!v10)
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyExifPixelXDimension));
        if (v9)
          v11 = v10 == 0;
        else
          v11 = 1;
        v5 = !v11;
        v52 = (void *)v9;
        if (v11)
        {
          __ICOSLogCreate();
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
          v21 = v8;
          if ((unint64_t)objc_msgSend(v20, "length") >= 0x15)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringWithRange:", 0, 18));
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

            v20 = (void *)v23;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing Metadata")));
          v25 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_retainAutorelease(v20);
            v27 = v25;
            *(_DWORD *)buf = 136446466;
            v54 = objc_msgSend(v26, "UTF8String");
            v55 = 2114;
            v56 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          v8 = v21;
          goto LABEL_75;
        }
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, kCGImagePropertyPixelHeight);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, kCGImagePropertyPixelWidth);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, kCGImagePropertyExifPixelYDimension);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, kCGImagePropertyExifPixelXDimension);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyOrientation));
        if (!v12)
        {
          if (v8)
          {
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));
            if (v28)
            {
              v13 = (void *)v28;
              v14 = v6;
              v15 = v13;
              v16 = kCGImagePropertyTIFFOrientation;
              goto LABEL_24;
            }
          }
          if (!-[PTPCameraFile imageOrientation](self, "imageOrientation"))
          {
LABEL_25:
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyExifDateTimeOriginal));
            if (v17
              || v8
              && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCGImagePropertyTIFFDateTime))) != 0
              || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyTIFFDateTime))) != 0)
            {
              -[PTPCameraItem setExifCreationDateTime:](self, "setExifCreationDateTime:", v17);

            }
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyExifDateTimeDigitized));
            if (v18)
            {
              v19 = (void *)v18;
              -[PTPCameraItem setExifModificationDateTime:](self, "setExifModificationDateTime:", v18);
            }
            else
            {
              if (v8)
              {
                v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kCGImagePropertyTIFFDateTime));
                if (v29)
                {
                  v19 = (void *)v29;
                  -[PTPCameraItem setExifModificationDateTime:](self, "setExifModificationDateTime:", v29);
                  goto LABEL_48;
                }
              }
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyTIFFDateTime));
              if (v19)
                -[PTPCameraItem setExifCreationDateTime:](self, "setExifCreationDateTime:", v19);
            }
            if (!v8)
            {
LABEL_49:
              v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyDepth));

              if (v30)
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, kCGImagePropertyDepth);
              v50 = (void *)v30;
              v51 = v8;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ThumbnailOffset")));
              v32 = objc_msgSend(v31, "intValue");
              if ((_DWORD)v32)
              {
                v33 = v32;
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ThumbnailSize")));
                v35 = objc_msgSend(v34, "intValue");

                if ((_DWORD)v35)
                {
                  -[PTPCameraFile setThmOffset:](self, "setThmOffset:", v33);
                  -[PTPCameraFile setThmSize:](self, "setThmSize:", v35);
                  goto LABEL_63;
                }
              }
              else
              {

              }
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("JPEGOffset")));
              v37 = objc_msgSend(v36, "intValue");
              if ((_DWORD)v37)
              {
                v38 = v37;
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("JPEGLength")));
                v40 = objc_msgSend(v39, "intValue");

                v8 = v51;
                if ((_DWORD)v40)
                {
                  -[PTPCameraFile setThmOffset:](self, "setThmOffset:", v38);
                  -[PTPCameraFile setThmSize:](self, "setThmSize:", v40);
                }
                goto LABEL_64;
              }

LABEL_63:
              v8 = v51;
LABEL_64:
              -[PTPCameraFile setSizeAndOrientationFromImageProperties:](self, "setSizeAndOrientationFromImageProperties:", v6);
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem exifModificationDateTime](self, "exifModificationDateTime"));
              v42 = v41;
              if (v41)
              {
                v43 = sub_10001E7A4(v41);
                v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
                if (v44)
                  -[PTPCameraItem setExifModificationDate:](self, "setExifModificationDate:", v44);
              }
              else
              {
                v44 = 0;
              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem exifCreationDateTime](self, "exifCreationDateTime"));

              if (v45)
              {
                v46 = sub_10001E7A4(v45);
                v47 = objc_claimAutoreleasedReturnValue(v46);

                v48 = v50;
                if (v47)
                {
                  -[PTPCameraItem setExifCreationDate:](self, "setExifCreationDate:", v47);
                  v44 = (void *)v47;
                }
                else
                {
                  v44 = 0;
                }
                v8 = v51;
              }
              else
              {
                v48 = v50;
              }
              -[PTPCameraItem setMetadata:](self, "setMetadata:", v6);

LABEL_75:
              goto LABEL_76;
            }
LABEL_48:
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, kCGImagePropertyTIFFDictionary);
            goto LABEL_49;
          }
          v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[PTPCameraFile imageOrientation](self, "imageOrientation")));
        }
        v13 = (void *)v12;
        v14 = v6;
        v15 = v13;
        v16 = kCGImagePropertyOrientation;
LABEL_24:
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v16);

        goto LABEL_25;
      }
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCGImagePropertyExifPixelYDimension));
    goto LABEL_13;
  }
  v5 = 1;
LABEL_78:

  return v5;
}

- (void)imageInspectMetadata
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t TypeWithExtension;
  const __CFDictionary *v7;
  CGImageSource *Incremental;
  double v9;
  double v10;
  unint64_t v11;
  PTPCameraFile *v12;
  unint64_t v13;
  char *v14;
  CFDictionaryRef v15;
  uint64_t v16;
  CFIndex v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  const __CFData *v21;
  CFDictionaryRef v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFData *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  signed int v41;
  void *v42;
  signed int v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  id v50;
  float v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  id v61;
  const __CFData *v62;
  CGImageSource *v63;
  CFDictionaryRef v64;
  void *v65;
  const __CFDictionary *options;
  unint64_t v67;
  CGImageSource *v68;
  const __CFData *v69;
  const __CFDictionary *v70;
  unint64_t v71;
  char *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  PTPCameraFile *v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  mach_timebase_info info;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];

  v3 = -[PTPCameraItem size](self, "size");
  v76 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));

  v65 = (void *)v5;
  TypeWithExtension = CGImageSourceGetTypeWithExtension(v5);
  info = 0;
  mach_timebase_info(&info);
  dword_10005F50C = 0;
  *(float *)&dword_10005F50C = (float)mach_absolute_time();
  if (TypeWithExtension)
    v7 = (const __CFDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", TypeWithExtension, kCGImageSourceTypeIdentifierHint, 0);
  else
    v7 = 0;
  options = v7;
  Incremental = CGImageSourceCreateIncremental(v7);
  v9 = (double)v3;
  v10 = (double)v3 * 0.3;
  if (v10 > 1048576.0)
    v10 = 1048576.0;
  v11 = (unint64_t)v10;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v12 = v76;
  if (v11)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v67 = v11;
    v68 = Incremental;
    while (!-[PTPCameraFile smallThumbnail](v12, "smallThumbnail")
         || !-[PTPCameraFile previewThumbnail](v12, "previewThumbnail"))
    {
      v16 = v11 - v13 >= 0x100000 ? 0x100000 : v11 - v13;
      v17 = v16 + v13;
      v14 = (char *)CFAllocatorReallocate(kCFAllocatorDefault, v14, v16 + v13, 0);
      v18 = (char *)malloc_type_malloc((((_DWORD)v16 + 12) & 0x3FC000) + 0x4000, 0xEB7C2612uLL);
      v19 = -[PTPCameraFile readStream:size:offset:](v12, "readStream:size:offset:", v18, v16, v13);
      if (!v19)
        break;
      v20 = v19;
      memcpy(&v14[v13], v18 + 12, v19);
      free(v18);
      v21 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v14, v17, kCFAllocatorNull);
      v75 = v20;
      CGImageSourceUpdateData(Incremental, v21, v20 < 0x100000);
      v22 = CGImageSourceCopyProperties(Incremental, 0);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("{raw}")));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Thumbnails")));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("{raw}")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CropSize")));

        v73 = v25;
        if (!-[PTPCameraFile imageHeight](v12, "imageHeight") && !-[PTPCameraFile imageWidth](v12, "imageWidth") && v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Height")));
          -[PTPCameraFile setImageHeight:](v12, "setImageHeight:", objc_msgSend(v26, "intValue"));

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Width")));
          -[PTPCameraFile setImageWidth:](v12, "setImageWidth:", objc_msgSend(v27, "intValue"));

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("{raw}")));
          v29 = v21;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Orientation")));
          -[PTPCameraFile setImageOrientation:](v12, "setImageOrientation:", objc_msgSend(v30, "intValue"));

          v21 = v29;
        }
        v31 = v74;
        if (v74)
        {
          v69 = v21;
          v70 = v22;
          v71 = v13;
          v72 = v14;
          v81 = 0u;
          v82 = 0u;
          v79 = 0u;
          v80 = 0u;
          v32 = v74;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v80;
            do
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(_QWORD *)v80 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
                v78 = 0;
                v38 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile imageValidateSubImage:error:](v12, "imageValidateSubImage:error:", v37, &v78));
                v39 = v78;
                if (v39)
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("JPEGLength")));
                  v41 = objc_msgSend(v40, "intValue");

                  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("JPEGOffset")));
                  v43 = objc_msgSend(v42, "intValue");

                  v12 = v76;
                  v44 = v43;
                  if (objc_msgSend(v77, "containsIndex:", v43))
                    v45 = 1;
                  else
                    v45 = v43 == 0;
                  if (!v45 && v41 != 0)
                  {
                    v47 = v41;
                    v48 = v41 + 12;
                    if (v41 < -12)
                      v48 = v41 + 16395;
                    v49 = (char *)malloc_type_malloc((v48 & 0xFFFFFFFFFFFFC000) + 0x4000, 0xFA610251uLL);
                    v50 = -[PTPCameraFile readStream:size:offset:](v76, "readStream:size:offset:", v49, v47, v44);
                    if (v50)
                    {
                      -[PTPCameraFile imageScrapeAllocatedData:length:bufferOffset:](v76, "imageScrapeAllocatedData:length:bufferOffset:", v49 + 12, v50, v44);
                      objc_msgSend(v77, "addIndex:", v44);
                    }
                    free(v49);
                  }
                }
                else
                {
                  -[PTPCameraFile addSubImageDict:](v12, "addSubImageDict:", v38);
                }

              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
            }
            while (v34);
          }

          v13 = v71;
          v14 = v72;
          v11 = v67;
          Incremental = v68;
          v21 = v69;
          v22 = v70;
          v31 = v74;
        }

      }
      if (v21)
        CFRelease(v21);
      v13 += v75;
      v15 = v22;
      if (v13 >= v11)
        goto LABEL_49;
    }
    v22 = v15;
  }
  else
  {
    v22 = 0;
    v13 = 0;
    v14 = 0;
  }
LABEL_49:
  v51 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](v12, "name"));
  if ((unint64_t)objc_msgSend(v52, "length") >= 0x15)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "substringWithRange:", 0, 18));
    v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "stringByAppendingString:", CFSTR("..")));

    v52 = (void *)v54;
  }
  if (v51 <= 300.0)
    v55 = CFSTR("{𝚫}");
  else
    v55 = CFSTR("{⊗}");
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CGImageSourceCopyProperties %@ %3u%% [%5.2f MB]"), CFSTR(" "), ((double)v13 / v9 * 100.0), v9 * 0.0009765625 * 0.0009765625));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v55, v51, v56));

  v58 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v59 = objc_retainAutorelease(v52);
    v60 = v58;
    v61 = objc_msgSend(v59, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v85 = v61;
    v86 = 2114;
    v87 = v57;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  dword_10005F508 = LODWORD(v51);
  if (Incremental)
    CFRelease(Incremental);
  if (v13)
  {
    -[PTPCameraFile imageScrapeAllocatedData:length:bufferOffset:](v76, "imageScrapeAllocatedData:length:bufferOffset:", v14, v13, 0);
    v62 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v14, v13, kCFAllocatorNull);
    v63 = CGImageSourceCreateWithData(v62, options);
    v64 = CGImageSourceCopyPropertiesAtIndex(v63, 0, options);
    if (v64)
      -[PTPCameraFile processMetadata:](v76, "processMetadata:", v64);
    if (v63)
      CFRelease(v63);
    if (v62)
      CFRelease(v62);

  }
  if (v14)
    free(v14);

}

- (id)imageValidateSubImage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  const __CFString *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
      v10 = objc_msgSend(v9, "intValue");

      if (!v10)
      {
        v11 = CFSTR("PixelWidth");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PixelWidth")));
        v10 = objc_msgSend(v12, "intValue");

        if (v10
          || (v11 = CFSTR("Width"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Width"))),
              v10 = objc_msgSend(v13, "intValue"),
              v13,
              v10))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
          objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("ImageWidth"));

        }
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageHeight")));
      v16 = objc_msgSend(v15, "intValue");

      if (v16)
      {
        if (!v10)
        {
LABEL_18:
          v17 = 0;
          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.imagecapture"), -2, 0));
          goto LABEL_28;
        }
      }
      else
      {
        v18 = CFSTR("PixelHeight");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PixelHeight")));
        v20 = objc_msgSend(v19, "intValue");

        if (!v20)
        {
          v18 = CFSTR("Height");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Height")));
          v22 = objc_msgSend(v21, "intValue");

          if (!v22)
            goto LABEL_18;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v18));
        objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("ImageHeight"));

        if (!v10)
          goto LABEL_18;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("JPEGLength")));
      v25 = objc_msgSend(v24, "intValue");

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("JPEGOffset")));
      v27 = objc_msgSend(v26, "intValue");

      if ((_DWORD)v25 && (_DWORD)v27)
      {
        if (v10 == 160)
        {
          -[PTPCameraFile setThmOffset:](self, "setThmOffset:", v27);
          -[PTPCameraFile setThmSize:](self, "setThmSize:", v25);
          -[PTPCameraFile setSmallThumbnail:](self, "setSmallThumbnail:", 1);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("smallThumbnail"), CFSTR("imageType"));
        }
        else if (v10 < 1400)
        {
          if (v10 <= 1024)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("ptpSubThumbnailImage"), CFSTR("imageType"));
            -[PTPCameraFile setSmallThumbnail:](self, "setSmallThumbnail:", 1);
          }
        }
        else
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("previewImage"), CFSTR("imageType"));
          -[PTPCameraFile setPreviewThumbnail:](self, "setPreviewThumbnail:", 1);
        }
      }
      else if (a4)
      {
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.imagecapture"), -4, 0));
      }
    }
    v17 = v8;
LABEL_28:

    goto LABEL_29;
  }
  v17 = 0;
LABEL_29:

  return v17;
}

- (void)imageScrapeAllocatedData:(char *)a3 length:(unint64_t)a4 bufferOffset:(unint64_t)a5
{
  unint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  CGImageSource *v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  unint64_t v32;
  const __CFData *v34;
  int v35;
  uint64_t v36;
  mach_timebase_info info;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _OWORD v42[5];

  info = 0;
  mach_timebase_info(&info);
  dword_10005F50C = 0;
  *(float *)&dword_10005F50C = (float)mach_absolute_time();
  memset(v42, 0, sizeof(v42));
  v32 = a4;
  v8 = a4 - 1;
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      if (a3[v10] == 255)
      {
        v11 = v10 + 1;
        v12 = a3[v10 + 1];
        if (v12 == 217)
        {
          if (v9 >= 1)
          {
            v35 = v9 - 1;
            v13 = *((_QWORD *)v42 + (v9 - 1));
            v14 = v10 - v13 + 2;
            v34 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &a3[v13], v14, 0));
            v15 = CGImageSourceCreateWithData(v34, 0);
            v16 = CGImageSourceCopyPropertiesAtIndex(v15, 0, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v13 + a5));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("JPEGOffset"));

            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v14));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("JPEGLength"));

            v36 = 0;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile imageValidateSubImage:error:](self, "imageValidateSubImage:error:", v17, &v36));
            if (v20)
              -[PTPCameraFile addSubImageDict:](self, "addSubImageDict:", v20);
            if (v15)
              CFRelease(v15);

            v9 = v35;
          }
        }
        else if (v12 == 216)
        {
          *((_QWORD *)v42 + v9) = v10;
          if (v9 < 0xA)
            ++v9;
        }
        else
        {
          v11 = v10;
        }
        v10 = v11 + 1;
      }
      ++v10;
    }
    while (v10 < v8 && v9 < 6);
  }
  v21 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005F50C) * (float)info.numer)
              / (float)info.denom)
      / 1000000.0;
  __ICOSLogCreate();
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  if ((unint64_t)objc_msgSend(v22, "length") >= 0x15)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", 0, 18));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingString:", CFSTR("..")));

    v22 = (void *)v24;
  }
  if (v21 <= 300.0)
    v25 = CFSTR("{𝚫}");
  else
    v25 = CFSTR("{⊗}");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("imageScrapeAllocatedData [%5.2f MB]"), (double)v32 * 0.0009765625 * 0.0009765625));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%5.0f ms]:%@"), v25, v21, v26));

  v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_retainAutorelease(v22);
    v30 = v28;
    v31 = objc_msgSend(v29, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v39 = v31;
    v40 = 2114;
    v41 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  dword_10005F508 = LODWORD(v21);
}

- (NSMutableDictionary)subImages
{
  return self->_subImages;
}

- (void)addSubImageDict:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *subImages;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
  if (v5)
  {
    v6 = (void *)v5;
    subImages = self->_subImages;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](subImages, "objectForKeyedSubscript:", v8));

    if (!v9)
    {
      v10 = self->_subImages;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v4, v11);

      __ICOSLogCreate();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
      if ((unint64_t)objc_msgSend(v12, "length") >= 0x15)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", 0, 18));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

        v12 = (void *)v14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
      v16 = objc_msgSend(v15, "intValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ImageHeight")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("+ [%10d(w)x %10d(h)]"), v16, objc_msgSend(v17, "intValue")));

      v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_retainAutorelease(v12);
        v21 = v19;
        *(_DWORD *)buf = 136446466;
        v23 = objc_msgSend(v20, "UTF8String");
        v24 = 2114;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }

}

- (id)subImageDictForPixelWidth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];

  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_subImages, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
      v12 = objc_msgSend(v4, "intValue");
      if (v12 <= (int)objc_msgSend(v11, "intValue"))
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_subImages, "objectForKeyedSubscript:", v11));
    __ICOSLogCreate();
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
    if ((unint64_t)objc_msgSend(v14, "length") >= 0x15)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringWithRange:", 0, 18));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

      v14 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ImageWidth")));
    v18 = objc_msgSend(v17, "intValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ImageHeight")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("⇲ [%10d(w)x %10d(h)]"), v18, objc_msgSend(v19, "intValue")));

    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v14);
      v23 = v21;
      v24 = objc_msgSend(v22, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v39 = v24;
      v40 = 2114;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    if (v13)
      goto LABEL_20;
  }
  else
  {
LABEL_9:

  }
  __ICOSLogCreate();
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  if ((unint64_t)objc_msgSend(v25, "length") >= 0x15)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringWithRange:", 0, 18));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR("..")));

    v25 = (void *)v27;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("╳ [%10d] no match"), objc_msgSend(v4, "intValue")));
  v29 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_retainAutorelease(v25);
    v31 = v29;
    v32 = objc_msgSend(v30, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v39 = v32;
    v40 = 2114;
    v41 = v28;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (int64_t)compare:(id)a3 against:(id)a4 withContext:(void *)a5
{
  id v6;
  id v7;
  unsigned int v8;
  int64_t v9;
  unsigned int v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "objHandle");
  if (v8 >= objc_msgSend(v7, "objHandle"))
  {
    v10 = objc_msgSend(v6, "objHandle");
    v9 = v10 > objc_msgSend(v7, "objHandle");
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (id)thumbnailForPixelWidth:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v10;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem initiator](self, "initiator"));
  v10 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thumbDataFromFile:maxPixelSize:actualSize:useBuffer:", self, v3, &v10, 0));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (CGImage)copyThumbnailForPixelWidth:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t TypeWithExtension;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  const __CFData *v19;
  __CFDictionary *Mutable;
  CGImageSource *v21;
  void *v22;
  CGImage *ThumbnailAtIndex;
  void *v24;
  void *v25;
  uint64_t v26;
  const void *(__cdecl *v27)(void *);
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  size_t v38;
  void *v39;
  CGDataProvider *v40;
  CGImageSource *v41;
  size_t Count;
  void *v43;
  NSObject *v44;
  size_t v45;
  size_t v46;
  CGImage *ImageAtIndex;
  CGImage *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  uint64_t v58;
  void *v59;
  void *v60;
  void *value;
  uint8_t v62[4];
  id v63;
  __int16 v64;
  void *v65;
  CGDataProviderDirectCallbacks buf;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
  TypeWithExtension = CGImageSourceGetTypeWithExtension(v6);

  value = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraFile subImageDictForPixelWidth:](self, "subImageDictForPixelWidth:"));
  v60 = v8;
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("JPEGOffset")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("JPEGLength")));
    v59 = v10;
    v12 = objc_msgSend(v10, "unsignedIntegerValue");
    v13 = (uint64_t)objc_msgSend(v11, "unsignedIntegerValue");
    if (v13)
    {
      v14 = v13;
      v15 = v13 + 12;
      if (v13 < -12)
        v15 = v13 + 16395;
      v16 = (char *)malloc_type_malloc((v15 & 0xFFFFFFFFFFFFC000) + 0x4000, 0xEE2893C7uLL);
      if (v16)
      {
        v17 = v16;
        v18 = -[PTPCameraFile readStream:size:offset:](self, "readStream:size:offset:", v16, v14, v12);
        if (v14 == v18)
        {
          v19 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17 + 12, v14));
          free(v17);
          if (v19)
          {
            Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            v21 = CGImageSourceCreateWithData(v19, 0);
            v22 = value;
            CFDictionarySetValue(Mutable, kCGImageSourceThumbnailMaxPixelSize, value);
            CFDictionarySetValue(Mutable, kCGImageSourceCreateThumbnailFromImageAlways, kCFBooleanTrue);
            if (v21)
            {
              ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v21, 0, Mutable);
              CFRelease(v21);
              if (!Mutable)
              {
LABEL_11:
                if (ThumbnailAtIndex)
                {
                  __ICOSLogCreate();
                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
                  if ((unint64_t)objc_msgSend(v24, "length") >= 0x15)
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringWithRange:", 0, 18));
                    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

                    v24 = (void *)v26;
                  }
                  v27 = (const void *(__cdecl *)(void *))objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✓ Thumbnail SubImage Dict")));
                  v28 = (void *)_gICOSLog;
                  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = objc_retainAutorelease(v24);
                    v30 = v28;
                    v31 = v29;
                    v22 = value;
                    buf.version = 136446466;
                    *(_QWORD *)(&buf.version + 1) = objc_msgSend(v31, "UTF8String");
                    WORD2(buf.getBytePointer) = 2114;
                    *(CGDataProviderGetBytePointerCallback *)((char *)&buf.getBytePointer + 6) = v27;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);

                  }
                }

                goto LABEL_45;
              }
            }
            else
            {
              ThumbnailAtIndex = 0;
              if (!Mutable)
                goto LABEL_11;
            }
            CFRelease(Mutable);
            goto LABEL_11;
          }
        }
        else
        {
          v32 = v18;
          __ICOSLogCreate();
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
          if ((unint64_t)objc_msgSend(v33, "length") >= 0x15)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "substringWithRange:", 0, 18));
            v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

            v33 = (void *)v58;
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received %zu bytes, expected %lu"), v32, v14));
          v36 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
            sub_10002FD08(v33, v36, (uint64_t)v35);

          free(v17);
        }
      }
    }

  }
  v37 = objc_alloc((Class)NSMutableDictionary);
  v38 = v3;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v3));
  v19 = (const __CFData *)objc_msgSend(v37, "initWithObjectsAndKeys:", TypeWithExtension, kCGImageSourceTypeIdentifierHint, v39, kCGImageSourceThumbnailMaxPixelSize, kCFBooleanTrue, kCGImageSourceCreateThumbnailFromImageAlways, 0);

  *(_OWORD *)&buf.version = xmmword_100048DA0;
  *(_OWORD *)&buf.releaseBytePointer = unk_100048DB0;
  buf.releaseInfo = (CGDataProviderReleaseInfoCallback)nullsub_4;
  v40 = CGDataProviderCreateDirect(self, -[PTPCameraItem size](self, "size"), &buf);
  v41 = CGImageSourceCreateWithDataProvider(v40, v19);
  Count = CGImageSourceGetCount(v41);
  __ICOSLogCreate();
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("     numImages: %d\n"), Count));
  if (__ICLogTypeEnabled(4))
  {
    v44 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v62 = 138543362;
      v63 = v43;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}@", v62, 0xCu);
    }
  }

  if (Count)
  {
    v45 = 0;
    v46 = 0;
    do
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v41, v45, 0);
      if (ImageAtIndex)
      {
        v48 = ImageAtIndex;
        if (CGImageGetHeight(ImageAtIndex) > v38)
          v46 = v45;
        CFRelease(v48);
      }
      ++v45;
    }
    while (Count != v45);
  }
  else
  {
    v46 = 0;
  }
  v22 = value;
  if (v41)
  {
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v41, v46, v19);
    CFRelease(v41);
    CGDataProviderRelease(v40);
    if (ThumbnailAtIndex)
    {
      __ICOSLogCreate();
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
      if ((unint64_t)objc_msgSend(v49, "length") >= 0x15)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "substringWithRange:", 0, 18));
        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringByAppendingString:", CFSTR("..")));

        v49 = (void *)v51;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✓ ImageIO Created")));
      v53 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_retainAutorelease(v49);
        v55 = v53;
        v56 = objc_msgSend(v54, "UTF8String");
        *(_DWORD *)v62 = 136446466;
        v63 = v56;
        v64 = 2114;
        v65 = v52;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v62, 0x16u);

      }
    }
  }
  else
  {
    CGDataProviderRelease(v40);
    ThumbnailAtIndex = 0;
  }
  v9 = v60;
LABEL_45:

  return ThumbnailAtIndex;
}

- (id)fingerprintWithError:(id *)a3
{
  void *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  ICCameraFileFingerprint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem fingerprint](self, "fingerprint"));

  if (!v5)
  {
    v6 = (char *)malloc_type_malloc(0x24000uLL, 0xBE777E6FuLL);
    if (v6)
    {
      v7 = v6;
      v8 = -[PTPCameraFile readStream:size:offset:](self, "readStream:size:offset:", v6, 147456, 0);
      v9 = objc_alloc_init(ICCameraFileFingerprint);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7 + 12, v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCameraFileFingerprint fingerprintForData:error:](v9, "fingerprintForData:error:", v10, a3));
      -[PTPCameraItem setFingerprint:](self, "setFingerprint:", v11);

      __ICOSLogCreate();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem name](self, "name"));
      if ((unint64_t)objc_msgSend(v12, "length") >= 0x15)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringWithRange:", 0, 18));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

        v12 = (void *)v14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PTPCameraItem fingerprint](self, "fingerprint"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fingerprint: %@"), v15));

      v17 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_retainAutorelease(v12);
        v19 = v17;
        *(_DWORD *)buf = 136446466;
        v22 = objc_msgSend(v18, "UTF8String");
        v23 = 2114;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[PTPCameraItem fingerprint](self, "fingerprint"));
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)raw
{
  return self->_raw;
}

- (void)setRaw:(BOOL)a3
{
  self->_raw = a3;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (NSString)UTI
{
  return self->_UTI;
}

- (void)setUTI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setSubImages:(id)a3
{
  objc_storeStrong((id *)&self->_subImages, a3);
}

- (int)thmSize
{
  return self->_thmSize;
}

- (void)setThmSize:(int)a3
{
  self->_thmSize = a3;
}

- (int)thmOffset
{
  return self->_thmOffset;
}

- (void)setThmOffset:(int)a3
{
  self->_thmOffset = a3;
}

- (int)thmWidth
{
  return self->_thmWidth;
}

- (void)setThmWidth:(int)a3
{
  self->_thmWidth = a3;
}

- (int)thmHeight
{
  return self->_thmHeight;
}

- (void)setThmHeight:(int)a3
{
  self->_thmHeight = a3;
}

- (int)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(int)a3
{
  self->_imageWidth = a3;
}

- (int)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(int)a3
{
  self->_imageHeight = a3;
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int)a3
{
  self->_imageOrientation = a3;
}

- (int)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(int)a3
{
  self->_bitsPerPixel = a3;
}

- (int64_t)dpOffset
{
  return self->_dpOffset;
}

- (void)setDpOffset:(int64_t)a3
{
  self->_dpOffset = a3;
}

- (BOOL)updatedBasicMetadata
{
  return self->_updatedBasicMetadata;
}

- (void)setUpdatedBasicMetadata:(BOOL)a3
{
  self->_updatedBasicMetadata = a3;
}

- (BOOL)updatedExpensiveMetadata
{
  return self->_updatedExpensiveMetadata;
}

- (void)setUpdatedExpensiveMetadata:(BOOL)a3
{
  self->_updatedExpensiveMetadata = a3;
}

- (BOOL)previewThumbnail
{
  return self->_previewThumbnail;
}

- (void)setPreviewThumbnail:(BOOL)a3
{
  self->_previewThumbnail = a3;
}

- (BOOL)smallThumbnail
{
  return self->_smallThumbnail;
}

- (void)setSmallThumbnail:(BOOL)a3
{
  self->_smallThumbnail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subImages, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

@end
