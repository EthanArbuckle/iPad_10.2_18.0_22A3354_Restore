@implementation PTAtomWriter

- (PTAtomWriter)initWithByteWriter:(id)a3
{
  id v5;
  PTAtomWriter *v6;
  PTAtomWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAtomWriter;
  v6 = -[PTAtomWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_byteWriter, a3);

  return v7;
}

- (PTAtomWriter)initWithParent:(id)a3
{
  id v5;
  PTAtomWriter *v6;
  uint64_t v7;
  PTByteWriter *byteWriter;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PTAtomWriter;
  v6 = -[PTAtomWriter init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "byteWriter");
    v7 = objc_claimAutoreleasedReturnValue();
    byteWriter = v6->_byteWriter;
    v6->_byteWriter = (PTByteWriter *)v7;

    objc_storeStrong((id *)&v6->_parentWriter, a3);
    v9 = objc_msgSend(v5, "globalAtomOffset");
    v6->_globalAtomOffset = objc_msgSend(v5, "atomSize") + v9;
  }

  return v6;
}

- (unint64_t)atomDataSize
{
  return self->_atomSize - self->_atomDataOffset;
}

- (unint64_t)globalAtomDataOffset
{
  return self->_atomDataOffset + self->_globalAtomOffset;
}

- (void)beginAtomOfType:(unsigned int)a3
{
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_error)
  {
    v6[0] = 0;
    v6[1] = bswap32(a3);
    -[PTAtomWriter _appendBytes:size:](self, "_appendBytes:size:", v6, 8);
    -[PTAtomWriter error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      self->_atomDataOffset = 8;
      self->_atomSize = 8;
      self->_didBeginAtom = 1;
      self->_atomType = a3;
    }
    -[PTAtomWriter _debugLogAtomWriterState](self, "_debugLogAtomWriterState");
    -[PTAtomWriter _setErrorForByteWriterIfNeeded](self, "_setErrorForByteWriterIfNeeded");
  }
}

- (void)appendVersion:(unint64_t)a3 flags:(unint64_t)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;

  if (!self->_error && self->_didBeginAtom)
  {
    if (a3 < 0x100)
    {
      v8 = bswap32(a4 & 0xFFFFFF | (a3 << 24));
      -[PTAtomWriter _appendBytes:size:](self, "_appendBytes:size:", &v8, 4);
      -[PTAtomWriter error](self, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = self->_atomSize + 4;
        self->_atomSize = v7;
        self->_atomDataOffset = v7;
      }
    }
    else
    {
      -[PTAtomWriter _errorForVersion:](self, "_errorForVersion:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTAtomWriter setError:](self, "setError:", v5);

    }
    -[PTAtomWriter _debugLogAtomWriterState](self, "_debugLogAtomWriterState");
    -[PTAtomWriter _setErrorForByteWriterIfNeeded](self, "_setErrorForByteWriterIfNeeded");
  }
}

- (void)appendBytes:(const void *)a3 size:(unint64_t)a4
{
  void *v6;

  if (!self->_error && a4 && self->_didBeginAtom)
  {
    -[PTAtomWriter _appendBytes:size:](self, "_appendBytes:size:", a3, a4);
    -[PTAtomWriter error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      self->_atomSize += a4;
    -[PTAtomWriter _debugLogAtomWriterState](self, "_debugLogAtomWriterState");
    -[PTAtomWriter _setErrorForByteWriterIfNeeded](self, "_setErrorForByteWriterIfNeeded");
  }
}

- (void)endAtom
{
  unint64_t atomSize;
  void *v4;
  void *v5;
  PTAtomWriter *parentWriter;
  unint64_t v7;
  unsigned int v8;

  if (!self->_error && self->_didBeginAtom)
  {
    atomSize = self->_atomSize;
    if (HIDWORD(atomSize))
    {
      -[PTAtomWriter _errorForSize:](self, "_errorForSize:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTAtomWriter setError:](self, "setError:", v4);

    }
    else
    {
      v8 = bswap32(atomSize);
      -[PTAtomWriter _writeBytes:size:offset:](self, "_writeBytes:size:offset:", &v8, 4, self->_globalAtomOffset);
      -[PTAtomWriter error](self, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        parentWriter = self->_parentWriter;
        if (parentWriter)
          parentWriter->_atomSize += self->_atomSize;
        v7 = self->_globalAtomOffset + self->_atomSize;
        self->_atomSize = 0;
        self->_globalAtomOffset = v7;
        self->_atomDataOffset = 0;
        self->_didBeginAtom = 0;
        self->_atomType = 0;
      }
    }
    -[PTAtomWriter _debugLogAtomWriterState](self, "_debugLogAtomWriterState");
    -[PTAtomWriter _setErrorForByteWriterIfNeeded](self, "_setErrorForByteWriterIfNeeded");
    -[PTAtomWriter _debugLogAtomWriterState](self->_parentWriter, "_debugLogAtomWriterState");
  }
}

- (void)setError:(id)a3
{
  PTAtomWriter *parentWriter;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  parentWriter = self->_parentWriter;
  if (parentWriter)
    -[PTAtomWriter setError:](parentWriter, "setError:", v6);

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
  v8 = -[PTAtomWriter globalAtomOffset](self, "globalAtomOffset");
  v9 = -[PTAtomWriter atomSize](self, "atomSize");
  v10 = -[PTAtomWriter atomDataOffset](self, "atomDataOffset");
  v11 = -[PTAtomWriter atomDataSize](self, "atomDataSize");
  -[PTAtomWriter error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@"), v6, v8, v9, v10, v11, &stru_1E822B200);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PTAtomWriter error](self, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR(" (%@)"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("atom%@: { offset: %lu, size: %lu }, data: { offset: %lu, size: %lu }%@"), v6, v8, v9, v10, v11, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)_appendBytes:(const void *)a3 size:(unint64_t)a4
{
  -[PTAtomWriter _debugLogBytes:size:](self, "_debugLogBytes:size:");
  -[PTByteWriter appendBytes:size:](self->_byteWriter, "appendBytes:size:", a3, a4);
}

- (void)_writeBytes:(const void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5
{
  -[PTAtomWriter _debugLogBytes:size:offset:](self, "_debugLogBytes:size:offset:");
  -[PTByteWriter writeBytes:size:offset:](self->_byteWriter, "writeBytes:size:offset:", a3, a4, a5);
}

- (void)_setErrorForByteWriterIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[PTByteWriter error](self->_byteWriter, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PTByteWriter error](self->_byteWriter, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PTAtomWriter _errorForByteWriterError:](self, "_errorForByteWriterError:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAtomWriter setError:](self, "setError:", v4);

  }
}

- (id)_errorForByteWriterError:(id)a3
{
  return a3;
}

- (id)_errorForVersion:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("version %lu is too big to fit"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -12572, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_errorForSize:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data size %lu is too big to fit"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -12572, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_debugLogBytes:(const void *)a3 size:(unint64_t)a4
{
  NSObject *v6;

  if (PTSerializationDebugIsEnabled())
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PTAtomWriter _debugLogBytes:size:].cold.1((unsigned __int8 *)a3, a4);

  }
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
      _os_log_debug_impl(&dword_1C9281000, v8, OS_LOG_TYPE_DEBUG, "w[%zd]: %@", (uint8_t *)&v10, 0x16u);

    }
  }
}

- (void)_debugLogAtomWriterState
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v2, v3, "%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (PTByteWriter)byteWriter
{
  return (PTByteWriter *)objc_getProperty(self, a2, 16, 1);
}

- (PTAtomWriter)parentWriter
{
  return (PTAtomWriter *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)atomSize
{
  return self->_atomSize;
}

- (unint64_t)globalAtomOffset
{
  return self->_globalAtomOffset;
}

- (unint64_t)atomDataOffset
{
  return self->_atomDataOffset;
}

- (BOOL)didBeginAtom
{
  return self->_didBeginAtom;
}

- (unsigned)atomType
{
  return self->_atomType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_parentWriter, 0);
  objc_storeStrong((id *)&self->_byteWriter, 0);
}

- (void)_debugLogBytes:(unsigned __int8 *)a1 size:(uint64_t)a2 .cold.1(unsigned __int8 *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromBytes(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "w[+]: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
