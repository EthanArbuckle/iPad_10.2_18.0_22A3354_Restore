@implementation LineReader

- (LineReader)initWithFile:(id)a3 andReadingWindowSize:(unint64_t)a4
{
  id v7;
  LineReader *v8;
  LineReader *v9;
  id *p_path;
  void *v11;
  uint64_t v12;
  id v13;
  NSFileHandle *handle;
  NSFileHandle *v15;
  unsigned __int8 v16;
  NSMutableArray *v17;
  NSMutableArray *lines;
  NSString *leftovers;
  LineReader *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  const char *v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;

  v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)LineReader;
  v8 = -[LineReader init](&v34, "init");
  v9 = v8;
  if (v8)
  {
    p_path = (id *)&v8->_path;
    objc_storeStrong((id *)&v8->_path, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9->_path));
    v33 = 0;
    v12 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v11, &v33));
    v13 = v33;
    handle = v9->_handle;
    v9->_handle = (NSFileHandle *)v12;

    if (v9->_handle)
    {
      v9->_window = a4;
      v9->_cursor = 0;

      v15 = v9->_handle;
      v32 = 0;
      v16 = -[NSFileHandle seekToEndReturningOffset:error:](v15, "seekToEndReturningOffset:error:", &v9->_end, &v32);
      v13 = v32;
      if ((v16 & 1) != 0)
      {
        v17 = objc_opt_new(NSMutableArray);
        lines = v9->_lines;
        v9->_lines = v17;

        leftovers = v9->_leftovers;
        v9->_leftovers = (NSString *)&stru_100008430;

        v20 = v9;
LABEL_12:

        goto LABEL_13;
      }
      v28 = sub_100002A70();
      v22 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_path, "description")));
        v29 = objc_msgSend(v23, "UTF8String");
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description")));
        v30 = objc_msgSend(v25, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v36 = v29;
        v37 = 2082;
        v38 = v30;
        v27 = "Error trying to determine end of file, file: %{public}s, error: %{public}s";
        goto LABEL_10;
      }
    }
    else
    {
      v21 = sub_100002A70();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_path, "description")));
        v24 = objc_msgSend(v23, "UTF8String");
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description")));
        v26 = objc_msgSend(v25, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v36 = v24;
        v37 = 2082;
        v38 = v26;
        v27 = "Error getting filehandle, file: %{public}s, error: %{public}s";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);

      }
    }

    v20 = 0;
    goto LABEL_12;
  }
  v20 = 0;
LABEL_13:

  return v20;
}

- (LineReader)initWithFile:(id)a3
{
  return -[LineReader initWithFile:andReadingWindowSize:](self, "initWithFile:andReadingWindowSize:", a3, 4096);
}

- (void)dealloc
{
  objc_super v3;

  -[NSFileHandle closeFile](self->_handle, "closeFile");
  v3.receiver = self;
  v3.super_class = (Class)LineReader;
  -[LineReader dealloc](&v3, "dealloc");
}

- (BOOL)_readNextChunk
{
  NSFileHandle *handle;
  unint64_t cursor;
  unsigned __int8 v5;
  id v6;
  NSFileHandle *v7;
  unint64_t window;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *lines;
  void *v16;
  NSString *leftovers;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  unint64_t v35;
  unint64_t end;
  void *v37;
  void *v38;
  NSString *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  id v50;

  handle = self->_handle;
  cursor = self->_cursor;
  v42 = 0;
  v5 = -[NSFileHandle seekToOffset:error:](handle, "seekToOffset:error:", cursor, &v42);
  v6 = v42;
  if ((v5 & 1) != 0)
  {
    v7 = self->_handle;
    window = self->_window;
    v41 = 0;
    v9 = objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataUpToLength:error:](v7, "readDataUpToLength:error:", window, &v41));
    v10 = v41;

    if (v9)
    {
      if (!-[NSObject length](v9, "length"))
      {
        v26 = 0;
        goto LABEL_17;
      }
      self->_cursor += (unint64_t)-[NSObject length](v9, "length");
      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4);
      v12 = v11;
      if (v11 && -[NSObject length](v11, "length"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject componentsSeparatedByString:](v12, "componentsSeparatedByString:", CFSTR("\n")));
        v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
        lines = self->_lines;
        self->_lines = v14;

        if (self->_leftovers)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0));

          if (v16)
          {
            leftovers = self->_leftovers;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](leftovers, "stringByAppendingString:", v18));
            -[NSMutableArray setObject:atIndexedSubscript:](self->_lines, "setObject:atIndexedSubscript:", v19, 0);

          }
          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", self->_leftovers));
            -[NSMutableArray setObject:atIndexedSubscript:](self->_lines, "setObject:atIndexedSubscript:", v18, 0);
          }

        }
        v35 = self->_cursor;
        end = self->_end;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_lines, "lastObject"));
        v38 = v37;
        if (v35 >= end)
        {
          v40 = objc_msgSend(v37, "length");

          if (v40)
          {
LABEL_24:
            v26 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          v39 = self->_leftovers;
          self->_leftovers = (NSString *)v37;

        }
        -[NSMutableArray removeLastObject](self->_lines, "removeLastObject");
        goto LABEL_24;
      }
    }
    else
    {
      v27 = sub_100002A70();
      v12 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString description](self->_path, "description")));
        v29 = objc_msgSend(v28, "UTF8String");
        v31 = self->_window;
        v30 = self->_cursor;
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
        v33 = objc_msgSend(v32, "UTF8String");
        *(_DWORD *)buf = 136446978;
        v44 = v29;
        v45 = 2048;
        v46 = v30;
        v47 = 2048;
        v48 = v31;
        v49 = 2082;
        v50 = v33;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error while reading data chunk, file: %{public}s, offset: %llu, window: %lu, error: %{public}s", buf, 0x2Au);

      }
    }
    v26 = 0;
LABEL_15:

    goto LABEL_17;
  }
  v20 = sub_100002A70();
  v9 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSString description](self->_path, "description")));
    v22 = objc_msgSend(v21, "UTF8String");
    v23 = self->_cursor;
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
    v25 = objc_msgSend(v24, "UTF8String");
    *(_DWORD *)buf = 136446722;
    v44 = v22;
    v45 = 2048;
    v46 = v23;
    v47 = 2082;
    v48 = (unint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error seeking while reading file, file: %{public}s, offset: %llu, error: %{public}s", buf, 0x20u);

  }
  v26 = 0;
  v10 = v6;
LABEL_17:

  return v26;
}

- (id)nextLine
{
  void *v3;

  while (!-[NSMutableArray count](self->_lines, "count"))
  {
    if (!-[LineReader _readNextChunk](self, "_readNextChunk"))
    {
      v3 = 0;
      return v3;
    }
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_lines, "objectAtIndexedSubscript:", 0));
  -[NSMutableArray removeObjectAtIndex:](self->_lines, "removeObjectAtIndex:", 0);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftovers, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
