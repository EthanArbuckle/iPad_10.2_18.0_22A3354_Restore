@implementation DIResizeParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  DIResizeParams *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  result = -[DIBaseParams initWithURL:error:](&v7, "initWithURL:error:", a3, a5);
  if (result)
    result->_size = a4;
  return result;
}

- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  DIResizeParams *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  DIResizeParams *v16;
  objc_super v18;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputURL"));
  v18.receiver = self;
  v18.super_class = (Class)DIResizeParams;
  v10 = -[DIBaseParams initWithURL:error:](&v18, "initWithURL:error:", v9, a5);

  if (!v10)
    goto LABEL_3;
  v10->_size = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diskImageParamsXPC"));
  -[DIBaseParams setDiskImageParamsXPC:](v10, "setDiskImageParamsXPC:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v10, "shadowChain"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shadowChain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nodes"));
  v15 = objc_msgSend(v12, "addShadowNodes:error:", v14, a5);

  if ((v15 & 1) == 0)
    v16 = 0;
  else
LABEL_3:
    v16 = v10;

  return v16;
}

- (DIResizeParams)initWithCoder:(id)a3
{
  id v4;
  DIResizeParams *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  v5 = -[DIBaseParams initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_size = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DIResizeParams;
  -[DIBaseParams encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIResizeParams size](self, "size"), CFSTR("size"));

}

- (BOOL)resizeWithError:(id *)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  DIClient2Controller_XPCHandler *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  char *v29;
  unsigned __int8 v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[8];
  __int16 v53;
  const char *v54;
  __int16 v55;
  DIResizeParams *v56;

  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3))
  {
    v5 = *__error();
    if (sub_1000BF0BC())
    {
      v51 = 0;
      v6 = sub_1000BF044();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        v8 = 3;
      else
        v8 = 2;
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 34;
      v53 = 2080;
      v54 = "-[DIResizeParams resizeWithError:]";
      v55 = 2114;
      v56 = self;
      v9 = (char *)_os_log_send_and_compose_impl(v8, &v51, 0, 0, &_mh_execute_header, v7, 0, "%.*s: entry: %{public}@", buf, 28);

      if (v9)
      {
        fprintf(__stderrp, "%s\n", v9);
        free(v9);
      }
    }
    else
    {
      v11 = sub_1000BF044();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 34;
        v53 = 2080;
        v54 = "-[DIResizeParams resizeWithError:]";
        v55 = 2114;
        v56 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v5;
    v13 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v13, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v13, 1, a3))
    {
      v10 = 0;
LABEL_17:

      return v10;
    }
    v51 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    v16 = objc_msgSend(v15, "shouldValidate");
    if (v14)
    {
      objc_msgSend(v14, "createDiskImageWithCache:shadowValidation:", 0, v16);
      v17 = *(_QWORD *)buf;
    }
    else
    {
      v17 = 0;
    }
    v19 = v51;
    v51 = v17;
    *(_QWORD *)buf = 0;
    if (v19)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
      v20 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      if (v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20);
    }

    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 40))(v51) & 1) != 0)
    {
      v21 = -[DIResizeParams size](self, "size");
      v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51);
      v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 32))(v51);
      v24 = (v21 + v22 - 1) / v22 * v22;
      if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51) * v23 == v24)
      {
        v25 = *__error();
        if (sub_1000BF0BC())
        {
          v50 = 0;
          v26 = sub_1000BF044();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            v28 = 3;
          else
            v28 = 2;
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 34;
          v53 = 2080;
          v54 = "-[DIResizeParams resizeWithError:]";
          LODWORD(v49) = 18;
          v29 = (char *)_os_log_send_and_compose_impl(v28, &v50, 0, 0, &_mh_execute_header, v27, 0, "%.*s: New disk image size is the same as previous", (int)buf, v49);

          if (v29)
          {
            fprintf(__stderrp, "%s\n", v29);
            free(v29);
          }
        }
        else
        {
          v33 = sub_1000BF044();
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&buf[4] = 34;
            v53 = 2080;
            v54 = "-[DIResizeParams resizeWithError:]";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%.*s: New disk image size is the same as previous", buf, 0x12u);
          }

        }
        *__error() = v25;
        v10 = 1;
        goto LABEL_39;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      v32 = objc_msgSend(v31, "setSizeWithDiskImage:newSize:", &v51, v24);

      if (!(_DWORD)v32)
      {
        v36 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 32))(v51);
        -[DIResizeParams setSize:](self, "setSize:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51) * v36);
        v37 = *__error();
        if (sub_1000BF0BC())
        {
          v50 = 0;
          v38 = sub_1000BF044();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          v41 = -[DIResizeParams size](self, "size");
          if (v40)
            v42 = 3;
          else
            v42 = 2;
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 34;
          v53 = 2080;
          v54 = "-[DIResizeParams resizeWithError:]";
          v55 = 2048;
          v56 = (DIResizeParams *)v41;
          LODWORD(v49) = 28;
          v43 = (char *)_os_log_send_and_compose_impl(v42, &v50, 0, 0, &_mh_execute_header, v39, 0, "%.*s: Disk image resized to %llu bytes", (int)buf, v49);

          if (v43)
          {
            fprintf(__stderrp, "%s\n", v43);
            free(v43);
          }
        }
        else
        {
          v44 = sub_1000BF044();
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = -[DIResizeParams size](self, "size");
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&buf[4] = 34;
            v53 = 2080;
            v54 = "-[DIResizeParams resizeWithError:]";
            v55 = 2048;
            v56 = (DIResizeParams *)v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
          }

        }
        *__error() = v37;
        v47 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 136))(v51);
        v48 = sub_100013328(v47);
        if ((_DWORD)v48)
          v10 = +[DIError failWithPOSIXCode:error:](DIError, "failWithPOSIXCode:error:", v48, a3);
        else
          v10 = 1;
        if (v47)
          (*(void (**)(_QWORD *))(*v47 + 40))(v47);
        goto LABEL_39;
      }
      v30 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v32, CFSTR("Failed to resize the image"), a3);
    }
    else
    {
      v30 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Image doesn't support resizing"), a3);
    }
    v10 = v30;
LABEL_39:
    v35 = v51;
    v51 = 0;
    if (v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v35 + 16))(v35);
    goto LABEL_17;
  }
  return 0;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end
