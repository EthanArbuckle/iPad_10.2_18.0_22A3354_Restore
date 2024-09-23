@implementation TIKeyboardLayoutFactory

- (TIKeyboardLayoutFactory)init
{
  TIKeyboardLayoutFactory *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardLayoutFactory;
  v2 = -[TIKeyboardLayoutFactory init](&v7, sel_init);
  if (v2)
  {
    +[TIKeyboardLayoutFactory layoutsFileName](TIKeyboardLayoutFactory, "layoutsFileName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/TextInputUI.framework"), "stringByAppendingPathComponent:", v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dlopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 1);
    v2->_layoutsLibraryHandle = v5;
    if (!v5)
      NSLog(CFSTR("%s unable to load keyboard layouts from %@"), "-[TIKeyboardLayoutFactory init]", v4);

  }
  return v2;
}

- (id)keyboardWithName:(id)a3 inCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void (*v15)(void *);
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      -[TIKeyboardLayoutFactory internalCache](self, "internalCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 100);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardLayoutFactory setInternalCache:](self, "setInternalCache:", v10);

      }
      -[TIKeyboardLayoutFactory internalCache](self, "internalCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("UIKBBuildTreeNamed_"), "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[TIKeyboardLayoutFactory layoutsLibraryHandle](self, "layoutsLibraryHandle");
    v14 = objc_retainAutorelease(v12);
    v15 = (void (*)(void *))dlsym(v13, (const char *)objc_msgSend(v14, "UTF8String"));
    if (v15)
    {
      v15(v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)keyboardPrefixForWidth:(double)a3 andEdge:(BOOL)a4
{
  _BOOL8 v4;
  void (*v6)(_BOOL8, double);

  v4 = a4;
  v6 = (void (*)(_BOOL8, double))dlsym(-[TIKeyboardLayoutFactory layoutsLibraryHandle](self, "layoutsLibraryHandle"), (const char *)objc_msgSend(CFSTR("UIKBGetKeyboardPrefixForWidthAndEdge"), "UTF8String"));
  if (v6)
  {
    v6(v4, a3);
    v6 = (void (*)(_BOOL8, double))objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)layoutsLibraryHandle
{
  return self->_layoutsLibraryHandle;
}

- (NSMutableDictionary)internalCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalCache, 0);
}

+ (id)sharedKeyboardFactory
{
  if (sharedKeyboardFactory_onceToken != -1)
    dispatch_once(&sharedKeyboardFactory_onceToken, &__block_literal_global_5199);
  return (id)sharedKeyboardFactory_instance;
}

+ (id)layoutsFileName
{
  void *v2;
  __CFString *v3;

  v2 = (void *)MGCopyAnswer();
  if (!v2)
  {
    v3 = 0;
    if (!objc_msgSend(0, "isEqualToString:", CFSTR("KBLayouts_iPod.dylib")))
    {
LABEL_7:
      v3 = CFSTR("KBLayouts_iPad.dylib");
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KBLayouts_%@.dylib"), v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("KBLayouts_iPod.dylib")) & 1) != 0)
  {
LABEL_6:

    v3 = CFSTR("KBLayouts_iPhone.dylib");
    goto LABEL_8;
  }
  if (!v3)
    goto LABEL_7;
LABEL_8:

  return v3;
}

void __48__TIKeyboardLayoutFactory_sharedKeyboardFactory__block_invoke()
{
  TIKeyboardLayoutFactory *v0;
  void *v1;

  v0 = objc_alloc_init(TIKeyboardLayoutFactory);
  v1 = (void *)sharedKeyboardFactory_instance;
  sharedKeyboardFactory_instance = (uint64_t)v0;

}

@end
