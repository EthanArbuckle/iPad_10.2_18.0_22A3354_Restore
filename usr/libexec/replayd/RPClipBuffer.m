@implementation RPClipBuffer

- (RPClipBuffer)init
{
  RPClipBuffer *v2;
  NSMutableArray *v3;
  NSMutableArray *bufferArray;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPClipBuffer;
  v2 = -[RPClipBuffer init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    bufferArray = v2->_bufferArray;
    v2->_bufferArray = v3;

    v2->_oldestSeconds = 0.0;
    v2->_newestSeconds = 0.0;
    v2->_firstSampleReceived = 0;
  }
  return v2;
}

- (id)initForVideo:(BOOL)a3
{
  RPClipBuffer *v4;
  NSMutableArray *v5;
  NSMutableArray *bufferArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPClipBuffer;
  v4 = -[RPClipBuffer init](&v8, "init");
  if (v4)
  {
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    bufferArray = v4->_bufferArray;
    v4->_bufferArray = v5;

    v4->_isVideo = a3;
  }
  return v4;
}

- (void)addFrameToBuffer:(opaqueCMSampleBuffer *)a3 isKeyFrame:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  double newestSeconds;
  RPClipSample *v9;
  double v10;
  _BOOL8 v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  float v17;
  int v18;
  double oldestSeconds;
  float v20;
  double v21;
  double v22;
  CMTime v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  _QWORD v33[2];

  if (a3)
  {
    v4 = a4;
    memset(&v23, 0, sizeof(v23));
    CMSampleBufferGetPresentationTimeStamp(&v23, a3);
    v7 = (float)v23.value / (float)v23.timescale;
    if (self->_firstSampleReceived)
    {
      if (v7 <= self->_newestSeconds)
      {
        if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          newestSeconds = self->_newestSeconds;
          *(_DWORD *)buf = 136446978;
          v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
          v26 = 1024;
          v27 = 80;
          v28 = 2048;
          v29 = v7;
          v30 = 2048;
          v31 = newestSeconds;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d discarding %f older than %f", buf, 0x26u);
        }
        return;
      }
    }
    else
    {
      self->_firstSampleReceived = 1;
      self->_oldestSeconds = v7;
    }
    self->_newestSeconds = v7;
    v9 = objc_alloc_init(RPClipSample);
    CFRetain(a3);
    -[RPClipSample setSampleBuffer:](v9, "setSampleBuffer:", a3);
    *(float *)&v10 = v7;
    -[RPClipSample setSeconds:](v9, "setSeconds:", v10);
    -[RPClipSample setIsKeyFrame:](v9, "setIsKeyFrame:", v4);
    -[NSMutableArray addObject:](self->_bufferArray, "addObject:", v9);
    if ((float)(self->_newestSeconds - self->_oldestSeconds) <= 15.0)
    {
      v12 = 0.0;
      if (dword_100095B40)
      {
LABEL_30:

        return;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0.0;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_bufferArray, "objectAtIndex:", v11));
        v14 = v13;
        if (self->_isVideo && objc_msgSend(v13, "isKeyFrame"))
        {
          if (v12 != 0.0)
          {
            CFRelease(objc_msgSend(*(id *)&v12, "sampleBuffer"));
            -[NSMutableArray removeObjectAtIndex:](self->_bufferArray, "removeObjectAtIndex:", 0);
          }
          v15 = v14;

          v12 = *(double *)&v15;
        }
        else
        {
          CFRelease(objc_msgSend(v14, "sampleBuffer"));
          -[NSMutableArray removeObjectAtIndex:](self->_bufferArray, "removeObjectAtIndex:", v11);
        }
        v11 = *(_QWORD *)&v12 != 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_bufferArray, "objectAtIndex:", v11));
        objc_msgSend(v16, "seconds");
        self->_oldestSeconds = v17;

      }
      while ((float)(self->_newestSeconds - self->_oldestSeconds) > 15.0);
      v18 = dword_100095B40;
      if (v12 != 0.0 && !dword_100095B40)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)&v12, "seconds");
          oldestSeconds = self->_oldestSeconds;
          *(_DWORD *)buf = 136447234;
          v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
          v26 = 1024;
          v27 = 117;
          v28 = 2048;
          v29 = v12;
          v30 = 2048;
          v31 = v20;
          v32 = 2048;
          *(double *)v33 = oldestSeconds;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d keeping key frame:%p with time:%f outside of expected buffer start time:%f", buf, 0x30u);
        }
        v18 = dword_100095B40;
      }
      if (v18)
        goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = COERCE_DOUBLE(-[NSMutableArray count](self->_bufferArray, "count"));
      v22 = (float)(self->_newestSeconds - self->_oldestSeconds);
      *(_DWORD *)buf = 136447490;
      v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
      v26 = 1024;
      v27 = 119;
      v28 = 2048;
      v29 = v21;
      v30 = 2048;
      v31 = v22;
      v32 = 1024;
      LODWORD(v33[0]) = v4;
      WORD2(v33[0]) = 2048;
      *(double *)((char *)v33 + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d buffer count %lu size %f isKeyFrame %d current time %f", buf, 0x36u);
    }
    goto LABEL_30;
  }
  if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10004C070();
}

- (opaqueCMFormatDescription)getFormatDescription
{
  void *v2;
  void *v3;
  opaqueCMFormatDescription *FormatDescription;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_bufferArray, "objectAtIndex:", 0));
  v3 = v2;
  if (v2)
    FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)objc_msgSend(v2, "sampleBuffer"));
  else
    FormatDescription = 0;

  return FormatDescription;
}

- (BOOL)getSamplesForDuration:(double)a3 latestSeconds:(double)a4 withOutputArray:(id)a5
{
  id v8;
  float v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  float v14;
  double v15;
  float v16;
  double v17;
  id v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *i;
  void *v26;
  float v27;
  id v28;
  float v29;
  BOOL v30;
  opaqueCMSampleBuffer *v31;
  CMSampleBufferRef v32;
  CMTime v34;
  CMTime v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE buf[28];
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  id v49;

  v8 = a5;
  v9 = a4 - a3;
  if (-[NSMutableArray count](self->_bufferArray, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_bufferArray, "objectAtIndex:", 0));
    v11 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_bufferArray, "objectAtIndex:", (char *)-[NSMutableArray count](self->_bufferArray, "count") - 1));
    v12 = (void *)v11;
    if (v10)
    {
      v13 = !v11 || dword_100095B40 > 1;
      if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "seconds");
        v15 = v14;
        objc_msgSend(v10, "seconds");
        v17 = v16;
        v18 = -[NSMutableArray count](self->_bufferArray, "count");
        *(_DWORD *)buf = 136447746;
        *(_QWORD *)&buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 141;
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = a4;
        v42 = 2048;
        v43 = v9;
        v44 = 2048;
        v45 = v15;
        v46 = 2048;
        v47 = v17;
        v48 = 2048;
        v49 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d current %f start %f newest %f oldest %f count %lu", buf, 0x44u);
      }
    }

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = self->_bufferArray;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = 0;
    v24 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v19);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v26, "seconds");
        if (v27 <= v9)
        {
          if (objc_msgSend(v26, "isKeyFrame"))
          {
            v28 = v26;

            if (dword_100095B40 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v28, "seconds");
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 160;
              *(_WORD *)&buf[18] = 2048;
              *(double *)&buf[20] = v29;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d latest idle sample:%f", buf, 0x1Cu);
            }
            v22 = v28;
          }
        }
        else if ((v23 & 1) != 0 || objc_msgSend(v26, "isKeyFrame"))
        {
          objc_msgSend(v8, "addObject:", objc_msgSend(v26, "sampleBuffer"));
          v23 = 1;
        }
        else
        {
          v23 = 0;
        }
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v21);

    v30 = 0;
    if (self->_isVideo && v22)
    {
      memset(&v35, 0, sizeof(v35));
      CMSampleBufferGetPresentationTimeStamp(&v35, (CMSampleBufferRef)objc_msgSend(v22, "sampleBuffer"));
      memset(&v34, 0, sizeof(v34));
      CMTimeMakeWithSeconds(&v34, v9, v35.timescale);
      v31 = (opaqueCMSampleBuffer *)objc_msgSend(v22, "sampleBuffer");
      *(CMTime *)buf = v34;
      v32 = sub_100046AF8(v31, (uint64_t)buf);
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 172;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v32;
        v42 = 2048;
        v43 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending first sample %p at timestamp:%f", buf, 0x26u);
      }
      objc_msgSend(v8, "insertObject:atIndex:", v32, 0);

      v22 = 0;
      v30 = 1;
    }
  }
  else
  {

    v30 = 0;
    v22 = 0;
  }

  return v30;
}

- (unint64_t)getTotalNumberOfSamples
{
  return (unint64_t)-[NSMutableArray count](self->_bufferArray, "count");
}

- (void)flushBuffer
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_bufferArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "sampleBuffer", (_QWORD)v9);
        if (v8)
          CFRelease(v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_bufferArray, "removeAllObjects");
  self->_oldestSeconds = 0.0;
  self->_newestSeconds = 0.0;
  self->_firstSampleReceived = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RPClipBuffer *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = objc_alloc_init(RPClipBuffer);
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_bufferArray);
  -[RPClipBuffer setBufferArray:](v4, "setBufferArray:", v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPClipBuffer bufferArray](v4, "bufferArray", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        CFRetain(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "sampleBuffer"));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  *(float *)&v11 = self->_oldestSeconds;
  -[RPClipBuffer setOldestSeconds:](v4, "setOldestSeconds:", v11);
  *(float *)&v12 = self->_newestSeconds;
  -[RPClipBuffer setNewestSeconds:](v4, "setNewestSeconds:", v12);
  -[RPClipBuffer setFirstSampleReceived:](v4, "setFirstSampleReceived:", self->_firstSampleReceived);
  -[RPClipBuffer setIsVideo:](v4, "setIsVideo:", self->_isVideo);
  return v4;
}

- (NSMutableArray)bufferArray
{
  return self->_bufferArray;
}

- (void)setBufferArray:(id)a3
{
  objc_storeStrong((id *)&self->_bufferArray, a3);
}

- (float)oldestSeconds
{
  return self->_oldestSeconds;
}

- (void)setOldestSeconds:(float)a3
{
  self->_oldestSeconds = a3;
}

- (float)newestSeconds
{
  return self->_newestSeconds;
}

- (void)setNewestSeconds:(float)a3
{
  self->_newestSeconds = a3;
}

- (BOOL)firstSampleReceived
{
  return self->_firstSampleReceived;
}

- (void)setFirstSampleReceived:(BOOL)a3
{
  self->_firstSampleReceived = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferArray, 0);
}

@end
