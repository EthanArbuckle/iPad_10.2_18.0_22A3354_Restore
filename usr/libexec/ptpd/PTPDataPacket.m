@implementation PTPDataPacket

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andData:(id)a5
{
  id v9;
  PTPDataPacket *v10;
  PTPDataPacket *v11;
  id v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PTPDataPacket;
  v10 = -[PTPDataPacket init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong(&v10->_data, a5);
    v12 = objc_msgSend(v11->_data, "length");
    v11->_bufferSize = (int64_t)v12;
    v11->_offsetInBuffer = 0;
    v11->_range.location = 0;
    v11->_range.length = (unint64_t)v12;
  }

  return v11;
}

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andDataSource:(id)a5
{
  id v9;
  PTPDataPacket *v10;
  PTPDataPacket *v11;
  id v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PTPDataPacket;
  v10 = -[PTPDataPacket init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong(&v10->_dataSource, a5);
    v12 = objc_msgSend(v11->_dataSource, "length");
    v11->_bufferSize = (int64_t)v12;
    v11->_offsetInBuffer = 0;
    v11->_range.location = 0;
    v11->_range.length = (unint64_t)v12;
  }

  return v11;
}

- (PTPDataPacket)initWithOperationCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 andFilepath:(id)a5
{
  id v9;
  PTPDataPacket *v10;
  PTPDataPacket *v11;
  int *v12;
  int fd;
  off_t v14;
  off_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  id v23;
  int v24;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;

  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PTPDataPacket;
  v10 = -[PTPDataPacket init](&v26, "init");
  v11 = v10;
  if (v10)
  {
    v10->_operationCode = a3;
    v10->_transactionID = a4;
    objc_storeStrong((id *)&v10->_filepath, a5);
    v11->_fd = open(-[NSString fileSystemRepresentation](v11->_filepath, "fileSystemRepresentation"), 0, 0);
    v12 = __error();
    fd = v11->_fd;
    if (fd < 1)
    {
      v16 = *v12;
      __ICOSLogCreate();
      v17 = CFSTR("PTPDataPacket");
      if ((unint64_t)objc_msgSend(CFSTR("PTPDataPacket"), "length") >= 0x15)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPDataPacket"), "substringWithRange:", 0, 18));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("..")));

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to open file %s with error %d\n"), -[NSString fileSystemRepresentation](v11->_filepath, "fileSystemRepresentation"), v16));
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_retainAutorelease(v17);
        v22 = v20;
        v23 = -[__CFString UTF8String](v21, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v28 = v23;
        v29 = 2114;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    else
    {
      v14 = lseek(fd, 0, 2);
      v11->_bufferSize = v14;
      if (v14 != -1)
      {
        v11->_range.length = v14;
        v15 = lseek(v11->_fd, 0, 0);
        v11->_offsetInBuffer = v15;
        if (v15 != -1)
        {
          v11->_range.location = v15;
          goto LABEL_14;
        }
      }
    }
    v24 = v11->_fd;
    if (v24 >= 1)
      close(v24);

    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (PTPDataPacket)initWithUSBBuffer:(void *)a3
{
  unint64_t v3;
  PTPDataPacket *v5;
  PTPDataPacket *v7;
  id v8;
  id v9;
  id data;
  char *v12;
  objc_super v13;

  v3 = (*(_DWORD *)a3 - 12);
  if (*(_DWORD *)a3 >= 0xCu && *((_WORD *)a3 + 2) == 2)
  {
    v13.receiver = self;
    v13.super_class = (Class)PTPDataPacket;
    v7 = -[PTPDataPacket init](&v13, "init");
    if (v7)
    {
      v12 = (char *)a3 + 6;
      v7->_operationCode = sub_100020558(&v12);
      v7->_transactionID = sub_1000205D4(&v12);
      v8 = objc_alloc((Class)NSMutableData);
      v9 = objc_msgSend(v8, "initWithBytes:length:", v12, v3);
      data = v7->_data;
      v7->_data = v9;

      v7->_bufferSize = v3;
      v7->_offsetInBuffer = 0;
      v7->_range.location = 0;
      v7->_range.length = v3;
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  int fd;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  fd = self->_fd;
  if (fd >= 1)
    close(fd);
  if (-[PTPDataPacket unlinkWhenDone](self, "unlinkWhenDone"))
  {
    __ICOSLogCreate();
    v4 = CFSTR("ptpDataPacket");
    if ((unint64_t)objc_msgSend(CFSTR("ptpDataPacket"), "length") >= 0x15)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ptpDataPacket"), "substringWithRange:", 0, 18));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDataPacket filepath](self, "filepath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unlinking file on completion: %@"), v6));

    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v4);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v14 = -[__CFString UTF8String](v9, "UTF8String");
      v15 = 2114;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[PTPDataPacket filepath](self, "filepath")));
    unlink((const char *)objc_msgSend(v11, "fileSystemRepresentation"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PTPDataPacket;
  -[PTPDataPacket dealloc](&v12, "dealloc");
}

- (id)contentForUSB
{
  unint64_t v3;
  void *v4;
  id data;
  id dataSource;
  ssize_t v7;
  int v8;
  void *__buf;

  v3 = self->_range.length + 12;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", v3));
  __buf = (char *)objc_msgSend(v4, "mutableBytes") + 4;
  sub_100020540((_WORD **)&__buf, 2);
  sub_100020540((_WORD **)&__buf, self->_operationCode);
  sub_1000205BC((_DWORD **)&__buf, self->_transactionID);
  if (!self->_range.length)
    goto LABEL_11;
  data = self->_data;
  if (data)
  {
    memcpy(__buf, (char *)objc_msgSend(data, "bytes") + self->_range.location, self->_range.length);
    v3 += self->_range.length;
    goto LABEL_11;
  }
  dataSource = self->_dataSource;
  if (self->_fd <= 0)
  {
    if (!dataSource)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (dataSource)
  {
LABEL_8:
    v7 = (ssize_t)objc_msgSend(dataSource, "read:length:offset:", __buf);
    goto LABEL_9;
  }
  v7 = pread(self->_fd, __buf, self->_range.length, self->_range.location);
LABEL_9:
  if (v7 == -1)
  {
    sub_100021C68();

    return 0;
  }
  v3 += v7;
LABEL_11:
  __buf = objc_msgSend(v4, "mutableBytes");
  if (HIDWORD(v3))
    v8 = -2;
  else
    v8 = v3;
  sub_1000205BC((_DWORD **)&__buf, v8);
  objc_msgSend(v4, "setLength:", v3);
  return v4;
}

- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4
{
  id data;
  id length;
  id dataSource;
  uint64_t v11;
  int v12;
  void *v13;
  void *__buf;

  if (self->_range.length + 12 > a4)
    return 0;
  __buf = (char *)a3 + 4;
  sub_100020540((_WORD **)&__buf, 2);
  sub_100020540((_WORD **)&__buf, self->_operationCode);
  sub_1000205BC((_DWORD **)&__buf, self->_transactionID);
  if (!self->_range.length)
    goto LABEL_14;
  data = self->_data;
  if (data)
  {
    memcpy(__buf, (char *)objc_msgSend(data, "bytes") + self->_range.location, self->_range.length);
    length = (id)self->_range.length;
    goto LABEL_12;
  }
  dataSource = self->_dataSource;
  if (self->_fd <= 0)
  {
    if (dataSource)
      goto LABEL_10;
LABEL_14:
    __buf = a3;
    v11 = 12;
    goto LABEL_15;
  }
  if (!dataSource)
  {
    length = (id)pread(self->_fd, __buf, self->_range.length, self->_range.location);
    goto LABEL_11;
  }
LABEL_10:
  length = objc_msgSend(dataSource, "read:length:offset:", __buf);
LABEL_11:
  if (length == (id)-1)
  {
    sub_100021C68();
    return 0;
  }
LABEL_12:
  v11 = (uint64_t)length + 12;
  __buf = a3;
  if (!(((unint64_t)length + 12) >> 32))
  {
LABEL_15:
    v12 = v11;
    goto LABEL_16;
  }
  v12 = -2;
LABEL_16:
  sub_1000205BC((_DWORD **)&__buf, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PTPWrappedBytes wrappedBytesWithBytes:capacity:](PTPWrappedBytes, "wrappedBytesWithBytes:capacity:", a3, a4));
  objc_msgSend(v13, "setLength:", v11);
  return v13;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;

  v3 = sub_1000209EC(self->_operationCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<PTPDataPacket %p>{\n  _operationCode:  %@\n  _transactionID:  %lu\n  _data:           <%lu bytes>\n  _filepath:       %@\n  _bufferSize:     %llu\n  _offsetInBuffer: %llu\n  _range.location: %llu\n  _range.length:   %llu\n}"), self, v4, self->_transactionID, objc_msgSend(self->_data, "length"), self->_filepath, self->_bufferSize, self->_offsetInBuffer, self->_range.location, self->_range.length));

  return v5;
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (self->_data != v5)
  {
    v7 = v5;
    objc_storeStrong(&self->_data, a3);
    self->_offsetInBuffer = 0;
    v6 = objc_msgSend(self->_data, "length");
    v5 = v7;
    self->_bufferSize = (int64_t)v6;
    self->_range.location = self->_offsetInBuffer;
    self->_range.length = (unint64_t)v6;
  }

}

- (_PTPRange)range
{
  unint64_t length;
  unint64_t location;
  _PTPRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int)setRange:(_PTPRange)a3
{
  unint64_t bufferSize;
  int result;
  unint64_t length;

  bufferSize = self->_bufferSize;
  if (bufferSize < a3.location)
    return -1;
  if (!a3.length)
    return -2;
  result = 0;
  if (a3.location + a3.length <= bufferSize)
    length = a3.length;
  else
    length = bufferSize - a3.location;
  self->_range.location = a3.location;
  self->_range.length = length;
  self->_offsetInBuffer = a3.location;
  return result;
}

- (int64_t)copyToBuffer:(void *)a3 numBytes:(int64_t)a4
{
  unint64_t length;
  off_t offsetInBuffer;
  int64_t v7;
  id data;
  int fd;
  id dataSource;
  id v11;

  if (a4 < 1)
    return 0;
  length = self->_range.length;
  offsetInBuffer = self->_offsetInBuffer;
  if ((uint64_t)(length + self->_range.location - offsetInBuffer) >= a4)
    v7 = a4;
  else
    v7 = length + self->_range.location - offsetInBuffer;
  if (v7)
  {
    data = self->_data;
    if (data)
    {
      memcpy(a3, (char *)objc_msgSend(data, "bytes") + self->_offsetInBuffer, v7);
LABEL_14:
      self->_offsetInBuffer += v7;
      return v7;
    }
    fd = self->_fd;
    dataSource = self->_dataSource;
    if (fd <= 0)
    {
      if (!dataSource)
        return 0;
    }
    else if (!dataSource)
    {
      v11 = (id)pread(fd, a3, v7, offsetInBuffer);
LABEL_13:
      v7 = (int64_t)v11;
      if (v11 != (id)-1)
        goto LABEL_14;
      sub_100021C68();
      return 0;
    }
    v11 = objc_msgSend(self->_dataSource, "read:length:offset:", a3, v7);
    goto LABEL_13;
  }
  return v7;
}

- (int64_t)copyToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4
{
  int v4;
  id v6;
  char *v7;
  _WORD *v8;
  _WORD *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t length;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  PTPDataPacket *v24;
  char *v25;
  _DWORD *v27;
  _WORD *v28;

  v4 = a4;
  v6 = a3;
  v7 = (char *)objc_msgSend(v6, "capacity");
  v8 = objc_msgSend(v6, "mutableBytes");
  v28 = v8;
  if ((unint64_t)v7 < 0xC)
    goto LABEL_31;
  v9 = v8;
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      v10 = v7 - 12;
      if (v7 == (char *)12)
      {
        sub_1000205BC((_DWORD **)&v28, 12);
        sub_1000205BC((_DWORD **)&v28, 10);
        goto LABEL_8;
      }
      v18 = self->_range.location - self->_offsetInBuffer;
      if (!v18)
      {
        length = self->_range.length;
        v20 = length - 4294967284u;
        v21 = length + 12;
        if (v20 < 0xFFFFFFFF00000000)
          v22 = -1;
        else
          v22 = v21;
        sub_1000205BC((_DWORD **)&v28, v22);
        v27 = v28;
        sub_1000205BC((_DWORD **)&v28, 10);
        sub_1000205BC((_DWORD **)&v28, self->_transactionID);
        v10 = -[PTPDataPacket copyToBuffer:numBytes:](self, "copyToBuffer:numBytes:", v28, v7 - 12, v27);
        if (v10 < v7 || self->_range.length + self->_range.location == self->_offsetInBuffer)
          sub_1000205BC(&v27, 12);
        goto LABEL_24;
      }
      v23 = v18 + self->_range.length;
      if (v23 > (unint64_t)v10)
      {
        if (v23 <= (unint64_t)v7)
        {
          v25 = v7 - 1;
          v24 = self;
          goto LABEL_28;
        }
LABEL_27:
        v24 = self;
        v25 = v7;
LABEL_28:
        v10 = -[PTPDataPacket copyToBuffer:numBytes:](v24, "copyToBuffer:numBytes:", v9, v25);
        v11 = v6;
        v12 = (uint64_t)v10;
        goto LABEL_29;
      }
      sub_1000205BC((_DWORD **)&v28, 12);
      sub_1000205BC((_DWORD **)&v28, 12);
      sub_1000205BC((_DWORD **)&v28, self->_transactionID);
    }
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  v10 = v7 - 12;
  if (v7 != (char *)12)
  {
    if (self->_offsetInBuffer == self->_range.location)
    {
      v13 = self->_range.length;
      v14 = v13 - 4294967284u;
      v15 = v13 + 12;
      if (v4 == 1)
        v16 = -2;
      else
        v16 = -1;
      if (v14 >= 0xFFFFFFFF00000000)
        v17 = v15;
      else
        v17 = v16;
      sub_1000205BC((_DWORD **)&v28, v17);
      sub_100020540(&v28, 2);
      sub_100020540(&v28, self->_operationCode);
      sub_1000205BC((_DWORD **)&v28, self->_transactionID);
      v10 = -[PTPDataPacket copyToBuffer:numBytes:](self, "copyToBuffer:numBytes:", v28, v7 - 12);
LABEL_24:
      v12 = ((_DWORD)v10 + 12);
      v11 = v6;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  sub_1000205BC((_DWORD **)&v28, 12);
  sub_100020540(&v28, 2);
  sub_100020540(&v28, self->_operationCode);
LABEL_8:
  sub_1000205BC((_DWORD **)&v28, self->_transactionID);
  v11 = v6;
  v12 = 12;
LABEL_29:
  objc_msgSend(v11, "setLength:", v12);
LABEL_32:

  return (int64_t)v10;
}

- (int64_t)copyDataToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4 fromOffset:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  int64_t v10;

  v7 = a3;
  v8 = objc_msgSend(v7, "capacity");
  v9 = objc_msgSend(v7, "mutableBytes");
  self->_offsetInBuffer = a5;
  v10 = -[PTPDataPacket copyToBuffer:numBytes:](self, "copyToBuffer:numBytes:", v9, v8);
  objc_msgSend(v7, "setLength:", v10);

  return v10;
}

- (int64_t)copyHeaderToWrappedBytes:(id)a3 forTransport:(unsigned __int16)a4
{
  int v4;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int64_t v17;
  _WORD *v19;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "capacity");
  v19 = objc_msgSend(v6, "mutableBytes");
  if ((unint64_t)v7 < 0xC)
    goto LABEL_16;
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      v13 = self->_range.length + self->_range.location - self->_offsetInBuffer;
      v14 = v13 - 4294967284u;
      v15 = v13 + 12;
      if (v14 < 0xFFFFFFFF00000000)
        v16 = -1;
      else
        v16 = v15;
      sub_1000205BC((_DWORD **)&v19, v16);
      sub_1000205BC((_DWORD **)&v19, 10);
      goto LABEL_15;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v8 = self->_range.length + self->_range.location - self->_offsetInBuffer;
  v9 = v8 - 4294967284u;
  v10 = v8 + 12;
  if (v4 == 1)
    v11 = -2;
  else
    v11 = -1;
  if (v9 >= 0xFFFFFFFF00000000)
    v12 = v10;
  else
    v12 = v11;
  sub_1000205BC((_DWORD **)&v19, v12);
  sub_100020540(&v19, 2);
  sub_100020540(&v19, self->_operationCode);
LABEL_15:
  sub_1000205BC((_DWORD **)&v19, self->_transactionID);
  v17 = 12;
  objc_msgSend(v6, "setLength:", 12);
LABEL_17:

  return v17;
}

- (int64_t)copyFromBuffer:(void *)a3 numBytes:(int64_t)a4
{
  int64_t v4;
  off_t offsetInBuffer;
  uint64_t v8;
  id data;
  id v10;
  id v11;
  id v12;
  unint64_t bufferSize;
  ssize_t v14;

  if (a4 < 1)
    return 0;
  v4 = a4;
  offsetInBuffer = self->_offsetInBuffer;
  v8 = offsetInBuffer - self->_bufferSize + v4;
  data = self->_data;
  if (!data)
  {
    if (v8 >= 1)
      self->_bufferSize = offsetInBuffer + v4;
    v14 = pwrite(self->_fd, a3, v4, offsetInBuffer);
    if (v14 != -1)
    {
      v4 = v14;
      self->_offsetInBuffer += v14;
      if (!v14)
        return v4;
      goto LABEL_8;
    }
    sub_100021C68();
    return 0;
  }
  if (objc_msgSend(data, "isMemberOfClass:", objc_opt_class(NSData)))
  {
    v10 = self->_data;
    v11 = objc_msgSend(v10, "mutableCopy");
    v12 = self->_data;
    self->_data = v11;

  }
  if (v8 >= 1)
  {
    objc_msgSend(self->_data, "increaseLengthBy:", v8);
    self->_bufferSize += v8;
  }
  memcpy((char *)objc_msgSend(self->_data, "mutableBytes") + self->_offsetInBuffer, a3, v4);
  self->_offsetInBuffer += v4;
LABEL_8:
  bufferSize = self->_bufferSize;
  self->_range.location = 0;
  self->_range.length = bufferSize;
  return v4;
}

- (unsigned)operationCode
{
  return self->_operationCode;
}

- (void)setOperationCode:(unsigned __int16)a3
{
  self->_operationCode = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (int64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->_bufferSize = a3;
}

- (int64_t)offsetInBuffer
{
  return self->_offsetInBuffer;
}

- (void)setOffsetInBuffer:(int64_t)a3
{
  self->_offsetInBuffer = a3;
}

- (int64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(int64_t)a3
{
  self->_bytesTransferred = a3;
}

- (NSString)filepath
{
  return self->_filepath;
}

- (void)setFilepath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)unlinkWhenDone
{
  return self->_unlinkWhenDone;
}

- (void)setUnlinkWhenDone:(BOOL)a3
{
  self->_unlinkWhenDone = a3;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong(&self->_dataSource, a3);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong(&self->_data, 0);
}

@end
