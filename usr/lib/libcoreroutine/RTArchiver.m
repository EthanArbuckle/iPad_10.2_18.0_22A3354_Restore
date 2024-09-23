@implementation RTArchiver

- (RTArchiver)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOutputURL_compress_);
}

- (RTArchiver)initWithOutputURL:(id)a3 compress:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  id v12;
  const char *v13;
  int v14;
  NSObject *v15;
  int v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTArchiver initWithOutputURL:compress:]";
      v20 = 1024;
      v21 = 42;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTArchiver;
  self = -[RTArchiver init](&v17, sel_init);
  if (self)
  {
    self->_archive = (archive *)archive_write_new();
    if (v4)
      v7 = archive_write_add_filter_gzip();
    else
      v7 = archive_write_add_filter_none();
    v9 = v7;
    if (!v7)
    {
      v9 = archive_write_set_format_pax();
      if (!v9)
      {
        objc_msgSend(v6, "path");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (const char *)objc_msgSend(v12, "UTF8String");

        v14 = open_dprotected_np(v13, 514, 2, 0, 416);
        self->_archive_fd = v14;
        if (v14 < 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = *__error();
            *(_DWORD *)buf = 138412546;
            v19 = (const char *)v6;
            v20 = 1024;
            v21 = v16;
            _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Unable to create archive at path %@ with data protection, errno, %{errno}d", buf, 0x12u);
          }

          archive_write_close();
          goto LABEL_14;
        }
        v9 = archive_write_open_fd();
        self->_valid = 1;
        if (!v9)
          goto LABEL_15;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = (const char *)v6;
      v20 = 1024;
      v21 = v9;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Error creating archive at path %@ %d", buf, 0x12u);
    }

    -[RTArchiver closeArchive](self, "closeArchive");
LABEL_14:

    self = 0;
  }
LABEL_15:

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[RTArchiver closeArchive](self, "closeArchive");
  v3.receiver = self;
  v3.super_class = (Class)RTArchiver;
  -[RTArchiver dealloc](&v3, sel_dealloc);
}

- (void)addFileToArchive:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  ssize_t v12;
  ssize_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  char *v20;
  int v21;
  uint64_t v22;
  void *v23;
  stat v24;
  uint8_t v25[4];
  void *v26;
  __int16 v27;
  ssize_t v28;
  __int16 v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[RTArchiver addFileToArchive:]";
      v33 = 1024;
      v34 = 99;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: filePath (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  if (!v6)
    goto LABEL_10;
  stat(v6, &v24);
  archive_entry_new();
  archive_entry_copy_stat();
  objc_msgSend(v4, "relativePath");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  archive_entry_set_pathname();

  if (archive_write_header())
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = archive_errno();
      v22 = archive_error_string();
      *(_DWORD *)buf = 138412802;
      v32 = v20;
      v33 = 1024;
      v34 = v21;
      v35 = 2080;
      v36 = v22;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "failed to write header for file, %@, status, %d, reason: %s", buf, 0x1Cu);

    }
    goto LABEL_10;
  }
  v10 = open(v6, 0);
  if (v10 == -1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      v17 = *__error();
      *(_DWORD *)buf = 138412802;
      v32 = v15;
      v33 = 1024;
      v34 = v16;
      v35 = 1024;
      LODWORD(v36) = v17;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "failed to open file, %@, error, %d %{errno}d", buf, 0x18u);

    }
LABEL_9:

    goto LABEL_10;
  }
  v11 = v10;
  v12 = read(v10, buf, 0x2000uLL);
  if (v12 >= 1)
  {
    v13 = v12;
    while (1)
    {
      v14 = archive_write_data();
      if (v14 != v13)
        break;
      v13 = read(v11, buf, 0x2000uLL);
      if (v13 <= 0)
        goto LABEL_22;
    }
    v18 = v14;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v25 = 138412802;
      v26 = v23;
      v27 = 2048;
      v28 = v13;
      v29 = 2048;
      v30 = v18;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "error writing file, %@, request to write %ld bytes but wrote %ld bytes", v25, 0x20u);

    }
  }
LABEL_22:
  archive_entry_free();
  close(v11);
LABEL_10:

}

- (void)addDirectoryToArchive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, &v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;

    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (const char *)v7;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error while reading directory, %@", buf, 0xCu);
      }

    }
    else if (v6)
    {
      v26 = v6;
      buf[0] = 0;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v6;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v10 = 0x1E0CB3000uLL;
      if (v9)
      {
        v11 = v9;
        v12 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v3, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringByAppendingPathComponent:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "relativePath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringByAppendingPathComponent:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(v10 + 1568), "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v17, buf);

            if (v21)
            {
              v22 = (void *)MEMORY[0x1E0C99E98];
              v23 = buf[0];
              objc_msgSend(v3, "baseURL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "fileURLWithPath:isDirectory:relativeToURL:", v19, v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (buf[0])
                -[RTArchiver addDirectoryToArchive:](self, "addDirectoryToArchive:", v25);
              else
                -[RTArchiver addFileToArchive:](self, "addFileToArchive:", v25);

              v10 = 0x1E0CB3000;
            }

            objc_autoreleasePoolPop(v15);
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v11);
      }

      v6 = v26;
      v7 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTArchiver addDirectoryToArchive:]";
      v37 = 1024;
      v38 = 148;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: directory (in %s:%d)", buf, 0x12u);
    }
  }

}

- (void)closeArchive
{
  int archive_fd;

  if (self->_valid)
  {
    archive_write_free();
    self->_valid = 0;
  }
  archive_fd = self->_archive_fd;
  if (archive_fd >= 1)
  {
    close(archive_fd);
    self->_archive_fd = -1;
  }
}

+ (BOOL)extractArchiveAtURL:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int open_filename;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int next_header;
  NSObject *v25;
  uint64_t v26;
  int data_block;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void **v37;
  uint64_t *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "+[RTArchiver extractArchiveAtURL:error:]";
      v51 = 1024;
      v52 = 201;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: archiveURL (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    archive_read_new();
    archive_read_support_format_all();
    archive_read_support_filter_all();
    objc_msgSend(v5, "path");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    open_filename = archive_read_open_filename();

    if (open_filename)
    {
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0D18598];
        v45 = *MEMORY[0x1E0CB2D50];
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("failed to open archive, %@, %s"), v15, archive_error_string());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      archive_write_disk_new();
      archive_write_disk_set_options();
      while (1)
      {
        next_header = archive_read_next_header();
        if (next_header)
          break;
        if (archive_write_header())
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            v50 = (const char *)v26;
            _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "failed to write header, archive_write_header, error, %s", buf, 0xCu);
          }

        }
        else
        {
          while (1)
          {
            data_block = archive_read_data_block();
            if (data_block)
              break;
            if (archive_write_data_block() < 0)
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v28 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                goto LABEL_26;
              v29 = archive_error_string();
              *(_DWORD *)buf = 136315138;
              v50 = (const char *)v29;
              v30 = v28;
              v31 = "failed to write data block, archive_write_data_block, error, %s";
              goto LABEL_25;
            }
          }
          if (data_block == 1)
            goto LABEL_27;
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v32 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            v50 = (const char *)v32;
            v30 = v28;
            v31 = "failed to read data block, archive_read_data_block, error, %s";
LABEL_25:
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, v31, buf, 0xCu);
          }
LABEL_26:

LABEL_27:
          if (archive_write_finish_entry())
          {
            if (a4)
            {
              v33 = (void *)MEMORY[0x1E0CB35C8];
              v34 = *MEMORY[0x1E0D18598];
              v41 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to write archive, %s"), archive_error_string());
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v35;
              v36 = (void *)MEMORY[0x1E0C99D80];
              v37 = &v42;
              v38 = &v41;
              goto LABEL_34;
            }
            goto LABEL_35;
          }
        }
      }
      if (next_header == 1)
      {
        LOBYTE(a4) = 1;
        goto LABEL_36;
      }
      if (a4)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0D18598];
        v43 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to open archive, %s"), archive_error_string());
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v35;
        v36 = (void *)MEMORY[0x1E0C99D80];
        v37 = &v44;
        v38 = &v43;
LABEL_34:
        objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 0, v39);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
        LOBYTE(a4) = 0;
      }
LABEL_36:
      archive_read_free();
    }
    archive_read_free();
  }
  else if (a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v47 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("archive doesn't exist at path, %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
