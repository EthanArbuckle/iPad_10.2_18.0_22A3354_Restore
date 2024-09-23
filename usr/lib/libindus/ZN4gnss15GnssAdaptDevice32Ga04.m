@implementation ZN4gnss15GnssAdaptDevice32Ga04

uint64_t *___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *result;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;
  void (*v44)();
  uint64_t v45;
  __int128 v46;
  char v47;
  _QWORD v48[4];
  _BYTE v49[24];
  _BYTE *v50;
  int v51;
  _QWORD block[5];
  _BYTE v53[24];
  _BYTE *v54;
  _QWORD v55[5];
  _BYTE v56[24];
  _BYTE *v57;
  _QWORD v58[3];
  _QWORD *v59;
  char __str[966];
  _QWORD v61[3];
  uint64_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v62 = 0;
  v2 = v1 + 128;
  v3 = *(_QWORD *)(v1 + 128);
  if (!v3)
    goto LABEL_12;
  v5 = *(_DWORD *)(a1 + 40);
  v6 = v1 + 128;
  v7 = *(_QWORD *)(v1 + 128);
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
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32))
  {
LABEL_12:
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lut Hdl\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 770);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    goto LABEL_14;
  }
  v14 = v1 + 128;
  do
  {
    v15 = *(_DWORD *)(v3 + 32);
    v16 = v15 >= v5;
    if (v15 >= v5)
      v17 = (uint64_t *)v3;
    else
      v17 = (uint64_t *)(v3 + 8);
    if (v16)
      v14 = v3;
    v3 = *v17;
  }
  while (*v17);
  if (v14 == v2 || v5 < *(_DWORD *)(v14 + 32))
    v14 = v1 + 128;
  std::function<void ()(gnss::Result)>::operator=(v61, v14 + 40);
  result = std::__tree<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::function<void ()(gnss::Result)>>>>::erase((uint64_t **)(v1 + 120), (uint64_t *)v6);
  if (!v62)
  {
    if (g_LbsOsaTrace_Config < 2)
      return result;
    bzero(__str, 0x3C6uLL);
    v25 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lut Hdl NULL\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 87, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 516);
    gnssOsa_PrintLog(__str, 2, 1, 0);
    goto LABEL_14;
  }
  v18 = gnss::GnssAdaptDevice::Ga07_16MapGnsRespToGnssResult(v1, *(_DWORD *)(a1 + 48));
  v19 = *(_DWORD *)(a1 + 44);
  v20 = MEMORY[0x24BDAC760];
  if (!v19)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v26 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ApiType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 69, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 515);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    goto LABEL_69;
  }
  if (v19 != 1)
  {
    if (v19 != 2)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v30 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ApiState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 87, "Ga04_01HandleGnsEeStatusResponse_block_invoke", 262, *(_DWORD *)(a1 + 44));
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      goto LABEL_69;
    }
    if (!*(_QWORD *)(v1 + 256))
      goto LABEL_69;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v58, v1 + 232);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3802000000;
    v43 = __Block_byref_object_copy__21_0;
    v44 = __Block_byref_object_dispose__22_0;
    LOBYTE(v46) = *(_BYTE *)(a1 + 56);
    v45 = *(_QWORD *)(a1 + 64);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI Data StartGpsSecs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", v41[5]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v22 = *(NSObject **)(v1 + 160);
    block[0] = v20;
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2_24;
    block[3] = &unk_251CDCCB0;
    v23 = v53;
    v24 = (uint64_t)v59;
    if (v59)
    {
      if (v59 == v58)
      {
        v54 = v53;
        (*(void (**)(_QWORD *, _BYTE *))(v58[0] + 24))(v58, v53);
        goto LABEL_56;
      }
      v24 = (*(uint64_t (**)(void))(*v59 + 16))();
    }
    v54 = (_BYTE *)v24;
LABEL_56:
    block[4] = &v40;
    dispatch_async(v22, block);
    v31 = v54;
    goto LABEL_59;
  }
  if (!*(_QWORD *)(v1 + 224))
    goto LABEL_69;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v58, v1 + 200);
  v40 = 0;
  v41 = &v40;
  v42 = 0x4802000000;
  v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  LOBYTE(v45) = 0;
  v47 = *(_BYTE *)(a1 + 56);
  v46 = *(_OWORD *)(a1 + 64);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v27 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ORB Data StartGpsSecs,%llu,EndGpsSecs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", v41[6], v41[7]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v28 = *(NSObject **)(v1 + 160);
  v55[0] = v20;
  v55[1] = 1174405120;
  v55[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2;
  v55[3] = &unk_251CDCC78;
  v23 = v56;
  v29 = (uint64_t)v59;
  if (v59)
  {
    if (v59 == v58)
    {
      v57 = v56;
      (*(void (**)(_QWORD *, _BYTE *))(v58[0] + 24))(v58, v56);
      goto LABEL_58;
    }
    v29 = (*(uint64_t (**)(void))(*v59 + 16))();
  }
  v57 = (_BYTE *)v29;
LABEL_58:
  v55[4] = &v40;
  dispatch_async(v28, v55);
  v31 = v57;
LABEL_59:
  if (v31 == v23)
  {
    v32 = 4;
    goto LABEL_63;
  }
  if (v31)
  {
    v32 = 5;
    v23 = v31;
LABEL_63:
    (*(void (**)(_BYTE *))(*(_QWORD *)v23 + 8 * v32))(v23);
  }
  _Block_object_dispose(&v40, 8);
  v33 = v59;
  if (v59 == v58)
  {
    v34 = 4;
    v33 = v58;
  }
  else
  {
    if (!v59)
      goto LABEL_69;
    v34 = 5;
  }
  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_69:
  v35 = *(NSObject **)(v1 + 160);
  v48[0] = v20;
  v48[1] = 1174405120;
  v48[2] = ___ZN4gnss15GnssAdaptDevice32Ga04_01HandleGnsEeStatusResponseE15e_gnsEE_MsgTypejP17s_gnsEE_ApiStatus_block_invoke_2_27;
  v48[3] = &__block_descriptor_tmp_28_0;
  v36 = v49;
  v37 = (uint64_t)v62;
  if (v62)
  {
    if (v62 == v61)
    {
      v50 = v49;
      (*(void (**)(_QWORD *, _BYTE *))(v61[0] + 24))(v61, v49);
      goto LABEL_74;
    }
    v37 = (*(uint64_t (**)(void))(*v62 + 16))();
  }
  v50 = (_BYTE *)v37;
LABEL_74:
  v51 = v18;
  dispatch_async(v35, v48);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v38 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ee Type,%u,ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v38), "ADP", 73, "Ga04_01HandleGnsEeStatusResponse_block_invoke", *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 44));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (v50 == v49)
  {
    v39 = 4;
    goto LABEL_80;
  }
  if (v50)
  {
    v39 = 5;
    v36 = v50;
LABEL_80:
    (*(void (**)(_QWORD *))(*v36 + 8 * v39))(v36);
  }
LABEL_14:
  result = v62;
  if (v62 == v61)
  {
    v13 = 4;
    result = v61;
  }
  else
  {
    if (!v62)
      return result;
    v13 = 5;
  }
  return (uint64_t *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

@end
