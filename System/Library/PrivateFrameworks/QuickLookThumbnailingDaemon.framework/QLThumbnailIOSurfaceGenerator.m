@implementation QLThumbnailIOSurfaceGenerator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_instance;
}

void __47__QLThumbnailIOSurfaceGenerator_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (void)ioSurfaceWithSize:(CGSize)a3 completionHandler:(id)a4
{
  double height;
  double width;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject **v13;
  NSObject *v14;
  int v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  height = a3.height;
  width = a3.width;
  v18[4] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a4;
  v17[0] = *MEMORY[0x1E0CBBDD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E0CBBD88];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CBBD70];
  v18[1] = v8;
  v18[2] = &unk_1E99DDA58;
  v10 = *MEMORY[0x1E0CBBD90];
  v17[2] = v9;
  v17[3] = v10;
  v18[3] = &unk_1E99DDA70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithProperties:", v11);
  if (!v12)
  {
    v13 = (NSObject **)MEMORY[0x1E0D83678];
    v14 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D54AE000, v14, OS_LOG_TYPE_FAULT, "Could not generate IOSurface for thumbnail generation with properties %@ #Thumbnail", (uint8_t *)&v15, 0xCu);
    }
  }
  v6[2](v6, v12, 0);

}

@end
