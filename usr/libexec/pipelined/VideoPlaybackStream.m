@implementation VideoPlaybackStream

- (VideoPlaybackStream)initWithDatarun:(const void *)a3
{
  VideoPlaybackStream *v4;
  VideoPlaybackStream *v5;
  std::string *p_p;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AVAssetTrack *track;
  void *v17;
  NSDictionary *v18;
  void *v19;
  id v20;
  uint64_t v21;
  AVAssetReaderTrackOutput *readerTrackOutput;
  id v23;
  uint64_t v24;
  id v25;
  AVAssetReader *reader;
  AVAssetReader **p_reader;
  AVAssetReader *v28;
  const std::string::value_type *v30;
  const std::string::value_type *v31;
  __CFString *v32;
  id v33;
  objc_super v34;
  void *v35;
  void *v36[2];
  char v37;
  std::string __p;
  std::string v39;
  std::string v40;
  std::string v41;

  v34.receiver = self;
  v34.super_class = (Class)VideoPlaybackStream;
  v4 = -[VideoPlaybackStream init](&v34, "init");
  if (!v4)
  {
    v5 = 0;
    goto LABEL_23;
  }
  v4->_datarunStart.__rep_ = sub_1000FDE3C((uint64_t)a3);
  v4->_source = 0;
  v37 = 8;
  strcpy((char *)v36, "back.mp4");
  if (*((char *)a3 + 23) < 0)
    sub_10006CED8(&__p, *(void **)a3, *((_QWORD *)a3 + 1));
  else
    __p = *(std::string *)a3;
  sub_1000675EC(&__p, (uint64_t)v36);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((v37 & 0x80000000) == 0)
      goto LABEL_11;
LABEL_17:
    operator delete(v36[0]);
    goto LABEL_11;
  }
  if (v37 < 0)
    goto LABEL_17;
LABEL_11:
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v10 = -[objc_class URLAssetWithURL:options:](off_1004190C0(), "URLAssetWithURL:options:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = off_1004190D0();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tracksWithMediaType:", v13));

  if (objc_msgSend(v14, "count") == (id)1)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));
    track = v4->_track;
    v4->_track = (AVAssetTrack *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1111970369));
    v18 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, off_100419120());
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = -[objc_class assetReaderTrackOutputWithTrack:outputSettings:](off_1004190C8(), "assetReaderTrackOutputWithTrack:outputSettings:", v4->_track, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    readerTrackOutput = v4->_readerTrackOutput;
    v4->_readerTrackOutput = (AVAssetReaderTrackOutput *)v21;

    v33 = 0;
    v23 = -[objc_class assetReaderWithAsset:error:](off_1004190B8(), "assetReaderWithAsset:error:", v11, &v33);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v33;
    p_reader = &v4->_reader;
    reader = v4->_reader;
    v4->_reader = (AVAssetReader *)v24;

    v28 = v4->_reader;
    v32 = CFSTR("Failed to open reader for ");
    v31 = (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    if (v25)
    {
      p_reader = (AVAssetReader **)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "description")));
      v30 = (const std::string::value_type *)objc_msgSend(p_reader, "UTF8String");
      if (!v28)
      {
LABEL_24:
        sub_1000D5048(v36, "");
        sub_1002CF504(&v32, &__p);
        sub_1002CF860(&v31, &v39);
        sub_10023D14C(": ", &v40);
        sub_1002CF860(&v30, &v41);
        sub_100174738((uint64_t)v36, (uint64_t)&__p, 4);
        if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v41.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_26:
            if ((SHIBYTE(v39.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_27;
            goto LABEL_32;
          }
        }
        else if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_26;
        }
        operator delete(v40.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v39.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_27:
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_28;
          goto LABEL_33;
        }
LABEL_32:
        operator delete(v39.__r_.__value_.__l.__data_);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_28:
          if ((v37 & 0x80000000) == 0)
            goto LABEL_29;
LABEL_34:
          operator delete(v36[0]);
LABEL_29:
          sub_1000F2AE4((uint64_t)&v35);
        }
LABEL_33:
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((v37 & 0x80000000) == 0)
          goto LABEL_29;
        goto LABEL_34;
      }
    }
    else
    {
      v30 = "<nil error>";
      if (!v28)
        goto LABEL_24;
    }
    if (v25)

    -[AVAssetReader addOutput:](v4->_reader, "addOutput:", v4->_readerTrackOutput);
    -[AVAssetReader startReading](v4->_reader, "startReading");
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

LABEL_23:
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetReader cancelReading](self->_reader, "cancelReading");
  v3.receiver = self;
  v3.super_class = (Class)VideoPlaybackStream;
  -[VideoPlaybackStream dealloc](&v3, "dealloc");
}

- (LocalizerInputEvent)readNextEvent
{
  _QWORD *v2;
  _QWORD *v4;
  opaqueCMSampleBuffer *v5;
  __shared_weak_count *v6;
  uint64_t v7;
  duration<long long, std::ratio<1, 1000000000>> v8;
  const void *v9;
  unsigned __int8 source;
  opaqueCMSampleBuffer *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  LocalizerInputEvent result;

  v4 = v2;
  v5 = -[VideoPlaybackStream readNextSampleBuffer](self, "readNextSampleBuffer");
  if (v5)
  {
    v7 = (uint64_t)v5;
    v8.__rep_ = (int64_t)-[VideoPlaybackStream getTimeStampFromSampleBuffer:](self, "getTimeStampFromSampleBuffer:", v5);
    v9 = (const void *)sub_10030D52C(v7);
    source = self->_source;
    v5 = (opaqueCMSampleBuffer *)operator new(0x108uLL);
    v11 = v5;
    *((_QWORD *)v5 + 1) = 0;
    *((_QWORD *)v5 + 2) = 0;
    *(_QWORD *)v5 = off_1003F0840;
    *((duration<long long, std::ratio<1, 1000000000>> *)v5 + 4) = v8;
    *((_BYTE *)v5 + 40) = source;
    if (v9)
    {
      *((_QWORD *)v5 + 6) = CFRetain(v9);
      *((_DWORD *)v11 + 6) = 13;
      *v4 = (char *)v11 + 24;
      v4[1] = v11;
      CFRelease(v9);
    }
    else
    {
      *((_QWORD *)v5 + 6) = 0;
      *((_DWORD *)v5 + 6) = 13;
      *v4 = (char *)v5 + 24;
      v4[1] = v5;
    }
  }
  else
  {
    v12 = qword_10042EA88;
    *v4 = qword_10042EA80;
    v4[1] = v12;
    if (v12)
    {
      v13 = (unint64_t *)(v12 + 8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
  }
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- (opaqueCMSampleBuffer)readNextSampleBuffer
{
  AVAssetReader *reader;

  reader = self->_reader;
  if (reader && (id)-[AVAssetReader status](reader, "status") == (id)1)
    return (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_readerTrackOutput, "copyNextSampleBuffer");
  else
    return 0;
}

- (duration<long)getTimeStampFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  double v4;
  _BYTE v6[24];

  sub_10030D4E8((uint64_t)a3);
  sub_10030D4F4((uint64_t)v6);
  return (duration<long long, std::ratio<1, 1000000000>>)(self->_datarunStart.__rep_ + (uint64_t)(v4 * 1000000000.0));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  objc_storeStrong((id *)&self->_readerTrackOutput, 0);
  objc_storeStrong((id *)&self->_track, 0);
}

@end
