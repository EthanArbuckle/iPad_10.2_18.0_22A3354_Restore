@implementation ISPlayerContent

- (ISPlayerContent)initWithPhoto:(CGImage *)a3 photoIsOriginal:(BOOL)a4 photoEXIFOrientation:(int)a5 photoTime:(id *)a6 videoDuration:(id *)a7 photoHasColorAdjustments:(BOOL)a8 videoPlayerItem:(id)a9 variationIdentifier:(id)a10 supportsVitality:(BOOL)a11
{
  id v17;
  id v18;
  char *v19;
  int64_t var3;
  int64_t v21;
  objc_super v24;

  v17 = a9;
  v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)ISPlayerContent;
  v19 = -[ISPlayerContent init](&v24, sel_init);
  if (v19)
  {
    *((_QWORD *)v19 + 2) = CGImageRetain(a3);
    *((_DWORD *)v19 + 3) = a5;
    v19[8] = a8;
    var3 = a6->var3;
    *(_OWORD *)(v19 + 40) = *(_OWORD *)&a6->var0;
    *((_QWORD *)v19 + 7) = var3;
    v21 = a7->var3;
    *((_OWORD *)v19 + 4) = *(_OWORD *)&a7->var0;
    *((_QWORD *)v19 + 10) = v21;
    objc_storeStrong((id *)v19 + 3, a9);
    v19[9] = a4;
    objc_storeStrong((id *)v19 + 4, a10);
    v19[10] = a11;
  }

  return (ISPlayerContent *)v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  CGImageRelease(self->_photo);
  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performDeferredDealloc:", self->_videoPlayerItem);

  v4.receiver = self;
  v4.super_class = (Class)ISPlayerContent;
  -[ISPlayerContent dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  CGImage *photo;
  BOOL v8;
  AVPlayerItem *videoPlayerItem;
  AVPlayerItem *v11;
  int photoHasColorAdjustments;
  int photoIsOriginal;
  NSNumber *variationIdentifier;
  NSNumber *v15;
  NSNumber *v16;
  int supportsVitality;
  CMTime v18;
  CMTime time1;
  CMTime time2;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    photo = self->_photo;
    if (photo != (CGImage *)objc_msgSend(v6, "photo"))
      goto LABEL_8;
    if (v6)
      objc_msgSend(v6, "photoTime");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = (CMTime)self->_photoTime;
    if (CMTimeCompare(&time1, &time2))
    {
LABEL_8:
      v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
    videoPlayerItem = self->_videoPlayerItem;
    objc_msgSend(v6, "videoPlayerItem");
    v11 = (AVPlayerItem *)objc_claimAutoreleasedReturnValue();
    if (videoPlayerItem != v11)
      goto LABEL_21;
    photoHasColorAdjustments = self->_photoHasColorAdjustments;
    if (photoHasColorAdjustments != objc_msgSend(v6, "photoHasColorAdjustments"))
      goto LABEL_21;
    if (v6)
      objc_msgSend(v6, "videoDuration");
    else
      memset(&v18, 0, sizeof(v18));
    time1 = (CMTime)self->_videoDuration;
    if (CMTimeCompare(&time1, &v18)
      || (photoIsOriginal = self->_photoIsOriginal, photoIsOriginal != objc_msgSend(v6, "photoIsOriginal")))
    {
LABEL_21:
      v8 = 0;
LABEL_22:

      goto LABEL_9;
    }
    variationIdentifier = self->_variationIdentifier;
    objc_msgSend(v6, "variationIdentifier");
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (variationIdentifier == v15
      || (v16 = self->_variationIdentifier,
          objc_msgSend(v6, "variationIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSNumber isEqual:](v16, "isEqual:", v3)))
    {
      supportsVitality = self->_supportsVitality;
      v8 = supportsVitality == objc_msgSend(v6, "supportsVitality");
      if (variationIdentifier == v15)
      {
LABEL_25:

        goto LABEL_22;
      }
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_25;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  unint64_t v5;
  char *v6;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ISPlayerContent;
  v3 = -[ISPlayerContent hash](&v9, sel_hash);
  v4 = &v3[-[AVPlayerItem hash](self->_videoPlayerItem, "hash") + self->_photoHasColorAdjustments];
  videoDuration = self->_videoDuration;
  v5 = (unint64_t)(CMTimeGetSeconds((CMTime *)&videoDuration) * 10000.0);
  v6 = &v4[self->_photoIsOriginal];
  return (unint64_t)&v6[-[NSNumber hash](self->_variationIdentifier, "hash") + self->_supportsVitality + v5];
}

- (CGImage)photo
{
  return self->_photo;
}

- (int)photoEXIFOrientation
{
  return self->_photoEXIFOrientation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (AVPlayerItem)videoPlayerItem
{
  return self->_videoPlayerItem;
}

- (BOOL)photoHasColorAdjustments
{
  return self->_photoHasColorAdjustments;
}

- (BOOL)photoIsOriginal
{
  return self->_photoIsOriginal;
}

- (BOOL)supportsVitality
{
  return self->_supportsVitality;
}

- (NSNumber)variationIdentifier
{
  return self->_variationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variationIdentifier, 0);
  objc_storeStrong((id *)&self->_videoPlayerItem, 0);
}

@end
