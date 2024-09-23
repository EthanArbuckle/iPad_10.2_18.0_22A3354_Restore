@implementation TVPExternalImagePlayer

- (TVPExternalImagePlayer)initWithMediaItem:(id)a3 referenceTime:(id *)a4 forDate:(id)a5
{
  id v9;
  id v10;
  TVPExternalImagePlayer *v11;
  TVPExternalImagePlayer *v12;
  uint64_t v13;
  int64_t var3;
  NSMutableArray *v15;
  NSMutableArray *imageInfosBeingLoaded;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TVPExternalImagePlayer;
  v11 = -[TVPExternalImagePlayer init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaItem, a3);
    v13 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v12->_elapsedTime.value = *MEMORY[0x24BDC0D88];
    v12->_elapsedTime.epoch = *(_QWORD *)(v13 + 16);
    var3 = a4->var3;
    *(_OWORD *)&v12->_referenceTime.value = *(_OWORD *)&a4->var0;
    v12->_referenceTime.epoch = var3;
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    imageInfosBeingLoaded = v12->_imageInfosBeingLoaded;
    v12->_imageInfosBeingLoaded = v15;

  }
  return v12;
}

- (void)setRate:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TVPExternalImageLoader *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_rate != a3)
  {
    self->_rate = a3;
    if (a3 == 0.0)
    {
      -[TVPExternalImagePlayer displayLink](self, "displayLink");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invalidate");

      -[TVPExternalImagePlayer setDisplayLink:](self, "setDisplayLink:", 0);
      -[TVPExternalImagePlayer setPreviousTimestamp:](self, "setPreviousTimestamp:", 0.0);
      -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllObjects");

      -[TVPExternalImagePlayer imageLoader](self, "imageLoader");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidate");

      -[TVPExternalImagePlayer setImageLoader:](self, "setImageLoader:", 0);
      -[TVPExternalImagePlayer setCurrentImage:](self, "setCurrentImage:", 0);
    }
    else
    {
      -[TVPExternalImagePlayer imageLoader](self, "imageLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[TVPExternalImagePlayer mediaItem](self, "mediaItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExternalImageConfig"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = -[TVPExternalImageLoader initWithConfig:]([TVPExternalImageLoader alloc], "initWithConfig:", v9);
          -[TVPExternalImagePlayer setImageLoader:](self, "setImageLoader:", v10);

        }
      }
      -[TVPExternalImagePlayer _cancelAllImageLoads](self, "_cancelAllImageLoads");
      -[TVPExternalImagePlayer _updateImageIntervalWithRate:](self, "_updateImageIntervalWithRate:", self->_rate);
      -[TVPExternalImagePlayer _loadImagesIfNecessary](self, "_loadImagesIfNecessary");
      -[TVPExternalImagePlayer displayLink](self, "displayLink");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel__displayLinkTimerFired_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPreferredFramesPerSecond:", 30);
        -[TVPExternalImagePlayer setDisplayLink:](self, "setDisplayLink:", v13);
        objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addToRunLoop:forMode:", v12, *MEMORY[0x24BDBCB80]);

      }
    }
  }
}

- (void)setElapsedTime:(id *)a3
{
  __int128 v3;

  if ((a3->var2 & 0x1D) == 1)
  {
    v3 = *(_OWORD *)&a3->var0;
    self->_elapsedTime.epoch = a3->var3;
    *(_OWORD *)&self->_elapsedTime.value = v3;
  }
}

- (void)invalidate
{
  -[TVPExternalImagePlayer setRate:](self, "setRate:", 0.0);
}

- (void)_displayLinkTimerFired:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double Seconds;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  _QWORD *v26;
  void (*v27)(_QWORD *, CMTime *, CMTime *, void *);
  CMTime v28;
  CMTime rhs;
  CMTime v30;
  CMTime time;
  CMTime v32;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  -[TVPExternalImagePlayer previousTimestamp](self, "previousTimestamp");
  if (v7 == 0.0)
    v8 = v6 + -1.0 / (double)objc_msgSend(v4, "preferredFramesPerSecond");
  else
    v8 = v7;
  memset(&v32, 0, sizeof(v32));
  -[TVPExternalImagePlayer elapsedTime](self, "elapsedTime");
  time = v32;
  Seconds = CMTimeGetSeconds(&time);
  -[TVPExternalImagePlayer rate](self, "rate");
  v11 = Seconds + (v6 - v8) * v10;
  memset(&time, 0, sizeof(time));
  CMTimeMakeWithSeconds(&time, v11, 1000000);
  -[TVPExternalImagePlayer referenceDate](self, "referenceDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    memset(&v30, 0, sizeof(v30));
    -[TVPExternalImagePlayer referenceTime](self, "referenceTime");
    v28 = time;
    CMTimeSubtract(&v30, &v28, &rhs);
    v28 = v30;
    objc_msgSend(v12, "dateByAddingTimeInterval:", CMTimeGetSeconds(&v28));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v30 = time;
  -[TVPExternalImagePlayer setElapsedTime:](self, "setElapsedTime:", &v30);
  -[TVPExternalImagePlayer setPlaybackDate:](self, "setPlaybackDate:", v13);
  -[TVPExternalImagePlayer setPreviousTimestamp:](self, "setPreviousTimestamp:", v6);
  -[TVPExternalImagePlayer _timeAfterRemovingInterstitials:](self, "_timeAfterRemovingInterstitials:", Seconds);
  v15 = v14;
  -[TVPExternalImagePlayer _timeAfterRemovingInterstitials:](self, "_timeAfterRemovingInterstitials:", v11);
  v17 = v16;
  if (floor(v16) != floor(v15))
  {
    -[TVPExternalImagePlayer _cancelStaleImageLoadsForTime:](self, "_cancelStaleImageLoadsForTime:", v16);
    -[TVPExternalImagePlayer imageLoader](self, "imageLoader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPExternalImagePlayer imageInterval](self, "imageInterval");
    objc_msgSend(v18, "closestImageTimeForTime:imageInterval:", v17, v19);
    v21 = v20;
    -[TVPExternalImagePlayer currentImageTime](self, "currentImageTime");
    if (v22 != v21 && objc_msgSend(v18, "imageIsLoadedForTime:", v21))
    {
      objc_msgSend(v18, "loadedImageForTime:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[TVPExternalImagePlayer setCurrentImage:](self, "setCurrentImage:", v23);
        -[TVPExternalImagePlayer imageUpdateBlock](self, "imageUpdateBlock");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[TVPExternalImagePlayer imageUpdateBlock](self, "imageUpdateBlock");
          v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v25)[2](v25, v23);

        }
        -[TVPExternalImagePlayer setCurrentImageTime:](self, "setCurrentImageTime:", v21);
      }

    }
  }
  -[TVPExternalImagePlayer elapsedTimeUpdateBlock](self, "elapsedTimeUpdateBlock");
  v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[TVPExternalImagePlayer rate](self, "rate");
    v27 = (void (*)(_QWORD *, CMTime *, CMTime *, void *))v26[2];
    v30 = time;
    v28 = v32;
    v27(v26, &v30, &v28, v13);
  }

}

- (void)_loadImagesIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double j;
  TVPPlaybackImageLoadInfo *v14;
  double v15;
  double i;
  TVPPlaybackImageLoadInfo *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTime time;
  CMTime v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[TVPExternalImagePlayer imageLoader](self, "imageLoader");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[TVPExternalImagePlayer rate](self, "rate");
    v4 = v3;
    memset(&v42, 0, sizeof(v42));
    -[TVPExternalImagePlayer elapsedTime](self, "elapsedTime");
    time = v42;
    -[TVPExternalImagePlayer _timeAfterRemovingInterstitials:](self, "_timeAfterRemovingInterstitials:", CMTimeGetSeconds(&time));
    v6 = v5;
    -[TVPExternalImagePlayer imageInterval](self, "imageInterval");
    objc_msgSend(v32, "closestImageTimeForTime:imageInterval:", v4 + v6, v7);
    v9 = v8;
    -[TVPExternalImagePlayer imageInterval](self, "imageInterval");
    v11 = v10;
    v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v4 <= 0.0)
    {
      objc_msgSend(v32, "firstImageTime");
      for (i = v15; v9 >= i; v9 = v9 - v11)
      {
        if ((objc_msgSend(v32, "imageIsLoadedForTime:", v9, v31) & 1) == 0)
        {
          v17 = objc_alloc_init(TVPPlaybackImageLoadInfo);
          -[TVPPlaybackImageLoadInfo setRequestedTime:](v17, "setRequestedTime:", v9);
          objc_msgSend(v31, "addObject:", v17);

        }
      }
    }
    else
    {
      objc_msgSend(v32, "lastImageTime");
      for (j = v12; v9 <= j; v9 = v11 + v9)
      {
        if ((objc_msgSend(v32, "imageIsLoadedForTime:", v9, v31) & 1) == 0)
        {
          v14 = objc_alloc_init(TVPPlaybackImageLoadInfo);
          -[TVPPlaybackImageLoadInfo setRequestedTime:](v14, "setRequestedTime:", v9);
          objc_msgSend(v31, "addObject:", v14);

        }
      }
    }
    v18 = v31;
    if (v31)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v19 = v31;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v38;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v38 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v22);
            -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded", v31);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "indexOfObject:inSortedRange:options:usingComparator:", v23, 0, objc_msgSend(v25, "count"), 1024, &__block_literal_global_7);

            -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "insertObject:atIndex:", v23, v26);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v20);
      }

      objc_initWeak((id *)&time, self);
      objc_msgSend(v19, "valueForKey:", CFSTR("requestedTime"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2;
      v35[3] = &unk_24F15BE60;
      objc_copyWeak(&v36, (id *)&time);
      objc_msgSend(v32, "loadImagesForTimes:maxSize:withHandler:", v28, v35, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v33[0] = v29;
      v33[1] = 3221225472;
      v33[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2_11;
      v33[3] = &unk_24F15BE88;
      v34 = v19;
      objc_msgSend(v30, "enumerateObjectsUsingBlock:", v33);

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)&time);
      v18 = v31;
    }

  }
}

uint64_t __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "requestedTime");
  v7 = v6;
  objc_msgSend(v5, "requestedTime");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "requestedTime");
    v11 = v10;
    objc_msgSend(v5, "requestedTime");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a2;
  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "imageInfosBeingLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_8;
  v14[3] = &unk_24F15BE38;
  v10 = v5;
  v15 = v10;
  v16 = &v24;
  v17 = &v18;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v11 = (void *)v19[5];
  if (v11)
  {
    objc_msgSend(v11, "setIdentifier:", 0);
    v12 = objc_loadWeakRetained(v7);
    objc_msgSend(v12, "imageInfosBeingLoaded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", v25[3]);

  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_8(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", a1[4]);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __48__TVPExternalImagePlayer__loadImagesIfNecessary__block_invoke_2_11(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v5);

}

- (void)_cancelAllImageLoads
{
  void *v3;
  void *v4;
  id v5;

  -[TVPExternalImagePlayer imageLoader](self, "imageLoader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelImageLoadingForIdentifiers:", v4);

}

- (void)_cancelStaleImageLoadsForTime:(double)a3
{
  double v5;
  double v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[2];

  v10 = objc_alloc_init(MEMORY[0x24BDD1698]);
  -[TVPExternalImagePlayer rate](self, "rate");
  v6 = v5;
  -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= 0.0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke_2;
    v11[3] = &unk_24F15BEB0;
    *(double *)&v12[1] = a3;
    v8 = (id *)v12;
    v12[0] = v10;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke;
    v13[3] = &unk_24F15BEB0;
    *(double *)&v14[1] = a3;
    v8 = (id *)v14;
    v14[0] = v10;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  }

  -[TVPExternalImagePlayer imageInfosBeingLoaded](self, "imageInfosBeingLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsAtIndexes:", v10);

}

uint64_t __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;

  result = objc_msgSend(a2, "requestedTime");
  if (v8 < *(double *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  *a4 = 1;
  return result;
}

uint64_t __56__TVPExternalImagePlayer__cancelStaleImageLoadsForTime___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;

  result = objc_msgSend(a2, "requestedTime");
  if (v8 > *(double *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  *a4 = 1;
  return result;
}

- (void)_updateImageIntervalWithRate:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[TVPExternalImagePlayer mediaItem](self, "mediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExternalImageConfig"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageInterval");
  -[TVPExternalImagePlayer setImageInterval:](self, "setImageInterval:", (double)(uint64_t)(vcvtpd_s64_f64(fabs(a3) * 0.25 / (double)(uint64_t)v6) * (uint64_t)v6));

}

- (double)_timeAfterRemovingInterstitials:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  -[TVPExternalImagePlayer mediaItem](self, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataInterstitialCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "timeAdjustedByRemovingInterstitials:", a3);
    a3 = v6;
  }

  return a3;
}

- (double)rate
{
  return self->_rate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (NSDate)playbackDate
{
  return self->_playbackDate;
}

- (void)setPlaybackDate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDate, a3);
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentImage, a3);
}

- (id)elapsedTimeUpdateBlock
{
  return self->_elapsedTimeUpdateBlock;
}

- (void)setElapsedTimeUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)imageUpdateBlock
{
  return self->_imageUpdateBlock;
}

- (void)setImageUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setReferenceTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_referenceTime.epoch = a3->var3;
  *(_OWORD *)&self->_referenceTime.value = v3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
}

- (TVPExternalImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoader, a3);
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (NSMutableArray)imageInfosBeingLoaded
{
  return self->_imageInfosBeingLoaded;
}

- (void)setImageInfosBeingLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_imageInfosBeingLoaded, a3);
}

- (double)currentImageTime
{
  return self->_currentImageTime;
}

- (void)setCurrentImageTime:(double)a3
{
  self->_currentImageTime = a3;
}

- (double)imageInterval
{
  return self->_imageInterval;
}

- (void)setImageInterval:(double)a3
{
  self->_imageInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageInfosBeingLoaded, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_imageUpdateBlock, 0);
  objc_storeStrong(&self->_elapsedTimeUpdateBlock, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_playbackDate, 0);
}

@end
