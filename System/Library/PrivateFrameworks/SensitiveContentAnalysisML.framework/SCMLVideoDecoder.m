@implementation SCMLVideoDecoder

- (SCMLVideoDecoder)initWithConfig:(id)a3
{
  id v5;
  SCMLVideoDecoder *v6;
  SCMLVideoDecoder *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCMLVideoDecoder;
  v6 = -[SCMLVideoDecoder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    objc_msgSend(v5, "frameLimit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_frameLimit = objc_msgSend(v8, "unsignedIntValue");

    v7->_framesPerSync = objc_msgSend(v5, "framesPerSync");
  }

  return v7;
}

- (void)reset
{
  -[SCMLVideoDecoder setAssetReader:](self, "setAssetReader:", 0);
  -[SCMLVideoDecoder setAssetReaderTrack:](self, "setAssetReaderTrack:", 0);
  -[SCMLVideoDecoder setCurrentFrameIndex:](self, "setCurrentFrameIndex:", 0);
  -[SCMLVideoDecoder setDurationInSeconds:](self, "setDurationInSeconds:", 0.0);
  -[SCMLVideoDecoder setTotalFrames:](self, "setTotalFrames:", 0.0);
}

- (unint64_t)maxNumFrames
{
  double v3;
  double v4;
  double v5;

  if (-[SCMLVideoDecoder frameLimit](self, "frameLimit"))
  {
    v3 = (double)-[SCMLVideoDecoder frameLimit](self, "frameLimit");
    -[SCMLVideoDecoder totalFrames](self, "totalFrames");
    if (v4 >= v3)
      return -[SCMLVideoDecoder frameLimit](self, "frameLimit");
  }
  -[SCMLVideoDecoder totalFrames](self, "totalFrames");
  return (unint64_t)v5;
}

- (BOOL)useKeyFrame
{
  void *v2;
  BOOL v3;

  -[SCMLVideoDecoder config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "framesPerSync") != 0;

  return v3;
}

- (BOOL)startDecodingVideoURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  BOOL v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  unint64_t v20;
  double v21;
  const __CFAllocator *v22;
  CFDictionaryRef v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  const __CFDictionary *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CMTime v48;
  id v49;
  CMTime time;
  CMTime preferredTimescale;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SCMLVideoDecoder reset](self, "reset");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v6, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));
      objc_msgSend(v8, "duration");
      time = preferredTimescale;
      -[SCMLVideoDecoder setDurationInSeconds:](self, "setDurationInSeconds:", CMTimeGetSeconds(&time));
      v49 = 0;
      objc_msgSend(MEMORY[0x24BDB23B8], "assetReaderWithAsset:error:", v8, &v49);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v49;
      if (v11)
      {
        if (!a4)
          goto LABEL_28;
        goto LABEL_26;
      }
      -[SCMLVideoDecoder setAssetReader:](self, "setAssetReader:", v10);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nominalFrameRate");
      v18 = v17;
      -[SCMLVideoDecoder durationInSeconds](self, "durationInSeconds");
      -[SCMLVideoDecoder setTotalFrames:](self, "setTotalFrames:", floor(v19 * v18));
      time = preferredTimescale;
      if (-[SCMLVideoDecoder frameLimit](self, "frameLimit"))
      {
        if (-[SCMLVideoDecoder frameLimit](self, "frameLimit") >= 2)
        {
          v20 = -[SCMLVideoDecoder maxNumFrames](self, "maxNumFrames");
          if (-[SCMLVideoDecoder framesPerSync](self, "framesPerSync") >= 2)
            v20 = vcvtpd_u64_f64((double)v20 / (double)-[SCMLVideoDecoder framesPerSync](self, "framesPerSync"));
          -[SCMLVideoDecoder durationInSeconds](self, "durationInSeconds");
          CMTimeMakeWithSeconds(&time, v21 / ((double)(v20 - 1) + 0.1), preferredTimescale.timescale);
        }
      }
      else
      {
        CMTimeMake(&time, 1, preferredTimescale.timescale);
      }
      v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v48 = time;
      v23 = CMTimeCopyAsDictionary(&v48, v22);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", &unk_2516EB850, *MEMORY[0x24BDC56B8], &unk_2516EB868, *MEMORY[0x24BDC5708], &unk_2516EB868, *MEMORY[0x24BDC5650], 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v24;
      if (-[SCMLVideoDecoder useKeyFrame](self, "useKeyFrame"))
      {
        v25 = (void *)MEMORY[0x24BDD16E0];
        -[SCMLVideoDecoder config](self, "config");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "framesPerSync"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDB22D8]);

        v24 = v47;
        v28 = (_QWORD *)MEMORY[0x24BDB2258];
      }
      else
      {
        if (!-[SCMLVideoDecoder frameLimit](self, "frameLimit"))
          goto LABEL_22;
        v29 = (double)-[SCMLVideoDecoder frameLimit](self, "frameLimit");
        -[SCMLVideoDecoder totalFrames](self, "totalFrames");
        if (v30 <= v29)
          goto LABEL_22;
        objc_msgSend(v24, "setObject:forKeyedSubscript:", *MEMORY[0x24BDB22F0], *MEMORY[0x24BDB22E8]);
        v28 = (_QWORD *)MEMORY[0x24BDB2320];
      }
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, *v28);
LABEL_22:
      objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v16, v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCMLVideoDecoder setAssetReaderTrack:](self, "setAssetReaderTrack:", v31);

      -[SCMLVideoDecoder assetReaderTrack](self, "assetReaderTrack");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAlwaysCopiesSampleData:", 0);

      -[SCMLVideoDecoder assetReaderTrack](self, "assetReaderTrack");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAppliesPreferredTrackTransform:", 1);

      -[SCMLVideoDecoder assetReader](self, "assetReader");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCMLVideoDecoder assetReaderTrack](self, "assetReaderTrack");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addOutput:", v35);

      -[SCMLVideoDecoder assetReader](self, "assetReader");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v35) = objc_msgSend(v36, "startReading");

      if ((v35 & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        v44 = (void *)MEMORY[0x24BDD1540];
        v37 = SCMLErrorDomain[0];
        -[SCMLVideoDecoder assetReader](self, "assetReader");
        v45 = v16;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "error");
        v46 = v10;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "userInfo");
        v40 = v23;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v37, 13, v41);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        v23 = v40;
        v10 = v46;

        v16 = v45;
      }

      if (!a4)
        goto LABEL_28;
LABEL_26:
      if (v11)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v11);
LABEL_31:

        goto LABEL_32;
      }
LABEL_28:
      if (v11)
      {
        v15 = 0;
      }
      else
      {
        -[SCMLVideoDecoder assetReader](self, "assetReader");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v42 != 0;

      }
      goto LABEL_31;
    }
  }
  else
  {
    v9 = 0;
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = SCMLErrorDomain[0];
    v52 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load video at %@"), v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v53[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 13, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v15 = 0;
LABEL_33:

  return v15;
}

- (id)nextFrameWithError:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  SCMLVideoFrame *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = -[SCMLVideoDecoder maxNumFrames](self, "maxNumFrames");
  if (-[SCMLVideoDecoder currentFrameIndex](self, "currentFrameIndex") == v5)
    goto LABEL_11;
  -[SCMLVideoDecoder assetReaderTrack](self, "assetReaderTrack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyNextSampleBuffer");

  if (!v7)
  {
    -[SCMLVideoDecoder assetReader](self, "assetReader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "status");

    v8 = 0;
    if (v10 == 2 || !a3)
      return v8;
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = SCMLErrorDomain[0];
    -[SCMLVideoDecoder assetReader](self, "assetReader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 13, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v8 = 0;
    return v8;
  }
  if (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v7) || !CMSampleBufferGetImageBuffer((CMSampleBufferRef)v7))
  {
    CFRelease(v7);
    goto LABEL_11;
  }
  v8 = -[SCMLVideoFrame initWithFrameBuffer:frameIndex:]([SCMLVideoFrame alloc], "initWithFrameBuffer:frameIndex:", v7, -[SCMLVideoDecoder currentFrameIndex](self, "currentFrameIndex"));
  CFRelease(v7);
  if (v8)
    -[SCMLVideoDecoder setCurrentFrameIndex:](self, "setCurrentFrameIndex:", -[SCMLVideoDecoder currentFrameIndex](self, "currentFrameIndex") + 1);
  return v8;
}

- (SCMLVideoAnalysisConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
  objc_storeStrong((id *)&self->_assetReader, a3);
}

- (AVAssetReaderTrackOutput)assetReaderTrack
{
  return self->_assetReaderTrack;
}

- (void)setAssetReaderTrack:(id)a3
{
  objc_storeStrong((id *)&self->_assetReaderTrack, a3);
}

- (unint64_t)frameLimit
{
  return self->_frameLimit;
}

- (void)setFrameLimit:(unint64_t)a3
{
  self->_frameLimit = a3;
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (void)setFramesPerSync:(unint64_t)a3
{
  self->_framesPerSync = a3;
}

- (unint64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unint64_t)a3
{
  self->_currentFrameIndex = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (double)totalFrames
{
  return self->_totalFrames;
}

- (void)setTotalFrames:(double)a3
{
  self->_totalFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReaderTrack, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
