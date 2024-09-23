@implementation PFXFrameSpec

- (PFXFrameSpec)initWithBundle:(id)a3 basePath:(id)a4 readerState:(id)a5 isVolatile:(BOOL)a6
{
  _BOOL8 v6;
  PFXArchive *v11;
  NSString *v12;
  PFXFrameSpec *v13;
  objc_super v15;

  v6 = a6;
  v11 = (PFXArchive *)objc_msgSend(a5, "archive");
  v12 = (NSString *)objc_msgSend(a4, "copy");
  self->mArchive = v11;
  self->mBundleBasePath = v12;
  self->mTSPContext = (TSPObjectContext *)objc_msgSend(a5, "tspContext");
  v15.receiver = self;
  v15.super_class = (Class)PFXFrameSpec;
  v13 = -[PFXFrameSpec initWithBundle:isVolatile:](&v15, "initWithBundle:isVolatile:", a3, v6);
  if (!v13)
  {

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[PFXFrameSpec setInfoDictionary:](self, "setInfoDictionary:", 0);
  -[PFXFrameSpec setBundleBasePath:](self, "setBundleBasePath:", 0);
  -[PFXFrameSpec setArchive:](self, "setArchive:", 0);
  -[PFXFrameSpec setTspContext:](self, "setTspContext:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PFXFrameSpec;
  -[PFXFrameSpec dealloc](&v3, "dealloc");
}

- (NSDictionary)infoDictionary
{
  return self->mInfoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (void)setArchive:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSString)bundleBasePath
{
  return self->mBundleBasePath;
}

- (void)setBundleBasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (TSPObjectContext)tspContext
{
  return self->mTSPContext;
}

- (void)setTspContext:(id)a3
{
  self->mTSPContext = (TSPObjectContext *)a3;
}

- (id)newDataWithBundleResource:(id)a3
{
  return -[PFXArchive createDataWithName:error:](self->mArchive, "createDataWithName:error:", -[PFXFrameSpec p_documentURIForResourcePath:](self, "p_documentURIForResourcePath:", a3), 0);
}

- (id)p_infoDictionary
{
  id v3;
  void *v4;
  CFPropertyListRef v5;
  CFTypeID v6;
  CFPropertyListRef v7;
  CFErrorRef error;

  if (!-[PFXFrameSpec infoDictionary](self, "infoDictionary"))
  {
    v3 = -[PFXFrameSpec newDataWithBundleResource:](self, "newDataWithBundleResource:", objc_msgSend(*(id *)&self->TSDFrameSpec_opaque[OBJC_IVAR___TSDFrameSpec_mBundle], "pathForResource:ofType:", CFSTR("index"), CFSTR("plist")));
    if (v3)
    {
      v4 = v3;
      error = 0;
      v5 = CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)v3, 0, 0, &error);

      if (v5)
      {
        v6 = CFGetTypeID(v5);
        if (v6 == CFDictionaryGetTypeID())
          v7 = v5;
        else
          v7 = 0;
        -[PFXFrameSpec setInfoDictionary:](self, "setInfoDictionary:", v7);
        CFRelease(v5);
      }
    }
  }
  return -[PFXFrameSpec infoDictionary](self, "infoDictionary");
}

- (id)p_imageDataForKey:(id)a3
{
  id result;

  result = objc_msgSend(-[PFXFrameSpec p_infoDictionary](self, "p_infoDictionary"), "objectForKey:", a3);
  if (result)
    return +[TSPData dataFromDocumentURI:context:](TSPData, "dataFromDocumentURI:context:", -[PFXFrameSpec p_documentURIForResourcePath:](self, "p_documentURIForResourcePath:", objc_msgSend(objc_msgSend(*(id *)&self->TSDFrameSpec_opaque[OBJC_IVAR___TSDFrameSpec_mBundle], "resourcePath"), "stringByAppendingPathComponent:", result)), self->mTSPContext);
  return result;
}

- (id)p_documentURIForResourcePath:(id)a3
{
  id v3;
  uint64_t v5;

  v3 = a3;
  v5 = OBJC_IVAR___TSDFrameSpec_mBundle;
  if (objc_msgSend(a3, "hasPrefix:", objc_msgSend(*(id *)&self->TSDFrameSpec_opaque[OBJC_IVAR___TSDFrameSpec_mBundle], "bundlePath")))v3 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(objc_msgSend(*(id *)&self->TSDFrameSpec_opaque[v5], "bundlePath"), "length"));
  return -[NSString stringByAppendingPathComponent:](self->mBundleBasePath, "stringByAppendingPathComponent:", v3);
}

@end
