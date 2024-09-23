@implementation RBShaderLibrary

+ (uint64_t)nullLibrary
{
  unsigned __int8 v0;

  objc_opt_self();
  {
    +[RBShaderLibrary nullLibrary]::null_library = +[RBShaderLibrary libraryWithData:](RBShaderLibrary, "libraryWithData:", objc_msgSend(MEMORY[0x24BDBCE50], "data"));
  }
  return +[RBShaderLibrary nullLibrary]::null_library;
}

+ (RBShaderLibrary)defaultLibrary
{
  unsigned __int8 v2;

  {
    +[RBShaderLibrary defaultLibrary]::default_library = +[RBShaderLibrary defaultLibraryWithBundle:](RBShaderLibrary, "defaultLibraryWithBundle:", objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"));
  }
  return (RBShaderLibrary *)+[RBShaderLibrary defaultLibrary]::default_library;
}

+ (id)defaultLibraryWithBundle:(id)a3
{
  id result;
  _QWORD *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

  if (!a3)
    return (id)+[RBShaderLibrary nullLibrary]();
  result = objc_getAssociatedObject(a3, "RBShaderLibrary");
  if (!result)
  {
    v5 = (_QWORD *)objc_opt_new();
    v6 = operator new();
    RB::CustomShader::Library::Library(v6, 0, a3);
    v7 = (unsigned int *)v5[1];
    v5[1] = v6;
    if (v7)
    {
      v8 = v7 + 2;
      do
      {
        v9 = __ldxr(v8);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, v8));
      if (!v10)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 8))(v7);
      }
    }
    objc_setAssociatedObject(a3, "RBShaderLibrary", v5, (void *)0x301);
    return v5;
  }
  return result;
}

+ (RBShaderLibrary)libraryWithData:(id)a3
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  RBShaderLibrary *v10;

  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = (_QWORD *)objc_opt_new();
  v5 = operator new();
  RB::CustomShader::Library::Library(v5, 2, v3);
  v6 = (unsigned int *)v4[1];
  v4[1] = v5;
  if (v6)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  v10 = v4;

  return v10;
}

+ (RBShaderLibrary)libraryWithContentsOfURL:(id)a3
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  RBShaderLibrary *v10;

  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = (_QWORD *)objc_opt_new();
  v5 = operator new();
  RB::CustomShader::Library::Library(v5, 1, v3);
  v6 = (unsigned int *)v4[1];
  v4[1] = v5;
  if (v6)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  v10 = v4;

  return v10;
}

+ (RBShaderLibrary)libraryWithMetalLibrary:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  v4 = (_QWORD *)objc_opt_new();
  v5 = operator new();
  RB::CustomShader::Library::Library(v5, 3, a3);
  v6 = (unsigned int *)v4[1];
  v4[1] = v5;
  if (v6)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  return (RBShaderLibrary *)v4;
}

+ (RBShaderLibrary)libraryWithSource:(id)a3
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  RBShaderLibrary *v10;

  v3 = (void *)objc_msgSend(a3, "copy");
  v4 = (_QWORD *)objc_opt_new();
  v5 = operator new();
  RB::CustomShader::Library::Library(v5, 4, v3);
  v6 = (unsigned int *)v4[1];
  v4[1] = v5;
  if (v6)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  v10 = v4;

  return v10;
}

- (NSBundle)bundle
{
  Library *p;

  p = self->_library._p;
  if (*((_DWORD *)p + 6))
    return 0;
  else
    return (NSBundle *)*((_QWORD *)p + 2);
}

- (NSData)data
{
  Library *p;

  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 2)
    return (NSData *)*((_QWORD *)p + 2);
  else
    return 0;
}

- (NSURL)URL
{
  Library *p;

  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 1)
    return (NSURL *)*((_QWORD *)p + 2);
  else
    return 0;
}

- (MTLLibrary)metalLibrary
{
  Library *p;

  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 3)
    return (MTLLibrary *)*((_QWORD *)p + 2);
  else
    return 0;
}

- (NSString)source
{
  Library *p;

  p = self->_library._p;
  if (*((_DWORD *)p + 6) == 4)
    return (NSString *)*((_QWORD *)p + 2);
  else
    return 0;
}

- (_QWORD)initWithLibrary:(_QWORD *)result
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  _QWORD *v9;
  objc_super v10;

  if (result)
  {
    v10.receiver = result;
    v10.super_class = (Class)RBShaderLibrary;
    result = objc_msgSendSuper2(&v10, sel_init);
    if (result)
    {
      if (a2)
      {
        v3 = (unsigned int *)result[1];
        if (v3 != a2)
        {
          if (v3)
          {
            v4 = v3 + 2;
            do
            {
              v5 = __ldxr(v4);
              v6 = v5 - 1;
            }
            while (__stlxr(v6, v4));
            if (!v6)
            {
              __dmb(9u);
              v9 = result;
              (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 8))(v3);
              result = v9;
            }
          }
          v7 = a2 + 2;
          do
            v8 = __ldxr(v7);
          while (__stxr(v8 + 1, v7));
          result[1] = a2;
        }
      }
      else
      {

        return 0;
      }
    }
  }
  return result;
}

- (unsigned)addErrorHandler:(id)a3
{
  return RB::CustomShader::Library::add_error_handler((uint64_t)self->_library._p, a3);
}

- (void)removeErrorHandler:(unsigned int)a3
{
  RB::CustomShader::Library::remove_error_handler((os_unfair_lock_s *)self->_library._p, a3);
}

- (void).cxx_destruct
{
  Library *p;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  p = self->_library._p;
  if (p)
  {
    v3 = (unsigned int *)((char *)p + 8);
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(Library *))(*(_QWORD *)p + 8))(p);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
