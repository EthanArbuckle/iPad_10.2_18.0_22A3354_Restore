@implementation PSIIntArray

- (PSIIntArray)initWithLabel:(id)a3 database:(sqlite3 *)a4
{
  id v5;
  PSIIntArray *v6;
  int v7;
  int v8;
  objc_super v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSIIntArray;
  v6 = -[PSIIntArray init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v7 = sqlite3_intarray_create();
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v12 = v8;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create int array: %d", buf, 8u);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[16];

  if (self->_elementBuffer)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Missing call to unbind or unprepare before deallocating int array", buf, 2u);
    }
    -[PSIIntArray unbind](self, "unbind");
    -[PSIIntArray unprepare](self, "unprepare");
  }
  v3.receiver = self;
  v3.super_class = (Class)PSIIntArray;
  -[PSIIntArray dealloc](&v3, sel_dealloc);
}

- (int64_t)elementBuffer
{
  return self->_elementBuffer;
}

- (void)prepareForNumberOfElements:(unint64_t)a3
{
  self->_freeOnUnprepare = 1;
  -[PSIIntArray _prepareForNumberOfElements:](self, "_prepareForNumberOfElements:", a3);
}

- (void)_prepareForNumberOfElements:(unint64_t)a3
{
  unint64_t v4;
  int64_t *elementBuffer;
  int64_t *v6;
  size_t v7;
  malloc_type_id_t v8;

  v4 = 8 * a3;
  elementBuffer = self->_elementBuffer;
  if (!elementBuffer)
  {
    if (v4 < 0x801)
    {
      self->_elementBuffer = self->_staticElementBuffer;
      self->_elementBufferSize = 2048;
      return;
    }
    v7 = 8 * a3;
    v8 = 2871931235;
    goto LABEL_9;
  }
  if (v4 <= self->_elementBufferSize)
    return;
  if (elementBuffer == self->_staticElementBuffer)
  {
    v7 = 8 * a3;
    v8 = 360620597;
LABEL_9:
    v6 = (int64_t *)malloc_type_malloc(v7, v8);
    goto LABEL_10;
  }
  v6 = (int64_t *)malloc_type_realloc(elementBuffer, 8 * a3, 0x378CE1E3uLL);
LABEL_10:
  self->_elementBuffer = v6;
  self->_elementBufferSize = v4;
}

- (void)_unprepare
{
  int64_t **p_elementBuffer;
  int64_t *elementBuffer;
  int64_t *staticElementBuffer;
  BOOL v6;

  p_elementBuffer = &self->_elementBuffer;
  elementBuffer = self->_elementBuffer;
  staticElementBuffer = self->_staticElementBuffer;
  if (elementBuffer)
    v6 = elementBuffer == staticElementBuffer;
  else
    v6 = 1;
  if (!v6)
    free(elementBuffer);
  *p_elementBuffer = 0;
  p_elementBuffer[1] = 0;
  *((_BYTE *)p_elementBuffer + 16) = 0;
}

- (void)bindElements:(__CFSet *)a3
{
  int v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PSIIntArray _prepareForNumberOfElements:](self, "_prepareForNumberOfElements:", CFSetGetCount(a3));
  CFSetGetValues(a3, (const void **)self->_elementBuffer);
  v5 = sqlite3_intarray_bind();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v7, 8u);
    }
  }
}

- (void)bindElements:(__CFArray *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int v8;
  int v9;
  _DWORD v10[2];
  uint64_t v11;
  CFRange v12;

  length = a4.length;
  location = a4.location;
  v11 = *MEMORY[0x1E0C80C00];
  -[PSIIntArray _prepareForNumberOfElements:](self, "_prepareForNumberOfElements:", a4.length);
  v12.location = location;
  v12.length = length;
  CFArrayGetValues(a3, v12, (const void **)self->_elementBuffer);
  v8 = sqlite3_intarray_bind();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v9;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v10, 8u);
    }
  }
}

- (void)bindElements:(const int64_t *)a3 numberOfElements:(unint64_t)a4
{
  int v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_intarray_bind();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to bind int array: %d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)unbind
{
  int v3;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_intarray_bind();
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unbind int array: %d", (uint8_t *)v5, 8u);
    }
  }
  if (!self->_freeOnUnprepare)
    -[PSIIntArray _unprepare](self, "_unprepare");
}

@end
