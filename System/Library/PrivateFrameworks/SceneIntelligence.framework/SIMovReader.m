@implementation SIMovReader

- (id)initReaderWithVideoURL:(id)a3 trackList:(id)a4
{
  SIMovReader *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *trackInfos;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  SIMovStreamInfo *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  double v25;
  double v26;
  id v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int lcmfps;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  void *v43;
  SIMovReader *v44;
  NSObject *v45;
  NSObject *v46;
  id v48;
  id v49;
  id v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  objc_super v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v48 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SIMovReader;
  v6 = -[SIMovReader init](&v61, sel_init);
  if (v6)
  {
    v60 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE634E0]), "initWithURL:error:", v50, &v60);
    v49 = v60;
    -[SIMovReader setReader:](v6, "setReader:", v7);

    -[SIMovReader reader](v6, "reader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = v8 == 0;

    if ((_DWORD)v7)
    {
      __SceneIntelligenceLogSharedInstance();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
        v66 = 1025;
        v67 = 75;
        v68 = 2113;
        v69 = v49;
        _os_log_impl(&dword_21071A000, v46, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Couldn't open video track with error %{private}@ ***", buf, 0x1Cu);
      }

LABEL_33:
      v44 = 0;
    }
    else
    {
      v6->_readCount = 0;
      v6->_bufferEOFCount = 0;
      v6->_lcmfps = 1;
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      trackInfos = v6->trackInfos;
      v6->trackInfos = v9;

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      obj = v48;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v57;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v57 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            -[SIMovReader reader](v6, "reader");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "containsStream:", v14);

            if (!v16)
            {
              __SceneIntelligenceLogSharedInstance();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136381187;
                v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
                v66 = 1025;
                v67 = 93;
                v68 = 2113;
                v69 = v14;
                _os_log_impl(&dword_21071A000, v45, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** video doesn't contain steam %{private}@ ***", buf, 0x1Cu);
              }

              goto LABEL_33;
            }
            -[SIMovReader reader](v6, "reader");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "getFrameRateForStream:", v14);
            v19 = v18;

            v20 = [SIMovStreamInfo alloc];
            -[SIMovReader reader](v6, "reader");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "getOutputPixelFormatForStream:", v14);
            -[SIMovReader reader](v6, "reader");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "getSizeForStream:", v14);
            v24 = vcvtad_u64_f64(v19);
            v27 = -[SIMovStreamInfo initInfoWithTrackName:frameRate:pixelBufferFormat:resolution:](v20, "initInfoWithTrackName:frameRate:pixelBufferFormat:resolution:", v14, v22, (double)v24, v25, v26);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6->trackInfos, "setObject:forKeyedSubscript:", v27, v14);

            LOBYTE(v28) = 0;
            if (v24 && v6->_lcmfps)
            {
              v29 = v24;
              lcmfps = v6->_lcmfps;
              do
              {
                v31 = lcmfps;
                lcmfps = v29;
                v29 = v31 % v29;
              }
              while (v29);
              v28 = v6->_lcmfps / lcmfps * v24;
            }
            v6->_lcmfps = v28;
            __SceneIntelligenceLogSharedInstance();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              -[NSMutableDictionary objectForKeyedSubscript:](v6->trackInfos, "objectForKeyedSubscript:", v14);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "description");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136381187;
              v65 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
              v66 = 1025;
              v67 = 91;
              v68 = 2113;
              v69 = v34;
              _os_log_impl(&dword_21071A000, v32, OS_LOG_TYPE_DEBUG, " %{private}s:%{private}d *** reading track from video: \n %{private}@ ***", buf, 0x1Cu);

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          if (v11)
            continue;
          break;
        }
      }

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v35 = v6->trackInfos;
      v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v53 != v37)
              objc_enumerationMutation(v35);
            v39 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            v40 = v6->_lcmfps;
            -[NSMutableDictionary objectForKeyedSubscript:](v6->trackInfos, "objectForKeyedSubscript:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "frameRate");
            -[NSMutableDictionary objectForKeyedSubscript:](v6->trackInfos, "objectForKeyedSubscript:", v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setReadCycle:", v40 / v42);

          }
          v36 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        }
        while (v36);
      }

      v44 = v6;
    }

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)initReaderWithVideoURL:(id)a3 andTrackName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SIMovReader initReaderWithVideoURL:trackList:](self, "initReaderWithVideoURL:trackList:", v6, v8);

  return v9;
}

- (void)dealloc
{
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *>>> *i;
  objc_super v4;

  for (i = &self->_pixelBufferMap.__table_.__p1_; ; CVPixelBufferRelease((CVPixelBufferRef)i[5].__value_.__next_))
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, __CVBuffer *>, void *>>> *)i->__value_.__next_;
    if (!i)
      break;
  }
  v4.receiver = self;
  v4.super_class = (Class)SIMovReader;
  -[SIMovReader dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)readFrame:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CVBuffer *v8;
  uint64_t v10;

  -[SIMovReader reader](self, "reader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->trackInfos, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = (__CVBuffer *)objc_msgSend(v5, "copyNextFrameForStream:timestamp:error:", v7, a3, &v10);

  return v8;
}

- (__CVBuffer)getCurrentReadBufferForTrack:(id)a3
{
  id v4;
  __CVBuffer *v5;
  void *__p[2];
  char v8;
  void **v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v9 = __p;
  v5 = (__CVBuffer *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 5);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (int64_t)readNextAvaliableFrame:(id *)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int readCount;
  void *v11;
  _BOOL4 v12;
  id v13;
  CVPixelBufferRef *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t bufferEOFCount;
  int64_t v25;
  __int128 v27;
  NSMutableDictionary *obj;
  uint64_t v30;
  unordered_map<std::string, __CVBuffer *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, __CVBuffer *>>> *p_pixelBufferMap;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 *v37;
  _BYTE __p[12];
  __int16 v39;
  int v40;
  char v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->trackInfos;
  v4 = 0;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v5)
  {
    v30 = *(_QWORD *)v34;
    p_pixelBufferMap = &self->_pixelBufferMap;
    v7 = 1;
    *(_QWORD *)&v6 = 136380931;
    v27 = v6;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        readCount = self->_readCount;
        -[NSMutableDictionary objectForKeyedSubscript:](self->trackInfos, "objectForKeyedSubscript:", v9, v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = readCount % (int)objc_msgSend(v11, "readCycle") == 0;

        if (v12)
        {
          v13 = objc_retainAutorelease(v9);
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
          v37 = (__int128 *)__p;
          v14 = (CVPixelBufferRef *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37);
          CVPixelBufferRelease(v14[5]);
          if (v41 < 0)
            operator delete(*(void **)__p);
          -[SIMovReader reader](self, "reader");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->trackInfos, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v4;
          v18 = objc_msgSend(v15, "copyNextFrameForStream:timestamp:error:", v17, a3, &v32);
          v19 = v32;

          v20 = objc_retainAutorelease(v13);
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v20, "UTF8String"));
          v37 = (__int128 *)__p;
          *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37)+ 5) = v18;
          if (v41 < 0)
            operator delete(*(void **)__p);

          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
          v37 = (__int128 *)__p;
          v21 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_pixelBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v37)+ 5);
          if (v41 < 0)
          {
            operator delete(*(void **)__p);
            if (v21)
            {
LABEL_13:
              v7 = 0;
LABEL_19:
              v4 = v19;
              goto LABEL_20;
            }
          }
          else if (v21)
          {
            goto LABEL_13;
          }
          if (v19)
          {
            __SceneIntelligenceLogSharedInstance();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__p = v27;
              *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovReader.mm";
              v39 = 1025;
              v40 = 148;
              _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to read the buffer. ***", __p, 0x12u);
            }

            v7 = 2;
            goto LABEL_19;
          }
          v7 = 0;
          v4 = 0;
          ++self->_bufferEOFCount;
        }
LABEL_20:
        ++v8;
      }
      while (v5 != v8);
      v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      v5 = v23;
      if (!v23)
        goto LABEL_26;
    }
  }
  v7 = 1;
LABEL_26:

  bufferEOFCount = self->_bufferEOFCount;
  self->_readCount = (self->_readCount + 1) % self->_lcmfps;
  if (-[NSMutableDictionary count](self->trackInfos, "count") == bufferEOFCount)
    v25 = 3;
  else
    v25 = v7;

  return v25;
}

- (MOVStreamReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_pixelBufferMap);
  objc_storeStrong((id *)&self->trackInfos, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

@end
