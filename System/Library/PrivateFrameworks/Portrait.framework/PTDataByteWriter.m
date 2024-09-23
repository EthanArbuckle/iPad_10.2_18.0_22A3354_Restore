@implementation PTDataByteWriter

- (PTDataByteWriter)initWithMutableData:(id)a3
{
  id v5;
  PTDataByteWriter *v6;
  PTDataByteWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDataByteWriter;
  v6 = -[PTDataByteWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (BOOL)appendBytes:(const void *)a3 size:(unint64_t)a4
{
  void *v7;
  BOOL v8;
  NSUInteger v9;
  void *v10;
  void *v11;

  -[PTDataByteWriter error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 0;
  v9 = -[NSMutableData length](self->_data, "length");
  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", a3, a4);
  if (-[NSMutableData length](self->_data, "length") != v9 + a4)
  {
    -[PTDataByteWriter _errorForSize:offset:](self, "_errorForSize:offset:", a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTDataByteWriter setError:](self, "setError:", v10);

  }
  -[PTDataByteWriter error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11 == 0;

  return v8;
}

- (BOOL)writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  void *v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  -[PTDataByteWriter error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    return 0;
  v11 = -[NSMutableData length](self->_data, "length");
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_data, "replaceBytesInRange:withBytes:length:", a5, a4, a3, a4);
  if (a5 + a4 <= v11)
    v12 = v11;
  else
    v12 = a5 + a4;
  if (-[NSMutableData length](self->_data, "length") != v12)
  {
    -[PTDataByteWriter _errorForSize:offset:](self, "_errorForSize:offset:", a4, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTDataByteWriter setError:](self, "setError:", v13);

  }
  -[PTDataByteWriter error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14 == 0;

  return v10;
}

- (id)_errorForSize:(unint64_t)a3 offset:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v10 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to write bytes at offset %lu size %lu to data of length %lu"), a4, a3, -[NSMutableData length](self->_data, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -20, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
