@implementation SISceneUnderstandingResult

+ (CGSize)outputDimensions
{
  double v2;
  double v3;
  CGSize result;

  v2 = 256.0;
  v3 = 192.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- ($FD4688982923A924290ECB669CAF1EC2)labelsTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_labelsTensor;
}

- ($FD4688982923A924290ECB669CAF1EC2)normalsTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_normalsTensor;
}

- ($FD4688982923A924290ECB669CAF1EC2)probabilitiesTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_probabilitiesTensor;
}

- (SISceneUnderstandingResult)initWithModel:(id)a3
{
  id v4;
  SISceneUnderstandingResult *v5;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  SISceneUnderstandingResult *v12;
  objc_super v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISceneUnderstandingResult;
  v5 = -[SISceneUnderstandingResult init](&v14, sel_init);
  if (v5)
  {
    v6 = 0uLL;
    v7 = 0uLL;
    if (v4)
    {
      objc_msgSend(v4, "labelTensorDimensions");
      v7 = 0u;
      v6 = 0u;
    }
    v19 = vextq_s8(v6, v6, 8uLL);
    v20 = vextq_s8(v7, v7, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_labelsTensor.data = malloc_type_malloc(0, 0xDA899A75uLL);
    v5->_labelsTensor.storage_type = 65568;
    v8 = 0uLL;
    v9 = 0uLL;
    if (v4)
    {
      objc_msgSend(v4, "normalTensorDimensions");
      v9 = 0u;
      v8 = 0u;
    }
    v17 = vextq_s8(v8, v8, 8uLL);
    v18 = vextq_s8(v9, v9, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_normalsTensor.data = malloc_type_malloc(0, 0xEFB61280uLL);
    v5->_normalsTensor.storage_type = 65568;
    v10 = 0uLL;
    v11 = 0uLL;
    if (v4)
    {
      objc_msgSend(v4, "probabilitiesTensorDimensions");
      v11 = 0u;
      v10 = 0u;
    }
    v15 = vextq_s8(v10, v10, 8uLL);
    v16 = vextq_s8(v11, v11, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_probabilitiesTensor.data = malloc_type_malloc(0, 0x5D2612BCuLL);
    v5->_probabilitiesTensor.storage_type = 65568;
    v5->_resolution = (CGSize)vcvtq_f64_u64((uint64x2_t)0);
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_labelsTensor.data);
  free(self->_normalsTensor.data);
  free(self->_probabilitiesTensor.data);
  v3.receiver = self;
  v3.super_class = (Class)SISceneUnderstandingResult;
  -[SISceneUnderstandingResult dealloc](&v3, sel_dealloc);
}

- (int64_t)writeNormals:(__CVBuffer *)a3 orientation:(int64_t)a4
{
  unint64_t height;
  unint64_t width;
  unint64_t stride_channels;
  __IOSurface *IOSurface;
  char *BaseAddress;
  size_t BytesPerRow;
  float32x4_t v13;
  uint64_t v14;
  char *data;
  char *v16;
  char *v17;
  uint64_t v18;
  _DWORD *v19;
  float32x4_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x4_t v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  float32x4_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  width = self->_normalsTensor.width;
  height = self->_normalsTensor.height;
  stride_channels = self->_normalsTensor.stride_channels;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  v28 = height;
  if (height)
  {
    v14 = 0;
    data = (char *)self->_normalsTensor.data;
    v16 = &data[8 * stride_channels];
    v17 = &data[4 * stride_channels];
    v30 = BaseAddress + 8;
    v26 = 4 * (BytesPerRow >> 2);
    v27 = 4 * width;
    do
    {
      v29 = v14;
      if (width)
      {
        v18 = 0;
        v19 = v30;
        do
        {
          v13.i32[0] = *(_DWORD *)&data[4 * v18];
          v13.i32[1] = *(_DWORD *)&v17[4 * v18];
          v13.i32[2] = *(_DWORD *)&v16[4 * v18];
          v20 = vnegq_f32(v13);
          v13 = vmulq_f32(v13, v13);
          v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v13, 2), vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
          v21 = vrsqrte_f32((float32x2_t)v13.u32[0]);
          v22 = vmul_f32(v21, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v21, v21)));
          *(float32x2_t *)v13.f32 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v22, v22)));
          v23 = vmulq_n_f32(v20, v13.f32[0]);
          switch(a4)
          {
            case 0:
              break;
            case 1:
              v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1);
              v13.f32[1] = -v23.f32[0];
              goto LABEL_9;
            case 2:
              v13.f32[0] = -v23.f32[1];
              v13 = (float32x4_t)vzip1q_s32((int32x4_t)v13, (int32x4_t)v23);
              goto LABEL_9;
            case 3:
              v13 = vnegq_f32(v23);
LABEL_9:
              v13.i32[2] = v23.i32[2];
              v23 = v13;
              break;
            default:
              v31 = v23;
              __SceneIntelligenceLogSharedInstance();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136380931;
                v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SIScene"
                      "Understanding.mm";
                v34 = 1025;
                v35 = 190;
                _os_log_impl(&dword_21071A000, v24, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unknown orientation! ***", buf, 0x12u);
              }

              v23 = v31;
              break;
          }
          *((_QWORD *)v19 - 1) = v23.i64[0];
          *v19 = v23.i32[2];
          v19[1] = 1065353216;
          ++v18;
          v19 += 4;
        }
        while (width != v18);
      }
      v14 = v29 + 1;
      v16 += v27;
      v17 += v27;
      data += v27;
      v30 = (_DWORD *)((char *)v30 + v26);
    }
    while (v29 + 1 != v28);
  }
  IOSurfaceUnlock(IOSurface, 0, 0);
  kdebug_trace();
  return 0;
}

- (int64_t)writeProbabilities:(__CVBuffer *)a3
{
  unint64_t height;
  unint64_t width;
  __IOSurface *IOSurface;
  char *BaseAddress;
  size_t BytesPerRow;
  uint64_t v10;
  uint64_t v11;
  _DWORD *data;
  float *v13;
  unint64_t stride_channels;
  unsigned int channels_low;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  unint64_t i;

  width = self->_probabilitiesTensor.width;
  height = self->_probabilitiesTensor.height;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  if (height)
  {
    v10 = 0;
    v11 = 0;
    data = self->_probabilitiesTensor.data;
    v13 = (float *)self->_labelsTensor.data;
    stride_channels = self->_probabilitiesTensor.stride_channels;
    channels_low = LOBYTE(self->_probabilitiesTensor.channels);
    v16 = 4 * (BytesPerRow >> 2);
    do
    {
      v17 = v10;
      v18 = BaseAddress;
      for (i = width; i; --i)
      {
        LODWORD(BytesPerRow) = llroundf(v13[v17]);
        if (channels_low <= BytesPerRow)
          BytesPerRow = 0;
        BytesPerRow = v17 + BytesPerRow * stride_channels;
        *v18++ = data[BytesPerRow];
        ++v17;
      }
      ++v11;
      BaseAddress += v16;
      v10 += width;
    }
    while (v11 != height);
  }
  IOSurfaceUnlock(IOSurface, 0, 0);
  kdebug_trace();
  return 0;
}

- (int64_t)writeLabels:(__CVBuffer *)a3
{
  unint64_t height;
  unint64_t width;
  __IOSurface *IOSurface;
  _BYTE *BaseAddress;
  size_t BytesPerRow;
  uint64_t v10;
  float *data;
  float *v12;
  _BYTE *v13;
  unint64_t i;
  float v15;

  width = self->_labelsTensor.width;
  height = self->_labelsTensor.height;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(IOSurface);
  BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  if (height)
  {
    v10 = 0;
    data = (float *)self->_labelsTensor.data;
    do
    {
      v12 = data;
      v13 = BaseAddress;
      for (i = width; i; --i)
      {
        v15 = *v12++;
        *v13++ = llroundf(v15);
      }
      ++v10;
      BaseAddress += BytesPerRow;
      data += width;
    }
    while (v10 != height);
  }
  IOSurfaceUnlock(IOSurface, 0, 0);
  kdebug_trace();
  return 0;
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_SITensorDim)labelTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)self[17].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[16].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)normalTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)self[18].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[17].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)probabilitiesTensorDimensions
{
  __int128 v3;

  v3 = *(_OWORD *)self[19].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[18].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

@end
