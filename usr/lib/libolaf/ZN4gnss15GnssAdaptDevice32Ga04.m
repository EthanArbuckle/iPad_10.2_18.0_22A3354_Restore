@implementation ZN4gnss15GnssAdaptDevice32Ga04

_QWORD *___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  unsigned __int16 v12;
  _QWORD *result;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 v23;
  NSObject *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  unsigned __int16 v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 v36;
  _BYTE *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *v50;
  void (*v51)();
  uint64_t v52;
  __int128 v53;
  char v54;
  _QWORD v55[4];
  _BYTE v56[24];
  _BYTE *v57;
  int v58;
  _QWORD block[5];
  _BYTE v60[24];
  _BYTE *v61;
  _QWORD v62[5];
  _BYTE v63[24];
  _BYTE *v64;
  _QWORD v65[3];
  _QWORD *v66;
  char __str[1040];
  _QWORD v68[3];
  _QWORD *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v69 = 0;
  v2 = *(_QWORD *)(v1 + 264);
  if (!v2)
    goto LABEL_83;
  v4 = v1 + 264;
  v5 = *(_DWORD *)(a1 + 40);
  v6 = v1 + 264;
  v7 = *(_QWORD *)(v1 + 264);
  do
  {
    v8 = *(_DWORD *)(v7 + 32);
    v9 = v8 >= v5;
    if (v8 >= v5)
      v10 = (uint64_t *)v7;
    else
      v10 = (uint64_t *)(v7 + 8);
    if (v9)
      v6 = v7;
    v7 = *v10;
  }
  while (*v10);
  if (v6 == v4 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_83:
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v11 = mach_continuous_time();
      v12 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Lut Hdl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 770);
      LbsOsaTrace_WriteLog(0x18u, __str, v12, 0, 1);
    }
    goto LABEL_14;
  }
  v15 = v1 + 264;
  do
  {
    v16 = *(_DWORD *)(v2 + 32);
    v17 = v16 >= v5;
    if (v16 >= v5)
      v18 = (uint64_t *)v2;
    else
      v18 = (uint64_t *)(v2 + 8);
    if (v17)
      v15 = v2;
    v2 = *v18;
  }
  while (*v18);
  if (v15 == v4 || v5 < *(_DWORD *)(v15 + 32))
    v15 = v1 + 264;
  std::function<void ()(gnss::Result)>::operator=(v68, v15 + 40);
  std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v1 + 256), (uint64_t *)v6);
  if (!v69)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v27 = mach_continuous_time();
      v28 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx Lut Hdl NULL\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 87, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 516);
      LbsOsaTrace_WriteLog(0x18u, __str, v28, 2, 1);
    }
    goto LABEL_14;
  }
  v19 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
  v20 = *(_DWORD *)(a1 + 44);
  v21 = MEMORY[0x24BDAC760];
  if (!v20)
  {
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 0, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v29 = mach_continuous_time();
      v30 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx ApiType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 515);
      LbsOsaTrace_WriteLog(0x18u, __str, v30, 0, 1);
    }
    goto LABEL_69;
  }
  if (v20 != 1)
  {
    if (v20 != 2)
    {
      if (LbsOsaTrace_IsLoggingAllowed(0x18u, 2, 0, 0))
      {
        bzero(__str, 0x410uLL);
        v35 = mach_continuous_time();
        v36 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: #%04hx ApiState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "ADP", 87, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 262, *(_DWORD *)(a1 + 44));
        LbsOsaTrace_WriteLog(0x18u, __str, v36, 2, 1);
      }
      goto LABEL_69;
    }
    if (!*(_QWORD *)(v1 + 400))
      goto LABEL_69;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v65, v1 + 376);
    v47 = 0;
    v48 = &v47;
    v49 = 0x3802000000;
    v50 = __Block_byref_object_copy__21_0;
    v51 = __Block_byref_object_dispose__22_0;
    LOBYTE(v53) = *(_BYTE *)(a1 + 56);
    v52 = *(_QWORD *)(a1 + 64);
    if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
    {
      bzero(__str, 0x410uLL);
      v22 = mach_continuous_time();
      v23 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: RTI Data StartGpsSecs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", v48[5]);
      LbsOsaTrace_WriteLog(0x18u, __str, v23, 4, 1);
    }
    v24 = *(NSObject **)(v1 + 296);
    block[0] = v21;
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2_24;
    block[3] = &unk_24E2F90C0;
    v25 = v60;
    v26 = (uint64_t)v66;
    if (v66)
    {
      if (v66 == v65)
      {
        v61 = v60;
        (*(void (**)(_QWORD *, _BYTE *))(v65[0] + 24))(v65, v60);
        goto LABEL_56;
      }
      v26 = (*(uint64_t (**)(void))(*v66 + 16))();
    }
    v61 = (_BYTE *)v26;
LABEL_56:
    block[4] = &v47;
    dispatch_async(v24, block);
    v37 = v61;
    goto LABEL_59;
  }
  if (!*(_QWORD *)(v1 + 368))
    goto LABEL_69;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v65, v1 + 344);
  v47 = 0;
  v48 = &v47;
  v49 = 0x4802000000;
  v50 = __Block_byref_object_copy__4;
  v51 = __Block_byref_object_dispose__4;
  LOBYTE(v52) = 0;
  v54 = *(_BYTE *)(a1 + 56);
  v53 = *(_OWORD *)(a1 + 64);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v31 = mach_continuous_time();
    v32 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: ORB Data StartGpsSecs,%llu,EndGpsSecs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", v48[6], v48[7]);
    LbsOsaTrace_WriteLog(0x18u, __str, v32, 4, 1);
  }
  v33 = *(NSObject **)(v1 + 296);
  v62[0] = v21;
  v62[1] = 1174405120;
  v62[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2;
  v62[3] = &unk_24E2F9088;
  v25 = v63;
  v34 = (uint64_t)v66;
  if (v66)
  {
    if (v66 == v65)
    {
      v64 = v63;
      (*(void (**)(_QWORD *, _BYTE *))(v65[0] + 24))(v65, v63);
      goto LABEL_58;
    }
    v34 = (*(uint64_t (**)(void))(*v66 + 16))();
  }
  v64 = (_BYTE *)v34;
LABEL_58:
  v62[4] = &v47;
  dispatch_async(v33, v62);
  v37 = v64;
LABEL_59:
  if (v37 == v25)
  {
    v38 = 4;
    goto LABEL_63;
  }
  if (v37)
  {
    v38 = 5;
    v25 = v37;
LABEL_63:
    (*(void (**)(_BYTE *))(*(_QWORD *)v25 + 8 * v38))(v25);
  }
  _Block_object_dispose(&v47, 8);
  v39 = v66;
  if (v66 == v65)
  {
    v40 = 4;
    v39 = v65;
  }
  else
  {
    if (!v66)
      goto LABEL_69;
    v40 = 5;
  }
  (*(void (**)(void))(*v39 + 8 * v40))();
LABEL_69:
  v41 = *(NSObject **)(v1 + 296);
  v55[0] = v21;
  v55[1] = 1174405120;
  v55[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2_27;
  v55[3] = &__block_descriptor_tmp_28_1;
  v42 = v56;
  v43 = (uint64_t)v69;
  if (v69)
  {
    if (v69 == v68)
    {
      v57 = v56;
      (*(void (**)(_QWORD *, _BYTE *))(v68[0] + 24))(v68, v56);
      goto LABEL_74;
    }
    v43 = (*(uint64_t (**)(void))(*v69 + 16))();
  }
  v57 = (_BYTE *)v43;
LABEL_74:
  v58 = v19;
  dispatch_async(v41, v55);
  if (LbsOsaTrace_IsLoggingAllowed(0x18u, 4, 0, 0))
  {
    bzero(__str, 0x410uLL);
    v44 = mach_continuous_time();
    v45 = snprintf(__str, 0x40FuLL, "%10u %s%c %s: Ee Type,%u,ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v44), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 44));
    LbsOsaTrace_WriteLog(0x18u, __str, v45, 4, 1);
  }
  if (v57 == v56)
  {
    v46 = 4;
  }
  else
  {
    if (!v57)
      goto LABEL_14;
    v46 = 5;
    v42 = v57;
  }
  (*(void (**)(_QWORD *))(*v42 + 8 * v46))(v42);
LABEL_14:
  result = v69;
  if (v69 == v68)
  {
    v14 = 4;
    result = v68;
  }
  else
  {
    if (!v69)
      return result;
    v14 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v14))();
}

@end
