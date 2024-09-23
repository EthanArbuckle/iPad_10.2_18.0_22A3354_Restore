@implementation PFColorConverter

- (void)convertWithVideoURL:(id)a3 outURL:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  PFAVReaderWriter *v15;
  PFAVReaderWriter *readerWriter;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[PFAVReaderWriter initWithAsset:]([PFAVReaderWriter alloc], "initWithAsset:", v14);
    readerWriter = self->_readerWriter;
    self->_readerWriter = v15;

    -[PFAVReaderWriter setDelegate:](self->_readerWriter, "setDelegate:", self);
    -[PFAVReaderWriter writeToURL:progress:completion:](self->_readerWriter, "writeToURL:progress:completion:", v11, v12, v13);
  }
  else if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load video at url: %@"), v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PFColorConverterErrorDomain"), 42, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v13[2](v13, 0, v20);
  }

}

- (void)adjustPixelBuffer:(__CVBuffer *)a3 toOutputBuffer:(__CVBuffer *)a4
{
  CGColorSpace *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CIContext *v13;
  CIContext *conversionContext;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGColorSpace *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  v8 = (void *)MEMORY[0x1E0C9DDC8];
  v26 = *MEMORY[0x1E0C9E110];
  v27[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithCVPixelBuffer:options:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CGColorSpaceRelease(v7);
  if (!self->_conversionContext)
  {
    v11 = (void *)MEMORY[0x1E0C9DD90];
    v24 = *MEMORY[0x1E0C9DF88];
    v25 = CFSTR("PFColorConverter-adjustPixelBuffer");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextWithOptions:", v12);
    v13 = (CIContext *)objc_claimAutoreleasedReturnValue();
    conversionContext = self->_conversionContext;
    self->_conversionContext = v13;

  }
  objc_msgSend(v10, "extent");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self->_conversionContext, "render:toCVPixelBuffer:bounds:colorSpace:", v10, a4, v23, v16, v18, v20, v22);
  CGColorSpaceRelease(v23);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionContext, 0);
  objc_storeStrong((id *)&self->_readerWriter, 0);
}

@end
