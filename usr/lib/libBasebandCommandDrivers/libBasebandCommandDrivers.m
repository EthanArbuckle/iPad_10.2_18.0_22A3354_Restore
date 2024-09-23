uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return *((unsigned __int8 *)this + 8);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__16vectorIhNS_9allocatorIhEEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, __int128 *a3)
{
  _QWORD v3[5];
  __int128 v4;
  uint64_t v5;
  _OWORD v6[2];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK3awd10AppContextclENS_10MetricInfoENS_11TriggerInfoE_block_invoke;
  v3[3] = &__block_descriptor_tmp_37;
  v3[4] = a1;
  v6[0] = *a2;
  *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)((char *)a2 + 12);
  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  dispatch_async(*a1, v3);
}

_QWORD *__copy_helper_block_e8_40c39_ZTSNSt3__16vectorIhNS_9allocatorIhEEEE(_QWORD *result, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  size_t v4;
  _QWORD *v5;
  char *v6;
  char *v7;

  result[5] = 0;
  result[6] = 0;
  result[7] = 0;
  v3 = *(_BYTE **)(a2 + 40);
  v2 = *(_BYTE **)(a2 + 48);
  v4 = v2 - v3;
  if (v2 != v3)
  {
    v5 = result;
    if ((v4 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v6 = (char *)operator new(v2 - v3);
    v5[5] = v6;
    v5[6] = v6;
    v7 = &v6[v4];
    v5[7] = &v6[v4];
    result = memcpy(v6, v3, v4);
    v5[6] = v7;
  }
  return result;
}

void sub_2127CD9F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3awd10AppContextclENS_10MetricInfoEjNSt3__16vectorIhNS2_9allocatorIhEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  char *v6;
  char *v7;
  void *__p;
  void *v9;
  char *v10;
  _OWORD v11[2];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    v2 = *(unsigned int *)(a1 + 92);
    v4 = *(_BYTE **)(a1 + 40);
    v3 = *(_BYTE **)(a1 + 48);
    v11[0] = *(_OWORD *)(a1 + 64);
    *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(a1 + 76);
    v9 = 0;
    v10 = 0;
    __p = 0;
    v5 = v3 - v4;
    if (v3 != v4)
    {
      if ((v5 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v6 = (char *)operator new(v3 - v4);
      v7 = &v6[v5];
      __p = v6;
      v10 = &v6[v5];
      memcpy(v6, v4, v5);
      v9 = v7;
    }
    (*(void (**)(uint64_t, _OWORD *, uint64_t, void **))(v1 + 16))(v1, v11, v2, &__p);
    if (__p)
    {
      v9 = __p;
      operator delete(__p);
    }
  }
}

void sub_2127CDAC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, int a3, uint64_t a4)
{
  uint64_t v5;
  const void *v6;
  size_t v7;
  char *v8;
  char *v9;
  _QWORD v10[5];
  void *__p;
  void *v12;
  char *v13;
  _BYTE v14[28];
  int v15;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___ZNK3awd10AppContextclENS_10MetricInfoEjNSt3__16vectorIhNS2_9allocatorIhEEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_38;
  *(_OWORD *)v14 = *a2;
  *(_OWORD *)&v14[12] = *(_OWORD *)((char *)a2 + 12);
  v15 = a3;
  v10[4] = a1;
  __p = 0;
  v12 = 0;
  v13 = 0;
  v6 = *(const void **)a4;
  v5 = *(_QWORD *)(a4 + 8);
  v7 = v5 - *(_QWORD *)a4;
  if (v5 != *(_QWORD *)a4)
  {
    if ((v7 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = (char *)operator new(v5 - *(_QWORD *)a4);
    v9 = &v8[v7];
    __p = v8;
    v13 = &v8[v7];
    memcpy(v8, v6, v7);
    v12 = v9;
  }
  dispatch_async(*a1, v10);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
}

uint64_t ___ZNK3awd10AppContextclENS_10MetricInfoENS_11TriggerInfoE_block_invoke(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  _OWORD v5[2];

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
  {
    *(_OWORD *)((char *)v5 + 12) = *(_OWORD *)(a1 + 76);
    v5[0] = *(_OWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 56);
    v3 = *(_OWORD *)(a1 + 40);
    return (*(uint64_t (**)(uint64_t, _OWORD *, __int128 *))(result + 16))(result, v5, &v3);
  }
  return result;
}

char *abm::data::getDataPropertyNameFromDict(xpc_object_t *a1)
{
  xpc_object_t value;
  unsigned int v3;
  xpc_object_t object;

  if (MEMORY[0x212BF3824](*a1) != MEMORY[0x24BDACFA0])
    return "Unknown";
  value = xpc_dictionary_get_value(*a1, "kDataProperty");
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v3 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v3 < 5)
    return off_24CE224D8[v3];
  else
    return "Unknown";
}

void sub_2127CDCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::getDataPropertyTypeFromDict(xpc_object_t *a1)
{
  xpc_object_t value;
  unsigned int v4;
  xpc_object_t object;

  if (MEMORY[0x212BF3824](*a1) != MEMORY[0x24BDACFA0])
    return 5;
  value = xpc_dictionary_get_value(*a1, "kDataProperty");
  object = value;
  if (value)
    xpc_retain(value);
  else
    object = xpc_null_create();
  v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v4 >= 5)
    return 5;
  else
    return v4;
}

void sub_2127CDD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abm::data::DataAggregationProtocol::toDict(abm::data::DataAggregationProtocol *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(0);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationProtocol", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationProtocol::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationProtocol", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

const char *abm::data::DataAggregationProtocol::asString(abm::data::DataAggregationProtocol *this)
{
  uint64_t v1;

  v1 = *((int *)this + 3);
  if (v1 > 2)
    return "unknown";
  else
    return off_24CE22500[v1];
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(0);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  int v5;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_24CE22380;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x212BF3824](*a1) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(*a1, "kDataAggregationProtocol"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationProtocol");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    v5 = xpc::dyn_cast_or_default();
    xpc_release(object);
    if (v5)
    {
      if (v5 == 1)
      {
        *(_DWORD *)(a2 + 12) = 1;
      }
      else if (v5 == 2)
      {
        *(_DWORD *)(a2 + 12) = 2;
      }
      else
      {
        *(_BYTE *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 12) = 3;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 12) = 0;
    }
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_2127CE1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationProtocol>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_24CE22380;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (result >= 3)
  {
    *(_BYTE *)(a2 + 8) = 0;
    result = 3;
  }
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxDatagrams::toDict(abm::data::DataAggregationMaxDatagrams *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(1);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationMaxDatagrams", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxDatagrams::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxDatagrams", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(1);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_24CE223C8;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x212BF3824](*a1) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_2127CE5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_24CE223C8;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxSize::toDict(abm::data::DataAggregationMaxSize *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(2);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataAggregationMaxSize", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxSize::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxSize", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(2);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_24CE22410;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x212BF3824](*a1) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_2127CE980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_24CE22410;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataFlowControl::toDict(abm::data::DataFlowControl *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(3);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_BOOL_create(*((_BYTE *)this + 9));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataFlowControl", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataFlowControl::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_BOOL_create(*(_BYTE *)(a1 + 9));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataFlowControl", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(3);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_24CE22458;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x212BF3824](*a1) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(*a1, "kDataFlowControl"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataFlowControl");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_BYTE *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_2127CED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataFlowControl>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_24CE22458;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_BYTE *)(a2 + 9) = (_DWORD)result != 0;
  return result;
}

void abm::data::DataPowerSave::toDict(abm::data::DataPowerSave *this@<X0>, void **a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;

  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = xpc_int64_create(4);
  if (!v7)
    v7 = xpc_null_create();
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  v10 = xpc_BOOL_create(*((_BYTE *)this + 9));
  if (!v10)
    v10 = xpc_null_create();
  xpc_dictionary_set_value(v8, "kDataPowerSave", v10);
  v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataPowerSave::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;

  v3 = xpc_BOOL_create(*(_BYTE *)(a1 + 9));
  if (!v3)
    v3 = xpc_null_create();
  xpc_dictionary_set_value(*a2, "kDataPowerSave", v3);
  v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::createDictForGet(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BF3824](v3) == MEMORY[0x24BDACFA0])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  v5 = xpc_int64_create(4);
  if (!v5)
    v5 = xpc_null_create();
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t object;

  *(_QWORD *)a2 = &off_24CE224A0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x212BF3824](*a1) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(*a1, "kDataPowerSave"))
  {
    value = xpc_dictionary_get_value(*a1, "kDataPowerSave");
    object = value;
    if (value)
      xpc_retain(value);
    else
      object = xpc_null_create();
    *(_BYTE *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(_BYTE *)(a2 + 8) = 0;
  }
}

void sub_2127CF140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t abm::data::DataProperty<abm::data::DataPowerSave>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = &off_24CE224A0;
  *(_QWORD *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_BYTE *)(a2 + 9) = (_DWORD)result != 0;
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL trace::isModeActive(int a1)
{
  return !a1 || a1 == 6;
}

const char *trace::toString(unsigned int a1)
{
  if (a1 > 6)
    return "Unknown";
  else
    return off_24CE22578[a1];
}

{
  if (a1 > 3)
    return "unknown";
  else
    return off_24CE225B0[a1];
}

{
  if (a1 > 2)
    return "Unknown";
  else
    return off_24CE225D0[a1];
}

{
  if (a1 > 3)
    return "Unknown";
  else
    return off_24CE225E8[a1];
}

const char *trace::dal::toString(unsigned int a1)
{
  if (a1 > 6)
    return "TraceLevelUnknown";
  else
    return off_24CE22608[a1];
}

{
  if (a1 > 2)
    return "TraceModeUnknown";
  else
    return off_24CE22640[a1];
}

uint64_t coex::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  std::string::size_type v20;
  std::string *size;
  uint64_t v22;
  pthread_mutex_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  void *v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  std::string::size_type v31;
  std::string *v32;
  uint64_t v33;
  pthread_mutex_t *v34;
  _QWORD *v35;
  std::string *v36;
  __int128 v37;
  const char *v38;
  size_t v39;
  std::string *v40;
  __int128 v41;
  std::string *v43;
  unsigned int *data;
  unsigned int *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  std::string *v51;
  unsigned int *v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int v58;
  std::string v59;
  _BYTE v60[16];
  std::string v61;
  _QWORD **v62;
  _QWORD *v63;
  uint64_t v64;

  *(_QWORD *)a1 = off_24CE22B78;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v60, "com.apple.telephony.abm", "coex.drv");
  v6 = dispatch_queue_create("coex.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE22C70;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v61);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v59);
  *(_QWORD *)a1 = off_24CE22DE0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v60);
  *(_QWORD *)a1 = off_24CE22B78;
  *(_QWORD *)(a1 + 104) = *a3;
  v11 = a3[1];
  *(_QWORD *)(a1 + 112) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *(_QWORD *)(a1 + 120) = &off_24CE22CB0;
  v14 = (uint64_t *)operator new(0x28uLL);
  v15 = operator new(0x20uLL);
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v61;
  *(_OWORD *)&v61.__r_.__value_.__r.__words[1] = (unint64_t)&v61;
  v63 = 0;
  v64 = 0;
  v62 = &v63;
  v16 = operator new(0x40uLL);
  *v16 = v16;
  v16[1] = v16;
  v16[5] = 0;
  v16[4] = 0;
  v16[2] = 0;
  v16[3] = v16 + 4;
  *(_QWORD *)v15 = v16;
  *((_QWORD *)v15 + 1) = 0;
  v17 = operator new(0x18uLL);
  v17[1] = 0x100000001;
  *v17 = off_24CE22E60;
  v17[2] = v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = operator new(1uLL);
  *((_QWORD *)v15 + 2) = v18;
  *((_QWORD *)v15 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v15 + 16, (uint64_t)v18, (unsigned int **)v15 + 3);
  *v14 = (uint64_t)v15;
  v14[1] = 0;
  v19 = operator new(0x18uLL);
  v19[1] = 0x100000001;
  *v19 = off_24CE22F30;
  v19[2] = v15;
  v14[1] = (uint64_t)v19;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v63);
  if (v61.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v61.__r_.__value_.__l.__size_;
    v20 = v61.__r_.__value_.__r.__words[0];
    v22 = *(_QWORD *)v61.__r_.__value_.__l.__size_;
    *(_QWORD *)(v22 + 8) = *(_QWORD *)(v61.__r_.__value_.__r.__words[0] + 8);
    **(_QWORD **)(v20 + 8) = v22;
    v61.__r_.__value_.__r.__words[2] = 0;
    if (size != &v61)
    {
      do
      {
        v43 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (unsigned int *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          v45 = data + 2;
          do
          {
            v46 = __ldaxr(v45);
            v47 = v46 - 1;
          }
          while (__stlxr(v47, v45));
          if (!v47)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)data + 16))(data);
            v48 = data + 3;
            do
            {
              v49 = __ldaxr(v48);
              v50 = v49 - 1;
            }
            while (__stlxr(v50, v48));
            if (!v50)
              (*(void (**)(unsigned int *))(*(_QWORD *)data + 24))(data);
          }
        }
        operator delete(size);
        size = v43;
      }
      while (v43 != &v61);
    }
  }
  v14[2] = *(_QWORD *)*v14;
  v23 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v23, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v14 + 3, (uint64_t)v23);
  *(_QWORD *)(a1 + 128) = v14;
  *(_QWORD *)(a1 + 136) = 0;
  v24 = operator new(0x18uLL);
  v24[1] = 0x100000001;
  *v24 = off_24CE22FF0;
  v24[2] = v14;
  *(_QWORD *)(a1 + 144) = &off_24CE22D70;
  *(_QWORD *)(a1 + 136) = v24;
  v25 = (uint64_t *)operator new(0x28uLL);
  v26 = operator new(0x20uLL);
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v61;
  *(_OWORD *)&v61.__r_.__value_.__r.__words[1] = (unint64_t)&v61;
  v63 = 0;
  v64 = 0;
  v62 = &v63;
  v27 = operator new(0x40uLL);
  *v27 = v27;
  v27[1] = v27;
  v27[5] = 0;
  v27[4] = 0;
  v27[2] = 0;
  v27[3] = v27 + 4;
  *(_QWORD *)v26 = v27;
  *((_QWORD *)v26 + 1) = 0;
  v28 = operator new(0x18uLL);
  v28[1] = 0x100000001;
  *v28 = off_24CE23050;
  v28[2] = v27;
  *((_QWORD *)v26 + 1) = v28;
  v29 = operator new(1uLL);
  *((_QWORD *)v26 + 2) = v29;
  *((_QWORD *)v26 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v26 + 16, (uint64_t)v29, (unsigned int **)v26 + 3);
  *v25 = (uint64_t)v26;
  v25[1] = 0;
  v30 = operator new(0x18uLL);
  v30[1] = 0x100000001;
  *v30 = off_24CE230B0;
  v30[2] = v26;
  v25[1] = (uint64_t)v30;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v63);
  if (v61.__r_.__value_.__r.__words[2])
  {
    v32 = (std::string *)v61.__r_.__value_.__l.__size_;
    v31 = v61.__r_.__value_.__r.__words[0];
    v33 = *(_QWORD *)v61.__r_.__value_.__l.__size_;
    *(_QWORD *)(v33 + 8) = *(_QWORD *)(v61.__r_.__value_.__r.__words[0] + 8);
    **(_QWORD **)(v31 + 8) = v33;
    v61.__r_.__value_.__r.__words[2] = 0;
    if (v32 != &v61)
    {
      do
      {
        v51 = (std::string *)v32->__r_.__value_.__l.__size_;
        v52 = (unsigned int *)v32[1].__r_.__value_.__l.__data_;
        if (v52)
        {
          v53 = v52 + 2;
          do
          {
            v54 = __ldaxr(v53);
            v55 = v54 - 1;
          }
          while (__stlxr(v55, v53));
          if (!v55)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 16))(v52);
            v56 = v52 + 3;
            do
            {
              v57 = __ldaxr(v56);
              v58 = v57 - 1;
            }
            while (__stlxr(v58, v56));
            if (!v58)
              (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 24))(v52);
          }
        }
        operator delete(v32);
        v32 = v51;
      }
      while (v51 != &v61);
    }
  }
  v25[2] = *(_QWORD *)*v25;
  v34 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v34, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v25 + 3, (uint64_t)v34);
  *(_QWORD *)(a1 + 152) = v25;
  *(_QWORD *)(a1 + 160) = 0;
  v35 = operator new(0x18uLL);
  v35[1] = 0x100000001;
  *v35 = off_24CE23110;
  v35[2] = v25;
  *(_QWORD *)(a1 + 160) = v35;
  *((_BYTE *)&v59.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v59, "coex.drv");
  v36 = std::string::append(&v59, ".", 1uLL);
  v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  v61.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  v38 = getprogname();
  v39 = strlen(v38);
  v40 = std::string::append(&v61, v38, v39);
  v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 184) = *((_QWORD *)&v40->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 168) = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_36:
    operator delete(v59.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_36;
  return a1;
}

void sub_2127CF838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;

  if (a15 < 0)
    operator delete(__p);
  boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(v26);
  boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(v25);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

_QWORD *boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE22D70;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE22CB0;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
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
      return v1;
    }
  }
  return result;
}

_QWORD *ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE22C70;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE22C70;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t coex::CommandDriver::getName(coex::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 168;
  if (*((char *)this + 191) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 168);
  if (*(char *)(a1 + 191) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
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
  __cxa_throw(exception, (struct type_info *)off_24CE22158, MEMORY[0x24BEDAAF0]);
}

void sub_2127D04C8(_Unwind_Exception *a1)
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

_QWORD *ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

_QWORD *ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE22C70;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE22C70;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE22CB0;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE22D70;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE22C70;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t *boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(uint64_t *a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v11;

  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::mutex>(&v11, a2);
  v3 = (unsigned int *)a1[1];
  a1[1] = (uint64_t)v11;
  v11 = v3;
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  return a1;
}

void sub_2127D0914(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  v3 = *(unsigned int **)(v1 + 8);
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 16))(v3);
      v7 = v3 + 3;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
        (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_base::destroy(uint64_t this)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

unsigned int *boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>(uint64_t a1, uint64_t a2, unsigned int **a3)
{
  unsigned int *result;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  result = (unsigned int *)operator new(0x18uLL);
  *((_QWORD *)result + 1) = 0x100000001;
  *(_QWORD *)result = off_24CE22ED0;
  *((_QWORD *)result + 2) = a2;
  v6 = *a3;
  *a3 = result;
  if (v6)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      result = (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
      v10 = v6 + 3;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
        return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
    }
  }
  return result;
}

void sub_2127D0E1C(void *a1)
{
  void *v1;

  __cxa_begin_catch(a1);
  if (v1)
    operator delete(v1);
  __cxa_rethrow();
}

void sub_2127D0E34(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::dispose(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
    operator delete(v1);
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

_QWORD *boost::detail::shared_count::shared_count<boost::signals2::mutex>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = 0;
  v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  *v4 = off_24CE22F90;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_2127D0FCC(void *a1)
{
  pthread_mutex_t *v1;

  __cxa_begin_catch(a1);
  if (v1)
  {
    pthread_mutex_destroy(v1);
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_2127D0FF0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void boost::detail::sp_counted_impl_p<boost::signals2::mutex>::dispose(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
  {
    pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 16));
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

const char *awd::asString(char a1)
{
  if ((a1 + 1) > 6u)
    return "AppID::kWirelessTelemetry";
  else
    return off_24CE23578[(char)(a1 + 1)];
}

const char *awd::asString(int a1)
{
  if ((a1 - 1) > 2)
    return "ClientState::kStopped";
  else
    return off_24CE23560[(char)(a1 - 1)];
}

{
  const char *v1;

  v1 = "PayloadType::kDeviceConfig";
  if (a1 == 1)
    v1 = "PayloadType::kComponentConfig";
  if (a1 == 2)
    return "PayloadType::kProfileConfig";
  else
    return v1;
}

uint64_t awd::asString@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  _BYTE *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  void *__p[2];
  __int128 v28;
  __int128 v29;
  _OWORD v30[9];
  unint64_t v31;

  v31 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[7] = v2;
  v30[8] = v2;
  v30[5] = v2;
  v30[6] = v2;
  v30[3] = v2;
  v30[4] = v2;
  v30[1] = v2;
  v30[2] = v2;
  v29 = v2;
  v30[0] = v2;
  *(_OWORD *)__p = v2;
  v28 = v2;
  v25 = v2;
  *(_OWORD *)__src = v2;
  v23 = v2;
  v24 = v2;
  v22 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v22);
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Profile: 0x", 11);
  *(_DWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  v4 = (_QWORD *)std::ostream::operator<<();
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Metric: 0x", 12);
  *(_DWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  v6 = (_QWORD *)std::ostream::operator<<();
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Component: 0x", 15);
  *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  v8 = (_QWORD *)std::ostream::operator<<();
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Submission: 0x", 16);
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 8) = *(_DWORD *)((_BYTE *)v9 + *(_QWORD *)(*v9 - 24) + 8) & 0xFFFFFFB5 | 8;
  v10 = (_QWORD *)std::ostream::operator<<();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", PII: ", 7);
  *(_DWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 8) |= 1u;
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)", Location: ", 12);
  *(_DWORD *)((char *)v13 + *(_QWORD *)(*v13 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v29) & 0x10) != 0)
  {
    v15 = (_BYTE *)v29;
    if ((void *)v29 < __src[1])
    {
      *(void **)&v29 = __src[1];
      v15 = __src[1];
    }
    v16 = __src[0];
    v14 = v15 - (char *)__src[0];
    if ((unint64_t)(v15 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_18;
  }
  else
  {
    if ((BYTE8(v29) & 8) == 0)
    {
      v14 = 0;
      a1[23] = 0;
      goto LABEL_14;
    }
    v16 = (const void *)*((_QWORD *)&v24 + 1);
    v14 = *((_QWORD *)&v25 + 1) - *((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v25 + 1) - *((_QWORD *)&v24 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_18:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v19 = operator new(v17 + 1);
    *((_QWORD *)a1 + 1) = v14;
    *((_QWORD *)a1 + 2) = v18 | 0x8000000000000000;
    *(_QWORD *)a1 = v19;
    a1 = v19;
    goto LABEL_13;
  }
  a1[23] = v14;
  if (v14)
LABEL_13:
    memmove(a1, v16, v14);
LABEL_14:
  a1[v14] = 0;
  *(_QWORD *)&v22 = *MEMORY[0x24BEDB7F0];
  v20 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v23 = v20;
  *((_QWORD *)&v23 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v28) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v30);
}

{
  __int128 v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  size_t v9;
  _BYTE *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *__src[2];
  void *__p[2];
  __int128 v23;
  __int128 v24;
  _OWORD v25[9];
  unint64_t v26;

  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v2;
  v25[8] = v2;
  v25[5] = v2;
  v25[6] = v2;
  v25[3] = v2;
  v25[4] = v2;
  v25[1] = v2;
  v25[2] = v2;
  v24 = v2;
  v25[0] = v2;
  *(_OWORD *)__p = v2;
  v23 = v2;
  v20 = v2;
  *(_OWORD *)__src = v2;
  v18 = v2;
  v19 = v2;
  v17 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"Trigger: 0x", 11);
  *(_DWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  v4 = (_QWORD *)std::ostream::operator<<();
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Reference: 0x", 15);
  *(_DWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  v6 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Type: ", 8);
  v7 = (_QWORD *)std::ostream::operator<<();
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", Time: ", 8);
  *(_DWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    v10 = (_BYTE *)v24;
    if ((void *)v24 < __src[1])
    {
      *(void **)&v24 = __src[1];
      v10 = __src[1];
    }
    v11 = __src[0];
    v9 = v10 - (char *)__src[0];
    if ((unint64_t)(v10 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_18;
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      v9 = 0;
      a1[23] = 0;
      goto LABEL_14;
    }
    v11 = (const void *)*((_QWORD *)&v19 + 1);
    v9 = *((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_18:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 >= 0x17)
  {
    v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v12 = v9 | 7;
    v13 = v12 + 1;
    v14 = operator new(v12 + 1);
    *((_QWORD *)a1 + 1) = v9;
    *((_QWORD *)a1 + 2) = v13 | 0x8000000000000000;
    *(_QWORD *)a1 = v14;
    a1 = v14;
    goto LABEL_13;
  }
  a1[23] = v9;
  if (v9)
LABEL_13:
    memmove(a1, v11, v9);
LABEL_14:
  a1[v9] = 0;
  *(_QWORD *)&v17 = *MEMORY[0x24BEDB7F0];
  v15 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v18 = v15;
  *((_QWORD *)&v18 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v23) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v25);
}

void sub_2127D19BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
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

void sub_2127D1AD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x212BF3620](v1);
  _Unwind_Resume(a1);
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
  MEMORY[0x212BF3620](a1 + 128);
  return a1;
}

void sub_2127D1DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t awd::asString@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  __int128 v4;
  _QWORD *v5;
  const char *v6;
  size_t v7;
  size_t v8;
  _BYTE *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *__src[2];
  void *__p[2];
  __int128 v22;
  __int128 v23;
  _OWORD v24[9];
  unint64_t v25;

  v25 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v4;
  v24[8] = v4;
  v24[5] = v4;
  v24[6] = v4;
  v24[3] = v4;
  v24[4] = v4;
  v24[1] = v4;
  v24[2] = v4;
  v23 = v4;
  v24[0] = v4;
  *(_OWORD *)__p = v4;
  v22 = v4;
  v19 = v4;
  *(_OWORD *)__src = v4;
  v17 = v4;
  v18 = v4;
  v16 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v16);
  if (*(_QWORD *)a1)
  {
    v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Application: ", 13);
    if ((*(_BYTE *)(*(_QWORD *)a1 + 8) + 1) > 6u)
      v6 = "AppID::kWirelessTelemetry";
    else
      v6 = off_24CE23578[(char)(*(_BYTE *)(*(_QWORD *)a1 + 8) + 1)];
    v7 = strlen(v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v6, v7);
  }
  if ((BYTE8(v23) & 0x10) != 0)
  {
    v9 = (_BYTE *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&v23 = __src[1];
      v9 = __src[1];
    }
    v10 = __src[0];
    v8 = v9 - (char *)__src[0];
    if ((unint64_t)(v9 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_23;
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      v8 = 0;
      a2[23] = 0;
      goto LABEL_19;
    }
    v10 = (const void *)*((_QWORD *)&v18 + 1);
    v8 = *((_QWORD *)&v19 + 1) - *((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v19 + 1) - *((_QWORD *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_23:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v13 = operator new(v11 + 1);
    *((_QWORD *)a2 + 1) = v8;
    *((_QWORD *)a2 + 2) = v12 | 0x8000000000000000;
    *(_QWORD *)a2 = v13;
    a2 = v13;
    goto LABEL_18;
  }
  a2[23] = v8;
  if (v8)
LABEL_18:
    memmove(a2, v10, v8);
LABEL_19:
  a2[v8] = 0;
  *(_QWORD *)&v16 = *MEMORY[0x24BEDB7F0];
  v14 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v16 + *(_QWORD *)(v16 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v17 = v14;
  *((_QWORD *)&v17 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v22) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v24);
}

void sub_2127D2018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t awd::operator<<(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *v5;

  if (*(_QWORD *)a2)
  {
    v4 = MEMORY[0x212BF3494](a1, "Application: ");
    if ((*(_BYTE *)(*(_QWORD *)a2 + 8) + 1) > 6u)
      v5 = "AppID::kWirelessTelemetry";
    else
      v5 = off_24CE23578[(char)(*(_BYTE *)(*(_QWORD *)a2 + 8) + 1)];
    MEMORY[0x212BF3494](v4, v5);
  }
  return a1;
}

uint64_t awd::operator<<(uint64_t a1, _BYTE *a2)
{
  __int128 v4;
  _QWORD *v5;
  const char *v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *__dst[2];
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p[2];
  __int128 v28;
  __int128 v29;
  _OWORD v30[9];
  unint64_t v31;

  v31 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[7] = v4;
  v30[8] = v4;
  v30[5] = v4;
  v30[6] = v4;
  v30[3] = v4;
  v30[4] = v4;
  v30[1] = v4;
  v30[2] = v4;
  v29 = v4;
  v30[0] = v4;
  *(_OWORD *)__p = v4;
  v28 = v4;
  v25 = v4;
  v26 = v4;
  v23 = v4;
  v24 = v4;
  v22 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v22);
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Application: ", 13);
  if ((*a2 + 1) > 6u)
    v6 = "AppID::kWirelessTelemetry";
  else
    v6 = off_24CE23578[(char)(*a2 + 1)];
  v7 = strlen(v6);
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v6, v7);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", PII allowed: ", 15);
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 8) |= 1u;
  v10 = (_QWORD *)std::ostream::operator<<();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", Location allowed: ", 20);
  *(_DWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v29) & 0x10) != 0)
  {
    v14 = v29;
    if ((unint64_t)v29 < *((_QWORD *)&v26 + 1))
    {
      *(_QWORD *)&v29 = *((_QWORD *)&v26 + 1);
      v14 = *((_QWORD *)&v26 + 1);
    }
    v15 = (const void *)v26;
    v12 = v14 - v26;
    if ((unint64_t)(v14 - v26) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_23;
  }
  else
  {
    if ((BYTE8(v29) & 8) == 0)
    {
      v12 = 0;
      HIBYTE(v21) = 0;
      v13 = __dst;
      goto LABEL_17;
    }
    v15 = (const void *)*((_QWORD *)&v24 + 1);
    v12 = *((_QWORD *)&v25 + 1) - *((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v25 + 1) - *((_QWORD *)&v24 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_23:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v12 >= 0x17)
  {
    v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v16 = v12 | 7;
    v17 = v16 + 1;
    v13 = (void **)operator new(v16 + 1);
    __dst[1] = (void *)v12;
    v21 = v17 | 0x8000000000000000;
    __dst[0] = v13;
    goto LABEL_16;
  }
  HIBYTE(v21) = v12;
  v13 = __dst;
  if (v12)
LABEL_16:
    memmove(v13, v15, v12);
LABEL_17:
  *((_BYTE *)v13 + v12) = 0;
  MEMORY[0x212BF34A0](a1, __dst);
  if (SHIBYTE(v21) < 0)
    operator delete(__dst[0]);
  *(_QWORD *)&v22 = *MEMORY[0x24BEDB7F0];
  v18 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v23 = v18;
  *((_QWORD *)&v23 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v28) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BF3620](v30);
  return a1;
}

void sub_2127D232C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t awd::operator<<(uint64_t a1)
{
  __int128 v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  void **v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *__dst[2];
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *__p[2];
  __int128 v30;
  __int128 v31;
  _OWORD v32[9];
  unint64_t v33;

  v33 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[7] = v2;
  v32[8] = v2;
  v32[5] = v2;
  v32[6] = v2;
  v32[3] = v2;
  v32[4] = v2;
  v32[1] = v2;
  v32[2] = v2;
  v31 = v2;
  v32[0] = v2;
  *(_OWORD *)__p = v2;
  v30 = v2;
  v27 = v2;
  v28 = v2;
  v25 = v2;
  v26 = v2;
  v24 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v24);
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v25, (uint64_t)"Profile: 0x", 11);
  *(_DWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  v4 = (_QWORD *)std::ostream::operator<<();
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Metric: 0x", 12);
  *(_DWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  v6 = (_QWORD *)std::ostream::operator<<();
  v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Component: 0x", 15);
  *(_DWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 8) = *(_DWORD *)((_BYTE *)v7 + *(_QWORD *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  v8 = (_QWORD *)std::ostream::operator<<();
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Submission: 0x", 16);
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 8) = *(_DWORD *)((_BYTE *)v9 + *(_QWORD *)(*v9 - 24) + 8) & 0xFFFFFFB5 | 8;
  v10 = (_QWORD *)std::ostream::operator<<();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", PII: ", 7);
  *(_DWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 8) |= 1u;
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)", Location: ", 12);
  *(_DWORD *)((char *)v13 + *(_QWORD *)(*v13 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v31) & 0x10) != 0)
  {
    v16 = v31;
    if ((unint64_t)v31 < *((_QWORD *)&v28 + 1))
    {
      *(_QWORD *)&v31 = *((_QWORD *)&v28 + 1);
      v16 = *((_QWORD *)&v28 + 1);
    }
    v17 = (const void *)v28;
    v14 = v16 - v28;
    if ((unint64_t)(v16 - v28) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((BYTE8(v31) & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v23) = 0;
      v15 = __dst;
      goto LABEL_14;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = *((_QWORD *)&v27 + 1) - *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v27 + 1) - *((_QWORD *)&v26 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = (void **)operator new(v18 + 1);
    __dst[1] = (void *)v14;
    v23 = v19 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_13;
  }
  HIBYTE(v23) = v14;
  v15 = __dst;
  if (v14)
LABEL_13:
    memmove(v15, v17, v14);
LABEL_14:
  *((_BYTE *)v15 + v14) = 0;
  MEMORY[0x212BF34A0](a1, __dst);
  if (SHIBYTE(v23) < 0)
    operator delete(__dst[0]);
  *(_QWORD *)&v24 = *MEMORY[0x24BEDB7F0];
  v20 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v24 + *(_QWORD *)(v24 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v25 = v20;
  *((_QWORD *)&v25 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v30) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BF3620](v32);
  return a1;
}

{
  __int128 v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  size_t v9;
  void **v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *__dst[2];
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *__p[2];
  __int128 v25;
  __int128 v26;
  _OWORD v27[9];
  unint64_t v28;

  v28 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[7] = v2;
  v27[8] = v2;
  v27[5] = v2;
  v27[6] = v2;
  v27[3] = v2;
  v27[4] = v2;
  v27[1] = v2;
  v27[2] = v2;
  v26 = v2;
  v27[0] = v2;
  *(_OWORD *)__p = v2;
  v25 = v2;
  v22 = v2;
  v23 = v2;
  v20 = v2;
  v21 = v2;
  v19 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v19);
  v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v20, (uint64_t)"Trigger: 0x", 11);
  *(_DWORD *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  v4 = (_QWORD *)std::ostream::operator<<();
  v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Reference: 0x", 15);
  *(_DWORD *)((char *)v5 + *(_QWORD *)(*v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  v6 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Type: ", 8);
  v7 = (_QWORD *)std::ostream::operator<<();
  v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", Time: ", 8);
  *(_DWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::ostream::operator<<();
  if ((BYTE8(v26) & 0x10) != 0)
  {
    v11 = v26;
    if ((unint64_t)v26 < *((_QWORD *)&v23 + 1))
    {
      *(_QWORD *)&v26 = *((_QWORD *)&v23 + 1);
      v11 = *((_QWORD *)&v23 + 1);
    }
    v12 = (const void *)v23;
    v9 = v11 - v23;
    if ((unint64_t)(v11 - v23) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((BYTE8(v26) & 8) == 0)
    {
      v9 = 0;
      HIBYTE(v18) = 0;
      v10 = __dst;
      goto LABEL_14;
    }
    v12 = (const void *)*((_QWORD *)&v21 + 1);
    v9 = *((_QWORD *)&v22 + 1) - *((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v22 + 1) - *((_QWORD *)&v21 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 >= 0x17)
  {
    v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v13 = v9 | 7;
    v14 = v13 + 1;
    v10 = (void **)operator new(v13 + 1);
    __dst[1] = (void *)v9;
    v18 = v14 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_13;
  }
  HIBYTE(v18) = v9;
  v10 = __dst;
  if (v9)
LABEL_13:
    memmove(v10, v12, v9);
LABEL_14:
  *((_BYTE *)v10 + v9) = 0;
  MEMORY[0x212BF34A0](a1, __dst);
  if (SHIBYTE(v18) < 0)
    operator delete(__dst[0]);
  *(_QWORD *)&v19 = *MEMORY[0x24BEDB7F0];
  v15 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v19 + *(_QWORD *)(v19 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v20 = v15;
  *((_QWORD *)&v20 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v25) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BF3620](v27);
  return a1;
}

void sub_2127D2688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2127D2964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void awd::AppContext::setHandler(dispatch_queue_t *a1, void **a2)
{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_11ClientStateEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_13AppPropertiesEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_29;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvjhEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_30;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_11TriggerInfoEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_31;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEjNSt3__16vectorIhNS4_9allocatorIhEEEEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_32;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

{
  void *v3;
  _QWORD v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEtEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_33;
  v4[4] = a1;
  v3 = *a2;
  if (*a2)
    v3 = _Block_copy(v3);
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock)
    _Block_release(aBlock);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_11ClientStateEEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd11ClientStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd11ClientStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_13AppPropertiesEEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c80_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_13AppPropertiesEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c80_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_13AppPropertiesEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvjhEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvjhEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvjhEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_11TriggerInfoEEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c78_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_11TriggerInfoEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c78_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_11TriggerInfoEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEjNSt3__16vectorIhNS4_9allocatorIhEEEEEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c97_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEjNSt3__16vectorIhNS3_9allocatorIhEEEEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c97_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEjNSt3__16vectorIhNS3_9allocatorIhEEEEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEtEEE_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v1)
    v1 = _Block_copy(v1);
  v3 = *(const void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = v1;
  if (v3)
    _Block_release(v3);
}

void *__copy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEtEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEtEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void awd::AppContext::setProperties(dispatch_queue_t *a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 0x40000000;
  v2[2] = ___ZN3awd10AppContext13setPropertiesERKNS_13AppPropertiesE_block_invoke;
  v2[3] = &__block_descriptor_tmp_34;
  v2[4] = a1;
  v2[5] = a2;
  dispatch_async(*a1, v2);
}

uint64_t ___ZN3awd10AppContext13setPropertiesERKNS_13AppPropertiesE_block_invoke(uint64_t result)
{
  uint64_t v1;
  __int16 *v2;
  __int16 v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(__int16 **)(result + 40);
  v3 = *v2;
  *(_BYTE *)(v1 + 10) = *((_BYTE *)v2 + 2);
  *(_WORD *)(v1 + 8) = v3;
  return result;
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return *((unsigned __int16 *)this + 4) | (*((unsigned __int8 *)this + 10) << 16);
}

void awd::AppContext::operator()(dispatch_queue_t *a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 0x40000000;
  v2[2] = ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke;
  v2[3] = &__block_descriptor_tmp_35;
  v2[4] = a1;
  v3 = a2;
  dispatch_async(*a1, v2);
}

uint64_t ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, int a2, char a3)
{
  _QWORD v3[5];
  int v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK3awd10AppContextclEjh_block_invoke;
  v3[3] = &__block_descriptor_tmp_36;
  v3[4] = a1;
  v4 = a2;
  v5 = a3;
  dispatch_async(*a1, v3);
}

uint64_t ___ZNK3awd10AppContextclEjh_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, __int16 a3)
{
  _QWORD block[5];
  _BYTE v4[28];
  __int16 v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3awd10AppContextclENS_10MetricInfoEt_block_invoke;
  block[3] = &__block_descriptor_tmp_39;
  block[4] = a1;
  *(_OWORD *)v4 = *a2;
  *(_OWORD *)&v4[12] = *(_OWORD *)((char *)a2 + 12);
  v5 = a3;
  dispatch_async(*a1, block);
}

uint64_t ___ZNK3awd10AppContextclENS_10MetricInfoEt_block_invoke(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[28];

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (result)
  {
    *(_OWORD *)&v3[12] = *(_OWORD *)(a1 + 52);
    *(_OWORD *)v3 = *(_OWORD *)(a1 + 40);
    return (*(uint64_t (**)(uint64_t, _BYTE *, _QWORD))(result + 16))(result, v3, *(unsigned __int16 *)(a1 + 68));
  }
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, const void **a2, char a3)
{
  const void *v4;
  _QWORD v6[4];
  void *aBlock;
  char v8;

  v4 = *a2;
  if (*a2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1174405120;
    v6[2] = ___ZNK3awd10AppContextclEN8dispatch5blockIU13block_pointerFvbEEEb_block_invoke;
    v6[3] = &__block_descriptor_tmp_40;
    aBlock = _Block_copy(v4);
    v8 = a3;
    dispatch_async(*a1, v6);
    if (aBlock)
      _Block_release(aBlock);
  }
}

uint64_t ___ZNK3awd10AppContextclEN8dispatch5blockIU13block_pointerFvbEEEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

_QWORD *awd::AwdCommandDriver::AwdCommandDriver(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _BYTE v15[16];
  _BYTE v16[16];
  _BYTE v17[16];

  *a1 = off_24CE23398;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v15, "com.apple.telephony.abm", "awd.driver");
  v6 = dispatch_queue_create("awd.driver", 0);
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    a1[12] = 0;
    dispatch_release(v7);
  }
  else
  {
    a1[12] = 0;
  }
  *a1 = off_24CE234B0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v17);
  a1[1] = &unk_24CE22E20;
  a1[7] = *a2;
  v8 = a2[1];
  a1[8] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v16);
  *a1 = off_24CE234F0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v15);
  *a1 = off_24CE23398;
  a1[13] = *a3;
  v11 = a3[1];
  a1[14] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  a1[17] = 0;
  a1[16] = 0;
  a1[15] = a1 + 16;
  return a1;
}

void sub_2127D34A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  _QWORD *v13;

  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(v13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

const char *awd::AwdCommandDriver::getName(awd::AwdCommandDriver *this)
{
  return "awd.driver";
}

void awd::AwdCommandDriver::~AwdCommandDriver(awd::AwdCommandDriver *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;

  *(_QWORD *)this = off_24CE23398;
  std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(*((_QWORD **)this + 16));
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 14);
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
  *(_QWORD *)this = off_24CE234B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v5 = *((_QWORD *)this + 12);
  if (v5)
    dispatch_release(v5);
  v6 = *((_QWORD *)this + 11);
  if (v6)
    dispatch_release(v6);
  v7 = (std::__shared_weak_count *)*((_QWORD *)this + 10);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
}

void awd::AwdCommandDriver::checkIn(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  _QWORD block[6];

  if (*a2)
  {
    v2 = (std::__shared_weak_count *)a2[1];
    v10 = *a2;
    v11 = v2;
    if (v2)
    {
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        v4 = __ldxr(p_shared_owners);
      while (__stxr(v4 + 1, p_shared_owners));
    }
    v12 = a1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_7checkInENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke;
    block[3] = &__block_descriptor_tmp_45;
    block[4] = a1 + 72;
    block[5] = &v10;
    v6 = a1 + 88;
    v5 = *(NSObject **)(a1 + 88);
    if (*(_QWORD *)(v6 + 8))
    {
      dispatch_async_and_wait(v5, block);
      v7 = v11;
      if (!v11)
        return;
    }
    else
    {
      dispatch_sync(v5, block);
      v7 = v11;
      if (!v11)
        return;
    }
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void awd::AwdCommandDriver::checkOut(uint64_t a1, uint64_t *a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  _QWORD block[6];

  if (*a2)
  {
    v2 = (std::__shared_weak_count *)a2[1];
    v10 = *a2;
    v11 = v2;
    if (v2)
    {
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        v4 = __ldxr(p_shared_owners);
      while (__stxr(v4 + 1, p_shared_owners));
    }
    v12 = a1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_8checkOutENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke;
    block[3] = &__block_descriptor_tmp_46;
    block[4] = a1 + 72;
    block[5] = &v10;
    v6 = a1 + 88;
    v5 = *(NSObject **)(a1 + 88);
    if (*(_QWORD *)(v6 + 8))
    {
      dispatch_async_and_wait(v5, block);
      v7 = v11;
      if (!v11)
        return;
    }
    else
    {
      dispatch_sync(v5, block);
      v7 = v11;
      if (!v11)
        return;
    }
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void awd::AwdCommandDriver::broadcastState_sync(_QWORD *a1, char a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = (std::__shared_weak_count *)a1[10];
  if (!v3 || (v5 = a1[9], (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *(_BYTE *)v8 = a2;
  v8[1] = a1;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[11];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<awd::AwdCommandDriver>::execute_wrapped<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>(awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0,dispatch_queue_s *::default_delete<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

void ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 10;
  strcpy(a1, "awd.driver");
}

uint64_t ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

_QWORD *ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE234B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE234B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x212BF353C](v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
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
  MEMORY[0x212BF3548](v13);
  return a1;
}

void sub_2127D3A08(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212BF3548](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2127D39E8);
}

void sub_2127D3A50(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[3];

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
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_2127D3BF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *ctu::SharedLoggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE234B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE234B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (a1)
  {
    std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(*a1);
    std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(a1[1]);
    v2 = (std::__shared_weak_count *)a1[6];
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(a1);
    }
    else
    {
LABEL_6:
      operator delete(a1);
    }
  }
}

void ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_7checkInENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned __int8 *v5;
  uint64_t **v6;
  char *v7;
  unsigned int v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void **v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD v31[2];
  void *__p[2];
  char v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint8_t buf[4];
  void **v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 40);
  v2 = v1[2];
  v3 = *v1;
  v4 = *(unsigned __int8 *)(*v1 + 8);
  v6 = (uint64_t **)(v2 + 128);
  v5 = *(unsigned __int8 **)(v2 + 128);
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (char *)v5;
        v8 = v5[32];
        if (v4 >= v8)
          break;
        v5 = *(unsigned __int8 **)v7;
        v6 = (uint64_t **)v7;
        if (!*(_QWORD *)v7)
          goto LABEL_8;
      }
      if (v8 >= v4)
        break;
      v5 = (unsigned __int8 *)*((_QWORD *)v7 + 1);
      if (!v5)
      {
        v6 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v7 = (char *)(v2 + 128);
LABEL_8:
    v9 = v7;
    v7 = (char *)operator new(0x38uLL);
    v7[32] = v4;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v9;
    *v6 = (uint64_t *)v7;
    v10 = **(_QWORD **)(v2 + 120);
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *(_QWORD *)(v2 + 120) = v10;
      v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 128), v11);
    ++*(_QWORD *)(v2 + 136);
    v3 = *v1;
  }
  v12 = v1[1];
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = (std::__shared_weak_count *)*((_QWORD *)v7 + 6);
  *((_QWORD *)v7 + 5) = v3;
  *((_QWORD *)v7 + 6) = v12;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = (std::__shared_weak_count *)v1[1];
  v34 = *v1;
  v35 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v2 + 104))(v2, &v34);
  v21 = v35;
  if (v35)
  {
    v22 = (unint64_t *)&v35->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = (std::__shared_weak_count *)v1[1];
    v31[0] = *v1;
    v31[1] = v25;
    if (v25)
    {
      v26 = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    awd::asString((uint64_t)v31, __p);
    if (v33 >= 0)
      v28 = __p;
    else
      v28 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v37 = v28;
    _os_log_debug_impl(&dword_2127C9000, v24, OS_LOG_TYPE_DEBUG, "#D %s checked in!", buf, 0xCu);
    if (v33 < 0)
      operator delete(__p[0]);
    if (v25)
    {
      v29 = (unint64_t *)&v25->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }
}

void sub_2127D3FD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v19;

  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_8checkOutENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  unsigned __int8 *v2;
  unsigned __int8 **v3;
  unsigned int v4;
  unsigned __int8 *v5;
  unsigned int v6;
  BOOL v7;
  unsigned __int8 **v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  int v23;
  void ***v24;
  void **v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  BOOL v31;
  void ***v32;
  _QWORD *v33;
  _BYTE *v34;
  void ****v35;
  void **v36;
  void **v37;
  void **v38;
  uint64_t *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  void **v44;
  unint64_t *v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  _QWORD v55[2];
  void *__p[2];
  char v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  uint8_t buf[4];
  void **v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 40);
  v2 = (unsigned __int8 *)v1[2];
  v3 = (unsigned __int8 **)*((_QWORD *)v2 + 16);
  if (!v3)
    return;
  v4 = *(unsigned __int8 *)(*v1 + 8);
  v5 = v2 + 128;
  do
  {
    v6 = *((unsigned __int8 *)v3 + 32);
    v7 = v6 >= v4;
    if (v6 >= v4)
      v8 = v3;
    else
      v8 = v3 + 1;
    if (v7)
      v5 = (unsigned __int8 *)v3;
    v3 = (unsigned __int8 **)*v8;
  }
  while (*v8);
  if (v5 == v2 + 128 || v4 < v5[32])
    return;
  v9 = (std::__shared_weak_count *)*((_QWORD *)v5 + 6);
  v58 = *((_QWORD *)v5 + 5);
  v59 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  (*(void (**)(unsigned __int8 *, uint64_t *))(*(_QWORD *)v2 + 112))(v2, &v58);
  v12 = v59;
  if (v59)
  {
    v13 = (unint64_t *)&v59->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = *((_QWORD *)v2 + 5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v41 = (std::__shared_weak_count *)v1[1];
    v55[0] = *v1;
    v55[1] = v41;
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
    }
    awd::asString((uint64_t)v55, __p);
    if (v57 >= 0)
      v44 = __p;
    else
      v44 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v61 = v44;
    _os_log_debug_impl(&dword_2127C9000, v15, OS_LOG_TYPE_DEBUG, "#D %s  checked out!", buf, 0xCu);
    if (v57 < 0)
      operator delete(__p[0]);
    if (v41)
    {
      v45 = (unint64_t *)&v41->__shared_owners_;
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
  }
  v16 = (unsigned __int8 *)*((_QWORD *)v5 + 1);
  if (v16)
  {
    do
    {
      v17 = v16;
      v16 = *(unsigned __int8 **)v16;
    }
    while (v16);
  }
  else
  {
    v18 = v5;
    do
    {
      v17 = (unsigned __int8 *)*((_QWORD *)v18 + 2);
      v31 = *(_QWORD *)v17 == (_QWORD)v18;
      v18 = v17;
    }
    while (!v31);
  }
  if (*((unsigned __int8 **)v2 + 15) == v5)
  {
    *((_QWORD *)v2 + 15) = v17;
    v19 = (unsigned __int8 *)*((_QWORD *)v2 + 16);
    --*((_QWORD *)v2 + 17);
    v20 = *(_QWORD *)v5;
    v21 = v5;
    if (!*(_QWORD *)v5)
      goto LABEL_33;
  }
  else
  {
    v19 = (unsigned __int8 *)*((_QWORD *)v2 + 16);
    --*((_QWORD *)v2 + 17);
    v20 = *(_QWORD *)v5;
    v21 = v5;
    if (!*(_QWORD *)v5)
      goto LABEL_33;
  }
  v22 = (unsigned __int8 *)*((_QWORD *)v5 + 1);
  if (!v22)
  {
    v21 = v5;
    goto LABEL_39;
  }
  do
  {
    v21 = v22;
    v22 = *(unsigned __int8 **)v22;
  }
  while (v22);
LABEL_33:
  v20 = *((_QWORD *)v21 + 1);
  if (!v20)
  {
    v23 = 1;
    v24 = (void ***)*((_QWORD *)v21 + 2);
    v25 = *v24;
    if (*v24 == (void **)v21)
      goto LABEL_35;
LABEL_40:
    v24[1] = (void **)v20;
    v26 = v21[24];
    if (v21 == v5)
      goto LABEL_45;
    goto LABEL_41;
  }
LABEL_39:
  v23 = 0;
  *(_QWORD *)(v20 + 16) = *((_QWORD *)v21 + 2);
  v24 = (void ***)*((_QWORD *)v21 + 2);
  v25 = *v24;
  if (*v24 != (void **)v21)
    goto LABEL_40;
LABEL_35:
  *v24 = (void **)v20;
  if (v21 != v19)
  {
    v25 = v24[1];
    v26 = v21[24];
    if (v21 == v5)
      goto LABEL_45;
LABEL_41:
    v27 = *((_QWORD *)v5 + 2);
    *((_QWORD *)v21 + 2) = v27;
    *(_QWORD *)(v27 + 8 * (**((_QWORD **)v5 + 2) != (_QWORD)v5)) = v21;
    v28 = *(_QWORD *)v5;
    *(_QWORD *)v21 = *(_QWORD *)v5;
    *(_QWORD *)(v28 + 16) = v21;
    v29 = *((_QWORD *)v5 + 1);
    *((_QWORD *)v21 + 1) = v29;
    if (v29)
      *(_QWORD *)(v29 + 16) = v21;
    v21[24] = v5[24];
    if (v19 == v5)
      v19 = v21;
    goto LABEL_45;
  }
  v25 = 0;
  v19 = (unsigned __int8 *)v20;
  v26 = v21[24];
  if (v21 != v5)
    goto LABEL_41;
LABEL_45:
  if (!v26 || !v19)
    goto LABEL_117;
  if (!v23)
  {
    *(_BYTE *)(v20 + 24) = 1;
    goto LABEL_117;
  }
  while (1)
  {
    v32 = (void ***)v25[2];
    if (*v32 != v25)
      break;
    if (*((_BYTE *)v25 + 24))
    {
      v34 = *v25;
      if (*v25)
        goto LABEL_77;
    }
    else
    {
      *((_BYTE *)v25 + 24) = 1;
      *((_BYTE *)v32 + 24) = 0;
      v38 = (void **)v25[1];
      *v32 = v38;
      if (v38)
        v38[2] = v32;
      v25[2] = v32[2];
      v32[2][*v32[2] != v32] = v25;
      v25[1] = v32;
      v32[2] = v25;
      if (v19 == (unsigned __int8 *)v32)
        v19 = (unsigned __int8 *)v25;
      v25 = *v32;
      v34 = **v32;
      if (v34)
      {
LABEL_77:
        if (!v34[24])
          goto LABEL_112;
      }
    }
    v39 = (uint64_t *)v25[1];
    if (v39 && !*((_BYTE *)v39 + 24))
    {
      if (v34 && !v34[24])
      {
LABEL_112:
        v39 = (uint64_t *)v25;
      }
      else
      {
        *((_BYTE *)v39 + 24) = 1;
        *((_BYTE *)v25 + 24) = 0;
        v40 = *v39;
        v25[1] = (void *)*v39;
        if (v40)
          *(_QWORD *)(v40 + 16) = v25;
        v39[2] = (uint64_t)v25[2];
        *((_QWORD *)v25[2] + (*(_QWORD *)v25[2] != (_QWORD)v25)) = v39;
        *v39 = (uint64_t)v25;
        v25[2] = v39;
        v34 = v25;
      }
      v48 = v39[2];
      *((_BYTE *)v39 + 24) = *(_BYTE *)(v48 + 24);
      *(_BYTE *)(v48 + 24) = 1;
      v34[24] = 1;
      v49 = *(uint64_t **)v48;
      v51 = *(_QWORD *)(*(_QWORD *)v48 + 8);
      *(_QWORD *)v48 = v51;
      if (v51)
        *(_QWORD *)(v51 + 16) = v48;
      v49[2] = *(_QWORD *)(v48 + 16);
      *(_QWORD *)(*(_QWORD *)(v48 + 16) + 8 * (**(_QWORD **)(v48 + 16) != v48)) = v49;
      v49[1] = v48;
      goto LABEL_116;
    }
    *((_BYTE *)v25 + 24) = 0;
    v30 = (unsigned __int8 *)v25[2];
    if (v30[24])
      v31 = v30 == v19;
    else
      v31 = 1;
    if (v31)
      goto LABEL_102;
LABEL_53:
    v25 = *(void ***)(*((_QWORD *)v30 + 2) + 8 * (**((_QWORD **)v30 + 2) == (_QWORD)v30));
  }
  if (*((_BYTE *)v25 + 24))
  {
    v33 = *v25;
    if (!*v25)
    {
LABEL_67:
      v37 = (void **)v25[1];
      if (v37 && !*((_BYTE *)v37 + 24))
        goto LABEL_108;
      *((_BYTE *)v25 + 24) = 0;
      v30 = (unsigned __int8 *)v25[2];
      if (v30 == v19)
      {
        v30 = v19;
LABEL_102:
        v30[24] = 1;
        goto LABEL_117;
      }
      if (!v30[24])
        goto LABEL_102;
      goto LABEL_53;
    }
  }
  else
  {
    *((_BYTE *)v25 + 24) = 1;
    *((_BYTE *)v32 + 24) = 0;
    v35 = (void ****)v32[1];
    v36 = (void **)*v35;
    v32[1] = (void **)*v35;
    if (v36)
      v36[2] = v32;
    v35[2] = (void ***)v32[2];
    v32[2][*v32[2] != v32] = v35;
    *v35 = v32;
    v32[2] = (void **)v35;
    if (v19 == *v25)
      v19 = (unsigned __int8 *)v25;
    v25 = (void **)*((_QWORD *)*v25 + 1);
    v33 = *v25;
    if (!*v25)
      goto LABEL_67;
  }
  if (*((_BYTE *)v33 + 24))
    goto LABEL_67;
  v37 = (void **)v25[1];
  if (v37 && !*((_BYTE *)v37 + 24))
  {
LABEL_108:
    v33 = v25;
  }
  else
  {
    *((_BYTE *)v33 + 24) = 1;
    *((_BYTE *)v25 + 24) = 0;
    v47 = (_QWORD *)v33[1];
    *v25 = v47;
    if (v47)
      v47[2] = v25;
    v33[2] = v25[2];
    *((_QWORD *)v25[2] + (*(_QWORD *)v25[2] != (_QWORD)v25)) = v33;
    v33[1] = v25;
    v25[2] = v33;
    v37 = v25;
  }
  v48 = v33[2];
  *((_BYTE *)v33 + 24) = *(_BYTE *)(v48 + 24);
  *(_BYTE *)(v48 + 24) = 1;
  *((_BYTE *)v37 + 24) = 1;
  v49 = *(uint64_t **)(v48 + 8);
  v50 = *v49;
  *(_QWORD *)(v48 + 8) = *v49;
  if (v50)
    *(_QWORD *)(v50 + 16) = v48;
  v49[2] = *(_QWORD *)(v48 + 16);
  *(_QWORD *)(*(_QWORD *)(v48 + 16) + 8 * (**(_QWORD **)(v48 + 16) != v48)) = v49;
  *v49 = v48;
LABEL_116:
  *(_QWORD *)(v48 + 16) = v49;
LABEL_117:
  v52 = (std::__shared_weak_count *)*((_QWORD *)v5 + 6);
  if (v52)
  {
    v53 = (unint64_t *)&v52->__shared_owners_;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  operator delete(v5);
}

void sub_2127D468C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v19;

  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void dispatch::async<void ctu::SharedSynchronizable<awd::AwdCommandDriver>::execute_wrapped<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>(awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0,dispatch_queue_s *::default_delete<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>>)::{lambda(void *)#1}::__invoke(char **__p)
{
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  dispatch_queue_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  char v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[5];
  char v21;

  v2 = *__p;
  v3 = *((_QWORD *)*__p + 1);
  v4 = *(_QWORD **)(v3 + 120);
  v5 = (_QWORD *)(v3 + 128);
  if (v4 == (_QWORD *)(v3 + 128))
  {
LABEL_21:
    operator delete(v2);
    goto LABEL_22;
  }
  v6 = MEMORY[0x24BDAC760];
  do
  {
    v7 = (dispatch_queue_t *)v4[5];
    v8 = (std::__shared_weak_count *)v4[6];
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    if (v7)
    {
      v11 = *v2;
      v20[0] = v6;
      v20[1] = 0x40000000;
      v20[2] = ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke;
      v20[3] = &__block_descriptor_tmp_35;
      v20[4] = v7;
      v21 = v11;
      dispatch_async(*v7, v20);
    }
    if (!v8)
      goto LABEL_13;
    v12 = (unint64_t *)&v8->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
      v14 = (_QWORD *)v4[1];
      if (v14)
      {
        do
        {
LABEL_14:
          v15 = v14;
          v14 = (_QWORD *)*v14;
        }
        while (v14);
        goto LABEL_3;
      }
    }
    else
    {
LABEL_13:
      v14 = (_QWORD *)v4[1];
      if (v14)
        goto LABEL_14;
    }
    do
    {
      v15 = (_QWORD *)v4[2];
      v16 = *v15 == (_QWORD)v4;
      v4 = v15;
    }
    while (!v16);
LABEL_3:
    v4 = v15;
  }
  while (v15 != v5);
  if (v2)
    goto LABEL_21;
LABEL_22:
  v17 = (std::__shared_weak_count *)__p[2];
  if (v17)
  {
    v18 = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  operator delete(__p);
}

_QWORD *cpms::CommandDriver::CommandDriver(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  *a1 = &unk_24CE235C0;
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v5 = dispatch_queue_create("cpms.drv", v4);
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = v5;
  if (v5)
  {
    v6 = v5;
    dispatch_retain(v5);
    a1[4] = 0;
    dispatch_release(v6);
  }
  else
  {
    a1[4] = 0;
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 5), "com.apple.telephony.abm", "cpms.drv");
  *a1 = &unk_24CE235C0;
  v7 = a2[1];
  a1[6] = *a2;
  a1[7] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  return a1;
}

void sub_2127D4980(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  NSObject *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;

  v3 = v1[4];
  if (v3)
  {
    dispatch_release(v3);
    v4 = v1[3];
    if (!v4)
    {
LABEL_3:
      v5 = (std::__shared_weak_count *)v1[2];
      if (!v5)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else
  {
    v4 = v1[3];
    if (!v4)
      goto LABEL_3;
  }
  dispatch_release(v4);
  v5 = (std::__shared_weak_count *)v1[2];
  if (!v5)
LABEL_4:
    _Unwind_Resume(exception_object);
LABEL_7:
  std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(exception_object);
}

const char *cpms::CommandDriver::getName(cpms::CommandDriver *this)
{
  return "cpms.drv";
}

uint64_t coex::util::data_to_uint64(CFDataRef *a1)
{
  const __CFData *v2;
  uint64_t (*v3)(uint64_t);
  UInt8 buffer[8];
  CFRange v6;

  *(_QWORD *)buffer = 0;
  v2 = *a1;
  v3 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  if (!v2)
    v3 = 0;
  if (!v3)
    return 0;
  v6.length = CFDataGetLength(v2);
  v6.location = 0;
  CFDataGetBytes(*a1, v6, buffer);
  return *(_QWORD *)buffer;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

CFDataRef coex::util::uint64_to_data@<X0>(coex::util *this@<X0>, CFDataRef *a2@<X8>)
{
  CFDataRef result;
  UInt8 bytes[8];

  *(_QWORD *)bytes = this;
  *a2 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
  result = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 8);
  *a2 = result;
  return result;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1180";
}

uint64_t radio::DebugCommandDriver::DebugCommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::string *v14;
  __int128 v15;
  const char *v16;
  size_t v17;
  std::string *v18;
  __int128 v19;
  std::string v21;
  std::string v22;
  _BYTE v23[16];

  *(_QWORD *)a1 = off_24CE236B8;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v23, "com.apple.telephony.abm", "debug.drv");
  v6 = dispatch_queue_create("debug.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE237B0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v22);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v21);
  *(_QWORD *)a1 = off_24CE237F0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v23);
  *(_QWORD *)a1 = off_24CE236B8;
  *(_QWORD *)(a1 + 104) = *a3;
  v11 = a3[1];
  *(_QWORD *)(a1 + 112) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *((_BYTE *)&v21.__r_.__value_.__s + 23) = 9;
  strcpy((char *)&v21, "debug.drv");
  v14 = std::string::append(&v21, ".", 1uLL);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v22.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = getprogname();
  v17 = strlen(v16);
  v18 = std::string::append(&v22, v16, v17);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 136) = *((_QWORD *)&v18->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 120) = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_14:
    operator delete(v21.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_14;
  return a1;
}

void sub_2127D4CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  _QWORD *v23;
  uint64_t v24;

  if ((a15 & 0x80000000) == 0)
  {
    std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
    ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE237B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE237B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t radio::DebugCommandDriver::getName(radio::DebugCommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE237B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE237B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE237B0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void CommandDriverFactory::createNullFactory(_QWORD *a1@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  NSObject *v5;
  uint8_t v6[8];
  NSObject *v7;

  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  v3 = operator new(0x58uLL);
  *v3 = &off_24CE23830;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v3 + 1);
  v3[3] = 850045863;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[10] = 0;
  *a1 = v3;
  v4 = operator new(0x20uLL);
  *v4 = off_24CE23950;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = v3;
  a1[1] = v4;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v6, "com.apple.telephony.abm", "driver.factory");
  v5 = v7;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2127C9000, v5, OS_LOG_TYPE_DEFAULT, "'NullFactory' instantiated!", v6, 2u);
  }
}

void sub_2127D5090(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2127D50A4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::mutex *v2;
  uint64_t v3;
  std::mutex *v4;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v4 = v2;
  *v1 = v3;
  std::mutex::~mutex(v4);
  v6 = (std::__shared_weak_count *)v1[2];
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void CommandDriverFactory::CommandDriverFactory(CommandDriverFactory *this)
{
  *(_QWORD *)this = &off_24CE23830;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((_QWORD *)this + 1);
  *((_QWORD *)this + 3) = 850045863;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_QWORD *)this + 10) = 0;
}

{
  *(_QWORD *)this = &off_24CE23830;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((_QWORD *)this + 1);
  *((_QWORD *)this + 3) = 850045863;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_QWORD *)this + 10) = 0;
}

void CommandDriverFactory::create_default_global(CommandDriverFactory *this@<X0>, _QWORD *a2@<X8>)
{
  int v3;
  void (*v4)(uint8_t *__return_ptr);
  void (*v5)(uint8_t *__return_ptr);
  NSObject *v6;
  const char *v7;
  int v8;
  void (*v9)(uint8_t *__return_ptr);
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  NSObject *v20;
  uint8_t v21[8];
  NSObject *v22;
  uint8_t buf[16];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (qword_253DA6938 == -1)
  {
    if (_MergedGlobals)
      goto LABEL_3;
LABEL_33:
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    v20 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2127C9000, v20, OS_LOG_TYPE_DEFAULT, "No CommandDriver dylib was loaded!", buf, 2u);
    }
    goto LABEL_35;
  }
  dispatch_once(&qword_253DA6938, &__block_literal_global);
  if (!_MergedGlobals)
    goto LABEL_33;
LABEL_3:
  v3 = capabilities::radio::vendor(this);
  if ((v3 - 2) < 2)
  {
    v4 = (void (*)(uint8_t *__return_ptr))dlsym((void *)_MergedGlobals, "_ZN23ARICommandDriverFactory21create_default_globalEv");
    if (v4)
    {
      v5 = v4;
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
      v6 = *(NSObject **)&buf[8];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v7 = "Succeeded to load ARICommandDriverFactory!";
      goto LABEL_31;
    }
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    v15 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Failed to load ARICommandDriverFactory!";
LABEL_27:
      v13 = v15;
      v14 = 2;
      goto LABEL_28;
    }
    goto LABEL_35;
  }
  v8 = v3;
  if (v3 != 1)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    v11 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      v12 = "Detected unknown or not supported radio vendor: %d";
      v13 = v11;
      v14 = 8;
LABEL_28:
      _os_log_impl(&dword_2127C9000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  v9 = (void (*)(uint8_t *__return_ptr))dlsym((void *)_MergedGlobals, "_ZN23QMICommandDriverFactory21create_default_globalEv");
  if (!v9)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    v15 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Failed to load QMICommandDriverFactory!";
      goto LABEL_27;
    }
LABEL_35:
    CommandDriverFactory::createNullFactory(a2);
    return;
  }
  v5 = v9;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
  v6 = *(NSObject **)&buf[8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    goto LABEL_10;
  *(_WORD *)buf = 0;
  v7 = "Succeeded to load QMICommandDriverFactory!";
LABEL_31:
  _os_log_debug_impl(&dword_2127C9000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
LABEL_10:
  memset(buf, 170, sizeof(buf));
  v5(buf);
  if (*(_QWORD *)buf)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v21, "com.apple.telephony.abm", "driver.factory");
    v10 = v22;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2127C9000, v10, OS_LOG_TYPE_DEFAULT, "fully instantiated!", v21, 2u);
    }
    (*(void (**)(_QWORD))(**(_QWORD **)buf + 160))(*(_QWORD *)buf);
    *(_OWORD *)a2 = *(_OWORD *)buf;
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v21, "com.apple.telephony.abm", "driver.factory");
    v16 = v22;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2127C9000, v16, OS_LOG_TYPE_DEFAULT, "loaded but returned null!", v21, 2u);
    }
    CommandDriverFactory::createNullFactory(a2);
    v17 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
}

void sub_2127D559C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2127D55B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2127D55C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const char *CommandDriverFactory::getName(CommandDriverFactory *this)
{
  return "driver.factory";
}

void CommandDriverFactory::createRadioCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakRadioCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::getRadioWorkloop(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void CommandDriverFactory::createRFSCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakRFSCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCoexCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createAntennaCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createAwdCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createHealthCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createLogCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDataCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakDataCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCPMSCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCoreDumpCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDebugCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDiagCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createTraceCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDesenseCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCellularCertCommandDriver(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::setRegistry(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v3 = *a2;
  v2 = a2[1];
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = *(std::__shared_weak_count **)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v2;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

uint64_t ___ZN12_GLOBAL__N_113sLoadTheDylibEv_block_invoke(capabilities::radio *a1)
{
  uint64_t result;

  result = capabilities::radio::vendor(a1);
  if ((result - 1) <= 2)
  {
    result = (uint64_t)dlopen(off_24CE239E0[(int)result - 1], 1);
    _MergedGlobals = result;
  }
  return result;
}

void std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::__on_zero_shared(uint64_t a1)
{
  char *v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = *(char **)(a1 + 24);
  if (v1)
  {
    *(_QWORD *)v1 = &off_24CE23830;
    std::mutex::~mutex((std::mutex *)(v1 + 24));
    v2 = (std::__shared_weak_count *)*((_QWORD *)v1 + 2);
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      operator delete(v1);
    }
    else
    {
LABEL_6:
      operator delete(v1);
    }
  }
}

uint64_t std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000002127E53DALL)
    return a1 + 24;
  if (((v3 & 0x80000002127E53DALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002127E53DALL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002127E53DALL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  uint64_t v4;
  std::__shared_weak_count *shared_owners;
  unint64_t v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;

  v2 = (std::__shared_weak_count *)operator new(0x38uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)off_24CE239A0;
  Registry::Registry((Registry *)&v2[1]);
  *a1 = v4;
  a1[1] = v2;
  shared_owners = (std::__shared_weak_count *)v2[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1)
      return;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
    v2[1].__vftable = (std::__shared_weak_count_vtbl *)&v2[1];
    v2[1].__shared_owners_ = (uint64_t)v2;
    std::__shared_weak_count::__release_weak(shared_owners);
  }
  else
  {
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    v2[1].__vftable = (std::__shared_weak_count_vtbl *)&v2[1];
    v2[1].__shared_owners_ = (uint64_t)v2;
  }
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

void sub_2127D59A4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Registry>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24CE239A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Registry>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24CE239A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<Registry>::__on_zero_shared(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (v4)
  {
LABEL_5:
    v5 = *(std::__shared_weak_count **)(a1 + 32);
    if (!v5)
      return;
    goto LABEL_6;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  v5 = *(std::__shared_weak_count **)(a1 + 32);
  if (v5)
LABEL_6:
    std::__shared_weak_count::__release_weak(v5);
}

void CreateError(uint64_t a1@<X0>, CFIndex a2@<X1>, CFErrorRef *a3@<X8>)
{
  const __CFAllocator *v5;
  const void *v6;
  std::string __p;
  const void *v8;
  uint64_t v9;
  const void *v10;
  std::string v11;
  std::string v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v11, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v11 = __p;
  v9 = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v12, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    v12 = v11;
  v10 = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (ctu::cf::convert_copy())
    v6 = v10;
  else
    v6 = 0;
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    v8 = v6;
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_15;
LABEL_20:
    operator delete(v11.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_21;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  v8 = v6;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_20;
LABEL_15:
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_16;
LABEL_21:
  operator delete(__p.__r_.__value_.__l.__data_);
LABEL_16:
  v12.__r_.__value_.__r.__words[0] = *MEMORY[0x24BDBD378];
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  *a3 = (CFErrorRef)0xAAAAAAAAAAAAAAAALL;
  *a3 = CFErrorCreateWithUserInfoKeysAndValues(v5, (CFErrorDomain)*MEMORY[0x24BDBD390], a2, (const void *const *)&v12.__r_.__value_.__l.__data_, (const void *const *)&v11.__r_.__value_.__l.__data_, 1);
  if (v6)
    CFRelease(v6);
}

void sub_2127D5C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, const void *a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(&a17);
  if (a24 < 0)
  {
    operator delete(a19);
    if (a14 < 0)
    {
LABEL_3:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_3;
  }
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
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

uint64_t logs::collectionStateAsString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch((int)result)
  {
    case 0:
      a2[23] = 7;
      strcpy(a2, "Started");
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "Stopped");
      break;
    case 2:
      a2[23] = 16;
      strcpy(a2, "EnteringLowPower");
      break;
    case 3:
      a2[23] = 15;
      strcpy(a2, "ExitingLowPower");
      break;
    case 4:
      a2[23] = 5;
      strcpy(a2, "Error");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

const char *desense::asString(unsigned int a1)
{
  if (a1 > 2)
    return "???";
  else
    return off_24CE23EB0[a1];
}

uint64_t desense::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  std::string::size_type v17;
  std::string *size;
  uint64_t v19;
  pthread_mutex_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  std::string::size_type v28;
  std::string *v29;
  uint64_t v30;
  pthread_mutex_t *v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  std::string *v36;
  __int128 v37;
  const char *v38;
  size_t v39;
  std::string *v40;
  __int128 v41;
  std::string *v43;
  unsigned int *data;
  unsigned int *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  std::string *v51;
  unsigned int *v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int v58;
  std::string v59;
  _BYTE v60[16];
  std::string v61;
  _QWORD **v62;
  _QWORD *v63;
  uint64_t v64;

  *(_QWORD *)a1 = off_24CE23A38;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v60, "com.apple.telephony.abm", "desense.drv");
  v6 = dispatch_queue_create("desense.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE23B20;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v61);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v59);
  *(_QWORD *)a1 = off_24CE23C40;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v60);
  *(_QWORD *)a1 = off_24CE23A38;
  *(_QWORD *)(a1 + 104) = &off_24CE23B60;
  v11 = (uint64_t *)operator new(0x28uLL);
  v12 = operator new(0x20uLL);
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v61;
  *(_OWORD *)&v61.__r_.__value_.__r.__words[1] = (unint64_t)&v61;
  v63 = 0;
  v64 = 0;
  v62 = &v63;
  v13 = operator new(0x40uLL);
  *v13 = v13;
  v13[1] = v13;
  v13[5] = 0;
  v13[4] = 0;
  v13[2] = 0;
  v13[3] = v13 + 4;
  *(_QWORD *)v12 = v13;
  *((_QWORD *)v12 + 1) = 0;
  v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  *v14 = off_24CE23C80;
  v14[2] = v13;
  *((_QWORD *)v12 + 1) = v14;
  v15 = operator new(1uLL);
  *((_QWORD *)v12 + 2) = v15;
  *((_QWORD *)v12 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v12 + 16, (uint64_t)v15, (unsigned int **)v12 + 3);
  *v11 = (uint64_t)v12;
  v11[1] = 0;
  v16 = operator new(0x18uLL);
  v16[1] = 0x100000001;
  *v16 = off_24CE23CE0;
  v16[2] = v12;
  v11[1] = (uint64_t)v16;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v63);
  if (v61.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v61.__r_.__value_.__l.__size_;
    v17 = v61.__r_.__value_.__r.__words[0];
    v19 = *(_QWORD *)v61.__r_.__value_.__l.__size_;
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(v61.__r_.__value_.__r.__words[0] + 8);
    **(_QWORD **)(v17 + 8) = v19;
    v61.__r_.__value_.__r.__words[2] = 0;
    if (size != &v61)
    {
      do
      {
        v43 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (unsigned int *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          v45 = data + 2;
          do
          {
            v46 = __ldaxr(v45);
            v47 = v46 - 1;
          }
          while (__stlxr(v47, v45));
          if (!v47)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)data + 16))(data);
            v48 = data + 3;
            do
            {
              v49 = __ldaxr(v48);
              v50 = v49 - 1;
            }
            while (__stlxr(v50, v48));
            if (!v50)
              (*(void (**)(unsigned int *))(*(_QWORD *)data + 24))(data);
          }
        }
        operator delete(size);
        size = v43;
      }
      while (v43 != &v61);
    }
  }
  v11[2] = *(_QWORD *)*v11;
  v20 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v20, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v11 + 3, (uint64_t)v20);
  *(_QWORD *)(a1 + 112) = v11;
  *(_QWORD *)(a1 + 120) = 0;
  v21 = operator new(0x18uLL);
  v21[1] = 0x100000001;
  *v21 = off_24CE23D40;
  v21[2] = v11;
  *(_QWORD *)(a1 + 128) = &off_24CE23BD0;
  *(_QWORD *)(a1 + 120) = v21;
  v22 = (uint64_t *)operator new(0x28uLL);
  v23 = operator new(0x20uLL);
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v61;
  *(_OWORD *)&v61.__r_.__value_.__r.__words[1] = (unint64_t)&v61;
  v63 = 0;
  v64 = 0;
  v62 = &v63;
  v24 = operator new(0x40uLL);
  *v24 = v24;
  v24[1] = v24;
  v24[5] = 0;
  v24[4] = 0;
  v24[2] = 0;
  v24[3] = v24 + 4;
  *(_QWORD *)v23 = v24;
  *((_QWORD *)v23 + 1) = 0;
  v25 = operator new(0x18uLL);
  v25[1] = 0x100000001;
  *v25 = off_24CE23DA0;
  v25[2] = v24;
  *((_QWORD *)v23 + 1) = v25;
  v26 = operator new(1uLL);
  *((_QWORD *)v23 + 2) = v26;
  *((_QWORD *)v23 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v23 + 16, (uint64_t)v26, (unsigned int **)v23 + 3);
  *v22 = (uint64_t)v23;
  v22[1] = 0;
  v27 = operator new(0x18uLL);
  v27[1] = 0x100000001;
  *v27 = off_24CE23E00;
  v27[2] = v23;
  v22[1] = (uint64_t)v27;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v63);
  if (v61.__r_.__value_.__r.__words[2])
  {
    v29 = (std::string *)v61.__r_.__value_.__l.__size_;
    v28 = v61.__r_.__value_.__r.__words[0];
    v30 = *(_QWORD *)v61.__r_.__value_.__l.__size_;
    *(_QWORD *)(v30 + 8) = *(_QWORD *)(v61.__r_.__value_.__r.__words[0] + 8);
    **(_QWORD **)(v28 + 8) = v30;
    v61.__r_.__value_.__r.__words[2] = 0;
    if (v29 != &v61)
    {
      do
      {
        v51 = (std::string *)v29->__r_.__value_.__l.__size_;
        v52 = (unsigned int *)v29[1].__r_.__value_.__l.__data_;
        if (v52)
        {
          v53 = v52 + 2;
          do
          {
            v54 = __ldaxr(v53);
            v55 = v54 - 1;
          }
          while (__stlxr(v55, v53));
          if (!v55)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 16))(v52);
            v56 = v52 + 3;
            do
            {
              v57 = __ldaxr(v56);
              v58 = v57 - 1;
            }
            while (__stlxr(v58, v56));
            if (!v58)
              (*(void (**)(unsigned int *))(*(_QWORD *)v52 + 24))(v52);
          }
        }
        operator delete(v29);
        v29 = v51;
      }
      while (v51 != &v61);
    }
  }
  v22[2] = *(_QWORD *)*v22;
  v31 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v31, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v22 + 3, (uint64_t)v31);
  *(_QWORD *)(a1 + 136) = v22;
  *(_QWORD *)(a1 + 144) = 0;
  v32 = operator new(0x18uLL);
  v32[1] = 0x100000001;
  *v32 = off_24CE23E60;
  v32[2] = v22;
  *(_QWORD *)(a1 + 152) = *a3;
  *(_QWORD *)(a1 + 144) = v32;
  v33 = a3[1];
  *(_QWORD *)(a1 + 160) = v33;
  if (v33)
  {
    v34 = (unint64_t *)(v33 + 8);
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  *((_BYTE *)&v59.__r_.__value_.__s + 23) = 11;
  strcpy((char *)&v59, "desense.drv");
  v36 = std::string::append(&v59, ".", 1uLL);
  v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  v61.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  v38 = getprogname();
  v39 = strlen(v38);
  v40 = std::string::append(&v61, v38, v39);
  v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 184) = *((_QWORD *)&v40->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 168) = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v61.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_36:
    operator delete(v59.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_36;
  return a1;
}

void sub_2127D6460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v25);
  boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(v26);
  boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(v24);
  ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

_QWORD *boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE23BD0;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE23B60;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE23B20;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE23B20;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t desense::CommandDriver::getName(desense::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 168;
  if (*((char *)this + 191) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 168);
  if (*(char *)(a1 + 191) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE23B20;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE23B20;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE23B60;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE23BD0;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE23B20;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

const char *radio::asString(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 7)
    return "Unknown";
  else
    return off_24CE241B8[v1];
}

{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "FactoryCalibrationStatus::kUnknown";
  else
    return off_24CE242B0[v1];
}

{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "RFCalibrationStatus::kUnknown";
  else
    return off_24CE242E0[v1];
}

void radio::OpMode::~OpMode(radio::OpMode *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 2) = v2;
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
    v2 = (void *)*((_QWORD *)this + 1);
  }
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 2) = v2;
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
    v2 = (void *)*((_QWORD *)this + 1);
  }
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void radio::OpMode::create(_QWORD *a1@<X8>)
{
  char *v3;

  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  v3 = (char *)operator new(0x50uLL);
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = off_24CE24178;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *((_QWORD *)v3 + 9) = 0;
  a1[1] = v3;
  *(_OWORD *)(v3 + 24) = 0u;
  v3 += 24;
  *a1 = v3;
  radio::OpMode::init((radio::OpMode *)v3);
}

void sub_2127D7D6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void radio::OpMode::init(radio::OpMode *this)
{
  int RadioVendor;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _WORD *v7;
  _WORD *v8;

  *(_BYTE *)this = 8;
  *((_WORD *)this + 1) = 0;
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    v7 = operator new(7uLL);
    *(_DWORD *)v7 = 262657;
    v7[2] = 1536;
    *((_BYTE *)v7 + 6) = 7;
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    *((_QWORD *)this + 2) = (char *)v7 + 7;
    *((_QWORD *)this + 3) = (char *)v7 + 7;
    if (!v5)
      return;
    goto LABEL_9;
  }
  if (RadioVendor == 4)
  {
    v8 = operator new(2uLL);
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8;
    *v8++ = 1;
    *((_QWORD *)this + 2) = v8;
    *((_QWORD *)this + 3) = v8;
    if (!v5)
      return;
LABEL_9:
    operator delete(v5);
    return;
  }
  if (RadioVendor == 1)
  {
    v3 = operator new(8uLL);
    *v3 = 0xB09050403020100;
    v4 = operator new(8uLL);
    *v4 = 0x3000200010000;
    v5 = (void *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v3;
    *((_QWORD *)this + 2) = v3 + 1;
    v6 = (void *)*((_QWORD *)this + 4);
    *((_QWORD *)this + 3) = v3 + 1;
    *((_QWORD *)this + 4) = v4;
    *((_QWORD *)this + 5) = v4 + 1;
    *((_QWORD *)this + 6) = v4 + 1;
    if (v6)
      operator delete(v6);
    if (v5)
      goto LABEL_9;
  }
}

void sub_2127D7EA4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_BYTE *radio::OpMode::setMode(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t radio::OpMode::setMode(uint64_t this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(this + 8);
  v3 = *(_QWORD *)(this + 16);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3)
        goto LABEL_5;
    }
  }
  *(_BYTE *)this = v4;
  return this;
}

uint64_t radio::OpMode::convertMode(radio::OpMode *this, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3)
        goto LABEL_5;
    }
  }
  return v4;
}

uint64_t radio::OpMode::getMode(radio::OpMode *this)
{
  return *(unsigned __int8 *)this;
}

uint64_t radio::OpMode::getModeValue(radio::OpMode *this)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)this;
  v2 = *((_QWORD *)this + 1);
  if (*((_QWORD *)this + 2) - v2 <= v1)
    return 255;
  else
    return *(unsigned __int8 *)(v2 + v1);
}

uint64_t radio::OpMode::convertMode(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(a1 + 16) - v2 <= (unint64_t)a2)
    return 255;
  else
    return *(unsigned __int8 *)(v2 + a2);
}

uint64_t radio::OpMode::setConfig(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 2) = a2;
  return result;
}

uint64_t radio::OpMode::setConfig(uint64_t this, int a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  __int16 v4;

  v2 = *(unsigned __int16 **)(this + 32);
  v3 = *(unsigned __int16 **)(this + 40);
  if (v2 == v3)
  {
LABEL_5:
    v4 = 0;
  }
  else
  {
    v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3)
        goto LABEL_5;
    }
  }
  *(_WORD *)(this + 2) = v4;
  return this;
}

uint64_t radio::OpMode::convertConfig(radio::OpMode *this, int a2)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  unsigned __int16 v4;

  v2 = (unsigned __int16 *)*((_QWORD *)this + 4);
  v3 = (unsigned __int16 *)*((_QWORD *)this + 5);
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3)
        return 0;
    }
  }
  return v4;
}

uint64_t radio::OpMode::getConfig(radio::OpMode *this)
{
  return *((unsigned __int16 *)this + 1);
}

uint64_t radio::OpMode::getConfigValue(radio::OpMode *this)
{
  unint64_t v1;
  uint64_t v2;

  v1 = *((unsigned __int8 *)this + 2);
  v2 = *((_QWORD *)this + 4);
  if (v1 >= (*((_QWORD *)this + 5) - v2) >> 1)
    return 0xFFFFLL;
  else
    return *(unsigned __int16 *)(v2 + 2 * v1);
}

uint64_t radio::OpMode::convertConfig(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 40) - v2) >> 1))
    return 0xFFFFLL;
  else
    return *(unsigned __int16 *)(v2 + 2 * a2);
}

BOOL radio::OpMode::allowModeChange(radio::OpMode *this)
{
  unsigned int v1;
  int v3;

  v1 = *((unsigned __int16 *)this + 1);
  if (v1 < 2)
    return 1;
  if (v1 == 3)
  {
    v3 = *(unsigned __int8 *)this;
    if ((v3 & 0xFE) == 4)
      return 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)this;
  }
  return v3 != 2;
}

uint64_t radio::OpMode::getModeString@<X0>(radio::OpMode *this@<X0>, _BYTE *a2@<X8>)
{
  return radio::OpMode::modeToString((uint64_t)this, *(unsigned __int8 *)this, a2);
}

uint64_t radio::OpMode::modeToString@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, _BYTE *a3@<X8>)
{
  __int128 v6;
  const char *v7;
  size_t v8;
  int RadioVendor;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  char v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  size_t v22;
  _BYTE *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *__src[2];
  void *__p[2];
  __int128 v36;
  __int128 v37;
  _OWORD v38[9];
  unint64_t v39;

  v39 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[7] = v6;
  v38[8] = v6;
  v38[5] = v6;
  v38[6] = v6;
  v38[3] = v6;
  v38[4] = v6;
  v38[1] = v6;
  v38[2] = v6;
  v37 = v6;
  v38[0] = v6;
  *(_OWORD *)__p = v6;
  v36 = v6;
  v33 = v6;
  *(_OWORD *)__src = v6;
  v31 = v6;
  v32 = v6;
  v30 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v30);
  if (a2 > 7)
    v7 = "Unknown";
  else
    v7 = off_24CE241B8[(char)a2];
  v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)v7, v8);
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v16 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16) - v16 <= (unint64_t)a2 || (v17 = *(char *)(v16 + a2), v17 > 7))
      v13 = "Unknown";
    else
      v13 = off_24CE24258[v17];
  }
  else if (RadioVendor == 1)
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v18 = *(_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16) - v18 <= (unint64_t)a2 || (v19 = *(char *)(v18 + a2), v19 > 0xB))
      v13 = "Unknown";
    else
      v13 = off_24CE241F8[v19];
  }
  else
  {
    if (RadioVendor != 4)
      goto LABEL_23;
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    v11 = *(_QWORD *)(a1 + 8);
    v12 = a2;
    v13 = "Unknown";
    if (*(_QWORD *)(a1 + 16) - v11 > v12)
    {
      v14 = *(_BYTE *)(v11 + v12);
      v15 = "Online";
      if (v14 != 1)
        v15 = "Unknown";
      if (v14)
        v13 = v15;
      else
        v13 = "Airplane";
    }
  }
  v20 = strlen(v13);
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)v13, v20);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)" ]", 2);
LABEL_23:
  if ((BYTE8(v37) & 0x10) != 0)
  {
    v23 = (_BYTE *)v37;
    if ((void *)v37 < __src[1])
    {
      *(void **)&v37 = __src[1];
      v23 = __src[1];
    }
    v24 = __src[0];
    v22 = v23 - (char *)__src[0];
    if ((unint64_t)(v23 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_40;
  }
  else
  {
    if ((BYTE8(v37) & 8) == 0)
    {
      v22 = 0;
      a3[23] = 0;
      goto LABEL_36;
    }
    v24 = (const void *)*((_QWORD *)&v32 + 1);
    v22 = *((_QWORD *)&v33 + 1) - *((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v33 + 1) - *((_QWORD *)&v32 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_40:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v22 >= 0x17)
  {
    v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17)
      v25 = v22 | 7;
    v26 = v25 + 1;
    v27 = operator new(v25 + 1);
    *((_QWORD *)a3 + 1) = v22;
    *((_QWORD *)a3 + 2) = v26 | 0x8000000000000000;
    *(_QWORD *)a3 = v27;
    a3 = v27;
    goto LABEL_35;
  }
  a3[23] = v22;
  if (v22)
LABEL_35:
    memmove(a3, v24, v22);
LABEL_36:
  a3[v22] = 0;
  *(_QWORD *)&v30 = *MEMORY[0x24BEDB7F0];
  v28 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v30 + *(_QWORD *)(v30 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v31 = v28;
  *((_QWORD *)&v31 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v36) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v38);
}

void sub_2127D8414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2127D8428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2127D843C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2127D8450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::OpMode::modeToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *((_QWORD *)this + 1);
  v4 = *((_QWORD *)this + 2);
  if (v3 == v4)
  {
LABEL_5:
    LOBYTE(v5) = 8;
  }
  else
  {
    v5 = 0;
    while (*(unsigned __int8 *)(v3 + v5) != a2)
    {
      ++v5;
      if (v3 + v5 == v4)
        goto LABEL_5;
    }
  }
  return radio::OpMode::modeToString((uint64_t)this, v5, a3);
}

uint64_t radio::OpMode::getConfigString@<X0>(radio::OpMode *this@<X0>, _BYTE *a2@<X8>)
{
  return radio::OpMode::configToString((uint64_t)this, *((unsigned __int16 *)this + 1), a2);
}

uint64_t radio::OpMode::configToString@<X0>(uint64_t a1@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  __int128 v6;
  const char *v7;
  size_t v8;
  int RadioVendor;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  size_t v16;
  _QWORD *v17;
  size_t v18;
  _BYTE *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *__src[2];
  void *__p[2];
  __int128 v32;
  __int128 v33;
  _OWORD v34[9];
  unint64_t v35;

  v35 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[7] = v6;
  v34[8] = v6;
  v34[5] = v6;
  v34[6] = v6;
  v34[3] = v6;
  v34[4] = v6;
  v34[1] = v6;
  v34[2] = v6;
  v33 = v6;
  v34[0] = v6;
  *(_OWORD *)__p = v6;
  v32 = v6;
  v29 = v6;
  *(_OWORD *)__src = v6;
  v27 = v6;
  v28 = v6;
  v26 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v26);
  if ((a2 - 1) > 2)
    v7 = "Unknown";
  else
    v7 = off_24CE24298[(__int16)(a2 - 1)];
  v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v7, v8);
  RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
      v13 = *(_QWORD *)(a1 + 32);
      if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 40) - v13) >> 1)
        || (v14 = *(unsigned __int16 *)(v13 + 2 * a2) - 1, v14 > 2))
      {
        v15 = "Unknown";
      }
      else
      {
        v15 = off_24CE24298[(__int16)v14];
      }
      v16 = strlen(v15);
      v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" ]", 2);
    }
  }
  else
  {
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
    v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Invalid for ICE", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" ]", 2);
  }
  if ((BYTE8(v33) & 0x10) != 0)
  {
    v19 = (_BYTE *)v33;
    if ((void *)v33 < __src[1])
    {
      *(void **)&v33 = __src[1];
      v19 = __src[1];
    }
    v20 = __src[0];
    v18 = v19 - (char *)__src[0];
    if ((unint64_t)(v19 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_29;
  }
  else
  {
    if ((BYTE8(v33) & 8) == 0)
    {
      v18 = 0;
      a3[23] = 0;
      goto LABEL_25;
    }
    v20 = (const void *)*((_QWORD *)&v28 + 1);
    v18 = *((_QWORD *)&v29 + 1) - *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v29 + 1) - *((_QWORD *)&v28 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_29:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v18 >= 0x17)
  {
    v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v21 = v18 | 7;
    v22 = v21 + 1;
    v23 = operator new(v21 + 1);
    *((_QWORD *)a3 + 1) = v18;
    *((_QWORD *)a3 + 2) = v22 | 0x8000000000000000;
    *(_QWORD *)a3 = v23;
    a3 = v23;
    goto LABEL_24;
  }
  a3[23] = v18;
  if (v18)
LABEL_24:
    memmove(a3, v20, v18);
LABEL_25:
  a3[v18] = 0;
  *(_QWORD *)&v26 = *MEMORY[0x24BEDB7F0];
  v24 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v26 + *(_QWORD *)(v26 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v27 = v24;
  *((_QWORD *)&v27 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v32) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v34);
}

void sub_2127D875C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2127D8770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::OpMode::configToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  unsigned __int16 v5;

  v3 = (unsigned __int16 *)*((_QWORD *)this + 4);
  v4 = (unsigned __int16 *)*((_QWORD *)this + 5);
  if (v3 == v4)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    while (*v3 != a2)
    {
      ++v3;
      ++v5;
      if (v3 == v4)
        goto LABEL_5;
    }
  }
  return radio::OpMode::configToString((uint64_t)this, v5, a3);
}

const char *radio::asStringV2(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 2)
    return "FactoryCalibrationStatus::kUnknown";
  else
    return off_24CE242C8[v1];
}

uint64_t radio::RFCalibration_t::toString@<X0>(radio::RFCalibration_t *this@<X0>, _BYTE *a2@<X8>)
{
  __int128 v4;
  unint64_t v5;
  const char *v6;
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  int v13;
  const char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  int v29;
  const char *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  int v36;
  int v37;
  const char *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  size_t v48;
  _BYTE *v49;
  const void *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *__src[2];
  void *__p[2];
  __int128 v62;
  __int128 v63;
  _OWORD v64[9];
  unint64_t v65;

  v65 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v64[7] = v4;
  v64[8] = v4;
  v64[5] = v4;
  v64[6] = v4;
  v64[3] = v4;
  v64[4] = v4;
  v64[1] = v4;
  v64[2] = v4;
  v63 = v4;
  v64[0] = v4;
  *(_OWORD *)__p = v4;
  v62 = v4;
  v59 = v4;
  *(_OWORD *)__src = v4;
  v57 = v4;
  v58 = v4;
  v56 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v56);
  v5 = *(char *)this;
  if (v5 > 2)
    v6 = "RFCalibrationStatus::kUnknown";
  else
    v6 = off_24CE242E0[v5];
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)v6, v7);
  if (*(_BYTE *)this == 1)
  {
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nGSM: ", 6);
    *(_DWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(_QWORD *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"0x", 2);
    v9 = (_QWORD *)std::ostream::operator<<();
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"0x", 2);
    v11 = (_QWORD *)std::ostream::operator<<();
    v12 = *((unsigned __int16 *)this + 1);
    v13 = *((unsigned __int16 *)this + 2);
    if (v12 == v13)
      v14 = " - CORRECT";
    else
      v14 = " - INCORRECT";
    if (v12 == v13)
      v15 = 10;
    else
      v15 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v14, v15);
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nCDMA: ", 7);
    *(_DWORD *)((char *)v16 + *(_QWORD *)(*v16 - 24) + 8) = *(_DWORD *)((_BYTE *)v16 + *(_QWORD *)(*v16 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"0x", 2);
    v17 = (_QWORD *)std::ostream::operator<<();
    v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 8) = *(_DWORD *)((_BYTE *)v18 + *(_QWORD *)(*v18 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = *((_DWORD *)this + 2);
    v21 = *((_DWORD *)this + 3);
    if (v20 == v21)
      v22 = " - CORRECT";
    else
      v22 = " - INCORRECT";
    if (v20 == v21)
      v23 = 10;
    else
      v23 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v22, v23);
    v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nWCDMA: ", 8);
    *(_DWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 8) = *(_DWORD *)((_BYTE *)v24 + *(_QWORD *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"0x", 2);
    v25 = (_QWORD *)std::ostream::operator<<();
    v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v26 + *(_QWORD *)(*v26 - 24) + 8) = *(_DWORD *)((_BYTE *)v26 + *(_QWORD *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"0x", 2);
    v27 = (_QWORD *)std::ostream::operator<<();
    v28 = *((_DWORD *)this + 4);
    v29 = *((_DWORD *)this + 5);
    if (v28 == v29)
      v30 = " - CORRECT";
    else
      v30 = " - INCORRECT";
    if (v28 == v29)
      v31 = 10;
    else
      v31 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v30, v31);
    v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nTDSCDMA: ", 10);
    *(_DWORD *)((char *)v32 + *(_QWORD *)(*v32 - 24) + 8) = *(_DWORD *)((_BYTE *)v32 + *(_QWORD *)(*v32 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"0x", 2);
    v33 = (_QWORD *)std::ostream::operator<<();
    v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v34 + *(_QWORD *)(*v34 - 24) + 8) = *(_DWORD *)((_BYTE *)v34 + *(_QWORD *)(*v34 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"0x", 2);
    v35 = (_QWORD *)std::ostream::operator<<();
    v36 = *((_DWORD *)this + 6);
    v37 = *((_DWORD *)this + 7);
    if (v36 == v37)
      v38 = " - CORRECT";
    else
      v38 = " - INCORRECT";
    if (v36 == v37)
      v39 = 10;
    else
      v39 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)v38, v39);
    v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nLTE: ", 6);
    *(_DWORD *)((char *)v40 + *(_QWORD *)(*v40 - 24) + 8) = *(_DWORD *)((_BYTE *)v40 + *(_QWORD *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)"0x", 2);
    v41 = (_QWORD *)std::ostream::operator<<();
    v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v42 + *(_QWORD *)(*v42 - 24) + 8) = *(_DWORD *)((_BYTE *)v42 + *(_QWORD *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"0x", 2);
    v43 = (_QWORD *)std::ostream::operator<<();
    v44 = *((_QWORD *)this + 4);
    v45 = *((_QWORD *)this + 5);
    if (v44 == v45)
      v46 = " - CORRECT";
    else
      v46 = " - INCORRECT";
    if (v44 == v45)
      v47 = 10;
    else
      v47 = 12;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)v46, v47);
  }
  if ((BYTE8(v63) & 0x10) != 0)
  {
    v49 = (_BYTE *)v63;
    if ((void *)v63 < __src[1])
    {
      *(void **)&v63 = __src[1];
      v49 = __src[1];
    }
    v50 = __src[0];
    v48 = v49 - (char *)__src[0];
    if ((unint64_t)(v49 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_53;
  }
  else
  {
    if ((BYTE8(v63) & 8) == 0)
    {
      v48 = 0;
      a2[23] = 0;
      goto LABEL_49;
    }
    v50 = (const void *)*((_QWORD *)&v58 + 1);
    v48 = *((_QWORD *)&v59 + 1) - *((_QWORD *)&v58 + 1);
    if (*((_QWORD *)&v59 + 1) - *((_QWORD *)&v58 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_53:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v48 >= 0x17)
  {
    v51 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v48 | 7) != 0x17)
      v51 = v48 | 7;
    v52 = v51 + 1;
    v53 = operator new(v51 + 1);
    *((_QWORD *)a2 + 1) = v48;
    *((_QWORD *)a2 + 2) = v52 | 0x8000000000000000;
    *(_QWORD *)a2 = v53;
    a2 = v53;
    goto LABEL_48;
  }
  a2[23] = v48;
  if (v48)
LABEL_48:
    memmove(a2, v50, v48);
LABEL_49:
  a2[v48] = 0;
  *(_QWORD *)&v56 = *MEMORY[0x24BEDB7F0];
  v54 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v56 + *(_QWORD *)(v56 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v57 = v54;
  *((_QWORD *)&v57 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v62) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BF3620](v64);
}

void sub_2127D8DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_BYTE *radio::RFCalibration_t::RFCalibration_t(_BYTE *this)
{
  *this = 2;
  return this;
}

{
  *this = 2;
  return this;
}

BOOL radio::RFCalibration_t::fill(uint64_t a1, const __CFDictionary **a2)
{
  const __CFDictionary *v2;
  uint64_t (*v3)(uint64_t);
  int Bool;
  const __CFNumber *v6;
  const __CFNumber *v7;
  int v8;
  const __CFNumber *v10;
  const __CFNumber *v11;
  unint64_t valuePtr;
  _QWORD v13[2];

  v2 = *a2;
  v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v2)
    v3 = 0;
  if (!v3)
    return 0;
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v13, v2);
  Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v13, CFSTR("BasebandRFCalibrationPresentStatus"));
  *(_BYTE *)a1 = Bool;
  if (Bool)
  {
    *(_WORD *)(a1 + 2) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandGSMCalibrationStatus"));
    *(_WORD *)(a1 + 4) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandGSMCalibrationMask"));
    *(_DWORD *)(a1 + 8) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 12) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandCDMACalibrationMask"));
    *(_DWORD *)(a1 + 16) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandWCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 20) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandWCDMACalibrationMask"));
    *(_DWORD *)(a1 + 24) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandTDSCDMACalibrationStatus"));
    *(_DWORD *)(a1 + 28) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, CFSTR("BasebandTDSCDMACalibrationMask"));
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    v6 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, CFSTR("BasebandLTECalibrationStatus"));
    v7 = v6;
    if (v6)
    {
      if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
      {
        *(_QWORD *)(a1 + 32) = valuePtr;
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v7);
      valuePtr = 0;
    }
    else
    {
      v8 = 1;
    }
    v10 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, CFSTR("BasebandLTECalibrationMask"));
    v11 = v10;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr))
        *(_QWORD *)(a1 + 40) = valuePtr;
      else
        v8 = 0;
      CFRelease(v11);
    }
  }
  else
  {
    v8 = 0;
  }
  MEMORY[0x212BF3488](v13);
  return v8 != 0;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const char *radio::asString(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 - 1;
  if (v1 > 4)
    return "Other";
  else
    return off_24CE242F8[v1];
}

const char *radio::asString(_BYTE *a1)
{
  const char *v1;

  v1 = "Invalid";
  if (!*a1)
    v1 = "Disabled";
  if (*a1 == 1)
    return "Enabled";
  else
    return v1;
}

{
  const char *v1;

  v1 = "Invalid";
  if (!*a1)
    v1 = "Disabled";
  if (*a1 == 1)
    return "Enabled";
  else
    return v1;
}

uint64_t radio::BasebandProperties::create(const __CFDictionary **a1)
{
  const __CFDictionary *v1;
  int Bool;
  int Int;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  __CFString *v8;

  v1 = *a1;
  if (!*a1)
    return 0xAAAAAAAAAAAAAA00;
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v7, v1);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyCoredumpSupported");
  Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x212BF3458](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyPowerSequenceIndex");
  Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x212BF3458](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyBasebandVersion");
  v4 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x212BF3458](&v8);
  MEMORY[0x212BF3488](v7);
  v5 = 256;
  if (!Bool)
    v5 = 0;
  return (Int << 16) | (unint64_t)(v4 << 32) | v5 | 1;
}

void sub_2127D9198(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  MEMORY[0x212BF3458](va1);
  MEMORY[0x212BF3488]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void radio::BasebandProperties::toDict(radio::BasebandProperties *this@<X0>, __CFDictionary **a2@<X8>)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  const __CFAllocator *v6;
  const void *v7;
  const __CFAllocator *v8;
  const void *v9;
  CFNumberRef v10;
  const __CFAllocator *v11;
  CFNumberRef v12;
  const void *v13;
  const void *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFTypeID v17;
  const void *valuePtr;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  ctu::cf::insert<char const*,BOOL>(Mutable, (const __CFString **)"kBasebandPropertyCoredumpSupported", *((unsigned __int8 *)this + 1), (uint64_t)v4, v6);
  v7 = (const void *)*((unsigned __int16 *)this + 1);
  valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, (const __CFString **)"kBasebandPropertyPowerSequenceIndex", (const char *)0x8000100, (uint64_t)v4, v8);
  v9 = valuePtr;
  valuePtr = v7;
  v10 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  v12 = v10;
  if (v9 && v10)
  {
    CFDictionaryAddValue(Mutable, v9, v10);
  }
  else if (!v10)
  {
    goto LABEL_6;
  }
  CFRelease(v12);
LABEL_6:
  if (v9)
    CFRelease(v9);
  v13 = (const void *)*((unsigned int *)this + 1);
  valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, (const __CFString **)"kBasebandPropertyBasebandVersion", (const char *)0x8000100, (uint64_t)v4, v11);
  v14 = valuePtr;
  valuePtr = v13;
  v15 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  v16 = v15;
  if (v14 && v15)
  {
    CFDictionaryAddValue(Mutable, v14, v15);
  }
  else if (!v15)
  {
    goto LABEL_13;
  }
  CFRelease(v16);
LABEL_13:
  if (v14)
    CFRelease(v14);
  if (Mutable)
  {
    v17 = CFGetTypeID(Mutable);
    if (v17 == CFDictionaryGetTypeID())
    {
      *a2 = Mutable;
      CFRetain(Mutable);
    }
    else
    {
      *a2 = 0;
    }
    CFRelease(Mutable);
  }
  else
  {
    *a2 = 0;
  }
}

void sub_2127D93A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a11);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_2127D93E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24CE24178;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24CE24178;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<radio::OpMode>::__on_zero_shared(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  a1[5] = v2;
  v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    operator delete(v3);
    v2 = (void *)a1[4];
  }
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
}

uint64_t ctu::cf::insert<char const*,BOOL>(__CFDictionary *a1, const __CFString **a2, int a3, uint64_t a4, const __CFAllocator *a5)
{
  void *v7;
  void **v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *key;

  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, a2, (const char *)0x8000100, a4, a5);
  v7 = key;
  v8 = (void **)MEMORY[0x24BDBD270];
  if (!a3)
    v8 = (void **)MEMORY[0x24BDBD268];
  v9 = *v8;
  key = *v8;
  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v10)
  {
    if (!v9)
      goto LABEL_13;
  }
  else
  {
    CFDictionaryAddValue(a1, v7, v9);
  }
  CFRelease(v9);
LABEL_13:
  if (v7)
    CFRelease(v7);
  return v11;
}

void sub_2127D955C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a9);
  _Unwind_Resume(a1);
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t radio::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, dispatch_object_t *a3, _QWORD *a4)
{
  NSObject *v7;
  NSObject *initially_inactive;
  NSObject *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  pthread_mutex_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  pthread_mutex_t *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t *v40;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t *v48;
  unsigned int *v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int v55;
  _BYTE v56[16];
  char v57[16];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  _QWORD **v61;
  _QWORD *v62;
  uint64_t v63;

  *(_QWORD *)a1 = off_24CE24330;
  v7 = *a3;
  if (*a3)
    dispatch_retain(*a3);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v56, "com.apple.telephony.abm", "radio.drv");
  if (v7)
    dispatch_retain(v7);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v9 = dispatch_queue_create_with_target_V2("radio.drv", initially_inactive, v7);
  dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v9);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v9;
  if (v9)
    dispatch_retain(v9);
  *(_QWORD *)(a1 + 96) = v7;
  if (v7)
    dispatch_retain(v7);
  if (v9)
    dispatch_release(v9);
  if (v7)
    dispatch_release(v7);
  *(_QWORD *)a1 = off_24CE246E0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v58);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v10 = a2[1];
  *(_QWORD *)(a1 + 64) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v57);
  *(_QWORD *)a1 = off_24CE24800;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v56);
  if (v7)
    dispatch_release(v7);
  *(_QWORD *)a1 = off_24CE24330;
  *(_QWORD *)(a1 + 104) = &off_24CE24720;
  v13 = (uint64_t *)operator new(0x28uLL);
  v14 = operator new(0x20uLL);
  v58 = (uint64_t)&v58;
  v59 = &v58;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = &v62;
  v15 = operator new(0x40uLL);
  *v15 = v15;
  v15[1] = v15;
  v15[5] = 0;
  v15[4] = 0;
  v15[2] = 0;
  v15[3] = v15 + 4;
  *(_QWORD *)v14 = v15;
  *((_QWORD *)v14 + 1) = 0;
  v16 = operator new(0x18uLL);
  v16[1] = 0x100000001;
  *v16 = off_24CE24840;
  v16[2] = v15;
  *((_QWORD *)v14 + 1) = v16;
  v17 = operator new(1uLL);
  *((_QWORD *)v14 + 2) = v17;
  *((_QWORD *)v14 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v14 + 16, (uint64_t)v17, (unsigned int **)v14 + 3);
  *v13 = (uint64_t)v14;
  v13[1] = 0;
  v18 = operator new(0x18uLL);
  v18[1] = 0x100000001;
  *v18 = off_24CE248A0;
  v18[2] = v14;
  v13[1] = (uint64_t)v18;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v62);
  if (v60)
  {
    v19 = v58;
    v20 = v59;
    v21 = *v59;
    *(_QWORD *)(v21 + 8) = *(_QWORD *)(v58 + 8);
    **(_QWORD **)(v19 + 8) = v21;
    v60 = 0;
    if (v20 != &v58)
    {
      do
      {
        v40 = (uint64_t *)v20[1];
        v41 = (unsigned int *)v20[3];
        if (v41)
        {
          v42 = v41 + 2;
          do
          {
            v43 = __ldaxr(v42);
            v44 = v43 - 1;
          }
          while (__stlxr(v44, v42));
          if (!v44)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v41 + 16))(v41);
            v45 = v41 + 3;
            do
            {
              v46 = __ldaxr(v45);
              v47 = v46 - 1;
            }
            while (__stlxr(v47, v45));
            if (!v47)
              (*(void (**)(unsigned int *))(*(_QWORD *)v41 + 24))(v41);
          }
        }
        operator delete(v20);
        v20 = v40;
      }
      while (v40 != &v58);
    }
  }
  v13[2] = *(_QWORD *)*v13;
  v22 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v22, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v13 + 3, (uint64_t)v22);
  *(_QWORD *)(a1 + 112) = v13;
  *(_QWORD *)(a1 + 120) = 0;
  v23 = operator new(0x18uLL);
  v23[1] = 0x100000001;
  *v23 = off_24CE24900;
  v23[2] = v13;
  *(_QWORD *)(a1 + 128) = &off_24CE24790;
  *(_QWORD *)(a1 + 120) = v23;
  v24 = (uint64_t *)operator new(0x28uLL);
  v25 = operator new(0x20uLL);
  v58 = (uint64_t)&v58;
  v59 = &v58;
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = &v62;
  v26 = operator new(0x40uLL);
  *v26 = v26;
  v26[1] = v26;
  v26[5] = 0;
  v26[4] = 0;
  v26[2] = 0;
  v26[3] = v26 + 4;
  *(_QWORD *)v25 = v26;
  *((_QWORD *)v25 + 1) = 0;
  v27 = operator new(0x18uLL);
  v27[1] = 0x100000001;
  *v27 = off_24CE24960;
  v27[2] = v26;
  *((_QWORD *)v25 + 1) = v27;
  v28 = operator new(1uLL);
  *((_QWORD *)v25 + 2) = v28;
  *((_QWORD *)v25 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v25 + 16, (uint64_t)v28, (unsigned int **)v25 + 3);
  *v24 = (uint64_t)v25;
  v24[1] = 0;
  v29 = operator new(0x18uLL);
  v29[1] = 0x100000001;
  *v29 = off_24CE249C0;
  v29[2] = v25;
  v24[1] = (uint64_t)v29;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v62);
  if (v60)
  {
    v30 = v58;
    v31 = v59;
    v32 = *v59;
    *(_QWORD *)(v32 + 8) = *(_QWORD *)(v58 + 8);
    **(_QWORD **)(v30 + 8) = v32;
    v60 = 0;
    if (v31 != &v58)
    {
      do
      {
        v48 = (uint64_t *)v31[1];
        v49 = (unsigned int *)v31[3];
        if (v49)
        {
          v50 = v49 + 2;
          do
          {
            v51 = __ldaxr(v50);
            v52 = v51 - 1;
          }
          while (__stlxr(v52, v50));
          if (!v52)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v49 + 16))(v49);
            v53 = v49 + 3;
            do
            {
              v54 = __ldaxr(v53);
              v55 = v54 - 1;
            }
            while (__stlxr(v55, v53));
            if (!v55)
              (*(void (**)(unsigned int *))(*(_QWORD *)v49 + 24))(v49);
          }
        }
        operator delete(v31);
        v31 = v48;
      }
      while (v48 != &v58);
    }
  }
  v24[2] = *(_QWORD *)*v24;
  v33 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v33, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v24 + 3, (uint64_t)v33);
  *(_QWORD *)(a1 + 136) = v24;
  *(_QWORD *)(a1 + 144) = 0;
  v34 = operator new(0x18uLL);
  v34[1] = 0x100000001;
  *v34 = off_24CE24A20;
  v34[2] = v24;
  *(_QWORD *)(a1 + 216) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a1 + 144) = v34;
  *(_QWORD *)(a1 + 152) = a1 + 152;
  *(_QWORD *)(a1 + 160) = a1 + 152;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = a1 + 176;
  *(_QWORD *)(a1 + 184) = a1 + 176;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 224) = 0xAAAAAAAAAAAAAAAALL;
  v35 = (char *)operator new(0x50uLL);
  *((_QWORD *)v35 + 2) = 0;
  *(_QWORD *)v35 = off_24CE24178;
  *((_QWORD *)v35 + 1) = 0;
  *(_OWORD *)(v35 + 40) = 0u;
  *(_OWORD *)(v35 + 56) = 0u;
  *((_QWORD *)v35 + 9) = 0;
  *(_OWORD *)(v35 + 24) = 0u;
  *(_QWORD *)(a1 + 216) = v35 + 24;
  *(_QWORD *)(a1 + 224) = v35;
  radio::OpMode::init((radio::OpMode *)(v35 + 24));
  *(_QWORD *)(a1 + 232) = *a4;
  v36 = a4[1];
  *(_QWORD *)(a1 + 240) = v36;
  if (v36)
  {
    v37 = (unint64_t *)(v36 + 8);
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  *(_QWORD *)(a1 + 248) = 0;
  *(_QWORD *)(a1 + 256) = 0;
  *(_BYTE *)(a1 + 287) = 9;
  strcpy((char *)(a1 + 264), "radio.drv");
  return a1;
}

void sub_2127D9BA4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;

  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v6);
  dispatch::callback<void({block_pointer})(BOOL,std::vector<unsigned char>,std::vector<unsigned char>,std::vector<unsigned char>)>::~callback((uint64_t)(v1 + 25));
  std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(v4);
  std::list<dispatch::block<BOOL({block_pointer})(radio::OperatingMode)>>::~list(v3);
  boost::signals2::signal<void (),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(v5);
  boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(v2);
  ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v1);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(BOOL,std::vector<unsigned char>,std::vector<unsigned char>,std::vector<unsigned char>)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

uint64_t *std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  const void *v6;
  uint64_t *v7;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v7 = (uint64_t *)v3[1];
        v6 = (const void *)v3[2];
        if (v6)
          _Block_release(v6);
        operator delete(v3);
        v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

uint64_t *std::list<dispatch::block<BOOL({block_pointer})(radio::OperatingMode)>>::~list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  const void *v6;
  uint64_t *v7;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v7 = (uint64_t *)v3[1];
        v6 = (const void *)v3[2];
        if (v6)
          _Block_release(v6);
        operator delete(v3);
        v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

_QWORD *boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE24790;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE24720;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE246E0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE246E0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t radio::CommandDriver::getName(radio::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 264;
  if (*((char *)this + 287) < 0)
    return *(_QWORD *)result;
  return result;
}

void *radio::CommandDriver::watchOperatingMode_sync(uint64_t a1, void **a2)
{
  _QWORD *v4;
  void *result;
  _QWORD *v6;
  uint64_t v7;

  v4 = operator new(0x18uLL);
  *v4 = 0;
  v4[1] = 0;
  result = *a2;
  if (*a2)
    result = _Block_copy(result);
  v7 = *(_QWORD *)(a1 + 152);
  v6 = (_QWORD *)(a1 + 152);
  v4[1] = v6;
  v4[2] = result;
  *v4 = v7;
  *(_QWORD *)(v7 + 8) = v4;
  *v6 = v4;
  ++v6[2];
  return result;
}

void radio::CommandDriver::watchOperatingMode(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *v9;
  _QWORD v10[5];
  void *v11;
  _QWORD aBlock[4];
  void *v13;
  dispatch_object_t object;

  if (*(_QWORD *)a2)
  {
    v4 = _Block_copy(*(const void **)a2);
    v5 = *(NSObject **)(a2 + 8);
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  v5 = *(NSObject **)(a2 + 8);
  if (v5)
LABEL_3:
    dispatch_retain(v5);
LABEL_4:
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_1;
  if (v4)
  {
    v13 = _Block_copy(v4);
    object = v5;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v13 = 0;
  object = v5;
  if (v5)
LABEL_6:
    dispatch_retain(v5);
LABEL_7:
  v7 = _Block_copy(aBlock);
  v8 = v7;
  v10[0] = v6;
  v10[1] = 1174405120;
  v10[2] = ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_3;
  v10[3] = &__block_descriptor_tmp_5;
  v10[4] = a1;
  if (v7)
    v9 = _Block_copy(v7);
  else
    v9 = 0;
  v11 = v9;
  ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped((uint64_t *)(a1 + 72), (uint64_t)v10);
  if (v11)
    _Block_release(v11);
  if (v8)
    _Block_release(v8);
  if (object)
    dispatch_release(object);
  if (v13)
    _Block_release(v13);
  if (v5)
    dispatch_release(v5);
  if (v4)
    _Block_release(v4);
}

uint64_t ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke(uint64_t a1, int a2)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFNumberRef v7;
  BOOL v8;
  const void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  void *aBlock;
  CFTypeRef v15;
  CFTypeRef cf;
  CFNumberRef v17;
  int valuePtr;

  if (!*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
    return 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  block[0] = CFSTR("KeyBasebandOperatingMode");
  if (CFSTR("KeyBasebandOperatingMode"))
    CFRetain(CFSTR("KeyBasebandOperatingMode"));
  valuePtr = a2;
  v6 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
  v7 = v6;
  v17 = v6;
  if (CFSTR("KeyBasebandOperatingMode"))
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    CFDictionaryAddValue(Mutable, CFSTR("KeyBasebandOperatingMode"), v6);
LABEL_13:
    CFRelease(v7);
    goto LABEL_14;
  }
  if (v6)
    goto LABEL_13;
LABEL_14:
  if (CFSTR("KeyBasebandOperatingMode"))
    CFRelease(CFSTR("KeyBasebandOperatingMode"));
  if (Mutable)
    CFRetain(Mutable);
  v10 = *(const void **)(a1 + 32);
  if (v10)
    v11 = _Block_copy(v10);
  else
    v11 = 0;
  v12 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_46_0;
  if (v11)
  {
    aBlock = _Block_copy(v11);
    v15 = 0;
    cf = Mutable;
    if (!Mutable)
      goto LABEL_26;
    goto LABEL_25;
  }
  aBlock = 0;
  v15 = 0;
  cf = Mutable;
  if (Mutable)
LABEL_25:
    CFRetain(Mutable);
LABEL_26:
  dispatch_async(v12, block);
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
  if (aBlock)
    _Block_release(aBlock);
  if (v11)
    _Block_release(v11);
  if (Mutable)
  {
    CFRelease(Mutable);
    CFRelease(Mutable);
  }
  return 1;
}

void sub_2127DAB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const void *a17)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a17);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_2127DABE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_2127DABF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void sub_2127DAC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c103_ZTSN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  if (v5)
    dispatch_retain(v5);
}

void __destroy_helper_block_e8_32c103_ZTSN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_release(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    _Block_release(v3);
}

void ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_3(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  if (v1)
    v3 = _Block_copy(v1);
  else
    v3 = 0;
  v4 = operator new(0x18uLL);
  *v4 = 0;
  v4[1] = 0;
  if (v3)
    v5 = _Block_copy(v3);
  else
    v5 = 0;
  v4[2] = v5;
  v7 = *(_QWORD *)(v2 + 152);
  v6 = (_QWORD *)(v2 + 152);
  *v4 = v7;
  v4[1] = v6;
  *(_QWORD *)(v7 + 8) = v4;
  *v6 = v4;
  ++v6[2];
  if (v3)
    _Block_release(v3);
}

void sub_2127DAD40(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    _Block_release(v1);
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_40c65_ZTSN8dispatch5blockIU13block_pointerFbN5radio13OperatingModeEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c65_ZTSN8dispatch5blockIU13block_pointerFbN5radio13OperatingModeEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

void radio::CommandDriver::handleOperatingModeChanged_sync(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  const void *v18;
  __int128 *v19;
  const char *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (a2 > 7)
      v20 = "Unknown";
    else
      v20 = off_24CE24AD8[(char)a2];
    LODWORD(v21) = 136315138;
    *(_QWORD *)((char *)&v21 + 4) = v20;
    _os_log_debug_impl(&dword_2127C9000, v4, OS_LOG_TYPE_DEBUG, "#D Notifying operating mode: %s", (uint8_t *)&v21, 0xCu);
  }
  v5 = a1 + 152;
  v22 = *(_QWORD *)(a1 + 168);
  v6 = v22;
  v21 = *(_OWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = &v21;
  *(_QWORD *)(a1 + 160) = &v21;
  *(_QWORD *)(a1 + 168) = 0;
  if (v6)
  {
    **((_QWORD **)&v21 + 1) = &v21;
    v7 = (_QWORD *)(v21 + 8);
  }
  else
  {
    v7 = (_QWORD *)&v21 + 1;
    *(_QWORD *)&v21 = &v21;
  }
  *v7 = &v21;
  *(_QWORD *)(a1 + 152) = a1 + 152;
  *(_QWORD *)(a1 + 160) = v5;
  v8 = *((_QWORD *)&v21 + 1);
  if (*((__int128 **)&v21 + 1) != &v21)
  {
    do
    {
      v9 = *(const void **)(v8 + 16);
      if (v9)
        v10 = _Block_copy(v9);
      else
        v10 = 0;
      if ((*((unsigned int (**)(void *, uint64_t))v10 + 2))(v10, a2))
      {
        v11 = _Block_copy(v10);
        v12 = operator new(0x18uLL);
        *v12 = 0;
        v12[1] = 0;
        v13 = v11 ? _Block_copy(v11) : 0;
        v12[1] = v5;
        v12[2] = v13;
        v14 = *(_QWORD *)(a1 + 152);
        *v12 = v14;
        *(_QWORD *)(v14 + 8) = v12;
        *(_QWORD *)(a1 + 152) = v12;
        ++*(_QWORD *)(a1 + 168);
        if (v11)
          _Block_release(v11);
      }
      _Block_release(v10);
      v8 = *(_QWORD *)(v8 + 8);
    }
    while ((__int128 *)v8 != &v21);
    v6 = v22;
  }
  if (v6)
  {
    v16 = (__int128 *)*((_QWORD *)&v21 + 1);
    v15 = v21;
    v17 = **((_QWORD **)&v21 + 1);
    *(_QWORD *)(v17 + 8) = *(_QWORD *)(v21 + 8);
    **(_QWORD **)(v15 + 8) = v17;
    v22 = 0;
    if (v16 != &v21)
    {
      do
      {
        v19 = (__int128 *)*((_QWORD *)v16 + 1);
        v18 = (const void *)*((_QWORD *)v16 + 2);
        if (v18)
          _Block_release(v18);
        operator delete(v16);
        v16 = v19;
      }
      while (v19 != &v21);
    }
  }
}

void sub_2127DAFD4(_Unwind_Exception *exception_object, int a2)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

_QWORD *radio::CommandDriver::watchClientState_sync(_QWORD *result, const void **a2)
{
  const void *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *a2;
  if (*a2)
  {
    v3 = result;
    v4 = operator new(0x18uLL);
    *v4 = 0;
    v4[1] = 0;
    result = _Block_copy(v2);
    v5 = v3[22];
    v3 += 22;
    v4[1] = v3;
    v4[2] = result;
    *v4 = v5;
    *(_QWORD *)(v5 + 8) = v4;
    *v3 = v4;
    ++v3[2];
  }
  return result;
}

void radio::CommandDriver::handleClientStateChanged_sync(radio::CommandDriver *this, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t i;
  const void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  const void *v18;
  __int128 *v19;
  __int128 v20;
  uint64_t v21;

  v4 = (char *)this + 176;
  v21 = *((_QWORD *)this + 24);
  v5 = v21;
  v20 = *((_OWORD *)this + 11);
  *((_QWORD *)this + 22) = &v20;
  *((_QWORD *)this + 23) = &v20;
  *((_QWORD *)this + 24) = 0;
  if (v5)
  {
    **((_QWORD **)&v20 + 1) = &v20;
    v6 = (_QWORD *)(v20 + 8);
  }
  else
  {
    v6 = (_QWORD *)&v20 + 1;
    *(_QWORD *)&v20 = &v20;
  }
  *v6 = &v20;
  *((_QWORD *)this + 22) = (char *)this + 176;
  *((_QWORD *)this + 23) = v4;
  for (i = *((_QWORD *)&v20 + 1); (__int128 *)i != &v20; i = *(_QWORD *)(i + 8))
  {
    v8 = *(const void **)(i + 16);
    if (v8)
      v9 = _Block_copy(v8);
    else
      v9 = 0;
    if ((*((unsigned int (**)(void *, uint64_t))v9 + 2))(v9, a2))
    {
      v10 = _Block_copy(v9);
      if (v10)
      {
        v11 = operator new(0x18uLL);
        *v11 = 0;
        v11[1] = 0;
        v12 = _Block_copy(v10);
        v11[1] = v4;
        v11[2] = v12;
        v13 = *((_QWORD *)this + 22);
        *v11 = v13;
        *(_QWORD *)(v13 + 8) = v11;
        *((_QWORD *)this + 22) = v11;
        ++*((_QWORD *)this + 24);
        _Block_release(v10);
      }
    }
    _Block_release(v9);
  }
  if ((a2 & 1) == 0)
  {
    v14 = *((_QWORD *)this + 27);
    *(_BYTE *)v14 = 8;
    *(_WORD *)(v14 + 2) = 0;
  }
  if (v21)
  {
    v16 = (__int128 *)*((_QWORD *)&v20 + 1);
    v15 = v20;
    v17 = **((_QWORD **)&v20 + 1);
    *(_QWORD *)(v17 + 8) = *(_QWORD *)(v20 + 8);
    **(_QWORD **)(v15 + 8) = v17;
    v21 = 0;
    if (v16 != &v20)
    {
      do
      {
        v19 = (__int128 *)*((_QWORD *)v16 + 1);
        v18 = (const void *)*((_QWORD *)v16 + 2);
        if (v18)
          _Block_release(v18);
        operator delete(v16);
        v16 = v19;
      }
      while (v19 != &v20);
    }
  }
}

void sub_2127DB23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const void *v9;
  const void *v10;

  _Block_release(v10);
  _Block_release(v9);
  std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(&a9);
  _Unwind_Resume(a1);
}

void radio::CommandDriver::watchClientState(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *v9;
  _QWORD v10[5];
  void *v11;
  _QWORD aBlock[4];
  void *v13;
  dispatch_object_t object;

  if (*(_QWORD *)a2)
  {
    v4 = _Block_copy(*(const void **)a2);
    v5 = *(NSObject **)(a2 + 8);
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 0;
  v5 = *(NSObject **)(a2 + 8);
  if (v5)
LABEL_3:
    dispatch_retain(v5);
LABEL_4:
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_7;
  if (v4)
  {
    v13 = _Block_copy(v4);
    object = v5;
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v13 = 0;
  object = v5;
  if (v5)
LABEL_6:
    dispatch_retain(v5);
LABEL_7:
  v7 = _Block_copy(aBlock);
  v8 = v7;
  v10[0] = v6;
  v10[1] = 1174405120;
  v10[2] = ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_8;
  v10[3] = &__block_descriptor_tmp_9;
  v10[4] = a1;
  if (v7)
    v9 = _Block_copy(v7);
  else
    v9 = 0;
  v11 = v9;
  ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped((uint64_t *)(a1 + 72), (uint64_t)v10);
  if (v11)
    _Block_release(v11);
  if (v8)
    _Block_release(v8);
  if (object)
    dispatch_release(object);
  if (v13)
    _Block_release(v13);
  if (v5)
    dispatch_release(v5);
  if (v4)
    _Block_release(v4);
}

uint64_t ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  __CFDictionary *Mutable;
  const __CFAllocator *v6;
  const void *v7;
  void *v8;
  NSObject *v10;
  _QWORD block[4];
  void *aBlock;
  CFTypeRef v13;
  CFTypeRef cf;

  if (!*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
    return 0;
  v4 = *MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  ctu::cf::insert<char const*,BOOL>(Mutable, (const __CFString **)"kKeyTransportClientStarted", a2, v4, v6);
  if (Mutable)
    CFRetain(Mutable);
  v7 = *(const void **)(a1 + 32);
  if (v7)
    v8 = _Block_copy(v7);
  else
    v8 = 0;
  v10 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_46_0;
  if (v8)
  {
    aBlock = _Block_copy(v8);
    v13 = 0;
    cf = Mutable;
    if (!Mutable)
      goto LABEL_14;
    goto LABEL_13;
  }
  aBlock = 0;
  v13 = 0;
  cf = Mutable;
  if (Mutable)
LABEL_13:
    CFRetain(Mutable);
LABEL_14:
  dispatch_async(v10, block);
  if (cf)
    CFRelease(cf);
  if (v13)
    CFRelease(v13);
  if (aBlock)
    _Block_release(aBlock);
  if (v8)
    _Block_release(v8);
  if (Mutable)
  {
    CFRelease(Mutable);
    CFRelease(Mutable);
  }
  return 1;
}

void sub_2127DB5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(&a9);
  _Unwind_Resume(a1);
}

void ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_8(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = _Block_copy(v2);
    if (v4)
    {
      v5 = operator new(0x18uLL);
      *v5 = 0;
      v5[1] = 0;
      v5[2] = _Block_copy(v4);
      v7 = *(_QWORD *)(v3 + 176);
      v6 = (_QWORD *)(v3 + 176);
      *v5 = v7;
      v5[1] = v6;
      *(_QWORD *)(v7 + 8) = v5;
      *v6 = v5;
      ++v6[2];
      _Block_release(v4);
    }
  }
}

void sub_2127DB648(_Unwind_Exception *a1)
{
  const void *v1;

  _Block_release(v1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFbbEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 40);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFbbEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  if (v1)
    _Block_release(v1);
}

uint64_t radio::CommandDriver::getSimSlotInfo(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unsigned __int16 *v7;
  int v8;
  int v9;

  if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
    v2 = *((unsigned __int8 *)a2 + 23);
    if (v2 > 2)
    {
      v3 = v2 - 3;
      goto LABEL_7;
    }
LABEL_19:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  v4 = a2[1];
  v5 = v4 >= 3;
  v3 = v4 - 3;
  if (!v5)
    goto LABEL_19;
  a2 = (uint64_t *)*a2;
LABEL_7:
  if (*(_WORD *)((char *)a2 + v3) == 12579 && *((_BYTE *)a2 + v3 + 2) == 35)
    return 2;
  v7 = (unsigned __int16 *)((char *)a2 + v3);
  v8 = *v7;
  v9 = *((unsigned __int8 *)v7 + 2);
  return v8 == 12323 && v9 == 35;
}

uint64_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 264);
  if (*(char *)(a1 + 287) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE246E0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE246E0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]();
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24CE22160, MEMORY[0x24BEDAB00]);
}

void sub_2127DB8B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE24720;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE24790;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE246E0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke(_QWORD *a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  CFTypeID v5;
  CFTypeRef cf;
  CFTypeRef v7;

  v3 = a1[4];
  v2 = (const void *)a1[5];
  v7 = v2;
  if (v2)
    CFRetain(v2);
  v4 = (const void *)a1[6];
  if (v4 && (v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
  {
    cf = v4;
    CFRetain(v4);
  }
  else
  {
    cf = 0;
  }
  (*(void (**)(uint64_t, CFTypeRef *, CFTypeRef *))(v3 + 16))(v3, &v7, &cf);
  if (cf)
    CFRelease(cf);
  if (v7)
    CFRelease(v7);
}

void sub_2127DC56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, CFTypeRef a10)
{
  if (cf)
    CFRelease(cf);
  if (a10)
    CFRelease(a10);
  _Unwind_Resume(exception_object);
}

CFTypeRef __copy_helper_block_e8_32c100_ZTSN8dispatch5blockIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE40c38_ZTSN3ctu2cf11CFSharedRefI9__CFErrorEE48c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(_QWORD *a1, _QWORD *a2)
{
  const void *v4;
  void *v5;
  const void *v6;
  CFTypeRef result;

  v4 = (const void *)a2[4];
  if (!v4)
  {
    v6 = (const void *)a2[5];
    a1[4] = 0;
    a1[5] = v6;
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = _Block_copy(v4);
  v6 = (const void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  if (v6)
LABEL_5:
    CFRetain(v6);
LABEL_6:
  result = (CFTypeRef)a2[6];
  a1[6] = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_e8_32c100_ZTSN8dispatch5blockIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE40c38_ZTSN3ctu2cf11CFSharedRefI9__CFErrorEE48c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[6];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[4];
  if (v4)
    _Block_release(v4);
}

void ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD block[6];
  std::__shared_weak_count *v16;

  v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = a1[2];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN5radio13CommandDriverEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_24CE24AA8;
  block[5] = v5;
  v16 = v7;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  block[4] = a2;
  dispatch_async(v8, block);
  v11 = v16;
  if (v16)
  {
    v12 = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableIN5radio13CommandDriverEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIKN5radio13CommandDriverEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIKN5radio13CommandDriverEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

uint64_t data::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::string *v14;
  __int128 v15;
  const char *v16;
  size_t v17;
  std::string *v18;
  __int128 v19;
  std::string v21;
  std::string v22;
  _BYTE v23[16];

  *(_QWORD *)a1 = off_24CE24B28;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v23, "com.apple.telephony.abm", "data.drv");
  v6 = dispatch_queue_create("data.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE24C40;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v22);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v21);
  *(_QWORD *)a1 = off_24CE24C80;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v23);
  *(_QWORD *)a1 = off_24CE24B28;
  *(_QWORD *)(a1 + 104) = *a3;
  v11 = a3[1];
  *(_QWORD *)(a1 + 112) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *((_BYTE *)&v21.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v21, "data.drv");
  v14 = std::string::append(&v21, "::", 2uLL);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v22.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = getprogname();
  v17 = strlen(v16);
  v18 = std::string::append(&v22, v16, v17);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 136) = *((_QWORD *)&v18->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 120) = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_14:
    operator delete(v21.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_14;
  return a1;
}

void sub_2127DCA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  _QWORD *v23;
  uint64_t v24;

  if ((a15 & 0x80000000) == 0)
  {
    std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
    ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24C40;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24C40;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t data::CommandDriver::getName(data::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE24C40;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE24C40;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24C40;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t radio::RFSCommandDriver::RFSCommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  std::string::size_type v17;
  std::string *size;
  uint64_t v19;
  pthread_mutex_t *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::string *v25;
  __int128 v26;
  const char *v27;
  size_t v28;
  std::string *v29;
  __int128 v30;
  std::string *v32;
  unsigned int *data;
  unsigned int *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int v39;
  std::string v40;
  _BYTE v41[16];
  std::string v42;
  _QWORD **v43;
  _QWORD *v44[4];

  *(_QWORD *)a1 = off_24CE24CD0;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v41, "com.apple.telephony.abm", "rfs.drv");
  v6 = dispatch_queue_create("rfs.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE24DD8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v42);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v40);
  *(_QWORD *)a1 = off_24CE24E18;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v41);
  *(_QWORD *)a1 = off_24CE24CD0;
  *(_QWORD *)(a1 + 104) = &off_24CE24E58;
  v11 = (uint64_t *)operator new(0x28uLL);
  v12 = operator new(0x20uLL);
  v42.__r_.__value_.__r.__words[0] = (std::string::size_type)&v42;
  *(_OWORD *)&v42.__r_.__value_.__r.__words[1] = (unint64_t)&v42;
  v44[0] = 0;
  v44[1] = 0;
  v43 = v44;
  v13 = operator new(0x40uLL);
  *v13 = v13;
  v13[1] = v13;
  v13[5] = 0;
  v13[4] = 0;
  v13[2] = 0;
  v13[3] = v13 + 4;
  *(_QWORD *)v12 = v13;
  *((_QWORD *)v12 + 1) = 0;
  v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  *v14 = off_24CE24EC8;
  v14[2] = v13;
  *((_QWORD *)v12 + 1) = v14;
  v15 = operator new(1uLL);
  *((_QWORD *)v12 + 2) = v15;
  *((_QWORD *)v12 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v12 + 16, (uint64_t)v15, (unsigned int **)v12 + 3);
  *v11 = (uint64_t)v12;
  v11[1] = 0;
  v16 = operator new(0x18uLL);
  v16[1] = 0x100000001;
  *v16 = off_24CE24F28;
  v16[2] = v12;
  v11[1] = (uint64_t)v16;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v44[0]);
  if (v42.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v42.__r_.__value_.__l.__size_;
    v17 = v42.__r_.__value_.__r.__words[0];
    v19 = *(_QWORD *)v42.__r_.__value_.__l.__size_;
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(v42.__r_.__value_.__r.__words[0] + 8);
    **(_QWORD **)(v17 + 8) = v19;
    v42.__r_.__value_.__r.__words[2] = 0;
    if (size != &v42)
    {
      do
      {
        v32 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (unsigned int *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          v34 = data + 2;
          do
          {
            v35 = __ldaxr(v34);
            v36 = v35 - 1;
          }
          while (__stlxr(v36, v34));
          if (!v36)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)data + 16))(data);
            v37 = data + 3;
            do
            {
              v38 = __ldaxr(v37);
              v39 = v38 - 1;
            }
            while (__stlxr(v39, v37));
            if (!v39)
              (*(void (**)(unsigned int *))(*(_QWORD *)data + 24))(data);
          }
        }
        operator delete(size);
        size = v32;
      }
      while (v32 != &v42);
    }
  }
  v11[2] = *(_QWORD *)*v11;
  v20 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v20, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v11 + 3, (uint64_t)v20);
  *(_QWORD *)(a1 + 112) = v11;
  *(_QWORD *)(a1 + 120) = 0;
  v21 = operator new(0x18uLL);
  v21[1] = 0x100000001;
  *v21 = off_24CE24F88;
  v21[2] = v11;
  *(_QWORD *)(a1 + 128) = *a3;
  *(_QWORD *)(a1 + 120) = v21;
  v22 = a3[1];
  *(_QWORD *)(a1 + 136) = v22;
  if (v22)
  {
    v23 = (unint64_t *)(v22 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  *((_BYTE *)&v40.__r_.__value_.__s + 23) = 7;
  strcpy((char *)&v40, "rfs.drv");
  v25 = std::string::append(&v40, "::", 2uLL);
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = getprogname();
  v28 = strlen(v27);
  v29 = std::string::append(&v42, v27, v28);
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 160) = *((_QWORD *)&v29->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 144) = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v42.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_25:
    operator delete(v40.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_25;
  return a1;
}

void sub_2127DD0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(v25);
  ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

_QWORD *boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(_QWORD *a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = &off_24CE24E58;
  v2 = (unsigned int *)a1[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

_QWORD *ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void radio::RFSCommandDriver::~RFSCommandDriver(void **this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  std::__shared_weak_count *v14;

  *this = off_24CE24CD0;
  if (*((char *)this + 167) < 0)
    operator delete(this[18]);
  v2 = (std::__shared_weak_count *)this[17];
  if (!v2)
    goto LABEL_7;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this[13] = &off_24CE24E58;
    v5 = (unsigned int *)this[15];
    if (!v5)
      goto LABEL_16;
  }
  else
  {
LABEL_7:
    this[13] = &off_24CE24E58;
    v5 = (unsigned int *)this[15];
    if (!v5)
      goto LABEL_16;
  }
  v6 = v5 + 2;
  do
  {
    v7 = __ldaxr(v6);
    v8 = v7 - 1;
  }
  while (__stlxr(v8, v6));
  if (!v8)
  {
    (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 16))(v5);
    v9 = v5 + 3;
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 24))(v5);
  }
LABEL_16:
  *this = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v12 = this[12];
  if (v12)
    dispatch_release(v12);
  v13 = this[11];
  if (v13)
    dispatch_release(v13);
  v14 = (std::__shared_weak_count *)this[10];
  if (v14)
    std::__shared_weak_count::__release_weak(v14);
}

uint64_t radio::RFSCommandDriver::getName(radio::RFSCommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 144;
  if (*((char *)this + 167) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 144);
  if (*(char *)(a1 + 167) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE24DD8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(_QWORD *__p)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  *__p = &off_24CE24E58;
  v2 = (unsigned int *)__p[2];
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(result + 16);
  *a2 = *(_QWORD *)(result + 8);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unsigned int *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)a1[4]);
  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (uint64_t *)v3[1];
        v7 = (unsigned int *)v3[3];
        if (v7)
        {
          v8 = v7 + 2;
          do
          {
            v9 = __ldaxr(v8);
            v10 = v9 - 1;
          }
          while (__stlxr(v10, v8));
          if (!v10)
          {
            (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 16))(v7);
            v11 = v7 + 3;
            do
            {
              v12 = __ldaxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
              (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 24))(v7);
          }
        }
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(unsigned int **)(a1 + 8);
  if (v2)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
      v6 = v2 + 3;
      do
      {
        v7 = __ldaxr(v6);
        v8 = v7 - 1;
      }
      while (__stlxr(v8, v6));
      if (!v8)
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;

  v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((_QWORD *)v1[4]);
    if (v1[2])
    {
      v2 = (_QWORD *)*v1;
      v3 = (uint64_t *)v1[1];
      v4 = *v3;
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(*v1 + 8);
      *(_QWORD *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          v5 = (uint64_t *)v3[1];
          v6 = (unsigned int *)v3[3];
          if (v6)
          {
            v7 = v6 + 2;
            do
            {
              v8 = __ldaxr(v7);
              v9 = v8 - 1;
            }
            while (__stlxr(v9, v7));
            if (!v9)
            {
              (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 16))(v6);
              v10 = v6 + 3;
              do
              {
                v11 = __ldaxr(v10);
                v12 = v11 - 1;
              }
              while (__stlxr(v12, v10));
              if (!v12)
                (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[3];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  _QWORD *v1;
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v1 = *(_QWORD **)(a1 + 16);
  if (v1)
  {
    v2 = (unsigned int *)v1[4];
    if (v2)
    {
      v3 = v2 + 2;
      do
      {
        v4 = __ldaxr(v3);
        v5 = v4 - 1;
      }
      while (__stlxr(v5, v3));
      if (!v5)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 16))(v2);
        v6 = v2 + 3;
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 24))(v2);
      }
    }
    v9 = (unsigned int *)v1[1];
    if (v9)
    {
      v10 = v9 + 2;
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
      {
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        v13 = v9 + 3;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 24))(v9);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t diag::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::string *v18;
  __int128 v19;
  const char *v20;
  size_t v21;
  std::string *v22;
  __int128 v23;
  std::string v25;
  std::string v26;
  _BYTE v27[16];

  *(_QWORD *)a1 = off_24CE24FE8;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v27, "com.apple.telephony.abm", "diag.drv");
  v8 = dispatch_queue_create("diag.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v8;
  if (v8)
  {
    v9 = v8;
    dispatch_retain(v8);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v9);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE250D0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v26);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v10 = a2[1];
  *(_QWORD *)(a1 + 64) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v25);
  *(_QWORD *)a1 = off_24CE25110;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v27);
  *(_QWORD *)a1 = off_24CE24FE8;
  v13 = *(void **)a3;
  if (*(_QWORD *)a3)
    v13 = _Block_copy(v13);
  *(_QWORD *)(a1 + 104) = v13;
  v14 = *(NSObject **)(a3 + 8);
  *(_QWORD *)(a1 + 112) = v14;
  if (v14)
    dispatch_retain(v14);
  *(_QWORD *)(a1 + 120) = *a4;
  v15 = a4[1];
  *(_QWORD *)(a1 + 128) = v15;
  if (v15)
  {
    v16 = (unint64_t *)(v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  *((_BYTE *)&v25.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v25, "diag.drv");
  v18 = std::string::append(&v25, "::", 2uLL);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  v20 = getprogname();
  v21 = strlen(v20);
  v22 = std::string::append(&v26, v20, v21);
  v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 152) = *((_QWORD *)&v22->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 136) = v23;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_18:
    operator delete(v25.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_18;
  return a1;
}

void sub_2127DE1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v25);
  dispatch::callback<void({block_pointer})(diag::CommandDriver::Event,dispatch::group_session)>::~callback(v24);
  ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(diag::CommandDriver::Event,dispatch::group_session)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

_QWORD *ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE250D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE250D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t diag::CommandDriver::getName(diag::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 136;
  if (*((char *)this + 159) < 0)
    return *(_QWORD *)result;
  return result;
}

const char *diag::CommandDriver::asString(unsigned int a1)
{
  if (a1 > 6)
    return "Unknown";
  else
    return off_24CE25170[a1];
}

void diag::CommandDriver::notifyOfEvent_sync(_QWORD *a1, unsigned int a2, dispatch_object_t *a3)
{
  const void *v4;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  __int128 v11;
  void (*v12)(uint64_t);
  void *v13;
  void *aBlock;
  dispatch_group_t group;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (const void *)a1[13];
  if (!v4 || !a1[14])
    return;
  v6 = *a3;
  if (*a3 && (dispatch_retain(*a3), dispatch_group_enter(v6), (v4 = (const void *)a1[13]) == 0))
    v7 = 0;
  else
    v7 = _Block_copy(v4);
  v8 = a1[14];
  *(_QWORD *)&v11 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v11 + 1) = 1174405120;
  v12 = ___ZNK8dispatch8callbackIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEclIJS3_S4_EEEvDpT__block_invoke;
  v13 = &__block_descriptor_tmp_2;
  if (v7)
  {
    v16 = a2;
    aBlock = _Block_copy(v7);
    group = v6;
    if (!v6)
      goto LABEL_10;
    goto LABEL_9;
  }
  v16 = a2;
  aBlock = 0;
  group = v6;
  if (v6)
  {
LABEL_9:
    dispatch_retain(v6);
    dispatch_group_enter(v6);
  }
LABEL_10:
  dispatch_async(v8, &v11);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (aBlock)
    _Block_release(aBlock);
  if (v7)
    _Block_release(v7);
  if (v6)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
  }
  v9 = a1[5];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 6)
      v10 = "Unknown";
    else
      v10 = off_24CE25170[a2];
    LODWORD(v11) = 136315138;
    *(_QWORD *)((char *)&v11 + 4) = v10;
    _os_log_impl(&dword_2127C9000, v9, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v11, 0xCu);
  }
}

void sub_2127DE4CC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 136);
  if (*(char *)(a1 + 159) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE250D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE250D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE250D0;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEclIJS3_S4_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  dispatch_group_t group;

  v1 = *(unsigned int *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(a1 + 40);
  group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v3);
  }
  (*(void (**)(uint64_t, uint64_t, dispatch_group_t *))(v2 + 16))(v2, v1, &group);
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
}

void sub_2127DE740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v4 = *(void **)(a2 + 32);
  if (v4)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    v6 = *(NSObject **)(a1 + 40);
    if (v6)
      dispatch_group_enter(v6);
  }
}

void __destroy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
    _Block_release(v4);
}

uint64_t logs::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6, _QWORD *a7)
{
  int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v11;
  const void *v13;
  __int128 *p_p;
  uint64_t v15;
  size_t v16;
  _DWORD *v17;
  unint64_t v18;
  _DWORD *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  size_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  const void *v40;
  __int128 __p;
  uint64_t v47;
  void *v48[3];

  *(_QWORD *)a1 = off_24CE251B8;
  v7 = *((char *)a6 + 23);
  if (v7 >= 0)
    v8 = *((unsigned __int8 *)a6 + 23);
  else
    v8 = (size_t)a6[1];
  v9 = v8 + 12;
  memset(v48, 170, sizeof(v48));
  if (v8 + 12 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = a3;
  if (v9 > 0x16)
  {
    v15 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v15 = v9 | 7;
    v16 = v15 + 1;
    v17 = operator new(v15 + 1);
    v18 = v16 | 0x8000000000000000;
    v48[1] = (void *)(v8 + 12);
    v48[2] = (void *)(v16 | 0x8000000000000000);
    v48[0] = v17;
    v19 = v17 + 3;
    v17[2] = 779249014;
    *(_QWORD *)v17 = *(_QWORD *)"logs.driver.";
    if (v7 >= 0)
      v13 = a6;
    else
      v13 = *a6;
    memmove(v17 + 3, v13, v8);
    *((_BYTE *)v19 + v8) = 0;
    p_p = (__int128 *)operator new(v16);
    *((_QWORD *)&__p + 1) = v8 + 12;
    v47 = v18;
    *(_QWORD *)&__p = p_p;
    *((_DWORD *)p_p + 2) = 779249014;
    *(_QWORD *)p_p = *(_QWORD *)"logs.driver.";
    v11 = a3;
    goto LABEL_17;
  }
  v48[2] = 0;
  HIBYTE(v48[2]) = v8 + 12;
  BYTE5(v48[1]) = 0;
  HIWORD(v48[1]) = 0;
  strcpy((char *)v48, "logs.driver.");
  if (v8)
  {
    if (v7 >= 0)
      v13 = a6;
    else
      v13 = *a6;
    memmove((char *)&v48[1] + 4, v13, v8);
    *((_BYTE *)&v48[1] + v8 + 4) = 0;
    v47 = 0;
    HIBYTE(v47) = v8 + 12;
    strcpy((char *)&__p, "logs.driver.");
    p_p = &__p;
    BYTE13(__p) = 0;
    HIWORD(__p) = 0;
LABEL_17:
    memmove((char *)p_p + 12, v13, v8);
    goto LABEL_18;
  }
  v47 = 0xC00000000000000;
  BYTE13(__p) = 0;
  HIWORD(__p) = 0;
  p_p = &__p;
  strcpy((char *)&__p, "logs.driver.");
LABEL_18:
  *((_BYTE *)p_p + v8 + 12) = 0;
  if (SHIBYTE(v48[2]) >= 0)
    v20 = (const char *)v48;
  else
    v20 = (const char *)v48[0];
  v21 = dispatch_queue_create(v20, 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v21;
  if (v21)
  {
    v22 = v21;
    dispatch_retain(v21);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v22);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE252A8;
  ctu::LoggerCommonBase::LoggerCommonBase();
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v23 = a2[1];
  *(_QWORD *)(a1 + 64) = v23;
  if (v23)
  {
    v24 = (unint64_t *)(v23 + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  *(_QWORD *)a1 = off_24CE252E8;
  if (SHIBYTE(v47) < 0)
  {
    operator delete((void *)__p);
    if ((SHIBYTE(v48[2]) & 0x80000000) == 0)
      goto LABEL_29;
  }
  else if ((SHIBYTE(v48[2]) & 0x80000000) == 0)
  {
    goto LABEL_29;
  }
  operator delete(v48[0]);
LABEL_29:
  *(_QWORD *)a1 = off_24CE251B8;
  *(_QWORD *)(a1 + 104) = *a7;
  v26 = a7[1];
  *(_QWORD *)(a1 + 112) = v26;
  if (v26)
  {
    v27 = (unint64_t *)(v26 + 8);
    do
      v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }
  v29 = *(void **)v11;
  if (*(_QWORD *)v11)
    v29 = _Block_copy(v29);
  *(_QWORD *)(a1 + 120) = v29;
  v30 = *(NSObject **)(v11 + 8);
  *(_QWORD *)(a1 + 128) = v30;
  if (v30)
    dispatch_retain(v30);
  v31 = *(void **)a4;
  if (*(_QWORD *)a4)
    v31 = _Block_copy(v31);
  *(_QWORD *)(a1 + 136) = v31;
  v32 = *(NSObject **)(a4 + 8);
  *(_QWORD *)(a1 + 144) = v32;
  if (v32)
    dispatch_retain(v32);
  *(_QWORD *)(a1 + 152) = 0xAAAAAAAAAAAAAAAALL;
  v33 = *((char *)a6 + 23);
  if (v33 >= 0)
    v34 = *((unsigned __int8 *)a6 + 23);
  else
    v34 = (size_t)a6[1];
  *(_QWORD *)(a1 + 160) = 0xAAAAAAAAAAAAAAAALL;
  v35 = v34 + 12;
  *(_QWORD *)(a1 + 168) = 0xAAAAAAAAAAAAAAAALL;
  if (v34 + 12 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v35 >= 0x17)
  {
    v37 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v35 | 7) != 0x17)
      v37 = v35 | 7;
    v38 = v37 + 1;
    v39 = operator new(v37 + 1);
    *(_QWORD *)(a1 + 160) = v35;
    *(_QWORD *)(a1 + 168) = v38 | 0x8000000000000000;
    *(_QWORD *)(a1 + 152) = v39;
    v39[2] = 779249014;
    *(_QWORD *)v39 = *(_QWORD *)"logs.driver.";
    v36 = v39 + 3;
  }
  else
  {
    *(_QWORD *)(a1 + 160) = 0;
    *(_QWORD *)(a1 + 168) = 0;
    *(_BYTE *)(a1 + 175) = v35;
    *(_DWORD *)(a1 + 160) = 779249014;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)"logs.driver.";
    v36 = (void *)(a1 + 164);
    if (!v34)
      goto LABEL_54;
  }
  if (v33 >= 0)
    v40 = a6;
  else
    v40 = *a6;
  memmove(v36, v40, v34);
LABEL_54:
  *((_BYTE *)v36 + v34) = 0;
  return a1;
}

void sub_2127DEC18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<std::vector<unsigned char>>,BOOL)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

uint64_t dispatch::callback<void({block_pointer})(logs::CollectionState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

_QWORD *ctu::SharedLoggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE252A8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE252A8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t logs::CommandDriver::getName(logs::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 152;
  if (*((char *)this + 175) < 0)
    return *(_QWORD *)result;
  return result;
}

void logs::CommandDriver::notifyState_sync(uint64_t a1, int a2)
{
  const void *v3;
  void *v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  void *aBlock;
  int v11;

  v3 = *(const void **)(a1 + 120);
  if (v3 && *(_QWORD *)(a1 + 128))
  {
    v5 = _Block_copy(v3);
    v6 = v5;
    v7 = *(NSObject **)(a1 + 128);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 1174405120;
    v9[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN4logs15CollectionStateEEEclIJS2_EEEvDpT__block_invoke;
    v9[3] = &__block_descriptor_tmp_3;
    if (v5)
      v8 = _Block_copy(v5);
    else
      v8 = 0;
    aBlock = v8;
    v11 = a2;
    dispatch_async(v7, v9);
    if (aBlock)
      _Block_release(aBlock);
    if (v6)
      _Block_release(v6);
  }
}

void logs::CommandDriver::sendLogData_sync(uint64_t a1, uint64_t *a2, char a3)
{
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  const void *v9;
  void *v10;
  NSObject *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[4];
  void *aBlock;
  uint64_t v22;
  std::__shared_weak_count *v23;
  char v24;

  v6 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *(const void **)(a1 + 136);
  if (v9)
    v10 = _Block_copy(v9);
  else
    v10 = 0;
  v11 = *(NSObject **)(a1 + 144);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 1174405120;
  v20[2] = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEclIJS7_bEEEvDpT__block_invoke;
  v20[3] = &__block_descriptor_tmp_3;
  if (v10)
  {
    aBlock = _Block_copy(v10);
    v22 = v6;
    v23 = v5;
    if (!v5)
      goto LABEL_13;
  }
  else
  {
    aBlock = 0;
    v22 = v6;
    v23 = v5;
    if (!v5)
      goto LABEL_13;
  }
  v12 = (unint64_t *)&v5->__shared_owners_;
  do
    v13 = __ldxr(v12);
  while (__stxr(v13 + 1, v12));
LABEL_13:
  v24 = a3;
  dispatch_async(v11, v20);
  v14 = v23;
  if (!v23)
    goto LABEL_17;
  v15 = (unint64_t *)&v23->__shared_owners_;
  do
    v16 = __ldaxr(v15);
  while (__stlxr(v16 - 1, v15));
  if (v16)
  {
LABEL_17:
    v17 = aBlock;
    if (!aBlock)
      goto LABEL_19;
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  v17 = aBlock;
  if (aBlock)
LABEL_18:
    _Block_release(v17);
LABEL_19:
  if (v10)
    _Block_release(v10);
  if (v5)
  {
    v18 = (unint64_t *)&v5->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

uint64_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 152);
  if (*(char *)(a1 + 175) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE252A8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE252A8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE252A8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN4logs15CollectionStateEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c66_ZTSN8dispatch5blockIU13block_pointerFvN4logs15CollectionStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c66_ZTSN8dispatch5blockIU13block_pointerFvN4logs15CollectionStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEclIJS7_bEEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *, _QWORD))(v2 + 16))(v2, &v9, *(unsigned __int8 *)(a1 + 56));
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_2127DF2C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  unint64_t *p_shared_owners;
  unint64_t v12;

  if (a10)
  {
    p_shared_owners = (unint64_t *)&a10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_32c98_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEE40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(_QWORD *a1, _QWORD *a2)
{
  void *result;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  result = (void *)a2[4];
  if (result)
    result = _Block_copy(result);
  v6 = a2[5];
  v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5)
  {
    v7 = (unint64_t *)(v5 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

void __destroy_helper_block_e8_32c98_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEE40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  const void *v5;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = *(const void **)(a1 + 32);
    if (!v5)
      return;
  }
  else
  {
LABEL_5:
    v5 = *(const void **)(a1 + 32);
    if (!v5)
      return;
  }
  _Block_release(v5);
}

uint64_t antenna::CommandDriver::CommandDriver(uint64_t a1, _QWORD *a2, dispatch_object_t *a3, _QWORD *a4)
{
  NSObject *v7;
  NSObject *initially_inactive;
  NSObject *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::string *v16;
  __int128 v17;
  const char *v18;
  size_t v19;
  std::string *v20;
  __int128 v21;
  std::string v23;
  std::string v24;
  _BYTE v25[16];

  *(_QWORD *)a1 = off_24CE25560;
  v7 = *a3;
  if (*a3)
    dispatch_retain(*a3);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v25, "com.apple.telephony.abm", "antenna.drv");
  if (v7)
    dispatch_retain(v7);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v9 = dispatch_queue_create_with_target_V2("antenna.drv", initially_inactive, v7);
  dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v9);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v9;
  if (v9)
    dispatch_retain(v9);
  *(_QWORD *)(a1 + 96) = v7;
  if (v7)
    dispatch_retain(v7);
  if (v9)
    dispatch_release(v9);
  if (v7)
    dispatch_release(v7);
  *(_QWORD *)a1 = off_24CE25688;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v24);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v10 = a2[1];
  *(_QWORD *)(a1 + 64) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v23);
  *(_QWORD *)a1 = off_24CE256C8;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v25);
  if (v7)
    dispatch_release(v7);
  *(_QWORD *)a1 = off_24CE25560;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 104) = a1 + 112;
  *(_QWORD *)(a1 + 128) = *a4;
  v13 = a4[1];
  *(_QWORD *)(a1 + 136) = v13;
  if (v13)
  {
    v14 = (unint64_t *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *((_BYTE *)&v23.__r_.__value_.__s + 23) = 11;
  strcpy((char *)&v23, "antenna.drv");
  v16 = std::string::append(&v23, "::", 2uLL);
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = getprogname();
  v19 = strlen(v18);
  v20 = std::string::append(&v24, v18, v19);
  v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  *(_QWORD *)(a1 + 176) = *((_QWORD *)&v20->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 160) = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v24.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_25:
    operator delete(v23.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_25;
  return a1;
}

void sub_2127DF65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v25);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(*(_QWORD **)(v23 + 112));
  ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable((_QWORD *)v23);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE25688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE25688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

uint64_t antenna::CommandDriver::getName(antenna::CommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 160;
  if (*((char *)this + 183) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t antenna::CommandDriver::convertModeToState(uint64_t a1, unsigned int a2)
{
  if (a2 > 3)
    return 2;
  else
    return dword_2127E70D0[a2];
}

void antenna::CommandDriver::registerHandler(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v3 = *(std::__shared_weak_count **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = v2;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

uint64_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 160);
  if (*(char *)(a1 + 183) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE25688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE25688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

void ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE25688;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_DWORD *)(this + 8) = 0;
  return this;
}

uint64_t radio::HealthCommandDriver::HealthCommandDriver(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _BYTE v15[16];
  _BYTE v16[16];
  _BYTE v17[16];

  *(_QWORD *)a1 = off_24CE25708;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v15, "com.apple.telephony.abm", "radio.health.drv");
  v6 = dispatch_queue_create("radio.health.drv", 0);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  if (v6)
  {
    v7 = v6;
    dispatch_retain(v6);
    *(_QWORD *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_QWORD *)a1 = off_24CE257F8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v17);
  *(_QWORD *)(a1 + 8) = &unk_24CE22E20;
  *(_QWORD *)(a1 + 56) = *a2;
  v8 = a2[1];
  *(_QWORD *)(a1 + 64) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v16);
  *(_QWORD *)a1 = &off_24CE25838;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v15);
  *(_QWORD *)a1 = off_24CE25708;
  *(_QWORD *)(a1 + 104) = *a3;
  v11 = a3[1];
  *(_QWORD *)(a1 + 112) = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  *(_BYTE *)(a1 + 143) = 16;
  strcpy((char *)(a1 + 120), "radio.health.drv");
  return a1;
}

void sub_2127DFB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  _QWORD *v13;

  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(v13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::HealthCommandDriver::getName(radio::HealthCommandDriver *this)
{
  uint64_t result;

  result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig()
{
  return ctu::LoggerCommonBase::setInheritedLogLevel();
}

size_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  size_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0)
    v3 = *(const char **)v3;
  result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = result;
  if (result >= 0x17)
  {
    v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v6 = result | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((_BYTE *)a2 + 23) = result;
    if (!result)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = (size_t)memmove(a2, v3, v5);
  *((_BYTE *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return ctu::LoggerCommonBase::getLocalLogLevel((ctu::LoggerCommonBase *)(a1 + 8));
}

_QWORD *ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE257F8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  return a1;
}

void ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(_QWORD *a1)
{
  *a1 = off_24CE257F8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  operator delete(a1);
}

_QWORD *ctu::SharedLoggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE257F8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void ctu::SharedLoggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = off_24CE257F8;
  ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase();
  v2 = a1[12];
  if (v2)
    dispatch_release(v2);
  v3 = a1[11];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[10];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  operator delete(a1);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x24BED97E8]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9828](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x24BED9850]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::LoggerCommonBase::setInheritedLogLevel()
{
  return MEMORY[0x24BED99A8]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x24BED99B0]();
}

{
  return MEMORY[0x24BED99B8]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x24BED9A78](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
  MEMORY[0x24BED9A80](this);
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x24BED9A88](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x24BED9A90]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED9AA0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x24BED9AB0](this);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x24BED9D38]();
}

{
  return MEMORY[0x24BED9D48]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D80]();
}

{
  return MEMORY[0x24BED9D98]();
}

{
  return MEMORY[0x24BED9DA8]();
}

void Registry::Registry(Registry *this)
{
  MEMORY[0x24BED3BB0](this);
}

uint64_t ctu::LoggerCommonBase::getLocalLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x24BED9E68](this);
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E80](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E90](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E98](this, a2);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CE22198(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CE221A0(__sz);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x24BDADF58](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

