@implementation DIConvertParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  stat v8;

  v5 = a3;
  if (objc_msgSend(v5, "isFileURL")
    && (stat((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), &v8)
     || !sub_1001027CC((uint64_t)&v8)))
  {
    v6 = 1;
  }
  else
  {
    v6 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Output of disk image conversion must be a file"), a4);
  }

  return v6;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  DIConvertParams *v11;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v11 = -[DIConvertParams initWithInputURL:outputURL:shadowURLs:error:](self, "initWithInputURL:outputURL:shadowURLs:error:", v8, v9, v10, a5);

  return v11;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  DIConvertParams *v13;
  DIConvertParams *v14;
  DIURL *v15;
  DIURL *outputURL;
  DIConvertParams *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v10, a6);
  v14 = v13;
  if (v13)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v13, "validateFileWithURL:error:", v11, a6))
    {
      v17 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v14->_shadowURLs, a5);
    v15 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v11);
    outputURL = v14->_outputURL;
    v14->_outputURL = v15;

    v14->_sparseBundleBandSize = 0x4000000;
  }
  v17 = v14;
LABEL_6:

  return v17;
}

- (id)initForInplaceWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIConvertParams *v7;
  DIConvertParams *v8;
  DIConvertParams *v9;

  v6 = a3;
  v7 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v6, a4);
  v8 = v7;
  if (v7)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v7, "validateFileWithURL:error:", v6, a4))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1);
  }
  v9 = v8;
LABEL_6:

  return v9;
}

- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIConvertParams *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  DIConvertParams *v12;
  objc_super v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputURL"));
  v14.receiver = self;
  v14.super_class = (Class)DIConvertParams;
  v8 = -[DIBaseParams initWithURL:error:](&v14, "initWithURL:error:", v7, a4);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputURL"));
    v10 = -[DIConvertParams validateFileWithURL:error:](v8, "validateFileWithURL:error:", v9, a4);

    if ((v10 & 1) == 0)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diskImageParamsXPC"));
    -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v11);

    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1);
  }
  v12 = v8;
LABEL_6:

  return v12;
}

- (BOOL)inPlaceConversion
{
  return (id)-[DIConvertParams conversionMethod](self, "conversionMethod") == (id)1;
}

- (BOOL)validateSquashFormats
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = -[DIConvertParams outputFormat](self, "outputFormat");
  if (v3 == 8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v9 = objc_opt_class(DiskImageParamsASIF_XPC, v8);
    isKindOfClass = objc_opt_isKindOfClass(v4, v9);
  }
  else
  {
    if (v3 != 1)
    {
      v10 = 0;
      return v10 & 1;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v6 = objc_opt_class(DiskImageParamsRaw_XPC, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  }
  v10 = isKindOfClass;

  return v10 & 1;
}

- (BOOL)shouldPerformInplaceSquash
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void **p_lpsrc;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v28;
  std::__shared_weak_count *v29;
  void *lpsrc;
  std::__shared_weak_count *v31;
  void *__p;
  std::__shared_weak_count *v33;
  char v34;
  _QWORD v35[2];
  std::__shared_weak_count *v36;
  uint64_t (**v37)();
  uint64_t (**v38)();
  std::__shared_weak_count *v39;
  uint64_t v40;

  if (!-[DIConvertParams validateSquashFormats](self, "validateSquashFormats"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByDeletingLastPathComponent"));

  v5 = objc_retainAutorelease(v4);
  sub_100005870(&__p, (char *)objc_msgSend(v5, "fileSystemRepresentation"));
  v6 = sub_1001017E8((uint64_t)&__p, 0);
  sub_100046E20((uint64_t)v35, v6, 0, 0);
  if (v34 < 0)
    operator delete(__p);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backendXPC"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "backend");
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  sub_10011E808((uint64_t)&v28, &lpsrc);
  if (lpsrc
  {
    __p = v11;
    v33 = v31;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = &__p;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v13 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v29;
  if (v29)
  {
    v17 = (unint64_t *)&v29->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  if (__p && sub_100104FB0((uint64_t)__p, (uint64_t)v35))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams shadowURLs](self, "shadowURLs"));
    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      v10 = objc_msgSend(v20, "mountedOnAPFS");

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
  v21 = v33;
  if (v33)
  {
    v22 = (unint64_t *)&v33->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v35[0] = off_10018D828;
  v37 = off_10018D908;
  v38 = off_10018D940;
  sub_100047198((uint64_t)&v40);
  v24 = v39;
  if (v39)
  {
    v25 = (unint64_t *)&v39->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v36)
    std::__shared_weak_count::__release_weak(v36);

  return v10;
}

- (BOOL)prepareParamsForSquashWithError:(id *)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  DIBaseParams *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v43;
  uint64_t v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;

  v5 = *__error();
  if (sub_1000BF0BC())
  {
    v44 = 0;
    v6 = sub_1000BF044();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v8 = 3;
    else
      v8 = 2;
    *(_DWORD *)buf = 68157954;
    v46 = 51;
    v47 = 2080;
    v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v43) = 18;
    v9 = (char *)_os_log_send_and_compose_impl(v8, &v44, 0, 0, &_mh_execute_header, v7, 0, "%.*s: Performing in-place squash optimization", (int)buf, v43);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v10 = sub_1000BF044();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v46 = 51;
      v47 = 2080;
      v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Performing in-place squash optimization", buf, 0x12u);
    }

  }
  *__error() = v5;
  v12 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
  if (!v12)
    goto LABEL_18;
  if (!+[DICreateParams eraseIfExistingWithURL:error:](DICreateParams, "eraseIfExistingWithURL:error:", v12, a3))
  {
    v30 = *__error();
    if (!sub_1000BF0BC())
    {
      v35 = sub_1000BF044();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v46 = 51;
        v47 = 2080;
        v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%.*s: Failed to erase output URL", buf, 0x12u);
      }

      goto LABEL_38;
    }
    v44 = 0;
    v31 = sub_1000BF044();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      v33 = 3;
    else
      v33 = 2;
    *(_DWORD *)buf = 68157954;
    v46 = 51;
    v47 = 2080;
    v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v43) = 18;
    v34 = (char *)_os_log_send_and_compose_impl(v33, &v44, 0, 0, &_mh_execute_header, v32, 16, "%.*s: Failed to erase output URL", (int)buf, v43);

    if (v34)
    {
LABEL_34:
      fprintf(__stderrp, "%s\n", v34);
      free(v34);
    }
LABEL_38:
    v29 = 0;
    *__error() = v30;
    goto LABEL_39;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v15 = objc_msgSend(v13, "copyItemAtURL:toURL:error:", v14, v12, a3);

  if ((v15 & 1) == 0)
  {
    v30 = *__error();
    if (!sub_1000BF0BC())
    {
      v40 = sub_1000BF044();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v46 = 51;
        v47 = 2080;
        v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%.*s: Failed to copy source disk image to temporary URL", buf, 0x12u);
      }

      goto LABEL_38;
    }
    v44 = 0;
    v37 = sub_1000BF044();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      v39 = 3;
    else
      v39 = 2;
    *(_DWORD *)buf = 68157954;
    v46 = 51;
    v47 = 2080;
    v48 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v43) = 18;
    v34 = (char *)_os_log_send_and_compose_impl(v39, &v44, 0, 0, &_mh_execute_header, v38, 16, "%.*s: Failed to copy source disk image to temporary URL", (int)buf, v43);

    if (v34)
      goto LABEL_34;
    goto LABEL_38;
  }
  v16 = -[DIBaseParams initWithURL:error:]([DIBaseParams alloc], "initWithURL:error:", v12, a3);
  -[DIConvertParams setOutputParams:](self, "setOutputParams:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  v18 = objc_msgSend(v17, "openExistingImageWithFlags:error:", 2, a3);

  if ((v18 & 1) == 0)
  {
LABEL_18:
    v29 = 0;
    goto LABEL_39;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_shadowURLs, "objectAtIndex:", 0));
  v20 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v19);
  -[DIBaseParams setInputURL:](self, "setInputURL:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "path"));
  if (!v22)
  {

    goto LABEL_41;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v23, 1));
  v25 = v24 == 0;

  if (v25)
  {
LABEL_41:
    v29 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Malformed URL format"), a3);
    goto LABEL_39;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_shadowURLs));
  objc_msgSend(v26, "removeObjectAtIndex:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v28 = objc_msgSend(v27, "addShadowURLs:error:", v26, a3);

  if ((v28 & 1) != 0)
  {
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
    v29 = -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3);
  }
  else
  {
    v29 = 0;
  }

LABEL_39:
  return v29;
}

- (BOOL)prepareParamsWithError:(id *)a3
{
  unsigned __int8 v6;
  void *v7;

  if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion"))
    return -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3);
  v6 = 0;
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3))
  {
    if (-[DIConvertParams shouldPerformInplaceSquash](self, "shouldPerformInplaceSquash"))
    {
      -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 2);
      return -[DIConvertParams prepareParamsForSquashWithError:](self, "prepareParamsForSquashWithError:", a3);
    }
    -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    v6 = objc_msgSend(v7, "addShadowURLs:error:", self->_shadowURLs, a3);

  }
  return v6;
}

- (DIConvertParams)initWithCoder:(id)a3
{
  id v4;
  DIConvertParams *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  DIBaseParams *outputParams;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIConvertParams;
  v5 = -[DIBaseParams initWithCoder:](&v11, "initWithCoder:", v4);
  if (v5)
  {
    v5->_conversionMethod = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversionMethod"));
    v5->_outputFormat = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputFormat"));
    v5->_maxRawUDIFRunSize = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxRawUDIFRunSize"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIBaseParams, v6), CFSTR("outputParams"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    outputParams = v5->_outputParams;
    v5->_outputParams = (DIBaseParams *)v8;

    v5->_useFormatMappingInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFormatMappingInfo"));
  }

  return v5;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIConvertParams;
  -[DIBaseParams encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams conversionMethod](self, "conversionMethod"), CFSTR("conversionMethod"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams outputFormat](self, "outputFormat"), CFSTR("outputFormat"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize"), CFSTR("maxRawUDIFRunSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("outputParams"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DIConvertParams useFormatMappingInfo](self, "useFormatMappingInfo"), CFSTR("useFormatMappingInfo"));
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DIConvertParams;
  if (!-[DIBaseParams validateDeserializationWithError:](&v10, "validateDeserializationWithError:"))
    return 0;
  v5 = objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  if (!v5)
    return 1;
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
  v8 = objc_msgSend(v7, "validateDeserializationWithError:", a3);

  return v8;
}

- (id)copyUpdatedOutputURLWithError:(id *)a3
{
  void *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  _QWORD v30[2];
  _BYTE __p[18];
  char v32;
  uint64_t (**v33)();
  std::__shared_weak_count *v34;
  uint64_t (**v35)();
  uint64_t (**v36)();
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
  {

    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  }
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL")));
  v6 = access((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);

  if (v6)
    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL")));
  sub_100005870(__p, (char *)objc_msgSend(v7, "fileSystemRepresentation"));
  v8 = sub_1001017E8((uint64_t)__p, 0);
  sub_100046E20((uint64_t)&v33, v8, 0, 0);
  if (v32 < 0)
    operator delete(*(void **)__p);

  *(_OWORD *)__p = *(_OWORD *)(v37 + 32);
  -[DIBaseParams backend](self, "backend");
  v30[0] = (*(uint64_t (**)())(*(_QWORD *)v28 + 160))();
  v30[1] = v9;
  v11 = *(_QWORD *)__p != v30[0] || *(_QWORD *)&__p[8] != v9;
  v12 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v29->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  if (!v11)
  {
    v15 = *__error();
    if (sub_1000BF0BC())
    {
      v30[0] = 0;
      v16 = sub_1000BF044();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v18 = 3;
      else
        v18 = 2;
      *(_QWORD *)__p = 0x3104100202;
      *(_WORD *)&__p[8] = 2080;
      *(_QWORD *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
      LODWORD(v27) = 18;
      v19 = (char *)_os_log_send_and_compose_impl(v18, v30, 0, 0, &_mh_execute_header, v17, 0, "%.*s: Input and output files are the same, using a temporary output file", (int)__p, v27);

      if (v19)
      {
        fprintf(__stderrp, "%s\n", v19);
        free(v19);
      }
    }
    else
    {
      v21 = sub_1000BF044();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)__p = 0x3104100202;
        *(_WORD *)&__p[8] = 2080;
        *(_QWORD *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%.*s: Input and output files are the same, using a temporary output file", __p, 0x12u);
      }

    }
    *__error() = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
    v12 = (std::__shared_weak_count *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("tmp_convert")));

  }
  v33 = off_10018D828;
  v35 = off_10018D908;
  v36 = off_10018D940;
  sub_100047198((uint64_t)&v39);
  v24 = v38;
  if (v38)
  {
    v25 = (unint64_t *)&v38->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  if (v11)
    return (id)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
  return v12;
}

- (BOOL)convertWithError:(id *)a3
{
  const __CFString *v5;
  BOOL v6;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  DICreateUDSBParams *v23;
  void *v24;
  BOOL v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  char *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char isKindOfClass;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  DIConvertParams *v55;
  void *v56;
  void *v57;
  char *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  DIConvertParams *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned __int8 v73;
  const char *v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  DIClient2Controller_XPCHandler *v82;
  uint8_t buf[4];
  int v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  DIConvertParams *v88;
  __int16 v89;
  void *v90;

  if (!-[DIConvertParams prepareParamsWithError:](self, "prepareParamsWithError:"))
    return 0;
  if (-[DIConvertParams outputFormat](self, "outputFormat") >= 1
    && -[DIConvertParams outputFormat](self, "outputFormat") <= 12)
  {
    if (-[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize")
      && -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize") < 0x100000)
    {
      v5 = CFSTR("Invalid raw UDIF run size limit");
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
    }
    if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")
      && -[DIConvertParams encryptionMethod](self, "encryptionMethod"))
    {
      v5 = CFSTR("In-place conversion maintains the encryption passphrase and method. It's not allowed to specify encryption arguments");
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
    }
    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = sub_100046B80;
    v81 = sub_100046B90;
    v82 = objc_alloc_init(DIClient2Controller_XPCHandler);
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v76 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = 3;
      else
        v11 = 2;
      *(_DWORD *)buf = 68158210;
      v84 = 36;
      v85 = 2080;
      v86 = "-[DIConvertParams convertWithError:]";
      v87 = 2114;
      v88 = self;
      v12 = (char *)_os_log_send_and_compose_impl(v11, &v76, 0, 0, &_mh_execute_header, v10, 0, "%.*s: entry: %{public}@", buf, 28);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v84 = 36;
        v85 = 2080;
        v86 = "-[DIConvertParams convertWithError:]";
        v87 = 2114;
        v88 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v8;
    if ((objc_msgSend((id)v78[5], "connectWithError:", a3) & 1) == 0
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v78[5], 2, a3))
    {
      goto LABEL_65;
    }
    if (-[DIConvertParams conversionMethod](self, "conversionMethod"))
      goto LABEL_26;
    v22 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
    if (!v22)
      goto LABEL_65;
    if ((id)-[DIConvertParams outputFormat](self, "outputFormat") == (id)7)
    {
      v23 = -[DICreateParams initWithURL:error:]([DICreateUDSBParams alloc], "initWithURL:error:", v22, a3);
      if (!v23)
        goto LABEL_46;
      -[DICreateUDSBParams setSparseBundleBandSize:](v23, "setSparseBundleBandSize:", -[DIConvertParams sparseBundleBandSize](self, "sparseBundleBandSize"));
    }
    else
    {
      v23 = -[DICreateParams initWithURL:error:]([DICreateRAWParams alloc], "initWithURL:error:", v22, a3);
      if (!v23)
        goto LABEL_46;
    }
    -[DICreateParams setEncryptionMethod:](v23, "setEncryptionMethod:", -[DIConvertParams encryptionMethod](self, "encryptionMethod"));
    -[DIBaseParams setReadPassphraseFlags:](v23, "setReadPassphraseFlags:", -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"));
    v31 = -[DIConvertParams shouldValidateShadows](self, "shouldValidateShadows");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v23, "shadowChain"));
    objc_msgSend(v32, "setShouldValidate:", v31);

    -[DICreateParams setPassphrase:](v23, "setPassphrase:", -[DIConvertParams passphrase](self, "passphrase"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams publicKey](self, "publicKey"));
    -[DICreateParams setPublicKey:](v23, "setPublicKey:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams certificate](self, "certificate"));
    -[DICreateParams setCertificate:](v23, "setCertificate:", v34);

    if (-[DICreateParams createDiskImageParamsWithError:](v23, "createDiskImageParamsWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:](v23, "createEncryptionWithXPCHandler:error:", v78[5], a3))
    {
      -[DIConvertParams setOutputParams:](self, "setOutputParams:", v23);

LABEL_26:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v78[5], "remoteProxy"));
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_100046B98;
      v75[3] = &unk_1001740F0;
      v75[4] = &v77;
      objc_msgSend(v15, "convertWithParams:reply:", self, v75);

      if ((objc_msgSend((id)v78[5], "completeCommandWithError:", a3) & 1) != 0)
      {
        if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion"))
          goto LABEL_30;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        v17 = v16 == 0;

        if (v17)
          goto LABEL_30;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "inputURL"));
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_30;
        v49 = *__error();
        if (sub_1000BF0BC())
        {
          v76 = 0;
          v50 = sub_1000BF044();
          v51 = objc_claimAutoreleasedReturnValue(v50);
          v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT) ? 3 : 2;
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "inputURL"));
          v55 = (DIConvertParams *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "path"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "path"));
          *(_DWORD *)buf = 68158467;
          v84 = 36;
          v85 = 2080;
          v86 = "-[DIConvertParams convertWithError:]";
          v87 = 2113;
          v88 = v55;
          v89 = 2113;
          v90 = v57;
          LODWORD(v74) = 38;
          v58 = (char *)_os_log_send_and_compose_impl(v52, &v76, 0, 0, &_mh_execute_header, v51, 0, "%.*s: Moving %{private}@ to %{private}@", buf, v74);

          if (v58)
          {
            fprintf(__stderrp, "%s\n", v58);
            free(v58);
          }
        }
        else
        {
          v59 = sub_1000BF044();
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "inputURL"));
            v63 = (DIConvertParams *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "path"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "path"));
            *(_DWORD *)buf = 68158467;
            v84 = 36;
            v85 = 2080;
            v86 = "-[DIConvertParams convertWithError:]";
            v87 = 2113;
            v88 = v63;
            v89 = 2113;
            v90 = v65;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%.*s: Moving %{private}@ to %{private}@", buf, 0x26u);

          }
        }
        *__error() = v49;
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
        v68 = objc_msgSend(v66, "removeItemAtURL:error:", v67, a3);

        if ((v68 & 1) != 0)
        {
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "inputURL"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
          v73 = objc_msgSend(v69, "moveItemAtURL:toURL:error:", v71, v72, a3);

          if ((v73 & 1) != 0)
          {
LABEL_30:
            v6 = 1;
LABEL_66:
            _Block_object_dispose(&v77, 8);

            return v6;
          }
        }
      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
        v25 = v24 == 0;

        if (!v25)
        {
          v26 = *__error();
          if (sub_1000BF0BC())
          {
            v76 = 0;
            v27 = sub_1000BF044();
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              v29 = 3;
            else
              v29 = 2;
            *(_DWORD *)buf = 68157954;
            v84 = 36;
            v85 = 2080;
            v86 = "-[DIConvertParams convertWithError:]";
            LODWORD(v74) = 18;
            v30 = (char *)_os_log_send_and_compose_impl(v29, &v76, 0, 0, &_mh_execute_header, v28, 16, "%.*s: Due to the conversion error, erasing the output file", (int)buf, v74);

            if (v30)
            {
              fprintf(__stderrp, "%s\n", v30);
              free(v30);
            }
          }
          else
          {
            v35 = sub_1000BF044();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68157954;
              v84 = 36;
              v85 = 2080;
              v86 = "-[DIConvertParams convertWithError:]";
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%.*s: Due to the conversion error, erasing the output file", buf, 0x12u);
            }

          }
          *__error() = v26;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
          v39 = objc_opt_class(DICreateParams, v38);
          isKindOfClass = objc_opt_isKindOfClass(v37, v39);

          if ((isKindOfClass & 1) != 0)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            objc_msgSend(v41, "onErrorCleanup");

          }
          else
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputURL](self, "outputURL"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "inputURL"));
            v45 = objc_msgSend(v42, "isEqual:", v44);

            if ((v45 & 1) == 0)
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "inputURL"));
              objc_msgSend(v46, "removeItemAtURL:error:", v48, 0);

            }
          }
        }
      }
LABEL_65:
      v6 = 0;
      goto LABEL_66;
    }
LABEL_46:

    goto LABEL_65;
  }
  v5 = CFSTR("Invalid output format argument");
  return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIConvertParams;
  -[DIBaseParams invalidate](&v5, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIConvertParams outputParams](self, "outputParams"));
    objc_msgSend(v4, "invalidate");

  }
}

+ (BOOL)isUDIFWithFormat:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 5;
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (unint64_t)maxRawUDIFRunSize
{
  return self->_maxRawUDIFRunSize;
}

- (void)setMaxRawUDIFRunSize:(unint64_t)a3
{
  self->_maxRawUDIFRunSize = a3;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

- (BOOL)useFormatMappingInfo
{
  return self->_useFormatMappingInfo;
}

- (void)setUseFormatMappingInfo:(BOOL)a3
{
  self->_useFormatMappingInfo = a3;
}

- (DIURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (DIBaseParams)outputParams
{
  return self->_outputParams;
}

- (void)setOutputParams:(id)a3
{
  objc_storeStrong((id *)&self->_outputParams, a3);
}

- (unint64_t)conversionMethod
{
  return self->_conversionMethod;
}

- (void)setConversionMethod:(unint64_t)a3
{
  self->_conversionMethod = a3;
}

- (NSArray)shadowURLs
{
  return self->_shadowURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowURLs, 0);
  objc_storeStrong((id *)&self->_outputParams, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
