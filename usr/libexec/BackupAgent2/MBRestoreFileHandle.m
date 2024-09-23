@implementation MBRestoreFileHandle

- (MBRestoreFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5
{
  MBRestoreFileHandle *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MBRestoreFileHandle;
  v7 = -[MBFileHandleProxy initWithFileHandle:](&v10, "initWithFileHandle:", a4);
  if (v7)
  {
    v7->_engine = (MBDriveRestoreEngine *)a3;
    v7->_file = (MBFile *)a5;
    if (objc_msgSend(objc_msgSend(a5, "domain"), "shouldDigest")
      && objc_msgSend(a3, "shouldVerifyDigests"))
    {
      v7->_digest = (MBDigest *)objc_alloc_init((Class)MBDigestSHA1);
    }
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v7->_startTime = v8;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBRestoreFileHandle;
  -[MBFileHandleProxy dealloc](&v3, "dealloc");
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t v7;

  v7 = -[MBFileHandle writeWithBytes:length:error:](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "writeWithBytes:length:error:", a3, a4, a5);
  if (v7 >= 1)
    -[MBDigest updateWithBytes:length:](self->_digest, "updateWithBytes:length:", a3, v7);
  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  NSString *v18;
  MBFileID *v19;
  NSData *v20;
  NSString *v21;
  MBFileID *v22;
  double v23;
  double v24;
  double startTime;
  unint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  NSString *v31;
  uint8_t buf[4];
  NSString *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  MBFileID *v40;

  v5 = -[MBDigest final](self->_digest, "final");
  if (v5)
  {
    v7 = v5;
    if (-[MBFile digest](self->_file, "digest"))
    {
      v9 = objc_msgSend(v7, "isEqualToData:", -[MBFile digest](self->_file, "digest"));
      v10 = (char)v9;
      v12 = MBGetDefaultLog(v9, v11);
      v13 = v12;
      if ((v10 & 1) != 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v14 = -[MBFile absolutePath](self->_file, "absolutePath");
          *(_DWORD *)buf = 138412290;
          v34 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Digest matches: %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "Digest matches: %@", -[MBFile absolutePath](self->_file, "absolutePath"));
        }
        goto LABEL_14;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = -[MBFile digest](self->_file, "digest");
        v21 = -[MBFile absolutePath](self->_file, "absolutePath");
        v22 = -[MBFile fileID](self->_file, "fileID");
        *(_DWORD *)buf = 138413058;
        v34 = (NSString *)v7;
        v35 = 2112;
        v36 = (unint64_t)v20;
        v37 = 2112;
        v38 = (unint64_t)v21;
        v39 = 2112;
        v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "File digest does not match manifest (%@ vs %@): %@ (%@)", buf, 0x2Au);
        _MBLog(CFSTR("ERROR"), "File digest does not match manifest (%@ vs %@): %@ (%@)", v7, -[MBFile digest](self->_file, "digest"), -[MBFile absolutePath](self->_file, "absolutePath"), -[MBFile fileID](self->_file, "fileID"));
      }
    }
    else
    {
      v17 = MBGetDefaultLog(0, v8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = -[MBFile absolutePath](self->_file, "absolutePath");
        v19 = -[MBFile fileID](self->_file, "fileID");
        *(_DWORD *)buf = 138412546;
        v34 = v18;
        v35 = 2112;
        v36 = (unint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Digest missing from file: %@ (%@)", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Digest missing from file: %@ (%@)", -[MBFile absolutePath](self->_file, "absolutePath"), -[MBFile fileID](self->_file, "fileID"));
      }
    }
    -[MBDriveRestoreEngine digestDidNotMatchForFile:](self->_engine, "digestDidNotMatchForFile:", self->_file);
    goto LABEL_14;
  }
  v15 = MBGetDefaultLog(0, v6);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = -[MBFile absolutePath](self->_file, "absolutePath");
    *(_DWORD *)buf = 138412290;
    v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Not digested: %@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), "Not digested: %@", -[MBFile absolutePath](self->_file, "absolutePath"));
  }
LABEL_14:
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v24 = v23;
  startTime = self->_startTime;
  v26 = -[MBFile size](self->_file, "size");
  v27 = -[MBFile absolutePath](self->_file, "absolutePath");
  if (v27)
  {
    v29 = MBGetDefaultLog(v27, v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = v24 - startTime;
      v31 = -[MBFile absolutePath](self->_file, "absolutePath");
      *(_DWORD *)buf = 138412802;
      v34 = v31;
      v35 = 2048;
      v36 = v26;
      v37 = 2048;
      v38 = (unint64_t)((double)v26 / v30);
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Downloaded: %@ (%{bytes}llu at %{bytes}llu/s)", buf, 0x20u);
      _MBLog(CFSTR("INFO"), "Downloaded: %@ (%{bytes}llu at %{bytes}llu/s)", -[MBFile absolutePath](self->_file, "absolutePath"), v26, (unint64_t)((double)v26 / v30));
    }
  }
  return -[MBFileHandle closeWithError:](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "closeWithError:", a3);
}

@end
