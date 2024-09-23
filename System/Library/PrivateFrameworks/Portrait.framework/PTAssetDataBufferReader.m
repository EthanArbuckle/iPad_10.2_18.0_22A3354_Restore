@implementation PTAssetDataBufferReader

- (PTAssetDataBufferReader)initWithURL:(id)a3
{
  id v4;
  PTAssetDataBufferReader *v5;
  uint64_t v6;
  NSURL *dataURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAssetDataBufferReader;
  v5 = -[PTAssetDataBufferReader init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataURL = v5->_dataURL;
    v5->_dataURL = (NSURL *)v6;

  }
  return v5;
}

- (BOOL)startReadingWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  NSURL *dataURL;
  NSURL *v9;
  NSURL *movieURL;
  void *v12;
  void *v13;
  int v14;
  NSURL *v15;
  NSURL *v16;
  NSURL *sequenceURL;
  void *v18;
  void *v19;
  BOOL v20;
  NSURL *v21;
  void *v22;
  void *v23;

  -[NSURL pathExtension](self->_dataURL, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_movieExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  dataURL = self->_dataURL;
  if (v7)
  {
    v9 = (NSURL *)-[NSURL copy](dataURL, "copy");
    movieURL = self->_movieURL;
    self->_movieURL = v9;

    return -[PTAssetDataBufferReader _startReadingMovieWithError:](self, "_startReadingMovieWithError:", a3);
  }
  else
  {
    -[NSURL pathExtension](dataURL, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_sequenceExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    v15 = self->_dataURL;
    if (v14)
    {
      v16 = (NSURL *)-[NSURL copy](self->_dataURL, "copy");
      sequenceURL = self->_sequenceURL;
      self->_sequenceURL = v16;

      return -[PTAssetDataBufferReader _startReadingSequenceWithError:](self, "_startReadingSequenceWithError:", a3);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_movieFilename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:](v15, "URLByAppendingPathComponent:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0))
      {
        objc_storeStrong((id *)&self->_movieURL, v19);
        v20 = -[PTAssetDataBufferReader _startReadingMovieWithError:](self, "_startReadingMovieWithError:", a3);
      }
      else
      {
        v21 = self->_dataURL;
        objc_msgSend((id)objc_opt_class(), "_sequenceDirectoryName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL URLByAppendingPathComponent:](v21, "URLByAppendingPathComponent:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "checkResourceIsReachableAndReturnError:", 0))
        {
          objc_storeStrong((id *)&self->_sequenceURL, v23);
          v20 = -[PTAssetDataBufferReader _startReadingSequenceWithError:](self, "_startReadingSequenceWithError:", a3);
        }
        else
        {
          _ErrorForDataBufferNotFoundAtURL(self->_dataURL);
          v20 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      return v20;
    }
  }
}

- (BOOL)_startReadingSequenceWithError:(id *)a3
{
  NSURL *sequenceURL;
  NSURL *v6;
  NSURL *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSString *v15;
  NSString *filenameFormat;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NSURL *dataURL;
  id v23;
  BOOL result;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  id v33;

  sequenceURL = self->_sequenceURL;
  if (!sequenceURL)
    goto LABEL_11;
  v6 = sequenceURL;
  v33 = 0;
  if (!-[NSURL getResourceValue:forKey:error:](v6, "getResourceValue:forKey:error:", &v33, *MEMORY[0x1E0C999D0], 0)
    || (objc_msgSend(v33, "BOOLValue") & 1) == 0)
  {
    _ErrorForDataBufferNotFoundAtURL(v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    dataURL = self->_sequenceURL;
    if (dataURL)
    {
LABEL_12:
      _ErrorForDataBufferNotFoundAtURL(dataURL);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v23;
      return result;
    }
LABEL_11:
    dataURL = self->_dataURL;
    goto LABEL_12;
  }

  v7 = self->_sequenceURL;
  objc_msgSend((id)objc_opt_class(), "_sequenceInfoFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "open");
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithStream:options:error:", v11, 0, &v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v33;
  if (v13)
  {
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTAssetDataBufferReader _startReadingSequenceWithError:].cold.1((uint64_t)v10, (uint64_t)v13, v14);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("filename-format"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  filenameFormat = self->_filenameFormat;
  self->_filenameFormat = v15;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("vector3-format"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isVector3Format = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pixel-format"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pixel-format"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 0;
    objc_msgSend(v20, "getBytes:length:", &v33, 4);
    v21 = bswap32(v33);

    self->_pixelFormat = v21;
  }
  else
  {
    -[NSString pathExtension](self->_filenameFormat, "pathExtension");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E8252F20, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "unsignedIntegerValue");

    self->_pixelFormat = v27;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("width"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  self->_width = objc_msgSend(v28, "unsignedIntegerValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("height"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  self->_height = objc_msgSend(v29, "unsignedIntegerValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("frames-per-second"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  if (v31 == 0.0)
    v31 = 30.0;
  self->_framesPerSecond = v31;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("frame-start"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_nextIndex = objc_msgSend(v32, "unsignedIntegerValue");

  return 1;
}

- (BOOL)_startReadingMovieWithError:(id *)a3
{
  void *v5;
  AVAssetReader *v6;
  id v7;
  AVAssetReader *assetReader;
  id v9;
  void *v10;
  void *v11;
  AVAssetReaderTrackOutput *v12;
  AVAssetReaderTrackOutput *disparityTrackOutput;
  BOOL v14;
  AVAssetReader *v15;
  id v17;

  if (self->_movieURL)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v6 = (AVAssetReader *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v5, &v17);
    v7 = v17;
    assetReader = self->_assetReader;
    self->_assetReader = v6;

    if (self->_assetReader)
    {
      v9 = objc_alloc(MEMORY[0x1E0C8B000]);
      objc_msgSend(v5, "tracks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (AVAssetReaderTrackOutput *)objc_msgSend(v9, "initWithTrack:outputSettings:", v11, 0);
      disparityTrackOutput = self->_disparityTrackOutput;
      self->_disparityTrackOutput = v12;

      -[AVAssetReaderTrackOutput setAlwaysCopiesSampleData:](self->_disparityTrackOutput, "setAlwaysCopiesSampleData:", 1);
      -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", self->_disparityTrackOutput);
      if (-[AVAssetReader startReading](self->_assetReader, "startReading"))
      {
        self->_nextIndex = 0;
        v14 = 1;
LABEL_8:

        return v14;
      }
      v15 = self->_assetReader;
      self->_assetReader = 0;

    }
    v14 = 0;
    goto LABEL_8;
  }
  _ErrorForDataBufferNotFoundAtURL(self->_dataURL);
  v14 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (__CVBuffer)_copyPixelBufferFromURL:(id)a3
{
  id v4;
  const __CFAllocator *v5;
  size_t width;
  size_t height;
  OSType pixelFormat;
  id v9;
  uint64_t v10;
  __CVBuffer *v11;
  char *v12;
  _BOOL4 isVector3Format;
  signed int PixelFormatType;
  size_t v15;
  size_t v16;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v19;
  size_t v20;
  FILE *v21;
  FILE *v22;
  void *v23;
  uint64_t j;
  char *v25;
  size_t v26;
  _WORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t i;
  char *v34;
  size_t v35;
  _DWORD *v36;
  __CVBuffer *v37;
  _BOOL4 DataVec;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pixelBufferOut = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  width = self->_width;
  height = self->_height;
  pixelFormat = self->_pixelFormat;
  v41 = *MEMORY[0x1E0CA8FF0];
  v42[0] = MEMORY[0x1E0C9AA70];
  CVPixelBufferCreate(v5, width, height, pixelFormat, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1), &pixelBufferOut);
  v9 = objc_retainAutorelease(v4);
  v10 = objc_msgSend(v9, "fileSystemRepresentation");
  if (!v10)
    goto LABEL_35;
  v11 = pixelBufferOut;
  if (!pixelBufferOut)
    goto LABEL_35;
  v12 = (char *)v10;
  isVector3Format = self->_isVector3Format;
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBufferOut);
  v15 = CVPixelBufferGetWidth(v11);
  v16 = CVPixelBufferGetHeight(v11);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v11);
  CVPixelBufferLockBaseAddress(v11, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v11);
  v19 = BaseAddress;
  if (PixelFormatType <= 1380410944)
  {
    if (PixelFormatType == 1278226534)
    {
      v20 = 4;
      goto LABEL_19;
    }
    if (PixelFormatType == 1278226536)
    {
      v20 = 2;
LABEL_19:
      v28 = BytesPerRow;
      v29 = v15;
      v30 = v16;
      v31 = 1;
      goto LABEL_20;
    }
    goto LABEL_32;
  }
  if (PixelFormatType == 1380410945)
  {
    if (!isVector3Format)
    {
      DataVec = LoadDataVec(BaseAddress, 4uLL, BytesPerRow, v15, v16, 4, v12);
      CVPixelBufferUnlockBaseAddress(v11, 1uLL);
      if (!DataVec)
        goto LABEL_35;
      goto LABEL_31;
    }
    v21 = fopen(v12, "r");
    if (v21)
    {
      v22 = v21;
      v23 = malloc_type_calloc(3 * v15, 4uLL, 0x100004052888210uLL);
      if (v16)
      {
        for (i = 0; i != v16; ++i)
        {
          fread(v23, 4uLL, 3 * v15, v22);
          if (v15)
          {
            v34 = &v19[i * BytesPerRow];
            v35 = v15;
            v36 = v23;
            do
            {
              *(_DWORD *)v34 = *v36;
              *((_DWORD *)v34 + 1) = v36[1];
              *((_DWORD *)v34 + 2) = v36[2];
              *((_DWORD *)v34 + 3) = 0;
              v36 += 3;
              v34 += 16;
              --v35;
            }
            while (v35);
          }
        }
      }
      goto LABEL_30;
    }
LABEL_33:
    fclose(v21);
    goto LABEL_34;
  }
  if (PixelFormatType != 1380411457)
  {
LABEL_32:
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Unknown data buffer pixel format: 0x%08x\n", PixelFormatType);
LABEL_34:
    CVPixelBufferUnlockBaseAddress(v11, 1uLL);
LABEL_35:
    CVPixelBufferRelease(pixelBufferOut);
    v37 = 0;
    goto LABEL_36;
  }
  if (isVector3Format)
  {
    v21 = fopen(v12, "r");
    if (v21)
    {
      v22 = v21;
      v23 = malloc_type_calloc(3 * v15, 2uLL, 0x1000040BDFB0063uLL);
      if (v16)
      {
        for (j = 0; j != v16; ++j)
        {
          fread(v23, 2uLL, 3 * v15, v22);
          if (v15)
          {
            v25 = &v19[j * BytesPerRow];
            v26 = v15;
            v27 = v23;
            do
            {
              *(_WORD *)v25 = *v27;
              *((_WORD *)v25 + 1) = v27[1];
              *((_WORD *)v25 + 2) = v27[2];
              *((_WORD *)v25 + 3) = 0;
              v27 += 3;
              v25 += 8;
              --v26;
            }
            while (v26);
          }
        }
      }
LABEL_30:
      free(v23);
      fclose(v22);
      CVPixelBufferUnlockBaseAddress(v11, 1uLL);
      goto LABEL_31;
    }
    goto LABEL_33;
  }
  v20 = 2;
  v28 = BytesPerRow;
  v29 = v15;
  v30 = v16;
  v31 = 4;
LABEL_20:
  v32 = LoadDataVec(BaseAddress, v20, v28, v29, v30, v31, v12);
  CVPixelBufferUnlockBaseAddress(v11, 1uLL);
  if (!v32)
    goto LABEL_35;
LABEL_31:
  v37 = pixelBufferOut;
LABEL_36:

  return v37;
}

- (id)_frameInstance
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "frameClass"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PTAssetDataBufferReader _frameInstance].cold.1((uint64_t)self, v5);

    v4 = 0;
  }

  return v4;
}

- (id)_copyNextFrame_sequence
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CMTime v8;
  CMTime v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", self->_filenameFormat, self->_nextIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_sequenceURL, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTAssetDataBufferReader _frameInstance](self, "_frameInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIndex:", self->_nextIndex);
  CMTimeMake(&v9, self->_nextIndex, (int)self->_framesPerSecond);
  v8 = v9;
  objc_msgSend(v5, "setTime:", &v8);
  objc_msgSend(v5, "setDataBuffer:", -[PTAssetDataBufferReader _copyPixelBufferFromURL:](self, "_copyPixelBufferFromURL:", v4));
  if (objc_msgSend(v5, "dataBuffer"))
  {
    ++self->_nextIndex;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_copyNextFrame_movie
{
  opaqueCMSampleBuffer *v3;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v5;
  id v6;
  CMTime v8;
  CMTime v9;

  v3 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_disparityTrackOutput, "copyNextSampleBuffer");
  ImageBuffer = CMSampleBufferGetImageBuffer(v3);
  if (!v3)
    return 0;
  v5 = ImageBuffer;
  if (!ImageBuffer)
  {
    if (self->_nextIndex
      || (CFRelease(v3),
          v3 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_disparityTrackOutput, "copyNextSampleBuffer"), (v5 = CMSampleBufferGetImageBuffer(v3)) == 0))
    {
      CFRelease(v3);
      return 0;
    }
  }
  v6 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "frameClass"));
  ++self->_nextIndex;
  objc_msgSend(v6, "setIndex:");
  CMSampleBufferGetPresentationTimeStamp(&v9, v3);
  v8 = v9;
  objc_msgSend(v6, "setTime:", &v8);
  objc_msgSend(v6, "setDataBuffer:", CVPixelBufferRetain(v5));
  CFRelease(v3);
  return v6;
}

- (id)copyNextFrame
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v7;

  v3 = (void *)MEMORY[0x1CAA3ACDC](self, a2);
  if (self->_sequenceURL)
  {
    v4 = -[PTAssetDataBufferReader _copyNextFrame_sequence](self, "_copyNextFrame_sequence");
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (self->_assetReader)
  {
    v4 = -[PTAssetDataBufferReader _copyNextFrame_movie](self, "_copyNextFrame_movie");
    goto LABEL_5;
  }
  _PTLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[PTAssetDataBufferReader copyNextFrame].cold.1(v7);

  v5 = 0;
LABEL_6:
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)globals
{
  return 0;
}

+ (Class)frameClass
{
  return (Class)objc_opt_class();
}

+ (NSString)_movieFilename
{
  return (NSString *)CFSTR("dataBuffers.mov");
}

+ (NSString)_sequenceDirectoryName
{
  return (NSString *)CFSTR("dataBuffers.sequence");
}

+ (NSString)_movieExtension
{
  return (NSString *)CFSTR("mov");
}

+ (NSString)_sequenceExtension
{
  return (NSString *)CFSTR("sequence");
}

+ (NSString)_sequenceInfoFilename
{
  return (NSString *)CFSTR("sequenceInfo.json");
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (NSURL)sequenceURL
{
  return self->_sequenceURL;
}

- (unint64_t)nextIndex
{
  return self->_nextIndex;
}

- (void)setNextIndex:(unint64_t)a3
{
  self->_nextIndex = a3;
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
  objc_storeStrong((id *)&self->_assetReader, a3);
}

- (AVAssetReaderTrackOutput)disparityTrackOutput
{
  return self->_disparityTrackOutput;
}

- (void)setDisparityTrackOutput:(id)a3
{
  objc_storeStrong((id *)&self->_disparityTrackOutput, a3);
}

- (NSString)filenameFormat
{
  return self->_filenameFormat;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (float)framesPerSecond
{
  return self->_framesPerSecond;
}

- (BOOL)isVector3Format
{
  return self->_isVector3Format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameFormat, 0);
  objc_storeStrong((id *)&self->_disparityTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_sequenceURL, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
}

- (void)_startReadingSequenceWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, a3, (uint64_t)a3, "error reading %@: %@", (uint8_t *)&v3);
}

- (void)_frameInstance
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "frameClass");
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_0_8(&dword_1C9281000, a2, v7, "frameClass %@ is not a subclass of %@", (uint8_t *)&v8);

}

- (void)copyNextFrame
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Be sure to call startReadingWithError: before decoding frames.", v1, 2u);
}

@end
