void sub_21FD5AD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E598418, MEMORY[0x24BEDAAF0]);
}

void sub_21FD5B154(_Unwind_Exception *a1)
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

uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v3;
  uint64_t v4;

  v3 = OSLogCopyFormattedStringImpl(a1, a2, a3);
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v3);

  return v4;
}

__CFString *OSLogCopyFormattedStringImpl(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x2207D27CC]();
  if (OSLogCopyFormattedStringImpl_onceToken != -1)
    dispatch_once(&OSLogCopyFormattedStringImpl_onceToken, &__block_literal_global);
  v7 = (void *)objc_msgSend((id)OSLogCopyFormattedStringImpl_sFormatter, "JSONObjectWithType:value:info:", a1, a2, a3, 0);
  v8 = v7;
  if (!v7)
    goto LABEL_6;
  v9 = (__CFString *)stringWithJSONObject((uint64_t)v7, &v19);
  if (!v9)
  {
    v7 = v19;
LABEL_6:
    v21[0] = CFSTR("decode failure");
    v20[0] = CFSTR("type");
    v20[1] = CFSTR("error");
    v10 = objc_msgSend(v7, "description");
    if (v10)
      v11 = (const __CFString *)v10;
    else
      v11 = CFSTR("nil");
    v21[1] = v11;
    v20[2] = CFSTR("fake JSON");
    v12 = objc_msgSend(v8, "description");
    if (v12)
      v13 = (const __CFString *)v12;
    else
      v13 = CFSTR("nil");
    v21[2] = v13;
    v20[3] = CFSTR("raw value");
    v14 = objc_msgSend(a2, "description");
    if (v14)
      v15 = (const __CFString *)v14;
    else
      v15 = CFSTR("nil");
    v21[3] = v15;
    v9 = (__CFString *)stringWithJSONObject(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4), &v19);
  }
  v16 = CFSTR("{\"error\":\"complete decode failure\"}");
  if (v9)
    v16 = v9;
  v17 = v16;
  objc_autoreleasePoolPop(v6);
  return v17;
}

__CFString *OSStateCreateStringWithData(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void *v4;
  __CFString *v5;
  uint64_t v7;

  v7 = 1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a2, 0);
  v5 = OSLogCopyFormattedStringImpl(a1, v4, (uint64_t)&v7);

  return v5;
}

id stringWithJSONObject(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id result;
  uint64_t v5;

  if (a2)
    *a2 = 0;
  v5 = 0;
  v3 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a1, 4, &v5);
  if (v3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  result = 0;
  if (a2)
    *a2 = v5;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void operator delete(void *__p)
{
  off_24E598428(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E598430(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

