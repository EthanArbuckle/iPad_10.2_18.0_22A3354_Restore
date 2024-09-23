double sub_21AB7F714(uint64_t a1, uint64_t a2)
{
  double result;

  result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_21AB98D60;
  *(_QWORD *)a1 = &off_24DDB71D0;
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

double sub_21AB7F734(uint64_t a1, uint64_t a2)
{
  double result;

  result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_21AB98D60;
  *(_QWORD *)a1 = &off_24DDB7200;
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

double sub_21AB7F754(uint64_t a1, uint64_t a2)
{
  double result;

  result = 2.50320809e-308;
  *(_OWORD *)(a1 + 8) = xmmword_21AB98D60;
  *(_QWORD *)a1 = &off_24DDB7230;
  *(_QWORD *)(a1 + 24) = a2;
  return result;
}

BOOL sub_21AB7F774(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL8 result;
  uint64_t v16;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int32x4_t v37;
  BOOL v38;
  BOOL v39;
  unsigned int v40;
  int v41;

  v7 = a3 + *(unsigned int *)(a3 + 4);
  v8 = *(unsigned int *)(v7 + 144);
  if ((_DWORD)v8 == 20)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1248) = 0u;
    *(_OWORD *)(v7 + 1264) = 0u;
    *(_OWORD *)(v7 + 1280) = 0u;
    *(_OWORD *)(v7 + 1296) = 0u;
    *(_OWORD *)(v7 + 1312) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1244) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(_QWORD *)(v7 + 1244) = 1;
      *(_WORD *)(v7 + 1252) = 64;
      *(_WORD *)(v7 + 1254) = a6 >> 6;
      *(_DWORD *)(v7 + 1256) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      v10 = v9[3];
      if ((_DWORD)v10 == 3776)
      {
        if (v9[1] == 21)
        {
          if (a4)
          {
            v9[926] = a4;
            v11 = *(_QWORD *)(a1 + 24);
            v9[925] = HIDWORD(v11);
            v9[924] = v11 + a5;
            v12 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v12;
            if (a6)
            {
LABEL_11:
              v9[929] = a6;
              v13 = *(_QWORD *)(a1 + 24);
              v9[928] = HIDWORD(v13);
              v9[927] = v13 + a7;
              v14 = v12 & 0xFFFFFFCF | 0x10;
LABEL_22:
              v37 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v14), (int8x16_t)xmmword_21AB98D70);
              v38 = (v14 & 0xC000) == 0x8000;
              v39 = (v14 & 0x30000) == 0x20000;
              v40 = v14 & 0xFFFFFFFC;
              result = 1;
              if ((((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v37, (int32x4_t)xmmword_21AB98D80))) | v38) | v39) & 1) != 0)
                v41 = 2;
              else
                v41 = 1;
              v9[5] = v40 | v41;
              return result;
            }
          }
          else
          {
            v9[926] = 0;
            *((_QWORD *)v9 + 462) = 0;
            v12 = v9[5] & 0xFFFFFFF3;
            v9[5] = v12;
            if (a6)
              goto LABEL_11;
          }
          *((_QWORD *)v9 + 464) = 0;
          v9[927] = 0;
          v14 = v12 & 0xFFFFFFCF;
          goto LABEL_22;
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB97358();
          return 0;
        }
      }
      else
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB973C8(v10, v30, v31, v32, v33, v34, v35, v36);
          return 0;
        }
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_21AB972EC(result, v23, v24, v25, v26, v27, v28, v29);
        return 0;
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_21AB97444(v8, v16, v17, v18, v19, v20, v21, v22);
      return 0;
    }
  }
  return result;
}

BOOL sub_21AB7F9EC(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 result;
  uint64_t v15;
  uint64_t v16;
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
  int32x4_t v29;
  BOOL v30;
  BOOL v31;
  unsigned int v32;
  int v33;

  v7 = a3 + *(unsigned int *)(a3 + 4);
  v8 = *(unsigned int *)(v7 + 144);
  if ((_DWORD)v8 == 18)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1080) = 0u;
    *(_OWORD *)(v7 + 1096) = 0u;
    *(_OWORD *)(v7 + 1112) = 0u;
    *(_OWORD *)(v7 + 1128) = 0u;
    *(_OWORD *)(v7 + 1144) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1076) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(_QWORD *)(v7 + 1076) = 1;
      *(_WORD *)(v7 + 1084) = 64;
      *(_WORD *)(v7 + 1086) = a6 >> 6;
      *(_DWORD *)(v7 + 1088) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      if (v9[3] == 6528)
      {
        if (v9[1] == 26)
        {
          if (a4)
          {
            v9[1600] = a4;
            v10 = *(_QWORD *)(a1 + 24);
            v9[1599] = HIDWORD(v10);
            v9[1598] = v10 + a5;
            v11 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v11;
            if (a6)
            {
LABEL_11:
              v9[1603] = a6;
              v12 = *(_QWORD *)(a1 + 24);
              v9[1602] = HIDWORD(v12);
              v9[1601] = v12 + a7;
              v13 = v11 & 0xFFFFFFCF | 0x10;
LABEL_22:
              v29 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v13), (int8x16_t)xmmword_21AB98D70);
              v30 = (v13 & 0xC000) == 0x8000;
              v31 = (v13 & 0x30000) == 0x20000;
              v32 = v13 & 0xFFFFFFFC;
              result = 1;
              if ((((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v29, (int32x4_t)xmmword_21AB98D80))) | v30) | v31) & 1) != 0)
                v33 = 2;
              else
                v33 = 1;
              v9[5] = v32 | v33;
              return result;
            }
          }
          else
          {
            v9[1600] = 0;
            *((_QWORD *)v9 + 799) = 0;
            v11 = v9[5] & 0xFFFFFFF3;
            v9[5] = v11;
            if (a6)
              goto LABEL_11;
          }
          *((_QWORD *)v9 + 801) = 0;
          v13 = v11 & 0xFFFFFFCF;
          v9[1601] = 0;
          goto LABEL_22;
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB974B0();
          return 0;
        }
      }
      else
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB97520();
          return 0;
        }
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_21AB972EC(result, v22, v23, v24, v25, v26, v27, v28);
        return 0;
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_21AB97444(v8, v15, v16, v17, v18, v19, v20, v21);
      return 0;
    }
  }
  return result;
}

BOOL sub_21AB7FC5C(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5, unsigned int a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 result;
  uint64_t v15;
  uint64_t v16;
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
  int32x4_t v29;
  BOOL v30;
  BOOL v31;
  unsigned int v32;
  int v33;

  v7 = a3 + *(unsigned int *)(a3 + 4);
  v8 = *(unsigned int *)(v7 + 144);
  if ((_DWORD)v8 == 18)
  {
    *(_OWORD *)(v7 + 220) = 0u;
    *(_OWORD *)(v7 + 204) = 0u;
    *(_OWORD *)(v7 + 188) = 0u;
    *(_OWORD *)(v7 + 172) = 0u;
    *(_OWORD *)(v7 + 156) = 0u;
    *(_OWORD *)(v7 + 1080) = 0u;
    *(_OWORD *)(v7 + 1096) = 0u;
    *(_OWORD *)(v7 + 1112) = 0u;
    *(_OWORD *)(v7 + 1128) = 0u;
    *(_OWORD *)(v7 + 1144) = 0u;
    *(_DWORD *)(v7 + 152) = 0x7FFFFFFF;
    *(_DWORD *)(v7 + 1076) = 0x7FFFFFFF;
    if (a4)
    {
      *(_DWORD *)(v7 + 152) = 0;
      *(_WORD *)(v7 + 160) = 64;
      *(_WORD *)(v7 + 162) = a4 >> 6;
      *(_DWORD *)(v7 + 164) = 524352;
    }
    if (a6)
    {
      *(_QWORD *)(v7 + 1076) = 1;
      *(_WORD *)(v7 + 1084) = 64;
      *(_WORD *)(v7 + 1086) = a6 >> 6;
      *(_DWORD *)(v7 + 1088) = 524352;
    }
    if (*a2)
    {
      v9 = (_DWORD *)((char *)a2 + a2[1]);
      if (v9[3] == 6528)
      {
        if (v9[1] == 29)
        {
          if (a4)
          {
            v9[1600] = a4;
            v10 = *(_QWORD *)(a1 + 24);
            v9[1599] = HIDWORD(v10);
            v9[1598] = v10 + a5;
            v11 = v9[5] & 0xFFFFFFF3 | 4;
            v9[5] = v11;
            if (a6)
            {
LABEL_11:
              v9[1603] = a6;
              v12 = *(_QWORD *)(a1 + 24);
              v9[1602] = HIDWORD(v12);
              v9[1601] = v12 + a7;
              v13 = v11 & 0xFFFFFFCF | 0x10;
LABEL_22:
              v29 = (int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v13), (int8x16_t)xmmword_21AB98D70);
              v30 = (v13 & 0xC000) == 0x8000;
              v31 = (v13 & 0x30000) == 0x20000;
              v32 = v13 & 0xFFFFFFFC;
              result = 1;
              if ((((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(v29, (int32x4_t)xmmword_21AB98D80))) | v30) | v31) & 1) != 0)
                v33 = 2;
              else
                v33 = 1;
              v9[5] = v32 | v33;
              return result;
            }
          }
          else
          {
            v9[1600] = 0;
            *((_QWORD *)v9 + 799) = 0;
            v11 = v9[5] & 0xFFFFFFF3;
            v9[5] = v11;
            if (a6)
              goto LABEL_11;
          }
          *((_QWORD *)v9 + 801) = 0;
          v13 = v11 & 0xFFFFFFCF;
          v9[1601] = 0;
          goto LABEL_22;
        }
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB97588();
          return 0;
        }
      }
      else
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_21AB97520();
          return 0;
        }
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_21AB972EC(result, v22, v23, v24, v25, v26, v27, v28);
        return 0;
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_21AB97444(v8, v15, v16, v17, v18, v19, v20, v21);
      return 0;
    }
  }
  return result;
}

void sub_21AB7FED0()
{
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB7FEE4()
{
  return 1;
}

void sub_21AB7FEF0()
{
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB7FF04()
{
  return 2;
}

void sub_21AB7FF10()
{
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB7FF24()
{
  return 2;
}

void sub_21AB7FF2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21AB7FF3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21AB7FF4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

uint64_t sub_21AB7FF9C(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = &off_24DDB72B8;
  *(_QWORD *)(a1 + 8) = pixelBuffer;
  *(_QWORD *)(a1 + 16) = a3;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 80) = -1;
  *(_QWORD *)(a1 + 84) = 0;
  *(_QWORD *)(a1 + 100) = 0;
  *(_QWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 108) = 0;
  *(_QWORD *)(a1 + 88) = CVPixelBufferGetBaseAddress(pixelBuffer);
  *(_QWORD *)(a1 + 96) = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 16));
  if (sub_21AB7F704())
  {
    v4 = operator new();
    v5.n128_f64[0] = sub_21AB7F714(v4, 0x22D200000);
  }
  else if (sub_21AB7F708())
  {
    v4 = operator new();
    v5.n128_f64[0] = sub_21AB7F734(v4, 0x29B200000);
  }
  else if (sub_21AB7F70C())
  {
    v4 = operator new();
    v5.n128_f64[0] = sub_21AB7F734(v4, 0x48F200000);
  }
  else
  {
    if (!sub_21AB7F710())
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v8)
      {
        sub_21AB975F8(v8, v9, v10, v11, v12, v13, v14, v15);
        v6 = *(_QWORD *)(a1 + 104);
        *(_QWORD *)(a1 + 104) = 0;
        if (!v6)
          return a1;
      }
      else
      {
        v6 = *(_QWORD *)(a1 + 104);
        *(_QWORD *)(a1 + 104) = 0;
        if (!v6)
          return a1;
      }
      goto LABEL_10;
    }
    v4 = operator new();
    v5.n128_f64[0] = sub_21AB7F754(v4, 0x323200000);
  }
  v6 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v4;
  if (v6)
LABEL_10:
    (*(void (**)(uint64_t, __n128))(*(_QWORD *)v6 + 8))(v6, v5);
  return a1;
}

void sub_21AB8013C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void **v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = v2;
  MEMORY[0x220752450](v4, 0x1081C40ABB4582ELL);
  v6 = v1[13];
  v1[13] = 0;
  if (v6)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v7 = (void *)v1[6];
    if (!v7)
    {
LABEL_3:
      v8 = *v3;
      if (!*v3)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else
  {
    v7 = (void *)v1[6];
    if (!v7)
      goto LABEL_3;
  }
  v1[7] = v7;
  operator delete(v7);
  v8 = *v3;
  if (!*v3)
LABEL_4:
    _Unwind_Resume(a1);
LABEL_7:
  v1[4] = v8;
  operator delete(v8);
  _Unwind_Resume(a1);
}

_QWORD *sub_21AB801CC(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  *a1 = &off_24DDB72B8;
  v2 = a1[13];
  a1[13] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[3];
  if (v4)
  {
    a1[4] = v4;
    operator delete(v4);
  }
  return a1;
}

void sub_21AB80230(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  *a1 = &off_24DDB72B8;
  v2 = a1[13];
  a1[13] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[3];
  if (v4)
  {
    a1[4] = v4;
    operator delete(v4);
  }
  JUMPOUT(0x220752450);
}

BOOL sub_21AB802A4(uint64_t a1, int a2)
{
  return (*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 104) + 24))(*(_QWORD *)(a1 + 104)) == a2;
}

BOOL sub_21AB802D8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104) != 0;
}

_QWORD *sub_21AB802E8(_QWORD *result)
{
  uint64_t v1;

  result[4] = result[3];
  result[7] = result[6];
  v1 = result[13];
  result[9] = *(unsigned int *)(v1 + 12);
  result[10] = *(unsigned int *)(v1 + 20);
  return result;
}

BOOL sub_21AB80310(uint64_t a1, int a2, unsigned int a3, unsigned int a4, void *__src, int a6)
{
  unsigned int v9;
  _BOOL8 result;
  BOOL v13;
  unint64_t v14;
  char *v15;
  _DWORD *v16;
  char **v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  unsigned int v25;
  unsigned int v26;

  if (!__src || !*(_QWORD *)(a1 + 96))
    return 0;
  v9 = *(_DWORD *)(*(_QWORD *)(a1 + 104) + 20);
  result = v9 > a3;
  if (a4 && v9 > a3)
  {
    v13 = a3 != a6;
    v15 = *(char **)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 64);
    if ((unint64_t)v15 >= v14)
    {
      v17 = (char **)(a1 + 48);
      v18 = *(char **)(a1 + 48);
      v19 = (v15 - v18) >> 4;
      v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60)
        sub_21AB808CC();
      v21 = v14 - (_QWORD)v18;
      if (v21 >> 3 > v20)
        v20 = v21 >> 3;
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
        v22 = 0xFFFFFFFFFFFFFFFLL;
      else
        v22 = v20;
      if (v22)
      {
        if (v22 >> 60)
          sub_21AB80954();
        v23 = (char *)operator new(16 * v22);
        v17 = (char **)(a1 + 48);
      }
      else
      {
        v23 = 0;
      }
      v24 = &v23[16 * v19];
      *(_DWORD *)v24 = a3;
      *((_DWORD *)v24 + 1) = a6;
      *((_DWORD *)v24 + 2) = a4;
      v24[12] = v13;
      v16 = v24 + 16;
      if (v15 != v18)
      {
        do
        {
          *((_OWORD *)v24 - 1) = *((_OWORD *)v15 - 1);
          v24 -= 16;
          v15 -= 16;
        }
        while (v15 != v18);
        v15 = *v17;
      }
      *(_QWORD *)(a1 + 48) = v24;
      *(_QWORD *)(a1 + 56) = v16;
      *(_QWORD *)(a1 + 64) = &v23[16 * v22];
      if (v15)
        operator delete(v15);
    }
    else
    {
      *(_DWORD *)v15 = a3;
      *((_DWORD *)v15 + 1) = a6;
      *((_DWORD *)v15 + 2) = a4;
      v16 = v15 + 16;
      v15[12] = v13;
    }
    *(_QWORD *)(a1 + 56) = v16;
    v25 = *(_DWORD *)(a1 + 80);
    v26 = *(_DWORD *)(a1 + 84);
    if (v25 >= a3)
      v25 = a3;
    if (v26 <= a4 + a3)
      v26 = a4 + a3;
    *(_DWORD *)(a1 + 80) = v25;
    *(_DWORD *)(a1 + 84) = v26;
    memmove((void *)(*(_QWORD *)(a1 + 96) + a3), __src, a4);
    return 1;
  }
  return result;
}

uint64_t sub_21AB804B0(_QWORD *a1, int a2, unsigned int a3, size_t __len, void *__src, unsigned int a6)
{
  uint64_t v8;
  unsigned int v9;
  unsigned int v11;
  char *v16;
  void **v17;
  char *v18;
  BOOL v19;
  char *v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  BOOL v29;

  if (!__src)
    return 0;
  if (!a1[11])
    return 0;
  v8 = a1[13];
  v9 = *(_DWORD *)(v8 + 8);
  if (v9 > a3)
    return 0;
  v11 = *(_DWORD *)(v8 + 12);
  if (v9 > a6 || v11 <= a3)
    return 0;
  if ((_DWORD)__len)
  {
    v16 = (char *)a1[3];
    v18 = (char *)a1[4];
    v17 = (void **)(a1 + 3);
    v19 = a3 != a6;
    v20 = v16;
    if (a3 == a6)
    {
      if (v16 != v18)
      {
        v20 = (char *)a1[3];
        while (*(_DWORD *)v20 != a3)
        {
          v20 += 16;
          if (v20 == v18)
            goto LABEL_25;
        }
      }
      if (v20 != v18)
        v19 = 1;
    }
    else
    {
      if (v16 != v18)
      {
        v20 = (char *)a1[3];
        while (*(_DWORD *)v20 != a3)
        {
          v20 += 16;
          if (v20 == v18)
            goto LABEL_25;
        }
      }
      if (v20 != v18)
        v20[12] = 1;
    }
LABEL_25:
    v21 = a1[5];
    if ((unint64_t)v18 >= v21)
    {
      v23 = (v18 - v16) >> 4;
      v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 60)
        sub_21AB808CC();
      v25 = v21 - (_QWORD)v16;
      if (v25 >> 3 > v24)
        v24 = v25 >> 3;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
        v26 = 0xFFFFFFFFFFFFFFFLL;
      else
        v26 = v24;
      if (v26)
      {
        v29 = v19;
        if (v26 >> 60)
          sub_21AB80954();
        v27 = (char *)operator new(16 * v26);
        v19 = v29;
      }
      else
      {
        v27 = 0;
      }
      v28 = &v27[16 * v23];
      *(_DWORD *)v28 = a3;
      *((_DWORD *)v28 + 1) = a6;
      *((_DWORD *)v28 + 2) = __len;
      v28[12] = v19;
      v22 = v28 + 16;
      if (v16 != v18)
      {
        do
        {
          *((_OWORD *)v28 - 1) = *((_OWORD *)v18 - 1);
          v28 -= 16;
          v18 -= 16;
        }
        while (v18 != v16);
        v16 = (char *)*v17;
      }
      a1[3] = v28;
      a1[4] = v22;
      a1[5] = &v27[16 * v26];
      if (v16)
        operator delete(v16);
    }
    else
    {
      *(_DWORD *)v18 = a3;
      *((_DWORD *)v18 + 1) = a6;
      *((_DWORD *)v18 + 2) = __len;
      v22 = v18 + 16;
      v18[12] = v19;
    }
    a1[4] = v22;
    if (__len)
      memmove((void *)(a1[11] + a6 - *(_DWORD *)(a1[13] + 8)), __src, __len);
  }
  return 1;
}

uint64_t sub_21AB806C4(uint64_t a1, int a2, uint64_t a3, size_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 96);
  if (!v4 || *(_DWORD *)(*(_QWORD *)(a1 + 104) + 20) <= a3)
    return 0;
  if (a4)
    bzero((void *)(v4 + a3), a4);
  return 1;
}

uint64_t sub_21AB8070C()
{
  return 1;
}

uint64_t sub_21AB80714()
{
  return 1;
}

uint64_t sub_21AB8071C()
{
  return 1;
}

uint64_t sub_21AB80724(uint64_t a1, uint64_t a2)
{
  void *BaseAddress;
  void *v5;
  BOOL v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;

  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 16));
  v5 = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 24));
  if (BaseAddress)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      sub_21AB97630(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 24);
    v16 = *(_QWORD *)(a1 + 32);
    if (v16 == v17)
    {
      *(_QWORD *)(a1 + 72) = 0;
    }
    else
    {
      v18 = v17 + 8;
      v19 = 1;
      do
      {
        v20 = v18 - 8;
        v21 = *(_DWORD *)(v18 - 8);
        if (!*(_BYTE *)(v18 + 4))
        {
          v22 = *(_DWORD *)v18 + v21;
          if ((v19 & 1) == 0)
          {
            if (v21 >= *(_DWORD *)(a1 + 72))
              v21 = *(_DWORD *)(a1 + 72);
            if (*(_DWORD *)(a1 + 76) > v22)
              v22 = *(_DWORD *)(a1 + 76);
          }
          v19 = 0;
          *(_DWORD *)(a1 + 72) = v21;
          *(_DWORD *)(a1 + 76) = v22;
        }
        v18 += 16;
      }
      while (v20 + 16 != v16);
    }
    v24 = *(_QWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 56);
    if (v23 == v24)
    {
      v31 = 0;
      v30 = 0;
    }
    else
    {
      v25 = v24 + 8;
      v26 = 1;
      do
      {
        v27 = v25 - 8;
        v28 = *(_DWORD *)(v25 - 8);
        if (!*(_BYTE *)(v25 + 4))
        {
          v29 = *(_DWORD *)v25 + v28;
          if ((v26 & 1) == 0)
          {
            if (v28 >= *(_DWORD *)(a1 + 80))
              v28 = *(_DWORD *)(a1 + 80);
            if (*(_DWORD *)(a1 + 84) > v29)
              v29 = *(_DWORD *)(a1 + 84);
          }
          v26 = 0;
          *(_DWORD *)(a1 + 80) = v28;
          *(_DWORD *)(a1 + 84) = v29;
        }
        v25 += 16;
      }
      while (v27 + 16 != v23);
      v30 = *(_DWORD *)(a1 + 80) & 0xFFFFFFC0;
      v31 = (*(_DWORD *)(a1 + 84) + 63) & 0xFFFFFFC0;
    }
    v32 = *(_DWORD *)(a1 + 72) & 0xFFFFFFC0;
    v33 = (*(_DWORD *)(a1 + 76) + 63) & 0xFFFFFFC0;
    *(_DWORD *)(a1 + 72) = v32;
    *(_DWORD *)(a1 + 76) = v33;
    *(_DWORD *)(a1 + 80) = v30;
    *(_DWORD *)(a1 + 84) = v31;
    return (*(uint64_t (**)(_QWORD, void *, void *, _QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1 + 104) + 16))(*(_QWORD *)(a1 + 104), BaseAddress, v5, v33 - v32, v32, v31 - v30);
  }
}

void sub_21AB808CC()
{
  sub_21AB808E0("vector");
}

void sub_21AB808E0(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21AB80930(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DDB6CA8, MEMORY[0x24BEDAAF0]);
}

void sub_21AB8091C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21AB80930(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_21AB80954()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_21AB8097C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21AB8098C(uint64_t a1)
{
  std::mutex *v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  dispatch_time_t v5;
  unsigned __int8 v6;

  *(_BYTE *)(a1 + 88) = 1;
  v2 = (std::mutex *)(a1 + 280);
  std::mutex::lock((std::mutex *)(a1 + 280));
  v3 = (unsigned __int8 *)(a1 + 204);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(0, v3));
  if ((v4 & 1) != 0)
    dispatch_suspend(*(dispatch_object_t *)(a1 + 208));
  v5 = dispatch_time(0, 5000000);
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 208), v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  do
    v6 = __ldaxr(v3);
  while (__stlxr(1u, v3));
  if ((v6 & 1) == 0)
    dispatch_resume(*(dispatch_object_t *)(a1 + 208));
  std::mutex::unlock(v2);
}

void sub_21AB80A28(uint64_t a1, uint64_t a2, int a3)
{
  __CVBuffer *v4;
  __CVBuffer *v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CVBuffer *v14;

  if (a3)
  {
    v4 = *(__CVBuffer **)(a2 + 24);
    if (v4)
    {
      CVPixelBufferUnlockBaseAddress(v4, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 24));
      *(_QWORD *)(a2 + 24) = 0;
    }
    v5 = *(__CVBuffer **)(a2 + 16);
    if (v5)
    {
      CVPixelBufferUnlockBaseAddress(v5, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 16));
      *(_QWORD *)(a2 + 16) = 0;
    }
    v6 = *(__CVBuffer **)(a2 + 32);
    if (v6)
    {
      CVPixelBufferUnlockBaseAddress(v6, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 32));
      *(_QWORD *)(a2 + 32) = 0;
    }
    v7 = *(__CVBuffer **)(a2 + 40);
    if (v7)
    {
      CVPixelBufferUnlockBaseAddress(v7, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 40));
      *(_QWORD *)(a2 + 40) = 0;
    }
    v8 = *(__CVBuffer **)(a2 + 48);
    if (v8)
    {
      CVPixelBufferUnlockBaseAddress(v8, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a2 + 48));
      *(_QWORD *)(a2 + 48) = 0;
    }
  }
  v9 = *(_QWORD *)(a2 + 64) - *(_QWORD *)(a2 + 56);
  if (v9)
  {
    v10 = 0;
    v11 = v9 >> 3;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    do
    {
      v13 = *(_QWORD *)(a2 + 56);
      v14 = *(__CVBuffer **)(v13 + 8 * v10);
      if (v14)
      {
        CVPixelBufferUnlockBaseAddress(v14, 0);
        CVPixelBufferRelease(*(CVPixelBufferRef *)(v13 + 8 * v10));
        *(_QWORD *)(v13 + 8 * v10) = 0;
      }
      ++v10;
    }
    while (v12 != v10);
  }
}

__IOSurface *sub_21AB80B38(uint64_t a1, unint64_t a2)
{
  const CFDictionaryKeyCallBacks *v4;
  const CFDictionaryValueCallBacks *v5;
  __CFDictionary *Mutable;
  unint64_t v7;
  const void *v8;
  unint64_t v9;
  CFNumberRef v10;
  const void *v11;
  CFNumberRef v12;
  const void *v13;
  CFNumberRef v14;
  const void *v15;
  CFNumberRef v16;
  __CFArray *v17;
  __CFDictionary *v18;
  const void *v19;
  CFNumberRef v20;
  const void *v21;
  CFNumberRef v22;
  const void *v23;
  CFNumberRef v24;
  __IOSurface *v25;
  uint32_t valuePtr;

  v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = a1 + a2 - 1;
  v8 = (const void *)*MEMORY[0x24BDD8FD0];
  valuePtr = a2;
  v9 = v7 / a2;
  v10 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v8, v10);
  CFRelease(v10);
  v11 = (const void *)*MEMORY[0x24BDD8EB0];
  valuePtr = v9;
  v12 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v11, v12);
  CFRelease(v12);
  v13 = (const void *)*MEMORY[0x24BDD8E38];
  valuePtr = a2;
  v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v13, v14);
  CFRelease(v14);
  v15 = (const void *)*MEMORY[0x24BDD8EF8];
  valuePtr = 1278226488;
  v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, v15, v16);
  CFRelease(v16);
  v17 = CFArrayCreateMutable(0, 1, MEMORY[0x24BDBD690]);
  v18 = CFDictionaryCreateMutable(0, 0, v4, v5);
  v19 = (const void *)*MEMORY[0x24BDD8FA8];
  valuePtr = a2;
  v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v19, v20);
  CFRelease(v20);
  v21 = (const void *)*MEMORY[0x24BDD8F70];
  valuePtr = v9;
  v22 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v21, v22);
  CFRelease(v22);
  v23 = (const void *)*MEMORY[0x24BDD8F18];
  valuePtr = a2;
  v24 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v18, v23, v24);
  CFRelease(v24);
  CFArrayAppendValue(v17, v18);
  CFRelease(v18);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8F88], v17);
  CFRelease(v17);
  v25 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  valuePtr = 0;
  IOSurfaceLock(v25, 1u, &valuePtr);
  return v25;
}

BOOL sub_21AB80DE8(void *a1, CVPixelBufferRef *a2, char *key)
{
  _BOOL8 result;
  xpc_object_t value;
  __IOSurface *v6;
  __IOSurface *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*a2)
    return 1;
  value = xpc_dictionary_get_value(a1, key);
  if (value)
  {
    v6 = IOSurfaceLookupFromXPCObject(value);
    if (v6)
    {
      v7 = v6;
      if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, 0, a2))
      {
        if (CVPixelBufferLockBaseAddress(*a2, 0))
        {
          v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v8)
            sub_21AB97738(v8, v9, v10, v11, v12, v13, v14, v15);
        }
        CFRelease(v7);
        return 1;
      }
      CFRelease(v7);
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_21AB9776C();
        return 0;
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_21AB976D0();
        return 0;
      }
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_21AB97668();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21AB80F24(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  const void **v4;
  uint64_t *v5;
  BOOL v6;
  const void **v7;
  uint64_t v8;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  const void **v15;
  unint64_t *v16;
  unint64_t v17;

  v2 = sub_21AB8E68C(*a1);
  v3 = (_QWORD *)operator new();
  *v3 = v2;
  v4 = (const void **)a1[2];
  a1[2] = (uint64_t)v3;
  if (v4)
  {
    sub_21AB8EA00(*v4);
    MEMORY[0x220752450](v4, 0x20C4093837F09);
    v5 = (uint64_t *)a1[2];
    if (!v5)
    {
      v10 = (std::__shared_weak_count *)a1[1];
      *a1 = 0;
      a1[1] = 0;
      if (!v10)
        return 7;
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      v8 = 7;
      if (v14)
        return v8;
LABEL_26:
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      return v8;
    }
    v2 = *v5;
  }
  v6 = sub_21AB8E8D0(v2);
  v7 = (const void **)a1[2];
  if (!v6)
  {
    a1[2] = 0;
    if (v7)
    {
      sub_21AB8EA00(*v7);
      MEMORY[0x220752450](v7, 0x20C4093837F09);
    }
    v10 = (std::__shared_weak_count *)a1[1];
    *a1 = 0;
    a1[1] = 0;
    if (!v10)
      return 8;
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    v8 = 8;
    if (v12)
      return v8;
    goto LABEL_26;
  }
  if (sub_21AB8E858((uint64_t)*v7, &unk_24DDB7350))
    return 0;
  v15 = (const void **)a1[2];
  a1[2] = 0;
  if (v15)
  {
    sub_21AB8EA00(*v15);
    MEMORY[0x220752450](v15, 0x20C4093837F09);
  }
  v10 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v10)
  {
    v16 = (unint64_t *)&v10->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    v8 = 9;
    if (v17)
      return v8;
    goto LABEL_26;
  }
  return 9;
}

void sub_21AB81128(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  if ((a3 || a4 < 1 || !a5) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_21AB977D4(a5, a3, a4);
}

uint64_t sub_21AB81198(uint64_t a1)
{
  const void **v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34[3];
  _QWORD v35[3];
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  kdebug_trace();
  std::mutex::lock((std::mutex *)(a1 + 216));
  v2 = *(const void ***)(a1 + 16);
  if (v2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)(a1 + 16) = 0;
LABEL_4:
      sub_21AB8EA00(*v2);
      MEMORY[0x220752450](v2, 0x20C4093837F09);
      goto LABEL_5;
    }
    LOWORD(v34[0]) = 0;
    _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: createDeviceAndSession called while active_session exists", (uint8_t *)v34, 2u);
    v2 = *(const void ***)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    if (v2)
      goto LABEL_4;
  }
LABEL_5:
  if (*(_QWORD *)a1)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      sub_21AB97898(v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = *(std::__shared_weak_count **)(a1 + 8);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  sub_21AB8E384(1, v34);
  v14 = *(_OWORD *)v34;
  *(_OWORD *)v34 = 0uLL;
  v15 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v14;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = (std::__shared_weak_count *)v34[1];
  if (!v34[1])
    goto LABEL_22;
  v19 = (unint64_t *)(v34[1] + 8);
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (v20)
  {
LABEL_22:
    v21 = *(_QWORD **)a1;
    if (*(_QWORD *)a1)
      goto LABEL_23;
LABEL_27:
    v24 = 6;
    goto LABEL_31;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  v21 = *(_QWORD **)a1;
  if (!*(_QWORD *)a1)
    goto LABEL_27;
LABEL_23:
  v35[0] = &off_24DDB73C0;
  v35[1] = a1;
  v36 = v35;
  sub_21AB8E780(v21, v35);
  v22 = v36;
  if (v36 == v35)
  {
    v23 = 4;
    v22 = v35;
  }
  else
  {
    if (!v36)
      goto LABEL_30;
    v23 = 5;
  }
  (*(void (**)(_QWORD *))(*v22 + 8 * v23))(v22);
LABEL_30:
  v24 = sub_21AB80F24((uint64_t *)a1);
  if ((_DWORD)v24)
  {
LABEL_31:
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      sub_21AB97864(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_35;
  }
  if (*(_QWORD *)(a1 + 24))
  {
    sub_21AB90D54("/Library/Caches/com.apple.xbs/Sources/VisionHWAccelerationServices/product/VisionHWAccelerationServices/VisionHWAccelerationServices/src/VisionHWAServices.cpp", 302, "(transaction == nullptr) && \"stale os_transaction pointer\"", (void (*)(void *))sub_21AB90F04);
    abort();
  }
  v24 = 0;
  *(_QWORD *)(a1 + 24) = os_transaction_create();
LABEL_35:
  std::mutex::unlock((std::mutex *)(a1 + 216));
  kdebug_trace();
  return v24;
}

void sub_21AB8148C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  sub_21AB8407C(exception_object);
}

uint64_t sub_21AB8150C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5)
{
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint8_t v40;
  _BYTE v41[15];

  kdebug_trace();
  if (!a2 && (v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR)))
  {
    sub_21AB9790C(v10, v11, v12, v13, v14, v15, v16, v17);
    if (a3)
      goto LABEL_6;
  }
  else if (a3)
  {
    goto LABEL_6;
  }
  v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v18)
    sub_21AB9790C(v18, v19, v20, v21, v22, v23, v24, v25);
LABEL_6:
  if (!a4 && (v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR)))
  {
    sub_21AB9790C(v26, v27, v28, v29, v30, v31, v32, v33);
    v34 = (_QWORD *)*a5;
    v35 = (_QWORD *)a5[1];
    if ((_QWORD *)*a5 == v35)
      goto LABEL_17;
  }
  else
  {
    v34 = (_QWORD *)*a5;
    v35 = (_QWORD *)a5[1];
    if ((_QWORD *)*a5 == v35)
      goto LABEL_17;
  }
  v36 = MEMORY[0x24BDACB70];
  do
  {
    if (!*v34 && os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21AB978CC(&v40, v41);
    ++v34;
  }
  while (v34 != v35);
LABEL_17:
  std::mutex::lock((std::mutex *)(a1 + 216));
  v37 = *(uint64_t **)(a1 + 16);
  if (v37)
  {
    if (sub_21AB8EDB4(*(_QWORD *)a1, *v37, a2, a3, a4, a5, 1u))
      v38 = 0;
    else
      v38 = 14;
  }
  else
  {
    v38 = 2;
  }
  std::mutex::unlock((std::mutex *)(a1 + 216));
  kdebug_trace();
  return v38;
}

void sub_21AB816A8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB816C4(uint64_t a1, void *a2, int a3)
{
  unsigned int uint64;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  std::string *v31;
  __int128 v32;
  char *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  std::string v43;
  void *__p[2];
  int64_t v45;

  kdebug_trace();
  kdebug_trace();
  uint64 = xpc_dictionary_get_uint64(a2, "ClientId");
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
    goto LABEL_21;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = uint64;
    if (v7 <= uint64)
      v9 = uint64 % v7;
  }
  else
  {
    v9 = ((_DWORD)v7 - 1) & uint64;
  }
  v10 = *(uint64_t ***)(*(_QWORD *)(a1 + 40) + 8 * v9);
  if (v10)
  {
    v11 = *v10;
    if (*v10)
    {
      if (v8.u32[0] < 2uLL)
      {
        v12 = v7 - 1;
        while (1)
        {
          v14 = v11[1];
          if (v14 == uint64)
          {
            if (*((_DWORD *)v11 + 4) == uint64)
              goto LABEL_22;
          }
          else if ((v14 & v12) != v9)
          {
            goto LABEL_21;
          }
          v11 = (uint64_t *)*v11;
          if (!v11)
            goto LABEL_22;
        }
      }
      do
      {
        v13 = v11[1];
        if (v13 == uint64)
        {
          if (*((_DWORD *)v11 + 4) == uint64)
            break;
        }
        else
        {
          if (v13 >= v7)
            v13 %= v7;
          if (v13 != v9)
            goto LABEL_21;
        }
        v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
  }
  else
  {
LABEL_21:
    v11 = 0;
  }
LABEL_22:
  v15 = *((unsigned __int8 *)v11 + 32);
  v16 = xpc_dictionary_get_uint64(a2, "IOBufListSize");
  v17 = v16;
  if (a3)
  {
    if (v16)
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v18)
        sub_21AB97940(v18, v19, v20, v21, v22, v23, v24, v25);
      return 10;
    }
LABEL_48:
    __p[0] = 0;
    __p[1] = 0;
    v45 = 0;
    if (*((_BYTE *)v11 + 33) && *((_BYTE *)v11 + 32))
    {
      sub_21AB84348(__p, ((v11[11] - v11[10]) >> 3) + 2);
      *(_QWORD *)__p[0] = v11[8];
      *((_QWORD *)__p[0] + 1) = v11[9];
      v35 = 2;
      v36 = (uint64_t *)v11[10];
      v37 = (uint64_t *)v11[11];
      if (v36 == v37)
        goto LABEL_58;
    }
    else
    {
      v38 = v11[11] - v11[10];
      if (v38)
        sub_21AB84348(__p, v38 >> 3);
      v35 = 0;
      v36 = (uint64_t *)v11[10];
      v37 = (uint64_t *)v11[11];
      if (v36 == v37)
      {
LABEL_58:
        if (*((_BYTE *)v11 + 33) && !*((_BYTE *)v11 + 144))
        {
          v26 = 12;
          v41 = __p[0];
          if (!__p[0])
            return v26;
        }
        else
        {
          kdebug_trace();
          v26 = sub_21AB8150C(a1, v11[5], v11[6], v11[7], (unint64_t *)__p);
          kdebug_trace();
          v41 = __p[0];
          if (!__p[0])
            return v26;
        }
        __p[1] = v41;
        operator delete(v41);
        return v26;
      }
    }
    v39 = 8 * v35;
    do
    {
      v40 = *v36++;
      *(_QWORD *)((char *)__p[0] + v39) = v40;
      v39 += 8;
    }
    while (v36 != v37);
    goto LABEL_58;
  }
  sub_21AB80A28(v16, (uint64_t)(v11 + 3), v15 == 0);
  if (!v17)
  {
    if (!v15)
      return 10;
LABEL_30:
    if (sub_21AB80DE8(a2, (CVPixelBufferRef *)v11 + 6, "ActionBuf")
      && sub_21AB80DE8(a2, (CVPixelBufferRef *)v11 + 5, "OperationBuf")
      && sub_21AB80DE8(a2, (CVPixelBufferRef *)v11 + 7, "StatsBuf"))
    {
      v27 = v11[10];
      v28 = (v11[11] - v27) >> 3;
      if (v17 <= v28)
      {
        if (v17 < v28)
          v11[11] = v27 + 8 * v17;
        if (!v17)
          goto LABEL_48;
      }
      else
      {
        sub_21AB84348((void **)v11 + 10, v17 - v28);
      }
      v29 = 0;
      v30 = 0;
      while (1)
      {
        std::to_string(&v43, v30);
        v31 = std::string::insert(&v43, 0, "IOBufList");
        v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        v45 = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v43.__r_.__value_.__l.__data_);
        if (v45 >= 0)
          v33 = (char *)__p;
        else
          v33 = (char *)__p[0];
        v34 = sub_21AB80DE8(a2, (CVPixelBufferRef *)(v11[10] + v29), v33);
        if (SHIBYTE(v45) < 0)
          operator delete(__p[0]);
        if (!v34)
          break;
        ++v30;
        v29 += 8;
        if (v17 == v30)
          goto LABEL_48;
      }
    }
    return 11;
  }
  if (v17 <= 0xA)
    goto LABEL_30;
  return 10;
}

void sub_21AB81ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB81B30(uint64_t a1)
{
  std::mutex *v2;
  const void **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;

  v2 = (std::mutex *)(a1 + 216);
  std::mutex::lock((std::mutex *)(a1 + 216));
  v3 = *(const void ***)(a1 + 16);
  if (v3)
  {
    *(_QWORD *)(a1 + 16) = 0;
    sub_21AB8EA00(*v3);
    MEMORY[0x220752450](v3, 0x20C4093837F09);
  }
  if (*(_QWORD *)a1)
  {
    v4 = *(std::__shared_weak_count **)(a1 + 8);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
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
        v7 = *(void **)(a1 + 24);
        if (!v7)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
  }
  v7 = *(void **)(a1 + 24);
  if (v7)
  {
LABEL_9:
    os_release(v7);
    *(_QWORD *)(a1 + 24) = 0;
  }
LABEL_10:
  std::mutex::unlock(v2);
}

void sub_21AB81BF0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB81C08(uint64_t a1, xpc_object_t xdict)
{
  unsigned int uint64;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  uint64_t **v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  std::string *string;
  std::string *v14;
  int v15;
  uint64_t v16;
  _BOOL4 v17;
  size_t v18;
  __CVBuffer *v19;
  CVPixelBufferRef *v20;
  __IOSurface *v21;
  __IOSurface *v22;
  CVReturn v23;
  _WORD *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  std::string::size_type size;
  std::string *p_str;
  std::string *v30;
  std::string *v31;
  std::string *v32;
  std::__fs::filesystem::path *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  __int128 v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  __int128 v53;
  unsigned __int8 v54;
  std::string __str;
  std::__fs::filesystem::path v56;
  std::error_code __ec;
  std::__fs::filesystem::path v58;
  std::__fs::filesystem::path *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  uint64 = xpc_dictionary_get_uint64(xdict, "ClientId");
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    goto LABEL_21;
  v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = uint64;
    if (v5 <= uint64)
      v7 = uint64 % v5;
  }
  else
  {
    v7 = ((_DWORD)v5 - 1) & uint64;
  }
  v8 = *(uint64_t ***)(*(_QWORD *)(a1 + 40) + 8 * v7);
  if (v8)
  {
    v9 = *v8;
    if (*v8)
    {
      if (v6.u32[0] < 2uLL)
      {
        v10 = v5 - 1;
        while (1)
        {
          v12 = v9[1];
          if (v12 == uint64)
          {
            if (*((_DWORD *)v9 + 4) == uint64)
              goto LABEL_22;
          }
          else if ((v12 & v10) != v7)
          {
            goto LABEL_21;
          }
          v9 = (uint64_t *)*v9;
          if (!v9)
            goto LABEL_22;
        }
      }
      do
      {
        v11 = v9[1];
        if (v11 == uint64)
        {
          if (*((_DWORD *)v9 + 4) == uint64)
            break;
        }
        else
        {
          if (v11 >= v5)
            v11 %= v5;
          if (v11 != v7)
            goto LABEL_21;
        }
        v9 = (uint64_t *)*v9;
      }
      while (v9);
    }
  }
  else
  {
LABEL_21:
    v9 = 0;
  }
LABEL_22:
  string = (std::string *)xpc_dictionary_get_string(xdict, "BinaryPath");
  if (!string)
    return 15;
  *((_BYTE *)v9 + 33) = 1;
  memset(&v58, 0, sizeof(v58));
  v14 = (std::string *)((char *)string - 1);
  do
  {
    v15 = v14->__r_.__value_.__s.__data_[1];
    v14 = (std::string *)((char *)v14 + 1);
  }
  while (v15);
  sub_21AB844E8(&v58.__pn_, string, v14);
  if (!std::__fs::filesystem::path::__root_directory(&v58).__size_)
  {
    v16 = 16;
    v17 = 1;
    if (SHIBYTE(v58.__pn_.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_37;
    goto LABEL_33;
  }
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__canonical(&v56, &v58, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ == 2)
      v16 = 17;
    else
      v16 = 18;
    v17 = 1;
    goto LABEL_31;
  }
  if (SHIBYTE(v56.__pn_.__r_.__value_.__r.__words[2]) < 0)
    sub_21AB83FDC(&__str, v56.__pn_.__r_.__value_.__l.__data_, v56.__pn_.__r_.__value_.__l.__size_);
  else
    __str = v56.__pn_;
  if (!*(_BYTE *)(a1 + 408))
  {
LABEL_101:
    std::string::operator=((std::string *)(v9 + 13), &__str);
    sub_21AB88F14((uint64_t)&v53);
    if (*((unsigned __int8 *)v9 + 144) == v54)
    {
      if (!*((_BYTE *)v9 + 144))
        goto LABEL_126;
      v42 = v53;
      v53 = 0uLL;
      v43 = (std::__shared_weak_count *)v9[17];
      *((_OWORD *)v9 + 8) = v42;
      if (v43)
      {
        p_shared_owners = (unint64_t *)&v43->__shared_owners_;
        do
          v45 = __ldaxr(p_shared_owners);
        while (__stlxr(v45 - 1, p_shared_owners));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
    }
    else if (*((_BYTE *)v9 + 144))
    {
      v46 = (std::__shared_weak_count *)v9[17];
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
      *((_BYTE *)v9 + 144) = 0;
    }
    else
    {
      *((_OWORD *)v9 + 8) = v53;
      v53 = 0uLL;
      *((_BYTE *)v9 + 144) = 1;
    }
    if (v54)
    {
      v49 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
      if (*((_QWORD *)&v53 + 1))
      {
        v50 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
        do
          v51 = __ldaxr(v50);
        while (__stlxr(v51 - 1, v50));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
    }
LABEL_126:
    v17 = *((_BYTE *)v9 + 144) == 0;
    if (*((_BYTE *)v9 + 144))
      v16 = 19;
    else
      v16 = 17;
    if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_31;
    goto LABEL_130;
  }
  v24 = operator new(0x28uLL);
  v25 = v24;
  v24[16] = 115;
  v26 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  v27 = (__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
  size = __str.__r_.__value_.__l.__size_;
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_str = &__str;
  else
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  qmemcpy(v24, "/System/Library/PrivateFramework", 32);
  if (v27)
    v26 = size;
  if (v26 >= 33)
  {
    v30 = (std::string *)((char *)p_str + v26);
    v31 = p_str;
    do
    {
      v32 = (std::string *)memchr(v31, 47, v26 - 32);
      if (!v32)
        break;
      if (v32->__r_.__value_.__r.__words[0] == *v25
        && v32->__r_.__value_.__l.__size_ == v25[1]
        && v32->__r_.__value_.__r.__words[2] == v25[2]
        && v32[1].__r_.__value_.__r.__words[0] == v25[3]
        && v32[1].__r_.__value_.__s.__data_[8] == (unint64_t)*((unsigned __int8 *)v25 + 32))
      {
        if (v32 != v30 && v32 == p_str)
        {
          operator delete(v25);
          goto LABEL_101;
        }
        break;
      }
      v31 = (std::string *)((char *)&v32->__r_.__value_.__l.__data_ + 1);
      v26 = (char *)v30 - (char *)v31;
    }
    while ((char *)v30 - (char *)v31 >= 33);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_21AB97974();
  operator delete(v25);
  v16 = 19;
  v17 = 1;
  if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_31;
LABEL_130:
  operator delete(__str.__r_.__value_.__l.__data_);
LABEL_31:
  if ((SHIBYTE(v56.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v58.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_33;
LABEL_37:
    operator delete(v58.__pn_.__r_.__value_.__l.__data_);
    if (v17)
      return v16;
    goto LABEL_38;
  }
  operator delete(v56.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v58.__pn_.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_37;
LABEL_33:
  if (v17)
    return v16;
LABEL_38:
  if (!*((_BYTE *)v9 + 144))
    sub_21AB8408C();
  v18 = sub_21AB8A028((uint64_t)(v9 + 16));
  v20 = (CVPixelBufferRef *)(v9 + 8);
  v19 = (__CVBuffer *)v9[8];
  if (!v19 || v18 > CVPixelBufferGetDataSize(v19))
  {
    v21 = sub_21AB80B38(v18, 0x400uLL);
    v22 = v21;
    if (!v21)
      return 20;
    v58.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24DDB7450;
    v58.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)MEMORY[0x24BDBC298];
    v58.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)v21;
    v59 = &v58;
    if (*v20)
    {
      CVPixelBufferUnlockBaseAddress(*v20, 0);
      CVPixelBufferRelease(*v20);
      *v20 = 0;
    }
    v23 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], v22, 0, (CVPixelBufferRef *)v9 + 8);
    if (v23)
    {
      *v20 = 0;
      v16 = 21;
    }
    else
    {
      CVPixelBufferLockBaseAddress(*v20, 0);
    }
    if (!v59)
      sub_21AB840C0();
    (*(void (**)(std::__fs::filesystem::path *))(v59->__pn_.__r_.__value_.__r.__words[0] + 48))(v59);
    v37 = v59;
    if (v59 == &v58)
    {
      v38 = 4;
      v37 = &v58;
    }
    else
    {
      if (!v59)
        goto LABEL_83;
      v38 = 5;
    }
    (*(void (**)(std::__fs::filesystem::path *))(v37->__pn_.__r_.__value_.__r.__words[0] + 8 * v38))(v37);
LABEL_83:
    if (v23)
      return v16;
  }
  if (!v9[9])
    return 22;
  v39 = operator new();
  sub_21AB801C8(v39, (CVPixelBufferRef)v9[8]);
  v40 = v9[19];
  v9[19] = v39;
  if (v40)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 72))(v40);
    v39 = v9[19];
  }
  if (!sub_21AB802D8(v39))
    return 27;
  if (!*((_BYTE *)v9 + 144))
    sub_21AB8408C();
  v41 = sub_21AB8A018((uint64_t)(v9 + 16));
  if (!sub_21AB802A4(v9[19], v41))
    return 26;
  if (!*((_BYTE *)v9 + 144))
    sub_21AB8408C();
  if (!sub_21AB894C4((const void ***)v9 + 16, v39))
    return 12;
  if (sub_21AB80724(v9[19], (uint64_t)(v9 + 3)))
    return 0;
  return 13;
}

void sub_21AB82284(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  if (a25 < 0)
  {
    operator delete(__p);
    if ((*(char *)(v25 - 65) & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((*(char *)(v25 - 65) & 0x80000000) == 0)
  {
LABEL_6:
    _Unwind_Resume(exception_object);
  }
  operator delete(*(void **)(v25 - 88));
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21AB8236C(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = a1[3];
  if (!v2)
    sub_21AB840C0();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  v3 = (_QWORD *)a1[3];
  if (v3 == a1)
  {
    v4 = 4;
    v3 = a1;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = 5;
LABEL_6:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

uint64_t sub_21AB823D8(uint64_t a1, xpc_object_t xdict, void *a3)
{
  unsigned int uint64;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const char *string;
  const char *v16;
  uint64_t *v17;
  size_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  size_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  uint64 = xpc_dictionary_get_uint64(xdict, "ClientId");
  v7 = *(_QWORD *)(a1 + 48);
  if (!v7)
    goto LABEL_21;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = uint64;
    if (v7 <= uint64)
      v9 = uint64 % v7;
  }
  else
  {
    v9 = ((_DWORD)v7 - 1) & uint64;
  }
  v10 = *(uint64_t ***)(*(_QWORD *)(a1 + 40) + 8 * v9);
  if (v10)
  {
    v11 = *v10;
    if (*v10)
    {
      if (v8.u32[0] < 2uLL)
      {
        v12 = v7 - 1;
        while (1)
        {
          v14 = v11[1];
          if (v14 == uint64)
          {
            if (*((_DWORD *)v11 + 4) == uint64)
              goto LABEL_22;
          }
          else if ((v14 & v12) != v9)
          {
            goto LABEL_21;
          }
          v11 = (uint64_t *)*v11;
          if (!v11)
            goto LABEL_22;
        }
      }
      do
      {
        v13 = v11[1];
        if (v13 == uint64)
        {
          if (*((_DWORD *)v11 + 4) == uint64)
            break;
        }
        else
        {
          if (v13 >= v7)
            v13 %= v7;
          if (v13 != v9)
            goto LABEL_21;
        }
        v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
  }
  else
  {
LABEL_21:
    v11 = 0;
  }
LABEL_22:
  string = xpc_dictionary_get_string(xdict, "SymbolString");
  if (!string || !*((_BYTE *)v11 + 144))
    return 25;
  v16 = string;
  v17 = v11 + 16;
  v18 = strlen(string);
  v19 = sub_21AB8A208(v11 + 16, (uint64_t)v16, v18);
  if (!*((_BYTE *)v11 + 144))
    sub_21AB8408C();
  if (v20)
    v21 = 0;
  else
    v21 = 23;
  if (v20)
    v22 = v19;
  else
    v22 = 0;
  v23 = strlen(v16);
  v24 = sub_21AB8A0F4(v17, (uint64_t)v16, v23);
  if (v25)
    v26 = v24;
  else
    v26 = 0;
  if (v25)
    v27 = v21;
  else
    v27 = 24;
  xpc_dictionary_set_uint64(a3, "SymbolAddr", v22);
  xpc_dictionary_set_uint64(a3, "SymbolSize", v26);
  return v27;
}

uint64_t sub_21AB825B4(uint64_t a1)
{
  uint64_t result;
  uint8_t v4[16];
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 16))
    return 0;
  if (*(_BYTE *)(a1 + 88))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: ISP is unrecoverable, try to restore device and session", buf, 2u);
    }
    result = sub_21AB81198(a1);
    if ((_DWORD)result)
      *(_BYTE *)(a1 + 88) = 0;
  }
  else if (atomic_load((unsigned int *)(a1 + 200)))
  {
    return sub_21AB81198(a1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: App is not foregrounded", v4, 2u);
    }
    return 6;
  }
  return result;
}

void sub_21AB826C0(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  char *v27;
  char *v28;
  int64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  int *v33;

  v32 = a2;
  xpc_connection_get_audit_token();
  v30 = v31;
  v6 = (_QWORD *)(a1 + 160);
  v7 = *(_QWORD *)(a1 + 168);
  if (!v7)
    goto LABEL_21;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = v31;
    if (v7 <= v31)
      v9 = v31 % v7;
  }
  else
  {
    v9 = (v7 - 1) & v31;
  }
  v10 = *(uint64_t ***)(*v6 + 8 * v9);
  if (!v10 || (v11 = *v10) == 0)
  {
LABEL_21:
    if (a3)
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        sub_21AB979DC(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      v23 = operator new(8uLL);
      *v23 = a2;
      v24 = v23 + 1;
      v33 = &v30;
      v25 = sub_21AB84838((uint64_t)v6, &v30, (uint64_t)&unk_21AB98F1B, &v33);
      v26 = (void *)v25[3];
      if (v26)
      {
        v25[4] = v26;
        operator delete(v26);
        v25[3] = 0;
        v25[4] = 0;
        v25[5] = 0;
      }
      v25[3] = v23;
      v25[4] = v24;
      v25[5] = v24;
    }
    return;
  }
  if (v8.u32[0] < 2uLL)
  {
    v12 = v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == v31)
      {
        if (*((_DWORD *)v11 + 4) == v31)
          goto LABEL_27;
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_21;
      }
      v11 = (uint64_t *)*v11;
      if (!v11)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v13 = v11[1];
    if (v13 == v31)
      break;
    if (v13 >= v7)
      v13 %= v7;
    if (v13 != v9)
      goto LABEL_21;
LABEL_11:
    v11 = (uint64_t *)*v11;
    if (!v11)
      goto LABEL_21;
  }
  if (*((_DWORD *)v11 + 4) != v31)
    goto LABEL_11;
LABEL_27:
  v28 = (char *)v11[3];
  v27 = (char *)v11[4];
  if (v28 != v27)
  {
    while (*(_QWORD *)v28 != a2)
    {
      v28 += 8;
      if (v28 == v27)
      {
        v28 = (char *)v11[4];
        break;
      }
    }
  }
  if (v28 == v27)
  {
    if ((a3 & 1) == 0)
      sub_21AB82924((unint64_t *)v11 + 3, v28, (char *)&v32);
  }
  else if (a3)
  {
    v29 = v27 - (v28 + 8);
    if (v27 != v28 + 8)
      memmove(v28, v28 + 8, v27 - (v28 + 8));
    v11[4] = (uint64_t)&v28[v29];
  }
}

void sub_21AB82910(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

char *sub_21AB82924(unint64_t *a1, _QWORD *a2, char *a3)
{
  char *v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 *v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  __int128 *v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  char *v47;
  int64_t v48;
  char *v49;
  size_t v50;
  char *v51;
  _QWORD *v52;
  unint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;

  v3 = a3;
  v6 = *a1;
  v5 = a1[1];
  v7 = (uint64_t)a2 - *a1;
  v8 = v7 >> 3;
  v9 = (char *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF8));
  v10 = a1[2];
  if (v5 < v10)
  {
    if (v9 == (char *)v5)
    {
      *(_QWORD *)v9 = *(_QWORD *)a3;
      a1[1] = (unint64_t)(v9 + 8);
      return v9;
    }
    v11 = v5 - (_QWORD)(v9 + 8);
    v12 = v11 >> 3;
    v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      v19 = (_QWORD *)a1[1];
    }
    else
    {
      v14 = (v7 & 0xFFFFFFFFFFFFFFF8) + v11;
      v15 = (char *)(v14 + v6);
      v16 = v14 + v6 + 8;
      if (v5 > v16)
        v16 = a1[1];
      v17 = v16 + ~v6 - v14;
      if (v17 < 0x58)
      {
        v19 = (_QWORD *)a1[1];
      }
      else
      {
        v18 = v5 - (_QWORD)v15;
        v19 = (_QWORD *)a1[1];
        if (v18 >= 0x20)
        {
          v20 = (v17 >> 3) + 1;
          v21 = 8 * (v20 & 0x3FFFFFFFFFFFFFFCLL);
          v13 = (uint64_t *)((char *)v13 + v21);
          v19 = (_QWORD *)(v5 + v21);
          v22 = (_OWORD *)(v5 + 16);
          v23 = (__int128 *)(8 * v12 + 8 * v8 + v6 + 16);
          v24 = v20 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v25 = *v23;
            *(v22 - 1) = *(v23 - 1);
            *v22 = v25;
            v22 += 2;
            v23 += 2;
            v24 -= 4;
          }
          while (v24);
          if (v20 == (v20 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_50;
        }
      }
      do
      {
        v56 = *v13++;
        *v19++ = v56;
      }
      while ((unint64_t)v13 < v5);
    }
LABEL_50:
    a1[1] = (unint64_t)v19;
    if ((char *)v5 != v9 + 8)
      memmove((void *)(v5 - 8 * v12), v9, v11);
    if (v9 <= v3)
      v3 += 8 * (a1[1] > (unint64_t)v3);
    *(_QWORD *)v9 = *(_QWORD *)v3;
    return v9;
  }
  v26 = ((uint64_t)(v5 - v6) >> 3) + 1;
  if (v26 >> 61)
    sub_21AB808CC();
  v28 = v10 - v6;
  if (v28 >> 2 > v26)
    v26 = v28 >> 2;
  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
    v29 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v29 = v26;
  if (v29)
  {
    if (v29 >> 61)
      sub_21AB80954();
    v30 = (char *)operator new(8 * v29);
    v31 = &v30[8 * v8];
    v32 = &v30[8 * v29];
    if (v8 != v29)
      goto LABEL_28;
  }
  else
  {
    v30 = 0;
    v31 = (char *)(8 * v8);
    v32 = 0;
    if (v8)
      goto LABEL_28;
  }
  if (v7 < 1)
  {
    if ((_QWORD *)v6 == a2)
      v53 = 1;
    else
      v53 = v7 >> 2;
    if (v53 >> 61)
      sub_21AB80954();
    v54 = (char *)operator new(8 * v53);
    v31 = &v54[8 * (v53 >> 2)];
    v32 = &v54[8 * v53];
    if (v30)
    {
      v55 = &v54[8 * v53];
      operator delete(v30);
      v32 = v55;
      v34 = (char *)*a1;
      *(_QWORD *)v31 = *(_QWORD *)v3;
      v35 = v31 + 8;
      v36 = v31;
      if (v34 != v9)
        goto LABEL_29;
      goto LABEL_35;
    }
  }
  else
  {
    v33 = v8 + 2;
    if (v8 >= -1)
      v33 = v8 + 1;
    v31 -= 8 * (v33 >> 1);
  }
LABEL_28:
  v34 = (char *)v6;
  *(_QWORD *)v31 = *(_QWORD *)v3;
  v35 = v31 + 8;
  v36 = v31;
  if ((char *)v6 != v9)
  {
LABEL_29:
    v37 = (char *)((v7 & 0xFFFFFFFFFFFFFFF8) + v6);
    v38 = v37 - v34 - 8;
    v39 = v9;
    v36 = v31;
    if (v38 < 0x58)
      goto LABEL_61;
    v39 = v9;
    v36 = v31;
    if ((unint64_t)(v37 - v31) < 0x20)
      goto LABEL_61;
    v40 = (v38 >> 3) + 1;
    v41 = 8 * (v40 & 0x3FFFFFFFFFFFFFFCLL);
    v39 = &v9[-v41];
    v36 = &v31[-v41];
    v42 = v31 - 16;
    v43 = (__int128 *)(v6 + 8 * v8 - 16);
    v44 = v40 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v45 = *v43;
      *((_OWORD *)v42 - 1) = *(v43 - 1);
      *(_OWORD *)v42 = v45;
      v42 -= 32;
      v43 -= 2;
      v44 -= 4;
    }
    while (v44);
    if (v40 != (v40 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_61:
      do
      {
        v46 = *((_QWORD *)v39 - 1);
        v39 -= 8;
        *((_QWORD *)v36 - 1) = v46;
        v36 -= 8;
      }
      while (v39 != v34);
    }
  }
LABEL_35:
  v47 = (char *)a1[1];
  v48 = v47 - v9;
  if (v47 != v9)
  {
    v49 = v9;
    v50 = v47 - v9;
    v51 = v32;
    memmove(v35, v49, v50);
    v32 = v51;
  }
  v52 = (_QWORD *)*a1;
  *a1 = (unint64_t)v36;
  a1[1] = (unint64_t)&v35[v48];
  a1[2] = (unint64_t)v32;
  if (v52)
    operator delete(v52);
  return v31;
}

void sub_21AB82C90(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

BOOL sub_21AB82CA8(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64;
  xpc_object_t reply;
  _xpc_connection_s *remote_connection;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  uint64_t **v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  unint64_t v32;
  uint8x8_t v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  _BOOL8 v43;
  uint64_t **v45;
  uint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  __int128 buf;
  __int128 v61;
  __int128 v62;
  void *v63[2];
  __int128 v64;
  void *__p[4];
  std::__shared_weak_count *v66;
  char v67;
  uint64_t v68;
  unsigned int *v69;

  uint64 = xpc_dictionary_get_uint64(xdict, "Command");
  reply = xpc_dictionary_create_reply(xdict);
  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  if ((uint64 & 0xFFFFFFFFFFFFFFFBLL) == 0x7D0)
  {
    v7 = 0;
    goto LABEL_3;
  }
  v15 = xpc_dictionary_get_uint64(xdict, "ClientId");
  v16 = *(_QWORD *)(a1 + 48);
  if (!v16)
    goto LABEL_41;
  v7 = v15;
  v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] > 1uLL)
  {
    v18 = v15;
    if (v16 <= v15)
      v18 = v15 % v16;
  }
  else
  {
    v18 = ((_DWORD)v16 - 1) & v15;
  }
  v19 = *(uint64_t ***)(*(_QWORD *)(a1 + 40) + 8 * v18);
  if (!v19 || (v20 = *v19) == 0)
  {
LABEL_41:
    v8 = 3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    goto LABEL_82;
  }
  if (v17.u32[0] < 2uLL)
  {
    v21 = v16 - 1;
    while (1)
    {
      v23 = v20[1];
      if (v23 == v15)
      {
        if (*((_DWORD *)v20 + 4) == v15)
          goto LABEL_84;
      }
      else if ((v23 & v21) != v18)
      {
        goto LABEL_41;
      }
      v20 = (uint64_t *)*v20;
      if (!v20)
        goto LABEL_41;
    }
  }
  while (1)
  {
    v22 = v20[1];
    if (v22 == v15)
      break;
    if (v22 >= v16)
      v22 %= v16;
    if (v22 != v18)
      goto LABEL_41;
LABEL_31:
    v20 = (uint64_t *)*v20;
    if (!v20)
      goto LABEL_41;
  }
  if (*((_DWORD *)v20 + 4) != v15)
    goto LABEL_31;
LABEL_84:
  if (remote_connection != (_xpc_connection_s *)v20[3])
  {
    v8 = 4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_42:
      sub_21AB97A10(v8, v24, v25, v26, v27, v28, v29, v30);
LABEL_82:
    v43 = 0;
    goto LABEL_83;
  }
LABEL_3:
  if (uint64 != 2002 && uint64 <= 0x7D6)
  {
    v8 = sub_21AB825B4(a1);
    if ((_DWORD)v8)
    {
LABEL_81:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      goto LABEL_82;
    }
  }
  switch(uint64)
  {
    case 0x7D0uLL:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Create Request", (uint8_t *)&buf, 2u);
      }
      ++*(_DWORD *)(a1 + 32);
      xpc_dictionary_set_uint64(reply, "ClientId", *(_QWORD *)(a1 + 80));
      WORD4(buf) = 0;
      v67 = 0;
      v68 = 0;
      v61 = 0u;
      v62 = 0u;
      *(_OWORD *)v63 = 0u;
      v64 = 0u;
      memset(__p, 0, 25);
      v9 = *(_QWORD *)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v9 + 1;
      v59 = v9;
      *(_QWORD *)&buf = remote_connection;
      v69 = &v59;
      v10 = sub_21AB84D64(a1 + 40, &v59, (uint64_t)&unk_21AB98F1B, &v69);
      sub_21AB83534((uint64_t)(v10 + 24), &buf);
      sub_21AB826C0(a1, (uint64_t)remote_connection, 0);
      v11 = v68;
      v68 = 0;
      if (v11)
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 72))(v11);
      if (v67)
      {
        v12 = v66;
        if (v66)
        {
          p_shared_owners = (unint64_t *)&v66->__shared_owners_;
          do
            v14 = __ldaxr(p_shared_owners);
          while (__stlxr(v14 - 1, p_shared_owners));
          if (!v14)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
      }
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v63[1])
      {
        *(void **)&v64 = v63[1];
        operator delete(v63[1]);
      }
      goto LABEL_110;
    case 0x7D1uLL:
      v8 = sub_21AB816C4(a1, xdict, 0);
      kdebug_trace();
      goto LABEL_80;
    case 0x7D2uLL:
      v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Release CMD", (uint8_t *)&buf, 2u);
      }
      v32 = *(_QWORD *)(a1 + 48);
      if (!v32)
        goto LABEL_106;
      v33 = (uint8x8_t)vcnt_s8((int8x8_t)v32);
      v33.i16[0] = vaddlv_u8(v33);
      if (v33.u32[0] > 1uLL)
      {
        v34 = v7;
        if (v32 <= v7)
          v34 = v7 % v32;
      }
      else
      {
        v34 = ((_DWORD)v32 - 1) & v7;
      }
      v45 = *(uint64_t ***)(*(_QWORD *)(a1 + 40) + 8 * v34);
      if (!v45)
        goto LABEL_106;
      v46 = *v45;
      if (!v46)
        goto LABEL_106;
      if (v33.u32[0] < 2uLL)
      {
        v47 = v32 - 1;
        while (1)
        {
          v49 = v46[1];
          if (v49 == v7)
          {
            if (*((_DWORD *)v46 + 4) == v7)
              goto LABEL_105;
          }
          else if ((v49 & v47) != v34)
          {
            goto LABEL_106;
          }
          v46 = (uint64_t *)*v46;
          if (!v46)
            goto LABEL_106;
        }
      }
      break;
    case 0x7D3uLL:
      v8 = sub_21AB816C4(a1, xdict, 1);
      kdebug_trace();
      goto LABEL_80;
    case 0x7D4uLL:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Create with Bufs CMD", (uint8_t *)&buf, 2u);
      }
      xpc_dictionary_set_uint64(reply, "ClientId", *(_QWORD *)(a1 + 80));
      WORD4(buf) = 0;
      v67 = 0;
      v68 = 0;
      v61 = 0u;
      v62 = 0u;
      *(_OWORD *)v63 = 0u;
      v64 = 0u;
      memset(__p, 0, 25);
      v35 = *(_QWORD *)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v35 + 1;
      v59 = v35;
      *(_QWORD *)&buf = remote_connection;
      v36 = sub_21AB80DE8(xdict, (CVPixelBufferRef *)&v61 + 1, "ActionBuf");
      if (v36
        && (v36 = sub_21AB80DE8(xdict, (CVPixelBufferRef *)&v61, "OperationBuf"))
        && (v36 = sub_21AB80DE8(xdict, (CVPixelBufferRef *)&v62, "StatsBuf"))
        && (!xpc_dictionary_get_value(xdict, "DtcmMetaBuf")
         || (v36 = sub_21AB80DE8(xdict, (CVPixelBufferRef *)v63, "DtcmMetaBuf"))))
      {
        BYTE8(buf) = 1;
        v69 = &v59;
        v37 = sub_21AB84D64(a1 + 40, &v59, (uint64_t)&unk_21AB98F1B, &v69);
        sub_21AB83534((uint64_t)(v37 + 24), &buf);
        sub_21AB826C0(a1, (uint64_t)remote_connection, 0);
        v8 = 0;
        ++*(_DWORD *)(a1 + 32);
      }
      else
      {
        sub_21AB80A28(v36, (uint64_t)&buf, 1);
        v8 = 11;
      }
      v39 = v68;
      v68 = 0;
      if (v39)
        (*(void (**)(uint64_t))(*(_QWORD *)v39 + 72))(v39);
      if (v67)
      {
        v40 = v66;
        if (v66)
        {
          v41 = (unint64_t *)&v66->__shared_owners_;
          do
            v42 = __ldaxr(v41);
          while (__stlxr(v42 - 1, v41));
          if (!v42)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
        }
      }
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v63[1])
      {
        *(void **)&v64 = v63[1];
        operator delete(v63[1]);
      }
      goto LABEL_80;
    case 0x7D5uLL:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Load Program CMD", (uint8_t *)&buf, 2u);
      }
      v38 = sub_21AB81C08(a1, xdict);
      goto LABEL_66;
    case 0x7D6uLL:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Handle Lookup Symbol CMD", (uint8_t *)&buf, 2u);
      }
      v38 = sub_21AB823D8(a1, xdict, reply);
LABEL_66:
      v8 = v38;
LABEL_80:
      if ((_DWORD)v8)
        goto LABEL_81;
      goto LABEL_111;
    default:
      v8 = 5;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      goto LABEL_82;
  }
  while (2)
  {
    v48 = v46[1];
    if (v48 == v7)
    {
      if (*((_DWORD *)v46 + 4) == v7)
      {
LABEL_105:
        sub_21AB80A28(v31, (uint64_t)(v46 + 3), 1);
        break;
      }
      goto LABEL_94;
    }
    if (v48 >= v32)
      v48 %= v32;
    if (v48 == v34)
    {
LABEL_94:
      v46 = (uint64_t *)*v46;
      if (!v46)
        break;
      continue;
    }
    break;
  }
LABEL_106:
  LODWORD(buf) = v7;
  sub_21AB85174((_QWORD *)(a1 + 40), (unsigned int *)&buf);
  sub_21AB826C0(a1, (uint64_t)remote_connection, 1);
  v50 = *(_DWORD *)(a1 + 32);
  if (v50)
  {
    LODWORD(v8) = 0;
    *(_DWORD *)(a1 + 32) = v50 - 1;
  }
  else
  {
    v51 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v51)
      sub_21AB97A7C(v51, v52, v53, v54, v55, v56, v57, v58);
LABEL_110:
    LODWORD(v8) = 0;
  }
LABEL_111:
  v43 = 1;
LABEL_83:
  kdebug_trace();
  xpc_dictionary_set_BOOL(reply, "Status", v43);
  xpc_dictionary_set_uint64(reply, "Error", v8);
  xpc_connection_send_message(remote_connection, reply);
  xpc_release(reply);
  return v43;
}

void sub_21AB83508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_21AB836E0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB8351C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_21AB836E0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB83534(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void **v10;
  __int128 v11;
  __int128 *v12;
  __int128 v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v4 = *a2;
  v5 = a2[1];
  v6 = a2[2];
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)a1 = v4;
  v8 = (_QWORD *)(a1 + 56);
  v7 = *(void **)(a1 + 56);
  v9 = (_QWORD *)a2 + 7;
  if (v7)
  {
    *(_QWORD *)(a1 + 64) = v7;
    operator delete(v7);
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
  }
  *(_OWORD *)(a1 + 56) = *(__int128 *)((char *)a2 + 56);
  *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
  *v9 = 0;
  v9[1] = 0;
  v9[2] = 0;
  v10 = (void **)(a1 + 80);
  if (*(char *)(a1 + 103) < 0)
    operator delete(*v10);
  v11 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)v10 = v11;
  *((_BYTE *)a2 + 103) = 0;
  *((_BYTE *)a2 + 80) = 0;
  v12 = (__int128 *)((char *)a2 + 104);
  if (*(unsigned __int8 *)(a1 + 120) == *((unsigned __int8 *)a2 + 120))
  {
    if (*(_BYTE *)(a1 + 120))
    {
      v13 = *v12;
      *(_QWORD *)v12 = 0;
      *((_QWORD *)a2 + 14) = 0;
      v14 = *(std::__shared_weak_count **)(a1 + 112);
      *(_OWORD *)(a1 + 104) = v13;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
          v17 = *((_QWORD *)a2 + 16);
          *((_QWORD *)a2 + 16) = 0;
          v18 = *(_QWORD *)(a1 + 128);
          *(_QWORD *)(a1 + 128) = v17;
          if (!v18)
            return a1;
          goto LABEL_21;
        }
      }
    }
  }
  else
  {
    if (!*(_BYTE *)(a1 + 120))
    {
      *(_OWORD *)(a1 + 104) = *v12;
      *(_QWORD *)v12 = 0;
      *((_QWORD *)a2 + 14) = 0;
      *(_BYTE *)(a1 + 120) = 1;
      v24 = *((_QWORD *)a2 + 16);
      *((_QWORD *)a2 + 16) = 0;
      v18 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v24;
      if (!v18)
        return a1;
      goto LABEL_21;
    }
    v19 = *(std::__shared_weak_count **)(a1 + 112);
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
    *(_BYTE *)(a1 + 120) = 0;
  }
  v22 = *((_QWORD *)a2 + 16);
  *((_QWORD *)a2 + 16) = 0;
  v18 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v22;
  if (v18)
LABEL_21:
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 72))(v18);
  return a1;
}

uint64_t sub_21AB836E0(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 72))(v2);
  if (!*(_BYTE *)(a1 + 120))
    goto LABEL_8;
  v3 = *(std::__shared_weak_count **)(a1 + 112);
  if (!v3)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
  {
LABEL_8:
    if ((*(char *)(a1 + 103) & 0x80000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  if (*(char *)(a1 + 103) < 0)
LABEL_9:
    operator delete(*(void **)(a1 + 80));
LABEL_10:
  v6 = *(void **)(a1 + 56);
  if (v6)
  {
    *(_QWORD *)(a1 + 64) = v6;
    operator delete(v6);
  }
  return a1;
}

void sub_21AB83784(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  size_t v20;
  size_t v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  int v25;
  size_t v26;
  void *v27;
  unint64_t v28;
  size_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  uint64_t *v35;
  std::string::size_type v36;
  std::string *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  void **v42;
  void *v43;
  void **v44;
  std::string v45;
  void *v46[2];
  void *v47;
  size_t v48;
  void **v49;
  void *__dst[2];
  void *__p[2];
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v2 = sysctlbyname("kern.bootargs", 0, &v48, 0, 0);
  if ((_DWORD)v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21AB97AE4(v2, v3, v4, v5, v6, v7, v8, v9);
    return;
  }
  *(_OWORD *)__p = 0u;
  v52 = 0u;
  *(_OWORD *)__dst = 0u;
  sub_21AB83E7C((uint64_t)v46, (uint64_t)__dst, 1);
  if (SHIBYTE(v52) < 0)
  {
    operator delete(__p[1]);
    if ((SHIBYTE(__p[0]) & 0x80000000) == 0)
    {
LABEL_6:
      v10 = v48;
      if (v48 >= 0x7D1)
      {
LABEL_7:
        v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v11)
          sub_21AB97AB0(v11, v12, v13, v14, v15, v16, v17, v18);
        v19 = 0;
        goto LABEL_89;
      }
      goto LABEL_12;
    }
  }
  else if ((SHIBYTE(__p[0]) & 0x80000000) == 0)
  {
    goto LABEL_6;
  }
  operator delete(__dst[0]);
  v10 = v48;
  if (v48 >= 0x7D1)
    goto LABEL_7;
LABEL_12:
  v19 = (unsigned __int8 *)operator new[]();
  bzero(v19, v10);
  if (sysctlbyname("kern.bootargs", v19, &v48, 0, 0))
    goto LABEL_89;
  v20 = strlen((const char *)v19);
  v21 = v20;
  if (v20)
  {
    v22 = 0;
    while (v19[v22] == 32)
    {
      if (v20 == ++v22)
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    v22 = -1;
  }
  v23 = v20 - 1;
  while (v22 != -1)
  {
    if (v21 <= v22)
      goto LABEL_29;
    v24 = v22;
    while (1)
    {
      v25 = v19[v24];
      if (v25 == 32 || v25 == 61)
        break;
      if (v21 == ++v24)
        goto LABEL_29;
    }
    if (v21 == v24 || v24 == -1)
LABEL_29:
      v24 = v21;
    if (v21 < v22)
      sub_21AB8411C("string_view::substr");
    if (v21 - v22 >= v24 - v22)
      v26 = v24 - v22;
    else
      v26 = v21 - v22;
    if (v26 > 0x7FFFFFFFFFFFFFF7)
      sub_21AB84068();
    if (v26 >= 0x17)
    {
      v31 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v26 | 7) != 0x17)
        v31 = v26 | 7;
      v32 = v31 + 1;
      v27 = operator new(v31 + 1);
      __dst[1] = (void *)v26;
      __p[0] = (void *)(v32 | 0x8000000000000000);
      __dst[0] = v27;
    }
    else
    {
      HIBYTE(__p[0]) = v26;
      v27 = __dst;
      if (!v26)
      {
        LOBYTE(__dst[0]) = 0;
        if (v19[v24] == 61)
          goto LABEL_38;
        goto LABEL_51;
      }
    }
    memcpy(v27, &v19[v22], v26);
    *((_BYTE *)v27 + v26) = 0;
    if (v19[v24] == 61)
    {
LABEL_38:
      if (v21 > v24)
      {
        v28 = v24 + 1;
        v29 = v24;
        do
        {
          if (v23 == v29)
            goto LABEL_57;
          v24 = v28;
          v30 = v19[++v29];
          ++v28;
        }
        while (v30 == 61);
        if (v29 == -1)
          goto LABEL_57;
        if (v21 <= v29)
          goto LABEL_63;
        while (v19[v24] != 32)
        {
          if (v21 == ++v24)
            goto LABEL_63;
        }
        if (v21 == v24 || v24 == -1)
LABEL_63:
          v24 = v21;
        if (v21 < v29)
          sub_21AB8411C("string_view::substr");
        if (v21 - v29 >= v24 - v29)
          v36 = v24 - v29;
        else
          v36 = v21 - v29;
        if (v36 > 0x7FFFFFFFFFFFFFF7)
          sub_21AB84068();
        if (v36 >= 0x17)
        {
          v38 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v36 | 7) != 0x17)
            v38 = v36 | 7;
          v39 = v38 + 1;
          v37 = (std::string *)operator new(v38 + 1);
          v45.__r_.__value_.__l.__size_ = v36;
          v45.__r_.__value_.__r.__words[2] = v39 | 0x8000000000000000;
          v45.__r_.__value_.__r.__words[0] = (std::string::size_type)v37;
        }
        else
        {
          *((_BYTE *)&v45.__r_.__value_.__s + 23) = v36;
          v37 = &v45;
          if (!v36)
          {
LABEL_76:
            v37->__r_.__value_.__s.__data_[v36] = 0;
            v49 = __dst;
            v40 = sub_21AB85D88((uint64_t)v46, (uint64_t)__dst, (uint64_t)&unk_21AB98F1B, (__int128 **)&v49);
            std::string::operator=((std::string *)(v40 + 5), &v45);
            if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v45.__r_.__value_.__l.__data_);
            goto LABEL_52;
          }
        }
        memcpy(v37, &v19[v29], v36);
        goto LABEL_76;
      }
LABEL_57:
      v45.__r_.__value_.__r.__words[0] = (std::string::size_type)__dst;
      v35 = sub_21AB85D88((uint64_t)v46, (uint64_t)__dst, (uint64_t)&unk_21AB98F1B, (__int128 **)&v45);
      MEMORY[0x220752294](v35 + 5, "");
      v34 = 0;
      v22 = -1;
      if (SHIBYTE(__p[0]) < 0)
        goto LABEL_60;
      goto LABEL_19;
    }
LABEL_51:
    v45.__r_.__value_.__r.__words[0] = (std::string::size_type)__dst;
    v33 = sub_21AB85D88((uint64_t)v46, (uint64_t)__dst, (uint64_t)&unk_21AB98F1B, (__int128 **)&v45);
    MEMORY[0x220752294](v33 + 5, "");
LABEL_52:
    if (v21 > v24)
    {
      while (v19[v24] == 32)
      {
        if (v21 == ++v24)
          goto LABEL_55;
      }
      v34 = 1;
      v22 = v24;
      if ((SHIBYTE(__p[0]) & 0x80000000) == 0)
        goto LABEL_19;
LABEL_60:
      operator delete(__dst[0]);
      goto LABEL_19;
    }
LABEL_55:
    v22 = -1;
    v34 = 1;
    if (SHIBYTE(__p[0]) < 0)
      goto LABEL_60;
LABEL_19:
    if ((v34 & 1) == 0)
      break;
  }
  __dst[0] = 0;
  __dst[1] = 0;
  __p[0] = 0;
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&v45.__r_.__value_.__r.__words[1] = xmmword_21AB99040;
  strcpy(v45.__r_.__value_.__l.__data_, "disableVisionStrictPathCheck");
  v41 = sub_21AB861FC(v46, (uint64_t)&v45);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if (v41)
  {
    std::string::operator=((std::string *)__dst, (const std::string *)(v41 + 5));
    if (!std::string::compare((const std::string *)__dst, "true")
      || !std::string::compare((const std::string *)__dst, "1")
      || !std::string::compare((const std::string *)__dst, ""))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        LOWORD(v45.__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "VisionHWAServer: Disabling strict path checking for the VisionHWA program loader", (uint8_t *)&v45, 2u);
      }
      *(_BYTE *)(a1 + 408) = 0;
    }
  }
  if (SHIBYTE(__p[0]) < 0)
    operator delete(__dst[0]);
LABEL_89:
  v42 = (void **)v47;
  if (v47)
  {
    do
    {
      v44 = (void **)*v42;
      if (*((char *)v42 + 63) < 0)
      {
        operator delete(v42[5]);
        if (*((char *)v42 + 39) < 0)
LABEL_100:
          operator delete(v42[2]);
      }
      else if (*((char *)v42 + 39) < 0)
      {
        goto LABEL_100;
      }
      operator delete(v42);
      v42 = v44;
    }
    while (v44);
  }
  v43 = v46[0];
  v46[0] = 0;
  if (v43)
    operator delete(v43);
  if (v19)
    MEMORY[0x220752438](v19, 0x1000C8077774924);
}

void sub_21AB83DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  if (a29 < 0)
    operator delete(__p);
  sub_21AB83F58((uint64_t)&a16);
  MEMORY[0x220752438](v29, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB83E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 48 * a3;
    do
    {
      sub_21AB853D0(a1, a2, a2);
      a2 += 48;
      v5 -= 48;
    }
    while (v5);
  }
  return a1;
}

void sub_21AB83EE0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v3;

  v3 = *(void ***)(v1 + 16);
  if (v3)
    sub_21AB97B68(v3);
  sub_21AB97B50((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB83F00(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_21AB83F58(uint64_t a1)
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

void *sub_21AB83FDC(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_21AB84068();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_21AB84068()
{
  sub_21AB808E0("basic_string");
}

void sub_21AB8407C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21AB8408C()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void sub_21AB840C0()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = &unk_24DDB7398;
  __cxa_throw(exception, (struct type_info *)&unk_24DDB7370, (void (*)(void *))std::exception::~exception);
}

void sub_21AB840F8(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x220752450);
}

void sub_21AB8411C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_21AB8416C(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24DDB6CB0, MEMORY[0x24BEDAB00]);
}

void sub_21AB84158(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_21AB8416C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void sub_21AB84194()
{
  JUMPOUT(0x220752450);
}

_QWORD *sub_21AB841A8(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24DDB73C0;
  result[1] = v3;
  return result;
}

uint64_t sub_21AB841DC(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24DDB73C0;
  a2[1] = v2;
  return result;
}

void sub_21AB841F8(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    if ((v3 - 1) > 1)
      return;
LABEL_5:
    sub_21AB8098C(v2);
    return;
  }
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: ***************************** Device Status Callback: received status change notification = %d", (uint8_t *)v4, 8u);
  if ((v3 - 1) <= 1)
    goto LABEL_5;
}

uint64_t sub_21AB842D0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN23VisionHWAClientServices22createDeviceAndSessionEvE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_21AB8433C()
{
  return &unk_24DDB7430;
}

void sub_21AB84348(void **a1, unint64_t a2)
{
  _BYTE *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  char *v14;
  size_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  char *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v5 = (char *)a1[1];
  v4 = a1[2];
  v6 = v5;
  if (a2 <= (v4 - v5) >> 3)
  {
    if (a2)
    {
      bzero(v5, 8 * a2);
      v6 = &v5[8 * a2];
    }
    a1[1] = v6;
  }
  else
  {
    v7 = (char *)*a1;
    v8 = v5 - (_BYTE *)*a1;
    v9 = v8 >> 3;
    v10 = (v8 >> 3) + a2;
    if (v10 >> 61)
      sub_21AB808CC();
    v11 = v4 - v7;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 61)
        sub_21AB80954();
      v13 = operator new(8 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = 8 * a2;
    v16 = &v13[8 * v12];
    bzero(v14, v15);
    v17 = &v14[v15];
    if (v5 != v7)
    {
      v18 = v5 - v7 - 8;
      if (v18 < 0x58)
        goto LABEL_30;
      if ((unint64_t)(v5 - v13 - v8) < 0x20)
        goto LABEL_30;
      v19 = (v18 >> 3) + 1;
      v20 = 8 * (v19 & 0x3FFFFFFFFFFFFFFCLL);
      v6 = &v5[-v20];
      v14 -= v20;
      v21 = &v13[8 * v9 - 16];
      v22 = v5 - 16;
      v23 = v19 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 4;
      }
      while (v23);
      if (v19 != (v19 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_30:
        do
        {
          v25 = *((_QWORD *)v6 - 1);
          v6 -= 8;
          *((_QWORD *)v14 - 1) = v25;
          v14 -= 8;
        }
        while (v6 != v7);
      }
      v6 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v16;
    if (v6)
      operator delete(v6);
  }
}

std::string *sub_21AB844E8(std::string *this, std::string *__src, std::string *a3)
{
  unint64_t v6;
  size_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **p_dst;
  std::string *v13;
  std::string::value_type *v14;
  std::string *v15;
  uint64_t v16;
  uint64_t v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  char *v20;
  _OWORD *v21;
  std::string::size_type *v22;
  unint64_t v23;
  __int128 v24;
  std::string::value_type v25;
  std::string::size_type v26;
  void **__dst;
  size_t v29;
  int64_t v30;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = (char *)a3 - (char *)__src;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == __src)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
    if (this->__r_.__value_.__r.__words[0] > (unint64_t)__src)
      goto LABEL_12;
  }
  else
  {
    if (a3 == __src)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
    if (this > __src)
    {
LABEL_12:
      if (v9 - size < v7)
      {
        std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
        this->__r_.__value_.__l.__size_ = size;
        v13 = this;
        if ((*((_BYTE *)&this->__r_.__value_.__s + 23) & 0x80) == 0)
        {
LABEL_14:
          v14 = (char *)v13 + size;
          if (a3 == __src)
            goto LABEL_38;
          goto LABEL_18;
        }
      }
      else
      {
        v13 = this;
        if ((v6 & 0x80) == 0)
          goto LABEL_14;
      }
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
      v14 = (std::string::value_type *)(this->__r_.__value_.__r.__words[0] + size);
      if (a3 == __src)
        goto LABEL_38;
LABEL_18:
      if (v7 >= 0x20)
      {
        v20 = (char *)v13 + size;
        if ((unint64_t)((char *)v13 + size - (char *)__src) >= 0x20)
        {
          v15 = (std::string *)((char *)__src + (v7 & 0xFFFFFFFFFFFFFFE0));
          v14 += v7 & 0xFFFFFFFFFFFFFFE0;
          v21 = v20 + 16;
          v22 = &__src->__r_.__value_.__r.__words[2];
          v23 = v7 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v24 = *(_OWORD *)v22;
            *(v21 - 1) = *((_OWORD *)v22 - 1);
            *v21 = v24;
            v21 += 2;
            v22 += 4;
            v23 -= 32;
          }
          while (v23);
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0))
            goto LABEL_38;
        }
        else
        {
          v15 = __src;
        }
      }
      else
      {
        v15 = __src;
      }
      do
      {
        v25 = v15->__r_.__value_.__s.__data_[0];
        v15 = (std::string *)((char *)v15 + 1);
        *v14++ = v25;
      }
      while (v15 != a3);
LABEL_38:
      *v14 = 0;
      v26 = v7 + size;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = v26;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = v26 & 0x7F;
      return this;
    }
  }
  if ((std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= __src)
    goto LABEL_12;
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    sub_21AB84068();
  if (v7 > 0x16)
  {
    v16 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v16 = v7 | 7;
    v17 = v16 + 1;
    p_dst = (void **)operator new(v16 + 1);
    v29 = v7;
    v30 = v17 | 0x8000000000000000;
    __dst = p_dst;
    if (a3 == __src)
      goto LABEL_24;
  }
  else
  {
    HIBYTE(v30) = v7;
    p_dst = (void **)&__dst;
    if (a3 == __src)
      goto LABEL_24;
  }
  memcpy(p_dst, __src, v7);
  p_dst = (void **)((char *)p_dst + v7);
LABEL_24:
  *(_BYTE *)p_dst = 0;
  if (v30 >= 0)
    v18 = (const std::string::value_type *)&__dst;
  else
    v18 = (const std::string::value_type *)__dst;
  if (v30 >= 0)
    v19 = HIBYTE(v30);
  else
    v19 = v29;
  std::string::append(this, v18, v19);
  if (SHIBYTE(v30) < 0)
    operator delete(__dst);
  return this;
}

void sub_21AB8472C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB8474C()
{
  JUMPOUT(0x220752450);
}

__n128 sub_21AB84760(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24DDB7450;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_21AB84798(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24DDB7450;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_21AB847B8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 8))(*(_QWORD *)(a1 + 16));
}

uint64_t sub_21AB847C0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE")
    return a1 + 8;
  if (((v3 & (unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"N4cv3d3esn5Defer11BindWrapperINSt3__16__bindIRPFvPKvEJRP11__IOSurfaceEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_21AB8482C()
{
  return &unk_24DDB74C0;
}

_QWORD *sub_21AB84838(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  uint64_t v17;
  _QWORD *v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t prime;
  unint64_t v23;
  uint8x8_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        if (v9.u32[0] < 2uLL)
        {
          while (1)
          {
            v13 = v11[1];
            if (v13 == v7)
            {
              if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
                return v11;
            }
            else if ((v13 & (v8 - 1)) != v4)
            {
              goto LABEL_23;
            }
            v11 = (_QWORD *)*v11;
            if (!v11)
              goto LABEL_23;
          }
        }
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v12 >= v8)
              v12 %= v8;
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_23:
  v14 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (v8 && (float)(v16 * (float)v8) >= v15)
  {
    v17 = *(_QWORD *)a1;
    v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v18)
    {
LABEL_26:
      *v11 = *v18;
LABEL_61:
      *v18 = v11;
      goto LABEL_62;
    }
  }
  else
  {
    v19 = 1;
    if (v8 >= 3)
      v19 = (v8 & (v8 - 1)) != 0;
    v20 = v19 | (2 * v8);
    v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21)
      prime = v21;
    else
      prime = v20;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v8 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v8)
      goto LABEL_37;
    if (prime < v8)
    {
      v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (v24 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        v23 = std::__next_prime(v23);
      }
      else
      {
        v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2)
          v23 = v25;
      }
      if (prime <= v23)
        prime = v23;
      if (prime < v8)
LABEL_37:
        sub_21AB84BB8(a1, prime);
    }
    v8 = *(_QWORD *)(a1 + 8);
    v26 = v8 - 1;
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
      {
        v4 = v7 % v8;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v7 % v8));
        if (v18)
          goto LABEL_26;
      }
      else
      {
        v4 = v7;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v7);
        if (v18)
          goto LABEL_26;
      }
    }
    else
    {
      v4 = v26 & v7;
      v17 = *(_QWORD *)a1;
      v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v26 & v7));
      if (v18)
        goto LABEL_26;
    }
  }
  *v11 = *v14;
  *v14 = v11;
  *(_QWORD *)(v17 + 8 * v4) = v14;
  if (*v11)
  {
    v27 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v27 >= v8)
        v27 %= v8;
    }
    else
    {
      v27 &= v8 - 1;
    }
    v18 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_21AB84B58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB84B6C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB84B6C(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = (void *)v2[3];
      if (v3)
      {
        v2[4] = v3;
        operator delete(v3);
      }
    }
    operator delete(v2);
  }
  return a1;
}

void sub_21AB84BB8(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  if (!a2)
  {
    v15 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v15)
      operator delete(v15);
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61)
    sub_21AB80954();
  v4 = operator new(8 * a2);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v6 = 0;
  *(_QWORD *)(a1 + 8) = a2;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  v8 = a1 + 16;
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v9 = v7[1];
    v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      v11 = v9 & v10;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = v8;
      while (1)
      {
        v12 = (_QWORD *)*v7;
        if (!*v7)
          break;
        v13 = v12[1] & v10;
        if (v13 == v11)
        {
          v7 = (_QWORD *)*v7;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          *v7 = *v12;
          v14 = 8 * v13;
          *v12 = **(_QWORD **)(*(_QWORD *)a1 + v14);
          **(_QWORD **)(*(_QWORD *)a1 + v14) = v12;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = v12;
          v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2)
      v9 %= a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v8;
    v16 = (_QWORD *)*v7;
    if (*v7)
    {
      while (1)
      {
        v18 = v16[1];
        if (v18 >= a2)
          v18 %= a2;
        if (v18 == v9)
          goto LABEL_25;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v18))
        {
          *v7 = *v16;
          v17 = 8 * v18;
          *v16 = **(_QWORD **)(*(_QWORD *)a1 + v17);
          **(_QWORD **)(*(_QWORD *)a1 + v17) = v16;
          v16 = v7;
LABEL_25:
          v7 = v16;
          v16 = (_QWORD *)*v16;
          if (!v16)
            return;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v7;
          v7 = v16;
          v16 = (_QWORD *)*v16;
          v9 = v18;
          if (!v16)
            return;
        }
      }
    }
  }
}

char *sub_21AB84D64(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t prime;
  unint64_t v21;
  uint8x8_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (char *)*v10;
      if (*v10)
      {
        if (v9.u32[0] < 2uLL)
        {
          while (1)
          {
            v13 = *((_QWORD *)v11 + 1);
            if (v13 == v7)
            {
              if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
                return v11;
            }
            else if ((v13 & (v8 - 1)) != v4)
            {
              goto LABEL_23;
            }
            v11 = *(char **)v11;
            if (!v11)
              goto LABEL_23;
          }
        }
        do
        {
          v12 = *((_QWORD *)v11 + 1);
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v12 >= v8)
              v12 %= v8;
            if (v12 != v4)
              break;
          }
          v11 = *(char **)v11;
        }
        while (v11);
      }
    }
  }
LABEL_23:
  v14 = (_QWORD *)(a1 + 16);
  v11 = (char *)operator new(0xA0uLL);
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_QWORD *)v11 + 19) = 0;
  *(_OWORD *)(v11 + 136) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (v8 && (float)(v16 * (float)v8) >= v15)
  {
    v7 = v4;
  }
  else
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      prime = v19;
    else
      prime = v18;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v8 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v8)
      goto LABEL_36;
    if (prime < v8)
    {
      v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (v22 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
      {
        v21 = std::__next_prime(v21);
      }
      else
      {
        v23 = 1 << -(char)__clz(v21 - 1);
        if (v21 >= 2)
          v21 = v23;
      }
      if (prime <= v21)
        prime = v21;
      if (prime < v8)
LABEL_36:
        sub_21AB84BB8(a1, prime);
    }
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v7 %= v8;
    }
    else
    {
      v7 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v24 = *(_QWORD *)a1;
  v25 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v7);
  if (v25)
  {
    *(_QWORD *)v11 = *v25;
LABEL_59:
    *v25 = v11;
    goto LABEL_60;
  }
  *(_QWORD *)v11 = *v14;
  *v14 = v11;
  *(_QWORD *)(v24 + 8 * v7) = v14;
  if (*(_QWORD *)v11)
  {
    v26 = *(_QWORD *)(*(_QWORD *)v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v26 >= v8)
        v26 %= v8;
    }
    else
    {
      v26 &= v8 - 1;
    }
    v25 = (_QWORD *)(*(_QWORD *)a1 + 8 * v26);
    goto LABEL_59;
  }
LABEL_60:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_21AB8508C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  uint64_t v11;

  sub_21AB850A8(v11, v10);
  _Unwind_Resume(a1);
}

void sub_21AB850A8(uint64_t a1, char *__p)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = *((_QWORD *)__p + 19);
    *((_QWORD *)__p + 19) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 72))(v3);
    if (!__p[144])
      goto LABEL_9;
    v4 = (std::__shared_weak_count *)*((_QWORD *)__p + 17);
    if (!v4)
      goto LABEL_9;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((__p[127] & 0x80000000) == 0)
      {
LABEL_11:
        v7 = (void *)*((_QWORD *)__p + 10);
        if (v7)
        {
          *((_QWORD *)__p + 11) = v7;
          operator delete(v7);
          operator delete(__p);
          return;
        }
        goto LABEL_14;
      }
    }
    else
    {
LABEL_9:
      if ((__p[127] & 0x80000000) == 0)
        goto LABEL_11;
    }
    operator delete(*((void **)__p + 13));
    goto LABEL_11;
  }
  if (__p)
LABEL_14:
    operator delete(__p);
}

uint64_t sub_21AB85174(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v12;
  void *__p;
  uint64_t v14;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  v7 = *v6;
  if (!*v6)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v2 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == (_DWORD)v3)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (uint64_t *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == v3)
      break;
    if (v9 >= *(_QWORD *)&v2)
      v9 %= *(_QWORD *)&v2;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (uint64_t *)*v7;
    if (!v7)
      return 0;
  }
  if (*((_DWORD *)v7 + 4) != (_DWORD)v3)
    goto LABEL_11;
LABEL_22:
  sub_21AB8529C(a1, v7, (uint64_t)&__p);
  v12 = (char *)__p;
  __p = 0;
  if (v12)
    sub_21AB850A8((uint64_t)&v14, v12);
  return 1;
}

_QWORD *sub_21AB8529C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t *sub_21AB853D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  _BYTE *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
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
  float v25;
  float v26;
  _QWORD *v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  size_t prime;
  int8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v39[3];

  v5 = (_BYTE *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = sub_21AB8593C((uint64_t)v39, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v3 = v9;
      if (v9 >= v11)
        v3 = v9 % v11;
    }
    else
    {
      v3 = (v11 - 1) & v9;
    }
    v13 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v5[23];
        if (v15 >= 0)
          v16 = v5[23];
        else
          v16 = *((_QWORD *)v5 + 1);
        if (v15 < 0)
          v5 = *(_BYTE **)v5;
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            v21 = v14[1];
            if (v21 == v10)
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
                  if (!memcmp((const void *)v14[2], v5, v14[3]))
                    return v14;
                }
                else
                {
                  if (!*((_BYTE *)v14 + 39))
                    return v14;
                  v24 = 0;
                  while (*((unsigned __int8 *)v14 + v24 + 16) == v5[v24])
                  {
                    if (v22 == ++v24)
                      return v14;
                  }
                }
              }
            }
            else if ((v21 & (v11 - 1)) != v3)
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
          if (v17 == v10)
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
                if (!memcmp((const void *)v14[2], v5, v14[3]))
                  return v14;
              }
              else
              {
                if (!*((_BYTE *)v14 + 39))
                  return v14;
                v20 = 0;
                while (*((unsigned __int8 *)v14 + v20 + 16) == v5[v20])
                {
                  if (v18 == ++v20)
                    return v14;
                }
              }
            }
          }
          else
          {
            if (v17 >= v11)
              v17 %= v11;
            if (v17 != v3)
              break;
          }
          v14 = (uint64_t *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_51:
  sub_21AB857EC(a1, v10, a3, (uint64_t)v39);
  v25 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v26 = *(float *)(a1 + 32);
  if (!v11 || (float)(v26 * (float)v11) < v25)
  {
    v28 = 1;
    if (v11 >= 3)
      v28 = (v11 & (v11 - 1)) != 0;
    v29 = v28 | (2 * v11);
    v30 = vcvtps_u32_f32(v25 / v26);
    if (v29 <= v30)
      prime = v30;
    else
      prime = v29;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v32 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v32)
      goto LABEL_65;
    if (prime < *(_QWORD *)&v32)
    {
      v33 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v32 < 3uLL || (v34 = (uint8x8_t)vcnt_s8(v32), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (prime <= v33)
        prime = v33;
      if (prime < *(_QWORD *)&v32)
LABEL_65:
        sub_21AB84BB8(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    v36 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        v3 = v10 % v11;
        v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v10 % v11));
        if (v27)
          goto LABEL_54;
      }
      else
      {
        v3 = v10;
        v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v10);
        if (v27)
          goto LABEL_54;
      }
    }
    else
    {
      v3 = v36 & v10;
      v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v36 & v10));
      if (v27)
        goto LABEL_54;
    }
LABEL_78:
    *(_QWORD *)v39[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v39[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v39[0])
    {
      v37 = *(_QWORD *)(*(_QWORD *)v39[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v37 >= v11)
          v37 %= v11;
      }
      else
      {
        v37 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v37) = v39[0];
    }
    goto LABEL_89;
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (!v27)
    goto LABEL_78;
LABEL_54:
  *(_QWORD *)v39[0] = *v27;
  *v27 = v39[0];
LABEL_89:
  v14 = (uint64_t *)v39[0];
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_21AB857D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB858D4((uint64_t *)va);
  _Unwind_Resume(a1);
}

_BYTE *sub_21AB857EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _BYTE *result;

  v7 = a1 + 16;
  v8 = operator new(0x40uLL);
  v9 = v8;
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_21AB83FDC((_BYTE *)v8 + 16, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *((_OWORD *)v8 + 1) = *(_OWORD *)a3;
    v8[4] = *(_QWORD *)(a3 + 16);
  }
  result = v9 + 5;
  if (*(char *)(a3 + 47) < 0)
  {
    result = sub_21AB83FDC(result, *(void **)(a3 + 24), *(_QWORD *)(a3 + 32));
  }
  else
  {
    *(_OWORD *)result = *(_OWORD *)(a3 + 24);
    v9[7] = *(_QWORD *)(a3 + 40);
  }
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_21AB8589C(_Unwind_Exception *a1)
{
  uint64_t *v1;
  uint64_t v2;
  void **v3;

  if (*(char *)(v2 + 39) < 0)
  {
    operator delete(*v3);
    sub_21AB858D4(v1);
    _Unwind_Resume(a1);
  }
  sub_21AB858D4(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_21AB858D4(uint64_t *a1)
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

unint64_t sub_21AB8593C(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v23 = *(uint64_t *)((char *)a2 + a3 - 48);
      v24 = *(uint64_t *)((char *)a2 + a3 - 40);
      v25 = *(uint64_t *)((char *)a2 + a3 - 24);
      v27 = *(uint64_t *)((char *)a2 + a3 - 64);
      v26 = *(uint64_t *)((char *)a2 + a3 - 56);
      v28 = *(uint64_t *)((char *)a2 + a3 - 16);
      v29 = *(uint64_t *)((char *)a2 + a3 - 8);
      v30 = v26 + v28;
      v31 = 0x9DDFEA08EB382D69
          * (v25 ^ ((0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v25 ^ (v23 + a3))));
      v32 = 0x9DDFEA08EB382D69 * (v31 ^ (v31 >> 47));
      v33 = v27 + a3 + v26 + v23;
      v34 = v33 + v24;
      v35 = __ROR8__(v33, 44) + v27 + a3 + __ROR8__(v24 + v27 + a3 - 0x622015F714C7D297 * (v31 ^ (v31 >> 47)), 21);
      v36 = v26 + v28 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v37 = v36 + v25 + v28;
      v38 = __ROR8__(v37, 44);
      v39 = v37 + v29;
      v40 = v38 + v36 + __ROR8__(v36 + v24 + v29, 21);
      v42 = *a2;
      v41 = a2 + 4;
      v43 = v42 - 0x4B6D499041670D8DLL * v24;
      v44 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v45 = *(v41 - 3);
        v46 = v43 + v34 + v30 + v45;
        v47 = v41[2];
        v48 = v41[3];
        v49 = v41[1];
        v30 = v49 + v34 - 0x4B6D499041670D8DLL * __ROR8__(v30 + v35 + v47, 42);
        v50 = v32 + v39;
        v51 = *(v41 - 2);
        v52 = *(v41 - 1);
        v53 = *(v41 - 4) - 0x4B6D499041670D8DLL * v35;
        v54 = v53 + v39 + v52;
        v55 = v53 + v45 + v51;
        v34 = v55 + v52;
        v56 = __ROR8__(v55, 44) + v53;
        v57 = (0xB492B66FBE98F273 * __ROR8__(v46, 37)) ^ v40;
        v43 = 0xB492B66FBE98F273 * __ROR8__(v50, 33);
        v35 = v56 + __ROR8__(v54 + v57, 21);
        v58 = v43 + v40 + *v41;
        v39 = v58 + v49 + v47 + v48;
        v40 = __ROR8__(v58 + v49 + v47, 44) + v58 + __ROR8__(v30 + v51 + v58 + v48, 21);
        v41 += 8;
        v32 = v57;
        v44 += 64;
      }
      while (v44);
      v59 = v43
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) ^ ((0x9DDFEA08EB382D69 * (v40 ^ ((0x9DDFEA08EB382D69 * (v40 ^ v35)) >> 47) ^ (0x9DDFEA08EB382D69 * (v40 ^ v35)))) >> 47));
      v60 = 0x9DDFEA08EB382D69
          * (v59 ^ (v57
                  - 0x4B6D499041670D8DLL * (v30 ^ (v30 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) ^ ((0x9DDFEA08EB382D69 * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ v34)) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ v34)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) ^ ((0x9DDFEA08EB382D69 * (v59 ^ (v60 >> 47) ^ v60)) >> 47));
    }
    else
    {
      v6 = *(uint64_t *)((char *)a2 + a3 - 16);
      v7 = *a2 - 0x3C5A37A36834CED9 * (v6 + a3);
      v9 = a2[2];
      v8 = a2[3];
      v10 = __ROR8__(v7 + v8, 52);
      v11 = v7 + a2[1];
      v12 = __ROR8__(v11, 7);
      v13 = v11 + v9;
      v14 = *(uint64_t *)((char *)a2 + a3 - 32) + v9;
      v15 = v12 + __ROR8__(*a2 - 0x3C5A37A36834CED9 * (v6 + a3), 37) + v10 + __ROR8__(v13, 31);
      v16 = *(uint64_t *)((char *)a2 + a3 - 24) + v14 + v6;
      v17 = 0xC3A5C85C97CB3127 * (v16 + *(uint64_t *)((char *)a2 + a3 - 8) + v8 + v15)
          - 0x651E95C4D06FBFB1
          * (v13
           + v8
           + __ROR8__(v14, 37)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 24) + v14, 7)
           + __ROR8__(*(uint64_t *)((char *)a2 + a3 - 8) + v8 + v14, 52)
           + __ROR8__(v16, 31));
      return 0x9AE16A3B2F90404FLL
           * ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) ^ ((v15 - 0x3C5A37A36834CED9 * (v17 ^ (v17 >> 47))) >> 47));
    }
  }
  else if (a3 > 0x10)
  {
    v18 = a2[1];
    v19 = 0xB492B66FBE98F273 * *a2;
    v20 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8), 30) + __ROR8__(v19 - v18, 43);
    v21 = v19 + a3 + __ROR8__(v18 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a2 + a3 - 8);
    v22 = 0x9DDFEA08EB382D69 * ((v20 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a2 + a3 - 16)) ^ v21);
    return 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) ^ ((0x9DDFEA08EB382D69 * (v21 ^ (v22 >> 47) ^ v22)) >> 47));
  }
  else if (a3 < 9)
  {
    if (a3 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a3)
      {
        v63 = (0xC949D7C7509E6557 * (a3 + 4 * *((unsigned __int8 *)a2 + a3 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                       * (*(unsigned __int8 *)a2 | ((unint64_t)*((unsigned __int8 *)a2 + (a3 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v63 ^ (v63 >> 47));
      }
    }
    else
    {
      v61 = *(unsigned int *)((char *)a2 + a3 - 4);
      v62 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a2) + a3) ^ v61);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) ^ ((0x9DDFEA08EB382D69 * (v61 ^ (v62 >> 47) ^ v62)) >> 47));
    }
  }
  else
  {
    v3 = *(uint64_t *)((char *)a2 + a3 - 8);
    v4 = __ROR8__(v3 + a3, a3);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a2)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a2)))) >> 47))) ^ v3;
  }
  return result;
}

uint64_t *sub_21AB85D88(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _BYTE *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  uint64_t **v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _BYTE *v27;
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
  int8x8_t v38;
  unint64_t v39;
  uint8x8_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD v45[2];
  char v46;

  v6 = (_BYTE *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v9 = v8;
  }
  v10 = sub_21AB8593C((uint64_t)v45, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v14 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      v15 = *v14;
      if (*v14)
      {
        v16 = v6[23];
        if (v16 >= 0)
          v17 = v6[23];
        else
          v17 = *((_QWORD *)v6 + 1);
        if (v16 < 0)
          v6 = *(_BYTE **)v6;
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            v22 = v15[1];
            if (v22 == v11)
            {
              v23 = *((unsigned __int8 *)v15 + 39);
              if ((v23 & 0x80u) == 0)
                v24 = *((unsigned __int8 *)v15 + 39);
              else
                v24 = v15[3];
              if (v24 == v17)
              {
                if ((v23 & 0x80) != 0)
                {
                  if (!memcmp((const void *)v15[2], v6, v15[3]))
                    return v15;
                }
                else
                {
                  if (!*((_BYTE *)v15 + 39))
                    return v15;
                  v25 = 0;
                  while (*((unsigned __int8 *)v15 + v25 + 16) == v6[v25])
                  {
                    if (v23 == ++v25)
                      return v15;
                  }
                }
              }
            }
            else if ((v22 & (v12 - 1)) != v4)
            {
              goto LABEL_51;
            }
            v15 = (uint64_t *)*v15;
            if (!v15)
              goto LABEL_51;
          }
        }
        do
        {
          v18 = v15[1];
          if (v18 == v11)
          {
            v19 = *((unsigned __int8 *)v15 + 39);
            if ((v19 & 0x80u) == 0)
              v20 = *((unsigned __int8 *)v15 + 39);
            else
              v20 = v15[3];
            if (v20 == v17)
            {
              if ((v19 & 0x80) != 0)
              {
                if (!memcmp((const void *)v15[2], v6, v15[3]))
                  return v15;
              }
              else
              {
                if (!*((_BYTE *)v15 + 39))
                  return v15;
                v21 = 0;
                while (*((unsigned __int8 *)v15 + v21 + 16) == v6[v21])
                {
                  if (v19 == ++v21)
                    return v15;
                }
              }
            }
          }
          else
          {
            if (v18 >= v12)
              v18 %= v12;
            if (v18 != v4)
              break;
          }
          v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_51:
  v26 = operator new(0x40uLL);
  v45[0] = v26;
  v45[1] = a1 + 16;
  v46 = 0;
  *v26 = 0;
  v26[1] = v11;
  v27 = v26 + 2;
  v28 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_21AB83FDC(v27, *(void **)v28, *((_QWORD *)v28 + 1));
  }
  else
  {
    v29 = *v28;
    v26[4] = *((_QWORD *)v28 + 2);
    *(_OWORD *)v27 = v29;
  }
  v26[5] = 0;
  v26[6] = 0;
  v26[7] = 0;
  v46 = 1;
  v30 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v31 = *(float *)(a1 + 32);
  if (!v12 || (float)(v31 * (float)v12) < v30)
  {
    v34 = 1;
    if (v12 >= 3)
      v34 = (v12 & (v12 - 1)) != 0;
    v35 = v34 | (2 * v12);
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
    v38 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v38)
      goto LABEL_68;
    if (prime < *(_QWORD *)&v38)
    {
      v39 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v38 < 3uLL || (v40 = (uint8x8_t)vcnt_s8(v38), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        v39 = std::__next_prime(v39);
      }
      else
      {
        v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2)
          v39 = v41;
      }
      if (prime <= v39)
        prime = v39;
      if (prime < *(_QWORD *)&v38)
LABEL_68:
        sub_21AB84BB8(a1, prime);
    }
    v12 = *(_QWORD *)(a1 + 8);
    v42 = v12 - 1;
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
      {
        v4 = v11 % v12;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v11 % v12));
        v33 = (_QWORD *)v45[0];
        if (v32)
          goto LABEL_57;
      }
      else
      {
        v4 = v11;
        v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
        v33 = (_QWORD *)v45[0];
        if (v32)
          goto LABEL_57;
      }
    }
    else
    {
      v4 = v42 & v11;
      v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v42 & v11));
      v33 = (_QWORD *)v45[0];
      if (v32)
        goto LABEL_57;
    }
LABEL_81:
    *v33 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v45[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v45[0])
    {
      v43 = *(_QWORD *)(*(_QWORD *)v45[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v43 >= v12)
          v43 %= v12;
      }
      else
      {
        v43 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v43) = v45[0];
    }
    goto LABEL_92;
  }
  v32 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  v33 = (_QWORD *)v45[0];
  if (!v32)
    goto LABEL_81;
LABEL_57:
  *v33 = *v32;
  *v32 = v45[0];
LABEL_92:
  v15 = (uint64_t *)v45[0];
  ++*(_QWORD *)(a1 + 24);
  return v15;
}

void sub_21AB861D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB858D4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_21AB861E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB858D4((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_21AB861FC(_QWORD *a1, uint64_t a2)
{
  _BYTE *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  uint64_t *result;
  uint64_t **v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v2 = (_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  v6 = sub_21AB8593C((uint64_t)&v25, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v10 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v10 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(uint64_t ***)(*a1 + 8 * v10);
  if (v12)
  {
    v13 = *v12;
    if (*v12)
    {
      v14 = v2[23];
      if (v14 >= 0)
        v15 = v2[23];
      else
        v15 = *((_QWORD *)v2 + 1);
      if (v14 < 0)
        v2 = *(_BYTE **)v2;
      if (v9.u32[0] < 2uLL)
      {
        v16 = *(_QWORD *)&v7 - 1;
        while (1)
        {
          v21 = v13[1];
          if (v21 == v8)
          {
            v22 = *((unsigned __int8 *)v13 + 39);
            if ((v22 & 0x80u) == 0)
              v23 = *((unsigned __int8 *)v13 + 39);
            else
              v23 = v13[3];
            if (v23 == v15)
            {
              if ((v22 & 0x80) != 0)
              {
                if (!memcmp((const void *)v13[2], v2, v13[3]))
                  return v13;
              }
              else
              {
                if (!*((_BYTE *)v13 + 39))
                  return v13;
                v24 = 0;
                while (*((unsigned __int8 *)v13 + v24 + 16) == v2[v24])
                {
                  if (v22 == ++v24)
                    return v13;
                }
              }
            }
          }
          else if ((v21 & v16) != v10)
          {
            return 0;
          }
          result = 0;
          v13 = (uint64_t *)*v13;
          if (!v13)
            return result;
        }
      }
      while (1)
      {
        v17 = v13[1];
        if (v17 == v8)
        {
          v18 = *((unsigned __int8 *)v13 + 39);
          if ((v18 & 0x80u) == 0)
            v19 = *((unsigned __int8 *)v13 + 39);
          else
            v19 = v13[3];
          if (v19 == v15)
          {
            if ((v18 & 0x80) != 0)
            {
              if (!memcmp((const void *)v13[2], v2, v13[3]))
                return v13;
            }
            else
            {
              if (!*((_BYTE *)v13 + 39))
                return v13;
              v20 = 0;
              while (*((unsigned __int8 *)v13 + v20 + 16) == v2[v20])
              {
                if (v18 == ++v20)
                  return v13;
              }
            }
          }
        }
        else
        {
          if (v17 >= *(_QWORD *)&v7)
            v17 %= *(_QWORD *)&v7;
          if (v17 != v10)
            return 0;
        }
        result = 0;
        v13 = (uint64_t *)*v13;
        if (!v13)
          return result;
      }
    }
  }
  return 0;
}

void sub_21AB86428(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21AB86444(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3)
{
  std::mutex *v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  uint64_t (***v17)();
  uint64_t v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  unsigned int *v25;
  uint64_t (**v26)();
  std::__shared_weak_count *v27;
  std::__shared_weak_count *v28;
  uint64_t (***v29)();
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (std::mutex *)(a2 + 344);
  std::mutex::lock((std::mutex *)(a2 + 344));
  v7 = *(_QWORD *)(a2 + 104);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = (int)a1;
      if (v7 <= (int)a1)
        v9 = (int)a1 % v7;
    }
    else
    {
      v9 = (v7 - 1) & (int)a1;
    }
    v10 = *(uint64_t ***)(*(_QWORD *)(a2 + 96) + 8 * v9);
    if (v10)
    {
      v11 = *v10;
      if (v11)
      {
        if (v8.u32[0] < 2uLL)
        {
          v12 = v7 - 1;
          while (1)
          {
            v14 = v11[1];
            if (v14 == (int)a1)
            {
              if (*((_DWORD *)v11 + 4) == (_DWORD)a1)
                goto LABEL_38;
            }
            else if ((v14 & v12) != v9)
            {
              goto LABEL_21;
            }
            v11 = (uint64_t *)*v11;
            if (!v11)
              goto LABEL_21;
          }
        }
        do
        {
          v13 = v11[1];
          if (v13 == (int)a1)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)a1)
              goto LABEL_38;
          }
          else
          {
            if (v13 >= v7)
              v13 %= v7;
            if (v13 != v9)
              break;
          }
          v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
    }
  }
LABEL_21:
  v15 = (std::__shared_weak_count *)operator new(0x48uLL);
  v15->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7540;
  v26 = &off_24DDB7590;
  v27 = (std::__shared_weak_count *)a2;
  v28 = a3;
  v29 = &v26;
  sub_21AB8FF64(&v15[1], a1, &v26);
  v17 = v29;
  if (v29 == &v26)
  {
    v18 = 4;
    v17 = &v26;
  }
  else
  {
    if (!v29)
      goto LABEL_26;
    v18 = 5;
  }
  (*v17)[v18]();
LABEL_26:
  LODWORD(v26) = a1;
  v27 = v15 + 1;
  v28 = v15;
  do
    v19 = __ldxr(p_shared_owners);
  while (__stxr(v19 + 1, p_shared_owners));
  sub_21AB88BCC(a2 + 96, (int *)&v26, (uint64_t)&v26);
  v20 = v28;
  if (v28)
  {
    v21 = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v15)
  {
    v23 = (unint64_t *)&v15->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_38:
  std::mutex::unlock(v6);
  v25 = (unsigned int *)(a2 + 200);
  do
    __ldaxr(v25);
  while (__stlxr(a1, v25));
}

void sub_21AB866C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  std::mutex *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  sub_21AB8674C((uint64_t)va1);
  sub_21AB867B4((uint64_t)va);
  std::mutex::unlock(v2);
  _Unwind_Resume(a1);
}

void sub_21AB866EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  std::mutex *v15;
  std::__shared_weak_count *v16;
  char *v17;
  char *v19;
  uint64_t v20;
  void *v21;

  v19 = a15;
  if (a15 == v17)
  {
    v20 = 4;
    v19 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  std::__shared_weak_count::~__shared_weak_count(v16);
  operator delete(v21);
  std::mutex::unlock(v15);
  _Unwind_Resume(a1);
}

void sub_21AB86738(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB8674C(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 16);
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

uint64_t sub_21AB867B4(uint64_t result)
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

void sub_21AB8681C(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  dispatch_semaphore_t v12;
  _xpc_connection_s *mach_service;
  dispatch_source_t v14;
  NSObject *v15;
  uint64_t v16;
  dispatch_time_t v17;
  unsigned __int8 *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[7];
  _QWORD handler[7];
  __int128 v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v2 = dispatch_queue_create("com.apple.cvhwa.xpc.listener", 0);
  v3 = _os_feature_enabled_impl();
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x24BDACB70];
    v6 = "VisionHWAccelerationServices framework launched via visionhwserverd";
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x24BDACB70];
    v6 = "VisionHWAccelerationServices framework launched via mediaserverd";
  }
  _os_log_impl(&dword_21AB76000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v32 = v7;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: At Start: num client: %d ", buf, 8u);
  }
  v8 = *(_QWORD *)(a1 + 16);
  v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v9)
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x24BDACB70];
    v11 = "VisionHWAServer: An active Session exists";
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x24BDACB70];
    v11 = "VisionHWAServer: No active Session created Yet";
  }
  _os_log_impl(&dword_21AB76000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_15:
  v12 = dispatch_semaphore_create(1);
  mach_service = xpc_connection_create_mach_service("com.apple.cvhwa.xpc", v2, 1uLL);
  v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v2);
  v15 = v14;
  v16 = MEMORY[0x24BDAC760];
  if (v14)
  {
    *(_QWORD *)(a1 + 208) = v14;
    v17 = dispatch_time(0, 5000000000);
    handler[0] = v16;
    handler[1] = 0x40000000;
    handler[2] = sub_21AB86B64;
    handler[3] = &unk_24DDB74D0;
    handler[4] = a1;
    handler[5] = v15;
    handler[6] = v17;
    v30 = xmmword_21AB99070;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    dispatch_activate(v15);
    v18 = (unsigned __int8 *)(a1 + 204);
    do
      __ldaxr(v18);
    while (__stlxr(1u, v18));
  }
  else
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      sub_21AB97BB8(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  v28[0] = v16;
  v28[1] = 0x40000000;
  v28[2] = sub_21AB86D50;
  v28[3] = &unk_24DDB7510;
  v28[4] = a1;
  v28[5] = v15;
  v28[6] = v12;
  xpc_connection_set_event_handler(mach_service, v28);
  v27 = dispatch_queue_create("com.apple.cvhwa.xpc.msg", 0);
  xpc_connection_set_target_queue(mach_service, v27);
  xpc_connection_resume(mach_service);
  xpc_release(v2);
  xpc_release(v27);
}

void sub_21AB86B58(_Unwind_Exception *a1, int a2)
{
  if (a2)
    sub_21AB8407C(a1);
  _Unwind_Resume(a1);
}

void sub_21AB86B64(uint64_t a1)
{
  std::mutex *v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  uint64_t v5;
  _QWORD *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = (std::mutex *)(*(_QWORD *)(a1 + 32) + 280);
  std::mutex::lock(v2);
  v3 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 204);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(0, v3));
  if ((v4 & 1) != 0)
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 40));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s finish!", buf, 2u);
    }
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    sub_21AB81B30(*(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v5 + 32))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: outstanding client exists!", v11, 2u);
        v5 = *(_QWORD *)(a1 + 32);
      }
      *(_DWORD *)(v5 + 32) = 0;
    }
    if (*(_QWORD *)(v5 + 64))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: client map not empty!", v10, 2u);
        v5 = *(_QWORD *)(a1 + 32);
      }
      for (i = (_QWORD *)(v5 + 56); ; sub_21AB80A28(*(_QWORD *)(a1 + 32), (uint64_t)(i + 3), 1))
      {
        i = (_QWORD *)*i;
        if (!i)
          break;
      }
      v7 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v7 + 64))
      {
        sub_21AB87CF8(v7 + 40, *(char **)(v7 + 56));
        *(_QWORD *)(v7 + 56) = 0;
        v8 = *(_QWORD *)(v7 + 48);
        if (v8)
        {
          for (j = 0; j != v8; ++j)
            *(_QWORD *)(*(_QWORD *)(v7 + 40) + 8 * j) = 0;
        }
        *(_QWORD *)(v7 + 64) = 0;
      }
    }
  }
  std::mutex::unlock(v2);
}

void sub_21AB86D28(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB86D3C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB86D50(uint64_t a1, _xpc_connection_s *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  __int128 v45;
  uint64_t v46;

  if (MEMORY[0x2207529D8](a2) != MEMORY[0x24BDACFB8])
  {
    if (MEMORY[0x2207529D8](a2) != MEMORY[0x24BDACF88])
    {
      v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v4)
        sub_21AB97CBC(v4, v5, v6, v7, v8, v9, v10, v11);
      return;
    }
LABEL_9:
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 0x40000000;
    v44[2] = sub_21AB86F04;
    v44[3] = &unk_24DDB74F0;
    v44[4] = a2;
    v45 = *(_OWORD *)(a1 + 32);
    v46 = *(_QWORD *)(a1 + 48);
    xpc_connection_set_event_handler(a2, v44);
    xpc_connection_resume(a2);
    return;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (!v12)
  {
    if (a2 != (_xpc_connection_s *)MEMORY[0x24BDACF30])
      goto LABEL_7;
LABEL_16:
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      sub_21AB97BEC(v36, v37, v38, v39, v40, v41, v42, v43);
    return;
  }
  sub_21AB97C88(v12, v13, v14, v15, v16, v17, v18, v19);
  if (a2 == (_xpc_connection_s *)MEMORY[0x24BDACF30])
    goto LABEL_16;
LABEL_7:
  if (a2 == (_xpc_connection_s *)MEMORY[0x24BDACF48])
  {
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v20)
      sub_21AB97C20(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  else
  {
    if (a2 != (_xpc_connection_s *)MEMORY[0x24BDACF38])
      goto LABEL_9;
    v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v28)
      sub_21AB97C54(v28, v29, v30, v31, v32, v33, v34, v35);
  }
}

void sub_21AB86F04(uint64_t a1, void *a2)
{
  uint64_t pid;
  unsigned int v5;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  const char *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::mutex *v22;
  uint64_t *i;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  __int128 v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x2207529D8](a2) == MEMORY[0x24BDACFB8])
  {
    if (a2 == (void *)MEMORY[0x24BDACF38])
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v35) = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "VisionHWAServer (connection event handler): XPC_ERROR_CONNECTION_INVALID";
    }
    else if (a2 == (void *)MEMORY[0x24BDACF30])
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v35) = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "VisionHWAServer (connection event handler): XPC_ERROR_CONNECTION_INTERRUPTED";
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDACF48];
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      if (a2 == v9)
      {
        if (!v10)
          return;
        LOWORD(v35) = 0;
        v11 = MEMORY[0x24BDACB70];
        v12 = "VisionHWAServer (connection event handler): XPC_ERROR_TERMINENT_IMMINENT";
      }
      else
      {
        if (!v10)
          return;
        LOWORD(v35) = 0;
        v11 = MEMORY[0x24BDACB70];
        v12 = "VisionHWAServer (connection event handler): Unknown XPC error";
      }
    }
    _os_log_impl(&dword_21AB76000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v35, 2u);
  }
  else
  {
    pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
    if ((_DWORD)pid)
    {
      v5 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 40) + 200));
      if (v5 != (_DWORD)pid)
        sub_21AB86444(pid, *(_QWORD *)(a1 + 40), *(std::__shared_weak_count **)(a1 + 48));
      if (atomic_load((unsigned int *)(*(_QWORD *)(a1 + 40) + 200)))
      {
        v7 = (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 204);
        do
          v8 = __ldaxr(v7);
        while (__stlxr(0, v7));
        if ((v8 & 1) != 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v35) = 0;
            _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s stop!", (uint8_t *)&v35, 2u);
          }
          dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
        }
      }
      if (a2 == (void *)MEMORY[0x24BDACF38])
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v35 = 134217984;
          v36 = v21;
          _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "XPC_ERROR_CONNECTION_INVALID w/ client_connection = %p", (uint8_t *)&v35, 0xCu);
        }
      }
      else if (MEMORY[0x2207529D8](a2) == MEMORY[0x24BDACFA0]
             && !dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL))
      {
        sub_21AB82CA8(*(_QWORD *)(a1 + 40), a2);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
      }
      v22 = (std::mutex *)(*(_QWORD *)(a1 + 40) + 344);
      std::mutex::lock(v22);
      for (i = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 136);
            i != *(uint64_t **)(*(_QWORD *)(a1 + 40) + 144);
            *(_QWORD *)(v24 + 144) = v27)
      {
        while (!sub_21AB901B4(*i))
        {
          i += 2;
          if (i == *(uint64_t **)(*(_QWORD *)(a1 + 40) + 144))
            goto LABEL_26;
        }
        v24 = *(_QWORD *)(a1 + 40);
        v25 = i + 2;
        v26 = *(uint64_t **)(v24 + 144);
        v27 = i;
        if (i + 2 != v26)
        {
          do
          {
            v28 = *(_OWORD *)v25;
            *v25 = 0;
            v25[1] = 0;
            v29 = (std::__shared_weak_count *)v27[1];
            *(_OWORD *)v27 = v28;
            if (v29)
            {
              p_shared_owners = (unint64_t *)&v29->__shared_owners_;
              do
                v31 = __ldaxr(p_shared_owners);
              while (__stlxr(v31 - 1, p_shared_owners));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                std::__shared_weak_count::__release_weak(v29);
              }
            }
            v25 += 2;
            v27 += 2;
          }
          while (v25 != v26);
          v25 = *(uint64_t **)(v24 + 144);
        }
        while (v25 != v27)
        {
          v32 = (std::__shared_weak_count *)*(v25 - 1);
          if (v32)
          {
            v33 = (unint64_t *)&v32->__shared_owners_;
            do
              v34 = __ldaxr(v33);
            while (__stlxr(v34 - 1, v33));
            if (!v34)
            {
              ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
              std::__shared_weak_count::__release_weak(v32);
            }
          }
          v25 -= 2;
        }
      }
LABEL_26:
      std::mutex::unlock(v22);
    }
    else
    {
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        sub_21AB97CF0(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

void sub_21AB87308(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void VisionHWAccelerationServicesStart()
{
  unsigned __int8 v0;
  const void **v1;
  uint8_t v2[16];
  uint8_t v3[16];
  uint8_t v4[16];
  uint8_t v5[16];
  uint8_t v6[16];
  uint8_t buf[16];

  if (!_os_feature_enabled_impl())
  {
    v0 = atomic_load((unsigned __int8 *)&qword_253F2CFB8);
    if ((v0 & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_253F2CFB8))
      {
        sub_21AB87918((uint64_t)&unk_253F2CDF8);
        __cxa_atexit((void (*)(void *))sub_21AB87914, &unk_253F2CDF8, &dword_21AB76000);
        __cxa_guard_release(&qword_253F2CFB8);
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v4, 2u);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        goto LABEL_17;
      }
    }
    else if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_9;
    }
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: VisionHWAccelerationServicesStart is invoked.", v3, 2u);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      dword_253F2CE18 = 0;
      v1 = (const void **)off_253F2CE08;
      off_253F2CE08 = 0;
      if (!v1)
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_17:
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v2, 2u);
    dword_253F2CE18 = 0;
    v1 = (const void **)off_253F2CE08;
    off_253F2CE08 = 0;
    if (!v1)
    {
LABEL_19:
      sub_21AB8681C((uint64_t)&unk_253F2CDF8);
      return;
    }
LABEL_18:
    sub_21AB8EA00(*v1);
    MEMORY[0x220752450](v1, 0x20C4093837F09);
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", buf, 2u);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_4:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
LABEL_14:
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v5, 2u);
      return;
    }
  }
  else if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_4;
  }
  *(_WORD *)v6 = 0;
  _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer has been disabled in mediaserverd", v6, 2u);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
}

void sub_21AB875FC(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253F2CFB8);
  _Unwind_Resume(a1);
}

void VisionHWServerStart()
{
  unsigned __int8 v0;
  const void **v1;
  uint8_t v2[16];
  uint8_t v3[16];
  uint8_t buf[16];
  uint8_t v5[16];
  uint8_t v6[16];
  uint8_t v7[16];

  if (_os_feature_enabled_impl())
  {
    v0 = atomic_load((unsigned __int8 *)&qword_253F2CFB8);
    if ((v0 & 1) == 0)
    {
      if (__cxa_guard_acquire(&qword_253F2CFB8))
      {
        sub_21AB87918((uint64_t)&unk_253F2CDF8);
        __cxa_atexit((void (*)(void *))sub_21AB87914, &unk_253F2CDF8, &dword_21AB76000);
        __cxa_guard_release(&qword_253F2CFB8);
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v7, 2u);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_5:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        goto LABEL_17;
      }
    }
    else if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_5;
    }
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: VisionHWAccelerationServicesStart is invoked.", v6, 2u);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      dword_253F2CE18 = 0;
      v1 = (const void **)off_253F2CE08;
      off_253F2CE08 = 0;
      if (!v1)
        goto LABEL_19;
      goto LABEL_18;
    }
LABEL_17:
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v5, 2u);
    dword_253F2CE18 = 0;
    v1 = (const void **)off_253F2CE08;
    off_253F2CE08 = 0;
    if (!v1)
    {
LABEL_19:
      sub_21AB8681C((uint64_t)&unk_253F2CDF8);
      return;
    }
LABEL_18:
    sub_21AB8EA00(*v1);
    MEMORY[0x220752450](v1, 0x20C4093837F09);
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", buf, 2u);
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return;
LABEL_14:
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer: **********************************.", v2, 2u);
      return;
    }
  }
  else if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_10;
  }
  *(_WORD *)v3 = 0;
  _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "**************** VisionHWAServer has been disabled in visionserverd", v3, 2u);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    goto LABEL_14;
}

void sub_21AB878F8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253F2CFB8);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB87918(uint64_t a1)
{
  uint8_t v3[16];

  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_QWORD *)(a1 + 80) = 1;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_BYTE *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_QWORD *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_DWORD *)(a1 + 200) = 0;
  *(_BYTE *)(a1 + 204) = 1;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 850045863;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_QWORD *)(a1 + 272) = 0;
  *(_QWORD *)(a1 + 280) = 850045863;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_QWORD *)(a1 + 336) = 0;
  *(_QWORD *)(a1 + 344) = 850045863;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_QWORD *)(a1 + 400) = 0;
  *(_BYTE *)(a1 + 408) = 1;
  *(_QWORD *)(a1 + 440) = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Constructor invoked\n", v3, 2u);
  }
  sub_21AB83784(a1);
  return a1;
}

void sub_21AB87A50(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void **v4;
  std::mutex *v5;
  std::mutex *v6;
  std::mutex *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v9 = v8;
  v11 = *(_QWORD **)(v1 + 440);
  if (v11 == v9)
  {
    v12 = v9;
    v13 = 4;
  }
  else
  {
    if (!v11)
      goto LABEL_6;
    v13 = 5;
    v12 = *(_QWORD **)(v1 + 440);
  }
  (*(void (**)(void))(*v12 + 8 * v13))();
LABEL_6:
  std::mutex::~mutex(v7);
  std::mutex::~mutex(v6);
  std::mutex::~mutex(v5);
  sub_21AB87AE0(v1 + 160);
  sub_21AB87B48(v4);
  sub_21AB87BE0(v3);
  sub_21AB87C70(v2);
  sub_21AB87CA8((const void ***)(v1 + 16));
  sub_21AB867B4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB87AE0(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v5 = (_QWORD *)*v2;
      v6 = (void *)v2[3];
      if (v6)
      {
        v2[4] = v6;
        operator delete(v6);
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

void **sub_21AB87B48(void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (std::__shared_weak_count *)*((_QWORD *)v3 - 1);
        if (v5)
        {
          p_shared_owners = (unint64_t *)&v5->__shared_owners_;
          do
            v7 = __ldaxr(p_shared_owners);
          while (__stlxr(v7 - 1, p_shared_owners));
          if (!v7)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        v3 -= 16;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_21AB87BE0(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(_QWORD **)(a1 + 16);
  while (v2)
  {
    v5 = v2;
    v2 = (_QWORD *)*v2;
    v6 = (std::__shared_weak_count *)v5[4];
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
    operator delete(v5);
  }
  v3 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v3)
    operator delete(v3);
  return a1;
}

uint64_t sub_21AB87C70(uint64_t a1)
{
  void *v2;

  sub_21AB87CF8(a1, *(char **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

const void ***sub_21AB87CA8(const void ***a1)
{
  const void **v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    sub_21AB8EA00(*v2);
    MEMORY[0x220752450](v2, 0x20C4093837F09);
  }
  return a1;
}

void sub_21AB87CF8(int a1, char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = *(char **)v2;
      v4 = *((_QWORD *)v2 + 19);
      *((_QWORD *)v2 + 19) = 0;
      if (v4)
        (*(void (**)(uint64_t))(*(_QWORD *)v4 + 72))(v4);
      if (!v2[144])
        goto LABEL_11;
      v5 = (std::__shared_weak_count *)*((_QWORD *)v2 + 17);
      if (!v5)
        goto LABEL_11;
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        if ((v2[127] & 0x80000000) == 0)
        {
LABEL_12:
          v8 = (void *)*((_QWORD *)v2 + 10);
          if (!v8)
            goto LABEL_3;
LABEL_16:
          *((_QWORD *)v2 + 11) = v8;
          operator delete(v8);
          goto LABEL_3;
        }
      }
      else
      {
LABEL_11:
        if ((v2[127] & 0x80000000) == 0)
          goto LABEL_12;
      }
      operator delete(*((void **)v2 + 13));
      v8 = (void *)*((_QWORD *)v2 + 10);
      if (v8)
        goto LABEL_16;
LABEL_3:
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_21AB87DC8(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *i;
  uint64_t v11;
  uint64_t j;
  const void **v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  const void **v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  uint8_t v42[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: Destructor invoked\n", buf, 2u);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      sub_21AB97D24(v2, v3, v4, v5, v6, v7, v8, v9);
    for (i = (_QWORD *)(a1 + 56); ; sub_21AB80A28(a1, (uint64_t)(i + 3), 1))
    {
      i = (_QWORD *)*i;
      if (!i)
        break;
    }
    if (*(_QWORD *)(a1 + 64))
    {
      sub_21AB87CF8(a1 + 40, *(char **)(a1 + 56));
      *(_QWORD *)(a1 + 56) = 0;
      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
      {
        for (j = 0; j != v11; ++j)
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * j) = 0;
      }
      *(_QWORD *)(a1 + 64) = 0;
    }
  }
  v13 = *(const void ***)(a1 + 16);
  if (v13)
  {
    *(_QWORD *)(a1 + 16) = 0;
    sub_21AB8EA00(*v13);
    MEMORY[0x220752450](v13, 0x20C4093837F09);
  }
  if (!*(_QWORD *)a1)
    goto LABEL_21;
  v14 = *(std::__shared_weak_count **)(a1 + 8);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (!v14)
    goto LABEL_21;
  p_shared_owners = (unint64_t *)&v14->__shared_owners_;
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    v17 = *(void **)(a1 + 24);
    if (!v17)
      goto LABEL_25;
  }
  else
  {
LABEL_21:
    v17 = *(void **)(a1 + 24);
    if (!v17)
      goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v42 = 0;
    _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Releasing os_transaction inside DTOR -- visionhwserverd is TERMINATING", v42, 2u);
    v17 = *(void **)(a1 + 24);
  }
  os_release(v17);
LABEL_25:
  v18 = *(_QWORD **)(a1 + 440);
  if (v18 == (_QWORD *)(a1 + 416))
  {
    v19 = 4;
    v18 = (_QWORD *)(a1 + 416);
  }
  else
  {
    if (!v18)
      goto LABEL_30;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_30:
  std::mutex::~mutex((std::mutex *)(a1 + 344));
  std::mutex::~mutex((std::mutex *)(a1 + 280));
  std::mutex::~mutex((std::mutex *)(a1 + 216));
  v20 = *(_QWORD **)(a1 + 176);
  if (v20)
  {
    do
    {
      v25 = (_QWORD *)*v20;
      v26 = (void *)v20[3];
      if (v26)
      {
        v20[4] = v26;
        operator delete(v26);
      }
      operator delete(v20);
      v20 = v25;
    }
    while (v25);
  }
  v21 = *(void **)(a1 + 160);
  *(_QWORD *)(a1 + 160) = 0;
  if (v21)
    operator delete(v21);
  v22 = *(_QWORD *)(a1 + 136);
  if (v22)
  {
    v23 = *(_QWORD *)(a1 + 144);
    v24 = *(void **)(a1 + 136);
    if (v23 != v22)
    {
      do
      {
        v27 = *(std::__shared_weak_count **)(v23 - 8);
        if (v27)
        {
          v28 = (unint64_t *)&v27->__shared_owners_;
          do
            v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
        v23 -= 16;
      }
      while (v23 != v22);
      v24 = *(void **)(a1 + 136);
    }
    *(_QWORD *)(a1 + 144) = v22;
    operator delete(v24);
  }
  v30 = *(_QWORD **)(a1 + 112);
  while (v30)
  {
    v38 = v30;
    v30 = (_QWORD *)*v30;
    v39 = (std::__shared_weak_count *)v38[4];
    if (v39)
    {
      v40 = (unint64_t *)&v39->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    operator delete(v38);
  }
  v31 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;
  if (v31)
    operator delete(v31);
  sub_21AB87CF8(a1 + 40, *(char **)(a1 + 56));
  v32 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v32)
    operator delete(v32);
  v33 = *(const void ***)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v33)
  {
    sub_21AB8EA00(*v33);
    MEMORY[0x220752450](v33, 0x20C4093837F09);
  }
  v34 = *(std::__shared_weak_count **)(a1 + 8);
  if (v34)
  {
    v35 = (unint64_t *)&v34->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  return a1;
}

void sub_21AB88188(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7540;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_21AB88198(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7540;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752450);
}

_QWORD *sub_21AB881C8(uint64_t a1)
{
  return sub_21AB8FF68((_QWORD *)(a1 + 24));
}

void sub_21AB881D8()
{
  JUMPOUT(0x220752450);
}

__n128 sub_21AB881EC(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_24DDB7590;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_21AB88224(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24DDB7590;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_21AB88244(uint64_t a1, int *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int *v5;
  _QWORD *v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  uint64_t **v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  int64_t v17;
  char *v18;
  _QWORD *v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  int v26;
  std::mutex *v27;
  uint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint64_t **v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  char *v39;
  uint64_t v40;
  std::mutex *v41;
  unsigned __int8 *v42;
  unsigned __int8 v43;
  dispatch_time_t v44;
  uint8_t v45;
  char v46[15];
  char *v47;
  char *v48;
  char *v49;
  int v50;
  uint8_t buf[8];
  uint64_t v52;

  v4 = *a3;
  v50 = *a2;
  v5 = (unsigned int *)(*(_QWORD *)(a1 + 8) + 200);
  do
    __ldaxr(v5);
  while (__stlxr(0, v5));
  v6 = *(_QWORD **)(a1 + 8);
  v7 = v6[21];
  if (!v7)
    goto LABEL_47;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = v50;
    if (v7 <= v50)
      v9 = v50 % v7;
  }
  else
  {
    v9 = (v7 - 1) & v50;
  }
  v10 = *(uint64_t ***)(v6[20] + 8 * v9);
  if (!v10)
    goto LABEL_47;
  v11 = *v10;
  if (!v11)
    goto LABEL_47;
  if (v8.u32[0] < 2uLL)
  {
    v12 = v7 - 1;
    while (1)
    {
      v14 = v11[1];
      if (v14 == v50)
      {
        if (*((_DWORD *)v11 + 4) == v50)
          goto LABEL_24;
      }
      else if ((v14 & v12) != v9)
      {
        goto LABEL_47;
      }
      v11 = (uint64_t *)*v11;
      if (!v11)
        goto LABEL_47;
    }
  }
  while (1)
  {
    v13 = v11[1];
    if (v13 == v50)
      break;
    if (v13 >= v7)
      v13 %= v7;
    if (v13 != v9)
      goto LABEL_47;
LABEL_13:
    v11 = (uint64_t *)*v11;
    if (!v11)
      goto LABEL_47;
  }
  if (*((_DWORD *)v11 + 4) != v50)
    goto LABEL_13;
LABEL_24:
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v16 = (_BYTE *)v11[3];
  v15 = (_BYTE *)v11[4];
  v17 = v15 - v16;
  if (v15 == v16)
  {
    v18 = 0;
    v19 = (_QWORD *)v6[7];
    if (!v19)
      goto LABEL_44;
  }
  else
  {
    if (v17 < 0)
      sub_21AB808CC();
    v18 = (char *)operator new(v15 - v16);
    v47 = v18;
    v49 = &v18[8 * (v17 >> 3)];
    memcpy(v18, v16, v17);
    v48 = v49;
    v19 = (_QWORD *)v6[7];
    if (!v19)
      goto LABEL_44;
  }
  v20 = MEMORY[0x24BDACB70];
  do
  {
    v22 = v19 + 3;
    v23 = v47;
    if (v47 != v48)
    {
      while (*(_QWORD *)v23 != *v22)
      {
        v23 += 8;
        if (v23 == v48)
        {
          v23 = v48;
          break;
        }
      }
    }
    if (v23 == v48)
    {
      v21 = (_QWORD *)*v19;
    }
    else
    {
      sub_21AB80A28(*(_QWORD *)(a1 + 8), (uint64_t)v22, 1);
      v21 = (_QWORD *)*v19;
      sub_21AB8529C((_QWORD *)(*(_QWORD *)(a1 + 8) + 40), v19, (uint64_t)buf);
      v24 = *(char **)buf;
      *(_QWORD *)buf = 0;
      if (v24)
        sub_21AB850A8((uint64_t)&v52, v24);
      v25 = *(_QWORD *)(a1 + 8);
      v26 = *(_DWORD *)(v25 + 32);
      if (v26)
      {
        *(_DWORD *)(v25 + 32) = v26 - 1;
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        sub_21AB97D58(&v45, v46);
      }
    }
    v19 = v21;
  }
  while (v21);
  v18 = v47;
LABEL_44:
  if (v18)
  {
    v48 = v18;
    operator delete(v18);
  }
  v6 = *(_QWORD **)(a1 + 8);
LABEL_47:
  sub_21AB88770(v6 + 20, &v50);
  if (v4)
  {
    v27 = (std::mutex *)(*(_QWORD *)(a1 + 8) + 344);
    std::mutex::lock(v27);
    v28 = *(_QWORD *)(a1 + 8);
    v29 = *(_QWORD *)(v28 + 104);
    if (v29)
    {
      v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
      v30.i16[0] = vaddlv_u8(v30);
      if (v30.u32[0] > 1uLL)
      {
        v31 = v50;
        if (v29 <= v50)
          v31 = v50 % v29;
      }
      else
      {
        v31 = (v29 - 1) & v50;
      }
      v32 = *(uint64_t ***)(*(_QWORD *)(v28 + 96) + 8 * v31);
      if (v32)
      {
        v33 = *v32;
        if (v33)
        {
          if (v30.u32[0] < 2uLL)
          {
            v34 = v29 - 1;
            while (1)
            {
              v36 = v33[1];
              if (v36 == v50)
              {
                if (*((_DWORD *)v33 + 4) == v50)
                  goto LABEL_69;
              }
              else if ((v36 & v34) != v31)
              {
                goto LABEL_73;
              }
              v33 = (uint64_t *)*v33;
              if (!v33)
                goto LABEL_73;
            }
          }
          do
          {
            v35 = v33[1];
            if (v35 == v50)
            {
              if (*((_DWORD *)v33 + 4) == v50)
              {
LABEL_69:
                v37 = v33 + 3;
                v38 = *(_OWORD **)(v28 + 144);
                if ((unint64_t)v38 >= *(_QWORD *)(v28 + 152))
                {
                  v39 = sub_21AB888AC((char **)(v28 + 136), (uint64_t)v37);
                }
                else
                {
                  *v38 = *v37;
                  v39 = (char *)(v38 + 1);
                  *(_QWORD *)v37 = 0;
                  v33[4] = 0;
                }
                *(_QWORD *)(v28 + 144) = v39;
                sub_21AB889EC((_QWORD *)(*(_QWORD *)(a1 + 8) + 96), &v50);
                break;
              }
            }
            else
            {
              if (v35 >= v29)
                v35 %= v29;
              if (v35 != v31)
                break;
            }
            v33 = (uint64_t *)*v33;
          }
          while (v33);
        }
      }
    }
LABEL_73:
    std::mutex::unlock(v27);
  }
  v40 = *(_QWORD *)(a1 + 8);
  if (!*(_DWORD *)(v40 + 32))
  {
    v41 = (std::mutex *)(v40 + 280);
    std::mutex::lock((std::mutex *)(v40 + 280));
    v42 = (unsigned __int8 *)(*(_QWORD *)(a1 + 8) + 204);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(1u, v42));
    if ((v43 & 1) == 0)
    {
      v44 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 16), v44, 0x12A05F200uLL, 0x9502F900uLL);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VisionHWAServer: count down 5s start!", buf, 2u);
      }
      dispatch_resume(*(dispatch_object_t *)(a1 + 16));
    }
    std::mutex::unlock(v41);
  }
}

void sub_21AB886B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB886CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB886F8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z43VisionHWAccelerationServicesSetupAppMonitoriR23VisionHWAClientServicesP17dispatch_source_sE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_21AB88764()
{
  return &unk_24DDB7600;
}

uint64_t sub_21AB88770(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  void *v13;
  void *__p;
  char v15;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  v7 = *v6;
  if (!*v6)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v2 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == (_DWORD)v3)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (uint64_t *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == v3)
      break;
    if (v9 >= *(_QWORD *)&v2)
      v9 %= *(_QWORD *)&v2;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (uint64_t *)*v7;
    if (!v7)
      return 0;
  }
  if (*((_DWORD *)v7 + 4) != (_DWORD)v3)
    goto LABEL_11;
LABEL_22:
  sub_21AB8529C(a1, v7, (uint64_t)&__p);
  v12 = __p;
  __p = 0;
  if (v12)
  {
    if (v15)
    {
      v13 = (void *)v12[3];
      if (v13)
      {
        v12[4] = v13;
        operator delete(v13);
      }
    }
    operator delete(v12);
  }
  return 1;
}

char *sub_21AB888AC(char **a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;

  v3 = (a1[1] - *a1) >> 4;
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 60)
    sub_21AB808CC();
  v5 = a1[2] - *a1;
  if (v5 >> 3 > v4)
    v4 = v5 >> 3;
  v6 = (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF0;
  v7 = 0xFFFFFFFFFFFFFFFLL;
  if (!v6)
    v7 = v4;
  if (v7 >> 60)
    sub_21AB80954();
  v9 = 16 * v7;
  v10 = (char *)operator new(16 * v7);
  v11 = &v10[16 * v3];
  *(_OWORD *)v11 = *(_OWORD *)a2;
  v12 = v11 + 16;
  v13 = &v10[v9];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v14 = *a1;
  v15 = a1[1];
  if (v15 == *a1)
  {
    *a1 = v11;
    a1[1] = v12;
    a1[2] = v13;
    if (!v15)
      return v12;
    goto LABEL_19;
  }
  do
  {
    v16 = *((_OWORD *)v15 - 1);
    v15 -= 16;
    *((_OWORD *)v11 - 1) = v16;
    v11 -= 16;
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
  }
  while (v15 != v14);
  v17 = *a1;
  v15 = a1[1];
  *a1 = v11;
  a1[1] = v12;
  a1[2] = v13;
  if (v15 != v17)
  {
    do
    {
      v18 = (std::__shared_weak_count *)*((_QWORD *)v15 - 1);
      if (v18)
      {
        p_shared_owners = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldaxr(p_shared_owners);
        while (__stlxr(v20 - 1, p_shared_owners));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v15 -= 16;
    }
    while (v15 != v17);
    v15 = v17;
  }
  if (v15)
LABEL_19:
    operator delete(v15);
  return v12;
}

uint64_t sub_21AB889EC(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  void *__p;
  char v17;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  v7 = *v6;
  if (!*v6)
    return 0;
  if (v4.u32[0] < 2uLL)
  {
    v8 = *(_QWORD *)&v2 - 1;
    while (1)
    {
      v10 = v7[1];
      if (v10 == v3)
      {
        if (*((_DWORD *)v7 + 4) == (_DWORD)v3)
          goto LABEL_22;
      }
      else if ((v10 & v8) != v5)
      {
        return 0;
      }
      v7 = (uint64_t *)*v7;
      if (!v7)
        return 0;
    }
  }
  while (1)
  {
    v9 = v7[1];
    if (v9 == v3)
      break;
    if (v9 >= *(_QWORD *)&v2)
      v9 %= *(_QWORD *)&v2;
    if (v9 != v5)
      return 0;
LABEL_11:
    v7 = (uint64_t *)*v7;
    if (!v7)
      return 0;
  }
  if (*((_DWORD *)v7 + 4) != (_DWORD)v3)
    goto LABEL_11;
LABEL_22:
  sub_21AB8529C(a1, v7, (uint64_t)&__p);
  v12 = __p;
  __p = 0;
  if (v12)
  {
    if (v17)
    {
      v13 = (std::__shared_weak_count *)v12[4];
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
    operator delete(v12);
  }
  return 1;
}

uint64_t sub_21AB88B50(uint64_t a1)
{
  _QWORD *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *(_QWORD **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = (std::__shared_weak_count *)v2[4];
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
    operator delete(v2);
  }
  return a1;
}

_QWORD *sub_21AB88BCC(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  float v17;
  float v18;
  uint64_t v19;
  _QWORD *v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t prime;
  int8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            v12 = v10[1];
            if (v12 == v6)
            {
              if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
                return v10;
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            v10 = (_QWORD *)*v10;
            if (!v10)
              goto LABEL_23;
          }
        }
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v11 >= v7)
              v11 %= v7;
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  v13 = (_QWORD *)(a1 + 16);
  v10 = operator new(0x28uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  v14 = *(_QWORD *)(a3 + 16);
  v10[3] = *(_QWORD *)(a3 + 8);
  v10[4] = v14;
  if (v14)
  {
    v15 = (unint64_t *)(v14 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (v7 && (float)(v18 * (float)v7) >= v17)
  {
    v19 = *(_QWORD *)a1;
    v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v20)
    {
LABEL_29:
      *v10 = *v20;
LABEL_64:
      *v20 = v10;
      goto LABEL_65;
    }
  }
  else
  {
    v21 = 1;
    if (v7 >= 3)
      v21 = (v7 & (v7 - 1)) != 0;
    v22 = v21 | (2 * v7);
    v23 = vcvtps_u32_f32(v17 / v18);
    if (v22 <= v23)
      prime = v23;
    else
      prime = v22;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
    }
    v25 = *(int8x8_t *)(a1 + 8);
    if (prime > *(_QWORD *)&v25)
      goto LABEL_40;
    if (prime < *(_QWORD *)&v25)
    {
      v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (*(_QWORD *)&v25 < 3uLL || (v27 = (uint8x8_t)vcnt_s8(v25), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        v26 = std::__next_prime(v26);
      }
      else
      {
        v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2)
          v26 = v28;
      }
      if (prime <= v26)
        prime = v26;
      if (prime < *(_QWORD *)&v25)
LABEL_40:
        sub_21AB84BB8(a1, prime);
    }
    v7 = *(_QWORD *)(a1 + 8);
    v29 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
      {
        v3 = v6 % v7;
        v19 = *(_QWORD *)a1;
        v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v6 % v7));
        if (v20)
          goto LABEL_29;
      }
      else
      {
        v3 = v6;
        v19 = *(_QWORD *)a1;
        v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v6);
        if (v20)
          goto LABEL_29;
      }
    }
    else
    {
      v3 = v29 & v6;
      v19 = *(_QWORD *)a1;
      v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v29 & v6));
      if (v20)
        goto LABEL_29;
    }
  }
  *v10 = *v13;
  *v13 = v10;
  *(_QWORD *)(v19 + 8 * v3) = v13;
  if (*v10)
  {
    v30 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v30 >= v7)
        v30 %= v7;
    }
    else
    {
      v30 &= v7 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v30);
    goto LABEL_64;
  }
LABEL_65:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_21AB88F00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB88B50((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB88F14(uint64_t a1@<X8>)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7[32];
  __int16 v8;
  uint64_t v9;
  uint64_t v10[3];

  v2 = (std::__shared_weak_count *)operator new(0x50uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2[1].std::__shared_count = 0u;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7658;
  *(_OWORD *)&v2[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v2[2].__shared_owners_ = 0u;
  v2[3].__vftable = 0;
  v10[1] = (uint64_t)&v2[1];
  v10[2] = (uint64_t)v2;
  sub_21AB890C8((uint64_t)&v2[1], v10);
  if (v10[0])
  {
    v9 = v10[0];
    v10[0] = 0;
    v4 = sub_21AB96B64();
    v8 = 257;
    sub_21AB91500(&v9, (uint64_t)v4, v7);
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    *(_BYTE *)a1 = 0;
    *(_BYTE *)(a1 + 16) = 0;
    if (v10[0])
      (*(void (**)(uint64_t))(*(_QWORD *)v10[0] + 8))(v10[0]);
  }
  else
  {
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
    *(_QWORD *)a1 = v2 + 1;
    *(_QWORD *)(a1 + 8) = v2;
    *(_BYTE *)(a1 + 16) = 1;
  }
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
}

void sub_21AB89060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  sub_21AB867B4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB89074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a9);
  if (a8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a8 + 8))(a8);
    v10 = a9;
    if (!a9)
    {
LABEL_3:
      sub_21AB867B4((uint64_t)va);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v10 = a9;
    if (!a9)
      goto LABEL_3;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  sub_21AB867B4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB890C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  char v12;
  int v13;
  char v14;
  const char **v15;
  uint64_t v16;
  uint64_t v17;
  const char **v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;
  __int16 v27;
  __int128 v28;
  char v29;
  uint64_t v30[2];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 24))
  {
    v25 = "only one call to .open() supported";
    v27 = 259;
    v3 = operator new();
    v4 = sub_21AB908BC();
    result = sub_21AB91AE8(v3, (uint64_t)&v25, 3, v4);
    *a2 = v3;
  }
  else
  {
    v27 = 260;
    v25 = (const char *)MEMORY[0x2207522A0]();
    sub_21AB92C48((unsigned __int8 *)&v25, 1, 0, 0, (uint64_t)v30);
    if ((v31 & 1) != 0)
    {
      result = (uint64_t)sub_21AB917DC(v30[0], v30[1], a2);
    }
    else
    {
      v7 = v30[0];
      v30[0] = 0;
      v8 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      if (v8)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
        v7 = *(_QWORD *)(a1 + 24);
      }
      v9 = *(_QWORD *)(v7 + 8);
      v10 = *(_QWORD *)(v7 + 16) - v9;
      if (v10 >= 0x10 && (*(_BYTE *)(v9 + 4) == 1 ? (v11 = *(_BYTE *)(v9 + 5) == 1) : (v11 = 0), v11))
      {
        result = sub_21AB8A31C(v9, v10, (uint64_t)&v28);
        if ((v29 & 1) != 0)
        {
          *a2 = v28;
        }
        else
        {
          v13 = *(unsigned __int8 *)(a1 + 48);
          *(_OWORD *)(a1 + 32) = v28;
          if (!v13)
            *(_BYTE *)(a1 + 48) = 1;
          if (**(_DWORD **)(a1 + 32) == 1179403647)
          {
            *a2 = 0;
          }
          else
          {
            v14 = v27;
            if (v27 == 1)
            {
              v21 = ": ELF magic not found";
              v24 = 259;
            }
            else if ((_BYTE)v27)
            {
              if (HIBYTE(v27) != 1)
                v14 = 2;
              v18 = &v25;
              if (HIBYTE(v27) == 1)
                v18 = (const char **)v25;
              v21 = (const char *)v18;
              v22 = v26;
              v23 = ": ELF magic not found";
              LOBYTE(v24) = v14;
              HIBYTE(v24) = 3;
            }
            else
            {
              v24 = 256;
            }
            v19 = operator new();
            v20 = sub_21AB908BC();
            result = sub_21AB91AE8(v19, (uint64_t)&v21, 3, v20);
            *a2 = v19;
            if ((v29 & 1) != 0)
            {
              result = v28;
              *(_QWORD *)&v28 = 0;
              if (result)
                result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
            }
          }
        }
      }
      else
      {
        v12 = v27;
        if (v27 == 1)
        {
          v21 = ": not 32 bit LE ELF";
          v24 = 259;
        }
        else if ((_BYTE)v27)
        {
          if (HIBYTE(v27) != 1)
            v12 = 2;
          v15 = &v25;
          if (HIBYTE(v27) == 1)
            v15 = (const char **)v25;
          v21 = (const char *)v15;
          v22 = v26;
          v23 = ": not 32 bit LE ELF";
          LOBYTE(v24) = v12;
          HIBYTE(v24) = 3;
        }
        else
        {
          v24 = 256;
        }
        v16 = operator new();
        v17 = sub_21AB908BC();
        result = sub_21AB91AE8(v16, (uint64_t)&v21, 3, v17);
        *a2 = v16;
      }
    }
    if ((v31 & 1) == 0)
    {
      result = v30[0];
      v30[0] = 0;
      if (result)
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

void sub_21AB893E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  if ((*(_BYTE *)(v2 - 56) & 1) != 0)
  {
    v4 = *(_QWORD *)(v2 - 72);
    *(_QWORD *)(v2 - 72) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if ((*(_BYTE *)(v2 - 32) & 1) == 0)
  {
    v5 = *(_QWORD *)(v2 - 48);
    *(_QWORD *)(v2 - 48) = 0;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

BOOL sub_21AB894C4(const void ***a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v5[32];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  sub_21AB89570(*a1, a2, &v8);
  v2 = v8;
  if (v8)
  {
    v7 = v8;
    v8 = 0;
    v3 = sub_21AB96B64();
    v6 = 257;
    sub_21AB91500(&v7, (uint64_t)v3, v5);
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  return v2 == 0;
}

void sub_21AB89548(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 32);
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  sub_21AB97D98((uint64_t *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_21AB89570(const void **a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  size_t v11;
  void ***v12;
  void ***v13;
  size_t v14;
  size_t v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  size_t v22;
  void ***p_dst;
  char v24;
  uint64_t v25;
  void *v26;
  size_t v27;
  void ***v28;
  void ***v29;
  void ***v30;
  size_t v31;
  size_t v32;
  char v33;
  char v34;
  size_t v35;
  size_t v36;
  char v37;
  int v38;
  size_t v39;
  unint64_t v40;
  void *p_p;
  uint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  int v60;
  size_t v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  const void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  void *__p;
  size_t v71;
  unint64_t v72;
  void **__dst;
  size_t v74;
  int64_t v75;
  size_t v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  void *v81;
  size_t v82;
  unint64_t v83;
  void *__src;
  size_t __len;
  char v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)a1 + 48))
  {
    __dst = (void **)"call .open() before trying to .load()";
    v77 = 259;
    v50 = operator new();
    v51 = sub_21AB908BC();
    sub_21AB91AE8(v50, (uint64_t)&__dst, 3, v51);
    *a3 = v50;
    return;
  }
  v6 = a1 + 4;
  (**(void (***)(uint64_t))a2)(a2);
  sub_21AB8A444(v6, (uint64_t)&v87);
  if ((v89 & 1) != 0)
  {
    v52 = 0;
    v53 = v87;
    v87 = 0;
    *a3 = v53;
    if ((v89 & 1) != 0)
      goto LABEL_113;
    goto LABEL_115;
  }
  if (!v88)
  {
LABEL_105:
    v52 = 1;
    if ((v89 & 1) != 0)
      goto LABEL_113;
    goto LABEL_115;
  }
  v7 = v87;
  v8 = v87 + 40 * v88;
  v69 = a3;
  while (1)
  {
    __dst = (void **)sub_21AB8A7E0;
    sub_21AB8A63C(v6, (unsigned int *)v7, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_21AB8C814, (uint64_t)&__dst, (uint64_t)&__src);
    if ((v86 & 1) != 0)
    {
      v54 = __src;
      __src = 0;
LABEL_108:
      *a3 = (uint64_t)v54;
      goto LABEL_109;
    }
    if ((*(_BYTE *)(v7 + 8) & 2) == 0)
      goto LABEL_99;
    v9 = *(_DWORD *)(v7 + 4);
    if (v9 == 8)
      break;
LABEL_26:
    if (v9 != 1)
      goto LABEL_99;
    sub_21AB8C820(v6, v7, (uint64_t)&v81);
    if ((v83 & 1) != 0)
    {
      v54 = v81;
      goto LABEL_108;
    }
    sub_21AB8A868(v6, (uint64_t)&v78);
    if ((v80 & 1) != 0)
    {
      v24 = 0;
      v25 = v78;
      v78 = 0;
      *a3 = v25;
      if ((v80 & 1) == 0)
        goto LABEL_95;
      goto LABEL_93;
    }
    v17 = *(_DWORD *)(v7 + 12);
    if (v79)
    {
      v18 = 0;
      while (1)
      {
        if (*(_DWORD *)(v78 + v18) == 1 && *(_DWORD *)(v78 + v18 + 4) == *(_DWORD *)(v7 + 16))
        {
          v19 = *(_DWORD *)(v78 + v18 + 8);
          if (v17 >= v19 && *(_DWORD *)(v78 + v18 + 20) + v19 > v17)
            break;
        }
        v18 += 32;
        if (32 * v79 == v18)
          goto LABEL_37;
      }
      v17 = v17 - v19 + *(_DWORD *)(v78 + v18 + 12);
    }
LABEL_37:
    v20 = v17;
    if ((*(_BYTE *)(v7 + 8) & 4) == 0)
    {
      v21 = __src;
      if (__src)
      {
        v22 = __len;
        if (__len > 0x7FFFFFFFFFFFFFF7)
          sub_21AB84068();
        if (__len >= 0x17)
        {
          v31 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((__len | 7) != 0x17)
            v31 = __len | 7;
          v32 = v31 + 1;
          p_dst = (void ***)operator new(v31 + 1);
          v74 = v22;
          v75 = v32 | 0x8000000000000000;
          __dst = (void **)p_dst;
        }
        else
        {
          HIBYTE(v75) = __len;
          p_dst = &__dst;
          if (!__len)
          {
LABEL_56:
            *((_BYTE *)p_dst + v22) = 0;
            if (v75 >= 0)
              v29 = &__dst;
            else
              v29 = (void ***)__dst;
            a3 = v69;
LABEL_60:
            v33 = (*(uint64_t (**)(uint64_t, void ***, _QWORD, size_t, void *, uint64_t))(*(_QWORD *)a2 + 8))(a2, v29, *(unsigned int *)(v7 + 12), v82, v81, v20);
            v34 = v33;
            if (SHIBYTE(v75) < 0)
            {
              operator delete(__dst);
              if ((v34 & 1) != 0)
                goto LABEL_62;
            }
            else if ((v33 & 1) != 0)
            {
              goto LABEL_62;
            }
            goto LABEL_77;
          }
        }
        memmove(p_dst, v21, v22);
        goto LABEL_56;
      }
      __dst = 0;
      v74 = 0;
      v29 = &__dst;
      v75 = 0;
      goto LABEL_60;
    }
    v26 = __src;
    if (!__src)
    {
      __dst = 0;
      v74 = 0;
      v30 = &__dst;
      v75 = 0;
      goto LABEL_74;
    }
    v27 = __len;
    if (__len > 0x7FFFFFFFFFFFFFF7)
      sub_21AB84068();
    if (__len >= 0x17)
    {
      v35 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17)
        v35 = __len | 7;
      v36 = v35 + 1;
      v28 = (void ***)operator new(v35 + 1);
      v74 = v27;
      v75 = v36 | 0x8000000000000000;
      __dst = (void **)v28;
    }
    else
    {
      HIBYTE(v75) = __len;
      v28 = &__dst;
      if (!__len)
        goto LABEL_70;
    }
    memmove(v28, v26, v27);
LABEL_70:
    *((_BYTE *)v28 + v27) = 0;
    if (v75 >= 0)
      v30 = &__dst;
    else
      v30 = (void ***)__dst;
    a3 = v69;
LABEL_74:
    v37 = (*(uint64_t (**)(uint64_t, void ***, _QWORD, size_t, void *, uint64_t))(*(_QWORD *)a2 + 16))(a2, v30, *(unsigned int *)(v7 + 12), v82, v81, v20);
    if (SHIBYTE(v75) < 0)
      operator delete(__dst);
    if ((v37 & 1) != 0)
    {
LABEL_62:
      v24 = 1;
      if ((v80 & 1) == 0)
        goto LABEL_95;
LABEL_93:
      v47 = v78;
      v78 = 0;
      if (v47)
        (*(void (**)(uint64_t))(*(_QWORD *)v47 + 8))(v47);
      goto LABEL_95;
    }
LABEL_77:
    v38 = *((char *)a1 + 23);
    if (v38 >= 0)
      v39 = *((unsigned __int8 *)a1 + 23);
    else
      v39 = (size_t)a1[1];
    v40 = v39 + 24;
    if (v39 + 24 > 0x7FFFFFFFFFFFFFF7)
      sub_21AB84068();
    if (v40 <= 0x16)
    {
      v71 = 0;
      v72 = 0;
      __p = 0;
      p_p = &__p;
      HIBYTE(v72) = v39 + 24;
LABEL_86:
      if (v38 >= 0)
        v44 = a1;
      else
        v44 = *a1;
      memmove(p_p, v44, v39);
      goto LABEL_90;
    }
    v42 = (v40 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v40 | 7) != 0x17)
      v42 = v40 | 7;
    v43 = v42 + 1;
    p_p = operator new(v42 + 1);
    v71 = v39 + 24;
    v72 = v43 | 0x8000000000000000;
    __p = p_p;
    if (v39)
      goto LABEL_86;
LABEL_90:
    strcpy((char *)p_p + v39, ": error loading section ");
    __dst = &__p;
    v75 = (int64_t)__src;
    v76 = __len;
    v77 = 1284;
    a3 = v69;
    v45 = operator new();
    v46 = sub_21AB908BC();
    sub_21AB91AE8(v45, (uint64_t)&__dst, 3, v46);
    *v69 = v45;
    if (SHIBYTE(v72) < 0)
      operator delete(__p);
    v24 = 0;
    if ((v80 & 1) != 0)
      goto LABEL_93;
LABEL_95:
    if ((v83 & 1) != 0)
    {
      v48 = v81;
      v81 = 0;
      if (v48)
        (*(void (**)(void *))(*(_QWORD *)v48 + 8))(v48);
    }
    if ((v24 & 1) == 0)
      goto LABEL_109;
LABEL_99:
    if ((v86 & 1) != 0)
    {
      v49 = __src;
      __src = 0;
      if (v49)
        (*(void (**)(void *))(*(_QWORD *)v49 + 8))(v49);
    }
    v7 += 40;
    if (v7 == v8)
      goto LABEL_105;
  }
  v10 = __src;
  if (!__src)
  {
    __dst = 0;
    v74 = 0;
    v13 = &__dst;
    v75 = 0;
    goto LABEL_22;
  }
  v11 = __len;
  if (__len > 0x7FFFFFFFFFFFFFF7)
    sub_21AB84068();
  if (__len >= 0x17)
  {
    v14 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v14 = __len | 7;
    v15 = v14 + 1;
    v12 = (void ***)operator new(v14 + 1);
    v74 = v11;
    v75 = v15 | 0x8000000000000000;
    __dst = (void **)v12;
    a3 = v69;
    goto LABEL_18;
  }
  HIBYTE(v75) = __len;
  v12 = &__dst;
  if (__len)
LABEL_18:
    memmove(v12, v10, v11);
  *((_BYTE *)v12 + v11) = 0;
  if (v75 >= 0)
    v13 = &__dst;
  else
    v13 = (void ***)__dst;
LABEL_22:
  v16 = (*(uint64_t (**)(uint64_t, void ***, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(a2, v13, *(unsigned int *)(v7 + 12), *(unsigned int *)(v7 + 20));
  if (SHIBYTE(v75) < 0)
    operator delete(__dst);
  if ((v16 & 1) != 0)
  {
    v9 = *(_DWORD *)(v7 + 4);
    goto LABEL_26;
  }
  v60 = *((char *)a1 + 23);
  if (v60 >= 0)
    v61 = *((unsigned __int8 *)a1 + 23);
  else
    v61 = (size_t)a1[1];
  v62 = v61 + 24;
  if (v61 + 24 > 0x7FFFFFFFFFFFFFF7)
    sub_21AB84068();
  if (v62 <= 0x16)
  {
    v82 = 0;
    v83 = 0;
    v81 = 0;
    v63 = &v81;
    HIBYTE(v83) = v61 + 24;
    goto LABEL_134;
  }
  v64 = (v62 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v62 | 7) != 0x17)
    v64 = v62 | 7;
  v65 = v64 + 1;
  v63 = operator new(v64 + 1);
  v82 = v61 + 24;
  v83 = v65 | 0x8000000000000000;
  v81 = v63;
  if (v61)
  {
LABEL_134:
    if (v60 >= 0)
      v66 = a1;
    else
      v66 = *a1;
    memmove(v63, v66, v61);
  }
  strcpy((char *)v63 + v61, ": error loading section ");
  __dst = &v81;
  v75 = (int64_t)__src;
  v76 = __len;
  v77 = 1284;
  v67 = operator new();
  v68 = sub_21AB908BC();
  sub_21AB91AE8(v67, (uint64_t)&__dst, 3, v68);
  *a3 = v67;
  if (SHIBYTE(v83) < 0)
    operator delete(v81);
LABEL_109:
  if ((v86 & 1) != 0)
  {
    v55 = __src;
    __src = 0;
    if (v55)
      (*(void (**)(void *))(*(_QWORD *)v55 + 8))(v55);
  }
  v52 = 0;
  if ((v89 & 1) != 0)
  {
LABEL_113:
    v56 = v87;
    v87 = 0;
    if (v56)
      (*(void (**)(uint64_t))(*(_QWORD *)v56 + 8))(v56);
  }
LABEL_115:
  if (v52)
  {
    v57 = *(unsigned int *)(*v6 + 36);
    if ((_DWORD)v57 != 1 && (_DWORD)v57 != 2)
    {
      v58 = sub_21AB96B64();
      v59 = (void *)v58[4];
      if (v58[3] - (_QWORD)v59 > 0x60uLL)
      {
        qmemcpy(v59, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 97);
        v58[4] += 97;
      }
      else
      {
        sub_21AB95F84((uint64_t)v58, "Warning: running old, un-versioned binary on new simulator. Defaulting to simulator LACC V1 ISA.\n", 0x61uLL);
      }
      v57 = 1;
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 56))(a2, v57);
    *a3 = 0;
  }
}

void sub_21AB89E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *__p,uint64_t a29,char a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;

  MEMORY[0x220752450](v35, 0x10F3C401C2224D9);
  if (SHIBYTE(a31) < 0)
    operator delete(__p);
  if ((a34 & 1) != 0 && a32)
    (*(void (**)(uint64_t))(*(_QWORD *)a32 + 8))(a32);
  if ((*(_BYTE *)(v36 - 104) & 1) != 0)
  {
    v38 = *(_QWORD *)(v36 - 120);
    *(_QWORD *)(v36 - 120) = 0;
    if (v38)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
      _Unwind_Resume(a1);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21AB8A018(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 32) + 36);
}

uint64_t sub_21AB8A028(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)a1 + 48))
    return 0;
  sub_21AB8A868((_QWORD *)(*(_QWORD *)a1 + 32), (uint64_t)&v5);
  v1 = v5;
  if ((v7 & 1) != 0)
  {
    v5 = 0;
    if (v1)
      (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
    return 0;
  }
  if (!v6)
    return 0;
  result = 0;
  v3 = (_BYTE *)(v5 + 24);
  v4 = 32 * v6;
  do
  {
    if (*((_DWORD *)v3 - 6) == 1 && (*v3 & 1) != 0)
      result += *((unsigned int *)v3 - 1);
    v3 += 32;
    v4 -= 32;
  }
  while (v4);
  return result;
}

uint64_t sub_21AB8A0F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  void *v5;
  unsigned __int8 v6[32];
  __int16 v7;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  unsigned int v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_21AB8CCB4(v3, (uint64_t)v9, (uint64_t)&v10);
  if ((v12 & 1) == 0)
    return v11;
  v8 = v10;
  v5 = sub_21AB96B64();
  v7 = 257;
  sub_21AB91500(&v8, (uint64_t)v5, v6);
  result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_21AB8A1DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a14 + 8))(a14);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB8A208(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  void *v5;
  unsigned __int8 v6[32];
  __int16 v7;
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v9[0] = a2;
  v9[1] = a3;
  sub_21AB8CCB4(v3, (uint64_t)v9, (uint64_t)&v10);
  if ((v11 & 1) == 0)
    return HIDWORD(v10);
  v8 = v10;
  v5 = sub_21AB96B64();
  v7 = 257;
  sub_21AB91500(&v8, (uint64_t)v5, v6);
  result = v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    return 0;
  }
  return result;
}

void sub_21AB8A2F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a14)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a14 + 8))(a14);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB8A31C@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[4];
  __int16 v9;
  _QWORD v10[4];
  __int16 v11;
  _QWORD v12[4];
  __int16 v13;
  _QWORD v14[4];
  __int16 v15;

  if (a2 > 0x33)
  {
    *(_BYTE *)(a3 + 16) &= ~1u;
    *(_QWORD *)a3 = result;
    *(_QWORD *)(a3 + 8) = a2;
  }
  else
  {
    v7 = a2;
    v8[0] = "invalid buffer: the size (";
    v8[2] = &v7;
    v9 = 2563;
    v10[0] = v8;
    v10[2] = ") is smaller than an ELF header (";
    v11 = 770;
    v6 = 52;
    v12[0] = v10;
    v12[2] = &v6;
    v13 = 2562;
    v14[0] = v12;
    v14[2] = ")";
    v15 = 770;
    v4 = operator new();
    v5 = sub_21AB908BC();
    result = sub_21AB91AE8(v4, (uint64_t)v14, 3, v5);
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v4;
  }
  return result;
}

void sub_21AB8A41C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

_QWORD *sub_21AB8A444@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t *v16;
  __int16 v17;

  v3 = *result;
  v4 = *(unsigned int *)(*result + 32);
  if (!(_DWORD)v4)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) &= ~1u;
    return result;
  }
  v5 = (uint64_t *)*(unsigned __int16 *)(v3 + 46);
  if (v5 != (uint64_t *)40)
  {
    v15[0] = "invalid e_shentsize in ELF header: ";
    v16 = v5;
    v17 = 2307;
    v8 = operator new();
    v10 = sub_21AB908BC();
    result = (_QWORD *)sub_21AB91AE8(v8, (uint64_t)v15, 3, v10);
    goto LABEL_14;
  }
  v6 = result[1];
  if (v4 > 0xFFFFFFD7 || v4 + 40 > v6)
  {
    v14 = *(unsigned int *)(*result + 32);
    v15[0] = "section header table goes past the end of the file: e_shoff = 0x";
    v16 = &v14;
    v17 = 3587;
    v8 = operator new();
    v9 = sub_21AB908BC();
    result = (_QWORD *)sub_21AB91AE8(v8, (uint64_t)v15, 3, v9);
LABEL_14:
    *(_BYTE *)(a2 + 16) |= 1u;
    *(_QWORD *)a2 = v8;
    return result;
  }
  v11 = v3 + v4;
  v12 = *(unsigned __int16 *)(v3 + 48);
  if (v12)
  {
    if (v4 + 40 * (unint64_t)v12 > v6)
    {
LABEL_13:
      v15[0] = "section table goes past the end of file";
      v17 = 259;
      v8 = operator new();
      v13 = sub_21AB908BC();
      result = (_QWORD *)sub_21AB91AE8(v8, (uint64_t)v15, 3, v13);
      goto LABEL_14;
    }
  }
  else
  {
    v12 = *(_DWORD *)(v11 + 20);
    if (v4 + 40 * (unint64_t)v12 > v6)
      goto LABEL_13;
  }
  *(_BYTE *)(a2 + 16) &= ~1u;
  *(_QWORD *)a2 = v11;
  *(_QWORD *)(a2 + 8) = v12;
  return result;
}

void sub_21AB8A604(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_21AB8A63C(_QWORD *a1@<X0>, unsigned int *a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[2];
  char v15;
  uint64_t v16[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  sub_21AB8A444(a1, (uint64_t)v16);
  if ((v17 & 1) != 0)
  {
    v12 = v16[0];
    v16[0] = 0;
    *(_BYTE *)(a5 + 16) |= 1u;
    *(_QWORD *)a5 = v12;
    v16[0] = 0;
  }
  else
  {
    sub_21AB8AA58(a1, v16[0], v16[1], a3, a4, (uint64_t)v14);
    if ((v15 & 1) != 0)
    {
      v13 = v14[0];
      v14[0] = 0;
      *(_BYTE *)(a5 + 16) |= 1u;
      *(_QWORD *)a5 = v13;
      v14[0] = 0;
    }
    else
    {
      sub_21AB8ABEC(a1, a2, v14[0], v14[1], a5);
      if ((v15 & 1) != 0)
      {
        v10 = v14[0];
        v14[0] = 0;
        if (v10)
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
    }
    if ((v17 & 1) != 0)
    {
      v11 = v16[0];
      v16[0] = 0;
      if (v11)
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    }
  }
}

void sub_21AB8A780(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((a12 & 1) != 0 && a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if ((a15 & 1) != 0)
  {
    if (a13)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)a13 + 8))(a13);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB8A7E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = operator new();
  v5 = sub_21AB908BC();
  result = sub_21AB91AE8(v4, a1, 3, v5);
  *a2 = v4;
  return result;
}

void sub_21AB8A840(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

_QWORD *sub_21AB8A868@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v13[4];
  __int16 v14;
  _QWORD v15[4];
  __int16 v16;
  _QWORD v17[4];
  __int16 v18;
  _QWORD v19[4];
  __int16 v20;
  _QWORD v21[4];
  __int16 v22;
  _QWORD v23[4];
  __int16 v24;
  _QWORD v25[2];
  uint64_t v26;
  __int16 v27;

  v3 = *result;
  v4 = *(unsigned __int16 *)(*result + 44);
  if (*(_WORD *)(*result + 44))
  {
    v5 = *(unsigned __int16 *)(v3 + 42);
    if (v5 != 32)
    {
      v25[0] = "invalid e_phentsize: ";
      v26 = v5;
      v27 = 2307;
      v6 = operator new();
      v7 = sub_21AB908BC();
      result = (_QWORD *)sub_21AB91AE8(v6, (uint64_t)v25, 3, v7);
LABEL_7:
      *(_BYTE *)(a2 + 16) |= 1u;
      *(_QWORD *)a2 = v6;
      return result;
    }
  }
  else
  {
    v5 = *(unsigned __int16 *)(v3 + 42);
  }
  v8 = *(unsigned int *)(v3 + 28);
  v9 = result[1];
  if (v8 + v5 * (unint64_t)*(unsigned __int16 *)(*result + 44) > v9)
  {
    v11 = *(unsigned int *)(v3 + 28);
    v12 = v9;
    v13[0] = "program headers are longer than binary of size ";
    v13[2] = &v12;
    v14 = 2563;
    v15[0] = v13;
    v15[2] = ": e_phoff = 0x";
    v16 = 770;
    v17[0] = v15;
    v17[2] = &v11;
    v18 = 3586;
    v19[0] = v17;
    v19[2] = ", e_phnum = ";
    v20 = 770;
    v21[0] = v19;
    v21[2] = v4;
    v22 = 2306;
    v23[0] = v21;
    v23[2] = ", e_phentsize = ";
    v24 = 770;
    v25[0] = v23;
    v26 = v5;
    v27 = 2306;
    v6 = operator new();
    v10 = sub_21AB908BC();
    result = (_QWORD *)sub_21AB91AE8(v6, (uint64_t)v25, 3, v10);
    goto LABEL_7;
  }
  *(_BYTE *)(a2 + 16) &= ~1u;
  *(_QWORD *)a2 = v3 + v8;
  *(_QWORD *)(a2 + 8) = v4;
  return result;
}

void sub_21AB8AA28(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_21AB8AA58(_QWORD *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void (*a4)(uint64_t *__return_ptr, uint64_t, void ***)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int16 v12;
  _QWORD v13[4];
  __int16 v14;

  v7 = *(unsigned __int16 *)(*a1 + 50);
  if (v7 != 0xFFFF)
  {
    if (*(_WORD *)(*a1 + 50))
    {
LABEL_3:
      if (a3 > v7)
      {
        sub_21AB8AE20(a1, a2 + 40 * v7, a4, a5, a6);
        return;
      }
      v11[0] = "section header string table index ";
      v11[2] = v7;
      v12 = 2051;
      v13[0] = v11;
      v13[2] = " does not exist";
      v14 = 770;
      v8 = operator new();
      v9 = sub_21AB908BC();
      sub_21AB91AE8(v8, (uint64_t)v13, 3, v9);
      goto LABEL_10;
    }
LABEL_7:
    *(_BYTE *)(a6 + 16) &= ~1u;
    *(_QWORD *)a6 = "";
    *(_QWORD *)(a6 + 8) = 0;
    return;
  }
  if (a3)
  {
    v7 = *(_DWORD *)(a2 + 24);
    if (v7)
      goto LABEL_3;
    goto LABEL_7;
  }
  v13[0] = "e_shstrndx == SHN_XINDEX, but the section header table is empty";
  v14 = 259;
  v8 = operator new();
  v10 = sub_21AB908BC();
  sub_21AB91AE8(v8, (uint64_t)v13, 3, v10);
LABEL_10:
  *(_BYTE *)(a6 + 16) |= 1u;
  *(_QWORD *)a6 = v8;
}

void sub_21AB8ABBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_21AB8ABEC(_QWORD *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v6;
  const char *v7;
  size_t v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  std::string v16;
  std::string v17;
  void *__p[2];
  std::string::size_type v19;
  _QWORD v20[4];
  __int16 v21;
  _QWORD v22[4];
  __int16 v23;

  v6 = *a2;
  if (!(_DWORD)v6)
  {
    *(_QWORD *)a5 = 0;
    *(_QWORD *)(a5 + 8) = 0;
    *(_BYTE *)(a5 + 16) &= ~1u;
    return;
  }
  if (a4 > v6)
  {
    v7 = (const char *)(a3 + v6);
    v8 = strlen(v7);
    *(_BYTE *)(a5 + 16) &= ~1u;
    *(_QWORD *)a5 = v7;
    *(_QWORD *)(a5 + 8) = v8;
    return;
  }
  sub_21AB8B3B0(a1, (uint64_t)a2, (char *)&v16);
  v9 = std::string::insert(&v16, 0, "a section ");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v17, " has an invalid sh_name (0x");
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  v15 = v6;
  v20[0] = __p;
  v20[2] = &v15;
  v21 = 3588;
  v22[0] = v20;
  v22[2] = ") offset which goes past the end of the section name string table";
  v23 = 770;
  v13 = operator new();
  v14 = sub_21AB908BC();
  sub_21AB91AE8(v13, (uint64_t)v22, 3, v14);
  *(_BYTE *)(a5 + 16) |= 1u;
  *(_QWORD *)a5 = v13;
  if (SHIBYTE(v19) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_8:
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_12;
      return;
    }
  }
  else if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_8;
  }
  operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
LABEL_12:
    operator delete(v16.__r_.__value_.__l.__data_);
}

void sub_21AB8AD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  MEMORY[0x220752450](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
LABEL_4:
    _Unwind_Resume(a1);
LABEL_7:
  operator delete(a10);
  _Unwind_Resume(a1);
}

void sub_21AB8AE20(_QWORD *a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t *__return_ptr, uint64_t, void ***)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  std::string *v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;
  char v16;
  void ***v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  __int128 v30;
  uint64_t v31;
  void **v32;
  std::string v33;
  std::string v34;
  void *__p[2];
  std::string::size_type v36;
  void **v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  void **v43;
  uint64_t v44;
  char v45;
  __int16 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a2 + 4) == 3)
    goto LABEL_19;
  sub_21AB8B3B0(a1, a2, (char *)&v33);
  v10 = std::string::insert(&v33, 0, "invalid sh_type for string table section ");
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v34.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v34, ": expected SHT_STRTAB, but got ");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v36 = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  v46 = 260;
  v43 = __p;
  v14 = sub_21AB9045C(*(unsigned __int16 *)(*a1 + 18), *(_DWORD *)(a2 + 4));
  v16 = v46;
  if (v46 == 1)
  {
    v37 = (void **)v14;
    v38 = v15;
    v41 = 261;
  }
  else if ((_BYTE)v46)
  {
    if (HIBYTE(v46) != 1)
      v16 = 2;
    v17 = &v43;
    if (HIBYTE(v46) == 1)
      v17 = (void ***)v43;
    v37 = (void **)v17;
    v38 = v44;
    v39 = v14;
    v40 = v15;
    LOBYTE(v41) = v16;
    HIBYTE(v41) = 5;
  }
  else
  {
    v41 = 256;
  }
  a3(&v42, a4, &v37);
  if (SHIBYTE(v36) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_13:
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_14;
LABEL_18:
      operator delete(v33.__r_.__value_.__l.__data_);
      v18 = v42;
      if (v42)
        goto LABEL_15;
      goto LABEL_19;
    }
  }
  else if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(v34.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_18;
LABEL_14:
  v18 = v42;
  if (v42)
  {
LABEL_15:
    *(_BYTE *)(a5 + 16) |= 1u;
    *(_QWORD *)a5 = v18;
    return;
  }
LABEL_19:
  sub_21AB8B5C0(a1, a2, (uint64_t)&v43);
  v19 = v43;
  if ((v45 & 1) != 0)
  {
    v43 = 0;
    *(_BYTE *)(a5 + 16) |= 1u;
    *(_QWORD *)a5 = v19;
    if ((v45 & 1) == 0)
      return;
  }
  else
  {
    v20 = v44;
    if (!v44)
    {
      sub_21AB8B3B0(a1, a2, (char *)&v33);
      v27 = std::string::insert(&v33, 0, "SHT_STRTAB string table section ");
      v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
      v34.__r_.__value_.__r.__words[2] = v27->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v28;
      v27->__r_.__value_.__l.__size_ = 0;
      v27->__r_.__value_.__r.__words[2] = 0;
      v27->__r_.__value_.__r.__words[0] = 0;
      v29 = std::string::append(&v34, " is empty");
      v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
      v36 = v29->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v30;
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      v41 = 260;
      v37 = __p;
      v25 = operator new();
      v31 = sub_21AB908BC();
      sub_21AB91AE8(v25, (uint64_t)&v37, 3, v31);
LABEL_26:
      *(_BYTE *)(a5 + 16) |= 1u;
      *(_QWORD *)a5 = v25;
      if (SHIBYTE(v36) < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_28:
          if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_29;
          goto LABEL_35;
        }
      }
      else if ((SHIBYTE(v34.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_28;
      }
      operator delete(v34.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_29:
        if ((v45 & 1) == 0)
          return;
        goto LABEL_30;
      }
LABEL_35:
      operator delete(v33.__r_.__value_.__l.__data_);
      if ((v45 & 1) == 0)
        return;
      goto LABEL_30;
    }
    if (*((_BYTE *)v43 + v44 - 1))
    {
      sub_21AB8B3B0(a1, a2, (char *)&v33);
      v21 = std::string::insert(&v33, 0, "SHT_STRTAB string table section ");
      v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v34.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      v23 = std::string::append(&v34, " is non-null terminated");
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v36 = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      v41 = 260;
      v37 = __p;
      v25 = operator new();
      v26 = sub_21AB908BC();
      sub_21AB91AE8(v25, (uint64_t)&v37, 3, v26);
      goto LABEL_26;
    }
    *(_BYTE *)(a5 + 16) &= ~1u;
    *(_QWORD *)a5 = v19;
    *(_QWORD *)(a5 + 8) = v20;
    if ((v45 & 1) == 0)
      return;
  }
LABEL_30:
  v32 = v43;
  v43 = 0;
  if (v32)
    (*((void (**)(void **))*v32 + 1))(v32);
}

void sub_21AB8B22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;

  MEMORY[0x220752450](v28, 0x10F3C401C2224D9);
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)(v29 - 80) & 1) == 0)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_8:
  operator delete(a10);
  if ((*(_BYTE *)(v29 - 80) & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v31 = *(_QWORD *)(v29 - 96);
  *(_QWORD *)(v29 - 96) = 0;
  if (v31)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
    _Unwind_Resume(a1);
  }
LABEL_11:
  _Unwind_Resume(a1);
}

void sub_21AB8B3B0(_QWORD *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  std::string *v5;
  __int128 v6;
  std::string *v7;
  std::string::size_type v8;
  std::string::size_type v9;
  std::string v10;
  std::string v11;
  std::string::size_type v12[2];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sub_21AB8A444(a1, (uint64_t)v12);
  if ((v13 & 1) == 0)
  {
    std::to_string(&v10, 0xCCCCCCCCCCCCCCCDLL * ((int64_t)(a2 - v12[0]) >> 3));
    v5 = std::string::insert(&v10, 0, "[index ");
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v11.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    v7 = std::string::append(&v11, "]");
    *(std::string *)a3 = *v7;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_4:
        if ((v13 & 1) == 0)
          return;
        goto LABEL_12;
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v13 & 1) == 0)
      return;
LABEL_12:
    v9 = v12[0];
    v12[0] = 0;
    if (v9)
      (*(void (**)(std::string::size_type))(*(_QWORD *)v9 + 8))(v9);
    return;
  }
  v8 = v12[0];
  v12[0] = 0;
  v10.__r_.__value_.__r.__words[0] = v8;
  sub_21AB8BA54(&v10, (uint64_t *)&v11);
  if (v10.__r_.__value_.__r.__words[0])
    (*(void (**)(std::string::size_type))(*(_QWORD *)v10.__r_.__value_.__l.__data_ + 8))(v10.__r_.__value_.__r.__words[0]);
  a3[23] = 15;
  strcpy(a3, "[unknown index]");
  if ((v13 & 1) != 0)
    goto LABEL_12;
}

void sub_21AB8B53C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v23;

  if (a10)
    (*(void (**)(void *))(*(_QWORD *)a10 + 8))(a10);
  if ((*(_BYTE *)(v21 - 32) & 1) != 0)
  {
    v23 = *(_QWORD *)(v21 - 48);
    *(_QWORD *)(v21 - 48) = 0;
    if (v23)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21AB8B5C0(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::string::size_type v5;
  std::string::size_type v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  std::string::size_type v19;
  void *v20;
  uint64_t v21;
  std::string::size_type v22;
  std::string::size_type v23;
  std::string v24;
  std::string v25;
  std::string v26;
  __int16 v27;
  void *__p[2];
  const char *v29;
  __int16 v30;
  std::string v31;
  _QWORD v32[2];
  std::string *v33;
  __int16 v34;
  _QWORD v35[2];
  const char *v36;
  __int16 v37;
  _QWORD v38[2];
  std::string *v39;
  __int16 v40;
  _QWORD v41[2];
  const char *v42;
  __int16 v43;

  v6 = *(unsigned int *)(a2 + 16);
  v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__((_DWORD)v6, (_DWORD)v5))
  {
    sub_21AB8B3B0(a1, a2, (char *)&v31);
    v7 = std::string::insert(&v31, 0, "section ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v26, " has a sh_offset (0x");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v29 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v25.__r_.__value_.__r.__words[0] = v6;
    v32[0] = __p;
    v33 = &v25;
    v34 = 3588;
    v35[0] = v32;
    v36 = ") + sh_size (0x";
    v37 = 770;
    v24.__r_.__value_.__r.__words[0] = v5;
    v38[0] = v35;
    v39 = &v24;
    v40 = 3586;
    v41[0] = v38;
    v42 = ") that cannot be represented";
    v43 = 770;
    v11 = operator new();
    v12 = sub_21AB908BC();
    sub_21AB91AE8(v11, (uint64_t)v41, 3, v12);
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v11;
    if (SHIBYTE(v29) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          return;
        goto LABEL_15;
      }
    }
    else if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_15:
    v20 = (void *)v31.__r_.__value_.__r.__words[0];
LABEL_20:
    operator delete(v20);
    return;
  }
  if (a1[1] >= (unint64_t)(v5 + v6))
  {
    v19 = *a1 + v6;
    *(_BYTE *)(a3 + 16) &= ~1u;
    *(_QWORD *)a3 = v19;
    *(_QWORD *)(a3 + 8) = v5;
    return;
  }
  sub_21AB8B3B0(a1, a2, (char *)&v24);
  v13 = std::string::insert(&v24, 0, "section ");
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  v15 = std::string::append(&v25, " has a sh_offset (0x");
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v22 = v5;
  v23 = v6;
  v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&v31;
  v26.__r_.__value_.__r.__words[2] = (std::string::size_type)&v23;
  v27 = 3588;
  __p[0] = &v26;
  v29 = ") + sh_size (0x";
  v30 = 770;
  v32[0] = __p;
  v33 = (std::string *)&v22;
  v34 = 3586;
  v35[0] = v32;
  v36 = ") that is greater than the file size (0x";
  v37 = 770;
  v21 = a1[1];
  v38[0] = v35;
  v39 = (std::string *)&v21;
  v40 = 3586;
  v41[0] = v38;
  v42 = ")";
  v43 = 770;
  v17 = operator new();
  v18 = sub_21AB908BC();
  sub_21AB91AE8(v17, (uint64_t)v41, 3, v18);
  *(_BYTE *)(a3 + 16) |= 1u;
  *(_QWORD *)a3 = v17;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v31.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_10:
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_19;
      return;
    }
  }
  else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(v25.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
  {
LABEL_19:
    v20 = (void *)v24.__r_.__value_.__r.__words[0];
    goto LABEL_20;
  }
}

void sub_21AB8B934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  uint64_t v48;

  MEMORY[0x220752450](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0)
LABEL_9:
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0)
    goto LABEL_9;
  goto LABEL_8;
}

_QWORD **sub_21AB8BA54@<X0>(_QWORD **result@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t **v4;
  uint64_t **v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *result;
  if (*result)
  {
    *result = 0;
    if ((*(unsigned int (**)(_QWORD *, void *))(*v3 + 48))(v3, &unk_255110171))
    {
      *a2 = 0;
      v4 = (uint64_t **)v3[1];
      v5 = (uint64_t **)v3[2];
      if (v4 != v5)
      {
        v6 = 0;
        do
        {
          v9 = v6;
          *a2 = 0;
          v7 = *v4;
          *v4 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v7 + 48))(v7, &unk_255110170))
          {
            (*(void (**)(uint64_t *))(*v7 + 8))(v7);
            v7 = 0;
          }
          v8 = v7;
          sub_21AB8BC7C(&v9, &v8, &v10);
          v6 = v10;
          *a2 = v10;
          v10 = 0;
          if (v8)
            (*(void (**)(uint64_t *))(*v8 + 8))(v8);
          if (v9)
            (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
          ++v4;
        }
        while (v4 != v5);
      }
      return (_QWORD **)(*(uint64_t (**)(_QWORD *))(*v3 + 8))(v3);
    }
    else
    {
      result = (_QWORD **)(*(uint64_t (**)(_QWORD *, void *))(*v3 + 48))(v3, &unk_255110170);
      if ((_DWORD)result)
      {
        *a2 = 0;
        return (_QWORD **)(*(uint64_t (**)(_QWORD *))(*v3 + 8))(v3);
      }
      else
      {
        *a2 = (uint64_t)v3;
      }
    }
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_21AB8BBF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_21AB8BC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v13;

  if (a10)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
    v13 = a11;
    if (!a11)
    {
LABEL_3:
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v13 = a11;
    if (!a11)
      goto LABEL_3;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Unwind_Resume(a1);
}

uint64_t *sub_21AB8BC7C@<X0>(uint64_t *a1@<X0>, uint64_t **a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *result;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  char **v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t **v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;

  result = (uint64_t *)*a1;
  v7 = *a2;
  if (!result)
  {
LABEL_18:
    *a3 = v7;
    *a2 = 0;
    return result;
  }
  if (!v7)
  {
    *a3 = result;
LABEL_33:
    *a1 = 0;
    return result;
  }
  if ((*(unsigned int (**)(uint64_t *, void *))(*result + 48))(result, &unk_255110171))
  {
    v8 = (uint64_t *)*a1;
    result = *a2;
    if (*a2)
    {
      result = (uint64_t *)(*(uint64_t (**)(uint64_t *, void *))(*result + 48))(result, &unk_255110171);
      v9 = *a2;
      if ((_DWORD)result)
      {
        *a2 = 0;
        v10 = (uint64_t *)v9[1];
        v11 = (uint64_t *)v9[2];
        if (v10 == v11)
          goto LABEL_31;
        result = (uint64_t *)v8[2];
        do
        {
          if ((unint64_t)result < v8[3])
          {
            v12 = *v10;
            *v10 = 0;
            *result++ = v12;
          }
          else
          {
            result = sub_21AB8C3F4(v8 + 1, v10);
          }
          v8[2] = (uint64_t)result;
          ++v10;
        }
        while (v10 != v11);
        if (v9)
LABEL_31:
          result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v9 + 8))(v9);
LABEL_32:
        *a3 = *a1;
        goto LABEL_33;
      }
    }
    else
    {
      v9 = 0;
    }
    v26 = v9;
    *a2 = 0;
    v20 = (uint64_t **)v8[2];
    if ((unint64_t)v20 >= v8[3])
    {
      v21 = sub_21AB8C3F4(v8 + 1, (uint64_t *)&v26);
      result = v26;
      v8[2] = (uint64_t)v21;
      v26 = 0;
      if (result)
        result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
    }
    else
    {
      *v20 = v9;
      v8[2] = (uint64_t)(v20 + 1);
    }
    goto LABEL_32;
  }
  if (*a2 && (*(unsigned int (**)(uint64_t *, void *))(**a2 + 48))(*a2, &unk_255110171))
  {
    v13 = (char **)(*a2 + 1);
    v14 = *v13;
    v26 = (uint64_t *)*a1;
    *a1 = 0;
    sub_21AB8BF88(v13, (uint64_t)v14, (uint64_t *)&v26);
    result = v26;
    v26 = 0;
    if (result)
      result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
    v7 = *a2;
    goto LABEL_18;
  }
  v15 = (_QWORD *)operator new();
  v16 = *a1;
  *a1 = 0;
  v17 = *a2;
  v24 = *a2;
  v25 = (uint64_t *)v16;
  *a2 = 0;
  *v15 = &unk_24DDB7920;
  v15[1] = 0;
  v15[2] = 0;
  v15[3] = 0;
  v18 = sub_21AB8C3F4(v15 + 1, (uint64_t *)&v25);
  v19 = v15[3];
  v15[2] = v18;
  if ((unint64_t)v18 >= v19)
  {
    v22 = sub_21AB8C3F4(v15 + 1, (uint64_t *)&v24);
    v23 = (uint64_t)v24;
    v15[2] = v22;
    *a3 = v15;
    v24 = 0;
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  }
  else
  {
    *v18 = v17;
    v15[2] = v18 + 1;
    *a3 = v15;
    v24 = 0;
  }
  result = v25;
  v25 = 0;
  if (result)
    return (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
  return result;
}

void sub_21AB8BF08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  if (a15)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a15 + 8))(a15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

char *sub_21AB8BF88(char **a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  _OWORD *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  _OWORD *v47;
  char *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  char *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v72;
  unint64_t v73;
  char *v74;
  char *v75;
  _QWORD *v76;

  v6 = *a1;
  v5 = (unint64_t)a1[1];
  v7 = a2 - (_QWORD)*a1;
  v8 = v7 >> 3;
  v9 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF8];
  v10 = (unint64_t)a1[2];
  if (v5 < v10)
  {
    if (v9 == (char *)v5)
    {
      v23 = *a3;
      *a3 = 0;
      *(_QWORD *)v9 = v23;
      a1[1] = v9 + 8;
      return v9;
    }
    v11 = v5 - (_QWORD)(v9 + 8);
    v12 = v11 >> 3;
    v13 = (uint64_t *)(v5 - 8);
    if (v5 < 8)
    {
      v18 = a1[1];
    }
    else
    {
      v14 = (v7 & 0xFFFFFFFFFFFFFFF8) + v11;
      v15 = (unint64_t)&v6[v14 + 8];
      if (v5 > v15)
        v15 = (unint64_t)a1[1];
      v16 = v15 + ~(unint64_t)v6 - v14;
      if (v16 >= 0xE8)
      {
        v56 = (unint64_t)v13 >= (v16 & 0xFFFFFFFFFFFFFFF8) + v5 + 8
           || v5 >= (unint64_t)&v6[v14 + 8 + (v16 & 0xFFFFFFFFFFFFFFF8)];
        v17 = (uint64_t *)(v5 - 8);
        v18 = a1[1];
        if (v56)
        {
          v57 = (v16 >> 3) + 1;
          v58 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          v17 = &v13[v58];
          v18 = (char *)(v5 + v58 * 8);
          v59 = (_OWORD *)(v5 + 16);
          v60 = &v6[8 * v12 + 16 + 8 * v8];
          v61 = v57 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v62 = *((_OWORD *)v60 - 1);
            v63 = *(_OWORD *)v60;
            *((_OWORD *)v60 - 1) = 0uLL;
            *(_OWORD *)v60 = 0uLL;
            *(v59 - 1) = v62;
            *v59 = v63;
            v59 += 2;
            v60 += 32;
            v61 -= 4;
          }
          while (v61);
          if (v57 == (v57 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_61;
        }
      }
      else
      {
        v17 = (uint64_t *)(v5 - 8);
        v18 = a1[1];
      }
      do
      {
        v64 = *v17;
        *v17++ = 0;
        *(_QWORD *)v18 = v64;
        v18 += 8;
      }
      while ((unint64_t)v17 < v5);
    }
LABEL_61:
    a1[1] = v18;
    if ((char *)v5 != v9 + 8)
    {
      v65 = 8 * v12;
      v66 = (uint64_t)&v6[8 * v8 - 8];
      do
      {
        v67 = *(_QWORD *)(v66 + v65);
        *(_QWORD *)(v66 + v65) = 0;
        v68 = *v13;
        *v13 = v67;
        if (v68)
          (*(void (**)(uint64_t))(*(_QWORD *)v68 + 8))(v68);
        --v13;
        v65 -= 8;
      }
      while (v65);
    }
    v69 = *a3;
    *a3 = 0;
    v70 = *(_QWORD *)v9;
    *(_QWORD *)v9 = v69;
    if (v70)
      (*(void (**)(uint64_t))(*(_QWORD *)v70 + 8))(v70);
    return v9;
  }
  v19 = ((uint64_t)(v5 - (_QWORD)v6) >> 3) + 1;
  if (v19 >> 61)
    sub_21AB808CC();
  v20 = v10 - (_QWORD)v6;
  if (v20 >> 2 > v19)
    v19 = v20 >> 2;
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
    v21 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v21 = v19;
  v76 = a1 + 2;
  if (v21)
  {
    if (v21 >> 61)
      sub_21AB80954();
    v22 = (char *)operator new(8 * v21);
  }
  else
  {
    v22 = 0;
  }
  v72 = v22;
  v73 = (unint64_t)&v22[8 * v8];
  v74 = (char *)v73;
  v75 = &v22[8 * v21];
  sub_21AB8C60C(&v72, a3);
  v24 = v73;
  v25 = *a1;
  v26 = v73;
  if (*a1 != v9)
  {
    v27 = &v6[v7 & 0xFFFFFFFFFFFFFFF8] - v25 - 8;
    v26 = v73;
    v28 = v9;
    if (v27 < 0x88)
      goto LABEL_74;
    v29 = (unint64_t)&v6[(v7 & 0xFFFFFFFFFFFFFFF8) - (v27 & 0xFFFFFFFFFFFFFFF8) - 8] >= v73
       || v73 - (v27 & 0xFFFFFFFFFFFFFFF8) - 8 >= (unint64_t)v9;
    v26 = v73;
    v28 = v9;
    if (!v29)
      goto LABEL_74;
    v30 = (v27 >> 3) + 1;
    v31 = 8 * (v30 & 0x3FFFFFFFFFFFFFFCLL);
    v26 = v73 - v31;
    v28 = &v9[-v31];
    v32 = &v6[8 * v8 - 16];
    v33 = (_OWORD *)(v73 - 16);
    v34 = v30 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v36 = *((_OWORD *)v32 - 1);
      v35 = *(_OWORD *)v32;
      *((_OWORD *)v32 - 1) = 0uLL;
      *(_OWORD *)v32 = 0uLL;
      *(v33 - 1) = v36;
      *v33 = v35;
      v32 -= 32;
      v33 -= 2;
      v34 -= 4;
    }
    while (v34);
    if (v30 != (v30 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_74:
      do
      {
        v37 = *((_QWORD *)v28 - 1);
        v28 -= 8;
        *(_QWORD *)v28 = 0;
        *(_QWORD *)(v26 - 8) = v37;
        v26 -= 8;
      }
      while (v28 != v25);
    }
  }
  v73 = v26;
  v38 = a1[1];
  v39 = v74;
  if (v38 != v9)
  {
    v40 = &v6[v7 & 0xFFFFFFFFFFFFFFF8];
    v41 = v38 - v40 - 8;
    if (v41 < 0x88)
      goto LABEL_40;
    v42 = (unint64_t)&v40[(v41 & 0xFFFFFFFFFFFFFFF8) + 8];
    if (v9 < &v74[(v41 & 0xFFFFFFFFFFFFFFF8) + 8] && (unint64_t)v74 < v42)
      goto LABEL_40;
    v44 = (v41 >> 3) + 1;
    v45 = 8 * (v44 & 0x3FFFFFFFFFFFFFFCLL);
    v9 += v45;
    v46 = &v74[v45];
    v47 = v74 + 16;
    v48 = &v6[8 * v8 + 16];
    v49 = v44 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v50 = *((_OWORD *)v48 - 1);
      v51 = *(_OWORD *)v48;
      *((_OWORD *)v48 - 1) = 0uLL;
      *(_OWORD *)v48 = 0uLL;
      *(v47 - 1) = v50;
      *v47 = v51;
      v47 += 2;
      v48 += 32;
      v49 -= 4;
    }
    while (v49);
    v39 = v46;
    if (v44 != (v44 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_40:
      v46 = v39;
      do
      {
        v52 = *(_QWORD *)v9;
        *(_QWORD *)v9 = 0;
        v9 += 8;
        *(_QWORD *)v46 = v52;
        v46 += 8;
      }
      while (v9 != v38);
    }
    v26 = v73;
    v9 = a1[1];
    v39 = v46;
  }
  v53 = *a1;
  *a1 = (char *)v26;
  a1[1] = v39;
  v54 = a1[2];
  a1[2] = v75;
  v74 = v9;
  v75 = v54;
  v72 = v53;
  v73 = (unint64_t)v53;
  if (v9 == v53)
  {
    if (!v9)
      return (char *)v24;
    goto LABEL_50;
  }
  do
  {
    v74 = v9 - 8;
    v55 = *((_QWORD *)v9 - 1);
    *((_QWORD *)v9 - 1) = 0;
    if (v55)
      (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
    v9 = v74;
  }
  while (v74 != v53);
  v9 = v72;
  if (v72)
LABEL_50:
    operator delete(v9);
  return (char *)v24;
}

void sub_21AB8C3E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB8C5A8((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *sub_21AB8C3F4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a1[1] - *a1;
  v4 = v3 >> 3;
  v5 = (v3 >> 3) + 1;
  if (v5 >> 61)
    sub_21AB808CC();
  v7 = a1[2] - *a1;
  if (v7 >> 2 > v5)
    v5 = v7 >> 2;
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8)
    v8 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v8 = v5;
  if (v8)
  {
    if (v8 >> 61)
      sub_21AB80954();
    v9 = (char *)operator new(8 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = &v9[8 * v4];
  v11 = &v9[8 * v8];
  v12 = *a2;
  *a2 = 0;
  *(_QWORD *)v10 = v12;
  v13 = v10 + 8;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v10;
    a1[1] = v13;
    a1[2] = v11;
    if (!v15)
      return v13;
    goto LABEL_26;
  }
  v16 = (unint64_t)&v15[-*a1 - 8];
  if (v16 < 0x78 || &v15[-(v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v10 && &v9[v3 - (v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v15)
    goto LABEL_34;
  v17 = (v16 >> 3) + 1;
  v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
  v10 -= v18;
  v19 = &v15[-v18];
  v20 = v15 - 16;
  v21 = &v9[8 * v4 - 16];
  v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v24 = *((_OWORD *)v20 - 1);
    v23 = *(_OWORD *)v20;
    *((_OWORD *)v20 - 1) = 0uLL;
    *(_OWORD *)v20 = 0uLL;
    *((_OWORD *)v21 - 1) = v24;
    *(_OWORD *)v21 = v23;
    v20 -= 32;
    v21 -= 32;
    v22 -= 4;
  }
  while (v22);
  v15 = v19;
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_34:
    do
    {
      v25 = *((_QWORD *)v15 - 1);
      v15 -= 8;
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v10 - 1) = v25;
      v10 -= 8;
    }
    while (v15 != v14);
  }
  v26 = (char *)*a1;
  v15 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v13;
  a1[2] = v11;
  if (v15 != v26)
  {
    do
    {
      v28 = *((_QWORD *)v15 - 1);
      v15 -= 8;
      v27 = v28;
      *(_QWORD *)v15 = 0;
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
    }
    while (v15 != v26);
    v15 = v26;
  }
  if (v15)
LABEL_26:
    operator delete(v15);
  return v13;
}

uint64_t sub_21AB8C5A8(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_21AB8C60C(char **a1, uint64_t *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  int64_t v19;
  char *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  __int128 *v30;
  char *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_24;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    if (v6 == v4)
    {
      v23 = &v6[-8 * v9];
    }
    else
    {
      do
      {
        v11 = *(_QWORD *)v6;
        *(_QWORD *)v6 = 0;
        v12 = *(_QWORD *)&v6[8 * v10];
        *(_QWORD *)&v6[8 * v10] = v11;
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
        v6 += 8;
      }
      while (v6 != v4);
      v4 = a1[1];
      v23 = &v6[8 * v10];
    }
    a1[1] = &v4[8 * v10];
    a1[2] = v23;
    v4 = v23;
    goto LABEL_24;
  }
  v13 = (v4 - v5) >> 2;
  if (v4 == v5)
    v13 = 1;
  if (v13 >> 61)
    sub_21AB80954();
  v14 = v13 >> 2;
  v15 = 8 * v13;
  v16 = (char *)operator new(8 * v13);
  v17 = &v16[8 * v14];
  v18 = &v16[v15];
  v19 = v4 - v6;
  if (v4 != v6)
  {
    v20 = &v17[v19 & 0xFFFFFFFFFFFFFFF8];
    v21 = v19 - 8;
    if ((unint64_t)(v19 - 8) >= 0x78)
    {
      v25 = v19 & 0xFFFFFFFFFFFFFFF8;
      v26 = v6 >= &v16[8 * v14 + v25] || v17 >= &v6[v25];
      v22 = &v16[8 * v14];
      if (v26)
      {
        v27 = (v21 >> 3) + 1;
        v28 = 8 * (v27 & 0x3FFFFFFFFFFFFFFCLL);
        v22 = &v17[v28];
        v29 = &v6[v28];
        v30 = (__int128 *)(v6 + 16);
        v31 = &v16[8 * v14 + 16];
        v32 = v27 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v33 = *(v30 - 1);
          v34 = *v30;
          *(v30 - 1) = 0uLL;
          *v30 = 0uLL;
          *((_OWORD *)v31 - 1) = v33;
          *(_OWORD *)v31 = v34;
          v30 += 2;
          v31 += 32;
          v32 -= 4;
        }
        while (v32);
        v6 = v29;
        if (v27 == (v27 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_34:
          v5 = *a1;
          v36 = a1[1];
          v37 = a1[2];
          *a1 = v16;
          a1[1] = v17;
          a1[2] = v20;
          a1[3] = v18;
          while (v37 != v36)
          {
            v39 = *((_QWORD *)v37 - 1);
            v37 -= 8;
            v38 = v39;
            *(_QWORD *)v37 = 0;
            if (v39)
              (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
      v22 = &v16[8 * v14];
    }
    do
    {
      v35 = *(_QWORD *)v6;
      *(_QWORD *)v6 = 0;
      v6 += 8;
      *(_QWORD *)v22 = v35;
      v22 += 8;
    }
    while (v22 != v20);
    goto LABEL_34;
  }
  *a1 = v16;
  a1[1] = v17;
  a1[2] = v17;
  a1[3] = v18;
LABEL_21:
  if (v5)
    operator delete(v5);
  v4 = a1[2];
LABEL_24:
  v24 = *a2;
  *a2 = 0;
  *(_QWORD *)v4 = v24;
  a1[2] += 8;
}

uint64_t sub_21AB8C814(uint64_t (**a1)(uint64_t), uint64_t a2)
{
  return (*a1)(a2);
}

void sub_21AB8C820(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::string::size_type v5;
  std::string::size_type v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  std::string::size_type v19;
  void *v20;
  uint64_t v21;
  std::string::size_type v22;
  std::string::size_type v23;
  std::string v24;
  std::string v25;
  std::string v26;
  __int16 v27;
  void *__p[2];
  const char *v29;
  __int16 v30;
  std::string v31;
  _QWORD v32[2];
  std::string *v33;
  __int16 v34;
  _QWORD v35[2];
  const char *v36;
  __int16 v37;
  _QWORD v38[2];
  std::string *v39;
  __int16 v40;
  _QWORD v41[2];
  const char *v42;
  __int16 v43;

  v6 = *(unsigned int *)(a2 + 16);
  v5 = *(unsigned int *)(a2 + 20);
  if (__CFADD__((_DWORD)v6, (_DWORD)v5))
  {
    sub_21AB8B3B0(a1, a2, (char *)&v31);
    v7 = std::string::insert(&v31, 0, "section ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v26, " has a sh_offset (0x");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v29 = (const char *)v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v25.__r_.__value_.__r.__words[0] = v6;
    v32[0] = __p;
    v33 = &v25;
    v34 = 3588;
    v35[0] = v32;
    v36 = ") + sh_size (0x";
    v37 = 770;
    v24.__r_.__value_.__r.__words[0] = v5;
    v38[0] = v35;
    v39 = &v24;
    v40 = 3586;
    v41[0] = v38;
    v42 = ") that cannot be represented";
    v43 = 770;
    v11 = operator new();
    v12 = sub_21AB908BC();
    sub_21AB91AE8(v11, (uint64_t)v41, 3, v12);
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v11;
    if (SHIBYTE(v29) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          return;
        goto LABEL_15;
      }
    }
    else if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_15:
    v20 = (void *)v31.__r_.__value_.__r.__words[0];
LABEL_20:
    operator delete(v20);
    return;
  }
  if (a1[1] >= (unint64_t)(v5 + v6))
  {
    v19 = *a1 + v6;
    *(_BYTE *)(a3 + 16) &= ~1u;
    *(_QWORD *)a3 = v19;
    *(_QWORD *)(a3 + 8) = v5;
    return;
  }
  sub_21AB8B3B0(a1, a2, (char *)&v24);
  v13 = std::string::insert(&v24, 0, "section ");
  v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  v15 = std::string::append(&v25, " has a sh_offset (0x");
  v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v31.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  v22 = v5;
  v23 = v6;
  v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&v31;
  v26.__r_.__value_.__r.__words[2] = (std::string::size_type)&v23;
  v27 = 3588;
  __p[0] = &v26;
  v29 = ") + sh_size (0x";
  v30 = 770;
  v32[0] = __p;
  v33 = (std::string *)&v22;
  v34 = 3586;
  v35[0] = v32;
  v36 = ") that is greater than the file size (0x";
  v37 = 770;
  v21 = a1[1];
  v38[0] = v35;
  v39 = (std::string *)&v21;
  v40 = 3586;
  v41[0] = v38;
  v42 = ")";
  v43 = 770;
  v17 = operator new();
  v18 = sub_21AB908BC();
  sub_21AB91AE8(v17, (uint64_t)v41, 3, v18);
  *(_BYTE *)(a3 + 16) |= 1u;
  *(_QWORD *)a3 = v17;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v31.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_10:
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_19;
      return;
    }
  }
  else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(v25.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
  {
LABEL_19:
    v20 = (void *)v24.__r_.__value_.__r.__words[0];
    goto LABEL_20;
  }
}

void sub_21AB8CB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  uint64_t v48;

  MEMORY[0x220752450](v48, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0)
LABEL_9:
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0)
    goto LABEL_9;
  goto LABEL_8;
}

void sub_21AB8CCB4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const void **v4;
  _QWORD *v6;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  int *v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  size_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  void **v21;
  int v22;
  void **v23;
  void **v24;
  int v25;
  size_t v26;
  unint64_t v27;
  void **p_dst;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int *v36;
  const void **v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned int v42;
  void **v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  __int16 v47;
  int *v48;
  uint64_t v49;
  char v50;
  void **__dst;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v4 = (const void **)a1;
  v54 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)(a1 + 32);
  sub_21AB8A444((_QWORD *)(a1 + 32), (uint64_t)&v43);
  v7 = (unsigned int *)v43;
  if ((v45 & 1) != 0)
  {
    v22 = 0;
    v43 = 0;
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v7;
LABEL_33:
    v23 = v43;
    v43 = 0;
    if (v23)
    {
      (*((void (**)(void **))*v23 + 1))(v23);
      if ((v22 & 1) == 0)
        return;
    }
    else
    {
LABEL_41:
      if (!v22)
        return;
    }
  }
  else if (v44)
  {
    v8 = (unsigned int *)&v43[5 * v44];
    v9 = *(unsigned __int8 *)(a3 + 16);
    v38 = a2;
    v39 = a3;
    v36 = v8;
    v37 = v4;
    while (1)
    {
      if (v7[1] != 2)
        goto LABEL_5;
      sub_21AB8D18C(v6, (uint64_t)v7, (uint64_t)&__dst);
      if ((v53 & 1) != 0)
      {
        v22 = 0;
        v24 = __dst;
        *(_BYTE *)(a3 + 16) |= 1u;
        *(_QWORD *)a3 = v24;
        if ((v45 & 1) != 0)
          goto LABEL_33;
        goto LABEL_41;
      }
      sub_21AB8D3CC(v6, v7, (uint64_t)&v48);
      v10 = v48;
      if ((v50 & 1) != 0)
      {
        v17 = 0;
        v48 = 0;
        v9 |= 1u;
        *(_BYTE *)(a3 + 16) = v9;
        *(_QWORD *)a3 = v10;
        if ((v50 & 1) == 0)
          goto LABEL_29;
      }
      else if (v49)
      {
        v12 = (const char *)__dst;
        v11 = v52;
        v13 = 16 * v49;
        v14 = *(const void **)a2;
        v15 = *(_QWORD *)(a2 + 8);
        do
        {
          v42 = *v10;
          if (v11 <= v42)
          {
            v18 = sub_21AB908BC();
            v40 = v11;
            sub_21AB8DB78(3, v18, (uint64_t)"st_name (0x%x) is past the end of the string table of size 0x%zx", (int *)&v42, (uint64_t *)&v40, &v41);
            a2 = v38;
            a3 = v39;
            v4 = v37;
            v17 = 0;
            v19 = v41;
            v9 |= 1u;
            *(_BYTE *)(v39 + 16) = v9;
            *(_QWORD *)v39 = v19;
            v8 = v36;
            if ((v50 & 1) == 0)
              goto LABEL_29;
            goto LABEL_27;
          }
          if (v12)
          {
            v16 = strlen(&v12[v42]);
            if (v16 == v15 && (!v16 || !memcmp(&v12[v42], v14, v16)))
            {
LABEL_18:
              v17 = 0;
              v9 &= ~1u;
              a3 = v39;
              *(_BYTE *)(v39 + 16) = v9;
              *(_OWORD *)v39 = *(_OWORD *)v10;
              goto LABEL_26;
            }
          }
          else if (!v15)
          {
            goto LABEL_18;
          }
          v10 += 4;
          v13 -= 16;
        }
        while (v13);
        v17 = 1;
        a3 = v39;
LABEL_26:
        v4 = v37;
        a2 = v38;
        v8 = v36;
        if ((v50 & 1) == 0)
          goto LABEL_29;
      }
      else
      {
        v17 = 1;
        if ((v50 & 1) == 0)
          goto LABEL_29;
      }
LABEL_27:
      v20 = v48;
      v48 = 0;
      if (v20)
        (*(void (**)(int *))(*(_QWORD *)v20 + 8))(v20);
LABEL_29:
      if ((v53 & 1) != 0)
      {
        v21 = __dst;
        __dst = 0;
        if (v21)
          (*((void (**)(void **))*v21 + 1))(v21);
      }
      if ((v17 & 1) == 0)
      {
        v22 = 0;
        if ((v45 & 1) != 0)
          goto LABEL_33;
        goto LABEL_41;
      }
LABEL_5:
      v7 += 10;
      if (v7 == v8)
      {
        v22 = 1;
        if ((v45 & 1) != 0)
          goto LABEL_33;
        goto LABEL_41;
      }
    }
  }
  v25 = *((char *)v4 + 23);
  if (v25 >= 0)
    v26 = *((unsigned __int8 *)v4 + 23);
  else
    v26 = (size_t)v4[1];
  v27 = v26 + 22;
  if (v26 + 22 >= 0x7FFFFFFFFFFFFFF8)
    sub_21AB84068();
  if (v27 >= 0x17)
  {
    v29 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v27 | 7) != 0x17)
      v29 = v27 | 7;
    v30 = v29 + 1;
    p_dst = (void **)operator new(v29 + 1);
    v52 = v26 + 22;
    v53 = v30 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_52;
  }
  v52 = 0;
  v53 = 0;
  __dst = 0;
  p_dst = (void **)&__dst;
  HIBYTE(v53) = v26 + 22;
  if (v26)
  {
LABEL_52:
    if (v25 >= 0)
      v31 = v4;
    else
      v31 = *v4;
    memmove(p_dst, v31, v26);
  }
  strcpy((char *)p_dst + v26, ": function not found: ");
  v32 = *(const void **)a2;
  v33 = *(_QWORD *)(a2 + 8);
  v43 = (void **)&__dst;
  v45 = v32;
  v46 = v33;
  v47 = 1284;
  v34 = operator new();
  v35 = sub_21AB908BC();
  sub_21AB91AE8(v34, (uint64_t)&v43, 3, v35);
  *(_BYTE *)(a3 + 16) |= 1u;
  *(_QWORD *)a3 = v34;
  if (SHIBYTE(v53) < 0)
    operator delete(__dst);
}

void sub_21AB8D0B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *__p,uint64_t a25,char a26,int a27,__int16 a28,char a29)
{
  if ((a23 & 1) != 0 && a21)
    (*(void (**)(uint64_t))(*(_QWORD *)a21 + 8))(a21);
  if ((a26 & 1) != 0 && __p)
    (*(void (**)(void *))(*(_QWORD *)__p + 8))(__p);
  if ((a18 & 1) != 0)
  {
    if (a16)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)a16 + 8))(a16);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21AB8D18C(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8[2];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  sub_21AB8A444(a1, (uint64_t)v8);
  if ((v9 & 1) != 0)
  {
    v7 = v8[0];
    v8[0] = 0;
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v7;
  }
  else
  {
    sub_21AB8D27C(a1, a2, v8[0], v8[1], a3);
    if ((v9 & 1) != 0)
    {
      v6 = v8[0];
      v8[0] = 0;
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    }
  }
}

void sub_21AB8D258(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if ((a11 & 1) != 0)
    sub_21AB97E70(&a9);
  _Unwind_Resume(exception_object);
}

void sub_21AB8D27C(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  __int16 v13;

  v6 = *(_DWORD *)(a2 + 4);
  if (v6 == 2 || v6 == 11)
  {
    v8 = *(unsigned int *)(a2 + 24);
    if (a4 > v8)
    {
      v12[0] = sub_21AB8A7E0;
      sub_21AB8AE20(a1, a3 + 40 * v8, (void (*)(uint64_t *__return_ptr, uint64_t, void ***))sub_21AB8C814, (uint64_t)v12, a5);
      return;
    }
    v12[0] = "invalid section index: ";
    v12[2] = v8;
    v13 = 2051;
    v10 = operator new();
    v9 = sub_21AB908BC();
    sub_21AB91AE8(v10, (uint64_t)v12, 3, v9);
  }
  else
  {
    v12[0] = "invalid sh_type for symbol table, expected SHT_SYMTAB or SHT_DYNSYM";
    v13 = 259;
    v10 = operator new();
    v11 = sub_21AB908BC();
    sub_21AB91AE8(v10, (uint64_t)v12, 3, v11);
  }
  *(_BYTE *)(a5 + 16) |= 1u;
  *(_QWORD *)a5 = v10;
}

void sub_21AB8D39C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220752450](v1, 0x10F3C401C2224D9);
  _Unwind_Resume(a1);
}

void sub_21AB8D3CC(_QWORD *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  std::string::size_type v6;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  uint64_t v12;
  uint64_t v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  std::string::size_type v21;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  std::string::size_type v34;
  uint64_t v35;
  std::string::size_type v36;
  std::string::size_type v37;
  std::string v38;
  std::string v39;
  std::string v40;
  __int16 v41;
  std::string v42;
  __int16 v43;
  std::string v44;
  void *__p[2];
  std::string *v46;
  __int16 v47;
  _QWORD v48[2];
  std::string *v49;
  __int16 v50;
  _QWORD v51[2];
  std::string *v52;
  __int16 v53;
  _QWORD v54[2];
  const char *v55;
  __int16 v56;

  if (a2[9] != 16)
  {
    sub_21AB8B3B0(a1, (uint64_t)a2, (char *)&v40);
    v14 = std::string::insert(&v40, 0, "section ");
    v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v15;
    v14->__r_.__value_.__l.__size_ = 0;
    v14->__r_.__value_.__r.__words[2] = 0;
    v14->__r_.__value_.__r.__words[0] = 0;
    v16 = std::string::append(&v42, " has invalid sh_entsize: expected ");
    v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v46 = (std::string *)v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    v44.__r_.__value_.__r.__words[0] = 16;
    v48[0] = __p;
    v49 = &v44;
    v50 = 2564;
    v51[0] = v48;
    v52 = (std::string *)", but got ";
    v53 = 770;
    v18 = (const char *)a2[9];
    v54[0] = v51;
    v55 = v18;
    v56 = 2050;
    v19 = operator new();
    v20 = sub_21AB908BC();
    sub_21AB91AE8(v19, (uint64_t)v54, 3, v20);
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v19;
    if (SHIBYTE(v46) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_6:
        if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          return;
        goto LABEL_17;
      }
    }
    else if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_6;
    }
    operator delete(v42.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_17:
    v27 = (void *)v40.__r_.__value_.__r.__words[0];
LABEL_21:
    operator delete(v27);
    return;
  }
  v6 = a2[5];
  if ((v6 & 0xF) != 0)
  {
    sub_21AB8B3B0(a1, (uint64_t)a2, (char *)&v44);
    v7 = std::string::insert(&v44, 0, "section ");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v40, " has an invalid sh_size (");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v42.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    __p[0] = &v42;
    v46 = (std::string *)v6;
    v47 = 2052;
    v48[0] = __p;
    v49 = (std::string *)") which is not a multiple of its sh_entsize (";
    v50 = 770;
    v11 = (std::string *)a2[9];
    v51[0] = v48;
    v52 = v11;
    v53 = 2050;
    v54[0] = v51;
    v55 = ")";
    v56 = 770;
    v12 = operator new();
    v13 = sub_21AB908BC();
    sub_21AB91AE8(v12, (uint64_t)v54, 3, v13);
    goto LABEL_11;
  }
  v21 = a2[4];
  if (!__CFADD__((_DWORD)v21, (_DWORD)v6))
  {
    if (a1[1] >= (unint64_t)(v6 + v21))
    {
      v34 = *a1 + v21;
      *(_BYTE *)(a3 + 16) &= ~1u;
      *(_QWORD *)a3 = v34;
      *(_QWORD *)(a3 + 8) = v6 >> 4;
      return;
    }
    sub_21AB8B3B0(a1, (uint64_t)a2, (char *)&v38);
    v28 = std::string::insert(&v38, 0, "section ");
    v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    v39.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    v30 = std::string::append(&v39, " has a sh_offset (0x");
    v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
    v44.__r_.__value_.__r.__words[2] = v30->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v31;
    v30->__r_.__value_.__l.__size_ = 0;
    v30->__r_.__value_.__r.__words[2] = 0;
    v30->__r_.__value_.__r.__words[0] = 0;
    v36 = v6;
    v37 = v21;
    v40.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
    v40.__r_.__value_.__r.__words[2] = (std::string::size_type)&v37;
    v41 = 3588;
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
    v42.__r_.__value_.__r.__words[2] = (std::string::size_type)") + sh_size (0x";
    v43 = 770;
    __p[0] = &v42;
    v46 = (std::string *)&v36;
    v47 = 3586;
    v48[0] = __p;
    v49 = (std::string *)") that is greater than the file size (0x";
    v50 = 770;
    v35 = a1[1];
    v51[0] = v48;
    v52 = (std::string *)&v35;
    v53 = 3586;
    v54[0] = v51;
    v55 = ")";
    v56 = 770;
    v32 = operator new();
    v33 = sub_21AB908BC();
    sub_21AB91AE8(v32, (uint64_t)v54, 3, v33);
    *(_BYTE *)(a3 + 16) |= 1u;
    *(_QWORD *)a3 = v32;
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v44.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v39.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_25:
        if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          return;
        goto LABEL_30;
      }
    }
    else if ((SHIBYTE(v39.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_25;
    }
    operator delete(v39.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_30:
    v27 = (void *)v38.__r_.__value_.__r.__words[0];
    goto LABEL_21;
  }
  sub_21AB8B3B0(a1, (uint64_t)a2, (char *)&v44);
  v22 = std::string::insert(&v44, 0, "section ");
  v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  v40.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v23;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  v22->__r_.__value_.__r.__words[0] = 0;
  v24 = std::string::append(&v40, " has a sh_offset (0x");
  v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v42.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v42.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0;
  v24->__r_.__value_.__r.__words[2] = 0;
  v24->__r_.__value_.__r.__words[0] = 0;
  v39.__r_.__value_.__r.__words[0] = v21;
  __p[0] = &v42;
  v46 = &v39;
  v47 = 3588;
  v48[0] = __p;
  v49 = (std::string *)") + sh_size (0x";
  v50 = 770;
  v38.__r_.__value_.__r.__words[0] = v6;
  v51[0] = v48;
  v52 = &v38;
  v53 = 3586;
  v54[0] = v51;
  v55 = ") that cannot be represented";
  v56 = 770;
  v12 = operator new();
  v26 = sub_21AB908BC();
  sub_21AB91AE8(v12, (uint64_t)v54, 3, v26);
LABEL_11:
  *(_BYTE *)(a3 + 16) |= 1u;
  *(_QWORD *)a3 = v12;
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v42.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_13:
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_20;
      return;
    }
  }
  else if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(v40.__r_.__value_.__l.__data_);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
  {
LABEL_20:
    v27 = (void *)v44.__r_.__value_.__r.__words[0];
    goto LABEL_21;
  }
}

void sub_21AB8D9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  uint64_t v55;

  MEMORY[0x220752450](v55, 0x10F3C401C2224D9);
  if (a48 < 0)
  {
    operator delete(__p);
    if (a23 < 0)
    {
LABEL_5:
      operator delete(a18);
      if ((a17 & 0x80000000) == 0)
LABEL_9:
        _Unwind_Resume(a1);
LABEL_8:
      operator delete(a12);
      goto LABEL_9;
    }
  }
  else if (a23 < 0)
  {
    goto LABEL_5;
  }
  if ((a17 & 0x80000000) == 0)
    goto LABEL_9;
  goto LABEL_8;
}

void sub_21AB8DB68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    JUMPOUT(0x21AB8DB58);
  JUMPOUT(0x21AB8DB60);
}

void sub_21AB8DB78(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X8>)
{
  int v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  int v23;
  void **v24;
  void *__p[2];
  uint64_t v26;
  _QWORD v27[2];
  int v28;
  uint64_t v29;
  __int16 v30;

  __p[0] = 0;
  __p[1] = 0;
  v26 = 0;
  v17 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 1;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v16 = &unk_24DDB7C98;
  v24 = __p;
  sub_21AB95BE4((uint64_t)&v16, 0, 0, 0);
  v12 = *a4;
  v13 = *a5;
  v27[0] = &off_24DDB7620;
  v27[1] = a3;
  v28 = v12;
  v29 = v13;
  sub_21AB95CD4((uint64_t)&v16, (uint64_t)v27);
  v14 = v24;
  v15 = operator new();
  v30 = 260;
  v27[0] = v14;
  sub_21AB91AE8(v15, (uint64_t)v27, a1, a2);
  *a6 = v15;
  sub_21AB95A78((uint64_t)&v16);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
}

void sub_21AB8DCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  MEMORY[0x220752450](v24, 0x10F3C401C2224D9);
  sub_21AB95A78((uint64_t)&a10);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB8DCF4(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, *(const char **)(a1 + 8), *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

void sub_21AB8DD2C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7658;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_21AB8DD3C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7658;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752450);
}

void sub_21AB8DD6C(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

uint64_t sub_21AB8DDBC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t sub_21AB8DDC8(uint64_t a1)
{
  uint64_t FigBaseObject;
  void (*v3)(uint64_t);
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  if (**(_QWORD **)(a1 + 32))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    if (FigBaseObject)
    {
      v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v3)
        v3(FigBaseObject);
    }
    CFRelease(**(CFTypeRef **)(a1 + 32));
    **(_QWORD **)(a1 + 32) = 0;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  if (!CMNotificationCenterRemoveListener()
    || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;
    if (!v4)
      goto LABEL_10;
    goto LABEL_9;
  }
  sub_21AB97E94();
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v4)
LABEL_9:
    MEMORY[0x220752450](v4, 0x1020C403A5D3213);
LABEL_10:
  v5 = *(_QWORD **)(a1 + 24);
  if (v5 == (_QWORD *)a1)
  {
    v6 = 4;
    v5 = (_QWORD *)a1;
    goto LABEL_14;
  }
  if (v5)
  {
    v6 = 5;
LABEL_14:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return a1;
}

void sub_21AB8DED0(int a1, uint64_t a2, CFTypeRef cf2)
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;

  if (CFEqual((CFTypeRef)*MEMORY[0x24BE104B8], cf2))
  {
    v23 = 1;
    v5 = *(_QWORD *)(a2 + 24);
    if (v5)
    {
      (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, &v23);
      return;
    }
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
LABEL_13:
      sub_21AB97F34(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else if (CFEqual((CFTypeRef)*MEMORY[0x24BE104B0], cf2))
  {
    v24 = 2;
    v6 = *(_QWORD *)(a2 + 24);
    if (v6)
    {
      (*(void (**)(uint64_t, int *))(*(_QWORD *)v6 + 48))(v6, &v24);
      return;
    }
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      goto LABEL_13;
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      sub_21AB97F00(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

BOOL sub_21AB8DFF0(uint64_t a1)
{
  mach_port_t v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, _QWORD, CFTypeRef *);
  int v10;
  CFTypeRef v11;
  uint64_t v12;
  const __CFDictionary *v13;
  void *v14;
  uint64_t (*v15)(uint64_t, _QWORD, CFTypeRef *);
  const __CFDictionary *v16;
  void *v17;
  uint64_t (*v18)(uint64_t, _QWORD, CFTypeRef *);
  const __CFDictionary *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, _QWORD, CFTypeRef *);
  _BOOL8 result;
  CFTypeRef cf;
  uint8_t v24[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  v3 = 4;
  v4 = *MEMORY[0x24BDBD240];
  v5 = MEMORY[0x24BDACB70];
  while (1)
  {
    v6 = *(_QWORD *)(a1 + 32);
    cf = 0;
    v7 = IOServiceMatching("AppleH16CamIn");
    if (IOServiceGetMatchingService(v2, v7))
    {
      v8 = dlopen("/System/Library/MediaCapture/H16ISP.mediacapture", 4);
      if (v8
        && (v9 = (uint64_t (*)(uint64_t, _QWORD, CFTypeRef *))dlsym(v8, "H16ISPCaptureDeviceCreate")) != 0)
      {
        v10 = v9(v4, 0, &cf);
        v11 = cf;
        if (cf)
          goto LABEL_8;
      }
      else
      {
        v10 = 0;
        v11 = cf;
        if (cf)
        {
LABEL_8:
          v12 = 0;
          goto LABEL_30;
        }
      }
    }
    else
    {
      v10 = 0;
    }
    v13 = IOServiceMatching("AppleH13CamIn");
    if (IOServiceGetMatchingService(v2, v13))
    {
      v14 = dlopen("/System/Library/MediaCapture/H13ISP.mediacapture", 4);
      if (v14
        && (v15 = (uint64_t (*)(uint64_t, _QWORD, CFTypeRef *))dlsym(v14, "H13ISPCaptureDeviceCreate")) != 0)
      {
        v10 = v15(v4, 0, &cf);
        v11 = cf;
        if (cf)
          goto LABEL_25;
      }
      else
      {
        v10 = 0;
        v11 = cf;
        if (cf)
        {
LABEL_25:
          v12 = 1;
          goto LABEL_30;
        }
      }
    }
    v16 = IOServiceMatching("AppleH10CamIn");
    if (IOServiceGetMatchingService(v2, v16))
    {
      v17 = dlopen("/System/Library/MediaCapture/H10ISP.mediacapture", 4);
      if (v17
        && (v18 = (uint64_t (*)(uint64_t, _QWORD, CFTypeRef *))dlsym(v17, "H10ISPCaptureDeviceCreate")) != 0)
      {
        v10 = v18(v4, 0, &cf);
        v11 = cf;
        if (cf)
          goto LABEL_27;
      }
      else
      {
        v10 = 0;
        v11 = cf;
        if (cf)
        {
LABEL_27:
          v12 = 2;
          goto LABEL_30;
        }
      }
    }
    v19 = IOServiceMatching("AppleH9CamIn");
    if (IOServiceGetMatchingService(v2, v19))
    {
      v20 = dlopen("/System/Library/MediaCapture/H9ISP.mediacapture", 4);
      if (v20
        && (v21 = (uint64_t (*)(uint64_t, _QWORD, CFTypeRef *))dlsym(v20, "H9ISPCaptureDeviceCreate")) != 0)
      {
        v10 = v21(v4, 0, &cf);
        v11 = cf;
        if (!cf)
        {
LABEL_22:
          if (!v6)
            goto LABEL_32;
          v11 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        v10 = 0;
        v11 = cf;
        if (!cf)
          goto LABEL_22;
      }
      v12 = 3;
LABEL_30:
      *(_DWORD *)(v6 + 8) = off_24DDB76C0[4 * v12 + 3];
LABEL_31:
      *(_QWORD *)v6 = v11;
      goto LABEL_32;
    }
    v11 = cf;
    if (v6)
      goto LABEL_31;
    if (cf)
      CFRelease(cf);
LABEL_32:
    if (v10 != -536870186)
      break;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_21AB97FD0(v24, v3 - 2, &v25);
      if (--v3 <= 1)
        goto LABEL_43;
    }
    else if (--v3 <= 1)
    {
      goto LABEL_43;
    }
  }
  if (!v10)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    return **(_QWORD **)(a1 + 32) != 0;
  }
LABEL_43:
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (result)
  {
    sub_21AB97F68();
    return 0;
  }
  return result;
}

void sub_21AB8E384(int a1@<W0>, uint64_t *a2@<X8>)
{
  unsigned __int8 v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  BOOL v8;
  uint64_t v9;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;

  v4 = atomic_load((unsigned __int8 *)&qword_25510FF70);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_25510FF70))
  {
    __cxa_atexit((void (*)(void *))sub_21AB8E660, &qword_25510FF78, &dword_21AB76000);
    __cxa_guard_release(&qword_25510FF70);
  }
  v19 = 0;
  if (qword_25510FF80)
  {
    v5 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_25510FF80);
    v19 = v5;
    if (v5)
    {
      v6 = qword_25510FF78;
      if (qword_25510FF78)
      {
        v7 = v5;
        if (**(_QWORD **)(qword_25510FF78 + 32))
          v8 = 1;
        else
          v8 = a1 == 0;
        if (v8 || sub_21AB8DFF0(qword_25510FF78))
        {
          *a2 = v6;
          a2[1] = (uint64_t)v7;
          return;
        }
        *a2 = 0;
        a2[1] = 0;
        goto LABEL_19;
      }
    }
  }
  v9 = operator new();
  *(_QWORD *)(v9 + 24) = 0;
  v10 = (_QWORD *)operator new();
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)(v9 + 32) = v10;
  v11 = (std::__shared_weak_count *)operator new();
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&off_24DDB7750;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  if (a1 && !sub_21AB8DFF0(v9))
  {
    *a2 = 0;
    a2[1] = 0;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  else
  {
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
    v15 = (std::__shared_weak_count *)qword_25510FF80;
    qword_25510FF78 = v9;
    qword_25510FF80 = (uint64_t)v11;
    if (v15)
      std::__shared_weak_count::__release_weak(v15);
    *a2 = v9;
    a2[1] = (uint64_t)v11;
  }
  v7 = v19;
  if (v19)
  {
LABEL_19:
    v16 = (unint64_t *)&v7->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_21AB8E5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_21AB867B4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB8E5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  sub_21AB867B4((uint64_t)&a9);
  sub_21AB867B4((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_21AB8E5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  uint64_t v5;
  va_list va;

  va_start(va, a3);
  v5 = sub_21AB8DDC8(v3);
  MEMORY[0x220752450](v5, 0x1020C40BD065CB0);
  sub_21AB867B4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB8E64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_21AB867B4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB8E660(uint64_t a1)
{
  std::__shared_weak_count *v2;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  return a1;
}

uint64_t sub_21AB8E68C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, _QWORD, uint64_t, uint64_t *);
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  if (!**(_QWORD **)(a1 + 32))
    return 0;
  v7 = *MEMORY[0x24BE10508];
  v8[0] = &unk_24DDB8520;
  v2 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = **(_QWORD **)(a1 + 32);
  v4 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 8);
  if (!v4)
    return 0;
  if (v4(v3, *MEMORY[0x24BDBD240], v2, &v6))
    return 0;
  return v6;
}

_QWORD *sub_21AB8E780(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v7 = v6;
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, v6);
    }
    else
    {
      v7 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
  }
  else
  {
    v7 = 0;
  }
  sub_21AB8F17C(v6, a1);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

BOOL sub_21AB8E858(uint64_t a1, void *a2)
{
  id v3;
  uint64_t (*v4)(uint64_t, _QWORD, id);
  int v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = *(uint64_t (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v5 = v4(a1, *MEMORY[0x24BE10568], v3);
  else
    v5 = -12782;
  v6 = v5 == 0;

  return v6;
}

void sub_21AB8E8C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_21AB8E8D0(uint64_t a1)
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  uint64_t (*v4)(uint64_t, _QWORD *);
  int v5;
  _BOOL8 v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v2 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_21AB8E9EC;
  v8[3] = &unk_24DDB76A0;
  v10 = &v11;
  v3 = v2;
  v9 = v3;
  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v4)
    goto LABEL_5;
  v5 = v4(a1, v8);
  if (v5 == -12780)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (v5)
  {
LABEL_5:
    v6 = 0;
  }
  else
  {
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v6 = *((_DWORD *)v12 + 6) == 0;
  }
LABEL_7:

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_21AB8E9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_21AB8E9EC(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_21AB8EA00(const void *a1)
{
  unsigned int (*v2)(const void *);
  uint64_t v3;
  unsigned int (*v4)(const void *);

  if (!a1)
    return 0;
  v2 = *(unsigned int (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v2 || v2(a1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21AB9807C();
    v3 = 0;
    v4 = *(unsigned int (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    v3 = 1;
    v4 = *(unsigned int (**)(const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (!v4)
      goto LABEL_11;
  }
  if (v4(a1))
  {
LABEL_11:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21AB98010();
    v3 = 0;
  }
  CFRelease(a1);
  return v3;
}

BOOL sub_21AB8EAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD);
  int v8;
  _BOOL8 result;
  unsigned int v10;
  NSObject *v11;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD);
  int v14;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 16);
  if (v7)
  {
    v8 = v7(a2, 0, 0, a3, a4, 0);
    kdebug_trace();
    if (v8)
    {
      kdebug_trace();
      if ((v8 + 12788) <= 8)
      {
        if (((1 << (v8 - 12)) & 0x1DB) != 0)
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
          if (result)
            goto LABEL_23;
          return result;
        }
        v10 = 0;
        v11 = MEMORY[0x24BDACB70];
        while (1)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_21AB981B8(v16, v8, &v17);
          usleep(0x3E8u);
          v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 16);
          if (!v13)
            break;
          v14 = v13(a2, 0, 0, a3, a4, 0);
          v8 = v14;
          if ((v14 == -12786 || v14 == -12783) && v10++ < 9)
            continue;
          goto LABEL_19;
        }
        v8 = -12782;
      }
LABEL_19:
      kdebug_trace();
      if (v8)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
        if (result)
        {
          sub_21AB98150();
          return 0;
        }
        return result;
      }
    }
    return 1;
  }
  kdebug_trace();
  kdebug_trace();
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (result)
  {
LABEL_23:
    sub_21AB980E8();
    return 0;
  }
  return result;
}

BOOL sub_21AB8EDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unsigned int a7)
{
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  double *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64x2_t v24;
  double *v25;
  __int128 *v26;
  unint64_t v27;
  __int128 v28;
  double *v29;
  double *v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t (*v39)(uint64_t);
  int v40;
  float64x2x2_t v42;

  kdebug_trace();
  v13 = *a6;
  v14 = a6[1] - *a6;
  v15 = v14 >> 3;
  v16 = (v14 >> 3) + 3;
  v17 = v16;
  if ((v14 >> 3) == -3)
  {
    v18 = 0;
    goto LABEL_19;
  }
  if ((int)v15 <= -4)
    sub_21AB808CC();
  v18 = (double *)operator new(16 * v16);
  bzero(v18, 16 * v17);
  if ((int)v15 >= 1)
  {
    v19 = *MEMORY[0x24BE10528];
    v20 = (v14 >> 3);
    if (v20 < 8)
    {
      v21 = 0;
      goto LABEL_16;
    }
    v22 = (unint64_t)v18 >= v13 + 8 * v20 || v13 >= (unint64_t)&v18[2 * v20];
    if (!v22)
    {
      v21 = 0;
LABEL_16:
      v30 = &v18[2 * v21 + 1];
      v31 = (uint64_t *)(v13 + 8 * v21);
      v32 = v21 - v20;
      do
      {
        *((_QWORD *)v30 - 1) = v19;
        v33 = *v31++;
        *(_QWORD *)v30 = v33;
        v30 += 2;
        v22 = __CFADD__(v32++, 1);
      }
      while (!v22);
      goto LABEL_19;
    }
    v23 = (v14 >> 3) & 3;
    v21 = v20 - v23;
    v24 = vdupq_n_s64(v19);
    v25 = v18 + 4;
    v26 = (__int128 *)(v13 + 16);
    v27 = v20 - v23;
    do
    {
      v42.val[1] = (float64x2_t)*(v26 - 1);
      v28 = *v26;
      v29 = v25 - 4;
      v42.val[0] = (float64x2_t)v24;
      vst2q_f64(v29, v42);
      vst2q_f64(v25, *(float64x2x2_t *)v24.i8);
      v25 += 8;
      v26 += 2;
      v27 -= 4;
    }
    while (v27);
    if (v23)
      goto LABEL_16;
  }
LABEL_19:
  v34 = (_QWORD *)((char *)v18 + ((uint64_t)(v14 << 29) >> 28));
  *v34 = CFSTR("OperationsList");
  v34[1] = a3;
  v35 = (_QWORD *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x100000000) >> 28));
  *v35 = CFSTR("ActionsList");
  v35[1] = a4;
  v36 = (_QWORD *)((char *)v18 + ((uint64_t)((v14 << 29) + 0x200000000) >> 28));
  *v36 = CFSTR("StatsBuffer");
  v36[1] = a5;
  v37 = kdebug_trace();
  v38 = sub_21AB8EAFC(v37, a2, v17, (uint64_t)v18);
  if (v38 & a7)
  {
    kdebug_trace();
    v39 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v39)
      v40 = v39(a2);
    else
      v40 = -12782;
    kdebug_trace();
    if (v40)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        sub_21AB981F8();
      v38 = 0;
    }
    else
    {
      v38 = 1;
    }
  }
  operator delete(v18);
  return v38;
}

void sub_21AB8F088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB8F0B4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB8F0D8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    sub_21AB8DDC8(result);
    JUMPOUT(0x220752450);
  }
  return result;
}

uint64_t sub_21AB8F10C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN3isp11HxISPDeviceEE27__shared_ptr_default_deleteIS2_S2_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  return 0;
}

_QWORD *sub_21AB8F17C(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_21AB8F310(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_21AB8407C(a1);
}

void sub_21AB8F31C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_21AB8F32C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_21AB8F514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  id *v19;

  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AB8F568(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      sub_21AB98314(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v14);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21AB8F70C;
  v15[3] = &unk_24DDB77E0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  objc_msgSend(v3, "setUpdateHandler:", v15);
  objc_destroyWeak(&v16);

}

void sub_21AB8F6BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id *v4;

  objc_destroyWeak(v4);

  _Unwind_Resume(a1);
}

void sub_21AB8F70C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_process:didUpdateState:", v7, v6);

}

void sub_21AB8F770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21AB8F7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AppStateMonitor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21AB8FAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

void *sub_21AB8FB0C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *result;

  v1 = a1;
  v2 = v1;
  if (!v1)
    return v2;
  switch(objc_msgSend(v1, "taskState"))
  {
    case 1u:
      return v2;
    case 2u:
    case 4u:
      objc_msgSend(v2, "endowmentNamespaces");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

      result = v2;
      break;
    case 3u:
      result = v2;
      break;
    default:
      result = v2;
      break;
  }
  return result;
}

void sub_21AB8FBE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AB8FBF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_21AB8FC7C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  AppStateMonitor *v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  id v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 24) = 0;
  v6 = operator new();
  *(_QWORD *)v6 = 0;
  *(_DWORD *)(v6 + 8) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_BYTE *)(v6 + 32) = 0;
  *(_QWORD *)(a1 + 40) = v6;
  *(_DWORD *)(a1 + 32) = a2;
  v7 = -[AppStateMonitor initWithPID:]([AppStateMonitor alloc], "initWithPID:", a2);
  v8 = *(void ***)(a1 + 40);
  v9 = *v8;
  *v8 = v7;

  objc_initWeak(&v15, **(id **)(a1 + 40));
  v10 = a3[3];
  if (!v10)
    goto LABEL_4;
  if ((_QWORD *)v10 != a3)
  {
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10);
LABEL_4:
    v17 = (_QWORD *)v10;
    goto LABEL_6;
  }
  v17 = v16;
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v16);
LABEL_6:
  sub_21AB901C0(v16, (_QWORD *)a1);
  v11 = v17;
  if (v17 == v16)
  {
    v12 = 4;
    v11 = v16;
    goto LABEL_10;
  }
  if (v17)
  {
    v12 = 5;
LABEL_10:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  CMNotificationCenterGetDefaultLocalCenter();
  v13 = objc_loadWeakRetained(&v15);
  CMNotificationCenterAddListener();

  objc_destroyWeak(&v15);
  return a1;
}

void sub_21AB8FE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  _QWORD *v9;
  void *v10;
  _QWORD *v12;

  objc_destroyWeak(&a9);
  v12 = (_QWORD *)v9[3];
  if (v12 == v9)
  {
    (*(void (**)(_QWORD *))(*v9 + 32))(v9);
    _Unwind_Resume(a1);
  }
  if (v12)
  {
    (*(void (**)(_QWORD))(*v12 + 40))(v9[3]);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21AB8FE7C(int a1, uint64_t a2, CFTypeRef cf2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (CFEqual(CFSTR("AppIsSuspended"), cf2))
    sub_21AB9001C(a2);
  result = objc_msgSend(**(id **)(a2 + 40), "currentAppState");
  switch((int)result)
  {
    case 0:
      *(_DWORD *)(*(_QWORD *)(a2 + 40) + 8) = 0;
      break;
    case 1:
      v6 = *(_QWORD *)(a2 + 40);
      *(_DWORD *)(v6 + 8) = 1;
      *(_BYTE *)(v6 + 32) = 1;
      break;
    case 2:
      *(_DWORD *)(*(_QWORD *)(a2 + 40) + 8) = 2;
      break;
    case 3:
    case 4:
      *(_DWORD *)(*(_QWORD *)(a2 + 40) + 8) = 3;
      break;
    default:
      v5 = *(_QWORD *)(a2 + 40);
      if (*(_DWORD *)(v5 + 8) == 1)
        *(_BYTE *)(v5 + 32) = 1;
      break;
  }
  return result;
}

_QWORD *sub_21AB8FF68(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = a1[5];
  if (v2)
  {
    v3 = *(std::__shared_weak_count **)(v2 + 24);
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

    MEMORY[0x220752450](v2, 0x10A0C40ACFE8555);
  }
  v6 = (_QWORD *)a1[3];
  if (v6 == a1)
  {
    v7 = 4;
    v6 = a1;
    goto LABEL_12;
  }
  if (v6)
  {
    v7 = 5;
LABEL_12:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  return a1;
}

void sub_21AB9001C(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(**(id **)(a1 + 40), "currentAppState");
  if (v2 < 3)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v4 + 8) = v2;
LABEL_3:
    v5 = *(_QWORD *)(a1 + 24);
    if (v5)
    {
      if (v3 == 1)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        v6 = CMNotificationCenterRemoveListener();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          v7 = *(_DWORD *)(a1 + 32);
          *(_DWORD *)buf = 67109376;
          v12 = v7;
          v13 = 1024;
          v14 = v6;
          _os_log_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Application PID=%d terminated with status %d", buf, 0xEu);
        }
        v4 = *(_QWORD *)(a1 + 40);
        v5 = *(_QWORD *)(a1 + 24);
      }
      v8 = *(_DWORD *)(v4 + 8) == 1;
      *(_DWORD *)buf = *(_DWORD *)(a1 + 32);
      v10 = v8;
      if (!v5)
        sub_21AB840C0();
      (*(void (**)(uint64_t, uint8_t *, BOOL *))(*(_QWORD *)v5 + 48))(v5, buf, &v10);
      v9 = *(_QWORD *)(a1 + 40);
      if (*(_DWORD *)(v9 + 8) == 1)
        objc_msgSend(*(id *)v9, "invalidate");
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      sub_21AB9834C();
    }
    return;
  }
  if (v2 - 3 <= 1)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8) = 3;
    return;
  }
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_DWORD *)(v4 + 8);
  if (v3 != 3)
    goto LABEL_3;
}

uint64_t sub_21AB901B4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32);
}

_QWORD *sub_21AB901C0(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_21AB90354(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_21AB8407C(a1);
}

uint64_t sub_21AB90360()
{
  int64x2_t v0;

  v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB99360), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB99370)))) & 1;
}

BOOL sub_21AB903A4()
{
  uint64_t v0;

  v0 = MGGetProductType();
  return v0 == 133314240 || v0 == 2941181571;
}

uint64_t sub_21AB903D4()
{
  int64x2_t v0;

  v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB99380), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB99390)))) & 1;
}

uint64_t sub_21AB90418()
{
  int64x2_t v0;

  v0 = vdupq_n_s64(MGGetProductType());
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB993A0), (int32x4_t)vceqq_s64(v0, (int64x2_t)xmmword_21AB993B0)))) & 1;
}

const char *sub_21AB9045C(int a1, int a2)
{
  const char *result;

  if (a1 > 61)
  {
    if (a1 > 163)
    {
      if (a1 == 164)
      {
        if (a2 == 1879048192)
          return "SHT_HEX_ORDERED";
      }
      else if (a1 == 243 && a2 == 1879048195)
      {
        return "SHT_RISCV_ATTRIBUTES";
      }
    }
    else if (a1 == 62)
    {
      if (a2 == 1879048193)
        return "SHT_X86_64_UNWIND";
    }
    else if (a1 == 105 && a2 == 1879048195)
    {
      return "SHT_MSP430_ATTRIBUTES";
    }
    goto LABEL_21;
  }
  if (a1 != 8 && a1 != 10)
  {
    if (a1 == 40 && (a2 - 1879048193) < 5)
      return off_24DDB7828[a2 - 1879048193];
LABEL_21:
    if (a2 > 1879002111)
    {
      switch(a2)
      {
        case 1879002112:
          result = "SHT_LLVM_ODRTAB";
          break;
        case 1879002113:
          result = "SHT_LLVM_LINKER_OPTIONS";
          break;
        case 1879002114:
LABEL_48:
          result = "Unknown";
          break;
        case 1879002115:
          result = "SHT_LLVM_ADDRSIG";
          break;
        case 1879002116:
          result = "SHT_LLVM_DEPENDENT_LIBRARIES";
          break;
        case 1879002117:
          result = "SHT_LLVM_SYMPART";
          break;
        case 1879002118:
          result = "SHT_LLVM_PART_EHDR";
          break;
        case 1879002119:
          result = "SHT_LLVM_PART_PHDR";
          break;
        case 1879002120:
          result = "SHT_LLVM_BB_ADDR_MAP";
          break;
        case 1879002121:
          result = "SHT_LLVM_CALL_GRAPH_PROFILE";
          break;
        default:
          switch(a2)
          {
            case 1879048181:
              result = "SHT_GNU_ATTRIBUTES";
              break;
            case 1879048182:
              result = "SHT_GNU_HASH";
              break;
            case 1879048183:
            case 1879048184:
            case 1879048185:
            case 1879048186:
            case 1879048187:
            case 1879048188:
              goto LABEL_48;
            case 1879048189:
              result = "SHT_GNU_verdef";
              break;
            case 1879048190:
              result = "SHT_GNU_verneed";
              break;
            case 1879048191:
              result = "SHT_GNU_versym";
              break;
            default:
              if (a2 != 1879047936)
                goto LABEL_48;
              result = "SHT_ANDROID_RELR";
              break;
          }
          break;
      }
    }
    else
    {
      result = "SHT_NULL";
      switch(a2)
      {
        case 0:
          return result;
        case 1:
          return "SHT_PROGBITS";
        case 2:
          return "SHT_SYMTAB";
        case 3:
          return "SHT_STRTAB";
        case 4:
          return "SHT_RELA";
        case 5:
          return "SHT_HASH";
        case 6:
          return "SHT_DYNAMIC";
        case 7:
          return "SHT_NOTE";
        case 8:
          return "SHT_NOBITS";
        case 9:
          return "SHT_REL";
        case 10:
          return "SHT_SHLIB";
        case 11:
          return "SHT_DYNSYM";
        case 12:
        case 13:
          goto LABEL_48;
        case 14:
          return "SHT_INIT_ARRAY";
        case 15:
          return "SHT_FINI_ARRAY";
        case 16:
          return "SHT_PREINIT_ARRAY";
        case 17:
          return "SHT_GROUP";
        case 18:
          return "SHT_SYMTAB_SHNDX";
        case 19:
          return "SHT_RELR";
        default:
          if (a2 == 1610612737)
          {
            result = "SHT_ANDROID_REL";
          }
          else
          {
            if (a2 != 1610612738)
              goto LABEL_48;
            result = "SHT_ANDROID_RELA";
          }
          break;
      }
    }
    return result;
  }
  result = "SHT_MIPS_REGINFO";
  switch(a2)
  {
    case 1879048198:
      return result;
    case 1879048205:
      result = "SHT_MIPS_OPTIONS";
      break;
    case 1879048222:
      result = "SHT_MIPS_DWARF";
      break;
    case 1879048234:
      result = "SHT_MIPS_ABIFLAGS";
      break;
    default:
      goto LABEL_21;
  }
  return result;
}

uint64_t sub_21AB908BC()
{
  if (!atomic_load((unint64_t *)&qword_25510FF88))
    sub_21AB929AC((unint64_t *)&qword_25510FF88, (uint64_t (*)(void))sub_21AB90AB4, (unint64_t)sub_21AB90AE8);
  return qword_25510FF88;
}

void sub_21AB90910(uint64_t a1, uint64_t a2)
{
  std::string *v3;
  size_t size;
  std::string v5;

  std::error_code::message(&v5, (const std::error_code *)(a1 + 8));
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = &v5;
  else
    v3 = (std::string *)v5.__r_.__value_.__r.__words[0];
  if ((v5.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v5.__r_.__value_.__r.__words[2]);
  else
    size = v5.__r_.__value_.__l.__size_;
  sub_21AB95F84(a2, v3, size);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
}

void sub_21AB90984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB909A0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int v12;
  void **v13;
  void *v14[2];
  uint64_t v15;

  v14[0] = 0;
  v14[1] = 0;
  v15 = 0;
  v6 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  v8 = 0;
  v9 = 0;
  v7 = 0;
  v5 = &unk_24DDB7C98;
  v13 = v14;
  sub_21AB95BE4((uint64_t)&v5, 0, 0, 0);
  (*(void (**)(uint64_t, void **))(*(_QWORD *)a1 + 16))(a1, &v5);
  if (*((char *)v13 + 23) < 0)
  {
    sub_21AB83FDC((_BYTE *)a2, *v13, (unint64_t)v13[1]);
  }
  else
  {
    v4 = *(_OWORD *)v13;
    *(_QWORD *)(a2 + 16) = v13[2];
    *(_OWORD *)a2 = v4;
  }
  sub_21AB95A78((uint64_t)&v5);
  if (SHIBYTE(v15) < 0)
    operator delete(v14[0]);
}

void sub_21AB90A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  sub_21AB95A78((uint64_t)&a9);
  if (*(char *)(v9 - 17) < 0)
    operator delete(*(void **)(v9 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_21AB90AA8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

_QWORD *sub_21AB90AB4()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24DDB7860;
  return result;
}

uint64_t sub_21AB90AE8(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_21AB90B00(std::error_category *a1)
{
  std::error_category::~error_category(a1);
  JUMPOUT(0x220752450);
}

const char *sub_21AB90B24()
{
  return "llvm.object";
}

void sub_21AB90B30(uint64_t a1, int a2)
{
  __asm { BR              X10 }
}

double sub_21AB90B5C()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)operator new(0x30uLL);
  *(_QWORD *)v0 = v1;
  *(_OWORD *)(v0 + 8) = xmmword_21AB994B0;
  strcpy(v1, "No object file for requested architecture");
  return *(double *)"ted architecture";
}

double sub_21AB90B9C()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)operator new(0x38uLL);
  *(_QWORD *)v0 = v1;
  *(_OWORD *)(v0 + 8) = xmmword_21AB994A0;
  strcpy(v1, "The file was not recognized as a valid object file");
  return *(double *)" valid object file";
}

double sub_21AB90BE4()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)operator new(0x38uLL);
  *(_QWORD *)v0 = v1;
  *(_OWORD *)(v0 + 8) = xmmword_21AB99490;
  strcpy(v1, "Invalid data was encountered while parsing the file");
  return *(double *)"le parsing the file";
}

double sub_21AB90C30()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)operator new(0x38uLL);
  *(_QWORD *)v0 = v1;
  *(_OWORD *)(v0 + 8) = xmmword_21AB99480;
  strcpy(v1, "The end of the file was unexpectedly encountered");
  return *(double *)"edly encountered";
}

double sub_21AB90C70()
{
  uint64_t v0;
  char *v1;

  v1 = (char *)operator new(0x30uLL);
  *(_QWORD *)v0 = v1;
  *(_OWORD *)(v0 + 8) = xmmword_21AB99470;
  strcpy(v1, "String table must end with a null terminator");
  return *(double *)" null terminator";
}

void sub_21AB90CB0()
{
  char *v0;

  v0[23] = 21;
  strcpy(v0, "Invalid section index");
}

char *sub_21AB90CE0()
{
  uint64_t v0;
  char *result;

  result = (char *)operator new(0x30uLL);
  *(_QWORD *)v0 = result;
  *(_OWORD *)(v0 + 8) = xmmword_21AB99460;
  strcpy(result, "Bitcode section not found in object file");
  return result;
}

void sub_21AB90D20()
{
  char *v0;

  v0[23] = 20;
  strcpy(v0, "Invalid symbol index");
}

void sub_21AB90D54(const char *a1, uint64_t a2, const char *a3, void (*a4)(void *))
{
  size_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v17[2];
  _QWORD v18[11];
  char v19;
  uint64_t v20;

  sub_21AB91024((uint64_t)v17);
  sub_21AB911E4(v18, (uint64_t)"Assert: ", 8);
  v7 = strlen(a1);
  v8 = sub_21AB911E4(v18, (uint64_t)a1, v7);
  sub_21AB911E4(v8, (uint64_t)":", 1);
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = sub_21AB911E4(v9, (uint64_t)" : ", 3);
  v11 = strlen(a3);
  v12 = sub_21AB911E4(v10, (uint64_t)a3, v11);
  sub_21AB911E4(v12, (uint64_t)"\n", 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x24BEDB7F0];
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v17 + *(_QWORD *)(v17[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v18[0] = v13;
  v18[1] = MEMORY[0x24BEDB848] + 16;
  if (v19 < 0)
    operator delete((void *)v18[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2207523F0](&v20);
  if (v16 >= 0)
    v14 = &v15;
  else
    v14 = v15;
  a4(v14);
  if (v16 < 0)
    operator delete(v15);
}

void sub_21AB90ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB90F04(char *__src)
{
  unsigned __int8 v2;
  NSObject *v3;
  int v5;
  char *v6;
  char __dst[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  strncpy(__dst, __src, 0x400uLL);
  qword_25510FF38 = (uint64_t)__dst;
  v2 = atomic_load((unsigned __int8 *)&qword_25510FFA8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_25510FFA8))
  {
    qword_25510FFA0 = (uint64_t)os_log_create("CVHWA", "");
    __cxa_guard_release(&qword_25510FFA8);
  }
  v3 = qword_25510FFA0;
  if (os_log_type_enabled((os_log_t)qword_25510FFA0, OS_LOG_TYPE_FAULT))
  {
    v5 = 136446210;
    v6 = __src;
    _os_log_impl(&dword_21AB76000, v3, OS_LOG_TYPE_FAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }
  return fputs(__src, (FILE *)*MEMORY[0x24BDAC8D8]);
}

uint64_t sub_21AB91024(uint64_t a1)
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

void sub_21AB91128(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2207523F0](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB9115C(uint64_t a1)
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
  MEMORY[0x2207523F0](a1 + 128);
  return a1;
}

_QWORD *sub_21AB911E4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2207522DC](v13, a1);
  if (v13[0])
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
    if (!sub_21AB91348(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2207522E8](v13);
  return a1;
}

void sub_21AB912EC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2207522E8](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21AB912CCLL);
}

void sub_21AB91334(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_21AB91348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
  void *__b[2];
  int64_t v22;

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
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_21AB84068();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (v22 >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(v22) < 0)
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

void sub_21AB914D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB914EC()
{
  abort();
}

_QWORD *sub_21AB91500(_QWORD *result, uint64_t a2, unsigned __int8 *a3)
{
  _QWORD **v4;
  _QWORD *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;
  uint64_t *v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (*result)
  {
    v4 = (_QWORD **)result;
    result = sub_21AB95750(a3, a2);
    v5 = *v4;
    *v4 = 0;
    if (v5)
    {
      if ((*(unsigned int (**)(_QWORD *, void *))(*v5 + 48))(v5, &unk_255110171))
      {
        v6 = (uint64_t **)v5[1];
        v7 = (uint64_t **)v5[2];
        if (v6 != v7)
        {
          v8 = 0;
          do
          {
            v13 = v8;
            v9 = *v6;
            *v6 = 0;
            if ((*(unsigned int (**)(uint64_t *, void *))(*v9 + 48))(v9, &unk_255110170))
            {
              (*(void (**)(uint64_t *, uint64_t))(*v9 + 16))(v9, a2);
              v10 = *(_BYTE **)(a2 + 32);
              if (*(_BYTE **)(a2 + 24) == v10)
              {
                sub_21AB95F84(a2, "\n", 1uLL);
              }
              else
              {
                *v10 = 10;
                ++*(_QWORD *)(a2 + 32);
              }
              v12 = 0;
              (*(void (**)(uint64_t *))(*v9 + 8))(v9);
            }
            else
            {
              v12 = v9;
            }
            sub_21AB8BC7C(&v13, &v12, &v14);
            v8 = v14;
            v14 = 0;
            if (v12)
              (*(void (**)(uint64_t *))(*v12 + 8))(v12);
            if (v13)
              (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
            ++v6;
          }
          while (v6 != v7);
        }
      }
      else
      {
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *, void *))(*v5 + 48))(v5, &unk_255110170);
        if (!(_DWORD)result)
          return result;
        (*(void (**)(_QWORD *, uint64_t))(*v5 + 16))(v5, a2);
        v11 = *(_BYTE **)(a2 + 32);
        if (*(_BYTE **)(a2 + 24) == v11)
        {
          sub_21AB95F84(a2, "\n", 1uLL);
        }
        else
        {
          *v11 = 10;
          ++*(_QWORD *)(a2 + 32);
        }
      }
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v5 + 8))(v5);
    }
  }
  return result;
}

void sub_21AB916EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_21AB91710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;

  (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  if (a11)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a11 + 8))(a11);
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    _Unwind_Resume(a1);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB91780()
{
  if (!atomic_load(qword_25510FFB0))
    sub_21AB929AC(qword_25510FFB0, (uint64_t (*)(void))sub_21AB91FB4, (unint64_t)sub_21AB91FE8);
  return 1;
}

_QWORD *sub_21AB917DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;

  if ((_DWORD)a1)
  {
    result = (_QWORD *)operator new();
    *result = &off_24DDB79A0;
    result[1] = a1;
    result[2] = a2;
    *a3 = result;
  }
  else
  {
    result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t sub_21AB91854(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t **v3;
  uint64_t **v4;
  std::string::size_type v5;
  uint64_t *v6;
  const std::error_category *v7;
  const std::error_category *v8;
  std::string v12;
  std::string *v13;
  __int16 v14;
  std::error_code v15;
  uint64_t *v16;

  v15.__val_ = 0;
  v15.__cat_ = std::system_category();
  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if ((*(unsigned int (**)(_QWORD *, void *))(*v2 + 48))(v2, &unk_255110171))
    {
      v3 = (uint64_t **)v2[1];
      v4 = (uint64_t **)v2[2];
      if (v3 != v4)
      {
        v5 = 0;
        do
        {
          v12.__r_.__value_.__r.__words[0] = v5;
          v6 = *v3;
          *v3 = 0;
          if ((*(unsigned int (**)(uint64_t *, void *))(*v6 + 48))(v6, &unk_255110170))
          {
            *(_QWORD *)&v15.__val_ = (*(uint64_t (**)(uint64_t *))(*v6 + 32))(v6);
            v15.__cat_ = v7;
            v16 = 0;
            (*(void (**)(uint64_t *))(*v6 + 8))(v6);
          }
          else
          {
            v16 = v6;
          }
          sub_21AB8BC7C((uint64_t *)&v12, &v16, &v13);
          v5 = (std::string::size_type)v13;
          v13 = 0;
          if (v16)
            (*(void (**)(uint64_t *))(*v16 + 8))(v16);
          if (v12.__r_.__value_.__r.__words[0])
            (*(void (**)(std::string::size_type))(*(_QWORD *)v12.__r_.__value_.__l.__data_ + 8))(v12.__r_.__value_.__r.__words[0]);
          ++v3;
        }
        while (v3 != v4);
      }
    }
    else
    {
      if (!(*(unsigned int (**)(_QWORD *, void *))(*v2 + 48))(v2, &unk_255110170))
        goto LABEL_16;
      *(_QWORD *)&v15.__val_ = (*(uint64_t (**)(_QWORD *))(*v2 + 32))(v2);
      v15.__cat_ = v8;
    }
    (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
LABEL_16:
  if (!atomic_load(qword_25510FFB0))
    sub_21AB929AC(qword_25510FFB0, (uint64_t (*)(void))sub_21AB91FB4, (unint64_t)sub_21AB91FE8);
  if (v15.__cat_ == (const std::error_category *)qword_25510FFB0[0] && v15.__val_ == 3)
  {
    std::error_code::message(&v12, &v15);
    v14 = 260;
    v13 = &v12;
    sub_21AB914EC();
  }
  return *(_QWORD *)&v15.__val_;
}

void sub_21AB91A34(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_21AB91A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB91A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (a10)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
    _Unwind_Resume(a1);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB91AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = off_24DDB78C0;
  sub_21AB95348(a2, (_QWORD *)(a1 + 8));
  *(_QWORD *)(a1 + 32) = a3;
  *(_QWORD *)(a1 + 40) = a4;
  *(_BYTE *)(a1 + 48) = 1;
  return a1;
}

void sub_21AB91B3C(uint64_t a1, uint64_t a2)
{
  int v4;
  _BYTE *v5;
  size_t v6;
  std::string *v7;
  size_t size;
  int v9;
  std::string *v10;
  size_t v11;
  std::string v12;

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(char *)(a1 + 31);
    if (v4 >= 0)
      v5 = (_BYTE *)(a1 + 8);
    else
      v5 = *(_BYTE **)(a1 + 8);
    if (v4 >= 0)
      v6 = *(unsigned __int8 *)(a1 + 31);
    else
      v6 = *(_QWORD *)(a1 + 16);
    sub_21AB95F84(a2, v5, v6);
    return;
  }
  std::error_code::message(&v12, (const std::error_code *)(a1 + 32));
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v12;
  else
    v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  else
    size = v12.__r_.__value_.__l.__size_;
  sub_21AB95F84(a2, v7, size);
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    v9 = *(char *)(a1 + 31);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_17;
LABEL_20:
    if (!*(_QWORD *)(a1 + 16))
      return;
    goto LABEL_21;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  v9 = *(char *)(a1 + 31);
  if (v9 < 0)
    goto LABEL_20;
LABEL_17:
  if (!(_BYTE)v9)
    return;
LABEL_21:
  std::operator+<char>();
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &v12;
  else
    v10 = (std::string *)v12.__r_.__value_.__r.__words[0];
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  else
    v11 = v12.__r_.__value_.__l.__size_;
  sub_21AB95F84(a2, v10, v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_21AB91C64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB91C84(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sub_21AB91C90(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 16);
    v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = *(void **)(a1 + 8);
    }
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_21AB91D04(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = *(_QWORD **)(a1 + 16);
    v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = *(void **)(a1 + 8);
    }
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v4);
  }
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB91D88(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *i;
  _BYTE *v7;

  v3 = result;
  v4 = *(_QWORD *)(a2 + 32);
  if ((unint64_t)(*(_QWORD *)(a2 + 24) - v4) > 0x10)
  {
    *(_BYTE *)(v4 + 16) = 10;
    *(_OWORD *)v4 = *(_OWORD *)"Multiple errors:\n";
    *(_QWORD *)(a2 + 32) += 17;
    v5 = *(_QWORD **)(result + 8);
    for (i = *(_QWORD **)(result + 16); v5 != i; ++v5)
    {
LABEL_7:
      while (1)
      {
        result = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v5 + 16))(*v5, a2);
        v7 = *(_BYTE **)(a2 + 32);
        if (*(_BYTE **)(a2 + 24) == v7)
          break;
        *v7 = 10;
        ++*(_QWORD *)(a2 + 32);
        if (++v5 == i)
          return result;
      }
      result = sub_21AB95F84(a2, "\n", 1uLL);
    }
  }
  else
  {
    result = sub_21AB95F84(a2, "Multiple errors:\n", 0x11uLL);
    v5 = *(_QWORD **)(v3 + 8);
    i = *(_QWORD **)(v3 + 16);
    if (v5 != i)
      goto LABEL_7;
  }
  return result;
}

void *sub_21AB91E84()
{
  return &unk_255110171;
}

BOOL sub_21AB91E90(uint64_t a1, void *a2)
{
  return a2 == &unk_255110171 || a2 == &unk_255110170;
}

void sub_21AB91EB0()
{
  JUMPOUT(0x220752450);
}

void *sub_21AB91EC4()
{
  return &unk_255110172;
}

BOOL sub_21AB91ED0(uint64_t a1, void *a2)
{
  return a2 == &unk_255110172 || a2 == &unk_255110170;
}

uint64_t sub_21AB91EF0(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  *(_QWORD *)result = off_24DDB78C0;
  if (*(char *)(result + 31) < 0)
  {
    operator delete(*(void **)(result + 8));
    return v1;
  }
  return result;
}

void sub_21AB91F3C(uint64_t a1)
{
  *(_QWORD *)a1 = off_24DDB78C0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  JUMPOUT(0x220752450);
}

void *sub_21AB91F88()
{
  return &unk_255110173;
}

BOOL sub_21AB91F94(uint64_t a1, void *a2)
{
  return a2 == &unk_255110173 || a2 == &unk_255110170;
}

_QWORD *sub_21AB91FB4()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24DDB7A50;
  return result;
}

uint64_t sub_21AB91FE8(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_21AB92000(std::error_category *a1)
{
  std::error_category::~error_category(a1);
  JUMPOUT(0x220752450);
}

const char *sub_21AB92024()
{
  return "Error";
}

void sub_21AB92030(int a1@<W1>, uint64_t a2@<X8>)
{
  char *v3;

  if (a1 == 3)
  {
    v3 = (char *)operator new(0x80uLL);
    *(_QWORD *)a2 = v3;
    *(_OWORD *)(a2 + 8) = xmmword_21AB99510;
    strcpy(v3, "Inconvertible error value. An error has occurred that could not be converted to a known std::error_code. Please file a bug.");
  }
  else if (a1 == 2)
  {
    strcpy((char *)a2, "A file error occurred.");
    *(_BYTE *)(a2 + 23) = 22;
  }
  else
  {
    *(_BYTE *)(a2 + 23) = 15;
    strcpy((char *)a2, "Multiple errors");
  }
}

uint64_t sub_21AB92104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unsigned __int8 *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  unsigned __int8 *v52;
  unint64_t v53;
  __int128 v54;
  _BYTE v55[19];
  _OWORD v56[2];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v54 = a1;
  *((_QWORD *)&v54 + 1) = a2;
  v4 = sub_21AB95020(&v54, "{}", 2, 0);
  if (v4 >= *((_QWORD *)&v54 + 1))
    v5 = *((_QWORD *)&v54 + 1);
  else
    v5 = v4;
  v6 = *((_QWORD *)&v54 + 1) - v5;
  *(_QWORD *)&v56[0] = v54 + v5;
  *((_QWORD *)&v56[0] + 1) = *((_QWORD *)&v54 + 1) - v5;
  v7 = sub_21AB950A0(v56, "{}", 2, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_QWORD *)&v56[0] + 1);
  if ((unint64_t)(v7 + 1) < *((_QWORD *)&v56[0] + 1))
    v9 = v7 + 1;
  else
    v9 = *((_QWORD *)&v56[0] + 1);
  v10 = *((_QWORD *)&v56[0] + 1) - v6 + v9;
  if (*((_QWORD *)&v56[0] + 1) >= v10)
    v8 = v10;
  v52 = *(unsigned __int8 **)&v56[0];
  v53 = v8;
  v11 = sub_21AB95020(&v52, " \t\n\v\f\r", 6, 0);
  if (v11 >= v53)
    v12 = v53;
  else
    v12 = v11;
  v13 = v53 - v12;
  *(_QWORD *)&v56[0] = &v52[v12];
  *((_QWORD *)&v56[0] + 1) = v53 - v12;
  v14 = sub_21AB950A0(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  v15 = *((_QWORD *)&v56[0] + 1);
  if ((unint64_t)(v14 + 1) < *((_QWORD *)&v56[0] + 1))
    v16 = v14 + 1;
  else
    v16 = *((_QWORD *)&v56[0] + 1);
  v17 = *((_QWORD *)&v56[0] + 1) - v13 + v16;
  v52 = *(unsigned __int8 **)&v56[0];
  if (*((_QWORD *)&v56[0] + 1) >= v17)
    v15 = v17;
  v53 = v15;
  *(_QWORD *)&v56[0] = 0;
  result = sub_21AB95130(&v52, 0, (unint64_t *)v56);
  if ((_DWORD)result)
  {
    memset(v56, 0, sizeof(v56));
    *(_OWORD *)(a3 + 8) = 0u;
    memset(v55, 0, sizeof(v55));
    *(_QWORD *)a3 = 0;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_DWORD *)(a3 + 40) = 2;
    *(_BYTE *)(a3 + 44) = 0;
    *(_DWORD *)(a3 + 60) = 0;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v55;
    goto LABEL_71;
  }
  v19 = *(_QWORD *)&v56[0];
  v20 = sub_21AB95020(&v52, " \t\n\v\f\r", 6, 0);
  if (v20 >= v53)
    v21 = v53;
  else
    v21 = v20;
  v22 = v53 - v21;
  *(_QWORD *)&v56[0] = &v52[v21];
  *((_QWORD *)&v56[0] + 1) = v53 - v21;
  v23 = sub_21AB950A0(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v23 + 1) < *((_QWORD *)&v56[0] + 1))
    v24 = v23 + 1;
  else
    v24 = *((_QWORD *)&v56[0] + 1);
  v25 = *((_QWORD *)&v56[0] + 1) - v22 + v24;
  if (*((_QWORD *)&v56[0] + 1) < v25)
    v25 = *((_QWORD *)&v56[0] + 1);
  v52 = *(unsigned __int8 **)&v56[0];
  v53 = v25;
  if (!v25 || **(_BYTE **)&v56[0] != 44)
  {
    v33 = 0;
    v27 = 32;
    v28 = 2;
    goto LABEL_46;
  }
  v26 = (char *)(*(_QWORD *)&v56[0] + 1);
  v27 = 32;
  v28 = 2;
  v29 = v25 - 1;
  v52 = (unsigned __int8 *)(*(_QWORD *)&v56[0] + 1);
  v53 = v25 - 1;
  if (v25 == 1)
  {
    v33 = 0;
    goto LABEL_46;
  }
  v30 = v25 - 2;
  if (v30)
  {
    v31 = (unsigned __int8 *)(*(_QWORD *)&v56[0] + 2);
    v32 = *(char *)(*(_QWORD *)&v56[0] + 2);
    switch(v32)
    {
      case '+':
LABEL_38:
        v27 = *v26;
        if (v29 >= 2)
          v34 = 2;
        else
          v34 = v29;
        v31 = (unsigned __int8 *)&v26[v34];
        v30 = v29 - v34;
        goto LABEL_42;
      case '-':
        v28 = 0;
        goto LABEL_38;
      case '=':
        v28 = 1;
        goto LABEL_38;
    }
    v51 = *v26;
    switch(v51)
    {
      case '+':
LABEL_42:
        v52 = v31;
        v53 = v30;
        break;
      case '-':
        v28 = 0;
        goto LABEL_42;
      case '=':
        v28 = 1;
        goto LABEL_42;
    }
  }
  *(_QWORD *)&v56[0] = 0;
  if (sub_21AB95130(&v52, 0, (unint64_t *)v56))
    v33 = 0;
  else
    v33 = *(_QWORD *)&v56[0];
LABEL_46:
  v35 = sub_21AB95020(&v52, " \t\n\v\f\r", 6, 0);
  if (v35 >= v53)
    v36 = v53;
  else
    v36 = v35;
  v37 = v53 - v36;
  *(_QWORD *)&v56[0] = &v52[v36];
  *((_QWORD *)&v56[0] + 1) = v53 - v36;
  v38 = sub_21AB950A0(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  if ((unint64_t)(v38 + 1) < *((_QWORD *)&v56[0] + 1))
    v39 = v38 + 1;
  else
    v39 = *((_QWORD *)&v56[0] + 1);
  v40 = *((_QWORD *)&v56[0] + 1) - v37 + v39;
  if (*((_QWORD *)&v56[0] + 1) < v40)
    v40 = *((_QWORD *)&v56[0] + 1);
  v52 = *(unsigned __int8 **)&v56[0];
  v53 = v40;
  if (v40 && **(_BYTE **)&v56[0] == 58)
  {
    *(_QWORD *)v55 = *(_QWORD *)&v56[0] + 1;
    *(_QWORD *)&v55[8] = v40 - 1;
    v41 = sub_21AB95020(v55, " \t\n\v\f\r", 6, 0);
    if (v41 >= *(_QWORD *)&v55[8])
      v42 = *(_QWORD *)&v55[8];
    else
      v42 = v41;
    v43 = *(_QWORD *)&v55[8] - v42;
    *(_QWORD *)&v56[0] = *(_QWORD *)v55 + v42;
    *((_QWORD *)&v56[0] + 1) = *(_QWORD *)&v55[8] - v42;
    v44 = sub_21AB950A0(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
    if ((unint64_t)(v44 + 1) < *((_QWORD *)&v56[0] + 1))
      v45 = v44 + 1;
    else
      v45 = *((_QWORD *)&v56[0] + 1);
    v46 = *((_QWORD *)&v56[0] + 1) - v43 + v45;
    v47 = *(_QWORD *)&v56[0];
    if (*((_QWORD *)&v56[0] + 1) >= v46)
      v48 = v46;
    else
      v48 = *((_QWORD *)&v56[0] + 1);
    v52 = 0;
    v53 = 0;
  }
  else
  {
    v48 = 0;
    v47 = 0;
  }
  v49 = sub_21AB95020(&v52, " \t\n\v\f\r", 6, 0);
  if (v49 >= v53)
    v50 = v53;
  else
    v50 = v49;
  *(_QWORD *)&v56[0] = &v52[v50];
  *((_QWORD *)&v56[0] + 1) = v53 - v50;
  result = sub_21AB950A0(v56, " \t\n\v\f\r", 6, 0xFFFFFFFFFFFFFFFFLL);
  *(_DWORD *)a3 = 1;
  *(_OWORD *)(a3 + 8) = v54;
  *(_QWORD *)(a3 + 24) = v19;
  *(_QWORD *)(a3 + 32) = v33;
  *(_DWORD *)(a3 + 40) = v28;
  *(_BYTE *)(a3 + 44) = v27;
  *(_QWORD *)(a3 + 48) = v47;
  *(_QWORD *)(a3 + 56) = v48;
LABEL_71:
  *(_BYTE *)(a3 + 64) = 1;
  return result;
}

double sub_21AB925DC@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  size_t v16;
  double result;
  _BYTE *v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[32];
  __int128 v24;
  __int128 v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (__n)
  {
    v5 = __n;
    while (2)
    {
      if (*__s == 123)
      {
        v6 = 1;
        do
        {
          if (v5 == v6)
          {
            v8 = -1;
            if (v5 != -1)
              v8 = v5;
            if (v8 >= 2)
              goto LABEL_37;
            goto LABEL_14;
          }
          v7 = __s[v6++];
        }
        while (v7 == 123);
        v8 = v6 - 1;
        if (v5 < v8)
          v8 = v5;
        if (v8 >= 2)
        {
LABEL_37:
          v19 = v8 >> 1;
          if (v5 < v8 >> 1)
            v19 = v5;
          *(_QWORD *)(a3 + 24) = 0;
          *(_QWORD *)(a3 + 32) = 0;
          v20 = v8 & 0xFFFFFFFFFFFFFFFELL;
          *(_QWORD *)&v23[11] = 0;
          if (v5 < v20)
            v20 = v5;
          *(_QWORD *)&v23[3] = 0;
          *(_DWORD *)a3 = 2;
          *(_QWORD *)(a3 + 8) = __s;
          *(_QWORD *)(a3 + 16) = v19;
          *(_DWORD *)(a3 + 40) = 2;
          *(_BYTE *)(a3 + 44) = 0;
          result = *(double *)v23;
          *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
          *(_DWORD *)(a3 + 60) = 0;
          *(_QWORD *)(a3 + 64) = &__s[v20];
          *(_QWORD *)(a3 + 72) = v5 - v20;
          return result;
        }
LABEL_14:
        v9 = memchr(__s, 125, v5);
        if (!v9 || (v10 = v9 - __s, v9 - __s == -1))
        {
          *(_QWORD *)(a3 + 24) = 0;
          *(_QWORD *)(a3 + 32) = 0;
          *(_QWORD *)&v23[11] = 0;
          *(_QWORD *)&v23[3] = 0;
          *(_QWORD *)(a3 + 64) = 0;
          *(_QWORD *)(a3 + 72) = 0;
          *(_DWORD *)a3 = 2;
          *(_QWORD *)(a3 + 8) = __s;
          *(_QWORD *)(a3 + 16) = v5;
          goto LABEL_31;
        }
        if (v5 < 2 || (v11 = memchr(__s + 1, 123, v5 - 1)) == 0 || (v12 = v11 - __s, v11 - __s >= v10))
        {
          if (v10 <= 1)
            v13 = 1;
          else
            v13 = v10;
          if (v5 < v13)
            v13 = v5;
          v14 = __s + 1;
          v15 = v13 - 1;
          if (v5 >= v10 + 1)
            v16 = v10 + 1;
          else
            v16 = v5;
          __s += v16;
          v5 -= v16;
          sub_21AB92104((uint64_t)v14, v15, (uint64_t)v23);
          if (v26)
          {
            v21 = *(_OWORD *)&v23[16];
            *(_OWORD *)a3 = *(_OWORD *)v23;
            *(_OWORD *)(a3 + 16) = v21;
            result = *(double *)&v24;
            v22 = v25;
            *(_OWORD *)(a3 + 32) = v24;
            *(_OWORD *)(a3 + 48) = v22;
            *(_QWORD *)(a3 + 64) = __s;
            *(_QWORD *)(a3 + 72) = v5;
            return result;
          }
          if (v5)
            continue;
          goto LABEL_29;
        }
        if (v5 < v12)
          v12 = v5;
        *(_QWORD *)(a3 + 24) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        *(_QWORD *)&v23[11] = 0;
      }
      else
      {
        v18 = memchr(__s, 123, v5);
        v12 = v18 - __s;
        *(_QWORD *)(a3 + 24) = 0;
        *(_QWORD *)(a3 + 32) = 0;
        if (!v18)
          v12 = -1;
        *(_QWORD *)&v23[11] = 0;
        if (v5 < v12)
          v12 = v5;
      }
      break;
    }
    *(_QWORD *)&v23[3] = 0;
    *(_DWORD *)a3 = 2;
    *(_QWORD *)(a3 + 8) = __s;
    *(_QWORD *)(a3 + 16) = v12;
    *(_DWORD *)(a3 + 40) = 2;
    *(_BYTE *)(a3 + 44) = 0;
    result = *(double *)v23;
    *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
    *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
    *(_QWORD *)(a3 + 64) = &__s[v12];
    *(_QWORD *)(a3 + 72) = v5 - v12;
    return result;
  }
LABEL_29:
  *(_QWORD *)&v23[11] = 0;
  *(_QWORD *)&v23[3] = 0;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = 0;
  *(_DWORD *)a3 = 2;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 8) = __s;
  *(_QWORD *)(a3 + 16) = 0;
LABEL_31:
  *(_DWORD *)(a3 + 40) = 2;
  *(_BYTE *)(a3 + 44) = 0;
  result = *(double *)v23;
  *(_OWORD *)(a3 + 45) = *(_OWORD *)v23;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)&v23[15];
  return result;
}

double sub_21AB92858@<D0>(char *__s@<X0>, size_t __n@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  __int128 v5;
  size_t v6;
  unint64_t v8;
  __int128 *v9;
  _OWORD *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  _BYTE *v16;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  char *v21;
  size_t v22;
  _BYTE v23[48];
  __int128 v24;

  v4 = a3 + 16;
  *(_QWORD *)a3 = a3 + 16;
  *(_QWORD *)(a3 + 8) = 0x200000000;
  *(_DWORD *)v23 = 0;
  *(_QWORD *)&v5 = 0;
  memset(&v23[8], 0, 32);
  *(_DWORD *)&v23[40] = 2;
  v23[44] = 0;
  v24 = 0uLL;
  if (__n)
  {
    v6 = __n;
    do
    {
      sub_21AB925DC(__s, v6, (uint64_t)v18);
      *(_OWORD *)v23 = v18[0];
      *(_OWORD *)&v23[16] = v18[1];
      *(_QWORD *)&v5 = v19;
      *(_OWORD *)&v23[32] = v19;
      v24 = v20;
      __s = v21;
      v6 = v22;
      if (!LODWORD(v18[0]))
        continue;
      v13 = *(unsigned int *)(a3 + 8);
      v8 = *(_QWORD *)a3;
      if (v13 >= *(_DWORD *)(a3 + 12))
      {
        v14 = v13 + 1;
        v15 = v8 + (v13 << 6) > (unint64_t)v23;
        if (v8 <= (unint64_t)v23 && v15)
        {
          sub_21AB94AA8(a3, v4, v14, 64);
          v16 = &v23[-v8];
          v8 = *(_QWORD *)a3;
          v9 = (__int128 *)&v16[*(_QWORD *)a3];
          goto LABEL_5;
        }
        sub_21AB94AA8(a3, v4, v14, 64);
        v8 = *(_QWORD *)a3;
      }
      v9 = (__int128 *)v23;
LABEL_5:
      v10 = (_OWORD *)(v8 + ((unint64_t)*(unsigned int *)(a3 + 8) << 6));
      v5 = *v9;
      v11 = v9[1];
      v12 = v9[3];
      v10[2] = v9[2];
      v10[3] = v12;
      *v10 = v5;
      v10[1] = v11;
      ++*(_DWORD *)(a3 + 8);
    }
    while (v6);
  }
  return *(double *)&v5;
}

void sub_21AB9298C(_Unwind_Exception *exception_object)
{
  void *v1;
  void **v2;

  if (*v2 != v1)
    free(*v2);
  _Unwind_Resume(exception_object);
}

void sub_21AB929AC(unint64_t *a1, uint64_t (*a2)(void), unint64_t a3)
{
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;

  if (sub_21AB95340())
  {
    v6 = atomic_load((unsigned __int8 *)&qword_25510FFD0);
    if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25510FFD0))
    {
      MEMORY[0x220752348](&stru_25510FFD8);
      __cxa_atexit(MEMORY[0x24BEDB0A8], &stru_25510FFD8, &dword_21AB76000);
      __cxa_guard_release(&qword_25510FFD0);
    }
    std::recursive_mutex::lock(&stru_25510FFD8);
    if (!*a1)
    {
      atomic_store(a2(), a1);
      v8 = qword_25510FFC8;
      a1[1] = a3;
      a1[2] = v8;
      qword_25510FFC8 = (uint64_t)a1;
    }
    std::recursive_mutex::unlock(&stru_25510FFD8);
  }
  else
  {
    atomic_store(a2(), a1);
    v7 = qword_25510FFC8;
    a1[1] = a3;
    a1[2] = v7;
    qword_25510FFC8 = (uint64_t)a1;
  }
}

void sub_21AB92AA8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_25510FFD0);
  _Unwind_Resume(a1);
}

void sub_21AB92AC0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(&stru_25510FFD8);
  _Unwind_Resume(a1);
}

char *sub_21AB92AD8(uint64_t a1, uint64_t a2)
{
  size_t v3;
  const void *v4;
  char *v5;
  char *v6;
  const char *v8;
  int v9;
  void *v10;
  __int128 v11;
  _QWORD v12[33];

  v12[32] = *MEMORY[0x24BDAC8D0];
  v10 = v12;
  v11 = xmmword_21AB99500;
  if (*(_BYTE *)(a2 + 33) == 1)
  {
    v3 = 0;
    v4 = 0;
    switch(*(_BYTE *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        v4 = *(const void **)a2;
        if (*(_QWORD *)a2)
          v3 = strlen(*(const char **)a2);
        else
          v3 = 0;
        break;
      case 4:
        v8 = *(const char **)a2;
        v9 = *(char *)(*(_QWORD *)a2 + 23);
        if (v9 >= 0)
          v4 = *(const void **)a2;
        else
          v4 = *(const void **)v8;
        if (v9 >= 0)
          v3 = *(unsigned __int8 *)(*(_QWORD *)a2 + 23);
        else
          v3 = *((_QWORD *)v8 + 1);
        break;
      case 5:
        v4 = *(const void **)a2;
        v3 = *(_QWORD *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_21AB95698(a2, (uint64_t)&v10);
    v4 = v10;
    v3 = v11;
  }
  v5 = (char *)operator new(a1 + v3 + 1);
  v6 = &v5[a1];
  if (v3)
    memcpy(v6, v4, v3);
  v6[v3] = 0;
  if (v10 != v12)
    free(v10);
  return v5;
}

void sub_21AB92C28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  void *v9;

  if (a9 != v9)
    free(a9);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_21AB92C48@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  return sub_21AB92C68(a5, a1, 0xFFFFFFFFFFFFFFFFLL, 0, a2, a3, a4);
}

_QWORD *sub_21AB92C68(uint64_t a1, unsigned __int8 *a2, size_t a3, off_t a4, int a5, int a6, char a7)
{
  int v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a5)
    v13 = 3;
  else
    v13 = 0;
  sub_21AB9443C(a2, v13, 0, (uint64_t)&v19);
  if ((v20 & 1) != 0)
  {
    v18 = v19;
    v19 = 0;
    v15 = sub_21AB91854(&v18);
    *(_BYTE *)(a1 + 16) |= 1u;
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 8) = v16;
    result = v18;
    if (v18)
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v18 + 8))(v18);
  }
  else
  {
    v17 = (int)v19;
    sub_21AB92FB8(a1, (int)v19, (uint64_t)a2, 0xFFFFFFFFFFFFFFFFLL, a3, a4, a6, a7);
    result = (_QWORD *)sub_21AB94578(&v17);
  }
  if ((v20 & 1) != 0)
  {
    result = v19;
    v19 = 0;
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  return result;
}

void sub_21AB92D88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t *v13;
  uint64_t v15;

  if ((v13[2] & 1) == 0)
  {
    v15 = *v13;
    *v13 = 0;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  }
  if ((a13 & 1) != 0)
  {
    if (a12)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)a12 + 8))(a12);
      _Unwind_Resume(exception_object);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_21AB92DF8(size_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  size_t v5;
  const void *v6;
  unint64_t v7;
  size_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  _BYTE *v12;
  const char *v13;
  int v14;
  void *v15;
  __int128 v16;
  _QWORD v17[33];

  v17[32] = *MEMORY[0x24BDAC8D0];
  v15 = v17;
  v16 = xmmword_21AB99500;
  if (*(_BYTE *)(a2 + 33) == 1)
  {
    v5 = 0;
    v6 = 0;
    switch(*(_BYTE *)(a2 + 32))
    {
      case 1:
        break;
      case 3:
        v6 = *(const void **)a2;
        if (*(_QWORD *)a2)
          v5 = strlen(*(const char **)a2);
        else
          v5 = 0;
        break;
      case 4:
        v13 = *(const char **)a2;
        v14 = *(char *)(*(_QWORD *)a2 + 23);
        if (v14 >= 0)
          v6 = *(const void **)a2;
        else
          v6 = *(const void **)v13;
        if (v14 >= 0)
          v5 = *(unsigned __int8 *)(*(_QWORD *)a2 + 23);
        else
          v5 = *((_QWORD *)v13 + 1);
        break;
      case 5:
        v6 = *(const void **)a2;
        v5 = *(_QWORD *)(a2 + 8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    sub_21AB95698(a2, (uint64_t)&v15);
    v6 = v15;
    v5 = v16;
  }
  v7 = (v5 + 40) & 0xFFFFFFFFFFFFFFF0;
  v8 = a1 + v7 + 1;
  if (v8 <= a1)
  {
    v10 = 0;
  }
  else
  {
    v9 = operator new(v8, MEMORY[0x24BEDB6B8]);
    v10 = v9;
    if (v9)
    {
      v11 = (char *)(v9 + 3);
      if (v5)
        memcpy(v9 + 3, v6, v5);
      v11[v5] = 0;
      v12 = (char *)v10 + v7 + a1;
      *v12 = 0;
      *v10 = &off_24DDB7AD8;
      v10[1] = (char *)v10 + v7;
      v10[2] = v12;
    }
  }
  *a3 = v10;
  if (v15 != v17)
    free(v15);
}

void sub_21AB92F9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  void *v9;

  if (a9 != v9)
    free(a9);
  _Unwind_Resume(exception_object);
}

void sub_21AB92FB8(uint64_t a1, int a2, uint64_t a3, size_t a4, size_t a5, off_t a6, int a7, char a8)
{
  unsigned __int8 v16;
  size_t v17;
  BOOL v18;
  char v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const std::error_category *v34;
  char v35;
  char v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD v39[2];
  char v40;
  __int128 v41;
  _BYTE v42[28];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v16 = atomic_load((unsigned __int8 *)&qword_255110028);
  if ((v16 & 1) == 0 && __cxa_guard_acquire(&qword_255110028))
  {
    dword_25511001C = sub_21AB93678();
    __cxa_guard_release(&qword_255110028);
  }
  if (a5 == -1 && (a5 = a4, a4 == -1))
  {
    v41 = 0u;
    memset(v42, 0, sizeof(v42));
    v43 = 0xFFFFLL;
    v44 = 0;
    v45 = 0;
    v25 = sub_21AB94174(a2, (uint64_t)&v41);
    if ((_DWORD)v25)
    {
      *(_BYTE *)(a1 + 16) |= 1u;
      *(_QWORD *)a1 = v25;
      *(_QWORD *)(a1 + 8) = v26;
      return;
    }
    if (*(_DWORD *)&v42[24] != 2 && *(_DWORD *)&v42[24] != 5)
    {
      sub_21AB93480();
      v35 = *(_BYTE *)(a1 + 16);
      if ((v40 & 1) != 0)
      {
        v36 = v35 | 1;
        v37 = v39[0];
        *(_QWORD *)(a1 + 8) = v39[1];
      }
      else
      {
        v36 = v35 & 0xFE;
        v37 = v39[0];
      }
      *(_BYTE *)(a1 + 16) = v36;
      *(_QWORD *)a1 = v37;
      return;
    }
    a5 = *(_QWORD *)&v42[16];
    a4 = *(_QWORD *)&v42[16];
    v17 = dword_25511001C;
    if (a7)
    {
LABEL_5:
      if ((a8 & 1) != 0)
        goto LABEL_27;
    }
  }
  else
  {
    v17 = dword_25511001C;
    if (a7)
      goto LABEL_5;
  }
  v18 = a5 >= 0x4000 && a5 >= v17;
  v19 = !v18;
  if (v18 && a7)
  {
    if (a4 == -1)
    {
      v41 = 0u;
      memset(v42, 0, sizeof(v42));
      v43 = 0xFFFFLL;
      v44 = 0;
      v45 = 0;
      if (sub_21AB94174(a2, (uint64_t)&v41))
        goto LABEL_27;
      a4 = *(_QWORD *)&v42[16];
      if (a5 + a6 != *(_QWORD *)&v42[16])
        goto LABEL_27;
LABEL_17:
      if ((a4 & ((int)v17 - 1)) == 0)
        goto LABEL_27;
LABEL_20:
      LODWORD(v41) = 0;
      *((_QWORD *)&v41 + 1) = std::system_category();
      v20 = sub_21AB92AD8(48, a3);
      *(_QWORD *)v20 = off_24DDB7B28;
      v21 = sub_21AB94290();
      v22 = sub_21AB94290();
      sub_21AB941AC((uint64_t)(v20 + 24), a2, 0, ((v21 - 1) & (unint64_t)a6) + a5, -v22 & (unint64_t)a6, &v41);
      if (!(_DWORD)v41)
      {
        v23 = sub_21AB93EF4((uint64_t)(v20 + 24));
        v24 = v23 + ((int)(sub_21AB94290() - 1) & (unint64_t)a6);
        *((_QWORD *)v20 + 1) = v24;
        *((_QWORD *)v20 + 2) = v24 + a5;
        if (!(_DWORD)v41)
        {
          *(_BYTE *)(a1 + 16) &= ~1u;
          *(_QWORD *)a1 = v20;
          return;
        }
      }
      (*(void (**)(char *))(*(_QWORD *)v20 + 8))(v20);
      goto LABEL_27;
    }
    if (a5 + a6 == a4)
      goto LABEL_17;
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_20;
  }
LABEL_27:
  sub_21AB92DF8(a5, a3, v39);
  if (!v39[0])
  {
    v34 = std::generic_category();
    *(_BYTE *)(a1 + 16) |= 1u;
    *(_QWORD *)a1 = 12;
    *(_QWORD *)(a1 + 8) = v34;
    return;
  }
  v27 = *(char **)(v39[0] + 8);
  v28 = *(_QWORD *)(v39[0] + 16) - (_QWORD)v27;
  do
  {
    if (!v28)
      goto LABEL_44;
    sub_21AB944B8(a2, v27, v28, a6, (uint64_t)&v41);
    if ((BYTE8(v41) & 1) != 0)
    {
      v30 = (_QWORD *)v41;
      *(_QWORD *)&v41 = 0;
      v38 = v30;
      v31 = sub_21AB91854(&v38);
      *(_BYTE *)(a1 + 16) |= 1u;
      *(_QWORD *)a1 = v31;
      *(_QWORD *)(a1 + 8) = v32;
      if (v38)
      {
        (*(void (**)(_QWORD *))(*v38 + 8))(v38);
        v29 = 1;
        if ((BYTE8(v41) & 1) == 0)
          continue;
      }
      else
      {
        v29 = 1;
        if ((BYTE8(v41) & 1) == 0)
          continue;
      }
    }
    else if ((_QWORD)v41)
    {
      v29 = 0;
      v28 -= v41;
      v27 += v41;
      a6 += v41;
      if ((BYTE8(v41) & 1) == 0)
        continue;
    }
    else
    {
      bzero(v27, v28);
      v29 = 3;
      if ((BYTE8(v41) & 1) == 0)
        continue;
    }
    v33 = v41;
    *(_QWORD *)&v41 = 0;
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  }
  while (!v29);
  if (v29 == 3)
  {
LABEL_44:
    *(_BYTE *)(a1 + 16) &= ~1u;
    *(_QWORD *)a1 = v39[0];
    return;
  }
  if (v39[0])
    (*(void (**)(_QWORD))(*(_QWORD *)v39[0] + 8))(v39[0]);
}

void sub_21AB933E0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_255110028);
  _Unwind_Resume(a1);
}

void sub_21AB933F8(_Unwind_Exception *a1)
{
  size_t *v1;

  sub_21AB9425C(v1);
  _Unwind_Resume(a1);
}

void sub_21AB93480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  const std::error_category *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  _QWORD v16[2049];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v16[2048] = *MEMORY[0x24BDAC8D0];
  v14 = v16;
  v15 = xmmword_21AB99640;
  sub_21AB93EFC(v4, &v14, 0x4000uLL, &v13);
  if (v13)
  {
    v12 = (_QWORD *)v13;
    v13 = 0;
    v5 = sub_21AB91854(&v12);
    *(_BYTE *)(v3 + 16) |= 1u;
    *(_QWORD *)v3 = v5;
    *(_QWORD *)(v3 + 8) = v6;
    if (v12)
      (*(void (**)(_QWORD *))(*v12 + 8))(v12);
    if (v13)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
      v7 = v14;
      if (v14 == v16)
        return;
      goto LABEL_10;
    }
LABEL_9:
    v7 = v14;
    if (v14 == v16)
      return;
    goto LABEL_10;
  }
  v8 = v14;
  v9 = v15;
  sub_21AB92DF8(v15, v2, &v13);
  v10 = v13;
  if (v13)
  {
    memcpy(*(void **)(v13 + 8), v8, v9);
    *(_BYTE *)(v3 + 16) &= ~1u;
    *(_QWORD *)v3 = v10;
    goto LABEL_9;
  }
  v11 = std::generic_category();
  *(_BYTE *)(v3 + 16) |= 1u;
  *(_QWORD *)v3 = 12;
  *(_QWORD *)(v3 + 8) = v11;
  v7 = v14;
  if (v14 == v16)
    return;
LABEL_10:
  free(v7);
}

void sub_21AB935FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  if (a11 != v11)
  {
    free(a11);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB93678()
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_21AB9458C((uint64_t)&v5);
  if ((v6 & 1) == 0)
    return v5;
  v1 = v5;
  v5 = 0;
  v3 = v1;
  sub_21AB8BA54(&v3, &v4);
  if (v3)
    (*(void (**)(_QWORD *))(*v3 + 8))(v3);
  if ((v6 & 1) != 0)
  {
    v2 = v5;
    v5 = 0;
    if (v2)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  return 4096;
}

void sub_21AB93730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a13)
    (*(void (**)(uint64_t))(*(_QWORD *)a13 + 8))(a13);
  sub_21AB98390((uint64_t)&a12, &a16, &a15);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB93774(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 24;
  strlen((const char *)(a1 + 24));
  return v1;
}

uint64_t sub_21AB937A0()
{
  return 0;
}

_QWORD *sub_21AB937A8(_QWORD *a1)
{
  *a1 = off_24DDB7B28;
  sub_21AB9425C(a1 + 3);
  return a1;
}

void sub_21AB937DC(size_t *a1)
{
  *a1 = (size_t)off_24DDB7B28;
  sub_21AB9425C(a1 + 3);
  operator delete(a1);
}

uint64_t sub_21AB93810(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 48;
  strlen((const char *)(a1 + 48));
  return v1;
}

void *sub_21AB9383C(uint64_t a1)
{
  return sub_21AB94274((size_t *)(a1 + 24));
}

uint64_t sub_21AB93844()
{
  return 1;
}

uint64_t sub_21AB9384C(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  return sub_21AB93854(a1, a2, a3, a4, 0);
}

uint64_t sub_21AB93854(uint64_t a1, unint64_t a2, size_t a3, int a4, int a5)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  BOOL v12;
  size_t v13;
  _BYTE *v14;
  size_t v15;
  _BYTE *v16;
  _BYTE *v17;
  unint64_t v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  _BYTE *v22;
  _OWORD v23[8];
  _BYTE v24[8];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!HIDWORD(a2))
    return sub_21AB93BC8(a1, a2, a3, a4, a5);
  v9 = 0;
  v10 = 0;
  *(_QWORD *)&v11 = 0x3030303030303030;
  *((_QWORD *)&v11 + 1) = 0x3030303030303030;
  v23[6] = v11;
  v23[7] = v11;
  v23[4] = v11;
  v23[5] = v11;
  v23[2] = v11;
  v23[3] = v11;
  v23[0] = v11;
  v23[1] = v11;
  do
  {
    *((_BYTE *)&v23[7] + v10-- + 15) = (a2 % 0xA) | 0x30;
    v9 += 0x100000000;
    v12 = a2 > 9;
    a2 /= 0xAuLL;
  }
  while (v12);
  v13 = v9 >> 32;
  if (!a5)
  {
LABEL_8:
    if (a4 != 1)
      goto LABEL_9;
    goto LABEL_14;
  }
  v14 = *(_BYTE **)(a1 + 32);
  if ((unint64_t)v14 < *(_QWORD *)(a1 + 24))
  {
    *(_QWORD *)(a1 + 32) = v14 + 1;
    *v14 = 45;
    goto LABEL_8;
  }
  sub_21AB95ED8(a1, 45);
  if (a4 != 1)
  {
LABEL_9:
    if (v13 < a3)
    {
      v15 = v13;
      do
      {
        while (1)
        {
          v16 = *(_BYTE **)(a1 + 32);
          if ((unint64_t)v16 >= *(_QWORD *)(a1 + 24))
            break;
          *(_QWORD *)(a1 + 32) = v16 + 1;
          *v16 = 48;
          if (++v15 >= a3)
            goto LABEL_14;
        }
        sub_21AB95ED8(a1, 48);
        ++v15;
      }
      while (v15 < a3);
    }
  }
LABEL_14:
  v17 = &v24[-v13];
  if (a4 != 1)
    return sub_21AB95F84(a1, v17, v13);
  v18 = (v13 - 1) % 3;
  v19 = v13 - (v18 + 1);
  if (v13 >= v18 + 1)
    v20 = v18 + 1;
  else
    v20 = v13;
  result = sub_21AB95F84(a1, v17, v20);
  if (v19)
  {
    v21 = -3 * ((-(int)v10 - 1) / 3uLL);
    do
    {
      v22 = *(_BYTE **)(a1 + 32);
      if ((unint64_t)v22 < *(_QWORD *)(a1 + 24))
      {
        *(_QWORD *)(a1 + 32) = v22 + 1;
        *v22 = 44;
      }
      else
      {
        sub_21AB95ED8(a1, 44);
      }
      result = sub_21AB95F84(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

uint64_t sub_21AB93AAC(uint64_t a1, unint64_t a2, size_t a3, int a4)
{
  int v4;

  if ((a2 & 0x8000000000000000) != 0)
  {
    a2 = -(uint64_t)a2;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  return sub_21AB93854(a1, a2, a3, a4, v4);
}

uint64_t sub_21AB93AC4(uint64_t a1, unint64_t a2, int a3, unint64_t a4, char a5)
{
  unsigned int v5;
  __int128 v6;
  size_t v7;
  char *v8;
  BOOL v9;
  _OWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    if (a4 > 0x7F)
      LODWORD(a4) = 128;
  }
  else
  {
    LODWORD(a4) = 0;
  }
  v5 = (67 - __clz(a2)) >> 2;
  if (v5 <= 1)
    v5 = 1;
  *(_QWORD *)&v6 = 0x3030303030303030;
  *((_QWORD *)&v6 + 1) = 0x3030303030303030;
  v11[6] = v6;
  v11[7] = v6;
  v11[4] = v6;
  v11[5] = v6;
  LODWORD(v7) = v5 + 2 * ((a3 & 0xFFFFFFFE) == 2);
  v11[2] = v6;
  v11[3] = v6;
  if (v7 <= a4)
    v7 = a4;
  else
    v7 = v7;
  v11[0] = v6;
  v11[1] = v6;
  if ((a3 & 0xFFFFFFFE) == 2)
    BYTE1(v11[0]) = 120;
  if (a2)
  {
    v8 = (char *)&v11[-1] + v7 + 15;
    do
    {
      *v8-- = a0123456789abcd[a2 & 0xF] | (32 * ((a3 & 0xFFFFFFFD) != 0));
      v9 = a2 > 0xF;
      a2 >>= 4;
    }
    while (v9);
  }
  return sub_21AB95F84(a1, v11, v7);
}

uint64_t sub_21AB93BC8(uint64_t a1, unsigned int a2, size_t a3, int a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  BOOL v11;
  size_t v12;
  _BYTE *v13;
  size_t v14;
  _BYTE *v15;
  _BYTE *v16;
  unint64_t v17;
  size_t v18;
  size_t v19;
  uint64_t result;
  unint64_t v21;
  _BYTE *v22;
  _OWORD v23[8];
  _BYTE v24[8];
  uint64_t v25;

  v8 = 0;
  v9 = 0;
  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v10 = 0x3030303030303030;
  *((_QWORD *)&v10 + 1) = 0x3030303030303030;
  v23[6] = v10;
  v23[7] = v10;
  v23[4] = v10;
  v23[5] = v10;
  v23[2] = v10;
  v23[3] = v10;
  v23[0] = v10;
  v23[1] = v10;
  do
  {
    *((_BYTE *)&v23[7] + v9-- + 15) = (a2 % 0xA) | 0x30;
    v8 += 0x100000000;
    v11 = a2 > 9;
    a2 /= 0xAu;
  }
  while (v11);
  v12 = v8 >> 32;
  if (!a5)
  {
LABEL_6:
    if (a4 == 1)
      goto LABEL_14;
    goto LABEL_9;
  }
  v13 = *(_BYTE **)(a1 + 32);
  if ((unint64_t)v13 < *(_QWORD *)(a1 + 24))
  {
    *(_QWORD *)(a1 + 32) = v13 + 1;
    *v13 = 45;
    goto LABEL_6;
  }
  sub_21AB95ED8(a1, 45);
  if (a4 == 1)
    goto LABEL_14;
LABEL_9:
  if (v12 < a3)
  {
    v14 = v12;
    do
    {
      while (1)
      {
        v15 = *(_BYTE **)(a1 + 32);
        if ((unint64_t)v15 >= *(_QWORD *)(a1 + 24))
          break;
        *(_QWORD *)(a1 + 32) = v15 + 1;
        *v15 = 48;
        if (++v14 >= a3)
          goto LABEL_14;
      }
      sub_21AB95ED8(a1, 48);
      ++v14;
    }
    while (v14 < a3);
  }
LABEL_14:
  v16 = &v24[-v12];
  if (a4 != 1)
    return sub_21AB95F84(a1, v16, v12);
  v17 = (v12 - 1) % 3;
  v18 = v12 - (v17 + 1);
  if (v12 >= v17 + 1)
    v19 = v17 + 1;
  else
    v19 = v12;
  result = sub_21AB95F84(a1, v16, v19);
  if (v18)
  {
    v21 = -3 * ((-(int)v9 - 1) / 3uLL);
    do
    {
      v22 = *(_BYTE **)(a1 + 32);
      if ((unint64_t)v22 < *(_QWORD *)(a1 + 24))
      {
        *(_QWORD *)(a1 + 32) = v22 + 1;
        *v22 = 44;
      }
      else
      {
        sub_21AB95ED8(a1, 44);
      }
      result = sub_21AB95F84(a1, &v24[v21], 3uLL);
      v21 += 3;
    }
    while (v21);
  }
  return result;
}

unint64_t sub_21AB93DD8(unsigned __int8 *a1, int *a2, int a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  size_t v10;
  uint64_t v11;
  char __s[1024];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = sub_21AB94294(a1, a2, 2, 1, a3, 438);
  v7 = v6;
  if ((_DWORD)v6)
  {
    v8 = v6 & 0xFFFFFFFF00000000;
  }
  else
  {
    if (a4)
    {
      a4[1] = 0;
      if (fcntl(*a2, 50, __s) != -1)
      {
        v10 = strlen(__s);
        v11 = a4[1];
        if (a4[2] < v11 + v10)
        {
          sub_21AB94BC0((uint64_t)a4, a4 + 3, v11 + v10, 1);
          v11 = a4[1];
        }
        if (v10)
        {
          memcpy((void *)(*a4 + v11), __s, v10);
          v11 = a4[1];
        }
        a4[1] = v11 + v10;
      }
    }
    std::system_category();
    v8 = 0;
  }
  return v8 | v7;
}

uint64_t sub_21AB93EF4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

ssize_t sub_21AB93EFC@<X0>(int a1@<W0>, _QWORD *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  unint64_t v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  ssize_t result;
  unint64_t v16;
  uint64_t v17;
  const std::error_category *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a2[1];
  v9 = a2 + 3;
  if (a3 >= 0x7FFFFFFF)
    v10 = 0x7FFFFFFFLL;
  else
    v10 = a3;
  v11 = a2[1];
  v12 = v8 + a3;
  v13 = v8 > v8 + a3;
  if (v8 != v8 + a3)
  {
LABEL_5:
    if (!v13 && a2[2] < v12)
      sub_21AB94BC0((uint64_t)a2, v9, v12, 1);
    a2[1] = v12;
  }
  while (1)
  {
    v14 = (void *)(*a2 + v11);
    while (1)
    {
      *__error() = 0;
      result = read(a1, v14, v10);
      if (result != -1)
        break;
      if (*__error() != 4)
      {
        v17 = *__error();
        v18 = std::generic_category();
        result = (ssize_t)sub_21AB917DC(v17, (uint64_t)v18, &v20);
        v19 = v20;
        goto LABEL_16;
      }
    }
    if (!result)
      break;
    v11 += result;
    v16 = a2[1];
    v12 = v11 + a3;
    v13 = v16 > v11 + a3;
    if (v16 != v11 + a3)
      goto LABEL_5;
  }
  v19 = 0;
LABEL_16:
  *a4 = v19;
  a2[1] = v11;
  return result;
}

void sub_21AB94018(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_21AB94020(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_21AB94028(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_21AB94030(int a1, int *a2, uint64_t a3)
{
  uint64_t v4;
  const std::error_category *v5;
  int v7;
  int v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    v4 = *__error();
    v5 = std::generic_category();
    if (v5 == std::generic_category() && (_DWORD)v4 == 2)
    {
      *(_QWORD *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_QWORD *)(a3 + 40) = 0xFFFF00000001;
      *(_DWORD *)(a3 + 48) = 0;
      *(_WORD *)(a3 + 52) = 0;
      *(_QWORD *)(a3 + 56) = 0;
      return 2;
    }
    else
    {
      *(_OWORD *)(a3 + 28) = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_QWORD *)(a3 + 44) = 0xFFFFLL;
      *(_WORD *)(a3 + 52) = 0;
      *(_QWORD *)(a3 + 56) = 0;
      return v4;
    }
  }
  else
  {
    v7 = a2[10];
    v8 = a2[14];
    v9 = *((unsigned __int16 *)a2 + 2);
    v10 = v9 & 0xFFF;
    v11 = (v9 >> 12) ^ 8;
    if ((_DWORD)v11 == 15)
      v12 = 9;
    else
      v12 = dword_21AB99728[v11];
    v13 = *a2;
    v14 = *((_WORD *)a2 + 3);
    v15 = *((_QWORD *)a2 + 1);
    v16 = *((_QWORD *)a2 + 6);
    v17 = *((_QWORD *)a2 + 12);
    v18 = *((_QWORD *)a2 + 2);
    *(_QWORD *)a3 = *((_QWORD *)a2 + 4);
    *(_QWORD *)(a3 + 8) = v16;
    *(_DWORD *)(a3 + 16) = v7;
    *(_DWORD *)(a3 + 20) = v8;
    *(_QWORD *)(a3 + 24) = v18;
    *(_QWORD *)(a3 + 32) = v17;
    *(_DWORD *)(a3 + 40) = v12;
    *(_DWORD *)(a3 + 44) = v10;
    *(_DWORD *)(a3 + 48) = v13;
    *(_WORD *)(a3 + 52) = v14;
    *(_QWORD *)(a3 + 56) = v15;
    std::system_category();
    return 0;
  }
}

uint64_t sub_21AB94174(int a1, uint64_t a2)
{
  int v3;
  stat v5;

  v3 = fstat(a1, &v5);
  return sub_21AB94030(v3, &v5.st_dev, a2);
}

uint64_t sub_21AB941AC(uint64_t a1, int a2, int a3, size_t a4, off_t a5, _QWORD *a6)
{
  int v9;
  BOOL v10;
  int v11;
  int v12;
  void *v13;
  const std::error_category *v14;
  uint64_t v16;
  const std::error_category *v17;

  *(_QWORD *)a1 = a4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = a3;
  if (a3 == 1)
    v9 = 65;
  else
    v9 = 66;
  v10 = a3 == 0;
  if (a3)
    v11 = 3;
  else
    v11 = 1;
  if (v10)
    v12 = 24642;
  else
    v12 = v9;
  v13 = mmap(0, a4, v11, v12, a2, a5);
  *(_QWORD *)(a1 + 8) = v13;
  if (v13 != (void *)-1)
  {
    v14 = std::system_category();
    *a6 = 0;
    a6[1] = v14;
    return a1;
  }
  v16 = *__error();
  v17 = std::generic_category();
  *a6 = v16;
  a6[1] = v17;
  if (!(_DWORD)v16)
    return a1;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  return a1;
}

void *sub_21AB9425C(size_t *a1)
{
  void *result;

  result = (void *)a1[1];
  if (result)
    return (void *)munmap(result, *a1);
  return result;
}

void *sub_21AB94274(size_t *a1)
{
  void *result;

  result = (void *)a1[1];
  if (result)
    return (void *)posix_madvise(result, *a1, 4);
  return result;
}

uint64_t sub_21AB94294(unsigned __int8 *a1, int *a2, int a3, int a4, int a5, uint64_t a6)
{
  int v9;
  int v10;
  int v12;
  int v13;
  int v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  _QWORD v23[17];

  v23[16] = *MEMORY[0x24BDAC8D0];
  v9 = 2 * (a4 == 3);
  if (a4 == 2)
    v9 = 1;
  if (a4 == 1)
    v9 = 0;
  v10 = a5 & 4;
  if ((a5 & 4) != 0)
    a3 = 3;
  v12 = v9 | 0x600;
  v13 = v9 | 0x200;
  if (a3 == 1)
    v9 |= 0xA00u;
  if (a3 == 3)
    v9 = v13;
  if (a3)
    v14 = v9;
  else
    v14 = v12;
  v21 = v23;
  v22 = xmmword_21AB99710;
  v15 = (const char *)sub_21AB95788(a1, (uint64_t)&v21);
  v16 = v14 | ((a5 << 20) & 0x1000000 | (2 * v10)) ^ 0x1000000;
  while (1)
  {
    *__error() = 0;
    v17 = open(v15, v16, a6);
    if (v17 != -1)
      break;
    if (*__error() != 4)
    {
      *a2 = -1;
      goto LABEL_22;
    }
  }
  *a2 = v17;
  if ((v17 & 0x80000000) == 0)
  {
    std::system_category();
    v18 = 0;
    v19 = v21;
    if (v21 == v23)
      return v18;
    goto LABEL_23;
  }
LABEL_22:
  v18 = *__error();
  std::generic_category();
  v19 = v21;
  if (v21 == v23)
    return v18;
LABEL_23:
  free(v19);
  return v18;
}

void sub_21AB94418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  if (a11 != v11)
    free(a11);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB9443C@<X0>(unsigned __int8 *a1@<X0>, int a2@<W1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v8 = 0;
  result = sub_21AB93DD8(a1, &v8, a2, a3);
  if ((_DWORD)result)
  {
    result = (uint64_t)sub_21AB917DC(result, v6, &v7);
    *(_BYTE *)(a4 + 8) |= 1u;
    *(_QWORD *)a4 = v7;
  }
  else
  {
    *(_BYTE *)(a4 + 8) &= ~1u;
    *(_DWORD *)a4 = v8;
  }
  return result;
}

ssize_t sub_21AB944B8@<X0>(int a1@<W0>, void *a2@<X1>, unint64_t a3@<X2>, off_t a4@<X3>, uint64_t a5@<X8>)
{
  size_t v9;
  ssize_t result;
  uint64_t v11;
  const std::error_category *v12;
  ssize_t v13;

  if (a3 >= 0x7FFFFFFF)
    v9 = 0x7FFFFFFFLL;
  else
    v9 = a3;
  while (1)
  {
    *__error() = 0;
    result = pread(a1, a2, v9, a4);
    if (result != -1)
      break;
    if (*__error() != 4)
    {
      v11 = *__error();
      v12 = std::generic_category();
      sub_21AB917DC(v11, (uint64_t)v12, &v13);
      *(_BYTE *)(a5 + 8) |= 1u;
      result = v13;
      goto LABEL_8;
    }
  }
  *(_BYTE *)(a5 + 8) &= ~1u;
LABEL_8:
  *(_QWORD *)a5 = result;
  return result;
}

uint64_t sub_21AB94578(int *a1)
{
  int v1;

  v1 = *a1;
  *a1 = -1;
  return sub_21AB9464C(v1);
}

void sub_21AB9458C(uint64_t a1@<X8>)
{
  unsigned __int8 v2;
  int v3;
  uint64_t v4;
  const std::error_category *v5;
  uint64_t v6;

  v2 = atomic_load((unsigned __int8 *)qword_255110050);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(qword_255110050))
  {
    dword_255110048 = getpagesize();
    __cxa_guard_release(qword_255110050);
  }
  v3 = dword_255110048;
  if (dword_255110048 == -1)
  {
    v4 = *__error();
    v5 = std::generic_category();
    sub_21AB917DC(v4, (uint64_t)v5, &v6);
    *(_BYTE *)(a1 + 8) |= 1u;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_BYTE *)(a1 + 8) &= ~1u;
    *(_DWORD *)a1 = v3;
  }
}

uint64_t sub_21AB9464C(int a1)
{
  unsigned int v2;
  int v3;
  sigset_t v5;
  sigset_t v6;

  v5 = -1;
  v6 = -1;
  v2 = pthread_sigmask(3, &v6, &v5);
  if (!v2)
  {
    if ((close(a1) & 0x80000000) == 0)
    {
      v3 = pthread_sigmask(3, &v5, 0);
LABEL_5:
      v2 = v3;
      goto LABEL_6;
    }
    v2 = *__error();
    v3 = pthread_sigmask(3, &v5, 0);
    if (!v2)
      goto LABEL_5;
  }
LABEL_6:
  std::generic_category();
  return v2;
}

BOOL sub_21AB946DC(int a1)
{
  return isatty(a1) != 0;
}

BOOL sub_21AB946F8()
{
  char *v0;
  char *v1;
  size_t v2;
  BOOL v8;

  v0 = getenv("TERM");
  v1 = v0;
  if (!v0)
    return 0;
  v2 = strlen(v0);
  if (v2 == 6)
  {
    if (*(_DWORD *)v1 == 2003269987 && *((_WORD *)v1 + 2) == 28265)
      return v1 != 0;
LABEL_22:
    if (*(_DWORD *)v1 == 1701995379 && *((_WORD *)v1 + 2) == 28261)
      return v1 != 0;
LABEL_26:
    if (*(_DWORD *)v1 == 1919251576 && v1[4] == 109)
      return v1 != 0;
    v8 = *(_DWORD *)v1 == 808547446 && v1[4] == 48;
    if (v8 || *(_DWORD *)v1 == 1953921138)
      return v1 != 0;
    if (*(_DWORD *)&v1[v2 - 5] == 1869377379 && v1[v2 - 1] == 114)
      return v1 != 0;
    return 0;
  }
  if (v2 == 5)
  {
    if (*(_DWORD *)v1 == 1970170220 && v1[4] == 120)
      return v1 != 0;
    goto LABEL_26;
  }
  if (v2 != 4)
  {
    if (v2 < 6)
      return 0;
    goto LABEL_22;
  }
  if (*(_DWORD *)v1 != 1769172577 && *(_DWORD *)v1 != 1953921138)
    return 0;
  return v1 != 0;
}

BOOL sub_21AB9489C(int a1)
{
  std::mutex *v3;
  TERMINAL *v4;
  _BOOL8 v5;
  int v7;
  TERMINAL *v8;
  int v9;

  if (!isatty(a1))
    return 0;
  if (!atomic_load(qword_255110030))
    sub_21AB929AC(qword_255110030, (uint64_t (*)(void))sub_21AB94A34, (unint64_t)sub_21AB94A7C);
  v3 = (std::mutex *)qword_255110030[0];
  std::mutex::lock((std::mutex *)qword_255110030[0]);
  v4 = set_curterm(0);
  v9 = 0;
  if (setupterm(0, a1, &v9))
  {
    v5 = 0;
  }
  else
  {
    v7 = tigetnum("colors");
    if (v7 < 0)
      v5 = sub_21AB946F8();
    else
      v5 = v7 != 0;
    v8 = set_curterm(v4);
    del_curterm(v8);
  }
  std::mutex::unlock(v3);
  return v5;
}

void sub_21AB94990(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB949A4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB949B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21AB949CC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB949E0()
{
  return 0;
}

char *sub_21AB949E8(char a1, int a2, int a3)
{
  return &a030m[160 * a3 + 80 * a2 + 10 * (a1 & 7)];
}

const char *sub_21AB94A10()
{
  return "\x1B[1m";
}

const char *sub_21AB94A1C()
{
  return "\x1B[7m";
}

const char *sub_21AB94A28()
{
  return "\x1B[0m";
}

double sub_21AB94A34()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  *(_QWORD *)v0 = 850045863;
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_QWORD *)(v0 + 56) = 0;
  return result;
}

std::mutex *sub_21AB94A7C(std::mutex *result)
{
  if (result)
  {
    std::mutex::~mutex(result);
    JUMPOUT(0x220752450);
  }
  return result;
}

void *sub_21AB94AA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *result;
  void *v12;

  if (HIDWORD(a3))
    sub_21AB94CB8(a3);
  v5 = *(unsigned int *)(a1 + 12);
  if ((_DWORD)v5 == -1)
    sub_21AB94F38(0xFFFFFFFFuLL);
  v7 = (2 * v5) | 1;
  if (v7 <= a3)
    v7 = a3;
  if (v7 >= 0xFFFFFFFF)
    v8 = 0xFFFFFFFFLL;
  else
    v8 = v7;
  v9 = *(void **)a1;
  v10 = v8 * a4;
  if (*(_QWORD *)a1 == a2)
  {
    v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0))
LABEL_20:
      sub_21AB914EC();
    result = memcpy(v12, *(const void **)a1, *(unsigned int *)(a1 + 8) * a4);
  }
  else
  {
    result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    v12 = result;
    if (!result)
    {
      if (v10)
        goto LABEL_20;
      result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      v12 = result;
      if (!result)
        goto LABEL_20;
    }
  }
  *(_QWORD *)a1 = v12;
  *(_DWORD *)(a1 + 12) = v8;
  return result;
}

void *sub_21AB94BC0(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *result;
  void *v12;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4 == -1)
    sub_21AB94F38(0xFFFFFFFFFFFFFFFFLL);
  v7 = (2 * v4) | 1;
  if (v7 <= a3)
    v8 = a3;
  else
    v8 = v7;
  v9 = *(void **)a1;
  v10 = v8 * a4;
  if (v9 == a2)
  {
    v12 = malloc_type_malloc(v8 * a4, 0x4065EBACuLL);
    if (!v12 && (v10 || (v12 = malloc_type_malloc(1uLL, 0x4065EBACuLL)) == 0))
LABEL_16:
      sub_21AB914EC();
    result = memcpy(v12, *(const void **)a1, *(_QWORD *)(a1 + 8) * a4);
  }
  else
  {
    result = malloc_type_realloc(v9, v8 * a4, 0x1DB68EDCuLL);
    v12 = result;
    if (!result)
    {
      if (v10)
        goto LABEL_16;
      result = malloc_type_malloc(1uLL, 0x4065EBACuLL);
      v12 = result;
      if (!result)
        goto LABEL_16;
    }
  }
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 16) = v8;
  return result;
}

void sub_21AB94CB8(unint64_t a1)
{
  std::string *v1;
  __int128 v2;
  std::string *v3;
  __int128 v4;
  std::string *p_p;
  std::string::size_type size;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::logic_error *exception;
  std::string __p;
  std::string v13;
  std::string v14;
  std::string v15;
  std::string v16;
  std::string v17;

  std::to_string(&v13, a1);
  v1 = std::string::insert(&v13, 0, "SmallVector unable to grow. Requested capacity (");
  v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  v3 = std::string::append(&v14, ") is larger than maximum value for size type (");
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v15.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v15.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, 0xFFFFFFFFuLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v7 = std::string::append(&v15, (const std::string::value_type *)p_p, size);
  v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  v9 = std::string::append(&v16, ")");
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_9:
      if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v15.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_10:
    if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_17;
  }
LABEL_16:
  operator delete(v15.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v14.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_11:
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_17:
  operator delete(v14.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_13:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v17);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
    __cxa_throw(exception, (struct type_info *)off_24DDB6CA8, MEMORY[0x24BEDAAF0]);
  }
LABEL_12:
  operator delete(v13.__r_.__value_.__l.__data_);
  goto LABEL_13;
}

void sub_21AB94E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 25) < 0)
  {
    operator delete(*(void **)(v33 - 48));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21AB94EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    JUMPOUT(0x21AB94EC8);
  JUMPOUT(0x21AB94E88);
}

void sub_21AB94EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    JUMPOUT(0x21AB94EE8);
  JUMPOUT(0x21AB94E90);
}

void sub_21AB94EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    JUMPOUT(0x21AB94F08);
  JUMPOUT(0x21AB94E98);
}

void sub_21AB94F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    JUMPOUT(0x21AB94F28);
  JUMPOUT(0x21AB94EA0);
}

void sub_21AB94F38(unint64_t a1)
{
  std::string *v1;
  __int128 v2;
  std::logic_error *exception;
  std::string v4;
  std::string v5;

  std::to_string(&v4, a1);
  v1 = std::string::insert(&v4, 0, "SmallVector capacity unable to grow. Already at maximum size ");
  v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  __cxa_throw(exception, (struct type_info *)off_24DDB6CA8, MEMORY[0x24BEDAAF0]);
}

void sub_21AB94FCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if ((a18 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21AB95004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x21AB94FD8);
}

uint64_t sub_21AB95020(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  __int128 v7;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  v5 = a1[1];
  if (v5 <= a4)
    return -1;
  while (((*(_QWORD *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(_BYTE *)(*a1 + a4)) & 1) != 0)
  {
    if (v5 == ++a4)
      return -1;
  }
  return a4;
}

uint64_t sub_21AB950A0(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v10;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a1[1] >= a4)
    v5 = a4;
  else
    v5 = a1[1];
  while (v5)
  {
    v6 = v5 - 1;
    v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    v8 = *(_QWORD *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    v5 = v6;
    if ((v8 & 1) == 0)
      return v6;
  }
  return -1;
}

uint64_t sub_21AB95130(unsigned __int8 **a1, unsigned int a2, unint64_t *a3)
{
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;

  if (a2)
  {
    v5 = a1[1];
    if (!v5)
      return 1;
  }
  else
  {
    a2 = sub_21AB9523C((uint64_t)a1);
    v5 = a1[1];
    if (!v5)
      return 1;
  }
  v6 = 0;
  v7 = *a1;
  *a3 = 0;
  v8 = v5;
  do
  {
    if ((char)*v7 < 48)
      break;
    v9 = *v7;
    if (v9 >= 0x3A)
    {
      if (v9 < 0x61)
      {
        if (v9 - 65 > 0x19)
          break;
        v10 = v9 - 55;
        if (v10 >= a2)
          break;
      }
      else
      {
        if (v9 >= 0x7B)
          break;
        v10 = v9 - 87;
        if (v10 >= a2)
          break;
      }
    }
    else
    {
      v10 = v9 - 48;
      if (v10 >= a2)
        break;
    }
    v11 = v6 * a2 + v10;
    *a3 = v11;
    if (v11 / a2 < v6)
      return 1;
    ++v7;
    v6 = v11;
    --v8;
  }
  while (v8);
  if (v5 == v8)
    return 1;
  result = 0;
  *a1 = v7;
  a1[1] = v8;
  return result;
}

uint64_t sub_21AB9523C(uint64_t a1)
{
  unint64_t v1;
  _BYTE *v3;
  _BYTE *v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 < 2)
    return 10;
  v3 = *(_BYTE **)a1;
  if (**(_WORD **)a1 == 30768 || *(_WORD *)v3 == 22576)
  {
    *(_QWORD *)a1 = v3 + 2;
    *(_QWORD *)(a1 + 8) = v1 - 2;
    return 16;
  }
  else if (*(_WORD *)v3 == 25136 || *(_WORD *)v3 == 16944)
  {
    *(_QWORD *)a1 = v3 + 2;
    *(_QWORD *)(a1 + 8) = v1 - 2;
    return 2;
  }
  else if (*(_WORD *)v3 == 28464)
  {
    *(_QWORD *)a1 = v3 + 2;
    *(_QWORD *)(a1 + 8) = v1 - 2;
    return 8;
  }
  else
  {
    if (*v3 != 48)
      return 10;
    v5 = v3[1];
    v4 = v3 + 1;
    if ((v5 - 48) > 9)
      return 10;
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v1 - 1;
    return 8;
  }
}

uint64_t sub_21AB95340()
{
  return 1;
}

void sub_21AB95348(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  __int128 v6;
  int v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  __int128 v14;
  _QWORD v15[33];

  v2 = a1;
  v15[32] = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 == 6)
  {
    if (*(_BYTE *)(a1 + 33) == 1)
    {
      sub_21AB955D0(*(_QWORD *)a1, a2);
      return;
    }
    goto LABEL_8;
  }
  if (v4 != 4)
  {
    v7 = *(unsigned __int8 *)(a1 + 33);
    v13 = v15;
    v14 = xmmword_21AB99500;
    if (v7 == 1)
    {
      switch(v4)
      {
        case 1:
          goto LABEL_20;
        case 3:
          v2 = *(_QWORD *)a1;
          if (!*(_QWORD *)a1)
            goto LABEL_20;
          v8 = strlen((const char *)v2);
          goto LABEL_16;
        case 4:
          v2 = *(_QWORD *)a1;
          if (*(char *)(*(_QWORD *)a1 + 23) < 0)
            goto LABEL_14;
          v8 = *(unsigned __int8 *)(*(_QWORD *)a1 + 23);
          if (v8 >= 0x17)
            goto LABEL_25;
          goto LABEL_18;
        case 5:
          goto LABEL_14;
        default:
          break;
      }
    }
LABEL_13:
    sub_21AB95698(a1, (uint64_t)&v13);
    v2 = (uint64_t)&v13;
LABEL_14:
    if (!*(_QWORD *)v2)
    {
LABEL_20:
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
      v9 = v13;
      if (v13 == v15)
        return;
LABEL_30:
      free(v9);
      return;
    }
    v8 = *(_QWORD *)(v2 + 8);
    v2 = *(_QWORD *)v2;
LABEL_16:
    if (v8 >= 0x7FFFFFFFFFFFFFF8)
      sub_21AB84068();
    if (v8 >= 0x17)
    {
LABEL_25:
      v10 = (v8 & 0x7FFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v10 = v8 | 7;
      v11 = v10 + 1;
      v12 = operator new(v10 + 1);
      a2[1] = v8;
      a2[2] = v11 | 0x8000000000000000;
      *a2 = v12;
      a2 = v12;
    }
    else
    {
LABEL_18:
      *((_BYTE *)a2 + 23) = v8;
      if (!v8)
      {
LABEL_29:
        *((_BYTE *)a2 + v8) = 0;
        v9 = v13;
        if (v13 == v15)
          return;
        goto LABEL_30;
      }
    }
    memmove(a2, (const void *)v2, v8);
    goto LABEL_29;
  }
  if (*(_BYTE *)(a1 + 33) != 1)
  {
LABEL_8:
    v13 = v15;
    v14 = xmmword_21AB99500;
    goto LABEL_13;
  }
  v5 = *(_QWORD *)a1;
  if (*(char *)(*(_QWORD *)a1 + 23) < 0)
  {
    sub_21AB83FDC(a2, *(void **)v5, *(_QWORD *)(v5 + 8));
  }
  else
  {
    v6 = *(_OWORD *)v5;
    a2[2] = *(_QWORD *)(v5 + 16);
    *(_OWORD *)a2 = v6;
  }
}

void sub_21AB955B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  void *v9;

  if (a9 != v9)
    free(a9);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB955D0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v5 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 1;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  v4 = &unk_24DDB7C98;
  v12 = a2;
  sub_21AB95BE4((uint64_t)&v4, 0, 0, 0);
  sub_21AB961C0((uint64_t)&v4, a1);
  if (v8 != v6)
    sub_21AB95E64(&v4);
  return sub_21AB95A78((uint64_t)&v4);
}

void sub_21AB95670(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  sub_21AB95A78((uint64_t)va);
  if (*(char *)(v2 + 23) < 0)
    operator delete(*(void **)v2);
  _Unwind_Resume(a1);
}

uint64_t sub_21AB95698(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t (**v6)();
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v7 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 1;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  v6 = &off_24DDB7D28;
  v14 = a2;
  v3 = (void *)sub_21AB95BE4((uint64_t)&v6, 0, 0, 0);
  v4 = sub_21AB95864(v3, (uint64_t)&v6, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 32));
  sub_21AB95864(v4, (uint64_t)&v6, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 33));
  return sub_21AB95A78((uint64_t)&v6);
}

void sub_21AB95728(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB95A78((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21AB9573C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_21AB95A78((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_21AB95750(unsigned __int8 *a1, uint64_t a2)
{
  void *v4;

  v4 = sub_21AB95864(a1, a2, *(_QWORD *)a1, *((_QWORD *)a1 + 1), a1[32]);
  return sub_21AB95864(v4, a2, *((_QWORD *)a1 + 2), *((_QWORD *)a1 + 3), a1[33]);
}

_QWORD *sub_21AB95788(unsigned __int8 *a1, uint64_t a2)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;

  v2 = (_QWORD *)a2;
  if (a1[33] != 1)
    goto LABEL_7;
  v3 = a1[32];
  if (v3 < 2)
    goto LABEL_7;
  if (v3 == 4)
  {
    v2 = *(_QWORD **)a1;
    if ((*(char *)(*(_QWORD *)a1 + 23) & 0x80000000) == 0)
      return *(_QWORD **)a1;
    return (_QWORD *)*v2;
  }
  if (v3 != 3)
  {
LABEL_7:
    sub_21AB95698((uint64_t)a1, a2);
    v6 = v2[1];
    if ((unint64_t)(v6 + 1) > v2[2])
    {
      sub_21AB94BC0((uint64_t)v2, v2 + 3, v6 + 1, 1);
      v6 = v2[1];
    }
    *(_BYTE *)(*v2 + v6) = 0;
    return (_QWORD *)*v2;
  }
  v4 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
    return 0;
  strlen(*(const char **)a1);
  return (_QWORD *)v4;
}

void *sub_21AB95864(void *result, uint64_t a2, uint64_t a3, size_t a4, unsigned __int8 a5)
{
  int v8;
  unsigned __int8 v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  size_t v13;
  _BYTE *v14;

  v8 = a5;
  if (a5 == 2)
  {
    do
    {
      result = (void *)sub_21AB95864(result, a2, *(_QWORD *)a3, *(_QWORD *)(a3 + 8), *(unsigned __int8 *)(a3 + 32));
      v9 = *(_BYTE *)(a3 + 33);
      v10 = a3 + 16;
      a3 = *(_QWORD *)(a3 + 16);
      a4 = *(_QWORD *)(v10 + 8);
      v8 = v9;
    }
    while (v9 == 2);
  }
  switch(v8)
  {
    case 3:
      if (a3)
      {
        a4 = strlen((const char *)a3);
        result = *(void **)(a2 + 32);
        if (a4 > *(_QWORD *)(a2 + 24) - (_QWORD)result)
          goto LABEL_16;
        goto LABEL_6;
      }
      break;
    case 4:
      v11 = *(char *)(a3 + 23);
      if (v11 >= 0)
        v12 = (_BYTE *)a3;
      else
        v12 = *(_BYTE **)a3;
      if (v11 >= 0)
        v13 = *(unsigned __int8 *)(a3 + 23);
      else
        v13 = *(_QWORD *)(a3 + 8);
      result = (void *)sub_21AB95F84(a2, v12, v13);
      break;
    case 5:
      result = *(void **)(a2 + 32);
      if (a4 <= *(_QWORD *)(a2 + 24) - (_QWORD)result)
      {
LABEL_6:
        if (a4)
        {
          result = memcpy(result, (const void *)a3, a4);
          *(_QWORD *)(a2 + 32) += a4;
        }
      }
      else
      {
LABEL_16:
        result = (void *)sub_21AB95F84(a2, (_BYTE *)a3, a4);
      }
      break;
    case 6:
      result = (void *)sub_21AB961C0(a2, a3);
      break;
    case 7:
      v14 = *(_BYTE **)(a2 + 32);
      if ((unint64_t)v14 >= *(_QWORD *)(a2 + 24))
      {
        result = (void *)sub_21AB95ED8(a2, a3);
      }
      else
      {
        *(_QWORD *)(a2 + 32) = v14 + 1;
        *v14 = a3;
      }
      break;
    case 8:
      result = (void *)sub_21AB95C4C(a2, a3);
      break;
    case 9:
      result = (void *)sub_21AB95C78(a2, (int)a3);
      break;
    case 10:
    case 12:
      result = (void *)sub_21AB95C4C(a2, *(_QWORD *)a3);
      break;
    case 11:
    case 13:
      result = (void *)sub_21AB95C78(a2, *(_QWORD *)a3);
      break;
    case 14:
      result = (void *)sub_21AB95CA4(a2, *(_QWORD *)a3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21AB95A78(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      MEMORY[0x220752438](v2, 0x1000C8077774924);
  }
  return a1;
}

uint64_t sub_21AB95AD4()
{
  return 1024;
}

uint64_t sub_21AB95ADC(uint64_t *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = (*(uint64_t (**)(uint64_t *))(*a1 + 88))(a1);
  v4 = a1 + 2;
  v3 = a1[2];
  v5 = a1[4];
  if (result)
  {
    v6 = result;
    if (v5 != v3)
    {
      a1[4] = v3;
      sub_21AB95E78(a1, v3, v5 - v3);
    }
    result = operator new[]();
    v7 = result;
    if (*((_DWORD *)a1 + 14) == 1)
    {
      result = *v4;
      if (*v4)
        result = MEMORY[0x220752438](result, 0x1000C8077774924);
    }
    a1[2] = v7;
    a1[3] = v7 + v6;
    a1[4] = v7;
    *((_DWORD *)a1 + 14) = 1;
  }
  else
  {
    v8 = v5 - v3;
    if (v5 != v3)
    {
      a1[4] = v3;
      result = sub_21AB95E78(a1, v3, v8);
    }
    if (*((_DWORD *)a1 + 14) == 1)
    {
      result = *v4;
      if (*v4)
        result = MEMORY[0x220752438](result, 0x1000C8077774924, v8);
    }
    *((_DWORD *)a1 + 14) = 0;
    a1[3] = 0;
    a1[4] = 0;
    *v4 = 0;
  }
  return result;
}

uint64_t sub_21AB95BE4(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;

  v7 = result;
  if (*(_DWORD *)(result + 56) == 1)
  {
    result = *(_QWORD *)(result + 16);
    if (result)
      result = MEMORY[0x220752438](result, 0x1000C8077774924);
  }
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a2 + a3;
  *(_QWORD *)(v7 + 32) = a2;
  *(_DWORD *)(v7 + 56) = a4;
  return result;
}

uint64_t sub_21AB95C4C(uint64_t a1, unint64_t a2)
{
  sub_21AB9384C(a1, a2, 0, 0);
  return a1;
}

uint64_t sub_21AB95C78(uint64_t a1, unint64_t a2)
{
  sub_21AB93AAC(a1, a2, 0, 0);
  return a1;
}

uint64_t sub_21AB95CA4(uint64_t a1, unint64_t a2)
{
  sub_21AB93AC4(a1, a2, 1, 0, 0);
  return a1;
}

uint64_t sub_21AB95CD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  size_t v11;
  BOOL v12;
  void *v14;
  __int128 v15;
  _QWORD v16[17];

  v16[16] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32);
  if (v4 < 4)
  {
    v7 = 127;
  }
  else
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 8))(a2);
    if (v5 < v4)
      v6 = v5;
    else
      v6 = v5 + 1;
    if (v5 >= 0)
      v7 = v6;
    else
      v7 = (2 * v4);
    if (v4 >= v7)
    {
      *(_QWORD *)(a1 + 32) += v7;
      return a1;
    }
  }
  v14 = v16;
  v15 = xmmword_21AB99710;
  do
  {
    v8 = v15;
    if ((_QWORD)v15 != v7)
    {
      if ((unint64_t)v15 <= v7)
      {
        if (*((_QWORD *)&v15 + 1) < v7)
        {
          sub_21AB94BC0((uint64_t)&v14, v16, v7, 1);
          v8 = v15;
        }
        if (v7 != v8)
          bzero((char *)v14 + v8, v7 - v8);
      }
      *(_QWORD *)&v15 = v7;
    }
    v9 = (*(uint64_t (**)(uint64_t, void *, unint64_t))(*(_QWORD *)a2 + 8))(a2, v14, v7);
    if (v9 < v7)
      v10 = v9;
    else
      v10 = v9 + 1;
    if (v9 >= 0)
      v11 = v10;
    else
      v11 = (2 * v7);
    v12 = v7 >= v11;
    v7 = v11;
  }
  while (!v12);
  sub_21AB95F84(a1, v14, v11);
  if (v14 != v16)
    free(v14);
  return a1;
}

void sub_21AB95E40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  void *v9;

  if (a9 != v9)
    free(a9);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB95E64(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[2];
  v2 = a1[4] - v1;
  a1[4] = v1;
  return sub_21AB95E78(a1, v1, v2);
}

uint64_t sub_21AB95E78(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a1[6];
  if (v6)
  {
    v7 = *(_QWORD *)(v6 + 16);
    if (*(_QWORD *)(v6 + 32) != v7)
    {
      *(_QWORD *)(v6 + 32) = v7;
      sub_21AB95E78();
    }
  }
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*a1 + 72))(a1, a2, a3);
}

uint64_t sub_21AB95ED8(uint64_t a1, char a2)
{
  _BYTE *v4;
  uint64_t v6;
  char v7;

  v4 = *(_BYTE **)(a1 + 32);
  if ((unint64_t)v4 >= *(_QWORD *)(a1 + 24))
  {
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 16);
      if (v6)
      {
        *(_QWORD *)(a1 + 32) = v6;
        sub_21AB95E78((_QWORD *)a1, v6, (uint64_t)&v4[-v6]);
        v4 = *(_BYTE **)(a1 + 32);
        goto LABEL_2;
      }
      if (!*(_DWORD *)(a1 + 56))
        break;
      sub_21AB95ADC((uint64_t *)a1);
      v4 = *(_BYTE **)(a1 + 32);
      if ((unint64_t)v4 < *(_QWORD *)(a1 + 24))
        goto LABEL_2;
    }
    v7 = a2;
    sub_21AB95E78((_QWORD *)a1, (uint64_t)&v7, 1);
    return a1;
  }
  else
  {
LABEL_2:
    *(_QWORD *)(a1 + 32) = v4 + 1;
    *v4 = a2;
    return a1;
  }
}

uint64_t sub_21AB95F84(uint64_t a1, _BYTE *a2, size_t __n)
{
  size_t v3;
  _BYTE *v6;
  uint64_t v7;
  size_t v8;
  size_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = __n;
  v7 = *(_QWORD *)(a1 + 24);
  v6 = *(_BYTE **)(a1 + 32);
  v8 = v7 - (_QWORD)v6;
  if (v7 - (uint64_t)v6 < __n)
  {
    while (1)
    {
      while (1)
      {
        v11 = *(_BYTE **)(a1 + 16);
        if (!v11)
          break;
        if (v6 == v11)
        {
          v8 *= v3 / v8;
          v3 -= v8;
          sub_21AB95E78((_QWORD *)a1, (uint64_t)a2, v8);
          v6 = *(_BYTE **)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 24) - (_QWORD)v6;
          if (v3 <= v10)
          {
            sub_21AB96120((void **)a1, &a2[v8], v3);
            return a1;
          }
        }
        else
        {
          sub_21AB96120((void **)a1, a2, v8);
          v12 = *(_QWORD *)(a1 + 16);
          v13 = *(_QWORD *)(a1 + 32) - v12;
          *(_QWORD *)(a1 + 32) = v12;
          sub_21AB95E78((_QWORD *)a1, v12, v13);
          v3 -= v8;
          v6 = *(_BYTE **)(a1 + 32);
          v10 = *(_QWORD *)(a1 + 24) - (_QWORD)v6;
        }
        a2 += v8;
        v8 = v10;
        if (v10 >= v3)
          goto LABEL_2;
      }
      if (!*(_DWORD *)(a1 + 56))
        break;
      sub_21AB95ADC((uint64_t *)a1);
      v6 = *(_BYTE **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 24) - (_QWORD)v6;
      if (v8 >= v3)
        goto LABEL_2;
    }
    sub_21AB95E78((_QWORD *)a1, (uint64_t)a2, v3);
    return a1;
  }
  else
  {
LABEL_2:
    switch(v3)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_6;
      case 2uLL:
        goto LABEL_5;
      case 3uLL:
        goto LABEL_4;
      case 4uLL:
        v6[3] = a2[3];
        v6 = *(_BYTE **)(a1 + 32);
LABEL_4:
        v6[2] = a2[2];
        v6 = *(_BYTE **)(a1 + 32);
LABEL_5:
        v6[1] = a2[1];
        v6 = *(_BYTE **)(a1 + 32);
LABEL_6:
        *v6 = *a2;
        break;
      default:
        memcpy(v6, a2, v3);
        break;
    }
    *(_QWORD *)(a1 + 32) += v3;
    return a1;
  }
}

void **sub_21AB96120(void **result, _BYTE *a2, size_t __n)
{
  void **v4;

  v4 = result;
  switch(__n)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      goto LABEL_3;
    case 4uLL:
      *((_BYTE *)result[4] + 3) = a2[3];
LABEL_3:
      *((_BYTE *)result[4] + 2) = a2[2];
LABEL_4:
      *((_BYTE *)result[4] + 1) = a2[1];
LABEL_5:
      *(_BYTE *)result[4] = *a2;
LABEL_6:
      result[4] = (char *)result[4] + __n;
      break;
    default:
      result = (void **)memcpy(result[4], a2, __n);
      v4[4] = (char *)v4[4] + __n;
      break;
  }
  return result;
}

uint64_t sub_21AB961C0(uint64_t a1, uint64_t a2)
{
  sub_21AB961EC(a2, a1);
  return a1;
}

void sub_21AB961EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  char *v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  _BYTE *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  void *v19;
  unsigned int v20;
  _QWORD v21[17];

  v21[16] = *MEMORY[0x24BDAC8D0];
  sub_21AB92858(*(char **)a1, *(_QWORD *)(a1 + 8), (uint64_t)&v19);
  v4 = v19;
  if (v20)
  {
    v5 = (char *)v19 + 32;
    v6 = (unint64_t)v20 << 6;
    do
    {
      v7 = *((_DWORD *)v5 - 8);
      if (v7)
      {
        if (v7 == 2 || (v8 = *((_QWORD *)v5 - 1), v8 >= *(_QWORD *)(a1 + 24)))
        {
          v12 = (_BYTE *)*((_QWORD *)v5 - 3);
          v13 = *((_QWORD *)v5 - 2);
          v14 = *(void **)(a2 + 32);
          if (v13 > *(_QWORD *)(a2 + 24) - (_QWORD)v14)
          {
            sub_21AB95F84(a2, v12, *((_QWORD *)v5 - 2));
          }
          else if (v13)
          {
            memcpy(v14, v12, *((_QWORD *)v5 - 2));
            *(_QWORD *)(a2 + 32) += v13;
          }
        }
        else
        {
          v9 = *((_DWORD *)v5 + 2);
          v10 = *(_QWORD *)v5;
          v11 = v5[12];
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v8);
          v16 = v9;
          v17 = v10;
          v18 = v11;
          sub_21AB96ED0(&v15, a2);
        }
      }
      v5 += 64;
      v6 -= 64;
    }
    while (v6);
    v4 = v19;
  }
  if (v4 != v21)
    free(v4);
}

void sub_21AB96334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  if (a14 == &a16)
    _Unwind_Resume(exception_object);
  free(a14);
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB96364(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      MEMORY[0x220752438](v2, 0x1000C8077774924);
  }
  return a1;
}

uint64_t sub_21AB963B8(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;

  if (*(_BYTE *)(a1 + 40)
    && (!sub_21AB949E0() || (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1)))
  {
    if (sub_21AB949E0())
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 16);
      if (v8 != v9)
      {
        *(_QWORD *)(a1 + 32) = v9;
        sub_21AB95E78((_QWORD *)a1, v9, v8 - v9);
      }
    }
    if (a2 == 8)
    {
      v10 = (char *)sub_21AB94A10();
      if (!v10)
        return a1;
      goto LABEL_11;
    }
    v10 = sub_21AB949E8(a2, a3, a4);
    if (v10)
    {
LABEL_11:
      v11 = strlen(v10);
      sub_21AB95F84(a1, v10, v11);
    }
  }
  return a1;
}

uint64_t sub_21AB96480(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  char *v5;
  size_t v6;

  if (*(_BYTE *)(a1 + 40)
    && (!sub_21AB949E0() || (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1)))
  {
    if (sub_21AB949E0())
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 16);
      if (v2 != v3)
      {
        *(_QWORD *)(a1 + 32) = v3;
        sub_21AB95E78((_QWORD *)a1, v3, v2 - v3);
      }
    }
    v4 = sub_21AB94A28();
    if (v4)
    {
      v5 = (char *)v4;
      v6 = strlen(v4);
      sub_21AB95F84(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_21AB96508(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  char *v5;
  size_t v6;

  if (*(_BYTE *)(a1 + 40)
    && (!sub_21AB949E0() || (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1)))
  {
    if (sub_21AB949E0())
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 16);
      if (v2 != v3)
      {
        *(_QWORD *)(a1 + 32) = v3;
        sub_21AB95E78((_QWORD *)a1, v3, v2 - v3);
      }
    }
    v4 = sub_21AB94A1C();
    if (v4)
    {
      v5 = (char *)v4;
      v6 = strlen(v4);
      sub_21AB95F84(a1, v5, v6);
    }
  }
  return a1;
}

uint64_t sub_21AB96598(uint64_t a1, int a2, char a3, int a4, int a5)
{
  int v6;
  off_t v7;
  int v8;
  off_t v9;
  _BYTE v11[44];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  *(_DWORD *)(a1 + 8) = a5;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &off_24DDB7BF0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 56) = a4 ^ 1;
  *(_DWORD *)(a1 + 60) = a2;
  *(_BYTE *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 65) = 0;
  *(_QWORD *)(a1 + 80) = std::system_category();
  *(_QWORD *)(a1 + 88) = 0;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) != 0)
  {
    *(_BYTE *)(a1 + 64) = 0;
    return a1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 64))(a1, 1);
    v6 = *(_DWORD *)(a1 + 60);
    if (v6 <= 2)
      *(_BYTE *)(a1 + 64) = 0;
    v7 = lseek(v6, 0, 1);
    memset(v11, 0, sizeof(v11));
    v12 = 0xFFFFLL;
    v13 = 0;
    v14 = 0;
    v8 = sub_21AB94174(*(_DWORD *)(a1 + 60), (uint64_t)v11);
    *(_BYTE *)(a1 + 66) = *(_DWORD *)&v11[40] == 2;
    *(_BYTE *)(a1 + 65) = v8 == 0 && v7 != -1;
    if (v8 == 0 && v7 != -1)
      v9 = v7;
    else
      v9 = 0;
    *(_QWORD *)(a1 + 88) = v9;
    return a1;
  }
}

void sub_21AB966B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)v1 = off_24DDB7B78;
  if (*(_DWORD *)(v1 + 56) == 1)
  {
    if (*v2)
      MEMORY[0x220752438](*v2, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AB96700(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::error_code v8;
  std::string v9;
  std::string *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _BYTE v14[40];

  *(_QWORD *)a1 = &off_24DDB7BF0;
  if ((*(_DWORD *)(a1 + 60) & 0x80000000) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 16);
    if (v2 != v3)
    {
      *(_QWORD *)(a1 + 32) = v3;
      sub_21AB95E78((_QWORD *)a1, v3, v2 - v3);
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v4 = sub_21AB9464C(*(_DWORD *)(a1 + 60));
      if ((_DWORD)v4)
      {
        *(_QWORD *)(a1 + 72) = v4;
        *(_QWORD *)(a1 + 80) = v5;
      }
    }
  }
  if (*(_DWORD *)(a1 + 72))
  {
    v12 = "IO failure on output stream: ";
    v13 = 259;
    v8 = *(std::error_code *)(a1 + 72);
    std::error_code::message(&v9, &v8);
    v11 = 260;
    v10 = &v9;
    sub_21AB96808((uint64_t *)&v12, (uint64_t *)&v10, (uint64_t)v14);
    sub_21AB914EC();
  }
  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v6 = *(_QWORD *)(a1 + 16);
    if (v6)
      MEMORY[0x220752438](v6, 0x1000C8077774924);
  }
  return a1;
}

uint64_t *sub_21AB96808@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  __int128 v5;
  __int128 v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  v3 = *((unsigned __int8 *)result + 32);
  if (*((_BYTE *)result + 32) && (v4 = *((unsigned __int8 *)a2 + 32), *((_BYTE *)a2 + 32)))
  {
    if (v3 == 1)
    {
      v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a3 = *(_OWORD *)a2;
      *(_OWORD *)(a3 + 16) = v5;
      *(_QWORD *)(a3 + 32) = a2[4];
    }
    else if (v4 == 1)
    {
      v6 = *((_OWORD *)result + 1);
      *(_OWORD *)a3 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = v6;
      *(_QWORD *)(a3 + 32) = result[4];
    }
    else
    {
      v7 = (uint64_t *)*result;
      v8 = result[1];
      if (*((_BYTE *)result + 33) != 1)
      {
        LOBYTE(v3) = 2;
        v7 = result;
      }
      v9 = a2[1];
      if (*((_BYTE *)a2 + 33) == 1)
      {
        v10 = (uint64_t *)*a2;
      }
      else
      {
        LOBYTE(v4) = 2;
        v10 = a2;
      }
      *(_QWORD *)a3 = v7;
      *(_QWORD *)(a3 + 8) = v8;
      *(_QWORD *)(a3 + 16) = v10;
      *(_QWORD *)(a3 + 24) = v9;
      *(_BYTE *)(a3 + 32) = v3;
      *(_BYTE *)(a3 + 33) = v4;
    }
  }
  else
  {
    *(_WORD *)(a3 + 32) = 256;
  }
  return result;
}

void sub_21AB968A0(uint64_t a1)
{
  sub_21AB96700(a1);
  JUMPOUT(0x220752450);
}

uint64_t sub_21AB968C4(uint64_t a1, char *__buf, unint64_t a3)
{
  unint64_t v3;
  size_t v6;
  uint64_t result;
  uint64_t v8;

  v3 = a3;
  *(_QWORD *)(a1 + 88) += a3;
  while (1)
  {
    v6 = v3 >= 0x7FFFFFFF ? 0x7FFFFFFFLL : v3;
    result = write(*(_DWORD *)(a1 + 60), __buf, v6);
    if (result < 0)
      break;
    __buf += result;
    v3 -= result;
LABEL_3:
    if (!v3)
      return result;
  }
  result = (uint64_t)__error();
  if (*(_DWORD *)result == 4)
    goto LABEL_3;
  result = (uint64_t)__error();
  if (*(_DWORD *)result == 35)
    goto LABEL_3;
  result = (uint64_t)__error();
  if (*(_DWORD *)result == 35)
    goto LABEL_3;
  v8 = *__error();
  result = (uint64_t)std::generic_category();
  *(_QWORD *)(a1 + 72) = v8;
  *(_QWORD *)(a1 + 80) = result;
  return result;
}

off_t sub_21AB96968(int *a1, _BYTE *a2, size_t a3, off_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  off_t v12;
  off_t v13;
  uint64_t v14;
  const std::error_category *v15;
  uint64_t v16;
  uint64_t v17;
  off_t result;
  uint64_t v19;

  v8 = (*(uint64_t (**)(int *))(*(_QWORD *)a1 + 80))(a1);
  v9 = *((_QWORD *)a1 + 4);
  v10 = *((_QWORD *)a1 + 2);
  v11 = v8 + v9;
  if (v9 != v10)
  {
    *((_QWORD *)a1 + 4) = v10;
    sub_21AB95E78(a1, v10, v9 - v10);
  }
  v12 = v11 - v10;
  v13 = lseek(a1[15], a4, 0);
  *((_QWORD *)a1 + 11) = v13;
  if (v13 == -1)
  {
    v14 = *__error();
    v15 = std::generic_category();
    *((_QWORD *)a1 + 9) = v14;
    *((_QWORD *)a1 + 10) = v15;
  }
  sub_21AB95F84((uint64_t)a1, a2, a3);
  v16 = *((_QWORD *)a1 + 4);
  v17 = *((_QWORD *)a1 + 2);
  if (v16 != v17)
  {
    *((_QWORD *)a1 + 4) = v17;
    sub_21AB95E78(a1, v17, v16 - v17);
  }
  result = lseek(a1[15], v12, 0);
  *((_QWORD *)a1 + 11) = result;
  if (result == -1)
  {
    v19 = *__error();
    result = (off_t)std::generic_category();
    *((_QWORD *)a1 + 9) = v19;
    *((_QWORD *)a1 + 10) = result;
  }
  return result;
}

uint64_t sub_21AB96A6C(int *a1)
{
  stat v3;

  if (fstat(a1[15], &v3))
    return 0;
  if ((v3.st_mode & 0xF000) == 0x2000 && ((*(uint64_t (**)(int *))(*(_QWORD *)a1 + 48))(a1) & 1) != 0)
    return 0;
  return v3.st_blksize;
}

BOOL sub_21AB96AF0(uint64_t a1)
{
  return sub_21AB946DC(*(_DWORD *)(a1 + 60));
}

BOOL sub_21AB96AF8(uint64_t a1)
{
  _BOOL8 result;

  if (*(_BYTE *)(a1 + 68))
    return *(_BYTE *)(a1 + 67) != 0;
  result = sub_21AB9489C(*(_DWORD *)(a1 + 60));
  if (!*(_BYTE *)(a1 + 68))
    *(_BYTE *)(a1 + 68) = 1;
  *(_BYTE *)(a1 + 67) = result;
  return result;
}

void *sub_21AB96B64()
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)qword_255110060);
  if ((v0 & 1) != 0 || !__cxa_guard_acquire(qword_255110060))
    return &unk_255110110;
  sub_21AB96598((uint64_t)&unk_255110110, 2, 0, 1, 0);
  __cxa_atexit((void (*)(void *))sub_21AB9689C, &unk_255110110, &dword_21AB76000);
  __cxa_guard_release(qword_255110060);
  return &unk_255110110;
}

void sub_21AB96BF8(_Unwind_Exception *a1)
{
  __cxa_guard_abort(qword_255110060);
  _Unwind_Resume(a1);
}

std::string *sub_21AB96C10(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 64), a2, a3);
}

uint64_t sub_21AB96C18(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
}

_QWORD *sub_21AB96C24(_QWORD *result, void *__src, size_t __n)
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;

  v5 = (_QWORD *)result[8];
  v6 = v5[1];
  v7 = v6 + __n;
  if (v5[2] < v7)
  {
    result = sub_21AB94BC0(result[8], v5 + 3, v7, 1);
    v6 = v5[1];
  }
  if (__n)
  {
    result = memcpy((void *)(*v5 + v6), __src, __n);
    v6 = v5[1];
  }
  v5[1] = v6 + __n;
  return result;
}

void *sub_21AB96C98(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  return memcpy((void *)(**(_QWORD **)(a1 + 64) + a4), a2, a3);
}

uint64_t sub_21AB96CB0()
{
  return 0;
}

uint64_t sub_21AB96CB8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
}

uint64_t sub_21AB96CC4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

uint64_t sub_21AB96CCC(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      MEMORY[0x220752438](v2, 0x1000C8077774924);
  }
  return a1;
}

void sub_21AB96D20(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v1 = *(_QWORD *)(a1 + 16);
    if (v1)
      MEMORY[0x220752438](v1, 0x1000C8077774924);
  }
  JUMPOUT(0x220752450);
}

void sub_21AB96D84(_QWORD *a1, uint64_t a2)
{
  std::string *v2;
  std::string::size_type v3;

  v2 = (std::string *)a1[8];
  v3 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) + a2 + a1[4] - a1[2];
  std::string::reserve(v2, v3);
}

uint64_t sub_21AB96DD4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 64);
  if (*(char *)(v1 + 23) < 0)
    return *(_QWORD *)(v1 + 8);
  else
    return *(unsigned __int8 *)(v1 + 23);
}

void sub_21AB96DF0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = off_24DDB7B78;
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    v1 = *(_QWORD *)(a1 + 16);
    if (v1)
      MEMORY[0x220752438](v1, 0x1000C8077774924);
  }
  JUMPOUT(0x220752450);
}

void *sub_21AB96E54(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *result;
  unint64_t v6;

  v4 = a1[8];
  result = (void *)(*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
  v6 = (unint64_t)result + a2 + a1[4] - a1[2];
  if (*(_QWORD *)(v4 + 16) < v6)
    return sub_21AB94BC0(v4, (void *)(v4 + 24), v6, 1);
  return result;
}

uint64_t sub_21AB96EC8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

void sub_21AB96ED0(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  size_t v5;
  size_t v6;
  int v7;
  size_t v8;
  int v9;
  char v10;
  _BYTE *v11;
  uint64_t v12;
  int v13;
  char v14;
  _BYTE *v15;
  uint64_t v16;
  int v17;
  char v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  int i;
  char v23;
  _BYTE *v24;
  uint64_t v25;
  void (**v26)();
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  int v33;
  void **v34;
  char v35;
  void *v36;
  size_t __n[2];
  _QWORD v38[9];

  v38[8] = *MEMORY[0x24BDAC8D0];
  if (!a1[2])
  {
    (*(void (**)(void))(*(_QWORD *)*a1 + 24))();
    return;
  }
  v36 = v38;
  *(_OWORD *)__n = xmmword_21AB998B0;
  v27 = 0;
  v31 = 0;
  v32 = 0;
  v26 = (void (**)())&off_24DDB7D28;
  v34 = &v36;
  v33 = 0;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  (*(void (**)(_QWORD, void (***)()))(*(_QWORD *)*a1 + 24))(*a1, &v26);
  v4 = a1[2];
  v5 = __n[0];
  v6 = v4 - __n[0];
  if (v4 > __n[0])
  {
    v7 = *((_DWORD *)a1 + 2);
    if (!v7)
    {
      sub_21AB95F84(a2, v36, __n[0]);
      if ((_DWORD)v6)
      {
        v13 = 0;
        do
        {
          v14 = *((_BYTE *)a1 + 24);
          while (1)
          {
            v15 = *(_BYTE **)(a2 + 32);
            if ((unint64_t)v15 < *(_QWORD *)(a2 + 24))
              goto LABEL_27;
            v16 = *(_QWORD *)(a2 + 16);
            if (v16)
            {
              *(_QWORD *)(a2 + 32) = v16;
              sub_21AB95E78((_QWORD *)a2, v16, (uint64_t)&v15[-v16]);
              v15 = *(_BYTE **)(a2 + 32);
LABEL_27:
              *(_QWORD *)(a2 + 32) = v15 + 1;
              *v15 = v14;
              goto LABEL_28;
            }
            if (!*(_DWORD *)(a2 + 56))
              break;
            sub_21AB95ADC((uint64_t *)a2);
          }
          v35 = v14;
          sub_21AB95E78((_QWORD *)a2, (uint64_t)&v35, 1);
LABEL_28:
          ++v13;
        }
        while (v13 != (_DWORD)v6);
      }
      goto LABEL_56;
    }
    if (v7 == 1)
    {
      v8 = v6 >> 1;
      if ((v6 >> 1))
      {
        v9 = 0;
        do
        {
          v10 = *((_BYTE *)a1 + 24);
          while (1)
          {
            v11 = *(_BYTE **)(a2 + 32);
            if ((unint64_t)v11 < *(_QWORD *)(a2 + 24))
              goto LABEL_13;
            v12 = *(_QWORD *)(a2 + 16);
            if (v12)
            {
              *(_QWORD *)(a2 + 32) = v12;
              sub_21AB95E78((_QWORD *)a2, v12, (uint64_t)&v11[-v12]);
              v11 = *(_BYTE **)(a2 + 32);
LABEL_13:
              *(_QWORD *)(a2 + 32) = v11 + 1;
              *v11 = v10;
              goto LABEL_14;
            }
            if (!*(_DWORD *)(a2 + 56))
              break;
            sub_21AB95ADC((uint64_t *)a2);
          }
          v35 = v10;
          sub_21AB95E78((_QWORD *)a2, (uint64_t)&v35, 1);
LABEL_14:
          ++v9;
        }
        while (v9 != (_DWORD)v8);
        v5 = __n[0];
      }
      sub_21AB95F84(a2, v36, v5);
      v21 = v6 - v8;
      if (v21)
      {
        for (i = 0; i != v21; ++i)
        {
          v23 = *((_BYTE *)a1 + 24);
          while (1)
          {
            v24 = *(_BYTE **)(a2 + 32);
            if ((unint64_t)v24 < *(_QWORD *)(a2 + 24))
              goto LABEL_51;
            v25 = *(_QWORD *)(a2 + 16);
            if (v25)
            {
              *(_QWORD *)(a2 + 32) = v25;
              sub_21AB95E78((_QWORD *)a2, v25, (uint64_t)&v24[-v25]);
              v24 = *(_BYTE **)(a2 + 32);
LABEL_51:
              *(_QWORD *)(a2 + 32) = v24 + 1;
              *v24 = v23;
              goto LABEL_52;
            }
            if (!*(_DWORD *)(a2 + 56))
              break;
            sub_21AB95ADC((uint64_t *)a2);
          }
          v35 = v23;
          sub_21AB95E78((_QWORD *)a2, (uint64_t)&v35, 1);
LABEL_52:
          ;
        }
      }
      goto LABEL_56;
    }
    if ((_DWORD)v6)
    {
      v17 = 0;
      do
      {
        v18 = *((_BYTE *)a1 + 24);
        while (1)
        {
          v19 = *(_BYTE **)(a2 + 32);
          if ((unint64_t)v19 < *(_QWORD *)(a2 + 24))
            goto LABEL_39;
          v20 = *(_QWORD *)(a2 + 16);
          if (v20)
          {
            *(_QWORD *)(a2 + 32) = v20;
            sub_21AB95E78((_QWORD *)a2, v20, (uint64_t)&v19[-v20]);
            v19 = *(_BYTE **)(a2 + 32);
LABEL_39:
            *(_QWORD *)(a2 + 32) = v19 + 1;
            *v19 = v18;
            goto LABEL_40;
          }
          if (!*(_DWORD *)(a2 + 56))
            break;
          sub_21AB95ADC((uint64_t *)a2);
        }
        v35 = v18;
        sub_21AB95E78((_QWORD *)a2, (uint64_t)&v35, 1);
LABEL_40:
        ++v17;
      }
      while (v17 != (_DWORD)v6);
      v5 = __n[0];
    }
  }
  sub_21AB95F84(a2, v36, v5);
LABEL_56:
  v26 = off_24DDB7B78;
  if (v33 == 1 && v28)
    MEMORY[0x220752438](v28, 0x1000C8077774924);
  if (v36 != v38)
    free(v36);
}

void sub_21AB97274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;

  if (a16 == 1 && a11)
    MEMORY[0x220752438](a11, 0x1000C8077774924);
  if (a19 != v19)
    free(a19);
  _Unwind_Resume(exception_object);
}

void sub_21AB972EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB7FF2C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAProgramLoader: operation buffer contains unexpected number of total items: %d", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB7FF64();
  sub_21AB7FF4C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB973C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB7FF3C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAProgramLoader: operation buffer item size of config %d is different from expected size %zu", a5, a6, a7, a8, 0);
  sub_21AB7FF5C();
}

void sub_21AB97444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB7FF2C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAProgramLoader: action buffer contains unexpected number of buffer entries: %d", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB974B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB7FF64();
  sub_21AB7FF4C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB97520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB7FF80();
  sub_21AB7FF3C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAProgramLoader: operation buffer item size of config %d is different from expected size %zu", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB97588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB7FF64();
  sub_21AB7FF4C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAProgramLoader: operation buffer primitive ID %d is different from expected ID %u", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB975F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAProgramLoader: platform not detected", a5, a6, a7, a8, 0);
}

void sub_21AB97630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: Unable to access action/operation buffer", a5, a6, a7, a8, 0);
}

void sub_21AB97668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB86438();
  sub_21AB86428(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAServer: no value for key %s", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB976D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB86438();
  sub_21AB86428(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAServer: no IOSurface ID found for key %s", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB97738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: Unable to lock the CVPixelBuffer base address", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB9776C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB86438();
  sub_21AB86428(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAServer: unable to create CVPixelBufferRef from IOSurface for key %s", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB977D4(uint64_t a1, int a2, int a3)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109632;
  v3[1] = a2;
  v4 = 1024;
  v5 = a3;
  v6 = 2048;
  v7 = a1;
  _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: Error in ISP completion callback: status=%d, outputCount=%d, outputDescriptor=%p", (uint8_t *)v3, 0x18u);
  sub_21AB7FF5C();
}

void sub_21AB97864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: unable to create and prepare an ISP Processing Session", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: createDeviceAndSession called while ISP device exists", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB978CC(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: Invalid CVPixelBuffer", buf, 2u);
}

void sub_21AB9790C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: Invalid CVPixelBuffer", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: For cached requests I/O buffers should not be provided", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB86438();
  sub_21AB86428(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "VisionHWAServer: ELF file not on System Volume %s", v1, v2, v3, v4, v5);
  sub_21AB7FF5C();
}

void sub_21AB979DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: pid not exist!!", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB7FF2C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: error code %d", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: received release command but numClients is already zero!!", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: too many boot-args", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB7FF2C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: error while retrieving boot-args: %d", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97B50(void **a1)
{
  void *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    operator delete(v2);
}

void sub_21AB97B68(void **__p)
{
  void **v2;

  do
  {
    v2 = (void **)*__p;
    if (*((char *)__p + 63) < 0)
      operator delete(__p[5]);
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

void sub_21AB97BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: Timer thread not created", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "Error: XPC_ERROR_CONNECTION_INTERRUPTED", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "Error: XPC_ERROR_TERMINATION_IMMINENT", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "Error: XPC_ERROR_CONNECTION_INVALID", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer (mach service handler): Error: XPC_TYPE_ERROR", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer (mach service handler) Error: XPC object is not of type XPC_TYPE_CONNECTION", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "Connection did not have a valid PID -- rejecting message", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "VisionHWAServer: client map not empty!", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97D58(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: numClients is zero!!", buf, 2u);
}

uint64_t sub_21AB97D98(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result)
    return sub_21AB8DDBC(result);
  return result;
}

uint64_t sub_21AB97DB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  *a1 = 0;
  if (v6)
    sub_21AB8DDBC(v6);
  v7 = *a2;
  *a2 = 0;
  if (v7)
    sub_21AB8DDBC(v7);
  return MEMORY[0x220752450](a3, 0xA1C4030951706);
}

void sub_21AB97E10(_QWORD **a1, _QWORD *a2, void **a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      v9 = *--v5;
      v8 = v9;
      *v5 = 0;
      if (v9)
        sub_21AB8DDBC(v8);
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_21AB97E70(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
    return sub_21AB8DDBC(result);
  return result;
}

void sub_21AB97E94()
{
  uint64_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_21AB8F338();
  sub_21AB8F32C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "Unable to unregister the device notification callback. Status returned: %d", v1);
  sub_21AB7FF78();
}

void sub_21AB97F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "HxISPDevice: notification not handled", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "HxISPDevice status callback was not set up", a5, a6, a7, a8, 0);
  sub_21AB7FF78();
}

void sub_21AB97F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB8F338();
  sub_21AB8F31C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "HxISPDevice unable to create a device (error code 0x%08x)", v1, v2, v3, v4, v5);
  sub_21AB7FF78();
}

void sub_21AB97FD0(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_21AB8F32C(&dword_21AB76000, MEMORY[0x24BDACB70], (uint64_t)a3, "HxISPDevice createDevice() timed out -- %d retries remaining.", a1);
}

void sub_21AB98010()
{
  uint64_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_21AB8F338();
  sub_21AB8F32C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "Error: Failed to successfully invalidate session %d", v1);
  sub_21AB7FF78();
}

void sub_21AB9807C()
{
  uint64_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_21AB8F338();
  sub_21AB8F32C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "Failed to successfully complete outstanding requests %d", v1);
  sub_21AB7FF78();
}

void sub_21AB980E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB8F338();
  sub_21AB8F31C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "ISP driver reported error %d for processing buffer.", v1, v2, v3, v4, v5);
  sub_21AB7FF78();
}

void sub_21AB98150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB8F338();
  sub_21AB8F31C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "ISP driver reported error %d for processing buffer. Max number of retries reached.", v1, v2, v3, v4, v5);
  sub_21AB7FF78();
}

void sub_21AB981B8(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_21AB8F32C(&dword_21AB76000, MEMORY[0x24BDACB70], (uint64_t)a3, "ISP temporarily unavailable -- retrying. Driver reported code %d.", a1);
}

void sub_21AB981F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_21AB8F338();
  sub_21AB8F31C(&dword_21AB76000, MEMORY[0x24BDACB70], v0, "CompleteBuffers failed with error code %d", v1, v2, v3, v4, v5);
  sub_21AB7FF78();
}

void sub_21AB98260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "visionhwserverd [AppStateMonitor initWithPID] failed to create process monitor", a5, a6, a7, a8, 0);
}

void sub_21AB98298(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: [AppStateMonitor] error creating handle for identifier. Error: %@", (uint8_t *)&v1, 0xCu);
}

void sub_21AB98314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21AB8097C(&dword_21AB76000, MEMORY[0x24BDACB70], a3, "visionhwserverd [AppStateMonitor initWithPID] failed to create process predicate", a5, a6, a7, a8, 0);
}

void sub_21AB9834C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21AB76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "VisionHWAServer: [AppStateMonitor] callback was not set up", v0, 2u);
}

void sub_21AB98390(uint64_t a1, _BYTE *a2, uint64_t *a3)
{
  uint64_t v3;

  if ((*a2 & 1) != 0)
  {
    v3 = *a3;
    *a3 = 0;
    if (v3)
      sub_21AB8DDBC(v3);
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x24BDC0248]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return MEMORY[0x24BE10370]();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x24BEDA988](retstr, this);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC60](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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
  return MEMORY[0x24BEDAF48]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x24BEDB028](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB088](this);
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
  MEMORY[0x24BEDB090](this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x24BEDB0A0](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B8]();
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

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__canonical(std::__fs::filesystem::path *__return_ptr retstr, const std::__fs::filesystem::path *a2, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x24BEDB1E8](retstr, a2, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB618](retstr, __val);
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

uint64_t operator delete[]()
{
  return off_24DDB6CF8();
}

void operator delete(void *__p)
{
  off_24DDB6D00(__p);
}

uint64_t operator delete()
{
  return off_24DDB6D08();
}

uint64_t operator new[]()
{
  return off_24DDB6D10();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DDB6D18(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24DDB6D20(__sz, a2);
}

uint64_t operator new()
{
  return off_24DDB6D28();
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int del_curterm(TERMINAL *a1)
{
  return MEMORY[0x24BEDCA90](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int posix_madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAF5E8](a1, a2, *(_QWORD *)&a3);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x24BDAF9B8](*(_QWORD *)&a1, a2, a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

TERMINAL *__cdecl set_curterm(TERMINAL *a1)
{
  return (TERMINAL *)MEMORY[0x24BEDCAC0](a1);
}

int setupterm(char *a1, int a2, int *a3)
{
  return MEMORY[0x24BEDCAD0](a1, *(_QWORD *)&a2, a3);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int tigetnum(char *a1)
{
  return MEMORY[0x24BEDCB08](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

