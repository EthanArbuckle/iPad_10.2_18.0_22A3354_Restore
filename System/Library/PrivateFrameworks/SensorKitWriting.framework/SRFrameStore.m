@implementation SRFrameStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogFrameStore = (uint64_t)os_log_create("com.apple.SensorKit", "FrameStore");
}

- (uint64_t)initWithFileHandle:(unint64_t)a3 maxSize:(uint64_t)a4 permission:(uint64_t)a5 defaults:
{
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  int v36;
  int v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  id v44;
  uint64_t v45;
  id Property;
  uint64_t v47;
  SEL v48;
  id v49;
  NSObject *v51;
  __int128 v52;
  objc_super v53;
  _OWORD v54[2];
  __int128 v55;
  uint64_t v56;
  uint8_t buf[4];
  _BYTE v58[20];
  _BYTE v59[10];
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v53.receiver = a1;
  v53.super_class = (Class)SRFrameStore;
  v9 = objc_msgSendSuper2(&v53, sel_init);
  v10 = (uint64_t)v9;
  if (!v9)
    return v10;
  if (a5)
    v11 = *(_QWORD *)(a5 + 8);
  else
    v11 = 0;
  if (v11 >= 0xFFFFFFFF)
    v12 = -1;
  else
    v12 = v11;
  v9[2] = v12;
  v56 = 0;
  v55 = 0u;
  memset(v54, 0, sizeof(v54));
  objc_opt_self();
  v13 = objc_msgSend(a2, "seekToEndOfFile");
  objc_msgSend(a2, "seekToFileOffset:", 0);
  if (a2)
  {
    v14 = (void *)objc_msgSend(-[NSFileHandle pathname](a2), "lastPathComponent");
    if (!v13)
      goto LABEL_21;
  }
  else
  {
    v14 = 0;
    if (!v13)
      goto LABEL_21;
  }
  v15 = -[NSFileHandle pathname](a2);
  if (v13 > 0x37)
  {
    v21 = (void *)objc_msgSend(a2, "readDataOfLength:", 56);
    objc_msgSend(a2, "seekToFileOffset:", 0);
    if (v21 && (unint64_t)objc_msgSend(v21, "length") > 0x37)
    {
      v24 = objc_msgSend(v21, "bytes");
      v25 = v24;
      if (*(_DWORD *)v24 == 1195725633)
      {
        v52 = *(_OWORD *)(v24 + 16);
        v54[0] = *(_OWORD *)v24;
        v54[1] = v52;
        v55 = *(_OWORD *)(v24 + 32);
        v56 = *(_QWORD *)(v24 + 48);
        goto LABEL_22;
      }
      v26 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)v58 = 4;
        *(_WORD *)&v58[4] = 2082;
        *(_QWORD *)&v58[6] = "ASEG";
        *(_WORD *)&v58[14] = 1042;
        *(_DWORD *)&v58[16] = 4;
        *(_WORD *)v59 = 2082;
        *(_QWORD *)&v59[2] = v25;
        v60 = 2114;
        v61 = v15;
        v17 = "Segment header magic number %{public}.4s doesn't match %{public}.4s in file %{public}@. Potentially overwr"
              "iting whatever data is currently there";
        v18 = v26;
        v19 = OS_LOG_TYPE_DEFAULT;
        v20 = 44;
        goto LABEL_20;
      }
    }
    else
    {
      v22 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v21, "length");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v58 = v15;
        *(_WORD *)&v58[8] = 2050;
        *(_QWORD *)&v58[10] = v23;
        v17 = "Unable to read frames file segment header %{public}@. Received data of %{public}lu length. Potentially ove"
              "rwriting whatever data is currently there";
        v18 = v22;
        v19 = OS_LOG_TYPE_INFO;
        v20 = 22;
        goto LABEL_20;
      }
    }
  }
  else
  {
    v16 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v58 = v15;
      v17 = "Frames file %{public}@ is invalid because the current size is less than a valid segment header. Potentially "
            "overwriting whatever data is currently there.";
      v18 = v16;
      v19 = OS_LOG_TYPE_INFO;
      v20 = 12;
LABEL_20:
      _os_log_impl(&dword_245CD7000, v18, v19, v17, buf, v20);
    }
  }
LABEL_21:
  SRMakeSegmentHeader((uint64_t)v54, 0, v14, v12);
LABEL_22:
  v27 = objc_msgSend(a2, "seekToEndOfFile");
  objc_msgSend(a2, "seekToFileOffset:", 0);
  v29 = -[NSFileHandle pathname](a2);
  v30 = *(_QWORD *)((char *)v54 + 4);
  if (*(_QWORD *)((char *)v54 + 4) > v27)
  {
    v31 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v58 = v29;
      *(_WORD *)&v58[8] = 2048;
      *(_QWORD *)&v58[10] = v30;
      *(_WORD *)&v58[18] = 2050;
      *(_QWORD *)v59 = a3;
      v32 = "Segment header in %{public}@ says file size is %llu but that is larger than the max size (%{public}lu) we can support.";
      v33 = v31;
      v34 = OS_LOG_TYPE_INFO;
      v35 = 32;
LABEL_43:
      _os_log_impl(&dword_245CD7000, v33, v34, v32, buf, v35);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  if (!(*(_QWORD *)((char *)v54 + 4) | a4 & 0xFFFFFFFFFFFFFFFDLL))
  {
    v45 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v58 = v29;
      v32 = "Not mapping an empty file %{public}@";
      v33 = v45;
      v34 = OS_LOG_TYPE_DEFAULT;
      v35 = 12;
      goto LABEL_43;
    }
LABEL_44:

    return 0;
  }
  v36 = DWORD1(v54[1]);
  v37 = *(_DWORD *)(v10 + 8);
  if (DWORD1(v54[1]) != v37)
  {
    v38 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      v39 = "";
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v58 = v29;
      *(_WORD *)&v58[8] = 1026;
      if (a4 == 1)
        v39 = "Potentially overwriting whatever data is currently there";
      *(_DWORD *)&v58[10] = v36;
      *(_WORD *)&v58[14] = 1026;
      *(_DWORD *)&v58[16] = v37;
      *(_WORD *)v59 = 2080;
      *(_QWORD *)&v59[2] = v39;
      _os_log_impl(&dword_245CD7000, v38, OS_LOG_TYPE_DEFAULT, "Segment versions of %{public}@ don't match. Received %{public}d, expected %{public}d.%s", buf, 0x22u);
    }
    v30 = 0;
    *(_QWORD *)((char *)v54 + 4) = 0;
  }
  if (a2)
    v40 = (void *)objc_msgSend(-[NSFileHandle pathname](a2), "lastPathComponent");
  else
    v40 = 0;
  objc_setProperty_nonatomic_copy((id)v10, v28, v40, 40);
  if (v30 <= a3)
    v41 = a3;
  else
    v41 = v30;
  *(_QWORD *)(v10 + 32) = a4;
  v42 = (void *)memoryMappingsForPermission(a4, (uint64_t)v54, v41, v30);
  *(_QWORD *)(v10 + 56) = a2;
  if (a4 == 1 && (-[SRFrameStore resizeBackingFileTo:](v10, v41) & 1) == 0)
  {
    v51 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245CD7000, v51, OS_LOG_TYPE_ERROR, "Failed to resize backing file", buf, 2u);
    }
    goto LABEL_44;
  }
  *(_QWORD *)(v10 + 16) = (id)objc_msgSend(v42, "lastObject");
  if ((unint64_t)objc_msgSend(v42, "count") <= 1)
  {
    v44 = *(id *)(v10 + 24);
  }
  else
  {
    v44 = (id)objc_msgSend(v42, "firstObject");
    *(_QWORD *)(v10 + 24) = v44;
  }
  Property = objc_getProperty((id)v10, v43, 56, 1);
  -[SRMemoryMapping mapWithFileHandle:]((uint64_t)v44, Property);
  v47 = *(_QWORD *)(v10 + 16);
  v49 = objc_getProperty((id)v10, v48, 56, 1);
  -[SRMemoryMapping mapWithFileHandle:](v47, v49);
  *(_QWORD *)(v10 + 48) = *(_QWORD *)((char *)v54 + 12);
  return v10;
}

- (uint64_t)resizeBackingFileTo:(uint64_t)result
{
  NSObject *v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    if (*(_QWORD *)(result + 32) == 1)
    {
      objc_msgSend(*(id *)(result + 56), "truncateFileAtOffset:", a2);
      return 1;
    }
    else
    {
      v2 = SRLogFrameStore;
      result = os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        *(_WORD *)v3 = 0;
        _os_log_error_impl(&dword_245CD7000, v2, OS_LOG_TYPE_ERROR, "Attempting to resize a non-writable file", v3, 2u);
        return 0;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  SRMemoryMapping *header;
  char *start;
  uint64_t v5;
  SRMemoryMapping *frames;
  NSObject *v7;
  const char *v8;
  id Property;
  const char *v10;
  NSObject *v11;
  const char *v12;
  id v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    header = self->_header;
    if (header && (start = (char *)header->_start) != 0)
    {
      v5 = *(_QWORD *)(start + 4);
    }
    else
    {
      frames = self->_frames;
      if (frames)
        v5 = (char *)frames->_currentPosition - (char *)frames->_start + 56;
      else
        v5 = 56;
    }
    v7 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      Property = objc_getProperty(self, v8, 56, 1);
LABEL_9:
      *(_DWORD *)buf = 138543362;
      v17 = -[NSFileHandle pathname](Property);
      _os_log_impl(&dword_245CD7000, v7, OS_LOG_TYPE_INFO, "Tearing down frame store for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v7 = SRLogFrameStore;
    v5 = 0;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      Property = 0;
      goto LABEL_9;
    }
  }

  self->_header = 0;
  self->_frames = 0;
  if (self->_permission == 1)
  {
    v11 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      v13 = objc_getProperty(self, v12, 56, 1);
      v14 = -[NSFileHandle pathname](v13);
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2050;
      v19 = v5;
      _os_log_impl(&dword_245CD7000, v11, OS_LOG_TYPE_INFO, "Finalizing %{public}@ to %{public}llu bytes", buf, 0x16u);
    }
    -[SRFrameStore resizeBackingFileTo:]((uint64_t)self, v5);
  }
  objc_setProperty_atomic(self, v10, 0, 56);

  self->_segmentName = 0;
  v15.receiver = self;
  v15.super_class = (Class)SRFrameStore;
  -[SRFrameStore dealloc](&v15, sel_dealloc);
}

- (uint64_t)resizeMappedRegionTo:(uint64_t)a1
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (!a1)
    return 0;
  v3 = NSRoundUpToMultipleOfPageSize(bytes);
  if (!-[SRFrameStore resizeBackingFileTo:](a1, v3))
    return 0;
  v4 = *(_QWORD *)(a1 + 24);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
    return 0;
  v6 = (void *)memoryMappingsForPermission(*(_QWORD *)(a1 + 32), v5, v3, *(_QWORD *)(v5 + 4));

  v7 = (id)objc_msgSend(v6, "lastObject");
  *(_QWORD *)(a1 + 16) = v7;
  return -[SRMemoryMapping mapWithFileHandle:]((uint64_t)v7, *(void **)(a1 + 56));
}

- (uint64_t)isValidFrame:(uint64_t)result
{
  const Bytef *v3;
  z_size_t v4;
  unint64_t v5;
  uLong v6;
  uLong v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uLong v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = (const Bytef *)(a2 + 20);
    v4 = *(unsigned int *)(a2 + 16);
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      v5 = *(_QWORD *)(v5 + 24);
    if (a2 + 20 + v4 > v5)
      return 0;
    v6 = adler32(0, 0, 0);
    v7 = adler32_z(v6, v3, v4);
    v8 = *(_QWORD *)(a2 + 8);
    result = v7 == v8;
    if (v7 != v8 && v8 != 0)
    {
      v10 = SRLogFrameStore;
      result = os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO);
      if ((_DWORD)result)
      {
        v11 = 134218240;
        v12 = v8;
        v13 = 2050;
        v14 = v7;
        _os_log_impl(&dword_245CD7000, v10, OS_LOG_TYPE_INFO, "Checksums don't match. Header: %llu, Generated checksum: %{public}lu. Skipping frame.", (uint8_t *)&v11, 0x16u);
        return 0;
      }
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  SRMemoryMapping *frames;
  unint64_t v10;
  unsigned int *var0;

  frames = self->_frames;
  if (frames)
  {
    v10 = 0;
    var0 = (unsigned int *)((char *)frames->_start + a3->var0);
    while (var0 < frames->_currentPosition && v10 < a5)
    {
      if (-[SRFrameStore isValidFrame:]((uint64_t)self, (uint64_t)var0))
        a4[v10++] = var0;
      var0 = (unsigned int *)((char *)var0 + var0[4] + 20);
      frames = self->_frames;
      if (!frames)
        goto LABEL_12;
    }
    frames = (SRMemoryMapping *)frames->_start;
  }
  else
  {
    v10 = 0;
    var0 = (unsigned int *)a3->var0;
  }
LABEL_12:
  a3->var0 = (char *)var0 - (char *)frames;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  return v10;
}

- (SRFramesStoreOffsetEnumerator)enumerateFromOffset:(SRFramesStoreOffsetEnumerator *)result
{
  SRFrameStore *v3;
  SRFramesStoreOffsetEnumerator *v4;
  objc_super v5;

  if (result)
  {
    v3 = (SRFrameStore *)result;
    v4 = [SRFramesStoreOffsetEnumerator alloc];
    if (v4)
    {
      v5.receiver = v4;
      v5.super_class = (Class)SRFramesStoreOffsetEnumerator;
      v4 = (SRFramesStoreOffsetEnumerator *)-[SRFramesStoreOffsetEnumerator init](&v5, sel_init);
      if (v4)
      {
        v4->_framesStore = v3;
        v4->_offset = a2;
      }
    }
    return v4;
  }
  return result;
}

- (uint64_t)writeFrameForBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  SRError *v22;
  uLong v23;
  uLong v24;
  _QWORD *v25;
  _QWORD *v26;
  uint8_t buf[32];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)(result + 24);
    if (!v7 || (v8 = *(_QWORD *)(v7 + 16)) == 0)
    {
      v15 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_245CD7000, v15, OS_LOG_TYPE_ERROR, "Failed to find a segment header while writing. Dropping incoming data", buf, 2u);
        if (!a4)
          return 0;
      }
      else if (!a4)
      {
        return 0;
      }
      v14 = 12294;
      goto LABEL_27;
    }
    if (!*(_QWORD *)(v8 + 4))
    {
      v29 = 0;
      v28 = 0u;
      memset(buf, 0, sizeof(buf));
      SRMakeSegmentHeader((uint64_t)buf, 56, *(void **)(result + 40), *(_DWORD *)(result + 8));
      -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), buf, 0, 0x38uLL);
    }
    v12 = *(_QWORD **)(v6 + 16);
    if (v12)
      v12 = (_QWORD *)(v12[6] - v12[3] + v12[2]);
    if ((unint64_t)v12 < a3 + 20)
    {
      v13 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_245CD7000, v13, OS_LOG_TYPE_ERROR, "No space left to write to the mapped region", buf, 2u);
        if (a4)
          goto LABEL_11;
      }
      else if (a4)
      {
LABEL_11:
        v14 = 12291;
LABEL_27:
        v22 = +[SRError errorWithCode:](SRError, "errorWithCode:", v14);
        result = 0;
        *a4 = v22;
        return result;
      }
      return 0;
    }
    v16 = *(double *)(v6 + 48);
    if (v16 >= a5)
    {
      v20 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = a5;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v16;
        _os_log_error_impl(&dword_245CD7000, v20, OS_LOG_TYPE_ERROR, "Frame should come in chronological order. Input %f < last %f", buf, 0x16u);
        if (!a4)
          return 0;
      }
      else if (!a4)
      {
        return 0;
      }
      v14 = 12292;
      goto LABEL_27;
    }
    v17 = mach_continuous_time();
    v18 = SRAbsoluteTimeFromContinuousTime(v17);
    if (v18 + 10.0 < a5)
    {
      v19 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = a5;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v18;
        _os_log_error_impl(&dword_245CD7000, v19, OS_LOG_TYPE_ERROR, "Timestamp is from the future. Input %f, Current: %f", buf, 0x16u);
        if (a4)
          goto LABEL_19;
      }
      else if (a4)
      {
LABEL_19:
        v14 = 12296;
        goto LABEL_27;
      }
      return 0;
    }
    if (HIDWORD(a3))
    {
      v21 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = -1;
        _os_log_error_impl(&dword_245CD7000, v21, OS_LOG_TYPE_ERROR, "Sample too large %{public}zu but only %u supported", buf, 0x12u);
        if (!a4)
          return 0;
      }
      else if (!a4)
      {
        return 0;
      }
      v14 = 12293;
      goto LABEL_27;
    }
    v23 = adler32(0, 0, 0);
    v24 = adler32_z(v23, a2, a3);
    *(double *)buf = a5;
    *(_QWORD *)&buf[8] = v24;
    *(_DWORD *)&buf[16] = a3;
    -[SRMemoryMapping appendBytes:length:](*(_QWORD **)(v6 + 16), buf, 0x14uLL);
    -[SRMemoryMapping appendBytes:length:](*(_QWORD **)(v6 + 16), a2, a3);
    *(double *)(v6 + 48) = a5;
    v25 = *(_QWORD **)(v6 + 16);
    if (v25)
      v25 = (_QWORD *)(v25[3] + v25[4] - v25[2]);
    v26 = v25;
    -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), &v26, 4, 8uLL);
    -[SRMemoryMapping writeBytes:toOffset:length:](*(void **)(v6 + 24), (const void *)(v6 + 48), 12, 8uLL);
    return 1;
  }
  return result;
}

- (void)sync
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id Property;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[2];
      if (v4)
        v5 = *(_QWORD *)(v4 + 24) - *(_QWORD *)(v4 + 16);
      else
        v5 = 0;
      Property = objc_getProperty(a1, v3, 56, 1);
      v7 = 134349314;
      v8 = v5;
      v9 = 2114;
      v10 = -[NSFileHandle pathname](Property);
      _os_log_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEFAULT, "Syncing %{public}zu bytes from segment %{public}@ to disk", (uint8_t *)&v7, 0x16u);
    }
    -[SRMemoryMapping sync](a1[3]);
    -[SRMemoryMapping sync](a1[2]);
  }
}

@end
