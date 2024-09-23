@implementation CoreFileHandlerV1

- (CoreFileHandlerV1)initWithCoreFilePath:(char *)a3 :(BOOL)a4 :(id)a5
{
  CoreFileHandlerV1 *v5;
  NSObject *v6;
  uint64_t num_files;
  int v9;
  uint64_t v10;

  v5 = -[CoreFileHandler initWithCoreFilePath::::::](self, "initWithCoreFilePath::::::", a3, a4, a5, 0x63614D20646152, &self->_corefileHeader, 544);
  if (v5)
  {
    v6 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
    {
      num_files = v5->_corefileHeader.num_files;
      v9 = 134217984;
      v10 = num_files;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "opened corefile, header indicates %llu files present", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

- (id)getCorefileZeroRanges
{
  void *v3;
  uint64_t num_files;
  uint64_t v5;
  uint64_t log_offset;
  uint64_t log_length;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
  num_files = self->_corefileHeader.num_files;
  if (num_files)
  {
    v5 = *(&self->_corefileHeader.log_offset + 4 * num_files) + *(&self->_corefileHeader.signature + 4 * num_files);
  }
  else
  {
    log_offset = self->_corefileHeader.log_offset;
    if (log_offset)
    {
      log_length = self->_corefileHeader.log_length;
      v8 = log_length + log_offset;
      if (log_length)
        v5 = v8;
      else
        v5 = 544;
    }
    else
    {
      v5 = 544;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v10, 0));
  objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (unint64_t)getNumCoreDumps
{
  return self->_corefileHeader.num_files;
}

- (const)getCoreDumpNameWithIndex:(unint64_t)a3
{
  const char *result;
  uint64_t v4;

  if (self->_corefileHeader.num_files > a3)
    return self->_corefileHeader.files[a3].core_name;
  v4 = _os_assert_log(0);
  result = (const char *)_os_crash(v4);
  __break(1u);
  return result;
}

- (void)getCoreDumpInfoWithIndex:(unint64_t)a3 :(unint64_t *)a4 :(unint64_t *)a5 :(unsigned int *)a6
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_corefileHeader.num_files <= a3)
  {
    v7 = _os_assert_log(0);
    _os_crash(v7);
    __break(1u);
    goto LABEL_7;
  }
  if (!a4)
  {
LABEL_7:
    v8 = _os_assert_log(0);
    _os_crash(v8);
    __break(1u);
    goto LABEL_8;
  }
  if (!a5)
  {
LABEL_8:
    v9 = _os_assert_log(0);
    _os_crash(v9);
    __break(1u);
    goto LABEL_9;
  }
  if (a6)
  {
    v6 = (char *)&self->_corefileHeader + 32 * a3;
    *a4 = *((_QWORD *)v6 + 4);
    *a5 = *((_QWORD *)v6 + 5);
    *a6 = 1;
    return;
  }
LABEL_9:
  v10 = _os_assert_log(0);
  _os_crash(v10);
  __break(1u);
}

- (BOOL)getCorefileLogInfo:(unint64_t *)a3 :(unint64_t *)a4 :(unsigned int *)a5
{
  uint64_t log_length;
  BOOL result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a3)
  {
    v7 = _os_assert_log(0);
    _os_crash(v7);
    __break(1u);
    goto LABEL_8;
  }
  if (!a4)
  {
LABEL_8:
    v8 = _os_assert_log(0);
    _os_crash(v8);
    __break(1u);
    goto LABEL_9;
  }
  if (!a5)
  {
LABEL_9:
    v9 = _os_assert_log(0);
    result = _os_crash(v9);
    __break(1u);
    return result;
  }
  *a4 = self->_corefileHeader.log_length;
  log_length = self->_corefileHeader.log_length;
  if (log_length)
  {
    *a3 = self->_corefileHeader.log_offset;
    *a5 = 0;
  }
  return log_length != 0;
}

@end
