uint64_t _GLOBAL__sub_I_BtProximityFilters_cpp()
{
  BtProxMaxFilter::BtProxMaxFilter((BtProxMaxFilter *)&maxFilter);
  __cxa_atexit((void (*)(void *))BtProxMaxFilter::~BtProxMaxFilter, &maxFilter, &dword_19BF46000);
  BtProxMeanFilter::BtProxMeanFilter((BtProxMeanFilter *)&meanFilter);
  __cxa_atexit((void (*)(void *))BtProxMeanFilter::~BtProxMeanFilter, &meanFilter, &dword_19BF46000);
  BtProxMedianFilter::BtProxMedianFilter((BtProxMedianFilter *)&medianFilter);
  __cxa_atexit((void (*)(void *))BtProxMedianFilter::~BtProxMedianFilter, &medianFilter, &dword_19BF46000);
  BtProxMaxOfMeanOfChanFilter::BtProxMaxOfMeanOfChanFilter((BtProxMaxOfMeanOfChanFilter *)&maxOfMeanOfChanFilter);
  __cxa_atexit((void (*)(void *))BtProxMaxOfMeanOfChanFilter::~BtProxMaxOfMeanOfChanFilter, &maxOfMeanOfChanFilter, &dword_19BF46000);
  BtProxMedianOfMeanOfChanFilter::BtProxMedianOfMeanOfChanFilter((BtProxMedianOfMeanOfChanFilter *)&medianOfMeanOfChanFilter);
  __cxa_atexit((void (*)(void *))BtProxMedianOfMeanOfChanFilter::~BtProxMedianOfMeanOfChanFilter, &medianOfMeanOfChanFilter, &dword_19BF46000);
  BtProxOlympicFilter::BtProxOlympicFilter((BtProxOlympicFilter *)&olympic1Filter, 1);
  __cxa_atexit((void (*)(void *))BtProxOlympicFilter::~BtProxOlympicFilter, &olympic1Filter, &dword_19BF46000);
  BtProxOlympicFilter::BtProxOlympicFilter((BtProxOlympicFilter *)&olympic2Filter, 2);
  __cxa_atexit((void (*)(void *))BtProxOlympicFilter::~BtProxOlympicFilter, &olympic2Filter, &dword_19BF46000);
  BtProxRayleighFilter::BtProxRayleighFilter((BtProxRayleighFilter *)&rayleighFilter);
  return __cxa_atexit((void (*)(void *))BtProxRayleighFilter::~BtProxRayleighFilter, &rayleighFilter, &dword_19BF46000);
}

void BtProxOlympicFilter::BtProxOlympicFilter(BtProxOlympicFilter *this, int __val)
{
  std::string *v4;
  __int128 v5;
  std::string v6;
  std::string __p;

  std::to_string(&v6, __val);
  v4 = std::string::insert(&v6, 0, "OLYMPIC_FILTER");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04F90;
  *((_DWORD *)this + 8) = __val;
}

void sub_19BF47184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t BtProximityFilterBase::BtProximityFilterBase(uint64_t a1, const std::string *a2)
{
  *(_QWORD *)a1 = off_1E3D05010;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  std::string::operator=((std::string *)(a1 + 8), a2);
  return a1;
}

void sub_19BF47200(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void BtProxMedianOfMeanOfChanFilter::BtProxMedianOfMeanOfChanFilter(BtProxMedianOfMeanOfChanFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "MEDIAN_OF_MEAN_CHAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04F50;
}

void sub_19BF4727C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BtProxMaxOfMeanOfChanFilter::BtProxMaxOfMeanOfChanFilter(BtProxMaxOfMeanOfChanFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "MAX_OF_MEAN_CHAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04F10;
}

void sub_19BF472F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BtProxRayleighFilter::BtProxRayleighFilter(BtProxRayleighFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "RAYLEIGH_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04FD0;
}

void sub_19BF47374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BtProxMedianFilter::BtProxMedianFilter(BtProxMedianFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "MEDIAN_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04ED0;
}

void sub_19BF473F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BtProxMeanFilter::BtProxMeanFilter(BtProxMeanFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "MEAN_FIILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04E90;
}

void sub_19BF4746C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BtProxMaxFilter::BtProxMaxFilter(BtProxMaxFilter *this)
{
  std::string __p;

  std::string::basic_string[abi:ne180100]<0>(&__p, "MAX_FILTER");
  BtProximityFilterBase::BtProximityFilterBase((uint64_t)this, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)this = off_1E3D04E40;
}

void sub_19BF474E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t _GLOBAL__sub_I_FullSharingImportanceEstimator_cpp()
{
  _DWORD *v0;
  _DWORD *v1;
  _DWORD *v2;
  _QWORD *v3;
  _DWORD *v4;
  _OWORD *v5;
  _DWORD *v6;
  _QWORD *v7;
  _DWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _OWORD *v13;
  uint64_t i;
  void *__p;
  void *v17;
  void *v18;
  int v19;
  _BYTE v20[8];
  _QWORD *v21;
  _BYTE v22[8];
  _QWORD *v23;
  _BYTE v24[8];
  _QWORD *v25;
  _BYTE v26[8];
  _QWORD *v27[2];
  _OWORD __dst[25];
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  __dst[7] = unk_19BF79A00;
  __dst[8] = xmmword_19BF79A10;
  __dst[9] = unk_19BF79A20;
  __dst[3] = unk_19BF799C0;
  __dst[4] = xmmword_19BF799D0;
  __dst[5] = unk_19BF799E0;
  __dst[6] = xmmword_19BF799F0;
  __dst[0] = xmmword_19BF79990;
  __dst[1] = unk_19BF799A0;
  __dst[2] = xmmword_19BF799B0;
  std::map<Region,double>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,double>::~map[abi:ne180100], &FullSharingImportanceEstimator::REGION_SIZE_METERS2, &dword_19BF46000);
  v0 = operator new(0xCuLL);
  *(_QWORD *)v0 = 0x400000001;
  v0[2] = 7;
  LODWORD(__dst[0]) = 0;
  __dst[1] = 0uLL;
  *((_QWORD *)&__dst[0] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)__dst + 1, v0, (uint64_t)(v0 + 3), 3uLL);
  v1 = operator new(0xCuLL);
  *(_QWORD *)v1 = 0x200000000;
  v1[2] = 4;
  LODWORD(__dst[2]) = 1;
  __dst[3] = 0uLL;
  *((_QWORD *)&__dst[2] + 1) = 0;
  v18 = v1;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[2] + 1, v1, (uint64_t)(v1 + 3), 3uLL);
  v2 = operator new(0xCuLL);
  *(_QWORD *)v2 = 0x300000001;
  v2[2] = 5;
  LODWORD(__dst[4]) = 2;
  __dst[5] = 0uLL;
  *((_QWORD *)&__dst[4] + 1) = 0;
  v17 = v2;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[4] + 1, v2, (uint64_t)(v2 + 3), 3uLL);
  v3 = operator new(8uLL);
  *v3 = 0x600000002;
  LODWORD(__dst[6]) = 3;
  __dst[7] = 0uLL;
  *((_QWORD *)&__dst[6] + 1) = 0;
  __p = v3;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[6] + 1, v3, (uint64_t)(v3 + 1), 2uLL);
  v4 = operator new(0xCuLL);
  *(_QWORD *)v4 = 0x500000000;
  v4[2] = 1;
  LODWORD(__dst[8]) = 4;
  __dst[9] = 0uLL;
  *((_QWORD *)&__dst[8] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[8] + 1, v4, (uint64_t)(v4 + 3), 3uLL);
  v5 = operator new(0x10uLL);
  *v5 = xmmword_19BF798C0;
  LODWORD(__dst[10]) = 5;
  __dst[11] = 0uLL;
  *((_QWORD *)&__dst[10] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[10] + 1, v5, (uint64_t)(v5 + 1), 4uLL);
  v6 = operator new(0xCuLL);
  *(_QWORD *)v6 = 0x300000005;
  v6[2] = 9;
  LODWORD(__dst[12]) = 6;
  __dst[13] = 0uLL;
  *((_QWORD *)&__dst[12] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[12] + 1, v6, (uint64_t)(v6 + 3), 3uLL);
  v7 = operator new(8uLL);
  *v7 = 0x800000000;
  LODWORD(__dst[14]) = 7;
  __dst[15] = 0uLL;
  *((_QWORD *)&__dst[14] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[14] + 1, v7, (uint64_t)(v7 + 1), 2uLL);
  v8 = operator new(0xCuLL);
  *(_QWORD *)v8 = 0x900000007;
  v8[2] = 5;
  LODWORD(__dst[16]) = 8;
  __dst[17] = 0uLL;
  *((_QWORD *)&__dst[16] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[16] + 1, v8, (uint64_t)(v8 + 3), 3uLL);
  v9 = operator new(8uLL);
  *v9 = 0x600000008;
  LODWORD(__dst[18]) = 9;
  __dst[19] = 0uLL;
  *((_QWORD *)&__dst[18] + 1) = 0;
  std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)&__dst[18] + 1, v9, (uint64_t)(v9 + 1), 2uLL);
  std::map<Region,std::vector<Region>>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::ADJACENCY_MAP, (int *)__dst, 10);
  v10 = 40;
  do
  {
    v11 = *(_QWORD **)&v26[v10 * 8];
    if (v11)
    {
      v27[v10] = v11;
      operator delete(v11);
    }
    v10 -= 4;
  }
  while (v10 * 8);
  operator delete(v9);
  operator delete(v8);
  operator delete(v7);
  operator delete(v6);
  operator delete(v5);
  operator delete(v4);
  operator delete(__p);
  operator delete(v17);
  operator delete(v18);
  operator delete(v0);
  __cxa_atexit((void (*)(void *))std::map<Region,std::vector<Region>>::~map[abi:ne180100], &FullSharingImportanceEstimator::ADJACENCY_MAP, &dword_19BF46000);
  __dst[7] = unk_19BF79AA0;
  __dst[8] = xmmword_19BF79AB0;
  __dst[9] = unk_19BF79AC0;
  __dst[3] = unk_19BF79A60;
  __dst[4] = xmmword_19BF79A70;
  __dst[5] = unk_19BF79A80;
  __dst[6] = xmmword_19BF79A90;
  __dst[0] = xmmword_19BF79A30;
  __dst[1] = unk_19BF79A40;
  __dst[2] = xmmword_19BF79A50;
  std::map<Region,double>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,double>::~map[abi:ne180100], &FullSharingImportanceEstimator::IMPORTANCE_MAP, &dword_19BF46000);
  qword_1ED0A59B0 = 0;
  unk_1ED0A59B8 = 0;
  FullSharingImportanceEstimator::IN_FOV = 0;
  v12 = operator new(0x18uLL);
  qword_1ED0A59B0 = (uint64_t)(v12 + 3);
  unk_1ED0A59B8 = v12 + 3;
  v12[2] = 0x600000005;
  *(_OWORD *)v12 = xmmword_19BF79AD0;
  FullSharingImportanceEstimator::IN_FOV = (uint64_t)v12;
  __cxa_atexit((void (*)(void *))std::vector<Region>::~vector[abi:ne180100], &FullSharingImportanceEstimator::IN_FOV, &dword_19BF46000);
  qword_1ED0A5938 = 0;
  unk_1ED0A5940 = 0;
  FullSharingImportanceEstimator::NOT_IN_FOV = 0;
  v13 = operator new(0x10uLL);
  FullSharingImportanceEstimator::NOT_IN_FOV = (uint64_t)v13;
  *v13 = xmmword_19BF798D0;
  qword_1ED0A5938 = (uint64_t)(v13 + 1);
  unk_1ED0A5940 = v13 + 1;
  __cxa_atexit((void (*)(void *))std::vector<Region>::~vector[abi:ne180100], &FullSharingImportanceEstimator::NOT_IN_FOV, &dword_19BF46000);
  memcpy(__dst, &unk_19BF79AE8, sizeof(__dst));
  std::map<Region,RegionBoundaries>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::BOUNDARY_MAP, (int *)__dst, 10);
  __cxa_atexit((void (*)(void *))std::map<Region,RegionBoundaries>::~map[abi:ne180100], &FullSharingImportanceEstimator::BOUNDARY_MAP, &dword_19BF46000);
  v33 = 0x600000003;
  v34 = 9;
  std::set<Region>::set[abi:ne180100]((uint64_t)v26, (int *)&v33, 3);
  LODWORD(__dst[0]) = 0;
  std::set<Region>::set[abi:ne180100]((uint64_t *)__dst + 1, (uint64_t)v26);
  v31 = 0x500000002;
  v32 = 8;
  std::set<Region>::set[abi:ne180100]((uint64_t)v24, (int *)&v31, 3);
  LODWORD(__dst[2]) = 1;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[2] + 1, (uint64_t)v24);
  v29 = 0x400000001;
  v30 = 7;
  std::set<Region>::set[abi:ne180100]((uint64_t)v22, (int *)&v29, 3);
  LODWORD(__dst[4]) = 2;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[4] + 1, (uint64_t)v22);
  v19 = 0;
  std::set<Region>::set[abi:ne180100]((uint64_t)v20, &v19, 1);
  LODWORD(__dst[6]) = 3;
  std::set<Region>::set[abi:ne180100]((uint64_t *)&__dst[6] + 1, (uint64_t)v20);
  std::map<CoarseRange,std::set<Region>>::map[abi:ne180100]((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)__dst, 4);
  for (i = 0; i != -8; i -= 2)
    std::__tree<Region>::destroy((uint64_t)&__dst[i + 6] + 8, *(_QWORD **)&__dst[i + 7]);
  std::__tree<Region>::destroy((uint64_t)v20, v21);
  std::__tree<Region>::destroy((uint64_t)v22, v23);
  std::__tree<Region>::destroy((uint64_t)v24, v25);
  std::__tree<Region>::destroy((uint64_t)v26, v27[0]);
  return __cxa_atexit((void (*)(void *))std::map<CoarseRange,std::set<Region>>::~map[abi:ne180100], &FullSharingImportanceEstimator::REGIONS_BY_RANGE, &dword_19BF46000);
}

void sub_19BF47C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *__p, void *a12, void *a13, void *a14, uint64_t a15, char a16, _QWORD *a17, uint64_t a18, uint64_t a19, char a20,_QWORD *a21,uint64_t a22,uint64_t a23,char a24,_QWORD *a25,uint64_t a26,uint64_t a27,char a28,_QWORD *a29,uint64_t a30,char a31)
{
  uint64_t v31;
  uint64_t i;

  for (i = 0; i != -128; i -= 32)
    std::__tree<Region>::destroy(v31 + i + 104, *(_QWORD **)(v31 + i + 112));
  std::__tree<Region>::destroy((uint64_t)&a16, a17);
  std::__tree<Region>::destroy((uint64_t)&a20, a21);
  std::__tree<Region>::destroy((uint64_t)&a24, a25);
  std::__tree<Region>::destroy((uint64_t)&a28, a29);
  _Unwind_Resume(a1);
}

void std::__tree<Region>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<Region>::destroy(a1, *a2);
    std::__tree<Region>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<Region>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t *v11;

  v6 = std::__tree<Region>::__find_equal<Region>(a1, a2, &v11, &v10, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<Region>::__find_equal<Region>(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t *std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,std::vector<Region>> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__construct_node<std::pair<Region const,std::vector<Region>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__construct_node<std::pair<Region const,std::vector<Region>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _DWORD *v6;
  _QWORD *result;

  v5 = a1 + 8;
  v6 = operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v6[8] = *(_DWORD *)a2;
  *((_QWORD *)v6 + 6) = 0;
  *((_QWORD *)v6 + 7) = 0;
  *((_QWORD *)v6 + 5) = 0;
  result = std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>((_QWORD *)v6 + 5, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_19BF48454(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<Region,std::vector<Region>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_OWORD *std::__tree<std::__value_type<Region,RegionBoundaries>,std::__map_value_compare<Region,std::__value_type<Region,RegionBoundaries>,std::less<Region>,true>,std::allocator<std::__value_type<Region,RegionBoundaries>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,RegionBoundaries> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t *v6;
  _OWORD *v7;
  uint64_t **v8;
  __int128 v9;
  uint64_t v11;
  uint64_t *v12;

  v6 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v12, &v11, a3);
  v7 = (_OWORD *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x48uLL);
    v9 = *(_OWORD *)(a4 + 16);
    v7[2] = *(_OWORD *)a4;
    v7[3] = v9;
    *((_QWORD *)v7 + 8) = *(_QWORD *)(a4 + 32);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v12, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__emplace_hint_unique_key_args<CoarseRange,std::pair<CoarseRange const,std::set<Region>> const&>(uint64_t **a1, uint64_t *a2, int *a3, _DWORD *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;

  v6 = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__find_equal<Region>(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__construct_node<std::pair<CoarseRange const,std::set<Region>> const&>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__construct_node<std::pair<CoarseRange const,std::set<Region>> const&>@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  void *v6;
  uint64_t *result;

  v5 = a1 + 8;
  v6 = operator new(0x40uLL);
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *a2;
  result = std::set<Region>::set[abi:ne180100]((uint64_t *)v6 + 5, (uint64_t)(a2 + 2));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_19BF485E8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<CoarseRange,std::set<Region>>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *rose::rangingTriggerTypeToString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1)
    v2 = "TriggerRequired";
  else
    v2 = "NoTriggerRequired";
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *rose::rangingAcquisitionTypeToString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1)
    v2 = "BTAidedAcquisition";
  else
    v2 = "DirectAcquisition";
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

_QWORD *rose::serviceattributes::attributeToString@<X0>(int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 == 100)
  {
    v2 = "Unspecified";
  }
  else if (a1 == 1)
  {
    v2 = "Responder";
  }
  else
  {
    v2 = "Initiator";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E3D04238[a1]);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E3D04290[a1]);
}

{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E3D042D8[a1]);
}

_QWORD *rose::serviceattributes::attributeToString@<X0>(rose::serviceattributes *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a2, off_1E3D042F8[(int)this]);
}

void sub_19BF4887C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF48948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF48B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF48C4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF48F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  if (a18 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void Rose::HelloResponse::AdditionalInfo::~AdditionalInfo(void **this)
{
  if (*((char *)this + 63) < 0)
    operator delete(this[5]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

void sub_19BF4924C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF493D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF49494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF49988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, int a13, char a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  if ((a14 & 1) != 0)
  {

  }
  if (!a18)

  _Unwind_Resume(a1);
}

void sub_19BF49FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19BF4A150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF4A464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF4A5A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<rose::ResponderSuperframeStats>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E3D03E20, MEMORY[0x1E0DE42D0]);
}

void sub_19BF4A770(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

_QWORD *std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<Rose::ResponderSuperframeRxPacketInfo>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19BF4A82C(_Unwind_Exception *exception_object)
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

char *std::vector<Rose::ResponderSuperframeRxPacketInfo>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
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

uint64_t std::allocate_shared[abi:ne180100]<rose::ResponderSuperframeStats,std::allocator<rose::ResponderSuperframeStats>,rose::ResponderSuperframeStats const&,void>@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t result;

  v4 = (char *)operator new(0x88uLL);
  result = std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__shared_ptr_emplace[abi:ne180100]<rose::ResponderSuperframeStats const&,std::allocator<rose::ResponderSuperframeStats>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_19BF4A9C4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__shared_ptr_emplace[abi:ne180100]<rose::ResponderSuperframeStats const&,std::allocator<rose::ResponderSuperframeStats>,0>(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &off_1E3D041F8;
  v4 = *a2;
  *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 4);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *((_OWORD *)a2 + 1);
  v6 = *((_OWORD *)a2 + 2);
  v7 = *((_OWORD *)a2 + 3);
  LODWORD(v4) = *((_DWORD *)a2 + 16);
  *(_QWORD *)(a1 + 96) = 0;
  v8 = a1 + 96;
  *(_DWORD *)(v8 - 8) = v4;
  *(_OWORD *)(v8 - 24) = v7;
  *(_OWORD *)(v8 - 40) = v6;
  *(_OWORD *)(v8 - 56) = v5;
  *(_OWORD *)(v8 + 8) = 0u;
  std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>((_QWORD *)v8, (const void *)a2[9], a2[10], (a2[10] - a2[9]) >> 4);
  *(_OWORD *)(a1 + 120) = *((_OWORD *)a2 + 6);
  return a1;
}

void sub_19BF4AA60(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D041F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D041F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A1ACFFFCLL);
}

void std::__shared_ptr_emplace<rose::ResponderSuperframeStats>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(_QWORD *)(a1 + 104) = v2;
    operator delete(v2);
  }
}

uint64_t std::shared_ptr<rose::ResponderSuperframeStats>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void MagicHeadTieHysteresis::MagicHeadTieHysteresis(MagicHeadTieHysteresis *this)
{
  TopScoreTieHysteresis::TopScoreTieHysteresis(this, 0, 0);
}

uint64_t std::map<Region,double>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<Region>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

uint64_t std::vector<Region>::~vector[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t std::map<Region,std::vector<Region>>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

uint64_t std::map<Region,RegionBoundaries>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<Region>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

uint64_t std::map<CoarseRange,std::set<Region>>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void FullSharingImportanceEstimator::FullSharingImportanceEstimator(FullSharingImportanceEstimator *this)
{
  *(_QWORD *)this = &off_1E3D04328;
  *(_OWORD *)((char *)this + 8) = xmmword_19BF798A0;
  *((_DWORD *)this + 6) = 0;
  *((_BYTE *)this + 28) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 4) = (char *)this + 40;
  *((_QWORD *)this + 6) = 0;
  FullSharingImportanceEstimator::initializeToUnknown((uint64_t **)this);
}

void sub_19BF4AC6C(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD **v2;

  std::__tree<Region>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

uint64_t **FullSharingImportanceEstimator::initializeToUnknown(uint64_t **this)
{
  uint64_t **v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t **result;
  int v12;
  int v13;
  int *v14;

  v1 = this + 4;
  v13 = 0;
  v14 = &v13;
  std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, &v13, (uint64_t)&std::piecewise_construct, &v14)[5] = (uint64_t *)0x3FE0000000000000;
  v13 = 1;
  v2 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 1;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v2;
  v13 = 2;
  v3 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 2;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v3;
  v13 = 3;
  v4 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 3;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v4;
  v13 = 4;
  v5 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 4;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v5;
  v13 = 5;
  v6 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 5;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v6;
  v13 = 6;
  v7 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 6;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v7;
  v13 = 7;
  v8 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 7;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v8;
  v13 = 8;
  v9 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
     * 0.5
     / 452.389342;
  v12 = 8;
  v14 = &v12;
  *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14)+ 5) = v9;
  v13 = 9;
  v10 = *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, &v13)
      * 0.5
      / 452.389342;
  v12 = 9;
  v14 = &v12;
  result = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v1, &v12, (uint64_t)&std::piecewise_construct, &v14);
  *((double *)result + 5) = v10;
  return result;
}

uint64_t *std::map<Region,double>::at(uint64_t a1, int *a2)
{
  uint64_t *v2;
  int v3;
  int v4;

  v2 = *(uint64_t **)(a1 + 8);
  if (!v2)
LABEL_8:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  v3 = *a2;
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v2 + 8);
      if (v3 >= v4)
        break;
      v2 = (uint64_t *)*v2;
      if (!v2)
        goto LABEL_8;
    }
    if (v4 >= v3)
      return v2 + 5;
    v2 = (uint64_t *)v2[1];
    if (!v2)
      goto LABEL_8;
  }
}

double FullSharingImportanceEstimator::getTime(FullSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

uint64_t FullSharingImportanceEstimator::normalizeLikelihoods(uint64_t this)
{
  double *v1;
  double *v2;
  double v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;
  BOOL v8;
  double *v9;
  double *v10;

  v1 = *(double **)(this + 32);
  v2 = (double *)(this + 40);
  if (v1 != (double *)(this + 40))
  {
    v3 = 0.0;
    v4 = *(double **)(this + 32);
    do
    {
      v5 = (double *)*((_QWORD *)v4 + 1);
      v6 = v4;
      if (v5)
      {
        do
        {
          v7 = v5;
          v5 = *(double **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v7 = (double *)*((_QWORD *)v6 + 2);
          v8 = *(_QWORD *)v7 == (_QWORD)v6;
          v6 = v7;
        }
        while (!v8);
      }
      v3 = v3 + v4[5];
      v4 = v7;
    }
    while (v7 != v2);
    if (v1 != v2)
    {
      do
      {
        v1[5] = v1[5] / v3;
        v9 = (double *)*((_QWORD *)v1 + 1);
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = *(double **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (double *)*((_QWORD *)v1 + 2);
            v8 = *(_QWORD *)v10 == (_QWORD)v1;
            v1 = v10;
          }
          while (!v8);
        }
        v1 = v10;
      }
      while (v10 != v2);
    }
  }
  return this;
}

double FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods(FullSharingImportanceEstimator *this, double a2, int a3)
{
  FullSharingImportanceEstimator *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int *v15;
  int *v16;
  uint64_t *v17;
  _DWORD *v18;
  _DWORD *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t **v23;
  int *v24;
  int *v25;
  BOOL v26;
  FullSharingImportanceEstimator *v28;
  uint64_t *v29;
  _QWORD *v30[2];
  _DWORD *v31;

  v4 = this;
  v5 = *((double *)this + 2);
  v6 = a2 - v5;
  v7 = vabdd_f64(a2, v5);
  if (a3)
    v8 = v7;
  else
    v8 = v6;
  if (v8 <= 5.0)
  {
    if (v8 > 0.0)
    {
      v9 = v8 * 0.1;
      v10 = (uint64_t **)((char *)this + 32);
      std::map<Region,double>::map[abi:ne180100]((uint64_t *)&v29, (uint64_t)this + 32);
      v11 = v29;
      if (v29 != (uint64_t *)v30)
      {
        do
        {
          *((double *)v11 + 5) = (1.0 - v9) * *((double *)v11 + 5);
          v12 = (uint64_t *)v11[1];
          if (v12)
          {
            do
            {
              v13 = v12;
              v12 = (uint64_t *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              v13 = (uint64_t *)v11[2];
              v14 = *v13 == (_QWORD)v11;
              v11 = v13;
            }
            while (!v14);
          }
          v11 = v13;
        }
        while (v13 != (uint64_t *)v30);
      }
      v28 = v4;
      v15 = (int *)*((_QWORD *)v4 + 4);
      v16 = (int *)((char *)v4 + 40);
      if (v15 != (int *)((char *)v4 + 40))
      {
        do
        {
          v17 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::ADJACENCY_MAP, v15 + 8);
          v19 = (_DWORD *)*v17;
          v18 = (_DWORD *)v17[1];
          while (v19 != v18)
          {
            v31 = v15 + 8;
            v20 = *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v10, v15 + 8, (uint64_t)&std::piecewise_construct, &v31)+ 5);
            v22 = *v17;
            v21 = v17[1];
            v31 = v19;
            v23 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v29, v19, (uint64_t)&std::piecewise_construct, &v31);
            *((double *)v23 + 5) = v9 * v20 / (double)(unint64_t)((v21 - v22) >> 2) + *((double *)v23 + 5);
            ++v19;
          }
          v24 = (int *)*((_QWORD *)v15 + 1);
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = *(int **)v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (int *)*((_QWORD *)v15 + 2);
              v14 = *(_QWORD *)v25 == (_QWORD)v15;
              v15 = v25;
            }
            while (!v14);
          }
          v15 = v25;
        }
        while (v25 != v16);
      }
      if (v10 != &v29)
        std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>(v10, v29, v30);
      v4 = v28;
      FullSharingImportanceEstimator::normalizeLikelihoods((uint64_t)v28);
      *((double *)v28 + 2) = a2;
      std::__tree<Region>::destroy((uint64_t)&v29, v30[0]);
    }
  }
  else
  {
    FullSharingImportanceEstimator::initializeToUnknown((uint64_t **)this);
    *((double *)v4 + 2) = a2;
  }
  v26 = *((int *)v4 + 6) >= 6 && *((double *)v4 + 2) > *((double *)v4 + 1) + 1.0;
  *((_BYTE *)v4 + 28) = v26;
  return v8;
}

void sub_19BF4B2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, _QWORD *a13)
{
  std::__tree<Region>::destroy((uint64_t)&a12, a13);
  _Unwind_Resume(a1);
}

long double FullSharingImportanceEstimator::computeFractionAboveSigma(FullSharingImportanceEstimator *this, double a2)
{
  return (1.0 - erf(a2 * 0.707106781)) * 0.5;
}

uint64_t **FullSharingImportanceEstimator::incorporateFovDetector(uint64_t **this, int a2)
{
  uint64_t v2;
  double v3;
  double v4;
  int *v5;
  uint64_t i;
  double v7;
  int *v8;
  uint64_t v9;
  uint64_t **v10;
  double v11;
  int *v12;

  v2 = (uint64_t)this;
  if (a2)
    v3 = 0.05;
  else
    v3 = 0.95;
  if (a2)
    v4 = 0.95;
  else
    v4 = 0.05;
  v5 = (int *)FullSharingImportanceEstimator::IN_FOV;
  for (i = qword_1ED0A59B0; v5 != (int *)i; ++v5)
  {
    v7 = v4
       * *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v5)
       / 75.3982237;
    v12 = v5;
    this = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>((uint64_t **)(v2 + 32), v5, (uint64_t)&std::piecewise_construct, &v12);
    *((double *)this + 5) = v7 * *((double *)this + 5);
  }
  v8 = (int *)FullSharingImportanceEstimator::NOT_IN_FOV;
  v9 = qword_1ED0A5938;
  if (FullSharingImportanceEstimator::NOT_IN_FOV != qword_1ED0A5938)
  {
    v10 = (uint64_t **)(v2 + 32);
    do
    {
      v11 = v3
          * *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v8)
          / 376.991118;
      v12 = v8;
      this = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(v10, v8, (uint64_t)&std::piecewise_construct, &v12);
      *((double *)this + 5) = v11 * *((double *)this + 5);
      ++v8;
    }
    while (v8 != (int *)v9);
  }
  return this;
}

void FullSharingImportanceEstimator::incorporatePreciseRangeAndAzimuth(FullSharingImportanceEstimator *this, double a2, double a3)
{
  uint64_t v4;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  double v13;
  int *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t **v19;
  long double v20;
  long double v21;
  _QWORD *v22;
  _QWORD *v23;
  BOOL v24;
  FullSharingImportanceEstimator *v25;
  int v26;
  double v27;
  _QWORD *v28;
  _QWORD **v29;
  _QWORD *v30;
  _QWORD **v31;
  int v32;
  _QWORD *v33;
  FullSharingImportanceEstimator *v34;
  FullSharingImportanceEstimator *v35;
  uint64_t *v36;
  _QWORD *v37[2];
  _DWORD *v38;

  v37[0] = 0;
  v37[1] = 0;
  v36 = (uint64_t *)v37;
  v4 = FullSharingImportanceEstimator::BOUNDARY_MAP;
  if ((_UNKNOWN *)FullSharingImportanceEstimator::BOUNDARY_MAP != &unk_1ED0A5950)
  {
    v6 = 0;
    v7 = fabs(a3);
    v8 = 1.0;
    while (1)
    {
      v9 = *(double *)(v4 + 40);
      if (v9 <= a2)
      {
        v11 = *(double *)(v4 + 48);
        if (v11 > a2)
        {
          v12 = 0;
          v13 = 0.0;
          goto LABEL_9;
        }
        v10 = a2 - v11;
      }
      else
      {
        v10 = v9 - a2;
      }
      v12 = 1;
      v13 = v10 / 0.2;
LABEL_9:
      v14 = (int *)(v4 + 32);
      v15 = *(double *)(v4 + 56);
      if (v7 < v15)
      {
        v16 = v15 - v7;
LABEL_15:
        v18 = v16 / 0.261799388;
LABEL_16:
        v38 = (_DWORD *)(v4 + 32);
        v19 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v36, v14, (uint64_t)&std::piecewise_construct, &v38);
        v20 = (1.0 - erf(v18 * 0.707106781)) * 0.5;
        v21 = v20 * ((1.0 - erf(v13 * 0.707106781)) * 0.5);
        *((long double *)v19 + 5) = v21;
        v8 = v8 - v21;
        goto LABEL_17;
      }
      v17 = *(double *)(v4 + 64);
      if (v7 >= v17)
      {
        v16 = v7 - v17;
        goto LABEL_15;
      }
      v18 = 0.0;
      if ((v12 & 1) != 0)
        goto LABEL_16;
      v6 = *v14;
LABEL_17:
      v22 = *(_QWORD **)(v4 + 8);
      if (v22)
      {
        do
        {
          v23 = v22;
          v22 = (_QWORD *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          v23 = *(_QWORD **)(v4 + 16);
          v24 = *v23 == v4;
          v4 = (uint64_t)v23;
        }
        while (!v24);
      }
      v4 = (uint64_t)v23;
      if (v23 == (_QWORD *)&unk_1ED0A5950)
        goto LABEL_25;
    }
  }
  v6 = 0;
  v8 = 1.0;
LABEL_25:
  v25 = (FullSharingImportanceEstimator *)*((_QWORD *)this + 4);
  if (v25 != (FullSharingImportanceEstimator *)((char *)this + 40))
  {
    do
    {
      v26 = *((_DWORD *)v25 + 8);
      v27 = v8;
      if (v26 != v6)
      {
        v28 = v37[0];
        v27 = 1.0;
        if (v37[0])
        {
          v29 = v37;
          do
          {
            v30 = v28;
            v31 = v29;
            v32 = *((_DWORD *)v28 + 8);
            v33 = v28 + 1;
            if (v32 >= v26)
            {
              v33 = v30;
              v29 = (_QWORD **)v30;
            }
            v28 = (_QWORD *)*v33;
          }
          while (v28);
          if (v29 != v37)
          {
            if (v32 < v26)
              v30 = v31;
            if (v26 >= *((_DWORD *)v30 + 8))
            {
              v38 = (_DWORD *)((char *)v25 + 32);
              v27 = *((double *)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(&v36, (int *)v25 + 8, (uint64_t)&std::piecewise_construct, &v38)+ 5);
            }
          }
        }
      }
      if (v27 < 0.001)
        v27 = 0.001;
      *((double *)v25 + 5) = *((double *)v25 + 5) * v27;
      v34 = (FullSharingImportanceEstimator *)*((_QWORD *)v25 + 1);
      if (v34)
      {
        do
        {
          v35 = v34;
          v34 = *(FullSharingImportanceEstimator **)v34;
        }
        while (v34);
      }
      else
      {
        do
        {
          v35 = (FullSharingImportanceEstimator *)*((_QWORD *)v25 + 2);
          v24 = *(_QWORD *)v35 == (_QWORD)v25;
          v25 = v35;
        }
        while (!v24);
      }
      v25 = v35;
    }
    while (v35 != (FullSharingImportanceEstimator *)((char *)this + 40));
  }
  std::__tree<Region>::destroy((uint64_t)&v36, v37[0]);
}

void sub_19BF4B750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, _QWORD *a13)
{
  std::__tree<Region>::destroy((uint64_t)&a12, a13);
  _Unwind_Resume(a1);
}

double FullSharingImportanceEstimator::incorporatePreciseRangeOnly(uint64_t **this, double a2)
{
  double v4;
  double v5;
  double v6;
  uint64_t *v7;
  uint64_t *v8;
  int *v9;
  double v10;
  uint64_t *v11;
  double v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL v16;
  double v17;
  double v18;
  uint64_t *v19;
  uint64_t *v20;
  int *v21;
  double v22;
  double v23;
  uint64_t *v24;
  double v25;
  uint64_t **v26;
  uint64_t *v27;
  uint64_t *v28;
  double v29;
  uint64_t *v30;
  uint64_t *v31;
  int *v32;
  double v33;
  uint64_t *v34;
  double v35;
  uint64_t **v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t **v39;
  double result;
  double v41;
  double v42;
  int v43;
  int *v44;

  v4 = 1.0 - (1.0 - erf(a2 / -0.2 * 0.707106781)) * 0.5;
  v42 = 1.0 - (1.0 - erf((1.0 - a2) / 0.2 * 0.707106781)) * 0.5;
  v41 = (1.0 - erf((5.0 - a2) / 0.2 * 0.707106781)) * 0.5;
  v5 = 1.0 - erf((12.0 - a2) / 0.2 * 0.707106781);
  v6 = 1.0 - v4;
  LODWORD(v44) = 0;
  v7 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  v8 = v7 + 1;
  v9 = (int *)*v7;
  if ((uint64_t *)*v7 != v7 + 1)
  {
    v10 = (v42 - v4) / v6;
    do
    {
      v11 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v9 + 7);
      if (v10 * *(double *)v11 / 6.28318531 >= 0.001)
        v12 = v10 * *(double *)v11 / 6.28318531;
      else
        v12 = 0.001;
      v44 = v9 + 7;
      v13 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v9 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v13 + 5) = v12 * *((double *)v13 + 5);
      v14 = (uint64_t *)*((_QWORD *)v9 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (uint64_t *)*((_QWORD *)v9 + 2);
          v16 = *v15 == (_QWORD)v9;
          v9 = (int *)v15;
        }
        while (!v16);
      }
      v9 = (int *)v15;
    }
    while (v15 != v8);
  }
  v17 = v5 * 0.5;
  v18 = 1.0 - v41;
  LODWORD(v44) = 1;
  v19 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  v20 = v19 + 1;
  v21 = (int *)*v19;
  v22 = 1.0 - v4;
  if ((uint64_t *)*v19 != v19 + 1)
  {
    v23 = (v18 - v42) / v6;
    do
    {
      v24 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v21 + 7);
      if (v23 * *(double *)v24 / 150.796447 >= 0.001)
        v25 = v23 * *(double *)v24 / 150.796447;
      else
        v25 = 0.001;
      v44 = v21 + 7;
      v26 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v21 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v26 + 5) = v25 * *((double *)v26 + 5);
      v27 = (uint64_t *)*((_QWORD *)v21 + 1);
      if (v27)
      {
        do
        {
          v28 = v27;
          v27 = (uint64_t *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (uint64_t *)*((_QWORD *)v21 + 2);
          v16 = *v28 == (_QWORD)v21;
          v21 = (int *)v28;
        }
        while (!v16);
      }
      v21 = (int *)v28;
    }
    while (v28 != v20);
  }
  v29 = 1.0 - v17;
  LODWORD(v44) = 2;
  v30 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, (int *)&v44);
  v31 = v30 + 1;
  v32 = (int *)*v30;
  if ((uint64_t *)*v30 != v30 + 1)
  {
    v33 = (v29 - v18) / v6;
    do
    {
      v34 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, v32 + 7);
      if (v33 * *(double *)v34 / 747.699052 >= 0.001)
        v35 = v33 * *(double *)v34 / 747.699052;
      else
        v35 = 0.001;
      v44 = v32 + 7;
      v36 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, v32 + 7, (uint64_t)&std::piecewise_construct, &v44);
      *((double *)v36 + 5) = v35 * *((double *)v36 + 5);
      v37 = (uint64_t *)*((_QWORD *)v32 + 1);
      if (v37)
      {
        do
        {
          v38 = v37;
          v37 = (uint64_t *)*v37;
        }
        while (v37);
      }
      else
      {
        do
        {
          v38 = (uint64_t *)*((_QWORD *)v32 + 2);
          v16 = *v38 == (_QWORD)v32;
          v32 = (int *)v38;
        }
        while (!v16);
      }
      v32 = (int *)v38;
    }
    while (v38 != v31);
  }
  v43 = 0;
  v44 = &v43;
  v39 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(this + 4, &v43, (uint64_t)&std::piecewise_construct, &v44);
  result = (1.0 - v29) / v22 * *((double *)v39 + 5);
  *((double *)v39 + 5) = result;
  return result;
}

uint64_t *FullSharingImportanceEstimator::incorporateCoarseRange(uint64_t *result, int a2)
{
  uint64_t *v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  int v12;
  BOOL v13;
  uint64_t *v14;
  double v15;
  double v16;
  _QWORD *v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t *v26;
  int v27;
  BOOL v28;
  uint64_t *v29;
  uint64_t *v30;
  double v31;
  uint64_t *v32;
  uint64_t *v33;
  int v34;

  v2 = result;
  v34 = a2;
  v3 = FullSharingImportanceEstimator::REGION_SIZE_METERS2;
  if ((_UNKNOWN *)FullSharingImportanceEstimator::REGION_SIZE_METERS2 == &unk_1ED0A59C8)
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      v6 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      v9 = v6[1];
      v7 = v6 + 1;
      v8 = v9;
      if (!v9)
        goto LABEL_13;
      v10 = *(_DWORD *)(v3 + 32);
      v11 = v7;
      do
      {
        v12 = *(_DWORD *)(v8 + 28);
        v13 = v12 < v10;
        if (v12 >= v10)
          v14 = (uint64_t *)v8;
        else
          v14 = (uint64_t *)(v8 + 8);
        if (!v13)
          v11 = (uint64_t *)v8;
        v8 = *v14;
      }
      while (*v14);
      if (v11 == v7 || v10 < *((_DWORD *)v11 + 7))
LABEL_13:
        v11 = v7;
      result = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      v15 = *(double *)(v3 + 40);
      if (v11 == result + 1)
        v16 = *(double *)(v3 + 40);
      else
        v16 = -0.0;
      if (v11 == result + 1)
        v15 = -0.0;
      v17 = *(_QWORD **)(v3 + 8);
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = *(_QWORD **)(v3 + 16);
          v19 = *v18 == v3;
          v3 = (uint64_t)v18;
        }
        while (!v19);
      }
      v5 = v5 + v16;
      v4 = v4 + v15;
      v3 = (uint64_t)v18;
    }
    while (v18 != (_QWORD *)&unk_1ED0A59C8);
  }
  v20 = (uint64_t *)v2[4];
  if (v20 != v2 + 5)
  {
    do
    {
      v21 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34);
      v24 = v21[1];
      v22 = v21 + 1;
      v23 = v24;
      if (!v24)
        goto LABEL_38;
      v25 = *((_DWORD *)v20 + 8);
      v26 = v22;
      do
      {
        v27 = *(_DWORD *)(v23 + 28);
        v28 = v27 < v25;
        if (v27 >= v25)
          v29 = (uint64_t *)v23;
        else
          v29 = (uint64_t *)(v23 + 8);
        if (!v28)
          v26 = (uint64_t *)v23;
        v23 = *v29;
      }
      while (*v29);
      if (v26 == v22 || v25 < *((_DWORD *)v26 + 7))
LABEL_38:
        v26 = v22;
      v30 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGIONS_BY_RANGE, &v34) + 1;
      result = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::REGION_SIZE_METERS2, (int *)v20 + 8);
      if (v26 == v30)
        v31 = v5;
      else
        v31 = v4;
      *((double *)v20 + 5) = *((double *)v20 + 5) * (*(double *)result * dbl_19BF798B0[v26 == v30] / v31);
      v32 = (uint64_t *)v20[1];
      if (v32)
      {
        do
        {
          v33 = v32;
          v32 = (uint64_t *)*v32;
        }
        while (v32);
      }
      else
      {
        do
        {
          v33 = (uint64_t *)v20[2];
          v19 = *v33 == (_QWORD)v20;
          v20 = v33;
        }
        while (!v19);
      }
      v20 = v33;
    }
    while (v33 != v2 + 5);
  }
  return result;
}

void FullSharingImportanceEstimator::handleMeasurements(uint64_t **this, const NeighborMeasurements *a2)
{
  int v4;

  if (FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods((FullSharingImportanceEstimator *)this, *(double *)a2->var0.var0.var1.var0, 0) >= -0.5)
  {
    if (LOBYTE(a2[1].var0.var0.var1.var0[1]))
      FullSharingImportanceEstimator::incorporateFovDetector(this, BYTE1(a2[1].var0.var0.var1.var0[1]));
    if (LOBYTE(a2->var0.var0.var1.var0[1]) && BYTE1(a2->var0.var0.var1.var0[1]))
    {
      FullSharingImportanceEstimator::incorporatePreciseRangeAndAzimuth((FullSharingImportanceEstimator *)this, *(double *)&a2->var0.var0.var1.var0[2], *(double *)&a2[1].var0.var0.var0.var0.var1.var0);
    }
    else if (LOBYTE(a2->var0.var0.var1.var0[1]))
    {
      FullSharingImportanceEstimator::incorporatePreciseRangeOnly(this, *(double *)&a2->var0.var0.var1.var0[2]);
    }
    else if (a2[1].var0.var0.var0.var0.var0.var0[8])
    {
      FullSharingImportanceEstimator::incorporateCoarseRange((uint64_t *)this, HIDWORD(a2[1].var0.var0.var0.var0.var1.var1));
    }
    FullSharingImportanceEstimator::normalizeLikelihoods((uint64_t)this);
    v4 = *((_DWORD *)this + 6);
    if (!v4)
      this[1] = (uint64_t *)a2->var0.var0.var1.var0[0];
    *((_DWORD *)this + 6) = v4 + 1;
  }
}

void FullSharingImportanceEstimator::getImportanceEstimate(uint64_t a1, uint64_t a2, double a3)
{
  int *v5;
  double v6;
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  BOOL v11;
  int *v12;
  int *v13;
  uint64_t *v14;
  double v15;
  int *v16;
  int *v17;
  uint64_t (**v18)(FullSharingImportanceEstimator *__hidden);
  _BYTE v19[21];
  int *v20;
  _QWORD *v21[2];

  v18 = &off_1E3D04328;
  *(_OWORD *)v19 = *(_OWORD *)(a1 + 8);
  *(_QWORD *)&v19[13] = *(_QWORD *)(a1 + 21);
  std::map<Region,double>::map[abi:ne180100]((uint64_t *)&v20, a1 + 32);
  FullSharingImportanceEstimator::timeUpdateInRegionLikelihoods((FullSharingImportanceEstimator *)&v18, a3, 1);
  v5 = v20;
  if (v20 == (int *)v21)
  {
    *(_QWORD *)a2 = 0;
    v6 = 0.0;
  }
  else
  {
    v6 = 0.0;
    v7 = (double *)v20;
    do
    {
      v8 = (double *)*((_QWORD *)v7 + 1);
      v9 = v7;
      if (v8)
      {
        do
        {
          v10 = v8;
          v8 = *(double **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v10 = (double *)*((_QWORD *)v9 + 2);
          v11 = *(_QWORD *)v10 == (_QWORD)v9;
          v9 = v10;
        }
        while (!v11);
      }
      v6 = v6 + v7[5];
      v7 = v10;
    }
    while (v10 != (double *)v21);
    *(_QWORD *)a2 = 0;
    if (v5 != (int *)v21)
    {
      do
      {
        *(double *)a2 = *(double *)a2
                      + *(double *)std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, v5 + 8)* *((double *)v5 + 5)/ v6;
        v12 = (int *)*((_QWORD *)v5 + 1);
        if (v12)
        {
          do
          {
            v13 = v12;
            v12 = *(int **)v12;
          }
          while (v12);
        }
        else
        {
          do
          {
            v13 = (int *)*((_QWORD *)v5 + 2);
            v11 = *(_QWORD *)v13 == (_QWORD)v5;
            v5 = v13;
          }
          while (!v11);
        }
        v5 = v13;
      }
      while (v13 != (int *)v21);
      v5 = v20;
    }
  }
  *(_QWORD *)(a2 + 8) = 0;
  if (v5 == (int *)v21)
  {
    v15 = 0.0;
  }
  else
  {
    do
    {
      v14 = std::map<Region,double>::at((uint64_t)&FullSharingImportanceEstimator::IMPORTANCE_MAP, v5 + 8);
      v15 = *(double *)(a2 + 8)
          + (*(double *)v14 - *(double *)a2) * (*(double *)v14 - *(double *)a2) * (*((double *)v5 + 5) / v6);
      *(double *)(a2 + 8) = v15;
      v16 = (int *)*((_QWORD *)v5 + 1);
      if (v16)
      {
        do
        {
          v17 = v16;
          v16 = *(int **)v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          v17 = (int *)*((_QWORD *)v5 + 2);
          v11 = *(_QWORD *)v17 == (_QWORD)v5;
          v5 = v17;
        }
        while (!v11);
      }
      v5 = v17;
    }
    while (v17 != (int *)v21);
  }
  *(double *)(a2 + 8) = sqrt(v15);
  *(_BYTE *)(a2 + 16) = v19[20];
  v18 = &off_1E3D04328;
  std::__tree<Region>::destroy((uint64_t)&v20, v21[0]);
}

void sub_19BF4C01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _QWORD *a15)
{
  uint64_t v15;

  std::__tree<Region>::destroy(v15, a15);
  _Unwind_Resume(a1);
}

void FullSharingImportanceEstimator::~FullSharingImportanceEstimator(FullSharingImportanceEstimator *this)
{
  *(_QWORD *)this = &off_1E3D04328;
  std::__tree<Region>::destroy((uint64_t)this + 32, *((_QWORD **)this + 5));
}

{
  *(_QWORD *)this = &off_1E3D04328;
  std::__tree<Region>::destroy((uint64_t)this + 32, *((_QWORD **)this + 5));
  JUMPOUT(0x1A1ACFFFCLL);
}

_QWORD *std::vector<Region>::__init_with_size[abi:ne180100]<Region*,Region*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<Region>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19BF4C114(_Unwind_Exception *exception_object)
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

char *std::vector<Region>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Region>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Region>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t *std::set<Region>::set[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::set<Region>::insert[abi:ne180100]<std::__tree_const_iterator<Region,std::__tree_node<Region,void *> *,long>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_19BF4C1E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<Region>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::set<Region>::insert[abi:ne180100]<std::__tree_const_iterator<Region,std::__tree_node<Region,void *> *,long>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>(v5, v6, v4 + 7, v4 + 7);
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::map<Region,double>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_19BF4C478(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<Region>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<Region,std::vector<Region>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,std::vector<Region>> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_19BF4C4F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<Region,std::vector<Region>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[5];
    if (v3)
    {
      __p[6] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  void *v4;

  if (a2)
  {
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<Region,std::vector<Region>>,std::__map_value_compare<Region,std::__value_type<Region,std::vector<Region>>,std::less<Region>,true>,std::allocator<std::__value_type<Region,std::vector<Region>>>>::destroy(a1, a2[1]);
    v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

uint64_t std::map<Region,RegionBoundaries>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 40 * a3;
    do
    {
      std::__tree<std::__value_type<Region,RegionBoundaries>,std::__map_value_compare<Region,std::__value_type<Region,RegionBoundaries>,std::less<Region>,true>,std::allocator<std::__value_type<Region,RegionBoundaries>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,RegionBoundaries> const&>((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 10;
      v6 -= 40;
    }
    while (v6);
  }
  return a1;
}

void sub_19BF4C610(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<Region>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::set<Region>::set[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 4 * a3;
    do
    {
      std::__tree<Region>::__emplace_hint_unique_key_args<Region,Region const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      v6 -= 4;
    }
    while (v6);
  }
  return a1;
}

void sub_19BF4C68C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<Region>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<CoarseRange,std::set<Region>>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 32 * a3;
    do
    {
      std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::__emplace_hint_unique_key_args<CoarseRange,std::pair<CoarseRange const,std::set<Region>> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_19BF4C708(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<CoarseRange,std::set<Region>>,void *>>>::operator()[abi:ne180100](uint64_t a1, _QWORD **a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
    std::__tree<Region>::destroy((uint64_t)(a2 + 5), a2[6]);
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

void std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CoarseRange,std::set<Region>>,std::__map_value_compare<CoarseRange,std::__value_type<CoarseRange,std::set<Region>>,std::less<CoarseRange>,true>,std::allocator<std::__value_type<CoarseRange,std::set<Region>>>>::destroy(a1, a2[1]);
    std::__tree<Region>::destroy((uint64_t)(a2 + 5), (_QWORD *)a2[6]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_unique_key_args<Region,std::piecewise_construct_t const&,std::tuple<Region&&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

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
        v10 = *((_DWORD *)v6 + 8);
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
    v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E3D03E28, MEMORY[0x1E0DE42E0]);
}

void sub_19BF4C8B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

uint64_t *std::map<Region,double>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<Region,double>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_19BF4C924(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<Region>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<Region,double>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  int *v4;
  uint64_t **v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_hint_unique_key_args<Region,std::pair<Region const,double> const&>(v5, v6, v4 + 8, (_OWORD *)v4 + 2);
      v7 = (int *)*((_QWORD *)v4 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (int *)*((_QWORD *)v4 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<Region,double>,std::__tree_node<std::__value_type<Region,double>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t *v16;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v14 = result;
    v15 = v8;
    v16 = v8;
    if (v8)
    {
      v15 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          *((_DWORD *)v8 + 8) = *((_DWORD *)v9 + 8);
          v8[5] = v9[5];
          std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__node_insert_multi(v5, (uint64_t)v8);
          v8 = v15;
          v16 = v15;
          if (v15)
            v15 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v15);
          v10 = (_QWORD *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              v10 = (_QWORD *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v11 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v11);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_multi<std::pair<Region const,double> const&>(v5, (_OWORD *)a2 + 2);
      v12 = (_QWORD *)a2[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)a2[2];
          v11 = *v13 == (_QWORD)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_19BF4CB14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__node_insert_multi(uint64_t **a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;

  v3 = a1 + 1;
  v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        v3 = (uint64_t **)v4;
        if (*(_DWORD *)(a2 + 32) >= *((_DWORD *)v4 + 8))
          break;
        v4 = (uint64_t *)*v4;
        v5 = v3;
        if (!*v3)
          goto LABEL_8;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v5 = v3 + 1;
  }
  else
  {
    v5 = a1 + 1;
  }
LABEL_8:
  std::__tree<Region>::__insert_node_at(a1, (uint64_t)v3, v5, (uint64_t *)a2);
  return a2;
}

_QWORD *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<Region>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<Region>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

_OWORD *std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::__emplace_multi<std::pair<Region const,double> const&>(uint64_t **a1, _OWORD *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;

  v4 = operator new(0x30uLL);
  v5 = v4;
  v4[2] = *a2;
  v6 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        v6 = (uint64_t **)v7;
        if (*((_DWORD *)v4 + 8) >= *((_DWORD *)v7 + 8))
          break;
        v7 = (uint64_t *)*v7;
        v8 = v6;
        if (!*v6)
          goto LABEL_8;
      }
      v7 = (uint64_t *)v7[1];
    }
    while (v7);
    v8 = v6 + 1;
  }
  else
  {
    v8 = a1 + 1;
  }
LABEL_8:
  std::__tree<Region>::__insert_node_at(a1, (uint64_t)v6, v8, (uint64_t *)v4);
  return v5;
}

void SharingImportanceManager::SharingImportanceManager(SharingImportanceManager *this, char a2, char a3)
{
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 1) = 0;
  *(_QWORD *)this = (char *)this + 8;
  *((_WORD *)this + 12) = 0;
  SharingHysteresis::SharingHysteresis((SharingHysteresis *)((char *)this + 32));
  MagicHeadTieHysteresis::MagicHeadTieHysteresis((MagicHeadTieHysteresis *)((char *)this + 96));
  BigHeadTieHysteresis::BigHeadTieHysteresis((BigHeadTieHysteresis *)((char *)this + 184));
  *((_BYTE *)this + 24) = a2;
  *((_BYTE *)this + 25) = a3;
}

void sub_19BF4CD44(_Unwind_Exception *a1)
{
  uint64_t v1;
  SharingHysteresis *v2;
  MagicHeadTieHysteresis *v3;

  MagicHeadTieHysteresis::~MagicHeadTieHysteresis(v3);
  SharingHysteresis::~SharingHysteresis(v2);
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

void MagicHeadTieHysteresis::~MagicHeadTieHysteresis(MagicHeadTieHysteresis *this)
{
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 64, *((_QWORD **)this + 9));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 40, *((_QWORD **)this + 6));
}

void SharingHysteresis::~SharingHysteresis(SharingHysteresis *this)
{
  void **v2;

  v2 = (void **)((char *)this + 40);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 16);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
}

SharingImportanceManager *SharingImportanceManager::handleMeasurements(SharingImportanceManager *this, const SharingImportanceMeasurements *a2)
{
  __int128 *var0;
  NeighborMeasurements *end;
  SharingImportanceManager *v4;
  char *v5;
  FullSharingImportanceEstimator *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  __int128 *v10;

  var0 = (__int128 *)a2->userSharingInput.__begin_->var0.var0.var0.var0.var0.var0;
  end = a2->userSharingInput.__end_;
  if (a2->userSharingInput.__begin_ != end)
  {
    v4 = this;
    v5 = (char *)this + 8;
    do
    {
      if (v5 == (char *)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)v4, (const void **)var0))
      {
        if (*((_BYTE *)v4 + 24))
        {
          v6 = (FullSharingImportanceEstimator *)operator new();
          FullSharingImportanceEstimator::FullSharingImportanceEstimator(v6);
        }
        else
        {
          v6 = (FullSharingImportanceEstimator *)operator new();
          RangeAngleSharingImportanceEstimator::RangeAngleSharingImportanceEstimator(v6, *((_BYTE *)v4 + 25));
        }
        v10 = var0;
        v7 = std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v4, (const void **)var0, (uint64_t)&std::piecewise_construct, &v10);
        v8 = v7[7];
        v7[7] = (uint64_t)v6;
        if (v8)
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 32))(v8);
      }
      v10 = var0;
      v9 = std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v4, (const void **)var0, (uint64_t)&std::piecewise_construct, &v10);
      this = (SharingImportanceManager *)(*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v9[7] + 8))(v9[7], var0);
      var0 = (__int128 *)((char *)var0 + 88);
    }
    while (var0 != (__int128 *)end);
  }
  return this;
}

void sub_19BF4CF40(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 32))(v1);
  _Unwind_Resume(a1);
}

void SharingImportanceManager::getImportanceEstimates(uint64_t a1, uint64_t a2, double a3)
{
  _QWORD *v6;
  uint64_t *v7;
  std::string *v8;
  __int128 v9;
  uint64_t *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  std::string *v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;
  std::string *v19;
  int64x2_t v20;
  int64x2_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const void **v25;
  std::string *v26;
  unint64_t v27;
  __int128 *v28;

  v25 = 0;
  v26 = 0;
  v27 = 0;
  v6 = (_QWORD *)(a2 + 8);
  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a2, *(char **)(a2 + 8));
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = 0;
  *v6 = 0;
  v7 = *(uint64_t **)a1;
  if (*(_QWORD *)a1 != a1 + 8)
  {
    v20 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      if ((**(double (***)(uint64_t))v7[7])(v7[7]) >= a3 + -10.0)
      {
        v21 = v20;
        LOWORD(v22) = 0;
        *((_QWORD *)&v22 + 1) = 0x7FF4000000000000;
        LOWORD(v23) = 0;
        *((_QWORD *)&v23 + 1) = 0x7FF4000000000000;
        LODWORD(v24) = 3;
        *((_QWORD *)&v24 + 1) = 0x7FF4000000000000;
        (*(void (**)(uint64_t, int64x2_t *, double))(*(_QWORD *)v7[7] + 16))(v7[7], &v21, a3);
        v28 = (__int128 *)(v7 + 4);
        v10 = std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a2, (const void **)v7 + 4, (uint64_t)&std::piecewise_construct, &v28);
        v11 = v22;
        v13 = v23;
        v12 = v24;
        *(int64x2_t *)(v10 + 7) = v21;
        *(_OWORD *)(v10 + 9) = v11;
        *(_OWORD *)(v10 + 11) = v13;
        *(_OWORD *)(v10 + 13) = v12;
      }
      else
      {
        v8 = v26;
        if ((unint64_t)v26 >= v27)
        {
          v14 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v25, (__int128 *)v7 + 2);
        }
        else
        {
          if (*((char *)v7 + 55) < 0)
          {
            std::string::__init_copy_ctor_external(v26, (const std::string::value_type *)v7[4], v7[5]);
          }
          else
          {
            v9 = *((_OWORD *)v7 + 2);
            v26->__r_.__value_.__r.__words[2] = v7[6];
            *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
          }
          v14 = v8 + 1;
        }
        v26 = v14;
      }
      v15 = (uint64_t *)v7[1];
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (uint64_t *)v7[2];
          v17 = *v16 == (_QWORD)v7;
          v7 = v16;
        }
        while (!v17);
      }
      v7 = v16;
    }
    while (v16 != (uint64_t *)(a1 + 8));
    v18 = v25;
    v19 = v26;
    while (v18 != (const void **)v19)
    {
      std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__erase_unique<std::string>((uint64_t **)a1, v18);
      v18 += 3;
    }
  }
  SharingHysteresis::mitigateBackForthIssuesIfPossible(a1 + 32, (_QWORD *)a2, a3);
  MagicHeadTieHysteresis::mitigateMagicHeadBackForthIssuesIfPossible(a1 + 96, a2, a3);
  BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible((os_log_t *)(a1 + 184), (uint64_t **)a2, a3);
  SharingImportanceManager::quantizeOutputScores(a1, (_QWORD *)a2);
  v21.i64[0] = (uint64_t)&v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
}

void sub_19BF4D1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  a11 = (void **)&a20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a11);
  _Unwind_Resume(a1);
}

void SharingImportanceManager::quantizeOutputScores(uint64_t a1, _QWORD *a2)
{
  double v4;
  double v5;
  double BigHeadScore;
  double *v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double *v15;
  BOOL v16;

  MagicHeadTieHysteresis::getMagicHeadScore((MagicHeadTieHysteresis *)(a1 + 96));
  v5 = v4;
  BigHeadScore = BigHeadTieHysteresis::getBigHeadScore((BigHeadTieHysteresis *)(a1 + 184));
  v9 = (double *)*a2;
  v8 = (double *)(a2 + 1);
  v7 = v9;
  if (v9 != v8)
  {
    while (1)
    {
      v10 = v7[7];
      if (v5 != BigHeadScore)
        break;
      v11 = v10 / 0.01;
      if (v10 == v5)
        goto LABEL_7;
      v12 = floor(v11);
LABEL_8:
      v13 = v12 * 0.01;
LABEL_9:
      v7[7] = v13;
      v14 = (double *)*((_QWORD *)v7 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(double **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (double *)*((_QWORD *)v7 + 2);
          v16 = *(_QWORD *)v15 == (_QWORD)v7;
          v7 = v15;
        }
        while (!v16);
      }
      v7 = v15;
      if (v15 == v8)
        return;
    }
    if (v10 != v5)
    {
      v13 = floor(v10 / 0.01) * 0.01;
      if (v10 != BigHeadScore)
        v13 = fmax(v13 + -0.01, 0.0);
      goto LABEL_9;
    }
    v11 = v10 / 0.01;
LABEL_7:
    v12 = ceil(v11);
    goto LABEL_8;
  }
}

void std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 33) < 0)
      operator delete(*(void **)(i - 56));
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<Region>::__insert_node_at(a1, v11, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x40uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    *((_QWORD *)v6 + 6) = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  *((_QWORD *)v6 + 7) = 0;
  *(_BYTE *)(a3 + 16) = 1;
}

void sub_19BF4D748(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_19BF4D98C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v9, a2);
  result = *v6;
  if (!*v6)
  {
    std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)&v8);
    std::__tree<Region>::__insert_node_at(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

std::string *std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x78uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,NeighborImportanceEstimate>::pair[abi:ne180100]<std::string const&>((std::string *)(v6 + 32), *a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_19BF4DCEC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,NeighborImportanceEstimate>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,NeighborImportanceEstimate>::pair[abi:ne180100]<std::string const&>(std::string *this, __int128 *a2)
{
  __int128 v3;

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
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[1] = 0u;
  *(int64x2_t *)&this[1].__r_.__value_.__l.__data_ = vdupq_n_s64(0x7FF4000000000000uLL);
  this[2].__r_.__value_.__r.__words[0] = 0x7FF4000000000000;
  this[2].__r_.__value_.__r.__words[2] = 0x7FF4000000000000;
  this[3].__r_.__value_.__r.__words[0] = 0;
  LODWORD(this[3].__r_.__value_.__l.__data_) = 3;
  this[3].__r_.__value_.__l.__size_ = 0x7FF4000000000000;
  return this;
}

void std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,NeighborImportanceEstimate>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__erase_unique<std::string>(uint64_t **a1, const void **a2)
{
  uint64_t *v3;
  uint64_t *v4;

  v3 = (uint64_t *)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3)
    return 0;
  v4 = v3;
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__remove_node_pointer(a1, v3);
  std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<SharingImportanceEstimator>>,0>((uint64_t)(v4 + 4));
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void SimpleSharingImportanceEstimator::SimpleSharingImportanceEstimator(SimpleSharingImportanceEstimator *this)
{
  *(_QWORD *)this = &off_1E3D043F0;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = 0;
}

double SimpleSharingImportanceEstimator::getTime(SimpleSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

uint64_t SimpleSharingImportanceEstimator::handleMeasurements(uint64_t this, const NeighborMeasurements *a2)
{
  BOOL v2;
  char v3;

  *(_QWORD *)(this + 16) = a2->var0.var0.var1.var0[0];
  if (LOBYTE(a2->var0.var0.var1.var0[1]))
    v2 = *(double *)&a2->var0.var0.var1.var0[2] < 1.0;
  else
    v2 = 0;
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    v3 = a2[1].var0.var0.var0.var0.var0.var0[8];
    if (v3)
      v3 = HIDWORD(a2[1].var0.var0.var0.var0.var1.var1) == 0;
  }
  *(_BYTE *)(this + 8) = v3;
  return this;
}

uint64_t SimpleSharingImportanceEstimator::getImportanceEstimate(uint64_t result, uint64_t a2)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(result + 8))
    v2 = 0.0;
  *(double *)a2 = v2;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

void SimpleSharingImportanceEstimator::~SimpleSharingImportanceEstimator(SimpleSharingImportanceEstimator *this)
{
  JUMPOUT(0x1A1ACFFFCLL);
}

void SharingHysteresis::SharingHysteresis(SharingHysteresis *this)
{
  *(_QWORD *)this = 0x7FF4000000000000;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
}

void SharingHysteresis::populateCurrentDeviceScores(uint64_t *a1, _QWORD *a2)
{
  uint64_t *v4;
  __n128 v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64x2_t v18;
  std::string v19;
  int64x2_t v20;
  int64x2_t v21;

  v4 = a1 + 2;
  std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](a1 + 2);
  v8 = (_QWORD *)*a2;
  v6 = a2 + 1;
  v7 = v8;
  if (v8 != v6)
  {
    v18 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      memset(&v19, 0, sizeof(v19));
      v20 = v18;
      v21 = v18;
      std::string::operator=(&v19, (const std::string *)(v7 + 4));
      v5.n128_u64[0] = v7[7];
      v20.i64[0] = v5.n128_u64[0];
      v20.i64[1] = v5.n128_u64[0];
      v21 = 0uLL;
      if (*((_BYTE *)v7 + 72))
      {
        v9 = a1[3];
        if (v9 >= a1[4])
        {
          v10 = std::vector<SharingHysteresis::DeviceScore>::__push_back_slow_path<SharingHysteresis::DeviceScore const&>(v4, (__int128 *)&v19);
        }
        else
        {
          v5 = std::vector<SharingHysteresis::DeviceScore>::__construct_one_at_end[abi:ne180100]<SharingHysteresis::DeviceScore const&>((uint64_t)v4, (__int128 *)&v19);
          v10 = v9 + 56;
        }
        a1[3] = v10;
      }
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v19.__r_.__value_.__l.__data_);
      v11 = (_QWORD *)v7[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)v7[2];
          v13 = *v12 == (_QWORD)v7;
          v7 = v12;
        }
        while (!v13);
      }
      v7 = v12;
    }
    while (v12 != v6);
  }
  v14 = (uint64_t *)a1[2];
  v15 = a1[3];
  v16 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - (_QWORD)v14) >> 3));
  v19.__r_.__value_.__r.__words[0] = (std::string::size_type)compareByScore;
  if ((uint64_t *)v15 == v14)
    v17 = 0;
  else
    v17 = v16;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(v14, v15, (unsigned int (**)(uint64_t *, uint64_t *, __n128))&v19, v17, 1, v5);
}

void sub_19BF4F098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL compareByScore(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 24) > *(double *)(a2 + 24);
}

unint64_t SharingHysteresis::getCurrentRank(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  const void *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned __int8 **v11;
  unsigned __int8 *v12;
  int v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (*(_QWORD *)(a1 + 24) - v2) / 56;
  if (*(_QWORD *)(a1 + 24) != v2)
  {
    v5 = 0;
    v6 = a2[23];
    v8 = *(const void **)a2;
    v7 = *((_QWORD *)a2 + 1);
    if ((v6 & 0x80u) == 0)
      v9 = (unsigned __int8 *)a2[23];
    else
      v9 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
    if (v3 <= 1)
      v10 = 1;
    else
      v10 = (*(_QWORD *)(a1 + 24) - v2) / 56;
    do
    {
      v11 = (unsigned __int8 **)(v2 + 56 * v5);
      v12 = (unsigned __int8 *)*((unsigned __int8 *)v11 + 23);
      v13 = (char)v12;
      if ((char)v12 < 0)
        v12 = v11[1];
      if (v9 == v12)
      {
        if (v13 >= 0)
          v14 = (unsigned __int8 *)(v2 + 56 * v5);
        else
          v14 = *v11;
        if ((v6 & 0x80) != 0)
        {
          if (!memcmp(v8, v14, v7))
            return v5;
        }
        else
        {
          if (!(_DWORD)v6)
            return v5;
          v15 = a2;
          v16 = v6;
          while (*v15 == *v14)
          {
            ++v15;
            ++v14;
            if (!--v16)
              return v5;
          }
        }
      }
      ++v5;
    }
    while (v5 != v10);
  }
  return v3;
}

double SharingHysteresis::getScoreDelta(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)this + 3) - v2) >> 3) <= a2)
    SharingHysteresis::getScoreDelta();
  return vabdd_f64(*(double *)(v2 + 56 * a2 + 24), *(double *)(v2 + 56 * a2 + 32));
}

BOOL SharingHysteresis::belowTimeDeltaThreshold1(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2;
  __int128 *v4;
  __int128 v5;
  double PreviousSticknessDuration1;
  double v7;
  double v8;
  std::string __p;

  v2 = *((_QWORD *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)this + 3) - v2) >> 3) <= a2)
    SharingHysteresis::belowTimeDeltaThreshold1();
  v4 = (__int128 *)(v2 + 56 * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
  }
  else
  {
    v5 = *v4;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  }
  PreviousSticknessDuration1 = SharingHysteresis::getPreviousSticknessDuration1((uint64_t)this, (unsigned __int8 *)&__p);
  v7 = *(double *)this;
  v8 = *((double *)this + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return PreviousSticknessDuration1 + v7 - v8 < 4.5;
}

void sub_19BF4F2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double SharingHysteresis::getPreviousSticknessDuration1(uint64_t a1, unsigned __int8 *a2)
{
  double v2;
  __int128 *v3;
  __int128 *v4;
  double v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  std::string::size_type size;
  int v12;
  std::string *p_p;
  unsigned __int8 *v14;
  int v15;
  std::string __p;
  __int128 v18;
  double v19[3];

  v3 = *(__int128 **)(a1 + 40);
  v4 = *(__int128 **)(a1 + 48);
  v5 = 0.0;
  while (v3 != v4)
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
    }
    else
    {
      v7 = *v3;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
    }
    v8 = *(__int128 *)((char *)v3 + 40);
    v18 = *(__int128 *)((char *)v3 + 24);
    *(_OWORD *)v19 = v8;
    v9 = a2[23];
    if ((v9 & 0x80u) == 0)
      v10 = a2[23];
    else
      v10 = *((_QWORD *)a2 + 1);
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __p.__r_.__value_.__l.__size_;
    if (v10 != size)
      goto LABEL_21;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((v9 & 0x80) != 0)
    {
      if (memcmp(*(const void **)a2, p_p, *((_QWORD *)a2 + 1)))
        goto LABEL_21;
    }
    else if (a2[23])
    {
      v14 = a2;
      while (*v14 == p_p->__r_.__value_.__s.__data_[0])
      {
        ++v14;
        p_p = (std::string *)((char *)p_p + 1);
        if (!--v9)
          goto LABEL_26;
      }
LABEL_21:
      v15 = 0;
      if ((v12 & 0x80000000) == 0)
        goto LABEL_23;
LABEL_22:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_23;
    }
LABEL_26:
    v2 = v19[0];
    v15 = 1;
    if (v12 < 0)
      goto LABEL_22;
LABEL_23:
    if (v15)
      return v2;
    v3 = (__int128 *)((char *)v3 + 56);
  }
  return v5;
}

BOOL SharingHysteresis::belowTimeDeltaThreshold2(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2;
  __int128 *v4;
  __int128 v5;
  double PreviousSticknessDuration2;
  double v7;
  double v8;
  std::string __p;

  v2 = *((_QWORD *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)this + 3) - v2) >> 3) <= a2)
    SharingHysteresis::belowTimeDeltaThreshold2();
  v4 = (__int128 *)(v2 + 56 * a2);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
  }
  else
  {
    v5 = *v4;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v5;
  }
  PreviousSticknessDuration2 = SharingHysteresis::getPreviousSticknessDuration2((uint64_t)this, (unsigned __int8 *)&__p);
  v7 = *(double *)this;
  v8 = *((double *)this + 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return PreviousSticknessDuration2 + v7 - v8 < 1.5;
}

void sub_19BF4F514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double SharingHysteresis::getPreviousSticknessDuration2(uint64_t a1, unsigned __int8 *a2)
{
  double v2;
  __int128 *v3;
  __int128 *v4;
  double v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  std::string::size_type size;
  int v12;
  std::string *p_p;
  unsigned __int8 *v14;
  int v15;
  std::string __p;
  __int128 v18;
  __int128 v19;

  v3 = *(__int128 **)(a1 + 40);
  v4 = *(__int128 **)(a1 + 48);
  v5 = 0.0;
  while (v3 != v4)
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
    }
    else
    {
      v7 = *v3;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
    }
    v8 = *(__int128 *)((char *)v3 + 40);
    v18 = *(__int128 *)((char *)v3 + 24);
    v19 = v8;
    v9 = a2[23];
    if ((v9 & 0x80u) == 0)
      v10 = a2[23];
    else
      v10 = *((_QWORD *)a2 + 1);
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __p.__r_.__value_.__l.__size_;
    if (v10 != size)
      goto LABEL_21;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((v9 & 0x80) != 0)
    {
      if (memcmp(*(const void **)a2, p_p, *((_QWORD *)a2 + 1)))
        goto LABEL_21;
    }
    else if (a2[23])
    {
      v14 = a2;
      while (*v14 == p_p->__r_.__value_.__s.__data_[0])
      {
        ++v14;
        p_p = (std::string *)((char *)p_p + 1);
        if (!--v9)
          goto LABEL_26;
      }
LABEL_21:
      v15 = 0;
      if ((v12 & 0x80000000) == 0)
        goto LABEL_23;
LABEL_22:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_23;
    }
LABEL_26:
    v2 = *((double *)&v19 + 1);
    v15 = 1;
    if (v12 < 0)
      goto LABEL_22;
LABEL_23:
    if (v15)
      return v2;
    v3 = (__int128 *)((char *)v3 + 56);
  }
  return v5;
}

void SharingHysteresis::setStickinessDuration1(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2;
  __int128 *v5;
  __int128 v6;
  double v7;
  std::string __p;

  v2 = *((_QWORD *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)this + 3) - v2) >> 3) <= a2)
    SharingHysteresis::setStickinessDuration1();
  v5 = (__int128 *)(v2 + 56 * a2);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
  }
  else
  {
    v6 = *v5;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  v7 = SharingHysteresis::getPreviousSticknessDuration1((uint64_t)this, (unsigned __int8 *)&__p)
     + *(double *)this
     - *((double *)this + 1);
  if (v7 >= 4.5)
    __assert_rtn("setStickinessDuration1", "SharingHysteresis.cpp", 106, "curSticknessDuration1 < TIME_DELTA_THRESHOLD_1");
  *(double *)(*((_QWORD *)this + 2) + 56 * a2 + 40) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_19BF4F760(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::setStickinessDuration2(SharingHysteresis *this, unint64_t a2)
{
  uint64_t v2;
  __int128 *v5;
  __int128 v6;
  double v7;
  std::string __p;

  v2 = *((_QWORD *)this + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)this + 3) - v2) >> 3) <= a2)
    SharingHysteresis::setStickinessDuration2();
  v5 = (__int128 *)(v2 + 56 * a2);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
  }
  else
  {
    v6 = *v5;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v6;
  }
  v7 = SharingHysteresis::getPreviousSticknessDuration2((uint64_t)this, (unsigned __int8 *)&__p)
     + *(double *)this
     - *((double *)this + 1);
  if (v7 >= 1.5)
    __assert_rtn("setStickinessDuration2", "SharingHysteresis.cpp", 115, "curSticknessDuration2 < TIME_DELTA_THRESHOLD_2");
  *(double *)(*((_QWORD *)this + 2) + 56 * a2 + 48) = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_19BF4F86C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::setStickinessDuration(SharingHysteresis *this, unint64_t a2)
{
  double ScoreDelta;

  ScoreDelta = SharingHysteresis::getScoreDelta(this, a2);
  if (ScoreDelta >= 0.02)
    SharingHysteresis::setStickinessDuration();
  SharingHysteresis::setStickinessDuration1(this, a2);
  if (ScoreDelta >= 0.01)
    SharingHysteresis::setStickinessDuration2(this, a2);
}

uint64_t SharingHysteresis::canSwap(SharingHysteresis *this, unint64_t a2)
{
  double ScoreDelta;
  uint64_t result;
  int v6;

  ScoreDelta = SharingHysteresis::getScoreDelta(this, a2);
  if (ScoreDelta >= 0.02)
    return 0;
  LODWORD(result) = SharingHysteresis::belowTimeDeltaThreshold1(this, a2);
  v6 = result;
  if (ScoreDelta < 0.01)
    result = result;
  else
    result = 0;
  if (ScoreDelta >= 0.01 && v6 != 0)
    return SharingHysteresis::belowTimeDeltaThreshold2(this, a2);
  return result;
}

double SharingHysteresis::swapScore(SharingHysteresis *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_QWORD *)this + 2);
  v4 = v3 + 56 * a3;
  result = *(double *)(v4 + 32);
  v6 = v3 + 56 * a2;
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(v6 + 32);
  *(double *)(v6 + 32) = result;
  return result;
}

void SharingHysteresis::swapDeviceInfo(SharingHysteresis *this, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unsigned __int8 *v19;
  unsigned __int8 **v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  unsigned __int8 *v25;
  std::string __p;
  __int128 v27;
  __int128 v28;

  v6 = *((_QWORD *)this + 2);
  v7 = (__int128 *)(v6 + 56 * a2);
  if (*((char *)v7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    v9 = *((_QWORD *)this + 2);
  }
  else
  {
    v8 = *v7;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
    v9 = v6;
  }
  v10 = 56 * a2;
  v11 = v6 + 56 * a2;
  v12 = *(_OWORD *)(v11 + 24);
  v28 = *(_OWORD *)(v11 + 40);
  v27 = v12;
  std::string::operator=((std::string *)(v9 + 56 * a2), (const std::string *)(v9 + 56 * a3));
  v13 = v9 + 56 * a2;
  v14 = v9 + 56 * a3;
  v15 = *(_OWORD *)(v14 + 24);
  *(_OWORD *)(v13 + 40) = *(_OWORD *)(v14 + 40);
  *(_OWORD *)(v13 + 24) = v15;
  v16 = *((_QWORD *)this + 2);
  std::string::operator=((std::string *)(v16 + 56 * a3), &__p);
  v17 = v16 + 56 * a3;
  v18 = v27;
  *(_OWORD *)(v17 + 40) = v28;
  *(_OWORD *)(v17 + 24) = v18;
  v19 = (unsigned __int8 *)(*((_QWORD *)this + 2) + v10);
  v20 = (unsigned __int8 **)(*((_QWORD *)this + 5) + v10);
  v21 = v19[23];
  if ((v21 & 0x80u) == 0)
    v22 = (unsigned __int8 *)v19[23];
  else
    v22 = (unsigned __int8 *)*((_QWORD *)v19 + 1);
  v23 = (unsigned __int8 *)*((unsigned __int8 *)v20 + 23);
  v24 = (char)v23;
  if ((char)v23 < 0)
    v23 = v20[1];
  if (v22 != v23)
    goto LABEL_22;
  if (v24 >= 0)
    v25 = (unsigned __int8 *)(*((_QWORD *)this + 5) + v10);
  else
    v25 = *v20;
  if ((v21 & 0x80) != 0)
  {
    if (memcmp(*(const void **)v19, v25, *((_QWORD *)v19 + 1)))
      goto LABEL_22;
  }
  else if (v19[23])
  {
    while (*v19 == *v25)
    {
      ++v19;
      ++v25;
      if (!--v21)
        goto LABEL_19;
    }
LABEL_22:
    __assert_rtn("swapDeviceInfo", "SharingHysteresis.cpp", 155, "currentDeviceScores[previousRank].deviceID == previousDeviceScores[previousRank].deviceID");
  }
LABEL_19:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_19BF4FB58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SharingHysteresis::overwriteOutputScores(uint64_t a1, _QWORD *a2)
{
  __int128 *v2;
  __int128 *v3;
  _QWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  __int128 v11;
  std::string::size_type size;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  std::string *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  BOOL v20;
  std::string v22;
  __int128 v23;
  __int128 v24;

  v2 = *(__int128 **)(a1 + 16);
  v3 = *(__int128 **)(a1 + 24);
  if (v2 != v3)
  {
    v4 = a2 + 1;
    while (1)
    {
      if (*((char *)v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
      }
      else
      {
        v5 = *v2;
        v22.__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
        *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v5;
      }
      v6 = *(__int128 *)((char *)v2 + 40);
      v23 = *(__int128 *)((char *)v2 + 24);
      v24 = v6;
      v7 = *((_QWORD *)&v23 + 1);
      if (vabdd_f64(*(double *)&v23, *((double *)&v23 + 1)) >= 0.000001)
        break;
      LOBYTE(v8) = *((_BYTE *)&v22.__r_.__value_.__s + 23);
LABEL_32:
      if ((v8 & 0x80) != 0)
        operator delete(v22.__r_.__value_.__l.__data_);
      v2 = (__int128 *)((char *)v2 + 56);
      if (v2 == v3)
        return;
    }
    v9 = (_QWORD *)*a2;
    v10 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    v8 = SHIBYTE(v22.__r_.__value_.__r.__words[2]);
    if ((_QWORD *)*a2 == v4)
      goto LABEL_32;
    v11 = *(_OWORD *)&v22.__r_.__value_.__l.__data_;
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    else
      size = v22.__r_.__value_.__l.__size_;
    while (1)
    {
      v13 = *((unsigned __int8 *)v9 + 55);
      v14 = (char)v13;
      if ((v13 & 0x80u) != 0)
        v13 = v9[5];
      if (size != v13)
        goto LABEL_26;
      v15 = v14 >= 0 ? (unsigned __int8 *)(v9 + 4) : (unsigned __int8 *)v9[4];
      if ((v8 & 0x80000000) == 0)
        break;
      if (!memcmp((const void *)v11, v15, *((size_t *)&v11 + 1)))
        goto LABEL_25;
LABEL_26:
      v18 = (_QWORD *)v9[1];
      if (v18)
      {
        do
        {
          v19 = v18;
          v18 = (_QWORD *)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (_QWORD *)v9[2];
          v20 = *v19 == (_QWORD)v9;
          v9 = v19;
        }
        while (!v20);
      }
      v9 = v19;
      if (v19 == v4)
        goto LABEL_32;
    }
    if (v8)
    {
      v16 = &v22;
      v17 = v10;
      while (v16->__r_.__value_.__s.__data_[0] == *v15)
      {
        v16 = (std::string *)((char *)v16 + 1);
        ++v15;
        if (!--v17)
          goto LABEL_25;
      }
      goto LABEL_26;
    }
LABEL_25:
    v9[7] = v7;
    goto LABEL_26;
  }
}

uint64_t SharingHysteresis::sanityCheckSwappedScores(uint64_t this)
{
  uint64_t v1;
  unint64_t v2;
  double v3;
  unint64_t v4;
  double *v5;
  double v6;

  v1 = *(_QWORD *)(this + 16);
  v2 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(this + 24) - v1) >> 3);
  if (v2 >= 2)
  {
    v3 = *(double *)(v1 + 32);
    v4 = v2 - 1;
    v5 = (double *)(v1 + 88);
    do
    {
      v6 = v3;
      v3 = *v5;
      if (v6 < *v5)
        SharingHysteresis::sanityCheckSwappedScores();
      v5 += 7;
      --v4;
    }
    while (v4);
  }
  return this;
}

void SharingHysteresis::mitigateBackForthIssuesIfPossible(uint64_t a1, _QWORD *a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 *v10;
  __int128 v11;
  unint64_t CurrentRank;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int canSwap;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::string __p;

  *(double *)a1 = a3;
  if (*(double *)(a1 + 8) <= a3)
  {
    SharingHysteresis::populateCurrentDeviceScores((uint64_t *)a1, a2);
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a1 + 24))
    {
      std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100]((uint64_t *)(a1 + 40));
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(a1 + 48) != v5)
      {
        v6 = 0;
        v7 = 0;
        while (1)
        {
          v8 = *(_QWORD *)(a1 + 16);
          v9 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 24) - v8) >> 3);
          if (v7 >= v9)
            break;
          v10 = (__int128 *)(v5 + v6);
          if (*((char *)v10 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
            v8 = *(_QWORD *)(a1 + 16);
            v9 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 24) - v8) >> 3);
          }
          else
          {
            v11 = *v10;
            __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v10 + 2);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
          }
          CurrentRank = SharingHysteresis::getCurrentRank(a1, (unsigned __int8 *)&__p);
          if (CurrentRank == v9)
            goto LABEL_18;
          v13 = CurrentRank;
          if (v7 > CurrentRank)
            __assert_rtn("mitigateBackForthIssuesIfPossible", "SharingHysteresis.cpp", 238, "previousRank <= currentRank");
          if (v7 == CurrentRank)
          {
            v14 = 4;
          }
          else
          {
            v15 = *(_QWORD *)(v8 + v6 + 32);
            v16 = v8 + 56 * CurrentRank;
            *(_QWORD *)(v8 + v6 + 32) = *(_QWORD *)(v16 + 32);
            *(_QWORD *)(v16 + 32) = v15;
            canSwap = SharingHysteresis::canSwap((SharingHysteresis *)a1, v7);
            if (!canSwap || !SharingHysteresis::canSwap((SharingHysteresis *)a1, v13))
            {
              v18 = *(_QWORD *)(a1 + 16);
              v19 = v18 + 56 * v13;
              v20 = *(_QWORD *)(v19 + 32);
              v21 = v18 + v6;
              *(_QWORD *)(v19 + 32) = *(_QWORD *)(v21 + 32);
              *(_QWORD *)(v21 + 32) = v20;
LABEL_18:
              v14 = 2;
              goto LABEL_19;
            }
            SharingHysteresis::swapDeviceInfo((SharingHysteresis *)a1, v7, v13);
            SharingHysteresis::setStickinessDuration((SharingHysteresis *)a1, v7);
            SharingHysteresis::setStickinessDuration((SharingHysteresis *)a1, v13);
            v14 = 0;
          }
LABEL_19:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          if ((v14 | 4) == 4)
          {
            ++v7;
            v5 = *(_QWORD *)(a1 + 40);
            v6 += 56;
            if (v7 < 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 48) - v5) >> 3))
              continue;
          }
          break;
        }
      }
      SharingHysteresis::sanityCheckSwappedScores(a1);
      SharingHysteresis::overwriteOutputScores(a1, a2);
      std::vector<SharingHysteresis::DeviceScore>::__assign_with_size[abi:ne180100]<SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(a1 + 40, *(std::string **)(a1 + 16), *(__int128 **)(a1 + 24), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3));
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1;
    }
  }
}

void sub_19BF4FFE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__n128 std::vector<SharingHysteresis::DeviceScore>::__construct_one_at_end[abi:ne180100]<SharingHysteresis::DeviceScore const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  result = *(__n128 *)((char *)a2 + 24);
  *(_OWORD *)(v4 + 40) = *(__int128 *)((char *)a2 + 40);
  *(__n128 *)(v4 + 24) = result;
  *(_QWORD *)(a1 + 8) = v4 + 56;
  return result;
}

void sub_19BF5006C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<SharingHysteresis::DeviceScore>::__push_back_slow_path<SharingHysteresis::DeviceScore const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v17[2];
  std::string *v18;
  char *v19;
  uint64_t *v20;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x492492492492492)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x249249249249249)
    v9 = 0x492492492492492;
  else
    v9 = v5;
  v20 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[56 * v4];
  v17[0] = v10;
  v17[1] = v11;
  v18 = v11;
  v19 = &v10[56 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v18;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v13 = &v10[56 * v4];
  v14 = *(__int128 *)((char *)a2 + 24);
  *(_OWORD *)(v13 + 40) = *(__int128 *)((char *)a2 + 40);
  *(_OWORD *)(v13 + 24) = v14;
  v18 = (std::string *)((char *)v11 + 56);
  std::vector<SharingHysteresis::DeviceScore>::__swap_out_circular_buffer(a1, v17);
  v15 = a1[1];
  std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer((uint64_t)v17);
  return v15;
}

void sub_19BF501B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<SharingHysteresis::DeviceScore>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 56);
      *(_QWORD *)(v9 - 40) = *(_QWORD *)(a3 - 40);
      *(_OWORD *)(v9 - 56) = v10;
      *(_QWORD *)(a3 - 48) = 0;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 56) = 0;
      v11 = *(_OWORD *)(a3 - 16);
      *(_OWORD *)(v9 - 32) = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 16) = v11;
      v9 -= 56;
      v7 -= 56;
      a3 -= 56;
    }
    while (a3 != a5);
    *((_QWORD *)&v16 + 1) = v9;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,std::reverse_iterator<SharingHysteresis::DeviceScore*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 56;
  }
}

uint64_t std::__split_buffer<SharingHysteresis::DeviceScore>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<SharingHysteresis::DeviceScore>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<SharingHysteresis::DeviceScore>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 7;
      *(_QWORD *)(a1 + 16) = v2 - 7;
      if (*((char *)v2 - 33) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(uint64_t *a1, unint64_t a2, unsigned int (**a3)(uint64_t *, uint64_t *, __n128), uint64_t a4, char a5, __n128 a6)
{
  __int128 *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __n128 v18;
  char v19;
  uint64_t *v20;
  char v21;
  _BOOL4 v22;
  unsigned int (*v23)(uint64_t *, uint64_t *, __n128);
  uint64_t *v24;
  unint64_t v25;
  uint64_t *v26;

  v8 = (__int128 *)a2;
  v9 = a1;
  v25 = a2;
  v26 = a1;
  while (2)
  {
    v10 = 1 - a4;
LABEL_3:
    v11 = (char *)v8 - (char *)v9;
    v12 = 0x6DB6DB6DB6DB6DB7 * (((char *)v8 - (char *)v9) >> 3);
    switch(v12)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v23 = *a3;
        v25 = (unint64_t)v8 - 56;
        if (((unsigned int (*)(void))v23)())
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v26, (uint64_t *)&v25);
        return;
      case 3uLL:
        v25 = (unint64_t)v8 - 56;
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v9, v9 + 7, (uint64_t)v8 - 56, a3);
        return;
      case 4uLL:
        v25 = (unint64_t)v8 - 56;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v9, v9 + 7, v9 + 14, (uint64_t)v8 - 56, a3);
        return;
      case 5uLL:
        v25 = (unint64_t)v8 - 56;
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v9, v9 + 7, v9 + 14, v9 + 21, (uint64_t)v8 - 56, a3);
        return;
      default:
        if (v11 <= 1343)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v9, v8, (uint64_t (**)(__int128 *, uint64_t))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((__int128 *)v9, v8, (uint64_t (**)(__int128 *, uint64_t))a3);
          return;
        }
        if (v10 == 1)
        {
          if (v9 != (uint64_t *)v8)
            std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>((__int128 *)v9, (uint64_t *)v8, (uint64_t *)v8, (unsigned int (**)(int64_t, uint64_t))a3, a6);
          return;
        }
        v13 = v12 >> 1;
        v14 = (uint64_t)v8 - 56;
        if ((unint64_t)v11 < 0x1C01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(&v9[7 * (v12 >> 1)], v9, v14, a3);
          if ((a5 & 1) != 0)
          {
LABEL_11:
            v8 = (__int128 *)v25;
            goto LABEL_12;
          }
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v9, &v9[7 * (v12 >> 1)], v14, a3);
          v15 = 7 * v13;
          v16 = 56 * v13 - 56;
          v17 = v25;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v26 + 7, (uint64_t *)((char *)v26 + v16), v25 - 112, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v26 + 14, &v26[v15 + 7], v17 - 168, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t *)((char *)v26 + v16), &v26[v15], (uint64_t)&v26[v15 + 7], a3);
          v24 = &v26[v15];
          v18 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v26, (uint64_t *)&v24);
          if ((a5 & 1) != 0)
            goto LABEL_11;
        }
        v19 = ((uint64_t (*)(uint64_t *, __n128))*a3)(v26 - 7, v18);
        v8 = (__int128 *)v25;
        if ((v19 & 1) == 0)
        {
          v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>((uint64_t)v26, v25, (unsigned int (**)(void **, __n128))a3);
          goto LABEL_20;
        }
LABEL_12:
        v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>((uint64_t)v26, (unint64_t)v8, (uint64_t (**)(void))a3);
        if ((v21 & 1) == 0)
          goto LABEL_19;
        v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v26, (uint64_t)v20, a3);
        v9 = v20 + 7;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(v20 + 7, (uint64_t)v8, a3))
        {
          if (v22)
          {
            v26 = v20 + 7;
            goto LABEL_18;
          }
LABEL_19:
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,false>(v26, v20, a3, -v10, a5 & 1);
          v9 = v20 + 7;
LABEL_20:
          a5 = 0;
          v26 = v9;
          a4 = -v10;
          continue;
        }
        if (!v22)
        {
          v25 = (unint64_t)v20;
          v9 = v26;
          v8 = (__int128 *)v20;
LABEL_18:
          ++v10;
          goto LABEL_3;
        }
        return;
    }
  }
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  _BYTE v11[15];

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  *(_QWORD *)v11 = (*a1)[1];
  *(_QWORD *)&v11[7] = *(uint64_t *)((char *)*a1 + 15);
  v5 = *((_BYTE *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  v9 = *(__n128 *)(v2 + 3);
  v10 = *(_OWORD *)(v2 + 5);
  v6 = *(_QWORD *)(v3 + 16);
  *(_OWORD *)v2 = *(_OWORD *)v3;
  v2[2] = v6;
  *(_BYTE *)(v3 + 23) = 0;
  *(_BYTE *)v3 = 0;
  v7 = *(_OWORD *)(v3 + 40);
  *(_OWORD *)(v2 + 3) = *(_OWORD *)(v3 + 24);
  *(_OWORD *)(v2 + 5) = v7;
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  *(_QWORD *)v3 = v4;
  *(_QWORD *)(v3 + 8) = *(_QWORD *)v11;
  *(_QWORD *)(v3 + 15) = *(_QWORD *)&v11[7];
  *(_BYTE *)(v3 + 23) = v5;
  result = v9;
  *(__n128 *)(v3 + 24) = v9;
  *(_OWORD *)(v3 + 40) = v10;
  return result;
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, __int128 *a2, uint64_t (**a3)(__int128 *, uint64_t))
{
  __int128 *v5;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  char v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;

  if ((__int128 *)a1 != a2)
  {
    v5 = (__int128 *)(a1 + 56);
    if ((__int128 *)(a1 + 56) != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = v5;
        if ((*a3)(v5, v8))
        {
          v20 = *v9;
          v21 = *((_QWORD *)v9 + 2);
          *((_QWORD *)v9 + 1) = 0;
          *((_QWORD *)v9 + 2) = 0;
          *(_QWORD *)v9 = 0;
          v10 = *(_OWORD *)(v8 + 96);
          v22 = *(_OWORD *)(v8 + 80);
          v23 = v10;
          v11 = v7;
          while (1)
          {
            v12 = v11;
            v13 = a1 + v11;
            v14 = a1 + v11 + 56;
            if (*(char *)(a1 + v11 + 79) < 0)
              operator delete(*(void **)v14);
            *(_OWORD *)v14 = *(_OWORD *)v13;
            *(_QWORD *)(v14 + 16) = *(_QWORD *)(v13 + 16);
            *(_BYTE *)(v13 + 23) = 0;
            *(_BYTE *)v13 = 0;
            v15 = *(_OWORD *)(v13 + 40);
            *(_OWORD *)(v13 + 80) = *(_OWORD *)(v13 + 24);
            *(_OWORD *)(v13 + 96) = v15;
            if (!v12)
              break;
            v16 = (*a3)(&v20, a1 + v12 - 56);
            v11 = v12 - 56;
            if ((v16 & 1) == 0)
            {
              v17 = a1 + v12;
              goto LABEL_12;
            }
          }
          v17 = a1;
LABEL_12:
          if (*(char *)(v17 + 23) < 0)
            operator delete(*(void **)v17);
          v18 = (_OWORD *)(a1 + v12 + 24);
          *(_OWORD *)v17 = v20;
          *(_QWORD *)(v17 + 16) = v21;
          v19 = v23;
          *v18 = v22;
          v18[1] = v19;
        }
        v5 = (__int128 *)((char *)v9 + 56);
        v7 += 56;
        v8 = (uint64_t)v9;
      }
      while ((__int128 *)((char *)v9 + 56) != a2);
    }
  }
}

void sub_19BF50950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, uint64_t))
{
  __int128 *v4;
  __int128 *v5;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  void **v11;
  __int128 v12;
  char v13;
  void **v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  if (a1 != a2)
  {
    v4 = a1;
    v5 = (__int128 *)((char *)a1 + 56);
    if ((__int128 *)((char *)a1 + 56) != a2)
    {
      v7 = (uint64_t)a1 - 56;
      do
      {
        v8 = v5;
        if ((*a3)(v5, (uint64_t)v4))
        {
          v16 = *v8;
          v17 = *((_QWORD *)v8 + 2);
          *((_QWORD *)v8 + 1) = 0;
          *((_QWORD *)v8 + 2) = 0;
          *(_QWORD *)v8 = 0;
          v9 = v4[6];
          v18 = v4[5];
          v19 = v9;
          v10 = v7;
          do
          {
            v11 = (void **)(v10 + 112);
            if (*(char *)(v10 + 135) < 0)
              operator delete(*v11);
            *(_OWORD *)v11 = *(_OWORD *)(v10 + 56);
            *(_QWORD *)(v10 + 128) = *(_QWORD *)(v10 + 72);
            *(_BYTE *)(v10 + 79) = 0;
            *(_BYTE *)(v10 + 56) = 0;
            v12 = *(_OWORD *)(v10 + 96);
            *(_OWORD *)(v10 + 136) = *(_OWORD *)(v10 + 80);
            *(_OWORD *)(v10 + 152) = v12;
            v13 = (*a3)(&v16, v10);
            v10 -= 56;
          }
          while ((v13 & 1) != 0);
          v14 = (void **)(v10 + 112);
          if (*(char *)(v10 + 135) < 0)
            operator delete(*v14);
          *(_OWORD *)v14 = v16;
          *(_QWORD *)(v10 + 128) = v17;
          v15 = v19;
          *(_OWORD *)(v10 + 136) = v18;
          *(_OWORD *)(v10 + 152) = v15;
        }
        v5 = (__int128 *)((char *)v8 + 56);
        v7 += 56;
        v4 = v8;
      }
      while ((__int128 *)((char *)v8 + 56) != a2);
    }
  }
}

void sub_19BF50AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t a3, unsigned int (**a4)(uint64_t *, uint64_t *, __n128))
{
  char v7;
  uint64_t result;
  __n128 v9;
  uint64_t **v10;
  uint64_t *v11;
  __n128 v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;

  v14 = a2;
  v15 = a1;
  v13 = (uint64_t *)a3;
  v7 = ((uint64_t (*)(uint64_t *, uint64_t *))*a4)(a2, a1);
  result = ((uint64_t (*)(uint64_t, uint64_t *))*a4)(a3, a2);
  if ((v7 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    v9 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v14, (uint64_t *)&v13);
    if (!(*a4)(v14, v15, v9))
      return 1;
    v10 = &v15;
    v11 = (uint64_t *)&v14;
    goto LABEL_9;
  }
  if (!(_DWORD)result)
  {
    v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v14);
    if (!(*a4)(v13, v14, v12))
      return 1;
    v10 = &v14;
    v11 = (uint64_t *)&v13;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(v10, v11);
    return 2;
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v13);
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>(uint64_t a1, unint64_t a2, unsigned int (**a3)(void **, __n128))
{
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  unint64_t v8;
  __n128 v9;
  void **v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t *v15;
  void *__p[2];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  uint64_t *v22;

  v22 = (uint64_t *)a1;
  v21 = a2;
  *(_OWORD *)__p = *(_OWORD *)a1;
  v18 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  v19 = *(_OWORD *)(a1 + 24);
  v20 = *(_OWORD *)(a1 + 40);
  if ((((uint64_t (*)(void **, unint64_t))*a3)(__p, a2 - 56) & 1) != 0)
  {
    v5 = (uint64_t *)a1;
    do
    {
      v5 += 7;
      v22 = v5;
    }
    while ((((uint64_t (*)(void **, uint64_t *))*a3)(__p, v5) & 1) == 0);
  }
  else
  {
    v6 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = v6;
      v22 = v6;
      if ((unint64_t)v6 >= v21)
        break;
      v7 = ((uint64_t (*)(void **, uint64_t *))*a3)(__p, v6);
      v6 = v5 + 7;
    }
    while (!v7);
  }
  v8 = v21;
  if ((unint64_t)v5 < v21)
  {
    do
    {
      v8 -= 56;
      v21 = v8;
    }
    while ((((uint64_t (*)(void **, unint64_t))*a3)(__p, v8) & 1) != 0);
    v5 = v22;
  }
  if ((unint64_t)v5 < v8)
  {
    do
    {
      v9 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v22, (uint64_t *)&v21);
      do
        v22 += 7;
      while (!(*a3)(__p, v9));
      do
        v21 -= 56;
      while ((((uint64_t (*)(void **))*a3)(__p) & 1) != 0);
      v5 = v22;
    }
    while ((unint64_t)v22 < v21);
  }
  v10 = (void **)(v5 - 7);
  if (v5 - 7 != (uint64_t *)a1)
  {
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    v11 = *(_OWORD *)v10;
    *(_QWORD *)(a1 + 16) = *(v5 - 5);
    *(_OWORD *)a1 = v11;
    *((_BYTE *)v5 - 33) = 0;
    *((_BYTE *)v5 - 56) = 0;
    v12 = *((_OWORD *)v5 - 1);
    *(_OWORD *)(a1 + 24) = *((_OWORD *)v5 - 2);
    *(_OWORD *)(a1 + 40) = v12;
  }
  if (*((char *)v5 - 33) < 0)
    operator delete(*v10);
  v13 = *(_OWORD *)__p;
  *(v5 - 5) = v18;
  *(_OWORD *)v10 = v13;
  HIBYTE(v18) = 0;
  LOBYTE(__p[0]) = 0;
  v14 = v20;
  *((_OWORD *)v5 - 2) = v19;
  *((_OWORD *)v5 - 1) = v14;
  v15 = v22;
  if (SHIBYTE(v18) < 0)
    operator delete(__p[0]);
  return v15;
}

void sub_19BF50D80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,SharingHysteresis::DeviceScore *,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&)>(uint64_t a1, unint64_t a2, uint64_t (**a3)(void))
{
  uint64_t v5;
  _OWORD *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t *v10;
  uint64_t (*v11)(void);
  uint64_t *v12;
  __n128 v13;
  void **v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  uint64_t *v25;

  v5 = 0;
  v24 = a2;
  *(_OWORD *)__p = *(_OWORD *)a1;
  v21 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  v6 = (_OWORD *)(a1 + 24);
  v22 = *(_OWORD *)(a1 + 24);
  v23 = *(_OWORD *)(a1 + 40);
  do
  {
    v25 = (uint64_t *)(a1 + v5 + 56);
    v5 += 56;
  }
  while (((*a3)() & 1) != 0);
  v7 = v24;
  if (v5 == 56)
  {
    v10 = (uint64_t *)(a1 + 56);
    do
    {
      if ((unint64_t)v10 >= v7)
        break;
      v11 = *a3;
      v7 -= 56;
      v24 = v7;
    }
    while ((((uint64_t (*)(unint64_t, void **))v11)(v7, __p) & 1) == 0);
  }
  else
  {
    v8 = v24 - 56;
    do
    {
      v24 = v8;
      v9 = ((uint64_t (*)(unint64_t, void **))*a3)(v8, __p);
      v8 -= 56;
    }
    while (!v9);
    v10 = v25;
  }
  v12 = v10;
  if ((unint64_t)v10 < v24)
  {
    do
    {
      v13 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v25, (uint64_t *)&v24);
      do
        v25 += 7;
      while ((((uint64_t (*)(__n128))*a3)(v13) & 1) != 0);
      do
        v24 -= 56;
      while (!(*a3)());
      v12 = v25;
    }
    while ((unint64_t)v25 < v24);
  }
  v14 = (void **)(v12 - 7);
  if (v12 - 7 != (uint64_t *)a1)
  {
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    v15 = *(_OWORD *)v14;
    *(_QWORD *)(a1 + 16) = *(v12 - 5);
    *(_OWORD *)a1 = v15;
    *((_BYTE *)v12 - 33) = 0;
    *((_BYTE *)v12 - 56) = 0;
    v16 = *((_OWORD *)v12 - 1);
    *v6 = *((_OWORD *)v12 - 2);
    v6[1] = v16;
  }
  if (*((char *)v12 - 33) < 0)
    operator delete(*v14);
  v17 = *(_OWORD *)__p;
  *(v12 - 5) = v21;
  *(_OWORD *)v14 = v17;
  HIBYTE(v21) = 0;
  LOBYTE(__p[0]) = 0;
  v18 = v23;
  *((_OWORD *)v12 - 2) = v22;
  *((_OWORD *)v12 - 1) = v18;
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  return v12 - 7;
}

void sub_19BF50F90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t a2, unsigned int (**a3)(uint64_t *, uint64_t *, __n128))
{
  uint64_t v6;
  _BOOL8 result;
  unsigned int (*v8)(uint64_t *, uint64_t *, __n128);
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  __int128 v12;
  uint64_t *v13;
  uint64_t *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t *v22;
  uint64_t *v23;

  v23 = a1;
  v22 = (uint64_t *)a2;
  v6 = 0x6DB6DB6DB6DB6DB7 * ((a2 - (uint64_t)a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v22 = (uint64_t *)(a2 - 56);
      if (((unsigned int (*)(void))v8)())
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v23, (uint64_t *)&v22);
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a2 - 56, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a1 + 14, a2 - 56, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, a1 + 14, a1 + 21, a2 - 56, a3);
      return 1;
    default:
      v9 = a1 + 14;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a1 + 7, (uint64_t)(a1 + 14), a3);
      v10 = a1 + 21;
      if (v10 == (uint64_t *)a2)
        return 1;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(uint64_t *, uint64_t *))*a3)(v10, v9))
    {
      v18 = *(_OWORD *)v10;
      v19 = v10[2];
      v10[1] = 0;
      v10[2] = 0;
      *v10 = 0;
      v12 = *(_OWORD *)(v10 + 5);
      v20 = *(_OWORD *)(v10 + 3);
      v21 = v12;
      do
      {
        v13 = v9;
        v14 = v9 + 7;
        if (*((char *)v13 + 79) < 0)
          operator delete((void *)*v14);
        *(_OWORD *)v14 = *(_OWORD *)v13;
        v14[2] = v13[2];
        *((_BYTE *)v13 + 23) = 0;
        *(_BYTE *)v13 = 0;
        v15 = *(_OWORD *)(v13 + 5);
        *((_OWORD *)v13 + 5) = *(_OWORD *)(v13 + 3);
        *((_OWORD *)v13 + 6) = v15;
        if (v13 == v23)
          break;
        v9 = v13 - 7;
      }
      while ((((uint64_t (*)(__int128 *, uint64_t *))*a3)(&v18, v13 - 7) & 1) != 0);
      if (*((char *)v13 + 23) < 0)
        operator delete((void *)*v13);
      v16 = v18;
      v13[2] = v19;
      *(_OWORD *)v13 = v16;
      v17 = v21;
      *(_OWORD *)(v13 + 3) = v20;
      *(_OWORD *)(v13 + 5) = v17;
      if (++v11 == 8)
        break;
    }
    v9 = v10;
    v10 += 7;
    if (v10 == v22)
      return 1;
  }
  return v10 + 7 == v22;
}

void sub_19BF511EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, unsigned int (**a5)(uint64_t *, uint64_t *, __n128))
{
  double result;
  __n128 v11;
  __n128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;

  v15 = a2;
  v16 = a1;
  v13 = a4;
  v14 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a2, (uint64_t)a3, a5);
  if (((unsigned int (*)(uint64_t, uint64_t *))*a5)(a4, a3))
  {
    v11 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v14, &v13);
    if ((*a5)(v14, a2, v11))
    {
      v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v15, (uint64_t *)&v14);
      if ((*a5)(v15, a1, v12))
        *(_QWORD *)&result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v16, (uint64_t *)&v15).n128_u64[0];
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, unsigned int (**a6)(uint64_t *, uint64_t *, __n128))
{
  double v12;
  double result;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;

  v20 = a2;
  v21 = a1;
  v18 = a4;
  v19 = a3;
  v17 = a5;
  v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a2, a3, (uint64_t)a4, a6);
  if (((unsigned int (*)(uint64_t, uint64_t *, double))*a6)(a5, a4, v12))
  {
    v14 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v18, &v17);
    if ((*a6)(v18, a3, v14))
    {
      v15 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v19, (uint64_t *)&v18);
      if ((*a6)(v19, a2, v15))
      {
        v16 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v20, (uint64_t *)&v19);
        if ((*a6)(v20, a1, v16))
          *(_QWORD *)&result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v21, (uint64_t *)&v20).n128_u64[0];
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(__int128 *a1, uint64_t *a2, uint64_t *a3, unsigned int (**a4)(int64_t, uint64_t), __n128 a5)
{
  uint64_t *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v18;
  __int128 *v19;

  v19 = a1;
  if (a1 != (__int128 *)a2)
  {
    v7 = a2;
    v8 = a1;
    v9 = (char *)a2 - (char *)a1;
    v10 = ((char *)a2 - (char *)a1) / 56;
    if ((char *)a2 - (char *)a1 >= 57)
    {
      v11 = (unint64_t)(v10 - 2) >> 1;
      v12 = v11 + 1;
      v13 = (__int128 *)((char *)a1 + 56 * v11);
      do
      {
        a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v8, a4, v10, v13);
        v13 = (__int128 *)((char *)v13 - 56);
        --v12;
      }
      while (v12);
    }
    v18 = v7;
    if (v7 == a3)
    {
      a3 = v7;
    }
    else
    {
      v14 = v7;
      do
      {
        if (((unsigned int (*)(uint64_t *, __int128 *, __n128))*a4)(v14, v19, a5))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<SharingHysteresis::DeviceScore *&,SharingHysteresis::DeviceScore *&>(&v18, (uint64_t *)&v19);
          a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v19, a4, v10, v19);
        }
        v14 = v18 + 7;
        v18 = v14;
      }
      while (v14 != a3);
      v8 = v19;
      v9 = (char *)v7 - (char *)v19;
    }
    if (v9 >= 57)
    {
      v15 = v9 / 0x38uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>((uint64_t)v8, (uint64_t)v7, a4, v15);
        v7 -= 7;
      }
      while (v15-- > 2);
      return v18;
    }
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, unsigned int (**a2)(int64_t, uint64_t), uint64_t a3, __int128 *a4)
{
  unint64_t v4;
  __int128 *v5;
  int64_t v7;
  int64_t v10;
  __int128 *v11;
  int64_t v12;
  __n128 result;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __n128 v22;
  __int128 v23;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= 0x6DB6DB6DB6DB6DB7 * (((uint64_t)a4 - a1) >> 3))
    {
      v10 = (0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - a1) >> 3)) | 1;
      v11 = (__int128 *)(a1 + 56 * v10);
      v12 = 0xDB6DB6DB6DB6DB6ELL * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v12 < a3 && (*a2)(a1 + 56 * v10, (uint64_t)v11 + 56))
      {
        v11 = (__int128 *)((char *)v11 + 56);
        v10 = v12;
      }
      if ((((uint64_t (*)(__int128 *, __int128 *))*a2)(v11, v5) & 1) == 0)
      {
        v20 = *v5;
        v21 = *((_QWORD *)v5 + 2);
        *((_QWORD *)v5 + 1) = 0;
        *((_QWORD *)v5 + 2) = 0;
        *(_QWORD *)v5 = 0;
        v22 = *(__n128 *)((char *)v5 + 24);
        v23 = *(__int128 *)((char *)v5 + 40);
        do
        {
          v14 = v11;
          if (*((char *)v5 + 23) < 0)
            operator delete(*(void **)v5);
          v15 = *v11;
          *((_QWORD *)v5 + 2) = *((_QWORD *)v11 + 2);
          *v5 = v15;
          *((_BYTE *)v11 + 23) = 0;
          *(_BYTE *)v11 = 0;
          v16 = *(__int128 *)((char *)v11 + 24);
          *(__int128 *)((char *)v5 + 40) = *(__int128 *)((char *)v11 + 40);
          *(__int128 *)((char *)v5 + 24) = v16;
          if (v7 < v10)
            break;
          v17 = (2 * v10) | 1;
          v11 = (__int128 *)(a1 + 56 * v17);
          v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            v10 = v17;
          }
          else if ((*a2)(a1 + 56 * v17, (uint64_t)v11 + 56))
          {
            v11 = (__int128 *)((char *)v11 + 56);
          }
          else
          {
            v10 = v17;
          }
          v5 = v14;
        }
        while (!(*a2)((int64_t)v11, (uint64_t)&v20));
        if (*((char *)v14 + 23) < 0)
          operator delete(*(void **)v14);
        v18 = v20;
        *((_QWORD *)v14 + 2) = v21;
        *v14 = v18;
        result = v22;
        v19 = v23;
        *(__int128 *)((char *)v14 + 24) = (__int128)v22;
        *(__int128 *)((char *)v14 + 40) = v19;
      }
    }
  }
  return result;
}

void sub_19BF516D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;
  int v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[15];

  if (a4 >= 2)
  {
    v7 = *(_QWORD *)a1;
    *(_QWORD *)v18 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)&v18[7] = *(_QWORD *)(a1 + 15);
    v8 = *(_BYTE *)(a1 + 23);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    v16 = *(_OWORD *)(a1 + 24);
    v17 = *(_OWORD *)(a1 + 40);
    v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, a3, a4);
    v10 = v9;
    v11 = (void **)(a2 - 56);
    v12 = *(char *)(v9 + 23);
    if (v9 == a2 - 56)
    {
      if (v12 < 0)
        operator delete(*(void **)v9);
      *(_QWORD *)v10 = v7;
      *(_QWORD *)(v10 + 8) = *(_QWORD *)v18;
      *(_QWORD *)(v10 + 15) = *(_QWORD *)&v18[7];
      *(_BYTE *)(v10 + 23) = v8;
      *(_OWORD *)(v10 + 24) = v16;
      *(_OWORD *)(v10 + 40) = v17;
    }
    else
    {
      if (v12 < 0)
        operator delete(*(void **)v9);
      v13 = *(_OWORD *)v11;
      *(_QWORD *)(v10 + 16) = *(_QWORD *)(a2 - 40);
      *(_OWORD *)v10 = v13;
      *(_BYTE *)(a2 - 33) = 0;
      *(_BYTE *)(a2 - 56) = 0;
      v14 = *(_OWORD *)(a2 - 32);
      *(_OWORD *)(v10 + 40) = *(_OWORD *)(a2 - 16);
      *(_OWORD *)(v10 + 24) = v14;
      v15 = v10 + 56;
      if (*(char *)(a2 - 33) < 0)
        operator delete(*v11);
      *(_QWORD *)(a2 - 56) = v7;
      *(_QWORD *)(a2 - 48) = *(_QWORD *)v18;
      *(_QWORD *)(a2 - 41) = *(_QWORD *)&v18[7];
      *(_BYTE *)(a2 - 33) = v8;
      *(_OWORD *)(a2 - 32) = v16;
      *(_OWORD *)(a2 - 16) = v17;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(a1, v15, (uint64_t (**)(__int128 *, __int128 *))a3, 0x6DB6DB6DB6DB6DB7 * ((v15 - a1) >> 3));
    }
  }
}

void sub_19BF51874(_Unwind_Exception *exception_object)
{
  void *v1;
  int v2;

  if (v2 < 0)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = a1 + 56 * v6 + 56;
    v10 = 2 * v6;
    v6 = (2 * v6) | 1;
    v11 = v10 + 2;
    if (v10 + 2 < a3 && (*a2)(v9, v9 + 56))
    {
      v9 += 56;
      v6 = v11;
    }
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    v12 = *(_OWORD *)v9;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    *(_BYTE *)(v9 + 23) = 0;
    *(_BYTE *)v9 = 0;
    v13 = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(v9 + 40);
    *(_OWORD *)(a1 + 24) = v13;
    a1 = v9;
  }
  while (v6 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(SharingHysteresis::DeviceScore const&,SharingHysteresis::DeviceScore const&),SharingHysteresis::DeviceScore*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4)
{
  unint64_t v4;
  unint64_t v8;
  __int128 *v9;
  __int128 *v10;
  double result;
  __int128 v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v8 = v4 >> 1;
    v9 = (__int128 *)(a1 + 56 * (v4 >> 1));
    v10 = (__int128 *)(a2 - 56);
    if ((*a3)(v9, (__int128 *)(a2 - 56)))
    {
      v17 = *v10;
      v18 = *((_QWORD *)v10 + 2);
      *((_QWORD *)v10 + 1) = 0;
      *((_QWORD *)v10 + 2) = 0;
      *(_QWORD *)v10 = 0;
      v12 = *(_OWORD *)(a2 - 16);
      v19 = *(_OWORD *)(a2 - 32);
      v20 = v12;
      do
      {
        v13 = v9;
        if (*((char *)v10 + 23) < 0)
          operator delete(*(void **)v10);
        v14 = *v9;
        *((_QWORD *)v10 + 2) = *((_QWORD *)v9 + 2);
        *v10 = v14;
        *((_BYTE *)v9 + 23) = 0;
        *(_BYTE *)v9 = 0;
        v15 = *(__int128 *)((char *)v9 + 24);
        *(__int128 *)((char *)v10 + 40) = *(__int128 *)((char *)v9 + 40);
        *(__int128 *)((char *)v10 + 24) = v15;
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = (__int128 *)(a1 + 56 * v8);
        v10 = v13;
      }
      while (((*a3)(v9, &v17) & 1) != 0);
      if (*((char *)v13 + 23) < 0)
        operator delete(*(void **)v13);
      *v13 = v17;
      *((_QWORD *)v13 + 2) = v18;
      result = *(double *)&v19;
      v16 = v20;
      *(__int128 *)((char *)v13 + 24) = v19;
      *(__int128 *)((char *)v13 + 40) = v16;
    }
  }
  return result;
}

void sub_19BF51AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<SharingHysteresis::DeviceScore>::__assign_with_size[abi:ne180100]<SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(uint64_t a1, std::string *__str, __int128 *a3, unint64_t a4)
{
  uint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;
  std::string *v12;
  std::string *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a1 + 16;
  v9 = *(std::string **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    std::vector<SharingHysteresis::DeviceScore>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0x492492492492492)
      std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
    v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)) >= 0x249249249249249)
      v11 = 0x492492492492492;
    else
      v11 = v10;
    std::vector<SharingHysteresis::DeviceScore>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(v8, (__int128 *)__str, a3, *(std::string **)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3));
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(__str, v13, v9);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(v8, (__int128 *)v13, a3, *(std::string **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(__str, (std::string *)a3, v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      if (*(char *)(v16 - 33) < 0)
        operator delete(*(void **)(v16 - 56));
      v16 -= 56;
    }
    while (v16 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_19BF51C44(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_19BF51C4C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<SharingHysteresis::DeviceScore>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<SharingHysteresis::DeviceScore>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<SharingHysteresis::DeviceScore>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x492492492492493)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*,SharingHysteresis::DeviceScore*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  _QWORD v11[3];
  char v12;
  std::string *v13;
  std::string *v14;

  v4 = this;
  v13 = this;
  v14 = this;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  v12 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v8 = v14;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        v8 = v4;
      }
      v9 = *(__int128 *)((char *)v6 + 24);
      *(_OWORD *)&v4[1].__r_.__value_.__r.__words[2] = *(__int128 *)((char *)v6 + 40);
      *(_OWORD *)&v4[1].__r_.__value_.__l.__data_ = v9;
      v6 = (__int128 *)((char *)v6 + 56);
      v4 = (std::string *)((char *)v8 + 56);
      v14 = (std::string *)((char *)v8 + 56);
    }
    while (v6 != a3);
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v4;
}

void sub_19BF51D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<SharingHysteresis::DeviceScore>,SharingHysteresis::DeviceScore*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 33) < 0)
      operator delete(*(void **)(v1 - 56));
    v1 -= 56;
  }
}

std::string *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,SharingHysteresis::DeviceScore *,0>(std::string *__str, std::string *a2, std::string *this)
{
  std::string *v4;
  std::string *v5;
  __int128 v6;

  v4 = __str;
  if (__str == a2)
    return __str;
  v5 = a2;
  do
  {
    std::string::operator=(this, v4);
    v6 = *(_OWORD *)&v4[1].__r_.__value_.__r.__words[2];
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = *(_OWORD *)&v4[1].__r_.__value_.__l.__data_;
    *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = v6;
    this = (std::string *)((char *)this + 56);
    v4 = (std::string *)((char *)v4 + 56);
  }
  while (v4 != v5);
  return v5;
}

id PRGetDeviceModelName()
{
  if (PRGetDeviceModelName::onceToken != -1)
    dispatch_once(&PRGetDeviceModelName::onceToken, &__block_literal_global_0);
  return (id)PRGetDeviceModelName::result;
}

id PRGetDeviceName()
{
  return (id)MGCopyAnswerWithError();
}

id PRGetDeviceSerialNumber()
{
  return (id)MGCopyAnswerWithError();
}

id PRGetBuildVersion()
{
  if (PRGetBuildVersion::onceToken != -1)
    dispatch_once(&PRGetBuildVersion::onceToken, &__block_literal_global_10);
  return (id)PRGetBuildVersion::result;
}

id PRGetDeviceWifiChipset()
{
  if (PRGetDeviceWifiChipset::onceToken != -1)
    dispatch_once(&PRGetDeviceWifiChipset::onceToken, &__block_literal_global_13);
  return (id)PRGetDeviceWifiChipset::result;
}

id PRGetDeviceWifiSKU()
{
  if (PRGetDeviceWifiSKU::onceToken != -1)
    dispatch_once(&PRGetDeviceWifiSKU::onceToken, &__block_literal_global_16);
  return (id)PRGetDeviceWifiSKU::result;
}

void sub_19BF521C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t PRIsSupportedPlatform()
{
  if (PRIsSupportedPlatform::onceToken != -1)
    dispatch_once(&PRIsSupportedPlatform::onceToken, &__block_literal_global_22);
  return PRIsSupportedPlatform::supported;
}

void sub_19BF52268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t PRIsInternalBuild()
{
  if (PRIsInternalBuild::once != -1)
    dispatch_once(&PRIsInternalBuild::once, &__block_literal_global_25);
  return PRIsInternalBuild::result;
}

void sub_19BF52300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t PRIsNonUIInstall()
{
  if (PRIsNonUIInstall::once != -1)
    dispatch_once(&PRIsNonUIInstall::once, &__block_literal_global_28);
  return PRIsNonUIInstall::isNonUIInstall;
}

id PRBluetoothAddressToString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t i;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length") == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_retainAutorelease(v2);
    v5 = objc_msgSend(v4, "bytes");
    for (i = 0; objc_msgSend(v4, "length") > i; ++i)
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%02lX"), *(unsigned __int8 *)(v5 + i));
      if (objc_msgSend(v4, "length") - 1 > i)
        objc_msgSend(v3, "appendString:", CFSTR(":"));
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_19BF524A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double combinedQuaternionFromAoA(float a1, float a2)
{
  __float2 v3;
  __float2 v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  double result;
  float32x4_t v10;

  v3 = __sincosf_stret(a1 * 0.5);
  v10 = vmulq_n_f32((float32x4_t)xmmword_19BF79D30, v3.__sinval);
  v4 = __sincosf_stret(a2 * 0.5);
  v5 = vmulq_n_f32((float32x4_t)xmmword_19BF79D40, v4.__sinval);
  v6.i32[0] = LODWORD(v4.__cosval);
  v6.f32[1] = -v5.f32[2];
  v6.i32[2] = v5.i32[1];
  *(float32x2_t *)v7.f32 = vneg_f32(*(float32x2_t *)v5.f32);
  v6.i32[3] = v7.i32[0];
  v8.i32[0] = vdupq_laneq_s32((int32x4_t)v5, 2).u32[0];
  v8.i32[1] = LODWORD(v4.__cosval);
  v8.i64[1] = v7.i64[0];
  v7.i32[0] = vdup_lane_s32(*(int32x2_t *)v7.f32, 1).u32[0];
  v7.i32[1] = v5.i32[0];
  v7.i32[2] = LODWORD(v4.__cosval);
  v7.f32[3] = -v5.f32[2];
  v5.i32[3] = LODWORD(v4.__cosval);
  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, v10.f32[0]), v8, *(float32x2_t *)v10.f32, 1), v7, v10, 2), v5, v3.__cosval).u64[0];
  return result;
}

__n64 unitVectorForAoAInNearbydCoordinates(float *a1)
{
  __float2 v2;
  float cosval;
  __n64 result;

  v2 = __sincosf_stret(*a1);
  cosval = __sincosf_stret(a1[4]).__cosval;
  result.n64_u32[0] = LODWORD(v2.__sinval);
  result.n64_f32[1] = v2.__cosval * cosval;
  return result;
}

double unitVectorForAoAInSpatialCoordinates(float *a1)
{
  __float2 v2;

  v2 = __sincosf_stret(*a1);
  return COERCE_DOUBLE(__PAIR64__(v2.__cosval * __sincosf_stret(a1[1]).__sinval, LODWORD(v2.__sinval)));
}

float convertAoAFromNearbydCoordinatesToSpatialCoordinates(float *a1)
{
  float v2;
  float v3;
  __float2 v4;

  v2 = *a1;
  v3 = cosf(*a1);
  v4 = __sincosf_stret(a1[1]);
  atan2f(v3 * v4.__cosval, -(float)(v3 * v4.__sinval));
  return v2;
}

float calculateAoAFromUnitVectorInSpatialCoordinates(float a1, float a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  v3 = a3;
  v4 = a2;
  v5 = sqrtf((float)((float)(a2 * a2) + (float)(a1 * a1)) + (float)(a3 * a3));
  if (v5 >= 0.000001)
  {
    a1 = a1 / v5;
    v4 = v4 / v5;
    v3 = a3 / v5;
  }
  v6 = asinf(a1);
  atan2f(v4, -v3);
  return v6;
}

double PRCommonConvertTicksToSeconds(unint64_t a1)
{
  double v2;
  uint32_t denom;
  uint32_t numer;
  uint32_t v5;
  unsigned int v6;
  uint32_t v7;
  uint32_t v8;
  mach_timebase_info info;

  v2 = *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds;
  if (*(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds == 0.0)
  {
    if (mach_timebase_info(&info))
      PRCommonConvertTicksToSeconds();
    if (info.denom)
    {
      denom = info.denom;
      numer = info.numer;
      do
      {
        v5 = denom;
        denom = numer % denom;
        numer = v5;
      }
      while (denom);
    }
    else
    {
      v5 = info.numer;
    }
    v6 = 1000000000;
    v7 = info.numer / v5;
    do
    {
      v8 = v7;
      v7 = v6;
      v6 = v8 % v6;
    }
    while (v6);
    v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&PRCommonConvertTicksToSeconds(unsigned long long)::ticksToSeconds = v2;
  }
  return v2 * (double)a1;
}

double PRCommonGetMachTimeSeconds(void)
{
  uint64_t v0;

  v0 = mach_absolute_time();
  return PRCommonConvertTicksToSeconds(v0);
}

double PRCommonGetMachContinuousTimeSeconds(void)
{
  uint64_t v0;

  v0 = mach_continuous_time();
  return PRCommonConvertTicksToSeconds(v0);
}

BOOL PRCommonGetAllTimes(double *a1, double *a2, double *a3)
{
  int times;
  uint64_t v8;
  uint64_t v9;

  times = mach_get_times();
  if (!times)
  {
    if (a1)
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x1E0C9ADF8];
    if (a2)
      *a2 = PRCommonConvertTicksToSeconds(0);
    if (a3)
      *a3 = PRCommonConvertTicksToSeconds(0);
  }
  return times == 0;
}

id PRCommonConvertNSDataToHexNSString(NSData *a1, int a2)
{
  NSData *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  id v6;
  void **v7;
  std::string::size_type v8;
  std::string *v9;
  void *v10;
  void *__p[2];
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 *v15;
  std::string v16;

  v3 = a1;
  memset(&v16, 0, sizeof(v16));
  std::vector<unsigned char>::vector(&v14, -[NSData length](v3, "length"));
  -[NSData getBytes:length:](v3, "getBytes:length:", v14, -[NSData length](v3, "length"));
  v4 = (unsigned __int8 *)v14;
  v5 = v15;
  if (v14 == v15)
  {
    v9 = &v16;
  }
  else
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X"), *v4);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));

      if ((v13 & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      if ((v13 & 0x80u) == 0)
        v8 = v13;
      else
        v8 = (std::string::size_type)__p[1];
      if (a2)
        std::string::insert(&v16, 0, (const std::string::value_type *)v7, v8);
      else
        std::string::append(&v16, (const std::string::value_type *)v7, v8);
      if ((char)v13 < 0)
        operator delete(__p[0]);
      ++v4;
    }
    while (v4 != v5);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v16;
    else
      v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (unsigned __int8 *)v14;
    operator delete(v14);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);

  return v10;
}

void sub_19BF529FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

id PRCommonConvertHexNSStringToNSData(NSString *a1)
{
  NSString *v1;
  void *v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *p_p;
  unint64_t v7;
  unint64_t v8;
  char __str[2];
  __int16 v11;
  void *__p;
  unint64_t v13;
  unsigned __int8 v14;

  v1 = a1;
  if ((-[NSString length](v1, "length") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)-[NSString UTF8String](objc_retainAutorelease(v1), "UTF8String"));
    v2 = (void *)objc_opt_new();
    v11 = 0;
    v3 = (v14 & 0x80u) != 0;
    v4 = v14;
    if ((v14 & 0x80u) != 0)
      v4 = v13;
    if (v4 >= 2)
    {
      v5 = 0;
      do
      {
        if (v3)
          p_p = (char *)__p;
        else
          p_p = (char *)&__p;
        *(_WORD *)__str = *(_WORD *)&p_p[v5];
        HIBYTE(v11) = strtol(__str, 0, 16);
        objc_msgSend(v2, "appendBytes:length:", (char *)&v11 + 1, 1);
        v7 = v5 + 3;
        v5 += 2;
        v3 = (v14 & 0x80u) != 0;
        v8 = v14;
        if ((v14 & 0x80u) != 0)
          v8 = v13;
      }
      while (v8 > v7);
    }
    if ((char)v14 < 0)
      operator delete(__p);
  }

  return v2;
}

void sub_19BF52B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

char *PRCommonSerializePrintableState(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1A1AD0248]();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") > 0x8000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: statedump too big (%d > %d)"), objc_msgSend(v6, "length"), 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB38B0];
    v15 = v3;
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v11 = (char *)malloc_type_calloc(1uLL, objc_msgSend(v6, "length") + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)v11 = 1;
  *((_DWORD *)v11 + 1) = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[nearbyd] %@"), v3);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strlcpy(v11 + 136, (const char *)objc_msgSend(v12, "UTF8String"), 0x40uLL);

  v13 = objc_retainAutorelease(v6);
  memcpy(v11 + 200, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

  objc_autoreleasePoolPop(v5);
  return v11;
}

{
  id v3;
  id v4;
  void *v5;
  char *v6;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v8 = v3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_19BF52D88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19BF52E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_19BF52F08(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_19BF537F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF53D90(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_19BF547EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double degToRad(double a1)
{
  return a1 / 180.0 * 3.14159265;
}

double radToDeg(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double picosecsToMeters(double a1)
{
  return a1 / 1.0e12 * 299792458.0;
}

double metersToPicosecs(double a1)
{
  return a1 / 299792458.0 * 1.0e12;
}

double secsToMeters(double a1)
{
  return a1 * 299792458.0;
}

double metersToSecs(double a1)
{
  return a1 / 299792458.0;
}

double secsToPicosecs(double a1)
{
  return a1 * 1.0e12;
}

double picosecsToSecs(double a1)
{
  return a1 / 1.0e12;
}

double pptToPpb(double a1)
{
  return a1 / 1000.0;
}

double ppbToPpt(double a1)
{
  return a1 * 1000.0;
}

double ppbToPpu(double a1)
{
  return a1 / 1000000000.0;
}

double ppuToPpb(double a1)
{
  return a1 * 1000000000.0;
}

long double coordinate_transform_from_R1_to_nearbyD(double a1, double a2, double *a3, long double *a4)
{
  double v6;
  __double2 v7;
  __double2 v8;
  long double result;

  v6 = a2 / 180.0 * 3.14159265;
  v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  v8 = __sincos_stret(v6);
  *a3 = asin(v7.__cosval * v8.__sinval) * 180.0 / 3.14159265;
  result = atan2(-(v7.__sinval * v8.__sinval), v8.__cosval) * 180.0 / 3.14159265;
  *a4 = result;
  return result;
}

void coordinate_transform_from_nearbyD_to_R1(double a1, double a2, double *a3, double *a4)
{
  __double2 v7;
  __double2 v8;
  double v9;

  v7 = __sincos_stret(a1 / 180.0 * 3.14159265);
  v8 = __sincos_stret(a2 / 180.0 * 3.14159265);
  *a4 = acos(v7.__cosval * v8.__cosval) * 180.0 / 3.14159265;
  v9 = atan2(-(v7.__cosval * v8.__sinval), v7.__sinval) * 180.0 / 3.14159265;
  if (v9 < 0.0)
    v9 = v9 + 360.0;
  *a3 = v9;
}

void sub_19BF559A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF55A54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF55AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t TopScoreTieHysteresis::TopScoreTieHysteresis(uint64_t a1, int a2, char a3)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 12) = 0;
  *(_QWORD *)(a1 + 16) = 0x7FF4000000000000;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(0x7FF4000000000000uLL);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = a1 + 48;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = a1 + 72;
  *(_QWORD *)a1 = os_log_create("com.apple.proximity.sharingchoice", "TopScoreTieHysteresis");
  *(_DWORD *)(a1 + 8) = a2;
  *(_BYTE *)(a1 + 12) = a3;
  *(_OWORD *)(a1 + 24) = xmmword_19BF79DA0;
  return a1;
}

void TopScoreTieHysteresis::clearDeviceScores(TopScoreTieHysteresis *this)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)this + 48);
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 40, *((_QWORD **)this + 6));
  *v1 = 0;
  v1[1] = 0;
  *(v1 - 2) = 0x7FF4000000000000;
  *(v1 - 1) = v1;
  *((_BYTE *)v1 - 35) = 0;
}

void TopScoreTieHysteresis::addDeviceScore(uint64_t a1, std::string *a2, int a3, double a4)
{
  uint64_t *v8;
  std::string __str;
  double v10;
  __int16 v11;
  std::string *v12;

  memset(&__str, 0, sizeof(__str));
  v10 = NAN;
  v11 = 0;
  std::string::operator=(&__str, a2);
  v10 = a4;
  v11 = a3;
  if (a3 && !*(_DWORD *)(a1 + 8))
    *(_BYTE *)(a1 + 13) = 1;
  v12 = a2;
  v8 = std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(a1 + 40), (const void **)&a2->__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)&v12);
  std::string::operator=((std::string *)(v8 + 7), &__str);
  *((double *)v8 + 10) = v10;
  *((_WORD *)v8 + 44) = v11;
  if (*(double *)(a1 + 32) < v10)
    *(double *)(a1 + 32) = v10;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_19BF55CE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::populateDeviceScores(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  int v9;
  double v10;
  double *v11;
  _QWORD *v12;
  _QWORD *v13;
  std::string __p;
  std::string v15;

  v4 = (_QWORD *)(a1 + 48);
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(a1 + 40, *(_QWORD **)(a1 + 48));
  *v4 = 0;
  v4[1] = 0;
  *(v4 - 2) = 0x7FF4000000000000;
  *(v4 - 1) = v4;
  *((_BYTE *)v4 - 35) = 0;
  v7 = (_QWORD *)*a2;
  v5 = a2 + 1;
  v6 = v7;
  if (v7 != v5)
  {
    while (1)
    {
      v8 = *(_BYTE *)(a1 + 12) && *((_BYTE *)v6 + 73) == 0;
      if (!v8)
        break;
LABEL_21:
      v12 = (_QWORD *)v6[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)v6[2];
          v8 = *v13 == (_QWORD)v6;
          v6 = v13;
        }
        while (!v8);
      }
      v6 = v13;
      if (v13 == v5)
        return;
    }
    if (*((char *)v6 + 55) < 0)
      std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v6[4], v6[5]);
    else
      v15 = *(std::string *)(v6 + 4);
    v9 = *(_DWORD *)(a1 + 8);
    if (v9 == 1)
    {
      v11 = (double *)(v6 + 14);
    }
    else
    {
      v10 = 0.0;
      if (v9)
      {
LABEL_14:
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
        else
          __p = v15;
        TopScoreTieHysteresis::addDeviceScore(a1, &__p, *((unsigned __int8 *)v6 + 89), v10);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v15.__r_.__value_.__l.__data_);
        goto LABEL_21;
      }
      v11 = (double *)(v6 + 7);
    }
    v10 = *v11;
    goto LABEL_14;
  }
}

void sub_19BF55E58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL TopScoreTieHysteresis::isInTopScoreLayerPreviously(uint64_t a1, const void **a2)
{
  uint64_t **v3;
  const void **v5;

  v3 = (uint64_t **)(a1 + 64);
  if (a1 + 72 == std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>(a1 + 64, a2))return 0;
  v5 = a2;
  return *((_BYTE *)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v3, a2, (uint64_t)&std::piecewise_construct, (__int128 **)&v5)+ 89) != 0;
}

BOOL TopScoreTieHysteresis::isInTopScoreLayer(TopScoreTieHysteresis *this, double a2, double a3, uint64_t a4, uint64_t a5)
{
  double v5;

  v5 = *((double *)this + 4);
  if (v5 < a2)
    TopScoreTieHysteresis::isInTopScoreLayer((uint64_t)this, a4, a5);
  return v5 - a2 <= a3;
}

uint64_t TopScoreTieHysteresis::isInTopScoreLayerWithHysteresis(uint64_t a1, uint64_t a2, double a3)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  std::string __p;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  v5 = TopScoreTieHysteresis::isInTopScoreLayerPreviously(a1, (const void **)&__p.__r_.__value_.__l.__data_);
  v8 = v5;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v9 = *(_BYTE *)(a1 + 13);
  if (v8)
  {
    if (*(_BYTE *)(a1 + 13))
    {
      v10 = *(double *)(a1 + 32);
      if (v10 < a3)
        TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
      v11 = v10 - a3;
      v12 = 0.015;
    }
    else
    {
      v15 = *(_DWORD *)(a1 + 8);
      if (v15 == 1)
      {
        v19 = *(double *)(a1 + 32);
        if (v19 < a3)
          TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
        v11 = v19 - a3;
        v12 = 11.5;
      }
      else
      {
        if (v15)
          return v9 & 1;
        v16 = *(double *)(a1 + 32);
        if (v16 < a3)
          TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
        v11 = v16 - a3;
        v12 = 0.03;
      }
    }
  }
  else if (*(_BYTE *)(a1 + 13))
  {
    v13 = *(double *)(a1 + 32);
    if (v13 < a3)
      TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
    v11 = v13 - a3;
    v12 = 0.005;
  }
  else
  {
    v17 = *(_DWORD *)(a1 + 8);
    if (v17 == 1)
    {
      v20 = *(double *)(a1 + 32);
      if (v20 < a3)
        TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
      v11 = v20 - a3;
      v12 = 6.5;
    }
    else
    {
      if (v17)
        return v9 & 1;
      v18 = *(double *)(a1 + 32);
      if (v18 < a3)
        TopScoreTieHysteresis::isInTopScoreLayer(v5, v6, v7);
      v11 = v18 - a3;
      v12 = 0.01;
    }
  }
  v9 = v11 <= v12;
  return v9 & 1;
}

void sub_19BF560A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible(uint64_t a1, uint64_t **a2, double a3)
{
  double v6;
  NSObject *v7;
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 v14;
  void *v15[2];
  char v16;
  std::string v17;
  std::string v18;
  void *__p[2];
  char v20;
  void **v21;
  _BYTE buf[22];
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  TopScoreTieHysteresis::populateDeviceScores(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "before");
  TopScoreTieHysteresis::logDeviceScores(a1, (uint64_t)__p);
  if (v20 < 0)
    operator delete(__p[0]);
  *(double *)(a1 + 16) = a3;
  v6 = *(double *)(a1 + 24);
  if (v6 - a3 <= 0.5)
  {
    v8 = *(_QWORD **)(a1 + 40);
    if (v8 != (_QWORD *)(a1 + 48))
    {
      do
      {
        if (*(_BYTE *)(a1 + 13))
          v9 = *((_BYTE *)v8 + 88) == 0;
        else
          v9 = 0;
        if (v9)
        {
          *((_BYTE *)v8 + 89) = 0;
        }
        else
        {
          if (*((char *)v8 + 55) < 0)
            std::string::__init_copy_ctor_external(&v18, (const std::string::value_type *)v8[4], v8[5]);
          else
            v18 = *(std::string *)(v8 + 4);
          *((_BYTE *)v8 + 89) = TopScoreTieHysteresis::isInTopScoreLayerWithHysteresis(a1, (uint64_t)&v18, *((double *)v8 + 10));
          if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v18.__r_.__value_.__l.__data_);
        }
        v10 = (_QWORD *)v8[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v8[2];
            v9 = *v11 == (_QWORD)v8;
            v8 = v11;
          }
          while (!v9);
        }
        v8 = v11;
      }
      while (v11 != (_QWORD *)(a1 + 48));
    }
    TopScoreTieHysteresis::getTopScoreDevices((TopScoreTieHysteresis *)a1, (uint64_t *)buf);
    v12 = *(__int128 **)buf;
    v13 = *(__int128 **)&buf[8];
    while (v12 != v13)
    {
      if (*((char *)v12 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
      }
      else
      {
        v14 = *v12;
        v17.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
        *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v14;
      }
      TopScoreTieHysteresis::overwriteOutputScores(a1, a2, (uint64_t)&v17);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v17.__r_.__value_.__l.__data_);
      v12 = (__int128 *)((char *)v12 + 24);
    }
    v21 = (void **)buf;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *> *,long>>((uint64_t **)(a1 + 64), *(__int128 **)(a1 + 40), (__int128 *)(a1 + 48));
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16);
    std::string::basic_string[abi:ne180100]<0>(v15, "after");
    TopScoreTieHysteresis::logDeviceScores(a1, (uint64_t)v15);
    if (v16 < 0)
      operator delete(v15[0]);
  }
  else
  {
    v7 = *(NSObject **)a1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      v23 = 2048;
      v24 = 0x3FE0000000000000;
      _os_log_impl(&dword_19BF46000, v7, OS_LOG_TYPE_INFO, "Timestamp out of order too much! P:%f;C:%f;T:%f",
        buf,
        0x20u);
    }
  }
}

void sub_19BF56348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void TopScoreTieHysteresis::logDeviceScores(uint64_t a1, uint64_t a2)
{
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void **v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;
  NSObject *v22;
  void *p_p;
  void *__p;
  char v25;
  _QWORD v26[11];
  char v27;
  uint64_t v28;
  void *v29[2];
  unsigned __int8 v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 8))
    v4 = "soi_rssi";
  else
    v4 = "score";
  std::string::basic_string[abi:ne180100]<0>(v29, v4);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v26);
  v5 = *(char *)(a2 + 23);
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *(_QWORD *)a2;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a2 + 23);
  else
    v7 = *(_QWORD *)(a2 + 8);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)";", 1);
  if ((v30 & 0x80u) == 0)
    v9 = v29;
  else
    v9 = (void **)v29[0];
  if ((v30 & 0x80u) == 0)
    v10 = v30;
  else
    v10 = (uint64_t)v29[1];
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v9, v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)";", 1);
  v12 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)";", 1);
  v13 = *(_QWORD **)(a1 + 40);
  if (v13 != (_QWORD *)(a1 + 48))
  {
    do
    {
      v14 = *((char *)v13 + 55);
      if (v14 >= 0)
        v15 = (uint64_t)(v13 + 4);
      else
        v15 = v13[4];
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v13 + 55);
      else
        v16 = v13[5];
      v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)",", 1);
      v18 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)";", 1);
      v19 = (_QWORD *)v13[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v13[2];
          v21 = *v20 == (_QWORD)v13;
          v13 = v20;
        }
        while (!v21);
      }
      v13 = v20;
    }
    while (v20 != (_QWORD *)(a1 + 48));
  }
  std::stringbuf::str();
  v22 = *(NSObject **)a1;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    p_p = &__p;
    if (v25 < 0)
      p_p = __p;
    *(_DWORD *)buf = 136315138;
    v32 = p_p;
    _os_log_impl(&dword_19BF46000, v22, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  if (v25 < 0)
    operator delete(__p);
  v26[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v26 + *(_QWORD *)(v26[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v26[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v27 < 0)
    operator delete((void *)v26[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1ACFFCC](&v28);
  if ((char)v30 < 0)
    operator delete(v29[0]);
}

void sub_19BF56664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  if (*(char *)(v5 - 81) < 0)
    operator delete(*(void **)(v5 - 104));
  _Unwind_Resume(a1);
}

void TopScoreTieHysteresis::getTopScoreDevices(TopScoreTieHysteresis *this@<X0>, uint64_t *a2@<X8>)
{
  char *v2;
  char *v3;
  unint64_t v5;
  __int128 *v6;
  char *v7;
  char *v8;
  BOOL v9;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (char *)*((_QWORD *)this + 5);
  v3 = (char *)this + 48;
  if (v2 != (char *)this + 48)
  {
    v5 = 0;
    do
    {
      if (v2[89])
      {
        v6 = (__int128 *)(v2 + 32);
        if (v5 >= a2[2])
        {
          v5 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, v6);
        }
        else
        {
          std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)a2, v6);
          v5 += 24;
        }
        a2[1] = v5;
      }
      v7 = (char *)*((_QWORD *)v2 + 1);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char *)*((_QWORD *)v2 + 2);
          v9 = *(_QWORD *)v8 == (_QWORD)v2;
          v2 = v8;
        }
        while (!v9);
      }
      v2 = v8;
    }
    while (v8 != v3);
  }
}

void sub_19BF56758(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t TopScoreTieHysteresis::overwriteOutputScores(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  os_log_t v11;
  _BOOL4 v12;
  const void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  const void *v17;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::find<std::string>((uint64_t)a2, (const void **)a3);
  if (a2 + 1 != (uint64_t **)result)
  {
    v7 = *(_DWORD *)(a1 + 8);
    if (v7 != 1)
    {
      if (!v7)
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)buf = a3;
        result = (uint64_t)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
        *(_QWORD *)(result + 56) = v8;
      }
      return result;
    }
    *(_QWORD *)buf = a3;
    v9 = *((double *)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 14);
    v10 = *(double *)(a1 + 32);
    v11 = *(os_log_t *)a1;
    v12 = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_INFO);
    if (v10 <= v9)
    {
      if (v12)
      {
        v17 = (const void *)a3;
        if (*(char *)(a3 + 23) < 0)
          v17 = *(const void **)a3;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v17;
        v20 = 2048;
        v21 = v10;
        v14 = "deviceID %s has highest normalized soi rssi %f";
        v15 = v11;
        v16 = 22;
        goto LABEL_14;
      }
    }
    else if (v12)
    {
      v13 = (const void *)a3;
      if (*(char *)(a3 + 23) < 0)
        v13 = *(const void **)a3;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v13;
      v20 = 2048;
      v21 = v9;
      v22 = 2048;
      v23 = v10 - v9;
      v14 = "deviceID %s has normalized soi rssi %f, difference with top soi rssi is %f";
      v15 = v11;
      v16 = 32;
LABEL_14:
      _os_log_impl(&dword_19BF46000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
    v18 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)buf = a3;
    result = (uint64_t)std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a2, (const void **)a3, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
    *(_QWORD *)(result + 112) = v18;
  }
  return result;
}

uint64_t TopScoreTieHysteresis::getNumDevices(TopScoreTieHysteresis *this)
{
  return *((unsigned int *)this + 14);
}

double TopScoreTieHysteresis::getTopScore(TopScoreTieHysteresis *this)
{
  return *((double *)this + 4);
}

_QWORD *TopScoreTieHysteresis::getAttributeName@<X0>(TopScoreTieHysteresis *this@<X0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (*((_DWORD *)this + 2))
    v2 = "soi_rssi";
  else
    v2 = "score";
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x1E0DE4FE0];
  v3 = MEMORY[0x1E0DE4FE0] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x1E0DE4FE0] + 64;
  v4 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_19BF56A40(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1A1ACFFCC](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1ACFFCC](a1 + 112);
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;

  v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<Region>::__insert_node_at(a1, v11, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

double std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;
  double result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x60uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = (std::string *)(v6 + 32);
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    *((_QWORD *)v6 + 6) = *((_QWORD *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  result = 0.0;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *((_QWORD *)v6 + 10) = 0x7FF4000000000000;
  *((_QWORD *)v6 + 11) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_19BF56C1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

uint64_t **std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *> *,long>>(uint64_t **result, __int128 *a2, __int128 *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t **leaf_high;
  __int128 *v12;
  BOOL v13;
  __int128 *v14;
  __int128 *v15;
  uint64_t **v16;
  uint64_t *v17;
  const void **v18;
  uint64_t v19;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v16 = result;
    v17 = v8;
    v18 = (const void **)v8;
    if (v8)
    {
      v17 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 2));
          std::string::operator=((std::string *)(v8 + 7), (const std::string *)((char *)v9 + 56));
          v10 = *((_QWORD *)v9 + 10);
          *((_WORD *)v8 + 44) = *((_WORD *)v9 + 44);
          v8[10] = v10;
          leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high((uint64_t)v5, &v19, v18 + 4);
          std::__tree<Region>::__insert_node_at(v5, v19, leaf_high, (uint64_t *)v18);
          v18 = (const void **)v17;
          if (v17)
            v17 = std::__tree<std::__value_type<Region,double>,std::__map_value_compare<Region,std::__value_type<Region,double>,std::less<Region>,true>,std::allocator<std::__value_type<Region,double>>>::_DetachedTreeCache::__detach_next((uint64_t)v17);
          v12 = (__int128 *)*((_QWORD *)v9 + 1);
          if (v12)
          {
            do
            {
              a2 = v12;
              v12 = *(__int128 **)v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (__int128 *)*((_QWORD *)v9 + 2);
              v13 = *(_QWORD *)a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v13);
          }
          v8 = (uint64_t *)v18;
          if (v18)
            v13 = a2 == a3;
          else
            v13 = 1;
          v9 = a2;
        }
        while (!v13);
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v16);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_multi<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>(v5, a2 + 2);
      v14 = (__int128 *)*((_QWORD *)a2 + 1);
      if (v14)
      {
        do
        {
          v15 = v14;
          v14 = *(__int128 **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v15 = (__int128 *)*((_QWORD *)a2 + 2);
          v13 = *(_QWORD *)v15 == (_QWORD)a2;
          a2 = v15;
        }
        while (!v13);
      }
      a2 = v15;
    }
    while (v15 != a3);
  }
  return result;
}

void sub_19BF56E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v5 = (_QWORD *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v5;
        result = v5;
        if (!*v5)
          goto LABEL_9;
      }
      v4 = v5[1];
    }
    while (v4);
    result = v5 + 1;
  }
  else
  {
    result = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__emplace_multi<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>(uint64_t **a1, __int128 *a2)
{
  uint64_t **leaf_high;
  uint64_t *v4;
  uint64_t v6;
  uint64_t *v7[3];

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>((uint64_t)a1, a2, (uint64_t)v7);
  leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__find_leaf_high((uint64_t)a1, &v6, (const void **)v7[0] + 4);
  std::__tree<Region>::__insert_node_at(a1, v6, leaf_high, v7[0]);
  v4 = v7[0];
  v7[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)v7, 0);
  return v4;
}

void sub_19BF56F48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::__construct_node<std::pair<std::string const,TopScoreTieHysteresis::DeviceScore> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x60uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_19BF56FB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,TopScoreTieHysteresis::DeviceScore>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;
  std::string::size_type v7;

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
  v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *((_QWORD *)a2 + 6);
  LOWORD(this[2].__r_.__value_.__r.__words[1]) = *((_WORD *)a2 + 28);
  this[2].__r_.__value_.__r.__words[0] = v7;
  return this;
}

void sub_19BF57050(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_19BF570C0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x1A1ACFEF4](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x1A1ACFF00](v13);
  return a1;
}

void sub_19BF571D0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x1A1ACFF00](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x19BF571B0);
}

void sub_19BF57218(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_19BF5734C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 82, a4);
}

void sub_19BF57504(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF57630(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF57718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF577F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19BF57990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  if (*(char *)(v5 + 23) < 0)
    operator delete(*(void **)v5);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
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

  v2 = MEMORY[0x1E0DE4FD0];
  v3 = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
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
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_19BF57AC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x1A1ACFFCC](v1);
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
    v5 = std::locale::use_facet(&v8, MEMORY[0x1E0DE4A90]);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_19BF57B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1A1ACFFCC](a1 + 128);
  return a1;
}

void sub_19BF57CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF57E48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF58144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AD03B0](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_19BF582E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF584C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF58768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v24 = v23;

  _Unwind_Resume(a1);
}

void sub_19BF58800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF5884C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF58CDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF58FA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF591FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_19BF595C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF59938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;

  if (v33 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_19BF59A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF59CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF59D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF59DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19BF59E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF59F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19BF59FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF5A014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_19BF5A128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF5A1E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF5A278(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF5CF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45,void *a46,void *a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,void *a56,void *a57,void *a58,void *a59,void *a60,void *a61,void *a62,void *a63)
{
  void *a64;
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *a71;
  void *a72;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;

  _Unwind_Resume(a1);
}

void sub_19BF5E50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19BF5E7C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF5E814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF5EBB4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_19BF5F3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF5F564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_19BF5F708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::BigHeadTieHysteresis(BigHeadTieHysteresis *this)
{
  TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 8, 0, 1);
  TopScoreTieHysteresis::TopScoreTieHysteresis((char *)this + 96, 1, 1);
  *(_QWORD *)this = os_log_create("com.apple.proximity.sharingchoice", "BigHeadTieHysteresis");
}

void sub_19BF5FAC0(_Unwind_Exception *a1)
{
  MagicHeadTieHysteresis *v1;

  MagicHeadTieHysteresis::~MagicHeadTieHysteresis(v1);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible(os_log_t *a1, uint64_t **a2, double a3)
{
  int NumDevices;
  uint64_t *v7;
  uint64_t *v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  BOOL v13;
  int v14;
  uint64_t *v15;
  int v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20[2];
  char v21;
  void *v22[2];
  char v23;
  void *v24[2];
  char v25;
  void *__p[2];
  char v27;
  void *v28[2];
  char v29;

  std::string::basic_string[abi:ne180100]<0>(v28, "A");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v28, a2, 1);
  if (v29 < 0)
    operator delete(v28[0]);
  BigHeadTieHysteresis::selectBigHeadCandidates(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "B");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)__p, a2, 0);
  if (v27 < 0)
    operator delete(__p[0]);
  TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible((uint64_t)(a1 + 1), a2, a3);
  std::string::basic_string[abi:ne180100]<0>(v24, "C");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v24, a2, 0);
  if (v25 < 0)
    operator delete(v24[0]);
  NumDevices = TopScoreTieHysteresis::getNumDevices((TopScoreTieHysteresis *)(a1 + 1));
  v8 = (uint64_t *)(a2 + 1);
  v7 = *a2;
  if (*a2 == (uint64_t *)(a2 + 1))
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = (uint64_t *)v7[1];
      v11 = v7;
      if (v10)
      {
        do
        {
          v12 = v10;
          v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v12 = (uint64_t *)v11[2];
          v13 = *v12 == (_QWORD)v11;
          v11 = v12;
        }
        while (!v13);
      }
      v9 += *((unsigned __int8 *)v7 + 73);
      v7 = v12;
    }
    while (v12 != v8);
  }
  if (NumDevices != v9)
    BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible();
  TopScoreTieHysteresis::mitigateTopScoreBackForthIssuesIfPossible((uint64_t)(a1 + 12), a2, a3);
  std::string::basic_string[abi:ne180100]<0>(v22, "D");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v22, a2, 0);
  if (v23 < 0)
    operator delete(v22[0]);
  v14 = TopScoreTieHysteresis::getNumDevices((TopScoreTieHysteresis *)(a1 + 12));
  v15 = *a2;
  if (*a2 == v8)
  {
    v16 = 0;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = (uint64_t *)v15[1];
      v18 = v15;
      if (v17)
      {
        do
        {
          v19 = v17;
          v17 = (uint64_t *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v19 = (uint64_t *)v18[2];
          v13 = *v19 == (_QWORD)v18;
          v18 = v19;
        }
        while (!v13);
      }
      v16 += *((unsigned __int8 *)v15 + 73);
      v15 = v19;
    }
    while (v19 != v8);
  }
  if (v14 != v16)
    BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible();
  BigHeadTieHysteresis::selectTheWinningBigHeadIfPossible(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v20, "E");
  BigHeadTieHysteresis::logBigHeadCandidates((uint64_t)a1, (uint64_t)v20, a2, 0);
  if (v21 < 0)
    operator delete(v20[0]);
}

void sub_19BF5FD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t BigHeadTieHysteresis::logBigHeadCandidates(uint64_t result, uint64_t a2, _QWORD *a3, int a4)
{
  NSObject **v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  NSObject *v29;
  void *p_p;
  void *__p;
  char v32;
  _QWORD v33[11];
  char v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v6 = (NSObject **)result;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3 + 1;
  v7 = (_QWORD *)*a3;
  if ((_QWORD *)*a3 != a3 + 1)
  {
    v9 = 0;
    do
    {
      v10 = (_QWORD *)v7[1];
      v11 = v7;
      if (v10)
      {
        do
        {
          v12 = v10;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          v12 = (_QWORD *)v11[2];
          v13 = *v12 == (_QWORD)v11;
          v11 = v12;
        }
        while (!v13);
      }
      v9 += *((unsigned __int8 *)v7 + 73);
      v7 = v12;
    }
    while (v12 != v8);
    if (v9)
      goto LABEL_11;
  }
  if (a4)
  {
LABEL_11:
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v33);
    v14 = *(char *)(a2 + 23);
    if (v14 >= 0)
      v15 = a2;
    else
      v15 = *(_QWORD *)a2;
    if (v14 >= 0)
      v16 = *(unsigned __int8 *)(a2 + 23);
    else
      v16 = *(_QWORD *)(a2 + 8);
    v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, v15, v16);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)";", 1);
    v18 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)";", 1);
    v19 = (_QWORD *)*a3;
    if ((_QWORD *)*a3 != v8)
    {
      do
      {
        if (*((_BYTE *)v19 + 73))
        {
          v20 = *((char *)v19 + 55);
          if (v20 >= 0)
            v21 = (uint64_t)(v19 + 4);
          else
            v21 = v19[4];
          if (v20 >= 0)
            v22 = *((unsigned __int8 *)v19 + 55);
          else
            v22 = v19[5];
          v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, v21, v22);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)",", 1);
          v24 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)",", 1);
          v25 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)",", 1);
          v26 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)";", 1);
        }
        v27 = (_QWORD *)v19[1];
        if (v27)
        {
          do
          {
            v28 = v27;
            v27 = (_QWORD *)*v27;
          }
          while (v27);
        }
        else
        {
          do
          {
            v28 = (_QWORD *)v19[2];
            v13 = *v28 == (_QWORD)v19;
            v19 = v28;
          }
          while (!v13);
        }
        v19 = v28;
      }
      while (v28 != v8);
    }
    std::stringbuf::str();
    v29 = *v6;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      p_p = &__p;
      if (v32 < 0)
        p_p = __p;
      *(_DWORD *)buf = 136315138;
      v37 = p_p;
      _os_log_impl(&dword_19BF46000, v29, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
    if (v32 < 0)
      operator delete(__p);
    v33[0] = *MEMORY[0x1E0DE4F60];
    *(_QWORD *)((char *)v33 + *(_QWORD *)(v33[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
    v33[1] = MEMORY[0x1E0DE4FB8] + 16;
    if (v34 < 0)
      operator delete((void *)v33[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    return MEMORY[0x1A1ACFFCC](&v35);
  }
  return result;
}

void sub_19BF6007C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void BigHeadTieHysteresis::selectBigHeadCandidates(os_log_t *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD *v16;
  _QWORD *v17;
  NSObject *v18;
  std::string *v19;
  _QWORD *v20;
  double v21;
  NSObject *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  std::string v31;
  uint8_t buf[4];
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2 + 1;
  v2 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    v6 = 0;
    do
    {
      v7 = (_QWORD *)v2[1];
      v8 = v2;
      if (v7)
      {
        do
        {
          v9 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v8[2];
          v10 = *v9 == (_QWORD)v8;
          v8 = v9;
        }
        while (!v10);
      }
      v6 += *((unsigned __int8 *)v2 + 73);
      v2 = v9;
    }
    while (v9 != v3);
    if (v6)
    {
      std::string::basic_string[abi:ne180100]<0>(&v31, "NA");
      v11 = (_QWORD *)*a2;
      v12 = NAN;
      if ((_QWORD *)*a2 != v3)
      {
        v13 = 181.0;
        do
        {
          if (*((_BYTE *)v11 + 73))
          {
            v14 = *((double *)v11 + 10);
            v15 = fabs(v14);
            if (v13 > v15)
            {
              std::string::operator=(&v31, (const std::string *)(v11 + 4));
              v12 = v14;
              v13 = v15;
            }
          }
          v16 = (_QWORD *)v11[1];
          if (v16)
          {
            do
            {
              v17 = v16;
              v16 = (_QWORD *)*v16;
            }
            while (v16);
          }
          else
          {
            do
            {
              v17 = (_QWORD *)v11[2];
              v10 = *v17 == (_QWORD)v11;
              v11 = v17;
            }
            while (!v10);
          }
          v11 = v17;
        }
        while (v17 != v3);
      }
      v18 = *a1;
      if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
      {
        v19 = &v31;
        if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v19 = (std::string *)v31.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315394;
        v33 = *(double *)&v19;
        v34 = 2048;
        v35 = v12;
        _os_log_impl(&dword_19BF46000, v18, OS_LOG_TYPE_INFO, "Big Head Selection: device %s, minAbsoluteAngleDegreesSigned: %f", buf, 0x16u);
      }
      v20 = (_QWORD *)*a2;
      if ((_QWORD *)*a2 == v3)
        goto LABEL_48;
      do
      {
        if (*((_BYTE *)v20 + 73))
        {
          v21 = *((double *)v20 + 10);
          if (vabdd_f64(v21, v12) > 5.0)
          {
            v22 = *a1;
            if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
            {
              v23 = v20 + 4;
              if (*((char *)v20 + 55) < 0)
                v23 = (_QWORD *)*v23;
              *(_DWORD *)buf = 134218498;
              v33 = v21;
              v34 = 2080;
              v35 = *(double *)&v23;
              v36 = 2048;
              v37 = 0x4014000000000000;
              _os_log_impl(&dword_19BF46000, v22, OS_LOG_TYPE_INFO, "Big Head Selection: nil out angle %f for device %s as angle diff greater than %f degrees!", buf, 0x20u);
            }
            *((_BYTE *)v20 + 73) = 0;
            v20[10] = 0x7FF4000000000000;
            --v6;
          }
        }
        v24 = (_QWORD *)v20[1];
        if (v24)
        {
          do
          {
            v25 = v24;
            v24 = (_QWORD *)*v24;
          }
          while (v24);
        }
        else
        {
          do
          {
            v25 = (_QWORD *)v20[2];
            v10 = *v25 == (_QWORD)v20;
            v20 = v25;
          }
          while (!v10);
        }
        v20 = v25;
      }
      while (v25 != v3);
      v26 = (_QWORD *)*a2;
      if ((_QWORD *)*a2 == v3)
      {
LABEL_48:
        v27 = 0;
      }
      else
      {
        v27 = 0;
        do
        {
          v28 = (_QWORD *)v26[1];
          v29 = v26;
          if (v28)
          {
            do
            {
              v30 = v28;
              v28 = (_QWORD *)*v28;
            }
            while (v28);
          }
          else
          {
            do
            {
              v30 = (_QWORD *)v29[2];
              v10 = *v30 == (_QWORD)v29;
              v29 = v30;
            }
            while (!v10);
          }
          v27 += *((unsigned __int8 *)v26 + 73);
          v26 = v30;
        }
        while (v30 != v3);
      }
      if (v6 != v27)
        __assert_rtn("selectBigHeadCandidates", "BigHeadTieHysteresis.cpp", 105, "numBigHeadCandidates == getNumberOfBigHeadCandidates(output)");
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
    }
  }
}

void sub_19BF60404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(exception_object);
}

uint64_t BigHeadTieHysteresis::getNumberOfBigHeadCandidates(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = (_QWORD *)*a2;
  v2 = a2 + 1;
  v3 = v4;
  if (v4 == v2)
    return 0;
  LODWORD(result) = 0;
  do
  {
    v6 = (_QWORD *)v3[1];
    v7 = v3;
    if (v6)
    {
      do
      {
        v8 = v6;
        v6 = (_QWORD *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        v8 = (_QWORD *)v7[2];
        v9 = *v8 == (_QWORD)v7;
        v7 = v8;
      }
      while (!v9);
    }
    result = result + *((unsigned __int8 *)v3 + 73);
    v3 = v8;
  }
  while (v8 != v2);
  return result;
}

void BigHeadTieHysteresis::selectTheWinningBigHeadIfPossible(os_log_t *a1, _QWORD *a2)
{
  TopScoreTieHysteresis *v4;
  double TopScore;
  NSObject *v6;
  __int128 v7;
  NSObject *v8;
  std::string *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  const void **v18;
  char v19;
  uint64_t v20;
  std::string::size_type size;
  std::string *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  int v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  std::string v34;
  __int128 *v35;
  __int128 *v36;
  _BYTE buf[12];
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (TopScoreTieHysteresis *)(a1 + 12);
  TopScoreTieHysteresis::getTopScoreDevices((TopScoreTieHysteresis *)(a1 + 12), (uint64_t *)&v35);
  if (v35 == v36)
    goto LABEL_64;
  TopScore = TopScoreTieHysteresis::getTopScore(v4);
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3) >= 2)
  {
    v6 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = TopScore;
      _os_log_impl(&dword_19BF46000, v6, OS_LOG_TYPE_INFO, "Big Head Selection: Multiple devices with normalized SOI RSSI %f", buf, 0xCu);
    }
    goto LABEL_64;
  }
  if (*((char *)v35 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v35, *((_QWORD *)v35 + 1));
  }
  else
  {
    v7 = *v35;
    v34.__r_.__value_.__r.__words[2] = *((_QWORD *)v35 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v7;
  }
  v8 = *a1;
  if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
  {
    v9 = &v34;
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v34.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v9;
    v38 = 2048;
    v39 = TopScore;
    _os_log_impl(&dword_19BF46000, v8, OS_LOG_TYPE_INFO, "Big Head Selection: selected big head %s with normalized SOI RSSI %f", buf, 0x16u);
  }
  v10 = a2 + 1;
  v11 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    v12 = 0;
    v13 = (_QWORD *)*a2;
    do
    {
      v14 = (_QWORD *)v13[1];
      v15 = v13;
      if (v14)
      {
        do
        {
          v16 = v14;
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          v16 = (_QWORD *)v15[2];
          v17 = *v16 == (_QWORD)v15;
          v15 = v16;
        }
        while (!v17);
      }
      v12 += *((unsigned __int8 *)v13 + 73);
      v13 = v16;
    }
    while (v16 != v10);
    if (v11 == v10)
      goto LABEL_51;
    while (1)
    {
      v18 = (const void **)(v11 + 4);
      v19 = *((_BYTE *)v11 + 55);
      if (v19 >= 0)
        v20 = *((unsigned __int8 *)v11 + 55);
      else
        v20 = v11[5];
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = v34.__r_.__value_.__l.__size_;
      if (v20 != size)
        goto LABEL_37;
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = &v34;
      else
        v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
      if ((*((_BYTE *)v11 + 55) & 0x80) != 0)
      {
        if (memcmp(*v18, v22, v11[5]))
          goto LABEL_37;
      }
      else if (*((_BYTE *)v11 + 55))
      {
        v23 = (unsigned __int8 *)(v11 + 4);
        v24 = *((unsigned __int8 *)v11 + 55);
        while (*v23 == v22->__r_.__value_.__s.__data_[0])
        {
          ++v23;
          v22 = (std::string *)((char *)v22 + 1);
          if (!--v24)
            goto LABEL_43;
        }
LABEL_37:
        if (*((_BYTE *)v11 + 73))
        {
          v25 = *a1;
          if (os_log_type_enabled(*a1, OS_LOG_TYPE_INFO))
          {
            if (v19 < 0)
              v18 = (const void **)*v18;
            v26 = v11[14];
            v27 = v11[10];
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v27;
            v38 = 2080;
            v39 = *(double *)&v18;
            v40 = 2048;
            v41 = v26;
            _os_log_impl(&dword_19BF46000, v25, OS_LOG_TYPE_INFO, "Big Head Selection: nil out angle %f for device %s with normalized SOI RSSI %f", buf, 0x20u);
          }
          v11[10] = 0x7FF4000000000000;
          *((_BYTE *)v11 + 73) = 0;
          --v12;
        }
      }
LABEL_43:
      v28 = (_QWORD *)v11[1];
      if (v28)
      {
        do
        {
          v29 = v28;
          v28 = (_QWORD *)*v28;
        }
        while (v28);
      }
      else
      {
        do
        {
          v29 = (_QWORD *)v11[2];
          v17 = *v29 == (_QWORD)v11;
          v11 = v29;
        }
        while (!v17);
      }
      v11 = v29;
      if (v29 == v10)
      {
        v11 = (_QWORD *)*a2;
        goto LABEL_51;
      }
    }
  }
  v12 = 0;
LABEL_51:
  if (v11 == v10)
  {
    v30 = 0;
  }
  else
  {
    v30 = 0;
    do
    {
      v31 = (_QWORD *)v11[1];
      v32 = v11;
      if (v31)
      {
        do
        {
          v33 = v31;
          v31 = (_QWORD *)*v31;
        }
        while (v31);
      }
      else
      {
        do
        {
          v33 = (_QWORD *)v32[2];
          v17 = *v33 == (_QWORD)v32;
          v32 = v33;
        }
        while (!v17);
      }
      v30 += *((unsigned __int8 *)v11 + 73);
      v11 = v33;
    }
    while (v33 != v10);
  }
  if (v12 != v30)
    __assert_rtn("selectTheWinningBigHeadIfPossible", "BigHeadTieHysteresis.cpp", 139, "numBigHeadCandidates == getNumberOfBigHeadCandidates(output)");
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
LABEL_64:
  *(_QWORD *)buf = &v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

void sub_19BF6088C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char *a20)
{
  a20 = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a20);
  _Unwind_Resume(a1);
}

double BigHeadTieHysteresis::getBigHeadScore(BigHeadTieHysteresis *this)
{
  return TopScoreTieHysteresis::getTopScore((BigHeadTieHysteresis *)((char *)this + 8));
}

void sub_19BF609A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF60A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF60B88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF60C7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF60D6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF60EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF60F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF60FB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF61094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF611FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id PRErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  const __CFString *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a1 > 199)
  {
    if (a1 > 998)
    {
      switch(a1)
      {
        case 999:
          v7 = CFSTR("Internal Error");
          goto LABEL_30;
        case 2000:
          v7 = CFSTR("Unsupported global parameters combination.");
          goto LABEL_30;
        case 2002:
          v7 = CFSTR("Time conversion failed.");
          goto LABEL_30;
      }
    }
    else
    {
      switch(a1)
      {
        case 200:
          v7 = CFSTR("Failed to start estimating proximity to peer.");
          goto LABEL_30;
        case 201:
          v7 = CFSTR("Failed to stop estimating proximity to peer.");
          goto LABEL_30;
        case 202:
          v7 = CFSTR("Failed to consume RSSI sample.");
LABEL_30:
          v6 = (_QWORD *)MEMORY[0x1E0CB2D50];
          goto LABEL_31;
      }
    }
LABEL_15:
    v7 = CFSTR("Undefined Error");
    goto LABEL_30;
  }
  v6 = (_QWORD *)MEMORY[0x1E0CB2D50];
  v7 = CFSTR("Failed to place service request.");
  switch(a1)
  {
    case 'd':
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unsupported ranging configuration."), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Missing parameters or invalid values provided."), *MEMORY[0x1E0CB2D68]);
      v7 = CFSTR("Make sure that the values provided are supported in this version.");
      v6 = (_QWORD *)MEMORY[0x1E0CB2D80];
      break;
    case 'e':
      break;
    case 'f':
      v7 = CFSTR("Failed to initiate a ranging session.");
      break;
    case 'g':
      v7 = CFSTR("Failed to stop a ranging session.");
      break;
    case 'h':
      v7 = CFSTR("Failed to set Rose config.");
      break;
    case 'i':
    case 'k':
      goto LABEL_15;
    case 'j':
      v7 = CFSTR("Invalid peer information.");
      break;
    case 'l':
      v7 = CFSTR("Invalid ticket id.");
      break;
    case 'm':
      v7 = CFSTR("Rose Provider not ready.");
      break;
    case 'n':
      v7 = CFSTR("Timeout.");
      break;
    case 'o':
      v7 = CFSTR("Unexpected service state.");
      break;
    case 'p':
      v7 = CFSTR("Not user triggered request.");
      break;
    case 'q':
      v7 = CFSTR("Client has no registered request.");
      break;
    default:
      if (a1 != 10)
        goto LABEL_15;
      objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unsupported operation."), *MEMORY[0x1E0CB2D50]);
      v7 = CFSTR("This platform does not support the operation requested.");
      v6 = (_QWORD *)MEMORY[0x1E0CB2D68];
      break;
  }
LABEL_31:
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *v6);
  if (v3)
    objc_msgSend(v5, "addEntriesFromDictionary:", v3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Proximity.ErrorDomain"), a1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void RangeAngleSharingImportanceEstimator::RangeAngleSharingImportanceEstimator(RangeAngleSharingImportanceEstimator *this, char a2)
{
  int64x2_t v4;

  *(_QWORD *)this = &off_1E3D047B8;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = 0x7FF4000000000000;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  v4 = vdupq_n_s64(0x7FF4000000000000uLL);
  *(int64x2_t *)((char *)this + 72) = v4;
  *((_WORD *)this + 44) = 0;
  *((_BYTE *)this + 90) = 0;
  *((int64x2_t *)this + 6) = v4;
  *((_WORD *)this + 56) = 0;
  *((_QWORD *)this + 15) = 0x7FF4000000000000;
  *((_WORD *)this + 64) = 0;
  *((_QWORD *)this + 17) = 0x7FF4000000000000;
  *((_DWORD *)this + 36) = 3;
  *(int64x2_t *)((char *)this + 152) = v4;
  *((_BYTE *)this + 168) = 0;
  *((int64x2_t *)this + 11) = v4;
  *((_QWORD *)this + 24) = os_log_create("com.apple.proximity.sharingchoice", "RangeAngleSharingImportanceEstimator");
  *((_BYTE *)this + 8) = a2;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 44) = 257;
  *((_BYTE *)this + 90) = 0;
  *((_OWORD *)this + 11) = xmmword_19BF79E90;
}

double RangeAngleSharingImportanceEstimator::getTime(RangeAngleSharingImportanceEstimator *this)
{
  return *((double *)this + 2);
}

double RangeAngleSharingImportanceEstimator::getRangeTimeHistoryDelta(RangeAngleSharingImportanceEstimator *this)
{
  double result;

  result = 3.0;
  if (!*((_BYTE *)this + 89))
    return 1.0;
  return result;
}

uint64_t RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  double v5;

  v1 = *(_QWORD *)(this + 64);
  if (v1)
  {
    v2 = this;
    v3 = this + 24;
    do
    {
      v4 = *(_QWORD *)(v2 + 56);
      if (*(_BYTE *)(v2 + 89))
        v5 = 3.0;
      else
        v5 = 1.0;
      if (*(double *)(v2 + 16) - *(double *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8 * (v4 / 0x49)) + 56 * (v4 % 0x49)) <= v5)
        break;
      *(_QWORD *)(v2 + 56) = v4 + 1;
      *(_QWORD *)(v2 + 64) = v1 - 1;
      this = std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__maybe_remove_front_spare[abi:ne180100](v3, 1);
      v1 = *(_QWORD *)(v2 + 64);
    }
    while (v1);
  }
  return this;
}

uint64_t RangeAngleSharingImportanceEstimator::updateRecentMeasurements(uint64_t a1, uint64_t a2)
{
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back((_QWORD *)(a1 + 24), a2);
  return RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(a1);
}

__n128 std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 73 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x49)) + 56 * (v7 % 0x49);
  result = *(__n128 *)a2;
  v10 = *(_OWORD *)(a2 + 16);
  v11 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(v8 + 16) = v10;
  *(_OWORD *)(v8 + 32) = v11;
  *(__n128 *)v8 = result;
  ++a1[5];
  return result;
}

uint64_t RangeAngleSharingImportanceEstimator::handleMeasurements(uint64_t this, const NeighborMeasurements *a2)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int var1_high;
  _QWORD v14[3];
  int v15;
  double v16;
  uint64_t v17;
  char v18;

  v2 = LOBYTE(a2->var0.var0.var1.var0[1]);
  v3 = a2[1].var0.var0.var0.var0.var0.var0[8];
  if (LOBYTE(a2->var0.var0.var1.var0[1]))
    v4 = 0;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v5 = this;
    v6 = *(double *)&a2->var0.var0.var1.var0[2];
    if (!LOBYTE(a2->var0.var0.var1.var0[1]) || v6 >= -0.4)
    {
      v7 = *(double *)a2->var0.var0.var1.var0;
      v8 = *(double *)(this + 16);
      if (v7 - v8 >= -0.5)
      {
        if (v7 - v8 >= 0.0)
        {
          *(double *)(this + 16) = v7;
          v8 = *(double *)a2->var0.var0.var1.var0;
        }
        if (BYTE1(a2->var0.var0.var1.var0[1]))
        {
          v9 = *(double *)&a2[1].var0.var0.var0.var0.var1.var0 * 180.0 / 3.14159265;
          if (v2)
          {
LABEL_12:
            LOBYTE(v3) = 0;
            *(_BYTE *)(this + 89) = 0;
            v10 = 0x4058FFFFFFFFFFFFLL;
LABEL_20:
            v12 = *(double *)a2[1].var0.var0.var1.var0;
            if (!a2[1].var0.var0.var0.var0.var0.var0[16])
              v12 = NAN;
            var1_high = HIDWORD(a2[1].var0.var0.var0.var0.var1.var1);
            *(double *)v14 = v8;
            *(double *)&v14[1] = v6;
            *(double *)&v14[2] = v9;
            v15 = var1_high;
            v16 = v12;
            v17 = v10;
            v18 = v3;
            std::deque<RangeAngleSharingImportanceEstimator::Measurement>::push_back((_QWORD *)(this + 24), (uint64_t)v14);
            return RangeAngleSharingImportanceEstimator::removeOutOfDateMeasurements(v5);
          }
        }
        else
        {
          v9 = NAN;
          if (v2)
            goto LABEL_12;
        }
        v10 = 0;
        if (v3)
        {
          v11 = SHIDWORD(a2[1].var0.var0.var0.var0.var1.var1);
          if (v11 > 2)
          {
            v6 = 15.0;
          }
          else
          {
            v10 = qword_19BF79ED8[v11];
            v6 = dbl_19BF79EF0[v11];
          }
          LOBYTE(v3) = 1;
        }
        else
        {
          v6 = NAN;
        }
        goto LABEL_20;
      }
    }
  }
  return this;
}

double RangeAngleSharingImportanceEstimator::getAverageRangeMeters(RangeAngleSharingImportanceEstimator *this, double a2, double a3, int a4)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  unint64_t v15;

  v4 = *((_QWORD *)this + 4);
  if (*((_QWORD *)this + 5) == v4)
    return NAN;
  v5 = *((_QWORD *)this + 7);
  v6 = (_QWORD *)(v4 + 8 * (v5 / 0x49));
  v7 = *v6 + 56 * (v5 % 0x49);
  v8 = *(_QWORD *)(v4 + 8 * ((*((_QWORD *)this + 8) + v5) / 0x49)) + 56 * ((*((_QWORD *)this + 8) + v5) % 0x49);
  if (v7 == v8)
    return NAN;
  v9 = 0.0;
  v10 = 0.0;
  do
  {
    v11 = *(double *)(v7 + 40);
    if (!a4 || (*(_BYTE *)(v7 + 48) & 1) == 0)
    {
      v12 = a2 - *(double *)v7;
      v13 = v12 < 0.0;
      if (v12 > a3)
        v13 = 1;
      v14 = v9 + *(double *)(v7 + 8) * v11;
      if (v13)
        v11 = -0.0;
      v10 = v10 + v11;
      if (!v13)
        v9 = v14;
    }
    v7 += 56;
    if (v7 - *v6 == 4088)
    {
      v15 = v6[1];
      ++v6;
      v7 = v15;
    }
  }
  while (v7 != v8);
  if (v10 <= 0.0)
    return NAN;
  else
    return fmax(v9 / v10, 0.0);
}

double RangeAngleSharingImportanceEstimator::getAverageRangeMeters(RangeAngleSharingImportanceEstimator *this, double a2, int a3)
{
  double v3;

  v3 = 3.0;
  if (!*((_BYTE *)this + 89))
    v3 = 1.0;
  return RangeAngleSharingImportanceEstimator::getAverageRangeMeters(this, a2, v3, a3);
}

double RangeAngleSharingImportanceEstimator::getMedianSoiRssiDbm(RangeAngleSharingImportanceEstimator *this, double a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  double v10;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  char *__p;
  char *v25;
  char *v26;

  __p = 0;
  v25 = 0;
  v26 = 0;
  v2 = *((_QWORD *)this + 4);
  if (*((_QWORD *)this + 5) == v2)
    return -INFINITY;
  v3 = *((_QWORD *)this + 7);
  v4 = *(_QWORD *)(v2 + 8 * (v3 / 0x49)) + 56 * (v3 % 0x49);
  v5 = *(_QWORD *)(v2 + 8 * ((*((_QWORD *)this + 8) + v3) / 0x49)) + 56 * ((*((_QWORD *)this + 8) + v3) % 0x49);
  if (v4 == v5)
    return -INFINITY;
  v7 = 0;
  v8 = (_QWORD *)(v2 + 8 * (v3 / 0x49));
  do
  {
    v9 = *(_QWORD *)(v4 + 32);
    v10 = a2 - *(double *)v4;
    if (v10 >= 0.0 && v10 <= 1.0)
    {
      if (v7 >= v26)
      {
        v13 = __p;
        v14 = (v7 - __p) >> 3;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        v16 = v26 - __p;
        if ((v26 - __p) >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v26, v17);
          v13 = __p;
          v7 = v25;
        }
        else
        {
          v18 = 0;
        }
        v19 = &v18[8 * v14];
        *(_QWORD *)v19 = v9;
        v12 = v19 + 8;
        while (v7 != v13)
        {
          v20 = *((_QWORD *)v7 - 1);
          v7 -= 8;
          *((_QWORD *)v19 - 1) = v20;
          v19 -= 8;
        }
        __p = v19;
        v26 = &v18[8 * v17];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *(_QWORD *)v7 = v9;
        v12 = v7 + 8;
      }
      v25 = v12;
      v7 = v12;
    }
    v4 += 56;
    if (v4 - *v8 == 4088)
    {
      v21 = v8[1];
      ++v8;
      v4 = v21;
    }
  }
  while (v4 != v5);
  if (__p != v7)
  {
    std::__sort<std::__less<double,double> &,double *>();
    v7 = __p;
    v22 = *(double *)&__p[((v25 - __p) >> 1) & 0xFFFFFFFFFFFFFFF8];
LABEL_32:
    operator delete(v7);
    return v22;
  }
  v22 = -INFINITY;
  if (v7)
    goto LABEL_32;
  return v22;
}

void sub_19BF61EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double RangeAngleSharingImportanceEstimator::getMedianAngleDegrees(RangeAngleSharingImportanceEstimator *this, double a2)
{
  double v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  char *__p;
  char *v25;
  char *v26;

  if (!*((_BYTE *)this + 8))
    return NAN;
  if (*((_BYTE *)this + 89))
    return NAN;
  __p = 0;
  v25 = 0;
  v26 = 0;
  v4 = *((_QWORD *)this + 4);
  if (*((_QWORD *)this + 5) == v4)
    return NAN;
  v5 = *((_QWORD *)this + 7);
  v6 = *(_QWORD *)(v4 + 8 * (v5 / 0x49)) + 56 * (v5 % 0x49);
  v7 = *(_QWORD *)(v4 + 8 * ((*((_QWORD *)this + 8) + v5) / 0x49)) + 56 * ((*((_QWORD *)this + 8) + v5) % 0x49);
  if (v6 == v7)
    return NAN;
  v9 = 0;
  v10 = (_QWORD *)(v4 + 8 * (v5 / 0x49));
  do
  {
    v11 = *(_QWORD *)(v6 + 16);
    v12 = a2 - *(double *)v6;
    if (v12 >= 0.0 && v12 <= 0.5)
    {
      if (v9 >= v26)
      {
        v15 = __p;
        v16 = (v9 - __p) >> 3;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61)
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        v18 = v26 - __p;
        if ((v26 - __p) >> 2 > v17)
          v17 = v18 >> 2;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
          v19 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v26, v19);
          v15 = __p;
          v9 = v25;
        }
        else
        {
          v20 = 0;
        }
        v21 = &v20[8 * v16];
        *(_QWORD *)v21 = v11;
        v14 = v21 + 8;
        while (v9 != v15)
        {
          v22 = *((_QWORD *)v9 - 1);
          v9 -= 8;
          *((_QWORD *)v21 - 1) = v22;
          v21 -= 8;
        }
        __p = v21;
        v26 = &v20[8 * v19];
        if (v15)
          operator delete(v15);
      }
      else
      {
        *(_QWORD *)v9 = v11;
        v14 = v9 + 8;
      }
      v25 = v14;
      v9 = v14;
    }
    v6 += 56;
    if (v6 - *v10 == 4088)
    {
      v23 = v10[1];
      ++v10;
      v6 = v23;
    }
  }
  while (v6 != v7);
  if (__p != v9)
  {
    std::__sort<std::__less<double,double> &,double *>();
    v9 = __p;
    v2 = *(double *)&__p[((v25 - __p) >> 1) & 0xFFFFFFFFFFFFFFF8];
LABEL_35:
    operator delete(v9);
    return v2;
  }
  v2 = NAN;
  if (v9)
    goto LABEL_35;
  return v2;
}

void sub_19BF62128(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t RangeAngleSharingImportanceEstimator::getPreviousBTCoarseRange(RangeAngleSharingImportanceEstimator *this, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *((unsigned int *)this + 16);
  while ((int)v2 >= 1)
  {
    v3 = v2 + *((_QWORD *)this + 7);
    --v2;
    v4 = v3 - 1;
    v5 = (v3 - 1) / 0x49uLL;
    v6 = *(_QWORD *)(*((_QWORD *)this + 4) + 8 * v5);
    v7 = v4 - 73 * v5;
    if (*(double *)(v6 + 56 * v7) <= a2)
      return *(unsigned int *)(v6 + 56 * v7 + 24);
  }
  return 3;
}

BOOL RangeAngleSharingImportanceEstimator::isOutsideFOVRegionWithHysteresis(RangeAngleSharingImportanceEstimator *this, double a2, double a3)
{
  double v3;
  _BOOL4 v4;
  BOOL v5;

  v3 = fabs(a3);
  if (*((_BYTE *)this + 88))
  {
    v4 = a2 + 0.25 > 4.0;
    v5 = v3 + 5.0 <= 20.0;
  }
  else
  {
    v4 = a2 + -0.25 > 4.0;
    v5 = fabs(v3 + -5.0) <= 20.0;
  }
  return !v5 || v4;
}

BOOL RangeAngleSharingImportanceEstimator::isSuperCloseWithHysteresis(RangeAngleSharingImportanceEstimator *this, double a2)
{
  if (*((_BYTE *)this + 89))
    return 0;
  if (*((_BYTE *)this + 90))
    return a2 <= 0.35;
  return a2 <= 0.25;
}

void RangeAngleSharingImportanceEstimator::getScoreEstimate(uint64_t a1, uint64_t a2, double a3)
{
  int v6;
  double v7;
  double AverageRangeMeters;
  double v9;
  double v11;
  _BOOL4 v12;
  char v13;
  char v14;
  double MedianAngleDegrees;
  double v16;
  double v17;
  double v18;
  double v20;

  v6 = *(unsigned __int8 *)(a1 + 89);
  if (*(_BYTE *)(a1 + 89))
    v7 = 3.0;
  else
    v7 = 1.0;
  AverageRangeMeters = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v7, 1);
  *(double *)(a1 + 72) = AverageRangeMeters;
  *(_BYTE *)(a2 + 8) = 1;
  v9 = 0.0;
  if (AverageRangeMeters >= 0.0 && AverageRangeMeters <= 10.0)
    v9 = AverageRangeMeters / -10.0 + 1.0;
  *(double *)a2 = v9;
  v11 = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v7, 1);
  if (v6 || (*(_BYTE *)(a1 + 90) ? (v12 = v11 <= 0.35) : (v12 = v11 <= 0.25), !v12))
  {
    MedianAngleDegrees = RangeAngleSharingImportanceEstimator::getMedianAngleDegrees((RangeAngleSharingImportanceEstimator *)a1, a3);
    *(double *)(a1 + 80) = MedianAngleDegrees;
    v16 = *(double *)(a1 + 72);
    v17 = fabs(MedianAngleDegrees);
    if (*(_BYTE *)(a1 + 88))
    {
      v18 = v16 + 0.25;
      if (v17 + 5.0 > 20.0 || v18 > 4.0)
      {
LABEL_20:
        v14 = 0;
        *(_QWORD *)(a1 + 80) = 0x7FF4000000000000;
        v13 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      v20 = fabs(v17 + -5.0);
      if (v16 + -0.25 > 4.0 || v20 > 20.0)
        goto LABEL_20;
    }
    v14 = 0;
    v13 = 0;
    goto LABEL_27;
  }
  v13 = 0;
  *(_QWORD *)(a1 + 80) = 0;
  v14 = 1;
LABEL_27:
  *(_BYTE *)(a1 + 90) = v14;
  *(_BYTE *)(a1 + 88) = v13;
}

void RangeAngleSharingImportanceEstimator::computeNormalizedSoiRssiDbm(uint64_t a1, uint64_t a2, double a3)
{
  double v6;
  double MedianSoiRssiDbm;
  NSObject *v8;
  uint64_t v9;
  double v10;
  int v11;
  double v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *(double *)(a2 + 40);
  MedianSoiRssiDbm = RangeAngleSharingImportanceEstimator::getMedianSoiRssiDbm((RangeAngleSharingImportanceEstimator *)a1, a3);
  if (v6 > 0.0)
    MedianSoiRssiDbm = MedianSoiRssiDbm + log10(*(long double *)(a2 + 40)) * 20.0;
  *(double *)(a2 + 56) = MedianSoiRssiDbm;
  if (fabs(MedianSoiRssiDbm) == INFINITY)
  {
    v8 = *(NSObject **)(a1 + 192);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 176);
      v10 = a3 - *(double *)(a1 + 184);
      v11 = 134218496;
      v12 = MedianSoiRssiDbm;
      v13 = 2048;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_19BF46000, v8, OS_LOG_TYPE_INFO, "normalizedSoiRssiDbm %f, use %f computed %f(s) ago instead", (uint8_t *)&v11, 0x20u);
    }
    *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 176);
  }
  else
  {
    *(double *)(a1 + 176) = MedianSoiRssiDbm;
    *(double *)(a1 + 184) = a3;
  }
  if (*(_BYTE *)(a2 + 33))
    *(_QWORD *)(a2 + 56) = 0x7FF0000000000000;
}

void RangeAngleSharingImportanceEstimator::getImportanceEstimate(uint64_t a1, uint64_t a2, double a3)
{
  double v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = *(double *)(a1 + 16);
  if (a3 - v6 <= 3.0)
  {
    if (*(_BYTE *)(a1 + 168) && (v6 < a3 || *(double *)(a1 + 160) == a3))
    {
      v8 = *(_OWORD *)(a1 + 96);
      v9 = *(_OWORD *)(a1 + 112);
      v10 = *(_OWORD *)(a1 + 144);
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 128);
      *(_OWORD *)(a2 + 48) = v10;
      *(_OWORD *)a2 = v8;
      *(_OWORD *)(a2 + 16) = v9;
      if (a3 - *(double *)(a1 + 160) > 0.5 && !*(_BYTE *)(a1 + 90))
      {
        *(_QWORD *)(a2 + 24) = 0x7FF4000000000000;
        *(_BYTE *)(a2 + 17) = 0;
      }
    }
    else
    {
      *(_QWORD *)v22 = 0x7FF4000000000000;
      v22[8] = 0;
      RangeAngleSharingImportanceEstimator::getScoreEstimate(a1, (uint64_t)v22, a3);
      *(_QWORD *)a2 = *(_QWORD *)v22;
      *(_BYTE *)(a2 + 16) = v22[8];
      v11 = 1.0;
      if (*(_BYTE *)(a1 + 89))
        v11 = 3.0;
      *(double *)(a2 + 40) = RangeAngleSharingImportanceEstimator::getAverageRangeMeters((RangeAngleSharingImportanceEstimator *)a1, a3, v11, 1);
      *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 80);
      *(_BYTE *)(a2 + 32) = 1;
      *(_BYTE *)(a2 + 17) = 1;
      v12 = *(unsigned int *)(a1 + 64);
      while ((int)v12 >= 1)
      {
        v13 = v12 + *(_QWORD *)(a1 + 56);
        --v12;
        v14 = v13 - 1;
        v15 = (v13 - 1) / 0x49uLL;
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v15);
        v17 = v14 - 73 * v15;
        if (*(double *)(v16 + 56 * v17) <= a3)
        {
          v18 = *(_DWORD *)(v16 + 56 * v17 + 24);
          goto LABEL_17;
        }
      }
      v18 = 3;
LABEL_17:
      *(_DWORD *)(a2 + 48) = v18;
      *(_BYTE *)(a2 + 33) = *(_BYTE *)(a1 + 90);
      RangeAngleSharingImportanceEstimator::computeNormalizedSoiRssiDbm(a1, a2, a3);
      if (*(double *)(a1 + 16) == a3)
      {
        v19 = *(_OWORD *)a2;
        v20 = *(_OWORD *)(a2 + 16);
        v21 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 144) = v21;
        *(_OWORD *)(a1 + 96) = v19;
        *(_OWORD *)(a1 + 112) = v20;
        *(double *)(a1 + 160) = a3;
        *(_BYTE *)(a1 + 168) = 1;
      }
    }
  }
  else
  {
    *(_WORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 24) = 0x7FF4000000000000;
    *(_WORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0x7FF4000000000000;
    *(_DWORD *)(a2 + 48) = 3;
    *(_QWORD *)(a2 + 56) = 0xFFF0000000000000;
    v7 = *(NSObject **)(a1 + 192);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 134217984;
      *(_QWORD *)&v22[4] = 0x4008000000000000;
      _os_log_impl(&dword_19BF46000, v7, OS_LOG_TYPE_INFO, "[WARNING] Measurement gap more than %f(s)", v22, 0xCu);
    }
  }
}

void RangeAngleSharingImportanceEstimator::~RangeAngleSharingImportanceEstimator(RangeAngleSharingImportanceEstimator *this)
{
  *(_QWORD *)this = &off_1E3D047B8;
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100]((_QWORD *)this + 3);
}

{
  *(_QWORD *)this = &off_1E3D047B8;
  std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100]((_QWORD *)this + 3);
  JUMPOUT(0x1A1ACFFFCLL);
}

uint64_t std::deque<RangeAngleSharingImportanceEstimator::Measurement>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 36;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 73;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

uint64_t std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x49)
    a2 = 1;
  if (v2 < 0x92)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 73;
  }
  return v4 ^ 1u;
}

void std::deque<RangeAngleSharingImportanceEstimator::Measurement>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x49;
  v4 = v2 - 73;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFF8uLL);
      std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFF8uLL);
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFF8uLL);
  std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_19BF62C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void sub_19BF638B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

__CFString *PRRangingServiceStateToString(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E3D04908[a1];
}

__CFString *PRRangingServiceStateCauseToString(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return off_1E3D04930[a1];
}

uint64_t PRPingRadio()
{
  void *v0;
  __CFString *v1;
  id v2;
  uint64_t v3;

  NSLog(CFSTR("Sending Hello Command with 10 seconds timeout."));
  PRSendHelloWithTimeout(10000);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    NSLog(CFSTR("Hello Response:"));
    v1 = CFSTR("===================================");
    NSLog(CFSTR("==================================="));
    objc_msgSend(v0, "description");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    NSLog(CFSTR("%s"), objc_msgSend(v2, "UTF8String"));

    v3 = 1;
  }
  else
  {
    v3 = 0;
    v1 = CFSTR("Error sending/receving hello");
  }
  NSLog(&v1->isa);

  return v3;
}

id PRSendHelloWithTimeout(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__1;
    v12 = __Block_byref_object_dispose__1;
    v13 = 0;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PRSendHelloWithTimeout_block_invoke_2;
    v7[3] = &unk_1E3D04A90;
    v7[4] = &v8;
    objc_msgSend(v4, "sendHelloSync:reply:", a1, v7);

    objc_msgSend(v3, "invalidate");
    v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19BF640A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRGetPreflightInfo()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__1;
    v10 = __Block_byref_object_dispose__1;
    v11 = 0;
    objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __PRGetPreflightInfo_block_invoke_2;
    v5[3] = &unk_1E3D049B8;
    v5[4] = &v6;
    objc_msgSend(v2, "getPreflightInfo:", v5);

    objc_msgSend(v1, "invalidate");
    v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_19BF641B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getDiagnosticsServiceXPCConnection()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.diagnostics"), 4096);
  PRMakeDiagnosticsServerXPCInterface();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRemoteObjectInterface:", v1);

  objc_msgSend(v0, "resume");
  return v0;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

BOOL PRRoseHasFailedUpdate()
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!PRIsSupportedPlatform())
    return 0;
  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
    return 0;
  v1 = v0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PRRoseHasFailedUpdate_block_invoke_2;
  v5[3] = &unk_1E3D04A00;
  v5[4] = &v6;
  objc_msgSend(v2, "hasFailedRoseUpdate:", v5);

  objc_msgSend(v1, "invalidate");
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_19BF64330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRGetChipInfo()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!PRIsSupportedPlatform())
    return 0;
  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = getDiagnosticsServiceXPCConnection();
  if (!v0)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PRGetChipInfo_block_invoke_2;
  v5[3] = &unk_1E3D04A48;
  v5[4] = &v6;
  objc_msgSend(v2, "getChipInfo:", v5);

  objc_msgSend(v0, "invalidate");
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_19BF64464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRGetPowerStatsWithTimeout(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__1;
    v12 = __Block_byref_object_dispose__1;
    v13 = 0;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PRGetPowerStatsWithTimeout_block_invoke_2;
    v7[3] = &unk_1E3D04AD8;
    v7[4] = &v8;
    objc_msgSend(v4, "getPowerStatsSync:reply:", a1, v7);

    objc_msgSend(v3, "invalidate");
    v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19BF645A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRSetMcc(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v1 = a1;
  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v3 = objc_retainAutorelease(v1);
    NSLog(CFSTR("[PRDiagnostic] PRSetMcc %s"), objc_msgSend(v3, "UTF8String"));
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PRSetMcc_block_invoke_2;
    v7[3] = &unk_1E3D04A00;
    v7[4] = &v8;
    objc_msgSend(v4, "setRegulatoryMcc:reply:", v3, v7);

    objc_msgSend(v2, "invalidate");
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19BF646D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRSetIsoCountry(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v1 = a1;
  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PRSetIsoCountry_block_invoke_2;
    v7[3] = &unk_1E3D04A00;
    v7[4] = &v8;
    objc_msgSend(v4, "setRegulatoryIsoCountry:reply:", v1, v7);

    objc_msgSend(v3, "invalidate");
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19BF647EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRSetAccessoryState(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a1);
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PRSetAccessoryState_block_invoke_2;
    v7[3] = &unk_1E3D04A00;
    v7[4] = &v8;
    objc_msgSend(v4, "setRegulatoryAccessoryState:reply:", v3, v7);

    objc_msgSend(v2, "invalidate");
    v5 = *((_BYTE *)v9 + 24) != 0;

    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_19BF64918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRCollectLogs(unint64_t a1)
{
  _BOOL8 v1;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (a1 < 5)
  {
    getDiagnosticsServiceXPCConnection();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2020000000;
      v11 = 0;
      objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __PRCollectLogs_block_invoke_2;
      v7[3] = &unk_1E3D04A00;
      v7[4] = &v8;
      objc_msgSend(v5, "triggerLogCollection:reply:", a1, v7);

      objc_msgSend(v4, "invalidate");
      v1 = *((_BYTE *)v9 + 24) != 0;
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      v1 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("PRCollectLogs: invalid log type"));
    return 0;
  }
  return v1;
}

void sub_19BF64A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRSetRoseGlobalConfigParams(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v1 = a1;
  if (v1)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    getDiagnosticsServiceXPCConnection();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_27);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __PRSetRoseGlobalConfigParams_block_invoke_2;
    v6[3] = &unk_1E3D04A00;
    v6[4] = &v7;
    objc_msgSend(v3, "setRoseGlobalConfigParams:reply:", v1, v6);

    objc_msgSend(v2, "invalidate");
    v4 = *((_BYTE *)v8 + 24) != 0;

    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_19BF64B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t PRGetChipPowerState(_BYTE *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v1 = (unint64_t)a1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (a1)
  {
    getDiagnosticsServiceXPCConnection();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_28_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __PRGetChipPowerState_block_invoke_2;
    v5[3] = &unk_1E3D04BC0;
    v5[4] = &v6;
    v5[5] = &v10;
    objc_msgSend(v3, "getRoseChipPowerState:", v5);

    *(_BYTE *)v1 = *((_BYTE *)v11 + 24);
    objc_msgSend(v2, "invalidate");
    v1 = *((_BYTE *)v7 + 24) != 0;

  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v1;
}

void sub_19BF64C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t PRRequestPowerChange(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PRRequestPowerChange_block_invoke_2;
  v6[3] = &unk_1E3D04A00;
  v6[4] = &v7;
  objc_msgSend(v3, "requestPowerChange:reply:", a1, v6);

  objc_msgSend(v2, "invalidate");
  v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_19BF64D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PRGetChipType()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PRGetChipType_block_invoke_2;
  v4[3] = &unk_1E3D04C28;
  v4[4] = &v5;
  objc_msgSend(v1, "getChipType:", v4);

  objc_msgSend(v0, "invalidate");
  v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19BF64E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PRGetChipPublicKey()
{
  void *v0;
  void *v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_33);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PRGetChipPublicKey_block_invoke_2;
  v4[3] = &unk_1E3D04C70;
  v4[4] = &v5;
  objc_msgSend(v1, "getChipPublicKey:", v4);

  objc_msgSend(v0, "invalidate");
  v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19BF64F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PRSetNarrowbandSARState(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  getDiagnosticsServiceXPCConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PRSetNarrowbandSARState_block_invoke_2;
  v6[3] = &unk_1E3D04A00;
  v6[4] = &v7;
  objc_msgSend(v3, "setNarrowbandSarState:reply:", a1, v6);

  objc_msgSend(v2, "invalidate");
  v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_19BF6507C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PRGetDeepSleepState()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  getDiagnosticsServiceXPCConnection();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PRGetDeepSleepState_block_invoke_2;
  v4[3] = &unk_1E3D04C28;
  v4[4] = &v5;
  objc_msgSend(v1, "getDeepSleepState:", v4);

  objc_msgSend(v0, "invalidate");
  v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_19BF65164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BF65294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF65700(_Unwind_Exception *a1)
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

void sub_19BF659B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;

  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);

  _Unwind_Resume(a1);
}

void sub_19BF65A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF65AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void DaemonBackedService::connect(id *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, char a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v25 = a2;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v25, a3);
  v24 = *a1;
  *a1 = (id)v23;

  objc_msgSend(*a1, "setExportedObject:", v17);
  objc_msgSend(*a1, "setExportedInterface:", v18);
  objc_msgSend(*a1, "setRemoteObjectInterface:", v19);
  if (v20)
    objc_msgSend(*a1, "_setQueue:", v20);
  objc_msgSend(*a1, "setInterruptionHandler:", v22);
  objc_msgSend(*a1, "setInvalidationHandler:", v21);
  if (a10)
    objc_msgSend(*a1, "resume");

}

void sub_19BF65BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19BF65CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;
  id *v17;

  v17 = v16;
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_19BF65D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF65E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_19BF65F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF65F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PRBeacon;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19BF66028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF660C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void dispatchAsyncOnQueue(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *queue;

  queue = a1;
  v3 = a2;
  if (queue)
    dispatch_async(queue, v3);
  else
    v3[2](v3);

}

void sub_19BF6613C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF66194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF6624C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF662EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF66604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;

  objc_destroyWeak(v29);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);

  _Unwind_Resume(a1);
}

void sub_19BF666B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF66700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF6678C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6680C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF6687C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PRBeaconListener;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19BF66934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF669D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19BF66A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF66ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF66B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF67658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF67908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19BF67A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_19BF67B48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF67C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF67D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

__n128 std::deque<BtProxData>::push_back(_QWORD *a1, __n128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __n128 *v8;
  __n128 result;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 170 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<BtProxData>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = (__n128 *)(*(_QWORD *)(v5 + 8 * (v7 / 0xAA)) + 24 * (v7 % 0xAA));
  result = *a2;
  v8[1].n128_u64[0] = a2[1].n128_u64[0];
  *v8 = result;
  ++a1[5];
  return result;
}

void sub_19BF6811C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19BF68220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF68354(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19BF684C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19BF6877C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF68928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF68B30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19BF68BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF68C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::default_delete<SingleThresholdProx::Estimator>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
  {
    v2 = *(void **)(a2 + 80);
    if (v2)
    {
      *(_QWORD *)(a2 + 88) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1A1ACFFFCLL);
  }
}

uint64_t std::deque<BtProxData>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 85;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 170;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::deque<BtProxData>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0xAA)
    a2 = 1;
  if (v2 < 0x154)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 170;
  }
  return v4 ^ 1u;
}

void std::deque<BtProxData>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0xAA;
  v4 = v2 - 170;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFF0uLL);
      std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFF0uLL);
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFF0uLL);
  std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<RangeAngleSharingImportanceEstimator::Measurement *>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_19BF690C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::vector<BtProxData>::vector<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,0>(uint64_t a1, _QWORD *a2, __int128 *a3, _QWORD *a4, __int128 *a5)
{
  unint64_t v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (a5 == a3)
    v6 = 0;
  else
    v6 = 170 * (a4 - a2)
       - 0x5555555555555555 * (((uint64_t)a5 - *a4) >> 3)
       + 0x5555555555555555 * (((uint64_t)a3 - *a2) >> 3);
  std::vector<BtProxData>::__init_with_size[abi:ne180100]<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>>((char *)a1, a2, a3, (uint64_t)a4, a5, v6);
  return a1;
}

char *std::vector<BtProxData>::__init_with_size[abi:ne180100]<std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>,std::__deque_iterator<BtProxData,BtProxData*,BtProxData&,BtProxData**,long,170l>>(char *result, _QWORD *a2, __int128 *a3, uint64_t a4, __int128 *a5, unint64_t a6)
{
  char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 *v12;

  if (a6)
  {
    v9 = result;
    result = std::vector<BtProxData>::__vallocate[abi:ne180100](result, a6);
    v10 = *((_QWORD *)v9 + 1);
    while (a3 != a5)
    {
      v11 = *a3;
      *(_QWORD *)(v10 + 16) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v10 = v11;
      a3 = (__int128 *)((char *)a3 + 24);
      if ((__int128 *)((char *)a3 - *a2) == (__int128 *)4080)
      {
        v12 = (__int128 *)a2[1];
        ++a2;
        a3 = v12;
      }
      v10 += 24;
    }
    *((_QWORD *)v9 + 1) = v10;
  }
  return result;
}

void sub_19BF6920C(_Unwind_Exception *exception_object)
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

char *std::vector<BtProxData>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_19BF692BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF693A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19BF69460(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1A1ACFFFC](v1, 0x10A0C404BE6215DLL);
  _Unwind_Resume(a1);
}

void sub_19BF69C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,_QWORD *a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  void *v55;

  std::__tree<Region>::destroy((uint64_t)&a46, a47);
  _Unwind_Resume(a1);
}

void sub_19BF6A63C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19BF6A9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  void *v11;

  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void std::vector<NeighborMeasurements>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<NeighborMeasurements>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<NeighborMeasurements>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 88)
  {
    if (*(char *)(i - 65) < 0)
      operator delete(*(void **)(i - 88));
  }
  a1[1] = v2;
}

SharingImportanceManager *std::unique_ptr<SharingImportanceManager>::reset[abi:ne180100](SharingImportanceManager **a1, SharingImportanceManager *a2)
{
  SharingImportanceManager *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    SharingImportanceManager::~SharingImportanceManager(result);
    JUMPOUT(0x1A1ACFFFCLL);
  }
  return result;
}

void SharingImportanceManager::~SharingImportanceManager(SharingImportanceManager *this)
{
  void **v2;

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 344, *((_QWORD **)this + 44));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 320, *((_QWORD **)this + 41));

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 256, *((_QWORD **)this + 33));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 232, *((_QWORD **)this + 30));

  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 160, *((_QWORD **)this + 21));
  std::__tree<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::__map_value_compare<std::string,std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,TopScoreTieHysteresis::DeviceScore>>>::destroy((uint64_t)this + 136, *((_QWORD **)this + 18));

  v2 = (void **)((char *)this + 72);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 48);
  std::vector<SharingHysteresis::DeviceScore>::__destroy_vector::operator()[abi:ne180100](&v2);
  std::__tree<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<SharingImportanceEstimator>>>>::destroy((uint64_t)this, *((_QWORD **)this + 1));
}

uint64_t **std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  _QWORD *v11;

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
    v11 = operator new(0x30uLL);
    v11[4] = **a4;
    *((_BYTE *)v11 + 40) = 0;
    std::__tree<Region>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return (uint64_t **)v11;
  }
  return v9;
}

__n128 std::vector<NeighborMeasurements>::__construct_one_at_end[abi:ne180100]<NeighborMeasurements const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  result = *(__n128 *)((char *)a2 + 24);
  v7 = *(__int128 *)((char *)a2 + 40);
  v8 = *(__int128 *)((char *)a2 + 56);
  *(_OWORD *)(v4 + 66) = *(__int128 *)((char *)a2 + 66);
  *(_OWORD *)(v4 + 56) = v8;
  *(_OWORD *)(v4 + 40) = v7;
  *(__n128 *)(v4 + 24) = result;
  *(_QWORD *)(a1 + 8) = v4 + 88;
  return result;
}

void sub_19BF6AF0C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<NeighborMeasurements>::__push_back_slow_path<NeighborMeasurements const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v19[2];
  std::string *v20;
  char *v21;
  uint64_t *v22;

  v3 = *a1;
  v4 = 0x2E8BA2E8BA2E8BA3 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x2E8BA2E8BA2E8BALL)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x2E8BA2E8BA2E8BA3 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x1745D1745D1745DLL)
    v9 = 0x2E8BA2E8BA2E8BALL;
  else
    v9 = v5;
  v22 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NeighborMeasurements>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[88 * v4];
  v19[0] = v10;
  v19[1] = v11;
  v20 = v11;
  v21 = &v10[88 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v20;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v13 = &v10[88 * v4];
  v14 = *(__int128 *)((char *)a2 + 56);
  v15 = *(__int128 *)((char *)a2 + 66);
  v16 = *(__int128 *)((char *)a2 + 24);
  *(_OWORD *)(v13 + 40) = *(__int128 *)((char *)a2 + 40);
  *(_OWORD *)(v13 + 24) = v16;
  *(_OWORD *)(v13 + 66) = v15;
  *(_OWORD *)(v13 + 56) = v14;
  v20 = (std::string *)((char *)v11 + 88);
  std::vector<NeighborMeasurements>::__swap_out_circular_buffer(a1, v19);
  v17 = a1[1];
  std::__split_buffer<NeighborMeasurements>::~__split_buffer((uint64_t)v19);
  return v17;
}

void sub_19BF6B060(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<NeighborMeasurements>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<NeighborMeasurements>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NeighborMeasurements>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2E8BA2E8BA2E8BBLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(88 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>,std::reverse_iterator<NeighborMeasurements*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v15[3];
  char v16;
  __int128 v17;
  __int128 v18;

  v7 = a7;
  *(_QWORD *)&v18 = a6;
  *((_QWORD *)&v18 + 1) = a7;
  v17 = v18;
  v15[0] = a1;
  v15[1] = &v17;
  v15[2] = &v18;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 88);
      *(_QWORD *)(v9 - 72) = *(_QWORD *)(a3 - 72);
      *(_OWORD *)(v9 - 88) = v10;
      *(_QWORD *)(a3 - 80) = 0;
      *(_QWORD *)(a3 - 72) = 0;
      *(_QWORD *)(a3 - 88) = 0;
      v11 = *(_OWORD *)(a3 - 64);
      v12 = *(_OWORD *)(a3 - 48);
      v13 = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 22) = *(_OWORD *)(a3 - 22);
      *(_OWORD *)(v9 - 48) = v12;
      *(_OWORD *)(v9 - 32) = v13;
      *(_OWORD *)(v9 - 64) = v11;
      v9 -= 88;
      v7 -= 88;
      a3 -= 88;
    }
    while (a3 != a5);
    *((_QWORD *)&v18 + 1) = v9;
  }
  v16 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v15);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<NeighborMeasurements>,std::reverse_iterator<NeighborMeasurements*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 88;
  }
}

uint64_t std::__split_buffer<NeighborMeasurements>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<NeighborMeasurements>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<NeighborMeasurements>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 11;
      *(_QWORD *)(a1 + 16) = v2 - 11;
      if (*((char *)v2 - 65) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_19BF6B458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19BF6B694(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v6 = v1;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_19BF6B728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF6B770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19BF6B918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF6BA34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19BF6BB74(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19BF6BCB4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_19BF6BD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF6BDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19BF6BE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6BED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6BF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6BFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19BF6C0A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;

  v18 = v17;
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6C150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6C224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6C2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6C398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6C438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6C50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6C5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19BF6C680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  void *v15;
  id *v16;

  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6C720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id PRMakeRangingServerXPCInterface()
{
  if (PRMakeRangingServerXPCInterface_onceToken != -1)
    dispatch_once(&PRMakeRangingServerXPCInterface_onceToken, &__block_literal_global_4);
  return (id)PRMakeRangingServerXPCInterface_interface;
}

id _PRMakeRangingServerInterfaceWithProtocol(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_connectWithClientInfo_, 0, 0);

  return v1;
}

id PRMakeRangingClientXPCInterface()
{
  return _PRMakeRangingClientInterfaceWithProtocol((uint64_t)&unk_1EE4164C8);
}

id _PRMakeRangingClientInterfaceWithProtocol(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_didReceiveNewSolutions_, 0, 0);
  objc_msgSend(v1, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didFailWithError_, 0, 0);
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_remoteDevice_didChangeState_, 0, 0);

  return v1;
}

id PRMakeAidedRangingClientXPCInterface()
{
  void *v0;

  _PRMakeRangingClientInterfaceWithProtocol((uint64_t)&unk_1EE416540);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendDataToPeers_, 0, 0);
  return v0;
}

id PRMakeBTRangingClientXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4180B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didFailWithError_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_didFetchTxPower_fromDevice_withError_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didConnectDevice_error_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didStartRangingOnDevice_withError_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_didStopOwnerRangingOnDevice_withError_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_didReceiveNewBTRSSI_, 0, 0);

  return v0;
}

id PRMakeDiagnosticsServerXPCInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419280);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_sendHelloSync_reply_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getChipInfo_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getPowerStatsSync_reply_, 0, 1);
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getPreflightInfo_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getChipPublicKey_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setRoseGlobalConfigParams_reply_, 0, 0);

  return v0;
}

id PRMakeProtobufServerXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4192E0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startStreamingProtobufDataForClientId_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_stopStreamingProtobufDataForClientId_reply_, 0, 0);
  return v0;
}

id PRMakeProtobufClientXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE417838);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_consumeProtobufBytes_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getUniqueClientIdentifier_, 0, 1);
  return v0;
}

id PRMakeRegulatoryAssistanceEndpointXPCInterface()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419340);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_injectIsoCode_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_prepareForRegulatoryAssistance_, 0, 1);
  return v0;
}

id PRMakeCompanionRangingServerXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EE4193A0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = (void *)objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_configureForCompanionRanging_options_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_configureForCompanionRanging_options_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startCompanionRanging_options_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_startCompanionRanging_options_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_stopCompanionRanging_reply_, 0, 0);

  return v0;
}

id PRMakeBTRangingServerXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419400);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = (void *)objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_fetchTxPower_isUT_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startUTRanging_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_stopUTRanging_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_startOwnerRanging_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_stopOwnerRanging_reply_, 0, 0);

  return v0;
}

id PRMakeBeaconRangingServerXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EE419460);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_startBeaconing_options_reply_, 1, 0);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_pushBeaconAllowlist_reply_, 0, 0);

  return v0;
}

id PRMakeAidedRangingServerXPCInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EE4194C0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_runWithConfiguration_reply_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestInitialCollaborationDataWithCompletionHandler_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_receivedData_fromPeer_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_receivedData_fromPeer_, 1, 0);

  return v0;
}

void sub_19BF6DECC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_19BF6E640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19BF6E7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_19BF6E98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void BtProxMaxFilter::~BtProxMaxFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxMeanFilter::~BtProxMeanFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxMedianFilter::~BtProxMedianFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxMaxOfMeanOfChanFilter::~BtProxMaxOfMeanOfChanFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxMedianOfMeanOfChanFilter::~BtProxMedianOfMeanOfChanFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxOlympicFilter::~BtProxOlympicFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

void BtProxRayleighFilter::~BtProxRayleighFilter(void **this)
{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_1E3D05010;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x1A1ACFFFCLL);
}

double BtProximityFilterBase::MeanBtProxData(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  double v4;

  v3 = *a2;
  v2 = a2[1];
  if (v2 == *a2)
    return 0.0;
  v4 = 0.0;
  do
  {
    v4 = v4 + *(double *)(v3 + 8);
    v3 += 24;
  }
  while (v3 != v2);
  return v4 / (double)(0xAAAAAAAAAAAAAAABLL * ((v2 - *a2) >> 3));
}

double BtProximityFilterBase::RssiSum(BtProximityFilterBase *this, double a2, BtProxData *a3)
{
  return *((double *)this + 1) + a2;
}

double BtProximityFilterBase::MeanDouble(uint64_t a1, double **a2)
{
  double *v2;
  double *v3;
  double v4;
  double v5;

  v3 = *a2;
  v2 = a2[1];
  if (v2 == *a2)
    return 0.0;
  v4 = 0.0;
  do
  {
    v5 = *v3++;
    v4 = v4 + v5;
  }
  while (v3 != v2);
  return v4 / (double)(unint64_t)(v2 - *a2);
}

BOOL BtProximityFilterBase::RssiCompare(BtProximityFilterBase *this, BtProxData *a2, BtProxData *a3)
{
  return *((double *)this + 1) < a2->var1;
}

double BtProxMaxFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;

  v2 = *a2;
  v3 = a2[1];
  if (v3 == *a2)
    return 0.0;
  for (i = v2 + 24; i != v3; i += 24)
  {
    if (*(double *)(v2 + 8) < *(double *)(i + 8))
      v2 = i;
  }
  return *(double *)(v2 + 8);
}

double BtProxMeanFilter::FilterSamples(uint64_t a1, uint64_t a2)
{
  const void *v2;
  uint64_t v3;
  double v5;
  double *v6;
  double v7;
  double *v9;
  double *v10;
  uint64_t v11;

  v2 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  if ((const void *)v3 == v2)
    return 0.0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(&v9, v2, v3, 0xAAAAAAAAAAAAAAABLL * ((v3 - (uint64_t)v2) >> 3));
  if (v10 == v9)
  {
    v7 = 0.0;
    if (!v9)
      return v7;
LABEL_9:
    v10 = v9;
    operator delete(v9);
    return v7;
  }
  v5 = 0.0;
  v6 = v9;
  do
  {
    v5 = v5 + v6[1];
    v6 += 3;
  }
  while (v6 != v10);
  v7 = v5 / (double)(0xAAAAAAAAAAAAAAABLL * (v10 - v9));
  if (v9)
    goto LABEL_9;
  return v7;
}

double BtProxMedianFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  __int128 *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double result;
  BOOL (*v8)(BtProximityFilterBase *, BtProxData *, BtProxData *);

  v3 = (__int128 *)a2[1];
  v4 = *a2;
  if (v3 == (__int128 *)*a2)
    return 0.0;
  v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *a2) >> 3);
  v6 = v5 >> 1;
  v8 = BtProximityFilterBase::RssiCompare;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(v4, v3, (uint64_t (**)(__int128 *, __int128 *))&v8, 126 - 2 * __clz(v5), 1);
  result = *(double *)(*a2 + 24 * v6 + 8);
  if (((*((_DWORD *)a2 + 2) - *a2) & 8) == 0)
    return (result + *(double *)(*a2 + 24 * v6 - 16)) * 0.5;
  return result;
}

double BtProxMaxOfMeanOfChanFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  char *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  double v18;
  double *v19;
  double v20;
  double v21;
  double *v23;
  double *v24;
  uint64_t v25;
  void *__p;
  char *v27;
  char *v28;

  if (a2[1] == *a2)
    return -200.0;
  v3 = 0;
  v4 = 0;
  __p = 0;
  v27 = 0;
  v28 = 0;
  v5 = -200.0;
  do
  {
    v7 = *a2;
    v6 = a2[1];
    if (v6 == *a2)
      goto LABEL_34;
    v8 = bTAdvChans[v4];
    do
    {
      if (*(_DWORD *)(v7 + 16) == v8)
      {
        if (v3 >= v28)
        {
          v10 = (char *)__p;
          v11 = (v3 - (_BYTE *)__p) >> 3;
          v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61)
            std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
          v13 = v28 - (_BYTE *)__p;
          if ((v28 - (_BYTE *)__p) >> 2 > v12)
            v12 = v13 >> 2;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
            v14 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v14 = v12;
          if (v14)
          {
            v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v28, v14);
            v10 = (char *)__p;
            v3 = v27;
          }
          else
          {
            v15 = 0;
          }
          v16 = &v15[8 * v11];
          *(_QWORD *)v16 = *(_QWORD *)(v7 + 8);
          v9 = v16 + 8;
          while (v3 != v10)
          {
            v17 = *((_QWORD *)v3 - 1);
            v3 -= 8;
            *((_QWORD *)v16 - 1) = v17;
            v16 -= 8;
          }
          __p = v16;
          v27 = v9;
          v28 = &v15[8 * v14];
          if (v10)
            operator delete(v10);
        }
        else
        {
          *(_QWORD *)v3 = *(_QWORD *)(v7 + 8);
          v9 = v3 + 8;
        }
        v27 = v9;
        v6 = a2[1];
        v3 = v9;
      }
      v7 += 24;
    }
    while (v7 != v6);
    if (v3 == __p)
    {
      v3 = (char *)__p;
      goto LABEL_34;
    }
    v23 = 0;
    v24 = 0;
    v25 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v23, __p, (uint64_t)v3, (v3 - (_BYTE *)__p) >> 3);
    if (v24 == v23)
    {
      v21 = 0.0;
      if (!v23)
        goto LABEL_30;
    }
    else
    {
      v18 = 0.0;
      v19 = v23;
      do
      {
        v20 = *v19++;
        v18 = v18 + v20;
      }
      while (v19 != v24);
      v21 = v18 / (double)(unint64_t)(v24 - v23);
      if (!v23)
        goto LABEL_30;
    }
    v24 = v23;
    operator delete(v23);
LABEL_30:
    if (v21 > v5)
      v5 = v21;
    v3 = (char *)__p;
LABEL_34:
    v27 = v3;
    ++v4;
  }
  while (v4 != 3);
  if (v3)
    operator delete(v3);
  return v5;
}

void sub_19BF6F088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double BtProxMedianOfMeanOfChanFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double *v21;
  double *v22;
  double *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v37;
  _BOOL4 v38;
  double *v40;
  double *v41;
  uint64_t v42;
  void *v43;
  double *v44;
  double *v45;
  void *__p;
  char *v47;
  char *v48;

  if (a2[1] == *a2)
    return -200.0;
  v3 = 0;
  v4 = 0;
  __p = 0;
  v47 = 0;
  v48 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  do
  {
    v6 = *a2;
    v5 = a2[1];
    if (v5 == *a2)
      goto LABEL_50;
    v7 = bTAdvChans[v4];
    do
    {
      if (*(_DWORD *)(v6 + 16) == v7)
      {
        if (v3 >= v48)
        {
          v9 = (char *)__p;
          v10 = (v3 - (_BYTE *)__p) >> 3;
          v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 61)
            std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
          v12 = v48 - (_BYTE *)__p;
          if ((v48 - (_BYTE *)__p) >> 2 > v11)
            v11 = v12 >> 2;
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
            v13 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v13 = v11;
          if (v13)
          {
            v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v48, v13);
            v9 = (char *)__p;
            v3 = v47;
          }
          else
          {
            v14 = 0;
          }
          v15 = &v14[8 * v10];
          *(_QWORD *)v15 = *(_QWORD *)(v6 + 8);
          v8 = v15 + 8;
          while (v3 != v9)
          {
            v16 = *((_QWORD *)v3 - 1);
            v3 -= 8;
            *((_QWORD *)v15 - 1) = v16;
            v15 -= 8;
          }
          __p = v15;
          v47 = v8;
          v48 = &v14[8 * v13];
          if (v9)
            operator delete(v9);
        }
        else
        {
          *(_QWORD *)v3 = *(_QWORD *)(v6 + 8);
          v8 = v3 + 8;
        }
        v47 = v8;
        v5 = a2[1];
        v3 = v8;
      }
      v6 += 24;
    }
    while (v6 != v5);
    if (v3 == __p)
    {
      v3 = (char *)__p;
      goto LABEL_50;
    }
    v40 = 0;
    v41 = 0;
    v42 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v40, __p, (uint64_t)v3, (v3 - (_BYTE *)__p) >> 3);
    if (v41 == v40)
    {
      v20 = 0.0;
      if (!v40)
        goto LABEL_30;
    }
    else
    {
      v17 = 0.0;
      v18 = v40;
      do
      {
        v19 = *v18++;
        v17 = v17 + v19;
      }
      while (v18 != v41);
      v20 = v17 / (double)(unint64_t)(v41 - v40);
      if (!v40)
        goto LABEL_30;
    }
    v41 = v40;
    operator delete(v40);
LABEL_30:
    v21 = v44;
    if (v44 >= v45)
    {
      v23 = (double *)v43;
      v24 = ((char *)v44 - (_BYTE *)v43) >> 3;
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61)
        std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
      v26 = (char *)v45 - (_BYTE *)v43;
      if (((char *)v45 - (_BYTE *)v43) >> 2 > v25)
        v25 = v26 >> 2;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
        v27 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v27 = v25;
      if (v27)
      {
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v45, v27);
        v23 = (double *)v43;
        v21 = v44;
      }
      else
      {
        v28 = 0;
      }
      v29 = (double *)&v28[8 * v24];
      *v29 = v20;
      v22 = v29 + 1;
      while (v21 != v23)
      {
        v30 = *((_QWORD *)v21-- - 1);
        *((_QWORD *)v29-- - 1) = v30;
      }
      v43 = v29;
      v44 = v22;
      v45 = (double *)&v28[8 * v27];
      if (v23)
        operator delete(v23);
    }
    else
    {
      *v44 = v20;
      v22 = v21 + 1;
    }
    v44 = v22;
    v3 = (char *)__p;
LABEL_50:
    v47 = v3;
    ++v4;
  }
  while (v4 != 3);
  v31 = ((char *)v44 - (_BYTE *)v43) >> 3;
  switch(v31)
  {
    case 1:
      v33 = *(double *)v43;
      goto LABEL_75;
    case 2:
      v33 = (*(double *)v43 + *((double *)v43 + 1)) * 0.5;
      goto LABEL_75;
    case 3:
      v33 = *(double *)v43;
      v32 = *((double *)v43 + 1);
      v34 = *((double *)v43 + 2);
      if ((*(double *)v43 < v32 || v33 > v34) && (v33 > v32 || v33 < v34))
      {
        v37 = v33 > v32;
        v38 = v33 < v32;
        if (v32 > v34)
          v37 = 1;
        if (v32 < v34)
          v38 = 1;
        if (v37 && v38)
          v33 = *((double *)v43 + 2);
        else
          v33 = *((double *)v43 + 1);
      }
LABEL_75:
      v44 = (double *)v43;
      operator delete(v43);
      v3 = (char *)__p;
      break;
    default:
      v33 = -200.0;
      if (v43)
        goto LABEL_75;
      break;
  }
  if (v3)
  {
    v47 = v3;
    operator delete(v3);
  }
  return v33;
}

void sub_19BF6F404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

double BtProxOlympicFilter::FilterSamples(uint64_t a1, __int128 **a2)
{
  __int128 *v2;
  __int128 *v3;
  unint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  double *v16;
  double *v17;
  uint64_t v18;
  BOOL (*v19)(BtProximityFilterBase *, BtProxData *, BtProxData *);

  v3 = *a2;
  v2 = a2[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v2 - (char *)*a2) >> 3);
  if (v4 <= 2 * *(int *)(a1 + 32))
  {
    if (v2 == v3)
      return 0.0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(&v16, v3, (uint64_t)v2, v4);
    if (v17 == v16)
    {
      v14 = 0.0;
      if (!v16)
        return v14;
    }
    else
    {
      v12 = 0.0;
      v13 = v16;
      do
      {
        v12 = v12 + v13[1];
        v13 += 3;
      }
      while (v13 != v17);
      v14 = v12 / (double)(0xAAAAAAAAAAAAAAABLL * (v17 - v16));
      if (!v16)
        return v14;
    }
    v17 = v16;
    operator delete(v16);
    return v14;
  }
  v19 = BtProximityFilterBase::RssiCompare;
  v7 = 126 - 2 * __clz(v4);
  if (v2 == v3)
    v8 = 0;
  else
    v8 = v7;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>((uint64_t)v3, v2, (uint64_t (**)(__int128 *, __int128 *))&v19, v8, 1);
  v9 = *(int *)(a1 + 32);
  v10 = (double *)v3 + 3 * (int)v9;
  v11 = 0.0;
  while (v10 != (double *)((char *)v2 - 24 * v9))
  {
    v11 = v11 + v10[1];
    v10 += 3;
  }
  return v11 / (double)(0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3) - 2 * v9);
}

double BtProxRayleighFilter::FilterSamples(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v4;
  double v5;
  double v6;
  double *v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  double *v15;
  uint64_t v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double *v23;
  double *v24;
  uint64_t v25;
  void *__p;
  double *v27;
  double *v28;

  __p = 0;
  v27 = 0;
  v28 = 0;
  v2 = *a2;
  if (a2[1] == *a2)
    return 0.0;
  v4 = 0;
  do
  {
    v5 = __exp10(*(double *)(v2 + 24 * v4 + 8) / 10.0);
    v6 = v5;
    v7 = v27;
    if (v27 >= v28)
    {
      v9 = (double *)__p;
      v10 = ((char *)v27 - (_BYTE *)__p) >> 3;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
      v12 = (char *)v28 - (_BYTE *)__p;
      if (((char *)v28 - (_BYTE *)__p) >> 2 > v11)
        v11 = v12 >> 2;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)&v28, v13);
        v9 = (double *)__p;
        v7 = v27;
      }
      else
      {
        v14 = 0;
      }
      v15 = (double *)&v14[8 * v10];
      *v15 = v6;
      v8 = (uint64_t)(v15 + 1);
      while (v7 != v9)
      {
        v16 = *((_QWORD *)v7-- - 1);
        *((_QWORD *)v15-- - 1) = v16;
      }
      __p = v15;
      v27 = (double *)v8;
      v28 = (double *)&v14[8 * v13];
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v27 = v5;
      v8 = (uint64_t)(v7 + 1);
    }
    v27 = (double *)v8;
    ++v4;
    v2 = *a2;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v4);
  v24 = 0;
  v25 = 0;
  v23 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v23, __p, v8, (v8 - (uint64_t)__p) >> 3);
  if (v24 == v23)
  {
    v20 = 0.0;
    if (v23)
    {
LABEL_24:
      v24 = v23;
      operator delete(v23);
    }
  }
  else
  {
    v17 = 0.0;
    v18 = v23;
    do
    {
      v19 = *v18++;
      v17 = v17 + v19;
    }
    while (v18 != v24);
    v20 = v17 / (double)(unint64_t)(v24 - v23) * 0.797884561;
    if (v23)
      goto LABEL_24;
  }
  v21 = log10(v20) * 10.0;
  if (__p)
  {
    v27 = (double *)__p;
    operator delete(__p);
  }
  return v21;
}

void sub_19BF6F79C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<BtProxData>::__init_with_size[abi:ne180100]<BtProxData*,BtProxData*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<BtProxData>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19BF6FA30(_Unwind_Exception *exception_object)
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

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(uint64_t a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5)
{
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t (*v24)(__int128 *, __int128 *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  BOOL v29;
  uint64_t (*v30)(__int128 *, __int128 *);
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;

LABEL_1:
  v9 = (__int128 *)((char *)a2 - 24);
  v10 = (__int128 *)a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v10) >> 3);
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v30 = *a3;
        v31 = *((_QWORD *)a2 - 1);
        v41 = *(__int128 *)((char *)a2 - 24);
        v42 = v31;
        v32 = *((_QWORD *)v10 + 2);
        v39 = *v10;
        v40 = v32;
        if (v30(&v41, &v39))
        {
          v33 = *v10;
          v44 = *((_QWORD *)v10 + 2);
          v43 = v33;
          v34 = *v9;
          *((_QWORD *)v10 + 2) = *((_QWORD *)a2 - 1);
          *v10 = v34;
          *v9 = v43;
          *((_QWORD *)a2 - 1) = v44;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v10, (__int128 *)((char *)v10 + 24), (__int128 *)((char *)a2 - 24), a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v10, (uint64_t)v10 + 24, (uint64_t)(v10 + 3), (__int128 *)((char *)a2 - 24), a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v10, (uint64_t)v10 + 24, (uint64_t)(v10 + 3), (uint64_t)v10 + 72, (__int128 *)((char *)a2 - 24), a3);
        return;
      default:
        if (v13 <= 575)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v10, (uint64_t)a2, a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)v10, (uint64_t)a2, a3);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = (__int128 *)((char *)v10 + 24 * (v14 >> 1));
          if ((unint64_t)v13 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((__int128 *)((char *)v10 + 24 * v15), v10, (__int128 *)((char *)a2 - 24), a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v10, (__int128 *)((char *)v10 + 24 * v15), (__int128 *)((char *)a2 - 24), a3);
            v17 = 3 * v15;
            v18 = (__int128 *)((char *)v10 + 24 * v15 - 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((__int128 *)((char *)v10 + 24), v18, a2 - 3, a3);
            v19 = v10 + 3;
            v20 = (__int128 *)((char *)v10 + 8 * v17 + 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v19, v20, (__int128 *)((char *)a2 - 72), a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v18, v16, v20, a3);
            v21 = *(_OWORD *)a1;
            v44 = *(_QWORD *)(a1 + 16);
            v43 = v21;
            v22 = *v16;
            *(_QWORD *)(a1 + 16) = *((_QWORD *)v16 + 2);
            *(_OWORD *)a1 = v22;
            v23 = v43;
            *((_QWORD *)v16 + 2) = v44;
            *v16 = v23;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          v24 = *a3;
          v25 = *(_QWORD *)(a1 - 8);
          v37 = *(_OWORD *)(a1 - 24);
          v38 = v25;
          v26 = *(_QWORD *)(a1 + 16);
          v35 = *(_OWORD *)a1;
          v36 = v26;
          if ((v24(&v37, &v35) & 1) == 0)
          {
            v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>((__int128 *)a1, a2, a3);
            goto LABEL_16;
          }
LABEL_11:
          v27 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>((__int128 *)a1, (unint64_t)a2, a3);
          if ((v28 & 1) == 0)
            goto LABEL_14;
          v29 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, v27, a3);
          v10 = (__int128 *)(v27 + 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(v27 + 24, (uint64_t)a2, a3))
          {
            v11 = v12 + 1;
            if (v29)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,false>(a1, v27, a3, -v12, a5 & 1);
            v10 = (__int128 *)(v27 + 24);
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = (__int128 *)v27;
          if (v29)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,BtProxData*>((__n128 *)v10, (__n128 *)a2, (__n128 *)a2, (unsigned int (**)(__n128 *, __int128 *))a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t result, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(__int128 *, __int128 *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(__int128 *, __int128 *);
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (result != a2)
  {
    v28 = v3;
    v29 = v4;
    v6 = result;
    v7 = result + 24;
    if (result + 24 != a2)
    {
      v9 = 0;
      v10 = result;
      do
      {
        v11 = v10;
        v10 = v7;
        v12 = *a3;
        v26 = *(_OWORD *)v10;
        v27 = *(_QWORD *)(v10 + 16);
        v13 = *(_QWORD *)(v11 + 16);
        v24 = *(_OWORD *)v11;
        v25 = v13;
        result = v12(&v26, &v24);
        if ((_DWORD)result)
        {
          v22 = *(_OWORD *)v10;
          v23 = *(_QWORD *)(v10 + 16);
          v14 = v9;
          while (1)
          {
            v15 = v6 + v14;
            *(_OWORD *)(v15 + 24) = *(_OWORD *)(v6 + v14);
            *(_QWORD *)(v15 + 40) = *(_QWORD *)(v6 + v14 + 16);
            if (!v14)
              break;
            v16 = *a3;
            v20 = v22;
            v21 = v23;
            v18 = *(_OWORD *)(v15 - 24);
            v19 = *(_QWORD *)(v15 - 8);
            result = v16(&v20, &v18);
            v14 -= 24;
            if ((result & 1) == 0)
            {
              v17 = v6 + v14 + 24;
              goto LABEL_10;
            }
          }
          v17 = v6;
LABEL_10:
          *(_OWORD *)v17 = v22;
          *(_QWORD *)(v17 + 16) = v23;
        }
        v7 = v10 + 24;
        v9 += 24;
      }
      while (v10 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t result, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t i;
  uint64_t v9;
  uint64_t (*v10)(__int128 *, __int128 *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(__int128 *, __int128 *);
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (result != a2)
  {
    v25 = v3;
    v26 = v4;
    v6 = result;
    for (i = result + 24; v6 + 24 != a2; i = v6 + 24)
    {
      v9 = v6;
      v6 = i;
      v10 = *a3;
      v23 = *(_OWORD *)v6;
      v24 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v9 + 16);
      v21 = *(_OWORD *)v9;
      v22 = v11;
      result = v10(&v23, &v21);
      if ((_DWORD)result)
      {
        v19 = *(_OWORD *)v6;
        v20 = *(_QWORD *)(v6 + 16);
        v12 = v6;
        do
        {
          v13 = v12 - 24;
          *(_OWORD *)v12 = *(_OWORD *)(v12 - 24);
          *(_QWORD *)(v12 + 16) = *(_QWORD *)(v12 - 8);
          v14 = *a3;
          v17 = v19;
          v18 = v20;
          v15 = *(_OWORD *)(v12 - 48);
          v16 = *(_QWORD *)(v12 - 32);
          result = v14(&v17, &v15);
          v12 = v13;
        }
        while ((result & 1) != 0);
        *(_OWORD *)v13 = v19;
        *(_QWORD *)(v13 + 16) = v20;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t (**a4)(__int128 *, __int128 *))
{
  uint64_t (*v8)(__int128 *, __int128 *);
  char v9;
  uint64_t (*v10)(__int128 *, __int128 *);
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t (*v18)(__int128 *, __int128 *);
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t (*v26)(__int128 *, __int128 *);
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;

  v8 = *a4;
  v49 = *a2;
  v50 = *((_QWORD *)a2 + 2);
  v47 = *a1;
  v48 = *((_QWORD *)a1 + 2);
  v9 = v8(&v49, &v47);
  v10 = *a4;
  if ((v9 & 1) == 0)
  {
    v45 = *a3;
    v46 = *((_QWORD *)a3 + 2);
    v43 = *a2;
    v44 = *((_QWORD *)a2 + 2);
    result = v10(&v45, &v43);
    if (!(_DWORD)result)
      return result;
    v15 = *((_QWORD *)a2 + 2);
    v16 = *a2;
    v17 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v17;
    *a3 = v16;
    *((_QWORD *)a3 + 2) = v15;
    v18 = *a4;
    v42 = *((_QWORD *)a2 + 2);
    v41 = *a2;
    v19 = *a1;
    v40 = *((_QWORD *)a1 + 2);
    v39 = v19;
    if (!v18(&v41, &v39))
      return 1;
    v20 = *((_QWORD *)a1 + 2);
    v21 = *a1;
    v22 = *((_QWORD *)a2 + 2);
    *a1 = *a2;
    *((_QWORD *)a1 + 2) = v22;
    *a2 = v21;
    *((_QWORD *)a2 + 2) = v20;
    return 2;
  }
  v37 = *a3;
  v38 = *((_QWORD *)a3 + 2);
  v35 = *a2;
  v36 = *((_QWORD *)a2 + 2);
  if (!v10(&v37, &v35))
  {
    v23 = *((_QWORD *)a1 + 2);
    v24 = *a1;
    v25 = *((_QWORD *)a2 + 2);
    *a1 = *a2;
    *((_QWORD *)a1 + 2) = v25;
    *a2 = v24;
    *((_QWORD *)a2 + 2) = v23;
    v26 = *a4;
    v34 = *((_QWORD *)a3 + 2);
    v33 = *a3;
    v27 = *a2;
    v32 = *((_QWORD *)a2 + 2);
    v31 = v27;
    if (!v26(&v33, &v31))
      return 1;
    v28 = *((_QWORD *)a2 + 2);
    v29 = *a2;
    v30 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v30;
    *a3 = v29;
    *((_QWORD *)a3 + 2) = v28;
    return 2;
  }
  v11 = *((_QWORD *)a1 + 2);
  v12 = *a1;
  v13 = *((_QWORD *)a3 + 2);
  *a1 = *a3;
  *((_QWORD *)a1 + 2) = v13;
  *a3 = v12;
  *((_QWORD *)a3 + 2) = v11;
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  __int128 *v4;
  uint64_t (*v6)(__int128 *, __int128 *);
  __int128 *v7;
  __int128 *v8;
  uint64_t (*v9)(__int128 *, __int128 *);
  char v10;
  __int128 *v11;
  uint64_t (*v12)(__int128 *, __int128 *);
  int v13;
  __int128 *v14;
  uint64_t (*v15)(__int128 *, __int128 *);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t (*v21)(__int128 *, __int128 *);
  uint64_t v22;
  __int128 v23;
  uint64_t (*v24)(__int128 *, __int128 *);
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;

  v4 = a2;
  v53 = *a1;
  v54 = *((_QWORD *)a1 + 2);
  v6 = *a3;
  v51 = v53;
  v52 = v54;
  v49 = *(__int128 *)((char *)a2 - 24);
  v50 = *((_QWORD *)a2 - 1);
  if ((v6(&v51, &v49) & 1) != 0)
  {
    v7 = a1;
    do
    {
      v8 = (__int128 *)((char *)v7 + 24);
      v9 = *a3;
      v47 = v53;
      v48 = v54;
      v45 = *(__int128 *)((char *)v7 + 24);
      v46 = *((_QWORD *)v7 + 5);
      v10 = v9(&v47, &v45);
      v7 = v8;
    }
    while ((v10 & 1) == 0);
  }
  else
  {
    v11 = (__int128 *)((char *)a1 + 24);
    do
    {
      v8 = v11;
      if (v11 >= v4)
        break;
      v12 = *a3;
      v43 = v53;
      v44 = v54;
      v41 = *v8;
      v42 = *((_QWORD *)v8 + 2);
      v13 = v12(&v43, &v41);
      v11 = (__int128 *)((char *)v8 + 24);
    }
    while (!v13);
  }
  if (v8 >= v4)
  {
    v14 = v4;
  }
  else
  {
    do
    {
      v14 = (__int128 *)((char *)v4 - 24);
      v15 = *a3;
      v39 = v53;
      v40 = v54;
      v37 = *(__int128 *)((char *)v4 - 24);
      v38 = *((_QWORD *)v4 - 1);
      v4 = (__int128 *)((char *)v4 - 24);
    }
    while ((v15(&v39, &v37) & 1) != 0);
  }
  while (v8 < v14)
  {
    v16 = *v8;
    v56 = *((_QWORD *)v8 + 2);
    v55 = v16;
    v17 = *v14;
    *((_QWORD *)v8 + 2) = *((_QWORD *)v14 + 2);
    *v8 = v17;
    v18 = v55;
    *((_QWORD *)v14 + 2) = v56;
    *v14 = v18;
    do
    {
      v35 = v53;
      v36 = v54;
      v19 = *((_QWORD *)v8 + 5);
      v20 = *(__int128 *)((char *)v8 + 24);
      v8 = (__int128 *)((char *)v8 + 24);
      v21 = *a3;
      v33 = v20;
      v34 = v19;
    }
    while (!v21(&v35, &v33));
    do
    {
      v31 = v53;
      v32 = v54;
      v22 = *((_QWORD *)v14 - 1);
      v23 = *(__int128 *)((char *)v14 - 24);
      v14 = (__int128 *)((char *)v14 - 24);
      v24 = *a3;
      v29 = v23;
      v30 = v22;
    }
    while ((v24(&v31, &v29) & 1) != 0);
  }
  v25 = (__int128 *)((char *)v8 - 24);
  if ((__int128 *)((char *)v8 - 24) != a1)
  {
    v26 = *v25;
    *((_QWORD *)a1 + 2) = *((_QWORD *)v8 - 1);
    *a1 = v26;
  }
  v27 = v53;
  *((_QWORD *)v8 - 1) = v54;
  *v25 = v27;
  return v8;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,BtProxData *,BOOL (*&)(BtProxData,BtProxData)>(__int128 *a1, unint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  uint64_t v6;
  uint64_t (*v7)(__int128 *, __int128 *);
  __int128 *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t (*v11)(__int128 *, __int128 *);
  uint64_t (*v12)(__int128 *, __int128 *);
  __int128 *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t (*v20)(__int128 *, __int128 *);
  uint64_t v21;
  __int128 v22;
  uint64_t (*v23)(__int128 *, __int128 *);
  __int128 v24;
  __int128 v25;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;

  v6 = 0;
  v47 = *a1;
  v48 = *((_QWORD *)a1 + 2);
  do
  {
    v7 = *a3;
    v45 = *(__int128 *)((char *)a1 + v6 + 24);
    v46 = *(_QWORD *)((char *)a1 + v6 + 40);
    v43 = v47;
    v44 = v48;
    v6 += 24;
  }
  while ((v7(&v45, &v43) & 1) != 0);
  v8 = (__int128 *)((char *)a1 + v6);
  v9 = (uint64_t)a1 + v6 - 24;
  if (v6 == 24)
  {
    while ((unint64_t)v8 < a2)
    {
      v12 = *a3;
      v10 = a2 - 24;
      v41 = *(_OWORD *)(a2 - 24);
      v42 = *(_QWORD *)(a2 - 8);
      v39 = v47;
      v40 = v48;
      a2 -= 24;
      if ((v12(&v41, &v39) & 1) != 0)
        goto LABEL_9;
    }
    v10 = a2;
  }
  else
  {
    do
    {
      v10 = a2 - 24;
      v11 = *a3;
      v37 = *(_OWORD *)(a2 - 24);
      v38 = *(_QWORD *)(a2 - 8);
      v35 = v47;
      v36 = v48;
      a2 -= 24;
    }
    while (!v11(&v37, &v35));
  }
LABEL_9:
  if ((unint64_t)v8 < v10)
  {
    v13 = v8;
    v14 = v10;
    do
    {
      v49 = *v13;
      v15 = v49;
      v50 = *((_QWORD *)v13 + 2);
      v16 = v50;
      v17 = *(_QWORD *)(v14 + 16);
      *v13 = *(_OWORD *)v14;
      *((_QWORD *)v13 + 2) = v17;
      *(_QWORD *)(v14 + 16) = v16;
      *(_OWORD *)v14 = v15;
      do
      {
        v18 = *((_QWORD *)v13 + 5);
        v19 = *(__int128 *)((char *)v13 + 24);
        v13 = (__int128 *)((char *)v13 + 24);
        v20 = *a3;
        v33 = v19;
        v34 = v18;
        v31 = v47;
        v32 = v48;
      }
      while ((v20(&v33, &v31) & 1) != 0);
      do
      {
        v21 = *(_QWORD *)(v14 - 8);
        v22 = *(_OWORD *)(v14 - 24);
        v14 -= 24;
        v23 = *a3;
        v29 = v22;
        v30 = v21;
        v27 = v47;
        v28 = v48;
      }
      while (!v23(&v29, &v27));
    }
    while ((unint64_t)v13 < v14);
    v9 = (uint64_t)v13 - 24;
  }
  if ((__int128 *)v9 != a1)
  {
    v24 = *(_OWORD *)v9;
    *((_QWORD *)a1 + 2) = *(_QWORD *)(v9 + 16);
    *a1 = v24;
  }
  v25 = v47;
  *(_QWORD *)(v9 + 16) = v48;
  *(_OWORD *)v9 = v25;
  return v9;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  unint64_t v6;
  _BOOL8 result;
  uint64_t (*v8)(__int128 *, __int128 *);
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t (*v17)(__int128 *, __int128 *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(__int128 *, __int128 *);
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = *a3;
      v35 = *(_OWORD *)(a2 - 24);
      v36 = *(_QWORD *)(a2 - 8);
      v33 = *(_OWORD *)a1;
      v34 = *(_QWORD *)(a1 + 16);
      if (v8(&v35, &v33))
      {
        v9 = a2 - 24;
        v10 = *(_QWORD *)(a1 + 16);
        v11 = *(_OWORD *)a1;
        v12 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 24);
        *(_QWORD *)(a1 + 16) = v12;
        *(_OWORD *)v9 = v11;
        *(_QWORD *)(v9 + 16) = v10;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a1 + 24, a1 + 48, (__int128 *)(a2 - 24), a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a1 + 24, a1 + 48, a1 + 72, (__int128 *)(a2 - 24), a3);
      return 1;
    default:
      v13 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a3);
      v14 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v15 = 0;
      v16 = 0;
      break;
  }
  while (1)
  {
    v17 = *a3;
    v31 = *(_OWORD *)v14;
    v32 = *(_QWORD *)(v14 + 16);
    v18 = *(_QWORD *)(v13 + 16);
    v29 = *(_OWORD *)v13;
    v30 = v18;
    if (v17(&v31, &v29))
    {
      v27 = *(_OWORD *)v14;
      v28 = *(_QWORD *)(v14 + 16);
      v19 = v15;
      while (1)
      {
        v20 = a1 + v19;
        *(_OWORD *)(v20 + 72) = *(_OWORD *)(a1 + v19 + 48);
        *(_QWORD *)(v20 + 88) = *(_QWORD *)(a1 + v19 + 64);
        if (v19 == -48)
          break;
        v21 = *a3;
        v25 = v27;
        v26 = v28;
        v23 = *(_OWORD *)(v20 + 24);
        v24 = *(_QWORD *)(v20 + 40);
        v19 -= 24;
        if ((v21(&v25, &v23) & 1) == 0)
        {
          v22 = a1 + v19 + 72;
          goto LABEL_12;
        }
      }
      v22 = a1;
LABEL_12:
      *(_OWORD *)v22 = v27;
      *(_QWORD *)(v22 + 16) = v28;
      if (++v16 == 8)
        return v14 + 24 == a2;
    }
    v13 = v14;
    v15 += 24;
    v14 += 24;
    if (v14 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t (**a5)(__int128 *, __int128 *))
{
  uint64_t (*v10)(__int128 *, __int128 *);
  __n128 result;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t (*v15)(__int128 *, __int128 *);
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t (*v20)(__int128 *, __int128 *);
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3, a5);
  v10 = *a5;
  v34 = *a4;
  v35 = *((_QWORD *)a4 + 2);
  v32 = *(_OWORD *)a3;
  v33 = *(_QWORD *)(a3 + 16);
  if (v10(&v34, &v32))
  {
    v12 = *(_QWORD *)(a3 + 16);
    v13 = *(_OWORD *)a3;
    v14 = *((_QWORD *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    *(_QWORD *)(a3 + 16) = v14;
    *a4 = v13;
    *((_QWORD *)a4 + 2) = v12;
    v15 = *a5;
    v31 = *(_QWORD *)(a3 + 16);
    v30 = *(_OWORD *)a3;
    v16 = *(_OWORD *)a2;
    v29 = *(_QWORD *)(a2 + 16);
    v28 = v16;
    if (v15(&v30, &v28))
    {
      v17 = *(_QWORD *)(a2 + 16);
      v18 = *(_OWORD *)a2;
      v19 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v19;
      *(_OWORD *)a3 = v18;
      *(_QWORD *)(a3 + 16) = v17;
      v20 = *a5;
      v27 = *(_QWORD *)(a2 + 16);
      v26 = *(_OWORD *)a2;
      v21 = *(_OWORD *)a1;
      v25 = *(_QWORD *)(a1 + 16);
      v24 = v21;
      if (v20(&v26, &v24))
      {
        v22 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v23 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v23;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v22;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t (**a6)(__int128 *, __int128 *))
{
  uint64_t (*v12)(__int128 *, __int128 *);
  __n128 result;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t (*v17)(__int128 *, __int128 *);
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(__int128 *, __int128 *);
  __n128 v23;
  uint64_t v24;
  __n128 v25;
  uint64_t v26;
  uint64_t (*v27)(__int128 *, __int128 *);
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(a1, a2, a3, (__int128 *)a4, a6);
  v12 = *a6;
  v45 = *a5;
  v46 = *((_QWORD *)a5 + 2);
  v43 = *(_OWORD *)a4;
  v44 = *(_QWORD *)(a4 + 16);
  if (v12(&v45, &v43))
  {
    v14 = *(_QWORD *)(a4 + 16);
    v15 = *(_OWORD *)a4;
    v16 = *((_QWORD *)a5 + 2);
    *(_OWORD *)a4 = *a5;
    *(_QWORD *)(a4 + 16) = v16;
    *a5 = v15;
    *((_QWORD *)a5 + 2) = v14;
    v17 = *a6;
    v42 = *(_QWORD *)(a4 + 16);
    v41 = *(_OWORD *)a4;
    v18 = *(_OWORD *)a3;
    v40 = *(_QWORD *)(a3 + 16);
    v39 = v18;
    if (v17(&v41, &v39))
    {
      v19 = *(_QWORD *)(a3 + 16);
      v20 = *(_OWORD *)a3;
      v21 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 16) = v21;
      *(_OWORD *)a4 = v20;
      *(_QWORD *)(a4 + 16) = v19;
      v22 = *a6;
      v38 = *(_QWORD *)(a3 + 16);
      v37 = *(_OWORD *)a3;
      v23 = *(__n128 *)a2;
      v36 = *(_QWORD *)(a2 + 16);
      v35 = v23;
      if (v22(&v37, (__int128 *)&v35))
      {
        v24 = *(_QWORD *)(a2 + 16);
        v25 = *(__n128 *)a2;
        v26 = *(_QWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_QWORD *)(a2 + 16) = v26;
        *(__n128 *)a3 = v25;
        *(_QWORD *)(a3 + 16) = v24;
        v27 = *a6;
        v34 = *(_QWORD *)(a2 + 16);
        v33 = *(__n128 *)a2;
        v28 = *(__n128 *)a1;
        v32 = *(_QWORD *)(a1 + 16);
        v31 = v28;
        if (v27((__int128 *)&v33, (__int128 *)&v31))
        {
          v29 = *(_QWORD *)(a1 + 16);
          result = *(__n128 *)a1;
          v30 = *(_QWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = v30;
          *(__n128 *)a2 = result;
          *(_QWORD *)(a2 + 16) = v29;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*,BtProxData*>(__n128 *a1, __n128 *a2, __n128 *a3, unsigned int (**a4)(__n128 *, __int128 *))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __n128 *v12;
  __n128 *v13;
  __n128 *v14;
  unsigned int (*v15)(__n128 *, __int128 *);
  unint64_t v16;
  __n128 v17;
  unint64_t v18;
  int64_t v19;
  __n128 *v20;
  uint64_t v21;
  __n128 v22;
  __n128 v25;
  unint64_t v26;
  __n128 v27;
  uint64_t v28;
  __n128 v29;
  unint64_t v30;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (__n128 *)((char *)a1 + 24 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, a4, v9, v12);
        v12 = (__n128 *)((char *)v12 - 24);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *a4;
        v27 = *v14;
        v28 = v14[1].n128_i64[0];
        v25 = *a1;
        v26 = a1[1].n128_u64[0];
        if (v15(&v27, (__int128 *)&v25))
        {
          v16 = v14[1].n128_u64[0];
          v17 = *v14;
          v18 = a1[1].n128_u64[0];
          *v14 = *a1;
          v14[1].n128_u64[0] = v18;
          *a1 = v17;
          a1[1].n128_u64[0] = v16;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, a4, v9, a1);
        }
        v14 = (__n128 *)((char *)v14 + 24);
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 25)
    {
      v19 = v8 / 0x18uLL;
      v20 = (__n128 *)((char *)a2 - 24);
      do
      {
        v29 = *a1;
        v30 = a1[1].n128_u64[0];
        v21 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, (unsigned int (**)(__int128 *, __int128 *))a4, v19);
        if (v20 == (__n128 *)v21)
        {
          *(__n128 *)v21 = v29;
          *(_QWORD *)(v21 + 16) = v30;
        }
        else
        {
          v22 = *v20;
          *(_QWORD *)(v21 + 16) = v20[1].n128_u64[0];
          *(__n128 *)v21 = v22;
          *v20 = v29;
          v20[1].n128_u64[0] = v30;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>((uint64_t)a1, v21 + 24, (unsigned int (**)(__int128 *, __int128 *))a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - (uint64_t)a1) >> 3));
        }
        v20 = (__n128 *)((char *)v20 - 24);
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, unsigned int (**a2)(__n128 *, __int128 *), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(__n128 *, __int128 *);
  uint64_t (*v16)(__n128 *, __n128 *);
  __n128 result;
  __n128 *v18;
  __n128 v19;
  uint64_t v20;
  unsigned int (*v21)(__n128 *, __int128 *);
  unsigned int (*v22)(__n128 *, __int128 *);
  __n128 v23;
  unint64_t v24;
  __n128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __n128 v29;
  uint64_t v30;
  __n128 v31;
  unint64_t v32;
  __n128 v33;
  unint64_t v34;
  __n128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __n128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v41 = v4;
    v42 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      v13 = a1 + 24 * v12;
      v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v14 < a3)
      {
        v15 = *a2;
        v39 = *(__n128 *)v13;
        v40 = *(_QWORD *)(v13 + 16);
        v37 = *(_OWORD *)(v13 + 24);
        v38 = *(_QWORD *)(v13 + 40);
        if (v15(&v39, &v37))
        {
          v13 += 24;
          v12 = v14;
        }
      }
      v16 = (uint64_t (*)(__n128 *, __n128 *))*a2;
      v35 = *(__n128 *)v13;
      v36 = *(_QWORD *)(v13 + 16);
      v33 = *v7;
      v34 = v7[1].n128_u64[0];
      if ((v16(&v35, &v33) & 1) == 0)
      {
        v31 = *v7;
        v32 = v7[1].n128_u64[0];
        do
        {
          v18 = (__n128 *)v13;
          v19 = *(__n128 *)v13;
          v7[1].n128_u64[0] = *(_QWORD *)(v13 + 16);
          *v7 = v19;
          if (v9 < v12)
            break;
          v20 = (2 * v12) | 1;
          v13 = a1 + 24 * v20;
          if (2 * v12 + 2 < a3)
          {
            v21 = *a2;
            v29 = *(__n128 *)v13;
            v30 = *(_QWORD *)(v13 + 16);
            v27 = *(_OWORD *)(v13 + 24);
            v28 = *(_QWORD *)(v13 + 40);
            if (v21(&v29, &v27))
            {
              v13 += 24;
              v20 = 2 * v12 + 2;
            }
          }
          v22 = *a2;
          v25 = *(__n128 *)v13;
          v26 = *(_QWORD *)(v13 + 16);
          v23 = v31;
          v24 = v32;
          v7 = v18;
          v12 = v20;
        }
        while (!v22(&v25, (__int128 *)&v23));
        result = v31;
        v18[1].n128_u64[0] = v32;
        *v18 = result;
      }
    }
  }
  return result;
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, unsigned int (**a2)(__int128 *, __int128 *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(__int128 *, __int128 *);
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = a1 + 24 * v6 + 24;
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      v12 = *a2;
      v13 = *(_QWORD *)(v9 + 16);
      v19 = *(_OWORD *)v9;
      v20 = v13;
      v14 = *(_QWORD *)(v9 + 40);
      v17 = *(_OWORD *)(v9 + 24);
      v18 = v14;
      if (v12(&v19, &v17))
      {
        v9 += 24;
        v10 = v11;
      }
    }
    v15 = *(_OWORD *)v9;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v9 + 16);
    *(_OWORD *)a1 = v15;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(BtProxData,BtProxData),BtProxData*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(__int128 *, __int128 *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v10;
  __int128 *v11;
  unsigned int (*v12)(__int128 *, __int128 *);
  double result;
  __int128 *v14;
  __int128 *v15;
  __int128 v16;
  unsigned int (*v17)(__int128 *, __int128 *);
  char v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v29 = v4;
    v30 = v5;
    v10 = v6 >> 1;
    v11 = (__int128 *)(a1 + 24 * (v6 >> 1));
    v12 = *a3;
    v27 = *v11;
    v28 = *((_QWORD *)v11 + 2);
    v25 = *(_OWORD *)(a2 - 24);
    v26 = *(_QWORD *)(a2 - 8);
    if (v12(&v27, &v25))
    {
      v14 = (__int128 *)(a2 - 24);
      v23 = *(_OWORD *)(a2 - 24);
      v24 = *(_QWORD *)(a2 - 8);
      do
      {
        v15 = v11;
        v16 = *v11;
        *((_QWORD *)v14 + 2) = *((_QWORD *)v11 + 2);
        *v14 = v16;
        if (!v10)
          break;
        v10 = (v10 - 1) >> 1;
        v11 = (__int128 *)(a1 + 24 * v10);
        v17 = *a3;
        v21 = *v11;
        v22 = *((_QWORD *)v11 + 2);
        v19 = v23;
        v20 = v24;
        v18 = v17(&v21, &v19);
        v14 = v15;
      }
      while ((v18 & 1) != 0);
      result = *(double *)&v23;
      *v15 = v23;
      *((_QWORD *)v15 + 2) = v24;
    }
  }
  return result;
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_19BF71144(_Unwind_Exception *exception_object)
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

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAngleSharingImportanceEstimator::Measurement *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

double SingleThresholdProx::Estimator::Estimator(SingleThresholdProx::Estimator *this, double a2, char a3)
{
  double result;

  *(_BYTE *)this = 0;
  *((_DWORD *)this + 1) = LODWORD(a2);
  *((_QWORD *)this + 1) = 0x3FE666663F800000;
  *((_WORD *)this + 8) = 156;
  *(_OWORD *)((char *)this + 20) = xmmword_19BF7A0A0;
  *(_OWORD *)((char *)this + 36) = xmmword_19BF7A0B0;
  *(_OWORD *)((char *)this + 52) = xmmword_19BF7A0C0;
  *(_QWORD *)((char *)this + 68) = 0x341200000;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 10) = 0;
  *((float32x2_t *)this + 13) = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a2, 0), (float32x2_t)0xC1096932411696CDLL);
  *((float *)this + 28) = *(float *)&a2 + -30.262;
  *((_QWORD *)this + 15) = 0xBFF0000000000000;
  *((_WORD *)this + 64) = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)((char *)this + 132) = result;
  *((_DWORD *)this + 35) = 0;
  *((_BYTE *)this + 144) = a3;
  return result;
}

float SingleThresholdProx::Estimator::metersToDecibels(SingleThresholdProx::Estimator *this, float a2)
{
  float v2;

  v2 = *((float *)this + 3) * -10.0;
  return *((float *)this + 1) + (float)(v2 * log10f(a2 / *((float *)this + 2)));
}

void SingleThresholdProx::Estimator::addRSSISample(SingleThresholdProx::Estimator *this, int a2, char a3, double a4)
{
  char v5;
  int v6;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  _WORD *v21;
  _WORD *v22;
  uint64_t v23;
  __int16 v24;

  if (a2 != 127)
  {
    v5 = a2 - 126;
    if (a2 < 0)
      v5 = a2;
    v6 = (char)(*((_BYTE *)this + 144) + v5);
    if (v6 >= *((char *)this + 16) && v6 <= *((char *)this + 17))
    {
      v9 = (char *)this + 96;
      v10 = *((_QWORD *)this + 12);
      v11 = *((_QWORD *)this + 11);
      if (v11 >= v10)
      {
        v13 = *((_QWORD *)this + 10);
        v14 = (uint64_t)(v11 - v13) >> 4;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 60)
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        v16 = v10 - v13;
        if (v16 >> 3 > v15)
          v15 = v16 >> 3;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
          v17 = 0xFFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Rose::ResponderSuperframeRxPacketInfo>>((uint64_t)v9, v17);
        else
          v18 = 0;
        v19 = &v18[16 * v14];
        v20 = &v18[16 * v17];
        *(double *)v19 = a4;
        v19[8] = v6;
        v19[9] = a3;
        v12 = v19 + 16;
        v22 = (_WORD *)*((_QWORD *)this + 10);
        v21 = (_WORD *)*((_QWORD *)this + 11);
        if (v21 != v22)
        {
          do
          {
            v23 = *((_QWORD *)v21 - 2);
            v21 -= 8;
            v24 = v21[4];
            *((_QWORD *)v19 - 2) = v23;
            v19 -= 16;
            *((_WORD *)v19 + 4) = v24;
          }
          while (v21 != v22);
          v21 = (_WORD *)*((_QWORD *)this + 10);
        }
        *((_QWORD *)this + 10) = v19;
        *((_QWORD *)this + 11) = v12;
        *((_QWORD *)this + 12) = v20;
        if (v21)
          operator delete(v21);
      }
      else
      {
        *(double *)v11 = a4;
        *(_BYTE *)(v11 + 8) = v6;
        v12 = (char *)(v11 + 16);
        *(_BYTE *)(v11 + 9) = a3;
      }
      *((_QWORD *)this + 11) = v12;
    }
  }
}

uint64_t SingleThresholdProx::Estimator::getRangeMeasurement(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  int64_t v11;
  __int16 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;
  signed int v26;
  unsigned int v27;
  int v28;
  char *v29;
  float v30;
  int v31;
  float v32;
  char *v33;
  int v34;
  int v35;
  double v36;
  int v37;
  int v38;
  __int16 v39;
  int v40;
  int v41;
  int v42;
  float v43;
  int v44;
  int v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  unsigned int v51;
  float v52;
  double v53;
  double v54;
  float v55;
  float v56;
  float v57;
  float v58;
  int v59;
  uint64_t v60;
  unsigned int v62;
  unsigned __int16 v63;
  _BOOL4 v64;
  unsigned int v65;
  _BYTE *v66;
  unsigned int v67;
  BOOL v68;
  __int16 v69;
  void *__p;
  char *v71;
  char *v72;
  void *v73;
  void *v74;
  uint64_t v75;

  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v73 = 0;
  v74 = 0;
  v75 = 0;
  __p = 0;
  v71 = 0;
  v72 = 0;
  v8 = *(char *)(a1 + 17) - (uint64_t)*(char *)(a1 + 16) + 1;
  v69 = 0;
  std::vector<short>::resize((uint64_t)&v73, v8, &v69);
  if (v6 == v7)
    goto LABEL_63;
  v10 = *(char **)(a1 + 80);
  v9 = *(char **)(a1 + 88);
  if (v10 == v9)
    goto LABEL_63;
  do
  {
    if (a3 - *(double *)v10 <= *(float *)(a1 + 40))
    {
      v12 = v10[8];
      v13 = v10[8] - (uint64_t)*(char *)(a1 + 16);
      ++*((_WORD *)v73 + v13);
      v14 = v71;
      if (v71 >= v72)
      {
        v16 = (char *)__p;
        v17 = v71 - (_BYTE *)__p;
        if (v71 - (_BYTE *)__p <= -3)
          std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
        v18 = v17 >> 1;
        if (v72 - (_BYTE *)__p <= (unint64_t)((v17 >> 1) + 1))
          v19 = v18 + 1;
        else
          v19 = v72 - (_BYTE *)__p;
        if ((unint64_t)(v72 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFFELL)
          v20 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        if (v20)
        {
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>((uint64_t)&v72, v20);
          v16 = (char *)__p;
          v14 = v71;
        }
        else
        {
          v21 = 0;
        }
        v22 = &v21[2 * v18];
        *(_WORD *)v22 = v12;
        v15 = v22 + 2;
        while (v14 != v16)
        {
          v23 = *((_WORD *)v14 - 1);
          v14 -= 2;
          *((_WORD *)v22 - 1) = v23;
          v22 -= 2;
        }
        __p = v22;
        v71 = v15;
        v72 = &v21[2 * v20];
        if (v16)
          operator delete(v16);
      }
      else
      {
        *(_WORD *)v71 = v12;
        v15 = v14 + 2;
      }
      v71 = v15;
      v10 += 16;
      v9 = *(char **)(a1 + 88);
    }
    else
    {
      v11 = v9 - (v10 + 16);
      if (v9 != v10 + 16)
        memmove(v10, v10 + 16, v11 - 6);
      v9 = &v10[v11];
      *(_QWORD *)(a1 + 88) = &v10[v11];
    }
  }
  while (v10 != v9);
  if (__p == v71)
    goto LABEL_63;
  std::__sort<std::__less<short,short> &,short *>();
  v24 = (char *)__p;
  v25 = (v71 - (_BYTE *)__p) >> 1;
  v26 = vcvtpd_s64_f64((double)(unint64_t)v25 * 0.1);
  v27 = vcvtpd_s64_f64((double)(unint64_t)v25 * 0.4);
  v28 = v25 - (v27 + v26);
  if (v28 < 1)
  {
    v30 = 0.0;
    if (__p != v71)
    {
      v33 = (char *)__p;
      do
      {
        v34 = *(__int16 *)v33;
        v33 += 2;
        v30 = v30 + (float)v34;
      }
      while (v33 != v71);
    }
    v32 = (float)(unint64_t)v25;
  }
  else
  {
    v29 = (char *)__p + 2 * (int)v27;
    v30 = 0.0;
    while (v29 != &v71[-2 * v26])
    {
      v31 = *(__int16 *)v29;
      v29 += 2;
      v30 = v30 + (float)v31;
    }
    v32 = (float)v28;
  }
  v35 = (int)(float)(v30 / v32);
  v36 = __exp10((float)((float)v35 - *(float *)(a1 + 4)) / -18.0);
  v71 = v24;
  v37 = *(char *)(a1 + 16);
  v38 = *(char *)(a1 + 17) - v37;
  if (v38 < 0)
  {
    v42 = 0;
    v41 = 0;
    v40 = 0;
  }
  else
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    do
    {
      v43 = (float)v39 + (float)(char)v37;
      if (v43 >= *(float *)(a1 + 112))
      {
        if (v43 >= *(float *)(a1 + 108))
        {
          v44 = *((__int16 *)v73 + v39);
          if (v43 >= *(float *)(a1 + 104))
            v40 += v44;
          else
            v41 += v44;
        }
        else
        {
          v42 += *((__int16 *)v73 + v39);
        }
      }
      ++v39;
    }
    while (v38 >= v39);
  }
  v45 = v41 + v42 + v40;
  if (!v45)
    goto LABEL_63;
  v46 = (float)v40 / (float)v45;
  v47 = (float)v41 / (float)v45;
  v48 = (float)v42 / (float)v45;
  v49 = *(float *)(a1 + 20);
  if (v48 > v49 || v46 > v49 || v47 > v49 || (float)(0.0 / (float)v45) > v49)
  {
    if (v47 <= v49)
      v51 = v46 > v49;
    else
      v51 = 2;
    if (v48 > v49)
    {
      v51 = 3;
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  v50 = *(float *)(a1 + 24);
  v51 = (float)(v46 + v47) > v50;
  if ((float)(v47 + v48) <= v50)
  {
LABEL_59:
    if (v51)
      goto LABEL_60;
LABEL_63:
    v59 = 0;
    LOBYTE(v35) = 0;
    v60 = 0;
    v36 = -1.0;
    goto LABEL_64;
  }
  v51 = 2;
LABEL_60:
  v52 = *(float *)(a1 + 64);
  v53 = *(double *)(a1 + 120);
  *(double *)(a1 + 120) = a3;
  if (v51 == 1 || (v54 = a3 - v53, v54 > *(float *)(a1 + 68)))
  {
    v58 = *(float *)(a1 + 44);
    v57 = (float)v51;
  }
  else
  {
    v55 = *(float *)(a1 + 132);
    v56 = v55 / (float)(v55 + *(float *)(a1 + 52));
    v57 = *(float *)(a1 + 136) + (float)(v56 * (float)((float)v51 - *(float *)(a1 + 136)));
    v58 = (float)(v55 * (float)(1.0 - v56)) + v54 * v54 * *(float *)(a1 + 48) * 0.5 * (v52 * v52);
  }
  *(float *)(a1 + 132) = v58;
  *(float *)(a1 + 136) = v57;
  if (v57 >= 1.0 && v57 <= 3.0)
  {
    v59 = llroundf(v57);
    v62 = v59 - v51;
    if ((int)(v59 - v51) < 0)
      v62 = v51 - v59;
    if (v62 <= *(unsigned __int16 *)(a1 + 74))
    {
      *(_WORD *)(a1 + 128) = 0;
    }
    else
    {
      v63 = *(_WORD *)(a1 + 128) + 1;
      *(_WORD *)(a1 + 128) = v63;
      if (*(unsigned __int16 *)(a1 + 72) < v63)
      {
        *(_DWORD *)(a1 + 132) = *(_DWORD *)(a1 + 44);
        *(float *)(a1 + 136) = (float)v51;
      }
    }
    if (*(_BYTE *)(a1 + 140))
    {
      if (v59 == 1)
      {
        v64 = 0;
        *(_BYTE *)(a1 + 142) = 0;
        goto LABEL_89;
      }
      if (v59 < 2 || (v65 = (*(_BYTE *)(a1 + 142) + 1), ++*(_BYTE *)(a1 + 142), v65 < 2))
      {
        v64 = 0;
        v59 = 1;
        goto LABEL_89;
      }
      *(_BYTE *)(a1 + 140) = 0;
      *(_BYTE *)(a1 + 142) = 0;
    }
    else if (v59 == 1)
    {
      v64 = 0;
      *(_DWORD *)(a1 + 140) = 1;
      goto LABEL_89;
    }
    v64 = 1;
    goto LABEL_89;
  }
  *(_QWORD *)(a1 + 120) = 0xBFF0000000000000;
  v59 = *(unsigned __int8 *)(a1 + 140);
  v64 = *(_BYTE *)(a1 + 140) == 0;
LABEL_89:
  if (*(_BYTE *)(a1 + 141) && v64)
  {
    v66 = (_BYTE *)(a1 + 143);
    if (v59 != 2)
    {
      v67 = ++*v66;
      v68 = v67 > 1 && v52 == 1.0;
      if (!v68 && v67 < 3)
      {
        v60 = 1;
        v59 = 2;
        goto LABEL_64;
      }
      *(_BYTE *)(a1 + 141) = 0;
    }
  }
  else
  {
    v60 = 1;
    if (v59 != 2)
      goto LABEL_64;
    *(_BYTE *)(a1 + 141) = 1;
    v66 = (_BYTE *)(a1 + 143);
  }
  *v66 = 0;
  v60 = 1;
LABEL_64:
  *(_DWORD *)a2 = v59;
  *(double *)(a2 + 8) = v36;
  *(_BYTE *)(a2 + 16) = v35;
  if (__p)
  {
    v71 = (char *)__p;
    operator delete(__p);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
  return v60;
}

void sub_19BF719A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(exception_object);
}

void std::vector<short>::resize(uint64_t a1, unint64_t a2, _WORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 1;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 2 * a2;
  }
  else
  {
    std::vector<short>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<short>::__append(void **a1, unint64_t a2, _WORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _WORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  __int16 v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_WORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 1)
  {
    if (a2)
    {
      v16 = 2 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 2;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 1);
    if (v11 < 0)
      std::vector<Rose::ResponderSuperframeRxPacketInfo>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 1;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 > v11)
      v11 = v13;
    if (v13 >= 0x7FFFFFFFFFFFFFFELL)
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<short>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[2 * v12];
    v19 = &v18[2 * a2];
    v20 = 2 * a2;
    v21 = v18;
    do
    {
      *(_WORD *)v21 = *a3;
      v21 += 2;
      v20 -= 2;
    }
    while (v20);
    v22 = &v15[2 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 2)
    {
      v25 = *((_WORD *)i - 1);
      *((_WORD *)v18 - 1) = v25;
      v18 -= 2;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void SharingHysteresis::getScoreDelta()
{
  __assert_rtn("getScoreDelta", "SharingHysteresis.cpp", 62, "rank < currentDeviceScores.size()");
}

void SharingHysteresis::belowTimeDeltaThreshold1()
{
  __assert_rtn("belowTimeDeltaThreshold1", "SharingHysteresis.cpp", 70, "rank < currentDeviceScores.size()");
}

void SharingHysteresis::belowTimeDeltaThreshold2()
{
  __assert_rtn("belowTimeDeltaThreshold2", "SharingHysteresis.cpp", 77, "rank < currentDeviceScores.size()");
}

void SharingHysteresis::setStickinessDuration1()
{
  __assert_rtn("setStickinessDuration1", "SharingHysteresis.cpp", 102, "rank < currentDeviceScores.size()");
}

void SharingHysteresis::setStickinessDuration2()
{
  __assert_rtn("setStickinessDuration2", "SharingHysteresis.cpp", 111, "rank < currentDeviceScores.size()");
}

void SharingHysteresis::setStickinessDuration()
{
  __assert_rtn("setStickinessDuration", "SharingHysteresis.cpp", 121, "scoreDelta < SCORE_DELTA_THRESHOLD_2");
}

void SharingHysteresis::sanityCheckSwappedScores()
{
  __assert_rtn("sanityCheckSwappedScores", "SharingHysteresis.cpp", 176, "currentDeviceScores[i - 1].swappedScore >= currentDeviceScores[i].swappedScore");
}

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

void TopScoreTieHysteresis::isInTopScoreLayer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("isInTopScoreLayer", "TopScoreTieHysteresis.cpp", a3, "topScore >= score");
}

void BigHeadTieHysteresis::mitigateBigHeadBackForthIssuesIfPossible()
{
  __assert_rtn("mitigateBigHeadBackForthIssuesIfPossible", "BigHeadTieHysteresis.cpp", 37, "soiRssiTieHysteresis.getNumDevices() == getNumberOfBigHeadCandidates(output)");
}

{
  __assert_rtn("mitigateBigHeadBackForthIssuesIfPossible", "BigHeadTieHysteresis.cpp", 33, "topScoreTieHysteresis.getNumDevices() == getNumberOfBigHeadCandidates(output)");
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1E0DE4AE0]();
}

uint64_t std::__sort<std::__less<short,short> &,short *>()
{
  return MEMORY[0x1E0DE4B18]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4BA8](__str, __idx, *(_QWORD *)&__base);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E3D03E70(__p);
}

uint64_t operator delete()
{
  return off_1E3D03E78();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E3D03E80(__sz);
}

uint64_t operator new()
{
  return off_1E3D03E88();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F0](__x);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

