@implementation PTAtomStream

- (PTAtomStream)initWithByteStream:(id)a3
{
  return -[PTAtomStream initWithByteStream:offset:](self, "initWithByteStream:offset:", a3, 0);
}

- (PTAtomStream)initWithByteStream:(id)a3 offset:(unint64_t)a4
{
  id v7;
  PTAtomStream *v8;
  PTAtomStream *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PTAtomStream;
  v8 = -[PTAtomStream init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_byteStream, a3);
    v9->_globalAtomOffset = a4;
    v9->_globalEndOffset = objc_msgSend(v7, "size");
    -[PTAtomStream _readAtomHeader](v9, "_readAtomHeader");
  }

  return v9;
}

- (PTAtomStream)initWithParent:(id)a3
{
  return -[PTAtomStream initWithParent:offset:](self, "initWithParent:offset:", a3, 0);
}

- (PTAtomStream)initWithParent:(id)a3 offset:(unint64_t)a4
{
  id v7;
  PTAtomStream *v8;
  PTAtomStream *v9;
  uint64_t v10;
  PTByteStream *byteStream;
  uint64_t v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PTAtomStream;
  v8 = -[PTAtomStream init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentStream, a3);
    objc_msgSend(v7, "byteStream");
    v10 = objc_claimAutoreleasedReturnValue();
    byteStream = v9->_byteStream;
    v9->_byteStream = (PTByteStream *)v10;

    v9->_globalAtomOffset = objc_msgSend(v7, "globalAtomDataOffset") + a4;
    v12 = objc_msgSend(v7, "globalAtomOffset");
    v9->_globalEndOffset = objc_msgSend(v7, "atomSize") + v12;
    -[PTAtomStream _readAtomHeader](v9, "_readAtomHeader");
  }

  return v9;
}

- (BOOL)hasAtom
{
  void *v3;
  _BOOL4 v4;

  -[PTAtomStream error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    LOBYTE(v4) = 0;
  else
    v4 = !-[PTAtomStream isAtEndOfStream](self, "isAtEndOfStream");

  return v4;
}

- (unint64_t)atomDataSize
{
  return self->_atomSize - self->_atomDataOffset;
}

- (unint64_t)globalAtomDataOffset
{
  return self->_atomDataOffset + self->_globalAtomOffset;
}

- (void)readCurrentAtomVersionAndFlags
{
  unsigned int v3;
  unsigned int v4;

  if (!self->_error && !self->_didReadAtomVersionAndFlags)
  {
    v4 = 0;
    -[PTAtomStream readCurrentAtomDataBytes:size:offset:](self, "readCurrentAtomDataBytes:size:offset:", &v4, 4, 0);
    v3 = bswap32(v4);
    v4 = v3;
    self->_atomVersion = HIBYTE(v3);
    self->_atomFlags = v3 & 0xFFFFFF;
    self->_atomDataOffset += 4;
    self->_didReadAtomVersionAndFlags = 1;
    -[PTAtomStream _debugLogAtomReaderState](self, "_debugLogAtomReaderState");
    -[PTAtomStream _setErrorForByteStreamIfNeeded](self, "_setErrorForByteStreamIfNeeded");
  }
}

- (void)readCurrentAtomDataBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  if (!self->_error)
  {
    -[PTAtomStream _readBytes:size:offset:](self, "_readBytes:size:offset:", a3, a4, -[PTAtomStream globalAtomDataOffset](self, "globalAtomDataOffset") + a5);
    -[PTAtomStream _debugLogAtomReaderState](self, "_debugLogAtomReaderState");
    -[PTAtomStream _setErrorForByteStreamIfNeeded](self, "_setErrorForByteStreamIfNeeded");
  }
}

- (void)advanceToNextAtom
{
  unint64_t globalEndOffset;
  unint64_t v4;

  if (!self->_error)
  {
    globalEndOffset = self->_globalEndOffset;
    v4 = self->_globalAtomOffset + self->_atomSize;
    self->_globalAtomOffset = v4;
    if (v4 >= globalEndOffset)
      -[PTAtomStream _setEndOfStream](self, "_setEndOfStream");
    else
      -[PTAtomStream _readAtomHeader](self, "_readAtomHeader");
    -[PTAtomStream _debugLogAtomReaderState](self, "_debugLogAtomReaderState");
    -[PTAtomStream _setErrorForByteStreamIfNeeded](self, "_setErrorForByteStreamIfNeeded");
  }
}

- (void)setError:(id)a3
{
  PTAtomStream *parentStream;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  parentStream = self->_parentStream;
  if (parentStream)
    -[PTAtomStream setError:](parentStream, "setError:", v6);

}

- (id)debugDescription
{
  unsigned int atomType;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  atomType = self->_atomType;
  if (atomType)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromFourCharCode(atomType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("('%@')"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E822B200;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = -[PTAtomStream globalAtomOffset](self, "globalAtomOffset");
  v9 = -[PTAtomStream atomSize](self, "atomSize");
  v10 = -[PTAtomStream atomDataOffset](self, "atomDataOffset");
  v11 = -[PTAtomStream atomDataSize](self, "atomDataSize");
  -[PTAtomStream error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@"), v6, v8, v9, v10, v11, &stru_1E822B200);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PTAtomStream error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" (%@)"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@"), v6, v8, v9, v10, v11, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)_setEndOfStream
{
  self->_atomType = 0;
  self->_atomSize = 0;
  self->_atomDataOffset = 0;
  *(_WORD *)&self->_atEndOfStream = 1;
  self->_atomVersion = 0;
  self->_atomFlags = 0;
}

- (void)_readAtomHeader
{
  void *v3;
  unint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (!self->_error)
  {
    v5[0] = 0;
    -[PTAtomStream _readBytes:size:offset:](self, "_readBytes:size:offset:", v5, 8, self->_globalAtomOffset);
    -[PTAtomStream error](self, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = bswap32(v5[0]);
      self->_atomType = bswap32(HIDWORD(v5[0]));
      self->_atomSize = v4;
      self->_atomDataOffset = 8;
      self->_didReadAtomVersionAndFlags = 0;
      self->_atomVersion = 0;
      self->_atomFlags = 0;
    }
    -[PTAtomStream _debugLogAtomReaderState](self, "_debugLogAtomReaderState");
    -[PTAtomStream _setErrorForByteStreamIfNeeded](self, "_setErrorForByteStreamIfNeeded");
  }
}

- (void)_readBytes:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  id v9;

  if (a5 + a4 <= self->_globalEndOffset)
  {
    -[PTByteStream readBytes:size:offset:](self->_byteStream, "readBytes:size:offset:", a3, a4, a5);
    -[PTAtomStream _debugLogBytes:size:offset:](self, "_debugLogBytes:size:offset:", a3, a4, a5);
  }
  else
  {
    -[PTAtomStream _errorForReadPastLimit:size:offset:](self, "_errorForReadPastLimit:size:offset:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PTAtomStream setError:](self, "setError:", v9);

  }
}

- (void)_setErrorForByteStreamIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[PTByteStream error](self->_byteStream, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PTByteStream error](self->_byteStream, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PTAtomStream _errorForByteStreamError:](self, "_errorForByteStreamError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAtomStream setError:](self, "setError:", v4);

  }
}

- (id)_errorForByteStreamError:(id)a3
{
  return a3;
}

- (id)_errorForReadPastLimit:(unint64_t)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempt to read past end %lu (offset %lu; size %lu)"),
    a3,
    a5,
    a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F90];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -19, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  NSObject *v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (PTSerializationDebugIsEnabled())
  {
    _PTLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBytes((unsigned __int8 *)a3, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = a5;
      v12 = 2112;
      v13 = v9;
      _os_log_debug_impl(&dword_1C9281000, v8, OS_LOG_TYPE_DEBUG, "r[%zd]: %@", (uint8_t *)&v10, 0x16u);

    }
  }
}

- (void)_debugLogAtomReaderState
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9281000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);

}

- (PTByteStream)byteStream
{
  return (PTByteStream *)objc_getProperty(self, a2, 16, 1);
}

- (PTAtomStream)parentStream
{
  return (PTAtomStream *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)atomType
{
  return self->_atomType;
}

- (unint64_t)atomVersion
{
  return self->_atomVersion;
}

- (unint64_t)atomFlags
{
  return self->_atomFlags;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)atomSize
{
  return self->_atomSize;
}

- (unint64_t)atomDataOffset
{
  return self->_atomDataOffset;
}

- (unint64_t)globalAtomOffset
{
  return self->_globalAtomOffset;
}

- (unint64_t)globalEndOffset
{
  return self->_globalEndOffset;
}

- (BOOL)isAtEndOfStream
{
  return self->_atEndOfStream;
}

- (BOOL)didReadAtomVersionAndFlags
{
  return self->_didReadAtomVersionAndFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentStream, 0);
  objc_storeStrong((id *)&self->_byteStream, 0);
}

@end
