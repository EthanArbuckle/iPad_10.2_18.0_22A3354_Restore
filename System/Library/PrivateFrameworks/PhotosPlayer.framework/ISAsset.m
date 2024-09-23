@implementation ISAsset

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)ISAsset;
  -[ISAsset description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tPhoto: %@"), -[ISAsset photo](self, "photo"));
  -[ISAsset videoAsset](self, "videoAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tVideo: %@"), v6);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  CGImageRelease(self->_photo);
  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performDeferredDealloc:", self->_videoAsset);

  v4.receiver = self;
  v4.super_class = (Class)ISAsset;
  -[ISAsset dealloc](&v4, sel_dealloc);
}

- (ISAsset)init
{
  return -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", 0, 0, 0, 0, 0.0);
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 options:(unint64_t)a6
{
  return -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", a3, a4, 0, a6, a5);
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5
{
  return -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", a3, a4, 0, 0, a5);
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6
{
  return -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", a3, a4, *(_QWORD *)&a6, 0, a5);
}

- (ISAsset)initWithVideoAsset:(id)a3 photo:(CGImage *)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7
{
  id v12;
  ISAsset *v13;
  uint64_t v14;
  AVAsset *videoAsset;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ISAsset;
  v13 = -[ISAsset init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    videoAsset = v13->_videoAsset;
    v13->_videoAsset = (AVAsset *)v14;

    v13->_photo = CGImageRetain(a4);
    v13->_photoTime = a5;
    v13->_photoEXIFOrientation = a6;
    v13->_options = a7;
  }

  return v13;
}

- (ISAsset)initWithVideoAsset:(id)a3 UIImage:(id)a4 photoTime:(double)a5 photoEXIFOrientation:(int)a6 options:(unint64_t)a7
{
  uint64_t v8;
  id v12;
  id v13;
  ISAsset *v14;

  v8 = *(_QWORD *)&a6;
  v12 = objc_retainAutorelease(a4);
  v13 = a3;
  v14 = -[ISAsset initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:](self, "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:options:", v13, objc_msgSend(v12, "CGImage"), v8, a7, a5);

  if (v14)
    objc_storeStrong(&v14->_UIImage, v12);

  return v14;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoCMTime
{
  Float64 v4;

  -[ISAsset photoTime](self, "photoTime");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 1000);
}

- (void)resetAVObjects
{
  void *v3;
  AVAsset *v4;
  AVAsset *videoAsset;
  id v6;

  -[ISAsset videoAsset](self, "videoAsset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v3);
    v4 = (AVAsset *)objc_claimAutoreleasedReturnValue();
    videoAsset = self->_videoAsset;
    self->_videoAsset = v4;

  }
}

- (BOOL)hasColorAdjustments
{
  return -[ISAsset options](self, "options") & 1;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (CGImage)photo
{
  return self->_photo;
}

- (double)photoTime
{
  return self->_photoTime;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong(&self->_UIImage, 0);
}

+ (id)assetForURL:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double Seconds;
  uint64_t v20;
  uint64_t v21;
  CMTime v23;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0D75318];
    v7 = a3;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithBundleAtURL:", v7);

    objc_msgSend(v8, "imagePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "imageDisplayTime");
      flags = v23.flags;
      epoch = v23.epoch;
    }
    else
    {
      epoch = 0;
      flags = 0;
      memset(&v23, 0, sizeof(v23));
    }
    value = v23.value;
    timescale = v23.timescale;
    if (v9)
    {
      v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", v9));
      v15 = objc_msgSend(v14, "CGImage");
      if (v15)
      {
        v16 = v15;
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          Seconds = 0.0;
          if ((flags & 1) != 0)
          {
            v23.value = value;
            v23.timescale = timescale;
            v23.flags = flags;
            v23.epoch = epoch;
            Seconds = CMTimeGetSeconds(&v23);
          }

        }
        else
        {
          v18 = 0;
          Seconds = 0.0;
        }
        v20 = objc_msgSend(v14, "imageOrientation", v23.value, *(_QWORD *)&v23.timescale, v23.epoch);
        if ((unint64_t)(v20 - 1) > 6)
          v21 = 1;
        else
          v21 = qword_1D2DF5038[v20 - 1];
        v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:", v18, v16, v21, Seconds);

      }
      else
      {
        v13 = 0;
        if (a4)
          *a4 = 0;
      }

    }
    else
    {
      v13 = 0;
      if (a4)
        *a4 = 0;
    }

  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = 0;
  }
  return v13;
}

@end
