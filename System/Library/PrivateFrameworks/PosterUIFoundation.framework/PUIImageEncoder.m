@implementation PUIImageEncoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (PUIImageEncoder)initWithURL:(id)a3 format:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PUIImageEncoder *v10;
  void *v11;
  uint64_t v12;
  NSURL *url;
  uint64_t v14;
  PUIImageOnDiskFormat *format;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("url != ((void *)0)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageEncoder initWithURL:format:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244650ED8);
  }
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("format != ((void *)0)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageEncoder initWithURL:format:].cold.2(a2);
    goto LABEL_11;
  }
  v18.receiver = self;
  v18.super_class = (Class)PUIImageEncoder;
  v10 = -[PUIImageEncoder init](&v18, sel_init);
  if (v10)
  {
    objc_msgSend(v7, "absoluteURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v12;

    v14 = objc_msgSend(v9, "copy");
    format = v10->_format;
    v10->_format = (PUIImageOnDiskFormat *)v14;

  }
  return v10;
}

- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4
{
  if (a3)
    *a3 = objc_msgSend((id)objc_opt_class(), "snapshotInterfaceOrientationForURL:", self->_url);
  if (a4)
    *a4 = objc_msgSend((id)objc_opt_class(), "snapshotDeviceOrientationForURL:", self->_url);
}

+ (int64_t)snapshotInterfaceOrientationForURL:(id)a3
{
  const char *v3;
  int64_t value;

  value = 0;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (getxattr(v3, (const char *)objc_msgSend(kPaperboardIOSurfaceInterfaceOrientationPropertiesKey, "UTF8String"), &value, 8uLL, 0, 0) == -1)return 0;
  else
    return value;
}

+ (int64_t)snapshotDeviceOrientationForURL:(id)a3
{
  const char *v3;
  int64_t value;

  value = 0;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  if (getxattr(v3, (const char *)objc_msgSend(kPaperboardIOSurfaceDeviceOrientationPropertiesKey, "UTF8String"), &value, 8uLL, 0, 0) == -1)return 0;
  else
    return value;
}

- (id)writeThenReadBackImage:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[PUIImageEncoder saveUIImage:error:](self, "saveUIImage:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUIImageEncoder createUIImageWithError:](self, "createUIImageWithError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)createUIImageWithError:(id *)a3
{
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "snapshotInterfaceOrientationForURL:", self->_url);
  objc_msgSend((id)objc_opt_class(), "snapshotDeviceOrientationForURL:", self->_url);
  objc_msgSend((id)objc_opt_class(), "snapshotScaleForURL:", self->_url);
  if (v5 == 0.0)
    v6 = 1.0;
  else
    v6 = v5;
  return -[PUIImageEncoder createUIImageWithOrientation:scale:error:](self, "createUIImageWithOrientation:scale:error:", PUIImageOrientationForImageCapturedInInterfaceOrientationToBeDisplayedInInterfaceOrientation(), a3, v6);
}

+ (void)decorateSurface:(id)a3 interfaceOrientation:(int64_t)a4 deviceOrientation:(int64_t)a5 scale:(double)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (BSInterfaceOrientationIsValid())
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachment:forKey:", v9, kPaperboardIOSurfaceInterfaceOrientationPropertiesKey);

  }
  if (BSInterfaceOrientationIsValid())
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachment:forKey:", v10, kPaperboardIOSurfaceDeviceOrientationPropertiesKey);

  }
  if (a6 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachment:forKey:", v11, kPaperboardIOSurfaceDeviceScalePropertiesKey);

  }
}

- (id)createUIImageWithOrientation:(int64_t)a3 scale:(double)a4 error:(id *)a5
{
  NSURL *url;
  BOOL v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSURL *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSURL *v24;
  NSURL *v25;
  void *v26;
  id v27;
  CGImageSource *v28;
  CGImage *ImageAtIndex;
  id v30;
  double v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSURL *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];
  _QWORD v50[5];

  v50[4] = *MEMORY[0x24BDAC8D0];
  url = self->_url;
  v42 = 0;
  v10 = -[NSURL checkResourceIsReachableAndReturnError:](url, "checkResourceIsReachableAndReturnError:", &v42);
  v11 = v42;
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend((id)objc_opt_class(), "snapshotVersionForURL:", self->_url);
    if (v13)
      v14 = v13;
    else
      v14 = -1;
    if (v14 <= 12)
    {
      if (a5)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BDD0FC8];
        v48[0] = CFSTR("Image cannot be created from URL; using an out-of-date version.");
        v47[0] = v16;
        v47[1] = CFSTR("version");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2] = *MEMORY[0x24BDD1328];
        v18 = self->_url;
        v48[1] = v17;
        v48[2] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 3, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v20 = 0;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_10;
    }
    v25 = self->_url;
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "pui_loadImageDataFromFileURL:error:", v25, &v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    v17 = v27;
    if (!v26 || v27)
    {
      if (!a5)
      {
        v20 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v33 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FF0];
      v45[0] = *MEMORY[0x24BDD0FC8];
      v45[1] = v34;
      v46[0] = CFSTR("Image cannot be created from URL.");
      v46[1] = CFSTR("Ensure the path is readable by this process.");
      v35 = *MEMORY[0x24BDD1328];
      v45[2] = *MEMORY[0x24BDD1398];
      v45[3] = v35;
      v36 = self->_url;
      v46[2] = v27;
      v46[3] = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 4);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 4, v32);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = CGImageSourceCreateWithData((CFDataRef)v26, 0);
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v28, 0, 0);
      v30 = objc_alloc(MEMORY[0x24BDF6AC8]);
      v31 = 1.0;
      if (a4 != 0.0)
        v31 = a4;
      v32 = (id)objc_msgSend(v30, "initWithCGImage:scale:orientation:", ImageAtIndex, a3, v31);
      if (ImageAtIndex)
        CGImageRelease(ImageAtIndex);
      if (v28)
        CFRelease(v28);
      if (v32)
      {
        v32 = v32;
        v20 = v32;
      }
      else
      {
        if (a5)
        {
          v37 = (void *)MEMORY[0x24BDD1540];
          v38 = *MEMORY[0x24BDD0FF0];
          v43[0] = *MEMORY[0x24BDD0FC8];
          v43[1] = v38;
          v44[0] = CFSTR("Image cannot be created from URL.");
          v44[1] = CFSTR("Ensure the data is an actual image.");
          v43[2] = *MEMORY[0x24BDD1328];
          v44[2] = self->_url;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 4, v39);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v20 = 0;
      }
    }

    goto LABEL_28;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FF0];
    v49[0] = *MEMORY[0x24BDD0FC8];
    v49[1] = v22;
    v50[0] = CFSTR("Image cannot be created from URL.");
    v50[1] = CFSTR("Ensure the path is reachable by this process.");
    v23 = *MEMORY[0x24BDD1328];
    v49[2] = *MEMORY[0x24BDD1398];
    v49[3] = v23;
    v24 = self->_url;
    v50[2] = v11;
    v50[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 4, v17);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
LABEL_10:
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)saveUIImage:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t CGImageRepresentation;
  void *v11;
  void *v12;
  id v13;
  const void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[4];

  v59[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    CGImageRepresentation = objc_msgSend(v9, "CGImage");
    if (!CGImageRepresentation)
    {
      objc_msgSend(v9, "pui_wrappedIOSurface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_6;
      objc_msgSend(v9, "pui_wrappedIOSurface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "CGImageBuilder");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v14 = (const void *)objc_msgSend(v13, "buildCGImage");
      if (!v14)
      {
        if (a4)
        {
          v48 = (void *)MEMORY[0x24BDD1540];
          v49 = *MEMORY[0x24BDD0FF0];
          v56[0] = *MEMORY[0x24BDD0FC8];
          v56[1] = v49;
          v57[0] = CFSTR("underlying CGImage cannot be saved URL by encoder");
          v57[1] = CFSTR("Ensure the image is an actual image.");
          v56[2] = *MEMORY[0x24BDD1328];
          v57[2] = self->_url;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 4, v50);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v15 = 0;
        goto LABEL_48;
      }
      CGImageRepresentation = (uint64_t)CFAutorelease(v14);

      if (!CGImageRepresentation)
      {
LABEL_6:
        CGImageRepresentation = _UIImageGetCGImageRepresentation();
        if (!CGImageRepresentation)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("cgImage != ((void *)0)"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[PUIImageEncoder saveUIImage:error:].cold.1(a2);
          objc_msgSend(objc_retainAutorelease(v52), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x244695880);
        }
      }
    }
    -[PUIImageEncoder saveImage:error:](self, "saveImage:error:", CGImageRepresentation, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "pui_wrappedIOSurface");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "attachmentForKey:", kPaperboardIOSurfaceInterfaceOrientationPropertiesKey);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(v9, "pui_wrappedIOSurface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attachmentForKey:", kPaperboardIOSurfaceDeviceOrientationPropertiesKey);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      if (v18 | v21)
      {
        if (!v18)
        {
LABEL_19:
          if (v21)
          {
            v28 = objc_msgSend((id)objc_opt_class(), "setSnapshotDeviceOrientation:forURL:", v21, v15);
            if (a4)
            {
              if ((v28 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to write snapshot orientation xattr"), *MEMORY[0x24BDD0FD0]);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1328]);
                __error();
                _NSErrorWithFilePathAndErrno();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BDD1398]);
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 6, v29);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
            }
          }
LABEL_25:
          objc_msgSend(v9, "pui_wrappedIOSurface");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "attachmentForKey:", kPaperboardIOSurfaceDeviceScalePropertiesKey);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          v34 = v33;
          if (v33 == 0.0)
          {
            objc_msgSend(v9, "scale");
            v34 = v35;
          }

          v36 = objc_msgSend((id)objc_opt_class(), "setSnapshotScale:forURL:", v15, v34);
          if (a4 && !v36)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to write snapshot orientation xattr"), *MEMORY[0x24BDD0FD0]);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1328]);
            __error();
            _NSErrorWithFilePathAndErrno();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BDD1398]);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 6, v37);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v39 = objc_msgSend((id)objc_opt_class(), "setSnapshotVersionForURL:", v15);
          if (a4 && !v39)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to write snapshot version xattr"), *MEMORY[0x24BDD0FD0]);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1328]);
            __error();
            _NSErrorWithFilePathAndErrno();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
              objc_msgSend(v40, "setObject:forKeyedSubscript:", v41, *MEMORY[0x24BDD1398]);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 5, v40);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v42 = *MEMORY[0x24BDBCC20];
          v54[0] = *MEMORY[0x24BDBCC68];
          v54[1] = v42;
          v43 = *MEMORY[0x24BDBCC28];
          v55[0] = MEMORY[0x24BDBD1C8];
          v55[1] = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0;
          v45 = objc_msgSend(v15, "setResourceValues:error:", v44, &v53);
          v13 = v53;

          if (!a4 || v45)
            goto LABEL_48;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to tag snapshot as excluded from backup"), *MEMORY[0x24BDD0FD0]);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1328]);
          if (v13)
          {
            v47 = v13;
          }
          else
          {
            __error();
            _NSErrorWithFilePathAndErrno();
            v47 = (id)objc_claimAutoreleasedReturnValue();
            if (!v47)
            {
LABEL_44:
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 5, v46);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_48;
            }
          }
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, *MEMORY[0x24BDD1398]);
          goto LABEL_44;
        }
      }
      else
      {
        v22 = objc_msgSend(v9, "imageOrientation");
        if (v22 >= 4)
          goto LABEL_25;
        v21 = v22 + 1;
        v18 = 1;
      }
      v25 = objc_msgSend((id)objc_opt_class(), "setSnapshotInterfaceOrientation:forURL:", v18, v15);
      if (a4 && (v25 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to write snapshot orientation xattr"), *MEMORY[0x24BDD0FD0]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1328]);
        __error();
        _NSErrorWithFilePathAndErrno();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDD1398]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 7, v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_19;
    }
  }
  else
  {
    if (a4)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0FF0];
      v58[0] = *MEMORY[0x24BDD0FC8];
      v58[1] = v24;
      v59[0] = CFSTR("Image cannot be saved URL.");
      v59[1] = CFSTR("Ensure the image is an actual image.");
      v58[2] = *MEMORY[0x24BDD1328];
      v59[2] = self->_url;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 4, v13);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

      goto LABEL_49;
    }
    v15 = 0;
  }
LABEL_49:

  return v15;
}

- (id)saveImage:(CGImage *)a3 error:(id *)a4
{
  NSURL *v5;
  PUIImageOnDiskFormat *v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSURL *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSURL *url;
  void *v22;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  CGImage *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  CGImageDestinationRef v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), a4, CFSTR("image != ((void *)0)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIImageEncoder saveImage:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244695C18);
  }
  v5 = (NSURL *)a4;
  v7 = self->_format;
  -[PUIImageOnDiskFormat resolveDestinationOptionsForImage:](v7, "resolveDestinationOptionsForImage:", a3);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v38 = CGImageDestinationCreateWithURL((CFURLRef)self->_url, (CFStringRef)-[PUIImageOnDiskFormat typeIdentifier](self->_format, "typeIdentifier"), 1uLL, v8);
  if (v36[3])
  {
    -[PUIImageOnDiskFormat resolveAddImageOptionsForImage:](v7, "resolveAddImageOptionsForImage:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    objc_msgSend(MEMORY[0x24BE74D00], "sharedASTCProcessingTransactionQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __35__PUIImageEncoder_saveImage_error___block_invoke;
    v26[3] = &unk_25154CDD8;
    v28 = &v35;
    v30 = a3;
    v11 = v9;
    v27 = v11;
    v29 = &v31;
    objc_msgSend(v10, "dispatchSync:", v26);

    if (*((_BYTE *)v32 + 24))
    {
      v5 = self->_url;
    }
    else if (v5)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD1328];
      v39[0] = *MEMORY[0x24BDD0FC8];
      v39[1] = v20;
      url = self->_url;
      v40[0] = CFSTR("Image final encoding failed for unknown reasons in CoreGraphics.");
      v40[1] = url;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 2, v22);
      v5->super.isa = (Class)(id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
    }

    _Block_object_dispose(&v31, 8);
    goto LABEL_10;
  }
  if (v5)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("Image destination failed to be created from URL.");
    v14 = *MEMORY[0x24BDD0FF0];
    v41[0] = v13;
    v41[1] = v14;
    v15 = (void *)MEMORY[0x24BDD17C8];
    -[PUIImageOnDiskFormat typeIdentifier](self->_format, "typeIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Ensure the path is reachable, and that the device supports the type identifier"), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = *MEMORY[0x24BDD1328];
    v17 = self->_url;
    v42[1] = v16;
    v42[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.PosterUIFoundation.ImageEncoding"), 1, v18);
    v5->super.isa = (Class)(id)objc_claimAutoreleasedReturnValue();

    v5 = 0;
LABEL_10:

  }
  _Block_object_dispose(&v35, 8);

  return v5;
}

void __35__PUIImageEncoder_saveImage_error___block_invoke(uint64_t a1)
{
  CGImageDestinationAddImage(*(CGImageDestinationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(CGImageRef *)(a1 + 56), *(CFDictionaryRef *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGImageDestinationFinalize(*(CGImageDestinationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

+ (unsigned)snapshotVersionForURL:(id)a3
{
  const char *v3;
  ssize_t v4;
  unsigned __int8 v5;
  char value;

  value = -1;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v4 = getxattr(v3, (const char *)objc_msgSend(kPaperboardIOSurfaceSnapshotVersionPropertiesKey, "UTF8String"), &value, 1uLL, 0, 0);
  v5 = value;
  if (v4 == -1)
    return -1;
  return v5;
}

+ (BOOL)setSnapshotVersionForURL:(id)a3
{
  const char *v3;
  char value;

  value = 13;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  return setxattr(v3, (const char *)objc_msgSend(kPaperboardIOSurfaceSnapshotVersionPropertiesKey, "UTF8String"), &value, 1uLL, 0, 0) == 0;
}

+ (BOOL)setSnapshotScale:(double)a3 forURL:(id)a4
{
  const char *v4;
  double value;

  value = a3;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  return setxattr(v4, (const char *)objc_msgSend(kPaperboardIOSurfaceDeviceScalePropertiesKey, "UTF8String"), &value, 8uLL, 0, 0) == 0;
}

+ (double)snapshotScaleForURL:(id)a3
{
  const char *v3;
  ssize_t v4;
  double result;
  double value;

  value = 1.0;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v4 = getxattr(v3, (const char *)objc_msgSend(kPaperboardIOSurfaceDeviceScalePropertiesKey, "UTF8String"), &value, 8uLL, 0, 0);
  result = value;
  if (v4 == -1)
    return 1.0;
  return result;
}

+ (BOOL)setSnapshotInterfaceOrientation:(int64_t)a3 forURL:(id)a4
{
  const char *v4;
  int64_t value;

  value = a3;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  return setxattr(v4, (const char *)objc_msgSend(kPaperboardIOSurfaceInterfaceOrientationPropertiesKey, "UTF8String"), &value, 8uLL, 0, 0) == 0;
}

+ (BOOL)setSnapshotDeviceOrientation:(int64_t)a3 forURL:(id)a4
{
  const char *v4;
  int64_t value;

  value = a3;
  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  return setxattr(v4, (const char *)objc_msgSend(kPaperboardIOSurfaceDeviceOrientationPropertiesKey, "UTF8String"), &value, 8uLL, 0, 0) == 0;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PUIImageOnDiskFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)initWithURL:(const char *)a1 format:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithURL:(const char *)a1 format:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)saveUIImage:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)saveImage:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
