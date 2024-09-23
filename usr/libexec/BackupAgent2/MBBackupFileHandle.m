@implementation MBBackupFileHandle

- (MBBackupFileHandle)initWithEngine:(id)a3 fileHandle:(id)a4 file:(id)a5
{
  MBBackupFileHandle *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MBBackupFileHandle;
  v7 = -[MBFileHandleProxy initWithFileHandle:](&v10, "initWithFileHandle:", a4);
  if (v7)
  {
    v7->_engine = (MBDriveBackupEngine *)a3;
    v7->_file = (MBFile *)a5;
    if (objc_msgSend(objc_msgSend(a5, "domain"), "shouldDigest"))
      v7->_digest = (MBDigest *)objc_alloc_init((Class)MBDigestSHA1);
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v7->_startTime = v8;
    v7->_shouldCheckForModifications = objc_msgSend(a3, "isFinalRetry") ^ 1;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBBackupFileHandle;
  -[MBFileHandleProxy dealloc](&v3, "dealloc");
}

- (BOOL)isSQLiteFile
{
  return -[MBFileHandle isSQLiteFile](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "isSQLiteFile");
}

- (BOOL)_isModifiedSince:(int64_t)a3 error:(id *)a4
{
  _BOOL4 v6;
  uint64_t v8;

  v8 = 0;
  v6 = -[MBDriveBackupEngine isModifiedSince:reason:](self->_engine, "isModifiedSince:reason:", a3, &v8);
  if (v6)
  {
    if (a4)
      *a4 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 9, CFSTR("File modified while being uploaded"));
    -[MBDriveBackupEngine fileModifiedWhileUploadingFile:reason:](self->_engine, "fileModifiedWhileUploadingFile:reason:", self->_file, v8);
  }
  return v6;
}

- (BOOL)recordMetadataWithSHA256Data:(id)a3 error:(id *)a4
{
  NSDictionary *v7;
  MBFile *file;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  NSString *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  MBDomain *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  MBDomain *v23;
  NSString *v24;
  NSString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[9];
  uint8_t buf[4];
  MBDomain *v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  NSString *v40;

  memset(v32, 0, sizeof(v32));
  LODWORD(v7) = -[MBFileHandle statWithBuffer:error:](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "statWithBuffer:error:", v32, a4);
  if ((_DWORD)v7)
  {
    v31 = 0;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    LODWORD(v7) = sub_10007F028((uint64_t)v32, (uint64_t)&v27, a4);
    if ((_DWORD)v7)
    {
      -[MBFile setNode:](self->_file, "setNode:", &v27);
      if (self->_shouldCheckForModifications
        && -[MBBackupFileHandle _isModifiedSince:error:](self, "_isModifiedSince:error:", *((_QWORD *)&v28 + 1), a4))
      {
        goto LABEL_20;
      }
      if (-[MBDomain shouldDigest](-[MBFile domain](self->_file, "domain"), "shouldDigest"))
      {
        if (a3)
        {
          file = self->_file;
          v9 = a3;
        }
        else
        {
          v9 = -[MBDigest final](self->_digest, "final");
          file = self->_file;
        }
        -[MBFile setDigest:](file, "setDigest:", v9);
      }
      -[MBFile setProtectionClass:](self->_file, "setProtectionClass:", +[MBProtectionClassUtils getWithFD:error:](MBProtectionClassUtils, "getWithFD:error:", -[MBFileHandle fd](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "fd"), a4));
      if (-[MBFile protectionClass](self->_file, "protectionClass") == 255)
      {
LABEL_20:
        LOBYTE(v7) = 0;
      }
      else
      {
        -[MBFile setExtendedAttributes:](self->_file, "setExtendedAttributes:", +[MBExtendedAttributes attributesForFD:error:](MBExtendedAttributes, "attributesForFD:error:", -[MBFileHandle fd](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "fd"), a4));
        v7 = -[MBFile extendedAttributes](self->_file, "extendedAttributes");
        if (v7)
        {
          v10 = +[MBExtendedAttributes sizeOfAttributes:](MBExtendedAttributes, "sizeOfAttributes:", -[MBFile extendedAttributes](self->_file, "extendedAttributes"));
          if (v10 >= 0x801)
          {
            v12 = v10;
            v13 = MBGetDefaultLog(v10, v11);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = -[MBFile absolutePath](self->_file, "absolutePath");
              *(_DWORD *)buf = 134218498;
              v34 = (MBDomain *)v12;
              v35 = 1024;
              *(_DWORD *)v36 = 2048;
              *(_WORD *)&v36[4] = 2112;
              *(_QWORD *)&v36[6] = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Extended attributes size greater than supported (%lu > %d): %@", buf, 0x1Cu);
              _MBLog(CFSTR("DEFAULT"), "Extended attributes size greater than supported (%lu > %d): %@", v12, 2048, -[MBFile absolutePath](self->_file, "absolutePath"));
            }
            -[MBFile setExtendedAttributes:](self->_file, "setExtendedAttributes:", &__NSDictionary0__struct);
          }
          if (sub_100081D30())
          {
            v15 = sub_10007EEC8((uint64_t)&v27);
            v16 = v15;
            v18 = MBGetDefaultLog(v15, v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = -[MBFile domain](self->_file, "domain");
              v20 = -[MBFile relativePath](self->_file, "relativePath");
              v21 = sub_10007EF68((unsigned __int16 *)&v27);
              v22 = -[MBManifestDB path](-[MBDriveBackupEngine snapshotManifestDB](self->_engine, "snapshotManifestDB"), "path");
              *(_DWORD *)buf = 138413314;
              v34 = v19;
              v35 = 2112;
              *(_QWORD *)v36 = v20;
              *(_WORD *)&v36[8] = 2112;
              *(_QWORD *)&v36[10] = v21;
              v37 = 1024;
              v38 = v16;
              v39 = 2112;
              v40 = v22;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding file %@:%@ with mbNode %@ (dataless:%d) to manifest at %@", buf, 0x30u);
              v23 = -[MBFile domain](self->_file, "domain");
              v24 = -[MBFile relativePath](self->_file, "relativePath");
              v25 = sub_10007EF68((unsigned __int16 *)&v27);
              _MBLog(CFSTR("DEFAULT"), "Adding file %@:%@ with mbNode %@ (dataless:%d) to manifest at %@", v23, v24, v25, v16, -[MBManifestDB path](-[MBDriveBackupEngine snapshotManifestDB](self->_engine, "snapshotManifestDB"), "path"));
            }
          }
          -[MBManifestDB addFile:flags:](-[MBDriveBackupEngine snapshotManifestDB](self->_engine, "snapshotManifestDB"), "addFile:flags:", self->_file, 0);
          LOBYTE(v7) = 1;
        }
      }
    }
  }
  return (char)v7;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  double v16;
  double startTime;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSString *v21;
  MBFile *file;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  MBFile *v27;
  NSString *v28;
  uint8_t buf[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  if (!sub_10006B950(-[MBFileHandle fd](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "fd")))
  {
    v9 = -[MBFileHandle readWithBytes:length:error:](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "readWithBytes:length:error:", a3, a4, a5);
    if (v9)
    {
      v10 = v9;
      if (v9 >= 1)
      {
        -[MBDigest updateWithBytes:length:](self->_digest, "updateWithBytes:length:", a3, v9);
        v11 = self->_bytesReadSinceLastModificationCheck + v10;
        self->_bytesReadSinceLastModificationCheck = v11;
        if (!self->_shouldCheckForModifications)
          return v10;
        if (v11 < 0x100000)
          return v10;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v31 = 0u;
        memset(buf, 0, sizeof(buf));
        if (-[MBFileHandle statWithBuffer:error:](-[MBFileHandleProxy fileHandle](self, "fileHandle"), "statWithBuffer:error:", buf, a5))
        {
          if (!-[MBBackupFileHandle _isModifiedSince:error:](self, "_isModifiedSince:error:", (_QWORD)v32, a5))
            return v10;
        }
      }
      return -1;
    }
  }
  v12 = -[MBBackupFileHandle recordMetadataWithSHA256Data:error:](self, "recordMetadataWithSHA256Data:error:", 0, a5);
  if (!v12)
    return -1;
  v14 = MBGetDefaultLog(v12, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v16 = v15;
    startTime = self->_startTime;
    v18 = -[MBFile size](self->_file, "size");
    v20 = MBGetDefaultLog(v18, v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = -[MBFile snapshotPath](self->_file, "snapshotPath");
      file = self->_file;
      if (v21)
        v23 = -[MBFile snapshotPath](file, "snapshotPath");
      else
        v23 = -[MBFile absolutePath](file, "absolutePath");
      v24 = v23;
      v25 = -[MBFileID string](-[MBFile fileID](self->_file, "fileID"), "string");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v18;
      LOWORD(v31) = 2048;
      *(_QWORD *)((char *)&v31 + 2) = (unint64_t)((double)v18 / (v16 - startTime));
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Uploaded: %@ for %@ (%{bytes}llu at %{bytes}llu/s)", buf, 0x2Au);
      v26 = -[MBFile snapshotPath](self->_file, "snapshotPath");
      v27 = self->_file;
      if (v26)
        v28 = -[MBFile snapshotPath](v27, "snapshotPath");
      else
        v28 = -[MBFile absolutePath](v27, "absolutePath");
      _MBLog(CFSTR("DEBUG"), "Uploaded: %@ for %@ (%{bytes}llu at %{bytes}llu/s)", v28, -[MBFileID string](-[MBFile fileID](self->_file, "fileID"), "string"), v18, (unint64_t)((double)v18 / (v16 - startTime)));
    }
  }
  return 0;
}

@end
