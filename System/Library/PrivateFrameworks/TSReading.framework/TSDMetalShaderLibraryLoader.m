@implementation TSDMetalShaderLibraryLoader

+ (id)loadLibraryWithDevice:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("Can't initialize shader library with nil device");
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = 26;
LABEL_8:
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, v21, v17);

    v9 = 0;
    goto LABEL_9;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("Couldn't find path to shader library");
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = 31;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v9 = (void *)objc_msgSend(v5, "newLibraryWithURL:error:", v8, &v23);
  v10 = v23;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalShader.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 38, CFSTR("Failed to create library, error %@"), v10);

  }
LABEL_9:

  return v9;
}

+ (id)loadDefaultLibraryWithDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("TSDDefaultMetalLibrary"), CFSTR("metallib"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:](TSDMetalShaderLibraryLoader, "loadLibraryWithDevice:path:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)loadApplicationLibraryWithDevice:(id)a3 library:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathForResource:ofType:", v6, CFSTR("metallib"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[TSDMetalShaderLibraryLoader loadLibraryWithDevice:path:](TSDMetalShaderLibraryLoader, "loadLibraryWithDevice:path:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
