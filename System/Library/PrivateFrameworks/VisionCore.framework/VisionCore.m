BOOL _classImplementsSelector(objc_class *a1, const char *a2)
{
  Method *v3;
  Method *v4;
  uint64_t v5;
  SEL Name;
  _BOOL8 v7;
  unsigned int outCount;

  outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (!v3)
    return 0;
  v4 = v3;
  if (outCount)
  {
    v5 = 0;
    while (1)
    {
      Name = method_getName(v4[v5]);
      v7 = Name == a2;
      if (Name == a2)
        break;
      if (++v5 >= (unint64_t)outCount)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }
  free(v4);
  return v7;
}

void sub_21DED51C8(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_21DED51DC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DED5628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37)
{
  void *v37;
  void *v38;

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(char *a1)
{
  void *v2;

  if (a1)
  {
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy(*((_QWORD *)a1 + 1));
    v2 = (void *)*((_QWORD *)a1 + 12);
    if (v2)
    {
      *((_QWORD *)a1 + 13) = v2;
      operator delete(v2);
    }
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

_QWORD *std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;
  char v6;
  _QWORD *v7;

  v2 = (_QWORD *)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (_QWORD *)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

void sub_21DED5C48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED5F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 64;
  a1[53] = MEMORY[0x24BEDB838] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x2207A5F60](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_21DED6040(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x2207A5FB4](v1 + 424);
  _Unwind_Resume(a1);
}

void sub_21DED65F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_21DED6BE4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_21DED6BFC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DED7784(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DED7948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED7B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id _dictionaryOfTensorDescriptors(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v2);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "name", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v8, v9);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v3;
}

void sub_21DED7CE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DED7EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DED822C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void std::vector<long>::reserve(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    v7 = &v4[8 * v6];
    v8 = (char *)*a1;
    v9 = (char *)a1[1];
    v10 = v5;
    if (v9 != *a1)
    {
      v10 = v5;
      do
      {
        v11 = *((_QWORD *)v9 - 1);
        v9 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void sub_21DED87B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

double VisionCoreBoundingBoxForQuadrilateralPoints(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7;
  double v8;

  if (a7 >= a5)
    v7 = a5;
  else
    v7 = a7;
  if (a1 >= a3)
    v8 = a3;
  else
    v8 = a1;
  if (v8 >= v7)
    return v7;
  else
    return v8;
}

double VisionCoreQuadrilateralGetBoundingBox(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v1 = a1;
  objc_msgSend(v1, "topLeft");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "topRight");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v1, "bottomRight");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v1, "bottomLeft");
  v15 = v14;

  return VisionCoreBoundingBoxForQuadrilateralPoints(v3, v5, v7, v9, v11, v13, v15);
}

void sub_21DED8ED4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED8F7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED9098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED9158(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED9208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DED92D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DED952C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E1DB028, MEMORY[0x24BEDAAF0]);
}

void sub_21DED9650(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

__CFString *NSStringFromVisionCoreTensorDataType(uint64_t a1)
{
  __CFString *v1;

  if (a1 <= 131103)
  {
    if (a1 <= 65567)
    {
      if (!a1)
      {
        v1 = CFSTR("VisionCoreTensorDataTypeUnknown");
        return v1;
      }
      if (a1 == 65552)
      {
        v1 = CFSTR("VisionCoreTensorDataTypeFloat16");
        return v1;
      }
    }
    else
    {
      switch(a1)
      {
        case 65568:
          v1 = CFSTR("VisionCoreTensorDataTypeFloat32");
          return v1;
        case 65600:
          v1 = CFSTR("VisionCoreTensorDataTypeFloat64");
          return v1;
        case 131080:
          v1 = CFSTR("VisionCoreTensorDataTypeInt8");
          return v1;
      }
    }
LABEL_26:
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("VisionCoreTensorDataType_(%lX)"), a1);
    return v1;
  }
  if (a1 > 983047)
  {
    switch(a1)
    {
      case 983048:
        v1 = CFSTR("VisionCoreTensorDataTypePlanar8Image");
        return v1;
      case 983056:
        v1 = CFSTR("VisionCoreTensorDataTypePlanar16HalfImage");
        return v1;
      case 983072:
        v1 = CFSTR("VisionCoreTensorDataTypePlanarFloat32Image");
        return v1;
    }
    goto LABEL_26;
  }
  if (a1 == 131104)
  {
    v1 = CFSTR("VisionCoreTensorDataTypeInt32");
    return v1;
  }
  if (a1 == 196616)
  {
    v1 = CFSTR("VisionCoreTensorDataTypeUInt8");
    return v1;
  }
  if (a1 != 196640)
    goto LABEL_26;
  v1 = CFSTR("VisionCoreTensorDataTypeUInt32");
  return v1;
}

uint64_t VisionCoreTensorDataTypeGetElementSize(unsigned __int16 a1)
{
  return a1 >> 3;
}

void sub_21DEDA09C(void *a1)
{
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_21DEDA0A8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void Geometry2D_mallocCart2D(_QWORD *a1, int a2)
{
  size_t v4;
  void *v5;
  void *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >= 1)
  {
    v4 = 4 * a2;
    v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
    *a1 = v5;
    if (v5 && (v6 = malloc_type_malloc(v4, 0x100004052888210uLL), (a1[1] = v6) != 0))
    {
      *((_DWORD *)a1 + 4) = a2;
    }
    else
    {
      free(v5);
      *a1 = 0;
      a1[1] = 0;
      *((_DWORD *)a1 + 4) = 0;
    }
  }
}

void Geometry2D_freeCart2D(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
    free(*(void **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 0;
  }
}

uint64_t Geometry2D_copyCart2D(uint64_t a1, uint64_t a2)
{
  const void *v4;
  uint64_t result;
  uint64_t v6;
  int v7;

  if (!a1)
    return 1917;
  v4 = *(const void **)a1;
  if (!*(_QWORD *)a1 || !*(_QWORD *)(a1 + 8))
    return 1917;
  result = 1917;
  if (a2)
  {
    v6 = *(unsigned int *)(a1 + 16);
    if ((int)v6 >= 1)
    {
      if (*(_QWORD *)a2)
      {
        if (*(_QWORD *)(a2 + 8))
        {
          v7 = *(_DWORD *)(a2 + 16);
          if (v7 >= 1)
          {
            if ((_DWORD)v6 != v7)
              return 1916;
            memcpy(*(void **)a2, v4, 4 * v6);
            memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), 4 * *(int *)(a2 + 16));
            return 1920;
          }
        }
      }
      return 1917;
    }
  }
  return result;
}

void Geometry2D_cloneUsingFlagCart2D(_QWORD *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v8 = a3;
    do
    {
      v9 = *v8++;
      v7 += v9;
      --v6;
    }
    while (v6);
  }
  Geometry2D_mallocCart2D(a1, v7);
  v10 = *a1;
  v11 = a1[1];
  if (*a1)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12 && *((_DWORD *)a1 + 4) >= 1)
  {
    v14 = *(unsigned int *)(a2 + 16);
    if ((int)v14 >= 1)
    {
      v15 = 0;
      v16 = 0;
      do
      {
        if (a3[v15])
        {
          v17 = *(_QWORD *)(a2 + 8);
          *(_DWORD *)(v10 + 4 * v16) = *(_DWORD *)(*(_QWORD *)a2 + 4 * v15);
          *(_DWORD *)(v11 + 4 * v16++) = *(_DWORD *)(v17 + 4 * v15);
        }
        ++v15;
      }
      while (v14 != v15);
    }
  }
}

void VisionCoreHomography::VisionCoreHomography(VisionCoreHomography *this)
{
  Geometry2D_cart2D *p_var1;
  char *v3;
  char *v4;

  this->var0.var0 = 0;
  this->var0.var1 = 0;
  this->var1.var0 = 0;
  p_var1 = &this->var1;
  this->var0.var2 = 0;
  this->var1.var1 = 0;
  this->var1.var2 = 0;
  this->var2.var1 = 0;
  this->var2.var2.var0 = 0;
  this->var2.var0 = 0;
  v3 = (char *)operator new(0x24uLL);
  this->var2.var1 = (float *)(v3 + 36);
  this->var2.var2.var0 = (float *)(v3 + 36);
  *((_DWORD *)v3 + 8) = 1065353216;
  *(_OWORD *)v3 = xmmword_21DF02FD0;
  *((_OWORD *)v3 + 1) = unk_21DF02FE0;
  this->var2.var0 = (float *)v3;
  *(_OWORD *)&this->var3.var0 = 0u;
  *(_OWORD *)&this->var3.var2.var0 = 0u;
  *(_OWORD *)&this->var4.var1 = 0u;
  v4 = (char *)operator new(0x24uLL);
  *((_DWORD *)v4 + 8) = 1065353216;
  *(_OWORD *)v4 = xmmword_21DF02FD0;
  *((_OWORD *)v4 + 1) = unk_21DF02FE0;
  this->var4.var0 = (float *)v4;
  this->var4.var1 = (float *)(v4 + 36);
  this->var0.var1 = 0;
  *(_QWORD *)&this->var0.var2 = 0;
  this->var0.var0 = 0;
  p_var1->var1 = 0;
  *(_QWORD *)&p_var1->var2 = 0;
  p_var1->var0 = 0;
  *(_QWORD *)&this->var5.var2 = 0x3F000000000003E8;
  this->var4.var2.var0 = (float *)(v4 + 36);
  *(_QWORD *)&this->var5.var0 = 0x3BA3D70A00000004;
}

void sub_21DEDB168(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 56) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

char *VisionCoreHomography::copyHomography(VisionCoreHomography *this, const VisionCoreHomography *a2, VisionCoreHomography *a3)
{
  char *result;
  unint64_t var1;
  vector<BOOL, std::allocator<BOOL>> *p_var3;
  unint64_t v8;
  Geometry2D_cart2D v9;

  Geometry2D_mallocCart2D(&v9, this->var0.var2);
  a2->var0 = v9;
  Geometry2D_mallocCart2D(&v9, this->var1.var2);
  a2->var1 = v9;
  Geometry2D_copyCart2D((uint64_t)this, (uint64_t)a2);
  result = (char *)Geometry2D_copyCart2D((uint64_t)&this->var1, (uint64_t)&a2->var1);
  if (a2 != this)
  {
    var1 = this->var3.var1;
    if (var1)
    {
      p_var3 = &a2->var3;
      if (var1 > a2->var3.var2.var0 << 6)
      {
        if (p_var3->var0)
        {
          operator delete(p_var3->var0);
          p_var3->var0 = 0;
          a2->var3.var1 = 0;
          a2->var3.var2.var0 = 0;
          var1 = this->var3.var1;
        }
        std::vector<BOOL>::__vallocate[abi:ne180100](&a2->var3.var0, var1);
        var1 = this->var3.var1;
      }
      memmove(p_var3->var0, this->var3.var0, (((var1 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8) + 8);
      v8 = this->var3.var1;
    }
    else
    {
      v8 = 0;
    }
    a2->var3.var1 = v8;
    return std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&a2->var2, (char *)this->var2.var0, (uint64_t)this->var2.var1, this->var2.var1 - this->var2.var0);
  }
  return result;
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 62)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void VisionCoreHomography::VisionCoreHomography(VisionCoreHomography *this, VisionCoreHomography *a2)
{
  vector<float, std::allocator<float>> *p_var2;
  float *v5;
  char *v6;
  VisionCoreHomography *v7;

  this->var0.var0 = 0;
  this->var0.var1 = 0;
  this->var0.var2 = 0;
  this->var1.var0 = 0;
  this->var1.var1 = 0;
  this->var1.var2 = 0;
  this->var2.var0 = 0;
  p_var2 = &this->var2;
  this->var2.var1 = 0;
  this->var2.var2.var0 = 0;
  v5 = (float *)operator new(0x24uLL);
  p_var2->var0 = v5;
  v5[8] = 1.0;
  *(_OWORD *)v5 = xmmword_21DF02FD0;
  *((_OWORD *)v5 + 1) = unk_21DF02FE0;
  this->var2.var1 = v5 + 9;
  this->var2.var2.var0 = v5 + 9;
  *(_OWORD *)&this->var3.var0 = 0u;
  *(_OWORD *)&this->var3.var2.var0 = 0u;
  *(_OWORD *)&this->var4.var1 = 0u;
  v6 = (char *)operator new(0x24uLL);
  *((_DWORD *)v6 + 8) = 1065353216;
  *(_OWORD *)v6 = xmmword_21DF02FD0;
  *((_OWORD *)v6 + 1) = unk_21DF02FE0;
  this->var4.var0 = (float *)v6;
  this->var4.var1 = (float *)(v6 + 36);
  *(_QWORD *)&this->var5.var0 = 0;
  *(_QWORD *)&this->var5.var2 = 0;
  this->var4.var2.var0 = (float *)(v6 + 36);
  VisionCoreHomography::copyHomography(a2, this, v7);
}

void sub_21DEDB4E8(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = (void *)v1[12];
  if (v5)
  {
    v1[13] = v5;
    operator delete(v5);
  }
  if (*v3)
    operator delete(*v3);
  v6 = *v2;
  if (*v2)
  {
    v1[7] = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

uint64_t VisionCoreHomography::operator=(uint64_t a1, __int128 *a2)
{
  void *v4;
  _QWORD *v5;
  __int128 v6;
  __int128 v7;

  v5 = (_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    *(_QWORD *)(a1 + 56) = v4;
    operator delete(v4);
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  *(_OWORD *)(a1 + 48) = a2[3];
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 6) = 0;
  *((_QWORD *)a2 + 7) = 0;
  *((_QWORD *)a2 + 8) = 0;
  v6 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v6;
  v7 = *(__int128 *)((char *)a2 + 24);
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_OWORD *)(a1 + 24) = v7;
  free(*(void **)a2);
  *(_QWORD *)a2 = 0;
  free(*((void **)a2 + 1));
  *((_QWORD *)a2 + 1) = 0;
  *((_DWORD *)a2 + 4) = 0;
  free(*((void **)a2 + 3));
  *((_QWORD *)a2 + 3) = 0;
  free(*((void **)a2 + 4));
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  *((_DWORD *)a2 + 4) = 0;
  *((_QWORD *)a2 + 3) = 0;
  *((_QWORD *)a2 + 4) = 0;
  *((_DWORD *)a2 + 10) = 0;
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void VisionCoreHomography::~VisionCoreHomography(VisionCoreHomography *this)
{
  float *var0;
  unint64_t *v3;
  float *v4;

  Geometry2D_freeCart2D((uint64_t)this);
  free(this->var1.var0);
  this->var1.var0 = 0;
  free(this->var1.var1);
  this->var1.var1 = 0;
  this->var1.var2 = 0;
  var0 = this->var4.var0;
  if (var0)
  {
    this->var4.var1 = var0;
    operator delete(var0);
  }
  v3 = this->var3.var0;
  if (v3)
    operator delete(v3);
  v4 = this->var2.var0;
  if (v4)
  {
    this->var2.var1 = v4;
    operator delete(v4);
  }
}

uint64_t VisionCoreHomography::CalculateReprojectionError(VisionCoreHomography *this, uint64_t a2)
{
  unint64_t v3;
  float *var1;
  float *var0;

  v3 = *(int *)(a2 + 16);
  this->var0.var1 = 0;
  *(_QWORD *)&this->var0.var2 = 0;
  this->var0.var0 = 0;
  if ((_DWORD)v3)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, v3);
    var1 = this->var0.var1;
    bzero(var1, 4 * v3);
    this->var0.var1 = &var1[v3];
    var0 = this->var0.var0;
  }
  else
  {
    var0 = 0;
  }
  return Geometry2D_symmetricReprojectionErrorHomography(a2, *(float **)(a2 + 48), (const float **)(a2 + 24), var0);
}

void sub_21DEDB6D4(_Unwind_Exception *exception_object)
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

void std::vector<BOOL>::reserve(uint64_t a1, unint64_t a2)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  _QWORD *v13;
  int v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  __int128 v20;

  if (a2 <= *(_QWORD *)(a1 + 16) << 6)
    return;
  if ((a2 & 0x8000000000000000) != 0)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  v19 = 0;
  v20 = 0uLL;
  std::vector<BOOL>::__vallocate[abi:ne180100](&v19, a2);
  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = v20;
  v6 = v20 + v4;
  *(_QWORD *)&v20 = v20 + v4;
  if (!v5)
  {
    v7 = v6 - 1;
    goto LABEL_7;
  }
  v7 = v6 - 1;
  if (((v6 - 1) ^ (v5 - 1)) > 0x3F)
  {
LABEL_7:
    v8 = v19;
    v9 = v7 >> 6;
    if (v6 >= 0x41)
      v10 = v9;
    else
      v10 = 0;
    *(_QWORD *)(v19 + 8 * v10) = 0;
    goto LABEL_11;
  }
  v8 = v19;
LABEL_11:
  v11 = v4 & 0x3F;
  if (v4 > 0x3F || (v4 & 0x3F) != 0)
  {
    v12 = 0;
    v13 = &v3[v4 >> 6];
    v14 = v5 & 0x3F;
    v15 = (uint64_t *)(v8 + 8 * (v5 >> 6));
    do
    {
      v16 = 1 << v14;
      if (((*v3 >> v12) & 1) != 0)
        v17 = *v15 | v16;
      else
        v17 = *v15 & ~v16;
      *v15 = v17;
      v3 += v12 == 63;
      if (v12 == 63)
        v12 = 0;
      else
        ++v12;
      v15 += v14 == 63;
      if (v14 == 63)
        v14 = 0;
      else
        ++v14;
    }
    while (v3 != v13 || v12 != v11);
  }
  v18 = *(_QWORD **)a1;
  *(_QWORD *)a1 = v8;
  *(_OWORD *)(a1 + 8) = v20;
  if (v18)
    operator delete(v18);
}

void sub_21DEDB81C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<BOOL>::push_back(uint64_t *a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1[1];
  v5 = a1[2];
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    std::vector<BOOL>::reserve((uint64_t)a1, v7);
    v4 = a1[1];
  }
  a1[1] = v4 + 1;
  v8 = *a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)(v8 + 8 * v9) | v10;
  else
    v11 = *(_QWORD *)(v8 + 8 * v9) & ~v10;
  *(_QWORD *)(v8 + 8 * v9) = v11;
}

void sub_21DEDB9D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDBD1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDC140(_Unwind_Exception *exception_object)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x2207A5F6C](a1 + 2);
  std::istream::~istream();
  MEMORY[0x2207A5FB4](a1 + 53);
  return a1;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (_QWORD *)*a1;
    v3 = v2;
  }
  v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (_QWORD *)*a2;
    v5 = v4;
  }
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (v3 == v5)
      return 0;
    if (v3 >= v5)
      return 1;
  }
  return 255;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E1DB030, MEMORY[0x24BEDAB00]);
}

void sub_21DEDC3B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void sub_21DEDC558(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDC620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDC6F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDC798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDC858(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDC900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDC974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDCB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21DEDCD2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21DEDCEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DEDD1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_21DEDD420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_21DEDD540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDD69C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDD8DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21DEDDB38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

id _obtainDescriptors(objc_class *a1, objc_selector *a2, ...)
{
  id v4;
  objc_method *ClassMethod;
  IMP Implementation;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_selector *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  va_list v40;
  id v41;
  _QWORD v42[2];
  va_list va;

  va_start(va, a2);
  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  va_copy(v40, va);
  if (a2)
  {
    while (1)
    {
      ClassMethod = class_getClassMethod(a1, (SEL)a2);
      if (!ClassMethod)
        break;
      Implementation = method_getImplementation(ClassMethod);
      if (!Implementation)
      {
        NSStringFromClass(a1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector((SEL)a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        VisionCoreValidatedLog((uint64_t)v11, (uint64_t)CFSTR("Could not resolve implementation for +[%@ %@]"), v18, v19, v20, v21, v22, v23, (uint64_t)v10);
        goto LABEL_8;
      }
      v41 = 0;
      ((void (*)(objc_class *, objc_selector *, id *))Implementation)(a1, a2, &v41);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v41;
      v9 = v8;
      if (!v7)
      {
        NSStringFromClass(a1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector((SEL)a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        VisionCoreValidatedLog((uint64_t)v39, (uint64_t)CFSTR("+[%@ %@] did not provide a descriptor: %@"), v27, v28, v29, v30, v31, v32, (uint64_t)v25);

        goto LABEL_9;
      }

      objc_msgSend(v4, "addObject:", v7);
LABEL_10:
      v24 = va_arg(v40, objc_selector *);
      a2 = v24;

      if (!v24)
        goto LABEL_13;
    }
    NSStringFromClass(a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    VisionCoreValidatedLog((uint64_t)v11, (uint64_t)CFSTR("+[%@ %@] does not exist"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
LABEL_8:

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
LABEL_13:
  v33 = objc_alloc(MEMORY[0x24BDD17C0]);
  +[VisionCoreResourceVersion newerFirstComparator](VisionCoreResourceVersion, "newerFirstComparator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v33, "initWithKey:ascending:comparator:", CFSTR("version"), 1, v34);

  v42[0] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingDescriptors:", v36);

  v37 = (void *)objc_msgSend(v4, "copy");
  return v37;
}

void sub_21DEDDDEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEDDF14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEDE050(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEDE0A8(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_21DEDE0BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEDE160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDE5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,std::locale a25,uint64_t a26)
{
  void *v26;

  __cxa_end_catch();
  std::ifstream::~ifstream(&a26);
  if (a24 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_21DEDF110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEDF268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id _noBlobInNetworkModelError(NSURL *a1, NSString *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  -[NSURL lastPathComponent](a1, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ does not contain the blob \"%@\""), v4, v3);
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_21DEDF31C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t VisionCoreEspressoStorageTypeForTensorDataType(uint64_t a1)
{
  uint64_t v1;

  if (a1 <= 131079)
  {
    v1 = 65552;
    if (a1 == 65552)
      return v1;
    if (a1 == 65568)
      return 65568;
    return 0;
  }
  if (a1 == 131080)
    return 131080;
  if (a1 == 131104)
    return 131104;
  if (a1 != 196616)
    return 0;
  return 262152;
}

void sub_21DEDF960(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x21DEDF86CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DEDFB70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEDFC88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEDFCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DEDFDD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id _repeatedCharacterString(unsigned int a1, unint64_t a2)
{
  void *v3;
  unint64_t v4;
  id v5;
  void *i;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int16x8_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = vdupq_n_s16(a1);
  LOWORD(v12) = a1;
  WORD1(v12) = a1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", &v11, 10, 0);
  v4 = objc_msgSend(v3, "length", *(_OWORD *)&v11, v12, v13);
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  for (i = v5; ; v5 = i)
  {
    v7 = objc_msgSend(v5, "length");
    if (v7 >= a2)
      break;
    if (a2 - v7 >= v4)
      v8 = v4;
    else
      v8 = a2 - v7;
    objc_msgSend(v3, "substringToIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "appendString:", v9);

  }
  return i;
}

void sub_21DEE0EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t ANSTKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (ANSTKitLibraryCore_frameworkLibrary)
    return ANSTKitLibraryCore_frameworkLibrary;
  ANSTKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ANSTKitLibraryCore_frameworkLibrary;
  if (!ANSTKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_21DEE10EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getANSTISPInferenceDescriptorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getANSTISPInferenceDescriptorClass_softClass;
  v7 = getANSTISPInferenceDescriptorClass_softClass;
  if (!getANSTISPInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getANSTISPInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_24E1DBC38;
    v3[4] = &v4;
    __getANSTISPInferenceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DEE1314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

VisionCoreE5RTModelSource *__getANSTISPInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  VisionCoreE5RTModelSource *result;
  uint64_t v3;

  ANSTKitLibrary();
  result = (VisionCoreE5RTModelSource *)objc_getClass("ANSTISPInferenceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTISPInferenceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return __getANSTISPInferenceConfigurationClass_block_invoke(v3);
  }
  return result;
}

VisionCoreE5RTModelSource *__getANSTISPInferenceConfigurationClass_block_invoke(uint64_t a1)
{
  VisionCoreE5RTModelSource *result;
  VisionCoreE5RTModelSource *v3;
  SEL v4;
  id v5;

  ANSTKitLibrary();
  result = (VisionCoreE5RTModelSource *)objc_getClass("ANSTISPInferenceConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTISPInferenceConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (VisionCoreE5RTModelSource *)abort_report_np();
    return -[VisionCoreE5RTModelSource initWithURL:](v3, v4, v5);
  }
  return result;
}

uint64_t Geometry2D_computeAdjointAndDeterminant(float *a1, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;

  if (!a3)
    return 1917;
  v3 = (float)(a1[4] * a1[8]) - (float)(a1[5] * a1[7]);
  *a2 = v3;
  a2[1] = (float)(a1[2] * a1[7]) - (float)(a1[1] * a1[8]);
  a2[2] = (float)(a1[1] * a1[5]) - (float)(a1[2] * a1[4]);
  v4 = (float)(a1[5] * a1[6]) - (float)(a1[3] * a1[8]);
  a2[3] = v4;
  a2[4] = (float)(*a1 * a1[8]) - (float)(a1[2] * a1[6]);
  a2[5] = (float)(a1[2] * a1[3]) - (float)(*a1 * a1[5]);
  v5 = (float)(a1[3] * a1[7]) - (float)(a1[6] * a1[4]);
  a2[6] = v5;
  a2[7] = (float)(a1[1] * a1[6]) - (float)(*a1 * a1[7]);
  a2[8] = (float)(*a1 * a1[4]) - (float)(a1[1] * a1[3]);
  *a3 = (float)((float)(*a1 * v3) - (float)(a1[1] * v4)) - (float)(a1[2] * v5);
  return 1920;
}

uint64_t Geometry2D_estimateWorkBufferSize(int a1)
{
  __CLPK_real __work;
  __CLPK_integer __info;
  __CLPK_integer __lwork;
  __CLPK_integer __n;
  __CLPK_integer __lda;

  __n = 9;
  __lda = 2 * a1;
  __lwork = -1;
  __work = 0.0;
  __info = 0;
  sgelqf_(&__lda, &__n, 0, &__lda, 0, &__work, &__lwork, &__info);
  if (__info)
    return 0xFFFFFFFFLL;
  else
    return (int)__work;
}

uint64_t Geometry2D_estimateHomographyMSS(uint64_t a1, uint64_t a2, __CLPK_real *a3, __CLPK_integer a4, uint64_t a5)
{
  int v6;
  int v8;
  uint64_t result;
  __CLPK_integer __k;
  char __trans;
  char __side;
  __CLPK_integer __lwork;
  __CLPK_integer __info;
  __CLPK_integer __n;
  __CLPK_integer __lda;
  __CLPK_real __tau[9];
  __CLPK_real __a[72];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  __n = 9;
  __lda = 8;
  __info = 0;
  if (!a1 || !*(_QWORD *)a1 || !*(_QWORD *)(a1 + 8))
    return 1917;
  v6 = *(_DWORD *)(a1 + 16);
  if (v6 < 1 || a2 == 0)
    return 1917;
  if (!*(_QWORD *)a2)
    return 1917;
  if (!*(_QWORD *)(a2 + 8))
    return 1917;
  v8 = *(_DWORD *)(a2 + 16);
  if (v8 < 1)
    return 1917;
  result = 1916;
  if (v6 == 4 && v8 == 4)
  {
    if (a5)
    {
      Geometry2D_assembleMeasurementMatrix(a1, (float **)a2, (uint64_t)__a);
      __lwork = a4;
      sgelqf_(&__lda, &__n, __a, &__lda, __tau, a3, &__lwork, &__info);
      if (__info)
        return 1903;
      __side = 76;
      __trans = 84;
      __n = 1;
      __lda = 9;
      __k = 8;
      *(_OWORD *)a5 = 0u;
      *(_OWORD *)(a5 + 16) = 0u;
      *(_DWORD *)(a5 + 32) = 1065353216;
      sormlq_(&__side, &__trans, &__lda, &__n, &__k, __a, &__k, __tau, (__CLPK_real *)a5, &__lda, a3, &__lwork, &__info);
      if (__info)
        return 1903;
      else
        return 1920;
    }
    return 1917;
  }
  return result;
}

uint64_t Geometry2D_assembleMeasurementMatrix(uint64_t result, float **a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float *v6;
  float *v7;
  float *v8;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  float *v20;
  float v21;
  _DWORD *v22;
  _DWORD *v23;
  float *v24;
  float v25;
  float v26;
  float *v27;
  float v28;

  v3 = *(int *)(result + 16);
  if ((int)v3 >= 1)
  {
    v4 = 0;
    v5 = *(unsigned int *)(result + 16);
    v6 = *a2;
    v7 = a2[1];
    v8 = *(float **)result;
    v9 = *(float **)(result + 8);
    v10 = 8 * v5;
    v11 = a3 + 64 * (_DWORD)v3 + 4;
    v12 = a3 + 56 * (_DWORD)v3;
    v13 = a3 + 48 * (_DWORD)v3;
    v14 = a3 + 40 * (_DWORD)v3;
    result = a3 + 32 * v3;
    v15 = a3 + 24 * (_DWORD)v3;
    v16 = a3 + 16 * v3;
    v17 = a3 + 8 * v5;
    do
    {
      v18 = (_DWORD *)(a3 + v4);
      *v18 = *(_DWORD *)v8;
      v18[1] = 0;
      v19 = (_DWORD *)(v17 + v4);
      *v19 = 0;
      v19[1] = *(_DWORD *)v8;
      v20 = (float *)(v16 + v4);
      *v20 = -(float)(*v8 * *v6);
      v21 = *v8++;
      v20[1] = -(float)(v21 * *v7);
      v22 = (_DWORD *)(v15 + v4);
      *v22 = *(_DWORD *)v9;
      v22[1] = 0;
      v23 = (_DWORD *)(result + v4);
      *v23 = 0;
      v23[1] = *(_DWORD *)v9;
      v24 = (float *)(v14 + v4);
      *v24 = -(float)(*v9 * *v6);
      v25 = *v9++;
      v24[1] = -(float)(v25 * *v7);
      *(_QWORD *)(v13 + v4) = 1065353216;
      *(_QWORD *)(v12 + v4) = 0x3F80000000000000;
      v26 = *v6++;
      v27 = (float *)(v11 + v4);
      *(v27 - 1) = -v26;
      v28 = *v7++;
      *v27 = -v28;
      v4 += 8;
    }
    while (v10 != v4);
  }
  return result;
}

uint64_t Geometry2D_symmetricReprojectionErrorHomography(uint64_t a1, float *a2, const float **a3, float *a4)
{
  float *v8;
  float *v9;
  uint64_t v10;
  float v11;
  uint64_t i;
  float __C;
  float v15;
  _OWORD v16[2];
  int v17;
  _OWORD v18[2];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (float *)malloc_type_malloc(4 * *(int *)(a1 + 16), 0x100004052888210uLL);
  if (!v8)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v9 = (float *)malloc_type_malloc(4 * *(int *)(a1 + 16), 0x100004052888210uLL);
  if (!v9)
  {
LABEL_11:
    v10 = 1915;
    goto LABEL_12;
  }
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v15 = 0.0;
  v10 = Geometry2D_computeAdjointAndDeterminant(a2, (float *)v18, &v15);
  if ((v10 & 0x80) != 0)
  {
    v11 = v15;
    if (fabsf(v15) <= 0.00000011921)
    {
      v10 = 1902;
    }
    else
    {
      for (i = 0; i != 36; i += 4)
        *(float *)((char *)v16 + i) = *(float *)((char *)v18 + i) / v11;
      v10 = Geometry2D_reprojectionErrorHomography(a1, (uint64_t)a2, a3, v8);
      if ((v10 & 0x80) != 0)
      {
        v10 = Geometry2D_reprojectionErrorHomography((uint64_t)a3, (uint64_t)v16, (const float **)a1, v9);
        if ((v10 & 0x80) != 0)
        {
          __C = 0.5;
          vDSP_vasm(v8, 1, v9, 1, &__C, a4, 1, *(int *)(a1 + 16));
        }
      }
    }
  }
LABEL_12:
  free(v8);
  free(v9);
  return v10;
}

uint64_t Geometry2D_reprojectionErrorHomography(uint64_t a1, uint64_t a2, const float **a3, float *a4)
{
  BOOL v8;
  uint64_t v10;
  int v11;
  float v12;
  float *v13;
  float *v14;
  vDSP_Length v15;
  float *v16;
  float *v17;
  float *v18;
  float *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float *__C;
  float *__D;
  uint64_t v27;

  __C = 0;
  __D = 0;
  v27 = 0;
  Geometry2D_mallocCart2D(&__C, *(_DWORD *)(a1 + 16));
  if (__C)
    v8 = __D == 0;
  else
    v8 = 1;
  if (v8 || (int)v27 < 1)
    goto LABEL_9;
  if (&__C == (float **)a1)
    goto LABEL_30;
  if (!*(_QWORD *)a1)
    goto LABEL_9;
  if (!*(_QWORD *)(a1 + 8))
    goto LABEL_9;
  v11 = *(_DWORD *)(a1 + 16);
  if (v11 < 1)
    goto LABEL_9;
  if (v11 != (_DWORD)v27)
  {
LABEL_30:
    v10 = 1916;
    goto LABEL_31;
  }
  if (!a2)
  {
LABEL_9:
    v10 = 1917;
    goto LABEL_31;
  }
  v12 = *(float *)(a2 + 32);
  if (fabsf((float)(*(float *)a2 / v12) + -1.0) <= 0.00000011921
    && fabsf(*(float *)(a2 + 4)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 8)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 12)) <= 0.00000011921
    && fabsf((float)(*(float *)(a2 + 16) / v12) + -1.0) <= 0.00000011921
    && fabsf(*(float *)(a2 + 20)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 24)) <= 0.00000011921
    && fabsf(*(float *)(a2 + 28)) <= 0.00000011921)
  {
    v10 = Geometry2D_copyCart2D(a1, (uint64_t)&__C);
    if ((v10 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_35;
  }
  v13 = (float *)malloc_type_malloc(4 * v27, 0x100004052888210uLL);
  if (v13)
  {
    v14 = v13;
    v15 = *(unsigned int *)(a1 + 16);
    if ((int)v15 > 8)
    {
      vDSP_vfill((const float *)(a2 + 32), v13, 1, v15);
      vDSP_vsma(*(const float **)a1, 1, (const float *)(a2 + 8), v14, 1, v14, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 20), v14, 1, v14, 1, *(int *)(a1 + 16));
      vDSP_vfill((const float *)(a2 + 24), __C, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)a1, 1, (const float *)a2, __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 12), __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vdiv(v14, 1, __C, 1, __C, 1, *(int *)(a1 + 16));
      vDSP_vfill((const float *)(a2 + 28), __D, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)a1, 1, (const float *)(a2 + 4), __D, 1, __D, 1, *(int *)(a1 + 16));
      vDSP_vsma(*(const float **)(a1 + 8), 1, (const float *)(a2 + 16), __D, 1, __D, 1, *(int *)(a1 + 16));
      vDSP_vdiv(v14, 1, __D, 1, __D, 1, *(int *)(a1 + 16));
    }
    else if ((int)v15 >= 1)
    {
      v16 = *(float **)a1;
      v17 = *(float **)(a1 + 8);
      v18 = __C;
      v19 = __D;
      do
      {
        v20 = *(float *)(a2 + 32) + (float)((float)(*(float *)(a2 + 20) * *v17) + (float)(*(float *)(a2 + 8) * *v16));
        *v18++ = (float)(*(float *)(a2 + 24)
                       + (float)((float)(*v17 * *(float *)(a2 + 12)) + (float)(*(float *)a2 * *v16)))
               / v20;
        v21 = *v16++;
        v22 = v21;
        v23 = *v17++;
        *v19++ = (float)(*(float *)(a2 + 28)
                       + (float)((float)(*(float *)(a2 + 16) * v23) + (float)(*(float *)(a2 + 4) * v22)))
               / v20;
        --v15;
      }
      while (v15);
    }
    free(v14);
    v10 = 1920;
LABEL_35:
    vDSP_vpythg(__C, 1, __D, 1, *a3, 1, a3[1], 1, a4, 1, *(int *)(a1 + 16));
    goto LABEL_31;
  }
  v10 = 1915;
LABEL_31:
  free(__C);
  __C = 0;
  free(__D);
  return v10;
}

void sub_21DEE2374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEE2444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEE2598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEE25F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VisionCoreSparseOpticalFlowSession;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21DEE2690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DEE27D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEE2A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DEE33E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p)
{
  void *v13;

  if (v13)
    operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<half>::__assign_with_size[abi:ne180100]<half *,half *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(_QWORD *)result) >> 1)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    if (v8 <= a4)
      v10 = a4;
    else
      v10 = v8;
    if (v8 >= 0x7FFFFFFFFFFFFFFELL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<half>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_17:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 1;
  if (v15 >= a4)
    goto LABEL_17;
  v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_19:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<half>::__vallocate[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 < 0)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

_QWORD *std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t v13;
  void **v14;
  _BYTE *v15;
  unint64_t v16;
  char *v17;
  void *v18;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 3)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      goto LABEL_23;
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 61)
LABEL_23:
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[v12];
    v13 = a3 - v6;
    if (v13)
      result = memmove(result, v6, v13);
    v14 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v14 = (void **)(result + 1);
  v15 = (_BYTE *)result[1];
  v16 = (v15 - v9) >> 3;
  if (v16 >= a4)
  {
    v13 = a3 - __src;
    if (a3 == __src)
      goto LABEL_22;
    v18 = (void *)*result;
LABEL_21:
    result = memmove(v18, __src, v13);
    goto LABEL_22;
  }
  v17 = &__src[8 * v16];
  if (v15 != v9)
  {
    result = memmove((void *)*result, __src, v15 - v9);
    v9 = (char *)*v14;
  }
  v13 = a3 - v17;
  if (v13)
  {
    v18 = v9;
    __src = v17;
    goto LABEL_21;
  }
LABEL_22:
  *v14 = &v9[v13];
  return result;
}

void std::vector<unsigned long>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("vector");
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<half *>,std::__wrap_iter<half *>,std::back_insert_iterator<std::vector<half>>,0>(_WORD *a1, _WORD *a2, uint64_t a3)
{
  _WORD *v5;
  _WORD *v6;
  unint64_t v7;
  _WORD *v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  __int16 v17;

  if (a1 != a2)
  {
    v5 = a1;
    v6 = *(_WORD **)(a3 + 8);
    do
    {
      v7 = *(_QWORD *)(a3 + 16);
      if ((unint64_t)v6 >= v7)
      {
        v9 = *(_WORD **)a3;
        v10 = (uint64_t)v6 - *(_QWORD *)a3;
        if (v10 <= -3)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v11 = v10 >> 1;
        v12 = v7 - (_QWORD)v9;
        if (v12 <= (v10 >> 1) + 1)
          v13 = v11 + 1;
        else
          v13 = v12;
        if (v12 >= 0x7FFFFFFFFFFFFFFELL)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
        {
          v14 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v14);
          v9 = *(_WORD **)a3;
          v6 = *(_WORD **)(a3 + 8);
        }
        else
        {
          v15 = 0;
        }
        v16 = (_WORD *)(v14 + 2 * v11);
        *v16 = *v5;
        v8 = v16 + 1;
        while (v6 != v9)
        {
          v17 = *--v6;
          *--v16 = v17;
        }
        *(_QWORD *)a3 = v16;
        *(_QWORD *)(a3 + 8) = v8;
        *(_QWORD *)(a3 + 16) = v14 + 2 * v15;
        if (v9)
          operator delete(v9);
      }
      else
      {
        *v6 = *v5;
        v8 = v6 + 1;
      }
      *(_QWORD *)(a3 + 8) = v8;
      ++v5;
      v6 = v8;
    }
    while (v5 != a2);
  }
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned long *>,std::__wrap_iter<unsigned long *>,std::back_insert_iterator<std::vector<unsigned long>>,0>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    v5 = a1;
    v6 = *(_QWORD **)(a3 + 8);
    do
    {
      v7 = *(_QWORD *)(a3 + 16);
      if ((unint64_t)v6 >= v7)
      {
        v9 = *(_QWORD **)a3;
        v10 = ((uint64_t)v6 - *(_QWORD *)a3) >> 3;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v12 = v7 - (_QWORD)v9;
        if (v12 >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
        {
          v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v13);
          v9 = *(_QWORD **)a3;
          v6 = *(_QWORD **)(a3 + 8);
        }
        else
        {
          v14 = 0;
        }
        v15 = (_QWORD *)(v13 + 8 * v10);
        *v15 = *v5;
        v8 = v15 + 1;
        while (v6 != v9)
        {
          v16 = *--v6;
          *--v15 = v16;
        }
        *(_QWORD *)a3 = v15;
        *(_QWORD *)(a3 + 8) = v8;
        *(_QWORD *)(a3 + 16) = v13 + 8 * v14;
        if (v9)
          operator delete(v9);
      }
      else
      {
        *v6 = *v5;
        v8 = v6 + 1;
      }
      *(_QWORD *)(a3 + 8) = v8;
      ++v5;
      v6 = v8;
    }
    while (v5 != a2);
  }
}

void std::vector<half>::__insert_with_size[abi:ne180100]<std::__wrap_iter<half *>,std::__wrap_iter<half *>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  char *v6;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int16 v25;
  _WORD *v26;
  char *v27;
  uint64_t v28;
  _WORD *v29;
  __int16 v30;
  char *v31;
  char *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  char *v37;

  if (a5 < 1)
    return;
  v6 = __src;
  v10 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (a5 > (uint64_t)(v9 - v10) >> 1)
  {
    v11 = *(char **)a1;
    if (a5 + ((uint64_t)(v10 - *(_QWORD *)a1) >> 1) < 0)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = (__dst - v11) >> 1;
    v13 = v9 - (_QWORD)v11;
    if (v13 <= a5 + ((uint64_t)(v10 - *(_QWORD *)a1) >> 1))
      v14 = a5 + ((uint64_t)(v10 - *(_QWORD *)a1) >> 1);
    else
      v14 = v13;
    if (v13 >= 0x7FFFFFFFFFFFFFFELL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    if (v15)
      v15 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<half>>(v15);
    else
      v16 = 0;
    v26 = (_WORD *)(v15 + 2 * v12);
    v27 = (char *)&v26[a5];
    v28 = 2 * a5;
    v29 = v26;
    do
    {
      v30 = *(_WORD *)v6;
      v6 += 2;
      *v29++ = v30;
      v28 -= 2;
    }
    while (v28);
    v31 = *(char **)a1;
    if (*(char **)a1 != __dst)
    {
      v32 = __dst;
      do
      {
        v33 = *((_WORD *)v32 - 1);
        v32 -= 2;
        *--v26 = v33;
      }
      while (v32 != v31);
    }
    v34 = v15 + 2 * v16;
    v35 = *(_BYTE **)(a1 + 8);
    v36 = v35 - __dst;
    if (v35 != __dst)
      memmove(v27, __dst, v35 - __dst);
    v37 = *(char **)a1;
    *(_QWORD *)a1 = v26;
    *(_QWORD *)(a1 + 8) = &v27[v36];
    *(_QWORD *)(a1 + 16) = v34;
    if (v37)
      operator delete(v37);
    return;
  }
  v17 = v10 - (_QWORD)__dst;
  v18 = (uint64_t)(v10 - (_QWORD)__dst) >> 1;
  if (v18 >= a5)
  {
    v19 = &__src[2 * a5];
    v21 = *(char **)(a1 + 8);
LABEL_18:
    v22 = &__dst[2 * a5];
    v23 = &v21[-2 * a5];
    v24 = v21;
    if ((unint64_t)v23 < v10)
    {
      v24 = v21;
      do
      {
        v25 = *(_WORD *)v23;
        v23 += 2;
        *(_WORD *)v24 = v25;
        v24 += 2;
      }
      while ((unint64_t)v23 < v10);
    }
    *(_QWORD *)(a1 + 8) = v24;
    if (v21 != v22)
      memmove(&v21[-2 * ((v21 - v22) >> 1)], __dst, v21 - v22);
    if (v19 != v6)
      memmove(__dst, v6, v19 - v6);
    return;
  }
  v19 = &__src[2 * v18];
  v20 = a4 - v19;
  if (a4 != v19)
    memmove(*(void **)(a1 + 8), &__src[2 * v18], a4 - v19);
  v21 = (char *)(v10 + v20);
  *(_QWORD *)(a1 + 8) = v10 + v20;
  if (v17 >= 1)
    goto LABEL_18;
}

void sub_21DEE4040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21DEE4D44(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 56) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_21DEE51D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  __p = &a28;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v32 = *(void **)v30;
  if (*(_QWORD *)v30)
  {
    *(_QWORD *)(v30 + 8) = v32;
    operator delete(v32);
  }
  v33 = *(void **)(v30 + 24);
  if (v33)
  {
    *(_QWORD *)(v30 + 32) = v33;
    operator delete(v33);
  }
  v34 = *(void **)(v30 + 48);
  if (v34)
  {
    *(_QWORD *)(v30 + 56) = v34;
    operator delete(v34);
  }
  v35 = *(void **)(v30 + 72);
  if (v35)
  {
    *(_QWORD *)(v30 + 80) = v35;
    operator delete(v35);
  }
  v36 = *(void **)(v30 + 96);
  if (v36)
  {
    *(_QWORD *)(v30 + 104) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void sub_21DEE5A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *__pa, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, char a19, uint64_t a20,void *a21,VisionCoreHomography *a22,void *a23,void *a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void **a30,void **a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,void *a50,void *a51)
{
  void *v51;
  uint64_t v52;

  if (__pa)
    operator delete(__pa);
  if (a15)
    operator delete(a15);
  if (a18)
    operator delete(a18);
  if (a21)
    operator delete(a21);
  if (a24)
    operator delete(a24);
  if (a30)
  {
    a31 = a30;
    operator delete(a30);
  }
  a30 = (void **)&a27;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100](&a30);
  if (v51)
    operator delete(v51);
  if (a47)
    operator delete(a47);
  if (a50)
  {
    a51 = a50;
    operator delete(a50);
  }
  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)(v52 - 240));
  _Unwind_Resume(a1);
}

void sub_21DEE5D7C(_Unwind_Exception *exception_object)
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

void sub_21DEE610C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  uint64_t v18;

  __p = (void *)(v18 - 112);
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void sub_21DEE6270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEE70A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,VisionCoreHomography *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,uint64_t a40,VisionCoreHomography *a41)
{
  void *v41;
  void *v42;

  if (v42)
    operator delete(v42);

  a41 = a21;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&a41);

  _Unwind_Resume(a1);
}

void sub_21DEE7E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,VisionCoreHomography *a21,VisionCoreHomography *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  void *__pa;
  void *a68;
  void *v68;
  void *v69;

  STACK[0x230] = (unint64_t)&a63;
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x230]);
  if (__pa)
  {
    a68 = __pa;
    operator delete(__pa);
  }

  _Unwind_Resume(a1);
}

void sub_21DEE8088(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEE81B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEE83AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, VisionCoreHomography *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_21DEE8540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, VisionCoreHomography *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;
  void *v27;
  void *v28;

  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)&a9);
  VisionCoreHomography::~VisionCoreHomography((VisionCoreHomography *)&a26);

  _Unwind_Resume(a1);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  std::vector<int>::pointer end;
  int *v7;
  std::vector<int>::size_type v8;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[__n];
    v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_21DEE85EC(_Unwind_Exception *exception_object)
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

void std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  VisionCoreHomography *v2;
  VisionCoreHomography *v4;
  void *v5;

  v1 = *a1;
  v2 = (VisionCoreHomography *)**a1;
  if (v2)
  {
    v4 = (VisionCoreHomography *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        VisionCoreHomography::~VisionCoreHomography(v4 - 1);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

VisionCoreHomography **std::vector<VisionCoreHomography>::vector(VisionCoreHomography **a1, unint64_t a2, VisionCoreHomography *a3)
{
  uint64_t v5;
  uint64_t v6;
  VisionCoreHomography *v7;
  VisionCoreHomography *v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v5 = a2;
    v6 = 136 * a2;
    v7 = (VisionCoreHomography *)operator new(136 * a2);
    *a1 = v7;
    a1[1] = v7;
    v8 = &v7[v5];
    a1[2] = v8;
    do
    {
      VisionCoreHomography::VisionCoreHomography(v7++, a3);
      v6 -= 136;
    }
    while (v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_21DEE8790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<VisionCoreHomography>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21DEE880C(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<CGPoint>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 60)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v4 = 16 * a2;
    v5 = (char *)operator new(16 * a2);
    *a1 = v5;
    a1[2] = &v5[16 * a2];
    bzero(v5, 16 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_21DEE889C(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<half>::vector(_QWORD *a1, uint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<half>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 2 * a2);
    a1[1] = &v4[2 * a2];
  }
  return a1;
}

void sub_21DEE8910(_Unwind_Exception *exception_object)
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

id VisionCoreFrameworkBundle()
{
  if (VisionCoreFrameworkBundle_onceToken != -1)
    dispatch_once(&VisionCoreFrameworkBundle_onceToken, &__block_literal_global_868);
  return (id)VisionCoreFrameworkBundle_bundle;
}

uint64_t VisionCoreEqualOrNilObjects(void *a1, void *a2)
{
  if (a1 == a2)
    return 1;
  else
    return objc_msgSend(a1, "isEqual:", a2);
}

uint64_t VisionCoreEquivalentOrNilUnorderedArrays(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
    {
      v7 = objc_msgSend(v3, "count");
      if (v7 == objc_msgSend(v5, "count"))
      {
        v8 = (void *)MEMORY[0x2207A6494]();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v3);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
        v6 = objc_msgSend(v9, "isEqualToSet:", v10);

        objc_autoreleasePoolPop(v8);
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

id VisionCoreFourCharCodeToString(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = ((int)a1 >> 24);
  v3 = MEMORY[0x24BDAC740];
  if ((a1 & 0x80000000) != 0)
  {
    if (!__maskrune((int)a1 >> 24, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v2 + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if ((((_DWORD)a1 << 8) & 0x80000000) != 0)
  {
    if (!__maskrune((int)((_DWORD)a1 << 8) >> 24, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(v3 + 4 * ((int)((_DWORD)a1 << 8) >> 24) + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if ((((_DWORD)a1 << 16) & 0x80000000) != 0)
  {
    if (!__maskrune((__int16)a1 >> 8, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(v3 + 4 * ((__int16)a1 >> 8) + 60) & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  if ((a1 & 0x80) != 0)
  {
    if (__maskrune((char)a1, 0x40000uLL))
      goto LABEL_15;
LABEL_17:
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("0x%08X"), a1, v6, v7, v8);
    return v4;
  }
  if ((*(_DWORD *)(v3 + 4 * (char)a1 + 60) & 0x40000) == 0)
    goto LABEL_17;
LABEL_15:
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("'%c%c%c%c'"), v2, ((int)((_DWORD)a1 << 8) >> 24), ((__int16)a1 >> 8), (char)a1);
  return v4;
}

double VisionCoreNormalizedPointForImagePoint(unint64_t a1, uint64_t a2, double a3)
{
  if (a1 && a2)
    return a3 / (double)a1;
  else
    return *MEMORY[0x24BDBEFB0];
}

double VisionCoreImagePointForNormalizedPoint(unint64_t a1, double a2)
{
  return a2 * (double)a1;
}

uint64_t VisionCorePerformWithLockedIOSurface(__IOSurface *a1, IOSurfaceLockOptions a2, void *a3, _QWORD *a4)
{
  uint64_t (**v7)(id, __IOSurface *, _QWORD *);
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;

  v7 = a3;
  v8 = IOSurfaceLock(a1, a2, 0);
  if ((_DWORD)v8)
  {
    if (a4)
    {
      v9 = v8;
      v10 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Could not lock IOSurfaceRef %p (%@)"), a1, v11);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForKernelReturnCode:localizedDescription:", v9, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = v7[2](v7, a1, a4);
    v13 = IOSurfaceUnlock(a1, a2, 0);
    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      VisionCoreValidatedLog((uint64_t)v21, (uint64_t)CFSTR("Could not unlock IOSurfaceRef %p (%@)"), v14, v15, v16, v17, v18, v19, (uint64_t)a1);

    }
  }

  return a4 & 1;
}

void sub_21DEE8D58(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id VisionCoreTensorDescriptorsFromANSTDescriptors(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  VisionCoreTensorDescriptor *v10;
  VisionCoreTensorDescriptor *v11;
  void *v12;
  id v13;
  VisionCoreImageTensorDescriptor *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2050000000;
        v8 = (void *)getANSTTensorDescriptorClass_softClass;
        v28 = getANSTTensorDescriptorClass_softClass;
        if (!getANSTTensorDescriptorClass_softClass)
        {
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __getANSTTensorDescriptorClass_block_invoke;
          v23 = &unk_24E1DBC38;
          v24 = &v25;
          __getANSTTensorDescriptorClass_block_invoke((uint64_t)&v20);
          v8 = (void *)v26[3];
        }
        v9 = objc_retainAutorelease(v8);
        _Block_object_dispose(&v25, 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = [VisionCoreTensorDescriptor alloc];
          v11 = -[VisionCoreTensorDescriptor initWithANSTTensorDescriptor:](v10, "initWithANSTTensorDescriptor:", v7, (_QWORD)v16);
          objc_msgSend(v2, "addObject:", v11);

        }
        v25 = 0;
        v26 = &v25;
        v27 = 0x2050000000;
        v12 = (void *)getANSTPixelBufferDescriptorClass_softClass;
        v28 = getANSTPixelBufferDescriptorClass_softClass;
        if (!getANSTPixelBufferDescriptorClass_softClass)
        {
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __getANSTPixelBufferDescriptorClass_block_invoke;
          v23 = &unk_24E1DBC38;
          v24 = &v25;
          __getANSTPixelBufferDescriptorClass_block_invoke((uint64_t)&v20);
          v12 = (void *)v26[3];
        }
        v13 = objc_retainAutorelease(v12);
        _Block_object_dispose(&v25, 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[VisionCoreImageTensorDescriptor initWithANSTPixelBufferDescriptor:]([VisionCoreImageTensorDescriptor alloc], "initWithANSTPixelBufferDescriptor:", v7);
          objc_msgSend(v2, "addObject:", v14);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v4);
  }

  return v2;
}

void sub_21DEE9000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTTensorDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ANSTKitLibrary_890();
  result = objc_getClass("ANSTTensorDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTTensorDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getANSTPixelBufferDescriptorClass_block_invoke(v3);
  }
  return result;
}

void __getANSTPixelBufferDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_890();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTPixelBufferDescriptor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTPixelBufferDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_890();
  }
}

void ANSTKitLibrary_890()
{
  void *v0;

  if (!ANSTKitLibraryCore_frameworkLibrary_893)
  {
    ANSTKitLibraryCore_frameworkLibrary_893 = _sl_dlopen();
    if (!ANSTKitLibraryCore_frameworkLibrary_893)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_21DEE9E08(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEE9D30);
}

void sub_21DEEA2C8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEEA270);
}

void sub_21DEEAC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getANSTViSegHQInitialFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ANSTKitLibrary_1001();
  result = objc_getClass("ANSTViSegHQInitialFrameInferenceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQInitialFrameInferenceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)getANSTViSegHQRegularFrameInferenceDescriptorClass(v3);
  }
  return result;
}

id getANSTViSegHQRegularFrameInferenceDescriptorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass;
  v7 = getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass;
  if (!getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_24E1DBC38;
    v3[4] = &v4;
    __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DEEAED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getANSTViSegHQUpdateFrameInferenceDescriptorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass;
  v7 = getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass;
  if (!getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke;
    v3[3] = &unk_24E1DBC38;
    v3[4] = &v4;
    __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DEEAF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANSTViSegHQUpdateFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_1001();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTViSegHQUpdateFrameInferenceDescriptor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQUpdateFrameInferenceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_1001();
  }
}

void ANSTKitLibrary_1001()
{
  void *v0;

  if (!ANSTKitLibraryCore_frameworkLibrary_1004)
  {
    ANSTKitLibraryCore_frameworkLibrary_1004 = _sl_dlopen();
    if (!ANSTKitLibraryCore_frameworkLibrary_1004)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getANSTViSegHQRegularFrameInferenceDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  ANSTKitLibrary_1001();
  result = objc_getClass("ANSTViSegHQRegularFrameInferenceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQRegularFrameInferenceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  }
  else
  {
    abort_report_np();
    return (Class)getANSTViSegHQInferenceConfigurationClass();
  }
  return result;
}

id getANSTViSegHQInferenceConfigurationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getANSTViSegHQInferenceConfigurationClass_softClass;
  v7 = getANSTViSegHQInferenceConfigurationClass_softClass;
  if (!getANSTViSegHQInferenceConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getANSTViSegHQInferenceConfigurationClass_block_invoke;
    v3[3] = &unk_24E1DBC38;
    v3[4] = &v4;
    __getANSTViSegHQInferenceConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DEEB1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float __getANSTViSegHQInferenceConfigurationClass_block_invoke(uint64_t a1)
{
  float result;
  VisionCoreValueConfidenceCurve *v3;
  SEL v4;

  ANSTKitLibrary_1001();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTViSegHQInferenceConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTViSegHQInferenceConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (VisionCoreValueConfidenceCurve *)abort_report_np();
    return -[VisionCoreValueConfidenceCurve minimumValue](v3, v4);
  }
  return result;
}

void sub_21DEEB594(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEEB670(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEEB994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21DEEC240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void std::vector<VisionCoreValueConfidencePoint>::reserve(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    v7 = &v4[8 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

uint64_t _tenthsForValue(float a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  if (_tenthsForValue(float)::onceToken != -1)
    dispatch_once(&_tenthsForValue(float)::onceToken, &__block_literal_global_1063);
  v2 = *(_QWORD *)(_tenthsForValue(float)::tenthsMap + 8);
  if (!v2)
    return 0;
  v3 = _tenthsForValue(float)::tenthsMap + 8;
  do
  {
    v4 = (uint64_t *)(v2 + 8);
    if (*(float *)(v2 + 28) >= a1)
    {
      v4 = (uint64_t *)v2;
      v3 = v2;
    }
    v2 = *v4;
  }
  while (*v4);
  if (v3 == _tenthsForValue(float)::tenthsMap + 8 || *(float *)(v3 + 28) > a1)
    return 0;
  else
    return *(unsigned __int8 *)(v3 + 32);
}

uint64_t ___ZL15_tenthsForValuef_block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  float *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  BOOL v11;
  float v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  int v23;
  float v24;
  uint64_t **v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  result = operator new();
  v1 = result;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  *(_QWORD *)(result + 8) = 0;
  v5 = (uint64_t *)(result + 8);
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)result = result + 8;
  v6 = (uint64_t *)(result + 8);
  while (1)
  {
    v7 = (float *)((char *)&unk_21DF02FF4 + 8 * v4);
    v8 = v5;
    if (v6 == v5)
      goto LABEL_8;
    v9 = v3;
    v10 = v5;
    if (v3)
    {
      do
      {
        v8 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      do
      {
        v8 = (uint64_t *)v10[2];
        v11 = *v8 == (_QWORD)v10;
        v10 = v8;
      }
      while (v11);
    }
    v12 = *v7;
    if (*((float *)v8 + 7) < *v7)
    {
LABEL_8:
      v13 = v3 ? v8 : v5;
      v14 = v3 ? v8 + 1 : v5;
    }
    else
    {
      v13 = v5;
      v14 = v5;
      if (v3)
      {
        v14 = v5;
        while (1)
        {
          while (1)
          {
            v13 = v3;
            v24 = *((float *)v3 + 7);
            if (v12 >= v24)
              break;
            v3 = (uint64_t *)*v3;
            v14 = v13;
            if (!*v13)
              goto LABEL_15;
          }
          if (v24 >= v12)
            break;
          v14 = v3 + 1;
          v3 = (uint64_t *)v3[1];
          if (!v3)
            goto LABEL_15;
        }
      }
    }
    if (!*v14)
    {
LABEL_15:
      result = (uint64_t)operator new(0x28uLL);
      *(_QWORD *)(result + 28) = *(_QWORD *)v7;
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = v13;
      *v14 = result;
      v15 = **(_QWORD **)v1;
      if (v15)
      {
        *(_QWORD *)v1 = v15;
        result = *v14;
      }
      v16 = *v5;
      v11 = result == *v5;
      *(_BYTE *)(result + 24) = v11;
      if (!v11)
      {
        do
        {
          v17 = *(uint64_t **)(result + 16);
          if (*((_BYTE *)v17 + 24))
            break;
          v18 = v17[2];
          v19 = *(uint64_t **)v18;
          if (*(uint64_t **)v18 == v17)
          {
            v22 = *(_QWORD *)(v18 + 8);
            if (!v22 || (v23 = *(unsigned __int8 *)(v22 + 24), v20 = (_BYTE *)(v22 + 24), v23))
            {
              if (*v17 == result)
              {
                v25 = *(uint64_t ***)(result + 16);
              }
              else
              {
                v25 = (uint64_t **)v17[1];
                v26 = *v25;
                v17[1] = (uint64_t)*v25;
                if (v26)
                {
                  v26[2] = (uint64_t)v17;
                  v18 = v17[2];
                }
                v25[2] = (uint64_t *)v18;
                *(_QWORD *)(v17[2] + 8 * (*(_QWORD *)v17[2] != (_QWORD)v17)) = v25;
                *v25 = v17;
                v17[2] = (uint64_t)v25;
                v18 = (uint64_t)v25[2];
                v17 = *(uint64_t **)v18;
              }
              *((_BYTE *)v25 + 24) = 1;
              *(_BYTE *)(v18 + 24) = 0;
              v29 = v17[1];
              *(_QWORD *)v18 = v29;
              if (v29)
                *(_QWORD *)(v29 + 16) = v18;
              v17[2] = *(_QWORD *)(v18 + 16);
              *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v17;
              v17[1] = v18;
              goto LABEL_51;
            }
          }
          else if (!v19 || (v21 = *((unsigned __int8 *)v19 + 24), v20 = v19 + 3, v21))
          {
            if (*v17 == result)
            {
              v27 = *(_QWORD *)(result + 8);
              *v17 = v27;
              if (v27)
              {
                *(_QWORD *)(v27 + 16) = v17;
                v18 = v17[2];
              }
              *(_QWORD *)(result + 16) = v18;
              *(_QWORD *)(v17[2] + 8 * (*(_QWORD *)v17[2] != (_QWORD)v17)) = result;
              *(_QWORD *)(result + 8) = v17;
              v17[2] = result;
              v18 = *(_QWORD *)(result + 16);
            }
            else
            {
              result = *(_QWORD *)(result + 16);
            }
            *(_BYTE *)(result + 24) = 1;
            *(_BYTE *)(v18 + 24) = 0;
            v17 = *(uint64_t **)(v18 + 8);
            v28 = *v17;
            *(_QWORD *)(v18 + 8) = *v17;
            if (v28)
              *(_QWORD *)(v28 + 16) = v18;
            v17[2] = *(_QWORD *)(v18 + 16);
            *(_QWORD *)(*(_QWORD *)(v18 + 16) + 8 * (**(_QWORD **)(v18 + 16) != v18)) = v17;
            *v17 = v18;
LABEL_51:
            *(_QWORD *)(v18 + 16) = v17;
            break;
          }
          *((_BYTE *)v17 + 24) = 1;
          result = v18;
          *(_BYTE *)(v18 + 24) = v18 == v16;
          *v20 = 1;
        }
        while (v18 != v16);
      }
      *(_QWORD *)(v1 + 16) = ++v2;
    }
    if (++v4 == 9)
      break;
    v6 = *(uint64_t **)v1;
    v3 = *(uint64_t **)(v1 + 8);
  }
  _tenthsForValue(float)::tenthsMap = v1;
  return result;
}

void sub_21DEEC7B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(*(_QWORD **)(v1 + 8));
  MEMORY[0x2207A5FD8](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(*a1);
    std::__tree<std::__value_type<float,unsigned char>,std::__map_value_compare<float,std::__value_type<float,unsigned char>,std::less<float>,true>,std::allocator<std::__value_type<float,unsigned char>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void sub_21DEEC8EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEECAB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DEECBC0()
{
  __cxa_end_catch();
  JUMPOUT(0x21DEECBC8);
}

void sub_21DEECD78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(float *result, float *a2, float *a3)
{
  float v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = *a3;
  if (*a2 >= *result)
  {
    if (v4 < v3)
    {
      v6 = *(_QWORD *)a2;
      *(_QWORD *)a2 = *(_QWORD *)a3;
      *(_QWORD *)a3 = v6;
      if (*a2 < *result)
      {
        v7 = *(_QWORD *)result;
        *(_QWORD *)result = *(_QWORD *)a2;
        *(_QWORD *)a2 = v7;
      }
    }
  }
  else
  {
    v5 = *(_QWORD *)result;
    if (v4 >= v3)
    {
      *(_QWORD *)result = *(_QWORD *)a2;
      *(_QWORD *)a2 = v5;
      if (*a3 >= *(float *)&v5)
        return result;
      *(_QWORD *)a2 = *(_QWORD *)a3;
    }
    else
    {
      *(_QWORD *)result = *(_QWORD *)a3;
    }
    *(_QWORD *)a3 = v5;
  }
  return result;
}

float *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(float *a1, float *a2, float *a3, _QWORD *a4)
{
  float *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(a1, a2, a3);
  if (*(float *)a4 < *a3)
  {
    v9 = *(_QWORD *)a3;
    *(_QWORD *)a3 = *a4;
    *a4 = v9;
    if (*a3 < *a2)
    {
      v10 = *(_QWORD *)a2;
      *(_QWORD *)a2 = *(_QWORD *)a3;
      *(_QWORD *)a3 = v10;
      if (*a2 < *a1)
      {
        v11 = *(_QWORD *)a1;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_QWORD *)a2 = v11;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  float v11;
  int v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  float *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = (a2 - a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(float *)(a2 - 8) < *(float *)a1)
      {
        v6 = *(_QWORD *)a1;
        *(_QWORD *)a1 = *(_QWORD *)(a2 - 8);
        *(_QWORD *)(a2 - 8) = v6;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)a1, (float *)(a1 + 8), (float *)(a2 - 8));
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)a1, (float *)(a1 + 8), (float *)(a1 + 16), (_QWORD *)(a2 - 8));
      return 1;
    case 5:
      v16 = (float *)(a1 + 16);
      v17 = (uint64_t *)(a1 + 24);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)a1, (float *)(a1 + 8), (float *)(a1 + 16), (_QWORD *)(a1 + 24));
      if (*(float *)(a2 - 8) < *(float *)(a1 + 24))
      {
        v18 = *v17;
        *v17 = *(_QWORD *)(a2 - 8);
        *(_QWORD *)(a2 - 8) = v18;
        if (*(float *)v17 < *v16)
        {
          v19 = *(_QWORD *)v16;
          v20 = *v17;
          *(_QWORD *)v16 = *v17;
          *v17 = v19;
          if (*(float *)(a1 + 8) > *(float *)&v20)
          {
            v21 = *(_QWORD *)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v20;
            *(_QWORD *)(a1 + 16) = v21;
            if (*(float *)a1 > *(float *)&v20)
            {
              v22 = *(_QWORD *)a1;
              *(_QWORD *)a1 = v20;
              *(_QWORD *)(a1 + 8) = v22;
            }
          }
        }
      }
      return 1;
    default:
      v7 = (float *)(a1 + 16);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[VisionCoreValueConfidenceCurve _finalizeInitialization]::$_0 &,VisionCoreValueConfidencePoint *>((float *)a1, (float *)(a1 + 8), (float *)(a1 + 16));
      v8 = a1 + 24;
      if (a1 + 24 == a2)
        return 1;
      v9 = 0;
      v10 = 0;
      break;
  }
  while (1)
  {
    v11 = *(float *)v8;
    if (*(float *)v8 < *v7)
    {
      v12 = *(_DWORD *)(v8 + 4);
      v13 = v9;
      while (1)
      {
        *(_QWORD *)(a1 + v13 + 24) = *(_QWORD *)(a1 + v13 + 16);
        if (v13 == -16)
          break;
        v14 = *(float *)(a1 + v13 + 8);
        v13 -= 8;
        if (v14 <= v11)
        {
          v15 = a1 + v13 + 24;
          goto LABEL_13;
        }
      }
      v15 = a1;
LABEL_13:
      *(float *)v15 = v11;
      *(_DWORD *)(v15 + 4) = v12;
      if (++v10 == 8)
        return v8 + 8 == a2;
    }
    v7 = (float *)v8;
    v9 += 8;
    v8 += 8;
    if (v8 == a2)
      return 1;
  }
}

uint64_t Geometry2D_normalizePoints(uint64_t a1, float *a2, uint64_t a3, float *__C, float *a5, float *a6)
{
  const float *v7;
  uint64_t result;
  vDSP_Length v10;
  int v11;
  float v16;
  float __Ca;
  float v18;
  float __B;

  if (!a1)
    return 1917;
  v7 = *(const float **)a1;
  if (!*(_QWORD *)a1 || !*(_QWORD *)(a1 + 8))
    return 1917;
  result = 1917;
  if (a3)
  {
    v10 = *(unsigned int *)(a1 + 16);
    if ((int)v10 >= 1)
    {
      if (*(_QWORD *)a3)
      {
        if (*(_QWORD *)(a3 + 8))
        {
          v11 = *(_DWORD *)(a3 + 16);
          if (v11 >= 1)
          {
            if ((_DWORD)v10 != v11)
              return 1916;
            vDSP_meanv(v7, 1, __C, *(unsigned int *)(a1 + 16));
            vDSP_meanv(*(const float **)(a1 + 8), 1, a5, v10);
            v16 = -*__C;
            v18 = -*a5;
            __B = v16;
            vDSP_vsadd(*(const float **)a1, 1, &__B, *(float **)a3, 1, v10);
            vDSP_vsadd(*(const float **)(a1 + 8), 1, &v18, *(float **)(a3 + 8), 1, v10);
            vDSP_vdist(*(const float **)a3, 1, *(const float **)(a3 + 8), 1, a2, 1, v10);
            __Ca = 0.0;
            vDSP_meanv(a2, 1, &__Ca, v10);
            if (fabsf(__Ca) < 0.00000011921)
              return 1901;
            *a6 = 1.4142 / __Ca;
            vDSP_vsmul(*(const float **)a3, 1, a6, *(float **)a3, 1, v10);
            vDSP_vsmul(*(const float **)(a3 + 8), 1, a6, *(float **)(a3 + 8), 1, v10);
            return 1920;
          }
        }
      }
      return 1917;
    }
  }
  return result;
}

void sub_21DEEEA6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DEEEAD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DEEEB34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DEEFF54(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEEFF74(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEEFED4);
}

uint64_t ___releaseAllNamedIOPortHandles_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(a3, "pointerValue");
  return e5rt_io_port_release();
}

void sub_21DEF0994(void *a1)
{
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_21DEF09A0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF0BA8(void *a1)
{
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_21DEF0BB4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF1654(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF1690(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF162CLL);
}

void sub_21DEF16A0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF1610);
}

void sub_21DEF18D8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF18F8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF18B8);
}

void sub_21DEF19DC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF19FC(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF19ACLL);
}

void sub_21DEF1BD4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF229C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x21DEF2194);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DEF24A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEF277C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  if (v2)
    operator delete(v2);
  _Unwind_Resume(a1);
}

void sub_21DEF28A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEF2958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DEF2A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DEF2C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21DEF3FF4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF3FC8);
}

void sub_21DEF4500(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF44B8);
}

void sub_21DEF49E4(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_21DEF4A04(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF49ACLL);
}

void sub_21DEF4BF4(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_21DEF4C14(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEF4BBCLL);
}

void sub_21DEF4E68(void *exc_buf)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  objc_begin_catch(exc_buf);
  JUMPOUT(0x21DEF4E0CLL);
}

void sub_21DEF4EB8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEF61D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DEF62D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANSTPixelBufferClass_block_invoke(uint64_t a1)
{
  ANSTKitLibrary_2045();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANSTPixelBuffer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTPixelBufferClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    ANSTKitLibrary_2045();
  }
}

void ANSTKitLibrary_2045()
{
  void *v0;

  if (!ANSTKitLibraryCore_frameworkLibrary_2048)
  {
    ANSTKitLibraryCore_frameworkLibrary_2048 = _sl_dlopen();
    if (!ANSTKitLibraryCore_frameworkLibrary_2048)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getANSTTensorDataClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id v6;
  id *v7;

  ANSTKitLibrary_2045();
  result = objc_getClass("ANSTTensorData");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANSTTensorDataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[VisionCoreANSTInferenceNetworkDescriptor descriptorForIdentifier:version:error:](v3, v4, v5, v6, v7);
  }
  return result;
}

CFTypeRef CreatePixelBuffer(int a1, int a2, OSType a3)
{
  const __CFDictionary *v6;
  CVReturn v7;
  CFTypeRef v8;
  BOOL v9;
  CFTypeRef cf;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v12 = *MEMORY[0x24BDC5668];
  v13[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = CVPixelBufferCreate(0, a1, a2, a3, v6, (CVPixelBufferRef *)&cf);
  v8 = cf;
  if (v7)
    v9 = cf == 0;
  else
    v9 = 1;
  if (!v9)
  {
    CFRelease(cf);
    v8 = 0;
    cf = 0;
  }

  return v8;
}

void sub_21DEF8F0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  void *v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  free(v14);
  objc_exception_rethrow();
}

void sub_21DEF8F34(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ___enumerateProcessSubclasses_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_21DEF996C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

__CFString *NSStringFromVisionCoreSceneNetInferenceNetworkModel(uint64_t a1)
{
  __CFString *v1;

  if (a1)
  {
    if (a1 == 1)
      v1 = CFSTR("VisionCoreSceneNetInferenceNetworkModelSceneNetV3");
    else
      v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("VisionCoreSceneNetInferenceNetworkModel%lu"), a1);
  }
  else
  {
    v1 = CFSTR("VisionCoreSceneNetInferenceNetworkModelUndefined");
  }
  return v1;
}

void sub_21DEFBD98(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21DEFBDB8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEFBD18);
}

void sub_21DEFC214(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DEFC568(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_21DEFC59C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_21DEFC940(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21DEFC8E8);
}

void sub_21DEFCE80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void VisionCoreValidatedLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[4];
  int v12;

  if (a2)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __VisionCoreValidatedLog_block_invoke;
    v11[3] = &__block_descriptor_36_e24_v24__0____CFString__8_16l;
    v12 = 4;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207A662C](v11);
    ((void (**)(_QWORD, uint64_t, uint64_t *))v10)[2](v10, a2, &a9);

  }
}

void sub_21DEFCF78(void *a1)
{
  objc_begin_catch(a1);
  objc_exception_rethrow();
}

void sub_21DEFCF84(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _VisionCoreSignpostLog()
{
  if (_VisionCoreSignpostLog_onceToken != -1)
    dispatch_once(&_VisionCoreSignpostLog_onceToken, &__block_literal_global_2798);
  return (id)_VisionCoreSignpostLog____VisionCoreSignpostLog;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CVBufferRelease(CVBufferRef buffer)
{
  MEMORY[0x24BDC5168](buffer);
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x24BDC5178](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x24BDC52E0]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x24BDD8CB8]();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x24BDAC4A8](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x24BDAC4B0](libraryName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t Espresso::load_network_shape()
{
  return MEMORY[0x24BE2F5E8]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x24BEDACA8](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E1DB070(__p);
}

uint64_t operator delete()
{
  return off_24E1DB078();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E1DB080(__sz);
}

uint64_t operator new()
{
  return off_24E1DB088();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF198](adler, buf, *(_QWORD *)&len);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x24BEDCEE0](cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

uint64_t e5rt_e5_compiler_options_set_compute_device_types_mask()
{
  return MEMORY[0x24BE2F780]();
}

uint64_t e5rt_e5_compiler_options_set_custom_ane_compiler_options()
{
  return MEMORY[0x24BE2F788]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x24BE2F790]();
}

uint64_t e5rt_error_code_get_string()
{
  return MEMORY[0x24BE2F798]();
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

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x24BE2F7E0]();
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

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x24BE2F860]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x24BE2F870]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x24BE2F888]();
}

uint64_t e5rt_execution_stream_submit_async()
{
  return MEMORY[0x24BE2F890]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x24BE2F8A0]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x24BE2F8C0]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x24BE2F8C8]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x24BE2F8D8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x24BE2F8F8]();
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

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x24BE2F958]();
}

uint64_t e5rt_program_library_get_build_info()
{
  return MEMORY[0x24BE2F960]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x24BE2F970]();
}

uint64_t e5rt_program_library_get_segmentation_analytics()
{
  return MEMORY[0x24BE2F988]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x24BE2F998]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x24BE2F9A0]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x24BE2F9B0]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x24BE2F9C0]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x24BE2F9D0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x24BE2F9E8]();
}

uint64_t e5rt_surface_format_to_cvpb_4cc()
{
  return MEMORY[0x24BE2F9F0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x24BE2FA08]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x24BE2FA18]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x24BE2FA40]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x24BE2FA50]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x24BE2FA68]();
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

uint64_t espresso_get_status_string()
{
  return MEMORY[0x24BE2FB70]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x24BE2FCB0]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
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

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x24BEDCF38](m);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

const char **__cdecl objc_copyImageNames(unsigned int *outCount)
{
  return (const char **)MEMORY[0x24BEDD018](outCount);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
  MEMORY[0x24BEDD058](image, namePrefix, conformingTo, subclassing, block);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD0A0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x24BEDD488](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

int sgelqf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2F38](__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int sgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2FA0](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

int sormlq_(char *__side, char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__c__, __CLPK_integer *__ldc, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB3018](__side, __trans, __m, __n, __k, __a, __lda, __tau);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3248](__A, __IA, __C, __N);
}

void vDSP_vasm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3320](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vdist(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3348](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3350](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3368](__A, __C, __IC, __N);
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x24BDB3450](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34D8](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

