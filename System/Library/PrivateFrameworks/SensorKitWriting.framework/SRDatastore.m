@implementation SRDatastore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogDatastore = (uint64_t)os_log_create("com.apple.SensorKit", "Datastore");
}

- (_QWORD)initWithSampleFile:(void *)a3 metadataFile:(void *)a4 configurationFile:(uint64_t)a5 permission:(uint64_t)a6 defaults:
{
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  objc_super v20;

  if (!a1)
    return 0;
  v20.receiver = a1;
  v20.super_class = (Class)SRDatastore;
  v11 = objc_msgSendSuper2(&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[1] = a5;
    if (a6)
      v13 = (unint64_t)((double)*(unint64_t *)(a6 + 16) * *(float *)(a6 + 44));
    else
      v13 = 0;
    v14 = NSPageSize();
    if (v14 > v13)
      v15 = 1;
    else
      v15 = v13 / v14;
    v16 = v15 * NSPageSize();
    if (a6)
    {
      v12[2] = *(_QWORD *)(a6 + 32);
      v17 = *(_DWORD *)(a6 + 40);
      v18 = *(_QWORD *)(a6 + 24);
    }
    else
    {
      v18 = 0;
      v12[2] = 0;
      v17 = 0;
    }
    *((_DWORD *)v12 + 6) = v17;
    v12[4] = (id)a6;
    v12[5] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a2, v16, v12[1], a6);
    if (a3)
      v12[6] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a3, v18, v12[1], a6);
    if (a4)
      v12[7] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a4, v18, v12[1], a6);
  }
  return v12;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  objc_super v5;

  if (self)
  {
    objc_setProperty_atomic(self, a2, 0, 40);
    objc_setProperty_atomic(self, v3, 0, 48);
    objc_setProperty_atomic(self, v4, 0, 56);
  }

  self->_defaults = 0;
  v5.receiver = self;
  v5.super_class = (Class)SRDatastore;
  -[SRDatastore dealloc](&v5, sel_dealloc);
}

- (BOOL)writeSampleBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:
{
  uint64_t v9;
  _QWORD *Property;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  NSObject *v14;
  z_size_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  SRError *v40;
  int v41;
  z_size_t v42;
  __int16 v43;
  z_size_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (!result)
    return result;
  v9 = result;
  Property = objc_getProperty((id)result, a2, 40, 1);
  if (!Property)
  {
    v20 = SRLogDatastore;
    if (!os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO))
      goto LABEL_43;
    LOWORD(v41) = 0;
    v21 = "No disk space available, dropping data";
    v22 = v20;
    v23 = OS_LOG_TYPE_INFO;
    v24 = 2;
LABEL_42:
    _os_log_impl(&dword_245CD7000, v22, v23, v21, (uint8_t *)&v41, v24);
    goto LABEL_43;
  }
  v11 = (uint64_t)Property;
  v12 = (_QWORD *)Property[2];
  if (v12)
    v13 = v12[6] - v12[3] + v12[2];
  else
    v13 = 0;
  if (v13 >= a3 + 20)
    goto LABEL_21;
  v14 = SRLogDatastore;
  if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO))
  {
    if (v12)
      v15 = v12[6] - v12[3] + v12[2];
    else
      v15 = 0;
    v41 = 134349312;
    v42 = v15;
    v43 = 2050;
    v44 = a3 + 20;
    _os_log_impl(&dword_245CD7000, v14, OS_LOG_TYPE_INFO, "Not enough free space (%{public}zu) to write %{public}zu. Attempting to expand the mapped region", (uint8_t *)&v41, 0x16u);
  }
  v16 = *(_QWORD *)(v9 + 16) * NSPageSize();
  v17 = *(_QWORD *)(v11 + 24);
  if (v17 && (v18 = *(_QWORD *)(v17 + 16)) != 0)
  {
    v19 = *(_QWORD *)(v18 + 4);
  }
  else
  {
    v25 = *(_QWORD *)(v11 + 16);
    if (v25)
      v19 = *(_QWORD *)(v25 + 24) - *(_QWORD *)(v25 + 16) + 56;
    else
      v19 = 56;
  }
  v26 = (unint64_t)((double)(v19 + a3) * *(float *)(v9 + 24));
  v27 = SRLogDatastore;
  if (v16 <= v26)
  {
    if (!os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    if (v17 && (v31 = *(_QWORD *)(v17 + 16)) != 0)
    {
      v32 = *(_QWORD *)(v31 + 4);
    }
    else
    {
      v39 = *(_QWORD *)(v11 + 16);
      if (v39)
        v32 = *(_QWORD *)(v39 + 24) - *(_QWORD *)(v39 + 16) + 56;
      else
        v32 = 56;
    }
    v41 = 134349312;
    v42 = a3;
    v43 = 2050;
    v44 = v16 - v32;
    v21 = "Trying to write %{public}zd but only have %{public}llul available. Dropping the data.";
    v22 = v27;
    v23 = OS_LOG_TYPE_DEFAULT;
    v24 = 22;
    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO))
  {
    v41 = 134217984;
    v42 = v26;
    _os_log_impl(&dword_245CD7000, v27, OS_LOG_TYPE_INFO, "Expanding the mapped region to %llu bytes while a new segment is fetched", (uint8_t *)&v41, 0xCu);
  }
  if ((-[SRFrameStore resizeMappedRegionTo:](v11, v26) & 1) == 0)
  {
LABEL_43:
    if (a4)
    {
      v40 = +[SRError errorWithCode:](SRError, "errorWithCode:", 12291);
      result = 0;
      *a4 = v40;
      return result;
    }
    return 0;
  }
LABEL_21:
  v28 = *(_QWORD *)(v11 + 24);
  if (v28 && (v29 = *(_QWORD *)(v28 + 16)) != 0)
  {
    v30 = *(_QWORD *)(v29 + 4);
  }
  else
  {
    v33 = *(_QWORD *)(v11 + 16);
    if (v33)
      v30 = *(_QWORD *)(v33 + 24) - *(_QWORD *)(v33 + 16) + 56;
    else
      v30 = 56;
  }
  -[SRFrameStore writeFrameForBytes:length:timestamp:error:](v11, (const Bytef *)a2, a3, a4, a5);
  v34 = *(_QWORD *)(v11 + 24);
  if (v34 && (v35 = *(_QWORD *)(v34 + 16)) != 0)
  {
    v36 = *(_QWORD *)(v35 + 4);
  }
  else
  {
    v37 = *(_QWORD *)(v11 + 16);
    if (v37)
      v36 = *(_QWORD *)(v37 + 24) - *(_QWORD *)(v37 + 16) + 56;
    else
      v36 = 56;
  }
  if (v36 >= v30 + a3)
    return 1;
  v38 = SRLogDatastore;
  result = os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v41) = 0;
    _os_log_impl(&dword_245CD7000, v38, OS_LOG_TYPE_INFO, "Failed to write frames", (uint8_t *)&v41, 2u);
    return 0;
  }
  return result;
}

- (void)syncMappedFiles
{
  uint64_t *Property;
  SEL v4;
  uint64_t *v5;
  SEL v6;
  uint64_t *v7;

  if (a1)
  {
    Property = (uint64_t *)objc_getProperty(a1, a2, 40, 1);
    -[SRFrameStore sync](Property);
    v5 = (uint64_t *)objc_getProperty(a1, v4, 48, 1);
    -[SRFrameStore sync](v5);
    v7 = (uint64_t *)objc_getProperty(a1, v6, 56, 1);
    -[SRFrameStore sync](v7);
  }
}

@end
