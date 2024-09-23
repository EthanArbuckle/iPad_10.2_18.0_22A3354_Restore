@implementation VFXMTLLibrary

- (VFXMTLLibrary)initWithPath:(id)a3 manager:(id)a4
{
  const char *v6;
  uint64_t v7;
  VFXMTLLibrary *v8;
  NSURL *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VFXMTLLibrary;
  v8 = -[VFXMTLLibrary init](&v14, sel_init);
  if (v8)
  {
    if (a3)
      v9 = (NSURL *)(id)objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v6, (uint64_t)a3, v7);
    else
      v9 = 0;
    v8->_libraryURL = v9;
    v8->_manager = (VFXMTLLibraryManager *)a4;
    objc_msgSend__load(v8, v10, v11, v12);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLLibrary;
  -[VFXMTLLibrary dealloc](&v3, sel_dealloc);
}

- (void)_load
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  MTLLibrary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  self->_library = 0;
  if (self->_libraryURL)
  {
    v14 = 0;
    v5 = (void *)objc_msgSend_device(self->_manager, a2, v2, v3);
    v7 = (MTLLibrary *)objc_msgSend_newLibraryWithURL_error_(v5, v6, (uint64_t)self->_libraryURL, (uint64_t)&v14);
    self->_library = v7;
    if (!v7)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: FATAL ERROR : failed to load Metal shaders library %@, %@"), v8, v9, v10, v11, v12, v13, (uint64_t)self->_libraryURL);
  }
}

- (MTLLibrary)library
{
  return self->_library;
}

@end
