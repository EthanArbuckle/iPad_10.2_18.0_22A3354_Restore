@implementation NUNIRenderer

+ (id)sharedInstanceWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8;
  id v9;
  NUNIAegirRenderer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a1;
  objc_sync_enter(v9);
  if (a5 == 2)
  {
    v10 = -[NUNIAegirRenderer initWithPixelFormat:textureSuffix:rendererStyle:]([NUNIAegirRenderer alloc], "initWithPixelFormat:textureSuffix:rendererStyle:", a3, v8, 2);
    +[PreferencePane aegirRenderingPreferencePane](_TtC9WeatherUI14PreferencePane, "aegirRenderingPreferencePane");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("AegirRenderingReset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v11, "reset");
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AegirRenderingReset"));

    }
    -[NUNIAegirRenderer setRendererOptions:](v10, "setRendererOptions:", v11);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "setObject:forKeyedSubscript:", v10, v15);

  objc_sync_exit(v9);
  return v10;
}

+ (void)_deallocInstanceWithPixelFormat:(unint64_t)a3 rendererStyle:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "discard");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "setObject:forKeyedSubscript:", 0, v7);

  objc_sync_exit(obj);
}

- (NUNIRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  NUNIRenderer *v7;
  NUNIRenderer *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUNIRenderer;
  v7 = -[NUNIRenderer init](&v11, sel_init, a3, a4);
  v8 = v7;
  if (v7)
  {
    v7->_rendererStyle = a5;
    v7->_pixelFormat = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__asyncDeallocInstance, *MEMORY[0x1E0C93E68], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E68], 0);

  v4.receiver = self;
  v4.super_class = (Class)NUNIRenderer;
  -[NUNIRenderer dealloc](&v4, sel_dealloc);
}

- (void)_asyncDeallocInstance
{
  _QWORD block[5];
  id v4;
  id location;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend((id)objc_opt_class(), "_deallocInstanceWithPixelFormat:rendererStyle:", -[NUNIRenderer pixelFormat](self, "pixelFormat"), -[NUNIRenderer rendererStyle](self, "rendererStyle"));
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__NUNIRenderer__asyncDeallocInstance__block_invoke;
    block[3] = &unk_1E6076278;
    objc_copyWeak(&v4, &location);
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __37__NUNIRenderer__asyncDeallocInstance__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend((id)objc_opt_class(), "_deallocInstanceWithPixelFormat:rendererStyle:", objc_msgSend(WeakRetained, "pixelFormat"), objc_msgSend(WeakRetained, "rendererStyle"));

}

- (unint64_t)rendererStyle
{
  return self->_rendererStyle;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

@end
