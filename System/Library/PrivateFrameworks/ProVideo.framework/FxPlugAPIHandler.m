@implementation FxPlugAPIHandler

- (FxPlugAPIHandler)initWithDelegate:(id)a3
{
  FxPlugAPIHandler *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FxPlugAPIHandler;
  result = -[FxPlugAPIHandler init](&v5, sel_init);
  if (result)
    result->_delegate = (FxPlugAPIDelegate *)a3;
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  if (a4 > 1)
    return 0;
  return &unk_1EF0AFFE0 == a3
      || &unk_1EF0B65A0 == a3
      || &unk_1EF0AFB70 == a3
      || &unk_1EF0B6420 == a3
      || &unk_1EF0A0AE8 == a3;
}

- (FxPlugAPIDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FxPlugAPIDelegate *)a3;
}

- (id)errorWithString:(id)a3 andCode:(int64_t)a4
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, *MEMORY[0x1E0CB2D50]);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, a4, v5);
}

- (void)allocateMemory:(unint64_t)a3 clear:(BOOL)a4 clearWith:(unsigned __int8)a5 error:(id *)a6
{
  int v7;
  _BOOL4 v8;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v11 = malloc_type_malloc(a3, 0x687DF607uLL);
  v12 = v11;
  if (v11)
  {
    if (v8)
      memset(v11, v7, a3);
  }
  else if (a6)
  {
    *a6 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to allocate memory in %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) allocateMemory:clear:clearWith:error:]"), 6);
  }
  return v12;
}

- (void)freeMemory:(void *)a3 error:(id *)a4
{
  if (malloc_size(a3))
  {
    free(a3);
  }
  else if (a4)
  {
    *a4 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to free a memory block (%p) not allocated in  %s"), a3, "-[FxPlugAPIHandler(HostResourcesAPIHandler) freeMemory:error:]"), 7);
  }
}

- (void)createTexture:(id *)a3 withDOD:(FxRect)a4 GLTarget:(unsigned int)a5 level:(int)a6 internalFormat:(unsigned int)a7 width:(int)width height:(int)a9 border:(int)a10 format:(unsigned int)a11 type:(unsigned int)a12 pixels:(const void *)pixels origin:(unint64_t)a14 pixelAspectRatio:(double)a15 andError:(id *)a16
{
  uint64_t v19;
  uint64_t v20;
  int var1;
  int var3;
  id v25;
  uint64_t Error;
  uint64_t v27;
  uint64_t v28;
  FxTexture *v29;
  FxTexture *v30;
  _QWORD v32[2];
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  _BYTE v38[7];
  double v39;
  char v40;
  GLuint textures[3];

  v19 = *(_QWORD *)&a4.var2;
  v20 = *(_QWORD *)&a4.var0;
  var1 = a4.var1;
  var3 = a4.var3;
  if (a3)
    v25 = 0;
  else
    v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid FxTexture pointer sent to %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 5);
  if ((int)v19 <= (int)v20 || var3 <= var1)
    v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid dod sent to %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 5);
  textures[0] = 0;
  if (!v25)
  {
    glGenTextures(1, textures);
    Error = glGetError();
    if (!(_DWORD)Error
      || (v40 = 0,
          (v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL returned an error (%d) to %s while generating a texture: %s"), Error, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8)) == 0))
    {
      glTexImage2D(a5, a6, a7, width, a9, a10, a11, a12, pixels);
      v27 = glGetError();
      if (!(_DWORD)v27
        || (v40 = 0,
            (v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL returned an error (%d) to %s while uploading a texture: %s"), v27, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8)) == 0))
      {
        glBindTexture(a5, textures[0]);
        v28 = glGetError();
        if ((_DWORD)v28)
        {
          v40 = 0;
          v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL returned an error (%d) to %s while binding a texture: %s"), v28, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]", &v40), 8);
          if (!a3)
            goto LABEL_8;
        }
        else
        {
          v25 = 0;
          if (!a3)
            goto LABEL_8;
        }
        if (!v25)
        {
          v29 = [FxTexture alloc];
          v32[0] = width;
          v32[1] = a9;
          v33 = xmmword_1B3557A30;
          v34 = 2;
          v35 = a14;
          v36 = 0;
          v37 = 1;
          memset(v38, 0, sizeof(v38));
          v39 = a15;
          v30 = -[FxTexture initWithInfo:textureId:andTarget:](v29, "initWithInfo:textureId:andTarget:", v32, textures[0], a5);
          *a3 = v30;
          if (v30)
          {
            -[FxImage setDod:](v30, "setDod:", v20, v19);
            objc_msgSend(*a3, "setBounds:", (double)(int)v20 * a15, (double)var1, (double)((int)v19 - (int)v20) * a15, (double)(var3 - var1));
            v25 = 0;
          }
          else
          {
            v25 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to allocate an FxTexture in %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) createTexture:withDOD:GLTarget:level:internalFormat:width:height:border:format:type:pixels:origin:pixelAspectRatio:andError:]"), 6);
            glBindTexture(a5, 0);
            glDeleteTextures(1, textures);
          }
        }
      }
    }
  }
LABEL_8:
  if (a16)
    *a16 = v25;
}

- (void)deleteTexture:(id)a3 error:(id *)a4
{
  id v7;
  GLuint textures;

  if (a3 && objc_msgSend(a3, "textureId")
    || (v7 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid FxTexture pointer (%p) in %s"), a3, "-[FxPlugAPIHandler(HostResourcesAPIHandler) deleteTexture:error:]"), 5)) == 0)
  {
    textures = objc_msgSend(a3, "textureId");
    glDeleteTextures(1, &textures);

    v7 = 0;
  }
  if (a4)
    *a4 = v7;
}

- (void)createPBuffer:(unsigned int *)a3 withTarget:(unsigned int)a4 error:(id *)a5
{
  uint64_t Error;
  id v10;
  uint64_t v11;
  char v12;
  char v13;

  if (!a3)
  {
    v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid pBuffer pointer (%p) in %s"), 0, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 5);
    if (v10)
    {
LABEL_11:
      if (!a5)
        return;
      goto LABEL_12;
    }
  }
  glGenBuffers(1, a3);
  Error = glGetError();
  if ((_DWORD)Error)
  {
    v13 = 0;
    v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL Error (%d): %s in %s"), Error, &v13, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 8);
    if (!a3)
      goto LABEL_11;
  }
  else
  {
    v10 = 0;
    if (!a3)
      goto LABEL_11;
  }
  if (v10)
    goto LABEL_11;
  glBindBuffer(a4, *a3);
  v11 = glGetError();
  if ((_DWORD)v11)
  {
    v12 = 0;
    v10 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL Error (%d): %s in %s"), v11, &v12, "-[FxPlugAPIHandler(HostResourcesAPIHandler) createPBuffer:withTarget:error:]"), 8);
    goto LABEL_11;
  }
  v10 = 0;
  if (!a5)
    return;
LABEL_12:
  *a5 = v10;
}

- (void)deletePBuffer:(unsigned int)a3 error:(id *)a4
{
  uint64_t Error;
  id v7;
  char v8;
  GLuint buffers;

  buffers = a3;
  glDeleteBuffers(1, &buffers);
  Error = glGetError();
  if ((_DWORD)Error)
  {
    v8 = 0;
    v7 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OpenGL Error (%d): %s in %s"), Error, &v8, "-[FxPlugAPIHandler(HostResourcesAPIHandler) deletePBuffer:error:]"), 8);
    if (!a4)
      return;
  }
  else
  {
    v7 = 0;
    if (!a4)
      return;
  }
  *a4 = v7;
}

- (unint64_t)numberOfCores
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "activeProcessorCount");
}

- (void)performSelector:(SEL)a3 onTarget:(id)a4 withObject:(id)a5 onThreads:(int64_t)a6 waitUntilDone:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v22;

  v8 = a7;
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  if (v22)
  {
    v12 = 0;
    if (v8)
      goto LABEL_3;
LABEL_6:
    v14 = 0;
    goto LABEL_8;
  }
  v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to allocate thread array in %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
  if (!v8)
    goto LABEL_6;
LABEL_3:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "lock");
  else
    v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to allocate lock in %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
LABEL_8:
  v20 = v8;
  if (a6 >= 1 && !v12)
  {
    v15 = 1;
    do
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sel_getName(a3));
      v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("FxThreadTarget"), a5, CFSTR("FxThreadObject"), v16, CFSTR("FxThreadSelector"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15 - 1), CFSTR("FxThreadNumber"), v14, CFSTR("FxThreadLock"), 0);
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3978]), "initWithTarget:selector:object:", self, sel_runFxPlugThread_, v17);
      if (v16 && v17 && (v19 = v18) != 0)
      {
        objc_msgSend(v22, "addObject:", v18);
        objc_msgSend(v19, "start");
        v12 = 0;
      }
      else
      {
        v12 = -[FxPlugAPIHandler errorWithString:andCode:](self, "errorWithString:andCode:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to allocate thread in %s"), "-[FxPlugAPIHandler(HostResourcesAPIHandler) performSelector:onTarget:withObject:onThreads:waitUntilDone:error:]"), 7);
      }
      if (v15 >= a6)
        break;
      ++v15;
    }
    while (!v12);
  }
  if (v20)
  {
    objc_msgSend(v14, "unlockWithCondition:", a6);
    objc_msgSend(v14, "lockWhenCondition:", 0);
    objc_msgSend(v14, "unlock");

  }
  if (a8)
    *a8 = v12;
}

- (void)runFxPlugThread:(id)a3
{
  SEL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  PCAutoreleasePool::PCAutoreleasePool((PCAutoreleasePool *)&v11);
  v5 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("FxThreadSelector")), "UTF8String"));
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("FxThreadTarget"));
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("FxThreadObject"));
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("FxThreadNumber"));
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ worker thread #%d"), -[FxPlugAPIDelegate displayName](self->_delegate, "displayName"), objc_msgSend(v8, "intValue"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "setName:", v9);
  pthread_setname_np((const char *)objc_msgSend(v9, "UTF8String"));
  objc_msgSend(v6, "performSelector:withObject:", v5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, CFSTR("FxThreadObject"), v8, CFSTR("FxThreadNumber"), 0));
  v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("FxThreadLock"));
  objc_msgSend(v10, "lock");
  objc_msgSend(v10, "unlockWithCondition:", objc_msgSend(v10, "condition") - 1);
  PCAutoreleasePool::~PCAutoreleasePool(&v11);
}

@end
