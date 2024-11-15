@implementation PTDataByteStream

- (PTDataByteStream)initWithData:(id)a3
{
  id v5;
  PTDataByteStream *v6;
  PTDataByteStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTDataByteStream;
  v6 = -[PTDataByteStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (unint64_t)size
{
  return -[NSData length](self->_data, "length");
}

- (unint64_t)readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  NSUInteger v9;
  void *v10;
  void *v11;

  -[PTDataByteStream setError:](self, "setError:", 0);
  if (a4 && -[NSData length](self->_data, "length") > a5)
  {
    if (-[NSData length](self->_data, "length") < a5 + a4)
    {
      v9 = -[NSData length](self->_data, "length");
      a4 = v9 - a5;
      -[PTDataByteStream _errorForSize:offset:](self, "_errorForSize:offset:", v9 - a5, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTDataByteStream setError:](self, "setError:", v10);

    }
    -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, a5, a4);
  }
  else
  {
    -[PTDataByteStream _errorForSize:offset:](self, "_errorForSize:offset:", a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTDataByteStream setError:](self, "setError:", v11);

    return 0;
  }
  return a4;
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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to read bytes at offset %lu size %lu from data of length %lu"), a4, a3, -[NSData length](self->_data, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -19, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
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
