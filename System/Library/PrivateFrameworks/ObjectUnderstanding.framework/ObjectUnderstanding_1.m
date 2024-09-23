int *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,`anonymous namespace'::SidePermutation(std::vector<int> const&)::$_0 &,int *,0>(int *a1, int *a2, int *a3, int *a4, int *a5, uint64_t **a6)
{
  int *result;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;

  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *a5;
  v17 = *a4;
  v18 = a6[1];
  v19 = **a6;
  do
  {
    v20 = *(_DWORD *)(*(_QWORD *)(v19 + 24 * *(int *)v18) + 4 * v13);
    if (v20 == v16)
      v15 = v13;
    if (v20 == v17)
      v14 = v13;
    ++v13;
  }
  while (v13 != 6);
  if (v15 < v14)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0;
    *a4 = v16;
    *a5 = v17;
    v24 = *a4;
    v25 = *a3;
    do
    {
      v26 = *(_DWORD *)(*(_QWORD *)(v19 + 24 * *(int *)v18) + 4 * v21);
      if (v26 == v24)
        v23 = v21;
      if (v26 == v25)
        v22 = v21;
      ++v21;
    }
    while (v21 != 6);
    if (v23 < v22)
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      *a3 = v24;
      *a4 = v25;
      v30 = *a3;
      v31 = *a2;
      do
      {
        v32 = *(_DWORD *)(*(_QWORD *)(v19 + 24 * *(int *)v18) + 4 * v27);
        if (v32 == v30)
          v29 = v27;
        if (v32 == v31)
          v28 = v27;
        ++v27;
      }
      while (v27 != 6);
      if (v29 < v28)
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *a2 = v30;
        *a3 = v31;
        v36 = *a2;
        v37 = *a1;
        v38 = *(_QWORD *)(v19 + 24 * *(int *)v18);
        do
        {
          v39 = *(_DWORD *)(v38 + 4 * v33);
          if (v39 == v36)
            v35 = v33;
          if (v39 == v37)
            v34 = v33;
          ++v33;
        }
        while (v33 != 6);
        if (v35 < v34)
        {
          *a1 = v36;
          *a2 = v37;
        }
      }
    }
  }
  return result;
}

int *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,`anonymous namespace'::SidePermutation(std::vector<int> const&)::$_0 &,int *>(int *result, int *a2, int *a3, uint64_t **a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *a2;
  v8 = a4[1];
  v9 = *result;
  v10 = **a4;
  v11 = *(_QWORD *)(v10 + 24 * *(int *)v8);
  do
  {
    v12 = *(_DWORD *)(v11 + 4 * v4);
    if (v12 == v7)
      v6 = v4;
    if (v12 == v9)
      v5 = v4;
    ++v4;
  }
  while (v4 != 6);
  v13 = *a3;
  if (v6 >= v5)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = *(_DWORD *)(v11 + 4 * v18);
      if (v21 == v13)
        v20 = v18;
      if (v21 == v7)
        v19 = v18;
      ++v18;
    }
    while (v18 != 6);
    if (v20 < v19)
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      *a2 = v13;
      *a3 = v7;
      v25 = *a2;
      v26 = *result;
      v27 = *(_QWORD *)(v10 + 24 * *(int *)v8);
      do
      {
        v28 = *(_DWORD *)(v27 + 4 * v22);
        if (v28 == v25)
          v24 = v22;
        if (v28 == v26)
          v23 = v22;
        ++v22;
      }
      while (v22 != 6);
      if (v24 < v23)
      {
        *result = v25;
        *a2 = v26;
      }
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = *(_DWORD *)(v11 + 4 * v14);
      if (v17 == v13)
        v16 = v14;
      if (v17 == v7)
        v15 = v14;
      ++v14;
    }
    while (v14 != 6);
    if (v16 < v15)
    {
      *result = v13;
LABEL_39:
      *a3 = v9;
      return result;
    }
    v29 = 0;
    v30 = 0;
    v31 = 0;
    *result = v7;
    *a2 = v9;
    v32 = *a3;
    v33 = *(_QWORD *)(v10 + 24 * *(int *)v8);
    do
    {
      v34 = *(_DWORD *)(v33 + 4 * v29);
      if (v34 == v32)
        v31 = v29;
      if (v34 == v9)
        v30 = v29;
      ++v29;
    }
    while (v29 != 6);
    if (v31 < v30)
    {
      *a2 = v32;
      goto LABEL_39;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,`anonymous namespace'::SidePermutation(std::vector<int> const&)::$_0 &,int *>(int *a1, int *a2, uint64_t **a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int *v14;
  int *v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = *(a2 - 1);
      v12 = *a1;
      do
      {
        v13 = *(_DWORD *)(*(_QWORD *)(**a3 + 24 * *(int *)a3[1]) + 4 * v8);
        if (v13 == v11)
          v10 = v8;
        if (v13 == v12)
          v9 = v8;
        ++v8;
      }
      while (v8 != 6);
      if (v10 < v9)
      {
        *a1 = v11;
        *(a2 - 1) = v12;
      }
      return 1;
    case 3:
      return 1;
    case 4:
      return 1;
    case 5:
      return 1;
    default:
      v14 = a1 + 2;
      v15 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v16 = 0;
      v17 = a3[1];
      v18 = **a3;
      break;
  }
  while (1)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = *v15;
    v23 = *v14;
    do
    {
      v24 = *(_DWORD *)(*(_QWORD *)(v18 + 24 * *(int *)v17) + 4 * v19);
      if (v24 == v22)
        v21 = v19;
      if (v24 == v23)
        v20 = v19;
      ++v19;
    }
    while (v19 != 6);
    if (v21 < v20)
    {
      v25 = v15;
      while (1)
      {
        *v25 = v23;
        if (v14 == a1)
          break;
        v25 = v14;
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v29 = *--v14;
        v23 = v29;
        do
        {
          v30 = *(_DWORD *)(*(_QWORD *)(v18 + 24 * *(int *)v17) + 4 * v26);
          if (v30 == v22)
            v28 = v26;
          if (v30 == v23)
            v27 = v26;
          ++v26;
        }
        while (v26 != 6);
        if (v28 >= v27)
          goto LABEL_30;
      }
      v25 = a1;
LABEL_30:
      *v25 = v22;
      if (++v16 == 8)
        return v15 + 1 == a2;
    }
    v14 = v15++;
    if (v15 == a2)
      return 1;
  }
}

int *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,`anonymous namespace'::SidePermutation(std::vector<int> const&)::$_0 &,int *>(int *a1, int *a2, int *a3, int *a4, uint64_t **a5)
{
  int *result;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;

  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = *a4;
  v15 = *a3;
  v16 = a5[1];
  v17 = **a5;
  do
  {
    v18 = *(_DWORD *)(*(_QWORD *)(v17 + 24 * *(int *)v16) + 4 * v11);
    if (v18 == v14)
      v13 = v11;
    if (v18 == v15)
      v12 = v11;
    ++v11;
  }
  while (v11 != 6);
  if (v13 < v12)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    *a3 = v14;
    *a4 = v15;
    v22 = *a3;
    v23 = *a2;
    do
    {
      v24 = *(_DWORD *)(*(_QWORD *)(v17 + 24 * *(int *)v16) + 4 * v19);
      if (v24 == v22)
        v21 = v19;
      if (v24 == v23)
        v20 = v19;
      ++v19;
    }
    while (v19 != 6);
    if (v21 < v20)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      *a2 = v22;
      *a3 = v23;
      v28 = *a2;
      v29 = *a1;
      v30 = *(_QWORD *)(v17 + 24 * *(int *)v16);
      do
      {
        v31 = *(_DWORD *)(v30 + 4 * v25);
        if (v31 == v28)
          v27 = v25;
        if (v31 == v29)
          v26 = v25;
        ++v25;
      }
      while (v25 != 6);
      if (v27 < v26)
      {
        *a1 = v28;
        *a2 = v29;
      }
    }
  }
  return result;
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_22954EA58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<NSString * {__strong},std::unique_ptr<OUCannyEdgeDetectorSemantic>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unique_ptr<OUCannyEdgeDetectorSemantic>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unique_ptr<OUCannyEdgeDetectorSemantic>>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, id **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = (uint64_t)**a4;
    v11[5] = 0;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<NSString * {__strong}>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v11 = *a3;
    *a3 = 0;
    v10[4] = v11;
    std::__tree<int>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

float OU3DObjectRGBSizeRefiner::ComputeOverlapScore<float>(int a1, _QWORD *a2, uint64_t *a3, box3d *a4)
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  double v8;
  float v9;

  v4 = 0;
  v5 = *a3;
  v6 = 0.0;
  do
  {
    if (*(_BYTE *)(v5 + v4))
    {
      v7 = *(float *)(*a2 + 4 * v4);
      if (v7 != 0.0)
        v6 = v6 + (float)((float)(v7 * (float)*(unsigned __int8 *)(v5 + v4)) / 255.0);
    }
    ++v4;
  }
  while (v4 != 49152);
  v8 = v6;
  v9 = boxVolume(a4);
  return v8 / (pow(v9, 0.125) * 10000.0);
}

float OU3DObjectRGBSizeRefiner::ComputeOverlapScore<unsigned char>(int a1, _QWORD *a2, uint64_t *a3, box3d *a4)
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  unsigned int v7;
  BOOL v8;
  double v9;
  float v10;

  v4 = 0;
  v5 = *a3;
  v6 = 0.0;
  do
  {
    v7 = *(unsigned __int8 *)(*a2 + v4);
    if (*(_BYTE *)(v5 + v4))
      v8 = v7 == 0;
    else
      v8 = 1;
    if (!v8)
      v6 = v6 + (float)((float)((float)*(unsigned __int8 *)(v5 + v4) * (float)v7) / 255.0);
    ++v4;
  }
  while (v4 != 49152);
  v9 = v6;
  v10 = boxVolume(a4);
  return v9 / (pow(v10, 0.125) * 10000.0);
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void *utils::OUImageUtils::ResizeImageRGBA(utils::OUImageUtils *this, CVPixelBufferRef pixelBuffer, int a3)
{
  OSType PixelFormatType;
  OSType v6;
  float Width;
  size_t Height;
  float v9;
  vImagePixelCount v10;
  vImagePixelCount v11;
  NSObject *v12;
  vImage_Buffer src;
  uint8_t color[4];
  vImage_Buffer buf;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v6 = PixelFormatType;
  if (PixelFormatType != 1111970369 && PixelFormatType != 1380401729)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::ResizeImageRGBA();
    goto LABEL_20;
  }
  kdebug_trace();
  Width = (float)CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  v9 = (float)Height;
  if (Width > (float)Height)
    v10 = (unint64_t)(float)((float)(Width / (float)Height) * (float)a3);
  else
    v10 = a3;
  if (Width > (float)Height)
    v11 = a3;
  else
    v11 = (unint64_t)(float)((float)((float)Height / Width) * (float)a3);
  if (vImageBuffer_Init(&buf, v11, v10, 0x20u, 0))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::ResizeImageRGBA();
LABEL_20:

    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  *(_DWORD *)color = -16777216;
  vImageBufferFill_ARGB8888(&buf, color, 0);
  src.data = CVPixelBufferGetBaseAddress(pixelBuffer);
  src.height = (unint64_t)v9;
  src.width = (unint64_t)Width;
  src.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (vImageScale_ARGB8888(&src, &buf, 0, 0))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::ResizeImageRGBA();
    goto LABEL_20;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  src.data = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], buf.width, buf.height, v6, buf.data, buf.rowBytes, 0, 0, 0, (CVPixelBufferRef *)&src))
  {
    free(buf.data);
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::ResizeImageRGBA();
    goto LABEL_20;
  }
  kdebug_trace();
  return src.data;
}

CVPixelBufferRef utils::OUImageUtils::SquareCropImage(void **a1, __CVBuffer *a2, unsigned int a3, double a4, int32x2_t a5)
{
  int v5;
  int v6;
  __int32 v7;
  __int32 v8;
  unsigned __int32 v12;
  unsigned __int32 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CVPixelBufferRef v19;
  char v20;
  CVPixelBufferRef v21;

  v5 = LODWORD(a4);
  v6 = HIDWORD(a4);
  v7 = a5.i32[0];
  v8 = a5.i32[1];
  if ((LODWORD(a4) | a5.i32[0] | HIDWORD(a4) | a5.i32[1]) < 0)
    return 0;
  kdebug_trace();
  v12 = v7 - v8;
  if (v7 - v8 < 0)
    v12 = v8 - v7;
  v13 = v12 >> 1;
  HIDWORD(v14) = HIDWORD(a4);
  LODWORD(v15) = LODWORD(a4);
  HIDWORD(v15) = v13 + v6;
  v16 = COERCE_DOUBLE(vdup_lane_s32(a5, 0));
  LODWORD(v14) = v13 + v5;
  v17 = v14;
  v18 = COERCE_DOUBLE(vdup_lane_s32(a5, 1));
  if (v7 > v8)
  {
    v16 = v18;
    v15 = v17;
  }
  v19 = utils::OUImageUtils::CropAndResizeImage(a1, a2, v15, v16, COERCE_DOUBLE(vdup_n_s32(a3)));
  if (!v20)
    std::__throw_bad_optional_access[abi:ne180100]();
  v21 = v19;
  kdebug_trace();
  return v21;
}

CVPixelBufferRef utils::OUImageUtils::CropAndResizeImage(void **a1, CVPixelBufferRef pixelBuffer, double a3, double a4, double a5)
{
  OSType PixelFormatType;
  OSType v9;
  int v10;
  char *BaseAddress;
  int BytesPerRow;
  int8x16_t v13;
  vImage_Error v14;
  NSObject *v15;
  NSObject *v16;
  CVPixelBufferRef v20;
  vImage_Buffer dest;
  vImage_Buffer src;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v9 = PixelFormatType;
  v10 = 4;
  if (PixelFormatType != 1380401729 && PixelFormatType != 1111970369)
  {
    if (PixelFormatType != 24)
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        utils::OUImageUtils::CropAndResizeImage();
      goto LABEL_14;
    }
    v10 = 3;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v13.i64[0] = SLODWORD(a4);
  v13.i64[1] = SHIDWORD(a4);
  *(int8x16_t *)&src.height = vextq_s8(v13, v13, 8uLL);
  src.rowBytes = BytesPerRow;
  src.data = &BaseAddress[v10 * LODWORD(a3) + HIDWORD(a3) * BytesPerRow];
  dest.data = utils::OUImageUtils::FindOrCreateBuffer((utils::OUImageUtils *)a1, SLODWORD(a5), SHIDWORD(a5), v10);
  dest.height = SHIDWORD(a5);
  dest.width = SLODWORD(a5);
  dest.rowBytes = v10 * (uint64_t)SLODWORD(a5);
  v14 = vImageScale_ARGB8888(&src, &dest, a1[3], 0);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (v14)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::CropAndResizeImage(v14, v15);

    free(dest.data);
    return 0;
  }
  v20 = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], SLODWORD(a5), SHIDWORD(a5), v9, dest.data, dest.rowBytes, 0, 0, 0, &v20))
  {
    free(dest.data);
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      utils::OUImageUtils::CropAndResizeImage();
LABEL_14:

    return 0;
  }
  return v20;
}

CVPixelBufferRef utils::OUImageUtils::CropImage(void **a1, __CVBuffer *a2, double a3, double a4)
{
  CVPixelBufferRef v8;

  kdebug_trace();
  v8 = utils::OUImageUtils::CropAndResizeImage(a1, a2, a3, a4, a4);
  kdebug_trace();
  return v8;
}

void *utils::OUImageUtils::FindOrCreateBuffer(utils::OUImageUtils *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *i;
  void *v9;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;

  for (i = *(_QWORD **)this; i != *((_QWORD **)this + 1); i += 4)
  {
    v9 = (void *)i[3];
    if (*i == a2 && i[1] == a3 && i[2] == a4 && v9 != 0)
      return v9;
  }
  v9 = malloc_type_malloc(a3 * a2 * a4, 0xDE1DA6C3uLL);
  v13 = *((_QWORD *)this + 2);
  v14 = (_QWORD *)*((_QWORD *)this + 1);
  if ((unint64_t)v14 >= v13)
  {
    v16 = ((uint64_t)v14 - *(_QWORD *)this) >> 5;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 59)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v18 = v13 - *(_QWORD *)this;
    if (v18 >> 4 > v17)
      v17 = v18 >> 4;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0)
      v19 = 0x7FFFFFFFFFFFFFFLL;
    else
      v19 = v17;
    if (v19)
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>((uint64_t)this + 16, v19);
    else
      v20 = 0;
    v21 = &v20[32 * v16];
    v22 = &v20[32 * v19];
    *(_QWORD *)v21 = a2;
    *((_QWORD *)v21 + 1) = a3;
    *((_QWORD *)v21 + 2) = a4;
    *((_QWORD *)v21 + 3) = v9;
    v15 = v21 + 32;
    v24 = *(char **)this;
    v23 = (char *)*((_QWORD *)this + 1);
    if (v23 != *(char **)this)
    {
      do
      {
        v25 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v21 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v21 - 1) = v25;
        v21 -= 32;
        v23 -= 32;
      }
      while (v23 != v24);
      v23 = *(char **)this;
    }
    *(_QWORD *)this = v21;
    *((_QWORD *)this + 1) = v15;
    *((_QWORD *)this + 2) = v22;
    if (v23)
      operator delete(v23);
  }
  else
  {
    *v14 = a2;
    v14[1] = a3;
    v15 = v14 + 4;
    v14[2] = a4;
    v14[3] = v9;
  }
  *((_QWORD *)this + 1) = v15;
  return v9;
}

uint64_t utils::ConvertCVPixelBuffer(__CVBuffer *a1, __CVBuffer *a2, uint64_t a3)
{
  uint64_t v6;
  void *__p[3];
  void *v9[3];

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 0);
  utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()(a1, v9);
  utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()(a2, __p);
  v6 = std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(a3, (uint64_t)v9[0], (uint64_t)__p[0]);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }
  return v6;
}

void sub_22954F534(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *utils::ConvertCVPixelBuffer(__CVBuffer *,__CVBuffer *,std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)> const&)::$_0::operator()@<X0>(__CVBuffer *a1@<X0>, _QWORD *a2@<X8>)
{
  size_t PlaneCount;
  void *result;
  uint64_t v6;
  size_t i;

  if (CVPixelBufferIsPlanar(a1))
  {
    PlaneCount = CVPixelBufferGetPlaneCount(a1);
    result = std::vector<vImage_Buffer>::vector(a2, PlaneCount);
    if (!PlaneCount)
      return result;
  }
  else
  {
    PlaneCount = 1;
    std::vector<vImage_Buffer>::vector(a2, 1uLL);
  }
  v6 = 0;
  for (i = 0; i != PlaneCount; ++i)
  {
    *(_QWORD *)(*a2 + v6 + 16) = CVPixelBufferGetWidthOfPlane(a1, i);
    *(_QWORD *)(*a2 + v6 + 8) = CVPixelBufferGetHeightOfPlane(a1, i);
    *(_QWORD *)(*a2 + v6 + 24) = CVPixelBufferGetBytesPerRowOfPlane(a1, i);
    result = CVPixelBufferGetBaseAddressOfPlane(a1, i);
    *(_QWORD *)(*a2 + v6) = result;
    v6 += 32;
  }
  return result;
}

void sub_22954F644(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::function<long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = a3;
  v6 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v3 + 48))(v3, &v6, &v5);
}

uint64_t utils::ConvertDepthF32ToU16(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  __CVBuffer *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  v10[0] = &off_24F243C88;
  v11 = v10;
  v6 = utils::ConvertCVPixelBuffer(this, v5, (uint64_t)v10);
  v7 = v11;
  if (v11 == v10)
  {
    v8 = 4;
    v7 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v8 = 5;
LABEL_5:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v6;
}

void sub_22954F768(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

CVPixelBufferRef utils::`anonymous namespace'::CheckCVPixelBuffers(utils::_anonymous_namespace_ *this, __CVBuffer *a2, CVPixelBufferRef *a3, __CVBuffer **a4)
{
  int v4;
  CVPixelBufferRef result;
  NSObject *v8;
  std::logic_error *v9;
  NSObject *v10;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  std::logic_error *exception;
  NSObject *v14;
  std::logic_error *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!this)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](exception, "Invalid in_buffer.");
    __cxa_throw(exception, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
  }
  v4 = (int)a4;
  if (CVPixelBufferGetPixelFormatType(this) != (_DWORD)a2)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))

    v15 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::invalid_argument::invalid_argument[abi:ne180100](v15, (const char *)&unk_22956FEC2);
    __cxa_throw(v15, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
  }
  if (*a3)
  {
    result = (CVPixelBufferRef)CVPixelBufferGetPixelFormatType(*a3);
    if ((_DWORD)result != v4)
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))

      v9 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::invalid_argument::invalid_argument[abi:ne180100](v9, (const char *)&unk_22956FEC2);
      __cxa_throw(v9, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
    }
  }
  else
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = "OUImageUtils";
      _os_log_impl(&dword_2294C8000, v10, OS_LOG_TYPE_INFO, "[%s] creating out_buffer; user is responsible to release the buffer.",
        (uint8_t *)&v16,
        0xCu);
    }

    WidthOfPlane = CVPixelBufferGetWidthOfPlane(this, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(this, 0);
    result = CreateCVPixelBuffer(WidthOfPlane, HeightOfPlane);
    *a3 = result;
  }
  return result;
}

void sub_22954F998(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertColor32BGRATo420f(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  const vImage_ARGBToYpCbCrMatrix *v5;
  __CVBuffer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *exception;
  vImage_YpCbCrPixelRange v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = *(vImage_YpCbCrPixelRange *)ymmword_2295625B8;
  if (!byte_255A53260)
  {
    v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x24BDB2EC0];
    utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info = 0u;
    *(_OWORD *)algn_255A531F0 = 0u;
    xmmword_255A53200 = 0u;
    unk_255A53210 = 0u;
    xmmword_255A53220 = 0u;
    unk_255A53230 = 0u;
    xmmword_255A53240 = 0u;
    unk_255A53250 = 0u;
    byte_255A53260 = 1;
    if (vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &v15, (vImage_ARGBToYpCbCr *)&utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info, kvImageARGB8888, kvImage420Yp8_CbCr8, 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22E2CA890](exception, "failed to create conversion info.");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  v6 = *a2;
  v16[0] = &off_24F243D18;
  v17 = v16;
  v10 = utils::ConvertCVPixelBuffer(this, v6, (uint64_t)v16);
  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
    goto LABEL_7;
  }
  if (v17)
  {
    v12 = 5;
LABEL_7:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*v11 + 8 * v12))(v11, v7, v8, v9);
  }
  return v10;
}

void sub_22954FB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;

  __cxa_free_exception(v17);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertColor420fTo32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  const vImage_YpCbCrToARGBMatrix *v5;
  __CVBuffer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *exception;
  vImage_YpCbCrPixelRange v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = *(vImage_YpCbCrPixelRange *)ymmword_2295625B8;
  if (!byte_255A532F0)
  {
    v5 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x24BDB2ED8];
    utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info = 0u;
    unk_255A53280 = 0u;
    xmmword_255A53290 = 0u;
    unk_255A532A0 = 0u;
    xmmword_255A532B0 = 0u;
    unk_255A532C0 = 0u;
    xmmword_255A532D0 = 0u;
    unk_255A532E0 = 0u;
    byte_255A532F0 = 1;
    if (vImageConvert_YpCbCrToARGB_GenerateConversion(v5, &v15, (vImage_YpCbCrToARGB *)&utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22E2CA890](exception, "failed to create conversion info.");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
  }
  v6 = *a2;
  v16[0] = &off_24F243D98;
  v17 = v16;
  v10 = utils::ConvertCVPixelBuffer(this, v6, (uint64_t)v16);
  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
    goto LABEL_7;
  }
  if (v17)
  {
    v12 = 5;
LABEL_7:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*v11 + 8 * v12))(v11, v7, v8, v9);
  }
  return v10;
}

void sub_22954FCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;

  __cxa_free_exception(v17);
  _Unwind_Resume(a1);
}

uint64_t utils::ConvertLabelL008To32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  _BYTE *BaseAddress;
  char *v6;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;

  CVPixelBufferLockBaseAddress(this, 1uLL);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(this);
  v6 = (char *)CVPixelBufferGetBaseAddress(*a2);
  Width = CVPixelBufferGetWidth(this);
  Height = CVPixelBufferGetHeight(this);
  BytesPerRow = CVPixelBufferGetBytesPerRow(this);
  v10 = CVPixelBufferGetBytesPerRow(*a2);
  bzero(v6, v10 * Height);
  if (Height)
  {
    for (i = 0; i != Height; ++i)
    {
      if (Width)
      {
        v12 = 0;
        v13 = 2;
        do
        {
          v6[v13] = BaseAddress[v12++];
          v13 += 4;
        }
        while (Width != v12);
      }
      BaseAddress += BytesPerRow;
      v6 += v10;
    }
  }
  CVPixelBufferUnlockBaseAddress(this, 1uLL);
  return CVPixelBufferUnlockBaseAddress(*a2, 0);
}

uint64_t utils::ConvertConfidenceL00fToVote32BGRA(utils *this, CVPixelBufferRef *a2, __CVBuffer **a3)
{
  char *BaseAddress;
  char *v6;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v10;
  uint64_t i;
  uint64_t v12;
  size_t v13;

  CVPixelBufferLockBaseAddress(this, 1uLL);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(this);
  v6 = (char *)CVPixelBufferGetBaseAddress(*a2);
  Width = CVPixelBufferGetWidth(this);
  Height = CVPixelBufferGetHeight(this);
  BytesPerRow = CVPixelBufferGetBytesPerRow(this);
  v10 = CVPixelBufferGetBytesPerRow(*a2);
  bzero(v6, v10 * Height);
  if (Height)
  {
    for (i = 0; i != Height; ++i)
    {
      if (Width)
      {
        v12 = 0;
        v13 = Width;
        do
        {
          if (*(float *)&BaseAddress[v12] > 0.0)
            v6[v12 + 2] = 1;
          v12 += 4;
          --v13;
        }
        while (v13);
      }
      BaseAddress += BytesPerRow;
      v6 += v10;
    }
  }
  CVPixelBufferUnlockBaseAddress(this, 1uLL);
  return CVPixelBufferUnlockBaseAddress(*a2, 0);
}

void utils::WriteToTiff(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  v9 = (void *)MEMORY[0x24BDBCF48];
  if (*((char *)a2 + 23) >= 0)
    v10 = a2;
  else
    v10 = (uint64_t *)*a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "writeTIFFRepresentationOfImage:toURL:format:colorSpace:options:error:", v13, v12, a3, a4, MEMORY[0x24BDBD1B8], 0);

}

void sub_22955001C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

_QWORD *std::vector<vImage_Buffer>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<vImage_Buffer>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 32 * a2);
    a1[1] = &v4[32 * a2];
  }
  return a1;
}

void sub_2295500E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<vImage_Buffer>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<utils::OUImageUtils::PreAllocateInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
  JUMPOUT(0x22E2CAAE8);
}

_QWORD *std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F243C88;
  return result;
}

void std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F243C88;
}

vImage_Error std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  return vImageConvert_FTo16U(*a2, *a3, 0.0, 0.001, 0);
}

uint64_t std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertDepthF32ToU16(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
  JUMPOUT(0x22E2CAAE8);
}

_QWORD *std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F243D18;
  return result;
}

void std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F243D18;
}

vImage_Error std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  const vImage_Buffer *v3;
  const vImage_Buffer *v4;
  uint8_t permuteMap[4];

  v3 = *a2;
  v4 = *a3;
  *(_DWORD *)permuteMap = 66051;
  if (!byte_255A53260)
    std::__throw_bad_optional_access[abi:ne180100]();
  return vImageConvert_ARGB8888To420Yp8_CbCr8(v3, v4, v4 + 1, (const vImage_ARGBToYpCbCr *)&utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::conversion_info, permuteMap, 0);
}

uint64_t std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor32BGRATo420f(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
  JUMPOUT(0x22E2CAAE8);
}

_QWORD *std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F243D98;
  return result;
}

void std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F243D98;
}

vImage_Error std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  const vImage_Buffer *v3;
  const vImage_Buffer *v4;
  uint8_t permuteMap[4];

  v3 = *a2;
  v4 = *a3;
  *(_DWORD *)permuteMap = 66051;
  if (!byte_255A532F0)
    std::__throw_bad_optional_access[abi:ne180100]();
  return vImageConvert_420Yp8_CbCr8ToARGB8888(v3, v3 + 1, v4, (const vImage_YpCbCrToARGB *)&utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::conversion_info, permuteMap, 0xFFu, 0);
}

uint64_t std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0,std::allocator<utils::ConvertColor420fTo32BGRA(__CVBuffer *,__CVBuffer *&)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id GenerateCIImage(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithMTLTexture:options:", v1, 0);

  return v2;
}

void sub_229550440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void DownloadMTLTexture(void *a1, uint64_t *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    v5 = objc_msgSend(v3, "width");
    v6 = objc_msgSend(v4, "height");
    v7 = *a2;
    memset(v8, 0, 24);
    v8[3] = v5;
    v8[4] = v6;
    v8[5] = 1;
    objc_msgSend(v4, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v7, objc_msgSend(v4, "width"), v8, 0);
  }

}

void sub_2295504D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL IsObjectBelongType(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _BOOL8 v7;
  BOOL v8;

  v3 = a1;
  v4 = a2[1];
  if (*a2 == v4)
  {
    v7 = 0;
  }
  else
  {
    v5 = *a2 + 8;
    do
    {
      v6 = *(id *)(v5 - 8);
      v7 = v6 == v3;
      v8 = v6 == v3 || v5 == v4;
      v5 += 8;
    }
    while (!v8);
  }

  return v7;
}

__CFString *ObjectTypeConversion(NSString *a1)
{
  NSString *v1;
  __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if (-[NSString isEqualToString:](v1, "isEqualToString:", CFSTR("Shelf")))
    v2 = CFSTR("Cabinet");
  else
    v2 = (__CFString *)v1;
  v3 = v2;

  return v3;
}

void sub_229550594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t utils::OUFrameWriter::OUFrameWriter(uint64_t a1, char *a2, uint64_t a3, char a4)
{
  void **v5;
  std::__fs::filesystem::path *v6;
  void **v7;
  void **v8;
  _QWORD *v9;
  NSObject *v10;
  std::string::size_type v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  std::string __p;
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[10];
  char v24;
  uint64_t v25;
  std::__fs::filesystem::path buf;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void **)(a1 + 8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = a4;
  v6 = (std::__fs::filesystem::path *)(a1 + 40);
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>((std::string *)(a1 + 40), a2);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v7 = (void **)(a1 + 64);
  *(_QWORD *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 176) = 0u;
  v8 = (void **)(a1 + 176);
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_QWORD *)(a1 + 224) = 0;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v21);
  buf.__pn_.__r_.__value_.__s.__data_[0] = 48;
  v9 = std::operator<<[abi:ne180100]<std::char_traits<char>>(&v22, (char *)&buf);
  *(_QWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 24) = 8;
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v23, &buf);
  if (*(char *)(a1 + 31) < 0)
    operator delete(*v5);
  *(std::__fs::filesystem::path *)v5 = buf;
  std::__fs::filesystem::path::append[abi:ne180100]<std::string>(&v6->__pn_, (uint64_t)v5);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "cvplayer");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)v6, &buf);
  if (*(char *)(a1 + 87) < 0)
    operator delete(*v7);
  *(_OWORD *)v7 = *(_OWORD *)&buf.__pn_.__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)&buf.__pn_.__r_.__value_.__l + 2);
  *((_BYTE *)&buf.__pn_.__r_.__value_.__s + 23) = 0;
  buf.__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__fs::filesystem::__status(v6, 0);
  if (buf.__pn_.__r_.__value_.__s.__data_[0] && buf.__pn_.__r_.__value_.__s.__data_[0] != 255)
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (std::string::size_type)v6;
      if (*(char *)(a1 + 63) < 0)
        v11 = v6->__pn_.__r_.__value_.__r.__words[0];
      LODWORD(buf.__pn_.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
      WORD2(buf.__pn_.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__pn_.__r_.__value_.__r.__words[1] + 6) = v11;
      _os_log_impl(&dword_2294C8000, v10, OS_LOG_TYPE_INFO, "[%s] path %s already exists; override existing dataset.",
        (uint8_t *)&buf,
        0x16u);
    }
  }
  else
  {
    if (std::__fs::filesystem::__create_directories(v6, 0))
      goto LABEL_17;
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      utils::OUFrameWriter::OUFrameWriter(a1, v6, v10);
  }

LABEL_17:
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "color");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "depth");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "label");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&__p, "vote");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, a1 + 64, &buf);
  std::__fs::filesystem::__create_directories(&buf, 0);
  if (SHIBYTE(buf.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v12 = objc_alloc_init(MEMORY[0x24BDBF648]);
  v13 = *(void **)(a1 + 224);
  *(_QWORD *)(a1 + 224) = v12;

  *(_QWORD *)(a1 + 232) = CGColorSpaceCreateDeviceRGB();
  *(_QWORD *)(a1 + 240) = CGColorSpaceCreateDeviceGray();
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = *v8;
  *v8 = v14;

  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = *(void **)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v16;

  v21[0] = *MEMORY[0x24BEDB7F0];
  v18 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v21 + *(_QWORD *)(v21[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v22 = v18;
  v23[0] = MEMORY[0x24BEDB848] + 16;
  if (v24 < 0)
    operator delete((void *)v23[8]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22E2CAA7C](&v25);
  return a1;
}

void sub_2295509FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;
  void **v16;
  void **v17;
  void **v18;
  uint64_t v19;

  if (*(char *)(v19 - 73) < 0)
    operator delete(*(void **)(v19 - 96));
  if (a14 < 0)
    operator delete(__p);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);

  if (*(char *)(v15 + 87) < 0)
    operator delete(*v18);
  if (*(char *)(v15 + 63) < 0)
    operator delete(*v17);
  if (*(char *)(v15 + 31) < 0)
    operator delete(*v16);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_229550BE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x22E2CAA7C](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *a2)
{
  char *v3;
  int v4;
  const std::locale::facet *v5;
  int v6;
  std::locale v8;

  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
    v5 = std::locale::use_facet(&v8, MEMORY[0x24BEDB350]);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_229550C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

std::__fs::filesystem::path *std::__fs::filesystem::operator/[abi:ne180100]@<X0>(std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&a3->__pn_, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  return std::__fs::filesystem::path::operator/=[abi:ne180100](a3, this);
}

void sub_229550CFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22E2CAA7C](a1 + 128);
  return a1;
}

void utils::OUFrameWriter::~OUFrameWriter(utils::OUFrameWriter *this)
{
  CVPixelBufferRelease(*((CVPixelBufferRef *)this + 24));
  CVPixelBufferRelease(*((CVPixelBufferRef *)this + 25));
  CVPixelBufferRelease(*((CVPixelBufferRef *)this + 26));
  CVPixelBufferRelease(*((CVPixelBufferRef *)this + 27));
  CGColorSpaceRelease(*((CGColorSpaceRef *)this + 29));
  CGColorSpaceRelease(*((CGColorSpaceRef *)this + 30));

  if (*((char *)this + 87) < 0)
    operator delete(*((void **)this + 8));
  if (*((char *)this + 63) < 0)
    operator delete(*((void **)this + 5));
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

void utils::OUFrameWriter::Write(utils::OUFrameWriter *a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  _OUFrame *v7;

  v7 = a2;
  v5 = a3;
  v6 = *(_QWORD *)a1 + 1;
  *(_QWORD *)a1 = v6;
  utils::OUFrameWriter::WriteFrame(a1, v7, v6);
  utils::OUFrameWriter::WriteKeyframe(a1, v5);

}

void sub_229550EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void utils::OUFrameWriter::WriteFrame(utils::OUFrameWriter *this, _OUFrame *a2, unint64_t a3)
{
  _OUFrame *v5;
  double v6;
  double v7;
  unsigned int Width;
  unsigned int Height;
  unsigned int v10;
  _BOOL4 v12;
  float32x4_t v13;
  float32x4_t v14;
  int8x16_t v15;
  float64x2_t v16;
  uint64x2_t v17;
  float64x2_t v18;
  double v19;
  NSObject *v20;
  float32_t v21;
  float32x4_t v22;
  unsigned int v23;
  float32x4_t v24;
  uint32x2_t v25;
  uint32x4_t v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  size_t v33;
  std::string *v34;
  char *v35;
  std::string *v36;
  std::string::size_type size;
  std::string *v38;
  __int128 v39;
  std::string *v40;
  __int128 v41;
  uint64_t v42;
  __CVBuffer *v43;
  unsigned int *v44;
  __CVBuffer *CVPixelBuffer;
  uint64_t v46;
  std::string *v47;
  uint64_t v48;
  NSObject *v49;
  utils *v50;
  __CVBuffer **v51;
  NSObject *v52;
  uint64_t v53;
  utils *v54;
  __CVBuffer **v55;
  uint64_t v56;
  uint64_t v57;
  utils *v58;
  __CVBuffer **v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  utils::_anonymous_namespace_ *v65;
  const std::__fs::filesystem::path *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  std::string *v81;
  void *v82;
  utils::_anonymous_namespace_ *v83;
  const std::__fs::filesystem::path *v84;
  utils::_anonymous_namespace_ *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  float64x2_t v101;
  void *v102;
  float32x4_t v103;
  void *v104;
  float32x4_t v105;
  __int128 v106;
  int8x16_t v107;
  float32x4_t v108;
  __int128 v109;
  double v110;
  float32x4_t v111;
  __int128 v112;
  double v113;
  float32x4_t v114;
  __int128 v115;
  char *v116;
  _OUFrame *v117;
  std::string v118;
  void *v119[2];
  std::string::size_type v120;
  const __CFString *v121;
  void *v122;
  uint8_t buf[416];
  uint64_t v124;
  std::string __p;
  void *v126;
  std::__fs::filesystem::path v127;
  void *v128;
  std::string v129;
  void *v130;
  std::string v131;
  void *v132;
  std::string v133;
  std::string *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!v5)
    goto LABEL_137;
  v117 = v5;
  -[_OUFrame sceneCamera](v5, "sceneCamera");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "imageResolution");
  v113 = v6;
  objc_msgSend(v102, "imageResolution");
  v110 = v7;
  Width = CVPixelBufferGetWidth(-[_OUFrame sceneDepthBuffer](v117, "sceneDepthBuffer"));
  Height = CVPixelBufferGetHeight(-[_OUFrame sceneDepthBuffer](v117, "sceneDepthBuffer"));
  v10 = Height;
  v12 = (int)v113 != Width || (int)v110 != Height;
  objc_msgSend(v102, "intrinsics");
  if (v12)
  {
    v103 = v13;
    v105 = v14;
    v107 = v15;
    v16.f64[0] = v113;
    v16.f64[1] = v110;
    v17.i64[0] = Width;
    v17.i64[1] = v10;
    v18 = vdivq_f64(vcvtq_f64_u64(v17), v16);
    v19 = v18.f64[1];
    v101 = v18;
    if (vabdd_f64(v18.f64[0], v18.f64[1]) > 0.000001)
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "OUFrameWriter";
        _os_log_impl(&dword_2294C8000, v20, OS_LOG_TYPE_INFO, "[%s] downsample factor is not the same in x and y direction.", buf, 0xCu);
      }

    }
    v21 = v101.f64[0] * v103.f32[0];
    v22.i32[3] = 0;
    v22.f32[0] = v21;
    *(uint64_t *)((char *)v22.i64 + 4) = *(uint64_t *)((char *)v103.i64 + 4);
    v111 = v22;
    *(float *)&v23 = v19 * v105.f32[1];
    v24.i64[0] = __PAIR64__(v23, v105.u32[0]);
    v24.i64[1] = v105.u32[2];
    v114 = v24;
    *(float32x2_t *)v22.f32 = vcvt_f32_f64(vmulq_f64(v101, vcvtq_f64_f32(*(float32x2_t *)v107.i8)));
    v22.i64[1] = vextq_s8(v107, v107, 8uLL).u32[0];
    v108 = v22;
  }
  else
  {
    v13.i32[3] = 0;
    v14.i32[3] = 0;
    v15.i32[3] = 0;
    v108 = (float32x4_t)v15;
    v111 = v13;
    v114 = v14;
  }
  if (!*((_BYTE *)this + 160))
    goto LABEL_22;
  v25 = (uint32x2_t)vceq_s32(*(int32x2_t *)((char *)this + 96), (int32x2_t)__PAIR64__(v10, Width));
  if ((vpmin_u32(v25, v25).u32[0] & 0x80000000) != 0)
  {
    v26 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*((float32x4_t *)this + 8), v114), (int8x16_t)vceqq_f32(*((float32x4_t *)this + 7), v111)), (int8x16_t)vceqq_f32(*((float32x4_t *)this + 9), v108));
    v26.i32[3] = v26.i32[2];
    if ((vminvq_u32(v26) & 0x80000000) != 0)
      goto LABEL_21;
  }
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "OUFrameWriter";
    _os_log_impl(&dword_2294C8000, v27, OS_LOG_TYPE_INFO, "[%s] camera parameter have changed; the latest one will be saved.",
      buf,
      0xCu);
  }

  if (*((_BYTE *)this + 160))
  {
LABEL_21:
    *((_QWORD *)this + 12) = __PAIR64__(v10, Width);
    *((float32x4_t *)this + 7) = v111;
    *((float32x4_t *)this + 8) = v114;
    *((float32x4_t *)this + 9) = v108;
  }
  else
  {
LABEL_22:
    *((_QWORD *)this + 12) = __PAIR64__(v10, Width);
    *((float32x4_t *)this + 7) = v111;
    *((float32x4_t *)this + 8) = v114;
    *((float32x4_t *)this + 9) = v108;
    *((_BYTE *)this + 160) = 1;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v131, "camera.txt");
  v116 = (char *)this + 64;
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v131, (uint64_t)this + 64, (std::__fs::filesystem::path *)&v133);
  std::ofstream::basic_ofstream(buf);
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  if (!*((_BYTE *)this + 160))
    std::__throw_bad_optional_access[abi:ne180100]();
  v28 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)" ", 1);
  v29 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" ", 1);
  v30 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)" ", 1);
  v31 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)" ", 1);
  v32 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)" ", 1);
  std::ostream::operator<<();
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)], *(_DWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24) + 32] | 4);
  if (*((char *)this + 31) >= 0)
    v33 = *((unsigned __int8 *)this + 31);
  else
    v33 = *((_QWORD *)this + 2);
  v34 = &v131;
  std::string::basic_string[abi:ne180100]((uint64_t)&v131, v33 + 1);
  if ((v131.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v34 = (std::string *)v131.__r_.__value_.__r.__words[0];
  if (v33)
  {
    if (*((char *)this + 31) >= 0)
      v35 = (char *)this + 8;
    else
      v35 = (char *)*((_QWORD *)this + 1);
    memmove(v34, v35, v33);
  }
  *(_WORD *)((char *)&v34->__r_.__value_.__l.__data_ + v33) = 95;
  std::to_string(&v129, a3);
  if ((v129.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v36 = &v129;
  else
    v36 = (std::string *)v129.__r_.__value_.__r.__words[0];
  if ((v129.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v129.__r_.__value_.__r.__words[2]);
  else
    size = v129.__r_.__value_.__l.__size_;
  v38 = std::string::append(&v131, (const std::string::value_type *)v36, size);
  v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
  v133.__r_.__value_.__r.__words[2] = v38->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v133.__r_.__value_.__l.__data_ = v39;
  v38->__r_.__value_.__l.__size_ = 0;
  v38->__r_.__value_.__r.__words[2] = 0;
  v38->__r_.__value_.__r.__words[0] = 0;
  v40 = std::string::append(&v133, ".tiff", 5uLL);
  v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  v120 = v40->__r_.__value_.__r.__words[2];
  *(_OWORD *)v119 = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v129.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v129, "color");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v129, (uint64_t)v116, (std::__fs::filesystem::path *)&v131);
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&v127.__pn_, (char *)v119);
  std::__fs::filesystem::operator/[abi:ne180100](&v127, (uint64_t)&v131, (std::__fs::filesystem::path *)&v133);
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v118, v133.__r_.__value_.__l.__data_, v133.__r_.__value_.__l.__size_);
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v133.__r_.__value_.__l.__data_);
  }
  else
  {
    v118 = v133;
  }
  if (SHIBYTE(v127.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v129.__r_.__value_.__l.__data_);
  v42 = -[_OUFrame GetSceneColorBufferBGRA](v117, "GetSceneColorBufferBGRA");
  v43 = (__CVBuffer *)v42;
  v44 = (unsigned int *)MEMORY[0x24BDBF868];
  if (v12)
  {
    CVPixelBuffer = (__CVBuffer *)*((_QWORD *)this + 24);
    if (!CVPixelBuffer)
    {
      CVPixelBuffer = CreateCVPixelBuffer(Width, v10);
      *((_QWORD *)this + 24) = CVPixelBuffer;
    }
    v133.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24F243E18;
    v134 = &v133;
    v46 = utils::ConvertCVPixelBuffer(v43, CVPixelBuffer, (uint64_t)&v133);
    v47 = v134;
    if (v134 == &v133)
    {
      v48 = 4;
      v47 = &v133;
    }
    else
    {
      if (!v134)
        goto LABEL_71;
      v48 = 5;
    }
    (*(void (**)(void))(v47->__r_.__value_.__r.__words[0] + 8 * v48))();
LABEL_71:
    if (v46)
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        LODWORD(v133.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v133.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
        _os_log_impl(&dword_2294C8000, v49, OS_LOG_TYPE_INFO, "[%s] failed to downsample color image.", (uint8_t *)&v133, 0xCu);
      }

    }
    else
    {
      utils::WriteToTiff(*((_QWORD *)this + 24), (uint64_t *)&v118, *v44, *((_QWORD *)this + 29), *((void **)this + 28));
    }
    goto LABEL_76;
  }
  utils::WriteToTiff(v42, (uint64_t *)&v118, *MEMORY[0x24BDBF868], *((_QWORD *)this + 29), *((void **)this + 28));
LABEL_76:
  v50 = -[_OUFrame sceneDepthBuffer](v117, "sceneDepthBuffer");
  if (utils::ConvertDepthF32ToU16(v50, (CVPixelBufferRef *)this + 25, v51))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      LODWORD(v133.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v133.__r_.__value_.__r.__words + 4) = (std::string::size_type)"OUFrameWriter";
      _os_log_impl(&dword_2294C8000, v52, OS_LOG_TYPE_INFO, "[%s] failed to convert depth image.", (uint8_t *)&v133, 0xCu);
    }

  }
  else
  {
    v53 = *((_QWORD *)this + 25);
    std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v127.__pn_, "depth");
    std::__fs::filesystem::operator/[abi:ne180100](&v127, (uint64_t)v116, (std::__fs::filesystem::path *)&v129);
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v119);
    std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v129, (std::__fs::filesystem::path *)&v131);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v133, v131.__r_.__value_.__l.__data_, v131.__r_.__value_.__l.__size_);
    else
      v133 = v131;
    utils::WriteToTiff(v53, (uint64_t *)&v133, *MEMORY[0x24BDBF870], *((_QWORD *)this + 30), *((void **)this + 28));
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v133.__r_.__value_.__l.__data_);
    if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v131.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v129.__r_.__value_.__l.__data_);
    if (SHIBYTE(v127.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v127.__pn_.__r_.__value_.__l.__data_);
  }
  v54 = -[_OUFrame semanticLabelBuffer](v117, "semanticLabelBuffer");
  utils::ConvertLabelL008To32BGRA(v54, (CVPixelBufferRef *)this + 26, v55);
  v56 = *((_QWORD *)this + 26);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v127.__pn_, "label");
  std::__fs::filesystem::operator/[abi:ne180100](&v127, (uint64_t)v116, (std::__fs::filesystem::path *)&v129);
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v119);
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v129, (std::__fs::filesystem::path *)&v131);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v133, v131.__r_.__value_.__l.__data_, v131.__r_.__value_.__l.__size_);
  else
    v133 = v131;
  v57 = *v44;
  utils::WriteToTiff(v56, (uint64_t *)&v133, v57, *((_QWORD *)this + 29), *((void **)this + 28));
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v129.__r_.__value_.__l.__data_);
  if (SHIBYTE(v127.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127.__pn_.__r_.__value_.__l.__data_);
  v58 = -[_OUFrame semanticConfidenceBuffer](v117, "semanticConfidenceBuffer");
  utils::ConvertConfidenceL00fToVote32BGRA(v58, (CVPixelBufferRef *)this + 27, v59);
  v60 = *((_QWORD *)this + 27);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v127.__pn_, "vote");
  std::__fs::filesystem::operator/[abi:ne180100](&v127, (uint64_t)v116, (std::__fs::filesystem::path *)&v129);
  std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(&__p, (char *)v119);
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&__p, (uint64_t)&v129, (std::__fs::filesystem::path *)&v131);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v133, v131.__r_.__value_.__l.__data_, v131.__r_.__value_.__l.__size_);
  else
    v133 = v131;
  utils::WriteToTiff(v60, (uint64_t *)&v133, v57, *((_QWORD *)this + 29), *((void **)this + 28));
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v129.__r_.__value_.__l.__data_);
  if (SHIBYTE(v127.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127.__pn_.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)this);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)*((_QWORD *)this + 22);
  v121 = CFSTR("timestamp");
  v62 = (void *)MEMORY[0x24BDD16E0];
  -[_OUFrame timestamp](v117, "timestamp");
  objc_msgSend(v62, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v63;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v64, v104);

  v65 = (utils::_anonymous_namespace_ *)*((_QWORD *)this + 22);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v131, "image_meta.json");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v131, (uint64_t)v116, (std::__fs::filesystem::path *)&v133);
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);
  v86 = (void *)*((_QWORD *)this + 23);
  v99 = *((unsigned __int8 *)this + 32);
  if (*((_BYTE *)this + 32))
  {
    -[_OUFrame sceneCamera](v117, "sceneCamera");
    v65 = (utils::_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
    -[utils::_anonymous_namespace_ pose](v65, "pose");
  }
  else
  {
    -[_OUFrame GetSceneCameraPoseInVisionWorld](v117, "GetSceneCameraPoseInVisionWorld");
  }
  v112 = v68;
  v115 = v67;
  v106 = v70;
  v109 = v69;
  v85 = v65;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v67);
  v131.__r_.__value_.__r.__words[0] = objc_claimAutoreleasedReturnValue();
  v100 = (void *)v131.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v112);
  v131.__r_.__value_.__l.__size_ = objc_claimAutoreleasedReturnValue();
  v98 = (void *)v131.__r_.__value_.__l.__size_;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v109);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v131.__r_.__value_.__r.__words[2] = (std::string::size_type)v97;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", *(double *)&v106);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v96;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v133.__r_.__value_.__r.__words[0] = (std::string::size_type)v95;
  HIDWORD(v71) = DWORD1(v115);
  LODWORD(v71) = DWORD1(v115);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v71);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v129.__r_.__value_.__r.__words[0] = (std::string::size_type)v94;
  HIDWORD(v72) = DWORD1(v112);
  LODWORD(v72) = DWORD1(v112);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v72);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v129.__r_.__value_.__l.__size_ = (std::string::size_type)v93;
  HIDWORD(v73) = DWORD1(v109);
  LODWORD(v73) = DWORD1(v109);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v73);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v129.__r_.__value_.__r.__words[2] = (std::string::size_type)v92;
  HIDWORD(v74) = DWORD1(v106);
  LODWORD(v74) = DWORD1(v106);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v74);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v91;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v129, 4);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v133.__r_.__value_.__l.__size_ = (std::string::size_type)v90;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v115), DWORD2(v115))));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v127.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v89;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v112), DWORD2(v112))));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v127.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v88;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v109), DWORD2(v109))));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v127.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)v87;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v106), DWORD2(v106))));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v75;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 4);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v133.__r_.__value_.__r.__words[2] = (std::string::size_type)v76;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v115), HIDWORD(v115))));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v77;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v112), HIDWORD(v112))));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)v78;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v109), HIDWORD(v109))));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)v79;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v106), HIDWORD(v106))));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v80;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &__p, 4);
  v81 = (std::string *)objc_claimAutoreleasedReturnValue();
  v134 = v81;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v86, "setObject:forKey:", v82, v104);
  if (v99)

  v83 = (utils::_anonymous_namespace_ *)*((_QWORD *)this + 23);
  std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(&v131, "pose.json");
  std::__fs::filesystem::operator/[abi:ne180100]((std::__fs::filesystem::path *)&v131, (uint64_t)v116, (std::__fs::filesystem::path *)&v133);
  if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v133.__r_.__value_.__l.__data_);
  if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v131.__r_.__value_.__l.__data_);

  if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v118.__r_.__value_.__l.__data_);
  if (SHIBYTE(v120) < 0)
    operator delete(v119[0]);
  *(_QWORD *)buf = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
  MEMORY[0x22E2CA944](&buf[8]);
  std::ostream::~ostream();
  MEMORY[0x22E2CAA7C](&v124);

  v5 = v117;
LABEL_137:

}

void sub_229551DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  uint64_t v61;

  if (*(char *)(v61 - 169) < 0)
    operator delete(*(void **)(v61 - 192));
  if (SLOBYTE(STACK[0x3C7]) < 0)
    operator delete((void *)STACK[0x3B0]);
  if (*(char *)(v61 - 201) < 0)
    operator delete(*(void **)(v61 - 224));
  if (*(char *)(v61 - 233) < 0)
    operator delete(*(void **)(v61 - 256));
  if (a50 < 0)
    operator delete(a45);
  if (a57 < 0)
    operator delete(a52);
  std::ofstream::~ofstream(&a61);

  _Unwind_Resume(a1);
}

void utils::OUFrameWriter::WriteKeyframe(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  std::string *p_pn;
  void *v22;
  uint64_t v23;
  id v24;
  std::__fs::filesystem::path v25;
  std::__fs::filesystem::path v26;
  std::__fs::filesystem::path __p;
  std::string pn;
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[10];
  char v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v24 = a2;
  if (v24)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v24, "count"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v4 = v24;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v35 != v6)
            objc_enumerationMutation(v4);
          v8 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
          OUKeyframeToDictionary(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v9, v11);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v5);
    }

    v12 = (void *)a1[22];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = &unk_24F24ACD8;
    if (v15)
      v16 = v15;
    v38[0] = CFSTR("timestamp");
    v38[1] = CFSTR("objects");
    v39[0] = v16;
    v39[1] = MEMORY[0x24BDBD1A8];
    v38[2] = CFSTR("keyframes");
    v39[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v29);
    v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v30, (uint64_t)"fp_input_", 9);
    pn.__r_.__value_.__s.__data_[0] = 48;
    v19 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v18, (char *)&pn);
    *(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 24) = 3;
    v20 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)".plist", 6);
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v31, &v25);
    v26 = v25;
    memset(&v25, 0, sizeof(v25));
    std::__fs::filesystem::operator/[abi:ne180100](&v26, (uint64_t)(a1 + 5), &__p);
    if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&pn, __p.__pn_.__r_.__value_.__l.__data_, __p.__pn_.__r_.__value_.__l.__size_);
      if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    }
    else
    {
      pn = __p.__pn_;
    }
    if (SHIBYTE(v26.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__pn_.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__pn_.__r_.__value_.__l.__data_);
    if ((pn.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_pn = &pn;
    else
      p_pn = (std::string *)pn.__r_.__value_.__r.__words[0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", p_pn);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "writeToFile:atomically:", v22, 1);

    if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
      operator delete(pn.__r_.__value_.__l.__data_);
    v29[0] = *MEMORY[0x24BEDB7F0];
    v23 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    *(_QWORD *)((char *)v29 + *(_QWORD *)(v29[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v30 = v23;
    v31[0] = MEMORY[0x24BEDB848] + 16;
    if (v32 < 0)
      operator delete((void *)v31[8]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x22E2CAA7C](&v33);

  }
}

void sub_2295525F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36)
{
  void *v36;
  void *v37;
  void *v38;

  if (a29 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a36);

  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::basic_ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 64;
  a1[52] = MEMORY[0x24BEDB840] + 64;
  v4 = a1 + 1;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 1);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[52] = v3;
  MEMORY[0x22E2CA938](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_2295527E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x22E2CAA7C](v1 + 416);
  _Unwind_Resume(a1);
}

void utils::`anonymous namespace'::WriteToJson(utils::_anonymous_namespace_ *this, NSDictionary *a2, const std::__fs::filesystem::path *a3)
{
  void *v4;
  Class isa;
  void *v6;
  void *v7;
  utils::_anonymous_namespace_ *v8;

  v8 = this;
  v4 = (void *)MEMORY[0x24BDBCF08];
  if (SHIBYTE(a2[2].super.isa) >= 0)
    isa = (Class)a2;
  else
    isa = a2->super.isa;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputStreamToFileAtPath:append:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "open");
  objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v8, v7, 0, 0);
  objc_msgSend(v7, "close");

}

void sub_2295528C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x22E2CA944](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x22E2CAA7C](a1 + 52);
  return a1;
}

std::__fs::filesystem::path *std::__fs::filesystem::path::operator/=[abi:ne180100](std::__fs::filesystem::path *a1, std::__fs::filesystem::path *this)
{
  int v4;
  std::__fs::filesystem::path *v5;
  std::string::size_type size;

  if (std::__fs::filesystem::path::__root_directory(this).__size_)
  {
    std::string::operator=(&a1->__pn_, &this->__pn_);
  }
  else
  {
    if (std::__fs::filesystem::path::__filename(a1).__size_)
      std::string::push_back(&a1->__pn_, 47);
    v4 = SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    if (v4 >= 0)
      v5 = this;
    else
      v5 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      size = HIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    else
      size = this->__pn_.__r_.__value_.__l.__size_;
    std::string::append(&a1->__pn_, (const std::string::value_type *)v5, size);
  }
  return a1;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  v4 = (int)v3 < 0;
  v5 = *((_QWORD *)a2 + 1);
  if ((int)v3 < 0)
    a2 = *(char **)a2;
  v3 = v3;
  if (v4)
    v3 = v5;
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_229552A08(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

std::string *std::__fs::filesystem::path::append[abi:ne180100]<std::string>(std::string *this, uint64_t a2)
{
  _BYTE *v4;
  int v5;
  BOOL v6;
  char *v7;
  uint64_t v8;

  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(_QWORD *)(a2 + 8))
      goto LABEL_9;
    v4 = *(_BYTE **)a2;
  }
  else
  {
    v4 = (_BYTE *)a2;
    if (!*(_BYTE *)(a2 + 23))
      goto LABEL_9;
  }
  if (*v4 == 47)
  {
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__r_.__value_.__l.__data_ = 0;
      this->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
    }
    goto LABEL_12;
  }
LABEL_9:
  if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)this).__size_)
    std::string::push_back(this, 47);
LABEL_12:
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = (char *)a2;
  else
    v7 = *(char **)a2;
  v8 = *(unsigned __int8 *)(a2 + 23);
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  std::string::append[abi:ne180100]<char const*,0>(this, v7, &v7[v8]);
  return this;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [9],void>(std::string *this, char *a2)
{
  char *v3;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = a2 - 1;
  while (*++v3)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_229552BF8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::~__func()
{
  JUMPOUT(0x22E2CAAE8);
}

_QWORD *std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24F243E18;
  return result;
}

void std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24F243E18;
}

vImage_Error std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::operator()(uint64_t a1, const vImage_Buffer **a2, const vImage_Buffer **a3)
{
  return vImageScale_ARGB8888(*a2, *a3, 0, 0);
}

uint64_t std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0,std::allocator<utils::OUFrameWriter::WriteFrame(_OUFrame *,unsigned long)::$_0>,long ()(vImage_Buffer const*,vImage_Buffer const*)>::target_type()
{
}

void _GLOBAL__sub_I_DataFileIO_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x22E2CB070]();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ObjectUnderstandingTests"));
  ObjectUnderstandingTest::Bundle = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v0);
}

ou3dor::OU3DORParser *ou3dor::OU3DORParser::OU3DORParser(ou3dor::OU3DORParser *this)
{
  std::string *Node;
  std::string *v3;
  std::string *v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string *v11;
  std::string *v12;
  std::string *v13;
  std::string *v14;
  std::string *v15;
  std::string *v16;
  std::string *v17;
  std::string *v18;
  std::string *v19;
  std::string *v20;
  std::string *v21;
  std::string *v22;
  std::string *v23;
  std::string *v24;
  std::string *v25;
  std::string *v26;
  std::string *v27;
  std::string *v28;
  std::string *v29;
  std::string *v30;
  std::string *v31;
  std::string *v32;
  std::string *v33;
  std::string *v34;
  std::string *v35;
  std::string *v36;
  std::string *v37;
  std::string *v38;
  std::string *v39;
  std::string *v40;
  std::string *v41;
  std::string *v42;
  std::string *v43;
  std::string *v44;
  std::string *v45;
  std::string *v46;
  std::string *v47;
  std::string *v48;
  std::string *v49;
  std::string *v50;
  std::string *v51;
  std::string *v52;
  std::string *v53;
  std::string *v54;
  std::string *v55;
  std::string *v56;
  std::string *v57;
  std::string *v58;
  std::string *v59;
  std::string *v60;
  std::string *v61;
  std::string *v62;
  std::string *v63;
  std::string *v64;
  std::string *v65;
  std::string *v66;
  std::string *v67;
  void *__p[2];
  char v70;
  void *v71[2];
  char v72;

  OU3DORIDTree::OU3DORIDTree(this);
  std::string::basic_string[abi:ne180100]<0>(v71, "Chair");
  std::string::basic_string[abi:ne180100]<0>(__p, "root");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)Node, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "Sofa");
  std::string::basic_string[abi:ne180100]<0>(__p, "root");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v3, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "Table");
  std::string::basic_string[abi:ne180100]<0>(__p, "root");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v4, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "Cabinet");
  std::string::basic_string[abi:ne180100]<0>(__p, "root");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v5, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v6, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_leg_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v7, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_arm_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v8, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_back_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v9, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_seat_height");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v10, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "chair_seat_shape");
  std::string::basic_string[abi:ne180100]<0>(__p, "Chair");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v11, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "sofa_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Sofa");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v12, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "sofa_arm_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Sofa");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v13, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "sofa_back_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Sofa");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v14, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "table_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Table");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v15, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "table_shape");
  std::string::basic_string[abi:ne180100]<0>(__p, "Table");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v16, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "table_leg_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Table");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v17, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "table_attribute");
  std::string::basic_string[abi:ne180100]<0>(__p, "Table");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v18, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "cabinet_type");
  std::string::basic_string[abi:ne180100]<0>(__p, "Cabinet");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v19, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "cabinet_attribute");
  std::string::basic_string[abi:ne180100]<0>(__p, "Cabinet");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v20, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "dining");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v21, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "stool");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v22, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "swivel");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v23, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "other");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v24, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "four");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v25, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "star");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v26, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "other");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v27, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "missing");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_arm_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v28, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "existing");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_arm_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v29, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "missing");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_back_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v30, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "existing");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_back_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v31, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "tall_seat");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_seat_height");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v32, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "normal/low_seat");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_seat_height");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v33, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "rectangular");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_seat_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v34, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "round");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_seat_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v35, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "none");
  std::string::basic_string[abi:ne180100]<0>(__p, "chair_seat_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v36, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "rectangular");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v37, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "lShaped");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v38, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "singleSeat");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v39, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "lShapedMain");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v40, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "lShapedExtension");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v41, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "lShapedMiddle");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v42, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "other");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v43, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "missing");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_arm_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v44, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "two_arms");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_arm_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v45, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "none");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_arm_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v46, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "missing");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_back_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v47, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "existing");
  std::string::basic_string[abi:ne180100]<0>(__p, "sofa_back_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v48, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "desk");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v49, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "coffee");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v50, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "dining");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v51, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "other");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v52, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "rectangular");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v53, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "lShaped");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v54, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "circularElliptic");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v55, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "other");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_shape");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v56, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "two_leg");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v57, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "four_leg");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v58, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "none");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_leg_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v59, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "with_storage");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_attribute");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v60, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "without_storage");
  std::string::basic_string[abi:ne180100]<0>(__p, "table_attribute");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v61, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "standalone_cabinet");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v62, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "kitchen_cabinet");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v63, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "nightstand");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v64, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "none");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_type");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v65, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "no_countertop");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_attribute");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v66, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  std::string::basic_string[abi:ne180100]<0>(v71, "with_countertop");
  std::string::basic_string[abi:ne180100]<0>(__p, "cabinet_attribute");
  OU3DORIDTree::AddNode((uint64_t)this, (uint64_t)v67, (unsigned __int8 **)__p);
  if (v70 < 0)
    operator delete(__p[0]);
  if (v72 < 0)
    operator delete(v71[0]);
  return this;
}

void sub_2295546AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  OU3DORIDTree *v20;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  OU3DORIDTree::~OU3DORIDTree(v20);
  _Unwind_Resume(a1);
}

std::string *ou3dor::`anonymous namespace'::CreateNode(uint64_t a1, uint64_t a2)
{
  std::string *v4;
  std::string *v5;

  v4 = (std::string *)operator new();
  v5 = v4;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  v5[1].__r_.__value_.__r.__words[0] = 0;
  v5[1].__r_.__value_.__l.__size_ = 0;
  v5[1].__r_.__value_.__r.__words[2] = 0;
  LODWORD(v5[2].__r_.__value_.__l.__data_) = a2;
  v5[2].__r_.__value_.__s.__data_[4] = BYTE4(a2);
  return v5;
}

void sub_229554DEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22E2CAAE8](v1, 0x1092C4055567BECLL);
  _Unwind_Resume(a1);
}

void ou3dor::OU3DORParser::ParseNetworkOutput(OU3DORIDTree::Node **a1@<X0>, _QWORD *a2@<X1>, unsigned __int8 **a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t Node;
  __int128 **v7;
  __int128 *v8;
  __int128 v9;
  unint64_t Range;
  int v11;
  unint64_t v12;
  float v13;
  float *v14;
  uint64_t v15;
  int v16;
  float v17;
  float v18;
  float *v19;
  float *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  float *v26;
  int v27;
  float *v28;
  double v29;
  float v30;
  OU3DORIDTree::Node *NodeBasedOnID;
  NSObject *v32;
  __int128 v33;
  float v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  __int128 **i;
  std::string v41;
  void *__p;
  float *v43;
  float *v44;
  std::string v45;
  std::string v46;
  std::string v47;
  std::string v48;
  float v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a2[1] - *a2;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  if (v4 == 188)
  {
    Node = OU3DORIDTree::FindNode((uint64_t)a1, a3);
    v7 = *(__int128 ***)(Node + 24);
    for (i = *(__int128 ***)(Node + 32); v7 != i; ++v7)
    {
      v8 = *v7;
      if (*((char *)*v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
      }
      else
      {
        v9 = *v8;
        v45.__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 2);
        *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v9;
      }
      Range = OU3DORIDTree::FindRange((uint64_t)a1, (unsigned __int8 **)&v45);
      v11 = Range;
      v12 = HIDWORD(Range);
      __p = 0;
      v43 = 0;
      v44 = 0;
      v13 = expf(*(float *)(*a2 + 4 * (int)Range));
      if (v11 <= (int)v12)
      {
        v14 = 0;
        v15 = v11;
        v16 = v12 + 1;
        do
        {
          v17 = expf(*(float *)(*a2 + 4 * v15));
          v18 = v17;
          if (v14 >= v44)
          {
            v20 = (float *)__p;
            v21 = ((char *)v14 - (_BYTE *)__p) >> 2;
            v22 = v21 + 1;
            if ((unint64_t)(v21 + 1) >> 62)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v23 = (char *)v44 - (_BYTE *)__p;
            if (((char *)v44 - (_BYTE *)__p) >> 1 > v22)
              v22 = v23 >> 1;
            if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
              v24 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v24 = v22;
            if (v24)
            {
              v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v44, v24);
              v20 = (float *)__p;
              v14 = v43;
            }
            else
            {
              v25 = 0;
            }
            v26 = (float *)&v25[4 * v21];
            *v26 = v18;
            v19 = v26 + 1;
            while (v14 != v20)
            {
              v27 = *((_DWORD *)v14-- - 1);
              *((_DWORD *)v26-- - 1) = v27;
            }
            __p = v26;
            v43 = v19;
            v44 = (float *)&v25[4 * v24];
            if (v20)
              operator delete(v20);
          }
          else
          {
            *v14 = v17;
            v19 = v14 + 1;
          }
          v43 = v19;
          if (*(v19 - 1) >= v13)
          {
            v13 = *(v19 - 1);
            v11 = v15;
          }
          ++v15;
          v14 = v19;
        }
        while (v16 != (_DWORD)v15);
      }
      LODWORD(v46.__r_.__value_.__l.__data_) = v11;
      {
        v28 = (float *)__p;
        v29 = 0.0;
        while (v28 != v43)
        {
          v30 = *v28++;
          v29 = v29 + v30;
        }
        NodeBasedOnID = OU3DORIDTree::FindNodeBasedOnID(a1, v11);
        if (NodeBasedOnID)
        {
          OU3DORIDTree::GetRootToNodePath(a1, v11, 45, &v41);
          if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v46, v45.__r_.__value_.__l.__data_, v45.__r_.__value_.__l.__size_);
          else
            v46 = v45;
          if (*((char *)NodeBasedOnID + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)NodeBasedOnID, *((_QWORD *)NodeBasedOnID + 1));
          }
          else
          {
            v33 = *(_OWORD *)NodeBasedOnID;
            v47.__r_.__value_.__r.__words[2] = *((_QWORD *)NodeBasedOnID + 2);
            *(_OWORD *)&v47.__r_.__value_.__l.__data_ = v33;
          }
          if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v48, v41.__r_.__value_.__l.__data_, v41.__r_.__value_.__l.__size_);
          else
            v48 = v41;
          v34 = v13 / v29;
          v49 = v34;
          v35 = a4[1];
          if (v35 >= a4[2])
          {
            v36 = std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__push_back_slow_path<ou3dor::OU3DORParser::AttibuteInfo const&>(a4, (__int128 *)&v46);
            v37 = a4;
          }
          else
          {
            std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>((std::string *)a4[1], (__int128 *)&v46);
            v36 = v35 + 80;
            v37 = a4;
            a4[1] = v35 + 80;
          }
          v37[1] = v36;
          if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v48.__r_.__value_.__l.__data_);
          if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v47.__r_.__value_.__l.__data_);
          if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v46.__r_.__value_.__l.__data_);
          if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v41.__r_.__value_.__l.__data_);
        }
        else
        {
          _OULoggingGetOSLogForCategoryObjectUnderstanding();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v46.__r_.__value_.__l.__data_) = 67109120;
            HIDWORD(v46.__r_.__value_.__r.__words[0]) = v11;
            _os_log_error_impl(&dword_2294C8000, v32, OS_LOG_TYPE_ERROR, "There is no node for id: %d", (uint8_t *)&v46, 8u);
          }

        }
      }
      if (__p)
      {
        v43 = (float *)__p;
        operator delete(__p);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
    }
  }
}

void sub_229555238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  a33 = a14;
  std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&a33);
  _Unwind_Resume(a1);
}

void ou3dor::OU3DORParser::AttibuteInfo::~AttibuteInfo(void **this)
{
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

uint64_t std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__push_back_slow_path<ou3dor::OU3DORParser::AttibuteInfo const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  std::string *v14;
  std::string::value_type *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x199999999999999)
    v9 = 0x333333333333333;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ou3dor::OU3DORParser::AttibuteInfo>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = (std::string *)&v10[80 * v4];
  v16 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>(v14, a2);
  v15 = &v14[3].__r_.__value_.__s.__data_[8];
  std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_22955544C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *std::construct_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,ou3dor::OU3DORParser::AttibuteInfo const&,ou3dor::OU3DORParser::AttibuteInfo*>(std::string *this, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  v6 = this + 2;
  if (*((char *)a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  }
  else
  {
    v7 = a2[3];
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 8);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  LODWORD(this[3].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 18);
  return this;
}

void sub_229555518(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<ou3dor::OU3DORParser::AttibuteInfo>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *result;
  v3 = result[1];
  v4 = a2[1];
  if (v3 == *result)
  {
    v5 = a2[1];
  }
  else
  {
    do
    {
      v5 = v4 - 80;
      v6 = *(_OWORD *)(v3 - 80);
      *(_QWORD *)(v4 - 64) = *(_QWORD *)(v3 - 64);
      *(_OWORD *)(v4 - 80) = v6;
      *(_QWORD *)(v3 - 72) = 0;
      *(_QWORD *)(v3 - 64) = 0;
      *(_QWORD *)(v3 - 80) = 0;
      v7 = *(_OWORD *)(v3 - 56);
      *(_QWORD *)(v4 - 40) = *(_QWORD *)(v3 - 40);
      *(_OWORD *)(v4 - 56) = v7;
      *(_QWORD *)(v3 - 48) = 0;
      *(_QWORD *)(v3 - 40) = 0;
      *(_QWORD *)(v3 - 56) = 0;
      v8 = *(_OWORD *)(v3 - 32);
      *(_QWORD *)(v4 - 16) = *(_QWORD *)(v3 - 16);
      *(_OWORD *)(v4 - 32) = v8;
      *(_QWORD *)(v3 - 24) = 0;
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 32) = 0;
      *(_DWORD *)(v4 - 8) = *(_DWORD *)(v3 - 8);
      v3 -= 80;
      v4 -= 80;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v9 = *result;
  *result = v5;
  a2[1] = v9;
  v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ou3dor::OU3DORParser::AttibuteInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

uint64_t std::__split_buffer<ou3dor::OU3DORParser::AttibuteInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<ou3dor::OU3DORParser::AttibuteInfo,0>(i - 80);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::unordered_set<ou3dor::PartAttributeID>::unordered_set(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 4 * a3;
    do
    {
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1, a2, a2);
      ++a2;
      v5 -= 4;
    }
    while (v5);
  }
  return a1;
}

void sub_2295556F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void _GLOBAL__sub_I_OU3DORParser_mm()
{
  void *v0;
  uint64_t i;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  int v21;
  const __CFString *v22;
  int v23;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  int v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  int v31;
  const __CFString *v32;
  int v33;
  const __CFString *v34;
  int v35;
  const __CFString *v36;
  int v37;
  const __CFString *v38;
  int v39;
  const __CFString *v40;
  int v41;
  const __CFString *v42;
  int v43;
  const __CFString *v44;
  int v45;
  const __CFString *v46;
  int v47;
  const __CFString *v48;
  int v49;
  const __CFString *v50;
  int v51;
  const __CFString *v52;
  int v53;
  const __CFString *v54;
  int v55;
  const __CFString *v56;
  int v57;
  const __CFString *v58;
  int v59;
  const __CFString *v60;
  int v61;
  const __CFString *v62;
  int v63;
  const __CFString *v64;
  int v65;
  const __CFString *v66;
  int v67;
  const __CFString *v68;
  int v69;
  const __CFString *v70;
  int v71;
  const __CFString *v72;
  int v73;
  const __CFString *v74;
  int v75;
  const __CFString *v76;
  int v77;
  const __CFString *v78;
  int v79;
  const __CFString *v80;
  int v81;
  const __CFString *v82;
  int v83;
  const __CFString *v84;
  int v85;
  const __CFString *v86;
  int v87;
  const __CFString *v88;
  int v89;
  const __CFString *v90;
  int v91;
  const __CFString *v92;
  int v93;
  const __CFString *v94;
  int v95;
  const __CFString *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22E2CB070]();
  *((_QWORD *)&v2 + 1) = CFSTR("Chair-chair_type-dining");
  LODWORD(v3) = 2;
  *((_QWORD *)&v3 + 1) = CFSTR("Chair-chair_type-swivel");
  LODWORD(v4) = 3;
  *((_QWORD *)&v4 + 1) = CFSTR("Chair-chair_type-other");
  LODWORD(v5) = 4;
  *((_QWORD *)&v5 + 1) = CFSTR("Chair-chair_leg_type-four");
  LODWORD(v6) = 5;
  *((_QWORD *)&v6 + 1) = CFSTR("Chair-chair_leg_type-star");
  LODWORD(v7) = 6;
  v8 = CFSTR("Chair-chair_leg_type-other");
  v9 = 7;
  v10 = CFSTR("Chair-chair_arm_type-missing");
  v11 = 8;
  v12 = CFSTR("Chair-chair_arm_type-existing");
  v13 = 9;
  v14 = CFSTR("Chair-chair_back_type-missing");
  v15 = 10;
  v16 = CFSTR("Chair-chair_back_type-existing");
  v17 = 11;
  v18 = CFSTR("Chair-chair_seat_height-tall_seat");
  v19 = 12;
  v20 = CFSTR("Chair-chair_seat_height-normal/low_seat");
  v21 = 13;
  v22 = CFSTR("Chair-chair_seat_shape-rectangular");
  v23 = 14;
  v24 = CFSTR("Chair-chair_seat_shape-round");
  v25 = 15;
  v26 = CFSTR("Chair-chair_seat_shape-none");
  v27 = 16;
  v28 = CFSTR("Sofa-sofa_type-rectangular");
  v29 = 17;
  v30 = CFSTR("Sofa-sofa_type-lShaped");
  v31 = 18;
  v32 = CFSTR("Sofa-sofa_type-singleSeat");
  v33 = 19;
  v34 = CFSTR("Sofa-sofa_type-lShapedMain");
  v35 = 20;
  v36 = CFSTR("Sofa-sofa_type-lShapedExtension");
  v37 = 21;
  v38 = CFSTR("Sofa-sofa_type-lShapedMiddle");
  v39 = 22;
  v40 = CFSTR("Sofa-sofa_type-other");
  v41 = 23;
  v42 = CFSTR("Sofa-sofa_arm_type-missing");
  v43 = 24;
  v44 = CFSTR("Sofa-sofa_arm_type-two_arms");
  v45 = 25;
  v46 = CFSTR("Sofa-sofa_arm_type-none");
  v47 = 26;
  v48 = CFSTR("Sofa-sofa_back_type-missing");
  v49 = 27;
  v50 = CFSTR("Sofa-sofa_back_type-existing");
  v51 = 28;
  v52 = CFSTR("Table-table_type-desk");
  v53 = 29;
  v54 = CFSTR("Table-table_type-coffee");
  v55 = 30;
  v56 = CFSTR("Table-table_type-dining");
  v57 = 31;
  v58 = CFSTR("Table-table_type-other");
  v59 = 32;
  v60 = CFSTR("Table-table_shape-rectangular");
  v61 = 33;
  v62 = CFSTR("Table-table_shape-lShaped");
  v63 = 34;
  v64 = CFSTR("Table-table_shape-circularElliptic");
  v65 = 35;
  v66 = CFSTR("Table-table_shape-other");
  v67 = 36;
  v68 = CFSTR("Table-table_leg_type-two_leg");
  v69 = 37;
  v70 = CFSTR("Table-table_leg_type-four_leg");
  v71 = 38;
  v72 = CFSTR("Table-table_leg_type-none");
  v73 = 39;
  v74 = CFSTR("Table-table_attribute-with_storage");
  v75 = 40;
  v76 = CFSTR("Table-table_attribute-without_storage");
  v77 = 41;
  v78 = CFSTR("Cabinet-cabinet_type-standalone_cabinet");
  v79 = 42;
  v80 = CFSTR("Cabinet-cabinet_type-kitchen_cabinet");
  v81 = 43;
  v82 = CFSTR("Cabinet-cabinet_type-nightstand");
  v83 = 44;
  v84 = CFSTR("Cabinet-cabinet_type-none");
  v85 = 45;
  v86 = CFSTR("Cabinet-cabinet_attribute-no_countertop");
  v87 = 46;
  v88 = CFSTR("Cabinet-cabinet_attribute-with_countertop");
  v89 = 100;
  v90 = CFSTR("Sofa-sofa_arm_type-existing");
  v91 = 101;
  LODWORD(v2) = 0;
  v92 = CFSTR("Storage-storage_type-cabinet");
  v93 = 102;
  v94 = CFSTR("Storage-storage_type-shelf");
  v95 = 103;
  v96 = CFSTR("Chair-chair_type-stool");
  std::unordered_map<ou3dor::PartAttributeID,NSString * {__strong}>::unordered_map((uint64_t)&ou3dor::k3DORSupportedAttributeTypeMap, (int *)&v2, 50);
  for (i = 792; i != -8; i -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<ou3dor::PartAttributeID,NSString * {__strong}>::~unordered_map[abi:ne180100], &ou3dor::k3DORSupportedAttributeTypeMap, &dword_2294C8000);
  v4 = xmmword_229562924;
  v5 = unk_229562934;
  v6 = xmmword_229562944;
  v2 = xmmword_229562904;
  v3 = unk_229562914;
  v7 = 0x2E0000002DLL;
  objc_autoreleasePoolPop(v0);
}

void sub_229555BFC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t i;

  for (i = 792; i != -8; i -= 16)

  _Unwind_Resume(a1);
}

uint64_t std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

uint64_t ou3dor::Object3DEncoder::Object3DEncoder(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *exception;
  void *__p[2];
  char v14;

  *(_QWORD *)a1 = &unk_24F243E98;
  v3 = *a2;
  v4 = a2[1];
  v5 = *((_QWORD *)a2 + 4);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = 1065353216;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_QWORD *)(a1 + 120) = 0;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22E2CA890](exception, "[3DOR] failed to get the bundle.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v7 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, "single_view_encoder_model/model.mil");
  OUEspressoV2Inference::OUEspressoV2Inference(v7, v6, __p, 1);
  if (v14 < 0)
    operator delete(__p[0]);
  v8 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, "multi_view_fusion_model/model.mil");
  OUEspressoV2Inference::OUEspressoV2Inference(v9, v6, __p, 1);
  if (v14 < 0)
    operator delete(__p[0]);
  v10 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v9;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);

  return a1;
}

void sub_229555E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v20 = v15[15];
  v15[15] = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  v21 = v15[14];
  v15[14] = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  v22 = *v18;
  if (*v18)
  {
    v15[12] = v22;
    operator delete(v22);
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table(v16);
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::Process(ou3dor::Object3DEncoder *a1, void *a2, uint64_t *a3)
{
  id v5;

  v5 = a2;
  ou3dor::Object3DEncoder::AddView((uint64_t)a1, v5, a3);
  ou3dor::Object3DEncoder::ExtractImageFeatures(a1, (__CVBuffer *)objc_msgSend(v5, "sceneColorBuffer"), objc_msgSend(v5, "deviceOrientation"));
  ou3dor::Object3DEncoder::ExtractObjectFeatures(a1);

}

void sub_229555F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::AddView(uint64_t a1, void *a2, uint64_t *a3)
{
  void *v4;
  double v5;
  int WidthOfPlane;
  int HeightOfPlane;
  int Width;
  int Height;
  int v10;
  double v11;
  double v12;
  NSObject *v13;
  float v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  int32x2_t v19;
  float32x2_t v20;
  id v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  int v26;
  float v27;
  double v28;
  float v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float32x2_t v37;
  int v38;
  int32x2_t v39;
  int32x2_t v40;
  int32x2_t v41;
  __int128 v42;
  int v43;
  int v44;
  NSObject *v45;
  int8x16_t v46;
  __int32 v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int8x16_t v57;
  int32x2_t v58;
  int8x16_t v59;
  __CVBuffer *v60;
  _QWORD *v61;
  float v62;
  void *v63;
  void *v64;
  float32x2_t v65;
  float v66;
  id v67;
  float v68;
  int32x2_t v69;
  double v70;
  void *v71;
  id v72;
  float v74;
  float v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  void *__p[2];
  char v83;
  void *v84;
  __int128 v85;
  float v86;
  _OWORD v87[3];
  uint8_t buf[4];
  const char *v89;
  void *v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  char v95;
  char v96;
  uint64_t v97;
  simd_float4x4 v98;
  simd_float4x4 v99;

  v97 = *MEMORY[0x24BDAC8D0];
  v72 = a2;
  objc_msgSend(v72, "sceneCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v4;
  objc_msgSend(v4, "intrinsics");
  v70 = v5;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)objc_msgSend(v72, "sceneColorBuffer"), 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)objc_msgSend(v72, "sceneColorBuffer"), 0);
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v72, "semanticLabelBuffer"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v72, "semanticLabelBuffer"));
  v10 = Height;
  LODWORD(v11) = 1147207680;
  v12 = v70;
  if (*(float *)&v70 <= 900.0
    || (LODWORD(v11) = 1040746633, (float)((float)Width / (float)WidthOfPlane) == 0.13333)
    && (*(float *)&v12 = (float)Height / (float)HeightOfPlane, *(float *)&v12 == 0.13333))
  {
    objc_msgSend(v4, "pose", v11, v12);
    v68 = v14;
    objc_msgSend(v4, "pose");
    v17 = *a3;
    v16 = a3[1];
    if (*a3 == v16)
      goto LABEL_58;
    v69 = (int32x2_t)__PAIR64__(v10, Width);
    v18 = v15;
    v19 = vdup_n_s32(0x7F7FFFFFu);
    v20 = (float32x2_t)vdup_n_s32(0x3E088889u);
    while (1)
    {
      v21 = *(id *)(v17 + 144);
      if (!v21)
      {
        _OULoggingGetOSLogForCategoryObjectUnderstanding();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2294C8000, v45, OS_LOG_TYPE_INFO, "[3DOR] can't add view for object w/o uuid, skipping", buf, 2u);
        }

        goto LABEL_57;
      }
      v22 = v71;
      objc_msgSend(v22, "pose");
      v99 = __invert_f4(v98);
      v78 = (float32x4_t)v99.columns[1];
      v79 = (float32x4_t)v99.columns[0];
      v76 = (float32x4_t)v99.columns[3];
      v77 = (float32x4_t)v99.columns[2];
      objc_msgSend(v22, "imageResolution");
      v24 = v23;
      objc_msgSend(v22, "imageResolution");
      v25 = 0;
      v26 = 0;
      v27 = v24;
      v75 = v27;
      v29 = v28;
      v74 = v29;
      v30 = (float32x2_t)0x80000000800000;
      v31 = (float32x2_t)v19;
      while (1)
      {
        v32 = vaddq_f32(v76, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(_OWORD *)(v17 + v25))), v78, *(float32x2_t *)(v17 + v25), 1), v77, *(float32x4_t *)(v17 + v25), 2));
        v80 = v32;
        v32.i32[0] = v32.i32[2];
        if (v32.f32[2] <= 0.0)
          break;
        objc_msgSend(v22, "intrinsics", *(double *)v32.i64);
        v36 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, v80.f32[0]), v34, *(float32x2_t *)v80.f32, 1), v35, v80, 2);
        if (fabsf(*(float *)&v36.i32[2]) >= 0.000001)
        {
          v37 = vdiv_f32(*(float32x2_t *)v36.i8, (float32x2_t)vdup_laneq_s32(v36, 2));
          v38 = v37.f32[0] >= 0.0;
          if (v37.f32[0] > v75)
            v38 = 0;
          if (v37.f32[1] < 0.0)
            v38 = 0;
          if (v37.f32[1] > v74)
            v38 = 0;
          v26 += v38;
          v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v37), (int8x8_t)v37, (int8x8_t)v31);
          v30 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v37, v30), (int8x8_t)v37, (int8x8_t)v30);
        }
        v25 += 16;
        if (v25 == 128)
        {
          v39 = vcvt_s32_f32(v31);
          v40 = vcvt_s32_f32((float32x2_t)__PAIR64__(LODWORD(v74), LODWORD(v75)));
          v41 = vcvt_s32_f32(v30);
          *(int8x8_t *)&v42 = vand_s8((int8x8_t)vcgez_s32(v39), (int8x8_t)vmin_s32(v40, v39));
          DWORD2(v87[1]) = v26;
          v43 = v42;
          v44 = DWORD1(v42);
          *(int32x2_t *)v81.f32 = vsub_s32((int32x2_t)vand_s8((int8x8_t)vcgez_s32(v41), (int8x8_t)vmin_s32(v40, v41)), *(int32x2_t *)&v42);
          *((_QWORD *)&v42 + 1) = v81.i64[0];
          *(_OWORD *)((char *)&v87[1] + 12) = v42;
          goto LABEL_26;
        }
      }
      v44 = 0;
      v43 = 0;
      v26 = 0;
      memset((char *)&v87[1] + 8, 0, 20);
      v81.i64[0] = 0;
LABEL_26:

      if (*(_QWORD *)(a1 + 8) > (unint64_t)v26)
        goto LABEL_57;
      v46.i32[1] = v81.i32[1];
      if (v81.i32[0] <= v81.i32[1])
        v47 = v81.i32[1];
      else
        v47 = v81.i32[0];
      if (v43 >= WidthOfPlane - v47)
        LODWORD(v48) = WidthOfPlane - v47;
      else
        LODWORD(v48) = v43;
      if (WidthOfPlane - v47 >= 0)
        v48 = v48;
      else
        v48 = 0;
      if (v44 >= HeightOfPlane - v47)
        v49 = HeightOfPlane - v47;
      else
        v49 = v44;
      if (HeightOfPlane - v47 >= 0)
        v50 = v49;
      else
        v50 = 0;
      v51 = v43 + v47;
      if (v43 + v47 >= WidthOfPlane)
        v51 = WidthOfPlane;
      v52 = (v51 - v48);
      v53 = v44 + v47;
      if (v53 >= HeightOfPlane)
        v53 = HeightOfPlane;
      v54 = (v53 - v50);
      v55 = v52 | (v54 << 32);
      v56 = v48 | (v50 << 32);
      *(_QWORD *)&v87[0] = v56;
      *((_QWORD *)&v87[0] + 1) = v55;
      v46.i32[0] = 1147207680;
      *(double *)v57.i64 = v70;
      if (*(float *)&v70 > 900.0)
      {
        HIDWORD(v87[1]) = (int)(float)((float)((float)v43 * 0.13333) + 0.5);
        LODWORD(v87[2]) = (int)(float)((float)((float)v44 * 0.13333) + 0.5);
        DWORD1(v87[2]) = (int)(float)((float)((float)v81.i32[0] * 0.13333) + 0.5);
        DWORD2(v87[2]) = (int)(float)((float)((float)v81.i32[1] * 0.13333) + 0.5);
        v58 = vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, v20, vcvt_f32_s32((int32x2_t)__PAIR64__(v52, v48))));
        v57 = (int8x16_t)vshll_n_s32(vcvt_s32_f32(vmla_f32((float32x2_t)0x3F0000003F000000, v20, vcvt_f32_s32((int32x2_t)__PAIR64__(v54, v50)))), 0x20uLL);
        v59.i64[0] = v58.u32[0];
        v59.i64[1] = v58.u32[1];
        v46 = vorrq_s8(v57, v59);
        v87[0] = v46;
      }
      v60 = (__CVBuffer *)objc_msgSend(v72, "semanticLabelBuffer", *(double *)v46.i64, *(double *)v57.i64);
      v61 = std::map<NSString * {__strong},std::set<unsigned char>>::at((uint64_t)&kObjectTypeToSemanticLabels, (unint64_t *)(v17 + 128));
      ou3dor::Object3DEncoder::ComputeSemanticMaskAndScore(v60, (int *)v87, (_DWORD *)&v87[1] + 3, v61, (uint64_t)&v84, v69);
      v62 = v86;
      v63 = v84;
      if (v86 >= 10.0)
        break;
      if (v84)
      {
        v64 = v84;
LABEL_56:
        operator delete(v64);
      }
LABEL_57:

      v17 += 224;
      if (v17 == v16)
        goto LABEL_58;
    }
    v65 = vmul_f32(vadd_f32(*(float32x2_t *)v17, *(float32x2_t *)(v17 + 32)), (float32x2_t)0x3F0000003F000000);
    v66 = atan2f(v65.f32[1] - v18, v65.f32[0] - v68);
    if (v66 < 0.0)
      v66 = v66 + 6.2832;
    *(_DWORD *)buf = (int)(float)(v66 * 0.95493);
    v89 = (const char *)__PAIR64__(LODWORD(v62), DWORD2(v87[1]));
    v90 = v63;
    v91 = v85;
    v84 = 0;
    v85 = 0uLL;
    v92 = v56;
    v93 = v55;
    v94 = v87[0];
    v95 = 0;
    v96 = 0;
    objc_msgSend(v21, "UUIDString");
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v67, "UTF8String"));
    ou3dor::Object3DEncoder::AddToObjects(a1, (uint64_t)buf, (unsigned __int8 *)__p);
    if (v83 < 0)
      operator delete(__p[0]);

    v64 = v90;
    if (!v90)
      goto LABEL_57;
    goto LABEL_56;
  }
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v89 = "Object3DEncoder";
    _os_log_impl(&dword_2294C8000, v13, OS_LOG_TYPE_INFO, "[3DOR][%s] image resolution ratio != resize scale; will not extract embeddings",
      buf,
      0xCu);
  }

LABEL_58:
}

void sub_229556584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56)
{

  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::ExtractImageFeatures(ou3dor::Object3DEncoder *this, __CVBuffer *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  size_t BytesPerRowOfPlane;
  size_t Height;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int *v14;
  int v15;
  size_t v16;
  size_t v17;
  char *BaseAddressOfPlane;
  uint64_t *v19;
  int *v20;
  uint64_t v21;
  __CVBuffer *v22;
  uint64_t v23;
  char *v24;
  double v25;
  int v26;
  int v27;
  int v28;
  char *v29;
  _BYTE *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  double v37;
  double v38;
  int v39;
  double v40;
  int v41;
  int v42;
  int v43;
  size_t v44;
  int v45;
  _OWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  int v51;
  int v52;
  int v53;
  float v54;
  float v55;
  uint64_t *v56;
  float v57;
  int v58;
  uint64_t v59;
  int v60;
  float v61;
  int v62;
  int v63;
  uint64_t v64;
  float v65;
  float v67;
  uint64_t v68;
  char *v69;
  float v76;
  uint64_t i;
  uint64_t j;
  int v80;
  _WORD *v81;
  uint64_t *v82;
  std::logic_error *exception;
  uint64_t v84;
  void *__src;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  __CVBuffer *pixelBuffer;
  char *Input;
  uint64_t v92;
  uint64_t *v93;
  int *v94;
  int *v95;
  uint64_t v96;
  void *v97[2];
  char v98;
  void *v99[2];
  char v100;
  void *__p[3];
  void *v102;
  char *v103;
  char *v104;
  _BYTE v105[24];
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(v99, "input_1");
  std::string::basic_string[abi:ne180100]<0>(v97, "var_354");
  Input = (char *)OUDnnInferenceInterface::GetInputSpan<half,void>(*((_QWORD *)this + 14), (unsigned __int8 *)v99);
  __src = (void *)OUDnnInferenceInterface::GetOutputSpan<half,void>(*((_QWORD *)this + 14), (unsigned __int8 *)v97);
  if ((unint64_t)(a3 - 1) >= 4)
    v96 = 0;
  else
    v96 = *(_QWORD *)&aZ[8 * a3 - 8];
  v6 = (int *)*((_QWORD *)this + 8);
  if (v6)
  {
    v84 = MEMORY[0x24BEDB8D0] + 16;
    pixelBuffer = a2;
    do
    {
      if (v6[10] >= 1)
      {
        v7 = 0;
        v93 = (uint64_t *)(v6 + 12);
        v86 = (uint64_t *)v6;
        do
        {
          if (!LOBYTE(v93[74 * v7 + 73]))
          {
            v89 = &v93[74 * v7];
            v92 = v7;
            if (CVPixelBufferGetPixelFormatType(a2) != 875704422)
            {
              exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::logic_error::logic_error(exception, "[3DOR] only support '420f'.");
              exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
              __cxa_throw(exception, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
            }
            BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
            Height = CVPixelBufferGetHeight(a2);
            v94 = (int *)&v93[74 * v92 + 5];
            v10 = *v94;
            if ((v10 & 0x80000000) != 0
              || BytesPerRowOfPlane < SLODWORD(v93[74 * v92 + 6]) + v10
              || (v11 = SHIDWORD(v93[74 * v92 + 5]), (v11 & 0x80000000) != 0)
              || Height < SHIDWORD(v93[74 * v92 + 6]) + v11)
            {
              std::logic_error::logic_error((std::logic_error *)v105, "[3DOR] RoI exceed image size");
              *(_QWORD *)v105 = v84;
              MEMORY[0x22E2CA8A8](v105);
            }
            CVPixelBufferLockBaseAddress(a2, 1uLL);
            v12 = &v93[74 * v92];
            v13 = *((_DWORD *)v12 + 13);
            v95 = (int *)v12 + 13;
            v15 = *((_DWORD *)v12 + 12);
            v14 = (int *)(v12 + 6);
            v88 = v13 * (uint64_t)v15;
            LOBYTE(v102) = 0;
            std::vector<unsigned char>::vector(__p, 3 * v88, &v102);
            v16 = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
            v17 = CVPixelBufferGetBytesPerRowOfPlane(a2, 1uLL);
            BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
            v19 = &v93[74 * v92];
            v21 = *((int *)v19 + 11);
            v20 = (int *)v19 + 11;
            v87 = v21;
            v22 = a2;
            v23 = *v94;
            v24 = (char *)CVPixelBufferGetBaseAddressOfPlane(v22, 1uLL);
            v26 = *v95;
            if (*v95 >= 1)
            {
              v27 = 0;
              v28 = *v20;
              v29 = &v24[v17 * ((uint64_t)*v20 >> 1)];
              v30 = __p[0];
              v31 = (char *)__p[0] + v88;
              v32 = (char *)__p[0] + v88 + v88;
              v33 = &BaseAddressOfPlane[v16 * v87 + v23];
              LODWORD(v34) = *v14;
              do
              {
                if ((int)v34 >= 1)
                {
                  v35 = 0;
                  v36 = *v94;
                  do
                  {
                    LOBYTE(v25) = v33[v35];
                    v37 = (double)*(unint64_t *)&v25;
                    v38 = (double)(v29[(v36 + (int)v35) | 1] - 128);
                    v39 = (int)(v37 + v38 * 1.402);
                    v40 = (double)(v29[(v36 + (_DWORD)v35) & 0xFFFFFFFE] - 128);
                    v41 = (int)(v37 + v40 * -0.34414 + v38 * -0.71414);
                    v25 = v37 + v40 * 1.772;
                    if (v39 >= 255)
                      v39 = 255;
                    v32[v35] = v39 & ~(v39 >> 31);
                    if (v41 >= 255)
                      v42 = 255;
                    else
                      v42 = v41;
                    v31[v35] = v42 & ~(v42 >> 31);
                    if ((int)v25 >= 255)
                      v43 = 255;
                    else
                      v43 = (int)v25;
                    v30[v35++] = v43 & ~(v43 >> 31);
                    v34 = *v14;
                  }
                  while (v35 < v34);
                  v26 = *v95;
                  v32 += v35;
                  v31 += v35;
                  v30 += v35;
                }
                v33 += v16;
                if ((v28 & 1) != 0)
                  v44 = v17;
                else
                  v44 = 0;
                v29 += v44;
                ++v27;
                LOBYTE(v28) = v28 + 1;
              }
              while (v27 < v26);
            }
            CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
            v45 = *((_DWORD *)this + 4);
            OUDnnInferenceInterface::LockInputs(*((OUDnnInferenceInterface **)this + 14), 0);
            v46 = v89 + 9;
            v47 = (v45 * v45);
            bzero(Input, (14 * v47));
            v106 = 0u;
            v107 = 0u;
            v48 = 2 * v47;
            v49 = 8;
            *(_OWORD *)&v105[8] = 0u;
            v50 = &Input[2 * v47];
            *(_QWORD *)v105 = Input;
            do
            {
              *(_QWORD *)&v105[v49] = v50;
              v50 += v48;
              v49 += 8;
            }
            while (v49 != 56);
            v51 = *v14;
            v52 = *v95;
            v102 = __p[0];
            v103 = (char *)__p[0] + v52 * v51;
            v104 = &v103[v52 * v51];
            if (v45 > 0)
            {
              v53 = 0;
              v54 = (float)v52;
              v55 = (float)v45;
              v56 = &v93[74 * v92];
              v57 = (float)*((int *)v56 + 17);
              v58 = *((_DWORD *)v56 + 16);
              v59 = v56[2];
              do
              {
                v60 = 0;
                v61 = (float)v53 + 0.5;
                v62 = v51 * (int)(float)((float)(v61 * v54) / v55);
                v63 = v58 * (int)(float)((float)(v61 * v57) / v55);
                do
                {
                  v64 = 0;
                  v65 = (float)v60 + 0.5;
                  _S6 = (float)(v65 * (float)v51) / v55;
                  v67 = v65 * (float)v58;
                  v68 = v62 + (int)_S6;
                  do
                  {
                    LOBYTE(_S6) = *((_BYTE *)*(&v102 + v64) + v68);
                    v69 = (char *)this + 2 * v64;
                    _H7 = *((_WORD *)v69 + 12);
                    __asm { FCVT            S7, H7 }
                    v76 = -(float)(_S7 - (float)((float)LODWORD(_S6) * 0.0039216));
                    LOWORD(_S7) = *((_WORD *)v69 + 18);
                    __asm { FCVT            S7, H7 }
                    _S6 = v76 * _S7;
                    __asm { FCVT            H6, S6 }
                    **(_WORD **)&v105[8 * v64++] = LOWORD(_S6);
                  }
                  while (v64 != 3);
                  if (((*(_QWORD *)(v59
                                   + (((unint64_t)(v63 + (int)(float)(v67 / v55)) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v63 + (int)(float)(v67 / v55))) & 1) != 0)
                  {
                    for (i = 0; i != 24; i += 8)
                      **(_WORD **)((char *)&v106 + i) = **(_WORD **)&v105[i];
                    **((_WORD **)&v107 + 1) = 15360;
                  }
                  for (j = 0; j != 56; j += 8)
                    *(_QWORD *)&v105[j] += 2;
                  ++v60;
                }
                while (v60 != v45);
                ++v53;
              }
              while (v53 != v45);
            }
            v80 = 7;
            v81 = Input;
            do
            {
              utils::RotateInPlace<half,void>(v81, v47, *((_QWORD *)this + 2), v96);
              v81 = (_WORD *)((char *)v81 + v48);
              --v80;
            }
            while (v80);
            OUDnnInferenceInterface::UnlockInputs(*((OUDnnInferenceInterface **)this + 14), 0);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            (*(void (**)(_QWORD))(**((_QWORD **)this + 14) + 16))(*((_QWORD *)this + 14));
            a2 = pixelBuffer;
            v6 = (int *)v86;
            OUDnnInferenceInterface::LockOutputs(*((OUDnnInferenceInterface **)this + 14), 1uLL);
            *(_OWORD *)(v89 + 69) = 0u;
            *(_OWORD *)(v89 + 71) = 0u;
            *(_OWORD *)(v89 + 65) = 0u;
            *(_OWORD *)(v89 + 67) = 0u;
            *(_OWORD *)(v89 + 61) = 0u;
            *(_OWORD *)(v89 + 63) = 0u;
            *(_OWORD *)(v89 + 57) = 0u;
            *(_OWORD *)(v89 + 59) = 0u;
            *(_OWORD *)(v89 + 53) = 0u;
            *(_OWORD *)(v89 + 55) = 0u;
            *(_OWORD *)(v89 + 49) = 0u;
            *(_OWORD *)(v89 + 51) = 0u;
            *(_OWORD *)(v89 + 45) = 0u;
            *(_OWORD *)(v89 + 47) = 0u;
            *(_OWORD *)(v89 + 41) = 0u;
            *(_OWORD *)(v89 + 43) = 0u;
            *(_OWORD *)(v89 + 37) = 0u;
            *(_OWORD *)(v89 + 39) = 0u;
            *(_OWORD *)(v89 + 33) = 0u;
            *(_OWORD *)(v89 + 35) = 0u;
            *(_OWORD *)(v89 + 29) = 0u;
            *(_OWORD *)(v89 + 31) = 0u;
            *(_OWORD *)(v89 + 25) = 0u;
            *(_OWORD *)(v89 + 27) = 0u;
            *(_OWORD *)(v89 + 21) = 0u;
            *(_OWORD *)(v89 + 23) = 0u;
            *(_OWORD *)(v89 + 17) = 0u;
            *(_OWORD *)(v89 + 19) = 0u;
            *(_OWORD *)(v89 + 13) = 0u;
            *(_OWORD *)(v89 + 15) = 0u;
            *v46 = 0u;
            *(_OWORD *)(v89 + 11) = 0u;
            v82 = &v93[74 * v92];
            if (!*((_BYTE *)v82 + 584))
              *((_BYTE *)v82 + 584) = 1;
            memcpy(v46, __src, 0x200uLL);
            OUDnnInferenceInterface::UnlockOutputs(*((OUDnnInferenceInterface **)this + 14), 1uLL);
            v7 = v92;
            if (*((_BYTE *)v86 + 2928))
              *((_BYTE *)v86 + 2928) = 0;
          }
          ++v7;
        }
        while (v7 < v6[10]);
      }
      v6 = *(int **)v6;
    }
    while (v6);
  }
  if (v98 < 0)
    operator delete(v97[0]);
  if (v100 < 0)
    operator delete(v99[0]);
}

void sub_229556D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void *a36,uint64_t a37)
{
  if (a29 < 0)
    operator delete(__p);
  if (a35 < 0)
    operator delete(a30);
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::ExtractObjectFeatures(ou3dor::Object3DEncoder *this)
{
  char *Input;
  uint64_t Output;
  uint64_t *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char *v9;
  int v10;
  void *__p[2];
  char v13;
  void *v14[2];
  char v15;

  std::string::basic_string[abi:ne180100]<0>(v14, "feat_1");
  std::string::basic_string[abi:ne180100]<0>(__p, "var_351");
  Input = (char *)OUDnnInferenceInterface::GetInputSpan<half,void>(*((_QWORD *)this + 15), (unsigned __int8 *)v14);
  Output = OUDnnInferenceInterface::GetOutputSpan<half,void>(*((_QWORD *)this + 15), (unsigned __int8 *)__p);
  v4 = (uint64_t *)*((_QWORD *)this + 8);
  if (v4)
  {
    v5 = (const void *)Output;
    while (*((_BYTE *)v4 + 2928))
    {
LABEL_17:
      v4 = (uint64_t *)*v4;
      if (!v4)
        goto LABEL_18;
    }
    OUDnnInferenceInterface::LockInputs(*((OUDnnInferenceInterface **)this + 15), 0);
    LODWORD(v6) = *((_DWORD *)v4 + 10);
    if ((int)v6 <= 0)
    {
      v9 = Input;
    }
    else
    {
      v7 = 0;
      v8 = v4;
      v9 = Input;
      do
      {
        if (!*((_BYTE *)v8 + 632))
          std::__throw_bad_optional_access[abi:ne180100]();
        memcpy(v9, v8 + 15, 0x200uLL);
        v9 += 512;
        ++v7;
        v6 = *((int *)v4 + 10);
        v8 += 74;
      }
      while (v7 < v6);
      if ((int)v6 >= 3)
        goto LABEL_14;
    }
    v10 = v6 - 3;
    do
    {
      memcpy(v9, Input, 0x200uLL);
      v9 += 512;
    }
    while (!__CFADD__(v10++, 1));
LABEL_14:
    OUDnnInferenceInterface::UnlockInputs(*((OUDnnInferenceInterface **)this + 15), 0);
    (*(void (**)(_QWORD))(**((_QWORD **)this + 15) + 16))(*((_QWORD *)this + 15));
    OUDnnInferenceInterface::LockOutputs(*((OUDnnInferenceInterface **)this + 15), 1uLL);
    *((_OWORD *)v4 + 181) = 0u;
    *((_OWORD *)v4 + 182) = 0u;
    *((_OWORD *)v4 + 179) = 0u;
    *((_OWORD *)v4 + 180) = 0u;
    *((_OWORD *)v4 + 177) = 0u;
    *((_OWORD *)v4 + 178) = 0u;
    *((_OWORD *)v4 + 175) = 0u;
    *((_OWORD *)v4 + 176) = 0u;
    *((_OWORD *)v4 + 173) = 0u;
    *((_OWORD *)v4 + 174) = 0u;
    *((_OWORD *)v4 + 171) = 0u;
    *((_OWORD *)v4 + 172) = 0u;
    *((_OWORD *)v4 + 169) = 0u;
    *((_OWORD *)v4 + 170) = 0u;
    *((_OWORD *)v4 + 167) = 0u;
    *((_OWORD *)v4 + 168) = 0u;
    *((_OWORD *)v4 + 165) = 0u;
    *((_OWORD *)v4 + 166) = 0u;
    *((_OWORD *)v4 + 163) = 0u;
    *((_OWORD *)v4 + 164) = 0u;
    *((_OWORD *)v4 + 161) = 0u;
    *((_OWORD *)v4 + 162) = 0u;
    *((_OWORD *)v4 + 159) = 0u;
    *((_OWORD *)v4 + 160) = 0u;
    *((_OWORD *)v4 + 157) = 0u;
    *((_OWORD *)v4 + 158) = 0u;
    *((_OWORD *)v4 + 155) = 0u;
    *((_OWORD *)v4 + 156) = 0u;
    *((_OWORD *)v4 + 153) = 0u;
    *((_OWORD *)v4 + 154) = 0u;
    *((_OWORD *)v4 + 151) = 0u;
    *((_OWORD *)v4 + 152) = 0u;
    if (!*((_BYTE *)v4 + 2928))
      *((_BYTE *)v4 + 2928) = 1;
    memcpy(v4 + 302, v5, 0x200uLL);
    OUDnnInferenceInterface::UnlockOutputs(*((OUDnnInferenceInterface **)this + 15), 1uLL);
    goto LABEL_17;
  }
LABEL_18:
  if (v13 < 0)
    operator delete(__p[0]);
  if (v15 < 0)
    operator delete(v14[0]);
}

void sub_229556FD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::SetEmbeddings(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  char *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t k;
  void *v26;
  id obj;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _BYTE v32[512];
  _BYTE __dst[512];
  void *__p[2];
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v3)
  {
    v28 = (_QWORD *)(a1 + 48);
    v29 = *(_QWORD *)v37;
    do
    {
      v30 = v3;
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v31 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v31, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 == 0;

        if (!v6)
        {
          objc_msgSend(v31, "identifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "UUIDString");
          v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v9 = (char *)objc_msgSend(v8, "UTF8String");

          std::string::basic_string[abi:ne180100]<0>(__p, v9);
          v10 = std::__hash_table<std::__hash_value_type<std::string,__CVBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,__CVBuffer *>>>::find<std::string>(v28, (unsigned __int8 *)__p);
          v11 = v10;
          if (v35 < 0)
          {
            operator delete(__p[0]);
            if (!v11)
              goto LABEL_21;
          }
          else if (!v10)
          {
            goto LABEL_21;
          }
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((int *)v11 + 10));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (*((int *)v11 + 10) >= 1)
          {
            v13 = 0;
            do
            {
              v14 = (uint64_t)&v11[592 * v13 + 48];
              if (!*(_BYTE *)(v14 + 584))
                std::__throw_bad_optional_access[abi:ne180100]();
              memcpy(__dst, (const void *)(v14 + 72), sizeof(__dst));
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 256);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              for (j = 0; j != 512; j += 2)
              {
                LOWORD(_D0) = *(_WORD *)&__dst[j];
                __asm { FCVT            S0, H0 }
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", _D0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v22);

              }
              objc_msgSend(v12, "addObject:", v15);

              ++v13;
            }
            while (v13 < *((int *)v11 + 10));
          }
          objc_msgSend(v31, "setEmbedding2d:", v12);
          if (!v11[2928])
            std::__throw_bad_optional_access[abi:ne180100]();
          memcpy(v32, v11 + 2416, sizeof(v32));
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 256);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          for (k = 0; k != 512; k += 2)
          {
            LOWORD(_D0) = *(_WORD *)&v32[k];
            __asm { FCVT            S0, H0 }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", _D0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v26);

          }
          objc_msgSend(v31, "setEmbedding3d:", v23);

        }
LABEL_21:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v3);
  }

}

void sub_229557318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

float ou3dor::Object3DEncoder::ComputeSemanticMaskAndScore@<S0>(__CVBuffer *a1@<X0>, int *a2@<X1>, _DWORD *a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>, int32x2_t a6@<D0>)
{
  size_t BytesPerRow;
  char *BaseAddress;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  float result;
  std::logic_error *exception;
  uint64_t v24;
  __CVBuffer *pixelBuffer;
  int v28;
  char v29;
  uint64_t v30;
  __int128 v31;

  if (CVPixelBufferGetPixelFormatType(a1) != 1278226488)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    __cxa_throw(exception, (struct type_info *)off_24F242648, (void (*)(void *))MEMORY[0x24BEDAB88]);
  }
  v24 = a5;
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  pixelBuffer = a1;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  v12 = a2[3] * (uint64_t)a2[2];
  v29 = 0;
  std::vector<BOOL>::vector(&v30, v12, (unsigned __int8 *)&v29);
  v13 = a2[3];
  if (v13 < 1)
  {
    v28 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v28 = 0;
    v16 = a2[1];
    v17 = &BaseAddress[BytesPerRow * v16 + *a2];
    v18 = a2[2];
    do
    {
      if (v18 >= 1)
      {
        v19 = 0;
        v20 = *a2;
        do
        {
          if (v20 + (int)v19 >= *a3 && v20 + (int)v19 < a3[2] + *a3)
          {
            v21 = a3[1];
            if ((int)v16 >= v21 && (int)v16 < a3[3] + v21)
            {
              v29 = v17[v19];
              if (std::__hash_table<std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::vector<unsigned short>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::vector<unsigned short>>>>::find<unsigned char>(a4, (unsigned __int8 *)&v29))
              {
                *(_QWORD *)(v30 + (((unint64_t)(v15 + v19) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << (v15 + v19);
                ++v28;
              }
              v18 = a2[2];
            }
          }
          ++v19;
        }
        while (v19 < v18);
        v15 += v19;
        v13 = a2[3];
      }
      v17 += BytesPerRow;
      ++v14;
      LODWORD(v16) = v16 + 1;
    }
    while (v14 < v13);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  result = roundf((float)((float)(765 * v28) / (float)vmul_lane_s32(a6, a6, 1).i32[0]) * 100.0) / 100.0;
  *(_QWORD *)v24 = v30;
  *(_OWORD *)(v24 + 8) = v31;
  *(float *)(v24 + 24) = result;
  return result;
}

void sub_229557620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p)
{
  void *v16;

  __cxa_free_exception(v16);
  _Unwind_Resume(a1);
}

void ou3dor::Object3DEncoder::AddToObjects(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned __int8 *v9;

  v5 = a1 + 48;
  v6 = std::__hash_table<std::__hash_value_type<std::string,__CVBuffer *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,__CVBuffer *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,__CVBuffer *>>>::find<std::string>((_QWORD *)(a1 + 48), a3);
  if (v6)
  {
    ou3dor::Object3DEncoder::AddToObject((uint64_t)v6, (uint64_t *)a2, (int *)v6 + 10);
  }
  else
  {
    v9 = a3;
    v7 = std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v5, a3, (uint64_t)&std::piecewise_construct, (__int128 **)&v9);
    v8 = *(_QWORD *)a2;
    *((_DWORD *)v7 + 14) = *(_DWORD *)(a2 + 8);
    *((_QWORD *)v7 + 6) = v8;
    std::vector<BOOL>::__move_assign((uint64_t)(v7 + 64), (_QWORD *)(a2 + 16));
    memcpy(v7 + 88, (const void *)(a2 + 40), 0x221uLL);
    *((_DWORD *)v7 + 10) = 1;
  }
}

uint64_t ou3dor::Object3DEncoder::CalculateBinIdx(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v2;
  float v3;

  v2 = vsub_f32(vmul_f32(vadd_f32(*a1, a1[4]), (float32x2_t)0x3F0000003F000000), a2);
  v3 = atan2f(v2.f32[1], v2.f32[0]);
  if (v3 < 0.0)
    v3 = v3 + 6.2832;
  return (int)(float)(v3 * 0.95493);
}

void ou3dor::Object3DEncoder::AddToObject(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  int v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int *v25;
  uint64_t v26;
  unsigned __int8 v27;
  void *__p[3];
  void *v29;

  v5 = (uint64_t *)(a3 + 2);
  v6 = (*a3)++;
  v7 = (uint64_t)&a3[148 * v6 + 2];
  v8 = *a2;
  *(_DWORD *)(v7 + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)v7 = v8;
  std::vector<BOOL>::__move_assign(v7 + 16, a2 + 2);
  memcpy((void *)(v7 + 40), a2 + 5, 0x221uLL);
  v9 = *a3;
  v10 = 126 - 2 * __clz(v9);
  if ((_DWORD)v9)
    v11 = v10;
  else
    v11 = 0;
  std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(v5, (uint64_t)&v5[74 * (int)v9], v11, 1);
  v12 = *a3;
  if ((int)v12 >= 4)
  {
    LOBYTE(__p[0]) = 0;
    std::vector<BOOL>::vector(&v29, v12, (unsigned __int8 *)__p);
    v27 = 0;
    std::vector<BOOL>::vector(__p, 6uLL, &v27);
    v13 = *a3;
    v14 = v29;
    if ((int)v13 < 1)
    {
      v16 = 0;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = __p[0];
      do
      {
        v18 = *(int *)v5;
        v19 = v18 >> 6;
        v20 = 1 << v18;
        v21 = v17[v19];
        if ((v20 & v21) == 0)
        {
          v17[v19] = v20 | v21;
          *(_QWORD *)((char *)v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
          ++v16;
        }
        if (++v15 >= v13)
          break;
        v5 += 74;
      }
      while (v16 < 3);
      v14 = v29;
      if ((int)v13 >= 2 && v16 <= 2)
      {
        v22 = 1;
        do
        {
          v23 = v14[v22 >> 6];
          if ((v23 & (1 << v22)) == 0)
          {
            v14[v22 >> 6] = v23 | (1 << v22);
            ++v16;
          }
          ++v22;
        }
        while (v22 < v13 && v16 < 3);
      }
    }
    v24 = 0;
    v25 = a3 - 146;
    do
    {
      v26 = *(_QWORD *)((char *)v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v24;
      ++v24;
      v25 += 148;
    }
    while ((v26 & 1) != 0);
    if ((int)v24 < (int)v13)
    {
      do
      {
        *(_QWORD *)v25 = *((_QWORD *)v25 + 74);
        v25[2] = v25[150];
        std::vector<BOOL>::operator=((void **)v25 + 2, (uint64_t)(v25 + 152));
        memcpy(v25 + 10, v25 + 158, 0x221uLL);
        v25 += 148;
        LODWORD(v24) = v24 + 1;
      }
      while (*a3 > (int)v24);
    }
    *a3 = v16;
    if (__p[0])
      operator delete(__p[0]);
    if (v29)
      operator delete(v29);
  }
}

void sub_22955797C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ou3dor::Object3DEncoder::~Object3DEncoder(ou3dor::Object3DEncoder *this)
{
  ou3dor::Object3DEncoder::~Object3DEncoder(this);
  JUMPOUT(0x22E2CAAE8);
}

{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)this = &unk_24F243E98;
  v2 = *((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = (void *)*((_QWORD *)this + 11);
  if (v4)
  {
    *((_QWORD *)this + 12) = v4;
    operator delete(v4);
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table((uint64_t)this + 48);
}

_QWORD *std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(_QWORD *a1, id *a2, uint64_t a3)
{
  *a1 = *a2;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)(a1 + 1), a3);
  return a1;
}

void sub_229557A10(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<SemanticLabelv5>::unordered_set(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<SemanticLabelv5,std::hash<SemanticLabelv5>,std::equal_to<SemanticLabelv5>,std::allocator<SemanticLabelv5>>::__emplace_unique_key_args<SemanticLabelv5,SemanticLabelv5 const&>(a1, i + 16, i + 16);
  return a1;
}

void sub_229557A80(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2, _BYTE *a3)
{
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_BYTE *)a1[1];
    v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_229557AF8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(uint64_t *result, uint64_t a2, uint64_t a3, char a4)
{
  int *v6;
  uint64_t *ii;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  float v15;
  float v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t n;
  float v21;
  uint64_t *v22;
  unint64_t v23;
  float v24;
  unint64_t v25;
  float v26;
  float v27;
  unint64_t v28;
  float v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  float v39;
  float v40;
  uint64_t *k;
  unint64_t v42;
  float v44;
  float *v45;
  unint64_t m;
  float v47;
  float *v48;
  unint64_t v49;
  float v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  float v54;
  float v55;
  uint64_t *v56;
  BOOL v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t *v61;
  float v62;
  float v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char *v70;
  float v71;
  uint64_t *i;
  uint64_t *v73;
  float v74;
  float v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t *j;
  float v80;
  void *v81;
  uint64_t v82;
  __int128 v83;
  uint64_t *v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90;
  int *v91;
  uint64_t *v92;
  unint64_t v93;
  float *v94;
  uint64_t __dst[71];

  v6 = (int *)a2;
  ii = result;
  __dst[69] = *MEMORY[0x24BDAC8D0];
  v91 = (int *)a2;
  v92 = result;
  while (2)
  {
    v8 = (char *)v6 - (char *)ii;
    v9 = 0x14C1BACF914C1BADLL * (((char *)v6 - (char *)ii) >> 4);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v91 = v6 - 148;
        v54 = *((float *)v6 - 146);
        v55 = *((float *)ii + 2);
        if (v54 > v55 || v54 == v55 && *(v6 - 147) > *((_DWORD *)ii + 1))
          return (uint64_t *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v92, (uint64_t *)&v91);
        return result;
      case 3uLL:
        v91 = v6 - 148;
        return (uint64_t *)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)ii, (uint64_t)(ii + 74), (uint64_t)(v6 - 148));
      case 4uLL:
        v91 = v6 - 148;
        return (uint64_t *)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)ii, (uint64_t)(ii + 74), (uint64_t)(ii + 148), (uint64_t)(v6 - 148));
      case 5uLL:
        v91 = v6 - 148;
        return (uint64_t *)std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>((uint64_t)ii, (uint64_t)(ii + 74), (uint64_t)(ii + 148), (uint64_t)(ii + 222), (uint64_t)(v6 - 148));
      default:
        if (v8 <= 14207)
        {
          v56 = ii + 74;
          v58 = ii == (uint64_t *)v6 || v56 == (uint64_t *)v6;
          if ((a4 & 1) != 0)
          {
            if (v58)
              return result;
            v59 = 0;
            v60 = ii;
            while (1)
            {
              v61 = v60;
              v60 = v56;
              v62 = *((float *)v61 + 150);
              v63 = *((float *)v61 + 2);
              if (v62 > v63)
                break;
              if (v62 == v63)
              {
                v64 = *((_DWORD *)v61 + 149);
                if (v64 > *((_DWORD *)v61 + 1))
                  goto LABEL_126;
              }
LABEL_139:
              v56 = v60 + 74;
              v59 += 592;
              if (v60 + 74 == (uint64_t *)v6)
                return result;
            }
            v64 = *((_DWORD *)v61 + 149);
LABEL_126:
            v86 = *((_DWORD *)v61 + 148);
            v65 = v61[76];
            v66 = v61[77];
            v89 = v61[78];
            v61[76] = 0;
            v61[78] = 0;
            v61[77] = 0;
            memcpy(__dst, v61 + 79, 0x221uLL);
            *v60 = *v61;
            *((_DWORD *)v60 + 2) = *((_DWORD *)v61 + 2);
            v67 = (uint64_t)(v61 + 2);
            std::vector<BOOL>::__move_assign((uint64_t)(v60 + 2), v61 + 2);
            v68 = v61 + 5;
            memcpy(v60 + 5, v61 + 5, 0x221uLL);
            if (v61 == ii)
            {
              v61 = ii;
            }
            else
            {
              v82 = v66;
              v84 = v60;
              v69 = v59;
              do
              {
                v70 = (char *)ii + v69;
                v71 = *(float *)((char *)ii + v69 - 584);
                if (v62 <= v71)
                {
                  if (v62 != v71)
                  {
                    v61 = (uint64_t *)((char *)ii + v69);
                    v68 = (uint64_t *)((char *)ii + v69 + 40);
                    v67 = (uint64_t)ii + v69 + 16;
                    goto LABEL_135;
                  }
                  if (v64 <= *(_DWORD *)((char *)ii + v69 - 588))
                    goto LABEL_135;
                }
                *(_QWORD *)v70 = *((_QWORD *)v70 - 74);
                *((_DWORD *)v70 + 2) = *((_DWORD *)v70 - 146);
                v67 = (uint64_t)(v61 - 72);
                std::vector<BOOL>::__move_assign((uint64_t)(v70 + 16), (_QWORD *)v70 - 72);
                v68 = v61 - 69;
                memcpy(v70 + 40, v70 - 552, 0x221uLL);
                v61 -= 74;
                v69 -= 592;
              }
              while (v69);
              v68 = ii + 5;
              v61 = ii;
LABEL_135:
              v60 = v84;
              v66 = v82;
            }
            *(_DWORD *)v61 = v86;
            *((_DWORD *)v61 + 1) = v64;
            *((float *)v61 + 2) = v62;
            if (*(_QWORD *)v67)
            {
              operator delete(*(void **)v67);
              *(_QWORD *)(v67 + 8) = 0;
              *(_QWORD *)(v67 + 16) = 0;
            }
            *(_QWORD *)v67 = v65;
            v61[3] = v66;
            v61[4] = v89;
            result = (uint64_t *)memcpy(v68, __dst, 0x221uLL);
            goto LABEL_139;
          }
          if (v58)
            return result;
          for (i = ii + 3; ; i += 74)
          {
            v73 = ii;
            ii = v56;
            v74 = *((float *)v73 + 150);
            v75 = *((float *)v73 + 2);
            if (v74 > v75)
              break;
            if (v74 == v75)
            {
              v76 = *((_DWORD *)v73 + 149);
              if (v76 > *((_DWORD *)v73 + 1))
                goto LABEL_148;
            }
LABEL_156:
            v56 = ii + 74;
            if (ii + 74 == (uint64_t *)v6)
              return result;
          }
          v76 = *((_DWORD *)v73 + 149);
LABEL_148:
          v77 = *(_DWORD *)v56;
          v78 = v73[76];
          v90 = *(_OWORD *)(v73 + 77);
          v73[76] = 0;
          v73[78] = 0;
          v73[77] = 0;
          memcpy(__dst, v73 + 79, 0x221uLL);
          for (j = i; ; j -= 74)
          {
            j[71] = *(j - 3);
            *((_DWORD *)j + 144) = *((_DWORD *)j - 4);
            std::vector<BOOL>::__move_assign((uint64_t)(j + 73), j - 1);
            memcpy(j + 76, j + 2, 0x221uLL);
            v80 = *((float *)j - 152);
            if (v74 <= v80 && (v74 != v80 || v76 <= *((_DWORD *)j - 153)))
              break;
          }
          *((_DWORD *)j - 6) = v77;
          *((_DWORD *)j - 5) = v76;
          *((float *)j - 4) = v74;
          v81 = (void *)*(j - 1);
          if (v81)
            operator delete(v81);
          *(j - 1) = v78;
          *(_OWORD *)j = v90;
          result = (uint64_t *)memcpy(j + 2, __dst, 0x221uLL);
          goto LABEL_156;
        }
        if (!a3)
          return (uint64_t *)std::__partial_sort[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &>((int *)ii, v6, (uint64_t *)v6);
        v10 = v9 >> 1;
        v11 = (float *)&ii[74 * (v9 >> 1)];
        v12 = (uint64_t)(v6 - 148);
        if ((unint64_t)v8 < 0x12801)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(v11, (uint64_t)ii, v12);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)ii, (uint64_t)v11, v12);
          v13 = 74 * v10;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)v92 + 148, (uint64_t)&v92[v13 - 74], (uint64_t)(v91 - 296));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)v92 + 296, (uint64_t)&v92[v13 + 74], (uint64_t)(v91 - 444));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)&v92[v13 - 74], (uint64_t)&v92[v13], (uint64_t)&v92[v13 + 74]);
          __dst[0] = (uint64_t)&v92[v13];
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v92, __dst);
        }
        --a3;
        v14 = v92;
        if ((a4 & 1) != 0)
        {
          v87 = a3;
          v15 = *((float *)v92 + 2);
        }
        else
        {
          v16 = *((float *)v92 - 146);
          v15 = *((float *)v92 + 2);
          if (v16 <= v15 && (v16 != v15 || *((_DWORD *)v92 - 147) <= *((_DWORD *)v92 + 1)))
          {
            v35 = (unint64_t)v91;
            v93 = (unint64_t)v91;
            v36 = v92[2];
            v38 = *(_DWORD *)v92;
            v37 = *((_DWORD *)v92 + 1);
            v88 = *(_OWORD *)(v92 + 3);
            v92[2] = 0;
            v14[3] = 0;
            v14[4] = 0;
            memcpy(__dst, v14 + 5, 0x221uLL);
            v39 = *(float *)(v35 - 584);
            if (v15 > v39 || v15 == v39 && v37 > *(_DWORD *)(v35 - 588))
            {
              v40 = *((float *)v14 + 150);
              if (v15 <= v40)
              {
                v45 = (float *)v14 + 149;
                do
                {
                  if (v15 == v40 && v37 > *(_DWORD *)v45)
                    break;
                  v40 = v45[149];
                  v45 += 148;
                }
                while (v15 <= v40);
                k = (uint64_t *)(v45 - 1);
              }
              else
              {
                k = v14 + 74;
              }
            }
            else
            {
              for (k = v14 + 74; (unint64_t)k < v35; k += 74)
              {
                v44 = *((float *)k + 2);
                if (v15 > v44 || v15 == v44 && v37 > *((_DWORD *)k + 1))
                  break;
              }
            }
            v94 = (float *)k;
            if ((unint64_t)k < v35)
            {
              for (m = v35 - 1176; v15 > v39 || v15 == v39 && v37 > *(_DWORD *)(m + 588); m -= 592)
                v39 = *(float *)m;
              v35 = m + 584;
              v93 = m + 584;
            }
            if ((unint64_t)k < v35)
            {
              do
              {
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v94, (uint64_t *)&v93);
                v47 = v94[150];
                if (v15 <= v47)
                {
                  v48 = v94 + 149;
                  do
                  {
                    if (v15 == v47 && v37 > *(_DWORD *)v48)
                      break;
                    v47 = v48[149];
                    v48 += 148;
                  }
                  while (v15 <= v47);
                  k = (uint64_t *)(v48 - 1);
                }
                else
                {
                  k = (uint64_t *)(v94 + 148);
                }
                v94 = (float *)k;
                v49 = v93;
                do
                {
                  do
                  {
                    v49 -= 592;
                    v50 = *(float *)(v49 + 8);
                  }
                  while (v15 > v50);
                }
                while (v15 == v50 && v37 > *(_DWORD *)(v49 + 4));
                v93 = v49;
              }
              while ((unint64_t)k < v49);
            }
            v51 = k - 74;
            if (k - 74 != v14)
            {
              v52 = *v51;
              *((_DWORD *)v14 + 2) = *((_DWORD *)k - 146);
              *v14 = v52;
              std::vector<BOOL>::__move_assign((uint64_t)(v14 + 2), k - 72);
              memcpy(v14 + 5, k - 69, 0x221uLL);
            }
            *(_DWORD *)v51 = v38;
            v53 = (void *)*(k - 72);
            *((_DWORD *)k - 147) = v37;
            *((float *)k - 146) = v15;
            if (v53)
              operator delete(v53);
            *(k - 72) = v36;
            *(_OWORD *)(k - 71) = v88;
            result = (uint64_t *)memcpy(k - 69, __dst, 0x221uLL);
            a4 = 0;
            ii = (uint64_t *)v94;
            goto LABEL_103;
          }
          v87 = a3;
        }
        v17 = (unint64_t)v91;
        v85 = v92[2];
        v19 = *(_DWORD *)v92;
        v18 = *((_DWORD *)v92 + 1);
        v83 = *(_OWORD *)(v92 + 3);
        v92[2] = 0;
        v14[3] = 0;
        v14[4] = 0;
        memcpy(__dst, v14 + 5, 0x221uLL);
        for (n = 0; ; n += 74)
        {
          v21 = *(float *)&v14[n + 75];
          if (v21 <= v15 && (v21 != v15 || SHIDWORD(v14[n + 74]) <= v18))
            break;
        }
        v22 = &v14[n + 74];
        v94 = (float *)v22;
        if (n * 8)
        {
          v23 = v17 - 592;
          v24 = *(float *)(v17 - 584);
          if (v24 <= v15)
          {
            v25 = v17 - 1176;
            do
            {
              if (v24 == v15 && *(_DWORD *)(v25 + 588) > v18)
                break;
              v24 = *(float *)v25;
              v25 -= 592;
            }
            while (v24 <= v15);
LABEL_25:
            v23 = v25 + 584;
          }
        }
        else
        {
          v23 = v17;
          if ((unint64_t)v22 < v17)
          {
            v23 = v17 - 592;
            v26 = *(float *)(v17 - 584);
            if (v26 <= v15)
            {
              v25 = v17 - 1176;
              while (1)
              {
                v42 = v25 + 584;
                if (v26 == v15)
                {
                  if (*(_DWORD *)(v25 + 588) > v18 || (unint64_t)v22 >= v42)
                    break;
                }
                else if ((unint64_t)v22 >= v42)
                {
                  goto LABEL_25;
                }
                v23 -= 592;
                v26 = *(float *)v25;
                v25 -= 592;
                if (v26 > v15)
                  goto LABEL_25;
              }
            }
          }
        }
        v93 = v23;
        ii = v22;
        if ((unint64_t)v22 < v23)
        {
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v94, (uint64_t *)&v93);
            for (ii = (uint64_t *)(v94 + 148); ; ii += 74)
            {
              v27 = *((float *)ii + 2);
              if (v27 <= v15 && (v27 != v15 || *((_DWORD *)ii + 1) <= v18))
                break;
            }
            v94 = (float *)ii;
            v28 = v93 - 592;
            v29 = *(float *)(v93 - 584);
            if (v29 <= v15)
            {
              v30 = v93 - 1176;
              do
              {
                if (v29 == v15 && *(_DWORD *)(v30 + 588) > v18)
                  break;
                v29 = *(float *)v30;
                v30 -= 592;
              }
              while (v29 <= v15);
              v28 = v30 + 584;
            }
            v93 = v28;
          }
          while ((unint64_t)ii < v28);
        }
        v31 = ii - 74;
        if (ii - 74 != v14)
        {
          v32 = *v31;
          *((_DWORD *)v14 + 2) = *((_DWORD *)ii - 146);
          *v14 = v32;
          std::vector<BOOL>::__move_assign((uint64_t)(v14 + 2), ii - 72);
          memcpy(v14 + 5, ii - 69, 0x221uLL);
        }
        *(_DWORD *)v31 = v19;
        v33 = (void *)*(ii - 72);
        *((_DWORD *)ii - 147) = v18;
        *((float *)ii - 146) = v15;
        if (v33)
          operator delete(v33);
        *(ii - 72) = v85;
        *(_OWORD *)(ii - 71) = v83;
        memcpy(ii - 69, __dst, 0x221uLL);
        a3 = v87;
        if ((unint64_t)v22 < v23)
          goto LABEL_50;
        v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)v92, (uint64_t)(ii - 74));
        result = (uint64_t *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((uint64_t)ii, (uint64_t)v91);
        if (!(_DWORD)result)
        {
          if (v34)
          {
LABEL_103:
            v92 = ii;
            goto LABEL_104;
          }
LABEL_50:
          result = (uint64_t *)std::__introsort<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,false>(v92, ii - 74, v87, a4 & 1);
          a4 = 0;
          goto LABEL_103;
        }
        if (!v34)
        {
          v91 = (int *)(ii - 74);
          ii = v92;
LABEL_104:
          v6 = v91;
          continue;
        }
        return result;
    }
  }
}

void *std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v10;
  int v11;
  _BYTE __dst[545];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *a2;
  v10 = **a1;
  v11 = *((_DWORD *)*a1 + 2);
  v4 = (*a1)[2];
  v5 = (*a1)[3];
  v6 = (*a1)[4];
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  memcpy(__dst, v2 + 5, sizeof(__dst));
  v7 = *(_DWORD *)(v3 + 8);
  *v2 = *(_QWORD *)v3;
  *((_DWORD *)v2 + 2) = v7;
  std::vector<BOOL>::__move_assign((uint64_t)(v2 + 2), (_QWORD *)(v3 + 16));
  memcpy(v2 + 5, (const void *)(v3 + 40), 0x221uLL);
  *(_QWORD *)v3 = v10;
  *(_DWORD *)(v3 + 8) = v11;
  v8 = *(void **)(v3 + 16);
  if (v8)
    operator delete(v8);
  *(_QWORD *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 24) = v5;
  *(_QWORD *)(v3 + 32) = v6;
  return memcpy((void *)(v3 + 40), __dst, 0x221uLL);
}

void *std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *result;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  float *v20;
  float *v21;
  float *v22;
  uint64_t *v23;

  v22 = (float *)a2;
  v23 = (uint64_t *)a1;
  v20 = (float *)a4;
  v21 = (float *)a3;
  v19 = a5;
  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(a1, a2, a3, a4);
  v11 = *(float *)(a5 + 8);
  v12 = *(float *)(a4 + 8);
  if (v11 > v12 || v11 == v12 && *(_DWORD *)(a5 + 4) > *(_DWORD *)(a4 + 4))
  {
    result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v20, &v19);
    v13 = v20[2];
    v14 = *(float *)(a3 + 8);
    if (v13 > v14 || v13 == v14 && *((_DWORD *)v20 + 1) > *(_DWORD *)(a3 + 4))
    {
      result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v21, (uint64_t *)&v20);
      v15 = v21[2];
      v16 = *(float *)(a2 + 8);
      if (v15 > v16 || v15 == v16 && *((_DWORD *)v21 + 1) > *(_DWORD *)(a2 + 4))
      {
        result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v22, (uint64_t *)&v21);
        v17 = v22[2];
        v18 = *(float *)(a1 + 8);
        if (v17 > v18 || v17 == v18 && *((_DWORD *)v22 + 1) > *(_DWORD *)(a1 + 4))
          return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v23, (uint64_t *)&v22);
      }
    }
  }
  return result;
}

int *std::__partial_sort[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &>(int *result, int *a2, uint64_t *a3)
{
  int *v4;
  float *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int *v10;
  uint64_t *v11;
  float v12;
  float v13;
  int64_t v14;
  int *v15;
  void *v16;
  uint64_t v17;
  float *v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  float v23;
  float v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void **v30;
  int *v31;
  unint64_t v32;
  float *v33;
  float v34;
  float v35;
  uint64_t v36;
  void *v37;
  _BYTE *v38;
  void *v39;
  int v40;
  float *v41;
  float *v42;
  const void *v43;
  float *v44;
  unint64_t v45;
  float v46;
  uint64_t v47;
  float *v48;
  unint64_t v50;
  int v51;
  uint64_t v52;
  float *v53;
  const void *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t *v61;
  float *v62;
  uint64_t v63;
  int v64;
  _BYTE __dst[552];
  _BYTE __src[552];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  if (result != a2)
  {
    v4 = a2;
    v5 = (float *)result;
    v62 = (float *)result;
    v6 = (char *)a2 - (char *)result;
    v7 = ((char *)a2 - (char *)result) / 592;
    if ((char *)a2 - (char *)result >= 593)
    {
      v8 = (unint64_t)(v7 - 2) >> 1;
      v9 = v8 + 1;
      v10 = &result[148 * v8];
      do
      {
        result = (int *)std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(v5, v7, v10);
        v10 -= 148;
        --v9;
      }
      while (v9);
    }
    v61 = (uint64_t *)v4;
    if (v4 != (int *)a3)
    {
      v11 = (uint64_t *)v4;
      do
      {
        v12 = *((float *)v11 + 2);
        v13 = v62[2];
        if (v12 > v13 || v12 == v13 && *((_DWORD *)v11 + 1) > *((_DWORD *)v62 + 1))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v61, (uint64_t *)&v62);
          result = (int *)std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(v62, v7, (int *)v62);
          v11 = v61;
        }
        v11 += 74;
        v61 = v11;
      }
      while (v11 != a3);
      v5 = v62;
      v6 = (char *)v4 - (char *)v62;
    }
    if (v6 >= 593)
    {
      v14 = v6 / 0x250uLL;
      v54 = v5 + 10;
      v55 = v5 + 4;
      v53 = v5;
      do
      {
        v15 = v4;
        v63 = *(_QWORD *)v5;
        v64 = *((_DWORD *)v5 + 2);
        v16 = (void *)*((_QWORD *)v5 + 2);
        v57 = *((_QWORD *)v5 + 4);
        v59 = *((_QWORD *)v5 + 3);
        v55[1] = 0;
        v55[2] = 0;
        *v55 = 0;
        memcpy(__dst, v54, 0x221uLL);
        v17 = 0;
        v18 = v5;
        do
        {
          v19 = v18;
          v20 = v17 + 1;
          v18 += 148 * v17 + 148;
          v21 = 2 * v17;
          v17 = (2 * v17) | 1;
          v22 = v21 + 2;
          if (v22 < v14)
          {
            v23 = v19[148 * v20 + 2];
            v24 = v18[150];
            if (v23 > v24 || v23 == v24 && SLODWORD(v19[148 * v20 + 1]) > *((_DWORD *)v18 + 149))
            {
              v18 += 148;
              v17 = v22;
            }
          }
          v25 = *(_QWORD *)v18;
          v19[2] = v18[2];
          *(_QWORD *)v19 = v25;
          v26 = v18 + 4;
          std::vector<BOOL>::__move_assign((uint64_t)(v19 + 4), (_QWORD *)v18 + 2);
          v27 = v19 + 10;
          v28 = v18 + 10;
          memcpy(v27, v18 + 10, 0x221uLL);
        }
        while (v17 <= (uint64_t)((unint64_t)(v14 - 2) >> 1));
        v4 -= 148;
        if (v18 == (float *)(v15 - 148))
        {
          v36 = v63;
          *((_DWORD *)v18 + 2) = v64;
          *(_QWORD *)v18 = v36;
          v37 = (void *)*((_QWORD *)v18 + 2);
          if (v37)
            operator delete(v37);
          *((_QWORD *)v18 + 2) = v16;
          *((_QWORD *)v18 + 3) = v59;
          *((_QWORD *)v18 + 4) = v57;
          v38 = __dst;
          v39 = v18 + 10;
        }
        else
        {
          v29 = *(_QWORD *)v4;
          *((_DWORD *)v18 + 2) = *(v15 - 146);
          *(_QWORD *)v18 = v29;
          v30 = (void **)(v15 - 144);
          std::vector<BOOL>::__move_assign((uint64_t)(v18 + 4), (_QWORD *)v15 - 72);
          v31 = v15 - 138;
          memcpy(v18 + 10, v31, 0x221uLL);
          *(_QWORD *)v4 = v63;
          v4[2] = v64;
          if (*v30)
            operator delete(*v30);
          *v30 = v16;
          *((_QWORD *)v4 + 3) = v59;
          *((_QWORD *)v4 + 4) = v57;
          result = (int *)memcpy(v31, __dst, 0x221uLL);
          v5 = v53;
          if ((char *)(v18 + 148) - (char *)v53 < 593)
            continue;
          v32 = (((char *)(v18 + 148) - (char *)v53) / 0x250uLL - 2) >> 1;
          v33 = &v53[148 * v32];
          v34 = v33[2];
          v35 = v18[2];
          if (v34 <= v35)
          {
            if (v34 != v35)
              continue;
            v60 = *((_DWORD *)v18 + 1);
            if (SLODWORD(v53[148 * v32 + 1]) <= v60)
              continue;
          }
          else
          {
            v60 = *((_DWORD *)v18 + 1);
          }
          v51 = *(_DWORD *)v18;
          v56 = *((_QWORD *)v18 + 3);
          v58 = *((_QWORD *)v18 + 2);
          v52 = *((_QWORD *)v18 + 4);
          *v26 = 0;
          *((_QWORD *)v18 + 3) = 0;
          *((_QWORD *)v18 + 4) = 0;
          v50 = ((char *)(v18 + 148) - (char *)v53) / 0x250uLL - 2;
          memcpy(__src, v18 + 10, 0x221uLL);
          v40 = *((_DWORD *)v33 + 2);
          *(_QWORD *)v18 = *(_QWORD *)v33;
          *((_DWORD *)v18 + 2) = v40;
          v41 = &v53[148 * v32];
          v42 = v41 + 4;
          std::vector<BOOL>::__move_assign((uint64_t)v26, (_QWORD *)v41 + 2);
          v43 = v41 + 10;
          memcpy(v28, v41 + 10, 0x221uLL);
          if (v50 >= 2)
          {
            while (1)
            {
              v45 = v32 - 1;
              v32 = (v32 - 1) >> 1;
              v44 = &v53[148 * v32];
              v46 = v44[2];
              if (v46 <= v35 && (v46 != v35 || SLODWORD(v53[148 * v32 + 1]) <= v60))
                break;
              v47 = *(_QWORD *)v44;
              v33[2] = v44[2];
              *(_QWORD *)v33 = v47;
              v48 = &v53[148 * v32];
              v42 = v48 + 4;
              std::vector<BOOL>::__move_assign((uint64_t)(v33 + 4), (_QWORD *)v48 + 2);
              v43 = v48 + 10;
              memcpy(v33 + 10, v43, 0x221uLL);
              v33 = &v53[148 * v32];
              if (v45 <= 1)
                goto LABEL_39;
            }
          }
          v44 = v33;
LABEL_39:
          *(_DWORD *)v44 = v51;
          *((_DWORD *)v44 + 1) = v60;
          v44[2] = v35;
          if (*(_QWORD *)v42)
          {
            operator delete(*(void **)v42);
            *((_QWORD *)v42 + 1) = 0;
            *((_QWORD *)v42 + 2) = 0;
          }
          *(_QWORD *)v42 = v58;
          *((_QWORD *)v44 + 3) = v56;
          *((_QWORD *)v44 + 4) = v52;
          v38 = __src;
          v39 = (void *)v43;
        }
        result = (int *)memcpy(v39, v38, 0x221uLL);
      }
      while (v14-- > 2);
    }
  }
  return result;
}

float *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(float *result, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;
  float v5;
  float **v6;
  float v7;
  float v8;
  float v9;
  uint64_t *v10;
  float v11;
  float v12;
  uint64_t v13;
  float *v14;
  float *v15;

  v15 = result;
  v13 = a3;
  v14 = (float *)a2;
  v3 = *(float *)(a2 + 8);
  v4 = result[2];
  if (v3 > v4 || v3 == v4 && *(_DWORD *)(a2 + 4) > *((_DWORD *)result + 1))
  {
    v5 = *(float *)(a3 + 8);
    if (v5 > v3 || v5 == v3 && *(_DWORD *)(a3 + 4) > *(_DWORD *)(a2 + 4))
    {
      v6 = &v15;
LABEL_19:
      v10 = &v13;
      return (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)v6, v10);
    }
    result = (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v15, (uint64_t *)&v14);
    v11 = *(float *)(v13 + 8);
    v12 = v14[2];
    if (v11 > v12 || v11 == v12 && *(_DWORD *)(v13 + 4) > *((_DWORD *)v14 + 1))
    {
      v6 = &v14;
      goto LABEL_19;
    }
  }
  else
  {
    v7 = *(float *)(a3 + 8);
    if (v7 > v3 || v7 == v3 && *(_DWORD *)(a3 + 4) > *(_DWORD *)(a2 + 4))
    {
      result = (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v14, &v13);
      v8 = v14[2];
      v9 = v15[2];
      if (v8 > v9 || v8 == v9 && *((_DWORD *)v14 + 1) > *((_DWORD *)v15 + 1))
      {
        v6 = &v15;
        v10 = (uint64_t *)&v14;
        return (float *)std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)v6, v10);
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BOOL8 result;
  float v6;
  float v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  float *v11;
  float v12;
  float v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  float *v18;
  uint64_t *v19;
  float v20;
  uint64_t *v21;
  float *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  _BYTE __dst[545];
  uint64_t v30;

  v2 = a2;
  v30 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v28 = (uint64_t *)a1;
  v4 = 0x14C1BACF914C1BADLL * ((a2 - a1) >> 4);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v27 = a2 - 592;
      v6 = *(float *)(a2 - 584);
      v7 = *(float *)(a1 + 8);
      if (v6 > v7 || v6 == v7 && *(_DWORD *)(a2 - 588) > *(_DWORD *)(a1 + 4))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v28, &v27);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a1 + 592, a2 - 592);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(a1, a1 + 592, a1 + 1184, a2 - 592);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*,0>(a1, a1 + 592, a1 + 1184, a1 + 1776, a2 - 592);
      return 1;
    default:
      v8 = (uint64_t *)(a1 + 1184);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a1 + 592, a1 + 1184);
      v9 = a1 + 1776;
      if (a1 + 1776 == v2)
        return 1;
      v10 = 0;
      v11 = (float *)(a1 + 1224);
      break;
  }
  while (1)
  {
    v12 = *(float *)(v9 + 8);
    v13 = *((float *)v8 + 2);
    if (v12 <= v13)
    {
      if (v12 != v13)
        goto LABEL_25;
      v14 = *(_DWORD *)(v9 + 4);
      if (v14 <= *((_DWORD *)v8 + 1))
        goto LABEL_25;
    }
    else
    {
      v14 = *(_DWORD *)(v9 + 4);
    }
    v26 = v10;
    v24 = *(_DWORD *)v9;
    v15 = *(_QWORD *)(v9 + 16);
    v16 = *(_QWORD *)(v9 + 24);
    v25 = *(_QWORD *)(v9 + 32);
    *(_QWORD *)(v9 + 16) = 0;
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    memcpy(__dst, (const void *)(v9 + 40), sizeof(__dst));
    *(_QWORD *)v9 = *v8;
    *(_DWORD *)(v9 + 8) = *((_DWORD *)v8 + 2);
    v17 = v8 + 2;
    std::vector<BOOL>::__move_assign(v9 + 16, v8 + 2);
    v18 = (float *)(v8 + 5);
    memcpy((void *)(v9 + 40), v8 + 5, 0x221uLL);
    v19 = v28;
    if (v8 != v28)
    {
      v23 = v16;
      v18 = v11;
      while (1)
      {
        v20 = *(v18 - 156);
        if (v12 <= v20)
        {
          if (v12 != v20)
            goto LABEL_20;
          if (v14 <= *((_DWORD *)v18 - 157))
            break;
        }
        v21 = (uint64_t *)(v18 - 158);
        *((_QWORD *)v18 - 5) = *((_QWORD *)v18 - 79);
        *(v18 - 8) = *(v18 - 156);
        v17 = v8 - 72;
        std::vector<BOOL>::__move_assign((uint64_t)(v18 - 6), (_QWORD *)v18 - 77);
        v22 = v18 - 148;
        memcpy(v18, v18 - 148, 0x221uLL);
        v18 -= 148;
        v8 -= 74;
        if (v21 == v19)
        {
          v8 = v19;
          v18 = v22;
          goto LABEL_20;
        }
      }
      v17 = (uint64_t *)(v18 - 6);
      v8 = (uint64_t *)(v18 - 10);
LABEL_20:
      v16 = v23;
    }
    *(_DWORD *)v8 = v24;
    *((_DWORD *)v8 + 1) = v14;
    *((float *)v8 + 2) = v12;
    if (*v17)
    {
      operator delete((void *)*v17);
      v17[1] = 0;
      v17[2] = 0;
    }
    *v17 = v15;
    v8[3] = v16;
    v8[4] = v25;
    memcpy(v18, __dst, 0x221uLL);
    v10 = v26 + 1;
    if (v26 == 7)
      return v9 + 592 == v27;
    v2 = v27;
LABEL_25:
    v8 = (uint64_t *)v9;
    v11 += 148;
    v9 += 592;
    if (v9 == v2)
      return 1;
  }
}

void *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *result;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  float *v16;
  float *v17;
  uint64_t *v18;

  v17 = (float *)a2;
  v18 = (uint64_t *)a1;
  v15 = a4;
  v16 = (float *)a3;
  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>((float *)a1, a2, a3);
  v9 = *(float *)(a4 + 8);
  v10 = *(float *)(a3 + 8);
  if (v9 > v10 || v9 == v10 && *(_DWORD *)(a4 + 4) > *(_DWORD *)(a3 + 4))
  {
    result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v16, &v15);
    v11 = v16[2];
    v12 = *(float *)(a2 + 8);
    if (v11 > v12 || v11 == v12 && *((_DWORD *)v16 + 1) > *(_DWORD *)(a2 + 4))
    {
      result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>((uint64_t **)&v17, (uint64_t *)&v16);
      v13 = v17[2];
      v14 = *(float *)(a1 + 8);
      if (v13 > v14 || v13 == v14 && *((_DWORD *)v17 + 1) > *(_DWORD *)(a1 + 4))
        return std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ou3dor::Object3DEncoder::ObjectView *&,ou3dor::Object3DEncoder::ObjectView *&>(&v18, (uint64_t *)&v17);
    }
  }
  return result;
}

float *std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ou3dor::Object3DEncoder::AddToObject(ou3dor::Object3DEncoder::ObjectView &&,ou3dor::Object3DEncoder::ObjectWithViews<3ul> &)::$_0 &,ou3dor::Object3DEncoder::ObjectView*>(float *result, uint64_t a2, int *a3)
{
  unint64_t v3;
  float *v5;
  uint64_t v6;
  uint64_t v8;
  float *v9;
  float v10;
  float v11;
  float v12;
  float v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  float *v20;
  void *v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE __dst[545];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2 - 2;
  if (a2 >= 2)
  {
    v5 = result;
    v6 = v3 >> 1;
    if ((uint64_t)(v3 >> 1) >= 0x14C1BACF914C1BADLL * (((char *)a3 - (char *)result) >> 4))
    {
      v8 = (0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4)) | 1;
      v9 = &result[148 * v8];
      if (0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4) + 2 < a2)
      {
        v10 = result[148 * v8 + 2];
        v11 = v9[150];
        if (v10 > v11 || v10 == v11 && SLODWORD(result[148 * v8 + 1]) > *((_DWORD *)v9 + 149))
        {
          v9 += 148;
          v8 = 0x2983759F2298375ALL * (((char *)a3 - (char *)result) >> 4) + 2;
        }
      }
      v12 = v9[2];
      v13 = *((float *)a3 + 2);
      if (v12 <= v13)
      {
        if (v12 == v13)
        {
          v14 = a3[1];
          if (*((_DWORD *)v9 + 1) > v14)
            return result;
        }
        else
        {
          v14 = a3[1];
        }
        v27 = *a3;
        v15 = (uint64_t)(a3 + 4);
        v29 = *((_QWORD *)a3 + 3);
        v30 = *((_QWORD *)a3 + 2);
        v28 = *((_QWORD *)a3 + 4);
        *((_QWORD *)a3 + 2) = 0;
        v16 = a3 + 10;
        *((_QWORD *)a3 + 3) = 0;
        *((_QWORD *)a3 + 4) = 0;
        memcpy(__dst, a3 + 10, sizeof(__dst));
        v17 = *((_DWORD *)v9 + 2);
        *(_QWORD *)a3 = *(_QWORD *)v9;
        a3[2] = v17;
        v18 = v9 + 4;
        std::vector<BOOL>::__move_assign(v15, (_QWORD *)v9 + 2);
        v19 = v9 + 10;
        memcpy(v16, v9 + 10, 0x221uLL);
        if (v6 >= v8)
        {
          while (1)
          {
            v22 = 2 * v8;
            v8 = (2 * v8) | 1;
            v20 = &v5[148 * v8];
            if (v22 + 2 < a2)
            {
              v23 = v5[148 * v8 + 2];
              v24 = v20[150];
              if (v23 > v24 || v23 == v24 && SLODWORD(v5[148 * v8 + 1]) > *((_DWORD *)v20 + 149))
              {
                v20 += 148;
                v8 = v22 + 2;
              }
            }
            v25 = v20[2];
            if (v25 > v13 || v25 == v13 && *((_DWORD *)v20 + 1) > v14)
              break;
            v26 = *(_QWORD *)v20;
            v9[2] = v20[2];
            *(_QWORD *)v9 = v26;
            v18 = v20 + 4;
            std::vector<BOOL>::__move_assign((uint64_t)(v9 + 4), (_QWORD *)v20 + 2);
            v19 = v20 + 10;
            memcpy(v9 + 10, v20 + 10, 0x221uLL);
            v9 = v20;
            if (v6 < v8)
              goto LABEL_14;
          }
        }
        v20 = v9;
LABEL_14:
        *(_DWORD *)v20 = v27;
        *((_DWORD *)v20 + 1) = v14;
        v20[2] = v13;
        v21 = (void *)*((_QWORD *)v20 + 2);
        if (v21)
        {
          operator delete(v21);
          v18[1] = 0;
          v18[2] = 0;
        }
        *v18 = v30;
        *((_QWORD *)v20 + 3) = v29;
        *((_QWORD *)v20 + 4) = v28;
        return (float *)memcpy(v19, __dst, 0x221uLL);
      }
    }
  }
  return result;
}

uint64_t std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 48 * a3;
    do
    {
      std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__emplace_hint_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>((uint64_t **)a1, v4, a2, (id *)a2);
      a2 += 6;
      v6 -= 48;
    }
    while (v6);
  }
  return a1;
}

void sub_229559408(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__emplace_hint_unique_key_args<NSString * {__strong},std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, id *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<NSString * {__strong},std::set<unsigned char>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::set<unsigned char>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::set<unsigned char>>>>::__find_equal<NSString * {__strong}>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__construct_node<std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<int>::__insert_node_at(a1, v10, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::__construct_node<std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>> const&>@<X0>(uint64_t a1@<X0>, id *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *result;

  v5 = a1 + 8;
  v6 = operator new(0x50uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100](v6 + 4, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_229559504(_Unwind_Exception *a1)
{
  _QWORD *v1;
  id *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100](_QWORD *a1, id *a2)
{
  uint64_t v3;

  v3 = (uint64_t)(a2 + 1);
  *a1 = *a2;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)(a1 + 1), v3);
  return a1;
}

void sub_229559560(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)(a2 + 5));

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>,std::less<NSString * {__strong}>,true>,std::allocator<std::__value_type<NSString * {__strong},std::unordered_set<SemanticLabelv5>>>>::destroy(a1, a2[1]);
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)(a2 + 5));

    operator delete(a2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>(uint64_t a1)
{
  uint64_t i;
  void *v3;

  for (i = 1824; i != -544; i -= 592)
  {
    v3 = *(void **)(a1 + i);
    if (v3)
      operator delete(v3);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_229559954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0xB78uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  result = std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>::pair[abi:ne180100]<std::string const&>((std::string *)(v8 + 16), *a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_2295599C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>::pair[abi:ne180100]<std::string const&>(std::string *this, __int128 *a2)
{
  __int128 v3;
  uint64_t i;
  char *v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  bzero(&this[1], 0xB50uLL);
  for (i = 0; i != 2368; i += 592)
  {
    v5 = (char *)this + i;
    *((_QWORD *)v5 + 6) = 0;
    *((_QWORD *)v5 + 7) = 0;
    *((_QWORD *)v5 + 8) = 0;
    v5[104] = 0;
    v5[616] = 0;
  }
  this[100].__r_.__value_.__s.__data_[0] = 0;
  this[121].__r_.__value_.__s.__data_[8] = 0;
  return this;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ou3dor::Object3DEncoder::ObjectWithViews<3ul>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void _GLOBAL__sub_I_Object3DEncoder_mm()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t i;
  uint64_t j;
  uint64_t v8;
  void *context;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  unsigned __int8 v22;
  _BYTE v23[47];
  unsigned __int8 v24;
  _BYTE v25[47];
  unsigned __int8 v26;
  _BYTE v27[47];
  unsigned __int8 v28;
  _BYTE v29[47];
  unsigned __int8 v30;
  _BYTE v31[47];
  unsigned __int8 v32;
  _BYTE v33[47];
  unsigned __int8 v34;
  _BYTE v35[47];
  unsigned __int8 v36;
  _BYTE v37[47];
  unsigned __int8 v38;
  _BYTE v39[47];
  unsigned __int8 v40;
  _BYTE v41[47];
  unsigned __int8 v42;
  _BYTE v43[47];
  unsigned __int8 v44;
  _BYTE v45[47];
  unsigned __int8 v46;
  _BYTE v47[47];
  unsigned __int8 v48;
  _BYTE v49[47];
  unsigned __int8 v50;
  _BYTE v51[47];
  unsigned __int8 v52;
  _BYTE v53[47];
  unsigned __int8 v54;
  _BYTE v55[45];
  __int16 v56;
  char v57;
  _BYTE v58[47];
  unsigned __int8 v59;
  _BYTE v60[45];
  __int16 v61;
  char v62;
  _BYTE v63[40];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  __CFString *v79;
  uint64_t v80;
  __CFString *v81;
  int v82;
  __CFString *v83;
  int v84;
  __CFString *v85;
  uint64_t v86;
  __CFString *v87;
  int v88;
  __CFString *v89;
  int v90;
  __CFString *v91;
  _QWORD v92[2];
  int v93;
  __CFString *v94;
  int v95;
  id v96;
  _QWORD v97[2];
  int v98;
  __CFString *v99;
  int v100;
  __CFString *v101;
  _QWORD v102[2];
  int v103;
  __CFString *v104;
  int v105;
  id v106;
  _QWORD v107[2];
  int v108;
  id v109;
  int v110;
  __CFString *v111;
  uint64_t v112[6];
  uint64_t v113[6];
  uint64_t v114[6];
  uint64_t v115[6];
  uint64_t v116[6];
  uint64_t v117[6];
  uint64_t v118[6];
  uint64_t v119[6];
  _QWORD v120[10];

  v120[7] = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22E2CB070]();
  LODWORD(v64) = 0;
  *((_QWORD *)&v64 + 1) = CFSTR("Unknown");
  LODWORD(v65) = 1;
  *((_QWORD *)&v65 + 1) = *((id *)&v64 + 1);
  LODWORD(v66) = 2;
  *((_QWORD *)&v66 + 1) = *((id *)&v65 + 1);
  LODWORD(v67) = 3;
  *((_QWORD *)&v67 + 1) = *((id *)&v66 + 1);
  LODWORD(v68) = 4;
  *((_QWORD *)&v68 + 1) = *((id *)&v67 + 1);
  LODWORD(v69) = 5;
  *((_QWORD *)&v69 + 1) = *((id *)&v68 + 1);
  LODWORD(v70) = 6;
  v21 = CFSTR("Door");
  *((_QWORD *)&v70 + 1) = v21;
  LODWORD(v71) = 7;
  v20 = CFSTR("Window");
  *((_QWORD *)&v71 + 1) = v20;
  LODWORD(v72) = 8;
  *((_QWORD *)&v72 + 1) = *((id *)&v69 + 1);
  LODWORD(v73) = 9;
  v18 = CFSTR("Fireplace");
  *((_QWORD *)&v73 + 1) = v18;
  LODWORD(v74) = 10;
  *((_QWORD *)&v74 + 1) = *((id *)&v72 + 1);
  LODWORD(v75) = 11;
  *((_QWORD *)&v75 + 1) = *((id *)&v74 + 1);
  LODWORD(v76) = 12;
  v19 = CFSTR("Stairs");
  *((_QWORD *)&v76 + 1) = v19;
  LODWORD(v77) = 13;
  v14 = CFSTR("Bed");
  *((_QWORD *)&v77 + 1) = v14;
  LODWORD(v78) = 14;
  v79 = CFSTR("Cabinet");
  LODWORD(v80) = 15;
  v17 = CFSTR("Chair");
  v81 = v17;
  v82 = 16;
  v83 = v79;
  v84 = 17;
  v85 = v83;
  LODWORD(v86) = 18;
  v16 = CFSTR("Sofa");
  v87 = v16;
  v88 = 19;
  v15 = CFSTR("Table");
  v89 = v15;
  v90 = 20;
  v13 = CFSTR("Toilet");
  v91 = v13;
  LODWORD(v92[0]) = 21;
  v11 = CFSTR("Sink");
  v92[1] = v11;
  v93 = 22;
  v12 = CFSTR("Bathtub");
  v94 = v12;
  v95 = 23;
  v96 = *((id *)&v75 + 1);
  LODWORD(v97[0]) = 24;
  v0 = CFSTR("Refrigerator");
  v97[1] = v0;
  v98 = 25;
  v1 = CFSTR("Stove");
  v99 = v1;
  v100 = 26;
  v2 = CFSTR("Washer");
  v101 = v2;
  LODWORD(v102[0]) = 27;
  v3 = CFSTR("Oven");
  v102[1] = v3;
  v103 = 28;
  v4 = CFSTR("Dishwasher");
  v104 = v4;
  v105 = 29;
  v106 = v96;
  LODWORD(v107[0]) = 30;
  v5 = v85;
  v107[1] = v5;
  v108 = 31;
  v109 = v106;
  v110 = 32;
  v10 = CFSTR("Screen");
  v111 = v10;
  std::unordered_map<int,NSString * {__strong}>::unordered_map((uint64_t)&kSemanticsODLabelMap, (int *)&v64, 33);
  for (i = 520; i != -8; i -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<int,NSString * {__strong}>::~unordered_map[abi:ne180100], &kSemanticsODLabelMap, &dword_2294C8000);
  v74 = xmmword_229562A38;
  v75 = unk_229562A48;
  v76 = xmmword_229562A58;
  v77 = unk_229562A68;
  v70 = xmmword_2295629F8;
  v71 = unk_229562A08;
  v72 = xmmword_229562A18;
  v73 = unk_229562A28;
  v66 = xmmword_2295629B8;
  v67 = unk_2295629C8;
  v68 = xmmword_2295629D8;
  v69 = unk_2295629E8;
  v64 = xmmword_229562998;
  v65 = unk_2295629A8;
  v78 = 28;
  std::unordered_map<int,SemanticLabelv5>::unordered_map((uint64_t)&kSparseSSDSemanticLabels, (int *)&v64, 29);
  __cxa_atexit((void (*)(void *))std::unordered_map<int,SemanticLabelv5>::~unordered_map[abi:ne180100], &kSparseSSDSemanticLabels, &dword_2294C8000);
  LODWORD(v64) = 0;
  *((_QWORD *)&v64 + 1) = v5;
  LODWORD(v65) = 1;
  *((_QWORD *)&v65 + 1) = v0;
  LODWORD(v66) = 2;
  *((_QWORD *)&v66 + 1) = CFSTR("Shelf");
  LODWORD(v67) = 3;
  *((_QWORD *)&v67 + 1) = v1;
  LODWORD(v68) = 4;
  *((_QWORD *)&v68 + 1) = v14;
  LODWORD(v69) = 5;
  *((_QWORD *)&v69 + 1) = v11;
  LODWORD(v70) = 6;
  *((_QWORD *)&v70 + 1) = v2;
  LODWORD(v71) = 7;
  *((_QWORD *)&v71 + 1) = v13;
  LODWORD(v72) = 8;
  *((_QWORD *)&v72 + 1) = v12;
  LODWORD(v73) = 9;
  *((_QWORD *)&v73 + 1) = v3;
  LODWORD(v74) = 10;
  *((_QWORD *)&v74 + 1) = v4;
  LODWORD(v75) = 11;
  *((_QWORD *)&v75 + 1) = v18;
  LODWORD(v76) = 12;
  *((_QWORD *)&v76 + 1) = CFSTR("Stool");
  LODWORD(v77) = 13;
  *((_QWORD *)&v77 + 1) = v17;
  LODWORD(v78) = 14;
  v79 = v15;
  LODWORD(v80) = 15;
  v81 = v10;
  v82 = 16;
  v83 = v16;
  v84 = 17;
  v85 = v19;
  LODWORD(v86) = 18;
  v87 = v20;
  v88 = 19;
  v89 = v21;
  v90 = 20;
  v91 = CFSTR("BuildInCabinet");
  std::unordered_map<int,NSString * {__strong}>::unordered_map((uint64_t)&kSparseSSDObjectLabels, (int *)&v64, 21);
  for (j = 328; j != -8; j -= 16)

  __cxa_atexit((void (*)(void *))std::unordered_map<int,NSString * {__strong}>::~unordered_map[abi:ne180100], &kSparseSSDObjectLabels, &dword_2294C8000);
  v61 = 4366;
  v62 = 30;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v63, (unsigned __int8 *)&v61, 3);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v64, (id *)OU3DObjectTypeCabinet, (uint64_t)v63);
  v59 = 24;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v60, &v59, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v67, (id *)OU3DObjectTypeRefrigerator, (uint64_t)v60);
  v56 = 4366;
  v57 = 30;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v58, (unsigned __int8 *)&v56, 3);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v70, (id *)OU3DObjectTypeShelf, (uint64_t)v58);
  v54 = 25;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v55, &v54, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v73, (id *)OU3DObjectTypeStove, (uint64_t)v55);
  v52 = 13;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v53, &v52, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v76, (id *)OU3DObjectTypeBed, (uint64_t)v53);
  v50 = 21;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v51, &v50, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v80, (id *)OU3DObjectTypeSink, (uint64_t)v51);
  v48 = 26;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v49, &v48, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(&v86, (id *)OU3DObjectTypeWasher, (uint64_t)v49);
  v46 = 20;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v47, &v46, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v92, (id *)OU3DObjectTypeToilet, (uint64_t)v47);
  v44 = 22;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v45, &v44, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v97, (id *)OU3DObjectTypeBathtub, (uint64_t)v45);
  v42 = 27;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v43, &v42, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v102, (id *)OU3DObjectTypeOven, (uint64_t)v43);
  v40 = 28;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v41, &v40, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v107, (id *)OU3DObjectTypeDishwasher, (uint64_t)v41);
  v38 = 9;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v39, &v38, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v112, (id *)OU3DObjectTypeFireplace, (uint64_t)v39);
  v36 = 15;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v37, &v36, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v113, (id *)OU3DObjectTypeStool, (uint64_t)v37);
  v34 = 15;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v35, &v34, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v114, (id *)OU3DObjectTypeChair, (uint64_t)v35);
  v32 = 19;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v33, &v32, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v115, (id *)OU3DObjectTypeTable, (uint64_t)v33);
  v30 = 32;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v31, &v30, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v116, (id *)OU3DObjectTypeScreen, (uint64_t)v31);
  v28 = 18;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v29, &v28, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v117, (id *)OU3DObjectTypeSofa, (uint64_t)v29);
  v26 = 12;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v27, &v26, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v118, (id *)OU3DObjectTypeStairs, (uint64_t)v27);
  v24 = 7;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v25, &v24, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v119, (id *)OU3DObjectTypeWindow, (uint64_t)v25);
  v22 = 6;
  std::unordered_set<SemanticLabelv5>::unordered_set((uint64_t)v23, &v22, 1);
  std::pair<NSString * const {__strong},std::unordered_set<SemanticLabelv5>>::pair[abi:ne180100]<true,0>(v120, (id *)OU3DObjectTypeDoor, (uint64_t)v23);
  std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::map[abi:ne180100]((uint64_t)&kObjectTypeToSemanticLabels, (unint64_t *)&v64, 20);
  v8 = 960;
  do
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v63[v8]);

    v8 -= 48;
  }
  while (v8);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v23);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v25);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v27);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v29);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v31);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v33);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v35);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v37);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v39);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v41);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v43);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v45);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v47);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v49);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v51);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v53);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v55);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v58);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v60);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v63);
  __cxa_atexit((void (*)(void *))std::map<NSString * {__strong},std::unordered_set<SemanticLabelv5>>::~map[abi:ne180100], &kObjectTypeToSemanticLabels, &dword_2294C8000);
  objc_autoreleasePoolPop(context);
}

void sub_22955A6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  char a72;
  uint64_t v72;
  uint64_t v74;

  v74 = 960;
  do
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v72 + v74 - 40);

    v74 -= 48;
  }
  while (v74);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a24);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a30);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a36);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a42);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a48);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a54);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a60);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a66);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&a72);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x228]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x258]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x288]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x2B8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x2E8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x318]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x348]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x378]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x3A8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x3D8]);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x408]);
  _Unwind_Resume(a1);
}

CVPixelBufferRef CreateCVPixelBuffer(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  const __CFAllocator *v8;
  NSObject *v10;
  void *exception;
  CVPixelBufferRef pixelBufferOut;
  CVPixelBufferPoolRef poolOut;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  poolOut = 0;
  v14[0] = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x24BDC5708];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = *MEMORY[0x24BDC5668];
  v15[2] = v6;
  v15[3] = MEMORY[0x24BDBD1B8];
  v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);

  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v7, &poolOut);
  if (CVPixelBufferPoolCreatePixelBuffer(v8, poolOut, &pixelBufferOut))
  {
    _OULoggingGetOSLogForCategoryObjectUnderstanding();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      CreateCVPixelBuffer(v10);

    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22E2CA890](exception, &unk_22956FEC2);
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  CVPixelBufferPoolRelease(poolOut);
  return pixelBufferOut;
}

void sub_22955AAF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float GetVoteWeight(float a1, float a2)
{
  double v2;
  float result;

  v2 = vabds_f32(a1, a2);
  result = 3.0;
  if (v2 >= 0.1)
  {
    result = 2.0;
    if (v2 >= 0.2)
    {
      result = 0.0;
      if (v2 < 0.3)
        return 1.0;
    }
  }
  return result;
}

unint64_t HistogramMaxBin(float **a1, uint64_t a2, float a3)
{
  float *v5;
  float *v6;
  float *v8;
  float *v9;
  unint64_t v10;
  float *v11;
  float *v12;
  uint64_t v13;
  unint64_t v14;
  float *v15;
  float v16;
  signed int v17;
  float v18;
  float *v19;
  float *v20;
  float v21;
  float *v22;
  float v23;
  float v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  int v29;
  void *__p;
  float *v31;

  v5 = *a1;
  v6 = a1[1];
  if (v5 == v6 || (char *)v6 - (char *)v5 != *(_QWORD *)(a2 + 8) - *(_QWORD *)a2)
  {
    v25 = 0;
    v26 = 0;
  }
  else
  {
    LOBYTE(v29) = 0;
    v8 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>,std::__identity,std::__less<void,void>>(v5, v6);
    v10 = (int)(vcvtms_s32_f32((float)((float)(*v9 + a3) - *v8) / a3) + 1);
    v29 = 0;
    std::vector<float>::vector(&__p, v10, &v29);
    v11 = *a1;
    v12 = (float *)__p;
    v13 = (char *)a1[1] - (char *)*a1;
    if (v13)
    {
      v14 = v13 >> 2;
      v15 = *(float **)a2;
      if (v14 <= 1)
        v14 = 1;
      do
      {
        v16 = *v11++;
        v17 = vcvtms_s32_f32((float)(v16 - *v8) / a3);
        v18 = *v15++;
        v12[v17] = v18 + v12[v17];
        --v14;
      }
      while (v14);
    }
    if (v12 == v31)
    {
      v20 = v12;
    }
    else
    {
      v19 = v12 + 1;
      v20 = v12;
      if (v12 + 1 != v31)
      {
        v21 = *v12;
        v20 = v12;
        v22 = v12 + 1;
        do
        {
          v23 = *v22++;
          v24 = v23;
          if (v21 < v23)
          {
            v21 = v24;
            v20 = v19;
          }
          v19 = v22;
        }
        while (v22 != v31);
      }
    }
    v27 = *v8 + (float)((float)(v20 - v12) * a3);
    v25 = (int)*v20;
    if (v12)
    {
      v31 = v12;
      operator delete(v12);
    }
    v26 = (unint64_t)LODWORD(v27) << 32;
  }
  return v26 | v25;
}

void SmoothObjectUponHistory(OU3DObject *a1@<X0>, uint64_t a2@<X8>)
{
  OU3DObject *v3;
  OU3DObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  float v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  float *v42;
  int v43;
  float32x4_t *v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t *v51;
  float32x4_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  float32x4_t *v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t *v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  float *v81;
  int v82;
  float32x4_t *v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t *v90;
  float32x4_t *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  float32x4_t *v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t *v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  char *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  double v115;
  __int32 v116;
  __int32 v117;
  unint64_t v118;
  uint64_t v119;
  __int32 v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  float32x4_t *v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  void *v132;
  void *v133;
  void *v134;
  _OWORD *v135;
  uint64_t j;
  int *v137;
  int v138;
  uint64_t v139;
  char *v140;
  float *v141;
  float *v142;
  uint64_t v143;
  float v144;
  double v145;
  float v146;
  unint64_t v147;
  int8x16_t v148;
  __n128 v149;
  float v150;
  float v151;
  float32x2_t v152;
  __n128 v153;
  float v154;
  int32x4_t v155;
  unint64_t v156;
  float32x4_t v157;
  float32x4_t v158;
  NSObject *v159;
  void *v160;
  void *v161;
  __n128 v162;
  int8x16_t v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  float v169;
  int32x4_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  float v175;
  float v176;
  float v177;
  simd::float3x3 v178;
  simd::float3x3 v179;
  void *v180[2];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  void *v188[3];
  void *__p[2];
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  void *v197;
  __n128 *v198;
  simd::float3x3 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  void *v204;
  char *v205;
  char *v206;
  void *v207;
  float32x4_t *v208;
  char *v209;
  void *v210;
  char *v211;
  char *v212;
  void *v213;
  float32x4_t *v214;
  char *v215;
  float32x4_t v216;
  float32x4_t v217;
  float32x4_t v218;
  float32x4_t v219;
  float32x4_t v220;
  float32x4_t v221;
  float32x4_t v222;
  float32x4_t v223;
  _BYTE v224[128];
  uint64_t v225;

  v225 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_93;
  -[OU3DObject refined_box_history](v3, "refined_box_history");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_93;
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 3)
    goto LABEL_93;
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 - 1;
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_92;
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "refinedBox");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_93:
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 128) = 0;
    goto LABEL_94;
  }
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preRefinedBox");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

LABEL_92:
    goto LABEL_93;
  }
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preRefinedBox");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 != 8)
    goto LABEL_93;
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preRefinedBox");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  box3dFromNSArray(v22, (uint64_t)&v216);

  box3dToCentroidSizeAngle(&v216, (uint64_t *)__p);
  v23 = *((float *)__p[0] + 6);
  __p[1] = __p[0];
  operator delete(__p[0]);
  if (v23 < -9.0)
    goto LABEL_93;
  v214 = 0;
  v213 = 0;
  v215 = 0;
  v211 = 0;
  v210 = 0;
  v212 = 0;
  v208 = 0;
  v207 = 0;
  v209 = 0;
  v205 = 0;
  v204 = 0;
  v206 = 0;
  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  -[OU3DObject refined_box_history](v4, "refined_box_history");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v200, v224, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v201;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v201 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * i);
        objc_msgSend(v28, "refinedBox");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v28, "refinedBox");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count") == 8;

          if (v31)
          {
            v222 = 0u;
            v223 = 0u;
            v220 = 0u;
            v221 = 0u;
            v218 = 0u;
            v219 = 0u;
            v216 = 0u;
            v217 = 0u;
            objc_msgSend(v28, "refinedBox");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            box3dFromNSArray(v32, (uint64_t)&v216);

            box3dToCentroidSizeAngle(&v216, (uint64_t *)__p);
            v33 = *((float *)__p[0] + 6);
            __p[1] = __p[0];
            operator delete(__p[0]);
            if (vabds_f32(v33, v23) < 0.2)
            {
              v34 = v205;
              if (v205 >= v206)
              {
                v36 = (char *)v204;
                v37 = (v205 - (_BYTE *)v204) >> 2;
                v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 62)
                  goto LABEL_155;
                v39 = v206 - (_BYTE *)v204;
                if ((v206 - (_BYTE *)v204) >> 1 > v38)
                  v38 = v39 >> 1;
                if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL)
                  v40 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v40 = v38;
                if (v40)
                {
                  v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v206, v40);
                  v34 = v205;
                  v36 = (char *)v204;
                }
                else
                {
                  v41 = 0;
                }
                v42 = (float *)&v41[4 * v37];
                *v42 = v33;
                v35 = (char *)(v42 + 1);
                while (v34 != v36)
                {
                  v43 = *((_DWORD *)v34 - 1);
                  v34 -= 4;
                  *((_DWORD *)v42-- - 1) = v43;
                }
                v204 = v42;
                v205 = v35;
                v206 = &v41[4 * v40];
                if (v36)
                  operator delete(v36);
              }
              else
              {
                *(float *)v205 = v33;
                v35 = v34 + 4;
              }
              v205 = v35;
              v44 = v208;
              if (v208 >= (float32x4_t *)v209)
              {
                v52 = (float32x4_t *)v207;
                v53 = ((char *)v208 - (_BYTE *)v207) >> 7;
                v54 = v53 + 1;
                if ((unint64_t)(v53 + 1) >> 57)
                  goto LABEL_154;
                v55 = v209 - (_BYTE *)v207;
                if ((v209 - (_BYTE *)v207) >> 6 > v54)
                  v54 = v55 >> 6;
                if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFF80)
                  v56 = 0x1FFFFFFFFFFFFFFLL;
                else
                  v56 = v54;
                if (v56)
                {
                  v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v209, v56);
                  v44 = v208;
                  v52 = (float32x4_t *)v207;
                }
                else
                {
                  v57 = 0;
                }
                v58 = (float32x4_t *)&v57[128 * v53];
                v59 = v216;
                v60 = v217;
                v61 = v219;
                v58[2] = v218;
                v58[3] = v61;
                *v58 = v59;
                v58[1] = v60;
                v62 = v220;
                v63 = v221;
                v64 = v223;
                v58[6] = v222;
                v58[7] = v64;
                v58[4] = v62;
                v58[5] = v63;
                if (v44 == v52)
                {
                  v72 = &v57[128 * v53];
                }
                else
                {
                  v65 = (float32x4_t *)&v57[128 * v53];
                  do
                  {
                    v66 = v44[-8];
                    v67 = v44[-7];
                    v68 = v44[-5];
                    v65[-6] = v44[-6];
                    v65[-5] = v68;
                    v65[-8] = v66;
                    v65[-7] = v67;
                    v69 = v44[-4];
                    v70 = v44[-3];
                    v71 = v44[-1];
                    v72 = (char *)&v65[-8];
                    v65[-2] = v44[-2];
                    v65[-1] = v71;
                    v65[-4] = v69;
                    v65[-3] = v70;
                    v44 -= 8;
                    v65 -= 8;
                  }
                  while (v44 != v52);
                }
                v51 = v58 + 8;
                v207 = v72;
                v208 = v58 + 8;
                v209 = &v57[128 * v56];
                if (v52)
                  operator delete(v52);
              }
              else
              {
                v45 = v216;
                v46 = v217;
                v47 = v219;
                v208[2] = v218;
                v44[3] = v47;
                *v44 = v45;
                v44[1] = v46;
                v48 = v220;
                v49 = v221;
                v50 = v223;
                v44[6] = v222;
                v44[7] = v50;
                v44[4] = v48;
                v44[5] = v49;
                v51 = v44 + 8;
              }
              v208 = v51;
            }
            v73 = v211;
            if (v211 >= v212)
            {
              v75 = (char *)v210;
              v76 = (v211 - (_BYTE *)v210) >> 2;
              v77 = v76 + 1;
              if ((unint64_t)(v76 + 1) >> 62)
LABEL_155:
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v78 = v212 - (_BYTE *)v210;
              if ((v212 - (_BYTE *)v210) >> 1 > v77)
                v77 = v78 >> 1;
              if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
                v79 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v79 = v77;
              if (v79)
              {
                v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v212, v79);
                v73 = v211;
                v75 = (char *)v210;
              }
              else
              {
                v80 = 0;
              }
              v81 = (float *)&v80[4 * v76];
              *v81 = v33;
              v74 = (char *)(v81 + 1);
              while (v73 != v75)
              {
                v82 = *((_DWORD *)v73 - 1);
                v73 -= 4;
                *((_DWORD *)v81-- - 1) = v82;
              }
              v210 = v81;
              v211 = v74;
              v212 = &v80[4 * v79];
              if (v75)
                operator delete(v75);
            }
            else
            {
              *(float *)v211 = v33;
              v74 = v73 + 4;
            }
            v211 = v74;
            v83 = v214;
            if (v214 >= (float32x4_t *)v215)
            {
              v91 = (float32x4_t *)v213;
              v92 = ((char *)v214 - (_BYTE *)v213) >> 7;
              v93 = v92 + 1;
              if ((unint64_t)(v92 + 1) >> 57)
LABEL_154:
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v94 = v215 - (_BYTE *)v213;
              if ((v215 - (_BYTE *)v213) >> 6 > v93)
                v93 = v94 >> 6;
              if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFF80)
                v95 = 0x1FFFFFFFFFFFFFFLL;
              else
                v95 = v93;
              if (v95)
              {
                v96 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v215, v95);
                v83 = v214;
                v91 = (float32x4_t *)v213;
              }
              else
              {
                v96 = 0;
              }
              v97 = (float32x4_t *)&v96[128 * v92];
              v98 = v216;
              v99 = v217;
              v100 = v219;
              v97[2] = v218;
              v97[3] = v100;
              *v97 = v98;
              v97[1] = v99;
              v101 = v220;
              v102 = v221;
              v103 = v223;
              v97[6] = v222;
              v97[7] = v103;
              v97[4] = v101;
              v97[5] = v102;
              if (v83 == v91)
              {
                v111 = &v96[128 * v92];
              }
              else
              {
                v104 = (float32x4_t *)&v96[128 * v92];
                do
                {
                  v105 = v83[-8];
                  v106 = v83[-7];
                  v107 = v83[-5];
                  v104[-6] = v83[-6];
                  v104[-5] = v107;
                  v104[-8] = v105;
                  v104[-7] = v106;
                  v108 = v83[-4];
                  v109 = v83[-3];
                  v110 = v83[-1];
                  v111 = (char *)&v104[-8];
                  v104[-2] = v83[-2];
                  v104[-1] = v110;
                  v104[-4] = v108;
                  v104[-3] = v109;
                  v83 -= 8;
                  v104 -= 8;
                }
                while (v83 != v91);
              }
              v90 = v97 + 8;
              v213 = v111;
              v214 = v97 + 8;
              v215 = &v96[128 * v95];
              if (v91)
                operator delete(v91);
            }
            else
            {
              v84 = v216;
              v85 = v217;
              v86 = v219;
              v214[2] = v218;
              v83[3] = v86;
              *v83 = v84;
              v83[1] = v85;
              v87 = v220;
              v88 = v221;
              v89 = v223;
              v83[6] = v222;
              v83[7] = v89;
              v83[4] = v87;
              v83[5] = v88;
              v90 = v83 + 8;
            }
            v214 = v90;
          }
        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v200, v224, 16);
    }
    while (v25);
  }

  v112 = (char *)v208 - (_BYTE *)v207;
  if ((unint64_t)((char *)v208 - (_BYTE *)v207) > 0x17F)
  {
    v115 = rotationZMatrix(v23);
    v199.columns[0].i32[2] = v116;
    v199.columns[1].i32[2] = v117;
    v118 = v112 >> 7;
    *(double *)v199.columns[0].i64 = v115;
    v199.columns[1].i64[0] = v119;
    v199.columns[2].i32[2] = v120;
    v199.columns[2].i64[0] = v121;
    std::vector<box3d>::vector(&v197, v112 >> 7);
    v122 = 0;
    if (v118 <= 1)
      v123 = 1;
    else
      v123 = v118;
    v124 = v123;
    do
    {
      rotateBoxCorners((float32x4_t *)&v199, (const box3d *)((char *)v207 + v122), (uint64_t)&v216);
      v125 = (float32x4_t *)((char *)v197 + v122);
      v126 = v216;
      v127 = v217;
      v128 = v219;
      v125[2] = v218;
      v125[3] = v128;
      v125[1] = v127;
      v129 = v223;
      v131 = v220;
      v130 = v221;
      v125[6] = v222;
      v125[7] = v129;
      v125[4] = v131;
      v125[5] = v130;
      *v125 = v126;
      v122 += 128;
      --v124;
    }
    while (v124);
    -[OU3DObject refined_box_history](v4, "refined_box_history");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "lastObject");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "preRefinedBox");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    if (v134)
    {
      v222 = 0u;
      v223 = 0u;
      v220 = 0u;
      v221 = 0u;
      v218 = 0u;
      v219 = 0u;
      v216 = 0u;
      v217 = 0u;
      box3dFromNSArray(v134, (uint64_t)__p);
      rotateBoxCorners((float32x4_t *)&v199, (const box3d *)__p, (uint64_t)&v216);
      v135 = operator new(0x30uLL);
      *v135 = xmmword_229562AD0;
      v135[1] = xmmword_229562AE0;
      v135[2] = xmmword_229562AF0;
      std::vector<float>::vector(v188, 6uLL);
      for (j = 0; j != 6; ++j)
      {
        v137 = (int *)v135 + 2 * j;
        v138 = v137[1];
        v139 = *v137;
        std::vector<float>::vector(__p, v118);
        std::vector<float>::vector(v180, v118);
        v140 = (char *)v197 + 16 * v139;
        v141 = (float *)__p[0];
        v142 = (float *)v180[0];
        v143 = v123;
        do
        {
          v144 = *(float *)&v140[4 * (v138 & 3)];
          *v141 = v144;
          v145 = vabds_f32(v144, *(float *)((unint64_t)(&v216 + v139) & 0xFFFFFFFFFFFFFFF3 | (4 * (v138 & 3))));
          v146 = 3.0;
          if (v145 >= 0.1)
          {
            v146 = 2.0;
            if (v145 >= 0.2)
            {
              if (v145 >= 0.3)
                v146 = 0.0;
              else
                v146 = 1.0;
            }
          }
          *v142++ = v146;
          ++v141;
          v140 += 128;
          --v143;
        }
        while (v143);
        v147 = HistogramMaxBin((float **)__p, (uint64_t)v180, 0.05);
        *((_DWORD *)v188[0] + j) = HIDWORD(v147);
        if (v180[0])
        {
          v180[1] = v180[0];
          operator delete(v180[0]);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      v149.n128_u32[0] = *(_DWORD *)v188[0];
      v150 = *((float *)v188[0] + 4);
      v151 = *((float *)v188[0] + 5);
      v152 = *(float32x2_t *)((char *)v188[0] + 4);
      v153 = v149;
      v153.n128_u32[1] = *((_DWORD *)v188[0] + 3);
      v153.n128_u64[0] = (unint64_t)vmul_f32(vadd_f32(v152, (float32x2_t)v153.n128_u64[0]), (float32x2_t)0x3F0000003F000000);
      v153.n128_f32[2] = (float)(v150 + v151) * 0.5;
      v175 = *(float *)v188[0];
      v176 = v152.f32[0];
      *(float *)v148.i32 = v152.f32[0] - *(float *)v188[0];
      v154 = v152.f32[1];
      v177 = *((float *)v188[0] + 3);
      *(float *)&v148.i32[1] = v177 - v152.f32[1];
      *(float *)&v148.i32[2] = v151 - v150;
      v195 = 0u;
      v196 = 0u;
      v193 = 0u;
      v194 = 0u;
      v191 = 0u;
      v192 = 0u;
      *(_OWORD *)__p = 0u;
      v190 = 0u;
      v155 = vzip1q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]);
      v178.columns[0] = (simd_float3)vzip1q_s32(v155, (int32x4_t)v199.columns[1]);
      v178.columns[1] = (simd_float3)vzip2q_s32(v155, vdupq_lane_s32(*(int32x2_t *)v199.columns[1].f32, 1));
      v178.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]), vdupq_laneq_s32((int32x4_t)v199.columns[1], 2));
      centroidSizeAngleToBox3d(v180, v153, v148, 0.0);
      rotateBoxCorners((float32x4_t *)&v178, (const box3d *)v180, (uint64_t)__p);
      v156 = 0;
      while (1)
      {
        v157 = vsubq_f32(*(float32x4_t *)&__p[v156 / 8], v208[v156 / 0x10 - 8]);
        v158 = vmulq_f32(v157, v157);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v158, 2), vaddq_f32(v158, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v158.f32, 1))).f32[0]) > 0.15)break;
        v156 += 16;
        if (v156 == 128)
          goto LABEL_122;
      }
      -[OU3DObject refined_box_history](v4, "refined_box_history", 0.15);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "lastObject");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setIsOutlier:", 1);

LABEL_122:
      v162 = v198[-8];
      v163 = (int8x16_t)v198[-7];
      v164 = v198[-6].n128_f32[0];
      if (vabds_f32(v164, v175) >= 0.1)
        v164 = v175;
      if (vabds_f32(*(float *)v163.i32, v176) >= 0.1)
        v165 = v176;
      else
        LODWORD(v165) = v198[-7];
      if (vabds_f32(*(float *)&v163.i32[1], v154) >= 0.1)
        v166 = v154;
      else
        LODWORD(v166) = HIDWORD(v198[-7].n128_u64[0]);
      if (vabds_f32(v162.n128_f32[1], v177) >= 0.1)
        v167 = v177;
      else
        LODWORD(v167) = HIDWORD(v198[-8].n128_u64[0]);
      if (vabds_f32(v162.n128_f32[2], v150) >= 0.1)
        v168 = v150;
      else
        LODWORD(v168) = v198[-8].n128_u64[1];
      if (vabds_f32(v198[-4].n128_f32[2], v151) >= 0.1)
        v169 = v151;
      else
        v169 = v198[-4].n128_f32[2];
      v162.n128_f32[0] = (float)(v165 + v164) * 0.5;
      v162.n128_f32[1] = (float)(v167 + v166) * 0.5;
      v162.n128_f32[2] = (float)(v168 + v169) * 0.5;
      *(float *)v163.i32 = v165 - v164;
      *(float *)&v163.i32[1] = v167 - v166;
      *(float *)&v163.i32[2] = v169 - v168;
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v182 = 0u;
      v183 = 0u;
      *(_OWORD *)v180 = 0u;
      v181 = 0u;
      v170 = vzip1q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]);
      v179.columns[0] = (simd_float3)vzip1q_s32(v170, (int32x4_t)v199.columns[1]);
      v179.columns[1] = (simd_float3)vzip2q_s32(v170, vdupq_lane_s32(*(int32x2_t *)v199.columns[1].f32, 1));
      v179.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32((int32x4_t)v199.columns[0], (int32x4_t)v199.columns[2]), vdupq_laneq_s32((int32x4_t)v199.columns[1], 2));
      centroidSizeAngleToBox3d(&v178, v162, v163, 0.0);
      rotateBoxCorners((float32x4_t *)&v179, (const box3d *)&v178, (uint64_t)v180);
      v171 = v185;
      *(_OWORD *)(a2 + 64) = v184;
      *(_OWORD *)(a2 + 80) = v171;
      v172 = v187;
      *(_OWORD *)(a2 + 96) = v186;
      *(_OWORD *)(a2 + 112) = v172;
      v173 = v181;
      *(_OWORD *)a2 = *(_OWORD *)v180;
      *(_OWORD *)(a2 + 16) = v173;
      v174 = v183;
      *(_OWORD *)(a2 + 32) = v182;
      *(_OWORD *)(a2 + 48) = v174;
      *(_BYTE *)(a2 + 128) = 1;
      if (v188[0])
      {
        v188[1] = v188[0];
        operator delete(v188[0]);
      }
      operator delete(v135);
    }
    else
    {
      _OULoggingGetOSLogForCategoryObjectUnderstanding();
      v159 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
        SmoothObjectUponHistory(v159);

      *(_BYTE *)a2 = 0;
      *(_BYTE *)(a2 + 128) = 0;
    }

    if (v197)
    {
      v198 = (__n128 *)v197;
      operator delete(v197);
    }
  }
  else
  {
    -[OU3DObject refined_box_history](v4, "refined_box_history");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "lastObject");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setIsOutlier:", 0);

    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 128) = 0;
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v207)
  {
    v208 = (float32x4_t *)v207;
    operator delete(v207);
  }
  if (v210)
  {
    v211 = (char *)v210;
    operator delete(v210);
  }
  if (v213)
  {
    v214 = (float32x4_t *)v213;
    operator delete(v213);
  }
LABEL_94:

}

void sub_22955BA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p)
{
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  if (__p)
    operator delete(__p);
  operator delete(v58);

  v62 = (void *)STACK[0x218];
  if (STACK[0x218])
  {
    STACK[0x220] = (unint64_t)v62;
    operator delete(v62);
  }
  v63 = (void *)STACK[0x2A0];
  if (STACK[0x2A0])
  {
    STACK[0x2A8] = (unint64_t)v63;
    operator delete(v63);
  }
  v64 = (void *)STACK[0x2B8];
  if (STACK[0x2B8])
  {
    STACK[0x2C0] = (unint64_t)v64;
    operator delete(v64);
  }
  v65 = (void *)STACK[0x2D0];
  if (STACK[0x2D0])
  {
    STACK[0x2D8] = (unint64_t)v65;
    operator delete(v65);
  }
  v66 = (void *)STACK[0x2E8];
  if (STACK[0x2E8])
  {
    STACK[0x2F0] = (unint64_t)v66;
    operator delete(v66);
  }

  _Unwind_Resume(a1);
}

float *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>,std::__identity,std::__less<void,void>>(float *result, float *a2)
{
  float *v2;
  float v4;
  float v5;
  float *v6;
  float *v7;
  float v8;
  float v9;

  v2 = result;
  if (result != a2 && result + 1 != a2)
  {
    v5 = *result;
    v4 = result[1];
    if (v4 < *result)
      ++result;
    v6 = v4 >= *v2 ? v2 + 1 : v2;
    v7 = v2 + 2;
    if (v7 != a2)
    {
      if (v4 >= v5)
        v4 = v5;
      while (v7 + 1 != a2)
      {
        v9 = *v7;
        v8 = v7[1];
        if (v8 >= *v7)
        {
          if (v9 < v4)
          {
            v4 = *v7;
            result = v7;
          }
          if (v8 >= *v6)
            v6 = v7 + 1;
        }
        else
        {
          v4 = *result;
          if (v8 < *result)
          {
            v4 = v7[1];
            result = v7 + 1;
          }
          if (v9 >= *v6)
            v6 = v7;
        }
        v7 += 2;
        if (v7 == a2)
          return result;
      }
      if (*v7 < *result)
        return v7;
    }
  }
  return result;
}

dispatch_queue_t CreateFixedPrioritySerialDispatchQueue(_anonymous_namespace_ *a1, const char *a2, uint64_t a3, uint64_t a4, os_workgroup_t *a5)
{
  dispatch_qos_class_t v6;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;

  v6 = a2;
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_workloop_set_qos_class_floor();
  if (*a5)
    dispatch_workloop_set_os_workgroup(v8, *a5);
  dispatch_activate(v8);
  dispatch_queue_attr_make_with_qos_class(0, v6, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create_with_target_V2((const char *)a1, v9, v8);

  return v10;
}

dispatch_queue_t CreateFixedPrioritySerialDispatchQueue(_anonymous_namespace_ *a1, const char *a2, uint64_t a3, os_workgroup_t *a4)
{
  NSObject *v6;
  dispatch_queue_t v7;

  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_workloop_set_scheduler_priority();
  if (*a4)
    dispatch_workloop_set_os_workgroup(v6, *a4);
  dispatch_activate(v6);
  v7 = dispatch_queue_create_with_target_V2((const char *)a1, 0, v6);

  return v7;
}

id CreateWorkGroup(const char *a1)
{
  int v1;
  int v2;
  NSObject *v3;

  v1 = os_workgroup_attr_set_flags();
  if (!v1)
    return (id)os_workgroup_create();
  v2 = v1;
  _OULoggingGetOSLogForCategoryObjectUnderstanding();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    CreateWorkGroup(v2, v3);

  return 0;
}

dispatch_workloop_t `anonymous namespace'::CreateWorkloop(_anonymous_namespace_ *this, const char *a2)
{
  std::string *v3;
  void *v4;
  char v5;
  const char *p_p;
  dispatch_workloop_t inactive;
  std::string v9;
  void *__p;
  _BYTE v11[15];
  char v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&__p, ".workloop");
  if (this)
  {
    std::string::basic_string[abi:ne180100]<0>(&v9, (char *)this);
    v3 = std::string::append(&v9, ".workloop", 9uLL);
    v4 = (void *)v3->__r_.__value_.__r.__words[0];
    v13[0] = v3->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v13 + 7) = *(std::string::size_type *)((char *)&v3->__r_.__value_.__r.__words[1] + 7);
    v5 = HIBYTE(v3->__r_.__value_.__r.__words[2]);
    v3->__r_.__value_.__l.__size_ = 0;
    v3->__r_.__value_.__r.__words[2] = 0;
    v3->__r_.__value_.__r.__words[0] = 0;
    if (v12 < 0)
      operator delete(__p);
    __p = v4;
    *(_QWORD *)v11 = v13[0];
    *(_QWORD *)&v11[7] = *(_QWORD *)((char *)v13 + 7);
    v12 = v5;
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (v12 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  inactive = dispatch_workloop_create_inactive(p_p);
  if (v12 < 0)
    operator delete(__p);
  return inactive;
}

void sub_22955C004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

void GetDeviceOrientation_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_2294C8000, v0, OS_LOG_TYPE_DEBUG, "cannot determine orientation.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void LoadImageToCVPixelBuffer()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "Untested pixel format type, only support 'BGRA' and 'L016'.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void LoadRGBToDictionary()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2294C8000, v0, v1, "Loaded scene_color cvpixelbuffer size: %d vs %d", v2, v3);
  OUTLINED_FUNCTION_3();
}

void LoadSemanticToDictionary()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2294C8000, v0, v1, "Loaded semantic_label cvpixelbuffer size: %d vs %d", v2, v3);
  OUTLINED_FUNCTION_3();
}

void LoadSemanticConfToDictionary()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2294C8000, v0, v1, "Loaded semantic_confidence cvpixelbuffer size: %d vs %d", v2, v3);
  OUTLINED_FUNCTION_3();
}

void LoadDepthToDictionary(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "Loaded scene_depth cvpixelbuffer size: %zu vs %zu", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

void FindImageFilePath(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_2294C8000, a2, OS_LOG_TYPE_DEBUG, "Loaded image file %s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void GenerateOUFramesFromCvplayer_cold_1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "The camera timestamps and poses have different numbers: %zu vs %zu", buf, 0x16u);
}

void GenerateOUFramesFromCvplayer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "camera timestamp and pose doesn't match.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void percentile(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a1, a3, "[3DOD] Invalid input argument for function percentile: empty input.", v3);
  OUTLINED_FUNCTION_4();
}

void OU3DKitchenObjectMerger::IsSimilarHeight(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a1, a3, "[3DOD] box height shouldn't be negative.", v3);
  OUTLINED_FUNCTION_4();
}

void OU3DKitchenObjectMerger::AlignInsideObject(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a1, a3, "[3DOD] Warning, we need to align the headings of two boxes before inside alignment.", v3);
  OUTLINED_FUNCTION_4();
}

void OU3DKitchenObjectMerger::AlignSinkWithDishwasher(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_2294C8000, a3, (uint64_t)a3, "[3DOD] Warning, sink and washer doesn't align, skip crop.", a1);
}

void std::construct_at[abi:ne180100]<OU3DKitchenObject,OU3DKitchenObject const&,OU3DKitchenObject*>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 160);
  if (v2)
  {
    *(_QWORD *)(a1 + 168) = v2;
    operator delete(v2);
  }
}

void ou3dor::OU3DLShapeSofaOfflineMerger::MergeLShape(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_2294C8000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] need_merge_list size %lu", (uint8_t *)&v3, 0xCu);
}

void percentile(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Invalid input argument for function percentile: empty input.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void ou3dod::J4InputSpecialHandling(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2294C8000, a2, a3, "[3DOD] input size is less than target_num_voxel %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void ou3dod::J4OutputSpecialHandling(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2294C8000, a2, a3, "[3DOD] input size is less than min_capacity %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void ou3dor::OU3DOROfflineEspressoV2::SetEmbedding<float>()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] offline network rgb feature input not allocated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] offline network embedding feature not matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dor::OU3DOROfflineEspressoV2::SetInputs()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] offline mdoel input bind is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dod::OU3DAnchorFreeDetector::Preprocess(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "OU3DAnchorFreeDetector";
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "[3DOD][%s] Invalid point cloud.", (uint8_t *)&v1, 0xCu);
}

void CameraPCFromARFrameSceneCamera(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD] WARNING: There is no valid point from ARFrame.", v1, 2u);
}

void OUEspressoV2Inference::LoadModel(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "OUEspressoV2Inference";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_2294C8000, a2, OS_LOG_TYPE_ERROR, "[%s] Unexpected num_functions=%lu", (uint8_t *)&v2, 0x16u);
}

double ou3dod::PrintBoxCorner(_OWORD *a1, NSObject *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  double result;
  int v9;
  double v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = COERCE_FLOAT(*a1);
  v3 = COERCE_FLOAT(HIDWORD(*(_QWORD *)a1));
  v4 = COERCE_FLOAT(a1[1]);
  v5 = COERCE_FLOAT(HIDWORD(*((_QWORD *)a1 + 2)));
  v6 = a1[2];
  v7 = a1[3];
  v9 = 134219776;
  v10 = v2;
  v11 = 2048;
  v12 = v3;
  v13 = 2048;
  v14 = v4;
  v15 = 2048;
  v16 = v5;
  v17 = 2048;
  v18 = *(float *)&v6;
  v19 = 2048;
  v20 = *((float *)&v6 + 1);
  v21 = 2048;
  v22 = *(float *)&v7;
  v23 = 2048;
  v24 = *((float *)&v7 + 1);
  _os_log_debug_impl(&dword_2294C8000, a2, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] corner: %f, %f, %f, %f, %f, %f, %f, %f", (uint8_t *)&v9, 0x52u);
  return result;
}

void ou3dod::AdjustBoxCornerOrder()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[3DOD Lshape merge] skip merging due to inability", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dod::AdjustBoxCornerOrder(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] nearest_box1_corner_idx: %d, nearest_box2_corner_idx: %d", (uint8_t *)v3, 0xEu);
}

void ou3dod::MaybeClipExtendLShapeObjects()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[3DOD Lshape merge] skip filling the corner box because less points", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[3DOD Lshape merge] force merge extend corner", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[3DOD Lshape merge] skip filling the corner box", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[3DOD Lshape merge] not l shape fill", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dod::MaybeClipExtendLShapeObjects(uint64_t a1, NSObject *a2, uint64_t a3, float a4)
{
  *(_DWORD *)a1 = 134217984;
  *(double *)(a1 + 4) = a4;
  OUTLINED_FUNCTION_3_0(&dword_2294C8000, a2, a3, "[3DOD Lshape merge] overlap ratio %f", (uint8_t *)a1);
}

void ou3dod::MaybeClipExtendLShapeObjects(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_3_0(&dword_2294C8000, a2, a3, "[3DOD Lshape merge] less point %lu", (uint8_t *)&v3);
}

void _GLOBAL__sub_I_OUCannyEdgeDetectorSemantic_mm_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;

  do
  {
    std::__tree<int>::destroy(a1 - 24, *(_QWORD **)(a1 - 16));
    v4 = *(void **)(a1 - 32);
    a1 -= 32;

  }
  while (a1 != a2);
}

void `anonymous namespace'::nonMaxSuppressBoxes(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD] Error: removeBoxFlags should be the same size of detected boxes. Skip cross-class nms.", v1, 2u);
}

void ou3dor::OU3DOREspressoV2Interface::OU3DOREspressoV2Interface(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2294C8000, a1, a3, "[3DOR] The espresso v2 model can't be loaded successfully. We will skip 3dor process.", a5, a6, a7, a8, 0);
}

void ou3dor::OU3DOREspressoV2Interface::LoadModel(char *a1, uint8_t *buf, os_log_t log)
{
  char *v4;

  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(char **)a1;
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = v4;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "Network path not found: %s", buf, 0xCu);
  if (a1[23] < 0)
    operator delete(*(void **)a1);
}

void ou3dor::OU3DOREspressoV2Interface::Inference(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2294C8000, a1, a3, "3DOR model input is invalid, please the error messages for input data feeding.", a5, a6, a7, a8, 0);
}

void ou3dor::CadModelRetriever::CadModelRetriever(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2294C8000, a1, a3, "[3DOR][%s] Mismatch size for asset tables.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void ou3dor::CadModelRetriever::CadModelRetriever(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "CadModelRetriever";
  v3 = 2048;
  v4 = 256;
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "[3DOR][%s] incorrect size of asset embeddings, must be multiple of %lu.", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void ou3dor::CadModelRetriever::RetrieveCadModel(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2294C8000, a1, a3, "[3DOR][%s] mismatching object embedding dimension.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void writeBox3ds(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, a1, a3, "The number of input boxes doesn't match the box types. ", a5, a6, a7, a8, 0);
}

void loadBoxes(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, a1, a3, "There is no valid corners.", a5, a6, a7, a8, 0);
}

void isBoxRectangle(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a1, a3, "object box is not rectangle for side 01 and 12: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a1, a3, "object box is not rectangle for side 23 and 12: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a1, a3, "object box is not rectangle for side 23 and 30: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void ou3dod::OU3DSparseSSDetector::Preprocess(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "SparseSSD";
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "[3DOD][%s] Invalid point cloud.", (uint8_t *)&v1, 0xCu);
}

void ou3dod::OU3DLShapeObjectMerger::MergeLShape(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a2, a3, "[3DOD Lshape merge] need_merge_list size %lu", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, a2, a3, "[3DOD Lshape merge] history_l_shape_uuids_paired_ %lu", a5, a6, a7, a8, 0);
}

void ou3dod::OU3DLShapeObjectMerger::MergeLShape(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD Lshape merge] merge previous pair", buf, 2u);
}

void ou3dor::OU3DObjectRepresentation::RotateImage()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "[OUFrame Error]: invalid device orientation. Skip data saving.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "Generating upright image starts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dor::OU3DObjectRepresentation::AddObjects2DFeatures()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_2294C8000, v0, v1, "If any of the camera, scene color or depth is not available, we then skip embedding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void ou3dor::OU3DObjectRepresentation::AddObjectRepresentation()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_2294C8000, v0, OS_LOG_TYPE_ERROR, "[OR] Offline prediction parser not initialized.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void ou3dor::OU3DObjectRepresentation::AddObjectRepresentation(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_1_0(&dword_2294C8000, "[OR] The %@ is not considered for 3dor", a2, a4);

}

{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_1_0(&dword_2294C8000, "[OR] The %@ has no raw box.", a2, a4);

}

void ou3dor::OU3DOROnlineEspressoV2::GetOutputInternal<half>()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, v0, v1, "[3DOR] output image number of elements %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, v0, v1, "[3DOR] output image tensor shape h %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_2294C8000, v0, v1, "[3DOR] output image shape w %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ou3dor::OU3DOROnlineEspressoV2::SetInputInternal<half>()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] online mdoel input bind is invalid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] online mdoel image crop size not matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] online mdoel number of pixel not matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "[3DOR] online mdoel pixel format not matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void OU3DObjectRGBSizeRefiner::ShouldRefineObject()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_2(&dword_2294C8000, v6, v4, "[3DOD RGB Refine] Object uuid: %@ box type: %s is not supported. ", v5);

  OUTLINED_FUNCTION_2_1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_2(&dword_2294C8000, v6, v4, "[3DOD RGB Refine] Object uuid: %@ box type: %s fov length is not reached", v5);

  OUTLINED_FUNCTION_2_1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_2(&dword_2294C8000, v6, v4, "[3DOD RGB Refine] Object uuid: %@ box type: %s does not need refine. ", v5);

  OUTLINED_FUNCTION_2_1();
}

void OU3DObjectRGBSizeRefiner::ShouldRefineObject(void *a1, uint64_t a2, NSObject *a3, float a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4;
  OUTLINED_FUNCTION_1_2(&dword_2294C8000, a3, (uint64_t)a3, "[3DOD RGB Refine] Object uuid: %@ Distance: %f is out of maximum range", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_1();
}

void OU3DObjectRGBSizeRefiner::IsBoxInFOVCorner(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = 5;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD RGB Refine] Object uuid: %s number of visible corners: %d is less than required: %d.", buf, 0x18u);
}

void OU3DObjectRGBSizeRefiner::RefineObjects(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD RGB Refine] Skip the frame due to no object should be refined", v1, 2u);
}

void utils::OUImageUtils::ResizeImageRGBA()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "ImageResize only supports RGBA or BGRA", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "Image crop failed when create cropped cvpixelbuffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "ImageResize scale vImage_buffer failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "ImageResize init vImage_buffer failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void utils::OUImageUtils::CropAndResizeImage()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "ImageCrop only supports RGBA or RGB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2294C8000, v0, v1, "image crop failed when create cropped cvpixelbuffer.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void utils::OUImageUtils::CropAndResizeImage(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2294C8000, a2, OS_LOG_TYPE_ERROR, "image crop error %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void utils::`anonymous namespace'::CheckCVPixelBuffers()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_2294C8000, v0, v1, "[%s] out_buffer's pixel format must be %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_2294C8000, v0, v1, "[%s] in_buffer's pixel format must be %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void utils::OUFrameWriter::OUFrameWriter(uint64_t a1, _QWORD *a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 63) < 0)
    a2 = (_QWORD *)*a2;
  v3 = 136315394;
  v4 = "OUFrameWriter";
  v5 = 2080;
  v6 = a2;
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "[%s] failed to create output directory %s.", (uint8_t *)&v3, 0x16u);
}

void CreateCVPixelBuffer(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2294C8000, log, OS_LOG_TYPE_ERROR, "Failed to create CV pixel buffer.", v1, 2u);
}

void SmoothObjectUponHistory(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2294C8000, log, OS_LOG_TYPE_DEBUG, "[3DOD Error: the pre-refined box in object history shouldn't be null.", v1, 2u);
}

void CreateWorkGroup(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2294C8000, a2, OS_LOG_TYPE_ERROR, "ERROR [createWorkGroup]: Failed to set workgroup flags with error (%d)\n", (uint8_t *)v2, 8u);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52F8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x24BED84A0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x24BDF90E0]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x24BDF90E8]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x24BDF9100]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x24BEDA9F0](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA00](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x24BEDAA18](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB38](this, a2);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
  MEMORY[0x24BEDAB88](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE88]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A8](this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x24BEDB2B0](a1, a2);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x24BEDB3C0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x24BEDB600](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F2426B8(__p);
}

uint64_t operator delete()
{
  return off_24F2426C0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F2426C8(__sz);
}

uint64_t operator new()
{
  return off_24F2426D0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_round_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACE28]((__n128)x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
  MEMORY[0x24BDAE038](workloop, workgroup);
}

uint64_t dispatch_workloop_set_qos_class_floor()
{
  return MEMORY[0x24BDAE040]();
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x24BDAE048]();
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x24BE2F6F8]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x24BE2F720]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x24BE2F738]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x24BE2F758]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x24BE2F770]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x24BE2F778]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x24BE2F790]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x24BE2F7A0]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x24BE2F7B0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x24BE2F7C0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x24BE2F7D0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x24BE2F7E0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x24BE2F7F0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x24BE2F800]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x24BE2F808]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x24BE2F820]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x24BE2F830]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x24BE2F840]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x24BE2F850]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x24BE2F870]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x24BE2F8A0]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x24BE2F910]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x24BE2F918]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x24BE2F948]();
}

uint64_t e5rt_program_library_get_function_names()
{
  return MEMORY[0x24BE2F978]();
}

uint64_t e5rt_program_library_get_num_functions()
{
  return MEMORY[0x24BE2F980]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x24BE2F998]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x24BE2F9A0]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x24BE2FA40]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_pack()
{
  return MEMORY[0x24BE2FA48]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x24BE2FA50]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x24BE2FA58]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x24BE2FA60]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x24BE2FA68]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x24BE2FA78]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x24BE2FA88]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x24BE2FA98]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x24BE2FAB8]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x24BE2FC08]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x24BE2FC40]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x24BE2FC88]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x24BE2FCB8]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x24BDAEA30](*(_QWORD *)&__e, __x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x24BDAF500]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x24BDAF520]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32F0](__A, __IA, __C, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x24BDB3620](dest, color, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x24BDB3630](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x24BDB3678](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB3698](src, destYp, destCbCr, info, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x24BDB36E8](matrix, pixelRange, outInfo, *(_QWORD *)&inARGBType, *(_QWORD *)&outYpCbCrType, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x24BDB3720](src, dest, *(_QWORD *)&flags, offset, scale);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x24BDB3848](matrix, pixelRange, outInfo, *(_QWORD *)&inYpCbCrType, *(_QWORD *)&outARGBType, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

