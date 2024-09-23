@implementation ZL20PVPixelFormatIsYCbCrj

id **___ZL20PVPixelFormatIsYCbCrj_block_invoke()
{
  id *v0;
  id *v2;

  v0 = (id *)operator new();
  *v0 = dispatch_queue_create("com.apple.PVPixelFormatIsYCbCr.mapLock", 0);
  v2 = 0;
  std::unique_ptr<PVGCDLock>::reset[abi:ne180100]((id **)&PVPixelFormatIsYCbCr::s_mapLock, v0);
  return std::unique_ptr<PVGCDLock>::reset[abi:ne180100](&v2, 0);
}

uint64_t **___ZL20PVPixelFormatIsYCbCrj_block_invoke_2(uint64_t a1)
{
  OSType *v2;
  uint64_t v3;
  OSType v4;
  uint64_t *v5;
  OSType v6;
  BOOL v7;
  uint64_t *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const void *Value;
  BOOL v12;
  uint64_t **result;
  OSType *v14;

  v2 = (OSType *)(a1 + 40);
  v3 = qword_1ED4D9278;
  if (!qword_1ED4D9278)
  {
    v4 = *v2;
LABEL_14:
    v9 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, v4);
    if (v9)
    {
      v10 = v9;
      Value = CFDictionaryGetValue(v9, (const void *)*MEMORY[0x1E0CA9188]);
      if (Value)
      {
        v12 = CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
        v14 = v2;
        *((_BYTE *)std::__tree<std::__value_type<unsigned int,BOOL>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,BOOL>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&PVPixelFormatIsYCbCr::s_formatIsYCbCr, v2, (uint64_t)&std::piecewise_construct, &v14)+ 32) = v12;
      }
      else
      {
        v14 = v2;
        *((_BYTE *)std::__tree<std::__value_type<unsigned int,BOOL>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,BOOL>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&PVPixelFormatIsYCbCr::s_formatIsYCbCr, v2, (uint64_t)&std::piecewise_construct, &v14)+ 32) = 0;
      }
      CFRelease(v10);
    }
    else
    {
      v14 = v2;
      *((_BYTE *)std::__tree<std::__value_type<unsigned int,BOOL>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,BOOL>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&PVPixelFormatIsYCbCr::s_formatIsYCbCr, v2, (uint64_t)&std::piecewise_construct, &v14)+ 32) = 0;
    }
    goto LABEL_20;
  }
  v4 = *v2;
  v5 = &qword_1ED4D9278;
  do
  {
    v6 = *(_DWORD *)(v3 + 28);
    v7 = v6 >= v4;
    if (v6 >= v4)
      v8 = (uint64_t *)v3;
    else
      v8 = (uint64_t *)(v3 + 8);
    if (v7)
      v5 = (uint64_t *)v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 == &qword_1ED4D9278 || v4 < *((_DWORD *)v5 + 7))
    goto LABEL_14;
LABEL_20:
  v14 = v2;
  result = std::__tree<std::__value_type<unsigned int,BOOL>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,BOOL>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&PVPixelFormatIsYCbCr::s_formatIsYCbCr, v2, (uint64_t)&std::piecewise_construct, &v14);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *((_BYTE *)result + 32);
  return result;
}

@end
