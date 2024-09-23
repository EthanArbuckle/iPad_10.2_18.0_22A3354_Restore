@implementation TTSStreamingZipReader

- (TTSStreamingZipReader)initWithPath:(id)a3 andPassword:(id)a4
{
  id v7;
  id v8;
  TTSStreamingZipReader *v9;
  TTSStreamingZipReader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTSStreamingZipReader;
  v9 = -[TTSStreamingZipReader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zipPath, a3);
    objc_storeStrong((id *)&v10->_password, a4);
  }

  return v10;
}

- (BOOL)enumerateFiles:(id)a3
{
  void (**v4)(id, void *, void *);
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int add_passphrase;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int open_filename;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[6];

  v4 = (void (**)(id, void *, void *))a3;
  v5 = archive_read_new();
  if (archive_read_support_format_zip())
  {
    AXTTSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1A3AB0F98();

    goto LABEL_12;
  }
  objc_msgSend_password(self, v6, v7, v8, v9);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v11, v12, v13, v14, v15);
  add_passphrase = archive_read_add_passphrase();

  if (add_passphrase)
  {
    AXTTSLogCommon();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      sub_1A3AB0F18(self, v21, v22, v23, v24);
LABEL_11:

    archive_read_free();
    goto LABEL_12;
  }
  objc_msgSend_zipPath(self, v17, v18, v19, v20);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_fileSystemRepresentation(v25, v26, v27, v28, v29);
  open_filename = archive_read_open_filename();

  if (open_filename)
  {
    AXTTSLogCommon();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      sub_1A3AB0E98(self, v21, v31, v32, v33);
    goto LABEL_11;
  }
  v46[5] = 0;
  if (archive_read_next_header())
  {
LABEL_18:
    archive_read_free();
    v34 = 1;
    goto LABEL_13;
  }
  v36 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v37 = archive_entry_pathname();
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v38, v37, 4, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v36;
    v46[1] = 3221225472;
    v46[2] = sub_1A396CF2C;
    v46[3] = &unk_1E4AA0228;
    v46[4] = v5;
    v41 = _Block_copy(v46);
    if (!v37)
      break;
    v4[2](v4, v40, v41);

    if (archive_read_next_header())
      goto LABEL_18;
  }
  AXTTSLogCommon();
  v42 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    sub_1A3AB0E20(self, v42, v43, v44, v45);

LABEL_12:
  v34 = 0;
LABEL_13:

  return v34;
}

- (NSString)zipPath
{
  return self->_zipPath;
}

- (void)setZipPath:(id)a3
{
  objc_storeStrong((id *)&self->_zipPath, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_zipPath, 0);
}

@end
