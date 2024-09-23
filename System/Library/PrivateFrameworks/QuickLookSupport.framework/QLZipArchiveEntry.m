@implementation QLZipArchiveEntry

- (NSURL)url
{
  const __int32 *v2;
  void *v3;
  void *v4;

  v2 = (const __int32 *)archive_entry_pathname_w();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v2, 4 * wcslen(v2), 2617245952);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (id)readDataWithError:(id *)a3
{
  NSData *data;
  NSError *error;
  NSError **p_error;
  id WeakRetained;
  archive_entry *entry;
  NSData *v11;
  id v12;
  NSData *v13;
  id v14;
  NSObject *v15;
  NSData *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  data = self->_data;
  if (data)
    return data;
  p_error = &self->_error;
  error = self->_error;
  if (a3 && error)
  {
    *a3 = objc_retainAutorelease(error);
    return 0;
  }
  else
  {
    self->_error = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_archive);
    entry = self->_entry;
    v17 = 0;
    objc_msgSend(WeakRetained, "readCurrentDataWithEntry:error:", entry, &v17);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v13 = self->_data;
    self->_data = v11;

    if (!a3 || self->_data)
    {
      if (v12)
      {
        v15 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          v15 = _qlsLogHandle;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v12;
          _os_log_impl(&dword_20D4C7000, v15, OS_LOG_TYPE_ERROR, "Error while attempting to read data: %@ #ZIPHandling", buf, 0xCu);
        }
      }
    }
    else
    {
      v14 = objc_retainAutorelease(v12);
      *a3 = v14;
      objc_storeStrong((id *)p_error, v14);
    }
    v16 = self->_data;

    return v16;
  }
}

- (archive_entry)entry
{
  return self->_entry;
}

- (void)setEntry:(archive_entry *)a3
{
  self->_entry = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (QLZipArchive)archive
{
  return (QLZipArchive *)objc_loadWeakRetained((id *)&self->_archive);
}

- (void)setArchive:(id)a3
{
  objc_storeWeak((id *)&self->_archive, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_archive);
}

@end
