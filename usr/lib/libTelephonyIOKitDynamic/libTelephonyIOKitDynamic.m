uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

BOOL ctu::iokit::IOHIDController::isProxCovered(ctu::iokit::IOHIDController *this, char a2)
{
  return (a2 & 0x41) != 0;
}

unint64_t TelephonyUtilGetSystemTime()
{
  timeval v1;

  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v1, 0);
  return 1000 * v1.tv_sec + v1.tv_usec / 0x3E8uLL;
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void ctu::iokit::sCameraServiceCallbackInternal(ctu::iokit *this, void *a2, int a3, unsigned int a4, void *a5)
{
  io_registry_entry_t v6;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v6 = a2;
  v14 = *MEMORY[0x24BDAC8D0];
  ctu::iokit::sCreateOsLogContext(this);
  v8 = qword_253D0AEE8;
  if (this)
  {
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315394;
      v11 = "void ctu::iokit::sCameraServiceCallbackInternal(void *, io_service_t, uint32_t, void *)";
      v12 = 1024;
      v13 = a3;
      _os_log_debug_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEBUG, "%s: messageType: 0x%x", (uint8_t *)&v10, 0x12u);
    }
    ctu::iokit::Controller::cameraService(this, v6, a3, v9);
  }
  else if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315138;
    v11 = "void ctu::iokit::sCameraServiceCallbackInternal(void *, io_service_t, uint32_t, void *)";
    _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v10, 0xCu);
  }
}

void ctu::iokit::sCreateOsLogContext(ctu::iokit *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_253D0AED8);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_253D0AED8))
  {
    qword_253D0AEE8 = 0;
    qword_253D0AEE0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &qword_253D0AEE0, &dword_20E5A6000);
    __cxa_guard_release(&qword_253D0AED8);
  }
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global);
}

void ctu::iokit::Controller::cameraService(ctu::iokit::Controller *this, io_registry_entry_t entry, int a3, void *a4)
{
  _QWORD *v5;
  const __CFAllocator *v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  int Value;
  const __CFString *v11;
  const __CFString *v12;
  CFTypeID v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  const void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  int v25;
  BOOL v26;
  NSObject *v27;
  uint64_t v28;
  const void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  int v36;
  BOOL v37;
  NSObject *v38;
  uint64_t v39;
  const void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  const __CFBoolean *v45;
  const __CFBoolean *v46;
  int v47;
  BOOL v48;
  NSObject *v49;
  uint64_t v50;
  const void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  const __CFBoolean *v56;
  const __CFBoolean *v57;
  int v58;
  BOOL v59;
  NSObject *v60;
  uint64_t v61;
  const void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  const __CFAllocator *v67;
  CFTypeRef v68;
  const void *v69;
  const void **v70;
  CFTypeID v71;
  _BOOL4 v73;
  NSObject *v74;
  CFTypeRef v75;
  const void *v76;
  CFTypeID v77;
  _BOOL4 v79;
  NSObject *v80;
  CFTypeRef v81;
  const void *v82;
  CFTypeID v83;
  _BOOL4 v85;
  NSObject *v86;
  uint64_t v87;
  const void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  __int128 v92;
  uint64_t (*v93)(uint64_t);
  void *v94;
  void *aBlock;
  char v96;
  BOOL v97;
  BOOL v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)*((_QWORD *)this + 1);
  if (*v5)
  {
    if (a3 == -536870608)
    {
      if (v5[16])
      {
        if (v5[17])
        {
          v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("FrontIRCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          if (CFProperty)
          {
            v9 = CFProperty;
            Value = CFBooleanGetValue(CFProperty);
            CFRelease(v9);
            if (Value)
            {
              v11 = (const __CFString *)IORegistryEntryCreateCFProperty(entry, CFSTR("FrontIRCameraMode"), v7, 0);
              if (v11 && (v12 = v11, v13 = CFGetTypeID(v11), v13 == CFStringGetTypeID()))
              {
                Value = CFStringCompare(v12, CFSTR("Authentication"), 1uLL) == kCFCompareEqualTo;
                v14 = *(NSObject **)this;
                if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(v92) = 138412290;
                  *(_QWORD *)((char *)&v92 + 4) = v12;
                  _os_log_debug_impl(&dword_20E5A6000, v14, OS_LOG_TYPE_DEBUG, "#D Front IR Camera Mode: \"%@\"", (uint8_t *)&v92, 0xCu);
                }
                CFRelease(v12);
              }
              else
              {
                Value = 1;
              }
            }
            v16 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = Value;
              _os_log_debug_impl(&dword_20E5A6000, v16, OS_LOG_TYPE_DEBUG, "#D Front IR Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            v17 = *((_QWORD *)this + 1);
            v18 = *(const void **)(v17 + 128);
            if (v18)
              v19 = _Block_copy(v18);
            else
              v19 = 0;
            v20 = *(NSObject **)(v17 + 136);
            *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
            *((_QWORD *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_107;
            if (v19)
              v21 = _Block_copy(v19);
            else
              v21 = 0;
            aBlock = v21;
            v96 = Value;
            dispatch_async(v20, &v92);
            if (aBlock)
              _Block_release(aBlock);
            if (v19)
              _Block_release(v19);
          }
        }
      }
      v22 = *((_QWORD *)this + 1);
      if (*(_QWORD *)(v22 + 144))
      {
        if (*(_QWORD *)(v22 + 152))
        {
          v23 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("FrontCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          v24 = v23;
          if (v23)
          {
            v25 = CFBooleanGetValue(v23);
            v26 = v25 != 0;
            CFRelease(v24);
            v27 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v25 != 0;
              _os_log_debug_impl(&dword_20E5A6000, v27, OS_LOG_TYPE_DEBUG, "#D Front Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            v28 = *((_QWORD *)this + 1);
            v29 = *(const void **)(v28 + 144);
            if (v29)
              v30 = _Block_copy(v29);
            else
              v30 = 0;
            v31 = *(NSObject **)(v28 + 152);
            *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
            *((_QWORD *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_108;
            if (v30)
              v32 = _Block_copy(v30);
            else
              v32 = 0;
            aBlock = v32;
            v96 = v26;
            dispatch_async(v31, &v92);
            if (aBlock)
              _Block_release(aBlock);
            if (v30)
              _Block_release(v30);
          }
        }
      }
      v33 = *((_QWORD *)this + 1);
      if (*(_QWORD *)(v33 + 160))
      {
        if (*(_QWORD *)(v33 + 168))
        {
          v34 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("BackTeleCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          v35 = v34;
          if (v34)
          {
            v36 = CFBooleanGetValue(v34);
            v37 = v36 != 0;
            CFRelease(v35);
            v38 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v36 != 0;
              _os_log_debug_impl(&dword_20E5A6000, v38, OS_LOG_TYPE_DEBUG, "#D Back Tele Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            v39 = *((_QWORD *)this + 1);
            v40 = *(const void **)(v39 + 160);
            if (v40)
              v41 = _Block_copy(v40);
            else
              v41 = 0;
            v42 = *(NSObject **)(v39 + 168);
            *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
            *((_QWORD *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_109;
            if (v41)
              v43 = _Block_copy(v41);
            else
              v43 = 0;
            aBlock = v43;
            v96 = v37;
            dispatch_async(v42, &v92);
            if (aBlock)
              _Block_release(aBlock);
            if (v41)
              _Block_release(v41);
          }
        }
      }
      v44 = *((_QWORD *)this + 1);
      if (*(_QWORD *)(v44 + 176))
      {
        if (*(_QWORD *)(v44 + 184))
        {
          v45 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("BackSuperWideCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          v46 = v45;
          if (v45)
          {
            v47 = CFBooleanGetValue(v45);
            v48 = v47 != 0;
            CFRelease(v46);
            v49 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v47 != 0;
              _os_log_debug_impl(&dword_20E5A6000, v49, OS_LOG_TYPE_DEBUG, "#D Back Super Wide Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            v50 = *((_QWORD *)this + 1);
            v51 = *(const void **)(v50 + 176);
            if (v51)
              v52 = _Block_copy(v51);
            else
              v52 = 0;
            v53 = *(NSObject **)(v50 + 184);
            *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
            *((_QWORD *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_110;
            if (v52)
              v54 = _Block_copy(v52);
            else
              v54 = 0;
            aBlock = v54;
            v96 = v48;
            dispatch_async(v53, &v92);
            if (aBlock)
              _Block_release(aBlock);
            if (v52)
              _Block_release(v52);
          }
        }
      }
      v55 = *((_QWORD *)this + 1);
      if (*(_QWORD *)(v55 + 192))
      {
        if (*(_QWORD *)(v55 + 200))
        {
          v56 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, CFSTR("BackCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          v57 = v56;
          if (v56)
          {
            v58 = CFBooleanGetValue(v56);
            v59 = v58 != 0;
            CFRelease(v57);
            v60 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v58 != 0;
              _os_log_debug_impl(&dword_20E5A6000, v60, OS_LOG_TYPE_DEBUG, "#D Back Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            v61 = *((_QWORD *)this + 1);
            v62 = *(const void **)(v61 + 192);
            if (v62)
              v63 = _Block_copy(v62);
            else
              v63 = 0;
            v64 = *(NSObject **)(v61 + 200);
            *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
            *((_QWORD *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_111;
            if (v63)
              v65 = _Block_copy(v63);
            else
              v65 = 0;
            aBlock = v65;
            v96 = v59;
            dispatch_async(v64, &v92);
            if (aBlock)
              _Block_release(aBlock);
            if (v63)
              _Block_release(v63);
          }
        }
      }
      v66 = *((_QWORD *)this + 1);
      if (*(_QWORD *)(v66 + 208) && *(_QWORD *)(v66 + 216))
      {
        v67 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v68 = IORegistryEntryCreateCFProperty(entry, CFSTR("BackCameraActive"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        v69 = v68;
        v70 = (const void **)MEMORY[0x24BDBD270];
        if (v68)
        {
          v71 = CFGetTypeID(v68);
          v73 = v71 == CFBooleanGetTypeID() && v69 == *v70;
          CFRelease(v69);
          v74 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v73;
            _os_log_debug_impl(&dword_20E5A6000, v74, OS_LOG_TYPE_DEBUG, "#D Back Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v73) = 0;
        }
        v75 = IORegistryEntryCreateCFProperty(entry, CFSTR("BackSuperWideCameraActive"), v67, 0);
        v76 = v75;
        if (v75)
        {
          v77 = CFGetTypeID(v75);
          v79 = v77 == CFBooleanGetTypeID() && v76 == *v70;
          CFRelease(v76);
          v80 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v79;
            _os_log_debug_impl(&dword_20E5A6000, v80, OS_LOG_TYPE_DEBUG, "#D Back Super Wide Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v79) = 0;
        }
        v81 = IORegistryEntryCreateCFProperty(entry, CFSTR("BackTeleCameraActive"), v67, 0);
        v82 = v81;
        if (v81)
        {
          v83 = CFGetTypeID(v81);
          v85 = v83 == CFBooleanGetTypeID() && v82 == *v70;
          CFRelease(v82);
          v86 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v85;
            _os_log_debug_impl(&dword_20E5A6000, v86, OS_LOG_TYPE_DEBUG, "#D Back Tele Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v85) = 0;
        }
        v87 = *((_QWORD *)this + 1);
        v88 = *(const void **)(v87 + 208);
        if (v88)
          v89 = _Block_copy(v88);
        else
          v89 = 0;
        v90 = *(NSObject **)(v87 + 216);
        *(_QWORD *)&v92 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v92 + 1) = 1174405120;
        v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_S4_S5_EEEvDpT__block_invoke;
        v94 = &__block_descriptor_tmp_112;
        if (v89)
          v91 = _Block_copy(v89);
        else
          v91 = 0;
        aBlock = v91;
        v96 = v73;
        v97 = v85;
        v98 = v79;
        dispatch_async(v90, &v92);
        if (aBlock)
          _Block_release(aBlock);
        if (v89)
          _Block_release(v89);
      }
    }
  }
  else
  {
    v15 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v92) = 136315138;
      *(_QWORD *)((char *)&v92 + 4) = "void ctu::iokit::Controller::cameraService(io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_ERROR, "%s: notificationPort is NULL", (uint8_t *)&v92, 0xCu);
    }
  }
}

void sub_20E5A81C8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ___ZZN3ctu5iokit15IOHIDController4initEvENK3__0clEv_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__shared_weak_count *v6;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  int IntegerValue;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;

  v6 = (std::__shared_weak_count *)a1[6];
  if (v6)
  {
    v9 = a1[4];
    v10 = std::__shared_weak_count::lock(v6);
    if (v10)
    {
      v11 = v10;
      if (a1[5] && !a3 && a5)
      {
        if (IOHIDEventGetType() == 14 && *(_QWORD *)(v9 + 40))
        {
          IOHIDEventGetIntegerValue();
          (*(void (**)(void))(*(_QWORD *)(v9 + 40) + 16))();
        }
        IntegerValue = IOHIDEventGetIntegerValue();
        if ((IOHIDEventGetIntegerValue() | (IntegerValue << 16)) == 0xFF090002 && *(_QWORD *)(v9 + 48))
        {
          v13 = IOHIDEventGetIntegerValue();
          (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(v9 + 48) + 16))(*(_QWORD *)(v9 + 48), v13 != 0);
        }
      }
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_20E5A83D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power9assertion14createInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEj_block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *size;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  char *v15;
  char **v16;
  char **v17;
  _QWORD *v18;
  char *v19;
  std::string *v20;
  uint64_t v21;
  std::string __p;
  std::__shared_weak_count *v23[2];
  uint64_t v24[2];
  unint64_t v25;

  v2 = *(_QWORD *)(a1 + 40);
  ctu::power::assertion::lookupInternal_sync(v2, *(void ***)(a1 + 48), (uint64_t *)&__p);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, (__int128 *)&__p);
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v4 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    ctu::power::assertion::HandleRaw::create(*(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56), (std::__shared_weak_count_vtbl **)&__p);
    std::shared_ptr<ctu::power::assertion::HandleRaw>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, (__int128 *)&__p);
    v6 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v7 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v9 = *(__int128 **)(a1 + 48);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*((char *)v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
    }
    else
    {
      v11 = *v9;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
    }
    v12 = *(std::__shared_weak_count **)(v10 + 48);
    v23[0] = *(std::__shared_weak_count **)(v10 + 40);
    v23[1] = v12;
    if (v12)
    {
      p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v14 = __ldxr(p_shared_weak_owners);
      while (__stxr(v14 + 1, p_shared_weak_owners));
    }
    v15 = *(char **)(v2 + 40);
    v16 = (char **)(v2 + 40);
    v17 = (char **)(v2 + 40);
    if (!v15)
      goto LABEL_27;
    v16 = (char **)(v2 + 40);
    while (1)
    {
      while (1)
      {
        v17 = (char **)v15;
        v18 = v15 + 32;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)v15 + 4) & 0x80) == 0)
          break;
        v15 = *v17;
        v16 = v17;
        if (!*v17)
          goto LABEL_27;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v18, (void **)&__p.__r_.__value_.__l.__data_) & 0x80) == 0)break;
      v16 = v17 + 1;
      v15 = v17[1];
      if (!v15)
        goto LABEL_27;
    }
    if (!*v16)
    {
LABEL_27:
      v25 = 0xAAAAAAAAAAAAAA00;
      v19 = (char *)operator new(0x48uLL);
      v24[0] = (uint64_t)v19;
      v24[1] = v2 + 40;
      v20 = (std::string *)(v19 + 32);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v20, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((_QWORD *)v19 + 6) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v19 + 56) = *(_OWORD *)v23;
      v23[0] = 0;
      v23[1] = 0;
      LOBYTE(v25) = 1;
      *(_QWORD *)v19 = 0;
      *((_QWORD *)v19 + 1) = 0;
      *((_QWORD *)v19 + 2) = v17;
      *v16 = v19;
      v21 = **(_QWORD **)(v2 + 32);
      if (v21)
      {
        *(_QWORD *)(v2 + 32) = v21;
        v19 = *v16;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 40), (uint64_t *)v19);
      ++*(_QWORD *)(v2 + 48);
      v24[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>>>>::reset[abi:ne180100](v24);
    }
    if (v23[1])
      std::__shared_weak_count::__release_weak(v23[1]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_20E5A8678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>>>>::reset[abi:ne180100](&a14);
  std::pair<std::string const,std::weak_ptr<ctu::power::assertion::HandleRaw>>::~pair((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::__on_zero_shared(uint64_t a1)
{
  IOPMAssertionID *v1;
  void *v2;

  v1 = *(IOPMAssertionID **)(a1 + 24);
  if (v1)
  {
    ctu::power::assertion::HandleRaw::~HandleRaw(v1);
    operator delete(v2);
  }
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void ctu::power::assertion::HandleRaw::~HandleRaw(IOPMAssertionID *this)
{
  IOPMAssertionID v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *this;
  if (*this)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v3 = this + 2;
      if (*((char *)this + 31) < 0)
        v3 = (_QWORD *)*v3;
      v4 = 136315138;
      v5 = v3;
      _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s - system activity completed", (uint8_t *)&v4, 0xCu);
      v2 = *this;
    }
    IOPMAssertionRelease(v2);
    *this = 0;
    this[8] = 0;
  }
  if (*((char *)this + 31) < 0)
    operator delete(*((void **)this + 1));
}

void sub_20E5A8830(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void ctu::power::assertion::HandleRaw::create(std::string::size_type a1@<X0>, unsigned int a2@<W1>, std::__shared_weak_count_vtbl **a3@<X8>)
{
  std::__shared_weak_count_vtbl *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  *a3 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a3[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v6 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
  LODWORD(v6->~__shared_weak_count) = 0;
  v6->__on_zero_shared = 0;
  v6->__get_deleter = 0;
  v6->~__shared_weak_count_0 = 0;
  LODWORD(v6->__on_zero_shared_weak) = 0;
  *a3 = v6;
  v7 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_24C96E858;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = v6;
  a3[1] = (std::__shared_weak_count_vtbl *)v7;
  if (!ctu::power::assertion::HandleRaw::init((uint64_t)v6, a1, a2))
  {
    *a3 = 0;
    a3[1] = 0;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_20E5A8914(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL ctu::power::assertion::HandleRaw::init(uint64_t a1, std::string::size_type a2, unsigned int a3)
{
  const __CFAllocator *v6;
  std::string::size_type v7;
  std::string::size_type v8;
  std::string::size_type v9;
  std::string::size_type v10;
  CFNumberRef v11;
  std::string::size_type v12;
  const void *v13;
  CFMutableArrayRef Mutable;
  std::string::size_type v15;
  __CFArray *v16;
  _BOOL8 v17;
  std::string::size_type v19;
  std::string::size_type v20;
  std::string __p;
  unint64_t v22;
  std::string::size_type v23;
  std::string v24;
  std::string::size_type v25;
  std::string::size_type v26;
  std::string valuePtr;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v24, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v24 = __p;
  v23 = 0;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&valuePtr, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  else
    valuePtr = v24;
  v25 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (ctu::cf::convert_copy())
  {
    v7 = v23;
    v23 = v25;
    v26 = v7;
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v26);
  }
  if (SHIBYTE(valuePtr.__r_.__value_.__r.__words[2]) < 0)
    operator delete(valuePtr.__r_.__value_.__l.__data_);
  v22 = v23;
  v23 = 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v23);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  LODWORD(v25) = 1;
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)a2);
  if (IOPMAssertionDeclareSystemActivity())
  {
    *(_DWORD *)(a1 + 32) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0)
        v8 = a2;
      else
        v8 = *(_QWORD *)a2;
      LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v8;
      _os_log_error_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s - Failed to declare system activity", (uint8_t *)&valuePtr, 0xCu);
    }
  }
  else
  {
    if ((_DWORD)v25 == 1)
    {
      *(_DWORD *)(a1 + 32) = 2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a2 + 23) >= 0)
          v9 = a2;
        else
          v9 = *(_QWORD *)a2;
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v9;
        _os_log_error_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s - Unable to revert sleep", (uint8_t *)&valuePtr, 0xCu);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 32) = 1;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(a2 + 23) >= 0)
          v10 = a2;
        else
          v10 = *(_QWORD *)a2;
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v10;
        _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s - Declared system activity to prevent sleep", (uint8_t *)&valuePtr, 0xCu);
      }
    }
    v24.__r_.__value_.__r.__words[0] = 0;
    valuePtr.__r_.__value_.__r.__words[0] = a3;
    v11 = CFNumberCreate(v6, kCFNumberLongLongType, &valuePtr);
    if (v11)
    {
      v12 = v24.__r_.__value_.__r.__words[0];
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
      valuePtr.__r_.__value_.__r.__words[0] = v12;
      ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    }
    v13 = (const void *)v24.__r_.__value_.__r.__words[0];
    v26 = v24.__r_.__value_.__r.__words[0];
    v24.__r_.__value_.__r.__words[0] = 0;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v24.__r_.__value_.__l.__data_);
    if (IOPMAssertionSetProperty(*(_DWORD *)a1, CFSTR("TimeoutSeconds"), v13))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a2 + 23) >= 0)
          v19 = a2;
        else
          v19 = *(_QWORD *)a2;
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v19;
        _os_log_error_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s - Unable to set timeout", (uint8_t *)&valuePtr, 0xCu);
      }
      IOPMAssertionRelease(*(_DWORD *)a1);
      *(_DWORD *)a1 = 0;
      *(_DWORD *)(a1 + 32) = 0;
    }
    v24.__r_.__value_.__r.__words[0] = 0;
    Mutable = CFArrayCreateMutable(v6, 0, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v15 = v24.__r_.__value_.__r.__words[0];
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)Mutable;
      valuePtr.__r_.__value_.__r.__words[0] = v15;
      ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    }
    v16 = (__CFArray *)v24.__r_.__value_.__r.__words[0];
    valuePtr.__r_.__value_.__r.__words[0] = (std::string::size_type)CFSTR("baseband");
    CFRetain(CFSTR("baseband"));
    CFArrayAppendValue(v16, CFSTR("baseband"));
    ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    if (IOPMAssertionSetProperty(*(_DWORD *)a1, CFSTR("ResourcesUsed"), v24.__r_.__value_.__l.__data_)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0)
        v20 = a2;
      else
        v20 = *(_QWORD *)a2;
      LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v20;
      _os_log_error_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s - Unable to set assertion resources", (uint8_t *)&valuePtr, 0xCu);
    }
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v24.__r_.__value_.__l.__data_);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v26);
  }
  v17 = *(_DWORD *)(a1 + 32) != 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v22);
  return v17;
}

void sub_20E5A8DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, const void *a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)(v25 - 64));
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&__p);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)(v25 - 72));
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a16);
  _Unwind_Resume(a1);
}

void ctu::power::assertion::lookupInternal_sync(uint64_t a1@<X0>, void **a2@<X1>, uint64_t *a3@<X8>)
{
  void **v4;
  _QWORD *v5;
  void **v7;
  char v8;
  _QWORD *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *size;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  std::string *p_p;
  std::string __p;
  uint8_t buf[4];
  std::string *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  v4 = (void **)(a1 + 40);
  v5 = *(_QWORD **)(a1 + 40);
  if (v5)
  {
    v7 = (void **)(a1 + 40);
    do
    {
      v8 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v5 + 4, a2);
      if (v8 >= 0)
        v9 = v5;
      else
        v9 = v5 + 1;
      if (v8 >= 0)
        v7 = (void **)v5;
      v5 = (_QWORD *)*v9;
    }
    while (*v9);
    if (v7 != v4
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v7 + 4) & 0x80) == 0)
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
      v10 = (std::__shared_weak_count *)v7[8];
      if (v10)
      {
        __p.__r_.__value_.__l.__size_ = (std::string::size_type)std::__shared_weak_count::lock(v10);
        if (__p.__r_.__value_.__l.__size_)
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v7[7];
      }
      std::shared_ptr<ctu::power::assertion::HandleRaw>::operator=[abi:ne180100]((uint64_t)a3, (__int128 *)&__p);
      size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_)
      {
        v12 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
          std::__shared_weak_count::__release_weak(size);
        }
      }
      v14 = *a3;
      if (*a3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(v14 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v14 + 8), *(_QWORD *)(v14 + 16));
        }
        else
        {
          v15 = *(_OWORD *)(v14 + 8);
          __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v14 + 24);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v15;
        }
        p_p = &__p;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        *(_DWORD *)buf = 136315138;
        v19 = p_p;
        _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s - System activity already declared", buf, 0xCu);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_20E5A9040(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ctu::power::assertion::createInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD v13[7];
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __n128 (*v18)(uint64_t, uint64_t);
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  _QWORD block[6];

  v15 = 0;
  v16 = &v15;
  v17 = 0x3802000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v21 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = ___ZN3ctu5power9assertion14createInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEj_block_invoke;
  v13[3] = &__block_descriptor_tmp_7;
  v13[4] = &v15;
  v13[5] = a1;
  v13[6] = a2;
  v14 = a3;
  v22 = v13;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_5power9assertionEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_9;
  block[4] = a1;
  block[5] = &v22;
  v6 = a1 + 16;
  v5 = *(NSObject **)(a1 + 16);
  if (*(_QWORD *)(v6 + 8))
    dispatch_async_and_wait(v5, block);
  else
    dispatch_sync(v5, block);
  v7 = v16[6];
  *a4 = v16[5];
  a4[1] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  _Block_object_dispose(&v15, 8);
  v10 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t IOMikeyBusDeviceOpen(io_service_t a1, task_port_t a2, io_connect_t *connect)
{
  return IOServiceOpen(a1, a2, 0, connect);
}

uint64_t IOMikeyBusDeviceOpenWithBulk(io_service_t a1, task_port_t a2, int a3, io_connect_t *a4)
{
  return IOServiceOpen(a1, a2, a3 | 0x100, a4);
}

uint64_t IOMikeyBusDeviceAllocateTrafficChannel(mach_port_t a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  unint64_t v5;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  HIDWORD(v5) = a4;
  LODWORD(v5) = a4;
  input[2] = (int)(v5 >> 16);
  input[3] = a5;
  return IOConnectCallScalarMethod(a1, 5u, input, 4u, 0, 0);
}

uint64_t IOMikeyBusDeviceDeallocateTrafficChannel(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 6u, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusDeviceSpecifyChannelAssignment(mach_port_t a1, void *inputStruct)
{
  size_t v2;

  if (inputStruct)
    v2 = 159;
  else
    v2 = 0;
  return IOConnectCallStructMethod(a1, 7u, inputStruct, v2, 0, 0);
}

uint64_t IOMikeyBusDeviceSetFixedSlotAssignment(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0xBu, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusDeviceRegisterSystemLineOut()
{
  mach_port_t v0;
  uint32_t v1;
  unsigned int v2;
  int *v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  unint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v0 = MEMORY[0x24BDAC7A8]();
  v5 = (char *)v13 - v4;
  *(_QWORD *)v5 = v6;
  *((_QWORD *)v5 + 1) = v7;
  if (v2)
  {
    v8 = v2;
    v9 = v5 + 16;
    do
    {
      v10 = *v3++;
      HIDWORD(v11) = v10;
      LODWORD(v11) = v10;
      *v9++ = (int)(v11 >> 16);
      --v8;
    }
    while (v8);
  }
  return IOConnectCallScalarMethod(v0, 8u, (const uint64_t *)v5, v1, 0, 0);
}

uint64_t IOMikeyBusDeviceUnregisterSystemLineOut(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 9u, 0, 0, 0, 0);
}

uint64_t IOMikeyBusDeviceGetAddress(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceAddress"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetVendorID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("VendorID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

CFTypeRef IOMikeyBusDeviceCopyVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("VendorName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t IOMikeyBusDeviceGetProductID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("ProductID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

CFTypeRef IOMikeyBusDeviceCopyProductName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("ProductName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("ModelNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("HardwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("FirmwareRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("SerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t IOMikeyBusDeviceGetVoltageClass(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("VoltageClass"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetMikeyBusVersion(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("MikeyBusVersion"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipVendorID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("InterfaceChipVendorID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipProductID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("InterfaceChipProductID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipRevision(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("InterfaceChipRevision"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

const __CFNumber *IOMikeyBusDeviceGetInterfaceChipSerialNumber(io_registry_entry_t a1)
{
  const __CFNumber *result;
  const __CFNumber *v2;
  uint64_t valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("InterfaceChipSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (result)
  {
    v2 = result;
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOMikeyBusDeviceGetNumConfigurations(io_registry_entry_t a1)
{
  const __CFArray *CFProperty;
  const __CFArray *v2;
  unsigned __int8 Count;

  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("Configurations"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    Count = CFArrayGetCount(CFProperty);
    CFRelease(v2);
  }
  else
  {
    return 0;
  }
  return Count;
}

uint64_t IOMikeyBusDeviceGetActiveConfiguration(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("ConfigurationNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetActiveConfigurationClass(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("ConfigurationClass"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetActiveConfigurationSubclass(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("ConfigurationSubclass"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetConfigurationInfo(io_registry_entry_t a1, int a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t v4;
  const __CFArray *CFProperty;
  const __CFArray *v9;
  const __CFArray *ValueAtIndex;
  const __CFArray *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  BOOL v14;
  const __CFNumber *v15;
  int valuePtr;

  v4 = 3758097136;
  if (!a2)
    return 3758097090;
  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, CFSTR("Configurations"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v9 = CFProperty;
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(CFProperty, (a2 - 1));
    if (ValueAtIndex)
    {
      v11 = ValueAtIndex;
      v12 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      v13 = (const __CFNumber *)CFArrayGetValueAtIndex(v11, 1);
      if (v12)
        v14 = v13 == 0;
      else
        v14 = 1;
      if (!v14)
      {
        v15 = v13;
        valuePtr = 0;
        CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
        *a3 = valuePtr;
        CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
        v4 = 0;
        *a4 = valuePtr;
      }
    }
    CFRelease(v9);
  }
  return v4;
}

uint64_t IOMikeyBusDeviceSetConfiguration(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, v3, 1u, 0, 0);
}

__CFDictionary *IOMikeyBusFunctionGroupCreateMatching(int a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFNumberRef v4;
  int valuePtr;

  v2 = IOServiceMatching("IOMikeyBusFunctionGroup");
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  valuePtr = a1;
  v4 = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v2, CFSTR("IOMikeyBusMatchFunctionGroupType"), v4);
  CFRelease(v4);
  return v2;
}

uint64_t IOMikeyBusFunctionGroupOpen(io_service_t a1, task_port_t a2, io_connect_t *connect)
{
  return IOServiceOpen(a1, a2, 0, connect);
}

uint64_t IOMikeyBusFunctionGroupGetDevice(io_registry_entry_t a1)
{
  io_registry_entry_t parent;

  parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOService", &parent))
    return 0;
  else
    return parent;
}

CFTypeRef IOMikeyBusFunctionGroupCopyPropertyInfo(io_registry_entry_t a1, unsigned int a2)
{
  const __CFAllocator *v3;
  const __CFString *v4;
  CFTypeRef CFProperty;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("FunctionGroupProperty%02x"), a2);
  CFProperty = IORegistryEntryCreateCFProperty(a1, v4, v3, 0);
  CFRelease(v4);
  return CFProperty;
}

uint64_t IOMikeyBusFunctionGroupSetPropertyInfo(mach_port_t a1, unsigned int a2, CFDataRef theData, uint64_t a4)
{
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a4;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  return IOConnectCallMethod(a1, 5u, input, 2u, BytePtr, Length, 0, 0, 0, 0);
}

uint64_t IOMikeyBusFunctionGroupGetID(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("FunctionGroupID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusFunctionGroupGetType(io_registry_entry_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  int valuePtr;

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, CFSTR("FunctionGroupType"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusBulkPipeSendData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, uint64_t a4)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  return IOConnectCallMethod(a1, 0, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReceiveData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt, uint64_t a4)
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a4;
  return IOConnectCallMethod(a1, 1u, input, 1u, 0, 0, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOMikeyBusBulkPipeEnable(mach_port_t a1, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 2u, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusBulkPipeSendAsync(mach_port_t a1, const void *a2, size_t a3, IONotificationPortRef notify, uint64_t a5, unint64_t a6, uint64_t a7)
{
  mach_port_t MachPort;
  uint64_t reference[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a7;
  reference[0] = 0;
  v14 = 0u;
  v15 = 0u;
  reference[1] = a5;
  v13 = a6;
  MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 0, MachPort, reference, 3u, input, 1u, a2, a3, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReceiveDataAsync(mach_port_t a1, uint64_t a2, uint64_t a3, IONotificationPortRef notify, uint64_t a5, unint64_t a6, uint64_t a7)
{
  mach_port_t MachPort;
  uint64_t reference[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a7;
  input[1] = a2;
  input[2] = a3;
  reference[0] = 0;
  v12 = 0u;
  v13 = 0u;
  reference[1] = a5;
  v11 = a6;
  MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 1u, MachPort, reference, 3u, input, 3u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReset(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 4u, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeSetAllocation(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 3u, input, 2u, 0, 0);
}

uint64_t ctu::power::assertion::HandleRaw::HandleRaw(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

ctu::power::assertion *ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;

  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v3 = dispatch_queue_create("TelephonyPowerAssertion", v2);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = v3;
  if (v3)
  {
    v4 = v3;
    dispatch_retain(v3);
    *((_QWORD *)this + 3) = 0;
    dispatch_release(v4);
  }
  else
  {
    *((_QWORD *)this + 3) = 0;
  }
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 4) = (char *)this + 40;
  return this;
}

uint64_t std::shared_ptr<ctu::power::assertion::HandleRaw>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

void ctu::power::assertion::lookupInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD *v20;
  _QWORD block[6];

  v13 = 0;
  v14 = &v13;
  v15 = 0x3802000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = ___ZN3ctu5power9assertion14lookupInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
  v12[3] = &__block_descriptor_tmp;
  v12[4] = &v13;
  v12[5] = a1;
  v12[6] = a2;
  v20 = v12;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_5power9assertionEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_9;
  block[4] = a1;
  block[5] = &v20;
  v5 = a1 + 16;
  v4 = *(NSObject **)(a1 + 16);
  if (*(_QWORD *)(v5 + 8))
    dispatch_async_and_wait(v4, block);
  else
    dispatch_sync(v4, block);
  v6 = v14[6];
  *a3 = v14[5];
  a3[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  _Block_object_dispose(&v13, 8);
  v9 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose_(uint64_t a1)
{
  return std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 40);
}

void ___ZN3ctu5power9assertion14lookupInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  __int128 v5;

  ctu::power::assertion::lookupInternal_sync(*(_QWORD *)(a1 + 40), *(void ***)(a1 + 48), (uint64_t *)&v5);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, &v5);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v5 + 1);
  if (*((_QWORD *)&v5 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t std::pair<std::string const,std::weak_ptr<ctu::power::assertion::HandleRaw>>::~pair(uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (v5)
  {
    v6 = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
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
  __cxa_throw(exception, (struct type_info *)off_24C96E520, MEMORY[0x24BEDAAF0]);
}

void sub_20E5AA5D4(_Unwind_Exception *a1)
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

uint64_t std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>>>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((_BYTE *)a1 + 16))
    {
      v2 = *(std::__shared_weak_count **)(v1 + 64);
      if (v2)
        std::__shared_weak_count::__release_weak(v2);
      if (*(char *)(v1 + 55) < 0)
        operator delete(*(void **)(v1 + 32));
    }
    operator delete((void *)v1);
  }
}

uint64_t __cxx_global_var_init()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::power::assertion,ctu::power::assertion,ctu::PthreadMutexGuardPolicy<ctu::power::assertion>>::sInstance, &dword_20E5A6000);
  }
  return result;
}

const char *ctu::iokit::asString(unsigned int a1)
{
  if (a1 > 4)
    return "???";
  else
    return off_24C96ECE8[a1];
}

uint64_t ctu::iokit::asString@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x212BBF8B4](a2, v4, " | ");
}

{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x212BBF8B4](a2, v4, " | ");
}

{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x212BBF8B4](a2, v4, " | ");
}

void sub_20E5AAAC8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E5AABAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E5AADB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

ctu::iokit *ctu::iokit::Controller::Controller(ctu::iokit *a1, uint64_t a2, uint64_t a3)
{
  char *v5;
  _BYTE v7[8];

  ctu::iokit::sCreateOsLogContext(a1);
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger(a1, (const ctu::OsLogLogger *)v7);
  MEMORY[0x212BBF884](v7);
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  v5 = (char *)operator new(0x160uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = off_24C96E9F0;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 216) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(_OWORD *)(v5 + 248) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 264) = 0u;
  *(_OWORD *)(v5 + 280) = 0u;
  *(_OWORD *)(v5 + 296) = 0u;
  *(_OWORD *)(v5 + 312) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *((_QWORD *)v5 + 9) = v5 + 72;
  *((_QWORD *)v5 + 10) = v5 + 72;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *((_QWORD *)v5 + 16) = 0;
  *((_QWORD *)v5 + 17) = 0;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 216) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 17) = 0u;
  *((_QWORD *)v5 + 36) = 0;
  *((_QWORD *)v5 + 39) = 0;
  *((_QWORD *)v5 + 38) = 0;
  *((_QWORD *)v5 + 42) = 0;
  *((_QWORD *)v5 + 43) = 0;
  *((_QWORD *)v5 + 41) = 0;
  *((_QWORD *)a1 + 1) = v5 + 24;
  *((_QWORD *)a1 + 2) = v5;
  *((_QWORD *)v5 + 5) = a3;
  return a1;
}

void sub_20E5AAEE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v2);
  MEMORY[0x212BBF884](v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::Controller::~Controller(ctu::iokit::Controller *this)
{
  ctu::iokit::Controller::release(this);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  JUMPOUT(0x212BBF884);
}

uint64_t ctu::iokit::Controller::release(ctu::iokit::Controller *this)
{
  uint64_t v2;
  __CFRunLoopSource *v3;
  __CFRunLoop *v4;
  NSObject *v5;
  NSObject *v6;
  __CFRunLoop *v7;
  const void *v8;
  uint64_t v9;
  io_object_t v10;
  io_object_t v11;
  io_object_t v12;
  io_object_t v13;
  io_object_t v14;
  uint64_t v15;
  uint64_t v16;
  io_object_t v17;
  uint64_t result;
  _QWORD block[4];
  dispatch_group_t group;

  ctu::iokit::Controller::stopPowerSourceNotifications(this);
  ctu::iokit::Controller::stopBatteryInfoNotifications(this);
  ctu::iokit::Controller::stopDisplayCoverStateNotifications(this);
  v2 = *((_QWORD *)this + 1);
  v3 = *(__CFRunLoopSource **)(v2 + 8);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    v2 = *((_QWORD *)this + 1);
    *(_QWORD *)(v2 + 8) = 0;
  }
  v4 = *(__CFRunLoop **)(v2 + 16);
  if (v4 && CFRunLoopIsWaiting(v4))
  {
    v5 = dispatch_group_create();
    v6 = v5;
    if (v5)
    {
      dispatch_retain(v5);
      dispatch_group_enter(v6);
    }
    v7 = *(__CFRunLoop **)(*((_QWORD *)this + 1) + 16);
    v8 = (const void *)*MEMORY[0x24BDBD5A0];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN3ctu5iokit10Controller7releaseEv_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    group = v6;
    if (v6)
    {
      dispatch_retain(v6);
      dispatch_group_enter(v6);
    }
    CFRunLoopPerformBlock(v7, v8, block);
    if (group)
    {
      dispatch_group_leave(group);
      if (group)
        dispatch_release(group);
    }
    if (v6)
    {
      dispatch_group_leave(v6);
      dispatch_release(v6);
    }
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*((_QWORD *)this + 1) + 16));
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    *(_QWORD *)(*((_QWORD *)this + 1) + 16) = 0;
    if (v6)
      dispatch_release(v6);
  }
  v9 = *((_QWORD *)this + 1);
  if (*(_QWORD *)v9)
  {
    IONotificationPortDestroy(*(IONotificationPortRef *)v9);
    v9 = *((_QWORD *)this + 1);
    *(_QWORD *)v9 = 0;
  }
  v10 = *(_DWORD *)(v9 + 28);
  if (v10)
  {
    IOObjectRelease(v10);
    v9 = *((_QWORD *)this + 1);
    *(_DWORD *)(v9 + 28) = 0;
  }
  v11 = *(_DWORD *)(v9 + 24);
  if (v11)
  {
    IOObjectRelease(v11);
    v9 = *((_QWORD *)this + 1);
    *(_DWORD *)(v9 + 24) = 0;
  }
  v12 = *(_DWORD *)(v9 + 28);
  if (v12)
  {
    IOObjectRelease(v12);
    v9 = *((_QWORD *)this + 1);
    *(_DWORD *)(v9 + 28) = 0;
  }
  v13 = *(_DWORD *)(v9 + 228);
  if (v13)
  {
    IOObjectRelease(v13);
    v9 = *((_QWORD *)this + 1);
    *(_DWORD *)(v9 + 228) = 0;
  }
  v14 = *(_DWORD *)(v9 + 224);
  if (v14)
  {
    IOObjectRelease(v14);
    v9 = *((_QWORD *)this + 1);
    *(_DWORD *)(v9 + 224) = 0;
  }
  if (*(_QWORD *)(v9 + 64))
  {
    v15 = v9 + 48;
    v16 = *(_QWORD *)(v9 + 56);
    if (v16 != v9 + 48)
    {
      do
      {
        v17 = *(_DWORD *)(v16 + 16);
        if (v17)
          IOObjectRelease(v17);
        v16 = *(_QWORD *)(v16 + 8);
      }
      while (v16 != v15);
      v9 = *((_QWORD *)this + 1);
    }
    std::__list_imp<unsigned int>::clear((_QWORD *)(v9 + 48));
    v9 = *((_QWORD *)this + 1);
  }
  result = *(unsigned int *)(v9 + 96);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(*((_QWORD *)this + 1) + 96) = 0;
  }
  return result;
}

void sub_20E5AB154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  NSObject *v14;

  if (v14)
    dispatch_release(v14);
  _Unwind_Resume(exception_object);
}

void ctu::iokit::Controller::init(ctu::iokit::Controller *this)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  IONotificationPort *v15;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  const void *v22;
  NSObject *v23;
  uint64_t v24;
  const void *v25;
  NSObject *v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  const void *v30;
  NSObject *v31;
  __int16 v32;
  uint8_t buf[2];

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  v2[3] = 0;
  v2[28] = 0;
  *v2 = 0;
  v2[1] = 0;
  std::__list_imp<unsigned int>::clear(v2 + 6);
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  v5 = v3[9];
  v4 = v3[10];
  v6 = v3;
  if (v4 != v5)
  {
    do
    {
      v4 -= 16;
      std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v4);
    }
    while (v4 != v5);
    v6 = (_QWORD *)*((_QWORD *)this + 1);
  }
  v3[10] = v5;
  v7 = (char *)v6[9];
  if (v6[11] - (_QWORD)v7 <= 0xBFuLL)
  {
    v8 = (char *)v6[10];
    v9 = (char *)operator new(0xC0uLL);
    v10 = v9 + 192;
    v11 = &v9[v8 - v7];
    if (v8 == v7)
    {
      v6[9] = v11;
      v6[10] = v11;
      v6[11] = v10;
    }
    else
    {
      v12 = &v9[v8 - v7];
      do
      {
        v13 = *((_OWORD *)v8 - 1);
        v8 -= 16;
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 16;
        *(_QWORD *)v8 = 0;
        *((_QWORD *)v8 + 1) = 0;
      }
      while (v8 != v7);
      v7 = (char *)v6[9];
      v14 = v6[10];
      v6[9] = v12;
      v6[10] = v11;
      v6[11] = v10;
      while ((char *)v14 != v7)
      {
        v14 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v14);
      }
    }
    if (v7)
      operator delete(v7);
  }
  *(_DWORD *)(*((_QWORD *)this + 1) + 96) = 0;
  v15 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  **((_QWORD **)this + 1) = v15;
  if (!v15)
  {
    v18 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v32 = 0;
    v19 = "Could not create notification port";
    v20 = (uint8_t *)&v32;
    goto LABEL_36;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v15);
  v17 = *((_QWORD *)this + 1);
  *(_QWORD *)(v17 + 8) = RunLoopSource;
  if (RunLoopSource)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v17 + 16), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    goto LABEL_20;
  }
  v18 = *(NSObject **)this;
  if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Could not create run loop source";
    v20 = buf;
LABEL_36:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
  }
LABEL_20:
  v21 = *((_QWORD *)this + 1);
  *(_DWORD *)(v21 + 272) = -1;
  v22 = *(const void **)(v21 + 248);
  *(_QWORD *)(v21 + 248) = 0;
  if (v22)
    _Block_release(v22);
  v23 = *(NSObject **)(v21 + 256);
  *(_QWORD *)(v21 + 256) = 0;
  if (v23)
    dispatch_release(v23);
  v24 = *((_QWORD *)this + 1);
  *(_DWORD *)(v24 + 276) = -1;
  v25 = *(const void **)(v24 + 280);
  *(_QWORD *)(v24 + 280) = 0;
  if (v25)
    _Block_release(v25);
  v26 = *(NSObject **)(v24 + 288);
  *(_QWORD *)(v24 + 288) = 0;
  if (v26)
    dispatch_release(v26);
  v27 = *((_QWORD *)this + 1);
  v28 = *(const void **)(v27 + 304);
  *(_QWORD *)(v27 + 296) = 0;
  *(_QWORD *)(v27 + 304) = 0;
  if (v28)
    _Block_release(v28);
  v29 = *((_QWORD *)this + 1);
  v30 = *(const void **)(v29 + 312);
  *(_QWORD *)(v29 + 312) = 0;
  if (v30)
    _Block_release(v30);
  v31 = *(NSObject **)(v29 + 320);
  *(_QWORD *)(v29 + 320) = 0;
  if (v31)
    dispatch_release(v31);
}

void ctu::iokit::Controller::stopPowerSourceNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2;
  int v3;
  const void *v4;
  NSObject *v5;

  v2 = *((_QWORD *)this + 1);
  v3 = *(_DWORD *)(v2 + 272);
  if (v3 != -1)
  {
    notify_cancel(v3);
    v2 = *((_QWORD *)this + 1);
    *(_DWORD *)(v2 + 272) = -1;
  }
  v4 = *(const void **)(v2 + 248);
  *(_QWORD *)(v2 + 248) = 0;
  if (v4)
    _Block_release(v4);
  v5 = *(NSObject **)(v2 + 256);
  *(_QWORD *)(v2 + 256) = 0;
  if (v5)
    dispatch_release(v5);
}

void ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2;
  int v3;
  const void *v4;
  NSObject *v5;

  v2 = *((_QWORD *)this + 1);
  v3 = *(_DWORD *)(v2 + 276);
  if (v3 != -1)
  {
    notify_cancel(v3);
    v2 = *((_QWORD *)this + 1);
    *(_DWORD *)(v2 + 276) = -1;
  }
  v4 = *(const void **)(v2 + 280);
  *(_QWORD *)(v2 + 280) = 0;
  if (v4)
    _Block_release(v4);
  v5 = *(NSObject **)(v2 + 288);
  *(_QWORD *)(v2 + 288) = 0;
  if (v5)
    dispatch_release(v5);
}

void ctu::iokit::Controller::stopDisplayCoverStateNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;

  v2 = *((_QWORD *)this + 1);
  v3 = *(_QWORD *)(v2 + 296);
  if (v3)
  {
    v4 = *(NSObject **)(v2 + 320);
    if (v4)
      dispatch_retain(*(dispatch_object_t *)(v2 + 320));
    MEMORY[0x212BBF6B0](v3, v4);
    if (v4)
      dispatch_release(v4);
    IOHIDEventSystemClientUnregisterEventBlock();
    CFRelease(*(CFTypeRef *)(*((_QWORD *)this + 1) + 296));
    v2 = *((_QWORD *)this + 1);
    *(_QWORD *)(v2 + 296) = 0;
  }
  v5 = *(const void **)(v2 + 304);
  *(_QWORD *)(v2 + 304) = 0;
  if (v5)
    _Block_release(v5);
  v6 = *((_QWORD *)this + 1);
  v7 = *(const void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = 0;
  if (v7)
    _Block_release(v7);
  v8 = *(NSObject **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = 0;
  if (v8)
    dispatch_release(v8);
}

void sub_20E5AB5A0(_Unwind_Exception *exception_object)
{
  NSObject *v1;

  if (v1)
    dispatch_release(v1);
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = *(NSObject **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_group_enter(v4);
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
}

uint64_t ctu::iokit::Controller::cleanUpDisplayNotifcation(ctu::iokit::Controller *this)
{
  uint64_t result;

  result = *(unsigned int *)(*((_QWORD *)this + 1) + 28);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(*((_QWORD *)this + 1) + 28) = 0;
  }
  return result;
}

void ctu::iokit::Controller::create(uint64_t a1@<X0>, uint64_t a2@<X1>, ctu::iokit::Controller **a3@<X8>)
{
  ctu::iokit *v6;
  uint64_t v7;
  ctu::iokit::Controller *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  ctu::iokit::Controller *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;

  *a3 = 0;
  a3[1] = 0;
  v6 = (ctu::iokit *)operator new(0x18uLL);
  v8 = v6;
  v9 = *(std::__shared_weak_count **)(a1 + 8);
  v15 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  ctu::iokit::Controller::Controller(v6, v7, a2);
  v12 = (ctu::iokit::Controller *)operator new(0x20uLL);
  *(_QWORD *)v12 = off_24C96EA40;
  *((_QWORD *)v12 + 1) = 0;
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = v8;
  *a3 = v8;
  a3[1] = v12;
  if (!v15)
    goto LABEL_10;
  v13 = (unint64_t *)&v15->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  v8 = *a3;
  if (*a3)
LABEL_10:
    ctu::iokit::Controller::init(v8);
}

void sub_20E5AB740(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL ctu::iokit::Controller::registerForIOKitService(ctu::iokit::Controller *this, io_service_t service, IOServiceInterestCallback callback, io_object_t *notification)
{
  uint64_t v5;
  IONotificationPort *v6;
  io_object_t v10;
  NSObject *v11;
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  _BOOL8 result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = *((_QWORD *)this + 1);
  v6 = *(IONotificationPort **)v5;
  if (!*(_QWORD *)v5)
  {
    v19 = *(NSObject **)this;
    result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    LOWORD(v20[0]) = 0;
    v16 = "Notification port was not successfully created";
LABEL_14:
    v17 = v19;
    v18 = 2;
LABEL_15:
    _os_log_error_impl(&dword_20E5A6000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v20, v18);
    return 0;
  }
  if (!*(_QWORD *)(v5 + 8))
  {
    v19 = *(NSObject **)this;
    result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    LOWORD(v20[0]) = 0;
    v16 = "Run Loop Source was not successfully created";
    goto LABEL_14;
  }
  v10 = *notification;
  if (*notification)
  {
    v11 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_DEFAULT, "#I Since notification is already allocated, releasing the previous one.", (uint8_t *)v20, 2u);
      v10 = *notification;
    }
    IOObjectRelease(v10);
    *notification = 0;
    v6 = (IONotificationPort *)**((_QWORD **)this + 1);
  }
  v12 = IOServiceAddInterestNotification(v6, service, "IOBusyInterest", callback, this, notification);
  if (v12)
  {
    v13 = v12;
    v14 = *(NSObject **)this;
    result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    v20[0] = 67109120;
    v20[1] = v13;
    v16 = "Could not add interest notification on service. Error: %#x";
    v17 = v14;
    v18 = 8;
    goto LABEL_15;
  }
  return 1;
}

BOOL ctu::iokit::Controller::setDisplayCallback(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;
  IONotificationPort *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  _BOOL8 result;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  os_log_t v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 8);
  if (!*v3)
  {
    v16 = *(os_log_t *)a1;
    result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    LOWORD(v17) = 0;
    v13 = "notificationPort is NULL";
LABEL_18:
    v14 = v16;
    v15 = 2;
LABEL_19:
    _os_log_error_impl(&dword_20E5A6000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    return 0;
  }
  if (!v3[2])
  {
    v16 = *(os_log_t *)a1;
    result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    LOWORD(v17) = 0;
    v13 = "runLoop is NULL";
    goto LABEL_18;
  }
  v5 = *(void **)a2;
  if (*(_QWORD *)a2)
    v5 = _Block_copy(v5);
  v6 = (const void *)v3[4];
  v3[4] = v5;
  if (v6)
    _Block_release(v6);
  v7 = *(NSObject **)(a2 + 8);
  if (v7)
    dispatch_retain(v7);
  v8 = v3[5];
  v3[5] = v7;
  if (v8)
    dispatch_release(v8);
  v9 = **(IONotificationPort ***)(a1 + 8);
  v10 = IOServiceMatching("IOAVVideoInterface");
  if (IOServiceAddMatchingNotification(v9, "IOServicePublish", v10, (IOServiceMatchingCallback)ctu::iokit::sControllerDisplayServiceAdded, (void *)a1, (io_iterator_t *)(*(_QWORD *)(a1 + 8) + 24)))
  {
    v11 = *(NSObject **)a1;
    result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    v17 = 136315138;
    v18 = "TelephonyIOKitDisplayController";
    v13 = "%s: Registering Publish Notification failed";
    v14 = v11;
    v15 = 12;
    goto LABEL_19;
  }
  ctu::iokit::Controller::displayServiceAdded((ctu::iokit::Controller *)a1, *(_DWORD *)(*(_QWORD *)(a1 + 8) + 24));
  return 1;
}

void sub_20E5ABB0C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ctu::iokit::sControllerDisplayServiceAdded(ctu::iokit *this, void *a2)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    ctu::iokit::Controller::displayServiceAdded(this, (io_iterator_t)a2);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    v2 = qword_253D0AEE8;
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
    {
      v3 = 136315138;
      v4 = "void ctu::iokit::sControllerDisplayServiceAdded(void *, io_iterator_t)";
      _os_log_error_impl(&dword_20E5A6000, v2, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t ctu::iokit::Controller::acquireMesaService(ctu::iokit::Controller *this)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t buf[16];
  uint8_t v13[2];

  v2 = *((_QWORD *)this + 1);
  if (!*(_QWORD *)v2)
  {
    v4 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)v13 = 0;
    v9 = "notificationPort is NULL";
    v10 = v13;
LABEL_13:
    _os_log_error_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    return 0;
  }
  if (!*(_DWORD *)(v2 + 96))
  {
    v5 = *MEMORY[0x24BDD8B18];
    v6 = IOServiceMatching("AppleMesaSEPDriver");
    MatchingService = IOServiceGetMatchingService(v5, v6);
    *(_DWORD *)(*((_QWORD *)this + 1) + 96) = MatchingService;
    if (MatchingService)
      return 1;
    v4 = *(NSObject **)this;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 0;
    v11 = 0;
    v9 = "Failed to get mesaService";
    v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  v3 = 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "We already matched in - No need to do it again", buf, 2u);
  }
  return v3;
}

BOOL ctu::iokit::Controller::setMesaQuality(uint64_t a1, int a2)
{
  uint64_t v3;
  CFNumberRef v4;
  CFNumberRef v5;
  kern_return_t v6;
  NSObject *v7;
  _BOOL8 result;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  int valuePtr;
  uint8_t buf[4];
  kern_return_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v3 = *(_QWORD *)(a1 + 8);
  if (!*(_QWORD *)v3)
  {
    v12 = *(NSObject **)a1;
    result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v9 = "notificationPort is NULL";
LABEL_13:
    v10 = v12;
    v11 = 2;
LABEL_14:
    _os_log_error_impl(&dword_20E5A6000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  if (!*(_DWORD *)(v3 + 96))
  {
    v12 = *(NSObject **)a1;
    result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v9 = "mesaService is NULL";
    goto LABEL_13;
  }
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v4)
  {
    v12 = *(NSObject **)a1;
    result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v9 = "Failed to convert input to MESA signal quality setting";
    goto LABEL_13;
  }
  v5 = v4;
  v6 = IORegistryEntrySetCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 8) + 96), CFSTR("SignalQuality"), v4);
  CFRelease(v5);
  if (v6)
  {
    v7 = *(NSObject **)a1;
    result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 67109120;
    v15 = v6;
    v9 = "Failed to change the MESA quality setting. Error: %#x";
    v10 = v7;
    v11 = 8;
    goto LABEL_14;
  }
  return 1;
}

BOOL ctu::iokit::Controller::setMesaCallback(void *refCon, uint64_t a2)
{
  uint64_t v3;
  const void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  kern_return_t v9;
  _BOOL8 v10;
  NSObject *v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  int v18;
  io_object_t notification;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)refCon + 1);
  if (!*(_QWORD *)v3)
  {
    v15 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "notificationPort is NULL";
      goto LABEL_27;
    }
    return 0;
  }
  if (!*(_QWORD *)(v3 + 16) || !*(_DWORD *)(v3 + 96))
  {
    v15 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "runLoop/mesaService is NULL";
LABEL_27:
      _os_log_error_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      return 0;
    }
    return 0;
  }
  v5 = *(const void **)(v3 + 104);
  if (v5 && *(_QWORD *)(v3 + 112))
    return 0;
  v6 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    v6 = _Block_copy(*(const void **)a2);
    v5 = *(const void **)(v3 + 104);
  }
  *(_QWORD *)(v3 + 104) = v6;
  if (v5)
    _Block_release(v5);
  v7 = *(NSObject **)(a2 + 8);
  if (v7)
    dispatch_retain(v7);
  v8 = *(NSObject **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v7;
  if (v8)
    dispatch_release(v8);
  notification = 0;
  v9 = IOServiceAddInterestNotification(**((IONotificationPortRef **)refCon + 1), *(_DWORD *)(*((_QWORD *)refCon + 1) + 96), "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sMesaCallbackInternal, refCon, &notification);
  v10 = v9 == 0;
  if (v9)
  {
    v11 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_DWORD *)(*((_QWORD *)refCon + 1) + 96);
      *(_DWORD *)buf = 67109120;
      v21 = v18;
      _os_log_error_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_ERROR, "Failed to register MESA notifications on instance 0x%u", buf, 8u);
    }
    v12 = *((_QWORD *)refCon + 1);
    v13 = *(const void **)(v12 + 104);
    *(_QWORD *)(v12 + 104) = 0;
    if (v13)
      _Block_release(v13);
    v14 = *(NSObject **)(v12 + 112);
    *(_QWORD *)(v12 + 112) = 0;
    if (v14)
      dispatch_release(v14);
  }
  return v10;
}

void sub_20E5AC0B4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ctu::iokit::sMesaCallbackInternal(os_log_t *this, void *a2, int a3, void *a4, void *a5)
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    ctu::iokit::Controller::mesaService(this, (io_registry_entry_t)a2, a3, a4);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    v5 = qword_253D0AEE8;
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "void ctu::iokit::sMesaCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_20E5A6000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t ctu::iokit::Controller::setupCameraService(ctu::iokit::Controller *this)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  mach_port_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  NSObject *v8;
  const __CFDictionary *v9;
  io_service_t v10;
  NSObject *v11;
  const __CFDictionary *v12;
  io_service_t v13;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];
  uint8_t v21[2];

  v2 = *((_QWORD *)this + 1);
  if (!*(_QWORD *)v2)
  {
    v4 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)v21 = 0;
    v15 = "notificationPort is NULL";
    v16 = v21;
LABEL_17:
    _os_log_error_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    return 0;
  }
  if (!*(_DWORD *)(v2 + 120))
  {
    v5 = *MEMORY[0x24BDD8B18];
    v6 = IOServiceMatching("AppleH16CamIn");
    MatchingService = IOServiceGetMatchingService(v5, v6);
    *(_DWORD *)(*((_QWORD *)this + 1) + 120) = MatchingService;
    if (MatchingService)
      return 1;
    v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_debug_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEBUG, "#D H16 Camera is not found. Trying H13 Camera", v19, 2u);
    }
    v9 = IOServiceMatching("AppleH13CamIn");
    v10 = IOServiceGetMatchingService(v5, v9);
    *(_DWORD *)(*((_QWORD *)this + 1) + 120) = v10;
    if (v10)
      return 1;
    v11 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_debug_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_DEBUG, "#D H13 Camera is not found. Trying H10 Camera", v18, 2u);
    }
    v12 = IOServiceMatching("AppleH10CamIn");
    v13 = IOServiceGetMatchingService(v5, v12);
    *(_DWORD *)(*((_QWORD *)this + 1) + 120) = v13;
    if (v13)
      return 1;
    v4 = *(NSObject **)this;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 0;
    v17 = 0;
    v15 = "Could not find matching camera driver";
    v16 = (uint8_t *)&v17;
    goto LABEL_17;
  }
  v3 = 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "We already matched in - No need to do it again", buf, 2u);
  }
  return v3;
}

BOOL ctu::iokit::Controller::setFaceIDCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[16].isa;
  if (v9)
    v10 = v4[17].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[16].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[16].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[17].isa;
  v4[17].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[16].isa;
    v4[16].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[17].isa;
    v4[17].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5AC620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitFaceIDState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

BOOL ctu::iokit::Controller::setFrontCameraCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[18].isa;
  if (v9)
    v10 = v4[19].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[18].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[18].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[19].isa;
  v4[19].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[18].isa;
    v4[18].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[19].isa;
    v4[19].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5AC910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitFrontCameraState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

BOOL ctu::iokit::Controller::setBackTeleCameraCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[20].isa;
  if (v9)
    v10 = v4[21].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[20].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[20].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[21].isa;
  v4[21].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[20].isa;
    v4[20].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[21].isa;
    v4[21].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5ACC00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackTeleCameraState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

BOOL ctu::iokit::Controller::setBackSuperWideCameraCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[22].isa;
  if (v9)
    v10 = v4[23].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[22].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[22].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[23].isa;
  v4[23].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[22].isa;
    v4[22].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[23].isa;
    v4[23].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5ACEF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackSuperWideCameraState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

BOOL ctu::iokit::Controller::setBackCameraCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[24].isa;
  if (v9)
    v10 = v4[25].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[24].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[24].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[25].isa;
  v4[25].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[24].isa;
    v4[24].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[25].isa;
    v4[25].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5AD1E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackCameraState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

BOOL ctu::iokit::Controller::setAllBackCameraCallback(NSObject **a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  Class isa;
  Class v9;
  BOOL v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v15;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  if (*(_QWORD *)a2)
    v5 = _Block_copy(*(const void **)a2);
  else
    v5 = 0;
  v6 = *(NSObject **)(a2 + 8);
  if (v6)
    dispatch_retain(v6);
  v7 = a1[1];
  isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v13 = 0;
      goto LABEL_18;
    }
    v25 = v7[2].isa;
    v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    v32 = v25;
    v33 = 1024;
    v34 = v26;
    v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    v18 = v12;
    v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  v9 = v4[26].isa;
  if (v9)
    v10 = v4[27].isa == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "The callback is already set. Not allowed to override the callback";
    v18 = v15;
    v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    v11 = (objc_class *)_Block_copy(v5);
    v9 = v4[26].isa;
  }
  else
  {
    v11 = 0;
  }
  v4[26].isa = v11;
  if (v9)
    _Block_release(v9);
  if (v6)
    dispatch_retain(v6);
  v20 = v4[27].isa;
  v4[27].isa = (Class)v6;
  if (v20)
    dispatch_release(v20);
  notification = 0;
  v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  v13 = v21 == 0;
  if (v21)
  {
    v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_20E5A6000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    v23 = v4[26].isa;
    v4[26].isa = 0;
    if (v23)
      _Block_release(v23);
    v24 = v4[27].isa;
    v4[27].isa = 0;
    if (v24)
      dispatch_release(v24);
  }
LABEL_18:
  if (v6)
    dispatch_release(v6);
  if (v5)
    _Block_release(v5);
  return v13;
}

void sub_20E5AD4D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackCameraState,ctu::iokit::TelephonyIOKitBackTeleCameraState,ctu::iokit::TelephonyIOKitBackSuperWideCameraState)>::~callback(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
  return a1;
}

void ctu::iokit::Controller::processBatteryInfoNotification(os_log_t *this)
{
  os_log_t v2;
  Class isa;
  int v4;
  int v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  void *v9;
  unsigned __int16 v10;
  unsigned __int8 v11;
  _QWORD block[4];
  void *aBlock;
  __int16 v14;
  char v15;

  v10 = 0;
  v11 = 0;
  ctu::iokit::Controller::getBatteryInfo(this, &v10);
  v2 = this[1];
  isa = v2[35].isa;
  if (isa && v2[36].isa)
  {
    v4 = v11;
    v5 = v10;
    v6 = _Block_copy(isa);
    v7 = v6;
    v8 = v2[36].isa;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEclIJS3_EEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_113;
    if (v6)
      v9 = _Block_copy(v6);
    else
      v9 = 0;
    aBlock = v9;
    v14 = v5;
    v15 = (v5 | (v4 << 16)) >> 16;
    dispatch_async(v8, block);
    if (aBlock)
      _Block_release(aBlock);
    if (v7)
      _Block_release(v7);
  }
}

BOOL ctu::iokit::Controller::getBatteryInfo(os_log_t *a1, _BYTE *a2)
{
  int v4;
  _BOOL8 v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = IOPSGetPercentRemaining();
    v5 = v4 == 0;
    if (v4)
    {
      v6 = v4;
      v7 = *a1;
      if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v6;
        _os_log_error_impl(&dword_20E5A6000, v7, OS_LOG_TYPE_ERROR, "Failed to get battery info: 0x%08x", buf, 8u);
      }
    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
    }
  }
  else
  {
    v8 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "Invalid batteryInfo buffer", buf, 2u);
    }
    return 0;
  }
  return v5;
}

void ctu::iokit::Controller::displayServiceAdded(ctu::iokit::Controller *this, io_iterator_t iterator)
{
  io_object_t v4;
  io_service_t v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (**((_QWORD **)this + 1))
  {
    v4 = IOIteratorNext(iterator);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      do
      {
        if ((v6 & 1) == 0)
        {
          ctu::iokit::Controller::registerForIOKitService(this, v5, (IOServiceInterestCallback)ctu::iokit::sDisplayCallbackInternal, (io_object_t *)(*((_QWORD *)this + 1) + 28));
          ctu::iokit::Controller::displayService(this, -535736319, v7);
        }
        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
        v6 = 1;
      }
      while (v5);
    }
  }
  else
  {
    v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", v9, 2u);
    }
  }
}

void ctu::iokit::sDisplayCallbackInternal(ctu::iokit *this, void *a2, void *a3, unsigned int a4, void *a5)
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    ctu::iokit::Controller::displayService(this, (int)a3, a3);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    v5 = qword_253D0AEE8;
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "void ctu::iokit::sDisplayCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_20E5A6000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void ctu::iokit::Controller::displayService(ctu::iokit::Controller *this, int a2, void *a3)
{
  _QWORD *v3;
  int v4;
  int v5;
  const void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  void *aBlock;
  int v13;

  v3 = (_QWORD *)*((_QWORD *)this + 1);
  if (*v3)
  {
    if (a2 == -535736315)
      v4 = 2;
    else
      v4 = 1;
    if (a2 == -535736319)
      v4 = 4;
    if (a2 == -536870896)
      v5 = 8;
    else
      v5 = v4;
    v6 = (const void *)v3[4];
    if (v6)
      v7 = _Block_copy(v6);
    else
      v7 = 0;
    v9 = v3[5];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1174405120;
    v11[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEclIJS3_EEEvDpT__block_invoke;
    v11[3] = &__block_descriptor_tmp_114;
    if (v7)
      v10 = _Block_copy(v7);
    else
      v10 = 0;
    aBlock = v10;
    v13 = v5;
    dispatch_async(v9, v11);
    if (aBlock)
      _Block_release(aBlock);
    if (v7)
      _Block_release(v7);
  }
  else
  {
    v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", (uint8_t *)v11, 2u);
    }
  }
}

void ctu::iokit::Controller::mesaService(os_log_t *this, io_registry_entry_t entry, int a3, void *a4)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  os_log_t v10;
  Class isa;
  void *v12;
  NSObject *v13;
  void *v14;
  int valuePtr;
  uint8_t buf[8];
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void *aBlock;
  int v21;

  if (this[1]->isa)
  {
    if (a3 == -536870608)
    {
      valuePtr = 0;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("ScanningState"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        CFRelease(v6);
        if (valuePtr == 1)
          v7 = 1;
        else
          v7 = 2 * (valuePtr == 2);
      }
      else
      {
        v9 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_ERROR, "couldn't get kScanningStateKey ", buf, 2u);
        }
        v7 = 0;
      }
      v10 = this[1];
      isa = v10[13].isa;
      if (isa)
        v12 = _Block_copy(isa);
      else
        v12 = 0;
      v13 = v10[14].isa;
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v17 = 1174405120;
      v18 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEclIJS3_EEEvDpT__block_invoke;
      v19 = &__block_descriptor_tmp_115;
      if (v12)
        v14 = _Block_copy(v12);
      else
        v14 = 0;
      aBlock = v14;
      v21 = v7;
      dispatch_async(v13, buf);
      if (aBlock)
        _Block_release(aBlock);
      if (v12)
        _Block_release(v12);
    }
  }
  else
  {
    v8 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", buf, 2u);
    }
  }
}

uint64_t ctu::iokit::Controller::setAccessoryCallback(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;
  IONotificationPort *v9;
  const __CFDictionary *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  io_iterator_t notification;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 8);
  if (!*v3)
  {
    v15 = *(NSObject **)a1;
    if (!os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v16 = "notificationPort is NULL";
LABEL_29:
    _os_log_error_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    return 0;
  }
  if (!v3[2])
  {
    v15 = *(NSObject **)a1;
    if (!os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v16 = "runLoop is NULL";
    goto LABEL_29;
  }
  v5 = *(void **)a2;
  if (*(_QWORD *)a2)
    v5 = _Block_copy(v5);
  v6 = (const void *)v3[29];
  v3[29] = v5;
  if (v6)
    _Block_release(v6);
  v7 = *(NSObject **)(a2 + 8);
  if (v7)
    dispatch_retain(v7);
  v8 = v3[30];
  v3[30] = v7;
  if (v8)
    dispatch_release(v8);
  notification = 0;
  v9 = **(IONotificationPort ***)(a1 + 8);
  v10 = IOServiceMatching("IOAccessoryManager");
  if (IOServiceAddMatchingNotification(v9, "IOServiceMatched", v10, (IOServiceMatchingCallback)ctu::iokit::sControllerAccessoryServiceAdded, (void *)a1, &notification))
  {
    v11 = 1;
  }
  else
  {
    v11 = notification == 0;
  }
  v12 = !v11;
  if (v11)
  {
    v17 = *(NSObject **)a1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "TelephonyIOKitAccessoryController";
      _os_log_error_impl(&dword_20E5A6000, v17, OS_LOG_TYPE_ERROR, "%s: Registering Publish Notification failed", buf, 0xCu);
    }
  }
  else
  {
    ctu::iokit::Controller::accessoryServiceAdded((os_log_t *)a1, notification);
    v13 = *(_QWORD *)(a1 + 8);
    v14 = *(_DWORD *)(v13 + 224);
    if (v14)
    {
      IOObjectRelease(v14);
      v13 = *(_QWORD *)(a1 + 8);
    }
    *(_DWORD *)(v13 + 224) = notification;
  }
  return v12;
}

void sub_20E5ADE30(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ctu::iokit::sControllerAccessoryServiceAdded(os_log_t *this, void *a2)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    ctu::iokit::Controller::accessoryServiceAdded(this, (io_iterator_t)a2);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    v2 = qword_253D0AEE8;
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
    {
      v3 = 136315138;
      v4 = "void ctu::iokit::sControllerAccessoryServiceAdded(void *, io_iterator_t)";
      _os_log_error_impl(&dword_20E5A6000, v2, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v3, 0xCu);
    }
  }
}

void ctu::iokit::Controller::accessoryServiceAdded(os_log_t *this, io_iterator_t iterator)
{
  io_object_t v4;
  io_object_t v5;
  int PrimaryPort;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (this[1]->isa)
  {
    v4 = IOIteratorNext(iterator);
    if (v4)
    {
      v5 = v4;
      do
      {
        PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        if (PrimaryPort)
        {
          v7 = PrimaryPort;
          v8 = *this;
          if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            v12 = v7;
            _os_log_debug_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEBUG, "#D Port Number (%d) is registering accessory service", buf, 8u);
          }
          if (ctu::iokit::Controller::registerForIOKitService((ctu::iokit::Controller *)this, v5, (IOServiceInterestCallback)ctu::iokit::sAccessoryCallbackInternal, (io_object_t *)&this[1][28].isa + 1))
          {
            ctu::iokit::Controller::accessoryService(this, v5, -469794797, v9);
          }
        }
        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
  }
  else
  {
    v10 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v10, OS_LOG_TYPE_ERROR, "notificationPort is NULL", buf, 2u);
    }
  }
}

void ctu::iokit::sAccessoryCallbackInternal(os_log_t *this, void *a2, int a3, void *a4, void *a5)
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    ctu::iokit::Controller::accessoryService(this, (int)a2, a3, a4);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    v5 = qword_253D0AEE8;
    if (os_log_type_enabled((os_log_t)qword_253D0AEE8, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "void ctu::iokit::sAccessoryCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_20E5A6000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void ctu::iokit::Controller::accessoryService(os_log_t *this, int a2, int a3, void *a4)
{
  int AccessoryID;
  NSObject *v7;
  int PrimaryPort;
  NSObject *v9;
  os_log_t v10;
  Class isa;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  io_object_t isa_high;
  NSObject *v19;
  int v20;
  _QWORD v21[4];
  void *aBlock;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!this[1]->isa)
  {
    v13 = *this;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(v21[0]) = 0;
    v14 = "notificationPort is NULL";
LABEL_18:
    _os_log_error_impl(&dword_20E5A6000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)v21, 2u);
    return;
  }
  if (!a2)
  {
    v13 = *this;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
      return;
    LOWORD(v21[0]) = 0;
    v14 = "service is IO_OBJECT_NULL";
    goto LABEL_18;
  }
  if (IOAccessoryManagerGetPrimaryPort()
    && ((a3 + 469794800) <= 7 && ((1 << (a3 - 16)) & 0x9B) != 0 || a3 == -469794716))
  {
    AccessoryID = IOAccessoryManagerGetAccessoryID();
    v7 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v21[0]) = 67109120;
      HIDWORD(v21[0]) = AccessoryID;
      _os_log_debug_impl(&dword_20E5A6000, v7, OS_LOG_TYPE_DEBUG, "#D Accessory ID: %d", (uint8_t *)v21, 8u);
    }
    if (AccessoryID != -1)
    {
      if (AccessoryID == 100)
      {
        PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        v9 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v21[0]) = 67109120;
          HIDWORD(v21[0]) = PrimaryPort;
          _os_log_debug_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_DEBUG, "#D Port (%d) has been disconnected", (uint8_t *)v21, 8u);
        }
        v10 = this[1];
        isa = v10[29].isa;
        if (isa)
          v12 = _Block_copy(isa);
        else
          v12 = 0;
        v16 = v10[30].isa;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 1174405120;
        v21[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke;
        v21[3] = &__block_descriptor_tmp_116;
        if (v12)
          v17 = _Block_copy(v12);
        else
          v17 = 0;
        aBlock = v17;
        v23 = 0x100000002;
        v24 = PrimaryPort;
        dispatch_async(v16, v21);
        if (aBlock)
          _Block_release(aBlock);
        if (v12)
          _Block_release(v12);
      }
      else
      {
        v15 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
        {
          v20 = IOAccessoryManagerGetPrimaryPort();
          LODWORD(v21[0]) = 67109120;
          HIDWORD(v21[0]) = v20;
          _os_log_debug_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_DEBUG, "#D Port (%d) has been connected", (uint8_t *)v21, 8u);
        }
        ctu::iokit::Controller::processAccessoryType(this);
      }
    }
    isa_high = HIDWORD(this[1][28].isa);
    if (isa_high)
    {
      v19 = *this;
      if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21[0]) = 0;
        _os_log_debug_impl(&dword_20E5A6000, v19, OS_LOG_TYPE_DEBUG, "#D Found the accessory event. Release the notification", (uint8_t *)v21, 2u);
        isa_high = HIDWORD(this[1][28].isa);
      }
      IOObjectRelease(isa_high);
      HIDWORD(this[1][28].isa) = 0;
    }
  }
}

void sub_20E5AE4B4(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void ctu::iokit::Controller::processAccessoryType(os_log_t *this)
{
  int PrimaryPort;
  int AccessoryID;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_log_t v9;
  Class isa;
  void *v11;
  NSObject *v12;
  void *v13;
  std::string *v14;
  NSObject *v15;
  _BOOL4 v16;
  std::string *v17;
  const char *v18;
  std::string::size_type size;
  uint64_t AccessoryType;
  std::string *p_p;
  std::string __p;
  _BYTE v23[12];
  __int16 v24;
  int v25;
  std::string buf;
  void *v27;
  void *aBlock;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  memset(&__p, 170, sizeof(__p));
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  PrimaryPort = IOAccessoryManagerGetPrimaryPort();
  AccessoryID = IOAccessoryManagerGetAccessoryID();
  v4 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = AccessoryID;
    _os_log_debug_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_DEBUG, "#D Accessory ID: %d", (uint8_t *)&buf, 8u);
  }
  if ((AccessoryID - 80) < 9)
  {
    v5 = 0x1000000001;
    v6 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_20E5A6000, v6, OS_LOG_TYPE_DEBUG, "#D Found USB-C connection and consider this as E75 for the baseband", (uint8_t *)&buf, 2u);
    }
    goto LABEL_15;
  }
  if (AccessoryID == 90)
    goto LABEL_14;
  if (AccessoryID != 91)
  {
    v7 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_20E5A6000, v7, OS_LOG_TYPE_DEBUG, "#D There is no Digitial ID for this accessory", (uint8_t *)&buf, 2u);
    }
    goto LABEL_14;
  }
  memset(v23, 170, 6);
  if (IOAccessoryManagerGetDigitalID())
  {
LABEL_14:
    v5 = 0x100000001;
    goto LABEL_15;
  }
  if ((v23[1] & 3) != 0)
  {
    if ((v23[0] & 4) != 0)
      goto LABEL_43;
  }
  else
  {
    if ((v23[0] & 4) != 0)
    {
LABEL_43:
      ctu::iokit::Controller::getModelNumberViaMB((uint64_t)&buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      __p = buf;
      v15 = *this;
      v16 = os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG);
      if (!v16)
        goto LABEL_46;
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      v18 = "#D Found Model ID via MikeyBus ID: %s";
LABEL_58:
      _os_log_debug_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&buf, 0xCu);
      goto LABEL_46;
    }
    if ((v23[3] & 0x70) == 0 && (v23[4] & 1) == 0)
      goto LABEL_51;
  }
  ctu::iokit::Controller::getModelNumberViaAccessoryManager(&buf);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = buf;
  v15 = *this;
  v16 = os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    v17 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
    v18 = "#D Found Model ID via Accessory Manager: %s";
    goto LABEL_58;
  }
LABEL_46:
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (size)
  {
    AccessoryType = ctu::iokit::Controller::getAccessoryType(v16, &__p);
    v5 = (AccessoryType << 32) | 1;
    if ((_DWORD)AccessoryType != 1)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_51:
  v5 = 0x100000001;
LABEL_52:
  if ((v23[0] & 0x1F) == 0x10)
    v5 = 0x1000000001;
LABEL_15:
  v8 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
  {
    ctu::iokit::asString(HIDWORD(v5), &buf);
    v14 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &buf
        : (std::string *)buf.__r_.__value_.__r.__words[0];
    *(_DWORD *)v23 = 136315394;
    *(_QWORD *)&v23[4] = v14;
    v24 = 1024;
    v25 = PrimaryPort;
    _os_log_debug_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEBUG, "#D Found accessory type: %s, port number: %d", v23, 0x12u);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  v9 = this[1];
  isa = v9[29].isa;
  if (isa)
    v11 = _Block_copy(isa);
  else
    v11 = 0;
  v12 = v9[30].isa;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x24BDAC760];
  buf.__r_.__value_.__l.__size_ = 1174405120;
  buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke;
  v27 = &__block_descriptor_tmp_116;
  if (v11)
    v13 = _Block_copy(v11);
  else
    v13 = 0;
  aBlock = v13;
  v29 = v5;
  v30 = PrimaryPort;
  dispatch_async(v12, &buf);
  if (aBlock)
    _Block_release(aBlock);
  if (v11)
    _Block_release(v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E5AE928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

const __CFDictionary *ctu::iokit::Controller::getModelNumberViaMB@<X0>(uint64_t a1@<X8>)
{
  const __CFDictionary *result;
  io_object_t v4;
  CFTypeRef v5;
  uint64_t v6;
  io_iterator_t existing;

  memset((void *)a1, 170, 24);
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)a1, "");
  existing = -1431655766;
  result = IOServiceMatching("IOMikeyBusDevice");
  if (result)
  {
    result = (const __CFDictionary *)IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], result, &existing);
    if (!(_DWORD)result)
    {
      do
      {
        v4 = IOIteratorNext(existing);
        if (!v4)
          break;
        v5 = IOMikeyBusDeviceCopyProductModelNumber(v4);
        ctu::cf::assign();
        IOObjectRelease(v4);
        if (v5)
          CFRelease(v5);
        v6 = *(unsigned __int8 *)(a1 + 23);
        if ((v6 & 0x80u) != 0)
          v6 = *(_QWORD *)(a1 + 8);
      }
      while (!v6);
      result = (const __CFDictionary *)existing;
      if (existing)
        return (const __CFDictionary *)IOObjectRelease(existing);
    }
  }
  return result;
}

void sub_20E5AEA64(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::iokit::Controller::getModelNumberViaAccessoryManager(_QWORD *a1@<X8>)
{
  CFTypeID v2;

  memset(a1, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a1, "");
  if (!IOAccessoryManagerCopyDeviceInfo())
  {
    v2 = CFGetTypeID(0);
    if (v2 == CFStringGetTypeID())
      ctu::cf::assign();
  }
}

void sub_20E5AEB18(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::iokit::Controller::getAccessoryType(int a1, std::string *this)
{
  if (!std::string::compare(this, "A1765"))
    return 8;
  if (!std::string::compare(this, "A1748"))
    return 4;
  if (!std::string::compare(this, "A1749"))
    return 2;
  if (!std::string::compare(this, "A1605"))
    return 32;
  if (!std::string::compare(this, "A2121"))
    return 64;
  if (!std::string::compare(this, "A2070"))
    return 128;
  if (!std::string::compare(this, "A2071"))
    return 256;
  if (!std::string::compare(this, "A2183"))
    return 512;
  if (!std::string::compare(this, "A2184"))
    return 1024;
  if (!std::string::compare(this, "A2180"))
    return 2048;
  if (!std::string::compare(this, "A2261")
    || !std::string::compare(this, "A1998")
    || !std::string::compare(this, "AM003")
    || !std::string::find[abi:ne180100](&this->__r_.__value_.__l.__data_, "X533")
    || !std::string::find[abi:ne180100](&this->__r_.__value_.__l.__data_, "x533"))
  {
    return 4096;
  }
  return 1;
}

uint64_t std::string::find[abi:ne180100](char **a1, char *__s)
{
  char *v3;
  uint64_t v4;
  uint64_t result;
  int64_t v6;
  char *v7;
  char *v8;
  int v9;
  void *v10;
  char *v11;

  v3 = (char *)a1;
  if (*((char *)a1 + 23) < 0)
  {
    v3 = *a1;
    v4 = (uint64_t)a1[1];
  }
  else
  {
    v4 = *((unsigned __int8 *)a1 + 23);
  }
  result = strlen(__s);
  if (result)
  {
    v6 = result;
    v7 = &v3[v4];
    if (v4 >= result)
    {
      v9 = *__s;
      v10 = v3;
      do
      {
        if (v4 - v6 == -1)
          break;
        v11 = (char *)memchr(v10, v9, v4 - v6 + 1);
        if (!v11)
          break;
        v8 = v11;
        if (!memcmp(v11, __s, v6))
          goto LABEL_7;
        v10 = v8 + 1;
        v4 = v7 - (v8 + 1);
      }
      while (v4 >= v6);
    }
    v8 = v7;
LABEL_7:
    if (v8 == v7)
      return -1;
    else
      return v8 - v3;
  }
  return result;
}

uint64_t ctu::iokit::Controller::getAccessoryPrimaryPortNumber(ctu::iokit::Controller *this)
{
  return 1;
}

uint64_t ctu::iokit::Controller::setPowerSourceCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  int *v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  ctu::iokit::Controller *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  int PowerSource;
  const void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD handler[6];
  std::__shared_weak_count *v33;
  uint8_t buf[8];
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  void *aBlock;
  int v39;

  if (*(_QWORD *)a2 && *(_QWORD *)(a2 + 8))
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = _Block_copy(*(const void **)a2);
    v6 = *(const void **)(v4 + 248);
    *(_QWORD *)(v4 + 248) = v5;
    if (v6)
      _Block_release(v6);
    v7 = *(_QWORD *)(a2 + 8);
    if (v7)
      dispatch_retain(*(dispatch_object_t *)(a2 + 8));
    v8 = *(NSObject **)(v4 + 256);
    *(_QWORD *)(v4 + 256) = v7;
    if (v8)
      dispatch_release(v8);
    v9 = *(NSObject **)(a2 + 8);
    if (v9)
      dispatch_retain(v9);
    v10 = *(_QWORD *)(a1 + 8);
    v11 = *(NSObject **)(v10 + 264);
    *(_QWORD *)(v10 + 264) = v9;
    if (v11)
      dispatch_release(v11);
    v12 = *(_QWORD *)(a1 + 8);
    v13 = *(std::__shared_weak_count **)(a1 + 16);
    v14 = v12;
    if (v13)
    {
      p_shared_weak_owners = (unint64_t *)&v13->__shared_weak_owners_;
      do
        v16 = __ldxr(p_shared_weak_owners);
      while (__stxr(v16 + 1, p_shared_weak_owners));
      v14 = *(_QWORD *)(a1 + 8);
    }
    v17 = (int *)(v14 + 272);
    v18 = *(NSObject **)(v14 + 264);
    v19 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 1174405120;
    handler[2] = ___ZN3ctu5iokit10Controller22setPowerSourceCallbackEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitPowerSourceEEEE_block_invoke;
    handler[3] = &__block_descriptor_tmp_78;
    handler[4] = a1;
    handler[5] = v12;
    v33 = v13;
    if (v13)
    {
      v20 = (unint64_t *)&v13->__shared_weak_owners_;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v22 = (ctu::iokit::Controller *)notify_register_dispatch("com.apple.system.powermanagement.poweradapter", v17, v18, handler);
    if ((_DWORD)v22 || (v25 = *(_QWORD *)(a1 + 8), *(_DWORD *)(v25 + 272) == -1))
    {
      v23 = 0;
    }
    else
    {
      PowerSource = ctu::iokit::Controller::queryPowerSource(v22);
      v27 = *(const void **)(v25 + 248);
      if (v27)
        v28 = _Block_copy(v27);
      else
        v28 = 0;
      v29 = *(NSObject **)(v25 + 256);
      *(_QWORD *)buf = v19;
      v35 = 1174405120;
      v36 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
      v37 = &__block_descriptor_tmp_117;
      if (v28)
        v30 = _Block_copy(v28);
      else
        v30 = 0;
      aBlock = v30;
      v39 = PowerSource;
      dispatch_async(v29, buf);
      if (aBlock)
        _Block_release(aBlock);
      if (v28)
        _Block_release(v28);
      v23 = 1;
    }
    if (v33)
      std::__shared_weak_count::__release_weak(v33);
    if (v13)
      std::__shared_weak_count::__release_weak(v13);
  }
  else
  {
    v24 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v24, OS_LOG_TYPE_ERROR, "Power source call back is NULL!", buf, 2u);
    }
    return 0;
  }
  return v23;
}

void sub_20E5AEFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::__shared_weak_count *v16;

  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  if (v16)
    std::__shared_weak_count::__release_weak(v16);
  _Unwind_Resume(exception_object);
}

void ___ZN3ctu5iokit10Controller22setPowerSourceCallbackEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitPowerSourceEEEE_block_invoke(_QWORD *a1, int a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  ctu::iokit::Controller *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  int PowerSource;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD block[4];
  void *aBlock;
  int v18;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = (ctu::iokit::Controller *)std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = (std::__shared_weak_count *)v6;
      if (a1[5])
      {
        v8 = *(_QWORD *)(v5 + 8);
        if (*(_DWORD *)(v8 + 272) == a2)
        {
          PowerSource = ctu::iokit::Controller::queryPowerSource(v6);
          v10 = *(const void **)(v8 + 248);
          if (v10)
            v11 = _Block_copy(v10);
          else
            v11 = 0;
          v12 = *(NSObject **)(v8 + 256);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 1174405120;
          block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
          block[3] = &__block_descriptor_tmp_117;
          if (v11)
            v13 = _Block_copy(v11);
          else
            v13 = 0;
          aBlock = v13;
          v18 = PowerSource;
          dispatch_async(v12, block);
          if (aBlock)
            _Block_release(aBlock);
          if (v11)
            _Block_release(v11);
        }
      }
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_20E5AF14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::Controller::queryPowerSource(ctu::iokit::Controller *this)
{
  CFDictionaryRef v1;
  uint64_t (*v2)(uint64_t);
  int Bool;
  int Int;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  _QWORD v10[2];
  CFDictionaryRef v11;
  __CFString *v12;

  v1 = IOPSCopyExternalPowerAdapterDetails();
  v11 = v1;
  v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v1)
    v2 = 0;
  if (v2)
  {
    v10[0] = 0xAAAAAAAAAAAAAAAALL;
    v10[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v10, v1);
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v12, "IsWireless");
    Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v10, v12);
    MEMORY[0x212BBF8D8](&v12);
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v12, "FamilyCode");
    Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v10, v12);
    MEMORY[0x212BBF8D8](&v12);
    if ((Int + 536854528) >= 0xB)
      v5 = 1;
    else
      v5 = 3;
    if (Int == -536723453)
      v6 = 9;
    else
      v6 = 1;
    if (Int == -536723450)
      v6 = 5;
    if (Int == -536723449)
      v6 |= 0x20u;
    if (Int == -536723455)
      v7 = v6 | 0x10;
    else
      v7 = v6;
    if (Bool)
      LODWORD(v8) = v7;
    else
      LODWORD(v8) = v5;
    MEMORY[0x212BBF908](v10);
  }
  else
  {
    LODWORD(v8) = 1;
  }
  if ((v8 & 0x3E) != 0)
    v8 &= 0x3Eu;
  else
    v8 = v8;
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v11);
  return v8;
}

void sub_20E5AF290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11, char a12)
{
  MEMORY[0x212BBF8D8](&a12);
  MEMORY[0x212BBF908](&a9);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a11);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c54_ZTSNSt3__18weak_ptrIN3ctu5iokit17ControllerContextEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c54_ZTSNSt3__18weak_ptrIN3ctu5iokit17ControllerContextEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ctu::iokit::Controller::powerSourceService(ctu::iokit::Controller *this)
{
  uint64_t v1;
  int PowerSource;
  const void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  void *aBlock;
  int v9;

  v1 = *((_QWORD *)this + 1);
  PowerSource = ctu::iokit::Controller::queryPowerSource(this);
  v3 = *(const void **)(v1 + 248);
  if (v3)
    v4 = _Block_copy(v3);
  else
    v4 = 0;
  v5 = *(NSObject **)(v1 + 256);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1174405120;
  v7[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
  v7[3] = &__block_descriptor_tmp_117;
  if (v4)
    v6 = _Block_copy(v4);
  else
    v6 = 0;
  aBlock = v6;
  v9 = PowerSource;
  dispatch_async(v5, v7);
  if (aBlock)
    _Block_release(aBlock);
  if (v4)
    _Block_release(v4);
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL ctu::iokit::Controller::registerForBatteryInfoChange(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  _BOOL8 v7;
  void *v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *p_shared_weak_owners;
  unint64_t v17;
  int *v18;
  NSObject *v19;
  unint64_t *v20;
  unint64_t v21;
  uint32_t v22;
  NSObject *v23;
  _QWORD handler[6];
  std::__shared_weak_count *v25;
  uint8_t buf[16];

  if (!*(_QWORD *)a2 || !*(_QWORD *)(a2 + 8))
  {
    v5 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "BatteryInfoCallback is NULL";
      goto LABEL_35;
    }
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (*(_DWORD *)(v4 + 276) != -1)
  {
    v5 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "BatteryInfo service is already running";
LABEL_35:
      _os_log_error_impl(&dword_20E5A6000, v5, OS_LOG_TYPE_ERROR, v6, buf, 2u);
      return 0;
    }
    return 0;
  }
  v9 = _Block_copy(*(const void **)a2);
  v10 = *(const void **)(v4 + 280);
  *(_QWORD *)(v4 + 280) = v9;
  if (v10)
    _Block_release(v10);
  v11 = *(NSObject **)(a2 + 8);
  if (v11)
    dispatch_retain(v11);
  v12 = *(NSObject **)(v4 + 288);
  *(_QWORD *)(v4 + 288) = v11;
  if (v12)
    dispatch_release(v12);
  v14 = *(_QWORD *)(a1 + 8);
  v13 = *(std::__shared_weak_count **)(a1 + 16);
  v15 = v14;
  if (v13)
  {
    p_shared_weak_owners = (unint64_t *)&v13->__shared_weak_owners_;
    do
      v17 = __ldxr(p_shared_weak_owners);
    while (__stxr(v17 + 1, p_shared_weak_owners));
    v15 = *(_QWORD *)(a1 + 8);
  }
  v18 = (int *)(v15 + 276);
  v19 = *(NSObject **)(v15 + 288);
  if (v19)
    dispatch_retain(*(dispatch_object_t *)(v15 + 288));
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 1174405120;
  handler[2] = ___ZN3ctu5iokit10Controller28registerForBatteryInfoChangeEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitBatteryInfoEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_82;
  handler[4] = a1;
  handler[5] = v14;
  v25 = v13;
  if (v13)
  {
    v20 = (unint64_t *)&v13->__shared_weak_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v22 = notify_register_dispatch("com.apple.system.powersources.percent", v18, v19, handler);
  v7 = v22 == 0;
  if (v19)
    dispatch_release(v19);
  if (v22)
  {
    v23 = *(NSObject **)a1;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v23, OS_LOG_TYPE_ERROR, "Failed to register for kIOPSNotifyPercentChange", buf, 2u);
    }
  }
  else
  {
    ctu::iokit::Controller::processBatteryInfoNotification((os_log_t *)a1);
  }
  if (v25)
    std::__shared_weak_count::__release_weak(v25);
  if (v13)
    std::__shared_weak_count::__release_weak(v13);
  return v7;
}

void sub_20E5AF5F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::__shared_weak_count *v16;

  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  if (v16)
    std::__shared_weak_count::__release_weak(v16);
  _Unwind_Resume(exception_object);
}

void ___ZN3ctu5iokit10Controller28registerForBatteryInfoChangeEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitBatteryInfoEEEE_block_invoke(_QWORD *a1, int a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint8_t v11[16];
  std::__shared_weak_count *v13;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    v13 = v6;
    if (v6)
    {
      v7 = v6;
      if (a1[5])
      {
        if (*(_DWORD *)(*(_QWORD *)(v5 + 8) + 276) == a2)
        {
          ctu::iokit::Controller::processBatteryInfoNotification((os_log_t *)v5);
        }
        else
        {
          v8 = *(NSObject **)v5;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v11 = 0;
            _os_log_error_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_ERROR, "Invalid batteryInfoToken token", v11, 2u);
          }
        }
      }
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_20E5AF724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL ctu::iokit::Controller::registerForDisplayCoverStateChanged(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL8 result;
  const char *v6;
  const __CFAllocator *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  NSObject *v13;
  CFMutableArrayRef Mutable;
  __CFArray *v15;
  CFMutableDictionaryRef v16;
  const __CFAllocator *v17;
  __CFDictionary *v18;
  const __CFAllocator *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_weak_owners;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD aBlock[6];
  std::__shared_weak_count *v32;
  CFMutableArrayRef v33;
  __CFDictionary *v34;
  uint8_t buf[8];

  if (*(_QWORD *)a2 && *(_QWORD *)(a2 + 8))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 8) + 296))
    {
      v4 = *(NSObject **)a1;
      result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v6 = "Display Cover client already running";
LABEL_41:
        _os_log_error_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_ERROR, v6, buf, 2u);
        return 0;
      }
    }
    else
    {
      v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v8 = IOHIDEventSystemClientCreateWithType();
      v9 = *(_QWORD **)(a1 + 8);
      v9[37] = v8;
      if (v8)
      {
        v10 = *(void **)a2;
        if (*(_QWORD *)a2)
          v10 = _Block_copy(v10);
        v11 = (const void *)v9[39];
        v9[39] = v10;
        if (v11)
          _Block_release(v11);
        v12 = *(NSObject **)(a2 + 8);
        if (v12)
          dispatch_retain(v12);
        v13 = v9[40];
        v9[40] = v12;
        if (v13)
          dispatch_release(v13);
        v33 = 0;
        Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x24BDBD690]);
        v15 = Mutable;
        if (Mutable)
        {
          v33 = Mutable;
          *(_QWORD *)buf = 0;
          ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)buf);
        }
        v34 = 0;
        v16 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v16)
        {
          v18 = v34;
          v34 = v16;
          *(_QWORD *)buf = v18;
          ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)buf);
        }
        ctu::cf::insert<char const*,unsigned int>(v34, (const __CFString **)"PrimaryUsagePage", 0xBu, v7, v17);
        ctu::cf::insert<char const*,unsigned int>(v34, (const __CFString **)"PrimaryUsage", 1u, v7, v19);
        ctu::cf::insert<__CFDictionary *>(v15, v34);
        ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v34);
        IOHIDEventSystemClientSetMatchingMultiple();
        v20 = *(_QWORD *)(a1 + 8);
        v21 = *(std::__shared_weak_count **)(a1 + 16);
        if (v21)
        {
          p_shared_weak_owners = (unint64_t *)&v21->__shared_weak_owners_;
          do
            v23 = __ldxr(p_shared_weak_owners);
          while (__stxr(v23 + 1, p_shared_weak_owners));
        }
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1174405120;
        aBlock[2] = ___ZN3ctu5iokit10Controller35registerForDisplayCoverStateChangedEN8dispatch8callbackIU13block_pointerFvNS0_31TelephonyIOKitDisplayCoverStateEEEE_block_invoke;
        aBlock[3] = &__block_descriptor_tmp_84;
        aBlock[4] = a1;
        aBlock[5] = v20;
        v32 = v21;
        if (v21)
        {
          v24 = (unint64_t *)&v21->__shared_weak_owners_;
          do
            v25 = __ldxr(v24);
          while (__stxr(v25 + 1, v24));
        }
        v26 = _Block_copy(aBlock);
        v27 = *(_QWORD *)(a1 + 8);
        v28 = *(const void **)(v27 + 304);
        *(_QWORD *)(v27 + 304) = v26;
        if (v28)
          _Block_release(v28);
        IOHIDEventSystemClientRegisterEventBlock();
        v29 = *(_QWORD *)(a1 + 8);
        v30 = *(NSObject **)(v29 + 320);
        if (v30)
          dispatch_retain(*(dispatch_object_t *)(v29 + 320));
        IOHIDEventSystemClientScheduleWithDispatchQueue();
        if (v30)
          dispatch_release(v30);
        if (v32)
          std::__shared_weak_count::__release_weak(v32);
        if (v21)
          std::__shared_weak_count::__release_weak(v21);
        ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v33);
        return 1;
      }
      else
      {
        v4 = *(NSObject **)a1;
        result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)buf = 0;
          v6 = "Failed to create EventSystemClient";
          goto LABEL_41;
        }
      }
    }
  }
  else
  {
    v4 = *(NSObject **)a1;
    result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      v6 = "DisplayCoverEventCallback is NULL";
      goto LABEL_41;
    }
  }
  return result;
}

void sub_20E5AFA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, const void *a17)
{
  std::__shared_weak_count *v17;
  NSObject *v18;

  if (v18)
    dispatch_release(v18);
  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  if (v17)
    std::__shared_weak_count::__release_weak(v17);
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(&a17);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5iokit10Controller35registerForDisplayCoverStateChangedEN8dispatch8callbackIU13block_pointerFvNS0_31TelephonyIOKitDisplayCoverStateEEEE_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  int IntegerValue;
  int v7;
  int v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD block[4];
  void *aBlock;
  int v18;

  v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    v3 = a1[4];
    v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5] && IOHIDEventGetIntegerValue() == 65289)
      {
        IntegerValue = IOHIDEventGetIntegerValue();
        v7 = IOHIDEventGetIntegerValue();
        switch(IntegerValue)
        {
          case 1:
            if (v7)
              v8 = 3;
            else
              v8 = 2;
LABEL_13:
            v9 = *(_QWORD *)(v3 + 8);
            v10 = *(const void **)(v9 + 312);
            if (v10)
              v11 = _Block_copy(v10);
            else
              v11 = 0;
            v12 = *(NSObject **)(v9 + 320);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 1174405120;
            block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEclIJS3_EEEvDpT__block_invoke;
            block[3] = &__block_descriptor_tmp_118;
            if (v11)
              v13 = _Block_copy(v11);
            else
              v13 = 0;
            aBlock = v13;
            v18 = v8;
            dispatch_async(v12, block);
            if (aBlock)
              _Block_release(aBlock);
            if (v11)
              _Block_release(v11);
            break;
          case 16:
            v8 = v7 == 0;
            goto LABEL_13;
          case 32:
            v8 = 4;
            goto LABEL_13;
        }
      }
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void sub_20E5AFC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5iokitL19sCreateOsLogContextEv_block_invoke()
{
  _BYTE v0[16];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.iokit", "controller");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
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

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t ctu::cf::insert<char const*,unsigned int>(__CFDictionary *a1, const __CFString **a2, unsigned int a3, const __CFAllocator *a4, const __CFAllocator *a5)
{
  CFNumberRef v8;
  BOOL v9;
  uint64_t v10;
  CFNumberRef v12;
  void *key;
  unint64_t valuePtr;

  valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, a2, (const char *)0x8000100, (uint64_t)a4, a5);
  key = (void *)valuePtr;
  valuePtr = a3;
  v8 = CFNumberCreate(a4, kCFNumberLongLongType, &valuePtr);
  v12 = v8;
  if (key)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
    CFDictionaryAddValue(a1, key, v8);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v12);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return v10;
}

void sub_20E5AFE90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  _Unwind_Resume(a1);
}

BOOL ctu::cf::insert<__CFDictionary *>(__CFArray *a1, CFTypeRef cf)
{
  const void *v5;

  v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    CFArrayAppendValue(a1, cf);
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&v5);
  return cf != 0;
}

void sub_20E5AFF0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C96E9F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C96E9F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::__on_zero_shared(_QWORD *a1)
{
  NSObject *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  NSObject *v10;
  const void *v11;
  NSObject *v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  const void *v17;
  NSObject *v18;
  const void *v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  const void *v23;
  NSObject *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const void *v30;

  v2 = a1[43];
  if (v2)
    dispatch_release(v2);
  v3 = (const void *)a1[42];
  if (v3)
    _Block_release(v3);
  v4 = (const void *)a1[41];
  if (v4)
    _Block_release(v4);
  v5 = a1[39];
  if (v5)
    dispatch_release(v5);
  v6 = (const void *)a1[38];
  if (v6)
    _Block_release(v6);
  v7 = a1[36];
  if (v7)
    dispatch_release(v7);
  v8 = a1[35];
  if (v8)
    dispatch_release(v8);
  v9 = (const void *)a1[34];
  if (v9)
    _Block_release(v9);
  v10 = a1[33];
  if (v10)
    dispatch_release(v10);
  v11 = (const void *)a1[32];
  if (v11)
    _Block_release(v11);
  v12 = a1[30];
  if (v12)
    dispatch_release(v12);
  v13 = (const void *)a1[29];
  if (v13)
    _Block_release(v13);
  v14 = a1[28];
  if (v14)
    dispatch_release(v14);
  v15 = (const void *)a1[27];
  if (v15)
    _Block_release(v15);
  v16 = a1[26];
  if (v16)
    dispatch_release(v16);
  v17 = (const void *)a1[25];
  if (v17)
    _Block_release(v17);
  v18 = a1[24];
  if (v18)
    dispatch_release(v18);
  v19 = (const void *)a1[23];
  if (v19)
    _Block_release(v19);
  v20 = a1[22];
  if (v20)
    dispatch_release(v20);
  v21 = (const void *)a1[21];
  if (v21)
    _Block_release(v21);
  v22 = a1[20];
  if (v22)
    dispatch_release(v22);
  v23 = (const void *)a1[19];
  if (v23)
    _Block_release(v23);
  v24 = a1[17];
  if (v24)
    dispatch_release(v24);
  v25 = (const void *)a1[16];
  if (v25)
    _Block_release(v25);
  v26 = a1[12];
  if (v26)
  {
    v27 = a1[13];
    v28 = (void *)a1[12];
    if (v27 != v26)
    {
      do
      {
        v27 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v27);
      }
      while (v27 != v26);
      v28 = (void *)a1[12];
    }
    a1[13] = v26;
    operator delete(v28);
  }
  std::__list_imp<unsigned int>::clear(a1 + 9);
  v29 = a1[8];
  if (v29)
    dispatch_release(v29);
  v30 = (const void *)a1[7];
  if (v30)
    _Block_release(v30);
}

_QWORD *std::__list_imp<unsigned int>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

ctu::iokit::Controller *std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::__on_zero_shared(uint64_t a1)
{
  ctu::iokit::Controller *result;

  result = *(ctu::iokit::Controller **)(a1 + 24);
  if (result)
    ctu::iokit::Controller::~Controller(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c94_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c94_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c85_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c85_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_S4_S5_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
}

void *__copy_helper_block_e8_32c170_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c170_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16));
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void *__copy_helper_block_e8_32c88_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c88_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c87_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c87_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

ctu::power::manager *ctu::power::manager::manager(ctu::power::manager *this)
{
  NSObject *v2;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  *((_QWORD *)this + 2) = dispatch_queue_create("powerManager", v2);
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((_QWORD *)this + 11) = (char *)this + 88;
  *((_QWORD *)this + 12) = (char *)this + 88;
  *((_QWORD *)this + 13) = 0;
  *((_WORD *)this + 56) = 0;
  _TelephonyUtilDebugPrint();
  return this;
}

void sub_20E5B0720(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t *v2;
  NSObject *v4;
  std::__shared_weak_count *v5;

  std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear(v2);
  v4 = *(NSObject **)(v1 + 16);
  if (v4)
    dispatch_release(v4);
  v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(a1);
}

void ctu::power::manager::~manager(ctu::power::manager *this)
{
  NSObject *v2;
  std::__shared_weak_count *v3;

  _TelephonyUtilDebugPrint();
  std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear((uint64_t *)this + 11);
  v2 = *((_QWORD *)this + 2);
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

void ctu::power::manager::get(_QWORD *a1@<X8>)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  if (_MergedGlobals_0 != -1)
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  v3 = *(_QWORD *)(qword_253D0AEF8 + 8);
  *a1 = *(_QWORD *)qword_253D0AEF8;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
}

void ___ZN3ctu5power7manager3getEv_block_invoke()
{
  ctu::power::manager *v0;
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v3;
  unint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;

  v0 = (ctu::power::manager *)operator new(0x78uLL);
  ctu::power::manager::manager(v0);
  v1 = (std::__shared_weak_count *)operator new(0x20uLL);
  v1->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v1->__shared_owners_;
  v1->__vftable = (std::__shared_weak_count_vtbl *)off_24C96EFE0;
  v1->__shared_weak_owners_ = 0;
  v1[1].__vftable = (std::__shared_weak_count_vtbl *)v0;
  v3 = (std::__shared_weak_count *)*((_QWORD *)v0 + 1);
  if (v3)
  {
    if (v3->__shared_owners_ != -1)
      goto LABEL_14;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v1->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    *(_QWORD *)v0 = v0;
    *((_QWORD *)v0 + 1) = v1;
    std::__shared_weak_count::__release_weak(v3);
  }
  else
  {
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    v8 = (unint64_t *)&v1->__shared_weak_owners_;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    *(_QWORD *)v0 = v0;
    *((_QWORD *)v0 + 1) = v1;
  }
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
LABEL_14:
  v11 = operator new(0x10uLL);
  *v11 = v0;
  v11[1] = v1;
  if (v1)
  {
    v12 = (unint64_t *)&v1->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  qword_253D0AEF8 = (uint64_t)v11;
  _TelephonyUtilDebugPrint();
  if (v1)
  {
    v14 = (unint64_t *)&v1->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void sub_20E5B09AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  ctu::power::manager *v11;
  void *v13;

  ctu::power::manager::~manager(v11);
  operator delete(v13);
  _Unwind_Resume(a1);
}

CFRunLoopSourceRef ctu::power::manager::registerPowerSource_sync(ctu::power::manager *this)
{
  CFRunLoopSourceRef result;

  *((_DWORD *)this + 7) = IORegisterForSystemPower((char *)this + 28, (IONotificationPortRef *)this + 5, (IOServiceInterestCallback)ctu::power::manager::_powerChanged, (io_object_t *)this + 8);
  result = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 5));
  *((_QWORD *)this + 6) = result;
  return result;
}

void ctu::power::manager::_powerChanged(io_connect_t *this, unsigned int *a2, int a3, intptr_t notificationID, void *a5)
{
  unint64_t v7;
  unint64_t v9;
  NSObject *v10;
  char v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  char v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  _QWORD block[5];
  std::__shared_weak_count *v40;
  io_connect_t *v41;
  intptr_t v42;
  int v43;
  char v44;
  _QWORD v45[5];
  std::__shared_weak_count *v46;
  io_connect_t *v47;
  intptr_t v48;
  int v49;
  char v50;
  _QWORD v51[5];
  std::__shared_weak_count *v52;
  io_connect_t *v53;
  intptr_t v54;
  int v55;
  unint64_t v56;
  unint64_t v57;

  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      v56 = 0xAAAAAAAAAAAAAAAALL;
      v57 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v56);
      v21 = v56;
      v20 = v57;
      *(_WORD *)(v56 + 112) = 256;
      v51[0] = MEMORY[0x24BDAC760];
      v22 = *(NSObject **)(v21 + 16);
      v51[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke;
      v51[3] = &__block_descriptor_tmp_4;
      v51[1] = 1174405120;
      v51[4] = v21;
      v52 = (std::__shared_weak_count *)v20;
      if (v20)
      {
        v23 = (unint64_t *)(v20 + 8);
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      v55 = a3;
      v53 = this;
      v54 = notificationID;
      dispatch_async(v22, v51);
      v25 = v52;
      if (v52)
      {
        p_shared_owners = (unint64_t *)&v52->__shared_owners_;
        do
          v27 = __ldaxr(p_shared_owners);
        while (__stlxr(v27 - 1, p_shared_owners));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      v17 = (std::__shared_weak_count *)v57;
      if (v57)
      {
        v28 = (unint64_t *)(v57 + 8);
        do
          v19 = __ldaxr(v28);
        while (__stlxr(v19 - 1, v28));
        goto LABEL_37;
      }
      break;
    case 1u:
      v56 = 0xAAAAAAAAAAAAAAAALL;
      v57 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v56);
      v30 = v56;
      v29 = v57;
      v31 = *(NSObject **)(v56 + 16);
      v45[0] = MEMORY[0x24BDAC760];
      v45[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_5;
      v45[3] = &__block_descriptor_tmp_6;
      v32 = *(_BYTE *)(v56 + 113) ^ 1;
      *(_BYTE *)(v56 + 112) = v32;
      *(_BYTE *)(v30 + 113) = 0;
      v45[1] = 1174405120;
      v45[4] = v30;
      v46 = (std::__shared_weak_count *)v29;
      if (v29)
      {
        v33 = (unint64_t *)(v29 + 8);
        do
          v34 = __ldxr(v33);
        while (__stxr(v34 + 1, v33));
      }
      v49 = a3;
      v50 = v32;
      v47 = this;
      v48 = notificationID;
      dispatch_async(v31, v45);
      v35 = v46;
      if (v46)
      {
        v36 = (unint64_t *)&v46->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      v17 = (std::__shared_weak_count *)v57;
      if (v57)
      {
        v38 = (unint64_t *)(v57 + 8);
        do
          v19 = __ldaxr(v38);
        while (__stlxr(v19 - 1, v38));
        goto LABEL_37;
      }
      break;
    case 2u:
    case 9u:
    case 0xBu:
      v56 = 0xAAAAAAAAAAAAAAAALL;
      v57 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v56);
      v9 = v56;
      v10 = *(NSObject **)(v56 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_7;
      block[3] = &__block_descriptor_tmp_8;
      v11 = *(_BYTE *)(v56 + 112);
      block[1] = 1174405120;
      block[4] = v56;
      v40 = (std::__shared_weak_count *)v57;
      if (v57)
      {
        v12 = (unint64_t *)(v57 + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }
      v43 = a3;
      v44 = v11;
      v41 = this;
      v42 = notificationID;
      dispatch_async(v10, block);
      *(_BYTE *)(v9 + 113) = 0;
      v14 = v40;
      if (v40)
      {
        v15 = (unint64_t *)&v40->__shared_owners_;
        do
          v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      v17 = (std::__shared_weak_count *)v57;
      if (v57)
      {
        v18 = (unint64_t *)(v57 + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
LABEL_37:
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      break;
    default:
      IOAllowPowerChange(*this, notificationID);
      break;
  }
}

uint64_t ctu::power::manager::deregisterPowerSource_sync(io_object_t *notifier)
{
  __CFRunLoopSource *v2;
  IONotificationPort *v3;
  uint64_t result;

  v2 = (__CFRunLoopSource *)*((_QWORD *)notifier + 6);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    *((_QWORD *)notifier + 6) = 0;
  }
  v3 = (IONotificationPort *)*((_QWORD *)notifier + 5);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((_QWORD *)notifier + 5) = 0;
  }
  if (notifier[8])
  {
    IODeregisterForSystemPower(notifier + 8);
    notifier[8] = 0;
  }
  result = notifier[7];
  if ((_DWORD)result)
  {
    result = IOServiceClose(result);
    notifier[7] = 0;
  }
  return result;
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke(uint64_t a1)
{
  int v2;
  intptr_t v3;
  io_connect_t v4;

  v2 = ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), 0);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = **(_DWORD **)(a1 + 48);
  if (v2)
    return IOAllowPowerChange(v4, v3);
  else
    return IOCancelPowerChange(v4, v3);
}

uint64_t ctu::power::manager::handlePowerChanged_sync(ctu::power::manager *this, ctu::power::manager *a2, char a3)
{
  char *v5;
  NSObject *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  NSObject **v9;
  char *v10;
  char *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  _OWORD *v17;
  std::__shared_weak_count *v18;
  NSObject **v19;
  std::string::size_type v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  char *v24;
  unint64_t *v25;
  NSObject *v26;
  NSObject *global_queue;
  NSObject *v28;
  unint64_t v29;
  _QWORD *v30;
  std::__split_buffer<std::string>::pointer end;
  std::__shared_weak_count *begin;
  unint64_t *p_size;
  unint64_t v34;
  __n128 v35;
  unint64_t v36;
  char *v37;
  unint64_t *v38;
  unint64_t v39;
  NSObject *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  unint64_t *v48;
  unint64_t v49;
  char *v50;
  __n128 v51;
  char *v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t *p_shared_owners;
  unint64_t v62;
  NSObject *v63;
  dispatch_time_t v64;
  std::string::size_type *v65;
  std::string::size_type *v66;
  std::__shared_weak_count *v67;
  std::__shared_weak_count *v68;
  std::__shared_weak_count *v69;
  std::string::size_type v70;
  _OWORD *v71;
  __int128 v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  std::string *v77;
  std::__split_buffer<std::string>::pointer v78;
  std::__split_buffer<std::string>::pointer v79;
  __int128 v80;
  std::__split_buffer<std::string>::pointer v81;
  __int128 v82;
  int64x2_t v83;
  std::string *v84;
  unint64_t *v85;
  unint64_t v86;
  const std::string *v87;
  const std::string *v88;
  unsigned __int8 v89;
  uint64_t v90;
  ctu::power::manager *v91;
  const std::string *i;
  int v93;
  const std::string::value_type *v94;
  std::string::size_type v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  std::string::size_type size;
  char *v104;
  std::string v105;
  uint64_t v106[2];
  std::string v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  NSObject **v110;
  std::__shared_weak_count *v111;
  unsigned __int8 *v112;
  uint64_t v113;
  char v114;
  unsigned int v115[5];
  _OWORD v116[2];
  _QWORD v117[2];
  std::__split_buffer<std::string> v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v115[0] = a2;
  v114 = a3;
  v5 = (char *)operator new(0x20uLL);
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = off_24C96F058;
  v113 = (uint64_t)v5;
  v5[24] = 1;
  v112 = (unsigned __int8 *)(v5 + 24);
  v6 = dispatch_group_create();
  v7 = operator new(0x38uLL);
  v8 = (std::__shared_weak_count *)v7;
  v7[1] = 0;
  v7[2] = 0;
  *v7 = off_24C96F0A8;
  v7[3] = v6;
  v9 = (NSObject **)(v7 + 3);
  if (v6)
  {
    dispatch_retain(v6);
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    dispatch_release(v6);
  }
  else
  {
    v7[4] = 0;
    v7[5] = 0;
    v7[6] = 0;
  }
  v110 = v9;
  v111 = v8;
  ctu::power::manager::asCString(a2);
  _TelephonyUtilDebugPrint();
  v10 = (char *)this + 88;
  v11 = (char *)*((_QWORD *)this + 12);
  if (v11 != v10)
  {
    v104 = v10;
    while (1)
    {
      v12 = (std::__shared_weak_count *)*((_QWORD *)v11 + 3);
      if (v12)
        break;
LABEL_96:
      v11 = (char *)*((_QWORD *)v11 + 1);
      if (v11 == v10)
      {
        v9 = v110;
        goto LABEL_98;
      }
    }
    v13 = *((_QWORD *)v11 + 2);
    p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
    do
      v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
    v16 = std::__shared_weak_count::lock(v12);
    v109 = v16;
    if (!v16)
    {
LABEL_95:
      std::__shared_weak_count::__release_weak(v12);
      goto LABEL_96;
    }
    v108 = v13;
    if (!v13)
    {
      v18 = v16;
LABEL_91:
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v62 = __ldaxr(p_shared_owners);
      while (__stlxr(v62 - 1, p_shared_owners));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
      goto LABEL_95;
    }
    v17 = (_OWORD *)(v13 + 32);
    if (*(char *)(v13 + 55) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v118, *(const std::string::value_type **)(v13 + 32), *(_QWORD *)(v13 + 40));
    }
    else
    {
      *(_OWORD *)&v118.__first_ = *v17;
      v118.__end_ = *(std::__split_buffer<std::string>::pointer *)(v13 + 48);
    }
    ctu::power::manager::asCString((ctu::power::manager *)v115[0]);
    _TelephonyUtilDebugPrint();
    if (SHIBYTE(v118.__end_) < 0)
      operator delete(v118.__first_);
    v19 = v110;
    if (*(char *)(v13 + 55) < 0)
    {
      std::string::__init_copy_ctor_external(&v107, *(const std::string::value_type **)(v13 + 32), *(_QWORD *)(v13 + 40));
    }
    else
    {
      *(_OWORD *)&v107.__r_.__value_.__l.__data_ = *v17;
      v107.__r_.__value_.__r.__words[2] = *(_QWORD *)(v13 + 48);
    }
    v117[0] = v107.__r_.__value_.__l.__size_;
    v20 = v107.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)v117 + 7) = *(std::string::size_type *)((char *)&v107.__r_.__value_.__r.__words[1] + 7);
    v21 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
    memset(&v107, 0, sizeof(v107));
    *(_OWORD *)&v115[1] = 0u;
    memset(v116, 0, sizeof(v116));
    v22 = dispatch_group_create();
    v23 = v22;
    if (v22)
    {
      dispatch_retain(v22);
      dispatch_group_enter(v23);
      dispatch_release(v23);
    }
    v24 = (char *)operator new(0x30uLL);
    *((_QWORD *)v24 + 1) = 0;
    v25 = (unint64_t *)(v24 + 8);
    *((_QWORD *)v24 + 2) = 0;
    *(_QWORD *)v24 = off_24C96EF90;
    *((_QWORD *)v24 + 3) = v20;
    *((_QWORD *)v24 + 4) = v117[0];
    *(_QWORD *)(v24 + 39) = *(_QWORD *)((char *)v117 + 7);
    v24[47] = v21;
    v117[0] = 0;
    *(_QWORD *)((char *)v117 + 7) = 0;
    v105.__r_.__value_.__r.__words[0] = (std::string::size_type)(v24 + 24);
    v105.__r_.__value_.__l.__size_ = (std::string::size_type)v24;
    v26 = *v19;
    if (*v19)
    {
      dispatch_retain(*v19);
      dispatch_group_enter(v26);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v28 = global_queue;
    if (global_queue)
      dispatch_retain(global_queue);
    v118.__first_ = (std::__split_buffer<std::string>::pointer)(v24 + 24);
    v118.__begin_ = (std::__split_buffer<std::string>::pointer)v24;
    do
      v29 = __ldxr(v25);
    while (__stxr(v29 + 1, v25));
    v118.__end_ = (std::__split_buffer<std::string>::pointer)v26;
    if (v26)
    {
      dispatch_retain(v26);
      dispatch_group_enter(v26);
    }
    ctu::os::signpost_interval::signpost_interval(&v118.__end_cap_.__value_, &v115[1]);
    v30 = operator new(0x48uLL);
    *(_OWORD *)v30 = *(_OWORD *)&v118.__first_;
    end = v118.__end_;
    memset(&v118, 0, 24);
    v30[2] = end;
    ctu::os::signpost_interval::signpost_interval(v30 + 3, &v118.__end_cap_.__value_);
    dispatch_group_notify_f(v23, v28, v30, (dispatch_function_t)dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&v118.__end_cap_);
    if (v118.__end_)
    {
      dispatch_group_leave((dispatch_group_t)v118.__end_);
      if (v118.__end_)
        dispatch_release((dispatch_object_t)v118.__end_);
    }
    begin = (std::__shared_weak_count *)v118.__begin_;
    if (!v118.__begin_)
      goto LABEL_37;
    p_size = &v118.__begin_->__r_.__value_.__l.__size_;
    do
      v34 = __ldaxr(p_size);
    while (__stlxr(v34 - 1, p_size));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))begin->__on_zero_shared)(begin);
      std::__shared_weak_count::__release_weak(begin);
      if (!v28)
      {
LABEL_39:
        v35 = *(__n128 *)&v105.__r_.__value_.__l.__data_;
        v37 = (char *)v19[2];
        v36 = (unint64_t)v19[3];
        if ((unint64_t)v37 >= v36)
        {
          v41 = (char *)v19[1];
          v42 = (v37 - v41) >> 4;
          v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 60)
            std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
          size = v105.__r_.__value_.__l.__size_;
          v44 = v36 - (_QWORD)v41;
          if (v44 >> 3 > v43)
            v43 = v44 >> 3;
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0)
            v45 = 0xFFFFFFFFFFFFFFFLL;
          else
            v45 = v43;
          if (v45 >> 60)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v46 = (char *)operator new(16 * v45);
          v47 = &v46[16 * v42];
          v35 = *(__n128 *)&v105.__r_.__value_.__l.__data_;
          *(_OWORD *)v47 = *(_OWORD *)&v105.__r_.__value_.__l.__data_;
          if (size)
          {
            v48 = (unint64_t *)(size + 16);
            do
              v49 = __ldxr(v48);
            while (__stxr(v49 + 1, v48));
            v41 = (char *)v19[1];
            v37 = (char *)v19[2];
          }
          v50 = &v46[16 * v45];
          v40 = (v47 + 16);
          if (v37 == v41)
          {
            v19[1] = v47;
            v19[2] = v40;
            v19[3] = v50;
          }
          else
          {
            do
            {
              v51 = *((__n128 *)v37 - 1);
              v37 -= 16;
              v35 = v51;
              *((__n128 *)v47 - 1) = v51;
              v47 -= 16;
              *(_QWORD *)v37 = 0;
              *((_QWORD *)v37 + 1) = 0;
            }
            while (v37 != v41);
            v41 = (char *)v19[1];
            v52 = (char *)v19[2];
            v19[1] = v47;
            v19[2] = v40;
            v19[3] = v50;
            while (v52 != v41)
            {
              v53 = (std::__shared_weak_count *)*((_QWORD *)v52 - 1);
              if (v53)
                std::__shared_weak_count::__release_weak(v53);
              v52 -= 16;
            }
          }
          if (v41)
            operator delete(v41);
        }
        else
        {
          *(_OWORD *)v37 = *(_OWORD *)&v105.__r_.__value_.__l.__data_;
          if (v35.n128_u64[1])
          {
            v38 = (unint64_t *)(v35.n128_u64[1] + 16);
            do
              v39 = __ldxr(v38);
            while (__stxr(v39 + 1, v38));
          }
          v40 = (v37 + 16);
        }
        v19[2] = v40;
        if (v26)
        {
          dispatch_group_leave(v26);
          dispatch_release(v26);
        }
        if (v105.__r_.__value_.__l.__size_)
        {
          v54 = (unint64_t *)(v105.__r_.__value_.__l.__size_ + 8);
          do
            v55 = __ldaxr(v54);
          while (__stlxr(v55 - 1, v54));
          if (!v55)
          {
            (*(void (**)(std::string::size_type, __n128))(*(_QWORD *)v105.__r_.__value_.__l.__size_ + 16))(v105.__r_.__value_.__l.__size_, v35);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v105.__r_.__value_.__l.__size_);
          }
        }
        ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&v115[1]);
        if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v107.__r_.__value_.__l.__data_);
        v118.__first_ = (std::__split_buffer<std::string>::pointer)v23;
        if (v23)
          dispatch_retain(v23);
        v56 = (std::__shared_weak_count *)v113;
        v106[0] = (uint64_t)v112;
        v106[1] = v113;
        if (v113)
        {
          v57 = (unint64_t *)(v113 + 8);
          do
            v58 = __ldxr(v57);
          while (__stxr(v58 + 1, v57));
        }
        ctu::power::manager::listenerHandle::operator()(v13, v115, (uint64_t)&v114, (dispatch_object_t *)&v118, v106);
        if (v56)
        {
          v59 = (unint64_t *)&v56->__shared_owners_;
          do
            v60 = __ldaxr(v59);
          while (__stlxr(v60 - 1, v59));
          if (!v60)
          {
            ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
            std::__shared_weak_count::__release_weak(v56);
          }
        }
        if (v118.__first_)
          dispatch_release((dispatch_object_t)v118.__first_);
        if (v23)
        {
          dispatch_group_leave(v23);
          dispatch_release(v23);
        }
        v18 = v109;
        v10 = v104;
        if (!v109)
          goto LABEL_95;
        goto LABEL_91;
      }
    }
    else
    {
LABEL_37:
      if (!v28)
        goto LABEL_39;
    }
    dispatch_release(v28);
    goto LABEL_39;
  }
LABEL_98:
  v63 = *v9;
  v64 = dispatch_time(0, 30250000000);
  if (dispatch_group_wait(v63, v64))
  {
    *(_QWORD *)&v116[0] = 0;
    *(_OWORD *)&v115[1] = 0uLL;
    v65 = (std::string::size_type *)v9[1];
    v66 = (std::string::size_type *)v9[2];
    if (v65 == v66)
    {
      v88 = 0;
      v87 = 0;
    }
    else
    {
      do
      {
        v67 = (std::__shared_weak_count *)v65[1];
        if (v67)
        {
          v68 = std::__shared_weak_count::lock(v67);
          v105.__r_.__value_.__l.__size_ = (std::string::size_type)v68;
          if (v68)
          {
            v69 = v68;
            v70 = *v65;
            v105.__r_.__value_.__r.__words[0] = v70;
            if (v70)
            {
              v71 = *(_OWORD **)&v115[3];
              if (*(_QWORD *)&v115[3] >= *(_QWORD *)&v116[0])
              {
                v73 = *(_QWORD *)&v115[1];
                v74 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v115[3] - *(_QWORD *)&v115[1]) >> 3);
                v75 = v74 + 1;
                if (v74 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((uint64_t)(*(_QWORD *)&v116[0] - *(_QWORD *)&v115[1]) >> 3) > v75)
                  v75 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)&v116[0] - *(_QWORD *)&v115[1]) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v116[0] - *(_QWORD *)&v115[1]) >> 3) >= 0x555555555555555)
                  v76 = 0xAAAAAAAAAAAAAAALL;
                else
                  v76 = v75;
                v118.__end_cap_.__value_ = (std::allocator<std::string> *)v116;
                if (v76)
                {
                  if (v76 > 0xAAAAAAAAAAAAAAALL)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v77 = (std::string *)operator new(24 * v76);
                }
                else
                {
                  v77 = 0;
                }
                v79 = v77 + v74;
                v118.__first_ = v77;
                v118.__begin_ = v79;
                v118.__end_ = v79;
                v118.__end_cap_.__value_ = &v77[v76];
                if (*(char *)(v70 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external(v79, *(const std::string::value_type **)v70, *(_QWORD *)(v70 + 8));
                  v71 = *(_OWORD **)&v115[3];
                  v73 = *(_QWORD *)&v115[1];
                  v81 = v118.__end_;
                  v79 = v118.__begin_;
                }
                else
                {
                  v80 = *(_OWORD *)v70;
                  v79->__r_.__value_.__r.__words[2] = *(_QWORD *)(v70 + 16);
                  *(_OWORD *)&v79->__r_.__value_.__l.__data_ = v80;
                  v81 = v77 + v74;
                }
                if (v71 == (_OWORD *)v73)
                {
                  v83 = vdupq_n_s64(v73);
                }
                else
                {
                  do
                  {
                    v82 = *(_OWORD *)((char *)v71 - 24);
                    v79[-1].__r_.__value_.__r.__words[2] = *((_QWORD *)v71 - 1);
                    *(_OWORD *)&v79[-1].__r_.__value_.__l.__data_ = v82;
                    --v79;
                    *((_QWORD *)v71 - 2) = 0;
                    *((_QWORD *)v71 - 1) = 0;
                    *((_QWORD *)v71 - 3) = 0;
                    v71 = (_OWORD *)((char *)v71 - 24);
                  }
                  while (v71 != (_OWORD *)v73);
                  v83 = *(int64x2_t *)&v115[1];
                }
                v78 = v81 + 1;
                *(_QWORD *)&v115[1] = v79;
                *(_QWORD *)&v115[3] = v81 + 1;
                *(int64x2_t *)&v118.__begin_ = v83;
                v84 = *(std::string **)&v116[0];
                *(_QWORD *)&v116[0] = v118.__end_cap_.__value_;
                v118.__end_cap_.__value_ = v84;
                v118.__first_ = (std::__split_buffer<std::string>::pointer)v83.i64[0];
                std::__split_buffer<std::string>::~__split_buffer(&v118);
              }
              else
              {
                if (*(char *)(v70 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external(*(std::string **)&v115[3], *(const std::string::value_type **)v70, *(_QWORD *)(v70 + 8));
                }
                else
                {
                  v72 = *(_OWORD *)v70;
                  *(_QWORD *)(*(_QWORD *)&v115[3] + 16) = *(_QWORD *)(v70 + 16);
                  *v71 = v72;
                }
                v78 = (std::__split_buffer<std::string>::pointer)((char *)v71 + 24);
              }
              *(_QWORD *)&v115[3] = v78;
            }
            v85 = (unint64_t *)&v69->__shared_owners_;
            do
              v86 = __ldaxr(v85);
            while (__stlxr(v86 - 1, v85));
            if (!v86)
            {
              ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
              std::__shared_weak_count::__release_weak(v69);
            }
          }
        }
        v65 += 2;
      }
      while (v65 != v66);
      v87 = *(const std::string **)&v115[3];
      v88 = *(const std::string **)&v115[1];
    }
    v91 = (ctu::power::manager *)v115[0];
    memset(&v105, 0, sizeof(v105));
    if (v88 != v87)
    {
      std::string::operator=(&v105, v88);
      for (i = v88 + 1; i != v87; ++i)
      {
        HIBYTE(v118.__end_) = 1;
        LOWORD(v118.__first_) = 44;
        std::string::append(&v105, (const std::string::value_type *)&v118, 1uLL);
        if (SHIBYTE(v118.__end_) < 0)
          operator delete(v118.__first_);
        v93 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
        if (v93 >= 0)
          v94 = (const std::string::value_type *)i;
        else
          v94 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
        if (v93 >= 0)
          v95 = HIBYTE(i->__r_.__value_.__r.__words[2]);
        else
          v95 = i->__r_.__value_.__l.__size_;
        std::string::append(&v105, v94, v95);
      }
    }
    ctu::power::manager::asCString(v91);
    _TelephonyUtilDebugPrint();
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v105.__r_.__value_.__l.__data_);
    v118.__first_ = (std::__split_buffer<std::string>::pointer)&v115[1];
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v118);
    v90 = 0;
  }
  else
  {
    ctu::power::manager::asCString((ctu::power::manager *)v115[0]);
    _TelephonyUtilDebugPrint();
    v89 = atomic_load(v112);
    v90 = v89 & 1;
  }
  v96 = v111;
  if (v111)
  {
    v97 = (unint64_t *)&v111->__shared_owners_;
    do
      v98 = __ldaxr(v97);
    while (__stlxr(v98 - 1, v97));
    if (!v98)
    {
      ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
      std::__shared_weak_count::__release_weak(v96);
    }
  }
  v99 = (std::__shared_weak_count *)v113;
  if (v113)
  {
    v100 = (unint64_t *)(v113 + 8);
    do
      v101 = __ldaxr(v100);
    while (__stlxr(v101 - 1, v100));
    if (!v101)
    {
      ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
      std::__shared_weak_count::__release_weak(v99);
    }
  }
  return v90;
}

void sub_20E5B184C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,uint64_t a35,char a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42)
{
  if (a24 < 0)
    operator delete(__p);
  __p = &a41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)&a36);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)&a38);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t __destroy_helper_block_e8_32c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t a1)
{
  return std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 32);
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_5(uint64_t a1)
{
  ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), *(_BYTE *)(a1 + 68));
  return IOAllowPowerChange(**(_DWORD **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_7(uint64_t a1)
{
  ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), *(_BYTE *)(a1 + 68));
  return IOAllowPowerChange(**(_DWORD **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

const char *ctu::power::manager::asCString(ctu::power::manager *this)
{
  unsigned int v1;
  unint64_t v2;

  HIDWORD(v2) = (_DWORD)this;
  LODWORD(v2) = (_DWORD)this + 536870288;
  v1 = v2 >> 4;
  if (v1 > 0xB)
    return "???";
  else
    return off_24C96F160[v1];
}

void ctu::power::manager::listenerHandle::operator()(uint64_t a1, unsigned int *a2, uint64_t a3, dispatch_object_t *a4, uint64_t *a5)
{
  NSObject *v9;
  const void *v10;
  void *v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  const void *v15;
  void *v16;
  const void *v17;
  NSObject *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD v32[4];
  void *v33;
  unsigned int *v34;
  uint64_t v35;
  dispatch_group_t object;
  uint64_t v37;
  std::__shared_weak_count *v38;
  _QWORD block[4];
  void *aBlock;
  unsigned int *v41;
  dispatch_group_t group;
  uint64_t v43;
  std::__shared_weak_count *v44;

  v9 = *a4;
  if (*a4)
  {
    dispatch_retain(*a4);
    dispatch_group_enter(v9);
  }
  ctu::power::manager::asCString((ctu::power::manager *)*a2);
  _TelephonyUtilDebugPrint();
  v10 = *(const void **)(a1 + 8);
  if (v10)
  {
    v11 = _Block_copy(v10);
    v12 = v11;
    v13 = *(NSObject **)a1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_35;
    if (v11)
      v14 = _Block_copy(v11);
    else
      v14 = 0;
    aBlock = v14;
    v41 = a2;
    group = v9;
    if (v9)
    {
      dispatch_retain(v9);
      dispatch_group_enter(v9);
    }
    v20 = (std::__shared_weak_count *)a5[1];
    v43 = *a5;
    v44 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldxr(p_shared_owners);
      while (__stxr(v22 + 1, p_shared_owners));
    }
    dispatch_async(v13, block);
    v23 = v44;
    if (v44)
    {
      v24 = (unint64_t *)&v44->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    if (group)
    {
      dispatch_group_leave(group);
      if (group)
        dispatch_release(group);
    }
    if (aBlock)
      _Block_release(aBlock);
    if (v12)
      _Block_release(v12);
  }
  else
  {
    v15 = *(const void **)(a1 + 16);
    if (v15)
    {
      v16 = _Block_copy(v15);
      v17 = v16;
      v18 = *(NSObject **)a1;
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 1174405120;
      v32[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_36;
      v32[3] = &__block_descriptor_tmp_39;
      if (v16)
        v19 = _Block_copy(v16);
      else
        v19 = 0;
      v33 = v19;
      v34 = a2;
      v35 = a3;
      object = v9;
      if (v9)
      {
        dispatch_retain(v9);
        dispatch_group_enter(v9);
      }
      v26 = (std::__shared_weak_count *)a5[1];
      v37 = *a5;
      v38 = v26;
      if (v26)
      {
        v27 = (unint64_t *)&v26->__shared_owners_;
        do
          v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }
      dispatch_async(v18, v32);
      v29 = v38;
      if (v38)
      {
        v30 = (unint64_t *)&v38->__shared_owners_;
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      if (object)
      {
        dispatch_group_leave(object);
        if (object)
          dispatch_release(object);
      }
      if (v33)
        _Block_release(v33);
      if (v17)
        _Block_release(v17);
    }
  }
  if (v9)
  {
    dispatch_group_leave(v9);
    dispatch_release(v9);
  }
}

void sub_20E5B1D70(_Unwind_Exception *exception_object)
{
  NSObject *v1;

  if (v1)
  {
    dispatch_group_leave(v1);
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::simulateNotification(ctu::power::manager *this, int a2, char a3)
{
  NSObject *v3;
  _QWORD v4[5];
  int v5;
  char v6;

  v3 = *((_QWORD *)this + 2);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3ctu5power7manager20simulateNotificationEjb_block_invoke;
  v4[3] = &__block_descriptor_tmp_14;
  v4[4] = this;
  v5 = a2;
  v6 = a3;
  dispatch_async(v3, v4);
}

void ctu::power::manager::registerListener(ctu::power::manager *a1@<X0>, __CFRunLoop **a2@<X1>, std::__shared_weak_count_vtbl **a3@<X8>)
{
  std::__shared_weak_count *v4;
  void *v5;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count_vtbl *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  NSObject *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD block[5];
  void *v29[8];
  std::__shared_weak_count *v30;
  _QWORD aBlock[5];
  void *v32[8];
  std::__shared_weak_count *v33;
  void *v34[2];
  std::__shared_weak_count *v35;

  v5 = *(void **)a1;
  v4 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
  v34[1] = v5;
  if (!v4 || (v8 = std::__shared_weak_count::lock(v4), (v35 = v8) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v9 = v8;
  *a3 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a3[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v10 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_23;
  aBlock[4] = a1;
  ctu::power::manager::parameters::parameters(v32, (uint64_t)a2);
  v32[7] = v5;
  v33 = v9;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v14 = _Block_copy(aBlock);
  v34[0] = v14;
  ctu::power::manager::listenerHandle::listenerHandle((uint64_t)v10, (uint64_t)a2, v34);
  *a3 = v10;
  v15 = (std::__shared_weak_count *)operator new(0x20uLL);
  v15->__shared_owners_ = 0;
  v16 = (unint64_t *)&v15->__shared_owners_;
  v15->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F0F8;
  v15->__shared_weak_owners_ = 0;
  v15[1].__vftable = v10;
  a3[1] = (std::__shared_weak_count_vtbl *)v15;
  if (v14)
    _Block_release(v14);
  _TelephonyUtilDebugPrint();
  v17 = *((_QWORD *)a1 + 2);
  block[0] = v11;
  block[1] = 1174405120;
  block[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_25;
  block[3] = &__block_descriptor_tmp_26;
  block[4] = a1;
  ctu::power::manager::parameters::parameters(v29, (uint64_t)a2);
  v29[7] = v10;
  v30 = v15;
  do
    v18 = __ldxr(v16);
  while (__stxr(v18 + 1, v16));
  dispatch_async(v17, block);
  if ((unint64_t)*a2 >= 2)
    ctu::power::manager::addPowerSourceToRunLoop(a1, *a2);
  v19 = v30;
  if (v30)
  {
    v20 = (unint64_t *)&v30->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  ctu::power::manager::parameters::~parameters(v29);
  v22 = v33;
  if (v33)
  {
    v23 = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  ctu::power::manager::parameters::~parameters(v32);
  v25 = v35;
  if (v35)
  {
    v26 = (unint64_t *)&v35->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
}

void sub_20E5B2094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  void **v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v15);
  ctu::power::manager::parameters::~parameters(v14);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v13);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a12);
  ctu::power::manager::parameters::~parameters(v12);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v16 - 120);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  __CFRunLoop *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD v12[6];
  std::__shared_weak_count *v13;
  void *v14[7];

  v2 = a1[4];
  _TelephonyUtilDebugPrint();
  v3 = (__CFRunLoop *)a1[5];
  if ((unint64_t)v3 >= 2)
    ctu::power::manager::removePowerSourceFromRunLoop((CFRunLoopSourceRef *)v2, v3);
  v4 = *(NSObject **)(v2 + 16);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1174405120;
  v12[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_2;
  v12[3] = &__block_descriptor_tmp_22;
  v6 = a1[12];
  v5 = (std::__shared_weak_count *)a1[13];
  v12[4] = v2;
  v12[5] = v6;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ctu::power::manager::parameters::parameters(v14, (uint64_t)(a1 + 5));
  dispatch_async(v4, v12);
  ctu::power::manager::parameters::~parameters(v14);
  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_20E5B225C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t ctu::power::manager::removePowerSourceFromRunLoop(CFRunLoopSourceRef *this, __CFRunLoop *a2)
{
  int v4;
  _QWORD v6[2];

  v6[0] = this + 3;
  v6[1] = 0xAAAAAAAAAAAAAA01;
  MEMORY[0x212BBF848]();
  _TelephonyUtilDebugPrint();
  CFRunLoopRemoveSource(a2, this[6], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  v4 = *((_DWORD *)this + 14) - 1;
  *((_DWORD *)this + 14) = v4;
  if (!v4)
    ctu::power::manager::deregisterPowerSource_sync((io_object_t *)this);
  return std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)v6);
}

void sub_20E5B2300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    v2 = *(_DWORD *)(v1 + 80) - 1;
    *(_DWORD *)(v1 + 80) = v2;
    if (!v2)
    {
      ctu::power::manager::removePowerSourceFromRunLoop((CFRunLoopSourceRef *)v1, *(__CFRunLoop **)(v1 + 72));
      ctu::power::manager::killRunLoopThread_sync((ctu::power::manager *)v1);
    }
  }
  v3 = *(uint64_t **)(v1 + 96);
  while (v3 != (uint64_t *)(v1 + 88))
  {
    v4 = (std::__shared_weak_count *)v3[3];
    if (v4)
    {
      v5 = std::__shared_weak_count::lock(v4);
      if (v5 && v3[2])
      {
        v3 = (uint64_t *)v3[1];
        goto LABEL_14;
      }
    }
    else
    {
      v5 = 0;
    }
    v6 = *v3;
    v7 = (uint64_t *)v3[1];
    *(_QWORD *)(v6 + 8) = v7;
    *(_QWORD *)v3[1] = v6;
    --*(_QWORD *)(v1 + 104);
    v8 = (std::__shared_weak_count *)v3[3];
    if (v8)
      std::__shared_weak_count::__release_weak(v8);
    operator delete(v3);
    v3 = v7;
    if (v5)
    {
LABEL_14:
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

uint64_t ctu::power::manager::killRunLoopThread_sync(ctu::power::manager *this)
{
  _TelephonyUtilDebugPrint();
  CFRunLoopStop(*((CFRunLoopRef *)this + 9));
  *((_QWORD *)this + 9) = 0;
  pthread_join(*((pthread_t *)this + 8), 0);
  *((_QWORD *)this + 8) = 0;
  return _TelephonyUtilDebugPrint();
}

_QWORD *__copy_helper_block_e8_40c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE56c37_ZTSKN3ctu5power7manager10parametersE(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  a1[5] = *(_QWORD *)(a2 + 40);
  a1[6] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return ctu::power::manager::parameters::parameters(a1 + 7, a2 + 56);
}

void sub_20E5B24C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __destroy_helper_block_e8_40c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE56c37_ZTSKN3ctu5power7manager10parametersE(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 40;
  ctu::power::manager::parameters::~parameters((void **)(a1 + 56));
  return std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
}

_QWORD *__copy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  result = ctu::power::manager::parameters::parameters(a1 + 5, a2 + 40);
  v5 = *(_QWORD *)(a2 + 104);
  a1[12] = *(_QWORD *)(a2 + 96);
  a1[13] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 40);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 96);
  ctu::power::manager::parameters::~parameters(v1);
}

void sub_20E5B2614(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::spawnRunLoopThread_sync(pthread_t *this)
{
  NSObject *v2;
  _QWORD v3[5];
  dispatch_object_t object;

  _TelephonyUtilDebugPrint();
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 1174405120;
  v3[2] = ___ZN3ctu5power7manager23spawnRunLoopThread_syncEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_28;
  v3[4] = this;
  object = v2;
  if (v2)
    dispatch_retain(v2);
  pthread_create(this + 8, 0, (void *(__cdecl *)(void *))ctu::power::manager::_runLoopThread, v3);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  if (object)
    dispatch_release(object);
  if (v2)
    dispatch_release(v2);
}

void sub_20E5B26E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_object_t object)
{
  NSObject *v14;

  if (object)
    dispatch_release(object);
  if (v14)
    dispatch_release(v14);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::power::manager::addPowerSourceToRunLoop(ctu::power::manager *this, __CFRunLoop *a2)
{
  int v4;
  __CFRunLoopSource *RunLoopSource;
  _QWORD v7[2];

  v7[0] = (char *)this + 24;
  v7[1] = 0xAAAAAAAAAAAAAA01;
  MEMORY[0x212BBF848]();
  _TelephonyUtilDebugPrint();
  v4 = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v4 + 1;
  if (v4)
  {
    RunLoopSource = (__CFRunLoopSource *)*((_QWORD *)this + 6);
  }
  else
  {
    *((_DWORD *)this + 7) = IORegisterForSystemPower((char *)this + 28, (IONotificationPortRef *)this + 5, (IOServiceInterestCallback)ctu::power::manager::_powerChanged, (io_object_t *)this + 8);
    RunLoopSource = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 5));
    *((_QWORD *)this + 6) = RunLoopSource;
  }
  CFRunLoopAddSource(a2, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  return std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)v7);
}

void sub_20E5B27D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c62_ZTSNSt3__110shared_ptrIN3ctu5power7manager14listenerHandleEEE(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  result = ctu::power::manager::parameters::parameters(a1 + 5, a2 + 40);
  v5 = *(_QWORD *)(a2 + 104);
  a1[12] = *(_QWORD *)(a2 + 96);
  a1[13] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c62_ZTSNSt3__110shared_ptrIN3ctu5power7manager14listenerHandleEEE(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 40);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 96);
  ctu::power::manager::parameters::~parameters(v1);
}

void ___ZN3ctu5power7manager23spawnRunLoopThread_syncEv_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 72) = CFRunLoopGetCurrent();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __copy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
    dispatch_retain(v3);
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(a1 + 40);
  if (v1)
    dispatch_release(v1);
}

uint64_t ctu::power::manager::_runLoopThread(void (**this)(ctu::power::manager *), void *a2)
{
  const __CFString *v3;

  _TelephonyUtilDebugPrint();
  this[2]((ctu::power::manager *)this);
  v3 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  while (CFRunLoopRunInMode(v3, 1.79769313e308, 1u) != kCFRunLoopRunStopped)
    ;
  return 0;
}

uint64_t ctu::power::manager::listenerHandle::listenerHandle(uint64_t a1, uint64_t a2, void **a3)
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;

  v6 = *(NSObject **)(a2 + 8);
  *(_QWORD *)a1 = v6;
  if (v6)
    dispatch_retain(v6);
  v7 = *(void **)(a2 + 16);
  if (v7)
    v7 = _Block_copy(v7);
  *(_QWORD *)(a1 + 8) = v7;
  v8 = *(void **)(a2 + 24);
  if (v8)
    v8 = _Block_copy(v8);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = *a3;
  if (*a3)
    v9 = _Block_copy(v9);
  *(_QWORD *)(a1 + 24) = v9;
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), *(const std::string::value_type **)(a2 + 32), *(_QWORD *)(a2 + 40));
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = v10;
  }
  _TelephonyUtilDebugPrint();
  return a1;
}

void sub_20E5B29E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;
  const void *v4;
  const void *v5;

  v3 = *(const void **)(v1 + 24);
  if (v3)
    _Block_release(v3);
  v4 = *(const void **)(v1 + 16);
  if (v4)
    _Block_release(v4);
  v5 = *(const void **)(v1 + 8);
  if (v5)
    _Block_release(v5);
  if (*(_QWORD *)v1)
    dispatch_release(*(dispatch_object_t *)v1);
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::listenerHandle::~listenerHandle(ctu::power::manager::listenerHandle *this)
{
  const void *v2;
  const void *v3;
  const void *v4;

  (*(void (**)(void))(*((_QWORD *)this + 3) + 16))();
  _TelephonyUtilDebugPrint();
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
    _Block_release(v2);
  v3 = (const void *)*((_QWORD *)this + 2);
  if (v3)
    _Block_release(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  if (v4)
    _Block_release(v4);
  if (*(_QWORD *)this)
    dispatch_release(*(dispatch_object_t *)this);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  unsigned int *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD v12[4];
  dispatch_group_t group;
  uint64_t v14;
  std::__shared_weak_count *v15;
  void *v16;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1174405120;
  v12[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2;
  v12[3] = &__block_descriptor_tmp_34;
  v3 = (unsigned int *)a1[5];
  v2 = a1[6];
  group = v2;
  if (v2)
  {
    dispatch_retain(v2);
    dispatch_group_enter(v2);
  }
  v4 = (std::__shared_weak_count *)a1[8];
  v14 = a1[7];
  v15 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = a1[4];
  v8 = *v3;
  v16 = _Block_copy(v12);
  (*(void (**)(uint64_t, uint64_t, void **))(v7 + 16))(v7, v8, &v16);
  if (v16)
    _Block_release(v16);
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
}

void sub_20E5B2C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, dispatch_group_t group)
{
  uint64_t v13;
  uint64_t v14;
  const void *v16;

  v16 = *(const void **)(v14 - 40);
  if (v16)
    _Block_release(v16);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v13);
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2(uint64_t a1, char a2)
{
  unsigned __int8 v2;

  v2 = atomic_load(*(unsigned __int8 **)(a1 + 40));
  atomic_store(v2 & a2, *(unsigned __int8 **)(a1 + 40));
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE40c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v4 = a2[4];
  a1[4] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    v5 = a1[4];
    if (v5)
      dispatch_group_enter(v5);
  }
  v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE40c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 40);
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
      dispatch_release(v3);
  }
}

void __copy_helper_block_e8_32c70_ZTSN8dispatch5blockIU13block_pointerFvjNS0_IU13block_pointerFvbEEEEEE48c30_ZTSN8dispatch13group_sessionE56c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v4 = (void *)a2[4];
  if (v4)
    v4 = _Block_copy(v4);
  a1[4] = v4;
  v5 = a2[6];
  a1[6] = v5;
  if (v5)
  {
    dispatch_retain(v5);
    v6 = a1[6];
    if (v6)
      dispatch_group_enter(v6);
  }
  v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
}

void __destroy_helper_block_e8_32c70_ZTSN8dispatch5blockIU13block_pointerFvjNS0_IU13block_pointerFvbEEEEEE48c30_ZTSN8dispatch13group_sessionE56c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 56);
  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 48);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
    _Block_release(v4);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_36(_QWORD *a1)
{
  unsigned int *v2;
  unsigned __int8 *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD v14[4];
  dispatch_group_t group;
  uint64_t v16;
  std::__shared_weak_count *v17;
  void *v18;

  v2 = (unsigned int *)a1[5];
  v3 = (unsigned __int8 *)a1[6];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1174405120;
  v14[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2_37;
  v14[3] = &__block_descriptor_tmp_38;
  v4 = a1[7];
  group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(v4);
  }
  v5 = (std::__shared_weak_count *)a1[9];
  v16 = a1[8];
  v17 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = a1[4];
  v9 = *v2;
  v10 = *v3;
  v18 = _Block_copy(v14);
  (*(void (**)(uint64_t, uint64_t, BOOL, void **))(v8 + 16))(v8, v9, v10 != 0, &v18);
  if (v18)
    _Block_release(v18);
  v11 = v17;
  if (v17)
  {
    v12 = (unint64_t *)&v17->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
}

void sub_20E5B2F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, dispatch_group_t group)
{
  uint64_t v13;
  uint64_t v14;
  const void *v16;

  v16 = *(const void **)(v14 - 40);
  if (v16)
    _Block_release(v16);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v13);
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2_37(uint64_t a1, char a2)
{
  unsigned __int8 v2;

  v2 = atomic_load(*(unsigned __int8 **)(a1 + 40));
  atomic_store(v2 & a2, *(unsigned __int8 **)(a1 + 40));
}

void __copy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvjbNS0_IU13block_pointerFvbEEEEEE56c30_ZTSN8dispatch13group_sessionE64c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v4 = (void *)a2[4];
  if (v4)
    v4 = _Block_copy(v4);
  a1[4] = v4;
  v5 = a2[7];
  a1[7] = v5;
  if (v5)
  {
    dispatch_retain(v5);
    v6 = a1[7];
    if (v6)
      dispatch_group_enter(v6);
  }
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
}

void __destroy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvjbNS0_IU13block_pointerFvbEEEEEE56c30_ZTSN8dispatch13group_sessionE64c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1 + 64);
  v2 = *(NSObject **)(a1 + 56);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 56);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
    _Block_release(v4);
}

void std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  std::__shared_weak_count *v6;

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
        v5 = (uint64_t *)v3[1];
        v6 = (std::__shared_weak_count *)v3[3];
        if (v6)
          std::__shared_weak_count::__release_weak(v6);
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

uint64_t ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}::~signpost_interval(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 24));
  v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 16);
    if (v3)
      dispatch_release(v3);
  }
  return std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C96EF90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C96EF90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<std::string>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

void dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;

  if (a1)
  {
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 24));
    v2 = *(NSObject **)(a1 + 16);
    if (v2)
    {
      dispatch_group_leave(v2);
      v3 = *(NSObject **)(a1 + 16);
      if (v3)
        dispatch_release(v3);
    }
    v4 = (void *)std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](a1);
    operator delete(v4);
  }
}

_QWORD *ctu::os::signpost_interval::signpost_interval(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2 + 2;
  v6 = a2 + 5;
  v7 = (_QWORD *)a2[5];
  if (!v7)
  {
    v6 = a1 + 5;
    goto LABEL_5;
  }
  if (v7 != v5)
  {
    a1[5] = v7;
LABEL_5:
    *v6 = 0;
    goto LABEL_7;
  }
  a1[5] = a1 + 2;
  (*(void (**)(_QWORD))(*(_QWORD *)*v6 + 24))(*v6);
LABEL_7:
  *a2 = 0;
  a2[1] = 0;
  v8 = (_QWORD *)a2[5];
  a2[5] = 0;
  if (v8 == v5)
  {
    v9 = 4;
    v8 = v5;
    goto LABEL_11;
  }
  if (v8)
  {
    v9 = 5;
LABEL_11:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  return a1;
}

void std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void ctu::os::signpost_interval::~signpost_interval(ctu::os::signpost_interval *this)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  ctu::os::signpost_interval *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *((_QWORD *)this + 5);
  if (v2 && *(_QWORD *)this)
  {
    v3 = *((_QWORD *)this + 1);
    v10 = *(_QWORD *)this;
    v11 = v3;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v2 + 48))(v2, &v11, &v10);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
    os_release(v4);
  v5 = (_QWORD *)((char *)this + 16);
  *((_QWORD *)this + 1) = 0;
  v6 = (ctu::os::signpost_interval *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v6 == (ctu::os::signpost_interval *)((char *)this + 16))
  {
    v7 = 4;
    v6 = (ctu::os::signpost_interval *)((char *)this + 16);
  }
  else
  {
    if (!v6)
    {
      *(_QWORD *)this = 0;
      return;
    }
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
  v8 = (_QWORD *)*((_QWORD *)this + 5);
  *(_QWORD *)this = 0;
  if (v8 == v5)
  {
    v9 = 4;
  }
  else
  {
    if (!v8)
      return;
    v9 = 5;
    v5 = v8;
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v9))(v5);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *ctu::power::manager::parameters::parameters(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  std::string *v7;
  __int128 v8;

  *a1 = *(_QWORD *)a2;
  v4 = *(NSObject **)(a2 + 8);
  a1[1] = v4;
  if (v4)
    dispatch_retain(v4);
  v5 = *(void **)(a2 + 16);
  if (v5)
    v5 = _Block_copy(v5);
  a1[2] = v5;
  v6 = *(void **)(a2 + 24);
  if (v6)
    v6 = _Block_copy(v6);
  a1[3] = v6;
  v7 = (std::string *)(a1 + 4);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 32), *(_QWORD *)(a2 + 40));
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 32);
    a1[6] = *(_QWORD *)(a2 + 48);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  return a1;
}

void sub_20E5B340C(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  const void *v3;
  const void *v4;
  NSObject *v5;

  v3 = (const void *)v1[3];
  if (v3)
    _Block_release(v3);
  v4 = (const void *)v1[2];
  if (v4)
    _Block_release(v4);
  v5 = v1[1];
  if (v5)
    dispatch_release(v5);
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::parameters::~parameters(void **this)
{
  const void *v2;
  const void *v3;
  NSObject *v4;

  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  v2 = this[3];
  if (v2)
    _Block_release(v2);
  v3 = this[2];
  if (v3)
    _Block_release(v3);
  v4 = this[1];
  if (v4)
    dispatch_release(v4);
}

void std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::__on_zero_shared(uint64_t a1)
{
  ctu::power::manager *v1;
  void *v2;

  v1 = *(ctu::power::manager **)(a1 + 24);
  if (v1)
  {
    ctu::power::manager::~manager(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_emplace<std::atomic<BOOL>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F058;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::atomic<BOOL>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F058;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F0A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F0A8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::__on_zero_shared(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;

  v2 = a1[4];
  if (v2)
  {
    v3 = a1[5];
    v4 = (void *)a1[4];
    if (v3 != v2)
    {
      do
      {
        v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5)
          std::__shared_weak_count::__release_weak(v5);
        v3 -= 16;
      }
      while (v3 != v2);
      v4 = (void *)a1[4];
    }
    a1[5] = v2;
    operator delete(v4);
  }
  v6 = a1[3];
  if (v6)
    dispatch_release(v6);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::__on_zero_shared(uint64_t a1)
{
  ctu::power::manager::listenerHandle *v1;
  void *v2;

  v1 = *(ctu::power::manager::listenerHandle **)(a1 + 24);
  if (v1)
  {
    ctu::power::manager::listenerHandle::~listenerHandle(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    MEMORY[0x212BBF854](*(_QWORD *)a1);
  return a1;
}

uint64_t ctu::iokit::asString@<X0>(ctu::iokit *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = this;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x212BBF8B4](a2, v4, " | ");
}

void sub_20E5B38D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOHIDController::create(NSObject **a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X8>)
{
  std::__shared_weak_count_vtbl *v6;
  NSObject *v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v11;
  unint64_t v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  dispatch_object_t object;
  dispatch_object_t v26;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v6 = (std::__shared_weak_count_vtbl *)operator new(0x48uLL);
  v7 = *a1;
  v26 = v7;
  if (v7)
    dispatch_retain(v7);
  v8 = *a2;
  object = v8;
  if (v8)
    dispatch_retain(v8);
  ctu::iokit::IOHIDController::IOHIDController((uint64_t)v6, &v26, &object);
  v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F1D0;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = v6;
  v11 = (std::__shared_weak_count *)v6->~__shared_weak_count_0;
  if (v11)
  {
    if (v11->__shared_owners_ != -1)
      goto LABEL_18;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v6;
    v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v9;
    std::__shared_weak_count::__release_weak(v11);
  }
  else
  {
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    v16 = (unint64_t *)&v9->__shared_weak_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v6;
    v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v9;
  }
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
LABEL_18:
  v19 = *(std::__shared_weak_count **)(a3 + 8);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v9;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (object)
    dispatch_release(object);
  if (v26)
    dispatch_release(v26);
  if (*(_QWORD *)a3)
  {
    if ((ctu::iokit::IOHIDController::init(*(ctu::iokit::IOHIDController **)a3) & 1) == 0)
    {
      v22 = *(std::__shared_weak_count **)(a3 + 8);
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      if (v22)
      {
        v23 = (unint64_t *)&v22->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
  }
}

void sub_20E5B3AE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::IOHIDController::init(ctu::iokit::IOHIDController *this)
{
  uint64_t v2;
  uint64_t result;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  NSObject *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v2 = capabilities::txpower::supportsHandDetection(this);
  if ((v2 & 1) != 0 || (result = capabilities::txpower::supportsKeyboard((capabilities::txpower *)v2), (_DWORD)result))
  {
    v4 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (!v4 || (v5 = *(_QWORD *)this, (v6 = std::__shared_weak_count::lock(v4)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v7 = v6;
    v8 = operator new(8uLL);
    *v8 = this;
    v9 = *((_QWORD *)this + 2);
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v12 = operator new(0x18uLL);
    *v12 = v8;
    v12[1] = v5;
    v12[2] = v7;
    dispatch_async_f(v9, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::init(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::init(void)::$_0>>)::{lambda(void *)#1}::__invoke);
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    return 1;
  }
  return result;
}

uint64_t ctu::iokit::IOHIDController::IOHIDController(uint64_t a1, NSObject **a2, NSObject **a3)
{
  NSObject *v5;
  NSObject *v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v5 = *a2;
  *(_QWORD *)(a1 + 16) = *a2;
  if (v5)
    dispatch_retain(v5);
  v6 = *a3;
  *(_QWORD *)(a1 + 24) = *a3;
  if (v6)
    dispatch_retain(v6);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  return a1;
}

void ctu::iokit::IOHIDController::~IOHIDController(ctu::iokit::IOHIDController *this)
{
  const void *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;

  if (*((_QWORD *)this + 4))
  {
    if (*((_BYTE *)this + 56))
    {
      MEMORY[0x212BBF6B0]();
      *((_BYTE *)this + 56) = 0;
    }
    IOHIDEventSystemClientUnregisterEventBlock();
    v2 = (const void *)*((_QWORD *)this + 8);
    if (v2)
      _Block_release(v2);
    CFRelease(*((CFTypeRef *)this + 4));
  }
  v3 = (const void *)*((_QWORD *)this + 6);
  if (v3)
    _Block_release(v3);
  v4 = (const void *)*((_QWORD *)this + 5);
  if (v4)
    _Block_release(v4);
  v5 = *((_QWORD *)this + 3);
  if (v5)
    dispatch_release(v5);
  v6 = *((_QWORD *)this + 2);
  if (v6)
    dispatch_release(v6);
  v7 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v7)
    std::__shared_weak_count::__release_weak(v7);
}

uint64_t ctu::iokit::IOHIDController::stop_sync(uint64_t this)
{
  uint64_t v1;

  if (*(_BYTE *)(this + 56))
  {
    v1 = this;
    this = *(_QWORD *)(this + 32);
    if (this)
    {
      this = MEMORY[0x212BBF6B0](this, *(_QWORD *)(v1 + 16));
      *(_BYTE *)(v1 + 56) = 0;
    }
  }
  return this;
}

void ctu::iokit::IOHIDController::registerProxCallback(uint64_t *a1, const void **a2)
{
  void *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  if (*a2)
    v3 = _Block_copy(*a2);
  else
    v3 = 0;
  v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[2];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0>(ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ctu::iokit::IOHIDController::registerKeyboardCallback(uint64_t *a1, const void **a2)
{
  void *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  _QWORD *v8;
  unint64_t *p_shared_owners;
  NSObject *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  if (*a2)
    v3 = _Block_copy(*a2);
  else
    v3 = 0;
  v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || (v5 = *a1, (v6 = std::__shared_weak_count::lock(v4)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v7 = v6;
  v8 = operator new(0x10uLL);
  *v8 = a1;
  v8[1] = v3;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v10 = a1[2];
  do
    v11 = __ldxr(p_shared_owners);
  while (__stxr(v11 + 1, p_shared_owners));
  v12 = operator new(0x18uLL);
  *v12 = v8;
  v12[1] = v5;
  v12[2] = v7;
  dispatch_async_f(v10, v12, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>(ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void ctu::iokit::IOHIDController::start(ctu::iokit::IOHIDController *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v2 || (v3 = *(_QWORD *)this, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  v6 = operator new(8uLL);
  *v6 = this;
  v7 = *((_QWORD *)this + 2);
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  v10 = operator new(0x18uLL);
  *v10 = v6;
  v10[1] = v3;
  v10[2] = v5;
  dispatch_async_f(v7, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::start(void)::$_0>(ctu::iokit::IOHIDController::start(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::start(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::start(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ctu::iokit::IOHIDController::queryHIDEventTrigger(ctu::iokit::IOHIDController *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v2 || (v3 = *(_QWORD *)this, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  v6 = operator new(8uLL);
  *v6 = this;
  v7 = *((_QWORD *)this + 2);
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  v10 = operator new(0x18uLL);
  *v10 = v6;
  v10[1] = v3;
  v10[2] = v5;
  dispatch_async_f(v7, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>(ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

const void **ctu::iokit::IOHIDController::queryHIDEventTrigger_sync(IOHIDEventSystemClientRef *this)
{
  const __CFArray *v2;
  CFIndex i;
  uint64_t (*v4)(uint64_t);
  uint64_t v6;
  CFArrayRef theArray;
  uint64_t KeyboardEvent;

  KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  v2 = IOHIDEventSystemClientCopyServices(this[4]);
  theArray = v2;
  if (v2 && this[8])
  {
    for (i = 0; i < (int)CFArrayGetCount(v2); ++i)
    {
      CFArrayGetValueAtIndex(theArray, i);
      v6 = 0xAAAAAAAAAAAAAAAALL;
      v6 = IOHIDServiceClientCopyEvent();
      if (v6)
        v4 = ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::get;
      else
        v4 = 0;
      if (v4)
        (*((void (**)(void))this[8] + 2))();
      ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)&v6);
      v2 = theArray;
    }
  }
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  return ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)&KeyboardEvent);
}

void sub_20E5B4204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void ctu::iokit::IOHIDController::stop(ctu::iokit::IOHIDController *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v2 || (v3 = *(_QWORD *)this, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  v6 = operator new(8uLL);
  *v6 = this;
  v7 = *((_QWORD *)this + 2);
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  v10 = operator new(0x18uLL);
  *v10 = v6;
  v10[1] = v3;
  v10[2] = v5;
  dispatch_async_f(v7, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::stop(void)::$_0>(ctu::iokit::IOHIDController::stop(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::stop(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::stop(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t ctu::iokit::IOHIDController::setHIDMatchingDictionary@<X0>(unsigned int a1@<W1>, unsigned int a2@<W2>, CFMutableDictionaryRef *a3@<X8>)
{
  const __CFAllocator *v7;
  CFMutableDictionaryRef Mutable;
  const __CFAllocator *v9;
  __CFDictionary *v10;
  const __CFAllocator *v11;
  const void *v13;

  *a3 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = Mutable;
  if (Mutable)
  {
    *a3 = Mutable;
    v13 = 0;
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&v13);
  }
  ctu::cf::insert<char const*,unsigned int>(v10, (const __CFString **)"PrimaryUsagePage", a1, v7, v9);
  return ctu::cf::insert<char const*,unsigned int>(v10, (const __CFString **)"PrimaryUsage", a2, v7, v11);
}

void sub_20E5B43D4(_Unwind_Exception *a1)
{
  const void **v1;

  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 16), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController*)#1}::operator() const(ctu::iokit::IOHIDController*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController*)#1}::operator() const(ctu::iokit::IOHIDController*)::{lambda(void *)#1}::__invoke(ctu::iokit::IOHIDController *a1)
{
  void *v1;

  if (a1)
  {
    ctu::iokit::IOHIDController::~IOHIDController(a1);
    operator delete(v1);
  }
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::init(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::init(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t ***a1)
{
  uint64_t **v2;
  uint64_t *v3;
  const __CFAllocator *v4;
  uint64_t v5;
  capabilities::txpower *Mutable;
  __CFArray *v7;
  capabilities::txpower *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t v17;
  _QWORD aBlock[6];
  std::__shared_weak_count *v19;
  int v20[2];
  __CFArray *v21;

  v2 = *a1;
  v3 = **a1;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = IOHIDEventSystemClientCreate();
  v3[4] = v5;
  if (v5)
  {
    *(_QWORD *)v20 = 0;
    Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v7 = *(__CFArray **)v20;
      *(_QWORD *)v20 = Mutable;
      v21 = v7;
      Mutable = (capabilities::txpower *)ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v21);
    }
    v8 = (capabilities::txpower *)capabilities::txpower::supportsHandDetection(Mutable);
    if ((_DWORD)v8)
    {
      v21 = (__CFArray *)0xAAAAAAAAAAAAAAAALL;
      ctu::iokit::IOHIDController::setHIDMatchingDictionary(0xFF00u, 8u, &v21);
      ctu::cf::insert<__CFDictionary *>(*(__CFArray **)v20, v21);
      v8 = (capabilities::txpower *)ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v21);
    }
    if (capabilities::txpower::supportsKeyboard(v8))
    {
      v21 = (__CFArray *)0xAAAAAAAAAAAAAAAALL;
      ctu::iokit::IOHIDController::setHIDMatchingDictionary(0xBu, 1u, &v21);
      ctu::cf::insert<__CFDictionary *>(*(__CFArray **)v20, v21);
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v21);
    }
    IOHIDEventSystemClientSetMatchingMultiple();
    v9 = (std::__shared_weak_count *)v3[1];
    if (!v9 || (v10 = *v3, (v11 = std::__shared_weak_count::lock(v9)) == 0))
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v12 = v11;
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v12);
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZZN3ctu5iokit15IOHIDController4initEvENK3__0clEv_block_invoke;
    aBlock[3] = &__block_descriptor_56_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE_e35_v40__0_v8_v16_v24____IOHIDEvent__32l;
    aBlock[4] = v3;
    aBlock[5] = v10;
    v19 = v12;
    do
      v17 = __ldxr(p_shared_weak_owners);
    while (__stxr(v17 + 1, p_shared_weak_owners));
    v3[8] = (uint64_t)_Block_copy(aBlock);
    IOHIDEventSystemClientRegisterEventBlock();
    if (v19)
      std::__shared_weak_count::__release_weak(v19);
    std::__shared_weak_count::__release_weak(v12);
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)v20);
  }
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void sub_20E5B46D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, const void *a17)
{
  void *v17;
  void *v18;
  uint64_t v19;

  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)(v19 - 56));
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(&a17);
  operator delete(v18);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)v17 + 8);
  operator delete(v17);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0>(ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  const void *v6;

  v2 = *a1;
  v4 = **a1;
  v3 = (void *)(*a1)[1];
  if (v3)
    v3 = _Block_copy(v3);
  v5 = *(const void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  if (v5)
    _Block_release(v5);
  v6 = (const void *)v2[1];
  if (v6)
    _Block_release(v6);
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>(ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  const void *v6;

  v2 = *a1;
  v4 = **a1;
  v3 = (void *)(*a1)[1];
  if (v3)
    v3 = _Block_copy(v3);
  v5 = *(const void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;
  if (v5)
    _Block_release(v5);
  v6 = (const void *)v2[1];
  if (v6)
    _Block_release(v6);
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::start(void)::$_0>(ctu::iokit::IOHIDController::start(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::start(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::start(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = **a1;
  if (*(_BYTE *)(v3 + 56))
  {
    v4 = *(_QWORD *)(v3 + 32);
    if (v4)
    {
      MEMORY[0x212BBF6B0](v4, *(_QWORD *)(v3 + 16));
      *(_BYTE *)(v3 + 56) = 0;
    }
  }
  if (*(_QWORD *)(v3 + 32))
  {
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    ctu::iokit::IOHIDController::queryHIDEventTrigger_sync((IOHIDEventSystemClientRef *)v3);
    *(_BYTE *)(v3 + 56) = 1;
  }
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void sub_20E5B48DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 8);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>(ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>>)::{lambda(void *)#1}::__invoke(IOHIDEventSystemClientRef ***a1)
{
  IOHIDEventSystemClientRef **v2;

  v2 = *a1;
  ctu::iokit::IOHIDController::queryHIDEventTrigger_sync(**a1);
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void sub_20E5B4944(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 8);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::stop(void)::$_0>(ctu::iokit::IOHIDController::stop(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::stop(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::stop(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = **a1;
  if (*(_BYTE *)(v3 + 56))
  {
    v4 = *(_QWORD *)(v3 + 32);
    if (v4)
    {
      MEMORY[0x212BBF6B0](v4, *(_QWORD *)(v3 + 16));
      *(_BYTE *)(v3 + 56) = 0;
    }
  }
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void sub_20E5B49C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 8);
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t TelephonyUtilWriteToCompletion(int __fd, char *__buf, size_t __nbyte, _DWORD *a4)
{
  unsigned int v5;
  ssize_t v8;

  *a4 = 0;
  if (!(_DWORD)__nbyte)
    return 0;
  v5 = __nbyte;
  while (1)
  {
    v8 = write(__fd, __buf, v5);
    if (v8 < 0)
      break;
    *a4 += v8;
    __buf += v8;
    v5 -= v8;
    if (!v5)
      return 0;
  }
  return *__error();
}

ssize_t TelephonyUtilUnblockableReadWithTimeout(int a1, unsigned int a2, void *a3, unsigned int a4, unsigned int a5)
{
  timeval *v10;
  ssize_t result;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  fd_set v15;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  if (a1 < 0)
    return 4294967287;
  memset(&v15, 0, sizeof(v15));
  if (__darwin_check_fd_set_overflow(a1, &v15, 0))
    v15.fds_bits[a1 >> 5] |= 1 << a1;
  if ((a2 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(a2, &v15, 0))
    v15.fds_bits[a2 >> 5] |= 1 << a2;
  if (a5 == -1)
  {
    v10 = 0;
  }
  else
  {
    v13 = a5 / 0x3E8uLL;
    LODWORD(v14) = 1000 * (a5 % 0x3E8);
    v10 = (timeval *)&v13;
  }
  if (a1 <= (int)a2)
    v12 = a2;
  else
    v12 = a1;
  result = select(v12 + 1, &v15, 0, 0, v10);
  if ((int)result >= 1)
  {
    if ((a2 & 0x80000000) == 0
      && __darwin_check_fd_set_overflow(a2, &v15, 0)
      && ((v15.fds_bits[a2 >> 5] >> a2) & 1) != 0)
    {
      return 0;
    }
    else
    {
      return read(a1, a3, a4);
    }
  }
  return result;
}

BOOL TelephonyUtilUnblockableReadToCompletionWithTimeout(int a1, unsigned int a2, char *a3, unsigned int a4, unsigned int a5)
{
  unsigned int v9;
  int v10;

  do
  {
    v9 = a4;
    if (!a4)
      break;
    v10 = TelephonyUtilUnblockableReadWithTimeout(a1, a2, a3, a4, a5);
    a3 += v10;
    a4 = v9 - v10;
  }
  while (v10 > 0);
  return v9 == 0;
}

uint64_t TelephonyUtilLogGetBufferSize(int a1)
{
  return (146 * ((a1 + 31) >> 5)) | 1;
}

uint64_t TelephonyUtilLogBinaryToBuffer(_BYTE *a1, unsigned int a2, unsigned __int8 *a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  char *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t i;
  char v19;
  uint64_t v22;
  _OWORD v25[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a4 < 1)
  {
    v6 = 0;
    *a1 = 0;
  }
  else
  {
    v5 = 0;
    LODWORD(v6) = 0;
    v7 = a4;
    v8 = a4;
    v22 = a4;
    while (1)
    {
      v9 = v8 - 32;
      if (v8 >= 32)
        v8 = 32;
      memset(&v25[14], 0, 32);
      if (v8 <= 1)
        v10 = 1;
      else
        v10 = v8;
      memset(v25, 0, 224);
      if (v5 >= v7)
      {
        LODWORD(v11) = 0;
        v15 = 0;
      }
      else
      {
        v11 = 0;
        v12 = a3;
        do
        {
          v13 = *v12++;
          v14 = (char *)v25 + v11;
          *v14 = a0123456789abcd[(unint64_t)v13 >> 4];
          v14[1] = a0123456789abcd[v13 & 0xF];
          v11 += 3;
          v14[2] = 32;
        }
        while (v10 + 2 * v10 != v11);
        v15 = v10;
      }
      v16 = 3 * (33 - v15);
      memset((char *)v25 + v11, 32, v16);
      v17 = v16 + v11;
      v7 = v22;
      if (v5 < v22)
      {
        for (i = 0; i != v10; ++i)
        {
          v19 = a3[i];
          if ((v19 - 32) > 0x5Eu || a3[i] == 92 || a3[i] == 37)
            v19 = 46;
          *((_BYTE *)v25 + v17 + i) = v19;
        }
        v17 += i;
      }
      *(_WORD *)((char *)v25 + (int)v17) = 10;
      v6 = (snprintf(&a1[v6], a2 - v6, "%04x  %s", v5, (const char *)v25) + v6);
      if (v6 >= a2)
        break;
      v5 += 32;
      a3 += 32;
      v8 = v9;
      if ((int)v5 >= a4)
        return v6;
    }
    return a2;
  }
  return v6;
}

uint64_t TelephonyUtilDecodeHexWithDefault(int a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v2 = a1 - 48;
  if ((a1 - 97) >= 6)
    v3 = a2;
  else
    v3 = a1 - 87;
  if ((a1 - 65) <= 5)
    v4 = a1 - 55;
  else
    v4 = v3;
  if (v2 <= 9)
    return v2;
  else
    return v4;
}

uint64_t TelephonyUtilEncodeHex(uint64_t result, _BYTE *a2, _BYTE *a3)
{
  *a2 = a0123456789abcd[(unint64_t)result >> 4];
  *a3 = a0123456789abcd[result & 0xF];
  return result;
}

uint64_t TelephonyUtilBinToHexGetBufferSize(int a1)
{
  return (2 * a1) | 1u;
}

uint64_t TelephonyUtilBinToHex(_BYTE *a1, unint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unsigned int v7;
  char v8;

  if (((2 * a4) | 1) <= a2)
    v4 = a4;
  else
    v4 = (a2 - 1) >> 1;
  v5 = a1;
  if (v4)
  {
    v6 = a1;
    do
    {
      v7 = *a3++;
      v8 = a0123456789abcd[v7 & 0xF];
      *v6 = a0123456789abcd[(unint64_t)v7 >> 4];
      v5 = v6 + 2;
      v6[1] = v8;
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  *v5 = 0;
  return ((_DWORD)v5 - (_DWORD)a1 + 1);
}

uint64_t TelephonyUtilHexToBin(_BYTE *a1, uint64_t a2, char *__s)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  char v13;
  int v14;
  char *v15;
  _BYTE *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  char v23;
  char v24;
  char v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  char v29;
  char v30;
  char v31;

  v6 = strlen(__s);
  LODWORD(v7) = v6 >> 1;
  v8 = v6 & 1;
  if (a2 - v8 >= (unint64_t)(v6 >> 1))
    v7 = v7;
  else
    v7 = (a2 - v8);
  if ((v6 & 1) != 0)
  {
    v9 = *__s;
    v10 = v9 - 48;
    v11 = v9 - 65;
    if ((v9 - 97) >= 6)
      v12 = 0;
    else
      v12 = v9 - 87;
    v13 = v9 - 55;
    if (v11 > 5)
      v13 = v12;
    if (v10 < 0xA)
      v13 = v10;
    *a1 = v13;
  }
  v14 = v6 & 1;
  if ((_DWORD)v7)
  {
    v15 = &__s[v8];
    v16 = &a1[v8];
    v17 = (unsigned __int8 *)(v15 + 1);
    v18 = v7;
    do
    {
      v19 = *(v17 - 1);
      v20 = v19 - 48;
      v21 = v19 - 65;
      if ((v19 - 97) >= 6)
        v22 = 0;
      else
        v22 = v19 - 87;
      v23 = v19 - 55;
      if (v21 > 5)
        v23 = v22;
      if (v20 < 0xA)
        v23 = v20;
      v24 = 16 * v23;
      v26 = *v17;
      v17 += 2;
      v25 = v26;
      v27 = v26 - 48;
      v28 = v26 - 65;
      v29 = v26 - 87;
      if ((v26 - 97) >= 6)
        v30 = 0;
      else
        v30 = v29;
      v31 = v25 - 55;
      if (v28 > 5)
        v31 = v30;
      if (v27 < 0xA)
        v31 = v27;
      *v16++ = v31 | v24;
      --v18;
    }
    while (v18);
  }
  return (v7 + v14);
}

uint64_t TelephonyUtilParseHardwareModel(_BYTE *a1, uint64_t a2)
{
  size_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  char v8;
  uint64_t result;
  char *v10;
  uint64_t v11;
  __darwin_ct_rune_t v12;
  __darwin_ct_rune_t v13;
  char *v14;
  int v15;
  char __s[16];
  __int128 v17;
  char *__endptr[2];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a2 + 8) = 0;
  *(_QWORD *)a2 = 0;
  if (!*a1)
    return 0;
  *(_OWORD *)__s = 0u;
  v17 = 0u;
  __strlcpy_chk();
  v3 = strlen(__s);
  if (!v3 || v3 >> 31)
    goto LABEL_19;
  v4 = 0;
  *(_OWORD *)__endptr = 0u;
  v19 = 0u;
  v5 = -1;
  while (1)
  {
    v6 = __s[(v3 + v5)];
    if ((v6 - 48) <= 9)
      break;
    if (v4 != 32)
    {
      *((_BYTE *)__endptr + v4) = v6;
      --v5;
      if (v3 != ++v4)
        continue;
    }
    goto LABEL_19;
  }
  if ((int)v3 - (int)v4 < 1)
    goto LABEL_19;
  v7 = -1 - v4;
  while (1)
  {
    v8 = __s[(v3 + v7)];
    if ((v8 - 48) > 9)
      break;
    if (v4 != 32)
    {
      *((_BYTE *)__endptr + v4) = v8;
      --v7;
      if (v3 != ++v4)
        continue;
    }
    goto LABEL_19;
  }
  if ((v4 & 0xFFFFFFE0) != 0)
  {
LABEL_19:
    _TelephonyUtilDebugPrintError();
LABEL_20:
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  *((_BYTE *)__endptr + v4) = v8;
  v10 = __s;
  __memset_chk();
  v11 = v4;
  do
    *v10++ = *((_BYTE *)__endptr + v11--);
  while (v11 != -1);
  __s[v4 + 1] = 0;
  __endptr[0] = 0;
  v12 = __s[0];
  *(_BYTE *)(a2 + 4) = __s[0];
  v13 = __toupper(v12);
  *(_BYTE *)(a2 + 4) = v13;
  if (((v13 << 24) - 1509949441) <= 0xE6FFFFFE)
    goto LABEL_20;
  *__error() = 0;
  *(_DWORD *)a2 = strtoul(&__s[1], __endptr, 10);
  if (*__error())
  {
    __error();
    goto LABEL_20;
  }
  v14 = __endptr[0];
  if (!*__endptr[0])
  {
    *(_DWORD *)(a2 + 8) = 0;
    return 1;
  }
  if (!strncasecmp("SIM", __endptr[0], 3uLL))
  {
    *(_DWORD *)(a2 + 8) = 3;
    goto LABEL_46;
  }
  if (!strncasecmp("FPGA", v14, 4uLL))
  {
    *(_DWORD *)(a2 + 8) = 4;
    return 1;
  }
  if (!strncasecmp("AP", v14 + 1, 2uLL))
  {
    *(_DWORD *)(a2 + 8) = 2;
    goto LABEL_46;
  }
  if (!strncasecmp("AP", v14, 2uLL))
  {
    *(_DWORD *)(a2 + 8) = 2;
    return 1;
  }
  if (!strncasecmp("DEV", v14 + 1, 3uLL))
  {
    v15 = 1;
LABEL_45:
    *(_DWORD *)(a2 + 8) = v15;
    goto LABEL_46;
  }
  if (!strncasecmp("DEV", v14, 3uLL))
  {
    result = 1;
    *(_DWORD *)(a2 + 8) = 1;
    return result;
  }
  if (!strncasecmp("Mac", v14 + 1, 3uLL))
  {
    v15 = 5;
    goto LABEL_45;
  }
  if (strncasecmp("Mac", v14, 3uLL))
  {
LABEL_46:
    __strlcpy_chk();
    *(_BYTE *)(a2 + 5) = __tolower(*(char *)(a2 + 5));
    *(_BYTE *)(a2 + 6) = __tolower(*(char *)(a2 + 6));
    return 1;
  }
  *(_DWORD *)(a2 + 8) = 5;
  return 1;
}

uint64_t TelephonyUtilIsInternalBuild()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  return _MergedGlobals_1;
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  return byte_253D0AF01;
}

uint64_t TelephonyUtilIsDesenseBuild()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  return byte_253D0AF02;
}

uint64_t TelephonyUtilIsVendorBuild()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  return byte_253D0AF03;
}

uint64_t TelephonyUtilIsRestoreOS()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  return byte_253D0AF04;
}

uint64_t TelephonyUtilTraceAllowed()
{
  if (qword_253D0AF20 != -1)
    dispatch_once(&qword_253D0AF20, &__block_literal_global_32);
  if ((_MergedGlobals_1 & 1) != 0 || (byte_253D0AF01 & 1) != 0 || (byte_253D0AF02 & 1) != 0)
    return 1;
  else
    return byte_253D0AF03;
}

uint64_t TelephonyUtilSystemMachTime()
{
  uint32_t denom;
  uint32_t numer;
  uint32_t v2;
  unsigned int v3;
  uint32_t v4;
  uint32_t v5;
  mach_timebase_info info;

  if (!qword_253D0AF10)
  {
    info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
    mach_timebase_info(&info);
    if (info.denom)
    {
      denom = info.denom;
      numer = info.numer;
      do
      {
        v2 = denom;
        denom = numer % denom;
        numer = v2;
      }
      while (denom);
    }
    else
    {
      v2 = info.numer;
    }
    v3 = 1000000;
    v4 = info.numer / v2;
    do
    {
      v5 = v4;
      v4 = v3;
      v3 = v5 % v3;
    }
    while (v3);
    qword_253D0AF08 = info.numer / v2 / v4;
    qword_253D0AF10 = 0xF4240 / v4 * (unint64_t)(info.denom / v2);
  }
  return qword_253D0AF08 * mach_absolute_time() / qword_253D0AF10;
}

uint64_t TelephonyUtilGetSystemWakeReason(void *a1, size_t a2, BOOL *a3)
{
  int v6;
  uint64_t result;
  size_t __n;
  char __s1[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)__s1 = 0u;
  v10 = 0u;
  __n = 0;
  v6 = sysctlbyname("kern.wakereason", 0, &__n, 0, 0);
  result = 0;
  if (!v6 && __n && __n <= 0x100)
  {
    if (a1 && __n > a2)
    {
      return 0;
    }
    else
    {
      sysctlbyname("kern.wakereason", __s1, &__n, 0, 0);
      if (a3)
        *a3 = strstr(__s1, "baseband") != 0;
      if (a1)
        memcpy(a1, __s1, __n);
      return 1;
    }
  }
  return result;
}

size_t TelephonyUtilStrlcpy(void *a1, char *__s1, size_t __n)
{
  size_t v6;
  size_t v7;
  size_t v8;

  v6 = strnlen(__s1, __n);
  v7 = v6;
  if (v6 >= __n)
  {
    if (__n)
    {
      v8 = __n - 1;
      memcpy(a1, __s1, v8);
      *((_BYTE *)a1 + v8) = 0;
    }
  }
  else
  {
    memcpy(a1, __s1, v6 + 1);
  }
  return v7;
}

uint64_t TelephonyUtilRunCommand(uint64_t a1, uint64_t a2)
{
  _QWORD v3[6];
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v3[0] = a1;
  v3[1] = a2;
  v3[4] = 0;
  v3[5] = 0xAAAAAAAAAAAAAA00;
  v3[2] = v4;
  v3[3] = 0;
  if (TelephonyUtilRunCommandExt((uint64_t)v3))
    return 0;
  else
    return 22;
}

uint64_t TelephonyUtilRunCommandExt(uint64_t a1)
{
  char *const *v2;
  char *const *v3;
  int v5;
  pid_t v6;

  v6 = 0;
  if (!a1)
  {
    syslog(3, "%s: parameter cannot be NULL.\n");
    return 0;
  }
  if (!*(_QWORD *)a1)
  {
    syslog(3, "%s: command cannot be NULL\n");
    return 0;
  }
  v2 = *(char *const **)(a1 + 8);
  if (!v2)
  {
    syslog(3, "%s: argument cannot be NULL\n");
    return 0;
  }
  v3 = *(char *const **)(a1 + 16);
  if (!v3)
  {
    syslog(3, "%s: environment cannot be NULL\n");
    return 0;
  }
  if (posix_spawn(&v6, *(const char **)a1, *(const posix_spawn_file_actions_t **)(a1 + 24), *(const posix_spawnattr_t **)(a1 + 32), v2, v3))
  {
    syslog(3, "%s: spawning %s failed! ret: %d\n");
    return 0;
  }
  if (!*(_BYTE *)(a1 + 40))
  {
    v5 = -1431655766;
    waitpid(v6, &v5, 0);
  }
  return v6;
}

uint64_t TelephonyUtilIsBBPlatformSimulationEnabled()
{
  if (qword_253D0AF18 != -1)
    dispatch_once(&qword_253D0AF18, &__block_literal_global_1);
  return byte_253D0AF05;
}

void *__isRTDylibPresent_block_invoke()
{
  uint64_t v0;
  char i;
  char v2;
  void *result;

  v0 = 0;
  for (i = 1; ; i = 0)
  {
    v2 = i;
    result = dlopen(off_24C96F310[v0], 1);
    if (result)
      break;
    v0 = 1;
    if ((v2 & 1) == 0)
      return result;
  }
  byte_253D0AF06 = 1;
  return (void *)dlclose(result);
}

uint64_t ctu::iokit::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *ctu::iokit::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t ctu::iokit::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *ctu::iokit::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t ctu::iokit::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *ctu::iokit::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t ctu::iokit::operator~(int a1)
{
  return ~a1;
}

void ctu::iokit::IOPortUSBCController::create(NSObject **a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, _QWORD *a4@<X8>)
{
  char *v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v12;
  unint64_t v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  dispatch_object_t object;
  char *v22;
  std::__shared_weak_count *v23;
  const char *v24;
  uint8_t buf[8];

  v22 = 0;
  v23 = 0;
  v8 = (char *)operator new(0x68uLL);
  v9 = *a1;
  object = v9;
  if (v9)
    dispatch_retain(v9);
  v24 = a3;
  *(_QWORD *)buf = a2;
  ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(v8, &object, (const char **)buf, &v24);
  *((_QWORD *)v8 + 11) = 0;
  *((_DWORD *)v8 + 12) = 0;
  *((_QWORD *)v8 + 7) = 0;
  *((_QWORD *)v8 + 8) = 0;
  *((_QWORD *)v8 + 12) = 0;
  *((_QWORD *)v8 + 9) = 0;
  *((_QWORD *)v8 + 10) = v8 + 88;
  v10 = (std::__shared_weak_count *)operator new(0x20uLL);
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__vftable = (std::__shared_weak_count_vtbl *)off_24C96F358;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  v12 = (std::__shared_weak_count *)*((_QWORD *)v8 + 1);
  if (v12)
  {
    if (v12->__shared_owners_ != -1)
      goto LABEL_16;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v15 = __ldxr(p_shared_weak_owners);
    while (__stxr(v15 + 1, p_shared_weak_owners));
    *(_QWORD *)v8 = v8;
    *((_QWORD *)v8 + 1) = v10;
    std::__shared_weak_count::__release_weak(v12);
  }
  else
  {
    do
      v16 = __ldxr(p_shared_owners);
    while (__stxr(v16 + 1, p_shared_owners));
    v17 = (unint64_t *)&v10->__shared_weak_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
    *(_QWORD *)v8 = v8;
    *((_QWORD *)v8 + 1) = v10;
  }
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
LABEL_16:
  v22 = v8;
  v23 = v10;
  if (object)
    dispatch_release(object);
  if (ctu::iokit::IOPortUSBCController::init((NSObject **)v8))
  {
    *a4 = v8;
    a4[1] = v10;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to initialize IOPortUSBCController!", buf, 2u);
    }
    *a4 = 0;
    a4[1] = 0;
    do
      v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_20E5B60C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *ctu::iokit::IOPortUSBCController::IOPortUSBCController(_QWORD *a1, NSObject **a2, const char *a3, const char *a4)
{
  _QWORD *result;
  const char *v5;
  const char *v6;

  v5 = a4;
  v6 = a3;
  result = ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(a1, a2, &v6, &v5);
  *((_DWORD *)result + 12) = 0;
  result[7] = 0;
  result[8] = 0;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

{
  _QWORD *result;
  const char *v5;
  const char *v6;

  v5 = a4;
  v6 = a3;
  result = ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(a1, a2, &v6, &v5);
  *((_DWORD *)result + 12) = 0;
  result[7] = 0;
  result[8] = 0;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

BOOL ctu::iokit::IOPortUSBCController::init(NSObject **this)
{
  uint64_t v2;
  uint64_t **v3;
  char *v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  _BOOL8 result;
  NSObject *v12;
  void *v13[2];
  char v14;
  void *v15[2];
  char v16;
  void *__p[2];
  char v18;
  void **v19;

  v2 = 0;
  v3 = (uint64_t **)(this + 10);
  do
  {
    v4 = ctu::iokit::kUSBCServices[v2];
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 56) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 15) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 16) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 17) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 18) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
    if (strlen(v4) == 17
      && (*(_QWORD *)v4 == 0x434354656C707041 ? (v5 = *((_QWORD *)v4 + 1) == 0x656C6C6F72746E6FLL) : (v5 = 0),
          v5 ? (v6 = v4[16] == 114) : (v6 = 0),
          v6))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v4);
      v19 = __p;
      *((_QWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 10) = ctu::iokit::IOPortUSBCController::findingServiceTCController;
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v4);
      v19 = __p;
      *((_QWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 10) = ctu::iokit::IOPortUSBCController::findingServiceProtocol;
    }
    if (v18 < 0)
      operator delete(__p[0]);
    ++v2;
  }
  while (v2 != 5);
  if (!ctu::iokit::IOPortUSBCController::initNotification((ctu::iokit::IOPortUSBCController *)this))
    goto LABEL_35;
  std::string::basic_string[abi:ne180100]<0>(v15, "AppleTCController");
  v7 = ctu::iokit::IOPortUSBCController::setupFindingService((uint64_t)this, v15);
  v8 = v7;
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (!v8)
      goto LABEL_35;
LABEL_31:
    std::string::basic_string[abi:ne180100]<0>(v13, "CC");
    v9 = ctu::iokit::IOPortUSBCController::setupFindingService((uint64_t)this, v13);
    v10 = v9;
    if (v14 < 0)
    {
      operator delete(v13[0]);
      if (!v10)
        goto LABEL_35;
    }
    else if (!v9)
    {
      goto LABEL_35;
    }
    return 1;
  }
  if (v7)
    goto LABEL_31;
LABEL_35:
  v12 = this[4];
  result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (result)
  {
    LOWORD(__p[0]) = 0;
    _os_log_error_impl(&dword_20E5A6000, v12, OS_LOG_TYPE_ERROR, "Failed to initialize IOPort Controller", (uint8_t *)__p, 2u);
    return 0;
  }
  return result;
}

void sub_20E5B6468(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(_QWORD *a1, NSObject **a2, const char **a3, const char **a4)
{
  NSObject *v7;

  *a1 = 0;
  a1[1] = 0;
  v7 = *a2;
  a1[2] = *a2;
  if (v7)
    dispatch_retain(v7);
  a1[3] = 0;
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), *a3, *a4);
  return a1;
}

void sub_20E5B655C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::~IOPortUSBCController(ctu::iokit::IOPortUSBCController *this)
{
  uint64_t v2;
  uint64_t **v3;
  char *v4;
  int v5;
  _OWORD *v6;
  int v7;
  _OWORD *v8;
  int v9;
  _OWORD *v10;
  int v11;
  _OWORD *v12;
  IONotificationPort *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *__p[2];
  char v18;
  void **v19;

  v2 = 0;
  v3 = (uint64_t **)((char *)this + 80);
  do
  {
    v4 = ctu::iokit::kUSBCServices[v2];
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v5 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 15);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v5)
        goto LABEL_8;
    }
    else if (!v5)
    {
      goto LABEL_8;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v6 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v6 + 15));
    if (v18 < 0)
      operator delete(__p[0]);
LABEL_8:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v7 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 16);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v7)
        goto LABEL_16;
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v8 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v8 + 16));
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 16) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
LABEL_16:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v9 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 17);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v9)
        goto LABEL_24;
    }
    else if (!v9)
    {
      goto LABEL_24;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v10 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v10 + 17));
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 17) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
LABEL_24:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v11 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 18);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v11)
        goto LABEL_32;
    }
    else if (!v11)
    {
      goto LABEL_32;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    v12 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v12 + 18));
    if (v18 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 18) = 0;
    if (v18 < 0)
      operator delete(__p[0]);
LABEL_32:
    ++v2;
  }
  while (v2 != 5);
  v13 = (IONotificationPort *)*((_QWORD *)this + 5);
  if (v13)
    IONotificationPortDestroy(v13);
  std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*((char **)this + 11));
  v14 = *((_QWORD *)this + 7);
  if (v14)
  {
    v15 = *((_QWORD *)this + 8);
    v16 = (void *)*((_QWORD *)this + 7);
    if (v15 != v14)
    {
      do
      {
        v15 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(v15);
      }
      while (v15 != v14);
      v16 = (void *)*((_QWORD *)this + 7);
    }
    *((_QWORD *)this + 8) = v14;
    operator delete(v16);
  }
  MEMORY[0x212BBF884]((char *)this + 32);
  ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(this);
}

uint64_t **ctu::iokit::IOPortUSBCController::findingServiceTCController(uint64_t **this, io_iterator_t iterator)
{
  uint64_t **v3;
  io_object_t v4;
  unsigned int v5;

  if (this)
  {
    v3 = this;
    this = (uint64_t **)IOIteratorNext(iterator);
    v5 = this;
    if ((_DWORD)this)
    {
      v4 = this;
      do
      {
        ctu::iokit::IOPortUSBCController::initTCController(v3, &v5);
        IOObjectRelease(v4);
        this = (uint64_t **)IOIteratorNext(iterator);
        v4 = this;
        v5 = this;
      }
      while ((_DWORD)this);
    }
  }
  return this;
}

ctu::iokit::IOPortUSBCController *ctu::iokit::IOPortUSBCController::findingServiceProtocol(ctu::iokit::IOPortUSBCController *this, io_iterator_t iterator)
{
  ctu::iokit::IOPortUSBCController *v3;
  io_object_t v4;
  unsigned int v5;

  if (this)
  {
    v3 = this;
    this = (ctu::iokit::IOPortUSBCController *)IOIteratorNext(iterator);
    v5 = this;
    if ((_DWORD)this)
    {
      v4 = this;
      do
      {
        ctu::iokit::IOPortUSBCController::initProtocol(v3, &v5);
        IOObjectRelease(v4);
        this = (ctu::iokit::IOPortUSBCController *)IOIteratorNext(iterator);
        v4 = this;
        v5 = this;
      }
      while ((_DWORD)this);
    }
  }
  return this;
}

BOOL ctu::iokit::IOPortUSBCController::initNotification(ctu::iokit::IOPortUSBCController *this)
{
  IONotificationPort *v2;
  IONotificationPort *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  v3 = v2;
  *((_QWORD *)this + 5) = v2;
  if (v2)
  {
    IONotificationPortSetDispatchQueue(v2, *((dispatch_queue_t *)this + 2));
  }
  else
  {
    v4 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_ERROR, "Failed to find the notification with the main port", v6, 2u);
    }
  }
  return v3 != 0;
}

BOOL ctu::iokit::IOPortUSBCController::setupFindingService(uint64_t a1, void **a2)
{
  std::string::size_type v2;
  uint64_t **v4;
  void **v5;
  NSObject *v6;
  int v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  std::string *v10;
  std::string::size_type v11;
  char v12;
  _BOOL8 v13;
  IONotificationPort *v14;
  std::string *p_p;
  const __CFDictionary *v16;
  void (__cdecl *v17)(void *, io_iterator_t);
  char *v18;
  kern_return_t v19;
  NSObject *v20;
  void (*v21)(uint64_t, _QWORD);
  char *v22;
  std::string::size_type v24;
  std::string v25;
  _QWORD v26[2];
  std::string __p;
  uint64_t v28;

  v2 = (std::string::size_type)a2;
  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t **)(a1 + 80);
  v5 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(a1 + 80, a2);
  v6 = *(NSObject **)(a1 + 32);
  if ((void **)(a1 + 88) == v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v2 + 23) < 0)
        v2 = *(_QWORD *)v2;
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v2;
      _os_log_error_impl(&dword_20E5A6000, v6, OS_LOG_TYPE_ERROR, "Cannot setup finding service because no find %s in the internal context", (uint8_t *)&__p, 0xCu);
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      v24 = v2;
      if (*(char *)(v2 + 23) < 0)
        v24 = *(_QWORD *)v2;
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v24;
      _os_log_debug_impl(&dword_20E5A6000, v6, OS_LOG_TYPE_DEBUG, "#D Setting up service: %s", (uint8_t *)&__p, 0xCu);
    }
    memset(&__p, 170, sizeof(__p));
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    if (!std::string::compare((const std::string *)v2, "AppleTCController"))
    {
      std::string::operator=(&__p, (const std::string *)v2);
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v25, "IOPortTransportState");
      v7 = *(char *)(v2 + 23);
      if (v7 >= 0)
        v8 = (const std::string::value_type *)v2;
      else
        v8 = *(const std::string::value_type **)v2;
      if (v7 >= 0)
        v9 = *(unsigned __int8 *)(v2 + 23);
      else
        v9 = *(_QWORD *)(v2 + 8);
      v10 = std::string::append(&v25, v8, v9);
      v11 = v10->__r_.__value_.__r.__words[0];
      v26[0] = v10->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v26 + 7) = *(std::string::size_type *)((char *)&v10->__r_.__value_.__r.__words[1] + 7);
      v12 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      __p.__r_.__value_.__r.__words[0] = v11;
      __p.__r_.__value_.__l.__size_ = v26[0];
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v26 + 7);
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = v12;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
    }
    v14 = *(IONotificationPort **)(a1 + 40);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v16 = IOServiceMatching((const char *)p_p);
    v25.__r_.__value_.__r.__words[0] = v2;
    v17 = (void (__cdecl *)(void *, io_iterator_t))*((_QWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v25)+ 10);
    v25.__r_.__value_.__r.__words[0] = v2;
    v18 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v25);
    v19 = IOServiceAddMatchingNotification(v14, "IOServiceFirstPublish", v16, v17, (void *)a1, (io_iterator_t *)v18 + 16);
    v13 = v19 == 0;
    if (v19
      || (v25.__r_.__value_.__r.__words[0] = v2,
          !*((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v25)+ 16)))
    {
      v20 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(v2 + 23) < 0)
          v2 = *(_QWORD *)v2;
        LODWORD(v25.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = v2;
        _os_log_impl(&dword_20E5A6000, v20, OS_LOG_TYPE_DEFAULT, "#I Did not find the service (%s) yet", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      v25.__r_.__value_.__r.__words[0] = v2;
      v21 = (void (*)(uint64_t, _QWORD))*((_QWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v25)+ 10);
      v25.__r_.__value_.__r.__words[0] = v2;
      v22 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v25);
      v21(a1, *((unsigned int *)v22 + 16));
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v13;
}

void sub_20E5B6D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

const void **ctu::iokit::IOPortUSBCController::initTCController(uint64_t **this, unsigned int *a2)
{
  uint64_t **v4;
  const __CFArray *v5;
  CFTypeID v6;
  NSObject *v7;
  CFIndex Count;
  NSObject *v9;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFArrayRef theArray;
  _OWORD *v14;
  _BYTE __p[12];
  __int16 v16;
  CFIndex v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(__p, "AppleTCController");
  v4 = this + 10;
  v14 = __p;
  *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(this + 10, (void **)__p, &v14)+ 56) = 1;
  if (v18 < 0)
    operator delete(*(void **)__p);
  ctu::iokit::IOPortUSBCController::getPropertyFromIOService((ctu::iokit::IOPortUSBCController *)this, a2, CFSTR("TransportsSupported"), __p);
  v5 = *(const __CFArray **)__p;
  if (*(_QWORD *)__p && (v6 = CFGetTypeID(*(CFTypeRef *)__p), v6 == CFArrayGetTypeID()))
  {
    theArray = v5;
    CFRetain(v5);
  }
  else
  {
    theArray = 0;
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  v7 = this[4];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 138412290;
    *(_QWORD *)&__p[4] = theArray;
    _os_log_impl(&dword_20E5A6000, v7, OS_LOG_TYPE_DEFAULT, "#I Supporting Protocol: %@", __p, 0xCu);
  }
  Count = CFArrayGetCount(theArray);
  v9 = this[4];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = "AppleTCController";
    v16 = 2048;
    v17 = Count;
    _os_log_debug_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_DEBUG, "#D The number of Supported Protocol of %s: %lu", __p, 0x16u);
    if (!Count)
      return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  }
  else if (!Count)
  {
    return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  }
  for (i = 0; i != Count; ++i)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
    if (CFStringCompare(ValueAtIndex, CFSTR("CC"), 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "CC");
      v14 = __p;
      *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0)
        operator delete(*(void **)__p);
    }
    if (CFStringCompare(ValueAtIndex, CFSTR("USB2"), 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB2");
      v14 = __p;
      *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0)
        operator delete(*(void **)__p);
    }
    if (CFStringCompare(ValueAtIndex, CFSTR("USB3"), 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB3");
      v14 = __p;
      *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0)
        operator delete(*(void **)__p);
    }
    if (CFStringCompare(ValueAtIndex, CFSTR("DisplayPort"), 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "DisplayPort");
      v14 = __p;
      *((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0)
        operator delete(*(void **)__p);
    }
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_20E5B70EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOPortUSBCController::getPropertyFromIOService(ctu::iokit::IOPortUSBCController *this@<X0>, io_registry_entry_t *a2@<X1>, CFStringRef key@<X2>, _QWORD *a4@<X8>)
{
  CFTypeRef CFProperty;
  uint64_t (*v8)(uint64_t);
  NSObject *v9;
  _BYTE v10[12];
  __int16 v11;
  CFTypeRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  CFProperty = IORegistryEntryCreateCFProperty(*a2, key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  *a4 = CFProperty;
  *(_QWORD *)v10 = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)v10);
  v8 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!CFProperty)
    v8 = 0;
  v9 = *((_QWORD *)this + 4);
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v10 = 138412546;
      *(_QWORD *)&v10[4] = key;
      v11 = 2112;
      v12 = CFProperty;
      _os_log_debug_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_DEBUG, "#D Property for %@: %@", v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v10 = 138412290;
    *(_QWORD *)&v10[4] = key;
    _os_log_error_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_ERROR, "Failed to get a property of %@", v10, 0xCu);
  }
}

void sub_20E5B72BC(_Unwind_Exception *a1)
{
  const void **v1;

  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::initProtocol(ctu::iokit::IOPortUSBCController *this, unsigned int *a2)
{
  io_registry_entry_t v3;
  const __CFAllocator *v5;
  uint64_t (*v6)(uint64_t);
  CFTypeID v7;
  NSObject *v8;
  uint64_t (*v9)(uint64_t);
  CFTypeID v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t **v14;
  int v15;
  _OWORD *v16;
  int Value;
  const char *v18;
  const void *v19;
  CFTypeRef CFProperty;
  CFTypeRef cf;
  _OWORD *v22;
  _BYTE v23[12];
  __int16 v24;
  const char *v25;
  char v26;
  uint8_t buf[16];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  if (*a2)
  {
    cf = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    cf = IORegistryEntryCreateCFProperty(v3, CFSTR("TransportTypeDescription"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    *(_QWORD *)buf = 0;
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
    if (cf)
      v6 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
    else
      v6 = 0;
    if (!v6)
      goto LABEL_34;
    v7 = CFGetTypeID(cf);
    if (v7 != CFStringGetTypeID())
      goto LABEL_34;
    v8 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = cf;
      _os_log_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEFAULT, "#I Found: %@", buf, 0xCu);
    }
    *(_OWORD *)buf = 0u;
    v28 = 0u;
    if (CFStringGetCString((CFStringRef)cf, (char *)buf, 32, 0x600u)
      && !ctu::iokit::IOPortUSBCController::registerMessageNotifier(this, (char *)buf, a2))
    {
      v13 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v23 = 138412290;
        *(_QWORD *)&v23[4] = cf;
        _os_log_error_impl(&dword_20E5A6000, v13, OS_LOG_TYPE_ERROR, "%@: Failed to initialize register message notifier", v23, 0xCu);
      }
      goto LABEL_34;
    }
    CFProperty = 0;
    CFProperty = IORegistryEntryCreateCFProperty(*a2, CFSTR("Active"), v5, 0);
    *(_QWORD *)v23 = 0;
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)v23);
    if (CFProperty)
      v9 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
    else
      v9 = 0;
    if (v9)
    {
      v10 = CFGetTypeID(CFProperty);
      if (v10 == CFBooleanGetTypeID())
      {
        v11 = *((_QWORD *)this + 4);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          Value = CFBooleanGetValue((CFBooleanRef)CFProperty);
          v18 = "YES";
          if (!Value)
            v18 = "NO";
          *(_DWORD *)v23 = 138412546;
          *(_QWORD *)&v23[4] = cf;
          v24 = 2080;
          v25 = v18;
          _os_log_debug_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_DEBUG, "#D %@: [init] Active: %s", v23, 0x16u);
        }
        if (CFBooleanGetValue((CFBooleanRef)CFProperty))
        {
          if (CFStringCompare((CFStringRef)cf, CFSTR("CC"), 1uLL))
          {
            ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v19, cf);
            ctu::iokit::IOPortUSBCController::detectingAccessories((uint64_t)this, (CFStringRef *)&v19, a2);
            ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v19);
          }
          else
          {
            ctu::iokit::IOPortUSBCController::setupUSBProtocols(this);
          }
        }
      }
    }
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    v14 = (uint64_t **)((char *)this + 80);
    v22 = v23;
    v15 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22)+ 16);
    if (v26 < 0)
    {
      operator delete(*(void **)v23);
      if (!v15)
      {
LABEL_33:
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&CFProperty);
LABEL_34:
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        return;
      }
    }
    else if (!v15)
    {
      goto LABEL_33;
    }
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    v22 = v23;
    v16 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22);
    IOObjectRelease(*((_DWORD *)v16 + 16));
    if (v26 < 0)
      operator delete(*(void **)v23);
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    v22 = v23;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22)+ 16) = 0;
    if (v26 < 0)
      operator delete(*(void **)v23);
    goto LABEL_33;
  }
  v12 = *((_QWORD *)this + 4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20E5A6000, v12, OS_LOG_TYPE_ERROR, "service object is NULL!", buf, 2u);
  }
}

void sub_20E5B769C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, const void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&a9);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a10);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&a11);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL ctu::iokit::IOPortUSBCController::registerMessageNotifier(ctu::iokit::IOPortUSBCController *this, char *a2, unsigned int *a3)
{
  IONotificationPort *v5;
  io_service_t v6;
  uint64_t **v7;
  io_object_t *v8;
  kern_return_t v9;
  kern_return_t v10;
  NSObject *v11;
  int v12;
  _OWORD *v13;
  _OWORD *v15;
  _BYTE __p[12];
  __int16 v17;
  kern_return_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (IONotificationPort *)*((_QWORD *)this + 5);
  v6 = *a3;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v7 = (uint64_t **)((char *)this + 80);
  v15 = __p;
  v8 = (io_object_t *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)__p, &v15);
  v9 = IOServiceAddInterestNotification(v5, v6, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::IOPortUSBCController::serviceCallback, this, v8 + 18);
  v10 = v9;
  if (v19 < 0)
  {
    operator delete(*(void **)__p);
    if (!v10)
      return v10 == 0;
  }
  else if (!v9)
  {
    return v10 == 0;
  }
  v11 = *((_QWORD *)this + 4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = a2;
    v17 = 1024;
    v18 = v10;
    _os_log_error_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_ERROR, "Failed to add notification to %s with error of 0x%x", __p, 0x12u);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v15 = __p;
  v12 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15)+ 18);
  if (v19 < 0)
  {
    operator delete(*(void **)__p);
    if (!v12)
      return v10 == 0;
  }
  else if (!v12)
  {
    return v10 == 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v15 = __p;
  v13 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15);
  IOObjectRelease(*((_DWORD *)v13 + 18));
  if (v19 < 0)
    operator delete(*(void **)__p);
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v15 = __p;
  *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15)+ 18) = 0;
  if (v19 < 0)
    operator delete(*(void **)__p);
  return v10 == 0;
}

void sub_20E5B7900(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOPortUSBCController::setupUSBProtocols(ctu::iokit::IOPortUSBCController *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  _QWORD *v6;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (!v2 || (v3 = *(_QWORD *)this, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  v6 = operator new(8uLL);
  *v6 = this;
  v7 = *((_QWORD *)this + 2);
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  v10 = operator new(0x18uLL);
  *v10 = v6;
  v10[1] = v3;
  v10[2] = v5;
  dispatch_async_f(v7, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::execute_wrapped<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>(ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ctu::iokit::IOPortUSBCController::detectingAccessories(uint64_t a1, CFStringRef *a2, io_registry_entry_t *a3)
{
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CFStringRef v10;
  CFStringRef v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v6 = *(_DWORD *)(a1 + 48);
  v7 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_debug_impl(&dword_20E5A6000, v7, OS_LOG_TYPE_DEBUG, "#D Detecting Accessories", v14, 2u);
  }
  if (CFStringCompare(*a2, CFSTR("USB3"), 1uLL) == kCFCompareEqualTo)
  {
    *(_DWORD *)(a1 + 48) |= 1u;
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEFAULT, "#I USB3 accessory is detected", buf, 2u);
    }
  }
  if (CFStringCompare(*a2, CFSTR("DisplayPort"), 1uLL) == kCFCompareEqualTo)
  {
    *(_DWORD *)(a1 + 48) |= 2u;
    v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20E5A6000, v9, OS_LOG_TYPE_DEFAULT, "#I DisplayPort accessory is detected", v12, 2u);
    }
  }
  v10 = *a2;
  v11 = v10;
  if (v10)
    CFRetain(v10);
  *(_DWORD *)(a1 + 48) |= ctu::iokit::IOPortUSBCController::getAccessories(a1, (uint64_t *)&v11, a3);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v11);
  if (v6 != *(_DWORD *)(a1 + 48))
    ctu::iokit::IOPortUSBCController::notifyCallback((ctu::iokit::IOPortUSBCController *)a1);
}

void sub_20E5B7B98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::serviceCallback(ctu::iokit::IOPortUSBCController *this, void *a2, int a3, void *a4, void *a5)
{
  uint8_t v5[12];
  unsigned int v6;

  v6 = a2;
  if (this)
  {
    ctu::iokit::IOPortUSBCController::messageHandler(this, &v6, a3, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20E5A6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to get IOPortUSBCController object!", v5, 2u);
  }
}

const void **ctu::iokit::IOPortUSBCController::messageHandler(ctu::iokit::IOPortUSBCController *this, unsigned int *a2, int a3, void *a4)
{
  const __CFAllocator *v7;
  uint64_t (*v8)(uint64_t);
  CFTypeID v9;
  NSObject *v10;
  const __CFBoolean *v11;
  uint64_t (*v12)(uint64_t);
  CFTypeID v13;
  NSObject *v14;
  NSObject *v15;
  const __CFBoolean *v16;
  uint64_t (*v17)(uint64_t);
  CFTypeID v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  int Value;
  const char *v25;
  const void *v26;
  CFTypeRef CFProperty;
  CFTypeRef cf;
  _BYTE buf[12];
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = IORegistryEntryCreateCFProperty(*a2, CFSTR("TransportTypeDescription"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  *(_QWORD *)buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf)
    v8 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  else
    v8 = 0;
  if (v8 && (v9 = CFGetTypeID(cf), v9 == CFStringGetTypeID()))
  {
    v10 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = cf;
      v30 = 1024;
      LODWORD(v31) = a3;
      _os_log_debug_impl(&dword_20E5A6000, v10, OS_LOG_TYPE_DEBUG, "#D %@: [message]: 0x%x", buf, 0x12u);
    }
    if (a3 == -469794815)
    {
      CFProperty = 0;
      CFProperty = IORegistryEntryCreateCFProperty(*a2, CFSTR("Active"), v7, 0);
      *(_QWORD *)buf = 0;
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
      v16 = (const __CFBoolean *)CFProperty;
      if (CFProperty)
        v17 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
      else
        v17 = 0;
      if (!v17)
      {
        v18 = CFGetTypeID(CFProperty);
        if (v18 != CFBooleanGetTypeID())
        {
          v20 = *((_QWORD *)this + 4);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = cf;
            goto LABEL_44;
          }
LABEL_35:
          ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&CFProperty);
          return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        }
        v16 = (const __CFBoolean *)CFProperty;
      }
      v19 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        Value = CFBooleanGetValue(v16);
        v25 = "YES";
        if (!Value)
          v25 = "NO";
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = cf;
        v30 = 2080;
        v31 = v25;
        _os_log_debug_impl(&dword_20E5A6000, v19, OS_LOG_TYPE_DEBUG, "#D %@: [message] Active: %s", buf, 0x16u);
        v16 = (const __CFBoolean *)CFProperty;
      }
      if (CFBooleanGetValue(v16) && CFStringCompare((CFStringRef)cf, CFSTR("CC"), 1uLL) == kCFCompareEqualTo)
        ctu::iokit::IOPortUSBCController::setupUSBProtocols(this);
      goto LABEL_35;
    }
    if (a3 == -536870608)
    {
      CFProperty = 0;
      CFProperty = IORegistryEntryCreateCFProperty(*a2, CFSTR("Active"), v7, 0);
      *(_QWORD *)buf = 0;
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
      v11 = (const __CFBoolean *)CFProperty;
      if (CFProperty)
        v12 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
      else
        v12 = 0;
      if (v12)
        goto LABEL_16;
      v13 = CFGetTypeID(CFProperty);
      if (v13 == CFBooleanGetTypeID())
      {
        v11 = (const __CFBoolean *)CFProperty;
LABEL_16:
        v14 = *((_QWORD *)this + 4);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v22 = CFBooleanGetValue(v11);
          v23 = "YES";
          if (!v22)
            v23 = "NO";
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = cf;
          v30 = 2080;
          v31 = v23;
          _os_log_debug_impl(&dword_20E5A6000, v14, OS_LOG_TYPE_DEBUG, "#D %@: [message] Active: %s", buf, 0x16u);
          v11 = (const __CFBoolean *)CFProperty;
        }
        if (CFBooleanGetValue(v11) && CFStringCompare((CFStringRef)cf, CFSTR("CC"), 1uLL))
        {
          ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v26, cf);
          ctu::iokit::IOPortUSBCController::detectingAccessories((uint64_t)this, (CFStringRef *)&v26, a2);
          ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v26);
        }
        goto LABEL_35;
      }
      v20 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = cf;
LABEL_44:
        _os_log_error_impl(&dword_20E5A6000, v20, OS_LOG_TYPE_ERROR, "%@: Failed to read active property", buf, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  else
  {
    v15 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_error_impl(&dword_20E5A6000, v15, OS_LOG_TYPE_ERROR, "Failed to get the service description and not going to handle the message: 0x%x", buf, 8u);
    }
  }
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
}

void sub_20E5B807C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  const void *v5;
  va_list va1;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v5 = va_arg(va2, const void *);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::IOPortUSBCController::getAccessories(uint64_t a1, uint64_t *a2, io_registry_entry_t *a3)
{
  const __CFAllocator *v6;
  uint64_t (*v7)(uint64_t);
  CFTypeID v8;
  CFNumberType Type;
  int v10;
  NSObject *v11;
  CFTypeRef CFProperty;
  CFTypeRef v13;
  uint64_t (*v14)(uint64_t);
  CFTypeID v15;
  CFNumberType v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  NSObject *v27;
  CFTypeRef v28;
  CFTypeRef v29;
  NSObject *v30;
  CFTypeRef v31;
  CFTypeRef v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int valuePtr;
  CFTypeRef cf;
  _BYTE buf[12];
  __int16 v40;
  CFTypeRef v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = IORegistryEntryCreateCFProperty(*a3, CFSTR("Vendor ID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  *(_QWORD *)buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf)
    v7 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  else
    v7 = 0;
  if (!v7 || (v8 = CFGetTypeID(cf), v8 != CFNumberGetTypeID()))
  {
    v20 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = cf;
      _os_log_debug_impl(&dword_20E5A6000, v20, OS_LOG_TYPE_DEBUG, "#D No vendor ID is given or it is not a number: %@", buf, 0xCu);
    }
    goto LABEL_30;
  }
  valuePtr = 0;
  Type = CFNumberGetType((CFNumberRef)cf);
  if (!Type || !CFNumberGetValue((CFNumberRef)cf, Type, &valuePtr))
  {
    v21 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_30:
      v19 = 0;
      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = cf;
LABEL_24:
    _os_log_error_impl(&dword_20E5A6000, v21, OS_LOG_TYPE_ERROR, "Failed to convert a number: %@", buf, 0xCu);
    goto LABEL_30;
  }
  v10 = valuePtr;
  v11 = *(NSObject **)(a1 + 32);
  if (valuePtr != 1452)
  {
    v19 = 0;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    v22 = "#I Non-Apple Vendor (ID: 0x%x) is detected";
    v23 = v11;
    v24 = 8;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 1452;
    _os_log_debug_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_DEBUG, "#D Apple Product (ID: 0x%x) is detected", buf, 8u);
  }
  CFProperty = IORegistryEntryCreateCFProperty(*a3, CFSTR("Product ID"), v6, 0);
  v13 = cf;
  cf = CFProperty;
  *(_QWORD *)buf = v13;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf)
    v14 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  else
    v14 = 0;
  if (!v14 || (v15 = CFGetTypeID(cf), v15 != CFNumberGetTypeID()))
  {
    v25 = *(NSObject **)(a1 + 32);
    v19 = 0;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = cf;
    v22 = "#I No product ID is given or it is not a number: %@";
    v23 = v25;
    v24 = 12;
LABEL_29:
    _os_log_impl(&dword_20E5A6000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_30;
  }
  v36 = 0;
  v16 = CFNumberGetType((CFNumberRef)cf);
  if (!CFNumberGetValue((CFNumberRef)cf, v16, &v36))
  {
    v21 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = cf;
    goto LABEL_24;
  }
  v17 = v36;
  if (v36 != 4362)
  {
    v19 = 0;
LABEL_35:
    if (v17 == 4363)
    {
      v27 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v27, OS_LOG_TYPE_DEFAULT, "#I EarPods with USB-C Connector is detected", buf, 2u);
      }
      v19 = v19 | 8;
    }
    goto LABEL_40;
  }
  v18 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E5A6000, v18, OS_LOG_TYPE_DEFAULT, "#I USB-C to 3.5mm Headphone Jack Adapter is detected", buf, 2u);
    v19 = 4;
    v17 = v36;
    goto LABEL_35;
  }
  v19 = 4;
LABEL_40:
  v28 = IORegistryEntryCreateCFProperty(*a3, CFSTR("Manufacturer"), v6, 0);
  v29 = cf;
  cf = v28;
  *(_QWORD *)buf = v29;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  v30 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v35 = *a2;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v35;
    v40 = 2112;
    v41 = cf;
    _os_log_debug_impl(&dword_20E5A6000, v30, OS_LOG_TYPE_DEBUG, "#D %@: Property for Manufacturer: %@", buf, 0x16u);
  }
  v31 = IORegistryEntryCreateCFProperty(*a3, CFSTR("Product"), v6, 0);
  v32 = cf;
  cf = v31;
  *(_QWORD *)buf = v32;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  v33 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v34 = *a2;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v34;
    v40 = 2112;
    v41 = cf;
    _os_log_debug_impl(&dword_20E5A6000, v33, OS_LOG_TYPE_DEBUG, "#D %@: Property for Product: %@", buf, 0x16u);
  }
LABEL_31:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
  return v19;
}

void sub_20E5B85C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::notifyCallback(ctu::iokit::IOPortUSBCController *this)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  const void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void *aBlock;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *((_DWORD *)this + 12);
    LODWORD(v14) = 67109120;
    HIDWORD(v14) = v3;
    _os_log_impl(&dword_20E5A6000, v2, OS_LOG_TYPE_DEFAULT, "#I Notifying callback with bitmask: 0x%x", (uint8_t *)&v14, 8u);
  }
  v4 = *((_QWORD *)this + 7);
  v5 = *((_QWORD *)this + 8);
  if (v4 == v5)
  {
    v13 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_20E5A6000, v13, OS_LOG_TYPE_ERROR, "No callback is registered yet", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    do
    {
      if (*(_QWORD *)v4)
        v6 = _Block_copy(*(const void **)v4);
      else
        v6 = 0;
      v7 = *(NSObject **)(v4 + 8);
      if (v7)
        dispatch_retain(*(dispatch_object_t *)(v4 + 8));
      v8 = *((_DWORD *)this + 12);
      if (v6)
      {
        v9 = _Block_copy(v6);
        v10 = v9;
        v14 = MEMORY[0x24BDAC760];
        v15 = 1174405120;
        v16 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEclIJS3_EEEvDpT__block_invoke;
        v17 = &__block_descriptor_tmp_3;
        if (v9)
        {
          v11 = _Block_copy(v9);
          v12 = 0;
        }
        else
        {
          v11 = 0;
          v12 = 1;
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
        v14 = MEMORY[0x24BDAC760];
        v15 = 1174405120;
        v12 = 1;
        v16 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEclIJS3_EEEvDpT__block_invoke;
        v17 = &__block_descriptor_tmp_3;
      }
      aBlock = v11;
      v19 = v8;
      dispatch_async(v7, &v14);
      if (aBlock)
        _Block_release(aBlock);
      if ((v12 & 1) == 0)
        _Block_release(v10);
      if (v7)
        dispatch_release(v7);
      if (v6)
        _Block_release(v6);
      v4 += 16;
    }
    while (v4 != v5);
  }
}

void sub_20E5B8800(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

BOOL ctu::iokit::IOPortUSBCController::setupDisconnectingService(uint64_t a1, void **a2)
{
  std::string::size_type v2;
  uint64_t **v4;
  void **v5;
  NSObject *v6;
  int v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  std::string *v10;
  __int128 v11;
  IONotificationPort *v12;
  void **v13;
  const __CFDictionary *v14;
  char *v15;
  kern_return_t v16;
  _BOOL8 v17;
  char *v18;
  void *v20;
  std::string v21;
  void *__p[2];
  int64_t v23;
  uint64_t v24;

  v2 = (std::string::size_type)a2;
  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t **)(a1 + 80);
  v5 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(a1 + 80, a2);
  v6 = *(NSObject **)(a1 + 32);
  if ((void **)(a1 + 88) == v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v2 + 23) < 0)
        v2 = *(_QWORD *)v2;
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = (void *)v2;
      _os_log_error_impl(&dword_20E5A6000, v6, OS_LOG_TYPE_ERROR, "Cannot setup disconnecting service because no find %s in the internal context", (uint8_t *)__p, 0xCu);
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)v2;
      if (*(char *)(v2 + 23) < 0)
        v20 = *(void **)v2;
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v20;
      _os_log_debug_impl(&dword_20E5A6000, v6, OS_LOG_TYPE_DEBUG, "#D Setting up disconnecting service: %s", (uint8_t *)__p, 0xCu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v21, "IOPortTransportState");
    v7 = *(char *)(v2 + 23);
    if (v7 >= 0)
      v8 = (const std::string::value_type *)v2;
    else
      v8 = *(const std::string::value_type **)v2;
    if (v7 >= 0)
      v9 = *(unsigned __int8 *)(v2 + 23);
    else
      v9 = *(_QWORD *)(v2 + 8);
    v10 = std::string::append(&v21, v8, v9);
    v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    v23 = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v21.__r_.__value_.__l.__data_);
    v12 = *(IONotificationPort **)(a1 + 40);
    if (v23 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    v14 = IOServiceMatching((const char *)v13);
    v21.__r_.__value_.__r.__words[0] = v2;
    v15 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v21);
    v16 = IOServiceAddMatchingNotification(v12, "IOServiceTerminate", v14, (IOServiceMatchingCallback)ctu::iokit::IOPortUSBCController::disconnectingService, (void *)a1, (io_iterator_t *)v15 + 17);
    v17 = v16 == 0;
    if (!v16)
    {
      v21.__r_.__value_.__r.__words[0] = v2;
      if (*((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v21)+ 17))
      {
        v21.__r_.__value_.__r.__words[0] = v2;
        v18 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (__int128 **)&v21);
        ctu::iokit::IOPortUSBCController::disconnectingService((ctu::iokit::IOPortUSBCController *)a1, *((_DWORD *)v18 + 17));
      }
    }
    if (SHIBYTE(v23) < 0)
      operator delete(__p[0]);
  }
  return v17;
}

void sub_20E5B8A70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ctu::iokit::IOPortUSBCController::disconnectingService(ctu::iokit::IOPortUSBCController *this, io_iterator_t iterator)
{
  uint64_t result;
  io_object_t v5;
  unsigned int v6;

  result = IOIteratorNext(iterator);
  v6 = result;
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      if (this)
        ctu::iokit::IOPortUSBCController::disconnectedService(this, &v6);
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
      v6 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

const void **ctu::iokit::IOPortUSBCController::disconnectedService(ctu::iokit::IOPortUSBCController *this, unsigned int *a2)
{
  uint64_t (*v3)(uint64_t);
  CFTypeID v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  _OWORD *v16;
  NSObject *v17;
  int v18;
  _OWORD *v19;
  NSObject *v20;
  int v21;
  _OWORD *v22;
  CFTypeRef cf;
  _OWORD *v24;
  _BYTE buf[12];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  cf = IORegistryEntryCreateCFProperty(*a2, CFSTR("TransportTypeDescription"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  *(_QWORD *)buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  v3 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!cf)
    v3 = 0;
  if (v3 && (v4 = CFGetTypeID(cf), v4 == CFStringGetTypeID()))
  {
    v5 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = cf;
      _os_log_impl(&dword_20E5A6000, v5, OS_LOG_TYPE_DEFAULT, "#I %@: Disconnected Service", buf, 0xCu);
    }
    v6 = *((_DWORD *)this + 12);
    v7 = v6;
    if ((v6 & 4) != 0)
    {
      v8 = *((_QWORD *)this + 4);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      v10 = v6;
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v8, OS_LOG_TYPE_DEFAULT, "#I USB-C to 3.5mm Headphone Jack Adapter is removed", buf, 2u);
        v10 = *((_DWORD *)this + 12);
      }
      v7 = v10 & 0xFFFFFFFB;
      *((_DWORD *)this + 12) = v10 & 0xFFFFFFFB;
    }
    if ((v6 & 8) != 0)
    {
      v11 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v11, OS_LOG_TYPE_DEFAULT, "#I EarPods with USB-C Connector is removed", buf, 2u);
        v7 = *((_DWORD *)this + 12);
      }
      *((_DWORD *)this + 12) = v7 & 0xFFFFFFF7;
    }
    if (CFStringCompare((CFStringRef)cf, CFSTR("USB2"), 1uLL) == kCFCompareEqualTo)
    {
      v14 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v14, OS_LOG_TYPE_DEFAULT, "#I USB2 accessory is removed", buf, 2u);
      }
      std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
      v24 = buf;
      v15 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0)
        operator delete(*(void **)buf);
      if (v15)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
        v24 = buf;
        v16 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v16 + 17));
        if (v26 < 0)
          operator delete(*(void **)buf);
        std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
        v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0)
          operator delete(*(void **)buf);
      }
    }
    if ((v6 & 1) != 0 && CFStringCompare((CFStringRef)cf, CFSTR("USB3"), 1uLL) == kCFCompareEqualTo)
    {
      v17 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v17, OS_LOG_TYPE_DEFAULT, "#I USB3 accessory is removed", buf, 2u);
      }
      *((_DWORD *)this + 12) &= ~1u;
      std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
      v24 = buf;
      v18 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0)
        operator delete(*(void **)buf);
      if (v18)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
        v24 = buf;
        v19 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v19 + 17));
        if (v26 < 0)
          operator delete(*(void **)buf);
        std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
        v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0)
          operator delete(*(void **)buf);
      }
    }
    if ((v6 & 2) != 0 && CFStringCompare((CFStringRef)cf, CFSTR("DisplayPort"), 1uLL) == kCFCompareEqualTo)
    {
      v20 = *((_QWORD *)this + 4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E5A6000, v20, OS_LOG_TYPE_DEFAULT, "#I DP (DisplayPort) accessory is removed", buf, 2u);
      }
      *((_DWORD *)this + 12) &= ~2u;
      std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
      v24 = buf;
      v21 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0)
        operator delete(*(void **)buf);
      if (v21)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
        v24 = buf;
        v22 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v22 + 17));
        if (v26 < 0)
          operator delete(*(void **)buf);
        std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
        v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0)
          operator delete(*(void **)buf);
      }
    }
    if (v6 != *((_DWORD *)this + 12))
      ctu::iokit::IOPortUSBCController::notifyCallback(this);
  }
  else
  {
    v12 = *((_QWORD *)this + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5A6000, v12, OS_LOG_TYPE_ERROR, "Failed to get transport description!", buf, 2u);
    }
  }
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
}

void sub_20E5B908C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&a9);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::registerCallback(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  __int128 v17;
  uint64_t v18;

  v4 = (_QWORD *)a1[8];
  v5 = a1[9];
  if ((unint64_t)v4 >= v5)
  {
    v7 = a1[7];
    v8 = ((uint64_t)v4 - v7) >> 4;
    if ((unint64_t)(v8 + 1) >> 60)
      std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
    v9 = v5 - v7;
    v10 = v9 >> 3;
    if (v9 >> 3 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
    {
      if (v11 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v12 = operator new(16 * v11);
    }
    else
    {
      v12 = 0;
    }
    v13 = (char *)&v12[2 * v11];
    v14 = std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(&v12[2 * v8], a2);
    v6 = v14 + 2;
    v15 = (_QWORD *)a1[7];
    v16 = (_QWORD *)a1[8];
    if (v16 == v15)
    {
      a1[7] = v14;
      a1[8] = v6;
      a1[9] = v13;
    }
    else
    {
      do
      {
        v17 = *((_OWORD *)v16 - 1);
        v16 -= 2;
        *((_OWORD *)v14 - 1) = v17;
        v14 -= 2;
        *v16 = 0;
        v16[1] = 0;
      }
      while (v16 != v15);
      v16 = (_QWORD *)a1[7];
      v18 = a1[8];
      a1[7] = v14;
      a1[8] = v6;
      a1[9] = v13;
      while ((_QWORD *)v18 != v16)
      {
        v18 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(v18);
      }
    }
    if (v16)
      operator delete(v16);
  }
  else
  {
    v6 = std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(v4, a2)+ 2;
  }
  a1[8] = v6;
}

std::string *ctu::iokit::IOPortUSBCController::asString@<X0>(std::string *result@<X0>, std::string *a2@<X8>)
{
  char v2;

  v2 = (char)result;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if ((result & 1) != 0)
    result = std::string::append(a2, "|USB3 Accessory", 0xFuLL);
  if ((v2 & 2) != 0)
    result = std::string::append(a2, "|DisplayPort Accessory", 0x16uLL);
  if ((v2 & 4) != 0)
    result = std::string::append(a2, "|USB-C to 3.5mm Headphone Jack Adapter", 0x26uLL);
  if ((v2 & 8) != 0)
    return std::string::append(a2, "|EarPods with USB-C Connector", 0x1DuLL);
  return result;
}

void sub_20E5B92AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)a1)
    _Block_release(*(const void **)a1);
}

_QWORD *ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(_QWORD *a1)
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

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(_QWORD *a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;

  v4 = *(void **)a2;
  if (*(_QWORD *)a2)
    v4 = _Block_copy(v4);
  v5 = *(NSObject **)(a2 + 8);
  *a1 = v4;
  a1[1] = v5;
  if (v5)
    dispatch_retain(v5);
  return a1;
}

void std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 16), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController*)#1}::operator() const(ctu::iokit::IOPortUSBCController*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController*)#1}::operator() const(ctu::iokit::IOPortUSBCController*)::{lambda(void *)#1}::__invoke(ctu::iokit::IOPortUSBCController *a1)
{
  void *v1;

  if (a1)
  {
    ctu::iokit::IOPortUSBCController::~IOPortUSBCController(a1);
    operator delete(v1);
  }
}

void std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, _OWORD **a3)
{
  void **v5;
  _OWORD *v6;
  uint64_t **v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v11 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (void **)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  v6 = *v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = operator new(0x58uLL);
    v8 = *a3;
    v9 = *((_QWORD *)*a3 + 2);
    v6[2] = **a3;
    *((_QWORD *)v6 + 6) = v9;
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *(_OWORD *)((char *)v6 + 56) = 0u;
    *(_OWORD *)((char *)v6 + 72) = 0u;
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(a1, v11, v7, (uint64_t *)v6);
  }
  return v6;
}

_QWORD *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void **std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(uint64_t a1, void **a2)
{
  void **v2;
  _QWORD *v3;
  void **v5;
  char v6;
  _QWORD *v7;

  v2 = (void **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (void **)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = (void **)v3;
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

char *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void **a2, __int128 **a3)
{
  void **v5;
  char *v6;
  uint64_t **v7;
  __int128 *v8;
  std::string *v9;
  __int128 v10;
  uint64_t v12;

  v12 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (void **)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  v6 = (char *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v8 = *a3;
    v6 = (char *)operator new(0x58uLL);
    v9 = (std::string *)(v6 + 32);
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
    }
    else
    {
      v10 = *v8;
      *((_QWORD *)v6 + 6) = *((_QWORD *)v8 + 2);
      *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
    }
    *(_OWORD *)(v6 + 72) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(a1, v12, v7, (uint64_t *)v6);
  }
  return v6;
}

void sub_20E5B9734(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(_QWORD *a1, CFTypeRef cf)
{
  CFTypeID v4;

  if (cf && (v4 = CFGetTypeID(cf), v4 == CFStringGetTypeID()))
  {
    *a1 = cf;
    CFRetain(cf);
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

void dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::execute_wrapped<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>(ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5[2];
  char v6;
  void *v7[2];
  char v8;
  void *v9[2];
  char v10;
  void *v11[2];
  char v12;
  void *__p[2];
  char v14;
  void *v15[2];
  char v16;
  uint8_t buf[8];
  char v18;

  v2 = *a1;
  v3 = **a1;
  v4 = *(NSObject **)(v3 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E5A6000, v4, OS_LOG_TYPE_DEFAULT, "#I USB protocol is detected. Setting it up", buf, 2u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
  v15[0] = buf;
  if (*((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v3 + 80), (void **)buf, (_OWORD **)v15)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v15, "USB2");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v3, v15))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB2");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v3, __p);
      if (v14 < 0)
        operator delete(__p[0]);
    }
    if (v16 < 0)
      operator delete(v15[0]);
  }
  if (v18 < 0)
    operator delete(*(void **)buf);
  std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
  v11[0] = buf;
  if (*((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v3 + 80), (void **)buf, (_OWORD **)v11)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v11, "USB3");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v3, v11))
    {
      std::string::basic_string[abi:ne180100]<0>(v9, "USB3");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v3, v9);
      if (v10 < 0)
        operator delete(v9[0]);
    }
    if (v12 < 0)
      operator delete(v11[0]);
  }
  if (v18 < 0)
    operator delete(*(void **)buf);
  std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
  v7[0] = buf;
  if (*((_BYTE *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v3 + 80), (void **)buf, (_OWORD **)v7)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "DisplayPort");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v3, v7))
    {
      std::string::basic_string[abi:ne180100]<0>(v5, "DisplayPort");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v3, v5);
      if (v6 < 0)
        operator delete(v5[0]);
    }
    if (v8 < 0)
      operator delete(v7[0]);
  }
  if (v18 < 0)
    operator delete(*(void **)buf);
  operator delete(v2);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  operator delete(a1);
}

void sub_20E5B9A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  void *v38;
  void *v39;
  uint64_t v40;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (*(char *)(v40 - 57) < 0)
    operator delete(*(void **)(v40 - 80));
  operator delete(v39);
  std::shared_ptr<ctu::power::assertion::HandleRaw>::~shared_ptr[abi:ne180100]((uint64_t)v38 + 8);
  operator delete(v38);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEE(uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)(a2 + 32);
  if (result)
    result = _Block_copy(result);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEE(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    _Block_release(v1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x24BDBC318](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x24BED4918]();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return MEMORY[0x24BED4920]();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return MEMORY[0x24BED4938]();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return MEMORY[0x24BED4948]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7ED8](*(_QWORD *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x24BDD81D8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x24BDD8368]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x24BDD8390]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x24BDD83B8]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x24BDD83E0]();
}

uint64_t IOHIDEventSystemClientUnregisterEventBlock()
{
  return MEMORY[0x24BDD83F0]();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return MEMORY[0x24BDD8410]();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return MEMORY[0x24BDD8528]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x24BDD8728]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x24BDD8750](*(_QWORD *)&theAssertion, theProperty, theValue);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x24BDD87D0]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x24BDD8820]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x24BED97C0]();
}

uint64_t _TelephonyUtilDebugPrintError()
{
  return MEMORY[0x24BED97D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  return MEMORY[0x24BED9348](this);
}

uint64_t capabilities::txpower::supportsHandDetection(capabilities::txpower *this)
{
  return MEMORY[0x24BED9350](this);
}

uint64_t ctu::UnfairLock::lock(ctu::UnfairLock *this)
{
  return MEMORY[0x24BED9808](this);
}

uint64_t ctu::UnfairLock::unlock(ctu::UnfairLock *this)
{
  return MEMORY[0x24BED9810](this);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9828](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x24BED9830]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x24BED9838](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x24BED9840](this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x24BED9870]();
}

uint64_t ctu::appendLeftoverBits()
{
  return MEMORY[0x24BED99F8]();
}

uint64_t ctu::appendLabelIfBitSet()
{
  return MEMORY[0x24BED9A18]();
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

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

{
  return MEMORY[0x24BED9AE0]();
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E90](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E98](this, a2);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C96E540(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C96E548(__sz);
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
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

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADDE8](group, queue, context, work);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

