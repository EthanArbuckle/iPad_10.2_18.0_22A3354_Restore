uint64_t BBUICE18Programmer::BBUICE18Programmer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = BBUICEProgrammer::BBUICEProgrammer(a1, a2, a3, a4);
  *(_QWORD *)v5 = off_24CE84220;
  *(_WORD *)(v5 + 81) = 0;
  *(_BYTE *)(v5 + 111) = 0;
  *(_BYTE *)(v5 + 88) = 0;
  *(_DWORD *)(v5 + 112) = 0;
  pthread_mutex_init((pthread_mutex_t *)(v5 + 120), 0);
  *(_DWORD *)(a1 + 184) = 0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 1065353216;
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 248) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 279) = 3;
  strcpy((char *)(a1 + 256), "EBL");
  *(_OWORD *)(a1 + 280) = xmmword_212B55610;
  *(_QWORD *)(a1 + 308) = 0;
  *(_QWORD *)(a1 + 300) = 0;
  *(_DWORD *)(a1 + 296) = 257;
  *(_QWORD *)a1 = off_24CE84F70;
  *(_DWORD *)(a1 + 316) = 0;
  *(_WORD *)(a1 + 324) = 0;
  *(_BYTE *)(a1 + 351) = 0;
  *(_BYTE *)(a1 + 328) = 0;
  *(_BYTE *)(a1 + 375) = 3;
  *(_DWORD *)(a1 + 352) = 4997701;
  *(_OWORD *)(a1 + 376) = xmmword_212B55F60;
  return a1;
}

void sub_212B266E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (*(char *)(v1 + 111) < 0)
    operator delete(*(void **)(v1 + 88));
  *(_QWORD *)v1 = off_24CE84B60;
  v3 = (uint64_t *)(v1 + 40);
  for (i = *(uint64_t **)(v1 + 48); i != v3; i = (uint64_t *)i[1])
  {
    v5 = i[2];
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
  if (*(_QWORD *)(v1 + 56))
  {
    v7 = *(_QWORD *)(v1 + 40);
    v6 = *(uint64_t **)(v1 + 48);
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    *(_QWORD *)(v1 + 56) = 0;
    if (v6 != v3)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != v3);
    }
  }
  _Unwind_Resume(exception_object);
}

void BBUICE18Programmer::~BBUICE18Programmer(void **this)
{
  *this = off_24CE84F70;
  if (*((char *)this + 375) < 0)
  {
    operator delete(this[44]);
    if ((*((char *)this + 351) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(this[41]);
    BBUICE16Programmer::~BBUICE16Programmer((BBUICE16Programmer *)this);
    return;
  }
  if (*((char *)this + 351) < 0)
    goto LABEL_6;
LABEL_3:
  BBUICE16Programmer::~BBUICE16Programmer((BBUICE16Programmer *)this);
}

{
  void *v2;

  *this = off_24CE84F70;
  if (*((char *)this + 375) < 0)
  {
    operator delete(this[44]);
    if ((*((char *)this + 351) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(this[41]);
    BBUICE16Programmer::~BBUICE16Programmer((BBUICE16Programmer *)this);
    goto LABEL_4;
  }
  if (*((char *)this + 351) < 0)
    goto LABEL_6;
LABEL_3:
  BBUICE16Programmer::~BBUICE16Programmer((BBUICE16Programmer *)this);
LABEL_4:
  operator delete(v2);
}

uint64_t BBUICE18Programmer::saveMRCData(BBUFeedback **this, unsigned __int8 *a2, CFIndex length)
{
  CFDataRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFDataRef v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  void *__p[2];
  char v16;
  _QWORD v17[2];

  v4 = CFDataCreateWithBytesNoCopy(0, a2, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (v4)
  {
    v8 = v4;
    v9 = operator new(0x18uLL);
    v9[4] = 0;
    *(_QWORD *)v9 = off_24CE84890;
    *((_QWORD *)v9 + 1) = v8;
    CFRetain(v8);
    BBUICE16UpdateSource::getMRCFilePath((uint64_t)__p);
    v10 = BBUDataSource::saveDataToFile((uint64_t)v9, (uint64_t)__p, 1);
    if (v16 < 0)
      operator delete(__p[0]);
    CFRelease(v8);
    (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 8))(v9);
    return v10;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
    {
LABEL_7:
      if (gBBULogVerbosity >= 6)
        _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
    }
  }
  BBUFeedback::handleComment(this[1], "Failed creating CFDataRef");
  pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  v12 = qword_253D31DC8;
  if (!qword_253D31DC8)
  {
    BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
    std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
    std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
    v12 = qword_253D31DC8;
  }
  v17[0] = v12;
  v17[1] = off_253D31DD0;
  if (off_253D31DD0)
  {
    v13 = (unint64_t *)((char *)off_253D31DD0 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(__p, "Failed creating CFDataRef");
  BBUError::addError(v12, (uint64_t)__p, 19);
  if (v16 < 0)
    operator delete(__p[0]);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v17);
  return 19;
}

void sub_212B26A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  _Unwind_Resume(a1);
}

void BBUICE18Programmer::MRCResultString(int a1@<W1>, char *a2@<X8>)
{
  switch(a1)
  {
    case 0:
      a2[23] = 15;
      strcpy(a2, "InitialTuningOK");
      break;
    case 1:
      a2[23] = 16;
      strcpy(a2, "FastbootTuningOK");
      break;
    case 2:
      a2[23] = 17;
      strcpy(a2, "InitialTuningFail");
      break;
    case 3:
      a2[23] = 18;
      strcpy(a2, "FastbootTuningFail");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "unknown");
      break;
  }
}

uint64_t BBUICE18Programmer::mrcTrainInit(BBUFeedback **this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BBUFeedback *v11;
  int v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  void *__p[2];
  char v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  _DWORD __b[515];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v44 = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  if ((KTLPSIFormatEnhancedCommand() & 1) != 0)
  {
    BBUFeedback::handleComment(this[1], "Sending PSI enhanced command 'Start MRC Training' in mrcTrainInit ");
    if ((KTLPSISendEnhancedCommand() & 1) != 0)
    {
      BBUFeedback::handleComment(this[1], "Waiting for PSI command response");
      if ((KTLPSIReadMrcResponse() & 1) != 0)
      {
        BBUFeedback::handleComment(this[1], "psiResp.responseCode = %d", LOWORD(__b[1]));
        BBUFeedback::handleComment(this[1], "psiResp.param = %d", __b[0]);
        v11 = this[1];
        v12 = __b[2];
        (*((void (**)(void **__return_ptr, BBUFeedback **, _QWORD))*this + 38))(__p, this, __b[2]);
        if (v41 >= 0)
          v13 = __p;
        else
          v13 = (void **)__p[0];
        BBUFeedback::handleComment(v11, "psiResp.result = 0x%X (%s)", v12, (const char *)v13);
        if (v41 < 0)
          operator delete(__p[0]);
        if (LOWORD(__b[1]) == 5)
        {
          if ((__b[0] - 2049) > 0xFFFFFBFE)
          {
            if (!__b[2])
            {
              v20 = (*((uint64_t (**)(BBUFeedback **, _DWORD *))*this + 35))(this, &__b[3]);
              if (!(_DWORD)v20)
              {
                BBUFeedback::handleComment(this[1], "saved MRC data");
                return 0;
              }
              if (gBBULogMaskGet(void)::once == -1)
              {
                if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
                  goto LABEL_85;
              }
              else
              {
                dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
                {
LABEL_85:
                  if (gBBULogVerbosity >= 6)
                    _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
                }
              }
              BBUFeedback::handleComment(this[1], "Failed saving MRC data");
              pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
              v37 = qword_253D31DC8;
              if (!qword_253D31DC8)
              {
                BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
                std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
                std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
                v37 = qword_253D31DC8;
              }
              v42 = v37;
              v43 = off_253D31DD0;
              if (off_253D31DD0)
              {
                v38 = (unint64_t *)((char *)off_253D31DD0 + 8);
                do
                  v39 = __ldxr(v38);
                while (__stxr(v39 + 1, v38));
              }
              pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
              std::string::basic_string[abi:ne180100]<0>(__p, "MRC data not accepted");
              BBUError::addError(v37, (uint64_t)__p, v20);
              if (v41 < 0)
                operator delete(__p[0]);
              std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&v42);
              return v20;
            }
            if (gBBULogMaskGet(void)::once == -1)
            {
              if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
                goto LABEL_72;
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
              {
LABEL_72:
                if (gBBULogVerbosity >= 6)
                  _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
              }
            }
            BBUFeedback::handleComment(this[1], "Data Not accepted");
            pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
            v30 = qword_253D31DC8;
            if (!qword_253D31DC8)
            {
              BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
              std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
              std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
              v30 = qword_253D31DC8;
            }
            v42 = v30;
            v43 = off_253D31DD0;
            if (off_253D31DD0)
            {
              v35 = (unint64_t *)((char *)off_253D31DD0 + 8);
              do
                v36 = __ldxr(v35);
              while (__stxr(v36 + 1, v35));
            }
            pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
            std::string::basic_string[abi:ne180100]<0>(__p, "MRC data not accepted");
LABEL_80:
            BBUError::addError(v30, (uint64_t)__p, 12);
            if (v41 < 0)
              operator delete(__p[0]);
            std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&v42);
            return 12;
          }
          if (gBBULogMaskGet(void)::once == -1)
          {
            if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
              goto LABEL_62;
          }
          else
          {
            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
            if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
            {
LABEL_62:
              if (gBBULogVerbosity >= 6)
                _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
            }
          }
          BBUFeedback::handleComment(this[1], "Invalid MRC Data Length received from BB");
          pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          v30 = qword_253D31DC8;
          if (!qword_253D31DC8)
          {
            BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
            std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
            std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            v30 = qword_253D31DC8;
          }
          v42 = v30;
          v43 = off_253D31DD0;
          if (off_253D31DD0)
          {
            v33 = (unint64_t *)((char *)off_253D31DD0 + 8);
            do
              v34 = __ldxr(v33);
            while (__stxr(v34 + 1, v33));
          }
          pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          std::string::basic_string[abi:ne180100]<0>(__p, "Invalid MRC Data Length received from BB");
          goto LABEL_80;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
            goto LABEL_52;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
          {
LABEL_52:
            if (gBBULogVerbosity >= 6)
              _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
          }
        }
        BBUFeedback::handleComment(this[1], "MRC training RspId invalid");
        pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        v30 = qword_253D31DC8;
        if (!qword_253D31DC8)
        {
          BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
          std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
          std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          v30 = qword_253D31DC8;
        }
        v42 = v30;
        v43 = off_253D31DD0;
        if (off_253D31DD0)
        {
          v31 = (unint64_t *)((char *)off_253D31DD0 + 8);
          do
            v32 = __ldxr(v31);
          while (__stxr(v32 + 1, v31));
        }
        pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        std::string::basic_string[abi:ne180100]<0>(__p, "MRC training RspId invalid");
        goto LABEL_80;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
          goto LABEL_39;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
        {
LABEL_39:
          if (gBBULogVerbosity >= 6)
            _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v8, v9, v10, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
        }
      }
      BBUFeedback::handleComment(this[1], "Failed reading PSI command response");
      pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      v25 = qword_253D31DC8;
      if (!qword_253D31DC8)
      {
        BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
        std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        v25 = qword_253D31DC8;
      }
      v42 = v25;
      v43 = off_253D31DD0;
      if (off_253D31DD0)
      {
        v28 = (unint64_t *)((char *)off_253D31DD0 + 8);
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      std::string::basic_string[abi:ne180100]<0>(__p, "Failed reading PSI command response");
LABEL_47:
      BBUError::addError(v25, (uint64_t)__p, 3);
      if (v41 < 0)
        operator delete(__p[0]);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&v42);
      return 3;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
        goto LABEL_29;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
      {
LABEL_29:
        if (gBBULogVerbosity >= 6)
          _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
      }
    }
    BBUFeedback::handleComment(this[1], "Failed sending MRC training start in mrcTrainInit");
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v25 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
      std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      v25 = qword_253D31DC8;
    }
    v42 = v25;
    v43 = off_253D31DD0;
    if (off_253D31DD0)
    {
      v26 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    std::string::basic_string[abi:ne180100]<0>(__p, "Failed sending MRC training start in mrcTrainInit");
    goto LABEL_47;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
      goto LABEL_17;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
    {
LABEL_17:
      if (gBBULogVerbosity >= 6)
        _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v2, v3, v4, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
    }
  }
  BBUFeedback::handleComment(this[1], "Failed creating MRC training start command");
  pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  v22 = qword_253D31DC8;
  if (!qword_253D31DC8)
  {
    BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
    std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
    std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
    v22 = qword_253D31DC8;
  }
  v42 = v22;
  v43 = off_253D31DD0;
  if (off_253D31DD0)
  {
    v23 = (unint64_t *)((char *)off_253D31DD0 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(__p, "Failed creating MRC training start command");
  BBUError::addError(v22, (uint64_t)__p, 19);
  if (v41 < 0)
    operator delete(__p[0]);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&v42);
  return 19;
}

void sub_212B27608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUICE18Programmer::readMRCData(BBUFeedback **this, unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  void **v8;
  size_t v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  _QWORD *v15;
  uint64_t v16;
  BBUFeedback *v17;
  int v18;
  uint64_t result;
  uint64_t v20;
  unsigned int v21;
  void *__p[2];
  char v23;
  void *__dst[2];
  unint64_t v25;
  void **v26;

  BBUICE16UpdateSource::getMRCFileName((uint64_t)__p);
  if (v23 >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  v9 = strlen((const char *)v8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = (void *)v9;
  if (v9 >= 0x17)
  {
    v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v12 = v9 | 7;
    v13 = v12 + 1;
    v11 = (void **)operator new(v12 + 1);
    __dst[1] = v10;
    v25 = v13 | 0x8000000000000000;
    __dst[0] = v11;
    goto LABEL_11;
  }
  HIBYTE(v25) = v9;
  v11 = __dst;
  if (v9)
LABEL_11:
    memmove(v11, v8, (size_t)v10);
  *((_BYTE *)v10 + (_QWORD)v11) = 0;
  v26 = __dst;
  v14 = (const void *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BBUProgrammer::Item *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 24), (uint64_t)__dst, (uint64_t)&std::piecewise_construct, (__int128 **)&v26)+ 5);
  if (v14)
  {
    if ((SHIBYTE(v25) & 0x80000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v15 = 0;
  if (SHIBYTE(v25) < 0)
LABEL_14:
    operator delete(__dst[0]);
LABEL_15:
  if (v23 < 0)
  {
    operator delete(__p[0]);
    if (v15)
      goto LABEL_17;
LABEL_23:
    BBUFeedback::handleComment(this[1], "Can't find mrcImage");
    return 1;
  }
  if (!v15)
    goto LABEL_23;
LABEL_17:
  v16 = v15[2];
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16))
  {
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16) > a3)
    {
      v17 = this[1];
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16);
      BBUFeedback::handleComment(v17, "Buffer too small (%zu) for file (%u)", a3, v18);
      return 104;
    }
    v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16);
    (*(void (**)(uint64_t, unsigned __int8 *, uint64_t, _QWORD))(*(_QWORD *)v16 + 24))(v16, a2, v20, 0);
  }
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16);
  result = 0;
  *a4 = v21;
  return result;
}

void sub_212B279BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
  {
    operator delete(__p);
    if ((a16 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a16 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a11);
  _Unwind_Resume(exception_object);
}

uint64_t BBUICE18Programmer::handleHashResponseSha384(uint64_t a1, const void *a2, int a3, uint64_t a4, uint64_t a5)
{
  int v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  const char *v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  const char *v18;
  size_t v19;
  size_t v20;
  __int128 *p_dst;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  __int128 __dst;
  unint64_t v31;
  void *v32;

  v32 = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "handleHashResponse length = %u", a3);
  if (a2 && a3)
  {
    v10 = KTLParsePSIICEHashResponseSha384();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed parsing hash response");
    v11 = 12;
    v12 = v32;
    if (v10)
    {
      v28 = a5;
      v29 = a4;
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Received hash response, %d entries", *((_DWORD *)v32 + 1));
      v13 = operator new(0x20uLL);
      BBUICE18HashData::BBUICE18HashData(v13, *((_DWORD *)v32 + 1), (char *)v32 + 8);
      v14 = (const char *)v32;
      if (*((_DWORD *)v32 + 1))
      {
        v15 = 0;
        v16 = 8;
        do
        {
          v18 = &v14[v16];
          v19 = strlen(&v14[v16]);
          if (v19 >= 0x7FFFFFFFFFFFFFF8)
            std::string::__throw_length_error[abi:ne180100]();
          v20 = v19;
          if (v19 >= 0x17)
          {
            v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v19 | 7) != 0x17)
              v23 = v19 | 7;
            v24 = v23 + 1;
            p_dst = (__int128 *)operator new(v23 + 1);
            *((_QWORD *)&__dst + 1) = v20;
            v31 = v24 | 0x8000000000000000;
            *(_QWORD *)&__dst = p_dst;
          }
          else
          {
            HIBYTE(v31) = v19;
            p_dst = &__dst;
            if (!v19)
            {
              LOBYTE(__dst) = 0;
              v22 = *(_QWORD *)(a1 + 240);
              if (v22 >= *(_QWORD *)(a1 + 248))
                goto LABEL_19;
              goto LABEL_8;
            }
          }
          memmove(p_dst, v18, v20);
          *((_BYTE *)p_dst + v20) = 0;
          v22 = *(_QWORD *)(a1 + 240);
          if (v22 >= *(_QWORD *)(a1 + 248))
          {
LABEL_19:
            v25 = std::vector<std::string>::__push_back_slow_path<std::string>((void **)(a1 + 232), (uint64_t)&__dst);
            v26 = SHIBYTE(v31);
            *(_QWORD *)(a1 + 240) = v25;
            if (v26 < 0)
              operator delete((void *)__dst);
            goto LABEL_9;
          }
LABEL_8:
          v17 = __dst;
          *(_QWORD *)(v22 + 16) = v31;
          *(_OWORD *)v22 = v17;
          *(_QWORD *)(a1 + 240) = v22 + 24;
LABEL_9:
          ++v15;
          v14 = (const char *)v32;
          v16 += 112;
        }
        while (v15 < *((unsigned int *)v32 + 1));
      }
      if (v29)
      {
        v11 = 12;
        if (v28)
        {
          (*(void (**)(_QWORD *, _QWORD))(*v13 + 24))(v13, *(_QWORD *)(a1 + 8));
          if (((*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*v13 + 16))(v13, *(_QWORD *)(a1 + 8), v28) & 1) == 0)
          {
            BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "root manifest hash data mismatches baseband hash response");
            v11 = 33;
          }
        }
      }
      else
      {
        v11 = 12;
      }
      (*(void (**)(_QWORD *))(*v13 + 8))(v13);
      v12 = v32;
    }
    if (v12)
      free(v12);
  }
  else
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Bad arguments:  packet = %p\n", a2);
    return 2;
  }
  return v11;
}

void sub_212B27CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  operator delete(v18);
  _Unwind_Resume(a1);
}

uint64_t BBUICE18Programmer::doesMRCDataExist(BBUFeedback **this)
{
  void **v2;
  size_t v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  _QWORD **v9;
  void *__p[2];
  char v12;
  void *__dst[2];
  unint64_t v14;
  void **v15;

  BBUICE16UpdateSource::getMRCFileName((uint64_t)__p);
  if (v12 >= 0)
    v2 = __p;
  else
    v2 = (void **)__p[0];
  v3 = strlen((const char *)v2);
  if (v3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17)
      v6 = v3 | 7;
    v7 = v6 + 1;
    v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    v14 = v7 | 0x8000000000000000;
    __dst[0] = v5;
    goto LABEL_11;
  }
  HIBYTE(v14) = v3;
  v5 = __dst;
  if (v3)
LABEL_11:
    memmove(v5, v2, (size_t)v4);
  *((_BYTE *)v4 + (_QWORD)v5) = 0;
  v15 = __dst;
  v8 = (const void *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BBUProgrammer::Item *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 24), (uint64_t)__dst, (uint64_t)&std::piecewise_construct, (__int128 **)&v15)+ 5);
  if (v8)
  {
    if ((SHIBYTE(v14) & 0x80000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v9 = 0;
  if (SHIBYTE(v14) < 0)
LABEL_14:
    operator delete(__dst[0]);
LABEL_15:
  if (v12 < 0)
  {
    operator delete(__p[0]);
    if (v9)
      goto LABEL_17;
LABEL_22:
    BBUFeedback::handleComment(this[1], "No MRC image in programmer list");
    return 0;
  }
  if (!v9)
    goto LABEL_22;
LABEL_17:
  if ((*(unsigned int (**)(_QWORD *))(*v9[2] + 32))(v9[2]) - 1 < 0x800)
    return 1;
  BBUFeedback::handleComment(this[1], "MRC data size %lu invalid, ignoring existing data");
  return 0;
}

void sub_212B27E88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
  {
    operator delete(__p);
    if ((a16 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a16 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a11);
  _Unwind_Resume(exception_object);
}

uint64_t BBUICE18Programmer::mrcFastboot(BBUICE18Programmer *this)
{
  BBUFeedback **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BBUFeedback *v17;
  int v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BBUFeedback *v29;
  uint64_t v30;
  std::__shared_weak_count_vtbl *v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  NSObject *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v46;
  unint64_t *v47;
  unint64_t v48;
  NSObject *v49;
  unint64_t *v50;
  unint64_t v51;
  NSObject *v52;
  unint64_t *v53;
  unint64_t v54;
  NSObject *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t *v58;
  unint64_t v59;
  NSObject *v60;
  unint64_t *v61;
  unint64_t v62;
  char v63;
  void *v64;
  __int128 v65;
  uint64_t v66;
  void *v67;
  int v68;
  unint64_t v69;
  void *__p[2];
  void (*v71)(uint64_t);
  void *v72;
  uint64_t v73;
  void **v74;
  int v75;
  void **v76;
  dispatch_object_t object;
  uint64_t v78;
  _QWORD *(*v79)(uint64_t);
  void *v80;
  uint64_t v81;
  void ***v82;
  _DWORD v83[1029];
  uint64_t v84;

  v1 = (BBUFeedback **)MEMORY[0x24BDAC7A8](this);
  v84 = *MEMORY[0x24BDAC8D0];
  memset(v83, 170, sizeof(v83));
  v69 = 0;
  v68 = 0;
  v5 = (*((uint64_t (**)(BBUFeedback **, _DWORD *, uint64_t, unint64_t *))*v1 + 34))(v1, &v83[517], 2048, &v69);
  if (!(_DWORD)v5)
  {
    if (v69 < 0x801)
    {
      if ((KTLPSIFormatEnhancedCommandMrcData() & 1) != 0)
      {
        BBUFeedback::handleComment(v1[1], "Sending PSI enhanced command 'Start MRC Training'");
        v12 = KTLPSISendMrcTrainingCommand();
        if (gBBULogMaskGet(void)::once != -1)
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v13 = *(_QWORD *)gBBULogMaskGet(void)::sBBULogMask;
        if ((v12 & 1) == 0)
        {
          if ((v13 & 2) != 0 && gBBULogVerbosity >= 6)
            _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
          BBUFeedback::handleComment(v1[1], "Failed sending MRC training start in mrcFastboot, bytesSent = %u", v68);
          pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          v55 = qword_253D31DC8;
          if (!qword_253D31DC8)
          {
            BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
            std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
            std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            v55 = qword_253D31DC8;
          }
          object = v55;
          v78 = (uint64_t)off_253D31DD0;
          if (off_253D31DD0)
          {
            v56 = (unint64_t *)((char *)off_253D31DD0 + 8);
            do
              v57 = __ldxr(v56);
            while (__stxr(v57 + 1, v56));
          }
          pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          std::string::basic_string[abi:ne180100]<0>(__p, "Failed sending MRC training start in Fastboot");
          goto LABEL_112;
        }
        if ((v13 & 0x200) != 0 && gBBULogVerbosity >= 1)
          _BBULog(9, 1, "BBUProgrammer", "", "Waiting for PSI command response\n", v9, v10, v11, v63);
        if ((KTLPSIReadMrcResponse() & 1) != 0)
        {
          BBUFeedback::handleComment(v1[1], "psiResp.responseCode = %d", LOWORD(v83[1]));
          BBUFeedback::handleComment(v1[1], "psiResp.param = %d", v83[0]);
          v17 = v1[1];
          v18 = v83[2];
          (*((void (**)(void **__return_ptr, BBUFeedback **, _QWORD))*v1 + 38))(__p, v1, v83[2]);
          if (SHIBYTE(v71) >= 0)
            v19 = __p;
          else
            v19 = (void **)__p[0];
          BBUFeedback::handleComment(v17, "psiResp.result = 0x%X (%s)", v18, (const char *)v19);
          if (SHIBYTE(v71) < 0)
            operator delete(__p[0]);
          if (LOWORD(v83[1]) == 5)
          {
            if (!v83[2])
            {
              BBUFeedback::handleComment(v1[1], "Saving new training data");
              v5 = (*((uint64_t (**)(BBUFeedback **, _DWORD *, _QWORD))*v1 + 35))(v1, &v83[3], v83[0]);
              v29 = v1[1];
              if ((_DWORD)v5)
                BBUFeedback::handleComment(v29, "failed saving data");
              else
                BBUFeedback::handleComment(v29, "Saved data");
              return v5;
            }
            if (v83[2] == 1)
            {
              BBUFeedback::handleComment(v1[1], "Data accepted");
              BBUICE16UpdateSource::getMRCFilePath((uint64_t)__p);
              if (bbufs::chownToWireless((uint64_t *)__p, -1, v23, v24, v25, v26, v27, v28))
                v5 = 0;
              else
                v5 = 35;
              if (SHIBYTE(v71) < 0)
                operator delete(__p[0]);
              return v5;
            }
            BBUFeedback::handleComment(v1[1], "Error: Data Not accepted, also, BB didn't send new data");
            pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
            v30 = qword_253D31DC8;
            if (!qword_253D31DC8)
            {
              v31 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
              object = 0;
              ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v31, "BBUError", QOS_CLASS_UTILITY, &object);
              if (object)
                dispatch_release(object);
              v31->__on_zero_shared_weak = 0;
              v31[1].~__shared_weak_count = 0;
              v31[1].~__shared_weak_count_0 = 0;
              std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)__p, v31);
              v32 = *(_OWORD *)__p;
              __p[0] = 0;
              __p[1] = 0;
              v33 = (std::__shared_weak_count *)off_253D31DD0;
              *(_OWORD *)&qword_253D31DC8 = v32;
              if (v33)
              {
                p_shared_owners = (unint64_t *)&v33->__shared_owners_;
                do
                  v35 = __ldaxr(p_shared_owners);
                while (__stlxr(v35 - 1, p_shared_owners));
                if (!v35)
                {
                  ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                  std::__shared_weak_count::__release_weak(v33);
                }
              }
              v36 = (std::__shared_weak_count *)__p[1];
              if (__p[1])
              {
                v37 = (unint64_t *)((char *)__p[1] + 8);
                do
                  v38 = __ldaxr(v37);
                while (__stlxr(v38 - 1, v37));
                if (!v38)
                {
                  ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
                  std::__shared_weak_count::__release_weak(v36);
                }
              }
              v30 = qword_253D31DC8;
            }
            v39 = (std::__shared_weak_count *)off_253D31DD0;
            v66 = v30;
            v67 = off_253D31DD0;
            if (off_253D31DD0)
            {
              v40 = (unint64_t *)((char *)off_253D31DD0 + 8);
              do
                v41 = __ldxr(v40);
              while (__stxr(v41 + 1, v40));
            }
            pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
            v64 = operator new(0x38uLL);
            v65 = xmmword_212B55F70;
            strcpy((char *)v64, "Error: Data Not accepted, also, BB didn't send new data");
            __p[0] = (void *)MEMORY[0x24BDAC760];
            __p[1] = (void *)0x40000000;
            v71 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
            v72 = &__block_descriptor_tmp_6;
            v73 = v30;
            v74 = &v64;
            v75 = 12;
            v76 = __p;
            object = (dispatch_object_t)MEMORY[0x24BDAC760];
            v78 = 0x40000000;
            v79 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
            v80 = &__block_descriptor_tmp_10;
            v81 = v30;
            v82 = &v76;
            v42 = *(NSObject **)(v30 + 16);
            if (*(_QWORD *)(v30 + 24))
            {
              dispatch_async_and_wait(v42, &object);
              if ((SHIBYTE(v65) & 0x80000000) == 0)
                goto LABEL_47;
            }
            else
            {
              dispatch_sync(v42, &object);
              if ((SHIBYTE(v65) & 0x80000000) == 0)
              {
LABEL_47:
                if (v39)
                {
                  v43 = (unint64_t *)&v39->__shared_owners_;
                  do
                    v44 = __ldaxr(v43);
                  while (__stlxr(v44 - 1, v43));
                  if (!v44)
                  {
                    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                    std::__shared_weak_count::__release_weak(v39);
                  }
                }
                (*((void (**)(BBUFeedback **, _DWORD *, _QWORD))*v1 + 35))(v1, &v83[3], 0);
                return 12;
              }
            }
            operator delete(v64);
            goto LABEL_47;
          }
          if (gBBULogMaskGet(void)::once == -1)
          {
            if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
              goto LABEL_117;
          }
          else
          {
            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
            if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
            {
LABEL_117:
              if (gBBULogVerbosity >= 6)
                _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
            }
          }
          BBUFeedback::handleComment(v1[1], "MRC training RspId invalid");
          pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          v60 = qword_253D31DC8;
          if (!qword_253D31DC8)
          {
            BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
            std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
            std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
            v60 = qword_253D31DC8;
          }
          object = v60;
          v78 = (uint64_t)off_253D31DD0;
          if (off_253D31DD0)
          {
            v61 = (unint64_t *)((char *)off_253D31DD0 + 8);
            do
              v62 = __ldxr(v61);
            while (__stxr(v62 + 1, v61));
          }
          pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          std::string::basic_string[abi:ne180100]<0>(__p, "MRC training RspId invalid");
          BBUError::addError((uint64_t)v60, (uint64_t)__p, 12);
          if (SHIBYTE(v71) < 0)
            operator delete(__p[0]);
          std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
          return 12;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
            goto LABEL_104;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
          {
LABEL_104:
            if (gBBULogVerbosity >= 6)
              _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
          }
        }
        BBUFeedback::handleComment(v1[1], "Failed reading MRC training response");
        pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        v55 = qword_253D31DC8;
        if (!qword_253D31DC8)
        {
          BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
          std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
          std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
          v55 = qword_253D31DC8;
        }
        object = v55;
        v78 = (uint64_t)off_253D31DD0;
        if (off_253D31DD0)
        {
          v58 = (unint64_t *)((char *)off_253D31DD0 + 8);
          do
            v59 = __ldxr(v58);
          while (__stxr(v59 + 1, v58));
        }
        pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        std::string::basic_string[abi:ne180100]<0>(__p, "Failed reading MRC training response");
LABEL_112:
        BBUError::addError((uint64_t)v55, (uint64_t)__p, 3);
        if (SHIBYTE(v71) < 0)
          operator delete(__p[0]);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
        return 3;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
          goto LABEL_83;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
        {
LABEL_83:
          if (gBBULogVerbosity >= 6)
            _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
        }
      }
      BBUFeedback::handleComment(v1[1], "Failed formatting MRC training command");
      pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      v52 = qword_253D31DC8;
      if (!qword_253D31DC8)
      {
        BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
        std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
        v52 = qword_253D31DC8;
      }
      object = v52;
      v78 = (uint64_t)off_253D31DD0;
      if (off_253D31DD0)
      {
        v53 = (unint64_t *)((char *)off_253D31DD0 + 8);
        do
          v54 = __ldxr(v53);
        while (__stxr(v54 + 1, v53));
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      std::string::basic_string[abi:ne180100]<0>(__p, "Failed formatting MRC training command");
      BBUError::addError((uint64_t)v52, (uint64_t)__p, 19);
      if (SHIBYTE(v71) < 0)
        operator delete(__p[0]);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
      return 19;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
        goto LABEL_71;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
      {
LABEL_71:
        if (gBBULogVerbosity >= 6)
          _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v2, v3, v4, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
      }
    }
    BBUFeedback::handleComment(v1[1], "MRC data too large");
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v49 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
      std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
      v49 = qword_253D31DC8;
    }
    object = v49;
    v78 = (uint64_t)off_253D31DD0;
    if (off_253D31DD0)
    {
      v50 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    std::string::basic_string[abi:ne180100]<0>(__p, "MRC data too large");
    BBUError::addError((uint64_t)v49, (uint64_t)__p, 104);
    if (SHIBYTE(v71) < 0)
      operator delete(__p[0]);
    std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
    return 104;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
      goto LABEL_59;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 2) != 0)
    {
LABEL_59:
      if (gBBULogVerbosity >= 6)
        _BBULog(1, 6, "BBUProgrammer", "", "check failed: %s, %d, assertion: %s\n", v2, v3, v4, (char)"/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp");
    }
  }
  BBUFeedback::handleComment(v1[1], "Failed reading MRC data from file");
  pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  v46 = qword_253D31DC8;
  if (!qword_253D31DC8)
  {
    BBUError::create_default_global((std::__shared_weak_count_vtbl **)__p);
    std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)__p);
    std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)__p);
    v46 = qword_253D31DC8;
  }
  object = v46;
  v78 = (uint64_t)off_253D31DD0;
  if (off_253D31DD0)
  {
    v47 = (unint64_t *)((char *)off_253D31DD0 + 8);
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  std::string::basic_string[abi:ne180100]<0>(__p, "Failed reading MRC data from file");
  BBUError::addError((uint64_t)v46, (uint64_t)__p, v5);
  if (SHIBYTE(v71) < 0)
    operator delete(__p[0]);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
  return v5;
}

void sub_212B28B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,dispatch_object_t object)
{
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUICE18Programmer::program(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  pthread_mutex_t *v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count_vtbl *v19;
  __int128 v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count_vtbl *v35;
  __int128 v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  NSObject *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  std::__shared_weak_count_vtbl *v50;
  __int128 v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  NSObject *v61;
  unint64_t *v62;
  unint64_t v63;
  NSObject *v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t *v72;
  unint64_t v73;
  NSObject *v74;
  unint64_t *v75;
  unint64_t v76;
  _QWORD *v77;
  const void *v78;
  void *v79;
  BBUFeedback *v80;
  const char *v81;
  unint64_t *v82;
  unint64_t v83;
  NSObject *v84;
  unint64_t *v85;
  unint64_t v86;
  void *exception;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  void *__p;
  __int128 v93;
  uint64_t v94;
  void *v95;
  int v96;
  void *v97[2];
  void (*v98)(uint64_t);
  void *v99;
  uint64_t v100;
  void **p_p;
  int v102;
  void **v103;
  dispatch_object_t object;
  uint64_t v105;
  _QWORD *(*v106)(uint64_t);
  void *v107;
  uint64_t v108;
  void ***v109;

  v96 = -1431655766;
  v16 = (pthread_mutex_t *)(a1 + 120);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 120));
  *(_DWORD *)(a1 + 320) = a11;
  v17 = *(unsigned int *)(a1 + 184);
  if (BBUProgrammer::addItemsFromList(a1, (uint64_t)a6))
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Error: loading programmer items!");
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v18 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      v19 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
      object = 0;
      ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v19, "BBUError", QOS_CLASS_UTILITY, &object);
      if (object)
        dispatch_release(object);
      v19->__on_zero_shared_weak = 0;
      v19[1].~__shared_weak_count = 0;
      v19[1].~__shared_weak_count_0 = 0;
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)v97, v19);
      v20 = *(_OWORD *)v97;
      v97[0] = 0;
      v97[1] = 0;
      v21 = (std::__shared_weak_count *)off_253D31DD0;
      *(_OWORD *)&qword_253D31DC8 = v20;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      v24 = (std::__shared_weak_count *)v97[1];
      if (v97[1])
      {
        v25 = (unint64_t *)((char *)v97[1] + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v18 = qword_253D31DC8;
    }
    v27 = (std::__shared_weak_count *)off_253D31DD0;
    v94 = v18;
    v95 = off_253D31DD0;
    if (off_253D31DD0)
    {
      v28 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v29 = __ldxr(v28);
      while (__stxr(v29 + 1, v28));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    __p = operator new(0x28uLL);
    v93 = xmmword_212B52800;
    strcpy((char *)__p, "Error: loading programmer items!");
    v97[0] = (void *)MEMORY[0x24BDAC760];
    v97[1] = (void *)0x40000000;
    v98 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
    v99 = &__block_descriptor_tmp_6;
    v100 = v18;
    p_p = &__p;
    v102 = 66;
    v103 = v97;
    object = (dispatch_object_t)MEMORY[0x24BDAC760];
    v105 = 0x40000000;
    v106 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v107 = &__block_descriptor_tmp_10;
    v108 = v18;
    v109 = &v103;
    v30 = *(NSObject **)(v18 + 16);
    if (*(_QWORD *)(v18 + 24))
    {
      dispatch_async_and_wait(v30, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
        goto LABEL_22;
    }
    else
    {
      dispatch_sync(v30, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
      {
LABEL_22:
        if (v27)
        {
          v31 = (unint64_t *)&v27->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
        v33 = 66;
        goto LABEL_99;
      }
    }
    operator delete(__p);
    goto LABEL_22;
  }
  if (BBUICE16Programmer::addItemsToHashmap((BBUICE16Programmer *)a1))
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Error: Generating Hashmap of items!");
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v34 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      v35 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
      object = 0;
      ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v35, "BBUError", QOS_CLASS_UTILITY, &object);
      if (object)
        dispatch_release(object);
      v35->__on_zero_shared_weak = 0;
      v35[1].~__shared_weak_count = 0;
      v35[1].~__shared_weak_count_0 = 0;
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)v97, v35);
      v36 = *(_OWORD *)v97;
      v97[0] = 0;
      v97[1] = 0;
      v37 = (std::__shared_weak_count *)off_253D31DD0;
      *(_OWORD *)&qword_253D31DC8 = v36;
      if (v37)
      {
        v38 = (unint64_t *)&v37->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
      v40 = (std::__shared_weak_count *)v97[1];
      if (v97[1])
      {
        v41 = (unint64_t *)((char *)v97[1] + 8);
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      v34 = qword_253D31DC8;
    }
    v43 = (std::__shared_weak_count *)off_253D31DD0;
    v94 = v34;
    v95 = off_253D31DD0;
    if (off_253D31DD0)
    {
      v44 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v45 = __ldxr(v44);
      while (__stxr(v45 + 1, v44));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    __p = operator new(0x28uLL);
    v93 = xmmword_212B50720;
    strcpy((char *)__p, "Error: Generating Hashmap of items!");
    v97[0] = (void *)MEMORY[0x24BDAC760];
    v97[1] = (void *)0x40000000;
    v98 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
    v99 = &__block_descriptor_tmp_6;
    v100 = v34;
    p_p = &__p;
    v102 = 1;
    v103 = v97;
    object = (dispatch_object_t)MEMORY[0x24BDAC760];
    v105 = 0x40000000;
    v106 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v107 = &__block_descriptor_tmp_10;
    v108 = v34;
    v109 = &v103;
    v46 = *(NSObject **)(v34 + 16);
    if (*(_QWORD *)(v34 + 24))
    {
      dispatch_async_and_wait(v46, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
        goto LABEL_49;
    }
    else
    {
      dispatch_sync(v46, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
      {
LABEL_49:
        if (v43)
        {
          v47 = (unint64_t *)&v43->__shared_owners_;
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
            std::__shared_weak_count::__release_weak(v43);
          }
        }
        v33 = 1;
        goto LABEL_99;
      }
    }
    operator delete(__p);
    goto LABEL_49;
  }
  if (a11 == 2)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Booted for coredump, not programming firmware");
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v49 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      v50 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
      object = 0;
      ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v50, "BBUError", QOS_CLASS_UTILITY, &object);
      if (object)
        dispatch_release(object);
      v50->__on_zero_shared_weak = 0;
      v50[1].~__shared_weak_count = 0;
      v50[1].~__shared_weak_count_0 = 0;
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)v97, v50);
      v51 = *(_OWORD *)v97;
      v97[0] = 0;
      v97[1] = 0;
      v52 = (std::__shared_weak_count *)off_253D31DD0;
      *(_OWORD *)&qword_253D31DC8 = v51;
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
      v55 = (std::__shared_weak_count *)v97[1];
      if (v97[1])
      {
        v56 = (unint64_t *)((char *)v97[1] + 8);
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      v49 = qword_253D31DC8;
    }
    v58 = (std::__shared_weak_count *)off_253D31DD0;
    v94 = v49;
    v95 = off_253D31DD0;
    if (off_253D31DD0)
    {
      v59 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v60 = __ldxr(v59);
      while (__stxr(v60 + 1, v59));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    __p = operator new(0x30uLL);
    v93 = xmmword_212B55620;
    strcpy((char *)__p, "Booted for coredump, not programming firmware");
    v97[0] = (void *)MEMORY[0x24BDAC760];
    v97[1] = (void *)0x40000000;
    v98 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
    v99 = &__block_descriptor_tmp_6;
    v100 = v49;
    p_p = &__p;
    v102 = 28;
    v103 = v97;
    object = (dispatch_object_t)MEMORY[0x24BDAC760];
    v105 = 0x40000000;
    v106 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    v107 = &__block_descriptor_tmp_10;
    v108 = v49;
    v109 = &v103;
    v61 = *(NSObject **)(v49 + 16);
    if (*(_QWORD *)(v49 + 24))
    {
      dispatch_async_and_wait(v61, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
      {
LABEL_78:
        if (v58)
        {
          v62 = (unint64_t *)&v58->__shared_owners_;
          do
            v63 = __ldaxr(v62);
          while (__stlxr(v63 - 1, v62));
          if (!v63)
          {
            ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
            std::__shared_weak_count::__release_weak(v58);
          }
        }
        goto LABEL_83;
      }
    }
    else
    {
      dispatch_sync(v61, &object);
      if ((SHIBYTE(v93) & 0x80000000) == 0)
        goto LABEL_78;
    }
    operator delete(__p);
    goto LABEL_78;
  }
  if (a4)
  {
    v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 224))(a1, a2, v17, a5, 1, a10);
    goto LABEL_99;
  }
  v33 = BBUICE16Programmer::readPSIRunningMode(a1, &v96);
  if (!(_DWORD)v33)
  {
    v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
    if ((_DWORD)v33)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed training, failing program");
      pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      v64 = qword_253D31DC8;
      if (!qword_253D31DC8)
      {
        BBUError::create_default_global((std::__shared_weak_count_vtbl **)v97);
        std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)v97);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v97);
        v64 = qword_253D31DC8;
      }
      object = v64;
      v105 = (uint64_t)off_253D31DD0;
      if (off_253D31DD0)
      {
        v65 = (unint64_t *)((char *)off_253D31DD0 + 8);
        do
          v66 = __ldxr(v65);
        while (__stxr(v66 + 1, v65));
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      std::string::basic_string[abi:ne180100]<0>(v97, "Failed training, failing program");
LABEL_96:
      BBUError::addError((uint64_t)v64, (uint64_t)v97, v33);
      if (SHIBYTE(v98) < 0)
        operator delete(v97[0]);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
      goto LABEL_99;
    }
    switch(v96)
    {
      case 462:
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Running secure mode");
        v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)a1 + 176))(a1, a2, v17, 0, 0, a10);
        if ((_DWORD)v33)
        {
          BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed executing secure mode, failing program\n");
          pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          v64 = qword_253D31DC8;
          if (!qword_253D31DC8)
          {
            BBUError::create_default_global((std::__shared_weak_count_vtbl **)v97);
            std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)v97);
            std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v97);
            v64 = qword_253D31DC8;
          }
          object = v64;
          v105 = (uint64_t)off_253D31DD0;
          if (off_253D31DD0)
          {
            v72 = (unint64_t *)((char *)off_253D31DD0 + 8);
            do
              v73 = __ldxr(v72);
            while (__stxr(v73 + 1, v72));
          }
          pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
          std::string::basic_string[abi:ne180100]<0>(v97, "Failed executing secure mode, failing program\n");
          goto LABEL_96;
        }
        v96 = 56577;
        break;
      case 56577:
        break;
      case 52480:
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Coredump detected, not programming firmware");
LABEL_83:
        v33 = 28;
        goto LABEL_99;
      default:
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "PSI is not running enhanced mode, unsupported firmware\n");
        pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        v74 = qword_253D31DC8;
        if (!qword_253D31DC8)
        {
          BBUError::create_default_global((std::__shared_weak_count_vtbl **)v97);
          std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)v97);
          std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v97);
          v74 = qword_253D31DC8;
        }
        object = v74;
        v105 = (uint64_t)off_253D31DD0;
        if (off_253D31DD0)
        {
          v75 = (unint64_t *)((char *)off_253D31DD0 + 8);
          do
            v76 = __ldxr(v75);
          while (__stxr(v76 + 1, v75));
        }
        pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
        std::string::basic_string[abi:ne180100]<0>(v97, "PSI is not running enhanced mode, unsupported firmware\n");
        BBUError::addError((uint64_t)v74, (uint64_t)v97, 9);
        if (SHIBYTE(v98) < 0)
          operator delete(v97[0]);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
        v33 = 9;
        goto LABEL_99;
    }
    v77 = (_QWORD *)(a1 + 352);
    if (!std::__hash_table<std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BBUProgrammer::Item *>>>::find<std::string>((_QWORD *)(a1 + 192), a1 + 352))
    {
      v80 = *(BBUFeedback **)(a1 + 8);
      v81 = "EBL (%s) not found in item list!";
      if ((*(char *)(a1 + 375) & 0x80000000) == 0)
        goto LABEL_133;
      goto LABEL_132;
    }
    v97[0] = (void *)(a1 + 352);
    v78 = (const void *)std::__hash_table<std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BBUProgrammer::Item *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BBUProgrammer::Item *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1 + 192, a1 + 352, (uint64_t)&std::piecewise_construct, (__int128 **)v97)[5];
    if (!v78
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 66, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp", 0x216u, (ctu::LogMessageBuffer *)"Assertion failure(eblItem && \"Error: loading EBL item!\")", v88, v89, v90, v91);
    }
    if (*((_DWORD *)v79 + 6))
    {
      v80 = *(BBUFeedback **)(a1 + 8);
      v81 = "EBL (%s) exists, but is of invalid type!";
      if ((*(char *)(a1 + 375) & 0x80000000) == 0)
      {
LABEL_133:
        BBUFeedback::handleComment(v80, v81, v77);
        v33 = 15;
        goto LABEL_99;
      }
LABEL_132:
      v77 = (_QWORD *)*v77;
      goto LABEL_133;
    }
    v33 = BBUICE16Programmer::sendEBL(a1, *((_QWORD *)v79 + 2));
    if ((_DWORD)v33)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed sending EBL!");
      pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      v64 = qword_253D31DC8;
      if (!qword_253D31DC8)
      {
        BBUError::create_default_global((std::__shared_weak_count_vtbl **)v97);
        std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)v97);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v97);
        v64 = qword_253D31DC8;
      }
      object = v64;
      v105 = (uint64_t)off_253D31DD0;
      if (off_253D31DD0)
      {
        v82 = (unint64_t *)((char *)off_253D31DD0 + 8);
        do
          v83 = __ldxr(v82);
        while (__stxr(v83 + 1, v82));
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      std::string::basic_string[abi:ne180100]<0>(v97, "Failed sending EBL!");
      goto LABEL_96;
    }
    pthread_mutex_unlock(v16);
    v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 144))(a1);
    if ((_DWORD)v33)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed image download!");
      pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      v84 = qword_253D31DC8;
      if (!qword_253D31DC8)
      {
        BBUError::create_default_global((std::__shared_weak_count_vtbl **)v97);
        std::shared_ptr<BBUError>::operator=[abi:ne180100]((uint64_t)&qword_253D31DC8, (__int128 *)v97);
        std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)v97);
        v84 = qword_253D31DC8;
      }
      object = v84;
      v105 = (uint64_t)off_253D31DD0;
      if (off_253D31DD0)
      {
        v85 = (unint64_t *)((char *)off_253D31DD0 + 8);
        do
          v86 = __ldxr(v85);
        while (__stxr(v86 + 1, v85));
      }
      pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
      std::string::basic_string[abi:ne180100]<0>(v97, "Failed image download!");
      BBUError::addError((uint64_t)v84, (uint64_t)v97, v33);
      if (SHIBYTE(v98) < 0)
        operator delete(v97[0]);
      std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&object);
    }
    pthread_mutex_lock(v16);
  }
LABEL_99:
  if (a6)
  {
    if (a6[2])
    {
      v68 = *a6;
      v67 = (uint64_t *)a6[1];
      v69 = *v67;
      *(_QWORD *)(v69 + 8) = *(_QWORD *)(*a6 + 8);
      **(_QWORD **)(v68 + 8) = v69;
      a6[2] = 0;
      if (v67 != a6)
      {
        do
        {
          v70 = (uint64_t *)v67[1];
          operator delete(v67);
          v67 = v70;
        }
        while (v70 != a6);
      }
    }
    operator delete(a6);
  }
  pthread_mutex_unlock(v16);
  return v33;
}

void sub_212B29934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,dispatch_object_t object)
{
  pthread_mutex_t *v25;

  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  pthread_mutex_unlock(v25);
  _Unwind_Resume(a1);
}

uint64_t BBUICE18Programmer::finishSecurePSIMode(BBUFeedback **a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, _BYTE *a6)
{
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  char *v15;
  BOOL v16;
  unsigned int v17;
  _WORD *v18;
  int v19;
  int v20;
  BBUFeedback *v21;
  void **v22;
  void *exception;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE *v29;
  void *__p[2];
  char v31;
  unsigned __int8 *md;
  unsigned __int8 *v33;
  char *v34;
  unsigned int v35;

  v35 = 0;
  if (a5)
    BBUFeedback::handleComment(a1[1], "Resuming Secure Mode");
  if (a2)
  {
    v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
    if (v11 > a3)
    {
      BBUFeedback::handleComment(a1[1], "root manifest size larger than protocol specification %u, size = %u bytes", a3, v11);
      return 12;
    }
  }
  else
  {
    v11 = a3;
  }
  v13 = v11;
  if (v11)
  {
    v14 = operator new(v11);
    bzero(v14, v13);
  }
  else
  {
    v14 = 0;
  }
  v15 = (char *)operator new(0x30uLL);
  v33 = (unsigned __int8 *)(v15 + 48);
  v34 = v15 + 48;
  *(_OWORD *)v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  *((_OWORD *)v15 + 2) = 0u;
  md = (unsigned __int8 *)v15;
  if (!a2)
  {
    BBUFeedback::handleComment(a1[1], "No root manifest present");
    bzero(v14, v13);
    v17 = v13 + 1024;
    v29 = a6;
    if ((_DWORD)v13 != -1024)
    {
      v12 = 3;
      v16 = 1;
      goto LABEL_18;
    }
LABEL_22:
    v18 = 0;
    v19 = -1022;
    goto LABEL_23;
  }
  LODWORD(__p[0]) = 0;
  v12 = (*(uint64_t (**)(uint64_t, void *, size_t, void **, _QWORD))(*(_QWORD *)a2 + 16))(a2, v14, v13, __p, 0);
  v16 = (_DWORD)v12 == 0;
  if ((_DWORD)v12)
    BBUFeedback::handleComment(a1[1], "failed copying root manifest to buffer");
  if (LODWORD(__p[0]) != (_DWORD)v13)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/ICE/BBUICE18Programmer.cpp", 0x263u, (ctu::LogMessageBuffer *)"Assertion failure(copied == rootManifestSize && \"failed copying root manifest to buffer\")", v25, v26, v27, v28);
  }
  v17 = v13 + 1024;
  if ((_DWORD)v13 != -1024)
  {
    v29 = a6;
LABEL_18:
    v18 = operator new(v17);
    bzero(v18, v17);
    if (!v16)
      goto LABEL_35;
    v19 = v13 + 2;
LABEL_23:
    *v18 = v13;
    memcpy(v18 + 1, v14, v13);
    CC_SHA384(v14, v13, md);
    BBUFeedback::handleComment(a1[1], "packetSize = %u; kBufferSize = %u; rootManifestSize = %u", v19, v17, v13);
    v20 = KTLRawSendData();
    v21 = a1[1];
    if (v20)
    {
      ctu::hex();
      if (v31 >= 0)
        v22 = __p;
      else
        v22 = (void **)__p[0];
      BBUFeedback::handleComment(v21, "Sent Manifest with length %u Hash %s", v13, (const char *)v22);
      if (v31 < 0)
        operator delete(__p[0]);
      if ((KTLRawReceiveData() & 1) != 0)
      {
        v12 = (*((uint64_t (**)(BBUFeedback **, _WORD *, _QWORD, uint64_t, uint64_t))*a1 + 36))(a1, v18, v35, a2, a4);
        if ((_DWORD)v12)
        {
          BBUFeedback::handleComment(a1[1], "failed handling hash response");
        }
        else
        {
          *v29 = 1;
          LOWORD(__p[0]) = 3777;
          if ((KTLRawSendData() & 1) != 0)
          {
            BBUFeedback::handleComment(a1[1], "finished secure mode");
            v12 = 0;
          }
          else
          {
            BBUFeedback::handleComment(a1[1], "failed sending mode end packet");
            v12 = 11;
          }
        }
        goto LABEL_35;
      }
      BBUFeedback::handleComment(a1[1], "failed reading hash results");
    }
    else
    {
      BBUFeedback::handleComment(v21, "failed sending root manifest data");
    }
    v12 = 3;
LABEL_35:
    operator delete(v18);
    goto LABEL_36;
  }
  if (!(_DWORD)v12)
  {
    v29 = a6;
    v17 = 0;
    goto LABEL_22;
  }
LABEL_36:
  if (md)
  {
    v33 = md;
    operator delete(md);
  }
  if (v14)
    operator delete(v14);
  return v12;
}

void sub_212B29E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21)
{
  void *v21;
  void *v22;

  operator delete(v22);
  if (__p)
  {
    operator delete(__p);
    if (!v21)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_3;
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t BBUICE18Programmer::handleMRCTrainingSequence(BBUFeedback **this)
{
  uint64_t result;
  int v3;
  const char *v4;
  uint64_t v5;

  result = MEMORY[0x212BF9644]();
  if ((_DWORD)result)
  {
    v3 = (*((uint64_t (**)(BBUFeedback **))*this + 32))(this);
    if (v3)
      v4 = "MRC data exists - fastbooting with existing data";
    else
      v4 = "MRC data doesn't exist or is invalid size - training fresh data";
    if (v3)
      v5 = 248;
    else
      v5 = 264;
    BBUFeedback::handleComment(this[1], v4);
    return (*(uint64_t (**)(BBUFeedback **))((char *)*this + v5))(this);
  }
  return result;
}

uint64_t BBUICE18Programmer::gatherPersonalizationParameters(BBUICE18Programmer *this, BOOL a2, char a3, unsigned int *a4, BBUPersonalizationParameters *a5)
{
  BBUFeedback *v6;
  int v8;
  BBUFeedback *v9;
  const char *v10;
  uint64_t v11;
  const UInt8 *v12;
  _QWORD *v13;
  const __CFAllocator *v14;
  _QWORD *v15;
  _QWORD *v16;
  const UInt8 *v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  BBUFeedback *v22;
  void **v23;
  int v24;
  int v25;
  int v26;
  const char *v27;
  BBUFeedback *v28;
  void **v29;
  BBUFeedback *v30;
  void **v31;
  BBUFeedback *v32;
  int v33;
  void *__p[2];
  char v36;
  void *v37;
  int v38;

  v38 = 0;
  v37 = 0;
  v6 = (BBUFeedback *)*((_QWORD *)this + 1);
  if ((a3 & 1) == 0)
  {
    BBUFeedback::handleComment(v6, "Not in restore mode - skipping gathering Personalization parameters...");
    return 0;
  }
  BBUFeedback::handleBeginPhase(v6, "Gathering Personalization parameters...");
  if (!BBUICE16Programmer::readPSIRunningMode((uint64_t)this, &v38))
  {
    v8 = v38;
    if (v38 != 462)
    {
      v9 = (BBUFeedback *)*((_QWORD *)this + 1);
      v10 = (const char *)PSIModeDescription();
      BBUFeedback::handleComment(v9, "Unexpected running mode 0x%x (%s), cannot gather personalization params\n", v8, v10);
    }
  }
  v11 = (*(uint64_t (**)(BBUICE18Programmer *))(*(_QWORD *)this + 296))(this);
  if (!(_DWORD)v11)
  {
    v11 = (*(uint64_t (**)(BBUICE18Programmer *, void **))(*(_QWORD *)this + 232))(this, &v37);
    if (!(_DWORD)v11)
    {
      v12 = (const UInt8 *)v37 + 20;
      v13 = operator new(0x10uLL);
      *v13 = off_24CE863A8;
      v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v13[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, 20);
      v15 = BBUICEPersonalizationParameters::ICEChipID::createFromChipID((BBUICEPersonalizationParameters::ICEChipID *)*((unsigned __int16 *)v37 + 1));
      v16 = BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber((const UInt8 *)v37 + 8, (const unsigned __int8 *)0x60);
      v17 = (const UInt8 *)v37 + 40;
      v18 = operator new(0x10uLL);
      *v18 = off_24CE864C8;
      v18[1] = CFDataCreate(v14, v17, 32);
      v19 = *((_DWORD *)v37 + 1);
      *((_DWORD *)this + 46) = v19 - 2;
      BBUFeedback::handleComment(*((BBUFeedback **)this + 1), "Max root packet size from PSI: %u", v19);
      free(v37);
      v20 = *((_QWORD *)a5 + 1);
      if (v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
      *((_QWORD *)a5 + 1) = v13;
      v21 = *((_QWORD *)a5 + 2);
      if (v21)
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      *((_QWORD *)a5 + 2) = v15;
      (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a5 + 16))(a5, v16);
      (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a5 + 24))(a5, v18);
      if (!v16)
        goto LABEL_22;
      v22 = (BBUFeedback *)*((_QWORD *)this + 1);
      (*(void (**)(void **__return_ptr, _QWORD *))(*v16 + 24))(__p, v16);
      if (v36 >= 0)
        v23 = __p;
      else
        v23 = (void **)__p[0];
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
      {
        if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
          goto LABEL_17;
      }
      else
      {
        dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
        if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
          goto LABEL_17;
      }
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_17:
      v24 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
      v25 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
      v26 = (*(uint64_t (**)(_QWORD *))(*v15 + 24))(v15);
      if (v24 | v25)
        v27 = (const char *)v23;
      else
        v27 = "<< SNUM >>";
      BBUFeedback::handleComment(v22, "   SNUM: 0x%s / CHIPID: 0x%08x", v27, v26);
      if (v36 < 0)
        operator delete(__p[0]);
LABEL_22:
      v28 = (BBUFeedback *)*((_QWORD *)this + 1);
      (*(void (**)(void **__return_ptr, _QWORD *))(*v13 + 24))(__p, v13);
      if (v36 >= 0)
        v29 = __p;
      else
        v29 = (void **)__p[0];
      BBUFeedback::handleComment(v28, "   NONCE: %s", (const char *)v29);
      if (v36 < 0)
        operator delete(__p[0]);
      v30 = (BBUFeedback *)*((_QWORD *)this + 1);
      (*(void (**)(void **__return_ptr, _QWORD *))(*v18 + 24))(__p, v18);
      if (v36 >= 0)
        v31 = __p;
      else
        v31 = (void **)__p[0];
      BBUFeedback::handleComment(v30, "   PUBLIC_KEY_HASH: %s", (const char *)v31);
      if (v36 < 0)
        operator delete(__p[0]);
      v32 = (BBUFeedback *)*((_QWORD *)this + 1);
      v33 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)a5 + 3) + 24))(*((_QWORD *)a5 + 3));
      BBUFeedback::handleComment(v32, "   CertID: %u", v33);
      v11 = 0;
    }
  }
  (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), v11);
  return v11;
}

void sub_212B2A36C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t __cxx_global_var_init_25()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUError>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance, &dword_212A4D000);
  }
  return result;
}

unint64_t *fopen_mem_func(uint64_t a1, const char *a2, char a3)
{
  unint64_t *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v9;

  v5 = (unint64_t *)malloc(0x20uLL);
  v6 = v5;
  if (!v5)
    return v6;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  if (sscanf(a2, "%lx+%lx", &v9, v5 + 1) != 2)
    return 0;
  *v6 = v9;
  if ((a3 & 8) != 0)
    v7 = 0;
  else
    v7 = v6[1];
  v6[2] = v7;
  v6[3] = 0;
  return v6;
}

size_t fread_mem_func(int a1, _QWORD *a2, void *__dst, size_t a4)
{
  uint64_t v5;
  size_t v6;

  v5 = a2[3];
  if (a2[1] - v5 >= a4)
    v6 = a4;
  else
    v6 = a2[1] - v5;
  memcpy(__dst, (const void *)(*a2 + v5), v6);
  a2[3] += v6;
  return v6;
}

size_t fwrite_mem_func(int a1, _QWORD *a2, void *__src, size_t a4)
{
  uint64_t v5;
  size_t v6;
  size_t v7;
  size_t v8;

  v5 = a2[3];
  if (a2[1] - v5 >= a4)
    v6 = a4;
  else
    v6 = a2[1] - v5;
  memcpy((void *)(*a2 + v5), __src, v6);
  v7 = a2[2];
  v8 = a2[3] + v6;
  a2[3] = v8;
  if (v8 > v7)
    a2[2] = v8;
  return v6;
}

uint64_t ftell_mem_func(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t fseek_mem_func(uint64_t a1, _QWORD *a2, unint64_t a3, int a4)
{
  unint64_t v4;
  _QWORD *v6;
  uint64_t result;
  unint64_t v8;

  v4 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      v6 = a2 + 2;
    }
    else
    {
      if (a4 != 1)
        return -1;
      v6 = a2 + 3;
    }
    v4 = *v6 + a3;
  }
  if (v4 > a2[1])
    return 1;
  v8 = a2[2];
  if (v4 > v8)
    bzero((void *)(*a2 + v8), v4 - v8);
  result = 0;
  a2[3] = v4;
  return result;
}

uint64_t fclose_mem_func(int a1, void *a2)
{
  free(a2);
  return 0;
}

uint64_t ferror_mem_func()
{
  return 0;
}

uint64_t _BBULogv(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, va_list a6)
{
  pthread_mutex_t *v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::ios_base *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  const std::ios_base *v23;
  const std::locale::facet *v24;
  std::ios_base::fmtflags v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  size_t v30;
  _QWORD *v31;
  _QWORD *v32;
  size_t v33;
  _QWORD *v34;
  _QWORD *v35;
  size_t v36;
  size_t v37;
  std::locale::__imp *v38;
  uint64_t v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  void *locale;
  std::locale::__imp *locale_high;
  void *v45;
  FILE *Stream;
  const char *v47;
  FILE **v48;
  const char *v49;
  pthread_mutex_t *v51;
  std::locale __dst[3];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *__p[2];
  __int128 v59;
  unint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  timeval v71;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_15_0);
  v11 = (pthread_mutex_t *)qword_253D37B28;
  pthread_mutex_lock((pthread_mutex_t *)qword_253D37B28);
  if (qword_253D37B38 == -1)
  {
    v12 = 0x254B5F000uLL;
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&qword_253D37B38, &__block_literal_global_18);
    v12 = 0x254B5F000;
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_6;
  }
  if (((*(_QWORD *)(v12 + 3232) >> a1) & 1) == 0)
    return pthread_mutex_unlock(v11);
LABEL_6:
  v51 = v11;
  vsnprintf(byte_253D37B50, 0x400uLL, a5, a6);
  v71.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v71.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v71, 0);
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v60 = 0xAAAAAAAAAAAAAAAALL;
  v70 = v13;
  v69 = v13;
  v68 = v13;
  v67 = v13;
  v66 = v13;
  v65 = v13;
  v64 = v13;
  v63 = v13;
  v62 = v13;
  v59 = v13;
  *(_OWORD *)__p = v13;
  v57 = v13;
  v56 = v13;
  v55 = v13;
  v54 = v13;
  v14 = MEMORY[0x24BEDB870];
  v15 = MEMORY[0x24BEDB870] + 64;
  v61 = MEMORY[0x24BEDB870] + 64;
  v16 = (uint64_t *)MEMORY[0x24BEDB800];
  v17 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v53 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v53 + *(_QWORD *)(v53 - 24)) = v17;
  v18 = (std::ios_base *)((char *)&v53 + *(_QWORD *)(v53 - 24));
  std::ios_base::init(v18, &v54);
  v18[1].__vftable = 0;
  v18[1].__fmtflags_ = -1;
  v53 = v14 + 24;
  v61 = v15;
  std::streambuf::basic_streambuf();
  v19 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v54 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v59 = 0u;
  LODWORD(v60) = 16;
  v20 = (_QWORD *)std::ostream::operator<<();
  LOBYTE(__dst[0].__locale_) = 46;
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)__dst, 1);
  v22 = *v21;
  *(uint64_t *)((char *)v21 + *(_QWORD *)(*v21 - 24) + 24) = 3;
  v23 = (const std::ios_base *)((char *)v21 + *(_QWORD *)(v22 - 24));
  if (v23[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v23);
    v24 = std::locale::use_facet(__dst, MEMORY[0x24BEDB350]);
    v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 32);
    std::locale::~locale(__dst);
    v23[1].__fmtflags_ = v25;
  }
  v23[1].__fmtflags_ = 48;
  v26 = (_QWORD *)std::ostream::operator<<();
  *(_QWORD *)((char *)v26 + *(_QWORD *)(*v26 - 24) + 24) = 1;
  LOBYTE(__dst[0].__locale_) = 91;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)__dst, 1);
  v27 = (_QWORD *)std::ostream::operator<<();
  LOBYTE(__dst[0].__locale_) = 46;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)__dst, 1);
  v28 = (_QWORD *)std::ostream::operator<<();
  LOBYTE(__dst[0].__locale_) = 93;
  v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)__dst, 1);
  v30 = strlen(a3);
  v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)a3, v30);
  v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"::", 2);
  v33 = strlen(a4);
  v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)a4, v33);
  v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)": ", 2);
  v36 = strlen(byte_253D37B50);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)byte_253D37B50, v36);
  memset(__dst, 170, sizeof(__dst));
  if ((v60 & 0x10) != 0)
  {
    v39 = *((_QWORD *)&v59 + 1);
    if (*((_QWORD *)&v59 + 1) < (unint64_t)v57)
    {
      *((_QWORD *)&v59 + 1) = v57;
      v39 = v57;
    }
    v40 = (const void *)*((_QWORD *)&v56 + 1);
    v37 = v39 - *((_QWORD *)&v56 + 1);
    if ((unint64_t)(v39 - *((_QWORD *)&v56 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_37;
  }
  else
  {
    if ((v60 & 8) == 0)
    {
      v37 = 0;
      HIBYTE(__dst[2].__locale_) = 0;
      v38 = (std::locale::__imp *)__dst;
      goto LABEL_21;
    }
    v40 = (const void *)v55;
    v37 = v56 - v55;
    if ((_QWORD)v56 - (_QWORD)v55 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_37:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v37 >= 0x17)
  {
    v41 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v37 | 7) != 0x17)
      v41 = v37 | 7;
    v42 = v41 + 1;
    v38 = (std::locale::__imp *)operator new(v41 + 1);
    __dst[1].__locale_ = (std::locale::__imp *)v37;
    __dst[2].__locale_ = (std::locale::__imp *)(v42 | 0x8000000000000000);
    __dst[0].__locale_ = v38;
    goto LABEL_20;
  }
  HIBYTE(__dst[2].__locale_) = v37;
  v38 = (std::locale::__imp *)__dst;
  if (v37)
LABEL_20:
    memmove(v38, v40, v37);
LABEL_21:
  *((_BYTE *)v38 + v37) = 0;
  if (qword_253D37B38 == -1)
  {
    if (*(_QWORD *)qword_253D37B30)
    {
LABEL_23:
      if (SHIBYTE(__dst[2].__locale_) >= 0)
        locale = __dst;
      else
        locale = __dst[0].__locale_;
      if (SHIBYTE(__dst[2].__locale_) >= 0)
        locale_high = (std::locale::__imp *)HIBYTE(__dst[2].__locale_);
      else
        locale_high = __dst[1].__locale_;
      (*(void (**)(_QWORD, void *, std::locale::__imp *))(**(_QWORD **)qword_253D37B30 + 24))(*(_QWORD *)qword_253D37B30, locale, locale_high);
    }
  }
  else
  {
    dispatch_once(&qword_253D37B38, &__block_literal_global_18);
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_23;
  }
  if ((((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    if (gBBULogSinkFunc)
    {
      if (SHIBYTE(__dst[2].__locale_) >= 0)
        v45 = __dst;
      else
        v45 = __dst[0].__locale_;
      gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v45);
    }
    else
    {
      Stream = (FILE *)_BBULogGetStream(a1);
      if (SHIBYTE(__dst[2].__locale_) >= 0)
        v47 = (const char *)__dst;
      else
        v47 = (const char *)__dst[0].__locale_;
      fputs(v47, Stream);
      fflush(Stream);
      v48 = (FILE **)MEMORY[0x24BDAC8E8];
      if (Stream != (FILE *)*MEMORY[0x24BDAC8E8])
      {
        if (SHIBYTE(__dst[2].__locale_) >= 0)
          v49 = (const char *)__dst;
        else
          v49 = (const char *)__dst[0].__locale_;
        fputs(v49, (FILE *)*MEMORY[0x24BDAC8E8]);
        fflush(*v48);
      }
    }
  }
  if (SHIBYTE(__dst[2].__locale_) < 0)
    operator delete(__dst[0].__locale_);
  v53 = *v16;
  *(uint64_t *)((char *)&v53 + *(_QWORD *)(v53 - 24)) = v16[3];
  *(_QWORD *)&v54 = v19 + 16;
  if (SBYTE7(v59) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](&v61);
  v11 = v51;
  return pthread_mutex_unlock(v11);
}

void sub_212B2ABF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, pthread_mutex_t *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a18);
  pthread_mutex_unlock(a11);
  _Unwind_Resume(a1);
}

uint64_t _BBULogGetStream(int a1)
{
  uint64_t *v1;
  uint64_t v2;

  switch(a1)
  {
    case 0:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 24);
      break;
    case 1:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 32);
      break;
    case 5:
    case 6:
    case 7:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 40);
      break;
    case 9:
    case 13:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 48);
      break;
    case 14:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 56);
      break;
    case 17:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 16);
      break;
    default:
      if (qword_253D37B48 != -1)
        dispatch_once(&qword_253D37B48, &__block_literal_global_20_0);
      v1 = (uint64_t *)(qword_253D37B40 + 8);
      break;
  }
  v2 = *v1;
  if (v2)
    return v2;
  else
    return *MEMORY[0x24BDAC8E8];
}

uint64_t _BBULog(int a1, uint64_t a2, const char *a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _BBULogv(a1, a2, a3, a4, a5, &a9);
}

uint64_t _BBULogPlain(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  pthread_mutex_t *v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::ios_base *v18;
  uint64_t v19;
  size_t v20;
  size_t v21;
  void **v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  void *v29;
  void **v30;
  FILE *Stream;
  const char *v32;
  FILE **v33;
  const char *v34;
  pthread_mutex_t *v36;
  void *__dst[3];
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *__p[2];
  __int128 v44;
  unint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char *v56;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_15_0);
  v11 = (pthread_mutex_t *)qword_253D37B28;
  pthread_mutex_lock((pthread_mutex_t *)qword_253D37B28);
  if (qword_253D37B38 == -1)
  {
    v12 = 0x254B5F000uLL;
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_6;
  }
  else
  {
    dispatch_once(&qword_253D37B38, &__block_literal_global_18);
    v12 = 0x254B5F000;
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_6;
  }
  if (((*(_QWORD *)(v12 + 3232) >> a1) & 1) == 0)
    return pthread_mutex_unlock(v11);
LABEL_6:
  v56 = &a9;
  vsnprintf(byte_253D37B50, 0x400uLL, a2, &a9);
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  v55 = v13;
  v54 = v13;
  v53 = v13;
  v52 = v13;
  v51 = v13;
  v50 = v13;
  v49 = v13;
  v48 = v13;
  v47 = v13;
  *(_OWORD *)__p = v13;
  v44 = v13;
  v41 = v13;
  v42 = v13;
  v39 = v13;
  v40 = v13;
  v14 = MEMORY[0x24BEDB870];
  v15 = MEMORY[0x24BEDB870] + 64;
  v46 = MEMORY[0x24BEDB870] + 64;
  v16 = (uint64_t *)MEMORY[0x24BEDB800];
  v17 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v38 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v38 + *(_QWORD *)(v38 - 24)) = v17;
  v18 = (std::ios_base *)((char *)&v38 + *(_QWORD *)(v38 - 24));
  std::ios_base::init(v18, &v39);
  v18[1].__vftable = 0;
  v18[1].__fmtflags_ = -1;
  v38 = v14 + 24;
  v46 = v15;
  std::streambuf::basic_streambuf();
  v19 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v39 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v44 = 0u;
  LODWORD(v45) = 16;
  if (a1 == 1)
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v38, (uint64_t)"!!! ", 4);
  v20 = strlen(byte_253D37B50);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v38, (uint64_t)byte_253D37B50, v20);
  memset(__dst, 170, sizeof(__dst));
  if ((v45 & 0x10) != 0)
  {
    v23 = *((_QWORD *)&v44 + 1);
    if (*((_QWORD *)&v44 + 1) < (unint64_t)v42)
    {
      *((_QWORD *)&v44 + 1) = v42;
      v23 = v42;
    }
    v24 = (const void *)*((_QWORD *)&v41 + 1);
    v21 = v23 - *((_QWORD *)&v41 + 1);
    if ((unint64_t)(v23 - *((_QWORD *)&v41 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_37;
  }
  else
  {
    if ((v45 & 8) == 0)
    {
      v21 = 0;
      HIBYTE(__dst[2]) = 0;
      v22 = __dst;
      goto LABEL_21;
    }
    v24 = (const void *)v40;
    v21 = v41 - v40;
    if ((_QWORD)v41 - (_QWORD)v40 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_37:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v21 >= 0x17)
  {
    v36 = v11;
    v25 = v19;
    v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v26 = v21 | 7;
    v27 = v26 + 1;
    v22 = (void **)operator new(v26 + 1);
    __dst[1] = (void *)v21;
    __dst[2] = (void *)(v27 | 0x8000000000000000);
    __dst[0] = v22;
    v19 = v25;
    v11 = v36;
    goto LABEL_20;
  }
  HIBYTE(__dst[2]) = v21;
  v22 = __dst;
  if (v21)
LABEL_20:
    memmove(v22, v24, v21);
LABEL_21:
  *((_BYTE *)v22 + v21) = 0;
  if (qword_253D37B38 == -1)
  {
    if (*(_QWORD *)qword_253D37B30)
    {
LABEL_23:
      if (SHIBYTE(__dst[2]) >= 0)
        v28 = __dst;
      else
        v28 = (void **)__dst[0];
      if (SHIBYTE(__dst[2]) >= 0)
        v29 = (void *)HIBYTE(__dst[2]);
      else
        v29 = __dst[1];
      (*(void (**)(_QWORD, void **, void *))(**(_QWORD **)qword_253D37B30 + 24))(*(_QWORD *)qword_253D37B30, v28, v29);
    }
  }
  else
  {
    dispatch_once(&qword_253D37B38, &__block_literal_global_18);
    if (*(_QWORD *)qword_253D37B30)
      goto LABEL_23;
  }
  if ((((unint64_t)sLogInternalMask >> a1) & 1) != 0)
  {
    if (gBBULogSinkFunc)
    {
      if (SHIBYTE(__dst[2]) >= 0)
        v30 = __dst;
      else
        v30 = (void **)__dst[0];
      gBBULogSinkFunc(gBBULogSinkContext, (1 << a1), v30);
    }
    else
    {
      Stream = (FILE *)_BBULogGetStream(a1);
      if (SHIBYTE(__dst[2]) >= 0)
        v32 = (const char *)__dst;
      else
        v32 = (const char *)__dst[0];
      fputs(v32, Stream);
      fflush(Stream);
      v33 = (FILE **)MEMORY[0x24BDAC8E8];
      if (Stream != (FILE *)*MEMORY[0x24BDAC8E8])
      {
        if (SHIBYTE(__dst[2]) >= 0)
          v34 = (const char *)__dst;
        else
          v34 = (const char *)__dst[0];
        fputs(v34, (FILE *)*MEMORY[0x24BDAC8E8]);
        fflush(*v33);
      }
    }
  }
  if (SHIBYTE(__dst[2]) < 0)
    operator delete(__dst[0]);
  v38 = *v16;
  *(uint64_t *)((char *)&v38 + *(_QWORD *)(v38 - 24)) = v16[3];
  *(_QWORD *)&v39 = v19 + 16;
  if (SBYTE7(v44) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](&v46);
  return pthread_mutex_unlock(v11);
}

void sub_212B2B320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, pthread_mutex_t *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  pthread_mutex_t *v17;

  if (a16 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a17);
  pthread_mutex_unlock(v17);
  _Unwind_Resume(a1);
}

uint64_t _BBULogBinary(uint64_t result, uint64_t a2, const char *a3, const char *a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  int8x16_t v25;
  int8x16_t v26;
  uint8x16_t v27;
  int8x16_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  char v31;
  int v32;
  char v33;
  BOOL v34;
  unint64_t v35;
  unsigned int v37;
  uint64_t v38;
  char v39;
  int v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[32];
  __int128 v46;
  uint64_t v47;

  v39 = a7;
  v42 = result;
  v47 = *MEMORY[0x24BDAC8D0];
  if (a6)
  {
    v8 = a6;
    v9 = a3;
    v10 = a2;
    v11 = 0;
    v34 = (int)a2 >= 0 && a6 > 0x3E80;
    v12 = 112;
    if (v34)
    {
      v13 = a6 - 224;
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
      v13 = 0;
    }
    v38 = v12;
    v35 = v12 + v13;
    v37 = a2;
    while (1)
    {
      if (v11 == v38)
      {
        _BBULog(v42, v10, v9, a4, " -- middle of buffer snipped -- \n", a6, a7, a8, v33);
        v11 = v35;
      }
      v16 = v8;
      v17 = v8 - v11;
      *(_OWORD *)&v45[16] = 0u;
      v46 = 0u;
      if (v17 >= 0x10)
        v18 = 16;
      else
        v18 = v17;
      v44 = 0uLL;
      *(_OWORD *)v45 = 0uLL;
      v43 = 0uLL;
      if (v18)
      {
        v19 = 0;
        v20 = (unsigned __int8 *)(a5 + v11);
        do
        {
          v21 = *v20++;
          v22 = (char *)&v43 + v19;
          *v22 = str_23_5[(unint64_t)v21 >> 4];
          v22[1] = str_23_5[v21 & 0xF];
          v19 += 3;
          v22[2] = 32;
        }
        while (3 * v18 != v19);
        memset((char *)&v43 + v19, 32, 3 * (17 - v18));
        if (v17 < 0x10)
        {
          v23 = 0;
          v15 = (54 - 3 * v18) + v19 - 3;
          v9 = a3;
          v10 = v37;
          v8 = v16;
LABEL_19:
          v29 = v18 - v23;
          v30 = (unsigned __int8 *)(a5 + v23 + v11);
          do
          {
            v32 = *v30++;
            v31 = v32;
            if ((v32 - 32) >= 0x5F)
              v31 = 46;
            *((_BYTE *)&v43 + v15++) = v31;
            --v29;
          }
          while (v29);
          goto LABEL_7;
        }
        v23 = v18 & 0x10;
        v24 = (54 - 3 * v18);
        v15 = v23 + v19 + v24 - 3;
        v25 = *(int8x16_t *)(a5 + v11);
        v26.i64[0] = 0xE0E0E0E0E0E0E0E0;
        v26.i64[1] = 0xE0E0E0E0E0E0E0E0;
        v27.i64[0] = 0x5F5F5F5F5F5F5F5FLL;
        v27.i64[1] = 0x5F5F5F5F5F5F5F5FLL;
        v28 = (int8x16_t)vcgtq_u8(v27, (uint8x16_t)vaddq_s8(v25, v26));
        v27.i64[0] = 0x2E2E2E2E2E2E2E2ELL;
        v27.i64[1] = 0x2E2E2E2E2E2E2E2ELL;
        *(int8x16_t *)((char *)&v42 + v24 + v19 + 1) = vbslq_s8(v28, v25, (int8x16_t)v27);
        v9 = a3;
        v10 = v37;
        v8 = v16;
        if (v18 != v23)
          goto LABEL_19;
      }
      else
      {
        *(_DWORD *)&v45[15] = 538976288;
        *(_QWORD *)&v14 = 0x2020202020202020;
        *((_QWORD *)&v14 + 1) = 0x2020202020202020;
        v44 = v14;
        *(_OWORD *)v45 = v14;
        LODWORD(v15) = 51;
        v43 = v14;
        v8 = v16;
      }
LABEL_7:
      strcpy((char *)&v43 + (int)v15, "\r\n");
      result = _BBULog(v42, v10, v9, a4, "%c%04zx  %s", a6, a7, a8, v39);
      v11 += 16;
      if (v11 >= v8)
      {
        if (v34)
          return _BBULog(v42, v10, v9, a4, "(snipped)\n", a6, a7, a8, v33);
        return result;
      }
    }
  }
  return result;
}

void BBUFDRLogHandler(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;

  v8 = (char)a2;
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(15, 0, "BBULog", "", "Dump: %s\n", a6, a7, a8, v8);
}

void BBURemoteFSPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  timeval v12;
  char __str[16];
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v12, 0);
  vsnprintf(__str, 0x100uLL, a2, a3);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x80) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x80) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(23, "%u.%03u: %s: %s", v6, v7, v8, v9, v10, v11, v12.tv_sec);
}

uint64_t BBULogRegisterDelegates(void)
{
  capabilities::radio *v0;
  int v1;
  void *exception;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v0 = (capabilities::radio *)TelephonyUtilDebugRegisterDelegate();
  sDelegate = (uint64_t (*)(const char *, const char *, char *))BBURemoteFSPrintDelegate;
  v1 = capabilities::radio::vendor(v0);
  if (v1 == 2)
    return KTLDebugRegisterDelegate();
  if (v1 != 1)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 9, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Support/BBULogging.cpp", 0x2D3u, (ctu::LogMessageBuffer *)"Invalid vendor for log delegate registration", v4, v5, v6, v7);
  }
  return ETLDebugRegisterDelegate();
}

void sub_212B2B8EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZL8gLockGetv_block_invoke()
{
  pthread_mutex_t *v0;
  uint64_t result;

  v0 = (pthread_mutex_t *)operator new(0x40uLL);
  result = pthread_mutex_init(v0, 0);
  qword_253D37B28 = (uint64_t)v0;
  return result;
}

void sub_212B2B934(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B2B9E0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBULogTelephonyUtilPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  timeval v12;
  char __str[16];
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v12, 0);
  vsnprintf(__str, 0x100uLL, a2, a3);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x40) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x40) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(6, "%u.%03u: %s: %s", v6, v7, v8, v9, v10, v11, v12.tv_sec);
}

void BBULogTelephonyUtilPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(6, (uint64_t)v5, a3, a4);
}

void BBULogPrintBinaryDelegate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  timeval v14;
  void *__p;
  uint64_t v16;
  uint64_t v17;

  __p = 0;
  v16 = 0;
  v17 = 0;
  if (a4 < 0x801)
  {
    v6 = a4;
  }
  else
  {
    HIBYTE(v17) = 9;
    LOBYTE(v16) = 41;
    __p = *(void **)"(snipped)";
    v6 = 2048;
  }
  v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v14, 0);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  v13 = 1 << a1;
  if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & (1 << a1)) == 0
    || gBBULogVerbosity < 0
    || (_BBULogPlain(a1, "%u.%03u: %s: %u%s\n", v7, v8, v9, v10, v11, v12, v14.tv_sec), gBBULogMaskGet(void)::once == -1))
  {
    if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & v13) == 0)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_QWORD *)gBBULogMaskGet(void)::sBBULogMask & v13) == 0)
      goto LABEL_12;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogBinary(a1, 0, "BBULog", "", a3, v6, 32, v12);
LABEL_12:
  if (SHIBYTE(v17) < 0)
    operator delete(__p);
}

void sub_212B2BD04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void BBULogETLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  timeval v12;
  char __str[16];
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v12, 0);
  vsnprintf(__str, 0x100uLL, a2, a3);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x80) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x80) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(7, "%u.%03u: %s: %s", v6, v7, v8, v9, v10, v11, v12.tv_sec);
}

void BBULogETLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(7, (uint64_t)v5, a3, a4);
}

void BBULogKTLPrintDelegate(const char *a1, const char *a2, va_list a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  timeval v12;
  char __str[16];
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v12, 0);
  vsnprintf(__str, 0x100uLL, a2, a3);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 1) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 1) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(8, "%u.%03u: %s: %s", v6, v7, v8, v9, v10, v11, v12.tv_sec);
}

void BBULogKTLPrintErrorDelegate(const char *a1, const char *a2, va_list a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  timeval v12;
  char __str[16];
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27 = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  v17 = v5;
  v18 = v5;
  v15 = v5;
  v16 = v5;
  *(_OWORD *)__str = v5;
  v14 = v5;
  v12.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v12, 0);
  vsnprintf(__str, 0x100uLL, a2, a3);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 1) == 0)
      return;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 1) == 0)
      return;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULogPlain(0, "%u.%03u: %s: %s", v6, v7, v8, v9, v10, v11, v12.tv_sec);
}

void BBULogKTLPrintBinaryDelegate(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  const char *v4;
  const char *v5;

  v4 = "misc";
  if (a2 == 1)
    v4 = "recv";
  if (a2)
    v5 = v4;
  else
    v5 = "send";
  BBULogPrintBinaryDelegate(8, (uint64_t)v5, a3, a4);
}

uint64_t *ReverseProxyGetSettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  unint64_t *v5;
  int v6;
  unint64_t v7;
  const __CFAllocator *v8;
  CFURLRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  std::string v46;
  CFTypeRef cf;
  _QWORD v48[5];
  uint64_t v49[2];
  std::string v50;
  std::string v51;
  std::string v52;
  CFStringRef v53;

  *a2 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3002000000;
  v48[3] = __Block_byref_object_copy__2;
  v48[4] = __Block_byref_object_dispose__2;
  v4 = (char *)operator new(0x90uLL);
  *((_QWORD *)v4 + 1) = 0;
  v5 = (unint64_t *)(v4 + 8);
  *((_QWORD *)v4 + 3) = 850045863;
  *((_QWORD *)v4 + 2) = 0;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(_QWORD *)v4 = off_24CE85238;
  v49[0] = (uint64_t)v4;
  std::mutex::lock((std::mutex *)(v4 + 24));
  v6 = *((_DWORD *)v4 + 34);
  if ((v6 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  do
    v7 = __ldxr(v5);
  while (__stxr(v7 + 1, v5));
  *((_DWORD *)v4 + 34) = v6 | 2;
  std::mutex::unlock((std::mutex *)(v4 + 24));
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v46, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v46 = *(std::string *)a1;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v50, v46.__r_.__value_.__l.__data_, v46.__r_.__value_.__l.__size_);
  else
    v50 = v46;
  v49[1] = 0;
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v51, v50.__r_.__value_.__l.__data_, v50.__r_.__value_.__l.__size_);
  else
    v51 = v50;
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v52, v51.__r_.__value_.__l.__data_, v51.__r_.__value_.__l.__size_);
  else
    v52 = v51;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v53 = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  if (ctu::cf::convert_copy())
  {
    v9 = CFURLCreateWithString(v8, v53, 0);
    CFRelease(v53);
    if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_17;
  }
  else
  {
    v9 = 0;
    if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_17:
      if ((SHIBYTE(v51.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_18;
      goto LABEL_36;
    }
  }
  operator delete(v52.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v51.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_18:
    cf = v9;
    if ((SHIBYTE(v50.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_19;
LABEL_37:
    operator delete(v50.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v46.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_36:
  operator delete(v51.__r_.__value_.__l.__data_);
  cf = v9;
  if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_37;
LABEL_19:
  if ((SHIBYTE(v46.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_20;
LABEL_38:
  operator delete(v46.__r_.__value_.__l.__data_);
LABEL_20:
  v13 = (const void *)RPRegisterForAvailability();
  if (v13)
  {
    v14 = *(unsigned __int8 *)(a1 + 23);
    if ((v14 & 0x80u) != 0)
      v14 = *(_QWORD *)(a1 + 8);
    if (!v14
      || (cf
        ? (v15 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
        : (v15 = 0),
          !v15))
    {
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"!url.empty() && urlRef");
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "NULL requestURL?\n", v23, v24, v25, v43);
      goto LABEL_44;
    }
    RPRegistrationResume();
    v52.__r_.__value_.__r.__words[0] = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000;
    v16 = std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v4, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)&v52);
    MEMORY[0x212BF8FE4](v13);
    if (v16)
    {
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v17, v18, v19, (char)"fs == std::future_status::ready");
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "PRP timed out %d\n", v20, v21, v22, v16);
      goto LABEL_44;
    }
    std::__assoc_state<BOOL>::move((std::__assoc_sub_state *)v4);
    v36 = v32;
    do
      v37 = __ldaxr(v5);
    while (__stlxr(v37 - 1, v5));
    if (v37)
    {
      if ((v32 & 1) != 0)
        goto LABEL_62;
    }
    else
    {
      (*(void (**)(char *))(*(_QWORD *)v4 + 16))(v4);
      if ((v36 & 1) != 0)
      {
LABEL_62:
        v38 = RPCopyProxyDictionary();
        v39 = (const void *)*a2;
        *a2 = v38;
        if (v39)
          CFRelease(v39);
LABEL_70:
        v4 = 0;
LABEL_44:
        CFRelease(v13);
        goto LABEL_50;
      }
    }
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v33, v34, v35, (char)"future.get()");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Failed to get PRP\n", v40, v41, v42, v45);
    goto LABEL_70;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"reg");
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Failed to register for proxy\n", v26, v27, v28, v44);
LABEL_50:
  if (cf)
    CFRelease(cf);
  if (v4)
  {
    v29 = (unint64_t *)(v4 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
      (*(void (**)(char *))(*(_QWORD *)v4 + 16))(v4);
  }
  _Block_object_dispose(v48, 8);
  return std::promise<BOOL>::~promise(v49);
}

void sub_212B2C7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,const void *a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t *v35;
  const void **v36;

  ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(&a26);
  _Block_object_dispose(&a27, 8);
  std::promise<BOOL>::~promise(v35);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(v36);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__2(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 40));
}

void ___Z23ReverseProxyGetSettingsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v10;
  uint64_t v11;
  char v12;
  std::exception_ptr v13;

  if (a2 != 2)
  {
    v8 = a2;
    if (a2 == 1)
    {
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Available!\n", a6, a7, a8, v12);
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v10)
        std::__throw_future_error[abi:ne180100](3u);
      std::mutex::lock((std::mutex *)(v10 + 24));
      if ((*(_BYTE *)(v10 + 136) & 1) != 0
        || (v13.__ptr_ = 0, v11 = *(_QWORD *)(v10 + 16), std::exception_ptr::~exception_ptr(&v13), v11))
      {
        std::__throw_future_error[abi:ne180100](2u);
      }
      *(_BYTE *)(v10 + 140) = 1;
      *(_DWORD *)(v10 + 136) |= 5u;
      std::condition_variable::notify_all((std::condition_variable *)(v10 + 88));
      std::mutex::unlock((std::mutex *)(v10 + 24));
    }
    else
    {
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "BBUPurpleReverseProxy", "", "Proxy Aborted? %d\n", a6, a7, a8, v8);
    }
  }
}

void sub_212B2CAB4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<BOOL>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  operator delete(v3);
}

uint64_t std::__assoc_state<BOOL>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<BOOL>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  const std::error_category *v7;
  std::logic_error *exception;
  std::logic_error *v9;
  std::logic_error v10;
  std::logic_error v11;
  std::exception_ptr v12;

  v2 = *a1;
  if (!v2)
    return a1;
  if ((*(_BYTE *)(v2 + 136) & 1) == 0)
  {
    v12.__ptr_ = 0;
    v3 = *(_QWORD *)(v2 + 16);
    std::exception_ptr::~exception_ptr(&v12);
    v2 = *a1;
    if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
    {
      v7 = std::future_category();
      MEMORY[0x212BFA148](&v10, 4, v7);
      exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
      v9 = std::logic_error::logic_error(exception, &v10);
      v9->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
      v9[1] = v11;
      __cxa_throw(v9, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
    }
  }
  v4 = (unint64_t *)(v2 + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (v5)
    return a1;
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  return a1;
}

void sub_212B2CC5C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__assoc_sub_state *a10, char a11)
{
  uint64_t v11;
  std::exception_ptr v12;

  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v12.__ptr_ = (void *)(v11 - 32);
  std::__assoc_sub_state::set_exception(a10, v12);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v11 - 32));
  MEMORY[0x212BFA154](&a11);
  JUMPOUT(0x212B2CBB8);
}

uint64_t std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a2)
{
  std::mutex *m;
  unsigned int v5;
  uint64_t v6;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v8;
  unsigned int v9;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v10;
  std::chrono::steady_clock::time_point v11;
  std::chrono::system_clock::time_point v12;
  std::unique_lock<std::mutex> v14;

  m = (std::mutex *)(a1 + 24);
  v14.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  *(_QWORD *)&v14.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock((std::mutex *)(a1 + 24));
  v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) != 0)
  {
    v6 = 2;
    goto LABEL_26;
  }
  if ((v5 & 4) != 0)
  {
    v6 = ((v5 >> 2) & 1) == 0;
    goto LABEL_26;
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
  {
    if (*a2 <= std::chrono::steady_clock::now().__d_.__rep_)
      goto LABEL_10;
    v10 = *a2;
    v11.__d_.__rep_ = v10 - std::chrono::steady_clock::now().__d_.__rep_;
    if (v11.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v12.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v12.__d_.__rep_)
      {
        v7 = 0;
        goto LABEL_7;
      }
      if (v12.__d_.__rep_ < 1)
      {
        if ((unint64_t)v12.__d_.__rep_ < 0xFFDF3B645A1CAC09)
        {
          v7 = 0x8000000000000000;
          goto LABEL_7;
        }
      }
      else if ((unint64_t)v12.__d_.__rep_ > 0x20C49BA5E353F7)
      {
        v7 = 0x7FFFFFFFFFFFFFFFLL;
        if ((v11.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_22:
          v8.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_8;
        }
LABEL_7:
        v8.__d_.__rep_ = v7 + v11.__d_.__rep_;
LABEL_8:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 88), &v14, v8);
        std::chrono::steady_clock::now();
        goto LABEL_9;
      }
      v7 = 1000 * v12.__d_.__rep_;
      if (1000 * v12.__d_.__rep_ > (v11.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        goto LABEL_22;
      goto LABEL_7;
    }
LABEL_9:
    std::chrono::steady_clock::now();
LABEL_10:
    v9 = *(_DWORD *)(a1 + 136);
    if ((v9 & 4) != 0)
      goto LABEL_24;
  }
  v9 = *(_DWORD *)(a1 + 136);
LABEL_24:
  v6 = ((v9 >> 2) & 1) == 0;
  if (v14.__owns_)
  {
    m = v14.__m_;
LABEL_26:
    std::mutex::unlock(m);
  }
  return v6;
}

void std::__assoc_state<BOOL>::move(std::__assoc_sub_state *a1)
{
  void *ptr;
  std::exception_ptr v3;
  std::exception_ptr v4;
  std::exception_ptr v5;
  std::unique_lock<std::mutex> __lk;

  __lk.__m_ = &a1->__mut_;
  *(_QWORD *)&__lk.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock(&a1->__mut_);
  std::__assoc_sub_state::__sub_wait(a1, &__lk);
  ptr = a1->__exception_.__ptr_;
  v5.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v5);
  if (ptr)
  {
    std::exception_ptr::exception_ptr(&v4, &a1->__exception_);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else if (__lk.__owns_)
  {
    std::mutex::unlock(__lk.__m_);
  }
}

void sub_212B2CEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr((std::exception_ptr *)&a9);
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(a1);
}

char *BBULoader::create(BBULoader *this, BBUFeedback *a2)
{
  uint64_t v2;
  BBUEUR10Loader *v4;
  char *result;
  char *v6;
  char *v7;
  void *exception;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  switch(capabilities::updater::getLoaderType(this))
  {
    case 0u:
      v4 = (BBUEUR10Loader *)operator new(0xA8uLL);
      BBUEUR10Loader::BBUEUR10Loader(v4, this);
      goto LABEL_3;
    case 1u:
      v7 = (char *)operator new(0x50uLL);
      BBUEURLoader::BBUEURLoader((BBUEURLoader *)v7, this);
      *(_QWORD *)v7 = &unk_24CE85698;
      *(_OWORD *)(v7 + 41) = constinit_1;
      *(_OWORD *)(v7 + 57) = unk_212B55FE3;
      return v7;
    case 2u:
      v6 = (char *)operator new(0x80uLL);
      BBUEURLoader::BBUEURLoader((BBUEURLoader *)v6, this);
      *(_OWORD *)(v6 + 41) = constinit_1;
      *(_OWORD *)(v6 + 57) = unk_212B55FE3;
      *(_QWORD *)v6 = off_24CE852E0;
      *((_DWORD *)v6 + 19) = 1000;
      *((_OWORD *)v6 + 5) = constinit_3;
      *((_OWORD *)v6 + 6) = unk_212B56003;
      *((_OWORD *)v6 + 7) = xmmword_212B56013;
      return v6;
    case 3u:
      v4 = (BBUEUR10Loader *)operator new(0x88uLL);
      BBUICE16Loader::BBUICE16Loader(v4, this);
LABEL_3:
      result = (char *)v4;
      break;
    case 4u:
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/Common/BBULoader.cpp", 0x29u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v9, v10, v11, v12);
    default:
      result = (char *)v2;
      break;
  }
  return result;
}

void sub_212B2D054(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B2D068(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B2D07C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B2D090(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B2D0A4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBULoader::addProgressBarTimes(uint64_t **this, BBUFeedback *a2)
{
  uint64_t result;
  uint64_t *v4;
  uint64_t **v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *exception;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  result = capabilities::updater::getLoaderProgressBarTimesType((capabilities::updater *)this);
  switch((_DWORD)result)
  {
    case 0:
      v5 = this + 2;
      v4 = this[2];
      if (v4)
      {
        while (1)
        {
          while (1)
          {
            v6 = v4;
            v7 = *((_DWORD *)v4 + 8);
            if (v7 < 2)
              break;
            v4 = (uint64_t *)*v6;
            v5 = (uint64_t **)v6;
            if (!*v6)
              goto LABEL_19;
          }
          if (v7 == 1)
            goto LABEL_23;
          v4 = (uint64_t *)v6[1];
          if (!v4)
          {
LABEL_18:
            v5 = (uint64_t **)(v6 + 1);
            goto LABEL_19;
          }
        }
      }
      goto LABEL_13;
    case 1:
      v5 = this + 2;
      v8 = this[2];
      if (v8)
      {
        while (1)
        {
          while (1)
          {
            v6 = v8;
            v9 = *((_DWORD *)v8 + 8);
            if (v9 < 2)
              break;
            v8 = (uint64_t *)*v6;
            v5 = (uint64_t **)v6;
            if (!*v6)
              goto LABEL_19;
          }
          if (v9 == 1)
            break;
          v8 = (uint64_t *)v6[1];
          if (!v8)
            goto LABEL_18;
        }
LABEL_23:
        v6[5] = 0x408F400000000000;
        return result;
      }
LABEL_13:
      v6 = (uint64_t *)v5;
LABEL_19:
      v10 = (uint64_t *)operator new(0x30uLL);
      v11 = v10;
      *((_DWORD *)v10 + 8) = 1;
      v10[5] = 0;
      *v10 = 0;
      v10[1] = 0;
      v10[2] = (uint64_t)v6;
      *v5 = v10;
      v12 = (uint64_t *)*this[1];
      if (v12)
      {
        this[1] = v12;
        v6 = v10;
        v11 = *v5;
      }
      else
      {
        v6 = v10;
      }
      result = (uint64_t)std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(this[2], v11);
      this[3] = (uint64_t *)((char *)this[3] + 1);
      goto LABEL_23;
    case 2:
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Protocol/Common/BBULoader.cpp", 0x3Bu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v14, v15, v16, v17);
  }
  return result;
}

void sub_212B2D22C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const char *BBUEUR20Loader::getDebugName(BBUEUR20Loader *this)
{
  return "BBUEUR20Loader";
}

uint64_t BBUEUR20Loader::getPKHashLength(BBUEUR20Loader *this)
{
  return 48;
}

uint64_t BBUEUR20Loader::getEURDefaultHashData(BBUEUR20Loader *this)
{
  return (uint64_t)this + 80;
}

uint64_t eUICC::Done(const __CFDictionary **a1)
{
  const __CFDictionary *v1;
  int v2;
  _BOOL8 v3;
  std::__shared_weak_count *v5;
  std::__shared_weak_count_vtbl *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  const __CFDictionary *v14;
  _BYTE v15[16];
  void *__p;
  char v17;

  v1 = *a1;
  v14 = v1;
  if (v1)
    CFRetain(v1);
  eUICC::Options::Options((uint64_t)v15, &v14);
  v2 = v15[8];
  if (v17 < 0)
  {
    operator delete(__p);
    if (!v1)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    CFRelease(v1);
LABEL_8:
  if (v2)
    return 1;
  pthread_mutex_lock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  if (qword_254B5FD38)
  {
LABEL_12:
    v6 = (std::__shared_weak_count_vtbl *)qword_254B5FD38;
    v5 = (std::__shared_weak_count *)off_254B5FD40;
    if (!off_254B5FD40)
      goto LABEL_21;
    goto LABEL_19;
  }
  v6 = (std::__shared_weak_count_vtbl *)operator new(4uLL);
  LODWORD(v6->~__shared_weak_count) = 0;
  v5 = (std::__shared_weak_count *)operator new(0x20uLL);
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85380;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5[1].__vftable = v6;
  v7 = (std::__shared_weak_count *)off_254B5FD40;
  qword_254B5FD38 = (uint64_t)v6;
  off_254B5FD40 = v5;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
    goto LABEL_12;
  }
LABEL_19:
  v10 = (unint64_t *)&v5->__shared_owners_;
  do
    v11 = __ldxr(v10);
  while (__stxr(v11 + 1, v10));
LABEL_21:
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  v3 = LODWORD(v6->~__shared_weak_count) > 7;
  if (!v5)
    return v3;
  v12 = (unint64_t *)&v5->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (v13)
    return v3;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return v3;
}

void sub_212B2D3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  void *v10;

  operator delete(v10);
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t eUICC::UpdateOutput(void *a1, const __CFDictionary **a2, CFMutableDictionaryRef *a3)
{
  __int128 v5;
  const __CFDictionary *v6;
  capabilities::radio *v7;
  int v8;
  capabilities::radio *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  CFDataRef v20;
  CFDataRef v21;
  CFDataRef v22;
  CFNumberRef v23;
  CFIndex v24;
  CFDataRef v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFNumberRef v30;
  uint64_t v31;
  CFDataRef v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v37;
  _QWORD v38[3];
  __int16 valuePtr;
  CFDataRef v40;
  CFDataRef v41;
  CFDataRef v42;
  const __CFDictionary *v43;
  __int128 v44;
  void *__p[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[11];
  __int128 v52;
  _BYTE v53[26];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v5;
  v46 = v5;
  v44 = v5;
  v6 = *a2;
  v43 = v6;
  if (v6)
    CFRetain(v6);
  v7 = (capabilities::radio *)eUICC::Options::Options((uint64_t)&v44, &v43);
  if (v6)
    CFRelease(v6);
  v8 = v44;
  v9 = (capabilities::radio *)capabilities::radio::maverick(v7);
  if ((_DWORD)v9)
  {
    v10 = (char *)operator new(0x138uLL);
    *(_WORD *)(v10 + 289) = 0;
    *(_QWORD *)v10 = &unk_24CE866C8;
    *((_QWORD *)v10 + 37) = a1;
    *((_DWORD *)v10 + 73) = v8;
    v10[304] = 15;
  }
  else if (capabilities::radio::ice(v9))
  {
    v10 = (char *)operator new(0x140uLL);
    eUICC::eUICCVinylICEValve::eUICCVinylICEValve((eUICC::eUICCVinylICEValve *)v10, a1, v8, 0);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v53[10] = v11;
  v52 = v11;
  *(_OWORD *)v53 = v11;
  v51[9] = v11;
  v51[10] = v11;
  v51[7] = v11;
  v51[8] = v11;
  v51[5] = v11;
  v51[6] = v11;
  v51[3] = v11;
  v51[4] = v11;
  v51[1] = v11;
  v51[2] = v11;
  v50 = v11;
  v51[0] = v11;
  v48 = v11;
  v49 = v11;
  v47 = v11;
  (*(void (**)(__int128 *__return_ptr, char *))(*(_QWORD *)v10 + 8))(&v47, v10);
  v18 = eUICC::HowToProceed((unsigned __int8 *)&v47, (uint64_t)&v44, v12, v13, v14, v15, v16, v17);
  if (!v18)
  {
    v19 = 18;
    goto LABEL_44;
  }
  if (v18 == 3)
  {
    v19 = 0;
    goto LABEL_44;
  }
  v20 = CFDataCreate(0, (const UInt8 *)&v47 + 7, 16);
  v42 = v20;
  CFDictionarySetValue(*a3, CFSTR("EUICCCSN"), v20);
  if (BYTE7(v48))
  {
LABEL_42:
    v19 = 0;
    if (!v20)
      goto LABEL_44;
    goto LABEL_43;
  }
  v21 = CFDataCreate(0, (const UInt8 *)&v50 + 8, 8);
  v41 = v21;
  CFDictionarySetValue(*a3, CFSTR("EUICCMainNonce"), v21);
  v22 = CFDataCreate(0, (const UInt8 *)v51, 8);
  v40 = v22;
  CFDictionarySetValue(*a3, CFSTR("EUICCGoldNonce"), v22);
  valuePtr = 1;
  v23 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
  v38[2] = v23;
  CFDictionarySetValue(*a3, CFSTR("EUICCTicketVersion"), v23);
  v24 = capabilities::updater::EUICCCertIDSizeBytes((capabilities::updater *)v53[19]);
  v25 = CFDataCreate(0, (const UInt8 *)&v52 + 3, v24);
  v38[1] = v25;
  CFDictionarySetValue(*a3, CFSTR("EUICCCertIdentifier"), v25);
  v38[0] = 0xAAAAAAAAAAAAAAAALL;
  v26 = v53[19];
  if (v53[19] < 5uLL)
  {
    if (BBUpdaterCommon::getEUICCChipID(void)::sOnce != -1)
      dispatch_once(&BBUpdaterCommon::getEUICCChipID(void)::sOnce, &__block_literal_global_20);
    v26 = BBUpdaterCommon::getEUICCChipID(void)::euiccChipID;
  }
  v38[0] = v26;
  v30 = CFNumberCreate(0, kCFNumberSInt32Type, v38);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 3) & 2) == 0)
      goto LABEL_23;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 3) & 2) == 0)
      goto LABEL_23;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
    _BBULog(25, 0, "eUICC", "", "eUICC ChipID: 0x%llx\n", v27, v28, v29, v38[0]);
LABEL_23:
  v31 = v38[0];
  if (v38[0])
  {
    CFDictionarySetValue(*a3, CFSTR("EUICCChipID"), v30);
    v32 = CFDataCreate(0, (const UInt8 *)&v52, 3);
    CFDictionarySetValue(*a3, CFSTR("EUICCFirmwareLoaderVersion"), v32);
    if (v32)
      CFRelease(v32);
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICC", "", "Condition <<%s>> failed %s %s/%d\n", v27, v28, v29, (char)"chipID");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "EUICC but MG has no ChipID?", v33, v34, v35, v37);
  }
  if (v30)
    CFRelease(v30);
  if (v25)
    CFRelease(v25);
  if (v23)
    CFRelease(v23);
  if (v22)
    CFRelease(v22);
  if (v21)
    CFRelease(v21);
  if (v31)
    goto LABEL_42;
  v19 = 18;
  if (v20)
LABEL_43:
    CFRelease(v20);
LABEL_44:
  (*(void (**)(char *))(*(_QWORD *)v10 + 96))(v10);
  if (SBYTE7(v46) < 0)
    operator delete(__p[0]);
  return v19;
}

void sub_212B2D92C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,int a26,__int16 a27,char a28,char a29,int a30,__int16 a31,char a32,char a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,int a42,__int16 a43,char a44,char a45)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Run(void *a1, uint64_t a2, const void **a3)
{
  _QWORD *v6;
  int *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  const void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  CFTypeRef cf;
  uint64_t v20;
  std::__shared_weak_count *v21;

  pthread_mutex_lock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  if (qword_254B5FD38)
    goto LABEL_2;
  v7 = (int *)operator new(4uLL);
  *v7 = 0;
  v6 = operator new(0x20uLL);
  *v6 = off_24CE85380;
  v6[1] = 0;
  v6[2] = 0;
  v6[3] = v7;
  v8 = (std::__shared_weak_count *)off_254B5FD40;
  qword_254B5FD38 = (uint64_t)v7;
  off_254B5FD40 = v6;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
LABEL_2:
    v7 = (int *)qword_254B5FD38;
    v6 = off_254B5FD40;
    v20 = qword_254B5FD38;
    v21 = (std::__shared_weak_count *)off_254B5FD40;
    if (!off_254B5FD40)
      goto LABEL_12;
    goto LABEL_10;
  }
  v20 = (uint64_t)v7;
  v21 = (std::__shared_weak_count *)v6;
LABEL_10:
  v11 = v6 + 1;
  do
    v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
LABEL_12:
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  v13 = *a3;
  cf = v13;
  if (v13)
    CFRetain(v13);
  v14 = eUICC::detail::StateMachine::Run(v7, a1, a2, (const __CFDictionary **)&cf);
  if (cf)
    CFRelease(cf);
  v15 = v21;
  if (v21)
  {
    v16 = (unint64_t *)&v21->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

void sub_212B2DBC4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  pthread_mutex_unlock(&ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_212B2DBF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void eUICC::DumpRecords(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void **v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *v34;
  void **v35;
  const char *v36;
  uint64_t v37;
  int v38;
  void *__p[3];
  void *v40[3];
  char *v41;
  uint64_t (*v42)();
  void *v43;
  _BYTE v44[200];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  memset(v40, 170, sizeof(v40));
  eUICC::Perso::DumpTransactions(v40);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "dumping %zu records\n", v2, v3, v4, -85 * (((char *)v40[1] - (char *)v40[0]) >> 4));
  if (ctu::fs::create_directory())
  {
    v9 = (char *)v40[0];
    v8 = (char *)v40[1];
    if (v40[1] == v40[0])
      goto LABEL_35;
    v10 = 0;
    v11 = 0;
    do
    {
      memset(__p, 170, sizeof(__p));
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::basic_format((uint64_t)v44, "%s/Perso-%02d-%s");
      v41 = a1;
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,std::string const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,std::string const>;
      v12 = boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>((uint64_t)v44, &v41);
      v38 = v11;
      v41 = (char *)&v38;
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,int const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,int const>;
      v13 = boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>(v12, &v41);
      v41 = &v9[v10];
      v42 = boost::io::detail::call_put_head<char,std::char_traits<char>,std::string const>;
      v43 = boost::io::detail::call_put_last<char,std::char_traits<char>,std::string const>;
      v14 = (uint64_t *)boost::io::detail::feed_impl<char,std::char_traits<char>,std::allocator<char>,boost::io::detail::put_holder<char,std::char_traits<char>> const&>(v13, &v41);
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::str(v14, (uint64_t)__p);
      boost::basic_format<char,std::char_traits<char>,std::allocator<char>>::~basic_format((uint64_t)v44);
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if (SHIBYTE(__p[2]) >= 0)
        v18 = __p;
      else
        v18 = (void **)__p[0];
      v35 = v18;
      _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "%zu -> %s\n", v15, v16, v17, v11);
      if (SHIBYTE(__p[2]) >= 0)
        v19 = __p;
      else
        v19 = (void **)__p[0];
      v20 = open_dprotected_np((const char *)v19, 1793, 4, 0, 420, v35, v36, v37);
      v24 = v20;
      if (v20 < 0)
      {
        if (gBBULogMaskGet(void)::once != -1)
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v36 = "";
        v37 = 146;
        _BBULog(25, 0xFFFFFFFFLL, "eUICC", "", "Condition <<%s>> failed %s %s/%d\n", v21, v22, v23, (char)"destFD >= 0");
        if (gBBULogMaskGet(void)::once != -1)
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "Couldn't allocate FD for transaction record during coredump! fd %d path %s\n", v25, v26, v27, v24);
      }
      else
      {
        write(v20, *(const void **)&v9[v10 + 24], *(_QWORD *)&v9[v10 + 32] - *(_QWORD *)&v9[v10 + 24]);
        close(v24);
      }
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v24 < 0)
        break;
      ++v11;
      v9 = (char *)v40[0];
      v10 += 48;
    }
    while (v11 < 0xAAAAAAAAAAAAAAABLL * (((char *)v40[1] - (char *)v40[0]) >> 4));
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICC", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"success");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if (a1[23] >= 0)
      LOBYTE(v31) = (_BYTE)a1;
    else
      v31 = *(_QWORD *)a1;
    _BBULog(22, 0xFFFFFFFFLL, "eUICC", "", "Failed creating directory %s\n", v28, v29, v30, v31);
  }
  v8 = (char *)v40[0];
LABEL_35:
  if (v8)
  {
    v32 = (char *)v40[1];
    v33 = v8;
    if (v40[1] != v8)
    {
      do
      {
        v34 = (void *)*((_QWORD *)v32 - 3);
        if (v34)
        {
          *((_QWORD *)v32 - 2) = v34;
          operator delete(v34);
        }
        if (*(v32 - 25) < 0)
          operator delete(*((void **)v32 - 6));
        v32 -= 48;
      }
      while (v32 != v8);
      v33 = (char *)v40[0];
    }
    v40[1] = v8;
    operator delete(v33);
  }
}

void sub_212B2E090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  std::vector<std::pair<std::string,std::vector<unsigned char>>>::~vector[abi:ne180100](&a21);
  _Unwind_Resume(a1);
}

uint64_t ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>::~PthreadMutexGuardPolicy(uint64_t a1)
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
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<eUICC::detail::StateMachine *,std::shared_ptr<eUICC::detail::StateMachine>::__shared_ptr_default_delete<eUICC::detail::StateMachine,eUICC::detail::StateMachine>,std::allocator<eUICC::detail::StateMachine>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B560C0)
    return a1 + 24;
  if (((v3 & 0x8000000212B560C0 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B560C0))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B560C0 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t __cxx_global_var_init_26()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_212A4D000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_212A4D000);
  }
  return result;
}

uint64_t __cxx_global_var_init_27()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>::~PthreadMutexGuardPolicy, &ctu::Singleton<eUICC::detail::StateMachine,eUICC::detail::StateMachine,ctu::PthreadMutexGuardPolicy<eUICC::detail::StateMachine>>::sInstance, &dword_212A4D000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_212A4D000);
  }
  return result;
}

uint64_t BBUScratchFile::createWithFile(uint64_t a1, off_t a2)
{
  uint64_t v3;
  std::error_code *v5;
  const std::__fs::filesystem::path *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  int v10;
  int v11;
  int *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  passwd *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  char v32;
  char v33;

  if (*(char *)(a1 + 23) >= 0)
    v3 = *(unsigned __int8 *)(a1 + 23);
  else
    v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 2;
  if (!ctu::fs::file_exists()
    || (*(char *)(a1 + 23) >= 0
      ? (v6 = (const std::__fs::filesystem::path *)a1)
      : (v6 = *(const std::__fs::filesystem::path **)a1),
        !remove(v6, v5)))
  {
    if (*(char *)(a1 + 23) >= 0)
      v9 = (const char *)a1;
    else
      v9 = *(const char **)a1;
    v10 = open(v9, 1537, 384);
    if (v10 < 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        v7 = 15;
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
          return v7;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v7 = 15;
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
          return v7;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v8 = "file not found after creating %s\n";
        goto LABEL_35;
      }
      return v7;
    }
    v11 = v10;
    if (ftruncate(v10, a2))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        v7 = 11;
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
          goto LABEL_25;
        goto LABEL_21;
      }
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v7 = 11;
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0)
      {
LABEL_21:
        if (gBBULogVerbosity < 0)
          goto LABEL_25;
        v12 = __error();
        v13 = strerror(*v12);
        v17 = "cannot truncate file %s\n";
        goto LABEL_23;
      }
    }
    else
    {
      v24 = getpwnam("_wireless");
      if (v24)
      {
        if (!fchown(v11, v24->pw_uid, v24->pw_gid))
        {
          v7 = 0;
          goto LABEL_25;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          v7 = 11;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
            goto LABEL_25;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          v7 = 11;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
            goto LABEL_25;
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v31 = __error();
          v13 = strerror(*v31);
          v17 = "failed changing file owner:  %s";
LABEL_23:
          v33 = v13;
LABEL_24:
          _BBULog(15, 0, "BBUScratchFile", "", v17, v14, v15, v16, v33);
        }
      }
      else
      {
        _BBUFSDebugPrint("getWirelessID", "failed to get uid and gid information for _wireless\n", v25, v26, v27, v28, v29, v30, v32);
        if (gBBULogMaskGet(void)::once == -1)
        {
          v7 = 11;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
            goto LABEL_25;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          v7 = 11;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
            goto LABEL_25;
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v17 = "failed to get uid and gid information for _wireless\n";
          goto LABEL_24;
        }
      }
    }
LABEL_25:
    if (close(v11))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        v7 = 15;
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
          return v7;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v7 = 15;
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
          return v7;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v8 = "could not close file %s\n";
        goto LABEL_35;
      }
    }
    return v7;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    v7 = 11;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
      return v7;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v7 = 11;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
      return v7;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v8 = "cannot remove existing file %s\n";
LABEL_35:
    v18 = __error();
    v19 = strerror(*v18);
    _BBULog(15, 0, "BBUScratchFile", "", v8, v20, v21, v22, v19);
  }
  return v7;
}

void BBUEURInitializer::~BBUEURInitializer(BBUEURInitializer *this)
{
  uint64_t v1;

  *(_QWORD *)this = &unk_24CE81DA0;
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

{
  uint64_t v2;

  *(_QWORD *)this = &unk_24CE81DA0;
  v2 = *((_QWORD *)this + 2);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(this);
}

uint64_t BBUEURInitializer::prepare(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *exception;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  if (capabilities::radio::supportsSDIReset((capabilities::radio *)a1))
  {
    v5 = *(_QWORD **)(a1 + 8);
    v6 = v5[22];
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Feedback/BBUFeedback.cpp", 0xD4u, (ctu::LogMessageBuffer *)"Assertion failure(!fStageContext.empty())", v27, v28, v29, v30);
    }
    if (*(_DWORD *)(*(_QWORD *)(v5[18] + (((unint64_t)(v6 + v5[21] - 1) >> 7) & 0x1FFFFFFFFFFFFF8))
                   + 4 * ((v6 + v5[21] - 1) & 0x3FF)) == 8)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        result = 0;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
          return result;
        goto LABEL_6;
      }
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      result = 0;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
      {
LABEL_6:
        if (gBBULogVerbosity < 0)
          return result;
        v8 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(4, 0, v8, "", "StageContext is Coredump, skipping prepare\n", v9, v10, v11, v30);
        return 0;
      }
      return result;
    }
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_12;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v13 = BBUStageAsString(a3);
    _BBULog(4, 0, v12, "", "Preparing at %s with reset requested %u\n", v14, v15, v16, v13);
  }
LABEL_12:
  if (a3 != 2)
    return 0;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
        goto LABEL_16;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
      {
LABEL_16:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v17 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(4, 0, v17, "", "Powering on modem. It is NOOP if BB is already on\n", v18, v19, v20, v30);
        }
      }
    }
    TelephonyBasebandPowerOnModem();
    result = 0;
    *(_BYTE *)(a1 + 40) = 0;
    return result;
  }
  *(_BYTE *)(a1 + 40) = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "%s: Resetting modem", "prepare");
  v21 = TelephonyBasebandResetModem();
  result = 0;
  if ((v21 & 1) != 0)
    return result;
  if (gBBULogMaskGet(void)::once == -1)
  {
    result = 73;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return result;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    result = 73;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return result;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v22 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v22, "", "Fail to prepare at %s with reset %u\n", v23, v24, v25, (char)"first");
    return 73;
  }
  return result;
}

void sub_212B2EA80(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::finalize(BBUFeedback **a1, uint64_t a2, uint64_t a3, int a4, unsigned int a5)
{
  uint64_t result;

  if ((a4 & 0xFFFFFFFD) != 1
    || (result = (*((uint64_t (**)(BBUFeedback **, uint64_t))*a1 + 30))(a1, a2), !(_DWORD)result))
  {
    result = BBUEURInitializer::restoreNVItems(a1, a2, a4);
    if (!(_DWORD)result)
    {
      (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
      return BBUEURInitializer::updateIMEISvn((uint64_t)a1, a2, a5);
    }
  }
  return result;
}

uint64_t BBUEURInitializer::restoreNVItems(BBUFeedback **a1, uint64_t a2, int a3)
{
  uint64_t result;

  (*((void (**)(BBUFeedback **))*a1 + 23))(a1);
  switch(a3)
  {
    case 1:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to Factory defaults");
      if (ETLMaverickWriteFactoryDefaultNVs())
        goto LABEL_9;
      result = 3;
      break;
    case 2:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to Shipping defaults");
      if ((ETLMaverickWriteDefaultNVs() & 1) != 0)
        goto LABEL_9;
      result = 3;
      break;
    case 4:
      BBUFeedback::handleComment(a1[1], "Restoring NV items to FATP defaults");
      if ((ETLMaverickWriteFATPDefaultNVs() & 1) != 0)
        goto LABEL_9;
      result = 3;
      break;
    case 5:
      BBUFeedback::handleComment(a1[1], "OQC Magic is not supported on MAV basebands");
      goto LABEL_9;
    default:
LABEL_9:
      result = 0;
      break;
  }
  return result;
}

uint64_t BBUEURInitializer::updateIMEISvn(uint64_t a1, uint64_t a2, unsigned int a3)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI-SVN Check and Update...");
  if (a3 == -1)
    return 0;
  if (a3 > 0x62)
    return 2;
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
      goto LABEL_8;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
      goto LABEL_8;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v6 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v6, "", "Getting current SVN\n", v7, v8, v9, v33);
  }
LABEL_8:
  if (!ETLMaverickGetIMEISwVersion())
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
        goto LABEL_15;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
        goto LABEL_15;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v10 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v10, "", "Trying to set SVN\n", v11, v12, v13, v33);
    }
LABEL_15:
    v14 = ETLMaverickSetIMEISwVersion();
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v15 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
    if (v14)
    {
      if (v15)
      {
        v16 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(20, 0, v16, "", "SVN set: %d\n", v17, v18, v19, a3);
      }
      return 0;
    }
    goto LABEL_28;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  if (((gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4)) != 0)
  {
    v20 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v20, "", "Trying to set new SVN\n", v21, v22, v23, v33);
  }
  v24 = ETLMaverickSetIMEISwVersion();
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  v15 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (v24)
  {
    if (v15)
    {
      v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v25, "", "SVN changed from %d to %d\n", v26, v27, v28, 170);
    }
    return 0;
  }
LABEL_28:
  if (v15)
  {
    v29 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v29, "", "Could not set SVN\n", v30, v31, v32, v33);
  }
  return 3;
}

uint64_t BBUEURInitializer::crashBaseband(uint64_t a1, uint64_t a2, uint64_t a3)
{
  capabilities::coredump *Reset;

  Reset = (capabilities::coredump *)TelephonyBasebandGetReset();
  if (capabilities::coredump::supportsGPIOSignalling(Reset))
  {
    TelephonyBasebandSetModemCoredumpGPIO();
    usleep(0xF4240u);
    TelephonyBasebandSetModemCoredumpGPIO();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Coredump GPIO signalled");
    TelephonyBasebandGetReset();
  }
  if (a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "DIAG crash command sent");
    ETLBBSimulateCrash();
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "resetting modem");
  TelephonyBasebandResetModem();
  return 0;
}

uint64_t BBUEURInitializer::getVersion(_QWORD *a1, uint64_t a2, BBUEUR10FirmwareVersion **a3)
{
  __int128 v5;
  size_t v6;
  void *v7;
  void **v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  BBUEUR10FirmwareVersion *v12;
  void *exception;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *__dst[2];
  unint64_t v19;
  _OWORD v20[15];
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/Eureka/BBUEURInitializer.cpp", 0xA3u, (ctu::LogMessageBuffer *)"Assertion failure(transport && \"Telephony util transport error\")", v14, v15, v16, v17);
  }
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v21 + 11) = v5;
  v20[14] = v5;
  v21[0] = v5;
  v20[12] = v5;
  v20[13] = v5;
  v20[10] = v5;
  v20[11] = v5;
  v20[8] = v5;
  v20[9] = v5;
  v20[7] = v5;
  v20[5] = v5;
  v20[6] = v5;
  v20[3] = v5;
  v20[4] = v5;
  v20[1] = v5;
  v20[2] = v5;
  v20[0] = v5;
  *a3 = 0;
  (*(void (**)(_QWORD *))(*a1 + 200))(a1);
  if (!ETLBBGetVersion())
    return 3;
  v6 = strlen((const char *)((unint64_t)v20 | 0xB));
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    v10 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v10 = v6 | 7;
    v11 = v10 + 1;
    v8 = (void **)operator new(v10 + 1);
    __dst[1] = v7;
    v19 = v11 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v19) = v6;
    v8 = __dst;
    if (!v6)
      goto LABEL_12;
  }
  memcpy(v8, (const void *)((unint64_t)v20 | 0xB), (size_t)v7);
LABEL_12:
  *((_BYTE *)v7 + (_QWORD)v8) = 0;
  v12 = BBUFirmwareVersion::createFromVersionString((capabilities::updater *)__dst);
  a1[2] = v12;
  if (SHIBYTE(v19) < 0)
  {
    operator delete(__dst[0]);
    v12 = (BBUEUR10FirmwareVersion *)a1[2];
  }
  result = 0;
  *a3 = v12;
  return result;
}

void sub_212B2F270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::gatherPersonalizationParameters(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  __int128 v6;
  CFIndex v7;
  _QWORD *v8;
  const __CFAllocator *v9;
  __int128 v10;
  _QWORD *v11;
  CFIndex v12;
  uint64_t v13;
  __int128 v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BBUEURPersonalizationParameters::EURChipID *v25;
  int v26;
  unsigned int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  UInt8 v36[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  UInt8 bytes[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v50 = v6;
  v51 = v6;
  v48 = v6;
  v49 = v6;
  v46 = v6;
  v47 = v6;
  *(_OWORD *)bytes = v6;
  v45 = v6;
  v27 = -1431655766;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickReadPublicKeyHash())
    return 3;
  v7 = v27;
  v8 = operator new(0x10uLL);
  *v8 = off_24CE84A18;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v7);
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v8);
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42 = v10;
  v43 = v10;
  v40 = v10;
  v41 = v10;
  v38 = v10;
  v39 = v10;
  *(_OWORD *)v36 = v10;
  v37 = v10;
  v26 = -1431655766;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickReadNonce())
    return 3;
  v11 = operator new(0x10uLL);
  v12 = (v26 + 7) >> 3;
  *v11 = off_24CE848F8;
  v11[1] = CFDataCreate(v9, v36, v12);
  v13 = a3[1];
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  a3[1] = v11;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v14;
  v35 = v14;
  v32 = v14;
  v33 = v14;
  v30 = v14;
  v31 = v14;
  v28 = v14;
  v29 = v14;
  v25 = (BBUEURPersonalizationParameters::EURChipID *)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickReadSerialNumberAndChipID())
    return 3;
  v15 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)&v28, (const unsigned __int8 *)HIDWORD(v25));
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 16))(a3, v15);
  v16 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)v25);
  v17 = a3[2];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  a3[2] = v16;
  HIDWORD(v25) = 0;
  (*(void (**)(_QWORD *, char *, _QWORD))(*a3 + 32))(a3, (char *)&v25 + 4, 0);
  if (HIDWORD(v25) != 3)
    return 0;
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28 = v18;
  v29 = v18;
  if ((ETLMaverickManifestStatusInit() & 1) != 0)
  {
    v19 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, __int128 *))(*(_QWORD *)a1 + 208))(a1, a2, a3, &v28);
    ETLMaverickManifestStatusFree();
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      v19 = 19;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return v19;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v19 = 19;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return v19;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v21 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v21, "", "Failed to allocate space for manifest_status\n", v22, v23, v24, (char)v25);
    }
  }
  return v19;
}

uint64_t BBUEURInitializer::overridePersonalizationParameters(BBUFeedback **this, BBUPersonalizationParameters *a2, const __CFDictionary *a3)
{
  CFTypeID v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  BBUFeedback *v10;
  int v11;
  int v12;
  CFTypeID v13;
  void *v14;
  _QWORD *v15;
  BBUFeedback *v16;
  const char *v17;
  CFTypeID v18;
  void *v19;
  _QWORD *v20;
  BBUFeedback *v21;
  const char *v22;
  CFTypeID v23;
  const __CFData *v24;
  const __CFData **v25;
  uint64_t v26;
  BBUFeedback *v27;
  void **v28;
  void *__p[2];
  char v31;
  void *value;

  value = (void *)0xAAAAAAAAAAAAAAAALL;
  BBUFeedback::handleComment(this[1], "Overriding with preflight information:");
  if (CFDictionaryGetValueIfPresent(a3, CFSTR("ChipID"), (const void **)&value))
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v7 = value;
      v8 = operator new(0x10uLL);
      *v8 = off_24CE84988;
      v8[1] = v7;
      CFRetain(v7);
      v9 = *((_QWORD *)a2 + 2);
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      *((_QWORD *)a2 + 2) = v8;
      v10 = this[1];
      v11 = (*(uint64_t (**)(_QWORD *))(*v8 + 24))(v8);
      v12 = (*(uint64_t (**)(_QWORD *))(*v8 + 24))(v8);
      BBUFeedback::handleComment(v10, "   ChipID: %u (0x%08x)", v11, v12);
    }
  }
  if (!CFDictionaryGetValueIfPresent(a3, CFSTR("ChipSerialNo"), (const void **)&value))
    goto LABEL_12;
  v13 = CFGetTypeID(value);
  if (v13 != CFDataGetTypeID())
    goto LABEL_12;
  v14 = value;
  v15 = operator new(0x10uLL);
  *v15 = off_24CE84928;
  v15[1] = v14;
  CFRetain(v14);
  (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a2 + 16))(a2, v15);
  v16 = this[1];
  (*(void (**)(void **__return_ptr, _QWORD *))(*v15 + 24))(__p, v15);
  v17 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
  BBUFeedback::handleComment(v16, "   ChipSerialNo: %s", v17);
  if (v31 < 0)
  {
    operator delete(__p[0]);
    if (!CFDictionaryGetValueIfPresent(a3, CFSTR("CertHash"), (const void **)&value))
      goto LABEL_20;
  }
  else
  {
LABEL_12:
    if (!CFDictionaryGetValueIfPresent(a3, CFSTR("CertHash"), (const void **)&value))
      goto LABEL_20;
  }
  v18 = CFGetTypeID(value);
  if (v18 == CFDataGetTypeID())
  {
    v19 = value;
    v20 = operator new(0x10uLL);
    *v20 = off_24CE84A18;
    v20[1] = v19;
    CFRetain(v19);
    (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a2 + 24))(a2, v20);
    v21 = this[1];
    (*(void (**)(void **__return_ptr, _QWORD *))(*v20 + 24))(__p, v20);
    v22 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
    BBUFeedback::handleComment(v21, "   CertHash: %s", v22);
    if (v31 < 0)
      operator delete(__p[0]);
  }
LABEL_20:
  if (CFDictionaryGetValueIfPresent(a3, CFSTR("Nonce"), (const void **)&value))
  {
    v23 = CFGetTypeID(value);
    if (v23 == CFDataGetTypeID())
    {
      v24 = (const __CFData *)value;
      v25 = (const __CFData **)operator new(0x10uLL);
      *v25 = (const __CFData *)off_24CE848F8;
      v25[1] = v24;
      CFRetain(v24);
      v26 = *((_QWORD *)a2 + 1);
      if (v26)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
      *((_QWORD *)a2 + 1) = v25;
      v27 = this[1];
      BBUEURPersonalizationParameters::EURNonce::getAsString(v25, (const __CFData *)__p);
      if (v31 >= 0)
        v28 = __p;
      else
        v28 = (void **)__p[0];
      BBUFeedback::handleComment(v27, "   Nonce: %s", (const char *)v28);
      if (v31 < 0)
        operator delete(__p[0]);
    }
  }
  return 0;
}

void sub_212B2F944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::gatherProvisioningParameters(BBUFeedback **a1, capabilities::euicc *a2, uint64_t a3)
{
  uint64_t result;

  result = (*((uint64_t (**)(BBUFeedback **))*a1 + 33))(a1);
  if (!(_DWORD)result)
  {
    result = (*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 31))(a1, a2, a3);
    if (!(_DWORD)result)
    {
      result = (*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 32))(a1, a2, a3);
      if (!(_DWORD)result)
      {
        if (eUICC::getEID(a2, a3, a1[1]) == 126)
          return 126;
        else
          return 0;
      }
    }
  }
  return result;
}

uint64_t BBUEURInitializer::getProvisioningStatus(BBUFeedback **a1, uint64_t a2, uint64_t a3, _BYTE *a4, BOOL *a5)
{
  __int128 v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  BBUFeedback *v18;
  const char *StateAsString;
  char v21;
  _OWORD v22[2];
  uint64_t v23;

  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v10;
  v22[1] = v10;
  *a4 = 1;
  v23 = 0;
  if ((ETLMaverickManifestStatusInit() & 1) != 0)
  {
    if ((*((unsigned int (**)(BBUFeedback **, uint64_t, uint64_t, _OWORD *))*a1 + 26))(a1, a2, a3, v22))
    {
      v11 = 0;
      HIDWORD(v23) = 4;
      *a5 = 0;
    }
    else if (ETLProvisionParseStatus())
    {
      v16 = HIDWORD(v23);
      LOBYTE(v23) = HIDWORD(v23) == 1;
      switch(HIDWORD(v23))
      {
        case 0:
        case 2:
          goto LABEL_11;
        case 1:
          *a4 = 0;
LABEL_11:
          *a5 = v16 != 2;
          BBUFeedback::handleComment(a1[1], "mature");
          v17 = WORD4(v22[0]);
          if (!WORD4(v22[0]))
            goto LABEL_18;
          goto LABEL_17;
        case 3:
          *a5 = 0;
          v17 = WORD4(v22[0]);
          if (WORD4(v22[0]))
            goto LABEL_17;
          goto LABEL_18;
        default:
          *a5 = 0;
          BBUFeedback::handleComment(a1[1], "bringup");
          v17 = WORD4(v22[0]);
          if (!WORD4(v22[0]))
            goto LABEL_18;
LABEL_17:
          v18 = a1[1];
          StateAsString = (const char *)ETLProvisionGetStateAsString();
          BBUFeedback::handleComment(v18, "Provision manifest status:%u => state %s(%u), mismatched %u", v17, StateAsString, HIDWORD(v23), v23);
LABEL_18:
          v11 = 0;
          break;
      }
    }
    else
    {
      v11 = 3;
    }
    ETLMaverickManifestStatusFree();
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      v11 = 19;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return v11;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v11 = 19;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return v11;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v12 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
      _BBULog(4, 0, v12, "", "Failed to allocate space for manifest_status\n", v13, v14, v15, v21);
    }
  }
  return v11;
}

uint64_t BBUEURInitializer::gatherManifestInfo(BBUFeedback **a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;
  _QWORD *v10;
  capabilities::updater *v11;
  int DigestType;
  unsigned int v13;
  unsigned int v14;
  CFIndex v15;
  int v16;
  void **v17;
  void **v18;
  void **v19;
  void **v20;
  void **v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  const UInt8 *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  void *__p[3];

  BBUFeedback::handleComment(a1[1], "Getting manifest information from BB");
  (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
  if (!ETLMaverickGetManifestStatus())
  {
    BBUFeedback::handleComment(a1[1], "Failed getting manifest status");
    return 3;
  }
  v7 = 0;
  switch(*(_WORD *)(a4 + 8))
  {
    case 0:
    case 0x40:
      break;
    case 4:
    case 0xF:
      v7 = 1;
      break;
    case 6:
    case 0x1C:
    case 0x1D:
      v7 = 2;
      break;
    default:
      v7 = 3;
      break;
  }
  v9 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)v7);
  v10 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 8));
  v31 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 12));
  v32 = BBUEURPersonalizationParameters::EURKeyStatus::createFromKeyStatus((BBUEURPersonalizationParameters::EURKeyStatus *)*(unsigned __int16 *)(a4 + 10));
  BBUFeedback::handleComment(a1[1], "Manifest status: \n\t\t\t  provision_status   : %u\n \t\t\t  fatp_cal_status    : %u\n \t\t\t  calibration_status : %u", *(unsigned __int16 *)(a4 + 8), *(unsigned __int16 *)(a4 + 10), *(unsigned __int16 *)(a4 + 12));
  DigestType = capabilities::updater::getDigestType(v11);
  if (DigestType == 2)
    v13 = 48;
  else
    v13 = 0;
  v14 = DigestType - 1;
  if (DigestType == 1)
    v15 = 32;
  else
    v15 = v13;
  if (!(_DWORD)v15)
    goto LABEL_52;
  v16 = DigestType;
  memset(__p, 170, sizeof(__p));
  ctu::hex(*(ctu **)(a4 + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0)
    v17 = __p;
  else
    v17 = (void **)__p[0];
  BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 0, (const char *)v17);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if (v14 > 1)
      goto LABEL_33;
  }
  else if (v14 > 1)
  {
    goto LABEL_33;
  }
  memset(__p, 170, sizeof(__p));
  ctu::hex((ctu *)(*(_QWORD *)(a4 + 16) + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0)
    v18 = __p;
  else
    v18 = (void **)__p[0];
  BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 16, (const char *)v18);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if (v16 != 2)
      goto LABEL_33;
LABEL_28:
    memset(__p, 170, sizeof(__p));
    ctu::hex((ctu *)(*(_QWORD *)(a4 + 16) + 32), (const void *)0x10);
    if (SHIBYTE(__p[2]) >= 0)
      v19 = __p;
    else
      v19 = (void **)__p[0];
    BBUFeedback::handleComment(a1[1], "  skey_hash    [0x%02x]: %s", 32, (const char *)v19);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    goto LABEL_33;
  }
  operator delete(__p[0]);
  if (v16 == 2)
    goto LABEL_28;
LABEL_33:
  memset(__p, 170, sizeof(__p));
  ctu::hex(*(ctu **)(a4 + 24), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0)
    v20 = __p;
  else
    v20 = (void **)__p[0];
  BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 0, (const char *)v20);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if (v14 > 1)
      goto LABEL_52;
  }
  else if (v14 > 1)
  {
    goto LABEL_52;
  }
  memset(__p, 170, sizeof(__p));
  ctu::hex((ctu *)(*(_QWORD *)(a4 + 24) + 16), (const void *)0x10);
  if (SHIBYTE(__p[2]) >= 0)
    v21 = __p;
  else
    v21 = (void **)__p[0];
  BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 16, (const char *)v21);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if (v16 != 2)
      goto LABEL_52;
LABEL_47:
    memset(__p, 170, sizeof(__p));
    ctu::hex((ctu *)(*(_QWORD *)(a4 + 24) + 32), (const void *)0x10);
    if (SHIBYTE(__p[2]) >= 0)
      v22 = __p;
    else
      v22 = (void **)__p[0];
    BBUFeedback::handleComment(a1[1], "  ckey_hash    [0x%02x]: %s", 32, (const char *)v22);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    goto LABEL_52;
  }
  operator delete(__p[0]);
  if (v16 == 2)
    goto LABEL_47;
LABEL_52:
  v23 = a3[6];
  if (v23)
    (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  a3[6] = v9;
  v24 = a3[8];
  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
  a3[8] = v10;
  v25 = a3[9];
  if (v25)
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  a3[9] = v31;
  v26 = a3[10];
  if (v26)
    (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  a3[10] = v32;
  v27 = *(unsigned __int16 *)(a4 + 8);
  if (v27 <= 0xF && ((1 << v27) & 0x8011) != 0)
  {
    v28 = *(const UInt8 **)(a4 + 16);
    v29 = operator new(0x10uLL);
    *v29 = off_24CE849E8;
    v29[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v28, v15);
    v30 = a3[7];
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
    result = 0;
    a3[7] = v29;
  }
  else
  {
    BBUFeedback::handleComment(a1[1], "BB has no provisioning manifest");
    return 0;
  }
  return result;
}

void sub_212B300C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::pingAndCheckForResponse(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;

  v17 = 0;
  v2 = TelephonyUtilSystemMachTime();
  do
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 192))(a1);
    if ((ETLMaverickGetBasebandInitStatusEx() & 1) == 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        result = 3;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
          return result;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        result = 3;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
          return result;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v8 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(4, 0, v8, "", "Fail to read BB Init Status: I/O error\n", v9, v10, v11, v16);
        return 3;
      }
      return result;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        goto LABEL_2;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        goto LABEL_2;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v3 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v3, "", "BB Init status: not ready\n", v4, v5, v6, v16);
    }
LABEL_2:
    usleep(0x186A0u);
  }
  while ((unint64_t)(TelephonyUtilSystemMachTime() - v2) <= 0x1388);
  if (gBBULogMaskGet(void)::once == -1)
  {
    result = 40;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return result;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    result = 40;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return result;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v12, "", "Timeout on waiting for BB Init status\n", v13, v14, v15, v16);
    return 40;
  }
  return result;
}

void sub_212B303AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BBUEURInitializer::fusingCheck(BBUFeedback **a1)
{
  capabilities::updater *FusingStatus;

  BBUFeedback::handleBeginQuickStep(a1[1], "Fusing check");
  (*((void (**)(BBUFeedback **))*a1 + 25))(a1);
  FusingStatus = (capabilities::updater *)ETLMaverickGetFusingStatus();
  if ((_DWORD)FusingStatus)
    capabilities::updater::shouldAllowUnfused(FusingStatus);
  (*(void (**)(BBUFeedback *, uint64_t))(*(_QWORD *)a1[1] + 24))(a1[1], 24);
  return 24;
}

uint64_t BBUEURInitializer::getIMEI(capabilities::updater *a1, uint64_t a2, std::string **a3)
{
  std::string *v5;
  size_t v6;
  size_t v7;
  __int128 *v8;
  std::string *v9;
  size_t v10;
  size_t v11;
  __int128 *v12;
  uint64_t v13;
  uint64_t v14;
  std::string *v15;
  uint64_t v16;
  uint64_t v17;
  std::string *v18;
  void *v19;
  std::string *v20;
  size_t v21;
  size_t v22;
  __int128 *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  std::string *v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  char __s[16];
  unint64_t v39;
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if ((capabilities::updater::supportsDualIMEIProvision(a1) & 1) == 0)
  {
    v39 = 0xAAAAAAAAAAAAAAAALL;
    v40 = -86;
    (*(void (**)(capabilities::updater *))(*(_QWORD *)a1 + 200))(a1);
    if (!ETLGSMGetIMEI())
      return 30;
    if (!ETLGSMIsValidIMEI())
      return 0;
    memset(__s, 170, sizeof(__s));
    if (!ETLGSMMakeStringFromIMEI())
      return 11;
    v9 = (std::string *)operator new(0x18uLL);
    v10 = strlen(__s);
    if (v10 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v11 = v10;
    if (v10 >= 0x17)
    {
      v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17)
        v16 = v10 | 7;
      v17 = v16 + 1;
      v12 = (__int128 *)operator new(v16 + 1);
      *((_QWORD *)&v30 + 1) = v11;
      v31 = v17 | 0x8000000000000000;
      *(_QWORD *)&v30 = v12;
    }
    else
    {
      HIBYTE(v31) = v10;
      v12 = &v30;
      if (!v10)
      {
LABEL_27:
        *((_BYTE *)v12 + v11) = 0;
        if (SHIBYTE(v31) < 0)
        {
          v25 = (void *)v30;
          std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
          operator delete(v25);
          v18 = *a3;
          if (!*a3)
          {
LABEL_48:
            *a3 = v9;
            return 0;
          }
        }
        else
        {
          *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v30;
          v9->__r_.__value_.__r.__words[2] = v31;
          v18 = *a3;
          if (!*a3)
            goto LABEL_48;
        }
        if (SHIBYTE(v18->__r_.__value_.__r.__words[2]) < 0)
          operator delete(v18->__r_.__value_.__l.__data_);
        operator delete(v18);
        goto LABEL_48;
      }
    }
    memcpy(v12, __s, v11);
    goto LABEL_27;
  }
  v39 = 0xAAAAAAAAAAAAAAAALL;
  v40 = -86;
  v35 = -86;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v33 = -86;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(capabilities::updater *))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickGetIMEI())
    return 30;
  v39 = v34;
  v40 = v35;
  if (!ETLGSMIsValidIMEI())
    goto LABEL_35;
  memset(__s, 170, sizeof(__s));
  if (!ETLGSMMakeStringFromIMEI())
    return 11;
  v5 = (std::string *)operator new(0x18uLL);
  v6 = strlen(__s);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v13 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v13 = v6 | 7;
    v14 = v13 + 1;
    v8 = (__int128 *)operator new(v13 + 1);
    *((_QWORD *)&v30 + 1) = v7;
    v31 = v14 | 0x8000000000000000;
    *(_QWORD *)&v30 = v8;
    goto LABEL_19;
  }
  HIBYTE(v31) = v6;
  v8 = &v30;
  if (v6)
LABEL_19:
    memcpy(v8, __s, v7);
  *((_BYTE *)v8 + v7) = 0;
  if ((SHIBYTE(v31) & 0x80000000) == 0)
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v30;
    v5->__r_.__value_.__r.__words[2] = v31;
    v15 = *a3;
    if (!*a3)
      goto LABEL_34;
LABEL_31:
    if (SHIBYTE(v15->__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15->__r_.__value_.__l.__data_);
    operator delete(v15);
    goto LABEL_34;
  }
  v19 = (void *)v30;
  std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
  operator delete(v19);
  v15 = *a3;
  if (*a3)
    goto LABEL_31;
LABEL_34:
  *a3 = v5;
LABEL_35:
  (*(void (**)(capabilities::updater *))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickGetIMEI())
    return 30;
  v36 = v32;
  v37 = v33;
  if (ETLGSMIsValidIMEI())
  {
    memset(__s, 170, sizeof(__s));
    if (ETLGSMMakeStringFromIMEI())
    {
      v20 = (std::string *)operator new(0x18uLL);
      v21 = strlen(__s);
      if (v21 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v22 = v21;
      if (v21 >= 0x17)
      {
        v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v21 | 7) != 0x17)
          v26 = v21 | 7;
        v27 = v26 + 1;
        v23 = (__int128 *)operator new(v26 + 1);
        *((_QWORD *)&v30 + 1) = v22;
        v31 = v27 | 0x8000000000000000;
        *(_QWORD *)&v30 = v23;
      }
      else
      {
        HIBYTE(v31) = v21;
        v23 = &v30;
        if (!v21)
          goto LABEL_53;
      }
      memcpy(v23, __s, v22);
LABEL_53:
      *((_BYTE *)v23 + v22) = 0;
      if (SHIBYTE(v31) < 0)
      {
        v28 = (void *)v30;
        std::string::__init_copy_ctor_external(v20, (const std::string::value_type *)v30, *((std::string::size_type *)&v30 + 1));
        operator delete(v28);
      }
      else
      {
        *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v30;
        v20->__r_.__value_.__r.__words[2] = v31;
      }
      v29 = a3[1];
      if (v29)
      {
        if (SHIBYTE(v29->__r_.__value_.__r.__words[2]) < 0)
          operator delete(v29->__r_.__value_.__l.__data_);
        operator delete(v29);
      }
      a3[1] = v20;
      return 0;
    }
    return 11;
  }
  return 0;
}

void sub_212B30900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B30920(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B3093C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B30950(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B30964(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::getMEID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  std::string *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 __dst;
  unint64_t v14;
  _DWORD v15[2];
  char __s[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)((char *)v15 + 3) = -1431655766;
  v15[0] = -1431655766;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLCDMAGetMEID())
    return 29;
  result = ETLCDMAIsValidMEID();
  if ((_DWORD)result)
  {
    memset(__s, 170, 15);
    if (!ETLCDMAMakeStringFromMEID())
      return 11;
    v5 = (std::string *)operator new(0x18uLL);
    v6 = strlen(__s);
    if (v6 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = v6;
    if (v6 >= 0x17)
    {
      v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17)
        v9 = v6 | 7;
      v10 = v9 + 1;
      p_dst = (__int128 *)operator new(v9 + 1);
      *((_QWORD *)&__dst + 1) = v7;
      v14 = v10 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v14) = v6;
      p_dst = &__dst;
      if (!v6)
      {
LABEL_15:
        *((_BYTE *)p_dst + v7) = 0;
        if (SHIBYTE(v14) < 0)
        {
          v12 = (void *)__dst;
          std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)__dst, *((std::string::size_type *)&__dst + 1));
          operator delete(v12);
          v11 = *(_QWORD *)(a3 + 16);
          if (!v11)
          {
LABEL_22:
            result = 0;
            *(_QWORD *)(a3 + 16) = v5;
            return result;
          }
        }
        else
        {
          *(_OWORD *)&v5->__r_.__value_.__l.__data_ = __dst;
          v5->__r_.__value_.__r.__words[2] = v14;
          v11 = *(_QWORD *)(a3 + 16);
          if (!v11)
            goto LABEL_22;
        }
        if (*(char *)(v11 + 23) < 0)
          operator delete(*(void **)v11);
        operator delete((void *)v11);
        goto LABEL_22;
      }
    }
    memcpy(p_dst, __s, v7);
    goto LABEL_15;
  }
  return result;
}

void sub_212B30B38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B30B54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::getCarrierID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string *v4;
  size_t v5;
  size_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  char __s[8];

  *(_QWORD *)__s = 0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
  if (!ETLMaverickGetCarrierID())
    return 32;
  v4 = (std::string *)operator new(0x18uLL);
  v5 = strlen(__s);
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v6 = v5;
  if (v5 >= 0x17)
  {
    v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v10 = v5 | 7;
    v11 = v10 + 1;
    v7 = (__int128 *)operator new(v10 + 1);
    *((_QWORD *)&v13 + 1) = v6;
    v14 = v11 | 0x8000000000000000;
    *(_QWORD *)&v13 = v7;
  }
  else
  {
    HIBYTE(v14) = v5;
    v7 = &v13;
    if (!v5)
    {
      LOBYTE(v13) = 0;
      if ((SHIBYTE(v14) & 0x80000000) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  memcpy(v7, __s, v6);
  *((_BYTE *)v7 + v6) = 0;
  if ((SHIBYTE(v14) & 0x80000000) == 0)
  {
LABEL_6:
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v13;
    v4->__r_.__value_.__r.__words[2] = v14;
    v8 = *(_QWORD *)(a3 + 48);
    if (!v8)
      goto LABEL_17;
LABEL_14:
    if (*(char *)(v8 + 23) < 0)
      operator delete(*(void **)v8);
    operator delete((void *)v8);
    goto LABEL_17;
  }
LABEL_13:
  v12 = (void *)v13;
  std::string::__init_copy_ctor_external(v4, (const std::string::value_type *)v13, *((std::string::size_type *)&v13 + 1));
  operator delete(v12);
  v8 = *(_QWORD *)(a3 + 48);
  if (v8)
    goto LABEL_14;
LABEL_17:
  result = 0;
  *(_QWORD *)(a3 + 48) = v4;
  return result;
}

void sub_212B30D18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B30D34(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEURInitializer::queryChipInfoBooted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  capabilities::updater *v7;
  uint64_t SerialNumberAndChipID;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  CFIndex v12;
  _QWORD *v13;
  BBUFeedback *v14;
  void **v15;
  int v16;
  int v17;
  int v18;
  const char *v19;
  BBUFeedback *v20;
  void **v21;
  BBUFeedback *v22;
  int v23;
  BOOL v28;
  BBUFeedback *v29;
  int v30;
  uint64_t result;
  void *__p[2];
  char v33;
  unsigned int v34;
  BBUEURPersonalizationParameters::EURChipID *v35;
  uint64_t v36;
  uint64_t v37;
  UInt8 bytes[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[8];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  v37 = 0;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[6] = v6;
  v46[7] = v6;
  v46[4] = v6;
  v46[5] = v6;
  v46[2] = v6;
  v46[3] = v6;
  v46[0] = v6;
  v46[1] = v6;
  v35 = (BBUEURPersonalizationParameters::EURChipID *)0xAAAAAAAAAAAAAAAALL;
  v44 = v6;
  v45 = v6;
  v43 = v6;
  v41 = v6;
  v42 = v6;
  v39 = v6;
  v40 = v6;
  *(_OWORD *)bytes = v6;
  v34 = -1431655766;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Querying chip info from booted baseband");
  if (!a2 || !a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "missing parameter");
    return 2;
  }
  capabilities::updater::personalizationCommandTimeout(v7);
  SerialNumberAndChipID = ETLMaverickReadSerialNumberAndChipID();
  if ((SerialNumberAndChipID & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading snum and/or chipID from booted baseband over ETL");
    return 18;
  }
  capabilities::updater::personalizationCommandTimeout((capabilities::updater *)SerialNumberAndChipID);
  if ((ETLMaverickReadPublicKeyHash() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading PKHash from booted baseband over ETL");
    return 18;
  }
  v9 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)v46, (const unsigned __int8 *)HIDWORD(v35));
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 16))(a3, v9);
  v10 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)v35);
  v11 = *(_QWORD *)(a3 + 16);
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  *(_QWORD *)(a3 + 16) = v10;
  v12 = v34;
  v13 = operator new(0x10uLL);
  *v13 = off_24CE84A18;
  v13[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v12);
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 24))(a3, v13);
  if (!v9)
    goto LABEL_18;
  v14 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, _QWORD *))(*v9 + 24))(__p, v9);
  if (v33 >= 0)
    v15 = __p;
  else
    v15 = (void **)__p[0];
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_13;
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_13;
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_13:
  v16 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
  v17 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
  v18 = (*(uint64_t (**)(_QWORD *))(*v10 + 24))(v10);
  if (v16 | v17)
    v19 = (const char *)v15;
  else
    v19 = "<< SNUM >>";
  BBUFeedback::handleComment(v14, "   SNUM: 0x%s / CHIPID: 0x%08x", v19, v18);
  if (v33 < 0)
    operator delete(__p[0]);
LABEL_18:
  v20 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, _QWORD *))(*v13 + 24))(__p, v13);
  if (v33 >= 0)
    v21 = __p;
  else
    v21 = (void **)__p[0];
  BBUFeedback::handleComment(v20, "   PUBLIC_KEY_HASH: 0x%s", (const char *)v21);
  if (v33 < 0)
    operator delete(__p[0]);
  v22 = *(BBUFeedback **)(a1 + 8);
  v23 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a3 + 24) + 24))(*(_QWORD *)(a3 + 24));
  BBUFeedback::handleComment(v22, "   CertID: %u", v23);
  v28 = *(_QWORD *)bytes == 0x654619F356EE0ED4
     && *(_QWORD *)&bytes[8] == 0x4A726792A3094157
     && (_QWORD)v39 == 0x76CB53CD344194E7
     && *((_QWORD *)&v39 + 1) == 0x557949403C3D297ELL
     && (_QWORD)v40 == 0x32B99FF19458ABCLL
     && *((_QWORD *)&v40 + 1) == 0x87AC155035C6AD1FLL;
  v29 = *(BBUFeedback **)(a1 + 8);
  if (v28)
  {
    BBUFeedback::handleComment(v29, "   Detected as unfused BB\n");
    v30 = 1;
  }
  else
  {
    BBUFeedback::handleComment(v29, "   Detected as fused BB\n");
    v30 = 3;
  }
  result = 0;
  *(_DWORD *)(a3 + 88) = v30;
  return result;
}

void sub_212B3116C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20)
{
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  _Unwind_Resume(a1);
}

const char *BBUEURInitializer::getDebugName(BBUEURInitializer *this)
{
  return "BBUEURInitializer";
}

uint64_t __cxx_global_var_init_61()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_212A4D000);
  }
  return result;
}

void BBUICEEBLImage::~BBUICEEBLImage(BBUICEEBLImage *this)
{
  uint64_t v1;

  *(_QWORD *)this = off_24CE85510;
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

{
  uint64_t v2;

  *(_QWORD *)this = off_24CE85510;
  v2 = *((_QWORD *)this + 2);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(this);
}

uint64_t BBUICEEBLImage::getWritePayloadData(BBUICEEBLImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  uint64_t result;
  void *exception;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;

  if ((*(unsigned int (**)(BBUICEEBLImage *))(*(_QWORD *)this + 32))(this) <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x20u, (ctu::LogMessageBuffer *)"Assertion failure(( offset < getWritePayloadLength()) && \"Error: Chunk size is not sufficient to write payload data of the EBL image.\")", v10, v11, v12, v19);
    goto LABEL_8;
  }
  v20 = -1431655766;
  result = (*(uint64_t (**)(_QWORD, unsigned __int8 *, uint64_t, int *, _QWORD))(**((_QWORD **)this + 2) + 16))(*((_QWORD *)this + 2), a2, a3, &v20, *((_DWORD *)this + 2) + a4);
  if ((_DWORD)result)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x23u, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy EBL image payload data to buffer!\")", v13, v14, v15, v19);
    goto LABEL_8;
  }
  if (v20 != (_DWORD)a3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 82, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEEBLImage.cpp", 0x24u, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy EBL image payload data to buffer!\")", v16, v17, v18, v19);
LABEL_8:
  }
  return result;
}

void sub_212B313A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B313BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B313D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const char *BBUICEEBLImage::getName(BBUICEEBLImage *this)
{
  return "EBL";
}

uint64_t BBUICEEBLImage::getWritePayloadLength(BBUICEEBLImage *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 2);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t BBUICEEBLImage::getOpenPayloadData(BBUICEEBLImage *this)
{
  return 0;
}

uint64_t BBUICEEBLImage::getOpenPayloadLength(BBUICEEBLImage *this)
{
  return 0;
}

void BBUICEEBLImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3)
      BBUDataSource::generateHash(v3, a2, a3);
  }
}

void BBUUpdateSource::~BBUUpdateSource(BBUUpdateSource *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  *(_QWORD *)this = &unk_24CE85578;
  v2 = *((_QWORD *)this + 3);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 5);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 6);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 7);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = (const void *)*((_QWORD *)this + 2);
  if (v6)
    CFRelease(v6);
}

BBUEUR10UpdateSource *BBUUpdateSource::createFromZipFile(BBUUpdateSource *this, BBUZipFile *a2, BBUFeedback *a3)
{
  char v3;
  BBUEUR10UpdateSource *v6;
  unsigned int v7;
  BBUEUR10UpdateSource *result;
  BBUEUR10UpdateSource *v9;
  char *v10;
  unsigned int v11;
  void *exception;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = (char)a3;
  switch(capabilities::updater::getUpdateSourceType(this))
  {
    case 0u:
      v6 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v6, this, v7, a2);
      goto LABEL_3;
    case 1u:
      v9 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v9, this, 0, a2);
      goto LABEL_7;
    case 2u:
      v9 = (BBUEUR10UpdateSource *)operator new(0x1A0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v9, this, 0, a2);
LABEL_7:
      *(_QWORD *)v9 = v10 + 16;
      return v9;
    case 3u:
      v6 = (BBUEUR10UpdateSource *)operator new(0x1B0uLL);
      BBUEUR10UpdateSource::BBUEUR10UpdateSource(v6, this, 0, a2);
      *(_QWORD *)v6 = &off_24CE7FD88;
      *((_QWORD *)v6 + 52) = 0;
      *((_BYTE *)v6 + 424) = v3;
      BBUEUR20UpdateSource::init(v6);
      goto LABEL_3;
    case 4u:
      v6 = (BBUEUR10UpdateSource *)operator new(0x150uLL);
      BBUICE16UpdateSource::BBUICE16UpdateSource(v6, this, v11, a2);
LABEL_3:
      result = v6;
      break;
    case 5u:
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x41u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v13, v14, v15, v16);
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_212B3164C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B31660(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B31674(_Unwind_Exception *a1)
{
  BBUEUR10UpdateSource *v1;
  void *v3;

  BBUEUR10UpdateSource::~BBUEUR10UpdateSource(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_212B3168C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B316A0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B316B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B316C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *BBUUpdateSource::createFromFolder(__int128 *a1, uint64_t a2, char a3)
{
  capabilities::updater *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  void *exception;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v6 = (capabilities::updater *)ctu::fs::file_exists();
  if ((_DWORD)v6)
  {
    switch(capabilities::updater::getUpdateSourceType(v6))
    {
      case 0u:
        v7 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v7, a1, v8, a2);
        return v7;
      case 1u:
        v10 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v10, a1, 0, a2);
        goto LABEL_8;
      case 2u:
        v10 = operator new(0x1A0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v10, a1, 0, a2);
LABEL_8:
        *v10 = v11 + 16;
        return v10;
      case 3u:
        v7 = operator new(0x1B0uLL);
        BBUEUR10UpdateSource::BBUEUR10UpdateSource((uint64_t)v7, a1, 0, a2);
        *v7 = &off_24CE7FD88;
        v7[52] = 0;
        *((_BYTE *)v7 + 424) = a3;
        BBUEUR20UpdateSource::init((BBUEUR20UpdateSource *)v7);
        return v7;
      case 4u:
        v7 = operator new(0x150uLL);
        BBUICE16UpdateSource::BBUICE16UpdateSource((BBUICE16UpdateSource *)v7, a1, v12, a2);
        return v7;
      case 5u:
        exception = __cxa_allocate_exception(0x210uLL);
        _BBUException::_BBUException((uint64_t)exception, 87, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x5Eu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio type.\")", v14, v15, v16, v17);
      default:
        return 0;
    }
  }
  return 0;
}

void sub_212B31888(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3189C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B318B0(_Unwind_Exception *a1)
{
  BBUEUR10UpdateSource *v1;
  void *v3;

  BBUEUR10UpdateSource::~BBUEUR10UpdateSource(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_212B318C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B318DC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B318F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B31904(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void BBUUpdateSource::loadOptions(uint64_t a1, CFDataRef *a2)
{
  uint64_t (*v2)(uint64_t);
  CFPropertyListRef v4;
  CFPropertyListRef v5;
  CFTypeID v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  char v12;

  if (*(_QWORD *)(a1 + 16))
    v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  else
    v2 = 0;
  if (!v2)
  {
    v4 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], *a2, 0, 0, 0);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 != CFDictionaryGetTypeID())
        v5 = 0;
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
          goto LABEL_11;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_11:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            v7 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v7, "", "Loaded Options\n", v8, v9, v10, v12);
          }
        }
      }
      v11 = *(const void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;
      if (v11)
        CFRelease(v11);
    }
  }
}

uint64_t BBUUpdateSource::prepareRemoteData(uint64_t a1, uint64_t a2, uint64_t a3, char a4, const void *a5, int a6)
{
  char *v8;
  uint64_t v9;
  BBUFeedback *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v16;
  uint64_t (*v17)(uint64_t);
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  ctu::cf *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void **v32;
  const char *v33;
  ctu::cf *v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const void **v39;
  const char *v40;
  ctu::cf *v41;
  const void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const void **v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  capabilities::updater *v56;
  __CFDictionary *v57;
  uint64_t (*v58)(uint64_t);
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  ctu::cf *v68;
  const void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const void **v73;
  const char *v74;
  ctu::cf *v75;
  const void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const void **v80;
  const char *v81;
  ctu::cf *v82;
  const void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const void **v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const void *v92;
  capabilities::updater *v93;
  __CFDictionary *v94;
  uint64_t (*v95)(uint64_t);
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  ctu::cf *v105;
  const void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const void **v110;
  const char *v111;
  ctu::cf *v112;
  const void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const void **v117;
  const char *v118;
  ctu::cf *v119;
  const void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const void **v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  capabilities::updater *v133;
  uint64_t v134;
  capabilities::updater *v135;
  int v137;
  unsigned int v138;
  UInt8 *v139;
  int v140;
  int v141;
  int v142;
  char *v143;
  CFURLRef value;
  UInt8 *bytes;
  CFTypeRef v150;
  void *v151;
  __int128 v152;
  CFTypeRef v153;
  void *v154;
  __int128 v155;
  CFTypeRef cf;
  void *__p[2];
  char v158;
  void *v159;
  __int128 v160;
  capabilities::updater *v161;
  capabilities::updater *v162;
  CFMutableDictionaryRef v163;
  const void *v164[2];
  char v165;
  const void *v166;
  CFURLRef v167;
  CFStringRef v168;

  v167 = 0;
  v168 = 0;
  v166 = 0;
  if ((capabilities::updater::shouldStripFDRDataOnAP((capabilities::updater *)a1) & 1) == 0)
  {
    v143 = 0;
    value = 0;
    bytes = 0;
    v12 = 0;
    v8 = 0;
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    goto LABEL_7;
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "libFDR options setup for the new FDR flow. Note that this setup will be ignored in legacy FDR flow");
  v8 = (char *)calloc(1uLL, 0x400uLL);
  if (!v8)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Calloc for datadir path failed");
    bytes = 0;
    v11 = 0;
    v12 = 0;
    v8 = 0;
LABEL_51:
    v13 = 19;
    goto LABEL_52;
  }
  v9 = lookupPathForPersistentData();
  v10 = *(BBUFeedback **)(a1 + 8);
  if (v9)
  {
    BBUFeedback::handleComment(v10, "Failed to get datadir path; error = %ld", v9);
    bytes = 0;
    v11 = 0;
    v12 = 0;
LABEL_5:
    v13 = 15;
LABEL_52:
    v51 = a5;
    goto LABEL_198;
  }
  BBUFeedback::handleComment(v10, "FDR factory data directory: \"%s\" ", v8);
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v168 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, 0x8000100u);
  value = CFURLCreateWithFileSystemPath(v14, v168, kCFURLPOSIXPathStyle, 1u);
  v167 = value;
  v12 = (char *)calloc(1uLL, 0x400uLL);
  if (!v12)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Calloc for apticket path failed");
    bytes = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_51;
  }
  v134 = lookupPathForPersonalizedData();
  if (v134)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get apticket path; error = %ld", v134);
    bytes = 0;
    v11 = 0;
    goto LABEL_5;
  }
  if (!a5)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Using the APTicket in the FS to create the FDR option");
    v143 = (char *)operator new(0x30uLL);
    *(_QWORD *)v143 = off_24CE7FC78;
    *(_OWORD *)(v143 + 8) = 0u;
    *(_OWORD *)(v143 + 24) = 0u;
    std::string::basic_string[abi:ne180100]<0>(v164, v12);
    v137 = BBUFileDataSource::init((uint64_t)v143, (const char *)v164, 0);
    if (v165 < 0)
      operator delete((void *)v164[0]);
    if (v137)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "APTicket FileDataSource class init failed...");
      bytes = 0;
      v13 = 110;
    }
    else
    {
      v138 = (*(uint64_t (**)(char *))(*(_QWORD *)v143 + 24))(v143);
      v139 = (UInt8 *)malloc(v138);
      if (v139)
      {
        LODWORD(__p[0]) = -1431655766;
        bytes = v139;
        (*(void (**)(char *))(*(_QWORD *)v143 + 16))(v143);
        if (v138 == -1431655766)
        {
          v164[0] = CFDataCreateWithBytesNoCopy(v14, bytes, 2863311530, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
          ctu::cf::CFSharedRef<__CFData const>::operator=(&v166, v164);
          BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "MSU based APTicket Raw Path: \"%s\"", v12);
          goto LABEL_181;
        }
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Reading of APTicket content failed.");
        v13 = 112;
      }
      else
      {
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Malloc failed for APTicket content.");
        bytes = 0;
        v13 = 111;
      }
    }
    v11 = v143;
LABEL_200:
    (*(void (**)(char *))(*(_QWORD *)v11 + 8))(v11);
    goto LABEL_201;
  }
  ctu::cf::CFSharedRef<__CFData const>::operator=(&v166, a5);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Using the APTicket that is passed in as an input to the BBU for the FDR option");
  bytes = 0;
  v143 = 0;
LABEL_181:
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Is performManFlow?: Bool = %d", a6);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Now, set the options for the libFDR API (either legacy or new API function)");
LABEL_7:
  Mutable = CFDictionaryCreateMutable(v14, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = Mutable;
  v163 = Mutable;
  v17 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!Mutable)
    v17 = 0;
  if (v17)
  {
    if (capabilities::updater::shouldStripFDRDataOnAP(Mutable))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_16;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_16;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v18 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(3, 0, v18, "", "Stripping and verifying Cal FDR Data on AP\n", v19, v20, v21, v140);
      }
LABEL_16:
      if ((a6 & 1) != 0)
        goto LABEL_22;
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
          goto LABEL_19;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_19:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            v22 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v22, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v23, v24, v25, v140);
          }
        }
      }
      CFDictionaryAddValue(v16, CFSTR("CopyAllowUnsealed"), (const void *)*MEMORY[0x24BDBD270]);
LABEL_22:
      CFDictionaryAddValue(v16, CFSTR("DataDirectory"), value);
      CFDictionaryAddValue(v16, CFSTR("APTicket"), v166);
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_31;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_31;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v26 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v27 = (ctu::cf *)CFDictionaryGetValue(v16, CFSTR("CopyAllowUnsealed"));
        ctu::cf::show(v27, v28);
        if (v165 >= 0)
          v32 = v164;
        else
          LOBYTE(v32) = v164[0];
        _BBULog(3, 0, v26, "", "CAL: Set kAMFDROptionCopyAllowUnsealed: %s\n", v29, v30, v31, (char)v32);
        if (v165 < 0)
          operator delete((void *)v164[0]);
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
            goto LABEL_39;
          goto LABEL_32;
        }
      }
LABEL_31:
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_39;
LABEL_32:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v33 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v34 = (ctu::cf *)CFDictionaryGetValue(v16, CFSTR("APTicket"));
        ctu::cf::show(v34, v35);
        if (v165 >= 0)
          v39 = v164;
        else
          LOBYTE(v39) = v164[0];
        _BBULog(3, 0, v33, "", "CAL: Set kAMFDROptionApTicket: %s\n", v36, v37, v38, (char)v39);
        if (v165 < 0)
          operator delete((void *)v164[0]);
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
            goto LABEL_59;
          goto LABEL_40;
        }
      }
LABEL_39:
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_59;
LABEL_40:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v40 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v41 = (ctu::cf *)CFDictionaryGetValue(v16, CFSTR("DataDirectory"));
        ctu::cf::show(v41, v42);
        if (v165 >= 0)
          v46 = v164;
        else
          LOBYTE(v46) = v164[0];
        _BBULog(3, 0, v40, "", "CAL: Set kAMFDROptionDataDirectory: %s\n", v43, v44, v45, (char)v46);
        if (v165 < 0)
          operator delete((void *)v164[0]);
      }
      goto LABEL_59;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      {
LABEL_58:
        CFDictionaryAddValue(v16, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD270]);
        CFDictionaryAddValue(v16, CFSTR("VerifyData"), (const void *)*MEMORY[0x24BDBD268]);
        goto LABEL_59;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_58;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v52 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v52, "", "Not stripping Cal FDR Data on AP\n", v53, v54, v55, v140);
    }
    goto LABEL_58;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_59;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_59;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v47 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(3, 0, v47, "", "Failed to create dictionary for CAL FDR options\n", v48, v49, v50, v140);
  }
LABEL_59:
  v56 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v57 = v56;
  v162 = v56;
  v58 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!v56)
    v58 = 0;
  if (v58)
  {
    if (!capabilities::updater::shouldStripFDRDataOnAP(v56))
    {
      v92 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionaryAddValue(v57, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD268]);
      CFDictionaryAddValue(v57, CFSTR("VerifyData"), v92);
      CFDictionaryAddValue(v57, CFSTR("StripImg4"), (const void *)*MEMORY[0x24BDBD270]);
      goto LABEL_102;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_67;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_67;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v59 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v59, "", "Stripping and verifying PROV FDR Data on AP\n", v60, v61, v62, v140);
    }
LABEL_67:
    if ((a6 & 1) != 0)
      goto LABEL_73;
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        goto LABEL_70;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
      {
LABEL_70:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v63 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(3, 0, v63, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v64, v65, v66, v140);
        }
      }
    }
    CFDictionaryAddValue(v57, CFSTR("CopyAllowUnsealed"), (const void *)*MEMORY[0x24BDBD270]);
LABEL_73:
    CFDictionaryAddValue(v57, CFSTR("DataDirectory"), value);
    CFDictionaryAddValue(v57, CFSTR("APTicket"), v166);
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_82;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_82;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v67 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v68 = (ctu::cf *)CFDictionaryGetValue(v57, CFSTR("CopyAllowUnsealed"));
      ctu::cf::show(v68, v69);
      if (v165 >= 0)
        v73 = v164;
      else
        LOBYTE(v73) = v164[0];
      _BBULog(3, 0, v67, "", "PROV: Set kAMFDROptionCopyAllowUnsealed: %s\n", v70, v71, v72, (char)v73);
      if (v165 < 0)
        operator delete((void *)v164[0]);
      if (gBBULogMaskGet(void)::once != -1)
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_90;
        goto LABEL_83;
      }
    }
LABEL_82:
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_90;
LABEL_83:
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v74 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v75 = (ctu::cf *)CFDictionaryGetValue(v57, CFSTR("APTicket"));
      ctu::cf::show(v75, v76);
      if (v165 >= 0)
        v80 = v164;
      else
        LOBYTE(v80) = v164[0];
      _BBULog(3, 0, v74, "", "PROV: Set kAMFDROptionApTicket: %s\n", v77, v78, v79, (char)v80);
      if (v165 < 0)
        operator delete((void *)v164[0]);
      if (gBBULogMaskGet(void)::once != -1)
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_102;
        goto LABEL_91;
      }
    }
LABEL_90:
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_102;
LABEL_91:
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v81 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v82 = (ctu::cf *)CFDictionaryGetValue(v57, CFSTR("DataDirectory"));
      ctu::cf::show(v82, v83);
      if (v165 >= 0)
        v87 = v164;
      else
        LOBYTE(v87) = v164[0];
      _BBULog(3, 0, v81, "", "PROV: Set kAMFDROptionDataDirectory: %s\n", v84, v85, v86, (char)v87);
      if (v165 < 0)
        operator delete((void *)v164[0]);
    }
    goto LABEL_102;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_102;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_102;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v88 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(3, 0, v88, "", "Failed to create dictionary for PROV FDR options\n", v89, v90, v91, v140);
  }
LABEL_102:
  v93 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v94 = v93;
  v161 = v93;
  v95 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!v93)
    v95 = 0;
  if (v95)
  {
    if (capabilities::updater::shouldStripFDRDataOnAP(v93))
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_111;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_111;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v96 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(3, 0, v96, "", "Stripping and verifying Pac FDR Data on AP\n", v97, v98, v99, v140);
      }
LABEL_111:
      if ((a6 & 1) != 0)
        goto LABEL_117;
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
          goto LABEL_114;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        {
LABEL_114:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            v100 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
            _BBULog(3, 0, v100, "", "Not performManifestCheckif (set kAMFDROptionCopyAllowUnsealed = True\n", v101, v102, v103, v140);
          }
        }
      }
      CFDictionaryAddValue(v94, CFSTR("CopyAllowUnsealed"), (const void *)*MEMORY[0x24BDBD270]);
LABEL_117:
      CFDictionaryAddValue(v94, CFSTR("DataDirectory"), value);
      CFDictionaryAddValue(v94, CFSTR("APTicket"), v166);
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_126;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_126;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v104 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v105 = (ctu::cf *)CFDictionaryGetValue(v94, CFSTR("CopyAllowUnsealed"));
        ctu::cf::show(v105, v106);
        if (v165 >= 0)
          v110 = v164;
        else
          LOBYTE(v110) = v164[0];
        v93 = (capabilities::updater *)_BBULog(3, 0, v104, "", "PAC: Set kAMFDROptionCopyAllowUnsealed: %s\n", v107, v108, v109, (char)v110);
        if (v165 < 0)
          operator delete((void *)v164[0]);
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
            goto LABEL_134;
          goto LABEL_127;
        }
      }
LABEL_126:
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_134;
LABEL_127:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v111 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v112 = (ctu::cf *)CFDictionaryGetValue(v94, CFSTR("APTicket"));
        ctu::cf::show(v112, v113);
        if (v165 >= 0)
          v117 = v164;
        else
          LOBYTE(v117) = v164[0];
        v93 = (capabilities::updater *)_BBULog(3, 0, v111, "", "PAC: Set kAMFDROptionApTicket: %s\n", v114, v115, v116, (char)v117);
        if (v165 < 0)
          operator delete((void *)v164[0]);
        if (gBBULogMaskGet(void)::once != -1)
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
            goto LABEL_151;
          goto LABEL_135;
        }
      }
LABEL_134:
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_151;
LABEL_135:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v118 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        v119 = (ctu::cf *)CFDictionaryGetValue(v94, CFSTR("DataDirectory"));
        ctu::cf::show(v119, v120);
        if (v165 >= 0)
          v124 = v164;
        else
          LOBYTE(v124) = v164[0];
        v93 = (capabilities::updater *)_BBULog(3, 0, v118, "", "PAC: Set kAMFDROptionDataDirectory: %s\n", v121, v122, v123, (char)v124);
        if (v165 < 0)
          operator delete((void *)v164[0]);
      }
      goto LABEL_151;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      {
LABEL_150:
        CFDictionaryAddValue(v94, CFSTR("GetCombined"), (const void *)*MEMORY[0x24BDBD270]);
        CFDictionaryAddValue(v94, CFSTR("VerifyData"), (const void *)*MEMORY[0x24BDBD268]);
        goto LABEL_151;
      }
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_150;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v129 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(3, 0, v129, "", "Not stripping FDR Pac Data on AP\n", v130, v131, v132, v140);
    }
    goto LABEL_150;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_151;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_151;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v125 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v93 = (capabilities::updater *)_BBULog(3, 0, v125, "", "Failed to create dictionary for PAC FDR options\n", v126, v127, v128, v140);
  }
LABEL_151:
  if (*(_BYTE *)(a1 + 32))
  {
    v13 = 0;
    v51 = a5;
    v11 = v143;
    if (!v94)
      goto LABEL_194;
    goto LABEL_193;
  }
  v159 = (void *)(*(unsigned int *)"bbcl" | 0xAAAAAA0000000000);
  v160 = xmmword_212B56270;
  v165 = 3;
  LODWORD(v164[0]) = 4997443;
  capabilities::updater::CALFileName(v93);
  cf = v16;
  if (v16)
    CFRetain(v16);
  BYTE1(v140) = a6;
  LOBYTE(v140) = a4;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(_QWORD *)a1 + 216))(a1, a1 + 40, a2, &v159, v164, __p, &cf, a3, v140);
  v133 = (capabilities::updater *)cf;
  if (cf)
    CFRelease(cf);
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_160:
      if ((SHIBYTE(v160) & 0x80000000) == 0)
        goto LABEL_161;
      goto LABEL_168;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_160;
  }
  operator delete((void *)v164[0]);
  if ((SHIBYTE(v160) & 0x80000000) == 0)
  {
LABEL_161:
    if ((_DWORD)v13)
      goto LABEL_192;
    goto LABEL_169;
  }
LABEL_168:
  operator delete(v159);
  if ((_DWORD)v13)
    goto LABEL_192;
LABEL_169:
  v154 = (void *)(*(unsigned int *)"bbpv" | 0xAAAAAA0000000000);
  v155 = xmmword_212B56270;
  v165 = 4;
  strcpy((char *)v164, "PROV");
  capabilities::updater::PROVFileName(v133);
  v153 = v57;
  if (v57)
    CFRetain(v57);
  BYTE1(v141) = a6;
  LOBYTE(v141) = a4;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(_QWORD *)a1 + 216))(a1, a1 + 48, a2, &v154, v164, __p, &v153, a3, v141);
  v135 = (capabilities::updater *)v153;
  if (v153)
    CFRelease(v153);
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_175:
      if ((SHIBYTE(v155) & 0x80000000) == 0)
        goto LABEL_176;
      goto LABEL_184;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_175;
  }
  operator delete((void *)v164[0]);
  if ((SHIBYTE(v155) & 0x80000000) == 0)
  {
LABEL_176:
    if ((_DWORD)v13)
      goto LABEL_192;
    goto LABEL_185;
  }
LABEL_184:
  operator delete(v154);
  if ((_DWORD)v13)
    goto LABEL_192;
LABEL_185:
  v151 = (void *)(*(unsigned int *)"bbpc" | 0xAAAAAA0000000000);
  v152 = xmmword_212B56270;
  v165 = 3;
  LODWORD(v164[0]) = 4407632;
  capabilities::updater::PACFileName(v135);
  v150 = v94;
  if (v94)
    CFRetain(v94);
  BYTE1(v142) = a6;
  LOBYTE(v142) = a4;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void **, const void **, void **, CFTypeRef *, uint64_t, int))(*(_QWORD *)a1 + 216))(a1, a1 + 56, a2, &v151, v164, __p, &v150, a3, v142);
  if (v150)
    CFRelease(v150);
  if (v158 < 0)
  {
    operator delete(__p[0]);
    if ((v165 & 0x80000000) == 0)
    {
LABEL_191:
      if ((SHIBYTE(v152) & 0x80000000) == 0)
        goto LABEL_192;
LABEL_221:
      operator delete(v151);
      *(_BYTE *)(a1 + 32) = 1;
      v51 = a5;
      v11 = v143;
      if (!v94)
        goto LABEL_194;
      goto LABEL_193;
    }
  }
  else if ((v165 & 0x80000000) == 0)
  {
    goto LABEL_191;
  }
  operator delete((void *)v164[0]);
  if (SHIBYTE(v152) < 0)
    goto LABEL_221;
LABEL_192:
  *(_BYTE *)(a1 + 32) = 1;
  v51 = a5;
  v11 = v143;
  if (v94)
LABEL_193:
    CFRelease(v94);
LABEL_194:
  if (v57)
    CFRelease(v57);
  if (v163)
    CFRelease(v163);
LABEL_198:
  if (v51)
    goto LABEL_203;
  if (v11)
    goto LABEL_200;
LABEL_201:
  if (bytes)
    free(bytes);
LABEL_203:
  if (v8)
    free(v8);
  if (v12)
    free(v12);
  if (v166)
    CFRelease(v166);
  if (v167)
    CFRelease(v167);
  if (v168)
    CFRelease(v168);
  return v13;
}

void sub_212B32FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  uint64_t v44;

  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)(v44 - 112));
  ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef((const void **)(v44 - 104));
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef((const void **)(v44 - 96));
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFData const>::operator=(const void **a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *a1;
  *a1 = cf;
  if (v4)
    CFRelease(v4);
  return a1;
}

uint64_t BBUUpdateSource::findRemoteData(BBUFeedback **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, const std::string::value_type *a6, const void **a7, uint64_t a8, unsigned __int8 a9, char a10)
{
  BBUPartitionManager *v16;
  BBUPartitionManager *v17;
  uint64_t v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  const std::string::value_type *v27;
  std::string::size_type v28;
  std::string *v29;
  __int128 v30;
  unint64_t *v31;
  unint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const std::string::value_type *v38;
  const char *v39;
  void **v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const void **v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const std::string::value_type *v58;
  const char *v59;
  int v61;
  const char *v62;
  void **v63;
  CFTypeRef cf;
  std::string v67;
  BBUPartitionManager *v68;
  void *v69;
  std::string v70;
  void *__p[4];

  memset(__p, 170, 24);
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  v16 = (BBUPartitionManager *)off_253D31E68;
  if (!off_253D31E68)
  {
    v17 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v17);
    v18 = a8;
    v19 = operator new(0x20uLL);
    *v19 = &unk_24CE85728;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v17;
    v20 = (std::__shared_weak_count *)off_253D31E70;
    off_253D31E68 = v17;
    off_253D31E70 = v19;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v16 = (BBUPartitionManager *)off_253D31E68;
    a8 = v18;
  }
  v23 = (std::__shared_weak_count *)off_253D31E70;
  v68 = v16;
  v69 = off_253D31E70;
  if (off_253D31E70)
  {
    v24 = (unint64_t *)((char *)off_253D31E70 + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  BBUPartitionManager::getBBUFSPath(v16, &v70);
  v26 = a6[23];
  if (v26 >= 0)
    v27 = a6;
  else
    v27 = *(const std::string::value_type **)a6;
  if (v26 >= 0)
    v28 = *((unsigned __int8 *)a6 + 23);
  else
    v28 = *((_QWORD *)a6 + 1);
  v29 = std::string::append(&v70, v27, v28);
  v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  __p[2] = (void *)v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  if (v23)
  {
    v31 = (unint64_t *)&v23->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v33 = (*((uint64_t (**)(BBUFeedback **, uint64_t, void **, uint64_t *))*a1 + 28))(a1, a2, __p, a5);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_35;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_35;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v34 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    if (a6[23] >= 0)
      LOBYTE(v38) = (_BYTE)a6;
    else
      v38 = *(const std::string::value_type **)a6;
    v39 = "not found";
    if (!v33)
      v39 = "located";
    v40 = __p;
    if (SHIBYTE(__p[2]) < 0)
      v40 = (void **)__p[0];
    v62 = v39;
    v63 = v40;
    _BBULog(3, 0, v34, "", "%s:  %s at %s", v35, v36, v37, (char)v38);
    if (gBBULogMaskGet(void)::once != -1)
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_38;
      goto LABEL_36;
    }
  }
LABEL_35:
  if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
    goto LABEL_38;
LABEL_36:
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v41 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    _BBULog(3, 0, v41, "", "\n", v42, v43, v44, v61);
  }
LABEL_38:
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    v45 = gBBULogMaskGet(void)::once;
    if (v33)
    {
LABEL_40:
      if (v45 == -1)
      {
        v46 = a7;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_47;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v46 = a7;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_47;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v47 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
        if (*((char *)a5 + 23) >= 0)
          LOBYTE(v51) = (_BYTE)a5;
        else
          v51 = *a5;
        _BBULog(3, 0, v47, "", "%s:  searching in FDR\n", v48, v49, v50, v51);
      }
LABEL_47:
      if (*(char *)(a4 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v67, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
        v52 = *v46;
        cf = v52;
        if (!v52)
          goto LABEL_60;
      }
      else
      {
        v67 = *(std::string *)a4;
        v52 = *v46;
        cf = v52;
        if (!v52)
        {
LABEL_60:
          LOBYTE(v61) = a10;
          v53 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, std::string *, uint64_t *, CFTypeRef *, uint64_t, _QWORD, int, const char *, void **))*a1
                 + 29))(a1, a2, a3, &v67, a5, &cf, a8, a9, v61, v62, v63);
          if (cf)
            CFRelease(cf);
          if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v67.__r_.__value_.__l.__data_);
            if ((_DWORD)v53)
              goto LABEL_64;
          }
          else if ((_DWORD)v53)
          {
LABEL_64:
            if (*((char *)a5 + 23) >= 0)
              v59 = (const char *)a5;
            else
              v59 = (const char *)*a5;
            BBUFeedback::handleComment(a1[1], "%s:  not found in FDR\n", v59);
            return v53;
          }
          if (gBBULogMaskGet(void)::once != -1)
            goto LABEL_71;
LABEL_52:
          v53 = 0;
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
            return v53;
          goto LABEL_53;
        }
      }
      CFRetain(v52);
      goto LABEL_60;
    }
  }
  else
  {
    v45 = gBBULogMaskGet(void)::once;
    if (v33)
      goto LABEL_40;
  }
  if (v45 == -1)
    goto LABEL_52;
LABEL_71:
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  v53 = 0;
  if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
    return v53;
LABEL_53:
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v54 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    if (a6[23] >= 0)
      LOBYTE(v58) = (_BYTE)a6;
    else
      v58 = *(const std::string::value_type **)a6;
    _BBULog(3, 0, v54, "", "Loaded %s (%p)\n", v55, v56, v57, (char)v58);
    return 0;
  }
  return v53;
}

void sub_212B3378C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  char **v34;

  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v34, v34[1]);
  operator delete(v34);
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromFDR(BBUFeedback **a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, const void **a6, uint64_t a7, int a8, unsigned __int8 a9)
{
  const void *v16;
  ctu::cf *v17;
  BBUFeedback *v18;
  const void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  BBUFeedback *v25;
  std::string *v26;
  capabilities::updater *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  int v33;
  BBUFeedback *v34;
  const char *v35;
  BBUFeedback *v36;
  const void *v37;
  std::string *v38;
  BBUFeedback *v39;
  const char *v40;
  int v41;
  BBUFeedback *v42;
  BBUFeedback *v43;
  const char *v44;
  int v45;
  BBUFeedback *v46;
  const char *v47;
  int v48;
  BBUFeedback *v49;
  const void *v50;
  std::string *v51;
  const void *v52;
  BBUFeedback *v53;
  std::string *v54;
  int v55;
  const void *v56;
  BBUFeedback *v57;
  std::string *v58;
  int v59;
  __CFError *v60;
  BBUpdaterCommon *isErrorImageNotFound;
  __CFError *v62;
  const char *v63;
  const void *v64;
  int v65;
  BBUFeedback *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v73;
  const char *v74;
  BOOL v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  CFTypeRef v79;
  CFTypeRef v80;
  CFTypeRef v81;
  CFTypeRef v82;
  CFTypeRef cf;
  CFTypeRef v84;
  CFTypeRef v85;
  std::string v86;
  ctu::cf *v87;
  std::string v88;
  const void *v89;
  CFTypeRef v90;
  uint64_t v91;
  std::string v92;
  std::string v93;
  void *v94;

  v90 = 0;
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v88, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v88 = *(std::string *)a3;
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v92, v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
  else
    v92 = v88;
  v91 = 0;
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v93, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
  else
    v93 = v92;
  v78 = a2;
  v94 = 0;
  if (ctu::cf::convert_copy())
    v16 = v94;
  else
    v16 = 0;
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v93.__r_.__value_.__l.__data_);
    v89 = v16;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_15:
      if ((SHIBYTE(v88.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_16;
LABEL_20:
      operator delete(v88.__r_.__value_.__l.__data_);
      if ((a4[23] & 0x80000000) == 0)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  else
  {
    v89 = v16;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_15;
  }
  operator delete(v92.__r_.__value_.__l.__data_);
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_20;
LABEL_16:
  if ((a4[23] & 0x80000000) == 0)
  {
LABEL_17:
    v86 = *(std::string *)a4;
    goto LABEL_22;
  }
LABEL_21:
  std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
LABEL_22:
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v92, v86.__r_.__value_.__l.__data_, v86.__r_.__value_.__l.__size_);
  else
    v92 = v86;
  v91 = 0;
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v93, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
  else
    v93 = v92;
  v94 = 0;
  if (ctu::cf::convert_copy())
    v17 = (ctu::cf *)v94;
  else
    v17 = 0;
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v93.__r_.__value_.__l.__data_);
    v87 = v17;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_33:
      v77 = a7;
      if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_34;
      goto LABEL_110;
    }
  }
  else
  {
    v87 = v17;
    if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_33;
  }
  operator delete(v92.__r_.__value_.__l.__data_);
  v77 = a7;
  if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_34:
    v92.__r_.__value_.__r.__words[0] = 0;
    v18 = a1[1];
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
      goto LABEL_35;
LABEL_111:
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_36;
    goto LABEL_112;
  }
LABEL_110:
  operator delete(v86.__r_.__value_.__l.__data_);
  v92.__r_.__value_.__r.__words[0] = 0;
  v18 = a1[1];
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS != -1)
    goto LABEL_111;
LABEL_35:
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
    goto LABEL_36;
LABEL_112:
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_36:
  BBUFeedback::handleComment(v18, "In restoreOS?: Bool = %d", (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
  BBUFeedback::handleComment(a1[1], "Is performManCheckFlow?: Bool = %d", a9);
  BBUFeedback::handleComment(a1[1], "IsBBFused? Bool = %d", a8);
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_42;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_42;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v20 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
    LOBYTE(v24) = (_BYTE)a4;
    if (a4[23] < 0)
      v24 = *(uint64_t **)a4;
    _BBULog(3, 0, v20, "", "Identifier: %s\n", v21, v22, v23, (char)v24);
  }
LABEL_42:
  v25 = a1[1];
  ctu::cf::show(v17, v19);
  if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = &v93;
  else
    v26 = (std::string *)v93.__r_.__value_.__r.__words[0];
  BBUFeedback::handleComment(v25, "ClassIdentifier with show(): %s\n", (const char *)v26);
  if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v93.__r_.__value_.__l.__data_);
  if (capabilities::updater::shouldStripFDRDataOnAP(v27))
  {
    BBUFeedback::handleComment(a1[1], "Using the new FDR flow");
    v85 = v17;
    if (v17)
      CFRetain(v17);
    v84 = v16;
    if (v16)
      CFRetain(v16);
    v32 = *a6;
    cf = v32;
    if (v32)
      CFRetain(v32);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_56;
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_56;
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_56:
    v33 = BBUFDRUtilities::validateAndCopy((capabilities::radio *)&v85, &v84, &v90, (uint64_t *)&cf, (ctu::cf **)&v92, (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
    if (cf)
      CFRelease(cf);
    if (v84)
      CFRelease(v84);
    if (v85)
      CFRelease(v85);
    v34 = a1[1];
    if (!v33)
    {
      BBUFeedback::handleComment(v34, "FDR data pull and validation is successful for %s");
      goto LABEL_120;
    }
    if (*(char *)(a5 + 23) >= 0)
      v35 = (const char *)a5;
    else
      v35 = *(const char **)a5;
    BBUFeedback::handleComment(v34, "Analyze the FDR failure for %s", v35);
    v36 = a1[1];
    ctu::cf::show((ctu::cf *)v92.__r_.__value_.__l.__data_, v37);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v38 = &v93;
    else
      v38 = (std::string *)v93.__r_.__value_.__r.__words[0];
    BBUFeedback::handleComment(v36, "FDR failure we hit is: %s \n", (const char *)v38);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v93.__r_.__value_.__l.__data_);
      v39 = a1[1];
      v40 = a4;
      if ((a4[23] & 0x80000000) == 0)
        goto LABEL_71;
    }
    else
    {
      v39 = a1[1];
      v40 = a4;
      if ((a4[23] & 0x80000000) == 0)
        goto LABEL_71;
    }
    v40 = *(const char **)a4;
LABEL_71:
    BBUFeedback::handleComment(v39, "Identifier: %s\n", v40);
    LOBYTE(v94) = 0;
    LOBYTE(v91) = 0;
    v41 = (*((uint64_t (**)(BBUFeedback **, uint64_t, void **, uint64_t *))*a1 + 31))(a1, v77, &v94, &v91);
    BBUFeedback::handleComment(a1[1], "Return code for the root manifest CAL/FATP_CAL entitlements check is: %d", v41);
    v42 = a1[1];
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_73;
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_73;
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_73:
    BBUFeedback::handleComment(v42, "In restoreOS?: Bool = %d", (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS) != 0);
    BBUFeedback::handleComment(a1[1], "Calibration enabled flag: %d", v94);
    BBUFeedback::handleComment(a1[1], "FATPCalibration enabled flag: %d", v91);
    v43 = a1[1];
    v44 = a4;
    if (a4[23] < 0)
      v44 = *(const char **)a4;
    v45 = strncmp(v44, "bbcl", 5uLL);
    BBUFeedback::handleComment(v43, "bbcl string check: %d", v45 == 0);
    v46 = a1[1];
    v47 = a4;
    if (a4[23] < 0)
      v47 = *(const char **)a4;
    v48 = strncmp(v47, "bbpc", 5uLL);
    BBUFeedback::handleComment(v46, "bbpc string check: %d", v48 == 0);
    v49 = a1[1];
    ctu::cf::show(v17, v50);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v51 = &v93;
    else
      v51 = (std::string *)v93.__r_.__value_.__r.__words[0];
    BBUFeedback::handleComment(v49, "ClassIdentifier in error: %s\n", (const char *)v51);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v93.__r_.__value_.__l.__data_);
    v53 = a1[1];
    ctu::cf::show(v17, v52);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v54 = &v93;
    else
      v54 = (std::string *)v93.__r_.__value_.__r.__words[0];
    v55 = strncmp((const char *)v54, "bbcl", 5uLL);
    BBUFeedback::handleComment(v53, "ClassIdentifier bbcl string check: %d", v55 == 0);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v93.__r_.__value_.__l.__data_);
    v57 = a1[1];
    ctu::cf::show(v17, v56);
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v58 = &v93;
    else
      v58 = (std::string *)v93.__r_.__value_.__r.__words[0];
    v59 = strncmp((const char *)v58, "bbpc", 5uLL);
    BBUFeedback::handleComment(v57, "ClassIdentifier bbpc string check: %d", v59 == 0);
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v93.__r_.__value_.__l.__data_);
      if ((a8 & 1) != 0)
      {
LABEL_92:
        isErrorImageNotFound = (BBUpdaterCommon *)BBUFDRUtilities::isErrorImageNotFound((BBUFDRUtilities *)v92.__r_.__value_.__l.__data_, v60);
        if ((isErrorImageNotFound & 1) != 0)
        {
          v63 = "Image NOT found in FDR, so ignore all errors coming from the AMFDR and depend on BB to fail if necassary";
LABEL_118:
          v66 = a1[1];
LABEL_119:
          BBUFeedback::handleComment(v66, v63);
          goto LABEL_120;
        }
        if ((a9 & 1) == 0 && (_BYTE)v94)
        {
          v73 = a4;
          if (a4[23] < 0)
            v73 = *(const char **)a4;
          isErrorImageNotFound = (BBUpdaterCommon *)strncmp(v73, "bbcl", 5uLL);
          if (!(_DWORD)isErrorImageNotFound)
            goto LABEL_152;
        }
        if ((a9 & 1) == 0 && (_BYTE)v91)
        {
          if (a4[23] < 0)
            a4 = *(const char **)a4;
          isErrorImageNotFound = (BBUpdaterCommon *)strncmp(a4, "bbpc", 5uLL);
          if (!(_DWORD)isErrorImageNotFound)
          {
LABEL_152:
            v63 = "CALIB enabled for CAL file, so ignore all errors coming from the AMFDR";
            goto LABEL_118;
          }
        }
        if (a9 && v92.__r_.__value_.__r.__words[0])
        {
          v74 = "Fatal error 1 in FDR data validation/decode";
LABEL_151:
          v66 = a1[1];
          goto LABEL_161;
        }
        if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
        {
          if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
            goto LABEL_155;
        }
        else
        {
          dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
          if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
          {
LABEL_155:
            if (!(BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS))
              goto LABEL_158;
LABEL_156:
            if ((a9 & 1) == 0)
            {
              isErrorImageNotFound = (BBUpdaterCommon *)BBUFDRUtilities::isTrustErrorAcceptable((BBUFDRUtilities *)v92.__r_.__value_.__l.__data_, v62);
              if (!(_DWORD)isErrorImageNotFound)
              {
                v74 = "Fatal error 2 in FDR data validation/decode";
                goto LABEL_151;
              }
            }
LABEL_158:
            v75 = BBUpdaterCommon::inRestoreOS(isErrorImageNotFound);
            v66 = a1[1];
            v63 = "libFDR errors (if any) coming from the API can be ignored";
            if (v75 || !v92.__r_.__value_.__r.__words[0])
              goto LABEL_119;
            v74 = "Fatal error 3 in FDR data validation/decode";
LABEL_161:
            BBUFeedback::handleComment(v66, v74);
            v67 = 119;
            goto LABEL_129;
          }
        }
        dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
        if (!(BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS))
          goto LABEL_158;
        goto LABEL_156;
      }
    }
    else if ((a8 & 1) != 0)
    {
      goto LABEL_92;
    }
    v63 = "BB is NOT fused, so ignore all errors coming from the AMFDR";
    goto LABEL_118;
  }
  v82 = v17;
  if (v17)
    CFRetain(v17);
  v81 = v16;
  if (v16)
    CFRetain(v16);
  v64 = *a6;
  v80 = v64;
  if (v64)
    CFRetain(v64);
  v65 = BBUFDRUtilities::copy((CFStringRef *)&v82, (CFStringRef *)&v81, &v90, &v80, v28, v29, v30, v31);
  if (v80)
    CFRelease(v80);
  if (v81)
    CFRelease(v81);
  if (v82)
    CFRelease(v82);
  if (v65)
    BBUFeedback::handleComment(a1[1], "first pass - could not find data in FDR for %s");
LABEL_120:
  v79 = v90;
  if (v90)
    CFRetain(v90);
  v67 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, CFTypeRef *))*a1 + 30))(a1, v78, a5, &v79);
  if (v79)
    CFRelease(v79);
  if ((_DWORD)v67)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_129;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
        goto LABEL_129;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v68 = (const char *)(*(uint64_t (**)(BBUFeedback **))*a1)(a1);
      _BBULog(3, 0, v68, "", "failed creating image from fdr data\n", v69, v70, v71, v76);
    }
  }
LABEL_129:
  if (v92.__r_.__value_.__r.__words[0])
    CFRelease(v92.__r_.__value_.__l.__data_);
  if (v17)
    CFRelease(v17);
  if (v16)
    CFRelease(v16);
  if (v90)
    CFRelease(v90);
  return v67;
}

void sub_212B343E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,int a27,__int16 a28,char a29,char a30,int a31,__int16 a32,char a33,char a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,const void *a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,const void *a52,const void *a53,__int16 a54,char a55,char a56)
{
  uint64_t v56;

  if (*(char *)(v56 - 105) < 0)
    operator delete(*(void **)(v56 - 128));
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(&a45);
  ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(&a52);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef(&a53);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromFile(uint64_t (***a1)(_QWORD), BBUICENVMImage **a2, const char *a3, char *a4)
{
  timespec v8;
  const char *v9;
  capabilities::radio *v10;
  uint64_t result;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;
  int ImageIDFromImageName;
  const char *v19;
  size_t v20;
  __darwin_ino64_t v21;
  _BYTE *v22;
  char *v23;
  capabilities::radio *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  BBUEURMIImage *v28;
  const char *v29;
  size_t v30;
  size_t v31;
  __int128 *v32;
  int v33;
  unint64_t v34;
  size_t v35;
  capabilities::updater *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  capabilities::updater *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  capabilities::updater *v47;
  BBUICENVMImage *v48;
  BBUICENVMImage *v49;
  int st_gid_high;
  void *v51;
  stat *p_dst;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *exception;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  unint64_t v72;
  stat __dst;

  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blksize = v8;
  *(timespec *)__dst.st_qspare = v8;
  __dst.st_birthtimespec = v8;
  *(timespec *)&__dst.st_size = v8;
  __dst.st_mtimespec = v8;
  __dst.st_ctimespec = v8;
  *(timespec *)&__dst.st_uid = v8;
  __dst.st_atimespec = v8;
  *(timespec *)&__dst.st_dev = v8;
  if (a3[23] >= 0)
    v9 = a3;
  else
    v9 = *(const char **)a3;
  v10 = (capabilities::radio *)stat(v9, &__dst);
  if (!(_DWORD)v10)
  {
    v17 = capabilities::radio::vendor(v10);
    if (v17 == 2)
    {
      v23 = (char *)operator new(0x30uLL);
      *(_QWORD *)v23 = off_24CE7FC78;
      *(_OWORD *)(v23 + 8) = 0u;
      *(_OWORD *)(v23 + 24) = 0u;
      v24 = (capabilities::radio *)BBUFileDataSource::init((uint64_t)v23, a3, 0);
      if (!(_DWORD)v24)
      {
LABEL_29:
        v27 = capabilities::radio::vendor(v24);
        if (v27 == 2)
        {
          memset(&__dst, 0, 24);
          v33 = a4[23];
          if (v33 >= 0)
            v34 = a4[23];
          else
            v34 = *((_QWORD *)a4 + 1);
          if (v33 < 0)
            a4 = *(char **)a4;
          if (v34 >= 3)
            v35 = 3;
          else
            v35 = v34;
          v36 = (capabilities::updater *)memcmp(a4, "CAL", v35);
          if ((_DWORD)v36 || v34 != 3)
          {
            if (v34 >= 4)
              v41 = 4;
            else
              v41 = v34;
            v42 = (capabilities::updater *)memcmp(a4, "PROV", v41);
            if ((_DWORD)v42 || v34 != 4)
            {
              v47 = (capabilities::updater *)memcmp(a4, "PAC", v35);
              if ((_DWORD)v47 || v34 != 3)
              {
                exception = __cxa_allocate_exception(0x210uLL);
                _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x330u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized BBUEUR Remote Data fileName.\")", v65, v66, v67, v68);
              }
              capabilities::updater::PACFileName(v47);
            }
            else
            {
              capabilities::updater::PROVFileName(v42);
            }
          }
          else
          {
            capabilities::updater::CALFileName(v36);
          }
          *(_OWORD *)&__dst.st_dev = v69;
          *(_QWORD *)&__dst.st_uid = v70;
          v48 = (BBUICENVMImage *)operator new(0x38uLL);
          v49 = v48;
          st_gid_high = SHIBYTE(__dst.st_gid);
          v51 = *(void **)&__dst.st_dev;
          if ((__dst.st_gid & 0x80000000) == 0)
            p_dst = &__dst;
          else
            p_dst = *(stat **)&__dst.st_dev;
          BBUICENVMImage::BBUICENVMImage(v48, (BBUDataSource *)v23, (const char *)p_dst, 0);
          *a2 = v49;
          if ((st_gid_high & 0x80000000) == 0)
          {
LABEL_76:
            if (*a2)
              return 0;
            if (gBBULogMaskGet(void)::once == -1)
            {
              if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
                goto LABEL_80;
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
              {
LABEL_80:
                if ((gBBULogVerbosity & 0x80000000) == 0)
                {
                  v53 = (const char *)(**a1)(a1);
                  _BBULog(3, 0, v53, "", "failed creating BBUImage from data source\n", v54, v55, v56, v68);
                }
              }
            }
            (*(void (**)(char *))(*(_QWORD *)v23 + 8))(v23);
            return 19;
          }
          v46 = v51;
LABEL_75:
          operator delete(v46);
          goto LABEL_76;
        }
        if (v27 == 1)
        {
          v28 = (BBUEURMIImage *)operator new(0x58uLL);
          if (a4[23] >= 0)
            v29 = a4;
          else
            v29 = *(const char **)a4;
          v30 = strlen(v29);
          if (v30 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v31 = v30;
          if (v30 >= 0x17)
          {
            v43 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v30 | 7) != 0x17)
              v43 = v30 | 7;
            v44 = v43 + 1;
            v32 = (__int128 *)operator new(v43 + 1);
            *((_QWORD *)&v71 + 1) = v31;
            v72 = v44 | 0x8000000000000000;
            *(_QWORD *)&v71 = v32;
          }
          else
          {
            HIBYTE(v72) = v30;
            v32 = &v71;
            if (!v30)
              goto LABEL_64;
          }
          memmove(v32, v29, v31);
LABEL_64:
          *((_BYTE *)v32 + v31) = 0;
          BBUEURMIImage::BBUEURMIImage(v28, (BBUDataSource *)v23, 0);
          *(_QWORD *)v28 = off_24CE80580;
          *((_QWORD *)v28 + 8) = 0;
          *((_QWORD *)v28 + 9) = 0;
          *((_QWORD *)v28 + 10) = 0;
          if ((SHIBYTE(v72) & 0x80000000) == 0)
          {
            result = 0;
            *((_OWORD *)v28 + 4) = v71;
            *((_QWORD *)v28 + 10) = v72;
            *a2 = v28;
            return result;
          }
          v45 = (void *)v71;
          std::string::__assign_no_alias<true>((_QWORD *)v28 + 8, (void *)v71, *((size_t *)&v71 + 1));
          *a2 = v28;
          v46 = v45;
          goto LABEL_75;
        }
        v57 = __cxa_allocate_exception(0x210uLL);
        _BBUException::_BBUException((uint64_t)v57, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x339u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v61, v62, v63, v68);
LABEL_94:
      }
      (*(void (**)(char *))(*(_QWORD *)v23 + 8))(v23);
LABEL_50:
      if (gBBULogMaskGet(void)::once == -1)
      {
        result = 19;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          return result;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        result = 19;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          return result;
      }
      if (gBBULogVerbosity < 0)
        return result;
      v37 = (const char *)(**a1)(a1);
      _BBULog(3, 0, v37, "", "could not create data source from file\n", v38, v39, v40, v68);
      return 19;
    }
    if (v17 != 1)
    {
      v57 = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)v57, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x307u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v58, v59, v60, v68);
      goto LABEL_94;
    }
    ImageIDFromImageName = BBUEUR10UpdateSource::getImageIDFromImageName((const void **)a4);
    if (a3[23] >= 0)
      v19 = a3;
    else
      v19 = *(const char **)a3;
    v20 = strlen(v19);
    if (v20 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v21 = v20;
    if (v20 >= 0x17)
    {
      v25 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17)
        v25 = v20 | 7;
      v26 = v25 + 1;
      v22 = operator new(v25 + 1);
      __dst.st_ino = v21;
      *(_QWORD *)&__dst.st_uid = v26 | 0x8000000000000000;
      *(_QWORD *)&__dst.st_dev = v22;
    }
    else
    {
      HIBYTE(__dst.st_gid) = v20;
      v22 = &__dst;
      if (!v20)
      {
LABEL_27:
        v22[v21] = 0;
        v24 = BBUDataSource::createFromEurekaMIFile((uint64_t)&__dst, 0, ImageIDFromImageName);
        v23 = (char *)v24;
        if (SHIBYTE(__dst.st_gid) < 0)
        {
          operator delete(*(void **)&__dst.st_dev);
          if (v23)
            goto LABEL_29;
        }
        else if (v24)
        {
          goto LABEL_29;
        }
        goto LABEL_50;
      }
    }
    memmove(v22, v19, v21);
    goto LABEL_27;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    result = 15;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      return result;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    result = 15;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      return result;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v12 = (const char *)(**a1)(a1);
    if (a3[23] >= 0)
      LOBYTE(v16) = (_BYTE)a3;
    else
      v16 = *(const char **)a3;
    _BBULog(3, 0, v12, "", "could not locate %s\n", v13, v14, v15, (char)v16);
    return 15;
  }
  return result;
}

void sub_212B34C98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B34CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void **v25;
  _QWORD *v26;
  uint64_t v28;

  if (*((char *)v26 + 87) < 0)
    operator delete(*v25);
  *v26 = off_24CE84BF8;
  v28 = v26[1];
  if (v28)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
  operator delete(__p);
  operator delete(v26);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::createImageFromData(capabilities::radio *a1, BBUICENVMImage **a2, const void **a3, BBUDataSource **a4)
{
  int v8;
  BBUDataSource *v9;
  BBUDataSource *v10;
  BBUDataSource *v11;
  int ImageIDFromImageName;
  int v13;
  BBUEURMIImage *v14;
  const char *v15;
  size_t v16;
  size_t v17;
  __int128 *p_dst;
  int v19;
  unint64_t v20;
  const void *v21;
  size_t v22;
  capabilities::updater *v23;
  BOOL v24;
  size_t v25;
  capabilities::updater *v26;
  BOOL v27;
  capabilities::updater *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BBUICENVMImage *v38;
  BBUICENVMImage *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *exception;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  __int128 __dst;
  unint64_t v62;

  v8 = capabilities::radio::vendor(a1);
  if (v8 != 1)
  {
    if (v8 != 2)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x366u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v46, v47, v48, v56);
      goto LABEL_72;
    }
    v9 = *a4;
    v10 = (BBUDataSource *)operator new(0x18uLL);
    v11 = v10;
    *((_DWORD *)v10 + 4) = 0;
    *(_QWORD *)v10 = off_24CE84890;
    *((_QWORD *)v10 + 1) = v9;
    if (v9)
      v10 = (BBUDataSource *)CFRetain(v9);
LABEL_6:
    v13 = capabilities::radio::vendor(v10);
    if (v13 == 2)
    {
      v59 = 0uLL;
      v60 = 0;
      v19 = *((char *)a3 + 23);
      if (v19 >= 0)
        v20 = *((unsigned __int8 *)a3 + 23);
      else
        v20 = (unint64_t)a3[1];
      if (v19 >= 0)
        v21 = a3;
      else
        v21 = *a3;
      if (v20 >= 3)
        v22 = 3;
      else
        v22 = v20;
      v23 = (capabilities::updater *)memcmp(v21, "CAL", v22);
      if ((_DWORD)v23)
        v24 = 0;
      else
        v24 = v20 == 3;
      if (v24)
      {
        capabilities::updater::CALFileName(v23);
      }
      else
      {
        if (v20 >= 4)
          v25 = 4;
        else
          v25 = v20;
        v26 = (capabilities::updater *)memcmp(v21, "PROV", v25);
        if ((_DWORD)v26)
          v27 = 0;
        else
          v27 = v20 == 4;
        if (v27)
        {
          capabilities::updater::PROVFileName(v26);
        }
        else
        {
          v28 = (capabilities::updater *)memcmp(v21, "PAC", v22);
          if ((_DWORD)v28 || v20 != 3)
          {
            v52 = __cxa_allocate_exception(0x210uLL);
            _BBUException::_BBUException((uint64_t)v52, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x38Eu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized BBUICE Remote Data fileName.\")", v53, v54, v55, v56);
          }
          capabilities::updater::PACFileName(v28);
        }
      }
      v59 = v57;
      v60 = v58;
      v38 = (BBUICENVMImage *)operator new(0x38uLL);
      v39 = v38;
      if (v58 >= 0)
        v40 = (const char *)&v59;
      else
        v40 = (const char *)v59;
      BBUICENVMImage::BBUICENVMImage(v38, v11, v40, 0);
      *a2 = v39;
      if ((SHIBYTE(v58) & 0x80000000) == 0)
      {
        if (!*a2)
          goto LABEL_59;
        return 0;
      }
      v37 = (void *)v57;
LABEL_58:
      operator delete(v37);
      if (!*a2)
      {
LABEL_59:
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
            goto LABEL_61;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
          {
LABEL_61:
            if ((gBBULogVerbosity & 0x80000000) == 0)
            {
              v41 = (const char *)(**(uint64_t (***)(capabilities::radio *))a1)(a1);
              _BBULog(3, 0, v41, "", "failed creating BBUImage from data source\n", v42, v43, v44, v56);
            }
          }
        }
        (*(void (**)(BBUDataSource *))(*(_QWORD *)v11 + 8))(v11);
        return 19;
      }
      return 0;
    }
    if (v13 == 1)
    {
      v14 = (BBUEURMIImage *)operator new(0x58uLL);
      if (*((char *)a3 + 23) >= 0)
        v15 = (const char *)a3;
      else
        v15 = (const char *)*a3;
      v16 = strlen(v15);
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      v17 = v16;
      if (v16 >= 0x17)
      {
        v29 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v29 = v16 | 7;
        v30 = v29 + 1;
        p_dst = (__int128 *)operator new(v29 + 1);
        *((_QWORD *)&__dst + 1) = v17;
        v62 = v30 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        HIBYTE(v62) = v16;
        p_dst = &__dst;
        if (!v16)
          goto LABEL_43;
      }
      memmove(p_dst, v15, v17);
LABEL_43:
      *((_BYTE *)p_dst + v17) = 0;
      BBUEURMIImage::BBUEURMIImage(v14, v11, 0);
      *(_QWORD *)v14 = off_24CE80580;
      *((_QWORD *)v14 + 8) = 0;
      *((_QWORD *)v14 + 9) = 0;
      *((_QWORD *)v14 + 10) = 0;
      if ((SHIBYTE(v62) & 0x80000000) == 0)
      {
        result = 0;
        *((_OWORD *)v14 + 4) = __dst;
        *((_QWORD *)v14 + 10) = v62;
        *a2 = v14;
        return result;
      }
      v36 = (void *)__dst;
      std::string::__assign_no_alias<true>((_QWORD *)v14 + 8, (void *)__dst, *((size_t *)&__dst + 1));
      *a2 = v14;
      v37 = v36;
      goto LABEL_58;
    }
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 11, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Updater/Common/BBUUpdateSource.cpp", 0x397u, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unrecognized radio vendor.\")", v49, v50, v51, v56);
LABEL_72:
  }
  ImageIDFromImageName = BBUEUR10UpdateSource::getImageIDFromImageName(a3);
  v10 = (BBUDataSource *)BBUDataSource::createFromEurekaMIData(*a4, 0, ImageIDFromImageName);
  v11 = v10;
  if (v10)
    goto LABEL_6;
  if (gBBULogMaskGet(void)::once == -1)
  {
    result = 19;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      return result;
    goto LABEL_47;
  }
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  result = 19;
  if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
  {
LABEL_47:
    if (gBBULogVerbosity < 0)
      return result;
    v32 = (const char *)(**(uint64_t (***)(capabilities::radio *))a1)(a1);
    _BBULog(3, 0, v32, "", "failed creating data source from FDR data\n", v33, v34, v35, v56);
    return 19;
  }
  return result;
}

void sub_212B35244(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B35260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  _QWORD *v24;
  void **v25;
  uint64_t v27;

  if (*((char *)v24 + 87) < 0)
    operator delete(*v25);
  *v24 = off_24CE84BF8;
  v27 = v24[1];
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
  operator delete(__p);
  operator delete(v24);
  _Unwind_Resume(a1);
}

uint64_t BBUUpdateSource::getCalibrationEntitlements(BBUFeedback **this, BBUDataSource *a2, BOOL *a3, BOOL *a4)
{
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  char v42;
  int v43;
  uint64_t *v44;
  _BYTE *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  char v52;
  int v53;
  _BYTE *v54;
  char v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  _BYTE *v66;
  _QWORD v67[5];

  *a3 = 0;
  *a4 = 0;
  if (!a2)
    return 118;
  v8 = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)a2 + 24))(a2);
  v9 = malloc(v8);
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  v10 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)gBBULogMaskGet(void)::sBBULogMask >> 3);
  if (!v9)
  {
    if (v10)
    {
      v32 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      _BBULog(3, 0, v32, "", "BBTicket malloc for DER decode failed \n", v33, v34, v35, v55);
    }
    v26 = 0;
    v24 = 0;
    *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v63 = v36;
    v64 = v36;
    v61 = v36;
    v62 = v36;
    v59 = v36;
    v60 = v36;
    v25 = 113;
    goto LABEL_30;
  }
  if (v10
    && (v11 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this),
        _BBULog(3, 0, v11, "", "Get root manifest content from file into memory\n", v12, v13, v14, v55),
        gBBULogMaskGet(void)::once != -1))
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_10;
  }
  else if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
  {
    goto LABEL_10;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v15 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
    _BBULog(3, 0, v15, "", "Root manifest size: %d \n", v16, v17, v18, v8);
  }
LABEL_10:
  LODWORD(v57) = -1431655766;
  (*(void (**)(BBUDataSource *, void *, uint64_t, __int128 *, _QWORD))(*(_QWORD *)a2 + 16))(a2, v9, v8, &v57, 0);
  if ((_DWORD)v57 != (_DWORD)v8)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
        goto LABEL_27;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0)
      {
LABEL_27:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v37 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
          _BBULog(3, 0, v37, "", "BBTicket read content failed\n", v38, v39, v40, v55);
        }
      }
    }
    v26 = 0;
    v24 = 0;
    *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v63 = v36;
    v64 = v36;
    v61 = v36;
    v62 = v36;
    v59 = v36;
    v60 = v36;
    v25 = 114;
LABEL_30:
    v57 = v36;
    v58 = v36;
    goto LABEL_31;
  }
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v63 = v19;
  v64 = v19;
  v61 = v19;
  v62 = v19;
  v59 = v19;
  v60 = v19;
  v57 = v19;
  v58 = v19;
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_15;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
      goto LABEL_15;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v20 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
    _BBULog(3, 0, v20, "", "Now DERDecode the root manifest to get the calibration enabled flag\n", v21, v22, v23, v55);
  }
LABEL_15:
  if (DERDecodeBBTicket((uint64_t)v9, v8, (unint64_t)&v57))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v24 = 0;
    v25 = 115;
    v26 = 1;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) != 0 && (gBBULogVerbosity & 0x80000000) == 0)
    {
      v27 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      v31 = "RootManifest decode error during FDR data parsing\n";
LABEL_71:
      _BBULog(3, 0, v27, "", v31, v28, v29, v30, v55);
      v24 = 0;
    }
  }
  else
  {
    memset(v67, 170, 32);
    v65 = 0xAAAAAAAAAAAAAAAALL;
    v66 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
    v26 = DERDecodeSeqInit((uint64_t)&v60, &v67[1], &v67[2]);
    if (v26)
    {
LABEL_67:
      *a3 = 0;
      if (gBBULogMaskGet(void)::once == -1)
      {
        v24 = 0;
        v25 = 116;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_31;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        v24 = 0;
        v25 = 116;
        if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 8) == 0)
          goto LABEL_31;
      }
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v27 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
        v31 = "RootManifest decode error during CalibEnable FDR data parsing\n";
        goto LABEL_71;
      }
    }
    else
    {
      v52 = 0;
      while (1)
      {
        v53 = DERDecodeSeqNext(&v67[2], &v65);
        if (v53)
          break;
        if (v65 == 0x80000000000000D4)
        {
          if (v67[0] != 4)
            goto LABEL_66;
          v52 = 0;
          if (*v66)
          {
            if (*v66 != 1)
            {
LABEL_66:
              v26 = 3;
              goto LABEL_67;
            }
            v52 = 1;
          }
        }
      }
      v26 = v53;
      if (v53 != 1)
        goto LABEL_67;
      v26 = 0;
      v25 = 0;
      *a3 = v52 & 1;
      v24 = 1;
    }
  }
LABEL_31:
  if (*a3)
    v41 = "TRUE";
  else
    v41 = "FALSE";
  BBUFeedback::handleComment(this[1], "Calibration enabled flag: %s", v41);
  if (!v24)
    goto LABEL_51;
  memset(v67, 170, 32);
  v65 = 0xAAAAAAAAAAAAAAAALL;
  v66 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  if (DERDecodeSeqInit((uint64_t)&v60, &v67[1], &v67[2]))
    goto LABEL_46;
  v42 = 0;
  while (1)
  {
    v43 = DERDecodeSeqNext(&v67[2], &v65);
    if (v43)
      break;
    if (v65 == 0x80000000000001C2)
    {
      if (v67[0] != 4)
        goto LABEL_46;
      v42 = 0;
      if (*v66)
      {
        if (*v66 != 1)
          goto LABEL_46;
        v42 = 1;
      }
    }
  }
  if (v43 != 1)
  {
LABEL_46:
    *a4 = 0;
    v44 = &qword_253D37000;
LABEL_47:
    if (gBBULogMaskGet(void)::once == -1)
    {
      v45 = (_BYTE *)v44[501];
      v25 = 117;
      if ((*v45 & 8) == 0)
        goto LABEL_51;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v54 = (_BYTE *)v44[501];
      v25 = 117;
      if ((*v54 & 8) == 0)
        goto LABEL_51;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v46 = (const char *)(*(uint64_t (**)(BBUFeedback **))*this)(this);
      _BBULog(3, 0, v46, "", "RootManifest decode error during FATPCalibEnable FDR data parsing\n", v47, v48, v49, v56);
    }
    goto LABEL_51;
  }
  *a4 = v42 & 1;
  v44 = &qword_253D37000;
  if (v26)
    goto LABEL_47;
  v25 = 0;
LABEL_51:
  if (*a4)
    v50 = "TRUE";
  else
    v50 = "FALSE";
  BBUFeedback::handleComment(this[1], "FATPCalibration enabled flag: %s", v50);
  free(v9);
  return v25;
}

_QWORD *unzOpen2(char *__filename, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  FILE *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, unint64_t, _QWORD);
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int Long;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  void *v51;
  uint64_t v52;
  _OWORD __src[21];
  _BYTE v54[17];

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[19] = v2;
  __src[20] = v2;
  __src[17] = v2;
  __src[18] = v2;
  __src[15] = v2;
  __src[16] = v2;
  __src[13] = v2;
  __src[14] = v2;
  __src[11] = v2;
  __src[12] = v2;
  __src[9] = v2;
  __src[10] = v2;
  __src[8] = v2;
  __src[6] = v2;
  __src[7] = v2;
  __src[4] = v2;
  __src[5] = v2;
  __src[2] = v2;
  __src[3] = v2;
  __src[0] = v2;
  __src[1] = v2;
  if (a2)
  {
    v3 = a2[1];
    __src[0] = *a2;
    __src[1] = v3;
    v4 = a2[3];
    __src[2] = a2[2];
    __src[3] = v4;
    v5 = *((_QWORD *)&v4 + 1);
    v6 = (FILE *)(*(uint64_t (**)(_QWORD, char *, uint64_t))&__src[0])(*((_QWORD *)&v4 + 1), __filename, 5);
    *(_QWORD *)&__src[4] = v6;
    if (!v6)
      return 0;
LABEL_5:
    v7 = (uint64_t)v6;
    v8 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t, _QWORD))&__src[2];
    if (!(*(uint64_t (**)(uint64_t, FILE *, _QWORD, uint64_t))&__src[2])(v5, v6, 0, 2))
    {
      v9 = (*((uint64_t (**)(uint64_t, uint64_t))&__src[1] + 1))(v5, v7);
      v49 = v9;
      v10 = v9 >= 0xFFFF ? 0xFFFFLL : v9;
      v50 = (char *)malloc(0x404uLL);
      if (v50)
      {
        if (v10 >= 5)
        {
          v11 = v50 + 1;
          v12 = 4;
          do
          {
            v13 = v12 + 1024;
            v14 = v12 + 1024 >= v10 ? v10 : v12 + 1024;
            v15 = v14 >= 0x404 ? 1028 : v14;
            if (v8(v5, v7, v49 - v14, 0)
              || (*((uint64_t (**)(uint64_t, uint64_t, char *, unint64_t))&__src[0] + 1))(v5, v7, v50, v15) != v15)
            {
              break;
            }
            if (v15 >= 4)
            {
              v16 = (v15 - 4);
              while (v50[v16] != 80 || v11[v16] != 75 || v11[v16 + 1] != 5 || v11[v16 + 2] != 6)
              {
                if (v16-- <= 0)
                  goto LABEL_12;
              }
              if (v49 - v14 + v16)
              {
                free(v50);
                v18 = 0;
                v19 = v12 + 1024;
                if (v49 < v12 + 1024)
                  v19 = v49;
                if (v19 >= 0xFFFF)
                  v19 = 0xFFFFLL;
                v20 = v49 - v19 + v16;
                v8 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t, _QWORD))&__src[2];
                goto LABEL_36;
              }
            }
LABEL_12:
            v12 = v14;
            v8 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t, _QWORD))&__src[2];
          }
          while (v10 > v13);
        }
        free(v50);
      }
    }
    v20 = 0;
    v18 = -1;
LABEL_36:
    v21 = -1431655766;
    v22 = 0xFFFFFFAAAAAAAA00;
    v52 = 0xAAAAAAAAAAAAAAAALL;
    v23 = v8(v5, v7, v20, 0);
    Long = unzlocal_getLong((uint64_t)__src, v7, &v52);
    if (v23)
      v25 = 0;
    else
      v25 = Long == 0;
    if (!v25)
      v18 = -1;
    v26 = *(_QWORD *)&__src[4];
    v54[0] = -86;
    if ((*((unsigned int (**)(_QWORD, _QWORD, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v54, 1) == 1)
    {
      v27 = v54[0];
      v28 = (unint64_t)v54[0] << 8;
    }
    else
    {
      v27 = -1431655766;
      v28 = 0xFFFFFFAAAAAAAA00;
      if ((*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v26))
        goto LABEL_47;
    }
    v54[0] = -86;
    if ((*((unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v26, v54, 1) == 1)
    {
      v28 = (unint64_t)v54[0] << 8;
LABEL_48:
      v29 = (void *)(v28 + v27);
LABEL_49:
      v30 = *(_QWORD *)&__src[4];
      v54[0] = -86;
      v51 = v29;
      if ((*((unsigned int (**)(_QWORD, _QWORD, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v54, 1) == 1)
      {
        v31 = v54[0];
        v32 = (unint64_t)v54[0] << 8;
      }
      else
      {
        v31 = -1431655766;
        v32 = 0xFFFFFFAAAAAAAA00;
        if ((*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v30))
          goto LABEL_55;
      }
      v54[0] = -86;
      if ((*((unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v30, v54, 1) == 1)
      {
        v32 = (unint64_t)v54[0] << 8;
LABEL_56:
        v33 = v32 + v31;
LABEL_57:
        v34 = *(_QWORD *)&__src[4];
        v54[0] = -86;
        if ((*((unsigned int (**)(_QWORD, _QWORD, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v54, 1) == 1)
        {
          v35 = v54[0];
          v36 = (unint64_t)v54[0] << 8;
        }
        else
        {
          v35 = -1431655766;
          v36 = 0xFFFFFFAAAAAAAA00;
          if ((*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v34))
            goto LABEL_63;
        }
        v54[0] = -86;
        if ((*((unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v34, v54, 1) == 1)
        {
          v36 = (unint64_t)v54[0] << 8;
LABEL_64:
          v37 = v36 + v35;
LABEL_65:
          *((_QWORD *)&__src[4] + 1) = v37;
          v38 = *(_QWORD *)&__src[4];
          v54[0] = -86;
          if ((*((unsigned int (**)(_QWORD, _QWORD, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v54, 1) == 1)
          {
            v39 = v54[0];
            v40 = (unint64_t)v54[0] << 8;
          }
          else
          {
            v39 = -1431655766;
            v40 = 0xFFFFFFAAAAAAAA00;
            if ((*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v38))
              goto LABEL_71;
          }
          v54[0] = -86;
          if ((*((unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v38, v54, 1) == 1)
          {
            v40 = (unint64_t)v54[0] << 8;
LABEL_72:
            v41 = v40 + v39;
LABEL_73:
            v42 = *((_QWORD *)&__src[4] + 1);
            v43 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8]);
            v44 = unzlocal_getLong((uint64_t)__src, *(uint64_t *)&__src[4], (uint64_t *)&__src[8] + 1);
            v45 = *(_QWORD *)&__src[4];
            v54[0] = -86;
            if ((*((unsigned int (**)(_QWORD, _QWORD, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4], v54, 1) == 1)
            {
              v21 = v54[0];
              v22 = (unint64_t)v54[0] << 8;
            }
            else if ((*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v45))
            {
              goto LABEL_79;
            }
            v54[0] = -86;
            if ((*((unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))&__src[0] + 1))(*((_QWORD *)&__src[3] + 1), v45, v54, 1) == 1)
            {
              v22 = (unint64_t)v54[0] << 8;
LABEL_83:
              *(_QWORD *)&__src[5] = v22 + v21;
              if (v20 >= *(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1)
                && !v44
                && !v43
                && v41 == v42
                && !v33
                && !v51
                && !v18)
              {
                *((_QWORD *)&__src[5] + 1) = v20 - (*(_QWORD *)&__src[8] + *((_QWORD *)&__src[8] + 1));
                *((_QWORD *)&__src[7] + 1) = v20;
                *(_QWORD *)&__src[18] = 0;
                DWORD2(__src[18]) = 0;
                v46 = malloc(0x150uLL);
                memcpy(v46, __src, 0x150uLL);
                v48 = v46[17];
                v46[12] = 0;
                v46[13] = v48;
                v46[14] = unzlocal_GetCurrentFileInfoInternal((uint64_t)v46, (uint64_t)(v46 + 18), v46 + 35, 0, 0, 0, 0, 0, 0) == 0;
                return v46;
              }
              goto LABEL_80;
            }
            if (!(*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v45))
              goto LABEL_83;
LABEL_79:
            *(_QWORD *)&__src[5] = 0;
LABEL_80:
            (*((void (**)(_QWORD, _QWORD))&__src[2] + 1))(*((_QWORD *)&__src[3] + 1), *(_QWORD *)&__src[4]);
            return 0;
          }
          if (!(*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v38))
            goto LABEL_72;
LABEL_71:
          v41 = 0;
          v18 = -1;
          goto LABEL_73;
        }
        if (!(*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v34))
          goto LABEL_64;
LABEL_63:
        v37 = 0;
        v18 = -1;
        goto LABEL_65;
      }
      if (!(*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v30))
        goto LABEL_56;
LABEL_55:
      v33 = 0;
      v18 = -1;
      goto LABEL_57;
    }
    if (!(*(unsigned int (**)(_QWORD, uint64_t))&__src[3])(*((_QWORD *)&__src[3] + 1), v26))
      goto LABEL_48;
LABEL_47:
    v29 = 0;
    v18 = -1;
    goto LABEL_49;
  }
  v5 = 0;
  *(_QWORD *)&__src[0] = fopen_file_func;
  *((_QWORD *)&__src[0] + 1) = fread_file_func;
  *(_QWORD *)&__src[1] = fwrite_file_func;
  *((_QWORD *)&__src[1] + 1) = ftell_file_func;
  *(_QWORD *)&__src[2] = fseek_file_func;
  *((_QWORD *)&__src[2] + 1) = fclose_file_func;
  *(_QWORD *)&__src[3] = ferror_file_func;
  *((_QWORD *)&__src[3] + 1) = 0;
  v6 = fopen_file_func(0, __filename, 5);
  *(_QWORD *)&__src[4] = v6;
  if (v6)
    goto LABEL_5;
  return 0;
}

uint64_t unzlocal_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned __int8 v16;

  v13 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v13, 1) == 1)
  {
    v6 = v13;
    v7 = v13;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
      goto LABEL_16;
    v7 = -1431655766;
    v6 = -1431655766;
  }
  v14 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v14, 1) == 1)
  {
    v8 = v14;
    v7 = v14;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
      goto LABEL_16;
    v8 = v7;
  }
  v15 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v15, 1) == 1)
  {
    v9 = v15;
    v7 = v15;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
      goto LABEL_16;
    v9 = v7;
  }
  v16 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), a2, &v16, 1) == 1)
  {
    v10 = v16;
LABEL_18:
    result = 0;
    v11 = v6 + (v8 << 8) + (v9 << 16) + (v10 << 24);
    goto LABEL_19;
  }
  if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), a2))
  {
    v10 = v7;
    goto LABEL_18;
  }
LABEL_16:
  v11 = 0;
  result = 0xFFFFFFFFLL;
LABEL_19:
  *a3 = v11;
  return result;
}

uint64_t unzlocal_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int8x16_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int Long;
  uint32x4_t v36;
  int8x16_t v37;
  int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int v59;
  unint64_t v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int8x16_t v73;
  int8x16_t v74;
  int8x16_t v75;
  int8x16_t v76;
  unint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  int8x16_t v85;
  int8x16_t v86;
  int8x16_t v87;
  int8x16_t v88;
  int8x16_t v89;
  int8x16_t v90;
  int8x16_t v91;
  unint64_t v92;
  _BYTE v93[9];

  v82 = 0xAAAAAAAAAAAAAAAALL;
  v83 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1)
    return 4294967194;
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 104), 0)|| unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v82))
  {
    v15 = -1;
  }
  else if (v82 == 33639248)
  {
    v15 = 0;
  }
  else
  {
    v15 = -103;
  }
  v81 = a8;
  v79 = 0xFFFFFFAAAAAAAA00;
  LOBYTE(v84) = -86;
  v16 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, __int128 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v16, &v84, 1) == 1)
  {
    v17 = v84;
    v18 = (unint64_t)v84 << 8;
  }
  else
  {
    v17 = -1431655766;
    v18 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v16))
      goto LABEL_12;
  }
  LOBYTE(v84) = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, __int128 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v16, &v84, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v16))
      goto LABEL_13;
LABEL_12:
    v20 = 0;
    v15 = -1;
    goto LABEL_14;
  }
  v18 = (unint64_t)v84 << 8;
LABEL_13:
  v20 = v18 + v17;
LABEL_14:
  v92 = 0xAAAAAAAAAAAAAAAALL;
  v21.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v21.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v91 = v21;
  v90 = v21;
  v89 = v21;
  v88 = v21;
  v87 = v21;
  v86 = v21;
  v85 = v21;
  *(_QWORD *)&v84 = v20;
  v93[0] = -86;
  v22 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v22, v93, 1) == 1)
  {
    v23 = v93[0];
    v24 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v23 = -1431655766;
    v24 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v22))
      goto LABEL_20;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v22, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v22))
      goto LABEL_21;
LABEL_20:
    v25 = 0;
    v15 = -1;
    goto LABEL_22;
  }
  v24 = (unint64_t)v93[0] << 8;
LABEL_21:
  v25 = v24 + v23;
LABEL_22:
  *((_QWORD *)&v84 + 1) = v25;
  v93[0] = -86;
  v26 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v26, v93, 1) == 1)
  {
    v27 = v93[0];
    v28 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v27 = -1431655766;
    v28 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v26))
      goto LABEL_28;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v26, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v26))
      goto LABEL_29;
LABEL_28:
    v29 = 0;
    v15 = -1;
    goto LABEL_30;
  }
  v28 = (unint64_t)v93[0] << 8;
LABEL_29:
  v29 = v28 + v27;
LABEL_30:
  v85.i64[0] = v29;
  v93[0] = -86;
  v30 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v30, v93, 1) == 1)
  {
    v31 = v93[0];
    v32 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v31 = -1431655766;
    v32 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v30))
      goto LABEL_36;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v30, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v30))
      goto LABEL_37;
LABEL_36:
    v33 = -1431655766;
    v34 = 0;
    v15 = -1;
    goto LABEL_38;
  }
  v32 = (unint64_t)v93[0] << 8;
LABEL_37:
  v33 = -1431655766;
  v34 = v32 + v31;
LABEL_38:
  v85.i64[1] = v34;
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), v86.i64);
  LODWORD(v92) = (((unsigned __int32)v86.i32[0] >> 21) & 0xF) - 1;
  HIDWORD(v92) = ((unsigned __int32)v86.i32[0] >> 25) + 1980;
  v36.i32[0] = v86.i32[0];
  v37 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v86.u32[0]), (uint32x4_t)xmmword_212B56290);
  v37.i32[0] = vshlq_u32(v36, (uint32x4_t)xmmword_212B56280).u32[0];
  v91 = vandq_s8(v37, (int8x16_t)xmmword_212B562A0);
  v38 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v86.i64[1]);
  v39 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), v87.i64);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v87.i64[1]) | v39 | v38 | Long)
    v40 = -1;
  else
    v40 = v15;
  v93[0] = -86;
  v41 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v41, v93, 1) == 1)
  {
    v42 = v93[0];
    v43 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v42 = -1431655766;
    v43 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v41))
      goto LABEL_47;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v41, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v41))
      goto LABEL_48;
LABEL_47:
    v44 = 0;
    v40 = -1;
    goto LABEL_49;
  }
  v43 = (unint64_t)v93[0] << 8;
LABEL_48:
  v44 = v43 + v42;
LABEL_49:
  v88.i64[0] = v44;
  v93[0] = -86;
  v45 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v45, v93, 1) == 1)
  {
    v46 = v93[0];
    v47 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v46 = -1431655766;
    v47 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v45))
      goto LABEL_55;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v45, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v45))
      goto LABEL_56;
LABEL_55:
    v48 = 0;
    v40 = -1;
    goto LABEL_57;
  }
  v47 = (unint64_t)v93[0] << 8;
LABEL_56:
  v48 = v47 + v46;
LABEL_57:
  v88.i64[1] = v48;
  v93[0] = -86;
  v49 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v49, v93, 1) == 1)
  {
    v50 = v93[0];
    v51 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v50 = -1431655766;
    v51 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v49))
      goto LABEL_63;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v49, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v49))
      goto LABEL_64;
LABEL_63:
    v52 = 0;
    v40 = -1;
    goto LABEL_65;
  }
  v51 = (unint64_t)v93[0] << 8;
LABEL_64:
  v52 = v51 + v50;
LABEL_65:
  v89.i64[0] = v52;
  v93[0] = -86;
  v53 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v53, v93, 1) == 1)
  {
    v54 = v93[0];
    v55 = (unint64_t)v93[0] << 8;
  }
  else
  {
    v54 = -1431655766;
    v55 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v53))
      goto LABEL_71;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v53, v93, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v53))
      goto LABEL_72;
LABEL_71:
    v56 = 0;
    v40 = -1;
    goto LABEL_73;
  }
  v55 = (unint64_t)v93[0] << 8;
LABEL_72:
  v56 = v55 + v54;
LABEL_73:
  v89.i64[1] = v56;
  v93[0] = -86;
  v57 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v57, v93, 1) == 1)
  {
    v33 = v93[0];
    v79 = (unint64_t)v93[0] << 8;
  }
  else if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v57))
  {
    goto LABEL_79;
  }
  v93[0] = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, _BYTE *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v57, v93, 1) != 1)
  {
    v59 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v57);
    v58 = v79;
    if (!v59)
      goto LABEL_80;
LABEL_79:
    v60 = 0;
    v40 = -1;
    goto LABEL_81;
  }
  v58 = (unint64_t)v93[0] << 8;
LABEL_80:
  v60 = v58 + v33;
LABEL_81:
  v90.i64[0] = v60;
  v61 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v90.i64[1]);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v83) | v61)
    v19 = 0xFFFFFFFFLL;
  else
    v19 = v40;
  v62 = v88.i64[0];
  if (a4 && !(_DWORD)v19)
  {
    v63 = a5;
    if (v88.i64[0] < a5)
    {
      *(_BYTE *)(a4 + v88.i64[0]) = 0;
      v63 = v62;
    }
    v19 = 0;
    if (a5 && v62)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a4, v63) == v63)v19 = 0;
      else
        v19 = 0xFFFFFFFFLL;
    }
    v62 -= v63;
  }
  v64 = v88.i64[1];
  if (!a6 || (_DWORD)v19)
  {
    v70 = v88.i64[1] + v62;
    v69 = v81;
    v68 = a3;
    if (!v81)
      goto LABEL_130;
    goto LABEL_116;
  }
  if (v88.i64[1] >= a7)
    v65 = a7;
  else
    v65 = v88.i64[1];
  if (v62)
  {
    v66 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v62, 1);
    if (v66)
      v19 = 0xFFFFFFFFLL;
    else
      v19 = 0;
    if (v66)
      v67 = v62;
    else
      v67 = 0;
    v69 = v81;
    v68 = a3;
    if (!a7)
      goto LABEL_115;
  }
  else
  {
    v19 = 0;
    v67 = 0;
    v69 = v81;
    v68 = a3;
    if (!a7)
      goto LABEL_115;
  }
  if (v64)
  {
    if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a6, v65) == v65)v19 = v19;
    else
      v19 = 0xFFFFFFFFLL;
  }
LABEL_115:
  v70 = v64 - v65 + v67;
  if (!v69)
    goto LABEL_130;
LABEL_116:
  if (!(_DWORD)v19)
  {
    v71 = v89.i64[0];
    v72 = a9;
    if (v89.i64[0] < a9)
    {
      *(_BYTE *)(v69 + v89.i64[0]) = 0;
      v72 = v71;
    }
    if (v70)
    {
      if ((*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v70, 1))
      {
        v19 = 0xFFFFFFFFLL;
      }
      else
      {
        v19 = 0;
      }
      if (!a9)
        goto LABEL_130;
LABEL_126:
      if (v71)
      {
        if ((*(uint64_t (**)(_QWORD, _QWORD, uint64_t, unint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v69, v72) == v72)v19 = v19;
        else
          v19 = 0xFFFFFFFFLL;
      }
      goto LABEL_130;
    }
    v19 = 0;
    if (a9)
      goto LABEL_126;
  }
LABEL_130:
  if (a2 && !(_DWORD)v19)
  {
    v73 = v91;
    *(int8x16_t *)(a2 + 96) = v90;
    *(int8x16_t *)(a2 + 112) = v73;
    *(_QWORD *)(a2 + 128) = v92;
    v74 = v87;
    *(int8x16_t *)(a2 + 32) = v86;
    *(int8x16_t *)(a2 + 48) = v74;
    v75 = v89;
    *(int8x16_t *)(a2 + 64) = v88;
    *(int8x16_t *)(a2 + 80) = v75;
    v76 = v85;
    *(_OWORD *)a2 = v84;
    *(int8x16_t *)(a2 + 16) = v76;
  }
  if (v68 && !(_DWORD)v19)
    *v68 = v83;
  return v19;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, _BYTE *a5)
{
  uint64_t v10;
  uint64_t v11;
  int Long;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  const z_crc_t *crc_table;
  int v49;
  unsigned __int8 *v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  unint64_t v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v64 = -1431655766;
  v63 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1 || !*(_QWORD *)(a1 + 112))
    return 4294967194;
  v10 = *(_QWORD *)(a1 + 288);
  if (v10)
  {
    if (*(_QWORD *)v10)
      free(*(void **)v10);
    *(_QWORD *)v10 = 0;
    if (*(_QWORD *)(v10 + 128))
      inflateEnd((z_streamp)(v10 + 8));
    free((void *)v10);
    *(_QWORD *)(a1 + 288) = 0;
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88) + *(_QWORD *)(a1 + 280), 0))
  {
    return 4294967193;
  }
  v61 = 0xAAAAAAAAAAAAAAAALL;
  Long = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v61);
  if (v61 == 67324752)
    v14 = 0;
  else
    v14 = -103;
  if (Long)
    v15 = -1;
  else
    v15 = v14;
  v62 = -86;
  v16 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v16, &v62, 1) == 1)
  {
    v17 = v62;
    v18 = (unint64_t)v62 << 8;
  }
  else
  {
    v17 = -1431655766;
    v18 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v16))
      goto LABEL_25;
  }
  v62 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v16, &v62, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v16))
      goto LABEL_26;
LABEL_25:
    v19 = 0;
    v15 = -1;
    goto LABEL_27;
  }
  v18 = (unint64_t)v62 << 8;
LABEL_26:
  v19 = v18 + v17;
LABEL_27:
  v60 = v19;
  v62 = -86;
  v20 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v20, &v62, 1) == 1)
  {
    v21 = v62;
  }
  else
  {
    v21 = -86;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v20))
    {
LABEL_32:
      v22 = 0;
      v15 = -1;
      goto LABEL_34;
    }
  }
  v62 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v20, &v62, 1) != 1&& (*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v20))
  {
    goto LABEL_32;
  }
  v22 = v21;
LABEL_34:
  v62 = -86;
  v23 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v23, &v62, 1) == 1)
  {
    v24 = v62;
    v25 = (unint64_t)v62 << 8;
  }
  else
  {
    v24 = -1431655766;
    v25 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v23))
      goto LABEL_40;
  }
  v62 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v23, &v62, 1) != 1)
  {
    if (!(*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v23))
      goto LABEL_41;
LABEL_40:
    v60 = 0;
    v15 = -1;
    goto LABEL_46;
  }
  v25 = (unint64_t)v62 << 8;
LABEL_41:
  v26 = v25 + v24;
  v60 = v25 + v24;
  if (!v15)
  {
    v15 = -103;
    if (v26 == *(_QWORD *)(a1 + 168))
    {
      if ((v26 & 0xFFFFFFFFFFFFFFF7) != 0)
        v15 = -103;
      else
        v15 = 0;
    }
  }
LABEL_46:
  v27 = unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v60);
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v60))
  {
    v15 = -1;
  }
  else
  {
    if (v27)
      v15 = -1;
    if (!v15)
    {
      if (v60 == *(_QWORD *)(a1 + 184))
      {
        v15 = 0;
      }
      else if ((v22 & 8) != 0)
      {
        v15 = 0;
      }
      else
      {
        v15 = -103;
      }
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v60))
  {
    v15 = -1;
  }
  else if (!v15)
  {
    if (v60 == *(_QWORD *)(a1 + 192))
    {
      v15 = 0;
    }
    else if ((v22 & 8) != 0)
    {
      v15 = 0;
    }
    else
    {
      v15 = -103;
    }
  }
  if (unzlocal_getLong(a1, *(_QWORD *)(a1 + 64), &v60))
  {
    v15 = -1;
  }
  else if (!v15)
  {
    if (v60 == *(_QWORD *)(a1 + 200))
    {
      v15 = 0;
    }
    else if ((v22 & 8) != 0)
    {
      v15 = 0;
    }
    else
    {
      v15 = -103;
    }
  }
  v62 = -86;
  v28 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v28, &v62, 1) == 1)
  {
    v29 = v62;
    v30 = (unint64_t)v62 << 8;
  }
  else
  {
    v29 = -1431655766;
    v30 = 0xFFFFFFAAAAAAAA00;
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v28))
      goto LABEL_78;
  }
  v62 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v28, &v62, 1) == 1)
  {
    v30 = (unint64_t)v62 << 8;
    goto LABEL_79;
  }
  if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v28))
  {
LABEL_78:
    v31 = 0;
    v15 = -1;
    goto LABEL_83;
  }
LABEL_79:
  v31 = v30 + v29;
  if (!v15)
  {
    if (v31 == *(_QWORD *)(a1 + 208))
      v15 = 0;
    else
      v15 = -103;
  }
LABEL_83:
  v62 = -86;
  v32 = *(_QWORD *)(a1 + 64);
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v32, &v62, 1) == 1)
  {
    v33 = v62;
    v34 = v62 << 8;
  }
  else
  {
    if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v32))
      return 4294967193;
    v34 = -1431655936;
    v33 = -1431655766;
  }
  v62 = -86;
  if ((*(unsigned int (**)(_QWORD, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), v32, &v62, 1) == 1)
  {
    v34 = v62 << 8;
    goto LABEL_90;
  }
  if ((*(unsigned int (**)(_QWORD, uint64_t))(a1 + 48))(*(_QWORD *)(a1 + 56), v32))
    return 4294967193;
LABEL_90:
  if (v15)
    return 4294967193;
  v35 = *(_QWORD *)(a1 + 280);
  v36 = (char *)malloc(0x120uLL);
  if (!v36)
    return 4294967192;
  v37 = v36;
  v38 = v34 + v33;
  v39 = malloc(0x4000uLL);
  *(_QWORD *)v37 = v39;
  *((_QWORD *)v37 + 17) = v31 + v35 + 30;
  *((_DWORD *)v37 + 36) = v38;
  *((_QWORD *)v37 + 19) = 0;
  *((_DWORD *)v37 + 70) = a4;
  if (!v39)
  {
    free(v37);
    return 4294967192;
  }
  *((_QWORD *)v37 + 16) = 0;
  if (a2)
    *a2 = *(_QWORD *)(a1 + 168);
  if (!a3)
    goto LABEL_104;
  *a3 = 6;
  v40 = *(_QWORD *)(a1 + 160) & 6;
  switch(v40)
  {
    case 2:
      v41 = 9;
      goto LABEL_103;
    case 6:
      v41 = 1;
      goto LABEL_103;
    case 4:
      v41 = 2;
LABEL_103:
      *a3 = v41;
      break;
  }
LABEL_104:
  v42 = *(_QWORD *)(a1 + 184);
  *((_QWORD *)v37 + 20) = 0;
  *((_QWORD *)v37 + 21) = v42;
  v43 = *(_QWORD *)(a1 + 168);
  *((_QWORD *)v37 + 32) = *(_QWORD *)(a1 + 64);
  *((_QWORD *)v37 + 33) = v43;
  v44 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v37 + 12) = *(_OWORD *)a1;
  *((_OWORD *)v37 + 13) = v44;
  v45 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v37 + 14) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v37 + 15) = v45;
  *((_QWORD *)v37 + 34) = *(_QWORD *)(a1 + 88);
  *((_QWORD *)v37 + 6) = 0;
  if (!a4 && v43 == 8)
  {
    *((_QWORD *)v37 + 1) = 0;
    *((_DWORD *)v37 + 4) = 0;
    *((_QWORD *)v37 + 10) = 0;
    *((_QWORD *)v37 + 11) = 0;
    *((_QWORD *)v37 + 9) = 0;
    v46 = inflateInit2_((z_streamp)(v37 + 8), -15, "1.2.12", 112);
    if ((_DWORD)v46)
    {
      v11 = v46;
      free(v37);
      return v11;
    }
    *((_QWORD *)v37 + 16) = 1;
    v35 = *(_QWORD *)(a1 + 280);
  }
  *((_OWORD *)v37 + 11) = *(_OWORD *)(a1 + 192);
  *((_QWORD *)v37 + 15) = v35 + (v38 + v31) + 30;
  *((_DWORD *)v37 + 4) = 0;
  *(_QWORD *)(a1 + 288) = v37;
  if (!a5)
    return 0;
  v47 = 878082192;
  crc_table = get_crc_table();
  *(_OWORD *)(a1 + 304) = xmmword_212B562B0;
  *(_QWORD *)(a1 + 320) = 878082192;
  *(_QWORD *)(a1 + 328) = crc_table;
  v49 = *a5;
  if (*a5)
  {
    v50 = a5 + 1;
    v51 = 305419896;
    v52 = 591751049;
    do
    {
      v51 = crc_table[v49 ^ v51] ^ (v51 >> 8);
      v52 = 134775813 * (v52 + v51) + 1;
      *(_QWORD *)(a1 + 304) = v51;
      *(_QWORD *)(a1 + 312) = v52;
      v47 = crc_table[(v47 ^ BYTE3(v52))] ^ (v47 >> 8);
      *(_QWORD *)(a1 + 320) = v47;
      v53 = *v50++;
      v49 = v53;
    }
    while (v53);
  }
  if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 288) + 272) + *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120), 0)|| (unint64_t)(*(uint64_t (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v63, 12) < 0xC)
  {
    return 4294967192;
  }
  v54 = 0;
  v56 = *(_QWORD *)(a1 + 320);
  v55 = *(_QWORD *)(a1 + 328);
  v57 = *(_QWORD *)(a1 + 304);
  v58 = *(_QWORD *)(a1 + 312);
  do
  {
    v59 = *((_BYTE *)&v63 + v54) ^ ((unsigned __int16)((v56 & 0xFFFD ^ 3) * (v56 | 2)) >> 8);
    *((_BYTE *)&v63 + v54) = v59;
    v57 = *(_QWORD *)(v55 + 8 * (v59 ^ v57)) ^ (v57 >> 8);
    v58 = 134775813 * (v58 + v57) + 1;
    *(_QWORD *)(a1 + 304) = v57;
    *(_QWORD *)(a1 + 312) = v58;
    v56 = *(_QWORD *)(v55 + 8 * (v56 ^ BYTE3(v58))) ^ (v56 >> 8);
    *(_QWORD *)(a1 + 320) = v56;
    ++v54;
  }
  while (v54 != 12);
  v11 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 288) + 120) += 12;
  *(_DWORD *)(a1 + 296) = 1;
  return v11;
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t i;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const Bytef *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (!a1)
    return 4294967194;
  v4 = *(_QWORD *)(a1 + 288);
  if (!v4)
    return 4294967194;
  if (!*(_QWORD *)v4)
    return 4294967196;
  if (!a3)
    return 0;
  *(_QWORD *)(v4 + 32) = a2;
  *(_DWORD *)(v4 + 40) = a3;
  v5 = a3;
  v6 = *(_QWORD *)(v4 + 184);
  if (v6 < a3 && !*(_DWORD *)(v4 + 280))
  {
    *(_DWORD *)(v4 + 40) = v6;
    a3 = v6;
  }
  v7 = *(_QWORD *)(v4 + 176);
  v8 = *(unsigned int *)(v4 + 16);
  if (v7 + v8 < v5 && *(_DWORD *)(v4 + 280))
  {
    a3 = v8 + v7;
    *(_DWORD *)(v4 + 40) = v8 + v7;
  }
  v9 = 0;
  if (a3)
  {
    do
    {
      while (1)
      {
        LODWORD(v14) = *(_DWORD *)(v4 + 16);
        if (!(_DWORD)v14)
          break;
        if (*(_QWORD *)(v4 + 264))
          goto LABEL_19;
LABEL_20:
        if ((_DWORD)v14 || *(_QWORD *)(v4 + 176))
        {
          v15 = *(_DWORD *)(v4 + 40);
          v14 = v15 >= v14 ? v14 : v15;
          if ((_DWORD)v14)
          {
            for (i = 0; i != v14; ++i)
              *(_BYTE *)(*(_QWORD *)(v4 + 32) + i) = *(_BYTE *)(*(_QWORD *)(v4 + 8) + i);
            v11 = v14;
          }
          else
          {
            v11 = 0;
          }
          *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), *(const Bytef **)(v4 + 32), v14);
          *(_QWORD *)(v4 + 184) -= v11;
          *(_DWORD *)(v4 + 16) -= v14;
          v12 = *(_DWORD *)(v4 + 40);
          *(_QWORD *)(v4 + 32) += v11;
          *(_QWORD *)(v4 + 8) += v11;
          *(_QWORD *)(v4 + 48) += v11;
          v9 = (v14 + v9);
          v13 = v12 - v14;
          *(_DWORD *)(v4 + 40) = v13;
          if (v13)
            continue;
        }
        return v9;
      }
      v17 = *(_QWORD *)(v4 + 176);
      if (v17)
      {
        if (v17 >= 0x4000)
          v14 = 0x4000;
        else
          v14 = *(_QWORD *)(v4 + 176);
        if ((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v4 + 224))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)(v4 + 272) + *(_QWORD *)(v4 + 120), 0)|| (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(v4 + 200))(*(_QWORD *)(v4 + 248), *(_QWORD *)(v4 + 256), *(_QWORD *)v4, v14) != v14)
        {
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)(a1 + 296))
        {
          v18 = 0;
          do
          {
            v19 = *(_QWORD *)(a1 + 328);
            v20 = *(unsigned __int8 *)(*(_QWORD *)v4 + v18) ^ (((*(_DWORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                              * (*(_DWORD *)(a1 + 320) | 2u)) >> 8);
            *(_BYTE *)(*(_QWORD *)v4 + v18) ^= (unsigned __int16)((*(_WORD *)(a1 + 320) & 0xFFFD ^ 3)
                                                                * (*(_WORD *)(a1 + 320) | 2)) >> 8;
            v21 = *(_QWORD *)(v19 + 8 * (v20 ^ *(_QWORD *)(a1 + 304))) ^ (*(_QWORD *)(a1 + 304) >> 8);
            v22 = 134775813 * (*(_QWORD *)(a1 + 312) + v21) + 1;
            *(_QWORD *)(a1 + 304) = v21;
            *(_QWORD *)(a1 + 312) = v22;
            *(_QWORD *)(a1 + 320) = *(_QWORD *)(v19 + 8 * (*(_QWORD *)(a1 + 320) ^ BYTE3(v22))) ^ (*(_QWORD *)(a1 + 320) >> 8);
            *(_BYTE *)(*(_QWORD *)v4 + v18++) = v20;
          }
          while (v14 != v18);
        }
        *(_QWORD *)(v4 + 120) += v14;
        *(_QWORD *)(v4 + 176) -= v14;
        *(_QWORD *)(v4 + 8) = *(_QWORD *)v4;
        *(_DWORD *)(v4 + 16) = v14;
        if (!*(_QWORD *)(v4 + 264))
          goto LABEL_20;
      }
      else
      {
        LODWORD(v14) = 0;
        if (!*(_QWORD *)(v4 + 264))
          goto LABEL_20;
      }
LABEL_19:
      if (*(_DWORD *)(v4 + 280))
        goto LABEL_20;
      v23 = *(_QWORD *)(v4 + 48);
      v24 = *(const Bytef **)(v4 + 32);
      v25 = inflate((z_streamp)(v4 + 8), 2);
      if ((v25 & 0x80000000) == 0 && *(_QWORD *)(v4 + 56))
      {
        v27 = *(_QWORD *)(v4 + 48);
        v28 = v27 - v23;
        *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v24, (int)v27 - (int)v23);
        *(_QWORD *)(v4 + 184) -= v28;
        return 4294967293;
      }
      v26 = *(_QWORD *)(v4 + 48) - v23;
      *(_QWORD *)(v4 + 160) = crc32(*(_QWORD *)(v4 + 160), v24, v26);
      *(_QWORD *)(v4 + 184) -= v26;
      v9 = (v9 + v26);
      if (v25)
      {
        if (v25 == 1)
          return v9;
        else
          return v25;
      }
    }
    while (*(_DWORD *)(v4 + 40));
  }
  return v9;
}

uint64_t BBUEUR13Loader::connect(uint64_t a1)
{
  BBUFeedback::handleBeginQuickStep(*(BBUFeedback **)(a1 + 8), "Connecting to Loader");
  (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8), 0);
  return 0;
}

uint64_t BBUEUR13Loader::getVersion(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  __int128 v5;
  size_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *__p[2];
  __int128 v23;
  __int128 v24;
  _OWORD v25[9];
  unint64_t v26;

  BBUFeedback::handleBeginQuickStep(*(BBUFeedback **)(a1 + 8), "Getting Version");
  if (!a3)
  {
    v8 = 2;
    goto LABEL_21;
  }
  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v5;
  v25[8] = v5;
  v25[5] = v5;
  v25[6] = v5;
  v25[3] = v5;
  v25[4] = v5;
  v25[1] = v5;
  v25[2] = v5;
  v24 = v5;
  v25[0] = v5;
  *(_OWORD *)__p = v5;
  v23 = v5;
  v20 = v5;
  v21 = v5;
  v18 = v5;
  v19 = v5;
  v17 = v5;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    v9 = v24;
    if ((unint64_t)v24 < *((_QWORD *)&v21 + 1))
    {
      *(_QWORD *)&v24 = *((_QWORD *)&v21 + 1);
      v9 = *((_QWORD *)&v21 + 1);
    }
    v10 = (const void *)v21;
    v6 = v9 - v21;
    if ((unint64_t)(v9 - v21) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_23;
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      v6 = 0;
      HIBYTE(v16) = 0;
      v7 = __dst;
      goto LABEL_16;
    }
    v10 = (const void *)*((_QWORD *)&v19 + 1);
    v6 = *((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_23:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v6 >= 0x17)
  {
    v11 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v11 = v6 | 7;
    v12 = v11 + 1;
    v7 = (void **)operator new(v11 + 1);
    __dst[1] = (void *)v6;
    v16 = v12 | 0x8000000000000000;
    __dst[0] = v7;
  }
  else
  {
    HIBYTE(v16) = v6;
    v7 = __dst;
    if (!v6)
      goto LABEL_16;
  }
  memmove(v7, v10, v6);
LABEL_16:
  *((_BYTE *)v7 + v6) = 0;
  *a3 = BBULoaderVersion::createFromVersionString((uint64_t)__dst);
  if (SHIBYTE(v16) < 0)
    operator delete(__dst[0]);
  *(_QWORD *)&v17 = *MEMORY[0x24BEDB7F0];
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v18 = v13;
  *((_QWORD *)&v18 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v23) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BFA3D0](v25);
  v8 = 0;
LABEL_21:
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8), v8);
  return v8;
}

void sub_212B37A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
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

uint64_t BBUEUR13Loader::queryChipInfo(BBUFeedback **a1, uint64_t a2, _QWORD *a3)
{
  UInt8 *v6;
  unsigned int (*v7)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, _QWORD);
  unsigned int v8;
  _QWORD *v9;
  const void *v10;
  size_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  BBUFeedback *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void **v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, _QWORD);
  _QWORD *v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, _QWORD, UInt8 *, uint64_t, int *, _QWORD);
  _QWORD *v37;
  char v38;
  void *__p[2];
  char v40;
  void *v41[2];
  char v42;
  int v43;

  v6 = (UInt8 *)operator new(0x60uLL);
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  v43 = 0;
  v7 = *(unsigned int (**)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, _QWORD))(a2 + 40);
  if (!v7 || !v7(a2, 4, v6, 96, &v43, 0))
  {
    BBUFeedback::handleComment(a1[1], "Failed to get chip info: Failed to read pk hash");
LABEL_10:
    BBUFeedback::handleComment(a1[1], "failed to read MSMHWID");
    goto LABEL_11;
  }
  v8 = (*((uint64_t (**)(BBUFeedback **))*a1 + 11))(a1);
  v9 = operator new(0x10uLL);
  *v9 = off_24CE84A18;
  v9[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v8);
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v9);
  v10 = (const void *)(*((uint64_t (**)(BBUFeedback **))*a1 + 12))(a1);
  v11 = (*((uint64_t (**)(BBUFeedback **))*a1 + 11))(a1);
  if (!memcmp(v10, v6, v11))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      v12 = 1;
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
        goto LABEL_41;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v12 = 1;
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
        goto LABEL_41;
    }
    if (gBBULogVerbosity >= 1)
    {
      v29 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
      _BBULog(9, 1, v29, "", "Detect as unfused BB\n", v30, v31, v32, v38);
    }
  }
  else
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      v12 = 3;
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
        goto LABEL_41;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v12 = 3;
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
        goto LABEL_41;
    }
    if (gBBULogVerbosity >= 1)
    {
      v13 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
      _BBULog(9, 1, v13, "", "Detect as fused BB\n", v14, v15, v16, v38);
    }
  }
LABEL_41:
  *((_DWORD *)a3 + 22) = v12;
  v33 = *(unsigned int (**)(uint64_t, uint64_t, UInt8 *, uint64_t, int *, _QWORD))(a2 + 40);
  if (!v33 || !v33(a2, 3, v6, 24, &v43, 0))
    goto LABEL_10;
  v34 = BBUEURPersonalizationParameters::EURChipID::createFromChipID((BBUEURPersonalizationParameters::EURChipID *)*((unsigned int *)v6 + 1));
  v35 = a3[2];
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
  a3[2] = v34;
  v36 = *(unsigned int (**)(uint64_t, _QWORD, UInt8 *, uint64_t, int *, _QWORD))(a2 + 40);
  if (!v36 || !v36(a2, 0, v6, 4, &v43, 0))
  {
LABEL_11:
    BBUFeedback::handleComment(a1[1], "failed to read MSMHWID");
    v17 = 98;
    v18 = -559030611;
    v19 = a1[1];
    v20 = a3[2];
    v21 = -559030611;
    if (!v20)
      goto LABEL_13;
    goto LABEL_12;
  }
  v37 = BBUEURPersonalizationParameters::EURSerialNumber::createFromSerialNumber((BBUEURPersonalizationParameters::EURSerialNumber *)v6, (const unsigned __int8 *)0x20);
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 16))(a3, v37);
  v17 = 0;
  v18 = -559030611;
  v19 = a1[1];
  v20 = a3[2];
  v21 = -559030611;
  if (v20)
LABEL_12:
    v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
LABEL_13:
  v22 = a3[4];
  if (!v22)
  {
    v24 = "failed";
    v25 = a3[5];
    if (v25)
      goto LABEL_22;
LABEL_27:
    v26 = "failed";
    v27 = a3[3];
    if (!v27)
      goto LABEL_29;
LABEL_28:
    v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 24))(v27);
    goto LABEL_29;
  }
  v23 = v41;
  (*(void (**)(void **__return_ptr, _QWORD))(*(_QWORD *)v22 + 24))(v41, a3[4]);
  if (v42 < 0)
    v23 = (void **)v41[0];
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_18;
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_18;
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_18:
  if (BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS)
    v24 = (const char *)v23;
  else
    v24 = "<< SNUM >>";
  v25 = a3[5];
  if (!v25)
    goto LABEL_27;
LABEL_22:
  v26 = (const char *)__p;
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v25 + 24))(__p, v25);
  if (v40 < 0)
    v26 = (const char *)__p[0];
  v27 = a3[3];
  if (v27)
    goto LABEL_28;
LABEL_29:
  BBUFeedback::handleComment(v19, "CHIPID=0x%x SNUM=0x%s, PKHASH=0x%s CERTID=0x%x\n", v21, v24, v26, v18);
  if (v25 && v40 < 0)
    operator delete(__p[0]);
  if (v22 && v42 < 0)
    operator delete(v41[0]);
  operator delete(v6);
  return v17;
}

void sub_212B37F28(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B37F3C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B37F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;
  uint64_t v26;

  if (v26)
  {
    if (a25 < 0)
    {
      operator delete(__p);
      operator delete(v25);
      _Unwind_Resume(a1);
    }
  }
  operator delete(v25);
  _Unwind_Resume(a1);
}

uint64_t BBUEUR13Loader::load(BBUFeedback **a1, uint64_t a2, BBUDataSource *a3, char a4)
{
  CFDataRef v8;
  int v9;
  _DWORD *v10;
  _WORD *v11;
  _WORD *v12;
  int v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t (*v22)(uint64_t, void *, size_t, int *, uint64_t, int *, _QWORD);
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFDataRef v41;
  int v42;
  int v43;

  BBUFeedback::handleComment(a1[1], "Loading second stage bootloader");
  if (a2 && a3)
  {
    v42 = -1;
    v43 = 0;
    BBUDataSource::createData(a3, &v41);
    v8 = v41;
    v9 = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)a3 + 32))(a3);
    v10 = operator new(0x18uLL);
    v10[4] = v9;
    *(_QWORD *)v10 = off_24CE84890;
    *((_QWORD *)v10 + 1) = v8;
    if (v8)
    {
      CFRetain(v8);
      CFRelease(v8);
    }
    v11 = operator new(0x58uLL);
    BBUEURMIImage::BBUEURMIImage((BBUEURMIImage *)v11, (BBUDataSource *)v10, 0);
    *(_QWORD *)v11 = &unk_24CE821A0;
    *((_QWORD *)v11 + 8) = 0;
    v12 = v11 + 32;
    *((_QWORD *)v11 + 9) = 0;
    *((_QWORD *)v11 + 10) = 0;
    if ((a4 & 1) != 0)
    {
      *((_BYTE *)v11 + 66) = 76;
      *v12 = 16979;
      *((_BYTE *)v11 + 87) = 3;
      v13 = *((_DWORD *)v11 + 8);
      v14 = (v13 + 40);
      if (v13 != -40)
      {
LABEL_7:
        v15 = operator new(v14);
        bzero(v15, v14);
        goto LABEL_14;
      }
    }
    else
    {
      v11[36] = 19522;
      *(_QWORD *)v12 = *(_QWORD *)"restoreSBL";
      *((_BYTE *)v11 + 87) = 10;
      v21 = *((_DWORD *)v11 + 8);
      v14 = (v21 + 40);
      if (v21 != -40)
        goto LABEL_7;
    }
    v15 = 0;
LABEL_14:
    BBUEURMIImage::getWritePayloadData((BBUEURMIImage *)v11, (unsigned __int8 *)v15, v14, 0);
    (*(void (**)(_WORD *))(*(_QWORD *)v11 + 16))(v11);
    v22 = *(uint64_t (**)(uint64_t, void *, size_t, int *, uint64_t, int *, _QWORD))(a2 + 32);
    if (v22)
    {
      v23 = v22(a2, v15, v14, &v43, 10000, &v42, 0);
      if (gBBULogMaskGet(void)::once == -1)
        goto LABEL_16;
    }
    else
    {
      v23 = 0;
      if (gBBULogMaskGet(void)::once == -1)
      {
LABEL_16:
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
          goto LABEL_21;
LABEL_17:
        if (gBBULogVerbosity >= 1)
        {
          v24 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
          v28 = "failure";
          if (v23)
            v28 = "success";
          _BBULog(9, 1, v24, "", "SendImage returned %s, amountWritten = %u, errorCode = %#x\n", v25, v26, v27, (char)v28);
        }
LABEL_21:
        if ((v23 & 1) != 0)
        {
          v29 = gBBULogMaskGet(void)::once;
          if (v43 == (_DWORD)v14 && !v42)
          {
            if (gBBULogMaskGet(void)::once == -1)
            {
              v16 = 0;
              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) != 0)
                goto LABEL_26;
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              v16 = 0;
              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) != 0)
              {
LABEL_26:
                if (gBBULogVerbosity >= 1)
                {
                  v30 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
                  v31 = (*(uint64_t (**)(_WORD *))(*(_QWORD *)v11 + 16))(v11);
                  _BBULog(9, 1, v30, "", "Sent %s sucessfully!\n", v32, v33, v34, v31);
                  v16 = 0;
                }
              }
            }
LABEL_33:
            if (v15)
              operator delete(v15);
            (*(void (**)(_WORD *))(*(_QWORD *)v11 + 8))(v11);
            return v16;
          }
        }
        else
        {
          v29 = gBBULogMaskGet(void)::once;
        }
        if (v29 == -1)
        {
          v16 = 3;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
            goto LABEL_33;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          v16 = 3;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
            goto LABEL_33;
        }
        if (gBBULogVerbosity >= 1)
        {
          v35 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
          v36 = (*(uint64_t (**)(_WORD *))(*(_QWORD *)v11 + 16))(v11);
          _BBULog(9, 1, v35, "", "Fail to send %s !\n", v37, v38, v39, v36);
        }
        goto LABEL_33;
      }
    }
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    v16 = 2;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
      return v16;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v16 = 2;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 2) == 0)
      return v16;
  }
  if (gBBULogVerbosity >= 1)
  {
    v17 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 9))(a1);
    _BBULog(9, 1, v17, "", "invalid arguments transport:  %p, updateSource: %p\n", v18, v19, v20, a2);
  }
  return v16;
}

void sub_212B3845C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_212B3847C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B38490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_212B384A4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  if (v2)
    operator delete(v2);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUEUR13Loader::go()
{
  return 0;
}

const char *BBUEUR13Loader::getDebugName(BBUEUR13Loader *this)
{
  return "BBUEUR13Loader";
}

uint64_t BBUEUR13Loader::getPKHashLength(BBUEUR13Loader *this)
{
  return 32;
}

uint64_t BBUEUR13Loader::getEURDefaultHashData(BBUEUR13Loader *this)
{
  return (uint64_t)this + 41;
}

void BBUPartitionManager::BBUPartitionManager(BBUPartitionManager *this)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  _DWORD *v18;
  uint64_t v19;
  _BYTE v20[7];
  _BYTE v21[7];
  _BYTE v22[7];

  *((_QWORD *)this + 1) = 0;
  v2 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  v3 = *((_QWORD *)this + 1);
  v4 = (_QWORD *)((char *)this + 8);
  v5 = (_QWORD *)((char *)this + 8);
  if (v3)
  {
    while (1)
    {
      while (1)
      {
        v5 = (_QWORD *)v3;
        v6 = *(_DWORD *)(v3 + 32);
        if (v6 < 1)
          break;
        v3 = *v5;
        v4 = v5;
        if (!*v5)
          goto LABEL_8;
      }
      if ((v6 & 0x80000000) == 0)
        break;
      v3 = v5[1];
      if (!v3)
      {
        v4 = v5 + 1;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v7 = operator new(0x40uLL);
    v7[8] = 0;
    *((_QWORD *)v7 + 5) = 0;
    v7[14] = *(_DWORD *)v22;
    *(_DWORD *)((char *)v7 + 59) = *(_DWORD *)&v22[3];
    *((_BYTE *)v7 + 63) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v5;
    *v4 = v7;
    v8 = **(_QWORD **)this;
    if (v8)
    {
      *(_QWORD *)this = v8;
      v7 = (_DWORD *)*v4;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v7);
    ++*((_QWORD *)this + 2);
  }
  v9 = *v2;
  v10 = v2;
  v11 = v2;
  if (*v2)
  {
    while (1)
    {
      while (1)
      {
        v11 = (_QWORD *)v9;
        v12 = *(_DWORD *)(v9 + 32);
        if (v12 <= 1)
          break;
        v9 = *v11;
        v10 = v11;
        if (!*v11)
          goto LABEL_18;
      }
      if (v12 == 1)
        break;
      v9 = v11[1];
      if (!v9)
      {
        v10 = v11 + 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    v13 = operator new(0x40uLL);
    v13[8] = 1;
    *((_QWORD *)v13 + 5) = 0;
    v13[14] = *(_DWORD *)v21;
    *(_DWORD *)((char *)v13 + 59) = *(_DWORD *)&v21[3];
    *((_BYTE *)v13 + 63) = 0;
    *(_QWORD *)v13 = 0;
    *((_QWORD *)v13 + 1) = 0;
    *((_QWORD *)v13 + 2) = v11;
    *v10 = v13;
    v14 = **(_QWORD **)this;
    if (v14)
    {
      *(_QWORD *)this = v14;
      v13 = (_DWORD *)*v10;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v13);
    ++*((_QWORD *)this + 2);
  }
  v15 = *v2;
  v16 = v2;
  if (*v2)
  {
    while (1)
    {
      while (1)
      {
        v16 = (_QWORD *)v15;
        v17 = *(_DWORD *)(v15 + 32);
        if (v17 <= 2)
          break;
        v15 = *v16;
        v2 = v16;
        if (!*v16)
          goto LABEL_28;
      }
      if (v17 == 2)
        break;
      v15 = v16[1];
      if (!v15)
      {
        v2 = v16 + 1;
        goto LABEL_28;
      }
    }
  }
  else
  {
LABEL_28:
    v18 = operator new(0x40uLL);
    v18[8] = 2;
    *((_QWORD *)v18 + 5) = 0;
    v18[14] = *(_DWORD *)v20;
    *(_DWORD *)((char *)v18 + 59) = *(_DWORD *)&v20[3];
    *((_BYTE *)v18 + 63) = 0;
    *(_QWORD *)v18 = 0;
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 2) = v16;
    *v2 = v18;
    v19 = **(_QWORD **)this;
    if (v19)
    {
      *(_QWORD *)this = v19;
      v18 = (_DWORD *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), (uint64_t *)v18);
    ++*((_QWORD *)this + 2);
  }
}

void sub_212B38710(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void BBUPartitionManager::getBBUFSPath(BBUPartitionManager *this@<X0>, std::string *a2@<X8>)
{
  unsigned __int8 v3;
  std::string __p;

  {
    BBUPartitionManager::getPartitionRoot((uint64_t)this, 2, &__p);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("/bbfs/", &__p, (std::string *)&BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (byte_254B605C7 < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath, *((std::string::size_type *)&BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath + 1));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = BBUPartitionManager::getBBUFSPath(void)const::kBBUFSPath;
    a2->__r_.__value_.__r.__words[2] = unk_254B605C0;
  }
}

void sub_212B38808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void BBUPartitionManager::getPartitionRoot(uint64_t a1@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t *v3;
  int v4;
  __int128 v5;

  v3 = *(uint64_t **)(a1 + 8);
  if (!v3)
LABEL_7:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v3 + 8);
      if (v4 <= a2)
        break;
      v3 = (uint64_t *)*v3;
      if (!v3)
        goto LABEL_7;
    }
    if (v4 >= a2)
      break;
    v3 = (uint64_t *)v3[1];
    if (!v3)
      goto LABEL_7;
  }
  if (*((char *)v3 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a3, (const std::string::value_type *)v3[5], v3[6]);
  }
  else
  {
    v5 = *(_OWORD *)(v3 + 5);
    a3->__r_.__value_.__r.__words[2] = v3[7];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
  }
}

void BBUPartitionManager::getBBUFDRCacheLocation(BBUPartitionManager *this@<X0>, _QWORD *a2@<X8>)
{
  std::string *v4;
  uint64_t *v5;
  int v6;
  int v7;
  std::string::size_type size;
  int v9;
  std::string::size_type v10;
  unint64_t v11;
  std::string *v12;
  char *v13;
  std::string *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  std::string __p;
  std::string v19;
  std::string v20;

  memset(&v20, 0, sizeof(v20));
  ctu::cf::assign();
  memset(&__p, 0, sizeof(__p));
  v4 = std::string::append(&__p, "/", 1uLL);
  v19 = *v4;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    memset(&v20, 170, sizeof(v20));
    v5 = (uint64_t *)*((_QWORD *)this + 1);
    if (v5)
      goto LABEL_7;
LABEL_10:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  memset(&v20, 170, sizeof(v20));
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  if (!v5)
    goto LABEL_10;
  while (1)
  {
LABEL_7:
    while (1)
    {
      v6 = *((_DWORD *)v5 + 8);
      if (v6 < 1)
        break;
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_10;
    }
    if ((v6 & 0x80000000) == 0)
      break;
    v5 = (uint64_t *)v5[1];
    if (!v5)
      goto LABEL_10;
  }
  if (*((char *)v5 + 63) < 0)
    std::string::__init_copy_ctor_external(&v20, (const std::string::value_type *)v5[5], v5[6]);
  else
    v20 = *(std::string *)(v5 + 5);
  v7 = SHIBYTE(v20.__r_.__value_.__r.__words[2]);
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
  else
    size = v20.__r_.__value_.__l.__size_;
  v9 = SHIBYTE(v19.__r_.__value_.__r.__words[2]);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  else
    v10 = v19.__r_.__value_.__l.__size_;
  v11 = v10 + size;
  memset(a2, 170, 24);
  if (v10 + size >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v11 <= 0x16)
  {
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 0;
    *((_BYTE *)a2 + 23) = v11;
    if (!size)
      goto LABEL_27;
    goto LABEL_23;
  }
  v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v11 | 7) != 0x17)
    v15 = v11 | 7;
  v16 = v15 + 1;
  v17 = operator new(v15 + 1);
  a2[1] = v11;
  a2[2] = v16 | 0x8000000000000000;
  *a2 = v17;
  a2 = v17;
  if (size)
  {
LABEL_23:
    if (v7 >= 0)
      v12 = &v20;
    else
      v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
    memmove(a2, v12, size);
  }
LABEL_27:
  v13 = (char *)a2 + size;
  if (v10)
  {
    if (v9 >= 0)
      v14 = &v19;
    else
      v14 = (std::string *)v19.__r_.__value_.__r.__words[0];
    memmove(v13, v14, v10);
  }
  v13[v10] = 0;
  if ((v7 & 0x80000000) == 0)
  {
    if ((v9 & 0x80000000) == 0)
      return;
LABEL_40:
    operator delete(v19.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v20.__r_.__value_.__l.__data_);
  if (v9 < 0)
    goto LABEL_40;
}

void sub_212B38AE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::__on_zero_shared(uint64_t a1)
{
  char **v1;

  v1 = *(char ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy(*(_QWORD *)(a1 + 24), v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<BBUPartitionManager *,std::shared_ptr<BBUPartitionManager>::__shared_ptr_default_delete<BBUPartitionManager,BBUPartitionManager>,std::allocator<BBUPartitionManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B56355)
    return a1 + 24;
  if (((v3 & 0x8000000212B56355 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B56355))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B56355 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void BBUICENVMImage::BBUICENVMImage(BBUICENVMImage *this, BBUDataSource *a2, const char *__s, int a4)
{
  char *v8;
  size_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)this = off_24CE85778;
  v8 = (char *)this + 16;
  v9 = strlen(__s);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v9;
  if (v9 >= 0x17)
  {
    v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v12 = v9 | 7;
    v13 = v12 + 1;
    v11 = operator new(v12 + 1);
    *((_QWORD *)this + 3) = v10;
    *((_QWORD *)this + 4) = v13 | 0x8000000000000000;
    *((_QWORD *)this + 2) = v11;
    goto LABEL_8;
  }
  *((_BYTE *)this + 39) = v9;
  v11 = v8;
  if (v9)
LABEL_8:
    memmove(v11, __s, v10);
  *((_BYTE *)v11 + v10) = 0;
  *((_DWORD *)this + 10) = a4;
  *((_QWORD *)this + 6) = a2;
  *((_QWORD *)this + 1) = 1;
  if (a2)
    *((_DWORD *)this + 3) = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)a2 + 24))(a2);
}

void sub_212B38D14(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void BBUICENVMImage::~BBUICENVMImage(BBUICENVMImage *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24CE85778;
  v2 = *((_QWORD *)this + 6);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

{
  uint64_t v2;

  *(_QWORD *)this = off_24CE85778;
  v2 = *((_QWORD *)this + 6);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
  operator delete(this);
}

void *BBUICENVMImage::getWritePayloadData(BBUICENVMImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  void *result;
  size_t v9;
  void *exception;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  int v21;

  result = (void *)(*(uint64_t (**)(BBUICENVMImage *))(*(_QWORD *)this + 32))(this);
  if ((int)result + 8 <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x1Eu, (ctu::LogMessageBuffer *)"Assertion failure((offset < (getWritePayloadLength() + kBinHeaderSize)) && \"Chunk size is not sufficient to write payload data of the NVM image!\")", v11, v12, v13, v20);
    goto LABEL_14;
  }
  v21 = -1431655766;
  if (a4 <= 7)
  {
    if (8 - a4 >= a3)
      v9 = a3;
    else
      v9 = 8 - a4;
    result = memcpy(a2, (char *)this + a4 + 8, v9);
    a2 += v9;
    a3 = (a3 - v9);
  }
  if ((_DWORD)a3)
  {
    result = (void *)(*(uint64_t (**)(_QWORD, unsigned __int8 *, uint64_t, int *, _QWORD))(**((_QWORD **)this + 6)
                                                                                                  + 16))(*((_QWORD *)this + 6), a2, a3, &v21, a4 + *((_DWORD *)this + 10) - 8);
    if ((_DWORD)result)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy NVM image payload data to buffer!\")", v14, v15, v16, v20);
    }
    else
    {
      if (v21 == (_DWORD)a3)
        return result;
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 83, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICENVMImage.cpp", 0x2Fu, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy NVM image payload data to buffer!\")", v17, v18, v19, v20);
    }
LABEL_14:
  }
  return result;
}

void sub_212B38F58(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B38F6C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B38F80(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICENVMImage::getName(BBUICENVMImage *this)
{
  uint64_t result;

  result = (uint64_t)this + 16;
  if (*((char *)this + 39) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t BBUICENVMImage::getWritePayloadLength(BBUICENVMImage *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 6);
  if (v1)
    return (*(unsigned int (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1) + 8;
  else
    return 8;
}

uint64_t BBUICENVMImage::getOpenPayloadData(BBUICENVMImage *this)
{
  return 0;
}

uint64_t BBUICENVMImage::getOpenPayloadLength(BBUICENVMImage *this)
{
  return 0;
}

void BBUICENVMImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      BBUDataSource::generateHash(v3, a2, a3);
  }
}

uint64_t BBUICENVMImage::generateBinHeader(BBUICENVMImage *this)
{
  uint64_t result;

  *((_QWORD *)this + 1) = 1;
  result = *((_QWORD *)this + 6);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
    *((_DWORD *)this + 3) = result;
  }
  return result;
}

BBUDataSource *BBUDataSource::createFromEurekaMIFile(uint64_t a1, int a2, int a3)
{
  const char *v5;
  size_t v6;
  size_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  BBUDataSource *v11;
  __CFData *Mutable;
  const __CFData *v13;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFDataRef theData;
  _BYTE __dst[36];
  int v19;
  __CFData *v20;

  if (*(char *)(a1 + 23) >= 0)
    v5 = (const char *)a1;
  else
    v5 = *(const char **)a1;
  v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    v8 = operator new(v9 + 1);
    *(_QWORD *)&__dst[8] = v7;
    *(_QWORD *)&__dst[16] = v10 | 0x8000000000000000;
    *(_QWORD *)__dst = v8;
    goto LABEL_11;
  }
  __dst[23] = v6;
  v8 = __dst;
  if (v6)
LABEL_11:
    memmove(v8, v5, v7);
  v8[v7] = 0;
  v11 = (BBUDataSource *)operator new(0x30uLL);
  *(_QWORD *)v11 = off_24CE7FC78;
  *(_OWORD *)((char *)v11 + 8) = 0u;
  *(_OWORD *)((char *)v11 + 24) = 0u;
  if (BBUFileDataSource::init((uint64_t)v11, __dst, a2))
  {
    (*(void (**)(BBUDataSource *))(*(_QWORD *)v11 + 8))(v11);
    v11 = 0;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    if (!v11)
      return v11;
  }
  else if (!v11)
  {
    return v11;
  }
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v20 = Mutable;
  v19 = 0;
  memset(&__dst[4], 0, 32);
  *(_DWORD *)&__dst[20] = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)v11 + 24))(v11);
  *(_DWORD *)&__dst[16] = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)v11 + 24))(v11);
  *(_DWORD *)__dst = a3;
  CFDataAppendBytes(Mutable, __dst, 40);
  theData = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
  BBUDataSource::createData(v11, &theData);
  v13 = theData;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(v13);
  CFDataAppendBytes(Mutable, BytePtr, Length);
  (*(void (**)(BBUDataSource *))(*(_QWORD *)v11 + 8))(v11);
  v11 = (BBUDataSource *)operator new(0x18uLL);
  *((_DWORD *)v11 + 4) = 0;
  *(_QWORD *)v11 = off_24CE84890;
  *((_QWORD *)v11 + 1) = Mutable;
  if (Mutable)
    CFRetain(Mutable);
  if (v13)
    CFRelease(v13);
  if (Mutable)
    CFRelease(Mutable);
  return v11;
}

void sub_212B39278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, const void *a19)
{
  ctu::cf::CFSharedRef<__CFData>::~CFSharedRef(&a19);
  _Unwind_Resume(a1);
}

void BBUDataSource::createData(BBUDataSource *this@<X0>, CFDataRef *a2@<X8>)
{
  unsigned int v4;
  size_t v5;
  char *v6;
  char *v7;
  CFDataRef v8;
  void *exception;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;

  v4 = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)this + 24))(this);
  if (v4)
  {
    v5 = v4;
    v6 = (char *)operator new(v4);
    v7 = &v6[v5];
    bzero(v6, v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v18 = -1431655766;
  (*(void (**)(BBUDataSource *, char *, int64_t, int *, _QWORD))(*(_QWORD *)this + 16))(this, v6, v7 - v6, &v18, 0);
  if (v18 != (_DWORD)v7 - (_DWORD)v6)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Support/BBUDataSource.cpp", 0xD9u, (ctu::LogMessageBuffer *)"Assertion failure(copied == dataSize)", v10, v11, v12, v17);
  }
  v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v6, ((_DWORD)v7 - (_DWORD)v6));
  if (!v8)
  {
    v13 = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)v13, 2, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Support/BBUDataSource.cpp", 0xDCu, (ctu::LogMessageBuffer *)"Assertion failure(success)", v14, v15, v16, v17);
  }
  *a2 = v8;
  if (v6)
    operator delete(v6);
}

void sub_212B3941C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

_DWORD *BBUDataSource::createFromEurekaMIData(BBUDataSource *this, const __CFData *a2, int a3)
{
  int v4;
  __CFData *Mutable;
  int Length;
  const UInt8 *BytePtr;
  CFIndex v9;
  _DWORD *v10;
  int v12;
  __int128 v13;
  __int128 v14;
  int v15;
  __CFData *v16;

  v4 = (int)a2;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v16 = Mutable;
  v15 = 0;
  v14 = 0u;
  v13 = 0u;
  if (this)
    Length = CFDataGetLength(this);
  else
    Length = 0;
  HIDWORD(v13) = Length;
  LODWORD(v14) = Length;
  v12 = a3;
  CFDataAppendBytes(Mutable, (const UInt8 *)&v12, 40);
  if (this)
  {
    BytePtr = CFDataGetBytePtr(this);
    v9 = CFDataGetLength(this);
    CFDataAppendBytes(Mutable, BytePtr, v9);
  }
  v10 = operator new(0x18uLL);
  v10[4] = v4;
  *(_QWORD *)v10 = off_24CE84890;
  *((_QWORD *)v10 + 1) = Mutable;
  if (Mutable)
  {
    CFRetain(Mutable);
    CFRelease(Mutable);
  }
  return v10;
}

void sub_212B3953C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::cf::CFSharedRef<__CFData>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void BBUDataSource::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unsigned int v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  CC_SHA512_CTX v14;
  CC_LONG v15;

  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v7 = operator new[](0x100000uLL);
  if (a3 == 1)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v14.wbuf[12] = v11;
    *(_OWORD *)&v14.wbuf[14] = v11;
    *(_OWORD *)&v14.wbuf[8] = v11;
    *(_OWORD *)&v14.wbuf[10] = v11;
    *(_OWORD *)&v14.wbuf[4] = v11;
    *(_OWORD *)&v14.wbuf[6] = v11;
    *(_OWORD *)v14.wbuf = v11;
    *(_OWORD *)&v14.wbuf[2] = v11;
    *(_OWORD *)&v14.hash[4] = v11;
    *(_OWORD *)&v14.hash[6] = v11;
    *(_OWORD *)v14.hash = v11;
    *(_OWORD *)&v14.hash[2] = v11;
    *(_OWORD *)v14.count = v11;
    CC_SHA384_Init(&v14);
    if (v6)
    {
      v12 = 0;
      do
      {
        v15 = 0;
        if (v6 >= 0x100000)
          v13 = 0x100000;
        else
          v13 = v6;
        (*(void (**)(uint64_t, void *, uint64_t, CC_LONG *, uint64_t))(*(_QWORD *)a1 + 16))(a1, v7, v13, &v15, v12);
        CC_SHA384_Update(&v14, v7, v15);
        v12 = v15 + v12;
        v6 -= v15;
      }
      while (v6);
    }
    CC_SHA384_Final(a2, &v14);
  }
  else if (!a3)
  {
    v14.wbuf[2] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v14.hash[6] = v8;
    *(_OWORD *)v14.wbuf = v8;
    *(_OWORD *)&v14.hash[2] = v8;
    *(_OWORD *)&v14.hash[4] = v8;
    *(_OWORD *)v14.count = v8;
    *(_OWORD *)v14.hash = v8;
    CC_SHA256_Init((CC_SHA256_CTX *)&v14);
    if (v6)
    {
      v9 = 0;
      do
      {
        v15 = 0;
        if (v6 >= 0x100000)
          v10 = 0x100000;
        else
          v10 = v6;
        (*(void (**)(uint64_t, void *, uint64_t, CC_LONG *, uint64_t))(*(_QWORD *)a1 + 16))(a1, v7, v10, &v15, v9);
        CC_SHA256_Update((CC_SHA256_CTX *)&v14, v7, v15);
        v9 = v15 + v9;
        v6 -= v15;
      }
      while (v6);
    }
    CC_SHA256_Final(a2, (CC_SHA256_CTX *)&v14);
  }
  operator delete[](v7);
}

uint64_t BBUDataSource::saveDataToFile(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  BBUPartitionManager *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  int v16;
  unint64_t *v17;
  unint64_t v18;
  const char *v19;
  int v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BBUpdaterCommon *v33;
  std::string *v34;
  std::string *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  std::__shared_weak_count_vtbl *v44;
  __int128 v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::string *v55;
  __int128 v56;
  std::string *v57;
  std::string::size_type size;
  std::string *v59;
  __int128 v60;
  NSObject *v61;
  unint64_t *v62;
  unint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  std::__shared_weak_count_vtbl *v70;
  __int128 v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *f_blocks;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  NSObject *v81;
  unint64_t *v82;
  unint64_t v83;
  std::string v84;
  std::string v85;
  void *__p[2];
  std::string::size_type v87;
  uint64_t v88;
  void *v89;
  std::string v90;
  int v91;
  std::string v92;
  __int128 *p_str;
  dispatch_object_t object;
  __int128 v95;
  void *v96;
  uint64_t v97;
  __int128 **p_p_str;
  __int128 __str;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  statfs __b;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  memset(&v92, 170, sizeof(v92));
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  v6 = off_253D31E68;
  if (!off_253D31E68)
  {
    v7 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v7);
    v8 = operator new(0x20uLL);
    *v8 = &unk_24CE85728;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = v7;
    v9 = (std::__shared_weak_count *)off_253D31E70;
    off_253D31E68 = v7;
    off_253D31E70 = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v6 = off_253D31E68;
  }
  v12 = (std::__shared_weak_count *)off_253D31E70;
  *(_QWORD *)&__b.f_bsize = v6;
  __b.f_blocks = (uint64_t)off_253D31E70;
  if (off_253D31E70)
  {
    v13 = (unint64_t *)((char *)off_253D31E70 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  v15 = (uint64_t *)v6[1];
  if (!v15)
LABEL_17:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      v16 = *((_DWORD *)v15 + 8);
      if (v16 < 1)
        break;
      v15 = (uint64_t *)*v15;
      if (!v15)
        goto LABEL_17;
    }
    if ((v16 & 0x80000000) == 0)
      break;
    v15 = (uint64_t *)v15[1];
    if (!v15)
      goto LABEL_17;
  }
  if (*((char *)v15 + 63) < 0)
    std::string::__init_copy_ctor_external(&v92, (const std::string::value_type *)v15[5], v15[6]);
  else
    v92 = *(std::string *)(v15 + 5);
  if (v12)
  {
    v17 = (unint64_t *)&v12->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (*(char *)(a2 + 23) >= 0)
    v19 = (const char *)a2;
  else
    v19 = *(const char **)a2;
  v20 = open(v19, 1537, 420);
  if (v20 < 0)
  {
    v36 = 35;
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_98;
    return v36;
  }
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v22 = (char *)operator new[](v21);
  v23 = v22;
  if ((_DWORD)v21)
  {
    v24 = 0;
    v25 = v21;
    v26 = v22;
    do
    {
      __b.f_bsize = -1431655766;
      (*(void (**)(uint64_t, char *, uint64_t, statfs *, uint64_t))(*(_QWORD *)a1 + 16))(a1, v26, v25, &__b, v24);
      v24 = (__b.f_bsize + v24);
      v26 += __b.f_bsize;
      v25 = (v25 - __b.f_bsize);
    }
    while ((_DWORD)v25);
  }
  v91 = -1431655766;
  v33 = (BBUpdaterCommon *)TelephonyUtilWriteToCompletion();
  if (!(_DWORD)v33)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
        goto LABEL_46;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) == 0)
        goto LABEL_46;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v37 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
      _BBULog(15, 0, v37, "", "Wrote %u bytes to %s\n", v38, v39, v40, v91);
    }
LABEL_46:
    if (!a3)
    {
LABEL_49:
      v36 = 0;
      goto LABEL_97;
    }
    memset(&__b, 0, 24);
    v41 = bbufs::chownToWireless((uint64_t *)&__b, v20, v27, v28, v29, v30, v31, v32);
    v42 = v41;
    if (SHIBYTE(__b.f_bfree) < 0)
    {
      operator delete(*(void **)&__b.f_bsize);
      if ((v42 & 1) != 0)
        goto LABEL_49;
    }
    else if ((v41 & 1) != 0)
    {
      goto LABEL_49;
    }
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v69 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      v70 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
      *(_QWORD *)&__str = 0;
      ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v70, "BBUError", QOS_CLASS_UTILITY, (NSObject **)&__str);
      if ((_QWORD)__str)
        dispatch_release((dispatch_object_t)__str);
      v70->__on_zero_shared_weak = 0;
      v70[1].~__shared_weak_count = 0;
      v70[1].~__shared_weak_count_0 = 0;
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&__b, v70);
      v71 = *(_OWORD *)&__b.f_bsize;
      *(_QWORD *)&__b.f_bsize = 0;
      __b.f_blocks = 0;
      v72 = (std::__shared_weak_count *)off_253D31DD0;
      *(_OWORD *)&qword_253D31DC8 = v71;
      if (v72)
      {
        v73 = (unint64_t *)&v72->__shared_owners_;
        do
          v74 = __ldaxr(v73);
        while (__stlxr(v74 - 1, v73));
        if (!v74)
        {
          ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
          std::__shared_weak_count::__release_weak(v72);
        }
      }
      f_blocks = (std::__shared_weak_count *)__b.f_blocks;
      if (__b.f_blocks)
      {
        v76 = (unint64_t *)(__b.f_blocks + 8);
        do
          v77 = __ldaxr(v76);
        while (__stlxr(v77 - 1, v76));
        if (!v77)
        {
          ((void (*)(std::__shared_weak_count *))f_blocks->__on_zero_shared)(f_blocks);
          std::__shared_weak_count::__release_weak(f_blocks);
        }
      }
      v69 = qword_253D31DC8;
    }
    v78 = (std::__shared_weak_count *)off_253D31DD0;
    v90.__r_.__value_.__r.__words[0] = v69;
    v90.__r_.__value_.__l.__size_ = (std::string::size_type)off_253D31DD0;
    if (off_253D31DD0)
    {
      v79 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v80 = __ldxr(v79);
      while (__stxr(v80 + 1, v79));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    object = (dispatch_object_t)operator new(0x20uLL);
    v95 = xmmword_212B53030;
    strcpy((char *)object, "Failed to change file ownership");
    *(_QWORD *)&__b.f_bsize = MEMORY[0x24BDAC760];
    __b.f_blocks = 0x40000000;
    __b.f_bfree = (uint64_t)___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
    __b.f_bavail = (uint64_t)&__block_descriptor_tmp_6;
    __b.f_files = v69;
    __b.f_ffree = (uint64_t)&object;
    __b.f_fsid.val[0] = 35;
    __p[0] = &__b;
    *(_QWORD *)&__str = MEMORY[0x24BDAC760];
    *((_QWORD *)&__str + 1) = 0x40000000;
    *(_QWORD *)&v100 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    *((_QWORD *)&v100 + 1) = &__block_descriptor_tmp_10;
    *(_QWORD *)&v101 = v69;
    *((_QWORD *)&v101 + 1) = __p;
    v81 = *(NSObject **)(v69 + 16);
    if (*(_QWORD *)(v69 + 24))
    {
      dispatch_async_and_wait(v81, &__str);
      if ((SHIBYTE(v95) & 0x80000000) == 0)
      {
LABEL_121:
        if (v78)
        {
          v82 = (unint64_t *)&v78->__shared_owners_;
          do
            v83 = __ldaxr(v82);
          while (__stlxr(v83 - 1, v82));
          if (!v83)
          {
            ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
            std::__shared_weak_count::__release_weak(v78);
          }
        }
        goto LABEL_96;
      }
    }
    else
    {
      dispatch_sync(v81, &__str);
      if ((SHIBYTE(v95) & 0x80000000) == 0)
        goto LABEL_121;
    }
    operator delete(object);
    goto LABEL_121;
  }
  memset(&__b, 170, sizeof(__b));
  memset(&v90, 0, sizeof(v90));
  if ((v92.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v34 = &v92;
  else
    v34 = (std::string *)v92.__r_.__value_.__r.__words[0];
  if (statfs((const char *)v34, &__b))
  {
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    {
      v90.__r_.__value_.__l.__size_ = 18;
      v35 = (std::string *)v90.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((_BYTE *)&v90.__r_.__value_.__s + 23) = 18;
      v35 = &v90;
    }
    strcpy((char *)v35, ": failed to statfs");
  }
  else
  {
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    __str = 0u;
    v100 = 0u;
    snprintf((char *)&__str, 0x80uLL, ": free %llu avail %llu", __b.f_bfree * __b.f_bsize, __b.f_bavail * __b.f_bsize);
    std::string::__assign_external(&v90, (const std::string::value_type *)&__str);
  }
  pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  v43 = qword_253D31DC8;
  if (!qword_253D31DC8)
  {
    v44 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
    object = 0;
    ctu::SharedSynchronizable<BBUError>::SharedSynchronizable(v44, "BBUError", QOS_CLASS_UTILITY, &object);
    if (object)
      dispatch_release(object);
    v44->__on_zero_shared_weak = 0;
    v44[1].~__shared_weak_count = 0;
    v44[1].~__shared_weak_count_0 = 0;
    std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&__str, v44);
    v45 = __str;
    __str = 0uLL;
    v46 = (std::__shared_weak_count *)off_253D31DD0;
    *(_OWORD *)&qword_253D31DC8 = v45;
    if (v46)
    {
      v47 = (unint64_t *)&v46->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
    v49 = (std::__shared_weak_count *)*((_QWORD *)&__str + 1);
    if (*((_QWORD *)&__str + 1))
    {
      v50 = (unint64_t *)(*((_QWORD *)&__str + 1) + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    v43 = qword_253D31DC8;
  }
  v52 = (std::__shared_weak_count *)off_253D31DD0;
  v88 = v43;
  v89 = off_253D31DD0;
  if (off_253D31DD0)
  {
    v53 = (unint64_t *)((char *)off_253D31DD0 + 8);
    do
      v54 = __ldxr(v53);
    while (__stxr(v54 + 1, v53));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  BBUpdaterCommon::BBUStrError(v33, &v84);
  v55 = std::string::insert(&v84, 0, "Failed to write file: ", 0x16uLL);
  v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
  v85.__r_.__value_.__r.__words[2] = v55->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v56;
  v55->__r_.__value_.__l.__size_ = 0;
  v55->__r_.__value_.__r.__words[2] = 0;
  v55->__r_.__value_.__r.__words[0] = 0;
  if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v57 = &v90;
  else
    v57 = (std::string *)v90.__r_.__value_.__r.__words[0];
  if ((v90.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v90.__r_.__value_.__r.__words[2]);
  else
    size = v90.__r_.__value_.__l.__size_;
  v59 = std::string::append(&v85, (const std::string::value_type *)v57, size);
  v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v87 = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  *(_QWORD *)&__str = MEMORY[0x24BDAC760];
  *((_QWORD *)&__str + 1) = 0x40000000;
  *(_QWORD *)&v100 = ___ZN8BBUError8addErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE9BBUReturn_block_invoke;
  *((_QWORD *)&v100 + 1) = &__block_descriptor_tmp_6;
  *(_QWORD *)&v101 = v43;
  *((_QWORD *)&v101 + 1) = __p;
  LODWORD(v102) = 35;
  p_str = &__str;
  object = (dispatch_object_t)MEMORY[0x24BDAC760];
  *(_QWORD *)&v95 = 0x40000000;
  *((_QWORD *)&v95 + 1) = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v96 = &__block_descriptor_tmp_10;
  v97 = v43;
  p_p_str = &p_str;
  v61 = *(NSObject **)(v43 + 16);
  if (*(_QWORD *)(v43 + 24))
  {
    dispatch_async_and_wait(v61, &object);
    if ((SHIBYTE(v87) & 0x80000000) == 0)
      goto LABEL_78;
  }
  else
  {
    dispatch_sync(v61, &object);
    if ((SHIBYTE(v87) & 0x80000000) == 0)
    {
LABEL_78:
      if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_79;
      goto LABEL_84;
    }
  }
  operator delete(__p[0]);
  if ((SHIBYTE(v85.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_79:
    if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_80;
    goto LABEL_85;
  }
LABEL_84:
  operator delete(v85.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_80:
    if (!v52)
      goto LABEL_90;
    goto LABEL_86;
  }
LABEL_85:
  operator delete(v84.__r_.__value_.__l.__data_);
  if (!v52)
    goto LABEL_90;
LABEL_86:
  v62 = (unint64_t *)&v52->__shared_owners_;
  do
    v63 = __ldaxr(v62);
  while (__stlxr(v63 - 1, v62));
  if (!v63)
  {
    ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
    std::__shared_weak_count::__release_weak(v52);
  }
LABEL_90:
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0)
      goto LABEL_92;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x80) != 0)
    {
LABEL_92:
      if ((gBBULogVerbosity & 0x80000000) == 0)
      {
        v64 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
        _BBULog(15, 0, v64, "", "Failed writing %u bytes to %s - wrote only %u\n", v65, v66, v67, v21);
      }
    }
  }
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v90.__r_.__value_.__l.__data_);
LABEL_96:
  v36 = 35;
LABEL_97:
  close(v20);
  operator delete[](v23);
  if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
LABEL_98:
    operator delete(v92.__r_.__value_.__l.__data_);
  return v36;
}

void sub_212B3A078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,dispatch_object_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,NSObject *object)
{
  void *v42;

  if (object)
    dispatch_release(object);
  operator delete(v42);
  pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
  if (a34 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_212B3A1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&a55);
  _Unwind_Resume(a1);
}

void eUICC::Firmware::CreateFromData(const void **a1@<X0>, const void **a2@<X1>, const void **a3@<X2>, _QWORD *a4@<X8>)
{
  char *v8;
  const void *v9;
  const void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v13;
  unint64_t v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  CFTypeRef v21;
  _QWORD *v22;
  const void *v23;
  const __CFAllocator *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  ctu::cf *v28;
  const void *v29;
  uint64_t (*v30)(uint64_t);
  CFTypeID TypeID;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFTypeID v35;
  const void *v36;
  const void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFErrorRef *v41;
  const void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFErrorRef *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  ctu::cf *Value;
  CFTypeID v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFErrorRef v58;
  __int128 v59;
  void *v60;
  int v61;
  ctu::cf *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CFErrorRef *v70;
  ctu *v71;
  const void *v72;
  const void *v73;
  int v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  CFErrorRef *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  __int128 v89;
  CFTypeRef v90;
  char v91;
  const void *v92;
  CFTypeRef cf;
  CFTypeRef v94;
  unint64_t v95;
  unint64_t v96;
  ctu::cf *v97;
  CFErrorRef error[3];

  v95 = 0xAAAAAAAAAAAAAAAALL;
  v96 = 0xAAAAAAAAAAAAAAAALL;
  v8 = (char *)operator new(0x48uLL);
  v9 = *a1;
  v94 = v9;
  if (v9)
    CFRetain(v9);
  v10 = *a2;
  cf = v10;
  if (v10)
    CFRetain(v10);
  *(_QWORD *)v8 = off_24CE857F8;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *((_QWORD *)v8 + 3) = v9;
  if (v9)
    CFRetain(v9);
  *((_QWORD *)v8 + 4) = v10;
  if (v10)
    CFRetain(v10);
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  v95 = (unint64_t)v8;
  v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85870;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  v96 = (unint64_t)v11;
  v13 = (std::__shared_weak_count *)*((_QWORD *)v8 + 2);
  if (v13)
  {
    if (v13->__shared_owners_ != -1)
      goto LABEL_21;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
    *((_QWORD *)v8 + 1) = v8;
    *((_QWORD *)v8 + 2) = v11;
    std::__shared_weak_count::__release_weak(v13);
  }
  else
  {
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v18 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    *((_QWORD *)v8 + 1) = v8;
    *((_QWORD *)v8 + 2) = v11;
  }
  do
    v20 = __ldaxr(p_shared_owners);
  while (__stlxr(v20 - 1, p_shared_owners));
  if (v20)
  {
LABEL_21:
    v21 = cf;
    if (!cf)
      goto LABEL_23;
    goto LABEL_22;
  }
  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
  std::__shared_weak_count::__release_weak(v11);
  v21 = cf;
  if (cf)
LABEL_22:
    CFRelease(v21);
LABEL_23:
  if (v94)
    CFRelease(v94);
  v22 = (_QWORD *)v95;
  v23 = *a3;
  v92 = v23;
  if (v23)
    CFRetain(v23);
  v90 = 0;
  v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  error[0] = 0;
  error[1] = (CFErrorRef)&v90;
  v28 = (ctu::cf *)CFPropertyListCreateWithData(v24, (CFDataRef)v23, 0, 0, error);
  v97 = v28;
  v29 = *(const void **)error[1];
  if (error[0])
  {
    *(_QWORD *)error[1] = error[0];
    if (!v29)
      goto LABEL_32;
  }
  else
  {
    *(_QWORD *)error[1] = 0;
    if (!v29)
      goto LABEL_32;
  }
  CFRelease(v29);
LABEL_32:
  v30 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!v28)
    v30 = 0;
  if (!v30)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v25, v26, v27, (char)"plistRef");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    ctu::cf::show((ctu::cf *)v90, v37);
    if (SHIBYTE(error[2]) >= 0)
      v41 = error;
    else
      LOBYTE(v41) = error[0];
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "%s\n", v38, v39, v40, (char)v41);
    goto LABEL_81;
  }
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v28))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v32, v33, v34, (char)"CFDictionaryGetTypeID() == CFGetTypeID(plistRef.get())");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    ctu::cf::show(v28, v42);
    if (SHIBYTE(error[2]) >= 0)
      v46 = error;
    else
      LOBYTE(v46) = error[0];
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "info.plist is wrong type %s\n", v43, v44, v45, (char)v46);
    goto LABEL_81;
  }
  if (v28)
  {
    v35 = CFGetTypeID(v28);
    if (v35 != CFDictionaryGetTypeID())
    {
      v28 = 0;
      v36 = (const void *)v22[5];
      v22[5] = 0;
      if (!v36)
        goto LABEL_61;
      goto LABEL_60;
    }
    CFRetain(v28);
  }
  v36 = (const void *)v22[5];
  v22[5] = v28;
  if (v36)
  {
LABEL_60:
    CFRelease(v36);
    v28 = (ctu::cf *)v22[5];
  }
LABEL_61:
  Value = (ctu::cf *)CFDictionaryGetValue(v28, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.firmwareMac"));
  if (!Value)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v47, v48, v49, (char)"fwMacData");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Missing firmwareMac in info.plist -- firmware too old\n", v63, v64, v65, v88);
LABEL_83:
    v61 = 0;
    v62 = v97;
    if (!v97)
      goto LABEL_85;
    goto LABEL_84;
  }
  v51 = CFDataGetTypeID();
  if (v51 != CFGetTypeID(Value))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v52, v53, v54, (char)"CFDataGetTypeID() == CFGetTypeID(fwMacData)");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    ctu::cf::show(Value, v66);
    if (SHIBYTE(error[2]) >= 0)
      v70 = error;
    else
      LOBYTE(v70) = error[0];
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "fwMacData is wrong type %s\n", v67, v68, v69, (char)v70);
LABEL_81:
    if (SHIBYTE(error[2]) < 0)
      operator delete(error[0]);
    goto LABEL_83;
  }
  memset(error, 0, sizeof(error));
  ctu::cf::assign();
  v58 = error[0];
  v59 = *(_OWORD *)&error[1];
  v60 = (void *)v22[6];
  if (v60)
  {
    v22[7] = v60;
    v89 = v59;
    operator delete(v60);
    v59 = v89;
    v22[6] = 0;
    v22[7] = 0;
    v22[8] = 0;
  }
  v22[6] = v58;
  *(_OWORD *)(v22 + 7) = v59;
  if ((_QWORD)v59 - (_QWORD)v58 != 8)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v55, v56, v57, (char)"fwMac.size() == kFWMacSize");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "firmwareMac is wrong size %zu\n", v85, v86, v87, *((_BYTE *)v22 + 56) - *((_BYTE *)v22 + 48));
    goto LABEL_83;
  }
  v61 = 1;
  v62 = v97;
  if (v97)
LABEL_84:
    CFRelease(v62);
LABEL_85:
  if (v90)
    CFRelease(v90);
  if (v23)
    CFRelease(v23);
  if (v61)
  {
    v71 = (ctu *)(*(uint64_t (**)(_QWORD *))(*v22 + 8))(v22);
    v73 = v72;
    memset(error, 170, sizeof(error));
    (*(void (**)(CFErrorRef *__return_ptr, _QWORD *))*v22)(error, v22);
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v74 = SHIBYTE(error[2]);
    v75 = (char)error[0];
    ctu::hex(v71, v73);
    v79 = error;
    if (v74 < 0)
      LOBYTE(v79) = v75;
    _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "eUICC Firmware loaded! Version %s MAC %s\n", v76, v77, v78, (char)v79);
    if (v91 < 0)
    {
      operator delete((void *)v90);
      v84 = v96;
      *a4 = v22;
      a4[1] = v84;
      if ((SHIBYTE(error[2]) & 0x80000000) == 0)
        return;
    }
    else
    {
      v80 = v96;
      *a4 = v22;
      a4[1] = v80;
      if ((SHIBYTE(error[2]) & 0x80000000) == 0)
        return;
    }
    operator delete(error[0]);
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
    v81 = (std::__shared_weak_count *)v96;
    if (v96)
    {
      v82 = (unint64_t *)(v96 + 8);
      do
        v83 = __ldaxr(v82);
      while (__stlxr(v83 - 1, v82));
      if (!v83)
      {
        ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
        std::__shared_weak_count::__release_weak(v81);
      }
    }
  }
}

void sub_212B3AAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,const void *a21,__int16 a22,char a23,char a24,int a25,__int16 a26,char a27,char a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;

  if (*(char *)(v32 - 65) < 0)
    operator delete(*(void **)(v32 - 88));
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)(v32 - 96));
  ctu::cf::CFSharedRef<__CFError>::~CFSharedRef((const void **)&__p);
  ctu::cf::CFSharedRef<__CFData>::~CFSharedRef(&a21);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&a30);
  _Unwind_Resume(a1);
}

void *eUICC::Firmware::GetVersionString@<X0>(CFMutableDataRef *this@<X0>, _QWORD *a2@<X8>)
{
  __int128 v4;
  void *result;
  size_t v6;
  const void *v7;
  size_t v8;
  size_t v9;
  _QWORD *v10;
  void *exception;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  size_t __len[2];
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v4;
  v22[1] = v4;
  v20 = v4;
  v21 = v4;
  *(_OWORD *)__len = v4;
  v18[0] = CFDataGetMutableBytePtr(this[3]);
  v18[1] = CFDataGetLength(this[3]);
  if (DERParseSequence((uint64_t)v18, 2u, (uint64_t)&eUICC::DER::firmwareImageItemSpec, (unint64_t)v22, 0x20uLL))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x51u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v12, v13, v14, v18[0]);
    goto LABEL_13;
  }
  result = DERParseSequenceContent((unint64_t *)v22, 3u, (uint64_t)&eUICC::DER::firmwareImageHeaderItemSpec, (unint64_t)__len, 0x30uLL);
  if ((_DWORD)result)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x54u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v15, v16, v17, v18[0]);
LABEL_13:
  }
  v6 = __len[1];
  if (__len[1] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = (const void *)__len[0];
  if (__len[1] >= 0x17)
  {
    v8 = (__len[1] & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len[1] | 7) != 0x17)
      v8 = __len[1] | 7;
    v9 = v8 + 1;
    v10 = operator new(v8 + 1);
    a2[1] = v6;
    a2[2] = v9 | 0x8000000000000000;
    *a2 = v10;
    a2 = v10;
  }
  else
  {
    *((_BYTE *)a2 + 23) = __len[1];
    if (!v6)
    {
      *(_BYTE *)a2 = 0;
      return result;
    }
  }
  result = memmove(a2, v7, v6);
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

void sub_212B3ADD8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3ADEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t eUICC::Firmware::GetFWMac(eUICC::Firmware *this)
{
  return *((_QWORD *)this + 6);
}

CFTypeRef eUICC::Firmware::GetInstallTicket@<X0>(CFTypeRef this@<X0>, _QWORD *a2@<X8>)
{
  const void *v3;
  CFTypeID v4;

  v3 = (const void *)*((_QWORD *)this + 4);
  if (v3 && (v4 = CFGetTypeID(*((CFTypeRef *)this + 4)), this = (CFTypeRef)CFDataGetTypeID(), (CFTypeRef)v4 == this))
  {
    *a2 = v3;
    return CFRetain(v3);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

uint64_t eUICC::Firmware::GetFirmwareAPDUs@<X0>(CFMutableDataRef *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  __int128 v4;
  _OWORD *v5;
  unint64_t *v6;
  void *v7;
  _OWORD *v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  unint64_t *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *exception;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45[3];
  unint64_t v46[3];
  _QWORD v47[2];
  __int128 v48;
  __int128 v49;

  v3 = a2;
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v48 = v4;
  v49 = v4;
  v47[0] = CFDataGetMutableBytePtr(this[3]);
  v47[1] = CFDataGetLength(this[3]);
  memset(v46, 170, sizeof(v46));
  if (DERParseSequence((uint64_t)v47, 2u, (uint64_t)&eUICC::DER::firmwareImageItemSpec, (unint64_t)&v48, 0x20uLL))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x71u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v34, v35, v36, v40);
    goto LABEL_33;
  }
  if (DERDecodeSeqInit((uint64_t)&v49, &v46[2], v46))
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x74u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Invalid input Firmware.\")", v37, v38, v39, v40);
LABEL_33:
  }
  v5 = 0;
  v6 = &v45[1];
  v7 = &eUICC::DER::firmwareImageAPDUItemSpec;
  v41 = v3;
  while (1)
  {
    memset(v45, 170, sizeof(v45));
    result = DERDecodeSeqNext(v46, v45);
    if ((_DWORD)result)
      break;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v43 = v10;
    v44 = v10;
    v42 = v10;
    if (DERParseSequenceContent(v6, 3u, (uint64_t)v7, (unint64_t)&v42, 0x30uLL))
    {
      v25 = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)v25, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x82u, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Corrupt eUICC FW Data!\")", v26, v27, v28, v40);
    }
    v11 = v42;
    v12 = v43;
    v13 = v3[2];
    if ((unint64_t)v5 < v13)
    {
      *v5 = v42;
      v8 = v5 + 2;
      v5[1] = v12;
      goto LABEL_5;
    }
    v14 = v6;
    v15 = (_OWORD *)*v3;
    v16 = ((uint64_t)v5 - *v3) >> 5;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 59)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v18 = v7;
    v19 = v13 - (_QWORD)v15;
    if (v19 >> 4 > v17)
      v17 = v19 >> 4;
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0)
      v20 = 0x7FFFFFFFFFFFFFFLL;
    else
      v20 = v17;
    if (v20)
    {
      if (v20 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v21 = (char *)operator new(32 * v20);
      v22 = (uint64_t)&v21[32 * v16];
      *(_OWORD *)v22 = v11;
      *(_OWORD *)(v22 + 16) = v12;
      v23 = v22;
      if (v5 != v15)
      {
        do
        {
LABEL_22:
          v24 = *(v5 - 1);
          *(_OWORD *)(v23 - 32) = *(v5 - 2);
          *(_OWORD *)(v23 - 16) = v24;
          v23 -= 32;
          v5 -= 2;
        }
        while (v5 != v15);
        v5 = v15;
        v8 = (_OWORD *)(v22 + 32);
        *v41 = v23;
        v41[1] = v22 + 32;
        v41[2] = (uint64_t)&v21[32 * v20];
        if (!v15)
          goto LABEL_20;
LABEL_19:
        operator delete(v5);
        goto LABEL_20;
      }
    }
    else
    {
      v21 = 0;
      v22 = 32 * v16;
      *(_QWORD *)v22 = v42;
      *(_QWORD *)(v22 + 8) = *((_QWORD *)&v11 + 1);
      *(_OWORD *)(v22 + 16) = v12;
      v23 = 32 * v16;
      if (v5 != v15)
        goto LABEL_22;
    }
    v8 = (_OWORD *)(v22 + 32);
    *v41 = v23;
    v41[1] = v22 + 32;
    v41[2] = (uint64_t)&v21[32 * v20];
    if (v5)
      goto LABEL_19;
LABEL_20:
    v6 = v14;
    v7 = v18;
    v3 = v41;
LABEL_5:
    v3[1] = (uint64_t)v8;
    v5 = v8;
  }
  if ((_DWORD)result != 1)
  {
    v29 = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)v29, 35, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/eUICC/Source/eUICCFirmware.cpp", 0x7Eu, (ctu::LogMessageBuffer *)"Assertion failure(( DR_Success == ret) && \"Corrupt eUICC FW Data!\")", v30, v31, v32, v40);
  }
  return result;
}

void sub_212B3B1BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3B1D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3B1E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v11;

  v11 = *(void **)a10;
  if (*(_QWORD *)a10)
  {
    *(_QWORD *)(a10 + 8) = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::Firmware::BundleVersionsSupported(uint64_t a1, std::string **a2)
{
  std::string *v4;
  std::string *i;
  const __CFArray *v6;
  const __CFArray *v7;
  CFTypeID v8;
  CFTypeID TypeID;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Int;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  std::string *v19;
  std::string *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  std::string *v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  std::string *v30;
  std::string *p_p;
  std::string::size_type size;
  std::string *v33;
  std::string *v34;
  __int128 v35;
  std::string *m;
  int v38;
  const std::string::value_type *v39;
  std::string::size_type v40;
  std::string *k;
  int v42;
  const std::string::value_type *v43;
  std::string::size_type v44;
  std::string *v45;
  std::string::size_type v46;
  std::string *j;
  char v48;
  std::string __dst;
  std::string **context;
  _QWORD v51[2];
  std::string __p;
  uint64_t v53;
  CFRange v54;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  for (i = a2[1]; i != v4; --i)
  {
    if (SHIBYTE(i[-1].__r_.__value_.__r.__words[2]) < 0)
      operator delete(i[-1].__r_.__value_.__l.__data_);
  }
  a2[1] = v4;
  v51[0] = 0xAAAAAAAAAAAAAAAALL;
  v51[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v51, *(const __CFDictionary **)(a1 + 40));
  context = a2;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&__p, "com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderVersionsSupported");
  v6 = (const __CFArray *)(*(uint64_t (**)(_QWORD *, std::string::size_type))v51[0])(v51, __p.__r_.__value_.__r.__words[0]);
  v7 = v6;
  if (v6)
  {
    v8 = CFGetTypeID(v6);
    TypeID = CFArrayGetTypeID();
    if (v8 == TypeID)
    {
      v54.length = CFArrayGetCount(v7);
      v54.location = 0;
      CFArrayApplyFunction(v7, v54, (CFArrayApplierFunction)ctu::cf::_Applier_InsertArrayDefault<std::string,std::back_insert_iterator<std::vector<std::string>>>, &context);
    }
    CFRelease(v7);
    MEMORY[0x212BF9A34](&__p);
    if (v8 == TypeID)
      goto LABEL_53;
  }
  else
  {
    MEMORY[0x212BF9A34](&__p);
  }
  Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v51, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderMajorVersion"));
  v14 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v51, CFSTR("com.apple.EmbeddedSoftwareRestore.eUICC.bootloaderMinorVersion"));
  if ((Int & 0x80000000) == 0)
  {
    v18 = v14;
    if ((v14 & 0x80000000) == 0)
    {
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) != 0)
          goto LABEL_16;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) != 0)
        {
LABEL_16:
          if (gBBULogVerbosity >= 1)
            _BBULog(22, 1, "eUICCFirmwareParser", "", "[LEGACY] Bundle Version: %d.%d\n", v15, v16, v17, Int);
        }
      }
      eUICC::Firmware::BootloaderVersion((eUICC::Firmware *)Int, v18, &__p);
      v19 = a2[2];
      v20 = *a2;
      if (v19 == *a2)
      {
        if (v19)
        {
          v26 = a2[1];
          v27 = a2[2];
          if (v26 != v19)
          {
            do
            {
              if (SHIBYTE(v26[-1].__r_.__value_.__r.__words[2]) < 0)
                operator delete(v26[-1].__r_.__value_.__l.__data_);
              --v26;
            }
            while (v26 != v19);
            v27 = *a2;
          }
          a2[1] = v19;
          operator delete(v27);
          *a2 = 0;
          a2[1] = 0;
          a2[2] = 0;
        }
        v30 = (std::string *)operator new(0x18uLL);
        *a2 = v30;
        a2[1] = v30;
        v29 = v30 + 1;
        a2[2] = v30 + 1;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(v30, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        else
          *v30 = __p;
      }
      else if (a2[1] == v20)
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(*a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          v28 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v20->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v28;
        }
        v29 = v20 + 1;
      }
      else
      {
        if (v20 != &__p)
        {
          if (SHIBYTE(v20->__r_.__value_.__r.__words[2]) < 0)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_p = &__p;
            else
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            else
              size = __p.__r_.__value_.__l.__size_;
            std::string::__assign_no_alias<false>((void **)&(*a2)->__r_.__value_.__l.__data_, p_p, size);
          }
          else if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>(*a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            v21 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v20->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          }
        }
        v29 = v20 + 1;
        for (j = a2[1]; j != v29; --j)
        {
          if (SHIBYTE(j[-1].__r_.__value_.__r.__words[2]) < 0)
            operator delete(j[-1].__r_.__value_.__l.__data_);
        }
      }
      a2[1] = v29;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
LABEL_53:
      v25 = 1;
      goto LABEL_54;
    }
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Condition <<%s>> failed %s %s/%d\n", v15, v16, v17, (char)"success");
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCFirmwareParser", "", "Bunk legacy keys?\n", v22, v23, v24, v48);
  v25 = 0;
LABEL_54:
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) == 0)
      goto LABEL_66;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x40) == 0)
      goto LABEL_66;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v33 = *a2;
    v34 = a2[1];
    memset(&__dst, 0, sizeof(__dst));
    if (v33 != v34)
    {
      if (v33 != &__dst)
      {
        if (SHIBYTE(v33->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__assign_no_alias<true>(&__dst, v33->__r_.__value_.__l.__data_, v33->__r_.__value_.__l.__size_);
        }
        else
        {
          v35 = *(_OWORD *)&v33->__r_.__value_.__l.__data_;
          __dst.__r_.__value_.__r.__words[2] = v33->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v35;
        }
      }
      if (", ")
      {
        for (k = v33 + 1; k != v34; ++k)
        {
          *((_BYTE *)&__p.__r_.__value_.__s + 23) = 2;
          memmove(&__p, ", ", 2uLL);
          __p.__r_.__value_.__s.__data_[2] = 0;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v45 = &__p;
          else
            v45 = (std::string *)__p.__r_.__value_.__r.__words[0];
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v46 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            v46 = __p.__r_.__value_.__l.__size_;
          std::string::append(&__dst, (const std::string::value_type *)v45, v46);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          v42 = SHIBYTE(k->__r_.__value_.__r.__words[2]);
          if (v42 >= 0)
            v43 = (const std::string::value_type *)k;
          else
            v43 = (const std::string::value_type *)k->__r_.__value_.__r.__words[0];
          if (v42 >= 0)
            v44 = HIBYTE(k->__r_.__value_.__r.__words[2]);
          else
            v44 = k->__r_.__value_.__l.__size_;
          std::string::append(&__dst, v43, v44);
        }
      }
      else
      {
        for (m = v33 + 1; m != v34; ++m)
        {
          memset(&__p, 0, sizeof(__p));
          std::string::append(&__dst, (const std::string::value_type *)&__p, 0);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          v38 = SHIBYTE(m->__r_.__value_.__r.__words[2]);
          if (v38 >= 0)
            v39 = (const std::string::value_type *)m;
          else
            v39 = (const std::string::value_type *)m->__r_.__value_.__r.__words[0];
          if (v38 >= 0)
            v40 = HIBYTE(m->__r_.__value_.__r.__words[2]);
          else
            v40 = m->__r_.__value_.__l.__size_;
          std::string::append(&__dst, v39, v40);
        }
      }
    }
    _BBULog(22, 0, "eUICCFirmwareParser", "", "Supported Bootloader Versions success %d ret { %s }\n", v10, v11, v12, v25);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_66:
  MEMORY[0x212BF9A70](v51);
  return v25;
}

void sub_212B3B974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = v28;
  *(_QWORD *)(v27 + 8) = v29;
  if (a27 < 0)
  {
    operator delete(__p);
    MEMORY[0x212BF9A70](&a20);
    _Unwind_Resume(a1);
  }
  MEMORY[0x212BF9A70](&a20);
  _Unwind_Resume(a1);
}

void eUICC::Firmware::BootloaderVersion(eUICC::Firmware *this@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  std::string *v5;
  __int128 v6;
  std::string *p_p;
  std::string::size_type size;
  std::string *v9;
  std::string __p;
  std::string v11;
  std::string v12;

  std::to_string(&v11, (int)this);
  v5 = std::string::append(&v11, ".", 1uLL);
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v12.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v9 = std::string::append(&v12, (const std::string::value_type *)p_p, size);
  *a3 = *v9;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return;
LABEL_13:
      operator delete(v11.__r_.__value_.__l.__data_);
      return;
    }
  }
  else if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_13;
}

void sub_212B3BB8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a26 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a20 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if ((a26 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a21);
  if ((a20 & 0x80000000) == 0)
LABEL_4:
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

void eUICC::Firmware::~Firmware(eUICC::Firmware *this)
{
  void *v1;

  eUICC::Firmware::~Firmware(this);
  operator delete(v1);
}

{
  void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  std::__shared_weak_count *v6;

  *(_QWORD *)this = off_24CE857F8;
  v2 = (void *)*((_QWORD *)this + 6);
  if (v2)
  {
    *((_QWORD *)this + 7) = v2;
    operator delete(v2);
  }
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 4);
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 3);
  if (v5)
    CFRelease(v5);
  v6 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v6)
    std::__shared_weak_count::__release_weak(v6);
}

void std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 40))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<eUICC::Firmware *,std::shared_ptr<eUICC::Firmware>::__shared_ptr_default_delete<eUICC::Firmware,eUICC::Firmware>,std::allocator<eUICC::Firmware>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B5648ELL)
    return a1 + 24;
  if (((v3 & 0x8000000212B5648ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B5648ELL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B5648ELL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void ctu::cf::_Applier_InsertArrayDefault<std::string,std::back_insert_iterator<std::vector<std::string>>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  __int128 v5;
  void *__p[2];
  uint64_t v7;

  __p[0] = 0;
  __p[1] = 0;
  v7 = 0;
  ctu::cf::assign();
  v3 = *a2;
  v4 = *(_QWORD *)(v3 + 8);
  if (v4 >= *(_QWORD *)(v3 + 16))
  {
    *(_QWORD *)(v3 + 8) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v3, (uint64_t)__p);
    if (SHIBYTE(v7) < 0)
LABEL_8:
      operator delete(__p[0]);
  }
  else
  {
    if (SHIBYTE(v7) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v3 + 8), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      v5 = *(_OWORD *)__p;
      *(_QWORD *)(v4 + 16) = v7;
      *(_OWORD *)v4 = v5;
    }
    *(_QWORD *)(v3 + 8) = v4 + 24;
    *(_QWORD *)(v3 + 8) = v4 + 24;
    if (SHIBYTE(v7) < 0)
      goto LABEL_8;
  }
}

void sub_212B3BE00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v15 + 8) = v16;
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BBUBootLogger::BBUBootLogger(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE v8[8];
  uint64_t v9;
  dispatch_object_t object;

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, "com.apple.telephony.bb", "BBUBootLogger");
  v6 = v9;
  object = 0;
  ctu::SharedSynchronizable<BBUBootLogger>::SharedSynchronizable((_QWORD *)a1, "BBUBootLogger", QOS_CLASS_UTILITY, &object);
  if (object)
    dispatch_release(object);
  MEMORY[0x212BF998C](a1 + 32, v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  *(_DWORD *)(a1 + 128) = a2;
  *(_QWORD *)(a1 + 136) = a3;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_QWORD *)(a1 + 120) = 0;
  return a1;
}

void sub_212B3BEE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  va_list va;

  va_start(va, a2);
  ctu::SharedSynchronizable<BBUBootLogger>::~SharedSynchronizable(v2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  _Unwind_Resume(a1);
}

void sub_212B3BF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, dispatch_object_t object)
{
  if (object)
    dispatch_release(object);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a10);
  _Unwind_Resume(a1);
}

void ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke(_QWORD *a1, int a2)
{
  std::__shared_weak_count *v3;
  uint64_t v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (!a1[5])
        goto LABEL_11;
      if (a2 == 1)
      {
        v8 = *(NSObject **)(v5 + 32);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        v14 = 0;
        v9 = "#D status error";
        v10 = (uint8_t *)&v14;
      }
      else if (a2)
      {
        v8 = *(NSObject **)(v5 + 32);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        v13 = 0;
        v9 = "#D status unknown";
        v10 = (uint8_t *)&v13;
      }
      else
      {
        v8 = *(NSObject **)(v5 + 32);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          goto LABEL_11;
        v15 = 0;
        v9 = "#D status not ready";
        v10 = (uint8_t *)&v15;
      }
      _os_log_debug_impl(&dword_212A4D000, v8, OS_LOG_TYPE_DEBUG, v9, v10, 2u);
LABEL_11:
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

uint64_t __copy_helper_block_e8_40c38_ZTSNSt3__18weak_ptrI13BBUBootLoggerEE(uint64_t result, uint64_t a2)
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

void __destroy_helper_block_e8_40c38_ZTSNSt3__18weak_ptrI13BBUBootLoggerEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke_2(_QWORD *a1, int a2, const char *a3, unsigned int a4)
{
  std::__shared_weak_count *v5;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  BBUFeedback *v17;
  NSObject *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v21;
  uint8_t buf[4];
  _BYTE v23[10];
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    v9 = a1[4];
    v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      v11 = v10;
      v12 = a1[5];
      if (v12)
      {
        v13 = operator new[](a4 + 1);
        v14 = *(NSObject **)(v9 + 32);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v21 = *(_DWORD *)(v12 + 128);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v23 = a2;
          *(_WORD *)&v23[4] = 1024;
          *(_DWORD *)&v23[6] = a4;
          v24 = 1024;
          v25 = v21;
          _os_log_debug_impl(&dword_212A4D000, v14, OS_LOG_TYPE_DEBUG, "#D read status is %d, size is %u, output is %u", buf, 0x14u);
        }
        bzero(v13, a4 + 1);
        strncpy((char *)v13, a3, a4);
        v15 = *(_DWORD *)(v12 + 128);
        if (v15 == 1)
        {
          v17 = *(BBUFeedback **)(v12 + 136);
          if (v17)
          {
            BBUFeedback::handleComment(v17, "BBUBootLogger: %s", (const char *)v13);
          }
          else
          {
            v18 = *(NSObject **)(v9 + 32);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_212A4D000, v18, OS_LOG_TYPE_ERROR, "feedback object is null", buf, 2u);
            }
          }
        }
        else if (v15 == 2)
        {
          v16 = *(NSObject **)(v9 + 32);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v23 = v13;
            _os_log_impl(&dword_212A4D000, v16, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
        }
        operator delete[](v13);
      }
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

void sub_212B3C2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL BBUBootLogger::openTransport(BBUBootLogger *this)
{
  NSObject *v1;
  char *v2;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD v6[6];
  _QWORD *v7;
  uint64_t block;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  char *v12;
  _QWORD *v13;
  char v14;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ZN13BBUBootLogger13openTransportEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_0;
  v4[4] = this;
  v5 = v4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK3ctu20SharedSynchronizableI13BBUBootLoggerE20execute_wrapped_syncIU13block_pointerFbvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS6__block_invoke;
  v6[3] = &__block_descriptor_tmp_13_0;
  v6[4] = this;
  v6[5] = &v5;
  v7 = v6;
  v2 = (char *)this + 16;
  v1 = *((_QWORD *)this + 2);
  if (*((_QWORD *)v2 + 1))
  {
    v14 = -86;
    block = MEMORY[0x24BDAC760];
    v9 = 0x40000000;
    v10 = ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    v11 = &__block_descriptor_tmp_16;
    v12 = &v14;
    v13 = &v7;
    dispatch_async_and_wait(v1, &block);
  }
  else
  {
    v14 = -86;
    block = MEMORY[0x24BDAC760];
    v9 = 0x40000000;
    v10 = ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke;
    v11 = &__block_descriptor_tmp_15;
    v12 = &v14;
    v13 = &v7;
    dispatch_sync(v1, &block);
  }
  return v14 != 0;
}

uint64_t ___ZN13BBUBootLogger13openTransportEv_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_weak_owners;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;

  v1 = *(uint64_t **)(a1 + 32);
  v2 = (std::__shared_weak_count *)v1[1];
  if (!v2 || (v3 = *v1, (v4 = std::__shared_weak_count::lock(v2)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v5 = v4;
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v7 = __ldxr(p_shared_weak_owners);
  while (__stxr(v7 + 1, p_shared_weak_owners));
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  v25 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v10;
  v24 = v10;
  v21 = v10;
  v22 = v10;
  v20 = v10;
  TelephonyBasebandPCITransportInitParameters();
  *((_QWORD *)&v20 + 1) = v1[2];
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1174405120;
  v18[2] = ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke;
  v18[3] = &__block_descriptor_tmp_14;
  v18[4] = v1;
  v18[5] = v3;
  v19 = v5;
  do
    v12 = __ldxr(p_shared_weak_owners);
  while (__stxr(v12 + 1, p_shared_weak_owners));
  *(_QWORD *)&v21 = v18;
  LODWORD(v20) = 20;
  *(_QWORD *)((char *)&v22 + 4) = 0x40000000002;
  DWORD2(v21) = 5000;
  LODWORD(v22) = v22 | 4;
  v16[0] = v11;
  v16[1] = 1174405120;
  v16[2] = ___ZN13BBUBootLogger18openTransport_syncEv_block_invoke_2;
  v16[3] = &__block_descriptor_tmp_5_1;
  v16[4] = v1;
  v16[5] = v3;
  v17 = v5;
  do
    v13 = __ldxr(p_shared_weak_owners);
  while (__stxr(v13 + 1, p_shared_weak_owners));
  *(_QWORD *)&v23 = v16;
  v14 = TelephonyBasebandPCITransportCreate();
  if (v17)
    std::__shared_weak_count::__release_weak(v17);
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  std::__shared_weak_count::__release_weak(v5);
  return v14;
}

void sub_212B3C588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v24;

  if (a15)
  {
    std::__shared_weak_count::__release_weak(a15);
    v24 = a22;
    if (!a22)
    {
LABEL_3:
      std::__shared_weak_count::__release_weak(v22);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v24 = a22;
    if (!a22)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v24);
  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_212B3C5CC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

_QWORD *ctu::SharedSynchronizable<BBUBootLogger>::~SharedSynchronizable(_QWORD *a1)
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

std::__shared_weak_count_vtbl **std::shared_ptr<BBUBootLogger>::shared_ptr[abi:ne180100]<BBUBootLogger,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1},void>(std::__shared_weak_count_vtbl **a1, std::__shared_weak_count_vtbl *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v6;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t v14;

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85950;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = a2;
  a1[1] = (std::__shared_weak_count_vtbl *)v4;
  if (!a2)
    return a1;
  v6 = (std::__shared_weak_count *)a2->~__shared_weak_count_0;
  if (v6)
  {
    if (v6->__shared_owners_ != -1)
      return a1;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
    a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v9 = (unint64_t *)&v4->__shared_weak_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
    a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (v14)
    return a1;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_212B3C72C(void *a1)
{
  dispatch_queue_t *v1;

  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1}::operator() const(BBUBootLogger*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_212B3C74C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::__on_zero_shared(uint64_t a1)
{
  dispatch_barrier_async_f(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 24) + 16), *(void **)(a1 + 24), (dispatch_function_t)std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1}::operator() const(BBUBootLogger*)::{lambda(void *)#1}::__invoke);
}

uint64_t std::__shared_ptr_pointer<BBUBootLogger *,std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger *)#1},std::allocator<BBUBootLogger>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrI"
                                "T_EEPS6_EUlPS1_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableI13BBUBootLoggerE15make_shared_ptrIS1_EENSt3__110shared_ptrIT_EEPS6_EUlPS1_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

void std::shared_ptr<BBUBootLogger> ctu::SharedSynchronizable<BBUBootLogger>::make_shared_ptr<BBUBootLogger>(BBUBootLogger*)::{lambda(BBUBootLogger*)#1}::operator() const(BBUBootLogger*)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  unsigned int (*v2)(uint64_t);
  _OWORD *v3;
  NSObject *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;

  if (a1)
  {
    v2 = *(unsigned int (**)(uint64_t))(a1 + 96);
    if (v2)
    {
      v3 = (_OWORD *)(a1 + 40);
      if (v2(a1 + 40))
      {
        TelephonyUtilTransportFree();
        *(_QWORD *)(a1 + 120) = 0;
        *(_OWORD *)(a1 + 88) = 0u;
        *(_OWORD *)(a1 + 104) = 0u;
        *(_OWORD *)(a1 + 56) = 0u;
        *(_OWORD *)(a1 + 72) = 0u;
        *v3 = 0u;
      }
    }
    MEMORY[0x212BF99A4](a1 + 32);
    v4 = *(NSObject **)(a1 + 24);
    if (v4)
      dispatch_release(v4);
    v5 = *(NSObject **)(a1 + 16);
    if (v5)
      dispatch_release(v5);
    v6 = *(std::__shared_weak_count **)(a1 + 8);
    if (v6)
      std::__shared_weak_count::__release_weak(v6);
    operator delete((void *)a1);
  }
}

_QWORD *ctu::SharedSynchronizable<BBUBootLogger>::SharedSynchronizable(_QWORD *a1, const char *a2, dispatch_qos_class_t a3, dispatch_object_t *a4)
{
  NSObject *v8;
  NSObject *initially_inactive;
  NSObject *v10;
  NSObject *v11;

  v8 = *a4;
  if (*a4)
    dispatch_retain(*a4);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v10 = dispatch_queue_create_with_target_V2(a2, initially_inactive, v8);
  dispatch_set_qos_class_floor(v10, a3, 0);
  dispatch_activate(v10);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v10;
  if (v10)
    dispatch_retain(v10);
  v11 = *a4;
  a1[3] = *a4;
  if (v11)
    dispatch_retain(v11);
  if (v10)
    dispatch_release(v10);
  if (v8)
    dispatch_release(v8);
  return a1;
}

uint64_t ___ZN8dispatch9sync_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)(a1 + 40) + 16))();
  **(_BYTE **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN8dispatch19async_and_wait_implIRU13block_pointerFbvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS4_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)(a1 + 40) + 16))();
  **(_BYTE **)(a1 + 32) = result;
  return result;
}

uint64_t BBUEUR4PersonalizationParameters::getFusingState(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  const unsigned int *v4;
  int v6;

  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    *a2 = ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID((ctu *)&v6, v4);
    return 0;
  }
  else
  {
    *a2 = 0;
    return 3;
  }
}

uint64_t BBUEUR4PersonalizationParameters::setPublicKeyHash(uint64_t a1, CFDataRef a2)
{
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  *(_QWORD *)(a1 + 40) = a2;
  if (a2)
  {
    v5 = (const __CFData *)(*(uint64_t (**)(CFDataRef))(*(_QWORD *)a2 + 16))(a2);
    a2 = BBUEURPersonalizationParameters::EURCertID::createFromPublicKeyHashData(v5, v6);
  }
  result = *(_QWORD *)(a1 + 24);
  if (result)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

void BBUEUR4PersonalizationParameters::~BBUEUR4PersonalizationParameters(BBUEUR4PersonalizationParameters *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)this = &unk_24CE83520;
  v2 = *((_QWORD *)this + 1);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 2);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 3);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 4);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *((_QWORD *)this + 5);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 6);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *((_QWORD *)this + 7);
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)this = &unk_24CE83520;
  v2 = *((_QWORD *)this + 1);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 2);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 3);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 4);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *((_QWORD *)this + 5);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 6);
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *((_QWORD *)this + 7);
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  operator delete(this);
}

void BBUEURDSPImage::BBUEURDSPImage(BBUEURDSPImage *this, BBUDataSource *a2, unsigned int a3, uint64_t a4)
{
  _QWORD *v5;
  void **v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  size_t v14;
  __int128 *p_dst;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 __dst;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p[2];
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  BBUEURMIImage::BBUEURMIImage(this, a2, a4);
  *v5 = off_24CE85A68;
  v5[8] = 0;
  v6 = (void **)(v5 + 8);
  v5[9] = 0;
  v5[10] = 0;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v39 = v7;
  v38 = v7;
  v37 = v7;
  v36 = v7;
  v35 = v7;
  v34 = v7;
  v33 = v7;
  v32 = v7;
  v31 = v7;
  v28 = v7;
  *(_OWORD *)__p = v7;
  v26 = v7;
  v25 = v7;
  v24 = v7;
  v23 = v7;
  v8 = MEMORY[0x24BEDB870];
  v9 = MEMORY[0x24BEDB870] + 64;
  v30 = MEMORY[0x24BEDB870] + 64;
  v10 = (uint64_t *)MEMORY[0x24BEDB800];
  v11 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v22 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = v11;
  v12 = (std::ios_base *)((char *)&v22 + *(_QWORD *)(v22 - 24));
  std::ios_base::init(v12, &v23);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v22 = v8 + 24;
  v30 = v9;
  std::streambuf::basic_streambuf();
  v13 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v23 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v28 = 0u;
  LODWORD(v29) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v22, (uint64_t)"DSP", 3);
  std::ostream::operator<<();
  if ((v29 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) < (unint64_t)v26)
    {
      *((_QWORD *)&v28 + 1) = v26;
      v16 = v26;
    }
    v17 = (const void *)*((_QWORD *)&v25 + 1);
    v14 = v16 - *((_QWORD *)&v25 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v25 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v29 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v21) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    v17 = (const void *)v24;
    v14 = v25 - v24;
    if ((_QWORD)v25 - (_QWORD)v24 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    p_dst = (__int128 *)operator new(v18 + 1);
    *((_QWORD *)&__dst + 1) = v14;
    v21 = v19 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v21) = v14;
  p_dst = &__dst;
  if (v14)
LABEL_13:
    memmove(p_dst, v17, v14);
LABEL_14:
  *((_BYTE *)p_dst + v14) = 0;
  if (*((char *)this + 87) < 0)
    operator delete(*v6);
  *(_OWORD *)v6 = __dst;
  v6[2] = (void *)v21;
  v22 = *v10;
  *(uint64_t *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = v10[3];
  *(_QWORD *)&v23 = v13 + 16;
  if (SBYTE7(v28) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](&v30);
}

void sub_212B3CEAC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void **v3;
  uint64_t v5;

  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](v2);
  if (*(char *)(v1 + 87) < 0)
  {
    operator delete(*v3);
    *(_QWORD *)v1 = off_24CE84BF8;
    v5 = *(_QWORD *)(v1 + 8);
    if (!v5)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else
  {
    *(_QWORD *)v1 = off_24CE84BF8;
    v5 = *(_QWORD *)(v1 + 8);
    if (!v5)
      goto LABEL_3;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  _Unwind_Resume(a1);
}

void BBUEURDSPImage::~BBUEURDSPImage(void **this)
{
  void *v2;

  *this = off_24CE85A68;
  if (*((char *)this + 87) < 0)
  {
    operator delete(this[8]);
    *this = off_24CE84BF8;
    v2 = this[1];
    if (!v2)
      return;
  }
  else
  {
    *this = off_24CE84BF8;
    v2 = this[1];
    if (!v2)
      return;
  }
  (*(void (**)(void *))(*(_QWORD *)v2 + 8))(v2);
}

{
  void *v2;

  *this = off_24CE85A68;
  if (*((char *)this + 87) < 0)
  {
    operator delete(this[8]);
    *this = off_24CE84BF8;
    v2 = this[1];
    if (!v2)
      goto LABEL_4;
    goto LABEL_3;
  }
  *this = off_24CE84BF8;
  v2 = this[1];
  if (v2)
LABEL_3:
    (*(void (**)(void *))(*(_QWORD *)v2 + 8))(v2);
LABEL_4:
  operator delete(this);
}

uint64_t BBUEURDSPImage::getName(BBUEURDSPImage *this)
{
  uint64_t result;

  result = (uint64_t)this + 64;
  if (*((char *)this + 87) < 0)
    return *(_QWORD *)result;
  return result;
}

void BBUICEBinaryImage::BBUICEBinaryImage(BBUICEBinaryImage *this, BBUDataSource *a2, const char *__s, int a4)
{
  char *v8;
  size_t v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)this = off_24CE85AC8;
  v8 = (char *)this + 16;
  v9 = strlen(__s);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v9;
  if (v9 >= 0x17)
  {
    v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v12 = v9 | 7;
    v13 = v12 + 1;
    v11 = operator new(v12 + 1);
    *((_QWORD *)this + 3) = v10;
    *((_QWORD *)this + 4) = v13 | 0x8000000000000000;
    *((_QWORD *)this + 2) = v11;
    goto LABEL_8;
  }
  *((_BYTE *)this + 39) = v9;
  v11 = v8;
  if (v9)
LABEL_8:
    memmove(v11, __s, v10);
  *((_BYTE *)v11 + v10) = 0;
  *((_DWORD *)this + 10) = a4;
  *((_QWORD *)this + 6) = a2;
  *((_QWORD *)this + 1) = 1;
  if (a2)
    *((_DWORD *)this + 3) = (*(uint64_t (**)(BBUDataSource *))(*(_QWORD *)a2 + 24))(a2);
}

void sub_212B3D14C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void BBUICEBinaryImage::~BBUICEBinaryImage(BBUICEBinaryImage *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24CE85AC8;
  v2 = *((_QWORD *)this + 6);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
}

{
  uint64_t v2;

  *(_QWORD *)this = off_24CE85AC8;
  v2 = *((_QWORD *)this + 6);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*((char *)this + 39) < 0)
    operator delete(*((void **)this + 2));
  operator delete(this);
}

void *BBUICEBinaryImage::getWritePayloadData(BBUICEBinaryImage *this, unsigned __int8 *a2, uint64_t a3, unsigned int a4)
{
  void *result;
  size_t v9;
  void *exception;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  int v21;

  result = (void *)(*(uint64_t (**)(BBUICEBinaryImage *))(*(_QWORD *)this + 32))(this);
  if ((int)result + 8 <= a4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x1Eu, (ctu::LogMessageBuffer *)"Assertion failure(( offset < (getWritePayloadLength() + kBinHeaderSize)) && \"Error: Chunk size is not sufficient to write payload data of the binary image.\")", v11, v12, v13, v20);
    goto LABEL_14;
  }
  v21 = -1431655766;
  if (a4 <= 7)
  {
    if (8 - a4 >= a3)
      v9 = a3;
    else
      v9 = 8 - a4;
    result = memcpy(a2, (char *)this + a4 + 8, v9);
    a2 += v9;
    a3 = (a3 - v9);
  }
  if ((_DWORD)a3)
  {
    result = (void *)(*(uint64_t (**)(_QWORD, unsigned __int8 *, uint64_t, int *, _QWORD))(**((_QWORD **)this + 6)
                                                                                                  + 16))(*((_QWORD *)this + 6), a2, a3, &v21, a4 + *((_DWORD *)this + 10) - 8);
    if ((_DWORD)result)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x2Eu, (ctu::LogMessageBuffer *)"Assertion failure((ret == kBBUReturnSuccess) && \"Failed to copy binary image payload data to buffer!\")", v14, v15, v16, v20);
    }
    else
    {
      if (v21 == (_DWORD)a3)
        return result;
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 80, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Images/ICE/BBUICEBinaryImage.cpp", 0x2Fu, (ctu::LogMessageBuffer *)"Assertion failure((amountCopied == amount) && \"Copied data size mismatch: Failed to copy binary image payload data to buffer!\")", v17, v18, v19, v20);
    }
LABEL_14:
  }
  return result;
}

void sub_212B3D390(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3D3A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_212B3D3B8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEBinaryImage::getName(BBUICEBinaryImage *this)
{
  uint64_t result;

  result = (uint64_t)this + 16;
  if (*((char *)this + 39) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t BBUICEBinaryImage::getWritePayloadLength(BBUICEBinaryImage *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 6);
  if (v1)
    return (*(unsigned int (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1) + 8;
  else
    return 8;
}

uint64_t BBUICEBinaryImage::getOpenPayloadData(BBUICEBinaryImage *this)
{
  return 0;
}

uint64_t BBUICEBinaryImage::getOpenPayloadLength(BBUICEBinaryImage *this)
{
  return 0;
}

void BBUICEBinaryImage::generateHash(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      BBUDataSource::generateHash(v3, a2, a3);
  }
}

uint64_t BBUICEBinaryImage::generateBinHeader(BBUICEBinaryImage *this)
{
  uint64_t result;

  *((_QWORD *)this + 1) = 1;
  result = *((_QWORD *)this + 6);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
    *((_DWORD *)this + 3) = result;
  }
  return result;
}

void BasebandUpdaterTransport::create(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, ACFUACIPCTransport **a4@<X8>)
{
  ACFUACIPCTransport *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_weak_owners;
  unint64_t v16;
  ACFULogging *v17;
  char v18;
  unint64_t *v19;
  unint64_t v20;
  ACFUACIPCTransport *v21;
  uint64_t v22[2];
  _QWORD v23[2];

  *a4 = (ACFUACIPCTransport *)0xAAAAAAAAAAAAAAAALL;
  v8 = (ACFUACIPCTransport *)operator new(0xC0uLL);
  ACFUACIPCTransport::ACFUACIPCTransport(v8);
  *(_QWORD *)v8 = &off_24CE85B38;
  *((_QWORD *)v8 + 21) = 0;
  *((_QWORD *)v8 + 22) = 0;
  *((_QWORD *)v8 + 20) = 0;
  *((_DWORD *)v8 + 46) = 16777217;
  *a4 = v8;
  v9 = *a1;
  v10 = (std::__shared_weak_count *)a1[1];
  v23[0] = v9;
  v23[1] = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  v13 = *a2;
  v14 = (std::__shared_weak_count *)a2[1];
  v22[0] = v13;
  v22[1] = (uint64_t)v14;
  if (v14)
  {
    p_shared_weak_owners = (unint64_t *)&v14->__shared_weak_owners_;
    do
      v16 = __ldxr(p_shared_weak_owners);
    while (__stxr(v16 + 1, p_shared_weak_owners));
  }
  v17 = (ACFULogging *)BasebandUpdaterTransport::init((uint64_t)v8, (uint64_t)v23, v22, a3);
  v18 = (char)v17;
  if (v14)
    std::__shared_weak_count::__release_weak(v14);
  if (v10)
  {
    v19 = (unint64_t *)&v10->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  if ((v18 & 1) == 0)
  {
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    v21 = *a4;
    *a4 = 0;
    if (v21)
      (*(void (**)(ACFUACIPCTransport *))(*(_QWORD *)v21 + 64))(v21);
  }
}

void sub_212B3D5EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t *v13;
  uint64_t v15;

  v15 = *v13;
  *v13 = 0;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 64))(v15);
  _Unwind_Resume(exception_object);
}

void sub_212B3D634(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::init(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  ACFULogging *Controller;
  const void *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v29;
  _QWORD v30[3];
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  Controller = (ACFULogging *)TelephonyBasebandCreateController();
  v9 = *(const void **)(a1 + 160);
  *(_QWORD *)(a1 + 160) = Controller;
  if (v9)
  {
    CFRelease(v9);
    Controller = *(ACFULogging **)(a1 + 160);
  }
  v10 = ctu::SharedRef<__TelephonyBasebandControllerHandle_tag,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__TelephonyBasebandControllerHandle_tag>::get;
  if (!Controller)
    v10 = 0;
  if (!v10)
  {
    ACFULogging::getLogInstance(Controller);
    ACFULogging::handleMessage();
    return 0;
  }
  v12 = *a3;
  v11 = a3[1];
  if (v11)
  {
    v13 = (unint64_t *)(v11 + 16);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = *(std::__shared_weak_count **)(a1 + 176);
  *(_QWORD *)(a1 + 168) = v12;
  *(_QWORD *)(a1 + 176) = v11;
  if (v15)
    std::__shared_weak_count::__release_weak(v15);
  *(_BYTE *)(a1 + 184) = BYTE4(a4) & 1;
  *(_BYTE *)(a1 + 185) = BYTE5(a4) & 1;
  *(_BYTE *)(a1 + 186) = BYTE6(a4) & 1;
  *(_BYTE *)(a1 + 187) = (a4 & 0x100000000000000) == 0;
  if ((_DWORD)a4)
  {
    ACFULogging::getLogInstance((ACFULogging *)v15);
    ACFULogging::handleMessage();
    *(_DWORD *)(a1 + 40) = a4;
    *(_DWORD *)(a1 + 44) = a4;
  }
  v16 = (_QWORD *)(a1 + 56);
  v17 = v30;
  v30[0] = off_24CE85CF8;
  v31 = v30;
  if ((_QWORD *)(a1 + 56) == v30)
  {
    v18 = 4;
  }
  else
  {
    v17 = *(_QWORD **)(a1 + 80);
    if (v17 == v16)
    {
      v31 = 0;
      v17 = v30;
      (*(void (**)(uint64_t, _QWORD *))(*v16 + 24))(a1 + 56, v30);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 80) + 32))(*(_QWORD *)(a1 + 80));
      v31 = v30;
      *(_QWORD *)(a1 + 56) = off_24CE85CF8;
      v18 = 4;
      *(_QWORD *)(a1 + 80) = v16;
    }
    else
    {
      *(_QWORD *)(a1 + 56) = off_24CE85CF8;
      v31 = v17;
      *(_QWORD *)(a1 + 80) = v16;
      if (v17 == v30)
      {
        v18 = 4;
        v17 = v30;
      }
      else
      {
        if (!v17)
          goto LABEL_23;
        v18 = 5;
      }
    }
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v18))(v17);
LABEL_23:
  v20 = (_QWORD *)(a1 + 88);
  v30[0] = off_24CE85D88;
  v30[1] = a1;
  v21 = v30;
  v31 = v30;
  if ((_QWORD *)(a1 + 88) == v30)
  {
    v22 = 4;
    goto LABEL_31;
  }
  v21 = *(_QWORD **)(a1 + 112);
  if (v21 == v20)
  {
    v31 = 0;
    v21 = v30;
    (*(void (**)(uint64_t, _QWORD *))(*v20 + 24))(a1 + 88, v30);
    (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 32))(*(_QWORD *)(a1 + 112));
    v31 = v30;
    *(_QWORD *)(a1 + 88) = off_24CE85D88;
    *(_QWORD *)(a1 + 96) = a1;
    v22 = 4;
    *(_QWORD *)(a1 + 112) = v20;
    goto LABEL_31;
  }
  *(_QWORD *)(a1 + 88) = off_24CE85D88;
  *(_QWORD *)(a1 + 96) = a1;
  v31 = v21;
  *(_QWORD *)(a1 + 112) = v20;
  if (v21 == v30)
  {
    v22 = 4;
    v21 = v30;
    goto LABEL_31;
  }
  if (v21)
  {
    v22 = 5;
LABEL_31:
    (*(void (**)(_QWORD *))(*v21 + 8 * v22))(v21);
  }
  v23 = *(std::__shared_weak_count **)(a2 + 8);
  v29 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
  }
  v19 = ACFUACIPCTransport::init();
  if (v29)
  {
    v26 = (unint64_t *)&v29->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  return v19;
}

void sub_212B3D970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t BasebandUpdaterTransport::IOACIPCHelper::init(BasebandUpdaterTransport::IOACIPCHelper *this, const char *a2)
{
  uint64_t v4;
  ACFULogging *v5;
  __CFDictionary *v6;
  uint64_t (*v7)(uint64_t);
  __CFString *v8;
  __CFString *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t TypeID;
  CFTypeID v12;
  __CFDictionary *v13;
  uint64_t (*v14)(uint64_t);
  IOACIPCClass *v15;
  uint64_t v16;
  dispatch_queue_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  ACFULogging *v21;
  uint64_t v22;
  uint64_t v23;
  ACFULogging *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  ACFULogging *v29;
  uint64_t v30;
  NSObject *v31;
  ACFULogging *v32;
  uint64_t v33;
  io_object_t v34;
  _QWORD block[6];
  ACFULogging *v37;
  ACFULogging **v38;
  uint64_t v39;
  char v40;
  __CFDictionary *v41;
  _QWORD v42[5];
  _QWORD v43[6];
  _QWORD v44[6];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  __CFString *v49;
  _QWORD v50[3];
  ACFULogging *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3052000000;
  v44[3] = __Block_byref_object_copy__3;
  v44[4] = __Block_byref_object_dispose__3;
  v4 = MEMORY[0x24BDAC760];
  v42[4] = v44;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3254779904;
  v43[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke;
  v43[3] = &__block_descriptor_48_e8_32r_e8_v12__0I8l;
  v43[4] = &v45;
  v43[5] = this;
  v44[5] = v43;
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3254779904;
  v42[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_6;
  v42[3] = &__block_descriptor_40_e8_32r_e8_v12__0I8l;
  v49 = 0;
  v5 = IOServiceMatching("IOAppleConvergedIPCInterface");
  v6 = v5;
  v37 = v5;
  v7 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  if (!v5)
    v7 = 0;
  if (v7)
  {
    v8 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x600u);
    v9 = v8;
    v49 = v8;
    v10 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    if (!v8)
      v10 = 0;
    if (v10)
    {
      CFDictionarySetValue(v6, CFSTR("ACIPCInterfaceProtocol"), v8);
      CFDictionarySetValue(v6, CFSTR("ACIPCInterfaceProviderDevice"), CFSTR("cellular"));
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v8);
      TypeID = ACFULogging::handleMessage();
    }
    if (!v6)
      goto LABEL_13;
  }
  else
  {
    ACFULogging::getLogInstance(v5);
    TypeID = ACFULogging::handleMessage();
    v9 = 0;
    if (!v6)
      goto LABEL_13;
  }
  v12 = CFGetTypeID(v6);
  TypeID = CFDictionaryGetTypeID();
  if (v12 == TypeID)
  {
    v41 = v6;
    TypeID = (uint64_t)CFRetain(v6);
    v13 = v6;
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_13:
  v13 = 0;
  v41 = 0;
  if (v9)
LABEL_14:
    CFRelease(v9);
LABEL_15:
  if (v6)
    CFRelease(v6);
  v14 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  if (!v13)
    v14 = 0;
  if (!v14)
    goto LABEL_47;
  v15 = (IOACIPCClass *)operator new(0xC0uLL);
  *((_OWORD *)v15 + 10) = 0u;
  *((_OWORD *)v15 + 11) = 0u;
  *((_OWORD *)v15 + 8) = 0u;
  *((_OWORD *)v15 + 9) = 0u;
  *((_OWORD *)v15 + 6) = 0u;
  *((_OWORD *)v15 + 7) = 0u;
  *((_OWORD *)v15 + 4) = 0u;
  *((_OWORD *)v15 + 5) = 0u;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  *(_OWORD *)v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  IOACIPCClass::IOACIPCClass(v15);
  *(_QWORD *)v15 = MEMORY[0x24BED4860] + 16;
  v16 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v15;
  if (v16)
  {
    TypeID = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    if (!*((_QWORD *)this + 1))
      goto LABEL_47;
  }
  v17 = dispatch_queue_create("com.apple.bbu.acipcTransport", 0);
  v18 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = v17;
  if (v18)
  {
    dispatch_release(v18);
    v17 = (dispatch_queue_t)*((_QWORD *)this + 2);
  }
  if (!v17)
  {
    ACFULogging::getLogInstance(0);
LABEL_48:
    ACFULogging::handleMessage();
    v33 = 0;
    goto LABEL_38;
  }
  TypeID = (uint64_t)operator new(0x78uLL);
  *(_QWORD *)(TypeID + 112) = 0;
  *(_QWORD *)TypeID = 1018212795;
  *(_OWORD *)(TypeID + 8) = 0u;
  *(_OWORD *)(TypeID + 24) = 0u;
  *(_QWORD *)(TypeID + 40) = 0;
  *(_QWORD *)(TypeID + 48) = 850045863;
  *(_OWORD *)(TypeID + 56) = 0u;
  *(_OWORD *)(TypeID + 72) = 0u;
  *(_OWORD *)(TypeID + 88) = 0u;
  *(_OWORD *)(TypeID + 100) = 0u;
  v19 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = TypeID;
  if (v19)
  {
    std::mutex::~mutex((std::mutex *)(v19 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v19);
    operator delete(v20);
    if (!*((_QWORD *)this + 3))
    {
LABEL_47:
      ACFULogging::getLogInstance((ACFULogging *)TypeID);
      goto LABEL_48;
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)TypeID);
  v21 = (ACFULogging *)ACFULogging::handleMessage();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v22 = *((_QWORD *)this + 1);
  v23 = *((_QWORD *)this + 2);
  ACFULogging::getLogInstance(v21);
  ACFULogging::handleMessage();
  v24 = (ACFULogging *)(*(uint64_t (**)(uint64_t, __CFDictionary *, uint64_t, _QWORD *, void *, _QWORD))(*(_QWORD *)v22 + 24))(v22, v13, v23, v42, &__block_literal_global_6, 0);
  if ((v24 & 1) != 0)
  {
    v50[0] = off_24CE85EA8;
    v51 = (ACFULogging *)v50;
    v28 = ACFUSynchronize::Syncher::wait();
    v29 = v51;
    if (v51 == (ACFULogging *)v50)
    {
      v30 = 4;
      v29 = (ACFULogging *)v50;
    }
    else
    {
      if (!v51)
      {
LABEL_33:
        if ((v28 & 1) == 0)
        {
          v31 = *((_QWORD *)this + 2);
          block[0] = v4;
          block[1] = 3254779904;
          block[2] = ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_2;
          block[3] = &__block_descriptor_48_e8_32r40r_e5_v8__0l;
          block[4] = v44;
          block[5] = &v37;
          dispatch_sync(v31, block);
        }
        if (!*((_BYTE *)v38 + 24))
        {
          v29 = (ACFULogging *)(*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)this + 1) + 40))(*((_QWORD *)this + 1), *((unsigned int *)v46 + 6));
          if (!(_DWORD)v29)
          {
            _Block_object_dispose(&v37, 8);
            ACFULogging::getLogInstance(v32);
            ACFULogging::handleMessage();
            v33 = 1;
            goto LABEL_38;
          }
        }
        ACFULogging::getLogInstance(v29);
        ACFULogging::handleMessage();
        goto LABEL_51;
      }
      v30 = 5;
    }
    v29 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v29 + 8 * v30))(v29, v25, v26, v27);
    goto LABEL_33;
  }
  ACFULogging::getLogInstance(v24);
  ACFULogging::handleMessage();
LABEL_51:
  _Block_object_dispose(&v37, 8);
  v33 = 0;
LABEL_38:
  v34 = *((_DWORD *)v46 + 6);
  if (v34)
    IOObjectRelease(v34);
  if (v13)
    CFRelease(v13);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  return v33;
}

void sub_212B3DF70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void sub_212B3E14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
  {
    result = (*(uint64_t (**)(void))(result + 16))();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
  return result;
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_7(ACFULogging *a1)
{
  ACFULogging::getLogInstance(a1);
  return ACFULogging::handleMessage();
}

uint64_t ___ZN24BasebandUpdaterTransport13IOACIPCHelper4initEPKcj_block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void BasebandUpdaterTransport::getBoardParameters(BasebandUpdaterTransport *this@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  ACFULogging *v11;
  uint64_t RandomNum;
  unsigned int *v13;
  size_t v14;
  CFDataRef v15;
  const __CFAllocator *v16;
  CFDataRef v17;
  CFDataRef v18;
  CFDataRef v19;
  CFDataRef v20;
  CFDataRef v21;
  CFDataRef v22;
  ACFULogging *v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t *v31;
  _OWORD *v32;
  BasebandUpdaterTransport::IOACIPCHelper *v33;
  uint64_t v34;
  CFAllocatorRef *v35;
  ACFULogging *BootNonce;
  ACFULogging *Register;
  ACFULogging *v38;
  const __CFAllocator *v39;
  CFDataRef v40;
  ACFULogging *v41;
  ACFULogging *v42;
  CFDataRef v43;
  ACFULogging *v44;
  ACFULogging *v45;
  ACFULogging *v46;
  const __CFAllocator *v47;
  CFDataRef v48;
  CFDataRef v49;
  CFDataRef v50;
  CFDataRef v51;
  CFDataRef v52;
  CFDataRef v53;
  CFDataRef v54;
  ACFULogging *v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  ACFULogging *v60;
  ACFULogging *v61;
  UInt8 v62;
  UInt8 v63;
  UInt8 v64;
  UInt8 v65;
  UInt8 v66;
  UInt8 v67[2];
  unsigned int v68;
  unsigned __int8 v69[4];
  unsigned int v70;
  UInt8 bytes[8];
  unsigned int v72[2];
  unsigned int v73[2];
  IOACIPCClass *v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  unsigned int v78[2];
  UInt8 v79[8];
  void *__p[2];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD __dst[8];

  __dst[5] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    memset(__dst, 0, 32);
    ACFULogging::getLogInstance(this);
    ACFULogging::handleMessage();
    v6 = (std::__shared_weak_count *)operator new(0xE8uLL);
    v6->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85F28;
    v8 = operator new(0x40uLL);
    __p[0] = v8;
    *v8 = xmmword_24CE85C58;
    v8[1] = *(_OWORD *)&off_24CE85C68;
    v8[2] = xmmword_24CE85C78;
    v8[3] = *(_OWORD *)off_24CE85C88;
    __p[1] = v8 + 4;
    *(_QWORD *)&v81 = v8 + 4;
    MEMORY[0x212BF91E8](&v6[1], __p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_QWORD *)v79 = 0xAAAAAAAAAAAAAAAALL;
    security::ARICommandDriver::ARICommandDriver();
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v82 = v9;
    v83 = v9;
    v81 = v9;
    *(_OWORD *)__p = v9;
    AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)__p);
    *(_QWORD *)v78 = 0;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v76 = v10;
    v77 = v10;
    *(_OWORD *)v74 = v10;
    v75 = v10;
    AriSdk::ARI_GetPersonalizationParametersReq_SDK::ARI_GetPersonalizationParametersReq_SDK((AriSdk::ARI_GetPersonalizationParametersReq_SDK *)v74);
    *(_QWORD *)v72 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v73 = 0;
    support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)v72);
    if (!*(_QWORD *)v72)
    {
      ACFULogging::getLogInstance(v11);
      ACFULogging::handleMessage();
      v24 = 3019;
LABEL_13:
      if (*(_QWORD *)v78)
        (*(void (**)(_QWORD))(**(_QWORD **)v78 + 16))(*(_QWORD *)v78);
      if (*(_QWORD *)v73)
        (*(void (**)(_QWORD))(**(_QWORD **)v73 + 16))(*(_QWORD *)v73);
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
      *(_QWORD *)a4 = v6 + 1;
      *(_QWORD *)(a4 + 8) = v6;
      do
        v26 = __ldxr(p_shared_owners);
      while (__stxr(v26 + 1, p_shared_owners));
      *(_DWORD *)(a4 + 16) = v24;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
      v28 = *(_QWORD *)v72;
      *(_QWORD *)v72 = 0;
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
      AriSdk::ARI_GetPersonalizationParametersReq_SDK::~ARI_GetPersonalizationParametersReq_SDK((AriSdk::ARI_GetPersonalizationParametersReq_SDK *)v74);
      AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK((AriSdk::ARI_CsiSecGetRandomNumReq_SDK *)__p);
      security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)v79);
      do
        v29 = __ldaxr(p_shared_owners);
      while (__stlxr(v29 - 1, p_shared_owners));
      goto LABEL_57;
    }
    security::ARICommandDriver::ARICommandDriver();
    *(_QWORD *)v79 = *(_QWORD *)bytes;
    security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)bytes);
    if (a3)
    {
      RandomNum = security::ARICommandDriver::GetRandomNum();
      if ((RandomNum & 1) == 0
        || (ACFULogging::getLogInstance((ACFULogging *)RandomNum),
            RandomNum = ACFULogging::handleMessage(),
            v13 = *(unsigned int **)(*(_QWORD *)v78 + 64),
            v14 = v13[8],
            (v14 - 1) >= 0x20))
      {
LABEL_72:
        ACFULogging::getLogInstance((ACFULogging *)RandomNum);
        ACFULogging::handleMessage();
        v24 = 3000;
        goto LABEL_13;
      }
      memcpy(__dst, v13, v14);
      v15 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)__dst, 32);
      v6[3].__shared_owners_ = (uint64_t)v15;
      LOBYTE(v6[3].__shared_weak_owners_) = v15 != 0;
    }
    RandomNum = security::ARICommandDriver::GetPersonalizationParams();
    if ((RandomNum & 1) != 0)
    {
      if (**(_DWORD **)(*(_QWORD *)v73 + 104) >= 2u || **(unsigned __int8 **)(*(_QWORD *)v73 + 120) >= 2u)
      {
        ACFULogging::getLogInstance((ACFULogging *)RandomNum);
        ACFULogging::handleMessage();
        v24 = 3011;
      }
      else
      {
        *(_WORD *)bytes = **(unsigned __int8 **)(*(_QWORD *)v73 + 64);
        v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 2);
        v6[2].__vftable = (std::__shared_weak_count_vtbl *)v17;
        LOBYTE(v6[2].__shared_owners_) = v17 != 0;
        v18 = CFDataCreate(v16, *(const UInt8 **)(*(_QWORD *)v73 + 72), 2);
        v6[1].__shared_owners_ = (uint64_t)v18;
        LOBYTE(v6[1].__shared_weak_owners_) = v18 != 0;
        *(_QWORD *)bytes = **(unsigned int **)(*(_QWORD *)v73 + 80) | ((unint64_t)**(unsigned int **)(*(_QWORD *)v73 + 88) << 32);
        v19 = CFDataCreate(v16, bytes, 8);
        v6[2].__shared_weak_owners_ = (uint64_t)v19;
        LOBYTE(v6[3].__vftable) = v19 != 0;
        v20 = CFDataCreate(v16, *(const UInt8 **)(*(_QWORD *)v73 + 96), 1);
        v6[6].__shared_weak_owners_ = (uint64_t)v20;
        LOBYTE(v6[7].__vftable) = v20 != 0;
        bytes[0] = **(_DWORD **)(*(_QWORD *)v73 + 104);
        v21 = CFDataCreate(v16, bytes, 1);
        v6[4].__shared_weak_owners_ = (uint64_t)v21;
        LOBYTE(v6[5].__vftable) = v21 != 0;
        v22 = CFDataCreate(v16, *(const UInt8 **)(*(_QWORD *)v73 + 112), 1);
        v6[5].__shared_owners_ = (uint64_t)v22;
        LOBYTE(v6[5].__shared_weak_owners_) = v22 != 0;
        v23 = CFDataCreate(v16, *(const UInt8 **)(*(_QWORD *)v73 + 120), 1);
        v6[6].__vftable = (std::__shared_weak_count_vtbl *)v23;
        LOBYTE(v6[6].__shared_owners_) = v23 != 0;
        ACFULogging::getLogInstance(v23);
        ACFULogging::handleMessage();
        ACFUCommon::PersonalizeParams::logParameters((ACFUCommon::PersonalizeParams *)&v6[1]);
        v24 = 0;
      }
      goto LABEL_13;
    }
    goto LABEL_72;
  }
  v81 = 0u;
  *(_OWORD *)__p = 0u;
  v78[0] = 32;
  __dst[0] = 57005;
  v73[0] = 8;
  *(_QWORD *)v79 = 0xDEADBEEFDEADBEEFLL;
  v72[0] = 8;
  v70 = 4;
  *(_DWORD *)bytes = 0;
  v68 = 4;
  *(_DWORD *)v69 = 0;
  *(_WORD *)v67 = -8531;
  v66 = -34;
  v65 = -34;
  v64 = -34;
  v63 = -34;
  v62 = -34;
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  v6 = (std::__shared_weak_count *)operator new(0xE8uLL);
  v6->__shared_owners_ = 0;
  v31 = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85F28;
  v32 = operator new(0x40uLL);
  v74[1] = (IOACIPCClass *)(v32 + 4);
  *(_QWORD *)&v75 = v32 + 4;
  *v32 = xmmword_24CE85C58;
  v32[1] = *(_OWORD *)&off_24CE85C68;
  v32[2] = xmmword_24CE85C78;
  v32[3] = *(_OWORD *)off_24CE85C88;
  v74[0] = (IOACIPCClass *)v32;
  MEMORY[0x212BF91E8](&v6[1], v74);
  if (v74[0])
  {
    v74[1] = v74[0];
    operator delete(v74[0]);
  }
  v74[0] = 0;
  v33 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v33 = off_24CE85CC8;
  *((_QWORD *)v33 + 1) = 0;
  *((_QWORD *)v33 + 2) = 0;
  *((_QWORD *)v33 + 3) = 0;
  v34 = BasebandUpdaterTransport::IOACIPCHelper::init(v33, "rom");
  if ((v34 & 1) == 0)
  {
    v60 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v33 + 8))(v33);
    ACFULogging::getLogInstance(v60);
    v61 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v61);
    ACFULogging::handleMessage();
    v33 = 0;
    v56 = 3019;
    goto LABEL_47;
  }
  v74[0] = *((IOACIPCClass **)v33 + 1);
  if (!v74[0])
  {
    ACFULogging::getLogInstance((ACFULogging *)v34);
    ACFULogging::handleMessage();
    v56 = 3000;
    goto LABEL_47;
  }
  v35 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a3)
  {
    BootNonce = (ACFULogging *)ACFUACIPCTransport::generateBootNonce(this, v74);
    if ((_DWORD)BootNonce)
    {
      ACFULogging::getLogInstance(BootNonce);
      ACFULogging::handleMessage();
      v56 = 3008;
      goto LABEL_47;
    }
    Register = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v74, 5, (unsigned __int8 *)__p, v78);
    if ((_DWORD)Register)
    {
      ACFULogging::getLogInstance(Register);
      ACFULogging::handleMessage();
      v56 = 3017;
      goto LABEL_47;
    }
    ACFULogging::getLogInstance(Register);
    v38 = (ACFULogging *)ACFULogging::handleMessage();
    if (v78[0] - 33 <= 0xFFFFFFDF)
    {
      ACFULogging::getLogInstance(v38);
      ACFULogging::handleMessage();
      v56 = 3018;
      goto LABEL_47;
    }
    v39 = *v35;
    v40 = CFDataCreate(*v35, (const UInt8 *)__p, 32);
    v6[3].__shared_owners_ = (uint64_t)v40;
    LOBYTE(v6[3].__shared_weak_owners_) = v40 != 0;
    v41 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v74, 13, (unsigned __int8 *)__dst, v73);
    if ((_DWORD)v41)
    {
      ACFULogging::getLogInstance(v41);
      ACFULogging::handleMessage();
      v56 = 3007;
      goto LABEL_47;
    }
    ACFULogging::getLogInstance(v41);
    v42 = (ACFULogging *)ACFULogging::handleMessage();
    if (v73[0] - 9 <= 0xFFFFFFF7)
    {
      ACFULogging::getLogInstance(v42);
      ACFULogging::handleMessage();
      v56 = 3009;
      goto LABEL_47;
    }
    v43 = CFDataCreate(v39, (const UInt8 *)__dst, 8);
    v6[4].__vftable = (std::__shared_weak_count_vtbl *)v43;
    LOBYTE(v6[4].__shared_owners_) = v43 != 0;
  }
  v44 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v74, 3, v79, v72);
  if ((_DWORD)v44 || *(_QWORD *)v79 == 0xDEADBEEFDEADBEEFLL)
  {
    ACFULogging::getLogInstance(v44);
LABEL_67:
    ACFULogging::handleMessage();
    v56 = 3025;
    goto LABEL_47;
  }
  v45 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v74, 2, bytes, &v70);
  if ((_DWORD)v45)
  {
    ACFULogging::getLogInstance(v45);
    goto LABEL_67;
  }
  v66 = bytes[0];
  if (bytes[0] == 222 || (*(_WORD *)v67 = *(_WORD *)&bytes[2], *(unsigned __int16 *)&bytes[2] == 57005))
  {
    ACFULogging::getLogInstance(v45);
LABEL_71:
    ACFULogging::handleMessage();
    v56 = 3011;
    goto LABEL_47;
  }
  v46 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, v74, 1, v69, &v68);
  if ((_DWORD)v46)
  {
    ACFULogging::getLogInstance(v46);
    goto LABEL_71;
  }
  v63 = (*(_DWORD *)v69 >> 7) & 3;
  v65 = (*(_WORD *)v69 & 0x200) != 0;
  v64 = (*(_WORD *)v69 & 0x400) != 0;
  v62 = (*(_WORD *)v69 & 0x800) != 0;
  v47 = *v35;
  v48 = CFDataCreate(*v35, v79, 8);
  v6[2].__shared_weak_owners_ = (uint64_t)v48;
  LOBYTE(v6[3].__vftable) = v48 != 0;
  v49 = CFDataCreate(v47, &v66, 1);
  v6[2].__vftable = (std::__shared_weak_count_vtbl *)v49;
  LOBYTE(v6[2].__shared_owners_) = v49 != 0;
  v50 = CFDataCreate(v47, v67, 2);
  v6[1].__shared_owners_ = (uint64_t)v50;
  LOBYTE(v6[1].__shared_weak_owners_) = v50 != 0;
  v51 = CFDataCreate(v47, &v65, 1);
  v6[4].__shared_weak_owners_ = (uint64_t)v51;
  LOBYTE(v6[5].__vftable) = v51 != 0;
  v52 = CFDataCreate(v47, &v64, 1);
  v6[5].__shared_owners_ = (uint64_t)v52;
  LOBYTE(v6[5].__shared_weak_owners_) = v52 != 0;
  v53 = CFDataCreate(v47, &v63, 1);
  v6[6].__shared_weak_owners_ = (uint64_t)v53;
  LOBYTE(v6[7].__vftable) = v53 != 0;
  v54 = CFDataCreate(v47, &v62, 1);
  v6[6].__vftable = (std::__shared_weak_count_vtbl *)v54;
  LOBYTE(v6[6].__shared_owners_) = v54 != 0;
  v55 = (ACFULogging *)ACFUCommon::PersonalizeParams::logParameters((ACFUCommon::PersonalizeParams *)&v6[1]);
  ACFULogging::getLogInstance(v55);
  ACFULogging::handleMessage();
  v56 = 0;
  do
LABEL_47:
    v57 = __ldxr(v31);
  while (__stxr(v57 + 1, v31));
  *(_QWORD *)a4 = v6 + 1;
  *(_QWORD *)(a4 + 8) = v6;
  do
    v58 = __ldxr(v31);
  while (__stxr(v58 + 1, v31));
  *(_DWORD *)(a4 + 16) = v56;
  do
    v59 = __ldaxr(v31);
  while (__stlxr(v59 - 1, v31));
  if (!v59)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v33)
    (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v33 + 8))(v33);
  do
    v29 = __ldaxr(v31);
  while (__stlxr(v29 - 1, v31));
LABEL_57:
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_212B3EE78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,void *a29)
{
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v32;

  do
    v32 = __ldaxr(v30);
  while (__stlxr(v32 - 1, v30));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BasebandUpdaterTransport::pushFirmware(uint64_t a1, uint64_t a2)
{
  ACFULogging *v3;
  BasebandUpdaterTransport::IOACIPCHelper *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  ACFULogging *ImageOnBTIStage;
  int v10;
  unint64_t *v11;
  unint64_t v12;
  ACFULogging *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  ACFULogging *v17;
  int v18;
  unint64_t *v19;
  unint64_t v20;
  ACFULogging *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  ACFULogging *v30;
  ACFULogging *v31;
  std::__shared_weak_count *v32;
  std::__shared_weak_count *v33;
  std::__shared_weak_count *v34;

  v3 = (ACFULogging *)TelephonyBasebandSetBasebandState();
  ACFULogging::getLogInstance(v3);
  ACFULogging::handleMessage();
  v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v4 = off_24CE85CC8;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  v5 = BasebandUpdaterTransport::IOACIPCHelper::init(v4, "rom");
  if ((v5 & 1) == 0)
    goto LABEL_43;
  if (!*((_QWORD *)v4 + 1))
    goto LABEL_44;
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  v34 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ImageOnBTIStage = (ACFULogging *)ACFUACIPCTransport::loadImageOnBTIStage();
  v10 = (int)ImageOnBTIStage;
  if (v34)
  {
    v11 = (unint64_t *)&v34->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (v10)
  {
    ACFULogging::getLogInstance(ImageOnBTIStage);
    ACFULogging::handleMessage();
    v28 = 3026;
LABEL_46:
    (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v4 + 8))(v4);
    goto LABEL_36;
  }
  ACFULogging::getLogInstance(ImageOnBTIStage);
  ACFULogging::handleMessage();
  v13 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v4 + 8))(v4);
  ACFULogging::getLogInstance(v13);
  ACFULogging::handleMessage();
  v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v4 = off_24CE85CC8;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  if ((BasebandUpdaterTransport::IOACIPCHelper::init(v4, "iboot") & 1) == 0)
    goto LABEL_43;
  v5 = validateBootStage(4);
  if ((v5 & 1) == 0 || !*((_QWORD *)v4 + 1))
    goto LABEL_44;
  v14 = *(std::__shared_weak_count **)(a2 + 8);
  v33 = v14;
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
  v18 = (int)v17;
  if (v33)
  {
    v19 = (unint64_t *)&v33->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  if (v18)
    goto LABEL_45;
  ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage();
  v21 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v4 + 8))(v4);
  ACFULogging::getLogInstance(v21);
  ACFULogging::handleMessage();
  v4 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v4 = off_24CE85CC8;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  v5 = BasebandUpdaterTransport::IOACIPCHelper::init(v4, "cps");
  if ((v5 & 1) == 0)
  {
LABEL_43:
    v30 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v4 + 8))(v4);
    ACFULogging::getLogInstance(v30);
    v31 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v31);
    ACFULogging::handleMessage();
    v28 = 3019;
    goto LABEL_36;
  }
  if (!*((_QWORD *)v4 + 1))
  {
LABEL_44:
    ACFULogging::getLogInstance((ACFULogging *)v5);
    ACFULogging::handleMessage();
    v28 = 3000;
    goto LABEL_46;
  }
  v22 = *(std::__shared_weak_count **)(a2 + 8);
  v32 = v22;
  if (v22)
  {
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v17 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
  v25 = (int)v17;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  if (v25)
  {
LABEL_45:
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    v28 = 3027;
    goto LABEL_46;
  }
  ACFULogging::getLogInstance(v17);
  ACFULogging::handleMessage();
  (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v4 + 8))(v4);
  v28 = 0;
LABEL_36:
  TelephonyBasebandSetBasebandState();
  return v28;
}

void sub_212B3F5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t exception_objecta)
{
  uint64_t v17;

  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)&exception_objecta);
  (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

void sub_212B3F5FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke(ACFULogging *a1)
{
  BasebandUpdaterTransport *v1;

  v1 = (BasebandUpdaterTransport *)*((_QWORD *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t BasebandUpdaterTransport::warmResetForce(BasebandUpdaterTransport *this)
{
  uint64_t result;
  FILE **v3;
  char v4;
  int i;

  result = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(result + 8) == 3 || *((_BYTE *)this + 186))
    goto LABEL_3;
  if (*((_BYTE *)this + 185))
  {
    v3 = (FILE **)MEMORY[0x24BDAC8E8];
    do
    {
      printf("        %s - %c/%c?: ", "force warm reset", 121, 110);
      fflush(*v3);
      result = getchar();
      v4 = result;
      for (i = result; result != 10; result = getchar())
        ;
      if (i == 110)
        goto LABEL_3;
    }
    while (v4 != 121);
  }
  result = TelephonyBasebandForceResetModem();
  if ((result & 1) == 0)
  {
LABEL_3:
    ACFULogging::getLogInstance((ACFULogging *)result);
    return ACFULogging::handleMessage();
  }
  return result;
}

uint64_t validateBootStage(int a1)
{
  const __CFDictionary *v2;
  ACFULogging *MatchingService;
  io_object_t v4;
  ACFULogging *CFProperty;
  const __CFNumber *v6;
  uint64_t (*v7)(uint64_t);
  CFTypeID v8;
  ACFULogging *Value;
  uint64_t v10;
  int valuePtr;
  ACFULogging *v13;

  v13 = 0;
  valuePtr = 0;
  v2 = IOServiceMatching("AppleConvergedIPCLedaBBControl");
  if (!v2)
  {
    ACFULogging::getLogInstance(0);
LABEL_16:
    ACFULogging::handleMessage();
    return 0;
  }
  MatchingService = (ACFULogging *)IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
  v4 = MatchingService;
  if (!(_DWORD)MatchingService)
  {
    ACFULogging::getLogInstance(MatchingService);
    goto LABEL_16;
  }
  CFProperty = (ACFULogging *)IORegistryEntryCreateCFProperty((io_registry_entry_t)MatchingService, CFSTR("bootstage"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v6 = CFProperty;
  v13 = CFProperty;
  v7 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  if (!CFProperty)
    v7 = 0;
  if (!v7
    || (v8 = CFGetTypeID(CFProperty), CFProperty = (ACFULogging *)CFNumberGetTypeID(), (ACFULogging *)v8 != CFProperty))
  {
    ACFULogging::getLogInstance(CFProperty);
LABEL_18:
    ACFULogging::handleMessage();
LABEL_20:
    v10 = 0;
    goto LABEL_10;
  }
  Value = (ACFULogging *)CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
  if (!(_DWORD)Value)
  {
    ACFULogging::getLogInstance(Value);
    goto LABEL_18;
  }
  if (valuePtr != a1)
  {
    ACFULogging::getLogInstance(Value);
    ACFULogging::handleMessage();
    goto LABEL_20;
  }
  v10 = 1;
LABEL_10:
  IOObjectRelease(v4);
  if (v6)
    CFRelease(v6);
  return v10;
}

void sub_212B3F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_212B3F984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  ctu::cf::CFSharedRef<void const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2(ACFULogging *a1)
{
  BasebandUpdaterTransport *v1;

  v1 = (BasebandUpdaterTransport *)*((_QWORD *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport12pushFirmwareENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_3(ACFULogging *a1)
{
  BasebandUpdaterTransport *v1;

  v1 = (BasebandUpdaterTransport *)*((_QWORD *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke(ACFULogging *a1)
{
  BasebandUpdaterTransport *v1;

  v1 = (BasebandUpdaterTransport *)*((_QWORD *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2(ACFULogging *a1)
{
  BasebandUpdaterTransport *v1;

  v1 = (BasebandUpdaterTransport *)*((_QWORD *)a1 + 4);
  ACFULogging::getLogInstance(a1);
  ACFULogging::handleMessage();
  return BasebandUpdaterTransport::warmResetForce(v1);
}

uint64_t std::unordered_map<std::string,std::string>::~unordered_map[abi:ne180100](uint64_t a1)
{
  void **v2;
  void *v3;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v5 = (void **)*v2;
      if (*((char *)v2 + 63) < 0)
      {
        operator delete(v2[5]);
        if (*((char *)v2 + 39) < 0)
LABEL_10:
          operator delete(v2[2]);
      }
      else if (*((char *)v2 + 39) < 0)
      {
        goto LABEL_10;
      }
      operator delete(v2);
      v2 = v5;
    }
    while (v5);
  }
  v3 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v3)
    operator delete(v3);
  return a1;
}

uint64_t BasebandUpdaterTransport::setNonce(BasebandUpdaterTransport *this, void *a2)
{
  ACFULogging::getLogInstance(this);
  ACFULogging::handleMessage();
  return 0;
}

uint64_t BasebandUpdaterTransport::reset(BasebandUpdaterTransport *this)
{
  uint64_t HardwareModel;
  uint64_t result;
  FILE **v4;
  char v5;
  int i;
  char v7;

  HardwareModel = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(HardwareModel + 8) == 3 || *((_BYTE *)this + 186))
  {
LABEL_3:
    ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
    ACFULogging::handleMessage();
    return 0;
  }
  if (*((_BYTE *)this + 185))
  {
    v4 = (FILE **)MEMORY[0x24BDAC8E8];
    do
    {
      printf("        %s - %c/%c?: ", "Cold reset", 121, 110);
      fflush(*v4);
      HardwareModel = getchar();
      v5 = HardwareModel;
      for (i = HardwareModel; HardwareModel != 10; HardwareModel = getchar())
        ;
      if (i == 110)
        goto LABEL_3;
    }
    while (v5 != 121);
  }
  ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
  ACFULogging::handleMessage();
  v7 = TelephonyBasebandPowercycleModem();
  result = 0;
  if ((v7 & 1) == 0)
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
    return 1;
  }
  return result;
}

ACFULogging *BasebandUpdaterTransport::pingCheck(BasebandUpdaterTransport *this)
{
  capabilities::updater *v2;
  unint64_t v3;
  CFTypeID ValueIfPresent;
  std::__shared_weak_count *v5;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6;
  unsigned int *v7;
  CFTypeID v8;
  const __CFNumber *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  ACFULogging *FWVersion;
  ACFULogging *v15;
  void *value;
  std::chrono::nanoseconds __ns;
  CFTypeID v19;
  unsigned int v20;

  v2 = (capabilities::updater *)capabilities::updater::pingDelay(this);
  v20 = v2;
  v3 = capabilities::updater::pingAttemptCount(v2);
  ValueIfPresent = *((_QWORD *)this + 22);
  if (!ValueIfPresent)
    goto LABEL_14;
  ValueIfPresent = (CFTypeID)std::__shared_weak_count::lock((std::__shared_weak_count *)ValueIfPresent);
  v19 = ValueIfPresent;
  if (!ValueIfPresent)
    goto LABEL_14;
  v5 = (std::__shared_weak_count *)ValueIfPresent;
  v6 = *((_QWORD *)this + 21);
  __ns.__rep_ = v6;
  if (v6)
  {
    ValueIfPresent = *(_QWORD *)(v6 + 120);
    if (ValueIfPresent)
    {
      value = 0;
      ValueIfPresent = CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueIfPresent, CFSTR("waitForReadyDelayMilliseconds"), (const void **)&value);
      if ((_DWORD)ValueIfPresent)
      {
        v7 = (unsigned int *)value;
        if (value)
        {
          v8 = CFGetTypeID(value);
          ValueIfPresent = CFNumberGetTypeID();
          if (v8 == ValueIfPresent)
            ValueIfPresent = ctu::cf::assign((ctu::cf *)&v20, v7, v9);
        }
      }
    }
    if (*(_BYTE *)(v6 + 392))
      v3 = *(_QWORD *)(v6 + 384);
  }
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (v11)
  {
LABEL_14:
    ACFULogging::getLogInstance((ACFULogging *)ValueIfPresent);
    if (v3)
      goto LABEL_15;
LABEL_23:
    ACFULogging::handleMessage();
    return 0;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  ACFULogging::getLogInstance(v15);
  if (!v3)
    goto LABEL_23;
LABEL_15:
  ACFULogging::handleMessage();
  if (v20)
  {
    __ns.__rep_ = 1000000 * v20;
    std::this_thread::sleep_for (&__ns);
  }
  v12 = v3 - 1;
  v13 = 1;
  while (1)
  {
    FWVersion = (ACFULogging *)BasebandUpdaterTransport::pingAndGetFWVersion((std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)this, 0);
    ACFULogging::getLogInstance(FWVersion);
    if (!(_DWORD)FWVersion)
      break;
    ACFULogging::handleMessage();
    ++v13;
    --v12;
    if (v13 > v3)
      return FWVersion;
  }
  ACFULogging::handleMessage();
  return FWVersion;
}

void sub_212B3FF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::pingAndGetFWVersion(std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *this, const __CFDictionary **a2)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep ValueIfPresent;
  std::__shared_weak_count *v4;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v5;
  unsigned int *v6;
  CFTypeID v7;
  const __CFNumber *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::chrono::system_clock::time_point v11;
  BOOL v12;
  __int128 v13;
  uint64_t v14;
  uint64_t CurrentBootState;
  int v16;
  ACFULogging *v17;
  void *v18;
  int v19;
  BOOL v20;
  BOOL v21;
  ACFULogging *v22;
  std::chrono::system_clock::time_point v23;
  BOOL v24;
  __int128 v25;
  uint64_t InfoV2;
  _DWORD *v27;
  void *v28;
  int v29;
  ACFULogging *v30;
  unsigned int *v31;
  uint64_t v32;
  ACFULogging *v33;
  uint64_t v34;
  __CFDictionary *Mutable;
  const __CFAllocator *v36;
  void *v37;
  ACFULogging *v38;
  uint64_t v39;
  std::chrono::system_clock::time_point v40;
  unsigned int v41;
  ACFULogging *v42;
  unsigned int v45;
  uint64_t v46;
  void *value[2];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *__p;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  std::chrono::nanoseconds __ns[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v45 = capabilities::updater::pingTimeout((capabilities::updater *)this);
  ValueIfPresent = this[22];
  if (ValueIfPresent)
  {
    ValueIfPresent = (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep)std::__shared_weak_count::lock((std::__shared_weak_count *)ValueIfPresent);
    __ns[1].__rep_ = ValueIfPresent;
    if (ValueIfPresent)
    {
      v4 = (std::__shared_weak_count *)ValueIfPresent;
      v5 = this[21];
      __ns[0].__rep_ = v5;
      if (v5)
      {
        ValueIfPresent = *(_QWORD *)(v5 + 120);
        if (ValueIfPresent)
        {
          value[0] = 0;
          ValueIfPresent = CFDictionaryGetValueIfPresent((CFDictionaryRef)ValueIfPresent, CFSTR("pingTimeoutMilliseconds"), (const void **)value);
          if ((_DWORD)ValueIfPresent)
          {
            v6 = (unsigned int *)value[0];
            if (value[0])
            {
              v7 = CFGetTypeID(value[0]);
              ValueIfPresent = CFNumberGetTypeID();
              if (v7 == ValueIfPresent)
                ValueIfPresent = ctu::cf::assign((ctu::cf *)&v45, v6, v8);
            }
          }
        }
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  ACFULogging::getLogInstance((ACFULogging *)ValueIfPresent);
  ACFULogging::handleMessage();
  v11.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  v12 = 0;
  while (1)
  {
    value[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    Bsp::ARICommandDriver::ARICommandDriver();
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v58 = v13;
    v59 = v13;
    v57 = v13;
    *(_OWORD *)&__ns[0].__rep_ = v13;
    AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)__ns);
    v54 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
    v55 = 0;
    if (*((_BYTE *)this + 187))
      v14 = 10000;
    else
      v14 = 0xFFFFFFFFLL;
    support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)v14, 1, 0, (char **)&v54);
    if (v54)
    {
      Bsp::ARICommandDriver::ARICommandDriver();
      value[0] = v53;
      Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v53);
      CurrentBootState = Bsp::ARICommandDriver::GetCurrentBootState();
      if ((CurrentBootState & 1) != 0)
      {
        v16 = 1;
        v17 = (ACFULogging *)v54;
        v54 = 0;
        if (!v17)
          goto LABEL_21;
LABEL_20:
        v17 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v17 + 8))(v17);
        goto LABEL_21;
      }
    }
    ACFULogging::getLogInstance((ACFULogging *)CurrentBootState);
    ACFULogging::handleMessage();
    v16 = 0;
    v17 = (ACFULogging *)v54;
    v54 = 0;
    if (v17)
      goto LABEL_20;
LABEL_21:
    if (!v16)
    {
      v18 = v55;
      if (!v55)
        goto LABEL_29;
      goto LABEL_28;
    }
    ACFULogging::getLogInstance(v17);
    ACFULogging::handleMessage();
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_24;
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_24;
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_24:
    v18 = v55;
    v19 = **((_DWORD **)v55 + 8);
    v20 = v19 == 4;
    v21 = (v19 - 3) < 2;
    v12 = BBUpdaterCommon::inRestoreOS(void)::restoreOS | BBUpdaterCommon::inRestoreOS(void)::recoveryOS
        ? v21
        : v20;
LABEL_28:
    (*(void (**)(void *))(*(_QWORD *)v18 + 16))(v18);
LABEL_29:
    AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK((AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *)__ns);
    Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)value);
    if ((v16 & 1) != 0)
      break;
    v23.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    v24 = (v23.__d_.__rep_ - v11.__d_.__rep_) / 1000 < v45;
    ACFULogging::getLogInstance((ACFULogging *)v23.__d_.__rep_);
    if (!v24)
    {
      ACFULogging::handleMessage();
      return 3003;
    }
    ACFULogging::handleMessage();
    __ns[0].__rep_ = 500000000;
    std::this_thread::sleep_for (__ns);
  }
  ACFULogging::getLogInstance(v22);
  if (!v12)
  {
    ACFULogging::handleMessage();
    v40.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    v41 = (LODWORD(v40.__d_.__rep_) - LODWORD(v11.__d_.__rep_)) / 1000;
    if (v45 > v41)
    {
      ACFULogging::getLogInstance((ACFULogging *)v40.__d_.__rep_);
      ACFULogging::handleMessage();
      if (v45 != v41)
      {
        __ns[0].__rep_ = 1000000 * (v45 - v41);
        std::this_thread::sleep_for (__ns);
      }
    }
    return 3003;
  }
  ACFULogging::handleMessage();
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  *(_OWORD *)&__ns[0].__rep_ = 0u;
  v52 = (const __CFString *)0xAAAAAAAAAAAAAAAALL;
  Bsp::ARICommandDriver::ARICommandDriver();
  __p = (void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49 = v25;
  v50 = v25;
  *(_OWORD *)value = v25;
  v48 = v25;
  AriSdk::ARI_CsiSysGetInfoReqV2_SDK::ARI_CsiSysGetInfoReqV2_SDK((AriSdk::ARI_CsiSysGetInfoReqV2_SDK *)value);
  v46 = 0;
  v55 = (void *)0xAAAAAAAAAAAAAAAALL;
  support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 1, 0, (char **)&v55);
  if (!v55)
    goto LABEL_66;
  Bsp::ARICommandDriver::ARICommandDriver();
  v52 = v54;
  Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v54);
  v27 = operator new(4uLL);
  *v27 = 4;
  v28 = __p;
  __p = v27;
  if (v28)
    operator delete(v28);
  InfoV2 = Bsp::ARICommandDriver::SysGetInfoV2();
  if ((InfoV2 & 1) != 0)
  {
    v29 = 1;
    v30 = (ACFULogging *)v55;
    v55 = 0;
    if (v30)
      goto LABEL_42;
  }
  else
  {
LABEL_66:
    ACFULogging::getLogInstance((ACFULogging *)InfoV2);
    ACFULogging::handleMessage();
    v29 = 0;
    v30 = (ACFULogging *)v55;
    v55 = 0;
    if (v30)
LABEL_42:
      v30 = (ACFULogging *)(*(uint64_t (**)(ACFULogging *))(*(_QWORD *)v30 + 8))(v30);
  }
  if (!v29)
    goto LABEL_60;
  v31 = *(unsigned int **)(v46 + 64);
  if (v31[129] || (v32 = v31[128], v32 >= 0x100))
  {
    ACFULogging::getLogInstance(v30);
    ACFULogging::handleMessage();
    LOBYTE(v29) = 0;
    v39 = v46;
    if (!v46)
      goto LABEL_62;
LABEL_61:
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 16))(v39);
    goto LABEL_62;
  }
  v33 = (ACFULogging *)memcpy(__ns, v31, v31[128]);
  *((_BYTE *)&__ns[0].__rep_ + v32) = 0;
  ACFULogging::getLogInstance(v33);
  ACFULogging::handleMessage();
  if (!a2)
    goto LABEL_52;
  v34 = *MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
LABEL_59:
    ACFULogging::handleMessage();
    LOBYTE(v29) = 0;
LABEL_60:
    v39 = v46;
    if (!v46)
      goto LABEL_62;
    goto LABEL_61;
  }
  v54 = CFSTR("FirmwareVersion");
  CFRetain(CFSTR("FirmwareVersion"));
  v55 = 0;
  ctu::cf::convert_copy((ctu::cf *)&v55, (const __CFString **)__ns, (const char *)0x8000100, v34, v36);
  v37 = v55;
  v53 = v55;
  if (v55)
  {
    CFDictionaryAddValue(Mutable, CFSTR("FirmwareVersion"), v55);
    CFRelease(v37);
  }
  CFRelease(CFSTR("FirmwareVersion"));
  if (!v37)
  {
    ACFULogging::getLogInstance(v38);
    goto LABEL_59;
  }
  *a2 = Mutable;
LABEL_52:
  LOBYTE(v29) = 1;
  v39 = v46;
  if (v46)
    goto LABEL_61;
LABEL_62:
  MEMORY[0x212BF9D94](value);
  Bsp::ARICommandDriver::~ARICommandDriver((Bsp::ARICommandDriver *)&v52);
  if ((v29 & 1) != 0)
    return 0;
  ACFULogging::getLogInstance(v42);
  ACFULogging::handleMessage();
  return 3003;
}

void sub_212B40714(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,char a32)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x212BFA184](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](a1 + 52);
  return a1;
}

uint64_t BasebandUpdaterTransport::getDebugInfo(uint64_t a1, uint64_t a2)
{
  uint64_t Reset;
  uint64_t v4;
  ACFULogging *v5;
  int v6;
  __int128 v7;
  ACFULogging *v8;
  uint64_t v9;
  ACFULogging *v10;
  char v11;
  int v12;
  void *v13;
  __int128 v14;
  uint64_t PMUTrace;
  _QWORD *v16;
  const char *v17;
  size_t v18;
  _QWORD *v19;
  const std::locale::facet *v20;
  __CFString *v21;
  const __CFString *v22;
  uint64_t (*v23)(uint64_t);
  size_t v24;
  size_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  size_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  std::string *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  std::ios_base *v43;
  ACFULogging *v44;
  int v45;
  uint64_t v46;
  const void *v47;
  std::string::size_type v48;
  std::string *v49;
  std::string::size_type v50;
  std::string *v51;
  uint64_t v52;
  uint64_t v53;
  std::string::size_type size;
  _QWORD *v55;
  const std::locale::facet *v56;
  uint64_t v57;
  const void *v58;
  uint64_t v59;
  uint64_t v60;
  std::string *v61;
  std::string::size_type v62;
  uint64_t v63;
  uint64_t HardwareModel;
  std::__shared_weak_count *v65;
  const void *v66;
  unint64_t *p_shared_owners;
  unint64_t v68;
  BasebandUpdaterTransport::IOACIPCHelper *v69;
  uint64_t v70;
  unint64_t *v71;
  unint64_t v72;
  uint64_t v73;
  ACFULogging *ImageOnBTIStage;
  int v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  BasebandUpdaterTransport::IOACIPCHelper *v79;
  uint64_t v80;
  void *v81;
  const void *v82;
  uint64_t (*v83)(uint64_t);
  uint64_t v84;
  uint64_t (**v85)();
  ACFULogging *v86;
  _OWORD *v87;
  uint64_t v88;
  _OWORD *v89;
  FILE **v90;
  char v91;
  int i;
  uint64_t v93;
  ACFULogging *v94;
  char v95;
  ACFULogging *v96;
  int v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  std::string *v101;
  __int128 v102;
  std::string *v103;
  __int128 v104;
  ACFULogging *v105;
  int v106;
  char *v107;
  ACFULogging *v108;
  ACFULogging *v109;
  ACFULogging *v110;
  ACFULogging *v111;
  char *v112;
  void *v113;
  BOOL v114;
  ACFULogging *v115;
  unint64_t *v116;
  unint64_t v117;
  std::string v120;
  std::string v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  uint64_t v124;
  CFTypeRef v125;
  CFTypeRef cf;
  std::__shared_weak_count *v127;
  _OWORD __b[36];
  _BYTE __p[32];
  __int128 v130;
  __int128 v131;
  char v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _OWORD v141[9];
  unint64_t v142;
  _BYTE __dst[24];
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 184))
  {
    ACFULogging::getLogInstance((ACFULogging *)a1);
    ACFULogging::handleMessage();
    return 0;
  }
  __dst[0] = 0;
  Reset = TelephonyBasebandGetReset();
  if ((Reset & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)Reset);
    Reset = ACFULogging::handleMessage();
    __dst[0] = 0;
  }
  v5 = (ACFULogging *)capabilities::coredump::supportsSPMISignalling((capabilities::coredump *)Reset);
  v6 = (int)v5;
  ACFULogging::getLogInstance(v5);
  if (!v6)
  {
    ACFULogging::handleMessage();
    *(_QWORD *)&__b[0] = 0xAAAAAAAAAAAAAAAALL;
    support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)__b);
    if (!*(_QWORD *)&__b[0])
      goto LABEL_209;
    *(_QWORD *)&v133 = 0xAAAAAAAAAAAAAAAALL;
    Bsp::BspCommandDriver::BspCommandDriver();
    *(_QWORD *)__p = operator new(0x28uLL);
    *(_OWORD *)&__p[8] = xmmword_212B56690;
    strcpy(*(char **)__p, "AP triggered baseband reset over ARI");
    v10 = (ACFULogging *)Bsp::BspCommandDriver::SwTrap();
    v11 = (char)v10;
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
    if ((v11 & 1) != 0)
    {
      v12 = 0;
      v13 = *(void **)&__b[0];
      *(_QWORD *)&__b[0] = 0;
      if (!v13)
        goto LABEL_16;
    }
    else
    {
LABEL_209:
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
      v12 = 4;
      v13 = *(void **)&__b[0];
      *(_QWORD *)&__b[0] = 0;
      if (!v13)
      {
LABEL_16:
        if (!v12)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    v13 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v13 + 8))(v13);
    goto LABEL_16;
  }
  ACFULogging::handleMessage();
  *(_QWORD *)&__b[0] = 0xAAAAAAAAAAAAAA0CLL;
  *(_QWORD *)&__b[2] = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&__b[0] + 1) = operator new(0x30uLL);
  __b[1] = xmmword_212B55290;
  strcpy(*((char **)&__b[0] + 1), "BasebandUpdaterTransport::crashBaseband()");
  LOBYTE(__b[2]) = 1;
  __b[3] = 0uLL;
  *((_QWORD *)&__b[2] + 1) = 0;
  v132 = -86;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v130 = v7;
  v131 = v7;
  *(_OWORD *)__p = v7;
  *(_OWORD *)&__p[16] = v7;
  ResetReasonEncoder::encode((ResetReasonEncoder *)__b, (uint64_t)__p);
  if (v132)
  {
    v9 = TelephonyBasebandCrashModemWithSPMIWithReason();
    if ((v9 & 1) == 0)
    {
LABEL_211:
      ACFULogging::getLogInstance((ACFULogging *)v9);
      ACFULogging::handleMessage();
      v95 = 0;
      v13 = (void *)*((_QWORD *)&__b[2] + 1);
      if (!*((_QWORD *)&__b[2] + 1))
        goto LABEL_152;
      goto LABEL_151;
    }
  }
  else
  {
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    v9 = TelephonyBasebandCrashModemWithSPMI();
    if ((v9 & 1) == 0)
      goto LABEL_211;
  }
  v95 = 1;
  v13 = (void *)*((_QWORD *)&__b[2] + 1);
  if (*((_QWORD *)&__b[2] + 1))
  {
LABEL_151:
    *(_QWORD *)&__b[3] = v13;
    operator delete(v13);
  }
LABEL_152:
  if (LOBYTE(__b[2]) && SHIBYTE(__b[1]) < 0)
    operator delete(*((void **)&__b[0] + 1));
  if ((v95 & 1) == 0)
  {
LABEL_17:
    ACFULogging::getLogInstance((ACFULogging *)v13);
    ACFULogging::handleMessage();
  }
LABEL_18:
  v142 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v141[8] = v14;
  v141[7] = v14;
  v141[6] = v14;
  v141[5] = v14;
  v141[4] = v14;
  v141[3] = v14;
  v141[2] = v14;
  v141[1] = v14;
  v141[0] = v14;
  v140 = v14;
  v139 = v14;
  v138 = v14;
  v137 = v14;
  v136 = v14;
  v135 = v14;
  v134 = v14;
  v133 = v14;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v133);
  cf = 0;
  LODWORD(v122) = 0;
  PMUTrace = TelephonyBasebandGetPMUTrace();
  if ((PMUTrace & 1) != 0)
  {
    v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v134, (uint64_t)"Baseband PMU trace: ", 20);
    v17 = (const char *)TelephonyBasebandPMUTraceToString();
    v18 = strlen(v17);
    v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v17, v18);
    std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(_QWORD *)(*v19 - 24)));
    v20 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put();
    std::ostream::flush();
  }
  else
  {
    ACFULogging::getLogInstance((ACFULogging *)PMUTrace);
    ACFULogging::handleMessage();
  }
  v21 = (__CFString *)ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)(a1 + 8));
  v22 = v21;
  cf = v21;
  v23 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
  if (!v21)
    v23 = 0;
  if (!v23)
  {
    ACFULogging::getLogInstance((ACFULogging *)v21);
    ACFULogging::handleMessage();
    goto LABEL_98;
  }
  bzero(__p, 0x400uLL);
  CFStringGetCString(v22, __p, 1024, 0x8000100u);
  memset(__dst, 170, sizeof(__dst));
  v24 = strlen(__p);
  if (v24 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v25 = v24;
  if (v24 >= 0x17)
  {
    v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17)
      v27 = v24 | 7;
    v28 = v27 + 1;
    v26 = operator new(v27 + 1);
    *(_QWORD *)&__dst[8] = v25;
    *(_QWORD *)&__dst[16] = v28 | 0x8000000000000000;
    *(_QWORD *)__dst = v26;
    goto LABEL_31;
  }
  __dst[23] = v24;
  v26 = __dst;
  if (v24)
LABEL_31:
    memcpy(v26, __p, v25);
  v26[v25] = 0;
  memset(__b, 170, 0x238uLL);
  v29 = __dst[23];
  if (__dst[23] >= 0)
    v30 = __dst[23];
  else
    v30 = *(_QWORD *)&__dst[8];
  v31 = v30 + 1;
  memset(&v120, 170, sizeof(v120));
  if (v30 + 1 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v31 >= 0x17)
  {
    v33 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17)
      v33 = v31 | 7;
    v34 = v33 + 1;
    v32 = (char *)operator new(v33 + 1);
    v120.__r_.__value_.__l.__size_ = v30 + 1;
    v120.__r_.__value_.__r.__words[2] = v34 | 0x8000000000000000;
    v120.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
  }
  else
  {
    memset(&v120, 0, sizeof(v120));
    v32 = (char *)&v120;
    *((_BYTE *)&v120.__r_.__value_.__s + 23) = v30 + 1;
    if (!v30)
      goto LABEL_46;
  }
  if (v29 >= 0)
    v35 = __dst;
  else
    v35 = *(_BYTE **)__dst;
  memmove(v32, v35, v30);
LABEL_46:
  *(_WORD *)&v32[v30] = 47;
  v36 = std::string::append(&v120, "precoredump", 0xBuLL);
  v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  v121.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v121.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  v38 = MEMORY[0x24BEDB840];
  v39 = MEMORY[0x24BEDB840] + 64;
  v40 = (_QWORD *)MEMORY[0x24BEDB7E8];
  v41 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v42 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *(_QWORD *)&__b[26] = MEMORY[0x24BEDB840] + 64;
  *(_QWORD *)&__b[0] = v41;
  *(_QWORD *)((char *)__b + *(_QWORD *)(v41 - 24)) = v42;
  v43 = (std::ios_base *)((char *)__b + *(_QWORD *)(*(_QWORD *)&__b[0] - 24));
  std::ios_base::init(v43, (char *)__b + 8);
  v43[1].__vftable = 0;
  v43[1].__fmtflags_ = -1;
  *(_QWORD *)&__b[0] = v38 + 24;
  *(_QWORD *)&__b[26] = v39;
  MEMORY[0x212BFA178]((char *)__b + 8);
  v44 = (ACFULogging *)std::filebuf::open();
  if (!v44)
    std::ios_base::clear((std::ios_base *)((char *)__b + *(_QWORD *)(*(_QWORD *)&__b[0] - 24)), *(_DWORD *)((char *)&__b[2] + *(_QWORD *)(*(_QWORD *)&__b[0] - 24)) | 4);
  if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v121.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_50:
      if (*(_QWORD *)&__b[8])
        goto LABEL_51;
      goto LABEL_66;
    }
  }
  else if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_50;
  }
  operator delete(v120.__r_.__value_.__l.__data_);
  if (*(_QWORD *)&__b[8])
  {
LABEL_51:
    if ((BYTE8(v140) & 0x10) != 0)
    {
      v46 = v140;
      if ((unint64_t)v140 < *((_QWORD *)&v137 + 1))
      {
        *(_QWORD *)&v140 = *((_QWORD *)&v137 + 1);
        v46 = *((_QWORD *)&v137 + 1);
      }
      v47 = (const void *)v137;
      v48 = v46 - v137;
      if ((unint64_t)(v46 - v137) > 0x7FFFFFFFFFFFFFF7)
        goto LABEL_80;
    }
    else
    {
      if ((BYTE8(v140) & 8) == 0)
      {
        *((_BYTE *)&v121.__r_.__value_.__s + 23) = 0;
        v121.__r_.__value_.__s.__data_[0] = 0;
        v45 = 0;
        goto LABEL_60;
      }
      v47 = (const void *)*((_QWORD *)&v135 + 1);
      v48 = *((_QWORD *)&v136 + 1) - *((_QWORD *)&v135 + 1);
      if (*((_QWORD *)&v136 + 1) - *((_QWORD *)&v135 + 1) > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_80:
        std::string::__throw_length_error[abi:ne180100]();
    }
    if (v48 >= 0x17)
    {
      v52 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v48 | 7) != 0x17)
        v52 = v48 | 7;
      v53 = v52 + 1;
      v49 = (std::string *)operator new(v52 + 1);
      v121.__r_.__value_.__l.__size_ = v48;
      v121.__r_.__value_.__r.__words[2] = v53 | 0x8000000000000000;
      v121.__r_.__value_.__r.__words[0] = (std::string::size_type)v49;
    }
    else
    {
      *((_BYTE *)&v121.__r_.__value_.__s + 23) = v48;
      v49 = &v121;
      if (!v48)
      {
        v121.__r_.__value_.__s.__data_[0] = 0;
        v45 = SHIBYTE(v121.__r_.__value_.__r.__words[2]);
        if ((SHIBYTE(v121.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_60;
        goto LABEL_71;
      }
    }
    memmove(v49, v47, v48);
    v49->__r_.__value_.__s.__data_[v48] = 0;
    v45 = SHIBYTE(v121.__r_.__value_.__r.__words[2]);
    if ((SHIBYTE(v121.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_60:
      if (v45)
        goto LABEL_61;
      goto LABEL_72;
    }
LABEL_71:
    size = v121.__r_.__value_.__l.__size_;
    operator delete(v121.__r_.__value_.__l.__data_);
    if (size)
    {
LABEL_61:
      if ((BYTE8(v140) & 0x10) != 0)
      {
        v57 = v140;
        if ((unint64_t)v140 < *((_QWORD *)&v137 + 1))
        {
          *(_QWORD *)&v140 = *((_QWORD *)&v137 + 1);
          v57 = *((_QWORD *)&v137 + 1);
        }
        v58 = (const void *)v137;
        v50 = v57 - v137;
        if ((unint64_t)(v57 - v137) > 0x7FFFFFFFFFFFFFF7)
          goto LABEL_144;
      }
      else
      {
        if ((BYTE8(v140) & 8) == 0)
        {
          v50 = 0;
          *((_BYTE *)&v121.__r_.__value_.__s + 23) = 0;
          v51 = &v121;
          goto LABEL_85;
        }
        v58 = (const void *)*((_QWORD *)&v135 + 1);
        v50 = *((_QWORD *)&v136 + 1) - *((_QWORD *)&v135 + 1);
        if (*((_QWORD *)&v136 + 1) - *((_QWORD *)&v135 + 1) > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_144:
          std::string::__throw_length_error[abi:ne180100]();
      }
      if (v50 >= 0x17)
      {
        v59 = (v50 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v50 | 7) != 0x17)
          v59 = v50 | 7;
        v60 = v59 + 1;
        v51 = (std::string *)operator new(v59 + 1);
        v121.__r_.__value_.__l.__size_ = v50;
        v121.__r_.__value_.__r.__words[2] = v60 | 0x8000000000000000;
        v121.__r_.__value_.__r.__words[0] = (std::string::size_type)v51;
      }
      else
      {
        *((_BYTE *)&v121.__r_.__value_.__s + 23) = v50;
        v51 = &v121;
        if (!v50)
        {
LABEL_85:
          v51->__r_.__value_.__s.__data_[v50] = 0;
          if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v61 = &v121;
          else
            v61 = (std::string *)v121.__r_.__value_.__r.__words[0];
          if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v62 = HIBYTE(v121.__r_.__value_.__r.__words[2]);
          else
            v62 = v121.__r_.__value_.__l.__size_;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__b, (uint64_t)v61, v62);
          if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v121.__r_.__value_.__l.__data_);
          goto LABEL_93;
        }
      }
      memmove(v51, v58, v50);
      goto LABEL_85;
    }
LABEL_72:
    v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__b, (uint64_t)"empty", 5);
    std::ios_base::getloc((const std::ios_base *)((char *)v55 + *(_QWORD *)(*v55 - 24)));
    v56 = std::locale::use_facet((const std::locale *)&v121, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v56->__vftable[2].~facet_0)(v56, 10);
    std::locale::~locale((std::locale *)&v121);
    std::ostream::put();
    std::ostream::flush();
LABEL_93:
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)__b + *(_QWORD *)(*(_QWORD *)&__b[0] - 24)), *(_DWORD *)((char *)&__b[2] + *(_QWORD *)(*(_QWORD *)&__b[0] - 24)) | 4);
    goto LABEL_95;
  }
LABEL_66:
  ACFULogging::getLogInstance(v44);
  ACFULogging::handleMessage();
LABEL_95:
  *(_QWORD *)&__b[0] = *v40;
  *(_QWORD *)((char *)__b + *(_QWORD *)(*(_QWORD *)&__b[0] - 24)) = v40[3];
  MEMORY[0x212BFA184]((char *)__b + 8);
  std::ostream::~ostream();
  MEMORY[0x212BFA3D0](&__b[26]);
  if ((__dst[23] & 0x80000000) != 0)
    operator delete(*(void **)__dst);
  v22 = (const __CFString *)cf;
LABEL_98:
  if (v22)
    CFRelease(v22);
  *(_QWORD *)&v133 = *MEMORY[0x24BEDB7F0];
  v63 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v133 + *(_QWORD *)(v133 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v134 = v63;
  *((_QWORD *)&v134 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v139) < 0)
    operator delete(*((void **)&v138 + 1));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BFA3D0](v141);
  HardwareModel = TelephonyCapabilitiesGetHardwareModel();
  if (*(_DWORD *)(HardwareModel + 8) == 3 || *(_BYTE *)(a1 + 186))
  {
LABEL_104:
    ACFULogging::getLogInstance((ACFULogging *)HardwareModel);
    ACFULogging::handleMessage();
    goto LABEL_105;
  }
  if (*(_BYTE *)(a1 + 185))
  {
    v90 = (FILE **)MEMORY[0x24BDAC8E8];
    do
    {
      printf("        %s - %c/%c?: ", "safe warm reset", 121, 110);
      fflush(*v90);
      HardwareModel = getchar();
      v91 = HardwareModel;
      for (i = HardwareModel; HardwareModel != 10; HardwareModel = getchar())
        ;
      if (i == 110)
        goto LABEL_104;
    }
    while (v91 != 121);
  }
  v93 = TelephonyBasebandResetModem();
  if ((v93 & 1) == 0)
  {
    ACFULogging::getLogInstance((ACFULogging *)v93);
    v94 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v94);
    v4 = 1;
LABEL_142:
    ACFULogging::handleMessage();
    return v4;
  }
LABEL_105:
  v66 = *(const void **)a2;
  v65 = *(std::__shared_weak_count **)(a2 + 8);
  if (v65)
  {
    p_shared_owners = (unint64_t *)&v65->__shared_owners_;
    do
      v68 = __ldxr(p_shared_owners);
    while (__stxr(v68 + 1, p_shared_owners));
  }
  TelephonyBasebandSetBasebandState();
  *(_QWORD *)&__b[0] = 0;
  v69 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v69 = off_24CE85CC8;
  *((_QWORD *)v69 + 1) = 0;
  *((_QWORD *)v69 + 2) = 0;
  *((_QWORD *)v69 + 3) = 0;
  v70 = BasebandUpdaterTransport::IOACIPCHelper::init(v69, "rom");
  if ((v70 & 1) == 0)
  {
    v108 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v69 + 8))(v69);
    ACFULogging::getLogInstance(v108);
    v109 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v109);
    ACFULogging::handleMessage();
    v4 = 3019;
    goto LABEL_198;
  }
  *(_QWORD *)&__b[0] = *((_QWORD *)v69 + 1);
  if (!*(_QWORD *)&__b[0])
  {
    ACFULogging::getLogInstance((ACFULogging *)v70);
    ACFULogging::handleMessage();
    v4 = 3000;
LABEL_180:
    (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v69 + 8))(v69);
    goto LABEL_198;
  }
  ACFULogging::getLogInstance((ACFULogging *)v70);
  ACFULogging::handleMessage();
  cf = v66;
  v127 = v65;
  if (v65)
  {
    v71 = (unint64_t *)&v65->__shared_owners_;
    do
      v72 = __ldxr(v71);
    while (__stxr(v72 + 1, v71));
  }
  v73 = MEMORY[0x24BDAC760];
  *(_QWORD *)__p = MEMORY[0x24BDAC760];
  *(_QWORD *)&__p[8] = 3221225472;
  *(_QWORD *)&__p[16] = ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke;
  *(_QWORD *)&__p[24] = &__block_descriptor_40_e5_v8__0l;
  *(_QWORD *)&v130 = a1;
  ImageOnBTIStage = (ACFULogging *)ACFUACIPCTransport::loadImageOnBTIStage();
  v75 = (int)ImageOnBTIStage;
  v76 = v127;
  if (v127)
  {
    v77 = (unint64_t *)&v127->__shared_owners_;
    do
      v78 = __ldaxr(v77);
    while (__stlxr(v78 - 1, v77));
    if (!v78)
    {
      ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
      std::__shared_weak_count::__release_weak(v76);
    }
  }
  if (v75)
  {
    ACFULogging::getLogInstance(ImageOnBTIStage);
    ACFULogging::handleMessage();
    v4 = 3026;
    goto LABEL_180;
  }
  ACFULogging::getLogInstance(ImageOnBTIStage);
  ACFULogging::handleMessage();
  (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v69 + 8))(v69);
  v124 = 0;
  v125 = 0;
  memset(__b, 0, 32);
  *(_QWORD *)&__b[2] = 0xAAAAAAAA3F800000;
  v79 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v79 = off_24CE85CC8;
  *((_QWORD *)v79 + 1) = 0;
  *((_QWORD *)v79 + 2) = 0;
  *((_QWORD *)v79 + 3) = 0;
  if ((BasebandUpdaterTransport::IOACIPCHelper::init(v79, "iboot") & 1) != 0)
  {
    v80 = validateBootStage(5);
    if ((v80 & 1) == 0 || (v124 = *((_QWORD *)v79 + 1)) == 0)
    {
      ACFULogging::getLogInstance((ACFULogging *)v80);
      ACFULogging::handleMessage();
      LODWORD(v4) = 3000;
      v106 = 4;
      goto LABEL_171;
    }
    v81 = (void *)ACFUDiagnostics::copyDiagnosticsPath(*(ACFUDiagnostics **)(a1 + 8));
    v82 = v81;
    v125 = v81;
    v83 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    if (!v81)
      v83 = 0;
    if (!v83)
    {
      ACFULogging::getLogInstance((ACFULogging *)v81);
      ACFULogging::handleMessage();
      LODWORD(v4) = 1014;
      v106 = 4;
      goto LABEL_171;
    }
    if (v81)
      CFRetain(v81);
    v84 = a1 + 120;
    v85 = &off_24CE85F78;
    *(_QWORD *)&v133 = &off_24CE85F78;
    *((_QWORD *)&v133 + 1) = v82;
    v86 = (ACFULogging *)&v133;
    *(_QWORD *)&v134 = __b;
    *((_QWORD *)&v134 + 1) = &v133;
    if ((__int128 *)(a1 + 120) == &v133)
    {
      v88 = 4;
      goto LABEL_160;
    }
    if (*(_QWORD *)(a1 + 144) == v84)
    {
      *(_QWORD *)&__dst[8] = v82;
      *(_QWORD *)&__dst[16] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)__dst = &off_24CE85F78;
      if (v82)
      {
        CFRetain(v82);
        v89 = (_OWORD *)v134;
        v85 = (uint64_t (**)())**((_QWORD **)&v134 + 1);
      }
      else
      {
        v89 = __b;
      }
      *(_QWORD *)&__dst[16] = v89;
      v85[4]();
      *((_QWORD *)&v134 + 1) = 0;
      (*(void (**)(_QWORD, __int128 *))(**(_QWORD **)(a1 + 144) + 24))(*(_QWORD *)(a1 + 144), &v133);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 144) + 32))(*(_QWORD *)(a1 + 144));
      *(_QWORD *)(a1 + 144) = 0;
      *((_QWORD *)&v134 + 1) = &v133;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)__dst + 24))((uint64_t)__dst, (_QWORD *)(a1 + 120));
      (*(void (**)(uint64_t))(*(_QWORD *)__dst + 32))((uint64_t)__dst);
      *(_QWORD *)(a1 + 144) = v84;
      v86 = (ACFULogging *)*((_QWORD *)&v134 + 1);
      if (*((__int128 **)&v134 + 1) != &v133)
        goto LABEL_147;
    }
    else
    {
      *(_QWORD *)(a1 + 120) = &off_24CE85F78;
      *(_QWORD *)(a1 + 128) = v82;
      if (v82)
      {
        CFRetain(v82);
        v87 = (_OWORD *)v134;
        v85 = (uint64_t (**)())**((_QWORD **)&v134 + 1);
      }
      else
      {
        v87 = __b;
      }
      *(_QWORD *)(a1 + 136) = v87;
      v85[4]();
      *((_QWORD *)&v134 + 1) = *(_QWORD *)(a1 + 144);
      v86 = (ACFULogging *)*((_QWORD *)&v134 + 1);
      *(_QWORD *)(a1 + 144) = v84;
      if (v86 != (ACFULogging *)&v133)
      {
LABEL_147:
        if (!v86)
          goto LABEL_161;
        v88 = 5;
LABEL_160:
        v86 = (ACFULogging *)(*(uint64_t (**)(void))(*(_QWORD *)v86 + 8 * v88))();
LABEL_161:
        ACFULogging::getLogInstance(v86);
        ACFULogging::handleMessage();
        v122 = 0;
        v123 = 0;
        *(_QWORD *)&v133 = v73;
        *((_QWORD *)&v133 + 1) = 3221225472;
        *(_QWORD *)&v134 = ___ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEE_block_invoke_2;
        *((_QWORD *)&v134 + 1) = &__block_descriptor_40_e5_v8__0l;
        *(_QWORD *)&v135 = a1;
        v96 = (ACFULogging *)ACFUACIPCTransport::processRTIStage();
        v97 = (int)v96;
        v98 = v123;
        if (v123)
        {
          v99 = (unint64_t *)&v123->__shared_owners_;
          do
            v100 = __ldaxr(v99);
          while (__stlxr(v100 - 1, v99));
          if (!v100)
          {
            ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
            std::__shared_weak_count::__release_weak(v98);
          }
        }
        if (!v97)
        {
          ACFULogging::getLogInstance(v96);
          v120.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
          *(_OWORD *)&v120.__r_.__value_.__r.__words[1] = xmmword_212B55170;
          strcpy(v120.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
          v101 = std::string::append(&v120, "::", 2uLL);
          v102 = *(_OWORD *)&v101->__r_.__value_.__l.__data_;
          v121.__r_.__value_.__r.__words[2] = v101->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v121.__r_.__value_.__l.__data_ = v102;
          v101->__r_.__value_.__l.__size_ = 0;
          v101->__r_.__value_.__r.__words[2] = 0;
          v101->__r_.__value_.__r.__words[0] = 0;
          v103 = std::string::append(&v121, "collectCoredump", 0xFuLL);
          v104 = *(_OWORD *)&v103->__r_.__value_.__l.__data_;
          *(_QWORD *)&__dst[16] = *((_QWORD *)&v103->__r_.__value_.__l + 2);
          *(_OWORD *)__dst = v104;
          v103->__r_.__value_.__l.__size_ = 0;
          v103->__r_.__value_.__r.__words[2] = 0;
          v103->__r_.__value_.__r.__words[0] = 0;
          v105 = (ACFULogging *)ACFULogging::handleMessageCFType();
          if ((__dst[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)__dst);
            if ((SHIBYTE(v121.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_169:
              if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_170:
                ACFULogging::getLogInstance(v105);
                ACFULogging::handleMessage();
                v106 = 0;
                LODWORD(v4) = 0;
                goto LABEL_171;
              }
LABEL_175:
              operator delete(v120.__r_.__value_.__l.__data_);
              goto LABEL_170;
            }
          }
          else if ((SHIBYTE(v121.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_169;
          }
          operator delete(v121.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v120.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_170;
          goto LABEL_175;
        }
        ACFULogging::getLogInstance(v96);
        ACFULogging::handleMessage();
        LODWORD(v4) = 3027;
        v106 = 4;
LABEL_171:
        (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v79 + 8))(v79);
        v107 = *(char **)&__b[1];
        if (*(_QWORD *)&__b[1])
          goto LABEL_185;
        goto LABEL_188;
      }
    }
    v88 = 4;
    v86 = (ACFULogging *)&v133;
    goto LABEL_160;
  }
  v110 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v79 + 8))(v79);
  ACFULogging::getLogInstance(v110);
  v111 = (ACFULogging *)ACFULogging::handleMessage();
  ACFULogging::getLogInstance(v111);
  ACFULogging::handleMessage();
  v106 = 4;
  LODWORD(v4) = 3019;
  v107 = *(char **)&__b[1];
  if (*(_QWORD *)&__b[1])
  {
    while (1)
    {
LABEL_185:
      v112 = *(char **)v107;
      if (v107[63] < 0)
      {
        operator delete(*((void **)v107 + 5));
        if ((v107[39] & 0x80000000) == 0)
          goto LABEL_184;
LABEL_187:
        operator delete(*((void **)v107 + 2));
        operator delete(v107);
        v107 = v112;
        if (!v112)
          break;
      }
      else
      {
        if (v107[39] < 0)
          goto LABEL_187;
LABEL_184:
        operator delete(v107);
        v107 = v112;
        if (!v112)
          break;
      }
    }
  }
LABEL_188:
  v113 = *(void **)&__b[0];
  *(_QWORD *)&__b[0] = 0;
  if (v113)
    operator delete(v113);
  if (v125)
    CFRelease(v125);
  if ((_DWORD)v4)
    v114 = v106 == 0;
  else
    v114 = 1;
  if (v114)
    v4 = 0;
  else
    v4 = v4;
LABEL_198:
  v115 = (ACFULogging *)TelephonyBasebandSetBasebandState();
  if (v65)
  {
    v116 = (unint64_t *)&v65->__shared_owners_;
    do
      v117 = __ldaxr(v116);
    while (__stlxr(v117 - 1, v116));
    if (!v117)
    {
      ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
      std::__shared_weak_count::__release_weak(v65);
    }
  }
  if ((_DWORD)v4)
  {
    ACFULogging::getLogInstance(v115);
    goto LABEL_142;
  }
  return v4;
}

void sub_212B41D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, std::locale a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  if (a29)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a29 + 8))(a29);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::setPreflightMode(BasebandUpdaterTransport *this)
{
  BasebandUpdaterTransport::IOACIPCHelper *v1;
  uint64_t v2;
  uint64_t v3;
  ACFULogging *v4;
  uint64_t v5;
  ACFULogging *v7;
  ACFULogging *v8;
  int v9;

  v9 = 8;
  v1 = (BasebandUpdaterTransport::IOACIPCHelper *)operator new(0x20uLL);
  *(_QWORD *)v1 = off_24CE85CC8;
  *((_QWORD *)v1 + 1) = 0;
  *((_QWORD *)v1 + 2) = 0;
  *((_QWORD *)v1 + 3) = 0;
  v2 = BasebandUpdaterTransport::IOACIPCHelper::init(v1, "rom");
  if ((v2 & 1) != 0)
  {
    v3 = *((_QWORD *)v1 + 1);
    if (v3)
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      ACFULogging::handleMessage();
      v4 = (ACFULogging *)(*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t))(*(_QWORD *)v3 + 120))(v3, 15, &v9, 4);
      if ((_DWORD)v4)
      {
        ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage();
        v5 = 3025;
      }
      else
      {
        ACFULogging::getLogInstance(v4);
        ACFULogging::handleMessage();
        v5 = 0;
      }
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v2);
      ACFULogging::handleMessage();
      v5 = 3000;
    }
    (*(void (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v1 + 8))(v1);
  }
  else
  {
    v7 = (ACFULogging *)(*(uint64_t (**)(BasebandUpdaterTransport::IOACIPCHelper *))(*(_QWORD *)v1 + 8))(v1);
    ACFULogging::getLogInstance(v7);
    v8 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v8);
    ACFULogging::handleMessage();
    return 3019;
  }
  return v5;
}

void sub_212B421D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void BasebandUpdaterTransport::runCertification(int a1@<W1>, uint64_t a2@<X8>)
{
  __int128 v4;
  __int128 v5;
  ACFULogging *v6;
  UInt8 *v7;
  ACFULogging *v8;
  uint64_t SikPKey;
  unint64_t v10;
  ACFULogging *v11;
  const __CFData *v12;
  ACFULogging *v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  char v18;
  int v19;
  UInt8 *v20;
  unint64_t v21;
  ACFULogging *v22;
  ACFULogging *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  __int128 v27;
  std::string v28;
  std::string v29;
  void *__p[2];
  std::string::size_type v31;
  UInt8 *bytes;
  UInt8 *v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD v36[4];
  uint64_t v37;
  _OWORD v38[4];
  UInt8 *v39;

  v39 = (UInt8 *)0xAAAAAAAAAAAAAAAALL;
  security::ARICommandDriver::ARICommandDriver();
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[2] = v4;
  v38[3] = v4;
  v38[0] = v4;
  v38[1] = v4;
  AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::ARI_CsiSecCollectScrtBlobReq_SDK((AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *)v38);
  v37 = 0;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[2] = v5;
  v36[3] = v5;
  v36[1] = v5;
  v36[0] = v5;
  AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::ARI_CsiSecReadSikPKeyReq_SDK((AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *)v36);
  v35 = 0;
  support::transport::ARI::create((support::transport::ARI *)"BasebandUpdaterTransport", (dispatch_queue_s *)0x2710, 0, 0, (char **)&bytes);
  v7 = bytes;
  if (!bytes)
  {
    ACFULogging::getLogInstance(v6);
    ACFULogging::handleMessage();
    *(_QWORD *)a2 = 0;
    *(_DWORD *)(a2 + 8) = 3019;
    goto LABEL_24;
  }
  security::ARICommandDriver::ARICommandDriver();
  v39 = bytes;
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)&bytes);
  if (a1 == 1)
  {
    bytes = 0;
    v33 = 0;
    v34 = 0;
    SikPKey = security::ARICommandDriver::CsiSecReadSikPKey();
    if ((SikPKey & 1) != 0)
    {
      v21 = **(unsigned __int16 **)(v35 + 88);
      ACFULogging::getLogInstance((ACFULogging *)SikPKey);
      SikPKey = ACFULogging::handleMessage();
      if ((v21 - 133) > 0xFFFFFF7B)
      {
        std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&bytes, *(char **)(v35 + 64), (char *)(*(_QWORD *)(v35 + 64) + v21), v21);
        v22 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v21);
        v12 = v22;
        if (v22)
        {
          ACFULogging::getLogInstance(v22);
          v23 = (ACFULogging *)ACFULogging::handleMessage();
          ACFULogging::getLogInstance(v23);
          v28.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
          *(_OWORD *)&v28.__r_.__value_.__r.__words[1] = xmmword_212B55170;
          strcpy(v28.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
          v24 = std::string::append(&v28, "::", 2uLL);
          v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
          v29.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v25;
          v24->__r_.__value_.__l.__size_ = 0;
          v24->__r_.__value_.__r.__words[2] = 0;
          v24->__r_.__value_.__r.__words[0] = 0;
          v26 = std::string::append(&v29, "runCertification", 0x10uLL);
          v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
          v31 = v26->__r_.__value_.__r.__words[2];
          *(_OWORD *)__p = v27;
          v26->__r_.__value_.__l.__size_ = 0;
          v26->__r_.__value_.__r.__words[2] = 0;
          v26->__r_.__value_.__r.__words[0] = 0;
          CFDataGetBytePtr(v12);
          CFDataGetLength(v12);
          ACFULogging::handleMessageBinary();
          if (SHIBYTE(v31) < 0)
          {
LABEL_8:
            operator delete(__p[0]);
            if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_9;
            goto LABEL_17;
          }
LABEL_16:
          if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_9:
            operator delete(v29.__r_.__value_.__l.__data_);
            if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_10;
            goto LABEL_18;
          }
LABEL_17:
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_10:
            operator delete(v28.__r_.__value_.__l.__data_);
            v18 = 1;
            v19 = 1;
            v20 = bytes;
            if (!bytes)
              goto LABEL_20;
LABEL_19:
            v33 = v20;
            operator delete(v20);
            goto LABEL_20;
          }
LABEL_18:
          v18 = 1;
          v19 = 1;
          v20 = bytes;
          if (!bytes)
            goto LABEL_20;
          goto LABEL_19;
        }
        goto LABEL_28;
      }
    }
LABEL_26:
    ACFULogging::getLogInstance((ACFULogging *)SikPKey);
    ACFULogging::handleMessage();
    v12 = 0;
    v18 = 0;
    v19 = 1;
    v20 = bytes;
    if (bytes)
      goto LABEL_19;
LABEL_20:
    if ((v18 & 1) != 0)
      v19 = 0;
    goto LABEL_23;
  }
  if (!a1)
  {
    bytes = 0;
    v33 = 0;
    v34 = 0;
    SikPKey = security::ARICommandDriver::CsiSecCollectScrtBlob();
    if ((SikPKey & 1) != 0)
    {
      v10 = **(unsigned __int16 **)(v37 + 64);
      ACFULogging::getLogInstance((ACFULogging *)SikPKey);
      SikPKey = ACFULogging::handleMessage();
      if ((v10 - 4097) > 0xFFFFEFFF)
      {
        std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(&bytes, *(char **)(v37 + 72), (char *)(*(_QWORD *)(v37 + 72) + v10), v10);
        v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v10);
        v12 = v11;
        if (v11)
        {
          ACFULogging::getLogInstance(v11);
          v13 = (ACFULogging *)ACFULogging::handleMessage();
          ACFULogging::getLogInstance(v13);
          v28.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
          *(_OWORD *)&v28.__r_.__value_.__r.__words[1] = xmmword_212B55170;
          strcpy(v28.__r_.__value_.__l.__data_, "BasebandUpdaterTransport");
          v14 = std::string::append(&v28, "::", 2uLL);
          v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
          v29.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v15;
          v14->__r_.__value_.__l.__size_ = 0;
          v14->__r_.__value_.__r.__words[2] = 0;
          v14->__r_.__value_.__r.__words[0] = 0;
          v16 = std::string::append(&v29, "runCertification", 0x10uLL);
          v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
          v31 = v16->__r_.__value_.__r.__words[2];
          *(_OWORD *)__p = v17;
          v16->__r_.__value_.__l.__size_ = 0;
          v16->__r_.__value_.__r.__words[2] = 0;
          v16->__r_.__value_.__r.__words[0] = 0;
          CFDataGetBytePtr(v12);
          CFDataGetLength(v12);
          ACFULogging::handleMessageBinary();
          if (SHIBYTE(v31) < 0)
            goto LABEL_8;
          goto LABEL_16;
        }
LABEL_28:
        ACFULogging::getLogInstance(0);
        ACFULogging::handleMessage();
        v12 = 0;
        v18 = 0;
        v19 = 4000;
        v20 = bytes;
        if (bytes)
          goto LABEL_19;
        goto LABEL_20;
      }
    }
    goto LABEL_26;
  }
  ACFULogging::getLogInstance(v8);
  ACFULogging::handleMessage();
  v12 = 0;
  v19 = 1010;
LABEL_23:
  *(_QWORD *)a2 = v12;
  *(_DWORD *)(a2 + 8) = v19;
  (*(void (**)(UInt8 *))(*(_QWORD *)v7 + 8))(v7);
LABEL_24:
  AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::~ARI_CsiSecReadSikPKeyReq_SDK((AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *)v36);
  AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::~ARI_CsiSecCollectScrtBlobReq_SDK((AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *)v38);
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)&v39);
}

void sub_212B42794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::~ARI_CsiSecReadSikPKeyReq_SDK((AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *)&a36);
  AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::~ARI_CsiSecCollectScrtBlobReq_SDK((AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *)(v36 - 128));
  security::ARICommandDriver::~ARICommandDriver((security::ARICommandDriver *)(v36 - 56));
  _Unwind_Resume(a1);
}

uint64_t BasebandUpdaterTransport::retrieveChipRev(BasebandUpdaterTransport *this, unsigned __int8 *a2)
{
  void *v4;
  uint64_t v5;
  ACFULogging *v6;
  uint64_t v7;
  ACFULogging *v9;
  ACFULogging *v10;
  unsigned int v11;
  unsigned __int8 v12[4];
  IOACIPCClass *v13;

  v11 = 4;
  *(_DWORD *)v12 = 0;
  v4 = operator new(0x20uLL);
  *(_QWORD *)v4 = off_24CE85CC8;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  v5 = BasebandUpdaterTransport::IOACIPCHelper::init((BasebandUpdaterTransport::IOACIPCHelper *)v4, "rom");
  if ((v5 & 1) != 0)
  {
    v13 = (IOACIPCClass *)*((_QWORD *)v4 + 1);
    if (v13)
    {
      v6 = (ACFULogging *)ACFUACIPCTransport::readRegister(this, &v13, 2, v12, &v11);
      if ((_DWORD)v6)
      {
        ACFULogging::getLogInstance(v6);
        ACFULogging::handleMessage();
        v7 = 3025;
      }
      else
      {
        v7 = 0;
        *a2 = v12[1];
      }
    }
    else
    {
      ACFULogging::getLogInstance((ACFULogging *)v5);
      ACFULogging::handleMessage();
      v7 = 3000;
    }
    (*(void (**)(void *))(*(_QWORD *)v4 + 8))(v4);
  }
  else
  {
    v9 = (ACFULogging *)(*(uint64_t (**)(void *))(*(_QWORD *)v4 + 8))(v4);
    ACFULogging::getLogInstance(v9);
    v10 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v10);
    ACFULogging::handleMessage();
    return 3019;
  }
  return v7;
}

void sub_212B42AB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void BasebandUpdaterTransport::~BasebandUpdaterTransport(BasebandUpdaterTransport *this)
{
  std::__shared_weak_count *v2;
  const void *v3;

  *(_QWORD *)this = &off_24CE85B38;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  v3 = (const void *)*((_QWORD *)this + 20);
  if (v3)
    CFRelease(v3);
  ACFUACIPCTransport::~ACFUACIPCTransport(this);
}

{
  std::__shared_weak_count *v2;
  const void *v3;
  void *v4;

  *(_QWORD *)this = &off_24CE85B38;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 22);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  v3 = (const void *)*((_QWORD *)this + 20);
  if (v3)
    CFRelease(v3);
  ACFUACIPCTransport::~ACFUACIPCTransport(this);
  operator delete(v4);
}

void BasebandUpdaterTransport::IOACIPCHelper::~IOACIPCHelper(BasebandUpdaterTransport::IOACIPCHelper *this)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  *(_QWORD *)this = off_24CE85CC8;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 2);
  if (v4)
    dispatch_release(v4);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  *(_QWORD *)this = off_24CE85CC8;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)v2);
    operator delete(v3);
  }
  v4 = *((_QWORD *)this + 2);
  if (v4)
    dispatch_release(v4);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  operator delete(this);
}

_QWORD *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = off_24CE85CF8;
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = off_24CE85CF8;
}

ACFULogging *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::operator()(ACFULogging *a1, uint64_t a2)
{
  std::__shared_weak_count *v2;
  void *v3;
  void *v4;
  std::__shared_weak_count *v5;
  BOOL v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  ACFULogging *v11;
  char *v12;
  unint64_t v13;
  int v14;
  ACFULogging *v15;
  ACFULogging *TypeID;
  ACFULogging *v17;
  CFTypeID v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  char *v25;
  unint64_t v26;

  v3 = *(void **)a2;
  v2 = *(std::__shared_weak_count **)(a2 + 8);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  if (!v3)
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    v17 = 0;
    goto LABEL_38;
  }
  v4 = __dynamic_cast(v3, MEMORY[0x24BE05F38], MEMORY[0x24BE05F50], 0);
  v5 = 0;
  if (v4)
    v6 = v2 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v5 = v2;
  }
  v26 = 0xAAAAAAAAAAAAAAAALL;
  GetBasebandTatsuTagToFileNameMap(&v24);
  v9 = v25;
  if (!v25)
LABEL_15:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      v10 = *((_QWORD *)v9 + 4);
      if (v10 <= (unint64_t)CFSTR("Cellular1,LLB"))
        break;
      v9 = *(char **)v9;
      if (!v9)
        goto LABEL_15;
    }
    if (v10 >= (unint64_t)CFSTR("Cellular1,LLB"))
      break;
    v9 = (char *)*((_QWORD *)v9 + 1);
    if (!v9)
      goto LABEL_15;
  }
  RTKitFirmware::getFileOffsetByFileName();
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v24, v25);
  if (!BYTE4(v26))
    goto LABEL_33;
  ACFULogging::getLogInstance(v11);
  ACFULogging::handleMessage();
  GetBasebandTatsuTagToFileNameMap(&v24);
  v12 = v25;
  if (!v25)
LABEL_23:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      v13 = *((_QWORD *)v12 + 4);
      if (v13 <= (unint64_t)CFSTR("Cellular1,LLB"))
        break;
      v12 = *(char **)v12;
      if (!v12)
        goto LABEL_23;
    }
    if (v13 >= (unint64_t)CFSTR("Cellular1,LLB"))
      break;
    v12 = (char *)*((_QWORD *)v12 + 1);
    if (!v12)
      goto LABEL_23;
  }
  v14 = (*(uint64_t (**)(void *, char *))(*(_QWORD *)v4 + 40))(v4, v12 + 40);
  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)&v24, v25);
  if (v14)
  {
    ACFULogging::getLogInstance(v11);
    v15 = (ACFULogging *)ACFULogging::handleMessage();
    ACFULogging::getLogInstance(v15);
    ACFULogging::handleMessage();
    TypeID = (ACFULogging *)ACFUFirmware::copyFWContainerFromOffset((ACFUFirmware *)v3);
    v17 = TypeID;
    if (TypeID && (v18 = CFGetTypeID(TypeID), TypeID = (ACFULogging *)CFDataGetTypeID(), (ACFULogging *)v18 == TypeID))
    {
      ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage();
    }
    else
    {
      ACFULogging::getLogInstance(TypeID);
      ACFULogging::handleMessage();
      v17 = 0;
    }
    if (!v5)
      goto LABEL_38;
  }
  else
  {
LABEL_33:
    ACFULogging::getLogInstance(v11);
    ACFULogging::handleMessage();
    v17 = 0;
    if (!v5)
      goto LABEL_38;
  }
  v19 = (unint64_t *)&v5->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (!v20)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_38:
  if (v2)
  {
    v21 = (unint64_t *)&v2->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return v17;
}

void sub_212B42FC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14)
{
  std::__shared_weak_count *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;

  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v14)
  {
    v19 = (unint64_t *)&v14->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRe"
                     "storeEENS_10ParametersEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI1"
                                "5BasebandRestoreEENS_10ParametersEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_0>,__CFData const* ()(std::shared_ptr<ACFUFirmware>)>::target_type()
{
}

_QWORD *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = off_24CE85D88;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = off_24CE85D88;
  a2[1] = v2;
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::operator()(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string::size_type *a3@<X8>)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(std::__shared_weak_count **)(v4 + 176);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v5 = std::__shared_weak_count::lock(v5);
  v7 = v5;
  if (!v5 || (v5 = *(std::__shared_weak_count **)(v4 + 168)) == 0)
  {
LABEL_6:
    ACFULogging::getLogInstance((ACFULogging *)v5);
    ACFULogging::handleMessage();
    *a3 = 0;
    if (!v7)
      return;
    goto LABEL_7;
  }
  BasebandRestore::handleRTIClientImage((ACFULogging *)v5, a2, a3);
LABEL_7:
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void sub_212B43214(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  p_shared_owners = (unint64_t *)&v1->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRe"
                     "storeEENS_10ParametersEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI1"
                                "5BasebandRestoreEENS_10ParametersEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport4initENSt3__110shared_ptrI15ACFUDiagnosticsEENS0_8weak_ptrI15BasebandRestoreEENS_10ParametersEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1,std::allocator<BasebandUpdaterTransport::init(std::shared_ptr<ACFUDiagnostics>,std::weak_ptr<BasebandRestore>,BasebandUpdaterTransport::Parameters)::$_1>,std::unique_ptr<ACFUDataContainer> ()(std::string const&)>::target_type()
{
}

_QWORD *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = off_24CE85E18;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = off_24CE85E18;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B56B4ELL)
    return a1 + 8;
  if (((v3 & 0x8000000212B56B4ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B56B4ELL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B56B4ELL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 8;
  return 0;
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher6notifyEbNS_8functionIFvvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher6notifyEbNSt3__18functionIFvvEEEEd_UlvE_;
}

_QWORD *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEv()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = off_24CE85EA8;
  return result;
}

void _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E7__cloneEPNS0_6__baseIS5_EE(uint64_t a1, _QWORD *a2)
{
  *a2 = off_24CE85EA8;
}

uint64_t _ZNSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_EclEv()
{
  return 1;
}

uint64_t _ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B56C03)
    return a1 + 8;
  if (((v3 & 0x8000000212B56C03 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B56C03))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B56C03 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 8;
  return 0;
}

void *_ZNKSt3__110__function6__funcIZN15ACFUSynchronize7Syncher4waitEjNS_8functionIFbvEEEEd_UlvE_NS_9allocatorIS7_EES5_E11target_typeEv()
{
  return &_ZTIZN15ACFUSynchronize7Syncher4waitEjNSt3__18functionIFbvEEEEd_UlvE_;
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85F28;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24CE85F28;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<ACFUCommon::PersonalizeParams>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

_QWORD *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::~__func(_QWORD *a1)
{
  const void *v2;

  *a1 = &off_24CE85F78;
  v2 = (const void *)a1[1];
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::~__func(_QWORD *__p)
{
  const void *v2;

  *__p = &off_24CE85F78;
  v2 = (const void *)__p[1];
  if (v2)
    CFRelease(v2);
  operator delete(__p);
}

_QWORD *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;

  v2 = operator new(0x18uLL);
  v3 = *(const void **)(a1 + 8);
  *v2 = &off_24CE85F78;
  v2[1] = v3;
  if (v3)
    CFRetain(v3);
  v2[2] = *(_QWORD *)(a1 + 16);
  return v2;
}

CFTypeRef std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::__clone(uint64_t a1, _QWORD *a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 8);
  *a2 = &off_24CE85F78;
  a2[1] = result;
  if (result)
    result = CFRetain(result);
  a2[2] = *(_QWORD *)(a1 + 16);
  return result;
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::destroy(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 8);
  if (v1)
    CFRelease(v1);
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::destroy_deallocate(_QWORD *__p)
{
  const void *v2;

  v2 = (const void *)__p[1];
  if (v2)
    CFRelease(v2);
  operator delete(__p);
}

void std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::operator()(std::string *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  _QWORD *v4;
  const __CFString *size;
  unint64_t v7;
  char v8;
  size_t v9;
  uint64_t v10;
  const char *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  size_t v14;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  size_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  std::string *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void **v33;
  uint64_t v34;
  uint64_t i;
  int v36;
  void **v37;
  int v38;
  std::string::size_type *p_size;
  const char *v40;
  uint64_t v41;
  size_t v42;
  std::string::size_type v43;
  std::string *v44;
  _QWORD *v45;
  const char *v46;
  unint64_t v47;
  std::string::size_type *v48;
  uint64_t v49;
  uint64_t v50;
  std::string::size_type v51;
  int v52;
  std::string *v53;
  std::string::size_type v54;
  std::string::size_type v55;
  int v56;
  BOOL v57;
  uint64_t *v59;
  void **v60;
  uint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  int8x8_t v64;
  unint64_t v65;
  uint8x8_t v66;
  unint64_t v67;
  uint64_t **v68;
  uint64_t *v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  __int128 v83;
  __int128 v84;
  _QWORD *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  std::string::size_type v90;
  std::string *v91;
  uint64_t v92;
  const void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  std::string::size_type v98;
  std::string *p_s;
  uint64_t v100;
  const void **v101;
  const void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  unint64_t v107;
  std::string v108;
  std::string v109;
  std::string __s;
  void *__p[2];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  void *v116[2];
  __int128 v117;
  __int128 v118;
  _OWORD v119[9];
  unint64_t v120;
  void *__dst[3];
  __int128 *v122[5];
  int v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  unint64_t v132;
  _BYTE v133[32];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  unint64_t v140;
  std::string __b[24];
  char buffer[16];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  void *v147[2];
  __int128 v148;
  __int128 v149;
  _OWORD v150[9];
  unint64_t v151;
  uint64_t v152;

  v3 = a3;
  v152 = *MEMORY[0x24BDAC8D0];
  size = (const __CFString *)a1->__r_.__value_.__l.__size_;
  v4 = (_QWORD *)a1->__r_.__value_.__r.__words[2];
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  memset(&v108, 0, sizeof(v108));
  if (!size)
    goto LABEL_7;
  v7 = *(unsigned __int8 *)(a2 + 23);
  v8 = v7;
  v9 = *(_QWORD *)(a2 + 8);
  if ((v7 & 0x80u) == 0)
    v10 = *(unsigned __int8 *)(a2 + 23);
  else
    v10 = *(_QWORD *)(a2 + 8);
  if (v10 != 4)
  {
    if (!v10)
    {
LABEL_7:
      *((_BYTE *)&v108.__r_.__value_.__s + 23) = 12;
      LODWORD(v108.__r_.__value_.__r.__words[1]) = 1953391981;
      v108.__r_.__value_.__r.__words[0] = *(_QWORD *)"Bad argument";
LABEL_189:
      ACFULogging::getLogInstance((ACFULogging *)a1);
      ACFULogging::handleMessage();
      goto LABEL_190;
    }
LABEL_15:
    if (v4[3])
      goto LABEL_108;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(size, buffer, 1024, 0x8000100u);
    memset(__dst, 170, sizeof(__dst));
    v14 = strlen(buffer);
    if (v14 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v15 = (void *)v14;
    if (v14 >= 0x17)
    {
      v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v17 = v14 | 7;
      v18 = v17 + 1;
      v16 = (void **)operator new(v17 + 1);
      __dst[1] = v15;
      __dst[2] = (void *)(v18 | 0x8000000000000000);
      __dst[0] = v16;
    }
    else
    {
      HIBYTE(__dst[2]) = v14;
      v16 = __dst;
      if (!v14)
      {
LABEL_28:
        *((_BYTE *)v15 + (_QWORD)v16) = 0;
        memset(__b, 170, sizeof(__b));
        v19 = SHIBYTE(__dst[2]);
        if (SHIBYTE(__dst[2]) >= 0)
          v20 = HIBYTE(__dst[2]);
        else
          v20 = (size_t)__dst[1];
        v21 = v20 + 1;
        memset(v133, 170, 24);
        if (v20 + 1 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v21 >= 0x17)
        {
          v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v21 | 7) != 0x17)
            v23 = v21 | 7;
          v24 = v23 + 1;
          v22 = operator new(v23 + 1);
          *(_QWORD *)&v133[16] = v24 | 0x8000000000000000;
          *(_QWORD *)v133 = v22;
          *(_QWORD *)&v133[8] = v20 + 1;
        }
        else
        {
          memset(v133, 0, 24);
          v22 = v133;
          v133[23] = v20 + 1;
          if (!v20)
            goto LABEL_42;
        }
        if (v19 >= 0)
          v25 = __dst;
        else
          v25 = (void **)__dst[0];
        memmove(v22, v25, v20);
LABEL_42:
        *(_WORD *)&v22[v20] = 47;
        v26 = std::string::append((std::string *)v133, "dtt.bin", 7uLL);
        v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        *(_QWORD *)&v112 = *((_QWORD *)&v26->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        std::ifstream::basic_ifstream(__b);
        if (SBYTE7(v112) < 0)
        {
          operator delete(__p[0]);
          if ((v133[23] & 0x80000000) == 0)
          {
LABEL_44:
            if (__b[5].__r_.__value_.__r.__words[2])
            {
LABEL_45:
              v140 = 0xAAAAAAAAAAAAAAAALL;
              *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v138 = v28;
              v139 = v28;
              v136 = v28;
              v137 = v28;
              v134 = v28;
              v135 = v28;
              *(_OWORD *)v133 = v28;
              *(_OWORD *)&v133[16] = v28;
              v106 = v3;
              std::istream::tellg();
              std::istream::seekg();
              v132 = 0xAAAAAAAAAAAAAAAALL;
              *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v130 = v29;
              v131 = v29;
              v128 = v29;
              v129 = v29;
              v126 = v29;
              v127 = v29;
              v124 = v29;
              v125 = v29;
              std::istream::tellg();
              v30 = v132;
              v31 = v140;
              std::istream::seekg();
              v32 = (v30 - v31) / 0x24;
              if ((v30 - v31) % 0x24)
              {
                if (!v4[3])
                {
LABEL_52:
                  std::string::__assign_external(&v108, "Invalid coredump translation table file", 0x27uLL);
                  goto LABEL_53;
                }
                v33 = (void **)v4[2];
                if (!v33)
                {
LABEL_48:
                  v4[2] = 0;
                  v34 = v4[1];
                  if (v34)
                  {
                    for (i = 0; i != v34; ++i)
                      *(_QWORD *)(*v4 + 8 * i) = 0;
                  }
                  v4[3] = 0;
                  goto LABEL_52;
                }
                while (1)
                {
                  v37 = (void **)*v33;
                  if (*((char *)v33 + 63) < 0)
                  {
                    operator delete(v33[5]);
                    if (*((char *)v33 + 39) < 0)
LABEL_59:
                      operator delete(v33[2]);
                  }
                  else if (*((char *)v33 + 39) < 0)
                  {
                    goto LABEL_59;
                  }
                  operator delete(v33);
                  v33 = v37;
                  if (!v37)
                    goto LABEL_48;
                }
              }
              if ((int)v32 < 1)
              {
LABEL_100:
                v36 = 1;
                v3 = v106;
                goto LABEL_101;
              }
              v38 = 0;
              p_size = &__b[1].__r_.__value_.__l.__size_;
              v40 = (char *)&v122[1] + 4;
              while (1)
              {
                v123 = 0;
                memset(&v122[1], 0, 32);
                std::istream::read();
                if ((*((_BYTE *)p_size + *(_QWORD *)(__b[0].__r_.__value_.__r.__words[0] - 24)) & 5) != 0)
                {
                  v120 = 0xAAAAAAAAAAAAAAAALL;
                  *(_QWORD *)&v97 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v97 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v119[7] = v97;
                  v119[8] = v97;
                  v119[5] = v97;
                  v119[6] = v97;
                  v119[3] = v97;
                  v119[4] = v97;
                  v119[1] = v97;
                  v119[2] = v97;
                  v118 = v97;
                  v119[0] = v97;
                  *(_OWORD *)v116 = v97;
                  v117 = v97;
                  v114 = v97;
                  v115 = v97;
                  v112 = v97;
                  v113 = v97;
                  *(_OWORD *)__p = v97;
                  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__p);
                  v3 = v106;
                  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v112, (uint64_t)"Failed to read coredump translation table entry instance ", 57);
                  std::ostream::operator<<();
                  if ((BYTE8(v118) & 0x10) != 0)
                  {
                    v100 = v118;
                    if ((unint64_t)v118 < *((_QWORD *)&v115 + 1))
                    {
                      *(_QWORD *)&v118 = *((_QWORD *)&v115 + 1);
                      v100 = *((_QWORD *)&v115 + 1);
                    }
                    v101 = (const void **)&v115;
                  }
                  else
                  {
                    if ((BYTE8(v118) & 8) == 0)
                    {
                      v98 = 0;
                      *((_BYTE *)&__s.__r_.__value_.__s + 23) = 0;
                      p_s = &__s;
                      goto LABEL_211;
                    }
                    v101 = (const void **)&v113 + 1;
                    v100 = *((_QWORD *)&v114 + 1);
                  }
                  v102 = *v101;
                  v98 = v100 - (_QWORD)*v101;
                  if (v98 > 0x7FFFFFFFFFFFFFF7)
                    std::string::__throw_length_error[abi:ne180100]();
                  if (v98 >= 0x17)
                  {
                    v103 = (v98 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v98 | 7) != 0x17)
                      v103 = v98 | 7;
                    v104 = v103 + 1;
                    p_s = (std::string *)operator new(v103 + 1);
                    __s.__r_.__value_.__l.__size_ = v98;
                    __s.__r_.__value_.__r.__words[2] = v104 | 0x8000000000000000;
                    __s.__r_.__value_.__r.__words[0] = (std::string::size_type)p_s;
                  }
                  else
                  {
                    *((_BYTE *)&__s.__r_.__value_.__s + 23) = v100 - *(_BYTE *)v101;
                    p_s = &__s;
                    if (!v98)
                    {
LABEL_211:
                      p_s->__r_.__value_.__s.__data_[v98] = 0;
                      if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(v108.__r_.__value_.__l.__data_);
                      v108 = __s;
                      __p[0] = *(void **)MEMORY[0x24BEDB7F0];
                      v105 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
                      *(void **)((char *)__p + *((_QWORD *)__p[0] - 3)) = *(void **)(MEMORY[0x24BEDB7F0] + 64);
                      *(_QWORD *)&v112 = v105;
                      *((_QWORD *)&v112 + 1) = MEMORY[0x24BEDB848] + 16;
                      if (SHIBYTE(v117) < 0)
                        operator delete(v116[1]);
                      std::streambuf::~streambuf();
                      std::iostream::~basic_iostream();
                      MEMORY[0x212BFA3D0](v119);
LABEL_53:
                      v36 = 0;
LABEL_101:
                      if (!std::filebuf::close())
                        std::ios_base::clear((std::ios_base *)((char *)__b + *(_QWORD *)(__b[0].__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)((char *)&__b[1].__r_.__value_.__r.__words[1]+ *(_QWORD *)(__b[0].__r_.__value_.__r.__words[0] - 24)) | 4);
                      LOBYTE(v19) = HIBYTE(__dst[2]);
LABEL_104:
                      __b[0].__r_.__value_.__r.__words[0] = *MEMORY[0x24BEDB7E0];
                      *(std::string::size_type *)((char *)__b[0].__r_.__value_.__r.__words
                                                + *(_QWORD *)(__b[0].__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
                      MEMORY[0x212BFA184](&__b[0].__r_.__value_.__r.__words[2]);
                      std::istream::~istream();
                      a1 = (std::string *)MEMORY[0x212BFA3D0](&__b[17].__r_.__value_.__r.__words[2]);
                      if ((v19 & 0x80) != 0)
                        operator delete(__dst[0]);
                      if (!v36)
                        goto LABEL_189;
                      v7 = *(unsigned __int8 *)(a2 + 23);
                      v9 = *(_QWORD *)(a2 + 8);
                      v8 = *(_BYTE *)(a2 + 23);
LABEL_108:
                      if (v8 >= 0)
                        v61 = (uint64_t *)a2;
                      else
                        v61 = *(uint64_t **)a2;
                      if (v8 >= 0)
                        v62 = v7;
                      else
                        v62 = v9;
                      v63 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)buffer, v61, v62);
                      v64 = (int8x8_t)v4[1];
                      if (!*(_QWORD *)&v64)
                        goto LABEL_165;
                      v65 = v63;
                      v66 = (uint8x8_t)vcnt_s8(v64);
                      v66.i16[0] = vaddlv_u8(v66);
                      if (v66.u32[0] > 1uLL)
                      {
                        v67 = v63;
                        if (v63 >= *(_QWORD *)&v64)
                          v67 = v63 % *(_QWORD *)&v64;
                      }
                      else
                      {
                        v67 = (*(_QWORD *)&v64 - 1) & v63;
                      }
                      v68 = *(uint64_t ***)(*v4 + 8 * v67);
                      if (!v68)
                        goto LABEL_165;
                      v69 = *v68;
                      if (!*v68)
                        goto LABEL_165;
                      v70 = *(_BYTE *)(a2 + 23);
                      if (v70 >= 0)
                        v71 = *(unsigned __int8 *)(a2 + 23);
                      else
                        v71 = *(_QWORD *)(a2 + 8);
                      if (v70 >= 0)
                        v72 = (uint64_t *)a2;
                      else
                        v72 = *(uint64_t **)a2;
                      if (v66.u32[0] < 2uLL)
                      {
                        v73 = *(_QWORD *)&v64 - 1;
                        while (1)
                        {
                          v78 = v69[1];
                          if (v78 == v65)
                          {
                            v79 = *((unsigned __int8 *)v69 + 39);
                            if ((v79 & 0x80u) == 0)
                              v80 = *((unsigned __int8 *)v69 + 39);
                            else
                              v80 = v69[3];
                            if (v80 == v71)
                            {
                              if ((v79 & 0x80) != 0)
                              {
                                if (!memcmp((const void *)v69[2], v72, v69[3]))
                                  goto LABEL_162;
                              }
                              else
                              {
                                if (!*((_BYTE *)v69 + 39))
                                  goto LABEL_162;
                                v81 = 0;
                                while (*((unsigned __int8 *)v69 + v81 + 16) == *((unsigned __int8 *)v72 + v81))
                                {
                                  if (v79 == ++v81)
                                    goto LABEL_161;
                                }
                              }
                            }
                          }
                          else if ((v78 & v73) != v67)
                          {
                            goto LABEL_165;
                          }
                          v69 = (uint64_t *)*v69;
                          if (!v69)
                            goto LABEL_165;
                        }
                      }
                      while (1)
                      {
                        v74 = v69[1];
                        if (v74 == v65)
                        {
                          v75 = *((unsigned __int8 *)v69 + 39);
                          if ((v75 & 0x80u) == 0)
                            v76 = *((unsigned __int8 *)v69 + 39);
                          else
                            v76 = v69[3];
                          if (v76 == v71)
                          {
                            if ((v75 & 0x80) == 0)
                            {
                              if (!*((_BYTE *)v69 + 39))
                                goto LABEL_162;
                              v77 = 0;
                              do
                              {
                                if (*((unsigned __int8 *)v69 + v77 + 16) != *((unsigned __int8 *)v72 + v77))
                                  goto LABEL_130;
                                ++v77;
                              }
                              while (v75 != v77);
LABEL_161:
                              if (v69)
                              {
LABEL_162:
                                *(_QWORD *)buffer = a2;
                                v82 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v4, a2, (__int128 **)buffer);
                                if (v82 + 5 != v3)
                                {
                                  if (*((char *)v82 + 63) < 0)
                                  {
                                    std::string::__assign_no_alias<true>(v3, (void *)v82[5], v82[6]);
                                  }
                                  else
                                  {
                                    v83 = *(_OWORD *)(v82 + 5);
                                    v3[2] = v82[7];
                                    *(_OWORD *)v3 = v83;
                                  }
                                }
                                goto LABEL_190;
                              }
LABEL_165:
                              v151 = 0xAAAAAAAAAAAAAAAALL;
                              *(_QWORD *)&v84 = 0xAAAAAAAAAAAAAAAALL;
                              *((_QWORD *)&v84 + 1) = 0xAAAAAAAAAAAAAAAALL;
                              v150[8] = v84;
                              v150[7] = v84;
                              v150[6] = v84;
                              v150[5] = v84;
                              v150[4] = v84;
                              v150[3] = v84;
                              v150[2] = v84;
                              v150[1] = v84;
                              v150[0] = v84;
                              v149 = v84;
                              v148 = v84;
                              *(_OWORD *)v147 = v84;
                              v146 = v84;
                              v145 = v84;
                              v144 = v84;
                              v143 = v84;
                              *(_OWORD *)buffer = v84;
                              std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)buffer);
                              v85 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v143, (uint64_t)"Tag (", 5);
                              v86 = *(char *)(a2 + 23);
                              if (v86 >= 0)
                                v87 = a2;
                              else
                                v87 = *(_QWORD *)a2;
                              if (v86 >= 0)
                                v88 = *(unsigned __int8 *)(a2 + 23);
                              else
                                v88 = *(_QWORD *)(a2 + 8);
                              v89 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v85, v87, v88);
                              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v89, (uint64_t)") not found in coredump translation table", 41);
                              if ((BYTE8(v149) & 0x10) != 0)
                              {
                                v92 = v149;
                                if ((unint64_t)v149 < *((_QWORD *)&v146 + 1))
                                {
                                  *(_QWORD *)&v149 = *((_QWORD *)&v146 + 1);
                                  v92 = *((_QWORD *)&v146 + 1);
                                }
                                v93 = (const void *)v146;
                                v90 = v92 - v146;
                                if ((unint64_t)(v92 - v146) > 0x7FFFFFFFFFFFFFF7)
                                  goto LABEL_194;
                              }
                              else
                              {
                                if ((BYTE8(v149) & 8) == 0)
                                {
                                  v90 = 0;
                                  *((_BYTE *)&__b[0].__r_.__value_.__s + 23) = 0;
                                  v91 = __b;
                                  goto LABEL_184;
                                }
                                v93 = (const void *)*((_QWORD *)&v144 + 1);
                                v90 = *((_QWORD *)&v145 + 1) - *((_QWORD *)&v144 + 1);
                                if (*((_QWORD *)&v145 + 1) - *((_QWORD *)&v144 + 1) > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_194:
                                  std::string::__throw_length_error[abi:ne180100]();
                              }
                              if (v90 >= 0x17)
                              {
                                v94 = (v90 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v90 | 7) != 0x17)
                                  v94 = v90 | 7;
                                v95 = v94 + 1;
                                v91 = (std::string *)operator new(v94 + 1);
                                __b[0].__r_.__value_.__r.__words[2] = v95 | 0x8000000000000000;
                                __b[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v91;
                                __b[0].__r_.__value_.__l.__size_ = v90;
                              }
                              else
                              {
                                *((_BYTE *)&__b[0].__r_.__value_.__s + 23) = v90;
                                v91 = __b;
                                if (!v90)
                                {
LABEL_184:
                                  v91->__r_.__value_.__s.__data_[v90] = 0;
                                  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v108.__r_.__value_.__l.__data_);
                                  v108 = __b[0];
                                  *(_QWORD *)buffer = *MEMORY[0x24BEDB7F0];
                                  v96 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
                                  *(_QWORD *)&buffer[*(_QWORD *)(*(_QWORD *)buffer - 24)] = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
                                  *(_QWORD *)&v143 = v96;
                                  *((_QWORD *)&v143 + 1) = MEMORY[0x24BEDB848] + 16;
                                  if (SHIBYTE(v148) < 0)
                                    operator delete(v147[1]);
                                  std::streambuf::~streambuf();
                                  std::iostream::~basic_iostream();
                                  a1 = (std::string *)MEMORY[0x212BFA3D0](v150);
                                  goto LABEL_189;
                                }
                              }
                              memmove(v91, v93, v90);
                              goto LABEL_184;
                            }
                            if (!memcmp((const void *)v69[2], v72, v69[3]))
                              goto LABEL_162;
                          }
                        }
                        else
                        {
                          if (v74 >= *(_QWORD *)&v64)
                            v74 %= *(_QWORD *)&v64;
                          if (v74 != v67)
                            goto LABEL_165;
                        }
LABEL_130:
                        v69 = (uint64_t *)*v69;
                        if (!v69)
                          goto LABEL_165;
                      }
                    }
                  }
                  memmove(p_s, v102, v98);
                  goto LABEL_211;
                }
                __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
                *(_QWORD *)&v112 = 0x4AAAAAAAAAAAAAALL;
                __p[0] = (void *)(LODWORD(v122[1]) | 0xAAAAAA0000000000);
                if (LOBYTE(v122[1]) != 67)
                {
                  v41 = bswap32(v122[1]);
                  __p[0] = (void *)(v107 & 0xFFFFFF0000000000 | v41);
                  v107 = v107 & 0xFFFFFF0000000000 | v41 & 0xFFFFFF00FFFFFF00;
                }
                memset(&__s, 170, sizeof(__s));
                v42 = strlen(v40);
                if (v42 > 0x7FFFFFFFFFFFFFF7)
                  std::string::__throw_length_error[abi:ne180100]();
                v43 = v42;
                if (v42 >= 0x17)
                  break;
                *((_BYTE *)&__s.__r_.__value_.__s + 23) = v42;
                v44 = &__s;
                if (v42)
                  goto LABEL_76;
LABEL_77:
                v44->__r_.__value_.__s.__data_[v43] = 0;
                v51 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
                v52 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
                if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                  v51 = __s.__r_.__value_.__l.__size_;
                if (v51 != 17)
                  goto LABEL_89;
                v53 = (std::string *)__s.__r_.__value_.__r.__words[0];
                if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v53 = &__s;
                v54 = v53->__r_.__value_.__r.__words[0];
                v55 = v53->__r_.__value_.__l.__size_;
                v56 = v53->__r_.__value_.__s.__data_[16];
                v57 = v54 == 0x65725F6873617263 && v55 == 0x6F736A2E74726F70;
                if (v57 && v56 == 110)
                {
                  *((_BYTE *)&v109.__r_.__value_.__s + 23) = 11;
                  strcpy((char *)&v109, "report.json");
                }
                else
                {
LABEL_89:
                  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
                    std::string::__init_copy_ctor_external(&v109, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
                  else
                    v109 = __s;
                }
                v122[0] = (__int128 *)__p;
                v59 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v4, (uint64_t)__p, v122);
                v60 = (void **)(v59 + 5);
                if (*((char *)v59 + 63) < 0)
                {
                  operator delete(*v60);
                  *(std::string *)v60 = v109;
                  if ((v52 & 0x80000000) == 0)
                  {
LABEL_95:
                    if (SBYTE7(v112) < 0)
                      goto LABEL_99;
                    goto LABEL_65;
                  }
                }
                else
                {
                  *(_OWORD *)v60 = *(_OWORD *)&v109.__r_.__value_.__l.__data_;
                  v59[7] = v109.__r_.__value_.__r.__words[2];
                  if ((v52 & 0x80000000) == 0)
                    goto LABEL_95;
                }
                operator delete(__s.__r_.__value_.__l.__data_);
                if (SBYTE7(v112) < 0)
LABEL_99:
                  operator delete(__p[0]);
LABEL_65:
                if ((_DWORD)v32 == ++v38)
                  goto LABEL_100;
              }
              v45 = v4;
              v46 = v40;
              v47 = v32;
              v48 = p_size;
              v49 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v42 | 7) != 0x17)
                v49 = v42 | 7;
              v50 = v49 + 1;
              v44 = (std::string *)operator new(v49 + 1);
              __s.__r_.__value_.__l.__size_ = v43;
              __s.__r_.__value_.__r.__words[2] = v50 | 0x8000000000000000;
              __s.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
              p_size = v48;
              v32 = v47;
              v40 = v46;
              v4 = v45;
LABEL_76:
              memcpy(v44, v40, v43);
              goto LABEL_77;
            }
LABEL_62:
            v36 = 1;
            goto LABEL_104;
          }
        }
        else if ((v133[23] & 0x80000000) == 0)
        {
          goto LABEL_44;
        }
        operator delete(*(void **)v133);
        if (__b[5].__r_.__value_.__r.__words[2])
          goto LABEL_45;
        goto LABEL_62;
      }
    }
    memcpy(v16, buffer, (size_t)v15);
    goto LABEL_28;
  }
  if ((char)v7 < 0)
  {
    if (memcmp(*(const void **)a2, "CD00", v9))
      goto LABEL_15;
  }
  else if ((_BYTE)v7)
  {
    v11 = "CD00";
    v12 = (unsigned __int8 *)a2;
    v13 = *(unsigned __int8 *)(a2 + 23);
    while (*v12 == *(unsigned __int8 *)v11)
    {
      ++v12;
      ++v11;
      if (!--v13)
        goto LABEL_20;
    }
    goto LABEL_15;
  }
LABEL_20:
  if (v3 != (uint64_t *)"dtt.bin")
  {
    v3[2] = 0x700000000000000;
    *(_OWORD *)v3 = *(_OWORD *)"dtt.bin";
  }
  if (v4[3])
  {
    a1 = std::string::__assign_external(&v108, "Duplicate coredump translation file received", 0x2CuLL);
    goto LABEL_189;
  }
LABEL_190:
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v108.__r_.__value_.__l.__data_);
}

void sub_212B443DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *__p;
  char a69;
  uint64_t v70;
  uint64_t v71;

  v70 = MEMORY[0x24BEDB7E0];
  v71 = *MEMORY[0x24BEDB7E0];
  STACK[0x310] = *MEMORY[0x24BEDB7E0];
  *(unint64_t *)((char *)&STACK[0x310] + *(_QWORD *)(v71 - 24)) = *(_QWORD *)(v70 + 24);
  MEMORY[0x212BFA184](&STACK[0x320]);
  std::istream::~istream();
  MEMORY[0x212BFA3D0](&STACK[0x4B8]);
  if (a69 < 0)
  {
    operator delete(__p);
    if (a20 < 0)
    {
LABEL_7:
      operator delete(a15);
      if ((*(char *)(a13 + 23) & 0x80000000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if (a20 < 0)
  {
    goto LABEL_7;
  }
  if ((*(char *)(a13 + 23) & 0x80000000) == 0)
LABEL_9:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(*(void **)a13);
  goto LABEL_9;
}

uint64_t std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN24BasebandUpdaterTransport15collectCoredumpENSt3__110shared_ptrI12ACFUFirmwareEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *std::__function::__func<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0,std::allocator<BasebandUpdaterTransport::collectCoredump(std::shared_ptr<ACFUFirmware>)::$_0>,std::string ()(std::string const&)>::target_type()
{
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, __int128 **a3)
{
  _BYTE *v4;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  std::string *v27;
  __int128 *v28;
  __int128 v29;
  float v30;
  float v31;
  _QWORD *v32;
  _QWORD *v33;
  _BOOL8 v34;
  unint64_t v35;
  unint64_t v36;
  size_t prime;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD *v41;
  size_t v42;
  size_t v43;
  size_t v44;
  _QWORD *i;
  size_t v46;
  uint64_t v47;
  unint64_t v48;
  uint8x8_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  size_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  _QWORD v58[2];
  unint64_t v59;

  v4 = (_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v7 = v6;
  }
  v8 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)v58, (uint64_t *)a2, v7);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = v8;
      if (v8 >= v10)
        v12 = v8 % v10;
    }
    else
    {
      v12 = (v10 - 1) & v8;
    }
    v13 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v12);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v4[23];
        if (v15 >= 0)
          v16 = v4[23];
        else
          v16 = *((_QWORD *)v4 + 1);
        if (v15 < 0)
          v4 = *(_BYTE **)v4;
        if (v11.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = v14[1];
            if (v21 == v9)
            {
              v22 = *((unsigned __int8 *)v14 + 39);
              if ((v22 & 0x80u) == 0)
                v23 = *((unsigned __int8 *)v14 + 39);
              else
                v23 = v14[3];
              if (v23 == v16)
              {
                if ((v22 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v14[2], v4, v14[3]))
                    return v14;
                }
                else
                {
                  if (!*((_BYTE *)v14 + 39))
                    return v14;
                  v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v4[v24])
                  {
                    if (v22 == ++v24)
                      return v14;
                  }
                }
              }
            }
            else if ((v21 & (v10 - 1)) != v12)
            {
              goto LABEL_51;
            }
            v14 = (uint64_t *)*v14;
            if (!v14)
              goto LABEL_51;
          }
        }
        do
        {
          v17 = v14[1];
          if (v17 == v9)
          {
            v18 = *((unsigned __int8 *)v14 + 39);
            if ((v18 & 0x80u) == 0)
              v19 = *((unsigned __int8 *)v14 + 39);
            else
              v19 = v14[3];
            if (v19 == v16)
            {
              if ((v18 & 0x80) != 0)
              {
                if (!memcmp((const void *)v14[2], v4, v14[3]))
                  return v14;
              }
              else
              {
                if (!*((_BYTE *)v14 + 39))
                  return v14;
                v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v4[v20])
                {
                  if (v18 == ++v20)
                    return v14;
                }
              }
            }
          }
          else
          {
            if (v17 >= v10)
              v17 %= v10;
            if (v17 != v12)
              break;
          }
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
  else
  {
    v12 = 0xAAAAAAAAAAAAAAAALL;
  }
LABEL_51:
  v25 = (_QWORD *)(a1 + 16);
  v59 = 0xAAAAAAAAAAAAAA00;
  v26 = operator new(0x40uLL);
  v58[0] = v26;
  v58[1] = a1 + 16;
  *v26 = 0;
  v26[1] = v9;
  v27 = (std::string *)(v26 + 2);
  v28 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v27, *(const std::string::value_type **)v28, *((_QWORD *)v28 + 1));
  }
  else
  {
    v29 = *v28;
    v26[4] = *((_QWORD *)v28 + 2);
    *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v29;
  }
  v26[5] = 0;
  v26[6] = 0;
  v26[7] = 0;
  LOBYTE(v59) = 1;
  v30 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v31 = *(float *)(a1 + 32);
  if (!v10 || (float)(v31 * (float)v10) < v30)
  {
    v34 = 1;
    if (v10 >= 3)
      v34 = (v10 & (v10 - 1)) != 0;
    v35 = v34 | (2 * v10);
    v36 = vcvtps_u32_f32(v30 / v31);
    if (v35 <= v36)
      prime = v36;
    else
      prime = v35;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v10 = *(_QWORD *)(a1 + 8);
    if (prime > v10)
    {
LABEL_68:
      if (prime >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v38 = operator new(8 * prime);
      v39 = *(void **)a1;
      *(_QWORD *)a1 = v38;
      if (v39)
        operator delete(v39);
      v40 = 0;
      *(_QWORD *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v40++) = 0;
      while (prime != v40);
      v41 = (_QWORD *)*v25;
      if (!*v25)
        goto LABEL_100;
      v42 = v41[1];
      v43 = prime - 1;
      if ((prime & (prime - 1)) == 0)
      {
        v44 = v42 & v43;
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v44) = v25;
        for (i = (_QWORD *)*v41; *v41; i = (_QWORD *)*v41)
        {
          v46 = i[1] & v43;
          if (v46 == v44)
          {
            v41 = i;
          }
          else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v46))
          {
            *v41 = *i;
            v47 = 8 * v46;
            *i = **(_QWORD **)(*(_QWORD *)a1 + v47);
            **(_QWORD **)(*(_QWORD *)a1 + v47) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v46) = v41;
            v41 = i;
            v44 = v46;
          }
        }
        goto LABEL_100;
      }
      if (v42 >= prime)
        v42 %= prime;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v42) = v25;
      v51 = (_QWORD *)*v41;
      if (!*v41)
      {
LABEL_100:
        v10 = prime;
        v54 = prime - 1;
        if ((prime & (prime - 1)) != 0)
          goto LABEL_101;
        goto LABEL_116;
      }
      while (1)
      {
        v53 = v51[1];
        if (v53 >= prime)
          v53 %= prime;
        if (v53 == v42)
          goto LABEL_94;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v53))
        {
          *v41 = *v51;
          v52 = 8 * v53;
          *v51 = **(_QWORD **)(*(_QWORD *)a1 + v52);
          **(_QWORD **)(*(_QWORD *)a1 + v52) = v51;
          v51 = v41;
LABEL_94:
          v41 = v51;
          v51 = (_QWORD *)*v51;
          if (!v51)
            goto LABEL_100;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v53) = v41;
          v41 = v51;
          v51 = (_QWORD *)*v51;
          v42 = v53;
          if (!v51)
            goto LABEL_100;
        }
      }
    }
    if (prime < v10)
    {
      v48 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v10 < 3 || (v49 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v49.i16[0] = vaddlv_u8(v49), v49.u32[0] > 1uLL))
      {
        v48 = std::__next_prime(v48);
      }
      else
      {
        v50 = 1 << -(char)__clz(v48 - 1);
        if (v48 >= 2)
          v48 = v50;
      }
      if (prime <= v48)
        prime = v48;
      if (prime < v10)
      {
        if (!prime)
        {
          v55 = *(void **)a1;
          *(_QWORD *)a1 = 0;
          if (v55)
            operator delete(v55);
          v10 = 0;
          *(_QWORD *)(a1 + 8) = 0;
          v54 = -1;
          goto LABEL_116;
        }
        goto LABEL_68;
      }
      v10 = *(_QWORD *)(a1 + 8);
    }
    v54 = v10 - 1;
    if ((v10 & (v10 - 1)) != 0)
    {
LABEL_101:
      if (v9 >= v10)
      {
        v12 = v9 % v10;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v9 % v10));
        v33 = (_QWORD *)v58[0];
        if (v32)
          goto LABEL_57;
      }
      else
      {
        v12 = v9;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v9);
        v33 = (_QWORD *)v58[0];
        if (v32)
          goto LABEL_57;
      }
LABEL_117:
      *v33 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v58[0];
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v25;
      if (*(_QWORD *)v58[0])
      {
        v56 = *(_QWORD *)(*(_QWORD *)v58[0] + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v56 >= v10)
            v56 %= v10;
        }
        else
        {
          v56 &= v10 - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v56) = v58[0];
      }
      goto LABEL_123;
    }
LABEL_116:
    v12 = v54 & v9;
    v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v54 & v9));
    v33 = (_QWORD *)v58[0];
    if (v32)
      goto LABEL_57;
    goto LABEL_117;
  }
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
  v33 = (_QWORD *)v58[0];
  if (!v32)
    goto LABEL_117;
LABEL_57:
  *v33 = *v32;
  *v32 = v58[0];
LABEL_123:
  v14 = (uint64_t *)v58[0];
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_212B44CCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_212B44CE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((_BYTE *)a1 + 16))
    {
      if (*(char *)(v2 + 63) < 0)
      {
        operator delete(*(void **)(v2 + 40));
        if ((*(char *)(v2 + 39) & 0x80000000) == 0)
          goto LABEL_5;
      }
      else if ((*(char *)(v2 + 39) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 16));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t __cxx_global_var_init_28()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_212A4D000);
  }
  return result;
}

uint64_t *getReverseProxySettings@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char *v4;
  unint64_t *v5;
  int v6;
  unint64_t v7;
  const __CFAllocator *v8;
  CFURLRef v9;
  ACFULogging *v10;
  ACFULogging *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  int v14;
  ACFULogging *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  const void *v19;
  unint64_t *v20;
  unint64_t v21;
  std::string v23;
  CFTypeRef cf;
  _QWORD v25[6];
  uint64_t v26[2];
  std::string v27;
  std::string v28;
  std::string v29;
  CFStringRef v30;

  *a2 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3812000000;
  v25[3] = __Block_byref_object_copy__4;
  v25[4] = __Block_byref_object_dispose__4;
  v25[5] = "";
  v4 = (char *)operator new(0x90uLL);
  *((_QWORD *)v4 + 1) = 0;
  v5 = (unint64_t *)(v4 + 8);
  *((_QWORD *)v4 + 3) = 850045863;
  *((_QWORD *)v4 + 2) = 0;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *((_QWORD *)v4 + 11) = 1018212795;
  *((_OWORD *)v4 + 6) = 0u;
  *((_OWORD *)v4 + 7) = 0u;
  *(_OWORD *)(v4 + 124) = 0u;
  *(_QWORD *)v4 = off_24CE85238;
  v26[0] = (uint64_t)v4;
  std::mutex::lock((std::mutex *)(v4 + 24));
  v6 = *((_DWORD *)v4 + 34);
  if ((v6 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  do
    v7 = __ldxr(v5);
  while (__stxr(v7 + 1, v5));
  *((_DWORD *)v4 + 34) = v6 | 2;
  std::mutex::unlock((std::mutex *)(v4 + 24));
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v23 = *(std::string *)a1;
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v27, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  else
    v27 = v23;
  v26[1] = 0;
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v28, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  else
    v28 = v27;
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v29, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v29 = v28;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v30 = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  if (ctu::cf::convert_copy())
  {
    v9 = CFURLCreateWithString(v8, v30, 0);
    CFRelease(v30);
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_17;
  }
  else
  {
    v9 = 0;
    if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_17:
      if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_18;
      goto LABEL_48;
    }
  }
  operator delete(v29.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_18:
    cf = v9;
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_19;
LABEL_49:
    operator delete(v27.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_50;
  }
LABEL_48:
  operator delete(v28.__r_.__value_.__l.__data_);
  cf = v9;
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_49;
LABEL_19:
  if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_20;
LABEL_50:
  operator delete(v23.__r_.__value_.__l.__data_);
LABEL_20:
  v10 = (ACFULogging *)RPRegisterForAvailability();
  v11 = v10;
  if (v10)
  {
    v12 = *(unsigned __int8 *)(a1 + 23);
    if ((v12 & 0x80u) != 0)
      v12 = *(_QWORD *)(a1 + 8);
    if (v12
      && (cf
        ? (v13 = ctu::SharedRef<__CFURL const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFURL const>::get)
        : (v13 = 0),
          v13
       && (RPRegistrationResume(),
           v29.__r_.__value_.__r.__words[0] = std::chrono::steady_clock::now().__d_.__rep_ + 5000000000,
           v14 = std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v4, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)&v29), v10 = (ACFULogging *)MEMORY[0x212BF8FE4](v11), !v14)))
    {
      std::__assoc_state<BOOL>::move((std::__assoc_sub_state *)v4);
      v16 = (char)v15;
      do
        v17 = __ldaxr(v5);
      while (__stlxr(v17 - 1, v5));
      if (!v17)
        v15 = (ACFULogging *)(*(uint64_t (**)(char *))(*(_QWORD *)v4 + 16))(v4);
      if ((v16 & 1) != 0)
      {
        v18 = RPCopyProxyDictionary();
        v19 = (const void *)*a2;
        *a2 = v18;
        if (v19)
          CFRelease(v19);
      }
      else
      {
        ACFULogging::getLogInstance(v15);
        ACFULogging::handleMessage();
      }
      v4 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(v10);
      ACFULogging::handleMessage();
    }
    CFRelease(v11);
  }
  else
  {
    ACFULogging::getLogInstance(0);
    ACFULogging::handleMessage();
  }
  if (cf)
    CFRelease(cf);
  if (v4)
  {
    v20 = (unint64_t *)(v4 + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
      (*(void (**)(char *))(*(_QWORD *)v4 + 16))(v4);
  }
  _Block_object_dispose(v25, 8);
  return std::promise<BOOL>::~promise(v26);
}

void sub_212B45220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,const void *a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  uint64_t *v39;
  const void **v40;

  ctu::cf::CFSharedRef<__CFURL const>::~CFSharedRef(&a23);
  _Block_object_dispose(&a24, 8);
  std::promise<BOOL>::~promise(v39);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(v40);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  return result;
}

uint64_t *__Block_byref_object_dispose__4(uint64_t a1)
{
  return std::promise<BOOL>::~promise((uint64_t *)(a1 + 48));
}

void ___Z23getReverseProxySettingsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(ACFULogging *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  std::exception_ptr v5;

  if (a2 != 2)
  {
    if (a2 == 1)
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
      v3 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a1 + 4) + 8) + 48);
      if (!v3)
        std::__throw_future_error[abi:ne180100](3u);
      std::mutex::lock((std::mutex *)(v3 + 24));
      if ((*(_BYTE *)(v3 + 136) & 1) != 0
        || (v5.__ptr_ = 0, v4 = *(_QWORD *)(v3 + 16), std::exception_ptr::~exception_ptr(&v5), v4))
      {
        std::__throw_future_error[abi:ne180100](2u);
      }
      *(_BYTE *)(v3 + 140) = 1;
      *(_DWORD *)(v3 + 136) |= 5u;
      std::condition_variable::notify_all((std::condition_variable *)(v3 + 88));
      std::mutex::unlock((std::mutex *)(v3 + 24));
    }
    else
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
    }
  }
}

void sub_212B454EC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t createPostBodyFromDictionary(const __CFAllocator *a1, const __CFDictionary *a2, const __CFData **a3)
{
  uint64_t v3;
  CFMutableStringRef Mutable;
  __CFString *v7;
  CFIndex Count;
  const void **v9;
  const void **v10;
  const void **v11;
  ACFULogging *v12;
  CFIndex v13;
  const __CFString *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  CFIndex Length;
  char *v20;
  ACFULogging *CString;
  CFDataRef v22;
  CFDataRef v23;
  std::string v25;
  std::string v26;
  void *__p[2];
  std::string::size_type v28;

  if (!a2)
  {
    ACFULogging::getLogInstance(a1);
LABEL_33:
    ACFULogging::handleMessage();
    return 0;
  }
  v3 = (uint64_t)a3;
  if (!a3)
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return v3;
  }
  Mutable = CFStringCreateMutable(a1, 0);
  if (!Mutable)
  {
    ACFULogging::getLogInstance(0);
    goto LABEL_33;
  }
  v7 = Mutable;
  Count = CFDictionaryGetCount(a2);
  v9 = (const void **)malloc(8 * Count);
  v10 = (const void **)malloc(8 * Count);
  v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      ACFULogging::getLogInstance(0);
      goto LABEL_28;
    }
    CFDictionaryGetKeysAndValues(a2, v9, v10);
    if (Count >= 1)
    {
      v13 = 0;
      while (1)
      {
        v14 = (const __CFString *)v9[v13];
        if (!v14 || !v11[v13])
          break;
        CFStringAppend(v7, v14);
        CFStringAppend(v7, CFSTR("="));
        CFStringAppend(v7, (CFStringRef)v11[v13]);
        if (v13 < Count - 1)
          CFStringAppend(v7, CFSTR("&"));
        if (Count == ++v13)
          goto LABEL_13;
      }
      ACFULogging::getLogInstance(v12);
LABEL_28:
      ACFULogging::handleMessage();
      v20 = 0;
      v3 = 0;
      CFRelease(v7);
      free(v9);
      if (!v11)
        goto LABEL_21;
LABEL_20:
      free(v11);
      goto LABEL_21;
    }
LABEL_13:
    ACFULogging::getLogInstance(v12);
    *((_BYTE *)&v25.__r_.__value_.__s + 23) = 18;
    strcpy((char *)&v25, "BasebandHttpCommon");
    v15 = std::string::append(&v25, "::", 2uLL);
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v26, "createPostBodyFromDictionary", 0x1CuLL);
    v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v28 = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    ACFULogging::handleMessageCFType();
    if (SHIBYTE(v28) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_15:
        if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_16;
LABEL_26:
        operator delete(v25.__r_.__value_.__l.__data_);
LABEL_16:
        Length = CFStringGetLength(v7);
        v20 = (char *)malloc(Length + 1);
        if (v20)
        {
          CString = (ACFULogging *)CFStringGetCString(v7, v20, Length + 1, 0x8000100u);
          if (!(_DWORD)CString)
          {
            ACFULogging::getLogInstance(CString);
            goto LABEL_40;
          }
          v22 = CFDataCreate(a1, (const UInt8 *)v20, Length);
          if (v22)
          {
            v23 = v22;
            *(_QWORD *)v3 = CFRetain(v22);
            CFRelease(v7);
            v3 = 1;
            CFRelease(v23);
            free(v9);
            if (!v11)
              goto LABEL_21;
            goto LABEL_20;
          }
        }
        ACFULogging::getLogInstance(0);
LABEL_40:
        ACFULogging::handleMessage();
        v3 = 0;
        CFRelease(v7);
        free(v9);
        if (v11)
          goto LABEL_20;
        goto LABEL_21;
      }
    }
    else if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_15;
    }
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
  ACFULogging::getLogInstance((ACFULogging *)v10);
  ACFULogging::handleMessage();
  CFRelease(v7);
  v20 = 0;
  v3 = 0;
  if (v11)
    goto LABEL_20;
LABEL_21:
  if (v20)
    free(v20);
  return v3;
}

void sub_212B45944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
  {
    operator delete(__p);
    if ((a23 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a16 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if ((a23 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a18);
  if ((a16 & 0x80000000) == 0)
LABEL_4:
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(a11);
  _Unwind_Resume(exception_object);
}

uint64_t setHttpUriEscapedValue(const __CFAllocator *a1, __CFDictionary *a2, const __CFString *a3, CFStringRef theString)
{
  uint64_t v4;
  ACFULogging *v7;
  void *value;

  value = 0;
  v4 = 1005;
  if (a2 && a3 && theString)
  {
    v7 = (ACFULogging *)escapeHttpUriString(a1, theString, (CFTypeRef *)&value);
    if ((_DWORD)v7)
    {
      v4 = (uint64_t)v7;
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
    }
    else if (value)
    {
      CFDictionarySetValue(a2, a3, value);
      v4 = 0;
    }
    else
    {
      ACFULogging::getLogInstance(v7);
      ACFULogging::handleMessage();
      v4 = 1;
    }
  }
  if (value)
    CFRelease(value);
  return v4;
}

uint64_t escapeHttpUriString(const __CFAllocator *a1, CFStringRef theString, CFTypeRef *a3)
{
  CFMutableStringRef MutableCopy;
  __CFString *v5;
  uint64_t i;
  const __CFString *v7;
  const __CFString *v8;
  CFRange v10;

  if (theString && a3)
  {
    MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
    if (MutableCopy)
    {
      v5 = MutableCopy;
      for (i = 0; i != 66; i += 2)
      {
        v7 = kEscapeTable[i];
        v8 = kEscapeTable[i + 1];
        v10.length = CFStringGetLength(v5);
        v10.location = 0;
        CFStringFindAndReplace(v5, v7, v8, v10, 0);
      }
      *a3 = CFRetain(v5);
      CFRelease(v5);
      return 0;
    }
    else
    {
      ACFULogging::getLogInstance(0);
      ACFULogging::handleMessage();
      return 1;
    }
  }
  else
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 1005;
  }
}

uint64_t setHttpBase64EncodedValue(const __CFAllocator *a1, __CFDictionary *a2, const __CFString *a3, CFDataRef theData)
{
  ACFULogging *v7;
  uint64_t v8;
  CFTypeRef cf;

  cf = 0;
  if (a2)
  {
    if (a3 && theData)
    {
      v7 = (ACFULogging *)encodeBase64(a1, theData, &cf);
      if ((_DWORD)v7)
      {
        v8 = (uint64_t)v7;
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
      }
      else if (cf)
      {
        v8 = setHttpUriEscapedValue(a1, a2, a3, (CFStringRef)cf);
      }
      else
      {
        ACFULogging::getLogInstance(v7);
        ACFULogging::handleMessage();
        v8 = 1;
      }
    }
    else
    {
      ACFULogging::getLogInstance(a1);
      ACFULogging::handleMessage();
      v8 = 1005;
    }
    if (cf)
      CFRelease(cf);
    return v8;
  }
  else
  {
    ACFULogging::getLogInstance(a1);
    ACFULogging::handleMessage();
    return 1005;
  }
}

uint64_t encodeBase64(const __CFAllocator *Length, CFDataRef theData, CFTypeRef *a3)
{
  const __CFAllocator *v5;
  unsigned __int8 *BytePtr;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  size_t v10;
  char *v11;
  void *v12;
  const void *v13;

  if (!theData)
    goto LABEL_16;
  v5 = Length;
  Length = (const __CFAllocator *)CFDataGetLength(theData);
  if (!Length)
  {
    ACFULogging::getLogInstance(0);
LABEL_17:
    ACFULogging::handleMessage();
    return 1005;
  }
  if (!a3)
  {
LABEL_16:
    ACFULogging::getLogInstance(Length);
    goto LABEL_17;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(theData);
  v7 = (char *)CFDataGetLength(theData);
  if (!BytePtr)
    goto LABEL_12;
  v8 = v7;
  if ((int)v7 < 1)
    goto LABEL_12;
  v9 = v7 / 3;
  if ((_DWORD)v7 != 3 * (v7 / 3))
    ++v9;
  v10 = (4 * v9) | 1;
  v7 = (char *)malloc(v10);
  if (v7)
  {
    v11 = v7;
    b64_ntop(BytePtr, v8, v7, v10);
    v12 = (void *)strlen(v11);
    if ((_DWORD)v12)
    {
      v12 = (void *)CFStringCreateWithBytes(v5, (const UInt8 *)v11, (int)v12, 0x8000100u, 0);
      if (v12)
      {
        v13 = v12;
        *a3 = CFRetain(v12);
        free(v11);
        CFRelease(v13);
        return 0;
      }
    }
    ACFULogging::getLogInstance((ACFULogging *)v12);
    ACFULogging::handleMessage();
    free(v11);
  }
  else
  {
LABEL_12:
    ACFULogging::getLogInstance((ACFULogging *)v7);
    ACFULogging::handleMessage();
  }
  return 1;
}

uint64_t decodeBase64(const __CFAllocator *Length, CFStringRef theString, CFTypeRef *a3)
{
  const __CFAllocator *v5;
  int v6;
  size_t v7;
  char *v8;
  char *v9;
  uint64_t CString;
  char *v11;
  int v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  CFDataRef v18;
  CFDataRef v19;

  if (!theString)
    goto LABEL_29;
  v5 = Length;
  Length = (const __CFAllocator *)CFStringGetLength(theString);
  if (!Length)
  {
    ACFULogging::getLogInstance(0);
LABEL_30:
    ACFULogging::handleMessage();
    return 1005;
  }
  if (!a3)
  {
LABEL_29:
    ACFULogging::getLogInstance(Length);
    goto LABEL_30;
  }
  v6 = CFStringGetLength(theString);
  v7 = v6 + 1;
  v8 = (char *)malloc(v7);
  if (v8)
  {
    v9 = v8;
    CString = CFStringGetCString(theString, v8, v7, 0x8000100u);
    if (!(_DWORD)CString)
      goto LABEL_32;
    if (v6 < -1)
    {
      CString = strlen(v9);
      v11 = v9;
      if (CString < 1)
        goto LABEL_24;
    }
    else
    {
      CString = v7;
      v11 = v9;
      if (!(_DWORD)v7)
        goto LABEL_24;
    }
    v12 = 0;
    v13 = 0;
    v14 = v9;
    v11 = v9;
    do
    {
      v16 = *v14;
      if ((_DWORD)v16 == 10 || (_DWORD)v16 == 13)
      {
        v15 = 0;
        v12 = 0;
      }
      else
      {
        v15 = b64decode_table[v16];
        if ((_DWORD)v15 == -1)
        {
          v15 = v13;
        }
        else
        {
          switch(v12)
          {
            case 0:
              v12 = 1;
              break;
            case 1:
              *v11++ = (4 * v13) | (v15 >> 4) & 3;
              v12 = 2;
              break;
            case 2:
              *v11++ = (16 * v13) | (v15 >> 2) & 0xF;
              v12 = 3;
              break;
            case 3:
              v12 = 0;
              *v11++ = v15 | ((_BYTE)v13 << 6);
              break;
            default:
              break;
          }
        }
      }
      ++v14;
      v13 = v15;
    }
    while (v14 < &v9[CString]);
LABEL_24:
    *v11 = 0;
    if ((int)v11 - (int)v9 > 0)
    {
      v18 = CFDataCreate(v5, (const UInt8 *)v9, ((_DWORD)v11 - (_DWORD)v9));
      if (v18)
      {
        v19 = v18;
        *a3 = CFRetain(v18);
        free(v9);
        CFRelease(v19);
        return 0;
      }
      ACFULogging::getLogInstance(0);
      goto LABEL_35;
    }
LABEL_32:
    ACFULogging::getLogInstance((ACFULogging *)CString);
LABEL_35:
    ACFULogging::handleMessage();
    free(v9);
    return 1;
  }
  ACFULogging::getLogInstance(0);
  ACFULogging::handleMessage();
  return 1;
}

void BBUICEInitializer::~BBUICEInitializer(BBUICEInitializer *this)
{
  uint64_t v1;

  *(_QWORD *)this = &unk_24CE81DA0;
  v1 = *((_QWORD *)this + 2);
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

{
  uint64_t v2;

  *(_QWORD *)this = &unk_24CE81DA0;
  v2 = *((_QWORD *)this + 2);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(this);
}

uint64_t BBUICEInitializer::prepare(uint64_t a1, uint64_t a2, int a3)
{
  const char *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_5;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_5;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v5 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v6 = BBUStageAsString(a3);
    _BBULog(4, 0, v5, "", "Preparing at %s with reset requested %u\n", v7, v8, v9, v6);
  }
LABEL_5:
  if (a3 != 2)
    return 0;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
        goto LABEL_9;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
      {
LABEL_9:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v10 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
          _BBULog(4, 0, v10, "", "Powering on modem. It is NOOP if BB is already on\n", v11, v12, v13, v20);
        }
      }
    }
    TelephonyBasebandPowerOnModem();
    result = 0;
    *(_BYTE *)(a1 + 40) = 0;
    return result;
  }
  *(_BYTE *)(a1 + 40) = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "%s: Start resetting modem", "prepare");
  v15 = TelephonyBasebandResetModem();
  result = 0;
  if ((v15 & 1) == 0)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      result = 73;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return result;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      result = 73;
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        return result;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v16 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(4, 0, v16, "", "Failed to prep\n", v17, v18, v19, v21);
      return 73;
    }
  }
  return result;
}

uint64_t BBUICEInitializer::finalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v10;

  if (a4 > 4
    || ((1 << a4) & 0x1A) == 0
    || (result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 240))(a1, a2), !(_DWORD)result))
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 232))(a1, a2, a4);
    if (!(_DWORD)result)
    {
      v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 224))(a1, a2, a5, v10);
      if (!(_DWORD)result)
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 280))(a1, a2, 0, 0);
    }
  }
  return result;
}

uint64_t BBUICEInitializer::crashBaseband(uint64_t a1)
{
  capabilities::coredump *v2;

  TelephonyBasebandGetReset();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "modem %s reset", "is not");
  if (capabilities::coredump::supportsGPIOSignalling(v2))
  {
    TelephonyBasebandSetModemCoredumpGPIO();
    usleep(0xF4240u);
    TelephonyBasebandSetModemCoredumpGPIO();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Coredump GPIO signalled");
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "resetting modem... may take several seconds for safe reset");
  TelephonyBasebandResetModem();
  return 0;
}

uint64_t BBUICEInitializer::getVersion(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  char v4;
  void *exception;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 67, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/ICE/BBUICEInitializer.cpp", 0xA0u, (ctu::LogMessageBuffer *)"Assertion failure(transport && \"TelephonyUtilTransport Error.\")", v7, v8, v9, v10);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *a3 = 0;
  IceAriGetContext();
  v4 = KTLGetFirmwareVersion();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Baseband firmware version size is: %u", 128);
  if ((v4 & 1) != 0)
    return 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get baseband firmware version.");
  return 62;
}

void sub_212B4681C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::gatherPersonalizationParameters(BBUFeedback **a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  int v7;
  void **v8;
  void **v9;
  void **v10;
  CFIndex v11;
  _QWORD *v12;
  const __CFAllocator *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  CFIndex v18;
  _QWORD *v19;
  BBUFeedback *v20;
  void **v21;
  int v22;
  int v23;
  int v24;
  const char *v25;
  BBUFeedback *v26;
  void **v27;
  BBUFeedback *v28;
  void **v29;
  BBUFeedback *v30;
  int v31;
  uint64_t v32;
  void *__p[2];
  char v35;
  void *v36[3];
  void *v37[3];
  void *v38[3];
  BBUICEPersonalizationParameters::ICEChipID *v39[2];
  _OWORD v40[2];
  __int128 v41;
  _OWORD v42[2];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42[0] = v6;
  v42[1] = v6;
  v40[1] = v6;
  v41 = v6;
  *(_OWORD *)v39 = v6;
  v40[0] = v6;
  IceAriGetContext();
  v7 = KTLGetPersonalizationInfo();
  memset(v38, 170, sizeof(v38));
  ctu::hex((ctu *)v40, (const void *)HIDWORD(v39[0]));
  memset(v37, 170, sizeof(v37));
  ctu::hex((ctu *)&v41, (const void *)LODWORD(v39[1]));
  memset(v36, 170, sizeof(v36));
  ctu::hex((ctu *)v42, (const void *)HIDWORD(v39[1]));
  v8 = v38;
  if (SHIBYTE(v38[2]) < 0)
    v8 = (void **)v38[0];
  v9 = v37;
  if (SHIBYTE(v37[2]) < 0)
    v9 = (void **)v37[0];
  if (SHIBYTE(v36[2]) >= 0)
    v10 = v36;
  else
    v10 = (void **)v36[0];
  BBUFeedback::handleComment(a1[1], "Personalization info: \n \t\t\t\t\t\t\t chipId     : 0x%x \n \t\t\t\t\t\t\t nonceSize  : %u \n \t\t\t\t\t\t\t snumSize   : %u \n \t\t\t\t\t\t\t pkHashSize : %u \n \t\t\t\t\t\t\t nonce      : %s \n \t\t\t\t\t\t\t snum       : %s \n \t\t\t\t\t\t\t pkHash     : %s \n", LODWORD(v39[0]), HIDWORD(v39[0]), LODWORD(v39[1]), HIDWORD(v39[1]), (const char *)v8, (const char *)v9, (const char *)v10);
  if (!v7)
  {
    BBUFeedback::handleComment(a1[1], "Failed to gather personalization information.");
    v32 = 64;
    if (SHIBYTE(v36[2]) < 0)
      goto LABEL_39;
LABEL_36:
    if (SHIBYTE(v37[2]) < 0)
      goto LABEL_40;
    goto LABEL_37;
  }
  v11 = HIDWORD(v39[0]);
  v12 = operator new(0x10uLL);
  *v12 = off_24CE863A8;
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v40, v11);
  v14 = *(_QWORD *)(a3 + 8);
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  *(_QWORD *)(a3 + 8) = v12;
  v15 = BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber((const UInt8 *)&v41, (const unsigned __int8 *)(8 * LODWORD(v39[1])));
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 16))(a3, v15);
  v16 = BBUICEPersonalizationParameters::ICEChipID::createFromChipID((BBUICEPersonalizationParameters::ICEChipID *)LODWORD(v39[0]));
  v17 = *(_QWORD *)(a3 + 16);
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  *(_QWORD *)(a3 + 16) = v16;
  v18 = HIDWORD(v39[1]);
  v19 = operator new(0x10uLL);
  *v19 = off_24CE864C8;
  v19[1] = CFDataCreate(v13, (const UInt8 *)v42, v18);
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 24))(a3, v19);
  if (v15)
  {
    v20 = a1[1];
    v21 = __p;
    (*(void (**)(void **__return_ptr, _QWORD *))(*v15 + 24))(__p, v15);
    if (v35 < 0)
      v21 = (void **)__p[0];
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
    {
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_18;
    }
    else
    {
      dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
      if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
        goto LABEL_18;
    }
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_18:
    v22 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
    v23 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
    v24 = (*(uint64_t (**)(_QWORD *))(*v16 + 24))(v16);
    if (v22 | v23)
      v25 = (const char *)v21;
    else
      v25 = "<< SNUM >>";
    BBUFeedback::handleComment(v20, "   SNUM: 0x%s / CHIPID: 0x%08x", v25, v24);
    if (v35 < 0)
      operator delete(__p[0]);
  }
  v26 = a1[1];
  (*(void (**)(void **__return_ptr, _QWORD *))(*v12 + 24))(__p, v12);
  if (v35 >= 0)
    v27 = __p;
  else
    v27 = (void **)__p[0];
  BBUFeedback::handleComment(v26, "   NONCE: %s", (const char *)v27);
  if (v35 < 0)
    operator delete(__p[0]);
  v28 = a1[1];
  (*(void (**)(void **__return_ptr, _QWORD *))(*v19 + 24))(__p, v19);
  if (v35 >= 0)
    v29 = __p;
  else
    v29 = (void **)__p[0];
  BBUFeedback::handleComment(v28, "   PUBLIC_KEY_HASH: %s", (const char *)v29);
  if (v35 < 0)
    operator delete(__p[0]);
  v30 = a1[1];
  v31 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a3 + 24) + 24))(*(_QWORD *)(a3 + 24));
  BBUFeedback::handleComment(v30, "   CertID: %u", v31);
  v32 = (*((uint64_t (**)(BBUFeedback **, uint64_t, uint64_t, _QWORD))*a1 + 26))(a1, a2, a3, 0);
  if ((SHIBYTE(v36[2]) & 0x80000000) == 0)
    goto LABEL_36;
LABEL_39:
  operator delete(v36[0]);
  if (SHIBYTE(v37[2]) < 0)
  {
LABEL_40:
    operator delete(v37[0]);
    if (SHIBYTE(v38[2]) < 0)
      goto LABEL_41;
    return v32;
  }
LABEL_37:
  if (SHIBYTE(v38[2]) < 0)
LABEL_41:
    operator delete(v38[0]);
  return v32;
}

void sub_212B46CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if (a34 < 0)
      goto LABEL_7;
  }
  else if (a34 < 0)
  {
LABEL_7:
    operator delete(a29);
    if ((a40 & 0x80000000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((a40 & 0x80000000) == 0)
LABEL_9:
    _Unwind_Resume(a1);
LABEL_8:
  operator delete(a35);
  goto LABEL_9;
}

uint64_t BBUICEInitializer::overridePersonalizationParameters(BBUFeedback **this, BBUPersonalizationParameters *a2, const __CFDictionary *a3)
{
  CFTypeID v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  BBUFeedback *v10;
  int v11;
  int v12;
  CFTypeID v13;
  void *v14;
  _QWORD *v15;
  BBUFeedback *v16;
  const char *v17;
  CFTypeID v18;
  void *v19;
  _QWORD *v20;
  BBUFeedback *v21;
  const char *v22;
  CFTypeID v23;
  const __CFData *v24;
  const __CFData **v25;
  uint64_t v26;
  BBUFeedback *v27;
  void **v28;
  void *__p[2];
  char v31;
  void *value;

  value = (void *)0xAAAAAAAAAAAAAAAALL;
  BBUFeedback::handleComment(this[1], "Overriding with preflight information:");
  if (CFDictionaryGetValueIfPresent(a3, CFSTR("ChipID"), (const void **)&value))
  {
    v6 = CFGetTypeID(value);
    if (v6 == CFNumberGetTypeID())
    {
      v7 = value;
      v8 = operator new(0x10uLL);
      *v8 = off_24CE86438;
      v8[1] = v7;
      CFRetain(v7);
      v9 = *((_QWORD *)a2 + 2);
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      *((_QWORD *)a2 + 2) = v8;
      v10 = this[1];
      v11 = (*(uint64_t (**)(_QWORD *))(*v8 + 24))(v8);
      v12 = (*(uint64_t (**)(_QWORD *))(*v8 + 24))(v8);
      BBUFeedback::handleComment(v10, "   ChipID: %u (0x%08x)", v11, v12);
    }
  }
  if (!CFDictionaryGetValueIfPresent(a3, CFSTR("ChipSerialNo"), (const void **)&value))
    goto LABEL_12;
  v13 = CFGetTypeID(value);
  if (v13 != CFDataGetTypeID())
    goto LABEL_12;
  v14 = value;
  v15 = operator new(0x10uLL);
  *v15 = off_24CE863D8;
  v15[1] = v14;
  CFRetain(v14);
  (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a2 + 16))(a2, v15);
  v16 = this[1];
  (*(void (**)(void **__return_ptr, _QWORD *))(*v15 + 24))(__p, v15);
  v17 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
  BBUFeedback::handleComment(v16, "   ChipSerialNo: %s", v17);
  if (v31 < 0)
  {
    operator delete(__p[0]);
    if (!CFDictionaryGetValueIfPresent(a3, CFSTR("CertHash"), (const void **)&value))
      goto LABEL_20;
  }
  else
  {
LABEL_12:
    if (!CFDictionaryGetValueIfPresent(a3, CFSTR("CertHash"), (const void **)&value))
      goto LABEL_20;
  }
  v18 = CFGetTypeID(value);
  if (v18 == CFDataGetTypeID())
  {
    v19 = value;
    v20 = operator new(0x10uLL);
    *v20 = off_24CE864C8;
    v20[1] = v19;
    CFRetain(v19);
    (*(void (**)(BBUPersonalizationParameters *, _QWORD *))(*(_QWORD *)a2 + 24))(a2, v20);
    v21 = this[1];
    (*(void (**)(void **__return_ptr, _QWORD *))(*v20 + 24))(__p, v20);
    v22 = v31 >= 0 ? (const char *)__p : (const char *)__p[0];
    BBUFeedback::handleComment(v21, "   CertHash: %s", v22);
    if (v31 < 0)
      operator delete(__p[0]);
  }
LABEL_20:
  if (CFDictionaryGetValueIfPresent(a3, CFSTR("Nonce"), (const void **)&value))
  {
    v23 = CFGetTypeID(value);
    if (v23 == CFDataGetTypeID())
    {
      v24 = (const __CFData *)value;
      v25 = (const __CFData **)operator new(0x10uLL);
      *v25 = (const __CFData *)off_24CE863A8;
      v25[1] = v24;
      CFRetain(v24);
      v26 = *((_QWORD *)a2 + 1);
      if (v26)
        (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
      *((_QWORD *)a2 + 1) = v25;
      v27 = this[1];
      BBUICEPersonalizationParameters::ICENonce::getAsString(v25, (const __CFData *)__p);
      if (v31 >= 0)
        v28 = __p;
      else
        v28 = (void **)__p[0];
      BBUFeedback::handleComment(v27, "   Nonce: %s", (const char *)v28);
      if (v31 < 0)
        operator delete(__p[0]);
    }
  }
  return 0;
}

void sub_212B470DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

capabilities::updater *BBUICEInitializer::gatherProvisioningParameters(BBUFeedback **a1, capabilities::euicc *a2, uint64_t a3)
{
  capabilities::updater *v6;

  v6 = (capabilities::updater *)(*((uint64_t (**)(BBUFeedback **))*a1 + 31))(a1);
  if (capabilities::updater::hasMEID(v6) && !(_DWORD)v6)
    v6 = (capabilities::updater *)(*((uint64_t (**)(BBUFeedback **, capabilities::euicc *, uint64_t))*a1 + 32))(a1, a2, a3);
  eUICC::getEID(a2, a3, a1[1]);
  return v6;
}

uint64_t BBUICEInitializer::getProvisioningStatus(BBUFeedback **a1, uint64_t a2, uint64_t a3, _BYTE *a4, BOOL *a5)
{
  uint64_t result;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  BOOL v14;
  const char *v15;
  BBUFeedback *v16;
  const char *StateAsString;

  *a4 = 1;
  if ((*((unsigned int (**)(BBUFeedback **, uint64_t, uint64_t, _QWORD))*a1 + 26))(a1, a2, a3, 0))
  {
    result = 0;
    *a5 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(a3 + 48);
    if (v10)
    {
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 24))(v10);
      v12 = v11;
      v13 = v11 == 1;
      v14 = 0;
      v15 = "Ignoring ART mismatch";
      switch(v11)
      {
        case 0:
        case 2:
          v14 = v11 != 2;
          v15 = "mature";
          break;
        case 1:
          *a4 = 0;
          v15 = "mature";
          v14 = 1;
          break;
        case 3:
          break;
        default:
          v14 = 0;
          v15 = "bringup";
          break;
      }
      *a5 = v14;
      BBUFeedback::handleComment(a1[1], v15);
      v16 = a1[1];
      StateAsString = (const char *)ETLProvisionGetStateAsString();
      BBUFeedback::handleComment(v16, "Provisioning state %s(%u), mismatched %u", StateAsString, v12, v13);
      return 0;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

uint64_t BBUICEInitializer::gatherManifestInfo(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  BBUFeedback **v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  void **v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  capabilities::updater *v23;
  int DigestType;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  CFIndex v30;
  _QWORD *v31;
  uint64_t v32;
  void *exception;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  void *v38[3];
  void *__p[4];
  BBUICEPersonalizationParameters::ICEKeyStatus *v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _DWORD v48[38];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v47 = 0u;
  memset(v48, 0, 144);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)v40 = 0u;
  v5 = (BBUFeedback **)(a1 + 8);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Getting manifest information from BB");
  IceAriGetContext();
  v6 = KTLGetManifestStatus();
  BBUFeedback::handleComment(*v5, "Manifest status: \n\t\t\t  status             : %u\n \t\t\t  provision_status   : %u\n \t\t\t  fatp_cal_status    : %u\n \t\t\t  calibration_status : %u\n \t\t\t  skey_hash length   : %u", LODWORD(v40[0]), WORD2(v40[0]), HIWORD(v40[0]), LOWORD(v40[1]), WORD1(v40[1]));
  memset(__p, 170, 24);
  ctu::hex((ctu *)((unint64_t)v40 | 0xC), (const void *)*(unsigned __int16 *)((unint64_t)v40 | 0xA));
  v7 = *(unsigned __int16 *)((unint64_t)v40 | 0xA);
  if (*(_WORD *)((unint64_t)v40 | 0xA))
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v8 + v7;
      if (v10 >= 16)
        v10 = 16;
      ctu::hex((ctu *)(((unint64_t)v40 | 0xC) + v9), (const void *)v10);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)v38;
      __p[2] = v38[2];
      if (SHIBYTE(v38[2]) >= 0)
        v11 = __p;
      else
        v11 = (void **)v38[0];
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  skey_hash    [0x%02x]: %s", v9, (const char *)v11);
      v9 += 16;
      v7 = WORD1(v40[1]);
      v8 -= 16;
    }
    while (v9 < WORD1(v40[1]));
  }
  memset(v38, 170, sizeof(v38));
  ctu::hex((ctu *)((char *)&v48[3] + 2), (const void *)LOWORD(v48[3]));
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  ckey_hash length   : %u", LOWORD(v48[3]));
  v12 = v38;
  if (SHIBYTE(v38[2]) < 0)
    v12 = (void **)v38[0];
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "  ckey_hash          : %s", (const char *)v12);
  if (!v6)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to gather manifest info.");
    v14 = 63;
    if (SHIBYTE(v38[2]) < 0)
      goto LABEL_47;
    goto LABEL_17;
  }
  v13 = 0;
  switch(WORD2(v40[0]))
  {
    case 0:
    case 0x40:
      break;
    case 4:
    case 0xF:
      v13 = 1;
      break;
    case 6:
    case 0x1C:
    case 0x1D:
      v13 = 2;
      break;
    default:
      v13 = 3;
      break;
  }
  v16 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)v13);
  v17 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)WORD2(v40[0]));
  v18 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)LOWORD(v40[1]));
  v19 = BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus((BBUICEPersonalizationParameters::ICEKeyStatus *)HIWORD(v40[0]));
  v20 = a3[6];
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  a3[6] = v16;
  v21 = a3[8];
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  a3[8] = v17;
  v22 = a3[9];
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  a3[9] = v18;
  v23 = (capabilities::updater *)a3[10];
  if (v23)
    v23 = (capabilities::updater *)(*(uint64_t (**)(capabilities::updater *))(*(_QWORD *)v23 + 8))(v23);
  a3[10] = v19;
  if (WORD2(v40[0]) > 0xFu || ((1 << SBYTE4(v40[0])) & 0x8011) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "BB has no provisioning manifest");
    v14 = 0;
    if (SHIBYTE(v38[2]) < 0)
      goto LABEL_47;
    goto LABEL_17;
  }
  DigestType = capabilities::updater::getDigestType(v23);
  if (DigestType == 1)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        goto LABEL_42;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
        goto LABEL_42;
    }
    if (gBBULogVerbosity < 0)
      goto LABEL_42;
    v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v29 = "SHA256 detected\n";
    goto LABEL_41;
  }
  if (DigestType != 2)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 63, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Initialization/ICE/BBUICEInitializer.cpp", 0x1CBu, (ctu::LogMessageBuffer *)"Assertion failure(false && \"Unsupported hash digest type.\")", v34, v35, v36, v37);
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_35;
  }
  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) != 0)
  {
LABEL_35:
    if (gBBULogVerbosity < 0)
      goto LABEL_42;
    v25 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    v29 = "SHA384 detected\n";
LABEL_41:
    _BBULog(4, 0, v25, "", v29, v26, v27, v28, v37);
  }
LABEL_42:
  v30 = WORD1(v40[1]);
  v31 = operator new(0x10uLL);
  *v31 = off_24CE86498;
  v31[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)((unint64_t)v40 | 0xC), v30);
  v32 = a3[7];
  if (v32)
    (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
  v14 = 0;
  a3[7] = v31;
  if (SHIBYTE(v38[2]) < 0)
  {
LABEL_47:
    operator delete(v38[0]);
    if (SHIBYTE(__p[2]) < 0)
      goto LABEL_48;
    return v14;
  }
LABEL_17:
  if (SHIBYTE(__p[2]) < 0)
LABEL_48:
    operator delete(__p[0]);
  return v14;
}

void sub_212B477FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;

  __cxa_free_exception(v25);
  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::pingAndCheckForResponse(uint64_t a1)
{
  uint64_t v2;
  int v3;
  unsigned __int8 v5;

  v5 = 0;
  v2 = TelephonyUtilSystemMachTime();
  while (1)
  {
    IceAriGetContext();
    v3 = KTLPing();
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "ping returned %d, psReady %u", v3, v5);
    if ((v3 & 1) != 0)
      break;
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Retrying ping\n");
    usleep(0x7A120u);
    if ((unint64_t)(TelephonyUtilSystemMachTime() - v2) >= 0x5DD)
    {
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Timeout on ping attemps\n");
      return 46;
    }
  }
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "ping success but PS Ready false, treating as not ready and sleeping 1s");
  usleep(0xF4240u);
  return 6;
}

void sub_212B47B14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t BBUICEInitializer::restoreNVItems(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  char v6;

  result = 0;
  switch(a3)
  {
    case 1:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to Factory defaults");
      IceAriGetContext();
      v6 = KTLBspSetNvItemsToState();
      result = 0;
      if ((v6 & 1) == 0)
        goto LABEL_10;
      break;
    case 2:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to Shipping defaults");
      IceAriGetContext();
      if ((KTLBspSetNvItemsToState() & 1) == 0)
        goto LABEL_10;
      result = 0;
      break;
    case 4:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to FATP defaults");
      IceAriGetContext();
      if ((KTLBspSetNvItemsToState() & 1) == 0)
        goto LABEL_10;
      result = 0;
      break;
    case 5:
      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Restoring NV items to OQC defaults");
      IceAriGetContext();
      if ((KTLBspSetNvItemsToState() & 1) != 0)
      {
        result = 0;
      }
      else
      {
LABEL_10:
        BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to restore NV items to state: %d", a3);
        result = 58;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t BBUICEInitializer::fusingCheck(uint64_t a1)
{
  capabilities::updater *FusingState;

  BBUFeedback::handleBeginQuickStep(*(BBUFeedback **)(a1 + 8), "Fusing check");
  IceAriGetContext();
  FusingState = (capabilities::updater *)KTLSecGetFusingState();
  if ((_DWORD)FusingState)
    capabilities::updater::shouldAllowUnfused(FusingState);
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8), 24);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Fusing state: %d", -1431655766);
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed fusing check.");
  return 24;
}

uint64_t BBUICEInitializer::updateIMEISvn(uint64_t a1, uint64_t a2, unsigned int a3)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int Svn;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  char v38;
  char v39;

  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI-SVN Check and Update: %d", a3);
  if (a3 == -1)
    return 0;
  if (a3 > 0x62)
    return 2;
  if (gBBULogMaskGet(void)::once == -1)
  {
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
      goto LABEL_8;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
      goto LABEL_8;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v6 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v6, "", "Getting current SVN\n", v7, v8, v9, v38);
  }
LABEL_8:
  IceAriGetContext();
  Svn = KTLCpsGetSvn();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Current SVN: %d", 170);
  if (!Svn)
  {
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
        goto LABEL_18;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 0x10) == 0)
        goto LABEL_18;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v17 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      _BBULog(20, 0, v17, "", "Trying to set SVN\n", v18, v19, v20, v39);
    }
LABEL_18:
    IceAriGetContext();
    v21 = KTLCpsSetSvn();
    if (gBBULogMaskGet(void)::once != -1)
    {
      v36 = v21;
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      v21 = v36;
    }
    v22 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
    if (v21)
    {
      if (v22)
      {
        v23 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
        _BBULog(20, 0, v23, "", "SVN set: %d\n", v24, v25, v26, a3);
      }
      return 0;
    }
    goto LABEL_32;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  v11 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (a3 == 170)
  {
    if (v11)
    {
      v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v16 = "No need to update SVN\n";
LABEL_30:
      _BBULog(20, 0, v12, "", v16, v13, v14, v15, v39);
      return 0;
    }
    return 0;
  }
  if (v11)
  {
    v27 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v27, "", "Trying to set new SVN\n", v28, v29, v30, v39);
  }
  IceAriGetContext();
  v31 = KTLCpsSetSvn();
  if (gBBULogMaskGet(void)::once != -1)
  {
    v37 = v31;
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v31 = v37;
  }
  v22 = (gBBULogVerbosity >= 0) & (*(unsigned __int8 *)(gBBULogMaskGet(void)::sBBULogMask + 2) >> 4);
  if (v31)
  {
    if (v22)
    {
      v12 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
      v16 = "SVN changed from %d to %d\n";
      v39 = -86;
      goto LABEL_30;
    }
    return 0;
  }
LABEL_32:
  if (v22)
  {
    v32 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(20, 0, v32, "", "Could not set SVN\n", v33, v34, v35, v39);
  }
  return 59;
}

uint64_t BBUICEInitializer::getIMEI(uint64_t a1, uint64_t a2, std::string **a3)
{
  __int128 v5;
  int v6;
  capabilities::updater *v7;
  size_t v8;
  _BYTE *v9;
  uint64_t v11;
  uint64_t v12;
  std::string *valid;
  std::string *v14;
  std::string *v15;
  int v16;
  int v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  std::string *v22;
  std::string *v23;
  std::string *v24;
  void *__p[3];
  _BYTE __dst[24];
  __int128 __src;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = v5;
  v31 = v5;
  v28 = v5;
  v29 = v5;
  __src = v5;
  IceAriGetContext();
  v6 = KTLGetIMEI_V2();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI1: %s", (const char *)&__src);
  if (capabilities::updater::supportsDualIMEIProvision(v7))
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "IMEI2: %s", (const char *)&v28 + 4);
  if (!v6)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get IMEI.");
    return 30;
  }
  memset(__dst, 170, sizeof(__dst));
  v8 = (v28 - 1);
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v9 = operator new(v11 + 1);
    *(_QWORD *)&__dst[16] = v12 | 0x8000000000000000;
    *(_QWORD *)__dst = v9;
    *(_QWORD *)&__dst[8] = v8;
    goto LABEL_11;
  }
  __dst[23] = v28 - 1;
  v9 = __dst;
  if ((_DWORD)v28 != 1)
LABEL_11:
    memcpy(v9, &__src, v8);
  v9[v8] = 0;
  valid = (std::string *)KTLIsValidIMEIString();
  if ((_DWORD)valid)
  {
    valid = (std::string *)operator new(0x18uLL);
    v14 = valid;
    if ((__dst[23] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(valid, *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
    }
    else
    {
      *(_OWORD *)&valid->__r_.__value_.__l.__data_ = *(_OWORD *)__dst;
      valid->__r_.__value_.__r.__words[2] = *(_QWORD *)&__dst[16];
    }
    v15 = *a3;
    if (*a3)
    {
      if (SHIBYTE(v15->__r_.__value_.__r.__words[2]) < 0)
        operator delete(v15->__r_.__value_.__l.__data_);
      operator delete(v15);
    }
    *a3 = v14;
  }
  v16 = capabilities::updater::supportsDualIMEIProvision((capabilities::updater *)valid);
  if (DWORD1(v29))
    v17 = v16;
  else
    v17 = 0;
  if (v17 != 1)
    goto LABEL_42;
  v18 = (DWORD1(v29) - 1);
  memset(__p, 170, sizeof(__p));
  if (DWORD1(v29) >= 0x18)
  {
    v20 = (v18 & 0xFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v20 = v18 | 7;
    v21 = v20 + 1;
    v19 = operator new(v20 + 1);
    __p[1] = (void *)v18;
    __p[2] = (void *)(v21 | 0x8000000000000000);
    __p[0] = v19;
    goto LABEL_31;
  }
  HIBYTE(__p[2]) = BYTE4(v29) - 1;
  v19 = __p;
  if (DWORD1(v29) != 1)
LABEL_31:
    memcpy(v19, (char *)&v28 + 4, v18);
  *((_BYTE *)v19 + v18) = 0;
  if (KTLIsValidIMEIString())
  {
    v22 = (std::string *)operator new(0x18uLL);
    v23 = v22;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v22, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v22->__r_.__value_.__r.__words[2] = (std::string::size_type)__p[2];
    }
    v24 = a3[1];
    if (v24)
    {
      if (SHIBYTE(v24->__r_.__value_.__r.__words[2]) < 0)
        operator delete(v24->__r_.__value_.__l.__data_);
      operator delete(v24);
    }
    a3[1] = v23;
  }
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    if ((__dst[23] & 0x80000000) == 0)
      return 0;
    goto LABEL_43;
  }
LABEL_42:
  if ((__dst[23] & 0x80000000) != 0)
LABEL_43:
    operator delete(*(void **)__dst);
  return 0;
}

void sub_212B48400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  operator delete(v22);
  if (a16 < 0)
    operator delete(__p);
  if (a22 < 0)
  {
    operator delete(a17);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::getMEID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  _QWORD *v6;
  uint64_t v8;
  void *__p[2];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0uLL;
  IceAriGetContext();
  v5 = KTLGetMEID();
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "MEID: %s", (const char *)&v10);
  if (v5)
  {
    __p[0] = (void *)v10;
    *(void **)((char *)__p + 6) = *(void **)((char *)&v10 + 6);
    HIWORD(__p[1]) = -22016;
    if (KTLIsValidMEIDString())
    {
      v6 = operator new(0x18uLL);
      *(_OWORD *)v6 = *(_OWORD *)__p;
      v6[2] = 0xEAAAAAAAAAAAAAALL;
      v8 = *(_QWORD *)(a3 + 16);
      if (v8)
      {
        if (*(char *)(v8 + 23) < 0)
          operator delete(*(void **)v8);
        operator delete((void *)v8);
      }
      *(_QWORD *)(a3 + 16) = v6;
    }
    return 0;
  }
  else
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed to get MEID.");
    return 29;
  }
}

void sub_212B485BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  operator delete(v15);
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::getCarrierID()
{
  return 3;
}

uint64_t BBUICEInitializer::performNVSync(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __int128 v8;
  BBUPartitionManager *v9;
  BBUPartitionManager *v10;
  _QWORD *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::string *p_p;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(const char *, const char *, char *);
  capabilities::radio *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(void);
  uint64_t (*v59)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v60)(void);
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v63)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  FILE *v88;
  const char *v89;
  size_t v90;
  char v92;
  char v93;
  std::string __p;
  _OWORD v95[23];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)&v95[20] + 8) = v8;
  *(_OWORD *)((char *)&v95[21] + 8) = v8;
  *(_OWORD *)((char *)&v95[18] + 8) = v8;
  *(_OWORD *)((char *)&v95[19] + 8) = v8;
  *(_OWORD *)((char *)&v95[16] + 8) = v8;
  *(_OWORD *)((char *)&v95[17] + 8) = v8;
  *((_QWORD *)&v95[22] + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)&v95[15] + 8) = v8;
  *(_OWORD *)((char *)&v95[14] + 8) = v8;
  *(_OWORD *)((char *)&v95[13] + 8) = v8;
  *(_OWORD *)((char *)&v95[12] + 8) = v8;
  *(_OWORD *)((char *)&v95[11] + 8) = v8;
  *(_OWORD *)((char *)&v95[10] + 8) = v8;
  *(_OWORD *)((char *)&v95[9] + 8) = v8;
  *(_OWORD *)((char *)&v95[8] + 8) = v8;
  *(_OWORD *)((char *)&v95[7] + 8) = v8;
  *(_OWORD *)((char *)&v95[6] + 8) = v8;
  *(_OWORD *)((char *)&v95[5] + 8) = v8;
  *(_OWORD *)((char *)&v95[4] + 8) = v8;
  *(_OWORD *)((char *)&v95[3] + 8) = v8;
  *(_OWORD *)((char *)&v95[2] + 8) = v8;
  *(_OWORD *)((char *)&v95[1] + 8) = v8;
  *(_OWORD *)((char *)v95 + 8) = v8;
  *(_QWORD *)&v95[0] = 0;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Performing FS sync");
  memset(&__p, 170, sizeof(__p));
  pthread_mutex_lock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  v9 = (BBUPartitionManager *)off_253D31E68;
  if (!off_253D31E68)
  {
    v10 = (BBUPartitionManager *)operator new(0x18uLL);
    BBUPartitionManager::BBUPartitionManager(v10);
    v11 = operator new(0x20uLL);
    *v11 = &unk_24CE85728;
    v11[1] = 0;
    v11[2] = 0;
    v11[3] = v10;
    v12 = (std::__shared_weak_count *)off_253D31E70;
    off_253D31E68 = v10;
    off_253D31E70 = v11;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v9 = (BBUPartitionManager *)off_253D31E68;
  }
  v15 = (std::__shared_weak_count *)off_253D31E70;
  if (off_253D31E70)
  {
    v16 = (unint64_t *)((char *)off_253D31E70 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  BBUPartitionManager::getBBUFSPath(v9, &__p);
  if (v15)
  {
    v24 = (unint64_t *)&v15->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if (p_p)
        goto LABEL_19;
LABEL_27:
      _BBUFSDebugPrint("BBUFSServerParametersInit", "invalid parameters specified: parameters = %p, destination = %s\n", v18, v19, v20, v21, v22, v23, (char)v95);
      goto LABEL_28;
    }
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (!p_p)
    goto LABEL_27;
LABEL_19:
  memset(v95, 0, sizeof(v95));
  v27 = strnlen((const char *)p_p, 0x100uLL);
  v28 = TelephonyUtilStrlcpy();
  if (v28 == v27 && (unint64_t)(v28 + 1) <= 0x100)
  {
    v35 = 0;
    *((_QWORD *)&v95[22] + 1) = 0;
    v36 = 1;
    goto LABEL_32;
  }
  _BBUFSDebugPrint("BBUFSServerParametersInit", "required path length = %zu, copied = %zu, max length = %zu\n", v29, v30, v31, v32, v33, v34, v27 + 1);
  *((_QWORD *)&v95[22] + 1) = 0;
LABEL_28:
  if (gBBULogMaskGet(void)::once == -1)
  {
    v36 = 0;
    v35 = 11;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_32;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v36 = 0;
    v35 = 11;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      goto LABEL_32;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v37 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v37, "", "Failed preparing fs sync parameters\n", v38, v39, v40, v92);
    v36 = 0;
  }
LABEL_32:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v41 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)((char *)&v95[2] + 8) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)((char *)&v95[3] + 8) = v41;
  *(_OWORD *)((char *)&v95[4] + 8) = *(_OWORD *)(a2 + 64);
  *((_QWORD *)&v95[5] + 1) = *(_QWORD *)(a2 + 80);
  v42 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)((char *)v95 + 8) = *(_OWORD *)a2;
  *(_OWORD *)((char *)&v95[1] + 8) = v42;
  *(_QWORD *)&v95[6] = IceAriGetContext();
  if ((v36 & 1) == 0)
  {
LABEL_47:
    if ((_DWORD)v35 || !a3)
      goto LABEL_51;
    if (sBBUFSServerSetConfig)
    {
      if ((sBBUFSServerSetConfig(a1 + 48, "ForceSync", 0xAAAAAAAA00000001) & 1) != 0)
      {
LABEL_51:
        if (!(_DWORD)v35 && a4)
        {
          if (!sBBUFSServerSetConfig)
          {
            _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v43, v44, v45, v46, v47, v48, v92);
LABEL_73:
            BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'\n", "ShutdownSync", 1);
            return 61;
          }
          if ((sBBUFSServerSetConfig(a1 + 48, "ShutdownSync", 0xAAAAAAAA00000001) & 1) == 0)
            goto LABEL_73;
LABEL_57:
          if (sBBUFSServerSetConfig)
          {
            if ((sBBUFSServerSetConfig(a1 + 48, "ARICtxId", 0xAAAAAAAA00000000) & 1) != 0)
            {
              if (sBBUFSServerStart)
              {
                if ((sBBUFSServerStart(a1 + 48) & 1) != 0)
                {
                  if (sBBUFSServerFlush)
                  {
                    v76 = sBBUFSServerFlush(a1 + 48);
                    v83 = v76;
                    if (!*(_BYTE *)(a1 + 416))
                    {
                      fwrite("file server stopped\n", 0x14uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
                      if ((v83 & 1) != 0)
                        return 0;
LABEL_84:
                      BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed FS flush\n");
                      return 61;
                    }
                    if (v76)
                    {
                      if (sBBUFSServerStop)
                        sBBUFSServerStop(a1 + 48);
                      else
                        _BBUFSDebugPrint("BBUFSServerStop", "sBBUFSServerStop function not initialized\n", v77, v78, v79, v80, v81, v82, v92);
                      return 0;
                    }
                  }
                  else
                  {
                    _BBUFSDebugPrint("BBUFSServerFlush", "sBBUFSServerFlush function not initialized\n", v70, v71, v72, v73, v74, v75, v92);
                    if (!*(_BYTE *)(a1 + 416))
                    {
                      v88 = (FILE *)*MEMORY[0x24BDAC8D8];
                      v89 = "file server stopped\n";
                      v90 = 20;
                      goto LABEL_83;
                    }
                  }
                  v88 = (FILE *)*MEMORY[0x24BDAC8D8];
                  v89 = "filesystem flush operation failed\n";
                  v90 = 34;
LABEL_83:
                  fwrite(v89, v90, 1uLL, v88);
                  goto LABEL_84;
                }
              }
              else
              {
                _BBUFSDebugPrint("BBUFSServerStart", "sBBUFSServerStart function not initialized\n", v64, v65, v66, v67, v68, v69, v92);
              }
              BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed starting file server");
              return 61;
            }
          }
          else
          {
            _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v43, v44, v45, v46, v47, v48, v92);
          }
          BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'", "ARICtxId", 0);
          return 61;
        }
        if (!(_DWORD)v35)
          goto LABEL_57;
        return v35;
      }
    }
    else
    {
      _BBUFSDebugPrint("BBUFSServerSetConfig", "sBBUFSServerSetConfig function not initialized\n", v43, v44, v45, v46, v47, v48, v92);
    }
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Failed setting config '%s' to '%d'\n", "ForceSync", 1);
    return 61;
  }
  v49 = *(uint64_t (**)(const char *, const char *, char *))&v95[0];
  *(_QWORD *)(a1 + 48) = *(_QWORD *)&v95[0];
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 432) = 0u;
  *(_QWORD *)(a1 + 448) = 0;
  v50 = (capabilities::radio *)memcpy((void *)(a1 + 56), (char *)v95 + 8, 0x168uLL);
  v51 = capabilities::radio::vendor(v50);
  switch(v51)
  {
    case 3:
      v58 = (uint64_t (*)(void))INTStateMachineSetConfigDefaults;
      v59 = INTStateMachineSetConfig;
      v60 = (uint64_t (*)(void))INTStateMachineSnapshotInProgress;
      v61 = INTStateMachinePerformSnapshot;
      v62 = INTStateMachineStop;
      v63 = INTStateMachineStart;
LABEL_41:
      sBBUFSServerStart = (uint64_t (*)(_QWORD))v63;
      sBBUFSServerStop = (uint64_t (*)(_QWORD))v62;
      sBBUFSServerFlush = (uint64_t (*)(_QWORD))v61;
      sBBUFSServerFlushInProgress = v60;
      sBBUFSServerSetConfig = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v59;
      sBBUFSServerSetConfigDefaults = v58;
LABEL_43:
      if (((unsigned int (*)(uint64_t))v58)(a1 + 48))
        goto LABEL_44;
      goto LABEL_66;
    case 2:
      v58 = (uint64_t (*)(void))ICEStateMachineSetConfigDefaults;
      v59 = ICEStateMachineSetConfig;
      v60 = (uint64_t (*)(void))ICEStateMachineSnapshotInProgress;
      v61 = ICEStateMachinePerformSnapshot;
      v62 = ICEStateMachineStop;
      v63 = ICEStateMachineStart;
      goto LABEL_41;
    case 1:
      sBBUFSServerStart = EURStateMachineStart;
      sBBUFSServerStop = (uint64_t (*)(_QWORD))EURStateMachineStop;
      sBBUFSServerFlush = (uint64_t (*)(_QWORD))EURStateMachinePerformFlush;
      sBBUFSServerFlushInProgress = (uint64_t (*)(void))EURStateMachineFlushInProgress;
      sBBUFSServerSetConfig = (uint64_t (*)(_QWORD, _QWORD, _QWORD))EURStateMachineSetConfig;
      sBBUFSServerSetConfigDefaults = 0;
LABEL_44:
      if (v49)
        sDelegate = v49;
      _BBUFSDebugPrint("BBUFSServerCreate", "BBUFSServer created successfully\n", v52, v53, v54, v55, v56, v57, v92);
      v35 = 0;
      goto LABEL_47;
  }
  _BBUFSDebugPrint("BBUFSServerCreate", "invalid state machine type %u\n", v52, v53, v54, v55, v56, v57, v51);
  v58 = sBBUFSServerSetConfigDefaults;
  if (sBBUFSServerSetConfigDefaults)
    goto LABEL_43;
LABEL_66:
  _BBUFSDebugPrint("BBUFSServerCreate", "BBUFSServer create failed\n", v52, v53, v54, v55, v56, v57, v92);
  if (gBBULogMaskGet(void)::once == -1)
  {
    v35 = 19;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return v35;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v35 = 19;
    if ((*(_BYTE *)gBBULogMaskGet(void)::sBBULogMask & 0x10) == 0)
      return v35;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v84 = (const char *)(**(uint64_t (***)(uint64_t))a1)(a1);
    _BBULog(4, 0, v84, "", "Failed creating file server\n", v85, v86, v87, v93);
  }
  return v35;
}

void sub_212B48E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  char **v19;

  std::__tree<std::__value_type<__CFString const*,std::string>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,std::string>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,std::string>>>::destroy((uint64_t)v19, v19[1]);
  operator delete(v19);
  pthread_mutex_unlock(&ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t BBUICEInitializer::queryChipInfoBooted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  CFIndex v10;
  _QWORD *v11;
  BBUFeedback *v12;
  void **v13;
  int v14;
  int v15;
  int v16;
  const char *v17;
  BBUFeedback *v18;
  void **v19;
  BBUFeedback **v20;
  BBUFeedback *v21;
  int v22;
  BOOL v25;
  BBUFeedback *v26;
  uint64_t result;
  int v28;
  void *__p[2];
  char v30;
  _DWORD v31[5];
  __int128 v32;
  UInt8 bytes[16];
  __int128 v34;
  unsigned __int16 v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  memset(v36, 170, 24);
  memset(v31, 0, sizeof(v31));
  v32 = 0u;
  BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "Querying chip info from booted baseband");
  if (!a2 || !a3)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "missing parameter");
    return 2;
  }
  v35 = -21846;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)bytes = v6;
  v34 = v6;
  IceAriGetContext();
  if ((KTLSecGetSNUM() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading snum from booted baseband over KTL");
    return 18;
  }
  IceAriGetContext();
  if ((KTLSecGetChipId() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading chipid from booted baseband over KTL");
    return 18;
  }
  IceAriGetContext();
  if ((KTLSecGetPkHash() & 1) == 0)
  {
    BBUFeedback::handleComment(*(BBUFeedback **)(a1 + 8), "failed reading pkhash from booted baseband over KTL");
    return 18;
  }
  v7 = BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber((const UInt8 *)v36, (const unsigned __int8 *)(8 * LOWORD(v36[2])));
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 16))(a3, v7);
  v8 = BBUICEPersonalizationParameters::ICEChipID::createFromChipID((BBUICEPersonalizationParameters::ICEChipID *)v31[0]);
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  *(_QWORD *)(a3 + 16) = v8;
  v10 = v35;
  v11 = operator new(0x10uLL);
  *v11 = off_24CE864C8;
  v11[1] = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v10);
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a3 + 24))(a3, v11);
  if (!v7)
    goto LABEL_19;
  v12 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, _QWORD *))(*v7 + 24))(__p, v7);
  if (v30 >= 0)
    v13 = __p;
  else
    v13 = (void **)__p[0];
  if (BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS == -1)
  {
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_14;
  }
  else
  {
    dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRestoreOS, &__block_literal_global_6);
    if (BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS == -1)
      goto LABEL_14;
  }
  dispatch_once(&BBUpdaterCommon::inRestoreOS(void)::sOnceRecoveryOS, &__block_literal_global_11);
LABEL_14:
  v14 = BBUpdaterCommon::inRestoreOS(void)::restoreOS;
  v15 = BBUpdaterCommon::inRestoreOS(void)::recoveryOS;
  v16 = (*(uint64_t (**)(_QWORD *))(*v8 + 24))(v8);
  if (v14 | v15)
    v17 = (const char *)v13;
  else
    v17 = "<< SNUM >>";
  BBUFeedback::handleComment(v12, "   SNUM: 0x%s / CHIPID: 0x%08x", v17, v16);
  if (v30 < 0)
    operator delete(__p[0]);
LABEL_19:
  v18 = *(BBUFeedback **)(a1 + 8);
  (*(void (**)(void **__return_ptr, _QWORD *))(*v11 + 24))(__p, v11);
  if (v30 >= 0)
    v19 = __p;
  else
    v19 = (void **)__p[0];
  BBUFeedback::handleComment(v18, "   PUBLIC_KEY_HASH: 0x%s", (const char *)v19);
  if (v30 < 0)
    operator delete(__p[0]);
  v21 = *(BBUFeedback **)(a1 + 8);
  v20 = (BBUFeedback **)(a1 + 8);
  v22 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a3 + 24) + 24))(*(_QWORD *)(a3 + 24));
  BBUFeedback::handleComment(v21, "   CertID: %u", v22);
  v25 = *(_QWORD *)&v31[1] == *(_QWORD *)bytes
     && *(_QWORD *)&v31[3] == *(_QWORD *)&bytes[8]
     && (_QWORD)v32 == (_QWORD)v34
     && *((_QWORD *)&v32 + 1) == *((_QWORD *)&v34 + 1);
  v26 = *v20;
  if (v25)
  {
    BBUFeedback::handleComment(v26, "   Detected as unfused BB");
    result = 0;
    v28 = 1;
  }
  else
  {
    BBUFeedback::handleComment(v26, "   Detected as fused BB\n");
    result = 0;
    v28 = 3;
  }
  *(_DWORD *)(a3 + 88) = v28;
  return result;
}

void sub_212B492A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

const char *BBUICEInitializer::getDebugName(BBUICEInitializer *this)
{
  return "BBUICEInitializer";
}

uint64_t __cxx_global_var_init_29()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ICEARIContext>::~PthreadMutexGuardPolicy, &ctu::Singleton<ICEARIContext,ICEARIContext,ctu::PthreadMutexGuardPolicy<ICEARIContext>>::sInstance, &dword_212A4D000);
  }
  return result;
}

uint64_t __cxx_global_var_init_95()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_212A4D000);
  }
  return result;
}

void BBUICEPersonalizationParameters::ICENonce::~ICENonce(BBUICEPersonalizationParameters::ICENonce *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE863A8;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE863A8;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICENonce::getAsCFData(BBUICEPersonalizationParameters::ICENonce *this)
{
  return *((_QWORD *)this + 1);
}

void BBUICEPersonalizationParameters::ICENonce::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
  cfDataToCString(a2, this[1]);
}

void BBUICEPersonalizationParameters::ICESerialNumber::~ICESerialNumber(BBUICEPersonalizationParameters::ICESerialNumber *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE863D8;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE863D8;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

_QWORD *BBUICEPersonalizationParameters::ICESerialNumber::createFromSerialNumber(const UInt8 *this, const unsigned __int8 *a2)
{
  _QWORD *v3;
  CFDataRef v4;
  void *exception;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if ((_DWORD)a2 != 96)
    return 0;
  v3 = operator new(0x10uLL);
  *v3 = off_24CE863D8;
  v3[1] = 0;
  v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], this, 12);
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 100, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x80u, (ctu::LogMessageBuffer *)"Assertion failure(data && \"Failed to create serial number.\")", v7, v8, v9, v10);
  }
  v3[1] = v4;
  return v3;
}

void sub_212B49500(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICESerialNumber::getAsCFData(BBUICEPersonalizationParameters::ICESerialNumber *this)
{
  return *((_QWORD *)this + 1);
}

void BBUICEPersonalizationParameters::ICESerialNumber::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
  cfDataToCString(a2, this[1]);
}

void BBUICEPersonalizationParameters::ICECertID::~ICECertID(BBUICEPersonalizationParameters::ICECertID *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE86408;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE86408;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

CFDataRef BBUICEPersonalizationParameters::ICECertID::createFromPublicKeyHashData(CFDataRef theData, const __CFData *a2)
{
  CFDataRef v2;
  unsigned int *BytePtr;
  CFNumberRef v4;
  void *exception;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t valuePtr;

  v2 = theData;
  if (!theData)
    return v2;
  BytePtr = (unsigned int *)CFDataGetBytePtr(theData);
  if ((CFDataGetLength(v2) & 0xFFFFFFFCLL) != 0)
  {
    v2 = (CFDataRef)operator new(0x10uLL);
    *(_QWORD *)v2 = off_24CE86408;
    valuePtr = bswap32(*BytePtr);
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
    *((_QWORD *)v2 + 1) = v4;
    if (!v4)
    {
      exception = __cxa_allocate_exception(0x210uLL);
      _BBUException::_BBUException((uint64_t)exception, 97, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0xEFu, (ctu::LogMessageBuffer *)"Assertion failure(certID->fNumber && \"Failed to create CertID!\")", v7, v8, v9, v10);
    }
    return v2;
  }
  return 0;
}

void sub_212B49684(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICECertID::getAsCFNumber(BBUICEPersonalizationParameters::ICECertID *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t BBUICEPersonalizationParameters::ICECertID::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  void *exception;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;

  v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 97, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x10Du, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create CertID!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_212B4971C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void BBUICEPersonalizationParameters::ICEChipID::~ICEChipID(BBUICEPersonalizationParameters::ICEChipID *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE86438;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE86438;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

_QWORD *BBUICEPersonalizationParameters::ICEChipID::createFromChipID(BBUICEPersonalizationParameters::ICEChipID *this)
{
  unsigned int v1;
  _QWORD *v2;
  CFNumberRef v3;
  void *exception;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t valuePtr;

  v1 = this;
  v2 = operator new(0x10uLL);
  *v2 = off_24CE86438;
  valuePtr = v1;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  v2[1] = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 98, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x126u, (ctu::LogMessageBuffer *)"Assertion failure(( chipID->fNumber && \"Failed to create ChipID!\"))", v6, v7, v8, v9);
  }
  return v2;
}

void sub_212B49850(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEChipID::getAsCFNumber(BBUICEPersonalizationParameters::ICEChipID *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t BBUICEPersonalizationParameters::ICEChipID::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  void *exception;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;

  v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 98, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x141u, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create chipID!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_212B498E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void BBUICEPersonalizationParameters::ICEKeyStatus::~ICEKeyStatus(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE86468;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE86468;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

_QWORD *BBUICEPersonalizationParameters::ICEKeyStatus::createFromKeyStatus(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  unsigned int v1;
  _QWORD *v2;
  CFNumberRef v3;
  void *exception;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t valuePtr;

  v1 = this;
  v2 = operator new(0x10uLL);
  *v2 = off_24CE86468;
  valuePtr = v1;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  v2[1] = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 99, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x15Au, (ctu::LogMessageBuffer *)"Assertion failure(status->fNumber && \"Failed to create key status!\")", v6, v7, v8, v9);
  }
  return v2;
}

void sub_212B49A1C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyStatus::getAsUnsigned(unsigned int **this, uint64_t a2, const __CFNumber *a3)
{
  void *exception;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int v9;

  v9 = -1431655766;
  if ((ctu::cf::assign((ctu::cf *)&v9, this[1], a3) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x210uLL);
    _BBUException::_BBUException((uint64_t)exception, 99, "/Library/Caches/com.apple.xbs/Sources/AppleBasebandServices/BBUpdater/Legacy/Framework/Personalization/ICE/BBUICEPersonalizationParameters.cpp", 0x16Fu, (ctu::LogMessageBuffer *)"Assertion failure(success && \"Failed to create key status!\")", v5, v6, v7, v8);
  }
  return v9;
}

void sub_212B49AAC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyStatus::getAsCFNumber(BBUICEPersonalizationParameters::ICEKeyStatus *this)
{
  return *((_QWORD *)this + 1);
}

void BBUICEPersonalizationParameters::ICEKeyHash::~ICEKeyHash(BBUICEPersonalizationParameters::ICEKeyHash *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE86498;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE86498;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICEKeyHash::getAsCFData(BBUICEPersonalizationParameters::ICEKeyHash *this)
{
  return *((_QWORD *)this + 1);
}

void BBUICEPersonalizationParameters::ICEKeyHash::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
  cfDataToCString(a2, this[1]);
}

void BBUICEPersonalizationParameters::ICEPublicKeyHash::~ICEPublicKeyHash(BBUICEPersonalizationParameters::ICEPublicKeyHash *this)
{
  const void *v1;

  *(_QWORD *)this = off_24CE864C8;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v2;

  *(_QWORD *)this = off_24CE864C8;
  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  operator delete(this);
}

uint64_t BBUICEPersonalizationParameters::ICEPublicKeyHash::getAsCFData(BBUICEPersonalizationParameters::ICEPublicKeyHash *this)
{
  return *((_QWORD *)this + 1);
}

void BBUICEPersonalizationParameters::ICEPublicKeyHash::getAsString(const __CFData **this@<X0>, const __CFData *a2@<X8>)
{
  cfDataToCString(a2, this[1]);
}

_DWORD *BBULoaderVersion::createFromVersionString(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v1 = *(unsigned __int8 *)(a1 + 23);
  if ((v1 & 0x80u) != 0)
    v1 = *(_QWORD *)(a1 + 8);
  if (!v1 || !capabilities::radio::maverick((capabilities::radio *)a1))
    return 0;
  v3 = operator new(0x28uLL);
  v3[2] = 0;
  *((_QWORD *)v3 + 3) = 0;
  *((_QWORD *)v3 + 4) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = &unk_24CE81B98;
  v4 = BBUEUR10LoaderVersion::parseVersionString((uint64_t)v3, (void **)a1);
  if (v4)
  {
    v8 = v4;
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 4) != 0)
        goto LABEL_8;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 2) & 4) != 0)
      {
LABEL_8:
        if ((gBBULogVerbosity & 0x80000000) == 0)
          _BBULog(18, 0, "BBULoaderVersion", "", "Parsing failed, ret = %s\n", v5, v6, v7, (char)BBUReturnAsString::BBUReturnStrings[v8]);
      }
    }
    (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    return 0;
  }
  return v3;
}

_QWORD *BBUpdaterExtremeCreate()
{
  return BBUpdaterExtremeCreateCommon(0);
}

_QWORD *BBUpdaterExtremeCreateCommon(CFErrorRef *a1)
{
  int v2;
  __int128 v3;
  uint64_t v4;
  uint64_t Instance;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  capabilities::radio *v10;
  int v11;
  uint64_t v12;
  BBUError *v13;
  __int128 v14;
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
  __int128 v25;
  unint64_t *v26;
  unint64_t v27;
  BBUpdaterController *v28;
  __int128 v29;
  size_t v31;
  char __str[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 block;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  block = 0u;
  v41 = 0u;
  v31 = 256;
  v2 = sysctlbyname("hw.model", &block, &v31, 0, 0);
  if (v2)
  {
    if (a1)
    {
      *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v38 = v3;
      v39 = v3;
      v36 = v3;
      v37 = v3;
      v34 = v3;
      v35 = v3;
      *(_OWORD *)__str = v3;
      v33 = v3;
      snprintf(__str, 0x80uLL, "%s: hw.model query failed with %d\n", "BBUpdaterDetermineVendorandPlatform", v2);
      *a1 = BBUpdaterExtremePrivate::makeCFError(16, __str);
LABEL_31:
      v9 = 0;
      *a1 = BBUpdaterExtremePrivate::makeCFError(24, "BBUpdaterExtremeCreateCommon(): Unable to determine radio vendor\n");
      return v9;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s: hw.model query failed with %d\n", "BBUpdaterDetermineVendorandPlatform", v2);
    return 0;
  }
  v4 = TelephonyCapabilitiesSetHardwareModelFromString();
  if ((v4 & 1) == 0)
  {
    if (!a1)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s: could not set Telephony HW model with %s\n", "BBUpdaterDetermineVendorandPlatform", (const char *)&block);
      return 0;
    }
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38 = v25;
    v39 = v25;
    v36 = v25;
    v37 = v25;
    v34 = v25;
    v35 = v25;
    *(_OWORD *)__str = v25;
    v33 = v25;
    snprintf(__str, 0x80uLL, "%s: could not set Telephony HW model with %s\n", "BBUpdaterDetermineVendorandPlatform", (const char *)&block);
    *a1 = BBUpdaterExtremePrivate::makeCFError(16, __str);
    goto LABEL_30;
  }
  if (capabilities::radio::vendor((capabilities::radio *)v4) - 1 > 1)
  {
LABEL_30:
    if (a1)
      goto LABEL_31;
    return 0;
  }
  pthread_once(&BBUpdaterExtreme::sBBUpdaterRegisterClassOnce, (void (*)(void))BBUpdaterRegisterClass);
  if (!BBUpdaterExtreme::sBBUpdaterTypeID)
    return 0;
  Instance = _CFRuntimeCreateInstance();
  v9 = (_QWORD *)Instance;
  if (Instance)
  {
    *(_BYTE *)(Instance + 24) = 1;
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v10 = (capabilities::radio *)_BBULog(0, 0xFFFFFFFFLL, "BBUpdaterExtreme", "", "BBUpdater Version: %s-%s\n", v6, v7, v8, (char)"BBU_PROJECT_VERSION");
    v11 = capabilities::radio::vendor(v10);
    pthread_mutex_lock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    v12 = qword_253D31DC8;
    if (!qword_253D31DC8)
    {
      v13 = (BBUError *)operator new(0x38uLL);
      BBUError::BBUError(v13);
      std::shared_ptr<BBUError>::shared_ptr[abi:ne180100]<BBUError,std::shared_ptr<BBUError> ctu::SharedSynchronizable<BBUError>::make_shared_ptr<BBUError>(BBUError*)::{lambda(BBUError*)#1},void>((std::__shared_weak_count_vtbl **)&block, (std::__shared_weak_count_vtbl *)v13);
      v14 = block;
      block = 0uLL;
      v15 = (std::__shared_weak_count *)off_253D31DD0;
      *(_OWORD *)&qword_253D31DC8 = v14;
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
      v18 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
      if (*((_QWORD *)&block + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v12 = qword_253D31DC8;
    }
    v21 = (std::__shared_weak_count *)off_253D31DD0;
    if (off_253D31DD0)
    {
      v22 = (unint64_t *)((char *)off_253D31DD0 + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    pthread_mutex_unlock(&ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance);
    *(_QWORD *)&__str[8] = 0x40000000;
    *(_QWORD *)&v33 = ___ZN8BBUError11clearErrorsEv_block_invoke;
    *((_QWORD *)&v33 + 1) = &__block_descriptor_tmp_7;
    *(_QWORD *)&v34 = v12;
    v31 = (size_t)__str;
    *(_QWORD *)__str = MEMORY[0x24BDAC760];
    *(_QWORD *)&block = MEMORY[0x24BDAC760];
    *((_QWORD *)&block + 1) = 0x40000000;
    *(_QWORD *)&v41 = ___ZNK3ctu20SharedSynchronizableI8BBUErrorE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    *((_QWORD *)&v41 + 1) = &__block_descriptor_tmp_10;
    *(_QWORD *)&v42 = v12;
    *((_QWORD *)&v42 + 1) = &v31;
    v24 = *(NSObject **)(v12 + 16);
    if (*(_QWORD *)(v12 + 24))
      dispatch_async_and_wait(v24, &block);
    else
      dispatch_sync(v24, &block);
    if (v21)
    {
      v26 = (unint64_t *)&v21->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (v11 == 1)
    {
      v28 = (BBUpdaterController *)operator new(0x168uLL);
      BBUpdaterController::BBUpdaterController(v28, v9);
    }
    else
    {
      if (v11 != 2)
      {
        if (a1)
        {
          *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v46 = v29;
          v47 = v29;
          v44 = v29;
          v45 = v29;
          v42 = v29;
          v43 = v29;
          block = v29;
          v41 = v29;
          snprintf((char *)&block, 0x80uLL, "Unknown telephony radio vendor %d", v11);
          *a1 = BBUpdaterExtremePrivate::makeCFError(24, (const char *)&block);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "Unknown telephony radio vendor %d\n", v11);
        }
        goto LABEL_47;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s: Good\n", "BBUpdaterInit");
      v28 = (BBUpdaterController *)operator new(0x168uLL);
      BBUpdaterController::BBUpdaterController(v28, v9);
    }
    v9[2] = v28;
LABEL_47:
    if (v9[2])
      return v9;
    CFRelease(v9);
    return 0;
  }
  return v9;
}

#error "212B4A2D4: call analysis failed (funcsize=34)"

_DWORD *BBUpdaterParametersInit(_DWORD *result)
{
  *result = 0;
  return result;
}

_QWORD *BBUpdaterExtremeCreateWithParams()
{
  return BBUpdaterExtremeCreateCommon(0);
}

_QWORD *BBUpdaterExtremeCreateWithParamsWithError(uint64_t a1, CFErrorRef *a2)
{
  return BBUpdaterExtremeCreateCommon(a2);
}

uint64_t BBUpdaterExecCommand(uint64_t a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 24))
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 24))(*(_QWORD *)(a1 + 16));
  }
  else if (a4)
  {
    *a4 = BBUpdaterExtremePrivate::makeCFError(4, 0);
  }
  return 0;
}

uint64_t BBUpdaterSetOptions(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 16))(*(_QWORD *)(a1 + 16));
  }
  else if (a3)
  {
    *a3 = BBUpdaterExtremePrivate::makeCFError(4, 0);
  }
  return 0;
}

uint64_t BBUpdaterRegisterLogSink(uint64_t result)
{
  if (result)
  {
    if (*(_BYTE *)(result + 24))
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(result + 16) + 32))(*(_QWORD *)(result + 16));
  }
  return result;
}

uint64_t BBUpdaterRegisterGlobalLogSink(uint64_t result, void *a2)
{
  gBBULogSinkContext = result;
  gBBULogSinkFunc = a2;
  return result;
}

uint64_t BBUpdaterRegisterClass(void)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  BBUpdaterExtreme::sBBUpdaterTypeID = result;
  return result;
}

_QWORD *BBUpdaterDestroy(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
      v1[2] = 0;
    }
  }
  return result;
}

CFStringRef BBUpdaterDescribe(CFStringRef result)
{
  CFStringRef v1;
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  if (result)
  {
    v1 = result;
    v2 = CFGetAllocator(result);
    v3 = CFGetAllocator(v1);
    return CFStringCreateWithFormat(v2, 0, CFSTR("<libBBUpdater %p [%p]>{}"), v1, v3);
  }
  return result;
}

uint64_t __cxx_global_var_init_30()
{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUError>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUError,BBUError,ctu::PthreadMutexGuardPolicy<BBUError>>::sInstance, &dword_212A4D000);
  }
  return result;
}

void BBUEUR20Fusing::~BBUEUR20Fusing(void **this)
{
  *this = off_24CE82C48;
  if ((*((char *)this + 79) & 0x80000000) == 0)
  {
    if ((*((char *)this + 55) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(this[4]);
    return;
  }
  operator delete(this[7]);
  if (*((char *)this + 55) < 0)
    goto LABEL_5;
}

{
  *this = off_24CE82C48;
  if (*((char *)this + 79) < 0)
  {
    operator delete(this[7]);
    if ((*((char *)this + 55) & 0x80000000) == 0)
      goto LABEL_3;
LABEL_6:
    operator delete(this[4]);
    operator delete(this);
    return;
  }
  if (*((char *)this + 55) < 0)
    goto LABEL_6;
LABEL_3:
  operator delete(this);
}

uint64_t BBUEUR20Fusing::performFusing(BBUFeedback **a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  BBUFeedback::handleBeginPhase(a1[1], "Fuse");
  if (!*((_BYTE *)a1 + 24))
  {
    (*((void (**)(BBUFeedback **))*a1 + 6))(a1);
    ETLFusingProgramTriggerM20();
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
        goto LABEL_7;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
        goto LABEL_7;
    }
    if ((gBBULogVerbosity & 0x80000000) == 0)
    {
      v3 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 4))(a1);
      _BBULog(13, 0, v3, "", "Triggering Fusing Program with status (%d)\n", v4, v5, v6, -1);
    }
LABEL_7:
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
        goto LABEL_9;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
      {
LABEL_9:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v7 = (const char *)(*((uint64_t (**)(BBUFeedback **))*a1 + 4))(a1);
          _BBULog(13, 0, v7, "", "Failed to run ETLFusingProgramTriggerM20() with status (%d)\n", v8, v9, v10, -1);
        }
      }
    }
    v2 = 24;
    goto LABEL_12;
  }
  v2 = 0;
LABEL_12:
  (*(void (**)(BBUFeedback *, uint64_t))(*(_QWORD *)a1[1] + 16))(a1[1], v2);
  return v2;
}

uint64_t BBUEUR20Fusing::verifyFusing(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFAllocator *v25;
  const __CFData *v26;
  uint64_t (*v27)(uint64_t);
  CFPropertyListRef v28;
  const void *v29;
  uint64_t (*v30)(uint64_t);
  BOOL v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  const void *v41;
  uint64_t (*v42)(uint64_t);
  unint64_t v43;
  uint64_t (*v44)(uint64_t);
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  _QWORD *v55;
  unint64_t v56;
  BOOL v57;
  const __CFDictionary *ValueAtIndex;
  __int32 Int;
  CFPropertyListFormat *v60;
  void *v61;
  void **v62;
  uint64_t v63;
  void *v64;
  const void **v65;
  void **v66;
  int v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void **v72;
  __int32 *v73;
  __int32 *v74;
  __int32 *v75;
  unint64_t v76;
  unint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void **v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void **v88;
  int v89;
  unsigned int v90;
  const char *v91;
  char v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  void **v98;
  int v99;
  int v100;
  const char *v101;
  void **v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  CFPropertyListFormat v110;
  CFPropertyListFormat *v111;
  CFPropertyListFormat v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  CFPropertyListFormat *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const void *Value;
  const void *v131;
  CFTypeID v132;
  CFTypeID v133;
  CFArrayRef Copy;
  uint64_t (*v135)(uint64_t);
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  unint64_t Count;
  _BYTE v146[32];
  __int128 v147;
  std::vector<unsigned int> __p;
  unint64_t v149;
  unint64_t v150;
  const void *v151[2];
  uint64_t v152;
  void *v153[3];
  unint64_t v154;
  unint64_t v155;
  CFPropertyListFormat format;
  CFPropertyListFormat *v157;
  uint64_t v158;

  BBUFeedback::handleBeginPhase(*(BBUFeedback **)(a1 + 8), "Verify Fusing");
  if (!*(_BYTE *)(a1 + 24) && !*(_BYTE *)(a1 + 80))
  {
    v150 = 0xAAAAAAAAAAAAAAAALL;
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 64))(a2);
    *(_QWORD *)v146 = v10;
    v11 = (std::__shared_weak_count *)operator new(0x20uLL);
    v11->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__vftable = (std::__shared_weak_count_vtbl *)off_24CE86678;
    v11->__shared_weak_owners_ = 0;
    v11[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
    *(_QWORD *)&v146[8] = v11;
    if (v10)
    {
      v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 24))(v10);
      v14 = v13;
      v15 = v13;
      if ((_DWORD)v13)
      {
        v16 = operator new(v13);
        bzero(v16, v15);
      }
      else
      {
        v16 = 0;
      }
      LODWORD(v154) = -1431655766;
      if ((*(unsigned int (**)(uint64_t, void *, uint64_t, unint64_t *, _QWORD))(*(_QWORD *)v10 + 16))(v10, v16, v14, &v154, 0))
      {
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
            goto LABEL_20;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
          {
LABEL_20:
            if ((gBBULogVerbosity & 0x80000000) == 0)
            {
              v21 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
              _BBULog(13, 0, v21, "", "Failed to copy data from fusing source\n", v22, v23, v24, v144);
            }
          }
        }
LABEL_43:
        v150 = 0;
LABEL_44:
        if (v16)
          operator delete(v16);
        do
LABEL_46:
          v40 = __ldaxr(p_shared_owners);
        while (__stlxr(v40 - 1, p_shared_owners));
        if (v40)
        {
          v41 = (const void *)v150;
          if (v150)
            v42 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
          else
            v42 = 0;
          if (v42)
          {
LABEL_52:
            memset(v146, 0, sizeof(v146));
            v147 = 0u;
            memset(&__p, 0, sizeof(__p));
            v149 = 0xAAAAAAAAAAAAAAAALL;
            std::vector<unsigned int>::__append((std::vector<unsigned int> *)v146, 0x28uLL);
            v43 = v147 - *(_QWORD *)&v146[24];
            if ((_QWORD)v147 - *(_QWORD *)&v146[24] > 0x9FuLL)
            {
              if (v43 != 160)
                *(_QWORD *)&v147 = *(_QWORD *)&v146[24] + 160;
            }
            else
            {
              std::vector<unsigned int>::__append((std::vector<unsigned int> *)&v146[24], 40 - (v43 >> 2));
            }
            v49 = (char *)__p.__end_ - (char *)__p.__begin_;
            if ((std::vector<unsigned int>::pointer)((char *)__p.__end_ - (char *)__p.__begin_) > (std::vector<unsigned int>::pointer)0x9F)
            {
              if (v49 != 160)
                __p.__end_ = __p.__begin_ + 40;
            }
            else
            {
              std::vector<unsigned int>::__append(&__p, 40 - (v49 >> 2));
            }
            LODWORD(v149) = 0;
            (*(void (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
            if ((ETLFusingGetFusedData() & 1) == 0)
            {
              if (gBBULogMaskGet(void)::once == -1)
              {
                v4 = 125;
                if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                  goto LABEL_201;
              }
              else
              {
                dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                v4 = 125;
                if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                  goto LABEL_201;
              }
              if (gBBULogVerbosity < 0)
                goto LABEL_201;
              v50 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
              v54 = "Failed to run ETLFusingGetFusedData()\n";
              goto LABEL_200;
            }
            LODWORD(v149) = 0;
            if ((uint64_t)(*(_QWORD *)&v146[8] - *(_QWORD *)v146) >> 2)
              *(_QWORD *)&v146[8] = *(_QWORD *)v146;
            if ((uint64_t)(v147 - *(_QWORD *)&v146[24]) >> 2)
              *(_QWORD *)&v147 = *(_QWORD *)&v146[24];
            if (__p.__end_ - __p.__begin_)
              __p.__end_ = __p.__begin_;
            if (v41)
              CFRetain(v41);
            v55 = operator new(0x28uLL);
            v55[2] = 0x4B5F57485F434553;
            v55[3] = 22853;
            *((_BYTE *)v55 + 39) = 10;
            *v55 = &format;
            v55[1] = &format;
            format = (CFPropertyListFormat)v55;
            v157 = (CFPropertyListFormat *)v55;
            v158 = 1;
            Count = CFArrayGetCount((CFArrayRef)v41);
            if (!Count)
            {
              v57 = 1;
              goto LABEL_182;
            }
            v56 = 0;
            v57 = 0;
LABEL_84:
            v154 = 0xAAAAAAAAAAAAAAAALL;
            v155 = 0xAAAAAAAAAAAAAAAALL;
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v41, v56);
            ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v154, ValueAtIndex);
            if (v155)
            {
              v152 = 0;
              memset(v153, 170, sizeof(v153));
              v151[0] = 0;
              v151[1] = 0;
              ctu::cf::map_adapter::getString();
              if (SHIBYTE(v152) < 0)
                operator delete((void *)v151[0]);
              Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("Address"));
              v60 = v157;
              if (v157 == &format)
                goto LABEL_112;
              if (SHIBYTE(v153[2]) >= 0)
                v61 = (void *)HIBYTE(v153[2]);
              else
                v61 = v153[1];
              if (SHIBYTE(v153[2]) >= 0)
                v62 = v153;
              else
                v62 = (void **)v153[0];
              while (1)
              {
                v63 = *((unsigned __int8 *)v60 + 39);
                if ((v63 & 0x80u) == 0)
                  v64 = (void *)*((unsigned __int8 *)v60 + 39);
                else
                  v64 = (void *)*((_QWORD *)v60 + 3);
                if (v64 == v61)
                {
                  v65 = (const void **)(v60 + 2);
                  if ((v63 & 0x80) != 0)
                  {
                    if (!memcmp(*v65, v62, *((_QWORD *)v60 + 3)))
                      goto LABEL_105;
                  }
                  else
                  {
                    if (!*((_BYTE *)v60 + 39))
                    {
LABEL_105:
                      if (v60 != &format)
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          v67 = 4;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                          {
LABEL_108:
                            if ((gBBULogVerbosity & 0x80000000) == 0)
                            {
                              v68 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                              v72 = v153;
                              if (SHIBYTE(v153[2]) < 0)
                                LOBYTE(v72) = v153[0];
                              _BBULog(13, 0, v68, "", "Skip because the region type(%s:0x%08X) is in the deny list\n", v69, v70, v71, (char)v72);
                            }
                          }
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          v67 = 4;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                            goto LABEL_108;
                        }
                        goto LABEL_145;
                      }
LABEL_112:
                      v73 = *(__int32 **)&v146[8];
                      v74 = wmemchr(*(__int32 **)v146, Int, (uint64_t)(*(_QWORD *)&v146[8] - *(_QWORD *)v146) >> 2);
                      if (v74)
                        v75 = v74;
                      else
                        v75 = v73;
                      if (v75 == *(__int32 **)&v146[8])
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        if ((gBBULogVerbosity & 0x80000000) == 0)
                        {
                          v84 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                          v88 = v153;
                          if (SHIBYTE(v153[2]) < 0)
                            LOBYTE(v88) = v153[0];
                          _BBULog(13, 0, v84, "", "%s: Failed to find the addressin BB from the plist address (0x%08X)\n", v85, v86, v87, (char)v88);
                        }
                        goto LABEL_145;
                      }
                      v76 = (unint64_t)v75 - *(_QWORD *)v146;
                      v77 = ((unint64_t)v75 - *(_QWORD *)v146) >> 2;
                      if (v77 > ((unint64_t)((char *)__p.__end_cap_.__value_
                                                                               - (char *)__p.__begin_) >> 2))
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        if (gBBULogVerbosity < 0)
                          goto LABEL_145;
                        v78 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                        v82 = v153;
                        if (SHIBYTE(v153[2]) < 0)
                          LOBYTE(v82) = v153[0];
                        v83 = "%s: Finding index (%d) is beyond the capacity in LSB in the fusing data\n";
                        goto LABEL_123;
                      }
                      v89 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("LSB"));
                      v90 = __p.__begin_[v77];
                      if ((v90 & v89) == ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("LSB")))
                      {
                        if (v77 > ((*((_QWORD *)&v147 + 1) - *(_QWORD *)&v146[24]) >> 2))
                        {
                          if (gBBULogMaskGet(void)::once == -1)
                          {
                            v67 = 1;
                            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                              goto LABEL_145;
                          }
                          else
                          {
                            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                            v67 = 1;
                            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                              goto LABEL_145;
                          }
                          if (gBBULogVerbosity < 0)
                            goto LABEL_145;
                          v78 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                          v82 = v153;
                          if (SHIBYTE(v153[2]) < 0)
                            LOBYTE(v82) = v153[0];
                          v83 = "%s: Finding index (%d) is beyond the capacity in MSB in the fusing data\n";
LABEL_123:
                          _BBULog(13, 0, v78, "", v83, v79, v80, v81, (char)v82);
                          goto LABEL_145;
                        }
                        v99 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("MSB"));
                        v100 = *(_DWORD *)(*(_QWORD *)&v146[24] + 4 * (v76 >> 2));
                        if ((v100 & v99) == ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("MSB")))
                        {
                          if (gBBULogMaskGet(void)::once == -1)
                          {
                            v67 = 0;
                            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                              goto LABEL_145;
                          }
                          else
                          {
                            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                            v67 = 0;
                            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                              goto LABEL_145;
                          }
                          if ((gBBULogVerbosity & 0x80000000) == 0)
                          {
                            v101 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                            if (SHIBYTE(v153[2]) >= 0)
                              v102 = v153;
                            else
                              LOBYTE(v102) = v153[0];
                            ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("LSB"));
                            ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("MSB"));
                            _BBULog(13, 0, v101, "", "Region Type (%s): Address (0x%08X), LSB (0x%08X), MSB (0x%08X): PASSED!\n", v103, v104, v105, (char)v102);
                            v67 = 0;
                          }
LABEL_145:
                          if (SHIBYTE(v153[2]) < 0)
                            operator delete(v153[0]);
                          MEMORY[0x212BF9A70](&v154);
                          if ((v67 | 4) != 4 || (++v56, v57 = v56 >= Count, v56 == Count))
                          {
LABEL_182:
                            if (v158)
                            {
                              v110 = format;
                              v111 = v157;
                              v112 = *v157;
                              *(_QWORD *)(v112 + 8) = *(_QWORD *)(format + 8);
                              **(_QWORD **)(v110 + 8) = v112;
                              v158 = 0;
                              if (v111 != &format)
                              {
                                do
                                {
                                  v117 = (CFPropertyListFormat *)*((_QWORD *)v111 + 1);
                                  if (*((char *)v111 + 39) < 0)
                                    operator delete(*((void **)v111 + 2));
                                  operator delete(v111);
                                  v111 = v117;
                                }
                                while (v117 != &format);
                              }
                            }
                            if (v41)
                              CFRelease(v41);
                            if (v57)
                            {
                              LODWORD(format) = -1;
                              (*(void (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
                              if ((ETLFusingGetSecureState() & 1) != 0)
                              {
                                if ((format & 1) != 0)
                                {
                                  if (gBBULogMaskGet(void)::once == -1)
                                  {
                                    v4 = 125;
                                    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                      goto LABEL_201;
                                  }
                                  else
                                  {
                                    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                    v4 = 125;
                                    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                      goto LABEL_201;
                                  }
                                  if ((gBBULogVerbosity & 0x80000000) == 0)
                                  {
                                    v126 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                                    _BBULog(13, 0, v126, "", "Failed to pass the secure state: (0x%08X)\n", v127, v128, v129, format);
                                  }
                                }
                                else if (gBBULogMaskGet(void)::once == -1)
                                {
                                  v4 = 0;
                                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                                  {
LABEL_191:
                                    if ((gBBULogVerbosity & 0x80000000) == 0)
                                    {
                                      v113 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                                      _BBULog(13, 0, v113, "", "Pass Fusing Secure State: (0x%08X)\n", v114, v115, v116, format);
                                      v4 = 0;
                                    }
                                  }
                                }
                                else
                                {
                                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                  v4 = 0;
                                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                                    goto LABEL_191;
                                }
                              }
                              else
                              {
                                if (gBBULogMaskGet(void)::once == -1)
                                {
                                  v4 = 125;
                                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                    goto LABEL_201;
                                }
                                else
                                {
                                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                                  v4 = 125;
                                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                    goto LABEL_201;
                                }
                                if ((gBBULogVerbosity & 0x80000000) == 0)
                                {
                                  v118 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                                  _BBULog(13, 0, v118, "", "Failed to run ETLFusingGetSecureState()\n", v119, v120, v121, v144);
                                }
                              }
LABEL_201:
                              if (__p.__begin_)
                              {
                                __p.__end_ = __p.__begin_;
                                operator delete(__p.__begin_);
                              }
                              if (*(_QWORD *)&v146[24])
                              {
                                *(_QWORD *)&v147 = *(_QWORD *)&v146[24];
                                operator delete(*(void **)&v146[24]);
                              }
                              if (*(_QWORD *)v146)
                              {
                                *(_QWORD *)&v146[8] = *(_QWORD *)v146;
                                operator delete(*(void **)v146);
                              }
                              goto LABEL_207;
                            }
                            if (gBBULogMaskGet(void)::once == -1)
                            {
                              v4 = 125;
                              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                goto LABEL_201;
                            }
                            else
                            {
                              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                              v4 = 125;
                              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                                goto LABEL_201;
                            }
                            if (gBBULogVerbosity < 0)
                              goto LABEL_201;
                            v50 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                            v54 = "Failed to match both plist and the fusing data\n";
LABEL_200:
                            _BBULog(13, 0, v50, "", v54, v51, v52, v53, v144);
                            goto LABEL_201;
                          }
                          goto LABEL_84;
                        }
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        if (gBBULogVerbosity < 0)
                          goto LABEL_145;
                        v91 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                        v92 = HIBYTE(v153[2]);
                        v93 = (char)v153[0];
                        ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("LSB"));
                        v97 = "%s: The MSB of the Plist (0x%08X) is not matched with the MSB of the fusing data from the "
                              "BB (0x%08X) at the address (0x%08X)\n";
                      }
                      else
                      {
                        if (gBBULogMaskGet(void)::once == -1)
                        {
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        else
                        {
                          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                          v67 = 1;
                          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
                            goto LABEL_145;
                        }
                        if (gBBULogVerbosity < 0)
                          goto LABEL_145;
                        v91 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                        v92 = HIBYTE(v153[2]);
                        v93 = (char)v153[0];
                        ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)&v154, CFSTR("LSB"));
                        v97 = "%s: The LSB of the Plist (0x%08X) is not matched with the LSB of the fusing data from the "
                              "BB (0x%08X) at the address (0x%08X)\n";
                      }
                      v98 = v153;
                      if (v92 < 0)
                        LOBYTE(v98) = v93;
                      _BBULog(13, 0, v91, "", v97, v94, v95, v96, (char)v98);
                      v67 = 1;
                      goto LABEL_145;
                    }
                    v66 = v62;
                    while (*(unsigned __int8 *)v65 == *(unsigned __int8 *)v66)
                    {
                      v65 = (const void **)((char *)v65 + 1);
                      v66 = (void **)((char *)v66 + 1);
                      if (!--v63)
                        goto LABEL_105;
                    }
                  }
                }
                v60 = (CFPropertyListFormat *)*((_QWORD *)v60 + 1);
                if (v60 == &format)
                  goto LABEL_112;
              }
            }
            if (gBBULogMaskGet(void)::once == -1)
            {
              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                goto LABEL_179;
            }
            else
            {
              dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
              if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
              {
LABEL_179:
                if ((gBBULogVerbosity & 0x80000000) == 0)
                {
                  v106 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                  _BBULog(13, 0, v106, "", "Failed to get dictionary from the fusing profile array\n", v107, v108, v109, v144);
                }
              }
            }
            MEMORY[0x212BF9A70](&v154);
            goto LABEL_182;
          }
        }
        else
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
          v41 = (const void *)v150;
          if (v150)
            v44 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
          else
            v44 = 0;
          if (v44)
            goto LABEL_52;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          v4 = 125;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_207;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          v4 = 125;
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_207;
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v45 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
          _BBULog(13, 0, v45, "", "Failed to get FusingProfile\n", v46, v47, v48, v144);
        }
LABEL_207:
        if (v41)
          CFRelease(v41);
        goto LABEL_7;
      }
      if ((_DWORD)v154 != (_DWORD)v14)
      {
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_43;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_43;
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v36 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
          _BBULog(13, 0, v36, "", "Copied length is different from the fusing source's size\n", v37, v38, v39, v144);
        }
        goto LABEL_43;
      }
      v25 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v26 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v16, v15);
      v27 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
      if (!v26)
        v27 = 0;
      if (v27)
      {
        format = kCFPropertyListXMLFormat_v1_0;
        v28 = CFPropertyListCreateWithData(v25, v26, 2uLL, &format, 0);
        v29 = v28;
        v153[0] = (void *)v28;
        v30 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
        if (!v28)
          v30 = 0;
        if (v30)
          v31 = v28 == 0;
        else
          v31 = 1;
        if (!v31)
        {
          Value = CFDictionaryGetValue((CFDictionaryRef)v28, CFSTR("FusingProfile"));
          v131 = Value;
          if (Value)
          {
            v132 = CFGetTypeID(Value);
            if (v132 == CFArrayGetTypeID())
            {
              v133 = CFGetTypeID(v131);
              if (v133 == CFArrayGetTypeID())
              {
                Copy = CFArrayCreateCopy(v25, (CFArrayRef)v131);
                v151[0] = Copy;
                if (Copy)
                  v135 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
                else
                  v135 = 0;
                if (v135)
                {
                  v150 = (unint64_t)Copy;
                  v151[0] = 0;
LABEL_245:
                  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v151);
                  goto LABEL_235;
                }
                if (gBBULogMaskGet(void)::once == -1)
                {
                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                    goto LABEL_242;
                }
                else
                {
                  dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
                  if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
                  {
LABEL_242:
                    if ((gBBULogVerbosity & 0x80000000) == 0)
                    {
                      v140 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                      _BBULog(13, 0, v140, "", "Failed to copy the array\n", v141, v142, v143, v144);
                    }
                  }
                }
                v150 = 0;
                goto LABEL_245;
              }
            }
          }
          if (gBBULogMaskGet(void)::once == -1)
          {
            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
              goto LABEL_232;
          }
          else
          {
            dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
            if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
            {
LABEL_232:
              if ((gBBULogVerbosity & 0x80000000) == 0)
              {
                v136 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
                _BBULog(13, 0, v136, "", "Failed to get fusing profile from the plist\n", v137, v138, v139, v144);
              }
            }
          }
          v150 = 0;
          goto LABEL_235;
        }
        if (gBBULogMaskGet(void)::once == -1)
        {
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_37;
        }
        else
        {
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
          if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
            goto LABEL_37;
        }
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v32 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
          _BBULog(13, 0, v32, "", "Failed to create fusing dictionary from the plist\n", v33, v34, v35, v144);
        }
LABEL_37:
        v150 = 0;
        if (!v29)
        {
LABEL_236:
          if (v26)
            CFRelease(v26);
          goto LABEL_44;
        }
LABEL_235:
        CFRelease(v29);
        goto LABEL_236;
      }
      if (gBBULogMaskGet(void)::once == -1)
      {
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
          goto LABEL_215;
      }
      else
      {
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
        {
LABEL_215:
          if ((gBBULogVerbosity & 0x80000000) == 0)
          {
            v122 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
            _BBULog(13, 0, v122, "", "Failed to create a data from the buffer\n", v123, v124, v125, v144);
          }
        }
      }
      v150 = 0;
      goto LABEL_236;
    }
    if (gBBULogMaskGet(void)::once == -1)
    {
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
        goto LABEL_13;
    }
    else
    {
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) != 0)
      {
LABEL_13:
        if ((gBBULogVerbosity & 0x80000000) == 0)
        {
          v17 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
          _BBULog(13, 0, v17, "", "Failed to get fusing source\n", v18, v19, v20, v144);
        }
      }
    }
    v150 = 0;
    goto LABEL_46;
  }
  if (gBBULogMaskGet(void)::once == -1)
  {
    v4 = 0;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    v4 = 0;
    if ((*(_BYTE *)(gBBULogMaskGet(void)::sBBULogMask + 1) & 0x20) == 0)
      goto LABEL_7;
  }
  if ((gBBULogVerbosity & 0x80000000) == 0)
  {
    v5 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
    _BBULog(13, 0, v5, "", "Fake Fusing is detected. Bypass the fusing check\n", v6, v7, v8, v144);
    v4 = 0;
  }
LABEL_7:
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), v4);
  return v4;
}

void sub_212B4BD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v10;
  const void *v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v12 = va_arg(va1, const void *);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((const void **)(v10 - 176));
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)(v10 - 152));
  ctu::cf::CFSharedRef<__CFData const>::~CFSharedRef((const void **)va);
  if (v9)
    operator delete(v9);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_212B4BDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  BBUEUR20Fusing::FusingData::~FusingData((BBUEUR20Fusing::FusingData *)va);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v15 - 184);
  _Unwind_Resume(a1);
}

void sub_212B4BE04()
{
  uint64_t v0;

  if (*(char *)(v0 - 153) < 0)
    JUMPOUT(0x212B4BE2CLL);
  JUMPOUT(0x212B4BE30);
}

void sub_212B4BE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  if (*(char *)(v8 - 129) < 0)
    operator delete(*(void **)(v8 - 152));
  MEMORY[0x212BF9A70](v8 - 128);
  std::list<std::string>::~list(v8 - 112);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef((uint64_t *)va);
  BBUEUR20Fusing::FusingData::~FusingData((BBUEUR20Fusing::FusingData *)va1);
  ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(v8 - 184);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFArray const>::~CFSharedRef(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void BBUEUR20Fusing::FusingData::~FusingData(BBUEUR20Fusing::FusingData *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 6);
  if (v2)
  {
    *((_QWORD *)this + 7) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 3);
  if (v3)
  {
    *((_QWORD *)this + 4) = v3;
    operator delete(v3);
  }
  v4 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v4;
    operator delete(v4);
  }
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const char *BBUEUR20Fusing::getDebugName(BBUEUR20Fusing *this)
{
  return "BBUEUR20Fusing";
}

uint64_t BBUEUR20Fusing::createFusingProgram(BBUEUR20Fusing *this, BBUDataSource *a2)
{
  return 0;
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  unsigned int *value;
  std::vector<unsigned int>::pointer end;
  unsigned int *v6;
  std::vector<unsigned int>::pointer begin;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  char *v14;
  size_t v15;
  unsigned int *v16;
  unsigned int *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 *v22;
  uint64_t v23;
  __int128 v24;
  int v25;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  v6 = end;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(end, 4 * __n);
      v6 = &end[__n];
    }
    this->__end_ = v6;
  }
  else
  {
    begin = this->__begin_;
    v8 = (char *)end - (char *)this->__begin_;
    v9 = v8 >> 2;
    v10 = (v8 >> 2) + __n;
    if (v10 >> 62)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = (char *)value - (char *)begin;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 62)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(4 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = 4 * __n;
    v16 = (unsigned int *)&v13[4 * v12];
    bzero(v14, v15);
    v17 = (unsigned int *)&v14[v15];
    if (end != begin)
    {
      v18 = (char *)end - (char *)begin - 4;
      if (v18 < 0x2C)
        goto LABEL_29;
      if ((unint64_t)((char *)end - v13 - v8) < 0x20)
        goto LABEL_29;
      v19 = (v18 >> 2) + 1;
      v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      v6 = &end[v20 / 0xFFFFFFFFFFFFFFFCLL];
      v14 -= v20;
      v21 = &v13[4 * v9 - 16];
      v22 = (__int128 *)(end - 4);
      v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v24 = *v22;
        *(v21 - 1) = *(v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 2;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_29:
        do
        {
          v25 = *--v6;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != begin);
      }
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v14;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

void std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<BBUDataSource *,std::shared_ptr<BBUDataSource>::__shared_ptr_default_delete<BBUDataSource,BBUDataSource>,std::allocator<BBUDataSource>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212B57059)
    return a1 + 24;
  if (((v3 & 0x8000000212B57059 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212B57059))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212B57059 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void *eUICC::eUICCVinylMAVValve::GetVinylType@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, void *a2@<X8>)
{
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  BOOL v11;
  char v12;

  v4 = eUICC::GetVinylType::Perform();
  v9 = v4;
  v10 = v5;
  if (v4)
    v11 = 0;
  else
    v11 = v5 == 1;
  v12 = v11;
  if (gBBULogMaskGet(void)::once != -1)
  {
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    if ((v12 & 1) != 0)
      goto LABEL_9;
LABEL_11:
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status 0x%hhx\n", v6, v7, v8, v9);
    return memcpy(a2, (char *)this + 8, 0x11AuLL);
  }
  if ((v12 & 1) == 0)
    goto LABEL_11;
LABEL_9:
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "status 0x%hhx cards_type: %hhu \n", v6, v7, v8, v10);
  *((_DWORD *)this + 2) = v10;
  *((_BYTE *)this + 285) = HIBYTE(v10);
  *((_BYTE *)this + 287) = HIBYTE(v10) == 3;
  return memcpy(a2, (char *)this + 8, 0x11AuLL);
}

void *eUICC::eUICCVinylMAVValve::GetData@<X0>(eUICC::eUICCVinylMAVValve *this@<X0>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, void *a5@<X8>)
{
  int *v6;
  __int128 v8;
  capabilities::updater *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  _BYTE v15[144];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[32];
  __int128 v20;
  __int128 v21;

  v6 = (int *)((char *)this + 8);
  if (*((_BYTE *)this + 289))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "eUICCVinylData cache is valid. Using cached data!\n", a2, a3, a4, v14);
    goto LABEL_7;
  }
  *(_OWORD *)((char *)this + 248) = 0u;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)((char *)this + 274) = 0u;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v8;
  v21 = v8;
  *(_OWORD *)v19 = v8;
  *(_OWORD *)&v19[16] = v8;
  v17 = v8;
  v18 = v8;
  *(_OWORD *)&v15[128] = v8;
  v16 = v8;
  *(_OWORD *)&v15[96] = v8;
  *(_OWORD *)&v15[112] = v8;
  *(_OWORD *)&v15[64] = v8;
  *(_OWORD *)&v15[80] = v8;
  *(_OWORD *)&v15[32] = v8;
  *(_OWORD *)&v15[48] = v8;
  *(_OWORD *)v15 = v8;
  *(_OWORD *)&v15[16] = v8;
  v9 = (capabilities::updater *)eUICC::GetData::Perform();
  *((_DWORD *)this + 2) = v15[8];
  *(_WORD *)((char *)this + 13) = bswap32(*(unsigned __int16 *)&v15[10]) >> 16;
  *(_OWORD *)((char *)this + 15) = *(_OWORD *)&v15[12];
  *((_BYTE *)this + 31) = v15[28];
  *((_OWORD *)this + 2) = *(_OWORD *)&v15[29];
  *((_OWORD *)this + 3) = *(_OWORD *)&v15[45];
  *((_OWORD *)this + 4) = *(_OWORD *)&v15[61];
  *((_OWORD *)this + 5) = *(_OWORD *)&v15[77];
  *(_DWORD *)((char *)this + 143) = *(_DWORD *)&v15[140];
  *((_OWORD *)this + 7) = *(_OWORD *)&v15[109];
  *((_OWORD *)this + 8) = *(_OWORD *)&v15[125];
  *((_OWORD *)this + 6) = *(_OWORD *)&v15[93];
  *(_DWORD *)((char *)this + 218) = *(_DWORD *)&v19[15];
  *(_OWORD *)((char *)this + 203) = *(_OWORD *)v19;
  *(_OWORD *)((char *)this + 187) = v18;
  *(_OWORD *)((char *)this + 171) = v17;
  *(_OWORD *)((char *)this + 155) = v16;
  *((_WORD *)this + 115) = *(_WORD *)&v19[19];
  *((_BYTE *)this + 250) = v19[31];
  *((_WORD *)this + 124) = *(_WORD *)&v19[29];
  *(_OWORD *)((char *)this + 267) = v21;
  *(_OWORD *)((char *)this + 251) = v20;
  *((_BYTE *)this + 12) = v15[9];
  *(_WORD *)((char *)this + 283) = -21846;
  *((_BYTE *)this + 286) = v15[8] == 4;
  *((_BYTE *)this + 288) = v15[8] == 15;
  if (*((_DWORD *)this + 2) == capabilities::updater::EUICCVinylSuccessStatus(v9))
  {
    *((_BYTE *)this + 289) = 1;
LABEL_7:
    eUICC::logEUICCData(v6);
    return memcpy(a5, v6, 0x11AuLL);
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "error %d status %u sw1_sw2 0x%x\n", v10, v11, v12, v15[0]);
  return memcpy(a5, v6, 0x11AuLL);
}

uint64_t eUICC::eUICCVinylMAVValve::SetCardMode(uint64_t a1, int a2, char a3)
{
  capabilities::updater *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  _QWORD __src[37];

  __src[36] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)a1 + 8))(__src);
  v6 = (capabilities::updater *)memcpy((void *)(a1 + 8), __src, 0x11AuLL);
  if (*(_DWORD *)(a1 + 8) != capabilities::updater::EUICCVinylSuccessStatus(v6))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v7, v8, v9, (char)"outData.Valid()");
    return 18;
  }
  if ((a3 & 1) == 0 && *(unsigned __int8 *)(a1 + 31) == a2)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Baseband already in mode %hhu\n", v7, v8, v9, a2);
    return 0;
  }
  v10 = *(_DWORD *)(a1 + 292);
  __src[0] = *(_QWORD *)(a1 + 296);
  LOBYTE(__src[1]) = v10;
  BYTE1(__src[1]) = a2;
  WORD1(__src[1]) = 1;
  HIDWORD(__src[1]) = 10000;
  v11 = eUICC::SwitchMode::Perform();
  if (v11 || (v12 & 0xFF00000000) != 0x100000000 || a2 != BYTE5(v12))
  {
    if (gBBULogMaskGet(void)::once != -1)
    {
      v17 = v11;
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      LOBYTE(v11) = v17;
    }
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "SwitchCardMode: Failed err %d status %hhu mode %d sw1 0x%x sw2 0x%x\n", v13, v14, v15, v11);
    return 18;
  }
  return 0;
}

uint64_t eUICC::eUICCVinylMAVValve::InstallTicket(uint64_t a1, CFDataRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  if (*a2)
    v8 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  else
    v8 = 0;
  if (v8)
  {
    v10 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 16))(a1, 0, 0);
    if ((_DWORD)v10)
    {
      v14 = v10;
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"kBBUReturnSuccess == ret");
      return v14;
    }
    else
    {
      CFDataGetBytePtr(*a2);
      CFDataGetLength(*a2);
      v16 = eUICC::InstallTicket::Perform();
      v21 = v16;
      if (v16 || (v17 & 0xFF00000000) != 0x100000000)
      {
        if (gBBULogMaskGet(void)::once != -1)
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "InstallTicket failed error %d status %hhu sw1 0x%x sw2 0x%x\n", v18, v19, v20, v21);
        return 16;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", a6, a7, a8, (char)"installTicket");
    return 2;
  }
}

uint64_t eUICC::eUICCVinylMAVValve::StreamFirmware(_DWORD *a1, uint64_t a2)
{
  _BYTE *v3;
  _BYTE *v4;
  capabilities::updater *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v52;
  size_t __sz;
  void *v54[3];
  _QWORD __src[38];

  __src[36] = *MEMORY[0x24BDAC8D0];
  memset(v54, 170, sizeof(v54));
  (*(void (**)(void **__return_ptr))(**(_QWORD **)a2 + 24))(v54);
  v3 = v54[1];
  v4 = v54[0];
  (*(void (**)(_QWORD *__return_ptr, _DWORD *))(*(_QWORD *)a1 + 8))(__src, a1);
  v5 = (capabilities::updater *)memcpy(a1 + 2, __src, 0x11AuLL);
  if (a1[2] != capabilities::updater::EUICCVinylSuccessStatus(v5))
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v6, v7, v8, (char)"outData.Valid()");
    v19 = 18;
    v20 = v54[0];
    if (v54[0])
      goto LABEL_56;
    return v19;
  }
  v9 = *((unsigned __int8 *)a1 + 284);
  if (!*((_BYTE *)a1 + 284))
    v9 = *((unsigned __int8 *)a1 + 304);
  v10 = v9;
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "~~~~ MAX APDU PER SET: %zu  ~~~~\n", v6, v7, v8, v10);
  v14 = (v3 - v4) >> 5;
  if (v14 % v10)
    v15 = v14 / v10 + 1;
  else
    v15 = v14 / v10;
  if (!v15)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v11, v12, v13, (char)"apduSetCount");
    v19 = 15;
    v20 = v54[0];
    if (v54[0])
      goto LABEL_56;
    return v19;
  }
  v19 = (*(uint64_t (**)(_DWORD *, uint64_t, _QWORD))(*(_QWORD *)a1 + 16))(a1, 1, 0);
  if ((_DWORD)v19)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v16, v17, v18, (char)"kBBUReturnSuccess == ret");
LABEL_55:
    v20 = v54[0];
    if (v54[0])
      goto LABEL_56;
    return v19;
  }
  v21 = 0;
  v22 = 0;
  v52 = 0;
  v23 = 480;
  if ((_DWORD)v10)
    v23 = 32 * v10;
  __sz = v23;
  v24 = v14;
  do
  {
    v25 = v24 - v10;
    if (v24 >= v10)
      v26 = v10;
    else
      v26 = v24;
    if (v14 - v22 * v10 >= v10)
      v27 = v10;
    else
      v27 = v14 - v22 * v10;
    *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__src[1] = v28;
    *(_OWORD *)&__src[3] = v28;
    LODWORD(__src[4]) = 15000;
    __src[2] = operator new[](__sz);
    __src[3] = v10;
    __src[0] = *((_QWORD *)a1 + 37);
    LOBYTE(__src[1]) = a1[73];
    WORD1(__src[1]) = v15;
    WORD2(__src[1]) = v22;
    BYTE6(__src[1]) = v27;
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "StreamFirmware set %d/%zu adpusThisSet %zu\n", v29, v30, v31, v22);
    if (v27)
    {
      v35 = 0;
      v36 = 24;
      v37 = v21;
      while (__src[3] >= v35)
      {
        v38 = *(_QWORD *)((char *)v54[0] + v37);
        v39 = *(_QWORD *)((char *)v54[0] + v37 + 16);
        v40 = *(_QWORD *)((char *)v54[0] + v37 + 24);
        v41 = (_QWORD *)(__src[2] + v36);
        *(v41 - 3) = *(_QWORD *)((char *)v54[0] + v37 + 8);
        *(v41 - 2) = v38;
        *(v41 - 1) = v40;
        *v41 = v39;
        ++v35;
        v37 += 32;
        v36 += 32;
        if (v26 == v35)
          goto LABEL_37;
      }
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v32, v33, v34, (char)"j <= req.apdu_payload.apdu_data_size");
      if (gBBULogMaskGet(void)::once != -1)
        dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
      _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed SteamAPDU index '%d' is greater than max array size '%zu'", v48, v49, v50, v35);
      v46 = 0;
      v47 = (void *)__src[2];
      __src[2] = 0;
      if (v47)
LABEL_44:
        operator delete[](v47);
    }
    else
    {
LABEL_37:
      if (eUICC::StreamAPDU::Perform() || (v42 & 0xFF00000000) != 0x100000000)
      {
        if (gBBULogMaskGet(void)::once != -1)
          dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
        _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed StreamAPDU set %d/%zu, error %d status %hhu sw1 0x%x sw2 0x%x\n", v43, v44, v45, v22);
        v46 = 0;
        v52 = 16;
        v47 = (void *)__src[2];
        __src[2] = 0;
        if (v47)
          goto LABEL_44;
      }
      else
      {
        v46 = 1;
        v47 = (void *)__src[2];
        __src[2] = 0;
        if (v47)
          goto LABEL_44;
      }
    }
    if ((v46 & 1) == 0)
    {
      v19 = v52;
      goto LABEL_55;
    }
    ++v22;
    v21 += 32 * v10;
    v24 = v25;
  }
  while (v22 != v15);
  v19 = 0;
  v20 = v54[0];
  if (!v54[0])
    return v19;
LABEL_56:
  v54[1] = v20;
  operator delete(v20);
  return v19;
}

void sub_212B4CF54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (!__p)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t eUICC::eUICCVinylMAVValve::DeleteProfile(eUICC::eUICCVinylMAVValve *this)
{
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  result = eUICC::DeleteProfile::Perform();
  v6 = result;
  if ((_DWORD)result || v2 != 1)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "DeleteProfile failed, error %d status %hhu sw1 0x%x sw2 0x%x\n", v3, v4, v5, v6);
    return 18;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::StoreData(uint64_t a1)
{
  _WORD *v1;
  _WORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD __b[1505];
  uint64_t v13;

  MEMORY[0x24BDAC7A8](a1);
  v2 = v1;
  v4 = v3;
  v13 = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, sizeof(__b));
  eUICC::StoreData::Perform();
  if (__b[0] || LOBYTE(__b[3]) != 1)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v5, v6, v7, (char)"rsp.Valid()");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to StoreData status %hhu SW1 0x%x SW2 0x%x\n", v9, v10, v11, __b[3]);
    return 18;
  }
  else
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v4, (char *)&__b[4] + 1, (char *)&__b[4] + *(unsigned __int16 *)((char *)&__b[3] + 3) + 1, *(unsigned __int16 *)((char *)&__b[3] + 3));
    result = 0;
    *v2 = bswap32(*(unsigned __int16 *)((char *)&__b[3] + 1)) >> 16;
  }
  return result;
}

uint64_t eUICC::eUICCVinylMAVValve::InitPerso(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  int v5;
  const void *v6;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _BYTE __dst[18];
  uint64_t v22;
  char v23;
  __int16 v24;
  char v25;
  __int16 v26;
  __int128 v27;
  __int16 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&__dst[6] = 0;
  *(_QWORD *)__dst = 0;
  *(_DWORD *)&__dst[14] = 30000;
  v4 = *(_QWORD *)(a1 + 296);
  v5 = *(_DWORD *)(a1 + 292);
  v6 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8) - (_QWORD)v6;
  if (v8 >= 0xC)
    v9 = 12;
  else
    v9 = v8;
  memcpy(__dst, v6, v9);
  v22 = v4;
  v23 = v5;
  v24 = 0;
  v25 = 0;
  v26 = v9;
  v27 = *(_OWORD *)__dst;
  v28 = *(_WORD *)&__dst[16];
  memset(__dst, 170, 16);
  eUICC::InitPersoSession::Perform();
  if (!*(_QWORD *)__dst)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    v13 = 11;
    v14 = *(std::__shared_weak_count **)&__dst[8];
    if (!*(_QWORD *)&__dst[8])
      return v13;
LABEL_19:
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!**(_DWORD **)__dst && *(_BYTE *)(*(_QWORD *)__dst + 8) == 1 && *(_WORD *)(*(_QWORD *)__dst + 11))
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(*(_QWORD *)__dst + 13), (char *)(*(_QWORD *)__dst + 13 + *(unsigned __int16 *)(*(_QWORD *)__dst + 11)), *(unsigned __int16 *)(*(_QWORD *)__dst + 11));
    v13 = 0;
    v14 = *(std::__shared_weak_count **)&__dst[8];
    if (!*(_QWORD *)&__dst[8])
      return v13;
    goto LABEL_19;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to InitPerso status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v15, v16, v17, *(_BYTE *)(*(_QWORD *)__dst + 8));
  v13 = 18;
  v14 = *(std::__shared_weak_count **)&__dst[8];
  if (*(_QWORD *)&__dst[8])
    goto LABEL_19;
  return v13;
}

void sub_212B4D4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::AuthPerso(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _BYTE *v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v6 = operator new(0x818uLL);
  bzero(v6 + 8, 0x810uLL);
  *((_DWORD *)v6 + 516) = 30000;
  *(_QWORD *)v6 = *(_QWORD *)(a1 + 296);
  v6[8] = *(_DWORD *)(a1 + 292);
  v7 = *(const void **)a2;
  if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 >= 0x800uLL)
    v8 = 2048;
  else
    v8 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  memcpy(v6 + 14, v7, v8);
  *((_WORD *)v6 + 6) = v8;
  eUICC::AuthPersoSession::Perform();
  if (!MEMORY[0xAAAAAAAAAAAAAAAA] && MEMORY[0xAAAAAAAAAAAAAAB2] == 1 && MEMORY[0xAAAAAAAAAAAAAAB5])
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)0xAAAAAAAAAAAAAAB7, (char *)(MEMORY[0xAAAAAAAAAAAAAAB5] - 0x5555555555555549), MEMORY[0xAAAAAAAAAAAAAAB5]);
    v12 = 0;
  }
  else
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v9, v10, v11, (char)"rsp->Valid() && rsp->contents.rsp_len");
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v13, v14, v15, MEMORY[0xAAAAAAAAAAAAAAB2]);
    v12 = 18;
  }
  do
    v16 = __ldaxr((unint64_t *)0xAAAAAAAAAAAAAAB2);
  while (__stlxr(v16 - 1, (unint64_t *)0xAAAAAAAAAAAAAAB2));
  if (!v16)
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  operator delete(v6);
  return v12;
}

void sub_212B4D730(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212B4D744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  va_list va;

  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  operator delete(v5);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::FinalizePerso(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  const void *v5;
  unint64_t v7;
  size_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _OWORD __dst[17];
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;
  __int16 v27;
  _BYTE v28[266];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  memset(__dst, 0, 266);
  *(_DWORD *)((char *)&__dst[16] + 2) = 30000;
  v3 = *(_QWORD *)(a1 + 296);
  v4 = *(_DWORD *)(a1 + 292);
  v5 = *(const void **)a2;
  v7 = *(_QWORD *)(a2 + 8) - (_QWORD)v5;
  if (v7 >= 0x100)
    v8 = 256;
  else
    v8 = v7;
  memcpy(__dst, v5, v8);
  v9 = *(_BYTE *)(a1 + 290);
  v22 = v3;
  v23 = v4;
  v24 = 0;
  v25 = v9;
  v26 = 0;
  v27 = v8;
  memcpy(v28, __dst, sizeof(v28));
  *(_QWORD *)&__dst[0] = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&__dst[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
  eUICC::FinalizePersoSession::Perform();
  if (!*(_QWORD *)&__dst[0])
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    v13 = 11;
    v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst[0] + 1);
    if (!*((_QWORD *)&__dst[0] + 1))
      return v13;
LABEL_18:
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!**(_DWORD **)&__dst[0] && *(_BYTE *)(*(_QWORD *)&__dst[0] + 8) == 1)
  {
    v13 = 0;
    v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst[0] + 1);
    if (!*((_QWORD *)&__dst[0] + 1))
      return v13;
    goto LABEL_18;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid()");
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to FinalizePersoDevice status %hhu SW1 0x%x SW2 0x%x\n", v15, v16, v17, *(_BYTE *)(*(_QWORD *)&__dst[0] + 8));
  v13 = 18;
  v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst[0] + 1);
  if (*((_QWORD *)&__dst[0] + 1))
    goto LABEL_18;
  return v13;
}

void sub_212B4DA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t eUICC::eUICCVinylMAVValve::ValidatePerso(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  int v5;
  const void *v6;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  __int128 __dst;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  uint64_t v25;
  char v26;
  char v27;
  __int16 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[28];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  memset(v24, 0, 28);
  __dst = 0u;
  v22 = 0u;
  DWORD1(v24[1]) = 30000;
  v4 = *(_QWORD *)(a1 + 296);
  v5 = *(_DWORD *)(a1 + 292);
  v6 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8) - (_QWORD)v6;
  if (v8 >= 0x41)
    v9 = 65;
  else
    v9 = v8;
  memcpy(&__dst, v6, v9);
  v30 = v22;
  v31 = v23;
  *(_OWORD *)v32 = v24[0];
  *(_OWORD *)&v32[12] = *(_OWORD *)((char *)v24 + 12);
  v25 = v4;
  v26 = v5;
  v27 = 0;
  v28 = v9;
  v29 = __dst;
  *(_QWORD *)&__dst = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&__dst + 1) = 0xAAAAAAAAAAAAAAAALL;
  eUICC::ValidatePerso::Perform();
  if (!(_QWORD)__dst)
  {
    if (gBBULogMaskGet(void)::once != -1)
      dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
    _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp");
    v13 = 11;
    v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
    if (!*((_QWORD *)&__dst + 1))
      return v13;
LABEL_19:
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    return v13;
  }
  if (!*(_DWORD *)__dst && *(_BYTE *)(__dst + 8) == 1 && *(_WORD *)(__dst + 11))
  {
    std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, (char *)(__dst + 13), (char *)(__dst + 13 + *(unsigned __int16 *)(__dst + 11)), *(unsigned __int16 *)(__dst + 11));
    v13 = 0;
    v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
    if (!*((_QWORD *)&__dst + 1))
      return v13;
    goto LABEL_19;
  }
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(25, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Condition <<%s>> failed %s %s/%d\n", v10, v11, v12, (char)"rsp->Valid() && rsp->contents.rsp_len");
  if (gBBULogMaskGet(void)::once != -1)
    dispatch_once(&gBBULogMaskGet(void)::once, &__block_literal_global_5);
  _BBULog(22, 0xFFFFFFFFLL, "eUICCVinylMAVValve", "", "Failed to AuthenticatePersoDevice status %hhu SW1 0x%x SW2 0x%x rsp_len %u\n", v15, v16, v17, *(_BYTE *)(__dst + 8));
  v13 = 18;
  v14 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
  if (*((_QWORD *)&__dst + 1))
    goto LABEL_19;
  return v13;
}

void sub_212B4DCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<boost::msm::back::state_machine<BBUpdaterControllerFSM::ControllerFSM_TOP,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_,boost::parameter::void_>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AMSupportCopyDataFromAsciiEncodedHex()
{
  return MEMORY[0x24BED9F68]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x24BED9FD8]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x24BEDA030]();
}

uint64_t AMSupportHexAsciiToNumeric()
{
  return MEMORY[0x24BEDA038]();
}

uint64_t AMSupportSafeRetain()
{
  return MEMORY[0x24BEDA0E8]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x24BEDA0F0]();
}

uint64_t AMSupportWriteDictionarytoFileURL()
{
  return MEMORY[0x24BEDA0F8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC378](data, *(_QWORD *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBE80](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
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

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
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

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
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

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x24BDBC5B8](theString, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC748](theString, locale);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC9E0](stream, buffer, bufferLength);
}

uint64_t ETLBBGetVersion()
{
  return MEMORY[0x24BED3E40]();
}

uint64_t ETLBBSimulateCrash()
{
  return MEMORY[0x24BED3E58]();
}

uint64_t ETLCDMAGetMEID()
{
  return MEMORY[0x24BED3E60]();
}

uint64_t ETLCDMAIsValidMEID()
{
  return MEMORY[0x24BED3E68]();
}

uint64_t ETLCDMAMakeMEID()
{
  return MEMORY[0x24BED3E70]();
}

uint64_t ETLCDMAMakeStringFromMEID()
{
  return MEMORY[0x24BED3E78]();
}

uint64_t ETLDLOADCommandCreateGoRequest()
{
  return MEMORY[0x24BED3CF8]();
}

uint64_t ETLDLOADCommandCreateParametersRequest()
{
  return MEMORY[0x24BED3D10]();
}

uint64_t ETLDLOADCommandCreateSerialNumberRequest()
{
  return MEMORY[0x24BED3D18]();
}

uint64_t ETLDLOADCommandCreateVersionRequest()
{
  return MEMORY[0x24BED3D20]();
}

uint64_t ETLDLOADCommandCreateWriteRequest()
{
  return MEMORY[0x24BED3D28]();
}

uint64_t ETLDLOADCommandParseACKNAKResponse()
{
  return MEMORY[0x24BED3D38]();
}

uint64_t ETLDLOADCommandParseParametersResponse()
{
  return MEMORY[0x24BED3D48]();
}

uint64_t ETLDLOADCommandParseSerialNumberResponse()
{
  return MEMORY[0x24BED3D50]();
}

uint64_t ETLDLOADCommandParseVersionResponse()
{
  return MEMORY[0x24BED3D58]();
}

uint64_t ETLDLOADCommandReceiveSmallWithFlags()
{
  return MEMORY[0x24BED3D68]();
}

uint64_t ETLDLOADCommandSend()
{
  return MEMORY[0x24BED3D78]();
}

uint64_t ETLDLOADGetNAKReasonAsString()
{
  return MEMORY[0x24BED3D80]();
}

uint64_t ETLDebugRegisterDelegate()
{
  return MEMORY[0x24BED3E80]();
}

uint64_t ETLEFSDUmpCopyCrashLocationDetails()
{
  return MEMORY[0x24BED4020]();
}

uint64_t ETLEFSDumpInfoFree()
{
  return MEMORY[0x24BED4028]();
}

uint64_t ETLEFSDumpInterpret()
{
  return MEMORY[0x24BED4030]();
}

uint64_t ETLEFSearchBasebandCrashReasonM20()
{
  return MEMORY[0x24BED4038]();
}

uint64_t ETLFusingGetFusedData()
{
  return MEMORY[0x24BED3EB0]();
}

uint64_t ETLFusingGetSecureState()
{
  return MEMORY[0x24BED3EB8]();
}

uint64_t ETLFusingProgramQfpromFuse()
{
  return MEMORY[0x24BED3EC0]();
}

uint64_t ETLFusingProgramTriggerM20()
{
  return MEMORY[0x24BED3EC8]();
}

uint64_t ETLFusingReadQfpromFuse()
{
  return MEMORY[0x24BED3ED0]();
}

uint64_t ETLFusingVerifyQfpromFuse()
{
  return MEMORY[0x24BED3ED8]();
}

uint64_t ETLGSMGetIMEI()
{
  return MEMORY[0x24BED3EE0]();
}

uint64_t ETLGSMIsValidIMEI()
{
  return MEMORY[0x24BED3EE8]();
}

uint64_t ETLGSMMakeStringFromIMEI()
{
  return MEMORY[0x24BED3EF0]();
}

uint64_t ETLMaverickGetBasebandInitStatusEx()
{
  return MEMORY[0x24BED3F00]();
}

uint64_t ETLMaverickGetCarrierID()
{
  return MEMORY[0x24BED3F08]();
}

uint64_t ETLMaverickGetFusingStatus()
{
  return MEMORY[0x24BED3F10]();
}

uint64_t ETLMaverickGetIMEI()
{
  return MEMORY[0x24BED3F18]();
}

uint64_t ETLMaverickGetIMEISwVersion()
{
  return MEMORY[0x24BED3F20]();
}

uint64_t ETLMaverickGetManifestStatus()
{
  return MEMORY[0x24BED3F28]();
}

uint64_t ETLMaverickManifestStatusFree()
{
  return MEMORY[0x24BED3F30]();
}

uint64_t ETLMaverickManifestStatusGetHashSize()
{
  return MEMORY[0x24BED3F38]();
}

uint64_t ETLMaverickManifestStatusInit()
{
  return MEMORY[0x24BED3F40]();
}

uint64_t ETLMaverickReadNonce()
{
  return MEMORY[0x24BED3F50]();
}

uint64_t ETLMaverickReadPublicKeyHash()
{
  return MEMORY[0x24BED3F58]();
}

uint64_t ETLMaverickReadSerialNumberAndChipID()
{
  return MEMORY[0x24BED3F60]();
}

uint64_t ETLMaverickSetIMEISwVersion()
{
  return MEMORY[0x24BED3F70]();
}

uint64_t ETLMaverickWriteDefaultNVs()
{
  return MEMORY[0x24BED3F78]();
}

uint64_t ETLMaverickWriteFATPDefaultNVs()
{
  return MEMORY[0x24BED3F80]();
}

uint64_t ETLMaverickWriteFactoryDefaultNVs()
{
  return MEMORY[0x24BED3F88]();
}

uint64_t ETLProvisionFinish()
{
  return MEMORY[0x24BED3F90]();
}

uint64_t ETLProvisionGetStateAsString()
{
  return MEMORY[0x24BED3F98]();
}

uint64_t ETLProvisionGetStatus()
{
  return MEMORY[0x24BED3FA0]();
}

uint64_t ETLProvisionParseStatus()
{
  return MEMORY[0x24BED3FA8]();
}

uint64_t ETLProvisionStart()
{
  return MEMORY[0x24BED3FB0]();
}

uint64_t ETLSAHCommandCreateDone()
{
  return MEMORY[0x24BED4040]();
}

uint64_t ETLSAHCommandCreateHelloResponse()
{
  return MEMORY[0x24BED4048]();
}

uint64_t ETLSAHCommandCreateHelloResponseExt()
{
  return MEMORY[0x24BED4050]();
}

uint64_t ETLSAHCommandCreateMaverickConfigResponse()
{
  return MEMORY[0x24BED4058]();
}

uint64_t ETLSAHCommandCreateMaverickEraseResponse()
{
  return MEMORY[0x24BED4060]();
}

uint64_t ETLSAHCommandCreateMaverickHashResponse()
{
  return MEMORY[0x24BED4068]();
}

uint64_t ETLSAHCommandCreateMaverickRootManifestResponse()
{
  return MEMORY[0x24BED4070]();
}

uint64_t ETLSAHCommandCreateReset()
{
  return MEMORY[0x24BED4078]();
}

uint64_t ETLSAHCommandCreateSwitchMode()
{
  return MEMORY[0x24BED4080]();
}

uint64_t ETLSAHCommandExecute()
{
  return MEMORY[0x24BED4088]();
}

uint64_t ETLSAHCommandMaverickParseEnd()
{
  return MEMORY[0x24BED4090]();
}

uint64_t ETLSAHCommandParseChipID()
{
  return MEMORY[0x24BED4098]();
}

uint64_t ETLSAHCommandParseCommandReady()
{
  return MEMORY[0x24BED40A0]();
}

uint64_t ETLSAHCommandParseDoneResponse()
{
  return MEMORY[0x24BED40A8]();
}

uint64_t ETLSAHCommandParseEndOfImageTransfer()
{
  return MEMORY[0x24BED40B0]();
}

uint64_t ETLSAHCommandParseHello()
{
  return MEMORY[0x24BED40B8]();
}

uint64_t ETLSAHCommandParseMaverickConfigQuery()
{
  return MEMORY[0x24BED40C0]();
}

uint64_t ETLSAHCommandParseMaverickEraseQuery()
{
  return MEMORY[0x24BED40C8]();
}

uint64_t ETLSAHCommandParseMaverickRootManifestQuery()
{
  return MEMORY[0x24BED40D0]();
}

uint64_t ETLSAHCommandParseMaverickSendHashesQuery()
{
  return MEMORY[0x24BED40D8]();
}

uint64_t ETLSAHCommandParseReadData()
{
  return MEMORY[0x24BED40E0]();
}

uint64_t ETLSAHCommandReceive()
{
  return MEMORY[0x24BED40E8]();
}

uint64_t ETLSAHCommandSend()
{
  return MEMORY[0x24BED40F0]();
}

uint64_t ETLSAHExecutionCommandIDAsString()
{
  return MEMORY[0x24BED40F8]();
}

uint64_t ETLSAHGetDebugRecordCount()
{
  return MEMORY[0x24BED4100]();
}

uint64_t ETLSAHGetDebugTable()
{
  return MEMORY[0x24BED4108]();
}

uint64_t ETLSAHGetRecordEx()
{
  return MEMORY[0x24BED4110]();
}

uint64_t ETLSAHModeAsString()
{
  return MEMORY[0x24BED4118]();
}

uint64_t ETLSAHReturnAsString()
{
  return MEMORY[0x24BED4120]();
}

uint64_t ETLSAHSendReadData()
{
  return MEMORY[0x24BED4128]();
}

uint64_t HDLCFrameFree()
{
  return MEMORY[0x24BED43C8]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t KTLBspSetNvItemsToState()
{
  return MEMORY[0x24BED4BC8]();
}

uint64_t KTLCDProcessCoredumpEntry()
{
  return MEMORY[0x24BED4BD0]();
}

uint64_t KTLCDSendEndCoredumpCommand()
{
  return MEMORY[0x24BED4BD8]();
}

uint64_t KTLCDSendStartCoredumpCommand()
{
  return MEMORY[0x24BED4BE0]();
}

uint64_t KTLCloseChannel()
{
  return MEMORY[0x24BED4BE8]();
}

uint64_t KTLCpsGetSvn()
{
  return MEMORY[0x24BED4BF0]();
}

uint64_t KTLCpsSetSvn()
{
  return MEMORY[0x24BED4BF8]();
}

uint64_t KTLCreateEBLLengthPacket()
{
  return MEMORY[0x24BED4C00]();
}

uint64_t KTLDebugRegisterDelegate()
{
  return MEMORY[0x24BED4C08]();
}

uint64_t KTLEBLCreateDoneACKPacket()
{
  return MEMORY[0x24BED4C18]();
}

uint64_t KTLEBLCreateStartACKPacket()
{
  return MEMORY[0x24BED4C20]();
}

uint64_t KTLEBLParseDone()
{
  return MEMORY[0x24BED4C28]();
}

uint64_t KTLEBLParseReadfileExt()
{
  return MEMORY[0x24BED4C30]();
}

uint64_t KTLEBLParseStartInfo()
{
  return MEMORY[0x24BED4C38]();
}

uint64_t KTLEBLReceivePacket()
{
  return MEMORY[0x24BED4C40]();
}

uint64_t KTLEBLSendPacket()
{
  return MEMORY[0x24BED4C48]();
}

uint64_t KTLEBLSendReadfileData()
{
  return MEMORY[0x24BED4C50]();
}

uint64_t KTLFinishProvision()
{
  return MEMORY[0x24BED4C58]();
}

uint64_t KTLGetFirmwareVersion()
{
  return MEMORY[0x24BED4C60]();
}

uint64_t KTLGetIMEI_V2()
{
  return MEMORY[0x24BED4C68]();
}

uint64_t KTLGetMEID()
{
  return MEMORY[0x24BED4C70]();
}

uint64_t KTLGetManifestStatus()
{
  return MEMORY[0x24BED4C78]();
}

uint64_t KTLGetPersonalizationInfo()
{
  return MEMORY[0x24BED4C80]();
}

uint64_t KTLInitOptions()
{
  return MEMORY[0x24BED4C88]();
}

uint64_t KTLIsValidIMEIString()
{
  return MEMORY[0x24BED4C90]();
}

uint64_t KTLIsValidMEIDString()
{
  return MEMORY[0x24BED4C98]();
}

uint64_t KTLNVMReadUpdateHeader()
{
  return MEMORY[0x24BED4CA0]();
}

uint64_t KTLNVMSendDeregister()
{
  return MEMORY[0x24BED4CA8]();
}

uint64_t KTLNVMSendRegister()
{
  return MEMORY[0x24BED4CB0]();
}

uint64_t KTLNVMSendSnapshot()
{
  return MEMORY[0x24BED4CB8]();
}

uint64_t KTLNVMSendUpdateAck()
{
  return MEMORY[0x24BED4CC0]();
}

uint64_t KTLOpenChannel()
{
  return MEMORY[0x24BED4CC8]();
}

uint64_t KTLPSIFormatEnhancedCommand()
{
  return MEMORY[0x24BED4CD0]();
}

uint64_t KTLPSIFormatEnhancedCommandMrcData()
{
  return MEMORY[0x24BED4CD8]();
}

uint64_t KTLPSIReadMrcResponse()
{
  return MEMORY[0x24BED4CE0]();
}

uint64_t KTLPSIReadResponse()
{
  return MEMORY[0x24BED4CE8]();
}

uint64_t KTLPSISendEnhancedCommand()
{
  return MEMORY[0x24BED4CF0]();
}

uint64_t KTLPSISendMrcTrainingCommand()
{
  return MEMORY[0x24BED4CF8]();
}

uint64_t KTLParseEBLDownloadResult()
{
  return MEMORY[0x24BED4D00]();
}

uint64_t KTLParseEBLLengthAck()
{
  return MEMORY[0x24BED4D08]();
}

uint64_t KTLParsePSIICEHashResponse()
{
  return MEMORY[0x24BED4D10]();
}

uint64_t KTLParsePSIICEHashResponseSha384()
{
  return MEMORY[0x24BED4D18]();
}

uint64_t KTLParsePSIICEPersonalizionInfo()
{
  return MEMORY[0x24BED4D20]();
}

uint64_t KTLParsePSIRunning()
{
  return MEMORY[0x24BED4D28]();
}

uint64_t KTLPing()
{
  return MEMORY[0x24BED4D30]();
}

uint64_t KTLRawReceiveData()
{
  return MEMORY[0x24BED4D38]();
}

uint64_t KTLRawSendData()
{
  return MEMORY[0x24BED4D40]();
}

uint64_t KTLSecGetChipId()
{
  return MEMORY[0x24BED4D48]();
}

uint64_t KTLSecGetFusingState()
{
  return MEMORY[0x24BED4D50]();
}

uint64_t KTLSecGetPkHash()
{
  return MEMORY[0x24BED4D58]();
}

uint64_t KTLSecGetSNUM()
{
  return MEMORY[0x24BED4D60]();
}

uint64_t KTLSendEBLImage()
{
  return MEMORY[0x24BED4D68]();
}

uint64_t KTLSendEBLImageNoXor()
{
  return MEMORY[0x24BED4D70]();
}

uint64_t KTLStartProvision()
{
  return MEMORY[0x24BED4D78]();
}

uint64_t PSIModeDescription()
{
  return MEMORY[0x24BED4D80]();
}

uint64_t RPCopyProxyDictionary()
{
  return MEMORY[0x24BED8C70]();
}

uint64_t RPRegisterForAvailability()
{
  return MEMORY[0x24BED8C80]();
}

uint64_t RPRegistrationInvalidate()
{
  return MEMORY[0x24BED8C90]();
}

uint64_t RPRegistrationResume()
{
  return MEMORY[0x24BED8CA0]();
}

uint64_t TelephonyBasebandCrashModemWithSPMI()
{
  return MEMORY[0x24BED8D50]();
}

uint64_t TelephonyBasebandCrashModemWithSPMIWithReason()
{
  return MEMORY[0x24BED8D58]();
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x24BED8D60]();
}

uint64_t TelephonyBasebandForceResetModem()
{
  return MEMORY[0x24BED8D70]();
}

uint64_t TelephonyBasebandGetPMUTrace()
{
  return MEMORY[0x24BED8D98]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x24BED8DA8]();
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x24BED8A38]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x24BED8A40]();
}

uint64_t TelephonyBasebandPMUTraceToString()
{
  return MEMORY[0x24BED8DB0]();
}

uint64_t TelephonyBasebandPowerOnModem()
{
  return MEMORY[0x24BED8DC0]();
}

uint64_t TelephonyBasebandPowercycleModem()
{
  return MEMORY[0x24BED8DC8]();
}

uint64_t TelephonyBasebandRegisterForReset()
{
  return MEMORY[0x24BED8DD8]();
}

uint64_t TelephonyBasebandResetModem()
{
  return MEMORY[0x24BED8DE0]();
}

uint64_t TelephonyBasebandSetBasebandProperty()
{
  return MEMORY[0x24BED8DF0]();
}

uint64_t TelephonyBasebandSetBasebandState()
{
  return MEMORY[0x24BED8DF8]();
}

uint64_t TelephonyBasebandSetModemCoredumpGPIO()
{
  return MEMORY[0x24BED8E10]();
}

uint64_t TelephonyCapabilitiesGetHardwareModel()
{
  return MEMORY[0x24BED96A8]();
}

uint64_t TelephonyCapabilitiesSetHardwareModelFromString()
{
  return MEMORY[0x24BED96C8]();
}

uint64_t TelephonyRadiosGetHardwareConfig()
{
  return MEMORY[0x24BED96D0]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x24BED96D8]();
}

uint64_t TelephonyUtilBinToHex()
{
  return MEMORY[0x24BED96F0]();
}

uint64_t TelephonyUtilDebugRegisterDelegate()
{
  return MEMORY[0x24BED96F8]();
}

uint64_t TelephonyUtilDebugSetFlags()
{
  return MEMORY[0x24BED9700]();
}

uint64_t TelephonyUtilHexToBin()
{
  return MEMORY[0x24BED9718]();
}

uint64_t TelephonyUtilLogBinaryToBuffer()
{
  return MEMORY[0x24BED9738]();
}

uint64_t TelephonyUtilRingBufferInitialize()
{
  return MEMORY[0x24BED9758]();
}

uint64_t TelephonyUtilStrlcpy()
{
  return MEMORY[0x24BED9788]();
}

uint64_t TelephonyUtilSystemMachTime()
{
  return MEMORY[0x24BED9790]();
}

uint64_t TelephonyUtilTransportCreateWithFD()
{
  return MEMORY[0x24BED97A0]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x24BED97A8]();
}

uint64_t TelephonyUtilWriteToCompletion()
{
  return MEMORY[0x24BED97B8]();
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ICE_FILER_read()
{
  return MEMORY[0x24BED4D88]();
}

uint64_t ACFUCommon::PersonalizeParams::logParameters(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x24BE05B68](this);
}

uint64_t ACFUCommon::PersonalizeParams::getParametersDictionary(ACFUCommon::PersonalizeParams *this)
{
  return MEMORY[0x24BE05B70](this);
}

uint64_t ACFUCommon::PersonalizeParams::PersonalizeParams()
{
  return MEMORY[0x24BE05B80]();
}

uint64_t ACFUCommon::createFileDatafromFilePath(ACFUCommon *this, const __CFString *a2)
{
  return MEMORY[0x24BE05B90](this, a2);
}

uint64_t ACFUCommon::createURLByAppendingStrings(ACFUCommon *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BE05B98](this, a2, a3);
}

uint64_t ACFULogging::handleMessage()
{
  return MEMORY[0x24BE05BB0]();
}

uint64_t ACFULogging::getLogInstance(ACFULogging *this)
{
  return MEMORY[0x24BE05BC0](this);
}

uint64_t ACFULogging::handleMessageBinary()
{
  return MEMORY[0x24BE05BD0]();
}

uint64_t ACFULogging::handleMessageCFType()
{
  return MEMORY[0x24BE05BE0]();
}

uint64_t ACFULogging::initLog(ACFULogging *this, const __CFDictionary *a2, void (*a3)(void *, const char *), void *a4)
{
  return MEMORY[0x24BE05BF0](this, a2, a3, a4);
}

uint64_t ACFURestore::performCmd(ACFURestore *this)
{
  return MEMORY[0x24BE05C10](this);
}

uint64_t ACFURestore::getStepName()
{
  return MEMORY[0x24BE05C18]();
}

uint64_t ACFURestore::isPreflight(ACFURestore *this)
{
  return MEMORY[0x24BE05C20](this);
}

uint64_t ACFURestore::isPostSealing(ACFURestore *this)
{
  return MEMORY[0x24BE05C38](this);
}

uint64_t ACFURestore::isPreflighted(ACFURestore *this)
{
  return MEMORY[0x24BE05C40](this);
}

uint64_t ACFURestore::executeCommand()
{
  return MEMORY[0x24BE05C48]();
}

uint64_t ACFURestore::getErrorHandle(ACFURestore *this)
{
  return MEMORY[0x24BE05C58](this);
}

uint64_t ACFURestore::restoreCommand(ACFURestore *this, const __CFString *a2)
{
  return MEMORY[0x24BE05C68](this, a2);
}

uint64_t ACFURestore::isRestoreComplete(ACFURestore *this)
{
  return MEMORY[0x24BE05C78](this);
}

uint64_t ACFURestore::getCurrentUpdateStep(ACFURestore *this)
{
  return MEMORY[0x24BE05C88](this);
}

uint64_t ACFURestore::init(ACFURestore *this, const __CFDictionary *a2, const void *a3)
{
  return MEMORY[0x24BE05C98](this, a2, a3);
}

uint64_t ACFURestore::queryCmd(ACFURestore *this)
{
  return MEMORY[0x24BE05CB0](this);
}

void ACFURestore::ACFURestore(ACFURestore *this)
{
  MEMORY[0x24BE05CC0](this);
}

void ACFURestore::~ACFURestore(ACFURestore *this)
{
  MEMORY[0x24BE05CD8](this);
}

uint64_t RestoreStep::operator=()
{
  return MEMORY[0x24BE05CE0]();
}

uint64_t ACFURTKitROM::bootFirmware(ACFURTKitROM *this)
{
  return MEMORY[0x24BE05D18](this);
}

uint64_t ACFURTKitROM::create()
{
  return MEMORY[0x24BE05D20]();
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
  MEMORY[0x24BED46E8](this);
}

uint64_t capabilities::programmer::commandTimeout(capabilities::programmer *this)
{
  return MEMORY[0x24BED8E20](this);
}

uint64_t capabilities::programmer::connectTimeout(capabilities::programmer *this)
{
  return MEMORY[0x24BED8E28](this);
}

uint64_t capabilities::programmer::connectAttemptCount(capabilities::programmer *this)
{
  return MEMORY[0x24BED8E30](this);
}

uint64_t capabilities::pci::supportsPCIAudio(capabilities::pci *this)
{
  return MEMORY[0x24BED91E8](this);
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  return MEMORY[0x24BED9210](this);
}

uint64_t capabilities::diag::operator&()
{
  return MEMORY[0x24BED9218]();
}

uint64_t capabilities::euicc::supportsLegacyUpdater(capabilities::euicc *this)
{
  return MEMORY[0x24BED9238](this);
}

uint64_t capabilities::radio::supportsSDIReset(capabilities::radio *this)
{
  return MEMORY[0x24BED9258](this);
}

uint64_t capabilities::radio::personalizedFirmwarePath(capabilities::radio *this)
{
  return MEMORY[0x24BED9278](this);
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  return MEMORY[0x24BED9290](this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x24BED9298](this);
}

uint64_t capabilities::radio::chipID(capabilities::radio *this)
{
  return MEMORY[0x24BED92A0](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x24BED92A8](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x24BED92B8](this);
}

uint64_t capabilities::fusing::commandTimeout(capabilities::fusing *this)
{
  return MEMORY[0x24BED9338](this);
}

uint64_t capabilities::fusing::modeSetTimeout(capabilities::fusing *this)
{
  return MEMORY[0x24BED9340](this);
}

uint64_t capabilities::updater::getAOPType(capabilities::updater *this)
{
  return MEMORY[0x24BED9360](this);
}

uint64_t capabilities::updater::getActType(capabilities::updater *this)
{
  return MEMORY[0x24BED9368](this);
}

uint64_t capabilities::updater::getCalType(capabilities::updater *this)
{
  return MEMORY[0x24BED9370](this);
}

uint64_t capabilities::updater::getHYPType(capabilities::updater *this)
{
  return MEMORY[0x24BED9378](this);
}

uint64_t capabilities::updater::getMBAType(capabilities::updater *this)
{
  return MEMORY[0x24BED9380](this);
}

uint64_t capabilities::updater::getPacType(capabilities::updater *this)
{
  return MEMORY[0x24BED9388](this);
}

uint64_t capabilities::updater::getRPMType(capabilities::updater *this)
{
  return MEMORY[0x24BED9390](this);
}

uint64_t capabilities::updater::getSBLType(capabilities::updater *this)
{
  return MEMORY[0x24BED9398](this);
}

uint64_t capabilities::updater::getSECType(capabilities::updater *this)
{
  return MEMORY[0x24BED93A0](this);
}

uint64_t capabilities::updater::getWDTType(capabilities::updater *this)
{
  return MEMORY[0x24BED93A8](this);
}

uint64_t capabilities::updater::resetDelay(capabilities::updater *this)
{
  return MEMORY[0x24BED93B0](this);
}

uint64_t capabilities::updater::CALFileName(capabilities::updater *this)
{
  return MEMORY[0x24BED93B8](this);
}

uint64_t capabilities::updater::PACFileName(capabilities::updater *this)
{
  return MEMORY[0x24BED93C0](this);
}

uint64_t capabilities::updater::getACDBType(capabilities::updater *this)
{
  return MEMORY[0x24BED93C8](this);
}

uint64_t capabilities::updater::getAPDPType(capabilities::updater *this)
{
  return MEMORY[0x24BED93D0](this);
}

uint64_t capabilities::updater::getAPPSType(capabilities::updater *this)
{
  return MEMORY[0x24BED93D8](this);
}

uint64_t capabilities::updater::getDSP3Type(capabilities::updater *this)
{
  return MEMORY[0x24BED93E0](this);
}

uint64_t capabilities::updater::getEFS1Type(capabilities::updater *this)
{
  return MEMORY[0x24BED93E8](this);
}

uint64_t capabilities::updater::getEFS2Type(capabilities::updater *this)
{
  return MEMORY[0x24BED93F0](this);
}

uint64_t capabilities::updater::getEFS3Type(capabilities::updater *this)
{
  return MEMORY[0x24BED93F8](this);
}

uint64_t capabilities::updater::getProvType(capabilities::updater *this)
{
  return MEMORY[0x24BED9400](this);
}

uint64_t capabilities::updater::getUEFIType(capabilities::updater *this)
{
  return MEMORY[0x24BED9408](this);
}

uint64_t capabilities::updater::pingTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED9410](this);
}

uint64_t capabilities::updater::PROVFileName(capabilities::updater *this)
{
  return MEMORY[0x24BED9418](this);
}

uint64_t capabilities::updater::getBBCFGType(capabilities::updater *this)
{
  return MEMORY[0x24BED9420](this);
}

uint64_t capabilities::updater::getDEVCFGType(capabilities::updater *this)
{
  return MEMORY[0x24BED9428](this);
}

uint64_t capabilities::updater::getDigestType(capabilities::updater *this)
{
  return MEMORY[0x24BED9430](this);
}

uint64_t capabilities::updater::getFusingType(capabilities::updater *this)
{
  return MEMORY[0x24BED9438](this);
}

uint64_t capabilities::updater::getLoaderType(capabilities::updater *this)
{
  return MEMORY[0x24BED9440](this);
}

uint64_t capabilities::updater::getMDMDDRType(capabilities::updater *this)
{
  return MEMORY[0x24BED9448](this);
}

uint64_t capabilities::updater::getXblCfgType(capabilities::updater *this)
{
  return MEMORY[0x24BED9450](this);
}

uint64_t capabilities::updater::getOEMMiscType(capabilities::updater *this)
{
  return MEMORY[0x24BED9458](this);
}

uint64_t capabilities::updater::getQDSP6SWType(capabilities::updater *this)
{
  return MEMORY[0x24BED9460](this);
}

uint64_t capabilities::updater::getQTIMiscType(capabilities::updater *this)
{
  return MEMORY[0x24BED9468](this);
}

uint64_t capabilities::updater::supportsEBLXor(capabilities::updater *this)
{
  return MEMORY[0x24BED9470](this);
}

uint64_t capabilities::updater::ICENVMFSizeBytes()
{
  return MEMORY[0x24BED9478]();
}

uint64_t capabilities::updater::NVRestoreTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED9480](this);
}

uint64_t capabilities::updater::pingAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x24BED9488](this);
}

uint64_t capabilities::updater::supportsBBFusing(capabilities::updater *this)
{
  return MEMORY[0x24BED9490](this);
}

uint64_t capabilities::updater::ARICommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED9498](this);
}

uint64_t capabilities::updater::EUICCAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x24BED94A0](this);
}

uint64_t capabilities::updater::getProgrammerType(capabilities::updater *this)
{
  return MEMORY[0x24BED94A8](this);
}

uint64_t capabilities::updater::getXblSupportType(capabilities::updater *this)
{
  return MEMORY[0x24BED94B0](this);
}

uint64_t capabilities::updater::supportsUEFIImage(capabilities::updater *this)
{
  return MEMORY[0x24BED94B8](this);
}

uint64_t capabilities::updater::bootupTimeMaxValue(capabilities::updater *this)
{
  return MEMORY[0x24BED94C0](this);
}

uint64_t capabilities::updater::getFirmwareVersion(capabilities::updater *this)
{
  return MEMORY[0x24BED94C8](this);
}

uint64_t capabilities::updater::getProvisionerType(capabilities::updater *this)
{
  return MEMORY[0x24BED94D0](this);
}

uint64_t capabilities::updater::shouldAllowUnfused(capabilities::updater *this)
{
  return MEMORY[0x24BED94D8](this);
}

uint64_t capabilities::updater::supportsBbcfgImage(capabilities::updater *this)
{
  return MEMORY[0x24BED94E0](this);
}

uint64_t capabilities::updater::supportsHashSha384(capabilities::updater *this)
{
  return MEMORY[0x24BED94E8](this);
}

uint64_t capabilities::updater::getUpdateSourceType(capabilities::updater *this)
{
  return MEMORY[0x24BED94F0](this);
}

uint64_t capabilities::updater::requiresMRCTraining(capabilities::updater *this)
{
  return MEMORY[0x24BED94F8](this);
}

uint64_t capabilities::updater::supportsXblCfgImage(capabilities::updater *this)
{
  return MEMORY[0x24BED9500](this);
}

uint64_t capabilities::updater::BBUFSPartitionSizeMB(capabilities::updater *this)
{
  return MEMORY[0x24BED9508](this);
}

uint64_t capabilities::updater::EUICCCertIDSizeBytes(capabilities::updater *this)
{
  return MEMORY[0x24BED9510](this);
}

uint64_t capabilities::updater::getCommunicationType(capabilities::updater *this)
{
  return MEMORY[0x24BED9518](this);
}

uint64_t capabilities::updater::getFusingProgramType(capabilities::updater *this)
{
  return MEMORY[0x24BED9520](this);
}

uint64_t capabilities::updater::loaderCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED9528](this);
}

uint64_t capabilities::updater::getInitializerVersion(capabilities::updater *this)
{
  return MEMORY[0x24BED9530](this);
}

uint64_t capabilities::updater::loaderConnectAttempts(capabilities::updater *this)
{
  return MEMORY[0x24BED9538](this);
}

uint64_t capabilities::updater::supportsDDRDataSaving(capabilities::updater *this)
{
  return MEMORY[0x24BED9540](this);
}

uint64_t capabilities::updater::supportsMHIBootLogger(capabilities::updater *this)
{
  return MEMORY[0x24BED9548](this);
}

uint64_t capabilities::updater::shouldBailOnEUICCError(capabilities::updater *this)
{
  return MEMORY[0x24BED9550](this);
}

uint64_t capabilities::updater::shouldStripFDRDataOnAP(capabilities::updater *this)
{
  return MEMORY[0x24BED9558](this);
}

uint64_t capabilities::updater::EUICCVinylSuccessStatus(capabilities::updater *this)
{
  return MEMORY[0x24BED9560](this);
}

uint64_t capabilities::updater::manifestCheckRetryCount(capabilities::updater *this)
{
  return MEMORY[0x24BED9568](this);
}

uint64_t capabilities::updater::repersonalizeLimitCount(capabilities::updater *this)
{
  return MEMORY[0x24BED9570](this);
}

uint64_t capabilities::updater::supportsXblSupportImage(capabilities::updater *this)
{
  return MEMORY[0x24BED9578](this);
}

uint64_t capabilities::updater::supportsDualIMEIProvision(capabilities::updater *this)
{
  return MEMORY[0x24BED9580](this);
}

uint64_t capabilities::updater::supportsNVSettingOQCMagic(capabilities::updater *this)
{
  return MEMORY[0x24BED9588](this);
}

uint64_t capabilities::updater::provisioningCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED9590](this);
}

uint64_t capabilities::updater::shouldSkipRestoreForUnfused(capabilities::updater *this)
{
  return MEMORY[0x24BED9598](this);
}

uint64_t capabilities::updater::shouldWaitForReadyAfterBoot(capabilities::updater *this)
{
  return MEMORY[0x24BED95A0](this);
}

uint64_t capabilities::updater::getBasebandMigrationDataType(capabilities::updater *this)
{
  return MEMORY[0x24BED95A8](this);
}

uint64_t capabilities::updater::getPersonalizationParameters(capabilities::updater *this)
{
  return MEMORY[0x24BED95B0](this);
}

uint64_t capabilities::updater::initialStagePingAttemptCount(capabilities::updater *this)
{
  return MEMORY[0x24BED95B8](this);
}

uint64_t capabilities::updater::shouldBailOnNoManifestHashes(capabilities::updater *this)
{
  return MEMORY[0x24BED95C0](this);
}

uint64_t capabilities::updater::getLoaderProgressBarTimesType(capabilities::updater *this)
{
  return MEMORY[0x24BED95C8](this);
}

uint64_t capabilities::updater::intermittentFailureRetryCount(capabilities::updater *this)
{
  return MEMORY[0x24BED95D0](this);
}

uint64_t capabilities::updater::personalizationCommandTimeout(capabilities::updater *this)
{
  return MEMORY[0x24BED95D8](this);
}

uint64_t capabilities::updater::shouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  return MEMORY[0x24BED95E0](this);
}

uint64_t capabilities::updater::getProgrammerProgressBarTimesType(capabilities::updater *this)
{
  return MEMORY[0x24BED95E8](this);
}

uint64_t capabilities::updater::supportsFATPCalibrationManifestStatus(capabilities::updater *this)
{
  return MEMORY[0x24BED95F0](this);
}

uint64_t capabilities::updater::hasMEID(capabilities::updater *this)
{
  return MEMORY[0x24BED95F8](this);
}

uint64_t capabilities::updater::getTZType(capabilities::updater *this)
{
  return MEMORY[0x24BED9600](this);
}

uint64_t capabilities::updater::pingDelay(capabilities::updater *this)
{
  return MEMORY[0x24BED9608](this);
}

uint64_t capabilities::coredump::supportsGPIOSignalling(capabilities::coredump *this)
{
  return MEMORY[0x24BED9618](this);
}

uint64_t capabilities::coredump::supportsSPMISignalling(capabilities::coredump *this)
{
  return MEMORY[0x24BED9620](this);
}

uint64_t RTKitFirmware::getFileOffsetByFileName()
{
  return MEMORY[0x24BE05D50]();
}

uint64_t RTKitFirmware::create()
{
  return MEMORY[0x24BE05D68]();
}

{
  return MEMORY[0x24BE05D70]();
}

uint64_t ACFUDataAccess::createPersonalizedFirmwarePath(ACFUDataAccess *this, const __CFString *a2)
{
  return MEMORY[0x24BE05D88](this, a2);
}

uint64_t ACFUDiagnostics::copyDiagnosticsPath(ACFUDiagnostics *this)
{
  return MEMORY[0x24BE05D98](this);
}

uint64_t ACFUDiagnostics::create(ACFUDiagnostics *this, const __CFString *a2)
{
  return MEMORY[0x24BE05DA8](this, a2);
}

uint64_t ACFUDiagnostics::perform(ACFUDiagnostics *this)
{
  return MEMORY[0x24BE05DC0](this);
}

void ACFUDiagnostics::~ACFUDiagnostics(ACFUDiagnostics *this)
{
  MEMORY[0x24BE05DD0](this);
}

uint64_t ACFUSynchronize::Syncher::wait()
{
  return MEMORY[0x24BE05E10]();
}

uint64_t ACFUSynchronize::Syncher::notify()
{
  return MEMORY[0x24BE05E18]();
}

uint64_t ACFUDataContainer::create(ACFUDataContainer *this, const __CFString *a2)
{
  return MEMORY[0x24BE05E28](this, a2);
}

uint64_t ACFUDataContainer::create(ACFUDataContainer *this, const __CFData *a2)
{
  return MEMORY[0x24BE05E30](this, a2);
}

void ACFUDataContainer::~ACFUDataContainer(ACFUDataContainer *this)
{
  MEMORY[0x24BE05E38](this);
}

uint64_t ACFUACIPCTransport::readRegister(ACFUACIPCTransport *this, IOACIPCClass **a2, uint64_t a3, unsigned __int8 *a4, unsigned int *a5)
{
  return MEMORY[0x24BE05E40](this, a2, a3, a4, a5);
}

uint64_t ACFUACIPCTransport::processRTIStage()
{
  return MEMORY[0x24BE05E48]();
}

uint64_t ACFUACIPCTransport::generateBootNonce(ACFUACIPCTransport *this, IOACIPCClass **a2)
{
  return MEMORY[0x24BE05E50](this, a2);
}

uint64_t ACFUACIPCTransport::loadImageOnBTIStage()
{
  return MEMORY[0x24BE05E58]();
}

uint64_t ACFUACIPCTransport::init()
{
  return MEMORY[0x24BE05E60]();
}

void ACFUACIPCTransport::ACFUACIPCTransport(ACFUACIPCTransport *this)
{
  MEMORY[0x24BE05E68](this);
}

void ACFUACIPCTransport::~ACFUACIPCTransport(ACFUACIPCTransport *this)
{
  MEMORY[0x24BE05E70](this);
}

uint64_t HSFilerReadSession::readWithFile()
{
  return MEMORY[0x24BED43F0]();
}

uint64_t HSFilerReadSession::create()
{
  return MEMORY[0x24BED43F8]();
}

uint64_t ACFURTKitNVRMGenerator::copy(ACFURTKitNVRMGenerator *this)
{
  return MEMORY[0x24BE05E78](this);
}

uint64_t ACFURTKitNVRMGenerator::create()
{
  return MEMORY[0x24BE05E80]();
}

void ACFURTKitNVRMGenerator::~ACFURTKitNVRMGenerator(ACFURTKitNVRMGenerator *this)
{
  MEMORY[0x24BE05E88](this);
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x24BECE808](this, a2, a3);
}

uint64_t Bsp::ARICommandDriver::SysGetInfoV2()
{
  return MEMORY[0x24BED4D90]();
}

uint64_t Bsp::ARICommandDriver::GetNvItemsSetting()
{
  return MEMORY[0x24BED4D98]();
}

uint64_t Bsp::ARICommandDriver::GetCurrentBootState()
{
  return MEMORY[0x24BED4DA0]();
}

uint64_t Bsp::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x24BED4DA8]();
}

void Bsp::ARICommandDriver::~ARICommandDriver(Bsp::ARICommandDriver *this)
{
  MEMORY[0x24BED4DB0](this);
}

uint64_t Bsp::BspCommandDriver::SwTrap()
{
  return MEMORY[0x24BED4DB8]();
}

uint64_t Bsp::BspCommandDriver::BspCommandDriver()
{
  return MEMORY[0x24BED4DC0]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, os_log_s *a2)
{
  return MEMORY[0x24BED9820](this, a2);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9828](this, a2, a3);
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

uint64_t ctu::path_join_impl()
{
  return MEMORY[0x24BED9920]();
}

{
  return MEMORY[0x24BED9928]();
}

{
  return MEMORY[0x24BED9930]();
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x24BED9968](this);
}

uint64_t ctu::LogMessageBuffer::createWithFormat(ctu::LogMessageBuffer *this, const char *a2, ...)
{
  return MEMORY[0x24BED9978](this, a2);
}

uint64_t ctu::LogMessageBuffer::vCreateWithFormat(ctu::LogMessageBuffer *this, const char *a2, char *a3)
{
  return MEMORY[0x24BED9980](this, a2, a3);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  MEMORY[0x24BED9998](this);
}

uint64_t ctu::isProcessRunning()
{
  return MEMORY[0x24BED99D0]();
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

{
  return MEMORY[0x24BED9A98]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x24BED9AA0](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
  MEMORY[0x24BED9AB0](this);
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BED9AB8](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
  MEMORY[0x24BED9AC0](this);
}

uint64_t ctu::cf::show(ctu::cf *this, const void *a2)
{
  return MEMORY[0x24BED9AC8](this, a2);
}

uint64_t ctu::cf::show(ctu::cf *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x24BED9AD0](this, a2, a3);
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x24BED9AD8]();
}

{
  return MEMORY[0x24BED9AE0]();
}

{
  return MEMORY[0x24BED9AE8]();
}

uint64_t ctu::cf::assign(ctu::cf *this, signed __int8 *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9AF0](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x24BED9AF8](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B08](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B10](this, a2, a3);
}

uint64_t ctu::fs::close_file(ctu::fs *this)
{
  return MEMORY[0x24BED9B28](this);
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x24BED9B38]();
}

uint64_t ctu::fs::read_folder()
{
  return MEMORY[0x24BED9B40]();
}

uint64_t ctu::fs::remove_file()
{
  return MEMORY[0x24BED9B48]();
}

uint64_t ctu::fs::is_directory()
{
  return MEMORY[0x24BED9B50]();
}

uint64_t ctu::fs::iterate_folder()
{
  return MEMORY[0x24BED9B60]();
}

uint64_t ctu::fs::create_directory()
{
  return MEMORY[0x24BED9B68]();
}

uint64_t ctu::fs::remove_directory_contents()
{
  return MEMORY[0x24BED9B80]();
}

uint64_t ctu::fs::rename()
{
  return MEMORY[0x24BED9B88]();
}

uint64_t ctu::fs::open_file()
{
  return MEMORY[0x24BED9B90]();
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9BB0](this, a2);
}

uint64_t ctu::hex()
{
  return MEMORY[0x24BED9BB8]();
}

uint64_t ctu::Http::HttpRequest::create()
{
  return MEMORY[0x24BED9BD0]();
}

uint64_t ctu::Http::asString()
{
  return MEMORY[0x24BED9BD8]();
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID(ctu *this, const unsigned int *a2)
{
  return MEMORY[0x24BED9C48](this, a2);
}

uint64_t ctu::assign()
{
  return MEMORY[0x24BED9C60]();
}

uint64_t ctu::basename()
{
  return MEMORY[0x24BED9C90]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x24BED9C98]();
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9D08](this, a2);
}

uint64_t nvm::ARICommandDriver::NVMSnapshot()
{
  return MEMORY[0x24BED4DC8]();
}

uint64_t nvm::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x24BED4DD0]();
}

void nvm::ARICommandDriver::~ARICommandDriver(nvm::ARICommandDriver *this)
{
  MEMORY[0x24BED4DD8](this);
}

uint64_t pci::transport::kernelControl::create(pci::transport::kernelControl *this)
{
  return MEMORY[0x24BED8A78](this);
}

uint64_t pci::transport::kernel::errorAsString()
{
  return MEMORY[0x24BED8A80]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x24BED9D68]();
}

{
  return MEMORY[0x24BED9D70]();
}

uint64_t eUICC::StreamAPDU::Perform()
{
  return MEMORY[0x24BED3FC8]();
}

uint64_t eUICC::SwitchMode::Perform()
{
  return MEMORY[0x24BED3FD0]();
}

uint64_t eUICC::GetVinylType::Perform()
{
  return MEMORY[0x24BED3FD8]();
}

uint64_t eUICC::DeleteProfile::Perform()
{
  return MEMORY[0x24BED3FE0]();
}

uint64_t eUICC::InstallTicket::Perform()
{
  return MEMORY[0x24BED3FE8]();
}

uint64_t eUICC::ValidatePerso::Perform()
{
  return MEMORY[0x24BED3FF0]();
}

uint64_t eUICC::AuthPersoSession::Perform()
{
  return MEMORY[0x24BED3FF8]();
}

uint64_t eUICC::InitPersoSession::Perform()
{
  return MEMORY[0x24BED4000]();
}

uint64_t eUICC::VinylCommandDriver::InstallVad()
{
  return MEMORY[0x24BED4DE0]();
}

uint64_t eUICC::VinylCommandDriver::GetVinylType()
{
  return MEMORY[0x24BED4DE8]();
}

uint64_t eUICC::VinylCommandDriver::DeleteProfile()
{
  return MEMORY[0x24BED4DF0]();
}

uint64_t eUICC::VinylCommandDriver::FinalizePerso()
{
  return MEMORY[0x24BED4DF8]();
}

uint64_t eUICC::VinylCommandDriver::ValidatePerso()
{
  return MEMORY[0x24BED4E00]();
}

uint64_t eUICC::VinylCommandDriver::SwitchCardMode()
{
  return MEMORY[0x24BED4E08]();
}

uint64_t eUICC::VinylCommandDriver::GetData()
{
  return MEMORY[0x24BED4E10]();
}

uint64_t eUICC::VinylCommandDriver::StreamFW()
{
  return MEMORY[0x24BED4E18]();
}

uint64_t eUICC::VinylCommandDriver::AuthPerso()
{
  return MEMORY[0x24BED4E20]();
}

uint64_t eUICC::VinylCommandDriver::InitPerso()
{
  return MEMORY[0x24BED4E28]();
}

uint64_t eUICC::VinylCommandDriver::VinylCommandDriver()
{
  return MEMORY[0x24BED4E30]();
}

void eUICC::VinylCommandDriver::~VinylCommandDriver(eUICC::VinylCommandDriver *this)
{
  MEMORY[0x24BED4E38](this);
}

uint64_t eUICC::FinalizePersoSession::Perform()
{
  return MEMORY[0x24BED4008]();
}

uint64_t eUICC::GetData::Perform()
{
  return MEMORY[0x24BED4010]();
}

uint64_t eUICC::StoreData::Perform()
{
  return MEMORY[0x24BED4018]();
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BECE8C0](this, a2, a3);
}

uint64_t AriSdk::ARI_IBIVinylTapeReq_SDK::ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
  return MEMORY[0x24BECEB58](this);
}

void AriSdk::ARI_IBIVinylTapeReq_SDK::~ARI_IBIVinylTapeReq_SDK(AriSdk::ARI_IBIVinylTapeReq_SDK *this)
{
  MEMORY[0x24BECEB60](this);
}

uint64_t AriSdk::ARI_IBINvmSnapshotReq_SDK::ARI_IBINvmSnapshotReq_SDK(AriSdk::ARI_IBINvmSnapshotReq_SDK *this)
{
  return MEMORY[0x24BECED58](this);
}

void AriSdk::ARI_IBINvmSnapshotReq_SDK::~ARI_IBINvmSnapshotReq_SDK(AriSdk::ARI_IBINvmSnapshotReq_SDK *this)
{
  MEMORY[0x24BECED60](this);
}

uint64_t AriSdk::ARI_CsiSysGetInfoReqV2_SDK::ARI_CsiSysGetInfoReqV2_SDK(AriSdk::ARI_CsiSysGetInfoReqV2_SDK *this)
{
  return MEMORY[0x24BECEED8](this);
}

void AriSdk::ARI_CsiSysGetInfoReqV2_SDK::~ARI_CsiSysGetInfoReqV2_SDK(AriSdk::ARI_CsiSysGetInfoReqV2_SDK *this)
{
  MEMORY[0x24BECEEE0](this);
}

uint64_t AriSdk::ARI_IBIVinylAuthPsoReq_SDK::ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
  return MEMORY[0x24BECF090](this);
}

void AriSdk::ARI_IBIVinylAuthPsoReq_SDK::~ARI_IBIVinylAuthPsoReq_SDK(AriSdk::ARI_IBIVinylAuthPsoReq_SDK *this)
{
  MEMORY[0x24BECF098](this);
}

uint64_t AriSdk::ARI_IBIVinylGetDataReq_SDK::ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  return MEMORY[0x24BECF0A0](this);
}

void AriSdk::ARI_IBIVinylGetDataReq_SDK::~ARI_IBIVinylGetDataReq_SDK(AriSdk::ARI_IBIVinylGetDataReq_SDK *this)
{
  MEMORY[0x24BECF0A8](this);
}

uint64_t AriSdk::ARI_IBIVinylInitPsoReq_SDK::ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
  return MEMORY[0x24BECF0B0](this);
}

void AriSdk::ARI_IBIVinylInitPsoReq_SDK::~ARI_IBIVinylInitPsoReq_SDK(AriSdk::ARI_IBIVinylInitPsoReq_SDK *this)
{
  MEMORY[0x24BECF0B8](this);
}

uint64_t AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::ARI_CsiSecReadSikPKeyReq_SDK(AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *this)
{
  return MEMORY[0x24BECF448](this);
}

void AriSdk::ARI_CsiSecReadSikPKeyReq_SDK::~ARI_CsiSecReadSikPKeyReq_SDK(AriSdk::ARI_CsiSecReadSikPKeyReq_SDK *this)
{
  MEMORY[0x24BECF450](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallFwReq_SDK::ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  return MEMORY[0x24BECF638](this);
}

void AriSdk::ARI_IBIVinylInstallFwReq_SDK::~ARI_IBIVinylInstallFwReq_SDK(AriSdk::ARI_IBIVinylInstallFwReq_SDK *this)
{
  MEMORY[0x24BECF640](this);
}

uint64_t AriSdk::ARI_CsiSecGetRandomNumReq_SDK::ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  return MEMORY[0x24BECF758](this);
}

void AriSdk::ARI_CsiSecGetRandomNumReq_SDK::~ARI_CsiSecGetRandomNumReq_SDK(AriSdk::ARI_CsiSecGetRandomNumReq_SDK *this)
{
  MEMORY[0x24BECF760](this);
}

uint64_t AriSdk::ARI_IBIVinylInstallVadReq_SDK::ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
  return MEMORY[0x24BECF998](this);
}

void AriSdk::ARI_IBIVinylInstallVadReq_SDK::~ARI_IBIVinylInstallVadReq_SDK(AriSdk::ARI_IBIVinylInstallVadReq_SDK *this)
{
  MEMORY[0x24BECF9A0](this);
}

uint64_t AriSdk::ARI_IBIVinylSwitchModeReq_SDK::ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  return MEMORY[0x24BECF9B8](this);
}

void AriSdk::ARI_IBIVinylSwitchModeReq_SDK::~ARI_IBIVinylSwitchModeReq_SDK(AriSdk::ARI_IBIVinylSwitchModeReq_SDK *this)
{
  MEMORY[0x24BECF9C0](this);
}

uint64_t AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
  return MEMORY[0x24BECFDD0](this);
}

void AriSdk::ARI_IBIVinylFinalizePsoReq_SDK::~ARI_IBIVinylFinalizePsoReq_SDK(AriSdk::ARI_IBIVinylFinalizePsoReq_SDK *this)
{
  MEMORY[0x24BECFDD8](this);
}

uint64_t AriSdk::ARI_IBIVinylValidatePsoReq_SDK::ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  return MEMORY[0x24BECFE20](this);
}

void AriSdk::ARI_IBIVinylValidatePsoReq_SDK::~ARI_IBIVinylValidatePsoReq_SDK(AriSdk::ARI_IBIVinylValidatePsoReq_SDK *this)
{
  MEMORY[0x24BECFE28](this);
}

uint64_t AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::ARI_CsiSecCollectScrtBlobReq_SDK(AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *this)
{
  return MEMORY[0x24BED0378](this);
}

void AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK::~ARI_CsiSecCollectScrtBlobReq_SDK(AriSdk::ARI_CsiSecCollectScrtBlobReq_SDK *this)
{
  MEMORY[0x24BED0380](this);
}

uint64_t AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  return MEMORY[0x24BED0678](this);
}

void AriSdk::ARI_CsiGetCurrentBootStateReq_SDK::~ARI_CsiGetCurrentBootStateReq_SDK(AriSdk::ARI_CsiGetCurrentBootStateReq_SDK *this)
{
  MEMORY[0x24BED0680](this);
}

uint64_t AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  return MEMORY[0x24BED08C8](this);
}

void AriSdk::ARI_IBISimAccessGetSimDataReq_SDK::~ARI_IBISimAccessGetSimDataReq_SDK(AriSdk::ARI_IBISimAccessGetSimDataReq_SDK *this)
{
  MEMORY[0x24BED08D0](this);
}

uint64_t AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK::ARI_FactoryGetNvItemsSettingReq_SDK(AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK *this)
{
  return MEMORY[0x24BED0D58](this);
}

void AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK::~ARI_FactoryGetNvItemsSettingReq_SDK(AriSdk::ARI_FactoryGetNvItemsSettingReq_SDK *this)
{
  MEMORY[0x24BED0D60](this);
}

uint64_t AriSdk::ARI_GetPersonalizationParametersReq_SDK::ARI_GetPersonalizationParametersReq_SDK(AriSdk::ARI_GetPersonalizationParametersReq_SDK *this)
{
  return MEMORY[0x24BED15D0](this);
}

void AriSdk::ARI_GetPersonalizationParametersReq_SDK::~ARI_GetPersonalizationParametersReq_SDK(AriSdk::ARI_GetPersonalizationParametersReq_SDK *this)
{
  MEMORY[0x24BED15D8](this);
}

uint64_t ACFUFDR::getDataLocalCopy()
{
  return MEMORY[0x24BE05E90]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x24BED1C70](this, a2, a3, a4);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x24BED1C90](this);
}

uint64_t AriHost::Init(AriHost *this)
{
  return MEMORY[0x24BED1CB8](this);
}

uint64_t hsfiler::support::to_string()
{
  return MEMORY[0x24BED4400]();
}

uint64_t security::ARICommandDriver::GetRandomNum()
{
  return MEMORY[0x24BED4E80]();
}

uint64_t security::ARICommandDriver::CsiSecReadSikPKey()
{
  return MEMORY[0x24BED4E88]();
}

uint64_t security::ARICommandDriver::CsiSecCollectScrtBlob()
{
  return MEMORY[0x24BED4E90]();
}

uint64_t security::ARICommandDriver::GetPersonalizationParams()
{
  return MEMORY[0x24BED4E98]();
}

uint64_t security::ARICommandDriver::ARICommandDriver()
{
  return MEMORY[0x24BED4EA0]();
}

void security::ARICommandDriver::~ARICommandDriver(security::ARICommandDriver *this)
{
  MEMORY[0x24BED4EA8](this);
}

uint64_t ACFUError::clearError(ACFUError *this)
{
  return MEMORY[0x24BE05EA0](this);
}

uint64_t ACFUError::getCFError(ACFUError *this)
{
  return MEMORY[0x24BE05EB0](this);
}

uint64_t ACFUError::createAppendedDomain(ACFUError *this, const __CFString *a2)
{
  return MEMORY[0x24BE05EC0](this, a2);
}

uint64_t ACFUError::addError()
{
  return MEMORY[0x24BE05ED0]();
}

uint64_t ACFUError::hasError(ACFUError *this)
{
  return MEMORY[0x24BE05ED8](this);
}

void ACFUError::ACFUError(ACFUError *this, const __CFString *a2)
{
  MEMORY[0x24BE05EE8](this, a2);
}

void ACFUError::~ACFUError(ACFUError *this)
{
  MEMORY[0x24BE05EF0](this);
}

uint64_t ACFUFirmware::getManifest(ACFUFirmware *this)
{
  return MEMORY[0x24BE05F08](this);
}

uint64_t ACFUFirmware::copyFWDataByTag(ACFUFirmware *this, const __CFString *a2)
{
  return MEMORY[0x24BE05F18](this, a2);
}

uint64_t ACFUFirmware::copyFWDataByFileName()
{
  return MEMORY[0x24BE05F28]();
}

uint64_t ACFUFirmware::copyFWContainerFromOffset(ACFUFirmware *this)
{
  return MEMORY[0x24BE05F30](this);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E90](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x24BED9E98](this, a2);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x24BED9EA8]();
}

uint64_t ctu::llvm::StringRef::find_last_not_of()
{
  return MEMORY[0x24BED9EB0]();
}

uint64_t ctu::llvm::StringRef::find_first_not_of()
{
  return MEMORY[0x24BED9EB8]();
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::lexically_normal(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *this)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDAA20](retstr, this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB58](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
  MEMORY[0x24BEDABD8](__ns);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
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

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::getline()
{
  return MEMORY[0x24BEDAE58]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE90]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
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

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
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

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB338](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x24BEDB3F8](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x24BEDB450](this, a2);
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x24BEDB538](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_24CE7E340(__p);
}

void operator delete(void *__p)
{
  off_24CE7E348(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24CE7E350(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CE7E358(__sz);
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

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
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

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCF0](queue, context, work);
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

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x24BDADF58](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAE2C8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x24BEDF1F8]();
}

int getchar(void)
{
  return MEMORY[0x24BDAE5D0]();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x24BDAE6B0](*(_QWORD *)&a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

uint64_t lookupPathForPersistentData()
{
  return MEMORY[0x24BE63548]();
}

uint64_t lookupPathForPersonalizedData()
{
  return MEMORY[0x24BE63558]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x24BDAF4F0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x24BDB0430](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x24BDB0518](__s, *(_QWORD *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
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

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

