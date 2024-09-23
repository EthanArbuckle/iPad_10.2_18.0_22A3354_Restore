@implementation VGMLEspressoBuffer

- (VGMLEspressoBuffer)initWithNetwork:(id *)a3 withLayerName:(id)a4 withMode:(int)a5
{
  id v9;

  v9 = a4;
  self->_network = a3;
  objc_storeStrong((id *)&self->_layerName, a4);
  self->_mode = a5;
  -[NSString UTF8String](self->_layerName, "UTF8String");
  espresso_network_query_blob_dimensions();

  return self;
}

- (BOOL)bindManagedBuffer
{
  -[NSString UTF8String](self->_layerName, "UTF8String");
  espresso_network_bind_buffer();
  return 1;
}

- (BOOL)bindTensor:(id)a3
{
  id v4;
  int8x16_t v6;
  int8x16_t v7;

  v4 = objc_retainAutorelease(a3);
  self->_buffer.data = (void *)objc_msgSend(v4, "getData");
  v6 = vextq_s8(*(int8x16_t *)&self->_dimensions[2], *(int8x16_t *)&self->_dimensions[2], 8uLL);
  v7 = vextq_s8(*(int8x16_t *)self->_dimensions, *(int8x16_t *)self->_dimensions, 8uLL);
  espresso_buffer_pack_tensor_shape();
  -[NSString UTF8String](self->_layerName, "UTF8String", *(_OWORD *)&v6, *(_OWORD *)&v7);
  espresso_network_bind_buffer();

  return 1;
}

- (BOOL)bindImage:(__CVBuffer *)a3
{
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);
  -[NSString UTF8String](self->_layerName, "UTF8String");
  espresso_network_bind_cvpixelbuffer();
  return 1;
}

- (const)getDimensions
{
  return self->_dimensions;
}

- (unint64_t)getSize
{
  return self->_dimensions[1] * self->_dimensions[0] * self->_dimensions[2] * self->_dimensions[3];
}

- (const)getData
{
  return self->_buffer.data;
}

- (BOOL)checkBufferAndIOSurfaceConsistency:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "pixelFormat");
  v6 = objc_msgSend(v4, "width");
  v7 = objc_msgSend(v4, "height");
  v8 = VGGetChannelsFromPixelFormat(v5);
  v9 = objc_retainAutorelease(v4);
  v10 = objc_msgSend(v9, "baseAddress");
  v11 = v10 != 0;
  if (!v10)
  {
    __VGLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_249CAD000, v12, OS_LOG_TYPE_ERROR, " IOSurface provided for VGMLEspresso buffer output is empty. ", (uint8_t *)&v20, 2u);
    }

  }
  if (v8 != self->_dimensions[0])
  {
    __VGLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = self->_dimensions[0];
      v20 = 134218240;
      v21 = v8;
      v22 = 2048;
      v23 = v14;
      _os_log_impl(&dword_249CAD000, v13, OS_LOG_TYPE_ERROR, " IOSurface channels %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    v11 = 0;
  }
  if (v7 != self->_dimensions[1])
  {
    __VGLogSharedInstance();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = self->_dimensions[1];
      v20 = 134218240;
      v21 = v7;
      v22 = 2048;
      v23 = v16;
      _os_log_impl(&dword_249CAD000, v15, OS_LOG_TYPE_ERROR, " IOSurface height %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    v11 = 0;
  }
  if (v6 != self->_dimensions[2])
  {
    __VGLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_dimensions[2];
      v20 = 134218240;
      v21 = v6;
      v22 = 2048;
      v23 = v18;
      _os_log_impl(&dword_249CAD000, v17, OS_LOG_TYPE_ERROR, " IOSurface width %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

- (BOOL)copyBufferIntoIOSurface:(id)a3
{
  id v4;
  char *data;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  vImagePixelCount v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  id v47;
  vImage_Buffer src;
  vImage_Buffer buf;

  v4 = a3;
  data = (char *)self->_buffer.data;
  v47 = v4;
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      if (v8)
      {
        objc_msgSend(v47, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[VGMLEspressoBuffer checkBufferAndIOSurfaceConsistency:](self, "checkBufferAndIOSurfaceConsistency:", v9);

      }
      else
      {
        v8 = 0;
      }
      ++v7;
    }
    while (v6 != v7);
    if (!v8)
    {
      __VGLogSharedInstance();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_249CAD000, v19, OS_LOG_TYPE_ERROR, " IOSurface(s) not consistent with the espresso output buffer. ", (uint8_t *)&buf, 2u);
      }

      v17 = 0;
      goto LABEL_32;
    }
  }
  objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pixelFormat");

  objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "width");

  objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v14, "height");

  v15 = VGGetChannelsFromPixelFormat(v11);
  v16 = v15 * v13;
  v17 = 1;
  if (v11 <= 1278226535)
  {
    if (v11 != 843264102)
    {
      v18 = 843264104;
LABEL_17:
      if (v11 != v18)
        goto LABEL_32;
      goto LABEL_18;
    }
  }
  else
  {
    if (v11 == 1278226536)
    {
LABEL_18:
      if (v6)
      {
        v44 = v6;
        v45 = data;
        v20 = 0;
        v43 = 4 * v13 * v15 * v46;
        v21 = 4 * v13 * v15;
        do
        {
          objc_msgSend(v47, "objectAtIndexedSubscript:", v20, v43, v44);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lockWithOptions:seed:", 0, 0);

          if (v46)
          {
            v23 = 0;
            v24 = v45;
            do
            {
              objc_msgSend(v47, "objectAtIndexedSubscript:", v20);
              v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v26 = objc_msgSend(v25, "baseAddress");
              objc_msgSend(v47, "objectAtIndexedSubscript:", v20);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)(v26 + objc_msgSend(v27, "bytesPerRow") * v23);

              buf.data = v28;
              buf.height = 1;
              buf.width = v16;
              buf.rowBytes = 2 * v16;
              src.data = v24;
              src.height = 1;
              src.width = v16;
              src.rowBytes = 4 * v16;
              vImageConvert_PlanarFtoPlanar16F(&src, &buf, 0);
              ++v23;
              v24 += v21;
            }
            while (v46 != v23);
          }
          objc_msgSend(v47, "objectAtIndexedSubscript:", v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "unlockWithOptions:seed:", 0, 0);

          ++v20;
          v45 += v43;
        }
        while (v20 != v44);
LABEL_31:
        v17 = 1;
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (v11 != 1380410945)
    {
      v18 = 1380411457;
      goto LABEL_17;
    }
  }
  if (v6)
  {
    v30 = v6;
    v31 = 0;
    v32 = 4 * v16;
    v33 = 4 * v13 * v46 * v15;
    do
    {
      objc_msgSend(v47, "objectAtIndexedSubscript:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lockWithOptions:seed:", 0, 0);

      if (v46)
      {
        v35 = 0;
        v36 = data;
        do
        {
          objc_msgSend(v47, "objectAtIndexedSubscript:", v31);
          v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v38 = objc_msgSend(v37, "baseAddress");
          objc_msgSend(v47, "objectAtIndexedSubscript:", v31);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)(v38 + objc_msgSend(v39, "bytesPerRow") * v35);

          memcpy(v40, v36, v32);
          ++v35;
          v36 += v32;
        }
        while (v46 != v35);
      }
      objc_msgSend(v47, "objectAtIndexedSubscript:", v31);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "unlockWithOptions:seed:", 0, 0);

      ++v31;
      data += v33;
    }
    while (v31 != v30);
    goto LABEL_31;
  }
LABEL_32:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerName, 0);
}

@end
