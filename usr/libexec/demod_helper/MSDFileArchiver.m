@implementation MSDFileArchiver

- (BOOL)compressContent:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  FTS *v14;
  id v15;
  int v16;
  FTSENT *v17;
  BOOL v18;
  FTSENT *v19;
  uint64_t v20;
  unsigned int fts_info;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  off_t st_size;
  void *v28;
  void *i;
  id v30;
  uint64_t v31;
  id v32;
  BOOL result;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t disk_new;
  char v49;
  _BYTE v50[7];
  char *v51[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v8 = objc_retainAutorelease(v5);
  v9 = (char *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "fileSystemRepresentation");
  if (v7)
  {
    if (v9)
    {
      v12 = v11;
      if (v11)
      {
        v13 = (void *)archive_write_new();
        archive_write_set_format_zip();
        if (archive_write_open_filename(v13, v12))
        {
          free(v13);
          v40 = sub_100024A40();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_10002C384();

          v18 = 0;
          goto LABEL_36;
        }
        disk_new = archive_read_disk_new();
        archive_read_disk_set_standard_lookup();
        v51[0] = v9;
        v51[1] = 0;
        v14 = fts_open(v51, 84, 0);
        if (v14)
        {
          v47 = v10;
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByDeletingLastPathComponent")));
          v16 = strlen((const char *)objc_msgSend(v15, "fileSystemRepresentation"));

          v17 = fts_read(v14);
          v18 = 1;
          if (v17)
          {
            v19 = v17;
            v46 = v8;
            v20 = v16 + 1;
            while (1)
            {
              fts_info = v19->fts_info;
              if (fts_info > 0xE)
                goto LABEL_13;
              v22 = 1 << fts_info;
              if ((v22 & 0x4266) == 0)
                break;
LABEL_10:
              v19 = fts_read(v14);
              if (!v19)
              {
                v18 = 1;
                v8 = v46;
                v10 = v47;
                v31 = disk_new;
                goto LABEL_29;
              }
            }
            if ((v22 & 0x490) != 0)
            {
              v32 = sub_100024A40();
              v25 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                sub_10002C354();
              v26 = 0;
LABEL_26:
              v8 = v46;
              v10 = v47;
              v31 = disk_new;
              goto LABEL_27;
            }
LABEL_13:
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19->fts_accpath, 4));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));
            v25 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v24, 0));

            if (v25)
            {
              v26 = archive_entry_new();
              archive_entry_set_pathname(v26, &v19->fts_path[v20]);
              v31 = disk_new;
              if (archive_read_disk_entry_from_file(disk_new, v26, -[NSObject fileDescriptor](v25, "fileDescriptor"), v19->fts_statp))
              {
                v38 = sub_100024A40();
                v37 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  sub_10002C328(&v49, v50);
              }
              else
              {
                if (!archive_write_header(v13, v26))
                {
                  st_size = v19->fts_statp->st_size;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readDataOfLength:](v25, "readDataOfLength:", st_size));
                  for (i = v28; ; v28 = i)
                  {
                    if (!objc_msgSend(v28, "length"))
                    {
                      archive_entry_free(v26);

                      goto LABEL_10;
                    }
                    v30 = objc_retainAutorelease(i);
                    if (archive_write_data(v13, objc_msgSend(v30, "bytes"), objc_msgSend(v30, "length")) == -1)
                      break;
                    i = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readDataOfLength:](v25, "readDataOfLength:", st_size));

                  }
                  v34 = sub_100024A40();
                  v35 = objc_claimAutoreleasedReturnValue(v34);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    sub_10002C2D0(&v49, v50);

                  goto LABEL_26;
                }
                v39 = sub_100024A40();
                v37 = objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  sub_10002C2FC(&v49, v50);
              }
              v8 = v46;
            }
            else
            {
              v36 = sub_100024A40();
              v37 = objc_claimAutoreleasedReturnValue(v36);
              v8 = v46;
              v31 = disk_new;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                sub_10002C2A4(&v49, v50);
              v26 = 0;
            }
            v10 = v47;

LABEL_27:
            v18 = 0;
            if (v26)
              archive_entry_free(v26);
LABEL_29:
            if (!v13)
              goto LABEL_32;
          }
          else
          {
            v31 = disk_new;
            if (!v13)
            {
LABEL_32:
              if (v31)
                archive_read_free(v31);
              if (v14)
                fts_close(v14);
LABEL_36:

              return v18;
            }
          }
        }
        else
        {
          v42 = sub_100024A40();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            sub_10002C274();

          v18 = 0;
          v31 = disk_new;
          if (!v13)
            goto LABEL_32;
        }
        if (archive_write_free(v13))
          v18 = 0;
        goto LABEL_32;
      }
    }
  }
  v44 = sub_100024A40();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    sub_10002C3B4();

  __break(1u);
  return result;
}

@end
